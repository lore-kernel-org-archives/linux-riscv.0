Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A38FC7619A
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 07:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Qw1gX6Wgvk+46i/C1rYfHWkKVd6msFPI4naBKxp76o=; b=j/I3US8zruhsF9
	FmsHveFxUalVr7haQtfzfzqhvPqWbUBGoyaMVQrOyABGw4ycmsn8CXc5+L/jIK395cHMBYC7ogtEs
	v92Tv05CPDbupHSeyxaykUNbGMFpruJiFSwn4y2DEdBJxNu6pXw4/s7uzXtjqGFDc+BpW6gPHTsPH
	tUCnd17d/XwAsle8sOaM9LvVLd/O5F6szC/PnP0WbTGnzZXKZDuQ5mLn/QdyEwMJCXsFwuS549JR4
	JLgv7Auux06Tf35OIrjLhlHcw98/mlgXTF66bufejlkMhIxHC4YAKYp1XD6t1LTrsOzmIrDPicWD1
	6Rdl5vhZECU3gMDyF2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFQX-0016fy-0D;
	Thu, 23 Mar 2023 07:32:01 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfFQU-0016fa-1o
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 07:31:59 +0000
Received: by mail-ed1-x52d.google.com with SMTP id b20so49671702edd.1
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 00:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679556716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekZUPnt2Vozh7f2sOzqBtvIcIMLGfykVhoLT/YHh2xE=;
        b=MxAap6yrlqQe+CS3DpDJfF5WuV4QamV9krsmqhN6cV++/4g87dcsgqDPv9l4+5jTSN
         fpREq+ql5ZTsrvXKij5+szUYFIjJ0KrLkBQo4LjQ1Xb8NggiUvcGJK175r4xihf79DWH
         T9KnIy/W0K7sT2bZN78BDTWH3LR1I9CbJ5kYRt9N0WwtKZTPt5K7HgBM2XmjXuODk0Fl
         eyZrEpQKsNQcqJg8O8ItsV46io0ofcKBAqE9mSXi9A/p5D9UQd6ntvzQtllz758dL0dv
         Np4e6EQf/FAiZDraFfnXffKia8k+jFmBUof/QJ6Bb3WX2KDSPFstWow9QJ3ylAscvjmg
         zAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679556716;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekZUPnt2Vozh7f2sOzqBtvIcIMLGfykVhoLT/YHh2xE=;
        b=SqtNbvxN0NfVbdZNPypw6aZ9NA6fxerODKO2pwnzjFpYRI0VYRSI10TkDZ3Xr5sGHT
         LQeHTQJ+D6cQvptAHJlHtZ+Eoo2EkbV0SHdbLSe2jyLQCU70BB96pnjdHWFoDSAfagMX
         1bDftZogPmyi6ml04XwD2kYY7r2Fmn6tsQSIinuUoeoZoMskjQtHX8z4QnfvhQ7a7D+k
         VZYRppoIU8njBb5jqrTeimx1Ile/yYezjmMc6VaRP+LJkZYVrts6YVRiWuMpWNOXkxZi
         4Vbxjp8FW/wv0E4RXv3qlJmws4+xUtWboaJknErnmcp7hAOjO7UZA6bzsamWOpqK1DZZ
         4d5A==
X-Gm-Message-State: AO0yUKW+hkdXTRZ7SuPXwkfD1h+kqjDahgMFCMg5RhUGZ/asysUpufya
	GEo57BxCLsLsYznqTMqXQ9Uqtw==
X-Google-Smtp-Source: AK7set+iWZt444eNKE55ycB9BgkADqbdT5/QwpCrCYcQJ7NbBWuq6iqdS3q/l5rzTRalH/MtURCskw==
X-Received: by 2002:a17:906:5cd:b0:8af:3b78:315d with SMTP id t13-20020a17090605cd00b008af3b78315dmr10894973ejt.23.1679556716702;
        Thu, 23 Mar 2023 00:31:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id gv27-20020a1709072bdb00b008b9b4ab6ad1sm8235164ejc.102.2023.03.23.00.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 00:31:56 -0700 (PDT)
Message-ID: <a767418b-1e2a-6d02-fc07-8caea8f877e2@linaro.org>
Date: Thu, 23 Mar 2023 08:31:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: mfd: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, patches@opensource.cirrus.com
References: <20230322173519.3971434-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322173519.3971434-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_003158_599102_7B85AF8C 
X-CRM114-Status: UNSURE (   7.98  )
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

On 22/03/2023 18:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
