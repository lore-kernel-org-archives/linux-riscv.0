Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2650C7EE2F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 13:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLpcKQvZBfES+GjrM+Y5NUvHJkbCUDSx4ow+G42Dnaw=; b=TS2sjA3yX2iUyC
	0o3zAkLW5xO4WKu256QGZyK2bIS37Ya2sWQjvTEJ3JvKueYRllE74TF7ssD9JpSrpSTzylIumsw00
	5qalpPobDPaK9bcUTDky7NPndvLnUtQkijF6vMulDrUBetKbN9fv5k+gZ8zUWqKmwxY5f0vYHxIoc
	TUasMs9Mt1Na9BN20Z1hwqfO1oycwbg7Nku1cQvewZW3aF1VIGFb4W0j3l+RpSIMcJ0A8DplAHUAR
	cRVCBZHr0aqEM5kdpMDKOibbVyClcob6tXGDkTPCLdHkK16ueS30ZiWX8MG1PddzLMVco5YdNioEe
	jwVT3IcGpG70alTsCsMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zAw-00E0Ww-35;
	Tue, 30 May 2023 13:14:10 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3zAu-00E0Va-0f
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 13:14:09 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5147aee9d7cso6256393a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 May 2023 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452446; x=1688044446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUH9XtAzWIRgOsb1MqDJfvd6qVENrkssqR4+2VADmQU=;
        b=iLSrL45SV8BP5SNaj9ihAs/HG1rHntKH8UaPf63oqwFqxFSR3voahRiA6NEluOhKtu
         ZTWv7fK83uKK5C7t5jOu7RMYdZ0qCXslmYTpIm+t+1WULQ0dTV+ziS/8Isu6K3DlYOjz
         8TG5F71WCuwaE7AwHpS7Zj7M1Lo5T+UykhITrpppwUN8RqIsUUf4Iee/kT71bNlhbuuF
         /XkTcRCmJr1HZNRZeq17NBZww56GGHJllapgC0nC/bEuBsHqLQzx+zttBSsa5qMY8IR0
         OIlVyz9O7ET9giNoKqD+fXIkU923lQIPOBa2AmO4BtTdrIgWdhXOVkNilDHJjMDJY/hn
         y/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452446; x=1688044446;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUH9XtAzWIRgOsb1MqDJfvd6qVENrkssqR4+2VADmQU=;
        b=MWcp/+PWCMItessi2bvaK/mDabeaVW4DQqsj22jxQlRTjJl/O99k6QY/kGdKqtxDaw
         50iGS2mi8skSSr2K0jdvoDCcMiHz3a1/sy+jod2fQcaMvKZxfdYB4poFjzUyaj4Yrkao
         zOuV2Bmbgjc7DWMrNZjmpxwS3povDCz+xwM3CobPddGBNGQbpBw7nST3JQrZuIYkxk0W
         /n8l6l/D3/O84FOZg3FkBona0xgMAHnZgDr5gRJAwrYDhicZ1PE4gnhk/eYbBUArKggZ
         AmHrap28zCc9TNUCBQKLvcK4HgfbPbx2guvF/+iO4Zh3HjRhSKZDsta47S5NvkMq/j5F
         t+4A==
X-Gm-Message-State: AC+VfDw51tAyaVcGUvZzAiw6kJc6dLV+wWneJFy+h8ZBB1vV5oUUTdj7
	gEOLiHMedknt/a3eSNFnvNy1sg==
X-Google-Smtp-Source: ACHHUZ71bUnQXRzAkoYWkylcW0WPdqFvOlzeWjYH5TDzER83v471t24VZ6980CJNywvjLuGF0XQLiA==
X-Received: by 2002:aa7:d8cb:0:b0:514:9474:f4b7 with SMTP id k11-20020aa7d8cb000000b005149474f4b7mr1588818eds.31.1685452445895;
        Tue, 30 May 2023 06:14:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id j2-20020a50ed02000000b0050bc4600d38sm3929947eds.79.2023.05.30.06.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:14:05 -0700 (PDT)
Message-ID: <34864c2f-dbe2-8598-ad4c-f9c3acc13164@linaro.org>
Date: Tue, 30 May 2023 15:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, soc@kernel.org
Cc: conor@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, olof@lixom.net, palmer@dabbelt.com,
 robh+dt@kernel.org, arnd@arndb.de
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530-multiple-whooping-ee5706fceb67@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_061408_241936_F474F818 
X-CRM114-Status: GOOD (  15.19  )
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

On 30/05/2023 14:49, Conor Dooley wrote:
> Arnd suggested that adding a maintainer handbook for the SoC "subsystem"
> would be helpful in trying to bring on board maintainers for the various
> new platforms cropping up in RISC-V land.
> 
> Add a document briefly describing the role of the SoC subsystem and some
> basic advice for (new) platform maintainers.
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - add Krzysztof's suggested method for avoiding inter-branch
>   dependencies
> - explicitly mention that tags should be signed
> - link to the devicetree abi document, rather than trying to explain it
>   here & reword that whole section
> - fix some typos, capitalisation & unify bullet style
> 
> The devicetree abi doc feels quite out of date at this point, and could
> probably do with a spring clean - but it also feels like hallowed groun

Yep, but that's another topic.

> d
> on which one should tread lightly, so I won't go near that til Rob is
> back.

Thanks!

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
