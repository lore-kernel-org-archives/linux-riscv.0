Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D9BFDEE4D
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2026 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xMFo3uNo4bifkrL1AVIkrk/heFrS3PBnZ6N2oX3AQkY=; b=XXFhjujibsv7Ed
	aYiUd9QzQEVP99isyY1K9+LzFWlgDtNKELJ9ZsQTZol1UgxQZs9iqeQEF1s971zjk0sgwToWp7zlQ
	bRXvXDzsrd2GPuqI2S8ATgKddLZflSl+KxNygJTB7301ekuWdPNuZorhaS6939kPA5DHIvi0yLKSy
	hnIlzew0eT5CvwN+eG5OuvSNz3TtV0Fkb//q8EyGvJBrUqzBND5pOMZDXNW4NNvVoKCtmOTqTQpE8
	2mblPTBJtIA33lrUtXaVSgtnsbXqzGWMh9h1aSvO9SbpzrKm9qxmrmFsOZHCQ6EM22UcOy7sp4bIK
	HWPFEdI9OkPa3alANPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG0zU-0000000CITm-0LSX;
	Thu, 23 Apr 2026 20:49:40 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG0zQ-0000000CISw-1xmd
	for linux-riscv@lists.infradead.org;
	Thu, 23 Apr 2026 20:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=I7X6zJHC5DYuCh8sgrWG+KoRBJR5g583wwIpVUm7vX4=; b=ZkYgsfYER5/VHsabiDSp6NdOU0
	t0QV1P3f3v9LK1vWOTSS4iGK4DAzyu8Cctel6DpwCtfgi6ecB4WMisVN8NOkXQTe0Oh/U0HqeHxtA
	+zLSSH25c/KR2CCdC5GcnWywLs16uxfc8BvT3U4GxLc7VIH4gut2vRi5reNlE+Wwskn058O7CTn96
	MuDit29eVd1BQiVRU8lKZX1xy1JqrLe9K0Izc23oHYwJdvUmlu705+NDfaZasJiP2qA27srQfSmBA
	U807XHKvD125OlbHnO9tuDrvIX9nckIe+yMLpo2hXEnxFG3AJkaoEEQAZuDtfXcCj/p0nG2tDZLyW
	yoGLsQrQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wG0zC-00000000Mzz-1UXg;
	Thu, 23 Apr 2026 22:49:22 +0200
Date: Thu, 23 Apr 2026 22:49:20 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Troy Mitchell <troy.mitchell@linux.dev>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] riscv: disable local interrupts and stop other CPUs
 before restart
Message-ID: <aeqF0EiP4b2Ycj2G@aurel32.net>
Mail-Followup-To: Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260311-v7-0-rc1-rv-dis-int-before-restart-v1-1-bc46b4351cac@linux.dev>
 <f9079774-1d16-4b84-bf85-bc8444e93446@iscas.ac.cn>
 <DH40Z14EHV40.1I443BTRU720F@linux.dev>
 <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1f466f8-4e76-43a2-a7a2-126415fd1f56@sifive.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_134936_539329_B95C0EAA 
X-CRM114-Status: GOOD (  15.30  )
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

Hi,

On 2026-03-16 08:19, Samuel Holland wrote:
> Hi Troy,
> 
> On 2026-03-16 2:23 AM, Troy Mitchell wrote:
> >> I think the reason we ended up with the "unsafe" implementations of the
> >> reboot/shutdown functions is that on the backend it is usually SBI SRST
> >> calls, which can protect itself from other CPUs and interrupts. Since on
> >> K1 we're going to be poking I2C directly, we run into the problem
> >> described above. So all of these should disable interrupts and stop
> >> other CPUs before calling the handlers, and can't assume the handlers
> >> are all SBI SRST.
> > Yes, we cannot assume that all platforms rely on this.
> 
> Why isn't K1 using the SBI SRST extension? Resetting the platform from S-mode
> directly causes problems if you ever want to run another supervisor domain (for
> example a TEE or EFI runtime services), which may need to clean up before a
> system reset.
> 
> As you mention, other platforms use the standard SBI SRST interface, event if
> they need to poke a PMIC to perform a system reset. Is there something
> preventing K1 from following this path?

I went this path and submitted a patchset to OpenSBI mailing list doing 
that:
https://lore.kernel.org/opensbi/20260419150857.2705843-1-aurelien@aurel32.net/T/#t

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
