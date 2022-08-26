Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9BCECAAD4
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BuTQzj5pB5CALQtzqVTp/4J+SCM1yauzYwagKKuwFVs=; b=A+hAnaWFPHNXHMyOV11qJqUEqB
	TRLSPdQj8/sBurDpbfbD/9nNux3nmFhqYWTI4Hpq4JM13w938wkp1z/dJ0Yc4VTb7YMBwWvkbOoDT
	O6AeJcn0dbL3m/5qfUtxkY0RhL9nL52yM97m1mLWD5VABz/nEu68cecd0Mr7LF2JAIu45MzgNxj4b
	jMK2WZu/ppPFvU9vEM98gymjRLFgrJFlBDJhf+vxOTVoZ4TXhSlEk6PI197egXRYuMFgm7pob/B8t
	U/Nw+fRHHddm9CHFcVcnrJ5UiFdHm5Y9wqNSLm3X3lhAOkD7viKZEhUUVSjsIFGEp9QaOnowrED6R
	8O+1HA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaOY-006Fjj-A1; Fri, 26 Aug 2022 14:33:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaOU-006Feq-4o
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 14:33:12 +0000
Received: by mail-pl1-x630.google.com with SMTP id m2so1739391pls.4
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 07:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc;
        bh=MoYO0aV4Sdt+1lFREzXlZRwm/vMSBTGBOAkrIfrb15g=;
        b=CT/xwp8bf+4WnGL54CNyZVkKySUwDtUNmpjzpWsUyLOkBg8sDDdOeo80hAORi+whLq
         sMEt6SfNb8fzZ/lW58Zxz7NMrPe/IxhVPmObYrXUNgSerKsYN4hGPzf/JSZ7hI3w1m7I
         av7swLyoioe1Kc08F6JDrl/BvN2m6DS8uNXjLQvTyXSLVG5pOAAXF6X2LRIHR2vJxTrH
         DtLAB/OLA+v+FlOftUF45005OE7IQES8bTIxlWWNe9+r3PDCjF5OGUmEsUCapuAgMK0S
         jTV1SRf3gAkWtYXgEVs+sIuSK6tELwPF/xoeTn+V0fKMvXaSdzvi49AlF3HNzBLvregm
         utcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc;
        bh=MoYO0aV4Sdt+1lFREzXlZRwm/vMSBTGBOAkrIfrb15g=;
        b=h0EE2LVTr11imhpQ15cDEiaiLlFsYsEOb3f3KlRQaGqqtTAYQTKhyn6DDdd9qUDoTi
         TGwASyfgGJ/ROi2d7cI6znQ8ZIWfMWZMi3/eceFs8Tlu3gUtDIac/gpDdoSB20Uq2NHN
         biGn3E/Fieo5TdlN73ZhihoNhTkh32bi0AQuKEZMXvAV2cO5lqvNYuyiVanuAHWkxim4
         XaSOmOnU7/cT9smbCC0ec5kSeHblQxTc+9W4Xvba4aKuC+idjtTRzK4+48VfrEGVIB/I
         qTxbsPf8UbZuCr4q2ZGCdpwd7/OQxr/ip+clhW1eq3tg2P1+owdebZxBC+p48aR4FHkP
         lMYQ==
X-Gm-Message-State: ACgBeo2szezp+2DHhnA3U/eIVoe/czcJEkHo0g8m2VS7kT/q7/kYgqu0
	6zj1MJbI+CWLZRbma9PfijxwYA==
X-Google-Smtp-Source: AA6agR7zB0GXZEcvFu4C6QCUUhy/MR+Rz11NBBQC8ja8lj3FFezrrr0OxS3nFw6wcE24xBi7lBRTxA==
X-Received: by 2002:a17:902:f542:b0:173:4136:83cb with SMTP id h2-20020a170902f54200b00173413683cbmr3905017plf.4.1661524387807;
        Fri, 26 Aug 2022 07:33:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id i72-20020a62874b000000b0052e987c64efsm1871933pfe.174.2022.08.26.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 07:33:07 -0700 (PDT)
Date: Fri, 26 Aug 2022 07:33:07 -0700 (PDT)
X-Google-Original-Date: Fri, 26 Aug 2022 07:33:05 PDT (-0700)
Subject: Re: [RESEND/PULL PATCH 0/2] MAINTAINERS updates for PolarFire SoC
In-Reply-To: <196dcae3-542a-2cf3-ebee-e7ecc4a8a330@microchip.com>
CC: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, Daire.McNamara@microchip.com,
  broonie@kernel.org, wsa@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
  jassisinghbrar@gmail.com, linus.walleij@linaro.org, brgl@bgdev.pl, Greg KH <gregkh@linuxfoundation.org>,
  Olof Johansson <olof@lixom.net>, mturquette@baylibre.com, sboyd@kernel.org, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-5a6ac7a8-1caa-433b-909b-438a1c05f320@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_073310_209990_4F548A4A 
X-CRM114-Status: GOOD (  13.28  )
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

On Thu, 25 Aug 2022 23:22:07 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 26/08/2022 01:15, Palmer Dabbelt wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> On Wed, 10 Aug 2022 07:02:42 PDT (-0700), conor.dooley@microchip.com wrote:
>>> Hey Arnd,
>>>
>>> Could you please take the following two patches via the soc tree when
>>> you get a chance?
> 
>> Thanks, these are on fixes.
> 
> I think these already were applied by Arnd. I guess the soc patchwork
> bot does not CC the people on the original mail, only the author.

Ok, I've dropped them.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
