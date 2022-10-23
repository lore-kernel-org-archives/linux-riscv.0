Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16689C433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Oct 2022 20:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IE7C/GKCeWRFDmn/nmZngxwJVtwqm5Hz8QnYgZa3yvI=; b=vWZ5xWxIZ1QQae
	XUXXHLK6BQDrorNEbq39MII5I/O1t/BbQnItvlxWogml+m81Cg5Ssn8iO8uRV5jKaco+FhDA0nQH3
	ouR2xnLThlv+epKdsZv2pNCOAZefeVV4dggxSx4pk5cYWOq/HKLb+qvFku8jnq8A2GnZXnZAwrryQ
	SdCgnOg3w1vuixQ95ZoejC6kAICqnr2j+pshx9JuAD0YWxfrl7L932znJ2qXIrrWtl6BiT45/IelT
	LsZjfYiZLrI6JNCcbedXvfD4QoaLRMXn2rE0YNXYfwCsDxviA2itgVGPRTBkn2mKn40JtqHmG44x3
	1gIiW9maG9EXTxT5y/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omheP-00GCGT-3e; Sun, 23 Oct 2022 20:32:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omheE-00GCEK-FS; Sun, 23 Oct 2022 20:32:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1CADB80DBE;
	Sun, 23 Oct 2022 20:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51389C433D6;
	Sun, 23 Oct 2022 20:32:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QnB2qtO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1666557154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eCkESx7tLbcl/nHIQwtIPhMNwZ8iCRtVJZ00kAPVrdA=;
	b=QnB2qtO6lEOM4mxmjapSCxuIUb838GyXQD9dk5cHuNf7r1kHF1OS2YJOtpj4MajPA79g2y
	QGM5P4bMHnEZYNxeABp8h+OC9XW5ZhtaXOplvIwtuUPSR4RupWA3lpwNA60vNAAYYFdeXD
	J2Fu0drXLEG5BiOYGLbxOOeFisHSqfM=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 40fbc149 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sun, 23 Oct 2022 20:32:33 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chris Zankel <chris@zankel.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rich Felker <dalias@libc.org>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH v1 0/2] cleanup stackprotector canary generation
Date: Sun, 23 Oct 2022 22:32:06 +0200
Message-Id: <20221023203208.118919-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221023_133242_825123_DB742184 
X-CRM114-Status: GOOD (  12.16  )
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

Stack canary generation currently lives partially in random.h, where it
doesn't belong, and is in general a bit overcomplicated. This small
patchset fixes up both issues. I'll take these in my tree, unless
somebody else prefers to do so.

Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rich Felker <dalias@libc.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Will Deacon <will@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org

Jason A. Donenfeld (2):
  stackprotector: move CANARY_MASK and get_random_canary() into
    stackprotector.h
  stackprotector: actually use get_random_canary()

 arch/arm/include/asm/stackprotector.h     |  9 +--------
 arch/arm64/include/asm/stackprotector.h   |  9 +--------
 arch/csky/include/asm/stackprotector.h    | 10 +---------
 arch/mips/include/asm/stackprotector.h    |  9 +--------
 arch/powerpc/include/asm/stackprotector.h | 10 +---------
 arch/riscv/include/asm/stackprotector.h   | 10 +---------
 arch/sh/include/asm/stackprotector.h      | 10 +---------
 arch/x86/include/asm/stackprotector.h     | 14 +-------------
 arch/x86/kernel/cpu/common.c              |  2 +-
 arch/x86/kernel/setup_percpu.c            |  2 +-
 arch/x86/kernel/smpboot.c                 |  2 +-
 arch/x86/xen/enlighten_pv.c               |  2 +-
 arch/xtensa/include/asm/stackprotector.h  |  7 +------
 include/linux/random.h                    | 19 -------------------
 include/linux/stackprotector.h            | 19 +++++++++++++++++++
 kernel/fork.c                             |  2 +-
 16 files changed, 33 insertions(+), 103 deletions(-)

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
