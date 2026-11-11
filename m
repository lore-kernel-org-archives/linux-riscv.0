Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92E606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sWFEr0hk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wq8tolxi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=vkICoYhmQp9MjjDMLbPQoc9U0MyF59X74ODePBi4PHA=; b=sWFEr0hk/7oQR1DZR+AR0/1DYo
	NjUG2MNmvQH8a1wNFbnjrKXSnbq2eoB//VqXJe8ueF9gDaN9jBm9nIMkAogZa44dyeXnCUJZ97mwH
	r6ZHZnaq/4+fvu0/tF+xYsGEB9jaEJnzmrnT0+ASsuWrXRL+CBhbOodQyjHoI7QBMjvhASZfaoOq2
	G5smErI8RnZr5MtMOpfPJ1LWfOfsuDUdoqVYddvWX/7foBRP/Xv4qjgI8JxzWSmR1qkJgqXIYY3h+
	yCb8OgwoyWYVV/bCl9lEuzX0i8b7TvaUPgjLTOBRqUO5bjigEXm/CjxSGKBEZdmUhKMEYMcnyhKtY
	wexij53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR69L-00000006QWk-26Im;
	Wed, 11 Nov 2026 11:05:55 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR69I-00000006QW7-28sz
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 11:05:53 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1882358a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 03:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794395150; cv=none;
        d=google.com; s=arc-20260327;
        b=ltXlvSb8JOySv4DSNgW/5bta8nlI2PMQEymTv2FyP8AEws1DJYWhG951oAZDiGC7LL
         NCBTLZzrXC22K961fWrhBhlfGigS/yvb2y/ia3r7tvL+eMQpXbZdu99sNyoMCs9RdJQs
         IfSq9AC6oCR3UQRhJyz+17HU2b8pbrcGHM5zRPiqT/mCX9XUde8Y7AR5z3qvyHryEq0u
         7bN3bm7tY8BDFWPmvkE4bokmfTGtXij5ko9Wli8gxgseo1Kp3oGxu/QUsr3UGhXQzz1q
         Kab9SDvXT3TX6sPLTskml5dQs23b96bpA60IdZorJqXBWXShrfQyXJQZA6jr9JpsqYbX
         0QYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
        fh=qtaOSAspeNR2Mpvl1qeqQ/X03K7A9SUv4GrX1lx8fU0=;
        b=Vpyq7acCfwZSq7viU5YoGbgYfhTN3ROJ3XmH7TMIL+FnuEypU1kax1L0NDnnsAaA00
         aVcsLUSctOp4D+qRuYdyJa548urw1gKXumIA9iIdxvyaDnLh2jPasiU5S6LnYTBjBrsF
         fWuOVmYQy+Vg8uhbGexJ80jUcldynTnKYgtZTlo8wBV9DyeF8G9vcxAkKUtdEXhQ7o8r
         5KSbaNrxf4V3tsO3dpI+yk/Jt34NC9wIaamwMjL2QcJ1N6I0xJT5Adge9UZy88zMthho
         CjiDZf9TJKxjqpfJXd95JNDm4yB9kYV/UR4XWosI8FnxZGnk3j61e/6VMlNBt30TMKh2
         Cj2w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794395150; x=1794999950; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
        b=wq8tolxi5rOkI6iRQG85sj/1jmLdqHI+Al6iU4UowTB5Y4BLcGkhjhwn7gtG2SPV30
         mnODbecQeOKoAUU0DNAe8U3nlcbm6gtvNTS/weBt2JSc4iJ5txB41jej6AIuDjN/H809
         uhoh6ydNIlEysIOzVMGOpBr6t+FFrVaRLR9rPj7qZbk/TrZH3R7i6YwfjOjvz4un1Zf6
         ML+zJQrEr+XlKHFiYgpfvZXI8pW/Cj0+FimzUys6rPXl3Xw80M+LkiUB56MwIIJxLPVp
         vGWS51e4PgU5tkyxG0oRZEED8uGhjU9IZVlR7Kc9VIHtw/CRokEVqyZR0U7ma2OYCxfO
         De+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395150; x=1794999950;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1din0TNnBV2KJ8sSuRJVbvK1d3dMFjZgO4N2assoioU=;
        b=h8dEBLtC0JReiubd3qVMHPmzMv348PPeHw6WXNu1QesgiHLL9mIYLpsL8umIkHlzVw
         GrZ1V2mVRDbfauDkYPBH3i2W7OXhLwUjaBAaZ0/FVJKi+elew0WosuIMpvH26k74Rgjx
         CeUP89lyeltwecZaK1Y0qTdzwMu8xgGPrKe8F7/adUObC1sWbTQLnVx7vceoaVOqfAw2
         NGkol8854GqwSjp7I9eaxgOt+Zb4r5EZpn9LeKURGKHSCzSXoz64wQw2ZySUvrgXPKtN
         mtuiwLMHznGgeeuWg/5ZxyYW6R8suYNOPcNz5ntW+KwX3zTlh0OdDY49HN7hcUQx0rQy
         npHg==
X-Forwarded-Encrypted: i=1; AL+hErExzglFwhLG0+Mxu8Ii2YcrVutKmY6vJF3G2afHjNDWhggs3+woHoaxjdtJ4Ak094AnRPwKmN8vx8GY3g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+AGdRkFd8duqFOOdIFKS8VKE5a/ynEupGntf87IO2KVyvSR5Gu
	pA5jNCGmIIsuOv7G2VMBhXVbJjBFN1vVTBsv24dl2y8iN4eImp4BC+FZ8QSxp2+4I3qdEQKxsNP
	+Dcy91BPPti5H1HL2UXcP8MdQb0AkrlA=
X-Gm-Gg: AYBFou0DGCIW0zKTxgueW4WfKe07FkBOctfI7PaqWmtd3+UdYL5jSP5eoZKWUZ1cXsg
	AH+6P1pzV9ceFlavSXsEGeiGh59XIm2kCf/vjB2auJUU+oiRPMygW0Qvar9SzKcCahSWCnq5jVz
	gSMSv79qX+qN/dpDG8sLVH6H0uQ6zEPgls96w1Aa3wg1x5zPZcu4ewlUPrHl5oAHNKJwb7qyOx2
	Uh9Pmx8mzkKYnlQJdYa9P+l4xGGnnVHg9bOqwKklQCZJRXLCKW3NDH2YZm0vWRhCj/s/ZU5R5Ex
	3uAZlzCNca7W/cVI1xdSC4XEcap80dcpgfUDz2TkvHwHUSYmYCaTCq2LPljjKImSKHIWgynWz0/
	2hx7ySIgv+0sdGMKSBPNIKzC9oIVtBhEbaBs=
X-Received: by 2002:aa7:cd5b:0:b0:6b4:87b8:1348 with SMTP id
 4fb4d7f45d1cf-6b77780f23fmr1150131a12.27.1794395149944; Wed, 11 Nov 2026
 03:05:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <20261110061429.2036-2-linux.amoon@gmail.com>
 <avOL1mCkI4YSaDeO@aurel32.net> <DMRZGMGRLD4S.KT6VEU28902E@linux.spacemit.com> <avQ1kVTvdCmS1MxN@aurel32.net>
In-Reply-To: <avQ1kVTvdCmS1MxN@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 11 Nov 2026 16:35:27 +0530
X-Gm-Features: AclHuK9H8LcNFBf6OiW50_NDYDV5SRfOSw_9EFpDafFKu57Cw77PmBIsH4iiL2Y
Message-ID: <CANAwSgQgtEvgEfkBMC6meDzT4O28oEX-R16STeiUnP77UOQe_Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Anand Moon <linux.amoon@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Sebastian Reichel <sre@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_030552_637941_1B5A41C1 
X-CRM114-Status: GOOD (  34.53  )
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
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Troy. Aurelien,

Thanks for your review comments.

On Wed, 11 Nov 2026 at 14:59, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> Hi Troy,
>
> On 2026-11-11 01:16, Troy Mitchell wrote:
> > Hi Aurelien,
> >
> > On Tue Nov 10, 2026 at 9:25 PM GMT, Aurelien Jarno wrote:
> > > Hi Anand,
> > >
> > > On 2026-11-10 11:44, Anand Moon wrote:
> > >> The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> > >> to access the PMIC. However, these handlers run in an atomic notifier
> > >> context (specifically within an rcu_read_lock() critical section), while
> > >> the I2C-backed regmap uses a sleepable mutex.
> > >>
> > >> This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
> > >> context switch in the RCU read-side critical section during shutdown on the
> > >> Banana Pi BPI-F3:
> > >>
> > >> [  563.803475] WARNING: suspicious RCU usage
> > >> [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> > >> [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
> > >> ...
> > >> [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> > >> [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
> > >> [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2
> > >>
> > >> Replace the regmap operations with atomic I2C transfers to avoid sleeping
> > >> in an atomic context. Preserve unrelated register bits through
> > >> read-modify-write operations and check for atomic I2C support before
> > >> registering the handlers.
> > >>
> > >> Obtain the I2C client from the parent device and verify that the adapter
> > >> supports atomic transfers before registering the handlers.
> > >>
> > >> Tested on the Banana Pi BPI-F3 (SpacemiT K1).
> > >
> > > While the patch looks correct, I am not sure this is the correct
> > > approach, as opposed to the one proposed by Troy [1].
> > >
> > > Indeed bypassing regmap and using i2c atomic transfers needs to be done
> > > by all affected drivers. For instance the VisionFive 2 board, which use
> > > an axp15060 PMIC is also affected by this issue. And the corresponding
> > > driver is shared between architectures, which make this kind of change
> > > more difficult.
> > >
> > > For the BPI-F3, note that with OpenSBI 1.9, the reboot is handled
> > > through the SBI SRST extension, preventing this issue to happen. On the
> > > long term, I am not sure we should keep this driver.
> > >
> > That only covers restart. The SBI restart handler is registered at
> > priority 192 and runs before the P1 one at SYS_OFF_PRIO_DEFAULT. Power
> > off is the other way around: sbi_srst_power_off() goes through
> > register_platform_power_off(), i.e. SYS_OFF_PRIO_PLATFORM, so the P1
> > power-off handler still runs first and still hits this on shutdown,
> > even with OpenSBI 1.9.
> >

I had previously tested the OpenSBI P1 PMIC driver in a Yocto-based environment:

[1] https://lore.kernel.org/all/20260419150857.2705843-3-aurelien@aurel32.net/

With this driver registered in OpenSBI, Linux can delegate reboot and power-off
operations to firmware through the SBI SRST extension.

The power-off sequence is:
    Linux kernel_power_off()
      -> RISC-V machine power-off
      -> SBI SRST shutdown
      -> OpenSBI system_reset()
      -> SpacemiT P1 PMIC
      -> Power off

I have now rebuilt the Linux kernel with:

 # CONFIG_POWER_RESET_SPACEMIT_P1 is not set

Both reboot and power-off work correctly on the Banana Pi BPI-F3,
and I have not observed any issues.

alarm@k1:~$ sudo poweroff

Broadcast message from root@k1 on pts/1 (Wed 2026-11-11 10:34:03 UTC):

The system will power off now!

[ 1744.735287] systemd-shutdown[1]: Sending SIGTERM to remaining processes...
[ 1745.071304] systemd-journald[245]: Received SIGTERM from PID 1
(systemd-shutdow).
[ 1745.504595] systemd-shutdown[1]: Sending SIGKILL to remaining processes...
[ 1745.790159] systemd-shutdown[1]: Unmounting file systems.
[ 1745.822902] (sd-umount)[658]: Unmounting
'/run/credentials/systemd-journald.service'.
[ 1745.861214] (sd-remount)[659]: Remounting '/' read-only with options ''.
[ 1746.079291] EXT4-fs (mmcblk1p7): re-mounted
ccb95ca0-2804-4ade-938f-23116f90c193 ro.
[ 1746.272104] systemd-shutdown[1]: All filesystems unmounted.
[ 1746.272471] systemd-shutdown[1]: Deactivating swaps.
[ 1746.273712] systemd-shutdown[1]: All swaps deactivated.
[ 1746.273956] systemd-shutdown[1]: Detaching loop devices.
[ 1746.464867] systemd-shutdown[1]: All loop devices detached.
[ 1746.465346] systemd-shutdown[1]: Stopping MD devices.
[ 1746.471149] systemd-shutdown[1]: All MD devices stopped.
[ 1746.471417] systemd-shutdown[1]: Detaching DM devices.
[ 1746.476047] systemd-shutdown[1]: All DM devices detached.
[ 1746.476377] systemd-shutdown[1]: All filesystems, swaps, loop
devices, MD devices and DM devices detached.
[ 1746.533569] systemd-shutdown[1]: Successfully changed into root pivot.
[ 1746.533862] systemd-shutdown[1]: Entering exitrd...
[ 1746.686127] shutdown[1]: Syncing filesystems and block devices.
[ 1746.701832] shutdown[1]: Sending SIGTERM to remaining processes...
[ 1746.934370] shutdown[1]: Sending SIGKILL to remaining processes...
[ 1747.164219] shutdown[1]: Unmounting file systems.
[ 1747.203935] (sd-umoun[662]: Unmounting '/run/credentials'.
[ 1747.232643] (sd-umoun[663]: Unmounting '/oldroot/sys/kernel/config'.
[ 1747.269882] (sd-umoun[664]: Unmounting '/oldroot/sys/kernel/tracing'.
[ 1747.298218] (sd-umoun[665]: Unmounting '/oldroot/sys/kernel/debug'.
[ 1747.327488] (sd-umoun[666]: Unmounting '/oldroot/dev/hugepages'.
[ 1747.359053] (sd-umoun[667]: Unmounting '/oldroot/dev/mqueue'.
[ 1747.387798] (sd-umoun[668]: Unmounting '/oldroot/run'.
[ 1747.425939] (sd-umoun[669]: Unmounting '/oldroot/proc'.
[ 1747.473927] (sd-umoun[670]: Unmounting '/oldroot/sys/fs/bpf'.
[ 1747.527910] (sd-umoun[671]: Unmounting '/oldroot/sys/fs/pstore'.
[ 1747.588367] (sd-umoun[672]: Unmounting '/oldroot/sys/fs/cgroup'.
[ 1747.630489] (sd-umoun[673]: Unmounting '/oldroot/sys/kernel/security'.
[ 1747.664244] (sd-umoun[674]: Unmounting '/oldroot/sys'.
[ 1747.704716] (sd-umoun[675]: Unmounting '/oldroot/dev/pts'.
[ 1747.755218] (sd-umoun[676]: Unmounting '/oldroot/dev/shm'.
[ 1747.791652] (sd-umoun[677]: Unmounting '/oldroot/dev'.
[ 1747.826501] (sd-umoun[678]: Unmounting '/oldroot'.
[ 1748.451336] EXT4-fs (mmcblk1p7): unmounting filesystem
ccb95ca0-2804-4ade-938f-23116f90c193.
[ 1748.643359] shutdown[1]: All filesystems unmounted.
[ 1748.643640] shutdown[1]: Deactivating swaps.
[ 1748.644512] shutdown[1]: All swaps deactivated.
[ 1748.644722] shutdown[1]: Detaching loop devices.
[ 1748.732490] shutdown[1]: All loop devices detached.
[ 1748.732764] shutdown[1]: Stopping MD devices.
[ 1748.754002] shutdown[1]: All MD devices stopped.
[ 1748.754286] shutdown[1]: Detaching DM devices.
[ 1748.759617] shutdown[1]: All DM devices detached.
[ 1748.759885] shutdown[1]: All filesystems, swaps, loop devices, MD
devices and DM devices detached.
[ 1748.770510] shutdown[1]: Syncing filesystems and block devices.
[ 1748.791699] shutdown[1]: Powering off.
[ 1749.009246] reboot: Power down

Given that OpenSBI already handles both operations,
I agree that the Linux P1 power-off and reset driver may no longer be necessary,
at least on systems using firmware with the appropriate SBI SRST support.

> > So until this driver goes away, BPI-F3 still needs the arch fix [1]
> > for power-off.
> >
> > Link: https://lore.kernel.org/linux-riscv/20261104-v7-0-rc1-rv-dis-int-before-restart-v5-1-956ec09c900d@linux.dev/ [1]
>
> We also need a more global fix for the other boards like the VisionFive
> 2, so definitely we need the above fix instead of patching the drivers.
>
Maybe we need an opensbi driver for VisionFive 2 dev boards; any thoughts
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
