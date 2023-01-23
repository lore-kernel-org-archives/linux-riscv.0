Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC76C38142
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6Fh/iBV0ozSxxauSkEy2B2Z0PUctlq1lVbWRwAluME=; b=KTTOhyChE60CZHiU2FmHgjeIqT
	XbKHGoUIJTiqSj4UC2HuAwNzQHKngxGLhRk027uf1lIudNAMGJYS6Xz0/hl9MgIZl3f/iBPvbkk3H
	8Z5PHjMfxt+sajDDLP7k6lkqjxjw3u7NrRfESjCdCINcjv2bdPm5obou0kBsha5RUcmcNyWxE2UPk
	GMNXT6mlRiN4KHZO9cKkgEGFmp0JMIn1azHxceEGuCMu0hFlYb2I6zuXZn/TZIHAmIpkKw3qdt+Bu
	CQeAEAVzOfAXQ+0gFiRqSvqddfpJ67jgmNqDQAL8Jqli0X68wXlXYuCVH8O7t8kj2lW8PCialnG/i
	829qY35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyyv-000HZm-Ns; Mon, 23 Jan 2023 15:43:37 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyYv-00077F-Td
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 15:16:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id q8so9266005wmo.5
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oXHlh1GVe6XHIGjfxqBlGpday517k1tv+6ix4arA+Zg=;
        b=mTElaErKpyr/9+bfvnELgYwdkqnRrQO/qiv+5Uq27OCgDaLZ8aaksxAjd9sARIF4ia
         /MKEh6h6m5FSzyCivP3eglyAgdt3BzjqP26wkFUqzy2+/dG/8NmUZ9FlogJnpdCcldb2
         acKe0v4SIDaiXlfpQSpvIWPAs+IMm42n+sNx5ilNe2CRyMLhb+Qf8XUxMGpucgpCVr/5
         0xYCWc18aYTj2u9uyVm24v9OmlUdvlO9ti00jk7Cxckx4+EiBdL7LzF4JhLmGJ/0jnTk
         phGT5/FRGPYaX0W8aQOgkpWZLLlyatLsvD9LaqDBhKUfBRUYuNa/ewbjRDB8VrtWU+Az
         k2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oXHlh1GVe6XHIGjfxqBlGpday517k1tv+6ix4arA+Zg=;
        b=AVPtX9Tpf0HPzxGosRiRqrIwGGNAJ0WmNMg00oaw/S8O4/h1mGx2YpE2p+YY09Blbv
         /TxlCfdn5/UmEeN3lPTe+Ex9+XInQCYNn/qKPuhq1pzibNv4hGcyDHTVft3DEYhY3ISv
         thwzGIoItabDx06i7Do52DY9+rDZFUbuaiss+cSV6GHWymjuK2NNHSh907wBD6SsC1v6
         wkdr/hMRZhR1dJUXVkR0T3g810pG9V/f4wMQ2DG6d3E0eXBbxa12kEGt31GCXuJqtEoO
         zOf4WTdlsUNIgjh1AzS3B/IMJqQXYmYnaQoLEmqdbwveMVF7Ck3JYtykvtiFZo+U+4yR
         h3Zw==
X-Gm-Message-State: AFqh2krIZx9wS7XlBaS9EG/mx722wFqRPUUqOfYPnar7xqR17mN911Ca
	8t5Djev5KE16ZQqWdfsdlJ7UoA==
X-Google-Smtp-Source: AMrXdXv4pjrlJCiDM72DBhh38Wa+y+wDQd0b3eQquuYXJF+qOVFv9nVUL1oHgw77dN4sbV8WLhp+iQ==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:674a:aefe with SMTP id ay29-20020a05600c1e1d00b003cf674aaefemr24094598wmb.22.1674487004649;
        Mon, 23 Jan 2023 07:16:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b3d5:343d:5dc9:ee00? ([2a01:e0a:982:cbb0:b3d5:343d:5dc9:ee00])
        by smtp.gmail.com with ESMTPSA id x15-20020a05600c188f00b003db122d5ac2sm10449596wmp.15.2023.01.23.07.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:16:43 -0800 (PST)
Message-ID: <767eb8e4-fba7-e25b-bcd3-3f05db9a6d80@linaro.org>
Date: Mon, 23 Jan 2023 16:16:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 01/13] dt-bindings: serial: amlogic,meson-uart: allow
 other serial properties
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Michal Simek
 <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>, Le Ray
 <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_071645_995042_F84C61A6 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 23/01/2023 16:12, Krzysztof Kozlowski wrote:
> Reference common serial properties bindings to allow typical serial
> properties:
> 
>    meson-axg-jethome-jethub-j100.dtb: serial@23000: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
