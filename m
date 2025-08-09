Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16A2C87FCF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Aug 2025 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IGeSuYHSlIaPLH4HgaOqXF9p7vfPQg127nCeK5IcZA=; b=NJJVhMyTMvYJHq
	KyQ9fixI0VJBxR6rlCxf1PKExm4n2E5+kwZwg8onTYaEpHBoX6GqiMhIFBOqy/IGqjPcEsPiQbvMA
	OuULTeKvb7KODR7ZhNGwPHKm6LG0ilWHo46Nc15jfo0+oKxM77zWUPzMTNkblOn6Kr/kacN7M1OYx
	j8Vzxq4oTgo6aOoWGhDKBGFoyFxRl5BT4Br0Vg2QHgQrKJlFn2MoU9H1graFL6yPZsImltxH4RSWe
	/WlgdBgYJCkCajgH/x+qgJi91jiwSycHNj8HyZYKeOkfDUxFmaTsXKwamTyEsMAAaUH+K3aGO2Lh5
	VOPWrP7KkF0UjT7vEokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukrn1-000000050KR-3vUS;
	Sat, 09 Aug 2025 22:11:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukr2e-00000004woL-15Ih
	for linux-riscv@lists.infradead.org;
	Sat, 09 Aug 2025 21:23:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 94D1161428;
	Sat,  9 Aug 2025 21:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F353C4CEE7;
	Sat,  9 Aug 2025 21:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754774631;
	bh=tEOcjJ/fH84hDn8E2XVzszjzCXCoN+CRVRYBfzYq+c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iKELzsPLgidJNvgkVjFRsid0NOn08Y7c3T6DfPB+VV99iGz+UZqOdDK2wU7oOuNgp
	 pUBYeUJMgK1hjSTgPH4JHmNg8zWPoe+o5S1BUzezuatSQ7hI0fiO+8PlKj+kse75vG
	 sbW1WJHb9+is5PdVu/8W+t+WQexONnTka5YVz9gRA3njBDnYJfInyx1wyaG9ClAilF
	 D4EH1X3kStninZOY9CVpjuJO7bPZFe2kGyadNBTJt6Ua+S8OQZzkJA7xVLUYLDDo7o
	 xhs6M+fPTMX8DHCBW7L8S/0gEKt5TpBUHH2S+Shv1hQgePYJ606qt834IB5mQ7tntk
	 x9A75XIn5XWFA==
Date: Sat, 9 Aug 2025 14:23:49 -0700
From: Drew Fustini <fustini@kernel.org>
To: Florian Weimer <fweimer@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@tenstorrent.com>
Subject: Re: [PATCH v2] riscv: Add sysctl to control discard of vstate during
 syscall
Message-ID: <aJe8ZW5LEtBK7Jmj@x1>
References: <20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org>
 <lhuo6so7ur5.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <lhuo6so7ur5.fsf@oldenburg.str.redhat.com>
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

On Sat, Aug 09, 2025 at 10:40:46AM +0200, Florian Weimer wrote:
> * Drew Fustini:
> 
> > From: Drew Fustini <dfustini@tenstorrent.com>
> >
> > Clobbering the vector registers can significantly increase system call
> > latency for some implementations. To mitigate this performance impact, a
> > sysctl knob is provided that controls whether the vector state is
> > discarded in the syscall path:
> >
> > /proc/sys/abi/riscv_v_vstate_discard
> >
> > Valid values are:
> >
> > 0: Vector state is not always clobbered in all syscalls
> > 1: Mandatory clobbering of vector state in all syscalls
> >
> > The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
> 
> Can this be put into the system call number instead, or make it specific
> to some system calls in other ways?

Do you mean the control the initial state of the sysctl, or not having a
sysctl for discard behavior at all?

> I think C libraries can use this optimization for their system calls
> (after adjusting the assembler clobbers) because the vector state is
> caller-saved in the standard calling convention.  But there is backwards
> compatibility impact for turning this on for the entire process.

The focus I have right now is allowing users to avoid the delay in
syscall entry on implementations where clobbering is slow. Palmer had
mentioned in my v1 [1] that he has 'a patch out for GCC that enables a
system-wide vector ABI, but I don't have time to test/benchmark it so 
it's kind of hard to justify'. It seems like creating a new ABI where
the vector registers are preserved across syscalls could be useful, but
I think it would be best to handle that possiblity later on.

Thanks,
Drew

[1] https://lore.kernel.org/linux-riscv/mhng-E49DDC7D-A330-4626-A122-4146AADDBB33@Palmers-Mini.rwc.dabbelt.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
