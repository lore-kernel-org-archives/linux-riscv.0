Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1713C606A32A
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yaPbKAV4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gHEhhqsy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=cMqrV2O3sEyB8eA12PuRpErUX0XxhHTCMEucmOHn8L4=; b=yaPbKAV4Yhf9ajf8cZkYTRdHYV
	fmXyb1hP8iF0cQA4uAi96AU15T8heSY53q8q3w6i9wBYmdRgEXo+g7PRvbvRG6qcqywvj5TdsZjzV
	KfjfLK/x8pENNXjvmGgLi+i26KERDaPpoHYwvCwRBEOF80mDfK/jivcwYv4TacIhwvVYnMM6cj9Lf
	jS7XfYwQPKYL1T2pS92f531rtU1485P2ywfEzur/dpQTF94LevXxeI18siUHgEiK97KDoaSKYteDo
	yAaOkCBlNtmnMSwMGJbSuLtUPSHeXiXI1ivg0JNDBwzEBq5MIDnpJnmQFRidMeSlwRn0VFtrdH5fB
	38femgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIOO-00000005dii-0u05;
	Tue, 17 Nov 2026 12:34:32 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIOL-00000005dhH-3dNK
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 12:34:31 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so555864a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 17 Nov 2026 04:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794918867; cv=none;
        d=google.com; s=arc-20260327;
        b=d4Cs8ouU+hKMw6oy4zclYVZm+Uttj6jjxuDeVpvMRkJFBO/wuDg/6LrAEqxRrqT3S3
         DAvmzod6F3qyoRoTTQCW3oM2qIxpSHMXjnTK8DVdfvymUgGbO0dbnihY7UDLGBlhyXF+
         60vIOYNnkJR/EXjjZffv7fx+ebjBHBOHcGf9aaxlrCP+j+iF3HHCWR5Tmn/BsFhB9uJS
         h39yniMXps1L7UChhAFPBxd30yh6jf3paXABuKYRz0yn99Ny5x7ZtX3eUaq2iYZ78wmO
         RiFnyxrYDt9sjeSxpnaCWxmvaDiNkmoH+G/xUZjZq7zPiol+DARpfvi9Iym0bLrJicCg
         nsTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=R0C1suA4SxiusRHiawiUCOcPgTxU2RpEnv1XCXIekfM=;
        fh=rmkz8ghodQvnXuexRDiL/sLDn8Hq1r4ZssUsIVMKYO4=;
        b=LvY/N1YeWp9YDEeZ3hYfZDeUWgZQ3w6xY1DjLaOJhiQSGSuVcXYp4H+4gijB3Pd6Gy
         DmNTxUwYxQEibs6ntGTC/YldNNTE0kDCVxnqbRiatvmSPzQMryjkhCuJKGyQfJD0Nz8Q
         iMbXF4PUHRo54jPFORQYWE35oZRlxiIWnlZp0zzYalxPl/wqr/qxIPVHxEc73DlX1XMN
         gzhF7EfrFWl4l7cG2BZgN0KvYLdnICKOAUU5oT3fUuJK3FvxNngduL4+yg6pLHVx6fxH
         4jj9nRpWgnOaqCHFvM4N0vDhuDPA+jssjbtUoYXNEHR6kmcT1R+6yoXrWhaqWqvDUu80
         GphA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918867; x=1795523667; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R0C1suA4SxiusRHiawiUCOcPgTxU2RpEnv1XCXIekfM=;
        b=gHEhhqsysi2LwesEaNumDyYTe4cgKdefWOSA09QETgL82Tf+paSKhmp+hLN59Gc26g
         2rD6ppMr/XG5SMxaJ7sVEvbmBUcHU6ELTuCn8jAJgDFKBeQ2AXCc913dxzDl7/4Du8iu
         POsVXohJnKmYFAVtKsfG73oVi7aYCP9JSq1LFnyJN8c17BoKg1xz40Wh0oPmaygzCwWU
         o48fUJ4UPSbHLY4ZCwNYXRzUhA00JsShdFzhl6mISIi2gsJQmckb2ZSRmxBKDOi8LHVn
         6RDbDMMD+FyiZG/aCd6NL6vvC3Dsy7yiHUo8St87GdslF3EIHQrpSoOYgVsUi6M1xFxZ
         Wtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918867; x=1795523667;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0C1suA4SxiusRHiawiUCOcPgTxU2RpEnv1XCXIekfM=;
        b=SZBpSBLKXE7KMWCD4PJXsJNzNWc0Xv5rmv03aloFBcyh7v2TjyqTZLdNNUV+ode1Vm
         x90gYOno+sivNdA+Yb/UX7WBrhFYQCCKP6bBK4+dkjn8ycKJSbkSxLL8XJ1uZVLnY1lj
         4MDwiVC+kKAP9Mp6VRRkqKTGD8gtBD+dRBOQqHGbsuyEMpYvcd/2kxIS4kENYbtZHx0C
         uwWPfTJ17V1tpSmcDgq5bM/xrgN9OhYmfqnC8hywHtcFF4ChBQFemPLXCfrUQSiU08YW
         Dekmke9GyKTiCmM8VQTNs+LsWnD8v+dExY4BJtQqi9vuIKlIr6AdoISLcNkHVsBLzn3X
         +aNA==
X-Forwarded-Encrypted: i=1; AL+hErE5bID//K521fhISD0ez3sQ1VCJhyMHOJ3QEYIf34STI77HB8yL/bciFrx9UOYs5ylyfardy3QYpjDm6w==@lists.infradead.org
X-Gm-Message-State: APuU4Z9dFABmG865xC+/xJNCdjNHu7FpFKJE609SYIhj/35suBlD6DLb
	EyWwvjKZpYCa+ECYCrGTokJG6/Z36Vl7eg0k6gPjfzrjgsOlQO47fJ1QS13KC6fi/vD0q4iNL8z
	Ih95A4cNkpKGbQW1BOTKPE8Opbhmacuc=
X-Gm-Gg: AYBFou0ahtgAtZZDH41Nx63ZYbFtQxeypLQDaCJdqrhz3VmdEmgzdbO9nEtNbbgB33N
	oZ8UegF6yUg4wHq0Jk3GipPGSkfUT1meIKbttt/f6aEz71ADMoK5ubNPcwwuBYUveXNtR16W1xJ
	NmrvWCrI8CKWr8YX2/3zGhvQ+GNOoCFpOqR54+2o1s4d44XJwf2eNRhmA6fy+tVGdGVaUv14TW4
	mr4Or0iM5h/bi2az1jl/XN9t1G4U2vLa/p2MtXg2yypnxWT5wZkKjyuVTqg+bNTrJAQk1yLb9dU
	QGCu20EnPjO1co3UtflNCoGqQf1Qdkpfw/1TVo77fcs8GOS0OahcDRrWqunJFsl6hw6sW+lPegs
	nNuZSC1LevvxjTh7XoI7bDbYIcGmhQojAhRk=
X-Received: by 2002:aa7:d14a:0:b0:6b7:b872:2799 with SMTP id
 4fb4d7f45d1cf-6b7c0998ba4mr7830416a12.19.1794918867146; Tue, 17 Nov 2026
 04:34:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <20261110061429.2036-2-linux.amoon@gmail.com>
 <avpN-gFOvTBAMY6G@venus> <CANAwSgT_k35_waHL-+iU93f=k3fjFAPXhk=exRz-XHMm2MqREA@mail.gmail.com>
 <avvnRkK9agPSdzac@aurel32.net>
In-Reply-To: <avvnRkK9agPSdzac@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 17 Nov 2026 18:04:12 +0530
X-Gm-Features: AclHuK_kx8zawYGaheU3obBfG0RSjShsNOB5FZzf0Hf2ULzVFDROSleg0QHq__c
Message-ID: <CANAwSgSXP1bZVVrX71jfgi1iR9AY4TpM0pk07ke+oeLvcX1fEQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261117_043429_973456_B477AE26 
X-CRM114-Status: GOOD (  54.22  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Aurelien,

On Tue, 17 Nov 2026 at 11:04, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Anand,
>
> On 2026-11-16 13:06, Anand Moon wrote:
> > Hi All,
> >
> > On Mon, 16 Nov 2026 at 11:33, Sebastian Reichel
> > <sebastian.reichel@collabora.com> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Nov 10, 2026 at 11:44:27AM +0530, Anand Moon wrote:
> > > > The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> > > > to access the PMIC. However, these handlers run in an atomic notifier
> > > > context (specifically within an rcu_read_lock() critical section), while
> > > > the I2C-backed regmap uses a sleepable mutex.
> > > >
> > > > This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
> > > > context switch in the RCU read-side critical section during shutdown on the
> > > > Banana Pi BPI-F3:
> > > >
> > > > [  563.803475] WARNING: suspicious RCU usage
> > > > [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> > > > [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
> > > > ...
> > > > [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> > > > [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
> > > > [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2
> > > >
> > > > Replace the regmap operations with atomic I2C transfers to avoid sleeping
> > > > in an atomic context. Preserve unrelated register bits through
> > > > read-modify-write operations and check for atomic I2C support before
> > > > registering the handlers.
> > > >
> > > > Obtain the I2C client from the parent device and verify that the adapter
> > > > supports atomic transfers before registering the handlers.
> > > >
> > > > Tested on the Banana Pi BPI-F3 (SpacemiT K1).
> > > >
> > > > Assisted-by: LLM
> > > > Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > > > Fixes: 28124cc0fb8c ("driver: reset: spacemit-p1: add driver for poweroff/reboot")
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > >
> > > regmap runs i2c_transfer itself and thus also uses the atomic I2C
> > > transfers. The problem here is regmap itself. But instead of moving
> > > away from regmap, the atomic use case should be supported properly
> > > in regmap.
> > >
> >
> > On  RISC-V platform, poweroff and reboot are already handled by OpenSBI
> > through the SBI System Reset (SRST) extension. Linux delegates these
> > operations to firmware using SBI_SRST_RESET_TYPE_SHUTDOWN for poweroff
> > and SBI_SRST_RESET_TYPE_COLD_REBOOT or SBI_SRST_RESET_TYPE_WARM_REBOOT
> > for reboot, depending on the supported reset type.
> >
> > Therefore, there is no need for an additional Linux PMIC poweroff/reboot handler
> > on this platform, as it duplicates functionality already provided by firmware.
> >
> > While supporting atomic operations in regmap may be useful more generally,
> > it is not necessary to address this platform's shutdown and reboot requirements.
> >
> > I tested this on the SpacemiT K1 Banana Pi BPI-F3 after removing this PMIC
> > poweroff/reboot driver.
> >
> > OpenSBI commit which handles this extension
> >
> > d9637d00bf47 ("lib: utils/reset: add SpacemiT P1 PMIC support")
> > b10e18ec854a ("lib: utils/i2c: add minimal SpacemiT I2C driver")
> >
> > Similarly, on the StarFive VisionFive 2, poweroff is handled by
> > OpenSBI through the
> > AXP15060 PMIC, so there is no need to register an additional poweroff
> > handler using
> > devm_register_power_off_handler().
> >
> > OpenSBI commit which handles this extension
> >
> > 568ea49490d9 ("platform: starfive: add PMIC power ops in JH7110
> > visionfive2 board")
> >
> > -----8<----------8<----------8<------
> > diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> > index 50df66de24e06..069259f7d7c15 100644
> > --- a/drivers/mfd/axp20x.c
> > +++ b/drivers/mfd/axp20x.c
> > @@ -1458,8 +1458,14 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
> >                 return ret;
> >         }
> >
> > -       if (axp20x->variant != AXP288_ID)
> > -               devm_register_power_off_handler(axp20x->dev,
> > axp20x_power_off, axp20x);
> > +       /*
> > +        * The VisionFive 2 handles AXP15060 poweroff through OpenSBI.
> > +        * Avoid accessing the I2C PMIC from the atomic poweroff path.
> > +        */
> > +       if (axp20x->variant != AXP288_ID && !(axp20x->variant == AXP15060_ID &&
> > +                               of_machine_is_compatible("starfive,jh7110")))
> > +               devm_register_power_off_handler(axp20x->dev,
> > +                               axp20x_power_off, axp20x);
> >
> >         dev_info(axp20x->dev, "AXP20X driver loaded\n");
> >
> > Please let me know if this works on your board?
>
> Yes, that works, but I don't think this is the correct solution to
> disable here. Also this won't scale for future boards which might use a
> different existing PMIC driver with poweroff support and that will also
> need to be patched.
>
No changes needed over here, reboot and power-off priority will
work fine.
> As pointed out by Troy in an earlier mail, the real problem is the
> priority at which the handler is registers, 192 for the reset and -256
> for the poweroff one. I wonder if the SBI SRST extension should also
> register the poweroff one at 192. It seems it's about replacing the call
> to register_platform_power_off() by register_sys_off_handler(), which
> supports using a priority value. And maybe SYS_OFF_PRIO_FIRMWARE = 224
> should be used there instead of 192.
>
Thanks for your input; with the changes below.
It works fine on Spacemit k1 and Starfive Vision 2 for reboot and power-off.

 arch/riscv/kernel/sbi.c | 51 +++++++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index af1ccea222f1..32a3d2df9032 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -512,23 +512,55 @@ static void sbi_srst_reset(unsigned long type,
unsigned long reason)
                __func__, type, reason);
 }

-static int sbi_srst_reboot(struct notifier_block *this,
-                          unsigned long mode, void *cmd)
+static int sbi_srst_reboot(struct sys_off_data *data)
 {
-       sbi_srst_reset((mode == REBOOT_WARM || mode == REBOOT_SOFT) ?
+       sbi_srst_reset((reboot_mode == REBOOT_WARM ||
+                       reboot_mode == REBOOT_SOFT) ?
                       SBI_SRST_RESET_TYPE_WARM_REBOOT :
                       SBI_SRST_RESET_TYPE_COLD_REBOOT,
                       SBI_SRST_RESET_REASON_NONE);
+
        return NOTIFY_DONE;
 }

-static struct notifier_block sbi_srst_reboot_nb;
-
-static void sbi_srst_power_off(void)
+static int sbi_srst_power_off(struct sys_off_data *data)
 {
        sbi_srst_reset(SBI_SRST_RESET_TYPE_SHUTDOWN,
                       SBI_SRST_RESET_REASON_NONE);
+
+       return NOTIFY_DONE;
+}
+
+static bool srst_power_off;
+static bool sbi_srst_available;
+
+static int __init sbi_srst_sys_off_init(void)
+{
+       struct sys_off_handler *handler;
+
+       if (!sbi_srst_available)
+               return 0;
+
+       handler = register_sys_off_handler(SYS_OFF_MODE_RESTART,
+                                          SYS_OFF_PRIO_HIGH,
+                                          sbi_srst_reboot, NULL);
+       if (IS_ERR(handler))
+               pr_warn("Failed to register SBI SRST restart handler: %ld\n",
+                       PTR_ERR(handler));
+
+       handler = register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+                                          SYS_OFF_PRIO_FIRMWARE,
+                                          sbi_srst_power_off, NULL);
+       if (IS_ERR(handler)) {
+               pr_warn("Failed to register SBI SRST poweroff handler: %ld\n",
+                       PTR_ERR(handler));
+       } else {
+               srst_power_off = true;
+       }
+
+       return 0;
 }
+device_initcall(sbi_srst_sys_off_init);

 /**
  * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
@@ -643,7 +675,6 @@ int sbi_debug_console_read(char *bytes, unsigned
int num_bytes)

 void __init sbi_init(void)
 {
-       bool srst_power_off = false;
        int ret;

        ret = sbi_get_spec_version();
@@ -677,11 +708,7 @@ void __init sbi_init(void)
                if (sbi_spec_version >= sbi_mk_version(0, 3) &&
                    sbi_probe_extension(SBI_EXT_SRST)) {
                        pr_info("SBI SRST extension detected\n");
-                       register_platform_power_off(sbi_srst_power_off);
-                       srst_power_off = true;
-                       sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
-                       sbi_srst_reboot_nb.priority = 192;
-                       register_restart_handler(&sbi_srst_reboot_nb);
+                       sbi_srst_available = true;
                }
                if (sbi_spec_version >= sbi_mk_version(2, 0) &&
                    sbi_probe_extension(SBI_EXT_DBCN) > 0) {
--
2.56.0

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
