Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCDE606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TEoLC34F;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yrzGRTHU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=IMwUKqc2NWxlEkjMGj1KwnVJ0gMpKoLtKtB9A7EWQMs=; b=TEoLC34Fy007bKSDh13saAvjx7
	i27qrg4hYtPNtZ+ajCDwypwPivfTl62wOQb/3T+xhArYMfPu6dQ9KRa1MHnkSqO5WndMgN2gfuNOx
	oIAuP/gbLK2l0nxrYwDhQP0d4DOIMSmiZBkdLRUzMOzmQXTzmZ1W9e6i+Vnp0oazBir0lrJRJhoKg
	27cLQLMZuuQQwJP30ClzP3VicN/7+85fzECyQSpBByJEKobQfuJ/t/n1LVGBt5vKZRLDXYX2Es3Qq
	UNOa0E23VNuErSp27+ia2I1MMcRY+/TWEAFNFYChF130h2z9wXlaez6ja/cKAQkkj2xzikhOSstYq
	fbo7eIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZZ1-00000007wiJ-3DLU;
	Wed, 18 Nov 2026 06:54:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZYy-00000007whm-2bV4
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 06:54:38 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso1084452a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 22:54:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794984875; cv=none;
        d=google.com; s=arc-20260327;
        b=nXRRULao8GKI75jvv3FFRqFrFS3epvAAQbDFFpE1Bd20iTygAQUp4aRYxo5V8bIPVC
         qqH3HERa38sw+eu77GUFnspHgOQiPy55lKr6KJu/+IfbIdHuyCITWRk66CG/PuF8yj+2
         rXtX5Q20F8lsg7/CYIbKUbAR6hB/88zDiRLk14WMPBndHIinwgKhNf6q/ExlYGrZJWjP
         sehZZobZ2qiQh2ttLK+uFJyL6j6k1d3gQOsHga6dNf/6eFHYdqkWJPr5GceOvZzysBew
         jyiU+Ym1hvzuCeWs5kUvPqGCuTyGKlWSFoHQlBziCV+HgdcqbmyPi+dZGi/QQ0lTdM3d
         h0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0v55DjIlhgGgzFGL2Aj+I5ed/9R8VGys7w/8Zak98m0=;
        fh=JgD96C4BmbG46pfC3XwkW75NcCBDEmoLNdjcxvnJa6I=;
        b=Ubg6VdqhfecizIPY5Fwt2IfBGJ43p2f8UHLaTy7Gla08pCckUAIRBG7xaDWYISoHSU
         9XGEdvwkhZ06n4wg0ZWIApcYo+RExjFJ6H4y5LfCHT/fBldojCUzK5TlwlJjMP81kgfI
         4vpW/C2/ml5wlM3+uI2CBYL7uFgB9TI2zJfnXcr0jFYce8SyYrxLYqkUH0SXzH/5Ud2v
         clY1+6HKJCg7ioTTpj6v99Er5cql20ckuZfvKGU3oJRHwowy6pRtziNNHDZuPR6OjXZB
         fVFn4WQQcWwNW2L7Y21loD7/7g7KCruMWxOIsI44F6o2D3CgiDe4SFBewSF1iUHeBBCH
         d5Gg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794984875; x=1795589675; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0v55DjIlhgGgzFGL2Aj+I5ed/9R8VGys7w/8Zak98m0=;
        b=yrzGRTHUZSyO43a76q6kBw/j8a/6XSrCxIS080tOnkvYdWpqPKn9d+1XNyatfFShLd
         wAxJB2ObF/6OGkMtdDMuzOF82dSrX3GMOKu1CSuPV/BW5t9Z9+d1QGYG14rVXd9N/2km
         J3+b3L5CTIrS5TGyTcOQZjqriadAm3vXIQm+9YaE8foh3TmkMO/+A5iDvBUPFIeVLgns
         NxA8tGDrLIKJ2X1W7/F4HUBYkSVtIsudDuMSwszCy8h9wMK99W/PDsiCVgsckZOcIlHF
         9dzuC9bLjMLFxqSAAkO2O7RAPTmojSSy5DYU9rPRiuwqgkk3krXvjHiWm05z+hzDTc8z
         KH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794984875; x=1795589675;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0v55DjIlhgGgzFGL2Aj+I5ed/9R8VGys7w/8Zak98m0=;
        b=ukVsW1wAQycUUxdE5ydFt9kCIL+0DTgN4gpsCX3EW0a850zEmmD+eslXboE5ce05KG
         L2hArqSF4rgzB5nxyO88w/tNZ3bj6JLY8idbNKjYsmRUthkKFKdD6e499N4y8QQOzRYj
         zQj++s3JSG6aI7TyA6S+N1G7cocpmoXgA4hXJU28UDe/qmJQ7tTzmD2Nm9yO57zyTHgq
         2U5934FpYJrJ9uymhVgj6K5+PRc4Kz4OuYwVF0FDe3RXA+LLuBzyvqCwfc6Y6cj7/jK6
         FL1GemtlxFppYhjOZ1TboC6WU3ddJQIaL8kIPSciYeDE0VD01/krFPFsfM8pvlslpP3E
         wugw==
X-Forwarded-Encrypted: i=1; AL+hErG4gS03RZuFBWSialzizFviZUul7Ep6kHdc4MFHL2ziOoHah052rH2B4GdS8wKjmY4PNsKcB3QJZNhsNw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9vxfPodmCD5+8MmpgIWzpHcSw94MNg6ghKBLpk8WrbBVuoGtr9
	kdiL5jdKpO1pc6ZAyXu2Ffy92AYhOojCpqK6mZ9XLGEEHRdaQF1S/vSk5aukEQ1WvkRcsQaJ4Dy
	vFX0bV7yAAURLWs60EekbcK7RmUArmYI=
X-Gm-Gg: AYBFou1Kd/McvIk5wZBVkuQqu5uaMyTd2/1NV+J/mPUD9J/esqIv2kcM1nqIkwHyczY
	gjGTX0Bp/2XV3ALIGpjPcv16L+GDAcLlj+a85wAIWuCuaIZssLpMsrEwqWZLr/zRcCkZBnXSbNI
	1l+x9XE8iC0bfY4Rv4wLzE2gqR6dSuR0sEMddRgkja1Kpff5IXdysymUsnybH21extWqgL4m0BA
	Zz+Hw0pmgrByFqUV2wLmn4WzjaDG6wehdkTp4kZVMA5URfvBw+PUR43ZhRsu/fhFciLH2njUuK5
	Z2hx7gCnq4XRnhCI6RPO2A1EiuTe5ZF5XP3WOn2jz40GJCc87Og5FEHvPWu1k2rmAt4BR5mIt88
	LBYgb1mb5WxS5Ad+Gkzwuc4PEoQlIV52JJ2WF8ZLUuVd/jqisesPbvopn
X-Received: by 2002:a05:6402:501c:b0:6b7:d1a4:fe1b with SMTP id
 4fb4d7f45d1cf-6b88810c5f5mr1112459a12.43.1794984874478; Tue, 17 Nov 2026
 22:54:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <20261110061429.2036-2-linux.amoon@gmail.com>
 <avpN-gFOvTBAMY6G@venus> <CANAwSgT_k35_waHL-+iU93f=k3fjFAPXhk=exRz-XHMm2MqREA@mail.gmail.com>
 <avvnRkK9agPSdzac@aurel32.net> <CANAwSgSXP1bZVVrX71jfgi1iR9AY4TpM0pk07ke+oeLvcX1fEQ@mail.gmail.com>
 <avzUjsZzhky4krEV@aurel32.net>
In-Reply-To: <avzUjsZzhky4krEV@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 18 Nov 2026 12:24:21 +0530
X-Gm-Features: AclHuK9HKxBMC369hvmbX2XcXZTYgL0-Osg6H7GZAWz1CrH05BbQd5v0LX84zZk
Message-ID: <CANAwSgRm9dbAtr4J4Gry_kR6xWQTQ+T+EaJ0vGDMpKGUPZxojw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
To: Anand Moon <linux.amoon@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_225436_735622_21796DCD 
X-CRM114-Status: GOOD (  64.28  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Aurelien,

Thanks for testing. Your feedback helped me a lot.

On Wed, 18 Nov 2026 at 03:56, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Anand,
>
> On 2026-11-17 18:04, Anand Moon wrote:
> > Hi Aurelien,
> >
> > On Tue, 17 Nov 2026 at 11:04, Aurelien Jarno <aurelien@aurel32.net> wrote:
> > >
> > > Hi Anand,
> > >
> > > On 2026-11-16 13:06, Anand Moon wrote:
> > > > Hi All,
> > > >
> > > > On Mon, 16 Nov 2026 at 11:33, Sebastian Reichel
> > > > <sebastian.reichel@collabora.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Tue, Nov 10, 2026 at 11:44:27AM +0530, Anand Moon wrote:
> > > > > > The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> > > > > > to access the PMIC. However, these handlers run in an atomic notifier
> > > > > > context (specifically within an rcu_read_lock() critical section), while
> > > > > > the I2C-backed regmap uses a sleepable mutex.
> > > > > >
> > > > > > This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
> > > > > > context switch in the RCU read-side critical section during shutdown on the
> > > > > > Banana Pi BPI-F3:
> > > > > >
> > > > > > [  563.803475] WARNING: suspicious RCU usage
> > > > > > [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> > > > > > [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
> > > > > > ...
> > > > > > [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> > > > > > [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
> > > > > > [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2
> > > > > >
> > > > > > Replace the regmap operations with atomic I2C transfers to avoid sleeping
> > > > > > in an atomic context. Preserve unrelated register bits through
> > > > > > read-modify-write operations and check for atomic I2C support before
> > > > > > registering the handlers.
> > > > > >
> > > > > > Obtain the I2C client from the parent device and verify that the adapter
> > > > > > supports atomic transfers before registering the handlers.
> > > > > >
> > > > > > Tested on the Banana Pi BPI-F3 (SpacemiT K1).
> > > > > >
> > > > > > Assisted-by: LLM
> > > > > > Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > > > > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > > > > > Fixes: 28124cc0fb8c ("driver: reset: spacemit-p1: add driver for poweroff/reboot")
> > > > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > > > ---
> > > > >
> > > > > regmap runs i2c_transfer itself and thus also uses the atomic I2C
> > > > > transfers. The problem here is regmap itself. But instead of moving
> > > > > away from regmap, the atomic use case should be supported properly
> > > > > in regmap.
> > > > >
> > > >
> > > > On  RISC-V platform, poweroff and reboot are already handled by OpenSBI
> > > > through the SBI System Reset (SRST) extension. Linux delegates these
> > > > operations to firmware using SBI_SRST_RESET_TYPE_SHUTDOWN for poweroff
> > > > and SBI_SRST_RESET_TYPE_COLD_REBOOT or SBI_SRST_RESET_TYPE_WARM_REBOOT
> > > > for reboot, depending on the supported reset type.
> > > >
> > > > Therefore, there is no need for an additional Linux PMIC poweroff/reboot handler
> > > > on this platform, as it duplicates functionality already provided by firmware.
> > > >
> > > > While supporting atomic operations in regmap may be useful more generally,
> > > > it is not necessary to address this platform's shutdown and reboot requirements.
> > > >
> > > > I tested this on the SpacemiT K1 Banana Pi BPI-F3 after removing this PMIC
> > > > poweroff/reboot driver.
> > > >
> > > > OpenSBI commit which handles this extension
> > > >
> > > > d9637d00bf47 ("lib: utils/reset: add SpacemiT P1 PMIC support")
> > > > b10e18ec854a ("lib: utils/i2c: add minimal SpacemiT I2C driver")
> > > >
> > > > Similarly, on the StarFive VisionFive 2, poweroff is handled by
> > > > OpenSBI through the
> > > > AXP15060 PMIC, so there is no need to register an additional poweroff
> > > > handler using
> > > > devm_register_power_off_handler().
> > > >
> > > > OpenSBI commit which handles this extension
> > > >
> > > > 568ea49490d9 ("platform: starfive: add PMIC power ops in JH7110
> > > > visionfive2 board")
> > > >
> > > > -----8<----------8<----------8<------
> > > > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> > > > index 50df66de24e06..069259f7d7c15 100644
> > > > --- a/drivers/mfd/axp20x.c
> > > > +++ b/drivers/mfd/axp20x.c
> > > > @@ -1458,8 +1458,14 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
> > > >                 return ret;
> > > >         }
> > > >
> > > > -       if (axp20x->variant != AXP288_ID)
> > > > -               devm_register_power_off_handler(axp20x->dev,
> > > > axp20x_power_off, axp20x);
> > > > +       /*
> > > > +        * The VisionFive 2 handles AXP15060 poweroff through OpenSBI.
> > > > +        * Avoid accessing the I2C PMIC from the atomic poweroff path.
> > > > +        */
> > > > +       if (axp20x->variant != AXP288_ID && !(axp20x->variant == AXP15060_ID &&
> > > > +                               of_machine_is_compatible("starfive,jh7110")))
> > > > +               devm_register_power_off_handler(axp20x->dev,
> > > > +                               axp20x_power_off, axp20x);
> > > >
> > > >         dev_info(axp20x->dev, "AXP20X driver loaded\n");
> > > >
> > > > Please let me know if this works on your board?
> > >
> > > Yes, that works, but I don't think this is the correct solution to
> > > disable here. Also this won't scale for future boards which might use a
> > > different existing PMIC driver with poweroff support and that will also
> > > need to be patched.
> > >
> > No changes needed over here, reboot and power-off priority will
> > work fine.
> > > As pointed out by Troy in an earlier mail, the real problem is the
> > > priority at which the handler is registers, 192 for the reset and -256
> > > for the poweroff one. I wonder if the SBI SRST extension should also
> > > register the poweroff one at 192. It seems it's about replacing the call
> > > to register_platform_power_off() by register_sys_off_handler(), which
> > > supports using a priority value. And maybe SYS_OFF_PRIO_FIRMWARE = 224
> > > should be used there instead of 192.
> > >
> > Thanks for your input; with the changes below.
> > It works fine on Spacemit k1 and Starfive Vision 2 for reboot and power-off.
> >
> >  arch/riscv/kernel/sbi.c | 51 +++++++++++++++++++++++++++++++----------
> >  1 file changed, 39 insertions(+), 12 deletions(-)
>
> Thanks for this patch. It sounds good overall, and it's always good to
> switch to the newest API.
>
> I have been able to test it successfully on VisionFive 2 and Banana-Pi
> F3. Please find a few comments below.
>
> > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > index af1ccea222f1..32a3d2df9032 100644
> > --- a/arch/riscv/kernel/sbi.c
> > +++ b/arch/riscv/kernel/sbi.c
> > @@ -512,23 +512,55 @@ static void sbi_srst_reset(unsigned long type,
> > unsigned long reason)
> >                 __func__, type, reason);
> >  }
> >
> > -static int sbi_srst_reboot(struct notifier_block *this,
> > -                          unsigned long mode, void *cmd)
> > +static int sbi_srst_reboot(struct sys_off_data *data)
> >  {
> > -       sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
> > +       sbi_srst_reset((reboot_mode == REBOOT_WARM ||
> > +                       reboot_mode == REBOOT_SOFT) ?
> >                        SBI_SRST_RESET_TYPE_WARM_REBOOT :
> >                        SBI_SRST_RESET_TYPE_COLD_REBOOT,
> >                        SBI_SRST_RESET_REASON_NONE);
> > +
> >         return NOTIFY_DONE;
> >  }
> >
> > -static struct notifier_block sbi_srst_reboot_nb;
> > -
> > -static void sbi_srst_power_off(void)
> > +static int sbi_srst_power_off(struct sys_off_data *data)
> >  {
> >         sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
> >                        SBI_SRST_RESET_REASON_NONE);
> > +
> > +       return NOTIFY_DONE;
> > +}
> > +
> > +static bool srst_power_off;
> > +static bool sbi_srst_available;
>
> Not sure we want global variables for this, as they are not used anymore
> once the initialisation is done.
Correct, srst_power_off indicates whether SBI SRST poweroff is available,

The sbi_srst_available boolean flag indicates whether sbi_init () detected
the SBI System Reset (SRST) extension during early initialization.
It allows the deferred initcall to register the sys-off handlers only when SRST
is supported, avoiding a second extension probe.

Ok I will remove them.
> > +
> > +static int __init sbi_srst_sys_off_init(void)
> > +{
> > +       struct sys_off_handler *handler;
> > +
> > +       if (!sbi_srst_available)
> > +               return 0;
> > +
> > +       handler = register_sys_off_handler(SYS_OFF_MODE_RESTART,
> > +                                          SYS_OFF_PRIO_HIGH,
>
> I think you should use SYS_OFF_PRIO_FIRMWARE for both entry. It
> corresponds to the reboot provider.
Ok I will modify this.
>
> > +                                          sbi_srst_reboot, NULL);
> > +       if (IS_ERR(handler))
> > +               pr_warn("Failed to register SBI SRST restart handler: %ld\n",
> > +                       PTR_ERR(handler));
> > +
> > +       handler = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
> > +                                          SYS_OFF_PRIO_FIRMWARE,
> > +                                          sbi_srst_power_off, NULL);
> > +       if (IS_ERR(handler)) {
> > +               pr_warn("Failed to register SBI SRST poweroff handler: %ld\n",
> > +                       PTR_ERR(handler));
> > +       } else {
> > +               srst_power_off = true;
> > +       }
> > +
> > +       return 0;
> >  }
> > +device_initcall(sbi_srst_sys_off_init);
>
> Any reason to use a device_initcall as opposed to just calling the
> fuunction from the sbi_init function below? If so, please provide the
> reason in the commit message when submitting the final patch.
>
Initially, I called  register_sys_off_handler() directly from
sbi_init(), replacing
the existing register_restart_handler() and register_platform_power_off() calls.
However, the kernel failed to boot with this change.

The sbi_init() function runs during early RISC-V initialization,
before the kernel
memory allocator is fully initialized. Since register_sys_off_handler()
requires dynamic memory allocation, calling it at this stage is unsafe.

Moving the registration to a device_initcall() defers it until the
required initialization
has completed. I will document this in the next revision's commit message.
> >  /**
> >   * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
> > @@ -643,7 +675,6 @@ int sbi_debug_console_read(char *bytes, unsigned
> > int num_bytes)
> >
> >  void __init sbi_init(void)
> >  {
> > -       bool srst_power_off = false;
> >         int ret;
> >
> >         ret = sbi_get_spec_version();
> > @@ -677,11 +708,7 @@ void __init sbi_init(void)
> >                 if (sbi_spec_version >= sbi_mk_version(0, 3) &&
> >                     sbi_probe_extension(SBI_EXT_SRST)) {
> >                         pr_info("SBI SRST extension detected\n");
> > -                       register_platform_power_off(sbi_srst_power_off);
> > -                       srst_power_off = true;
> > -                       sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
> > -                       sbi_srst_reboot_nb.priority = 192;
> > -                       register_restart_handler(&sbi_srst_reboot_nb);
> > +                       sbi_srst_available = true;
> >                 }
> >                 if (sbi_spec_version >= sbi_mk_version(2, 0) &&
> >                     sbi_probe_extension(SBI_EXT_DBCN) > 0) {
>
> Regards
> Aurelien
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
