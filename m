Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280B4C2BB41
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 07:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAMU3goE7mvGuYyCeyyWghqAo4pZM0/482R2GRyvtws=; b=NYOaC85QmGoMs7
	KDZdE19ox87OisQ9b+ufoUKUvqby3jWXC6YNcvqk2peAb+pdgOkXJzQoxHMhfsox+SsPPhBe5ijpM
	DGY6041EuzwFAYM9vVQvvJwqLOCOWenREQETHCicnCgmuvygJ/fzK8EQnaozYSmhu4D6dVBUxschz
	Pn3h4loZe0hpQ8JUHWM7fJtp+NEwco/zjxb+6BNEYY3YL+FxPIaecLMcr3Dj6HIuSh2l0O60Fr/HZ
	sJUPVsGEVZakcGRGSKPr/TZHXgSxZ3ZescbUa3caCVPIVOsOPjX/au/N6L/AxItDRkceomFpYblYG
	EQZD5AkdPwixEW0W8hAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrD6-00FX77-Rd; Tue, 16 Aug 2022 07:42:01 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrCv-00FWuh-KA
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 07:41:58 +0000
Received: by mail-lf1-x12c.google.com with SMTP id z25so13701939lfr.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 00:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Z4YfB/AJeb982Xz2QYWpjFSws7upX3bELQnOSH90aGQ=;
        b=XNiAZ2MhGZde1OxcLeMx6rt6sGhm0MIYRYttklKEzARCVhtOjGTS0I5VuPCcpOoZq4
         AazIXWhkMfjWgm8AzXKS5TOFgz5lSEPLZzZ/BEUT+8Lm5H80GyoGLmJs0BSb4GWCZgoS
         JCqkF8hGO/4+8FfYNJ9xcdWEeGg7O7tBBr24kUBYSb/BPEDblFxPKfK5Gw96lxzkFEzt
         ER3UACt0W0pzppQyL+RJMr5S6YAkykB6raCdrkeY6SWQR/Sers/mv4s67CwuCykj4Tzi
         Mvx2YvrL1HS2p5yB8blMpvmxW38bgtOdagu886tBN0axwkfs/RY5+yT77lu2oY8h6x/u
         AWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Z4YfB/AJeb982Xz2QYWpjFSws7upX3bELQnOSH90aGQ=;
        b=F95bBPPT4NrVVjIO9RSnFPAp6QrLz9tzPolf7Z0GDgVE2ckZVlkVx9ts1dLnTqCBbu
         SeeUiQZf7gwUEvdQgOIu4H8GPRvMDqg9NVqUKEeTEwvA6fp/QWduEkCgs4pGi1QGUWRq
         MIENrFW1lSma8gHKDZdCDANxy2zWRUWzK+ksxJlazhBefgi8IOAwrsM8s2EtNQ6Q4BMW
         mv5ITJZSlJhP2KvcBP4ZJte59YBrVW4akFgLh8TdMVUuhiqGyp69craruw3YNK8cJbNW
         nSpxo0Xw0ibAzI5EDdxEudhnMhYbdekG1A1mNzbb9AGYlb1h1Yj6aRjE61ZZPNssIIf7
         aF9A==
X-Gm-Message-State: ACgBeo0Vo/Kraw+HCR92cLWEUTNu3cu0XT8ZkRVZ+8oh1+GwY2gJJxrm
	9KZjeCv78lfJZCPZcg+jGbykUQ==
X-Google-Smtp-Source: AA6agR7yvXIG3FQUMlg6GW8tRa6cjzG0FZZbYwcSTqvWyjhEU2eExfEr5GNYE/fJJDjnTXq1o1QwNw==
X-Received: by 2002:a05:6512:6d3:b0:48a:e68c:15c9 with SMTP id u19-20020a05651206d300b0048ae68c15c9mr7099789lff.488.1660635706920;
        Tue, 16 Aug 2022 00:41:46 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id 15-20020a2eb94f000000b0025d53cbba2bsm1704014ljs.45.2022.08.16.00.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:41:46 -0700 (PDT)
Message-ID: <149eee7b-a9e9-94ad-1ab2-13812b541a8c@linaro.org>
Date: Tue, 16 Aug 2022 10:41:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 06/12] riscv: dts: allwinner: Add the D1 SoC base
 devicetree
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-7-samuel@sholland.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815050815.22340-7-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_004156_633070_0D8C4066 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 15/08/2022 08:08, Samuel Holland wrote:
> +
> +	de: display-engine {
> +		compatible = "allwinner,sun20i-d1-display-engine";
> +		allwinner,pipelines = <&mixer0>, <&mixer1>;
> +		status = "disabled";
> +	};
> +
> +	osc24M: osc24M-clk {

lowercase

> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;

This is a property of the board, not SoC.

> +		clock-output-names = "osc24M";
> +		#clock-cells = <0>;
> +	};
> +


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
