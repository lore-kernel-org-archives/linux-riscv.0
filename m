Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1609EC25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 May 2024 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLrgxsBsPWy/VT9dy8dOOttQkQx5b21ix5AGBSaRKzw=; b=DQU7+nxusQOLEJ
	2ymfGfgt+tobq8zOCKOR+/Xt1zRMkw9/fCDu44h69+5JnHtV+82avHij3ZbdxeUBTXDuwlDTGfzxp
	tTEhlRffDBUGRO2zDZb0P9Vggn0VMXUss81cSeIL2fOUISfpHyw8cm3bh6xeqOCijDNWMRanjGxUF
	jLhBBZ9w2xnhr4P8xiwAa3L9VLbEeuD+W59tDlS8P8vLkjSU8wAQUzxUIKtg5xUcjcwZjeS5q0Bxp
	F3SjcQDtQfhAThQpBbIl8jUn6NajAdyqAXMvvnmu2CPCV4XULiD2x8cP9ToX4MAGtlc+gfjIY9ll6
	61zTSDT1XDcMqH7ucL1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Qum-0000000CCCh-40UZ;
	Mon, 13 May 2024 08:20:08 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Quh-0000000CCAM-1wq9
	for linux-riscv@lists.infradead.org;
	Mon, 13 May 2024 08:20:06 +0000
Date: Mon, 13 May 2024 10:19:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715588397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1CSO8AntgK1+wkQW/DYUySxa8KRAmgdIAEt//qEydds=;
	b=TFXK6IRsRUOXXYBIoE21++iOaAF33lC4RfJGuoBu1KmSCqFH7sD2TWJGmwY1tNpJwRgB7W
	3l0IoErHM+dWkh4NxdOD7Rv0/cZ0R11EAqeQZVo9CMOX60mB74Pr5d5962PViQjpxCwCW8
	MpgJYXLQjd5BoQ5ZcDn2Rv/D+1aoQpESzODmpN40LpnE8SZdsDXJcT4XRITYEA9E4ikfEx
	wztlFEh7CYTZJoFOjp49ciRZ13T1buU4eJrCXAIycSFVrjJR+GbAKqkVZDgJJGYwAZP2+E
	OawjyrS0x14DL1Xuia80NgISDpJooSRkloHIH0chAlSvE6csXnFwxYz+5GviZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715588397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1CSO8AntgK1+wkQW/DYUySxa8KRAmgdIAEt//qEydds=;
	b=pIDVAX6sYRky2x2n9kvHBw6ETSmFLn3+1yZEp/OZ8W6NIhOaUg1qW3KEOcavnP8ctqNKpT
	9pTggII6nv5O+vAg==
From: Nam Cao <namcao@linutronix.de>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] remove size limit on XIP kernel
Message-ID: <20240513081941.A_sou6Zn@linutronix.de>
References: <cover.1715286093.git.namcao@linutronix.de>
 <46c70799-87b1-4478-95bb-4d4c90519f5b@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46c70799-87b1-4478-95bb-4d4c90519f5b@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_012003_672705_2C69FE0D 
X-CRM114-Status: GOOD (  15.11  )
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

On Sun, May 12, 2024 at 05:47:24PM +0200, Alexandre Ghiti wrote:
> XIP kernels are intended for use with flash devices so the XIP_OFFSET
> restriction actually represents the size of the flash device: IIRC this 32MB
> was chosen because it would fit "most devices". I think it would be good to
> come up with a mechanism that allows to restrict the size at build time: a
> config? XIP kernels are custom kernels so the user could enter its flash
> size so that if kernel ends up being too large, it fails. And by default, we
> could a very large size to avoid kernel test robot build failures.

I'm not sure if it is beneficial to do that. Users' flash tool would
complain about the kernel not fitting in flash anyway. I think this would
only make it (a bit more) complicated to build the kernel.

Furthermore XIP_OFFSET at the moment is not the flash size, it is size of
.text (and some other read-only sections). Kernel's data sections are in
flash too, which is copied to RAM during boot.

With the current linker setting, the first 32MB of virtual memory is
occupied by .text. Then at 32MB offset, .data section starts. So if
XIP_OFFSET limit is exceeded, the kernel's size is already way more than
32MB.

Instead, this series moves .data and .text right next to each other (well,
almost, because we need PMD_SIZE alignment). So that if .text size exceed
32MB, the offset that .data resides would increase as well.

If we really want to set flash size during build time (which, again, I
doubt the benefit of), this series would still be relevant: it is not just
removing the size limit, it is also removing the fixed position of the
.data section in virtual address space (in other words, removing the
useless "hole" between .text section and .data section).

Best regards,
Nam


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
