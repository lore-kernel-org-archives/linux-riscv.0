Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A949CCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:cc:Subject:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hdb+r9bGsYsJK6if6jZDTWBLdeLCR89GJeswUt28ya4=; b=MpW9uF0/MADIrv
	5td7Rd9IiYWMBeujIBEsAsABYxK5BEP+o1f0UmerziKTa41f8izpFkQ3eFu44fik+YEjrMiG+8xPc
	km8OOgc3ux4EZ/HIlBEA/I3niixX5iEtg6ZnZBRIruLtwVtlpNdYIxjorM/IoRTexbqbFJe0VswOd
	duw9rzjRES2u6RFr2aK8iJgwYMtvxioramqOfGRpOUcA//dp11HKy6+HWQijIGb0xXipAGHBGaMjg
	wKVxpQZVKvDv6niOPXKWEez3ItQFl7c5r/UCGVi/qh99U8/Xx+DM0CuBsMmZkGdPXytA8oDdStAUm
	EhUtjRvZ5B7StJ/Wd3cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpS-0000000DNz5-0R8o;
	Mon, 27 Oct 2025 08:43:50 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpO-0000000DNtW-2NY1;
	Mon, 27 Oct 2025 08:43:47 +0000
Message-ID: <20251027083700.573016505@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=O22qaF58WF4tGgLoC6Og2ju8TL8XuvxgR3eoZKY2RJA=;
	b=iGpxBn9D31bepoX3FHP5IxFfDs5MNFXXJwqX00s5HifGOgVtnQBNtWlVQO67EBAqw5ZFNe
	jRyhkjcwumS8f4M4armAfDMf932m5kwZLGz6oowakDMrVHJzvvvwd/9RAPtBfWlGzRmEse
	gHNEi72Bj3wWNLUru0yqQR3WMCgyxQGzZOpZ2j0tRwHdogz/sx2wcjKo4NQKBCDIH+c7Dv
	M6bQlHP37PdBS0lJ7hmjRWkogKwMpxS9DNSPeAtvFcyeKirRANDrLqkiZGQwvhNKRe5C7H
	xZdPWOc+g630w3DfFMU/UvoidKO3Wl22xCGwvhnz3O9xIynKtbYCK7vgdMHxyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=O22qaF58WF4tGgLoC6Og2ju8TL8XuvxgR3eoZKY2RJA=;
	b=dGRlxXc7DXj9/3iHmX+iKPKx+vPqnQiXifrAOlfFvv9S86+GVFnxrCPovoOdbKKfgVviBe
	Sc3dSh9pQ+LjAIDg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V5 00/12] uaccess: Provide and use scopes for user access
cc: kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Date: Mon, 27 Oct 2025 09:43:40 +0100 (CET)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014346_765101_72CEB83E 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This is a follow up on the V4 feedback:

   https://lore.kernel.org/20251022102427.400699796@linutronix.de

Changes vs. V4:

  - Rename get/put_user_masked() to get/put_user_inline()

  - Remove the futex helpers. Keep the inline get/put for now as it needs
    more testing whether they are really valuable.

  - Picked up tags

The series is based on v6.18-rc1 and also available from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git uaccess/scoped

Thanks,

	tglx
---
Thomas Gleixner (12):
      ARM: uaccess: Implement missing __get_user_asm_dword()
      uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
      x86/uaccess: Use unsafe wrappers for ASM GOTO
      powerpc/uaccess: Use unsafe wrappers for ASM GOTO
      riscv/uaccess: Use unsafe wrappers for ASM GOTO
      s390/uaccess: Use unsafe wrappers for ASM GOTO
      uaccess: Provide scoped user access regions
      uaccess: Provide put/get_user_inline()
      coccinelle: misc: Add scoped_masked_$MODE_access() checker script
      futex: Convert to get/put_user_inline()
      x86/futex: Convert to scoped user access
      select: Convert to scoped user access

 arch/arm/include/asm/uaccess.h               |   26 ++
 arch/powerpc/include/asm/uaccess.h           |    8 
 arch/riscv/include/asm/uaccess.h             |    8 
 arch/s390/include/asm/uaccess.h              |    4 
 arch/x86/include/asm/futex.h                 |   75 ++----
 arch/x86/include/asm/uaccess.h               |   12 -
 fs/select.c                                  |   12 -
 include/linux/uaccess.h                      |  314 ++++++++++++++++++++++++++-
 kernel/futex/core.c                          |    4 
 kernel/futex/futex.h                         |   58 ----
 scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++
 11 files changed, 501 insertions(+), 128 deletions(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
