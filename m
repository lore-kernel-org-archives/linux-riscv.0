Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E4BECAAD5
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Sep 2022 21:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2GtW0vg5zqEwG9YeV5EIsGpRIh9OF3zadra5rRyXY4k=; b=SH45DyuUmK11aN4YiFyKaKQFlo
	j4CZAkQhUnLXtHLzzzt7avgPjVUZ4BYyFIKaDEbnZQZi1fUwqEao+wLuCCWuF2siG8Nghmhtiu87Z
	KZLubw+o7LuPHD+1veqj+Aac1mJ41y9HcHIa3DZqzpP7uOTtag+a5aF3+dRzxX4AA8/EyjbOSBSMa
	/cC4JOqWNJAO/9VmtYD2l7zalwIQmmZUNy3G9ebvKAcfbLwcnGOukfgoWHYaTNzaEvtqUy/tQ79QD
	h3QGbXmot+VIAr21u1D/bg2OBf4MXgIOboAuUUFGxtZr7Vs2Xymx+i4Ob2+U4MNlmkGyI+9vHEajy
	XdY1vsnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUaGP-003VMA-Tk; Sat, 03 Sep 2022 21:01:13 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUaGM-003VKJ-HF
	for linux-riscv@lists.infradead.org; Sat, 03 Sep 2022 21:01:12 +0000
Received: by mail-pj1-x1035.google.com with SMTP id ck21-20020a17090afe1500b002003ba5b71cso382742pjb.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 14:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=lMvwM2D3lBq1759sSmymtrNVHK/ru2VAFjzrktzxdrQ=;
        b=DBPOweT5l42saaWi7TYjJ1QIi3TQ9CmF0b8KXvSerivmdNKO8ZzVu8w9eG3HqWdFm/
         ZLllrsJz/f6Men23e71RAICccmwqwWE+HoenBqCBS6bJtTBO/6uUAodSHf1E01vQHqO1
         dC53ZjKfBt2Dk/2ChRkd4E3ZHjVBAubFJ66lnkYkNbbj+HZPFZrJygMIlK7EIsU1lsHn
         gEZ3X5IQJ4LHwhz9f7azeisCyscO4sf5Vpm9kcYUZvbL+mUtENEhqjfi5x7ZzMtQCj14
         bnRPnYq7HwLRetEuv8oUs1m+OxYuB+pxTitne7DS18rzI5XrTUiXkigHug9FvfjEk6cU
         y2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=lMvwM2D3lBq1759sSmymtrNVHK/ru2VAFjzrktzxdrQ=;
        b=bCn/CqnHcKGNx14YrE9za4dDTn7bwZkBcOvVxYaKRLnM+PRQE+p9s69vR4/vD0AAeF
         3WnlL3Eukud73WC+XjfxvlYOsbIPI0ZcXqc9IesDPk6kdJ/ICUijOWQfOzpY8cayXGd5
         FJi5JbL8p0I4EeqIEIpiEYb+4U1ifWDCB+KAhiTMtJxQlrwzyTq5pAMwrFfx7hceePkt
         taJ+TT1i3Kr/N350qUmvxxDHS7zqVf8ltGTt9ebkxwhBBPu9MUTlWnyKFqi3bLObEuHJ
         byxVT21ADyEyw7E59Oq6mAC+ThMsslh2Eo8wTWAGheMwSLK8lblUOMkah5qoA5MrSBsb
         FLKw==
X-Gm-Message-State: ACgBeo3OIGosmh52QfrpBOZVly61C4wwTTxY2X65siSR/7DrnGsdBfmg
	N8z7vp+s4Ythe7C8vKkphBPiGAVYoBSpNQ==
X-Google-Smtp-Source: AA6agR7UKbYSuCBhTnUhrcinLOBR3Bs0t9tpDRToQwc549LXwNT3rotnavCkfaLsjfYHsNNW2mbueg==
X-Received: by 2002:a17:90b:1bc4:b0:1fd:b913:ef58 with SMTP id oa4-20020a17090b1bc400b001fdb913ef58mr11301221pjb.220.1662238868209;
        Sat, 03 Sep 2022 14:01:08 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id s128-20020a625e86000000b005364c8786b7sm4337513pfb.215.2022.09.03.14.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 14:01:07 -0700 (PDT)
Date: Sat, 03 Sep 2022 14:01:07 -0700 (PDT)
X-Google-Original-Date: Sat, 03 Sep 2022 12:35:46 PDT (-0700)
Subject: Re: [GIT PULL] Microchip DT fixes for v6.0-rc4 (or later)
In-Reply-To: <1757d109-c65a-16e5-ab73-29b17e700f8e@microchip.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-9daaf911-5f32-4f2d-9fb5-2d621d5ba3cb@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_140110_810985_DF7F0A91 
X-CRM114-Status: GOOD (  26.38  )
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

On Fri, 02 Sep 2022 09:07:49 PDT (-0700), Conor.Dooley@microchip.com wrote:
> Hey Palmer,
> 
> Two patches here that are really not particularly urgent by themselves.
> Both fix the interrupts dtbs_check warning that I introduced last week.
> 
> As I said on my application mail: "patches for this dt-binding are
> usually merged via the riscv tree so I have taken the liberty of
> bundling it with the dts change".
> I would have sat on this for a little & grouped it with some other
> stuff, but Zong Li wants to do a rename of the binding [0] so to make
> life easier for them (and avoid this change being clobbered...) I
> decided to send this to you this week.
> 
> I did not bother marking it CC: stable since it's just a binding
> checker warning - to be honest, I'd have sent it via for-next if not
> for the fact that the warning fixed by these patches went via fixes
> and I didn't want tooling screaming at me for invalid Fixes: tags..
> 
> If you wish to apply these patches to for-next instead, they are at:
> https://lore.kernel.org/linux-riscv/20220825180417.1259360-1-mail@conchuod.ie/

IMO it's fine to have these on fixes, but it was too late for rc4 -- I'm 
not really sure when the cutoff is, but I generally like to have at 
least an overnight run of the autobuilders (as they find bugs sometimes) and I
try to avoid sending PRs on the weekend unless there's something super pressing
going on.

I've got this on fixes, I'll send them up next week -- probably early, 
as I'll be on a flight on Wednesday night.

Thanks!

> 
> Thanks,
> Conor.
> 
> The following changes since commit 1709c70c31e05e6e87b2ffa0a2b4cc0da4b2c513:
> 
>   Merge branch 'riscv-variable_fixes_without_kvm' of git://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git into fixes (2022-08-25 16:38:01 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/dt-fixes-for-palmer-6.0-rc4
> 
> for you to fetch changes up to 0dec364ffeb6149aae572ded1e34d4b444c23be6:
> 
>   riscv: dts: microchip: use an mpfs specific l2 compatible (2022-08-31 16:57:51 +0100)
> 
> ----------------------------------------------------------------
> Microchip RISC-V devicetree fixes for 6.0-rc4 (or later)
> 
> A fix for the warnings introduced in rc3 as part of fixing the console
> spam from the L2's isr.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ----------------------------------------------------------------
> Conor Dooley (2):
>       dt-bindings: riscv: sifive-l2: add a PolarFire SoC compatible
>       riscv: dts: microchip: use an mpfs specific l2 compatible
> 
>  Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml | 79 +++++++++++++++++++++++++++++++++++++++++++++++++------------------------------
>  arch/riscv/boot/dts/microchip/mpfs.dtsi                      |  2 +-
>  2 files changed, 50 insertions(+), 31 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
