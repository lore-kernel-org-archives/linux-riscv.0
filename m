Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1034CCA47B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 22:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=K/kWHx3kT5BugQAV9Yp9gOwaTpO7RqC+iCGZFpwy6pI=; b=lxVGlYIhz7NPWRBB4zwHXcyyRd
	9D9b+6NcO2pvXz8OT1EPRAcLLecHfu/zEhvZYxZPc+Tq7gpthp+HAVlphxGIpzugFpMUklf4I9ANB
	Fl/exY7iebT7Gh05ywDreGJsUPel+NHELdY/FKmSUslVoQ65ERhWf81RoOY94b/VnPW1qMAB22dfv
	D4UhuC8IsrnY4bxJP4KgU1OtGJG1zn+JIFrP3K1VkxpizcO3/9sUpF+OcAsbUSzw2Xf9/4hGV0pN+
	jayUGDdVSbIOUPXAflNrYPpwJ+G/GysCku6eeN2G0XBsKKupfBO72hrq8gG4fLr06NYW8OGR4zd8u
	hS2Ky6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6wO-001s5h-H4; Thu, 14 Jul 2022 22:04:12 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6wJ-001s3R-RK
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 22:04:09 +0000
Received: by mail-pj1-x102c.google.com with SMTP id o3-20020a17090a744300b001ef8f7f3dddso4353998pjk.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 15:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=ywlJHcH7eypqCmP7zkmcLFhr+R1MKhJyHDg1SQdZ4+o=;
        b=XvB9r9RXYlimHyg2tVGdZjZabKYGLze7MOQPJOwXRsyTNAMc+T8JkFwn9DHK0rw+FN
         HBskxc3t+diLtZDeNPgT+DZIGRaT1TSLFqyOwNkawLVwR3fLGPO+1Att1oH2ea16v0VM
         xCucMDs0YeZdbPd3NzMPMWCqZx+U06K3UzY0UKpjpErOo2MsAvIDIe+JvY+dA3CoQTaO
         8RZAwgJDlw8wDWcr26G6exu7MCkxZ+2O+9ZEpxeKC+5OgZgwv/di6+1KZ/I7BTfpzUkR
         6keniU94SgAhkc4npYoyHxM985UTjTFhpiqnl1ekmrGy4LPfqeNFS7qEJS25AFm2VnhA
         H29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=ywlJHcH7eypqCmP7zkmcLFhr+R1MKhJyHDg1SQdZ4+o=;
        b=Mo5MdI0yTLFK6DZGb1mrDy9QzW8f518nJuzDqVXjKVAL26zbOgKK28jAK/ns1xsTGP
         CMNy9TnClZjVzszHz+qK6e9wz1gTeim94T0V4XBXvMVcSNILcn0ceItFhJxTKgg7+iTG
         PB4VFc/N9pN3jtL4+dQN9EFIDkjGCnwRHFvXia5MjS9H0LwEp0RWJ3rX2P4/j9SfmrwA
         J5PthxSuzke6ZhSQwWqR0X0rfaqvlr6ZzYrB2Ps5V1kMtTsmWJZiKciZ3TFV/y7F7Ori
         Y/siiR32ez+YOIhMG7STiDpQKQGgtxV98aZjN4XRWrYckdUrvtliAMQivHGh+1Ycr/1H
         GpQw==
X-Gm-Message-State: AJIora9ReswoT0rFAfMaK4TMfX+D4EdjEBlI87gdiGYy6JqfnUhoJ5fp
	4cHv/dl4sNl+S3jUgYYj20Q6Xg==
X-Google-Smtp-Source: AGRyM1thP0N/IY4OLhYu9r6MjJ1HW8omCP9Uxv0y7tA8fStUOLH0EhhBVNxOBpyHqtol460Zk/Y6bA==
X-Received: by 2002:a17:902:f68c:b0:16c:4eb6:913c with SMTP id l12-20020a170902f68c00b0016c4eb6913cmr10065283plg.2.1657836246537;
        Thu, 14 Jul 2022 15:04:06 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id r11-20020a170903410b00b0016c5306917fsm1927472pld.53.2022.07.14.15.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 15:04:05 -0700 (PDT)
Date: Thu, 14 Jul 2022 15:04:05 -0700 (PDT)
X-Google-Original-Date: Thu, 14 Jul 2022 14:46:55 PDT (-0700)
Subject: Re: [PATCH v3 4/4] riscv: dts: sifive: "fix" pmic watchdog node name
In-Reply-To: <20220606201343.514391-5-mail@conchuod.ie>
CC: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, andrew@lunn.ch,
  support.opensource@diasemi.com, lee.jones@linaro.org, ulf.hansson@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, stwiss.opensource@diasemi.com,
  conor.dooley@microchip.com, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
  atulkhare@rivosinc.com, krzysztof.kozlowski@linaro.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mail@conchuod.ie
Message-ID: <mhng-91bfbf9d-d8cc-4642-9688-20ef7ab21512@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_150407_903659_4B0AB412 
X-CRM114-Status: GOOD (  16.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 06 Jun 2022 13:13:44 PDT (-0700), mail@conchuod.ie wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> After converting the pmic watchdog binding to yaml, dtbs_check complains
> that the node name doesn't match the binding. "Fix" it.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index c4ed9efdff03..1f386b07a832 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -90,7 +90,7 @@ rtc {
>  			compatible = "dlg,da9063-rtc";
>  		};
>
> -		wdt {
> +		watchdog {
>  			compatible = "dlg,da9063-watchdog";
>  		};

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
