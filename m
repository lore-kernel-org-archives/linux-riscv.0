Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8063CCD185
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 22:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJL1wc9jVDGl5miDEvfF5uojdB8T2yJMPNoEMpcA8kk=; b=31ZxVl2tIogWb0
	yzd/jQTycGfLM8L3u33aAujCXgF8pHpH2iknkfkWXt1Go/TpMgn3QjNqVMAeRjLdUNrUDIse558m/
	XV5FiBU7GvfTgZ2azHNjokmNJYsq3FtanP/nHOsgrHPn4fbN5PD7fM0wRhRzKeDG1bQst9VxBy87T
	6BlRLGRBK6rBR2+iN/C547+vuwqc82tEf69HwlATLpDT92X6+fDmY6DGifsu8b/xb6XGrrnRKjgc/
	phXiuPHMX6x/5YecetuunqjtrkKYE1AgRPwvQ2fhImn6gRaj2L6wxgmWVi5gXHwRytDqKIA9AUGM7
	O2Kdi4WGd4zALCVCerlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7LDD-00000009Rux-0S0n;
	Fri, 10 Oct 2025 22:03:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7LDB-00000009Ruq-3qoR
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 22:03:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B04660316;
	Fri, 10 Oct 2025 22:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1628C4CEF1;
	Fri, 10 Oct 2025 22:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760133820;
	bh=TgFISJ1MZntMoH1hi5iZjxgC0obKR62dALr/6ANzGz8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=McUYnzHj2bdZ8y1YZNNvSmJSFS40sFQs0Ik94NPOkd3bzJ8THdtNU0tyOK4sPvOY2
	 t2L5HBAdVvB62+UyF+GoepTKtMUUlCcHRtFvrzXjyXAOVlYZeQ8zt0dhCYoj8L/iRq
	 JuTX3r8r61fEGs20wqnOXFBIj9ovLRyInJzCcZWKKUmjQwfOQlwePxNhtaPsp/8jrE
	 VkB8T2vlytRiMdq0kZokU0Gp282qC6IzkPDrMKo+aPanLraEQI951P1pzT/QVIGgT2
	 0UPwVcHzGiACFheo3XEsL9YD6LThSk5U979uowcFQ6ozVq+KGrgbdmOd9qp3AfYUUx
	 cJY4AuVYgYBDw==
Date: Fri, 10 Oct 2025 16:03:36 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nam Cao <namcao@linutronix.de>
cc: Thomas Huth <thuth@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: Add kprobes KUnit test
In-Reply-To: <87v7l17e8g.fsf@yellow.woof>
Message-ID: <e905cf0e-3ac3-46b3-5f9e-1356f8d2a222@kernel.org>
References: <20250513151631.3520793-1-namcao@linutronix.de> <16b74b63-f223-4f0b-b6e5-31cea5e620b4@redhat.com> <87frc9h0lo.fsf@yellow.woof> <87v7l17e8g.fsf@yellow.woof>
MIME-Version: 1.0
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

On Mon, 29 Sep 2025, Nam Cao wrote:

> Nam Cao <namcao@linutronix.de> writes:
> > Thomas Huth <thuth@redhat.com> writes:
> >> Could you maybe change that into "__ASSEMBLER__" instead of "__ASSEMBLY__" ? 
> >> I'm currently trying to get rid of the latter in the kernel sources, see: 
> >> https://lore.kernel.org/all/20250606070952.498274-1-thuth@redhat.com/
> >
> > It's been applied, it's up to riscv's maintainers how we should do this.
> >
> > I can send v3, or a follow-up patch.
> >
> > Or riscv maintainers can also squash that change into this patch, or
> > into your patch.
> >
> > I'm fine with any options.
> 
> Riscv pull request is already created. A follow-up patch it is then.

I've queued the following for v6.18-rc. 

Thomas: have you considered updating checkpatch to scan for instances of 
__ASSEMBLY__?  Might preempt these sorts of manual fixes going forward.


- Paul

From: Paul Walmsley <pjw@kernel.org>
Date: Fri, 10 Oct 2025 15:50:24 -0600
Subject: [PATCH] riscv: kprobes: convert one final __ASSEMBLY__ to
 __ASSEMBLER__

Per the reasoning in commit f811f58597ac ("riscv: Replace __ASSEMBLY__
with __ASSEMBLER__ in non-uapi headers"), convert one last remaining
instance of __ASSEMBLY__ in the arch/riscv kprobes code.  This entered
the tree from patches that were sent before Thomas' changes; and when
I reviewed the kprobes patches before queuing them, I missed this
instance.

Cc: Nam Cao <namcao@linutronix.dev>
Cc: Thomas Huth <thuth@redhat.com>
Link: https://lore.kernel.org/linux-riscv/16b74b63-f223-4f0b-b6e5-31cea5e620b4@redhat.com/
Link: https://lore.kernel.org/linux-riscv/20250606070952.498274-1-thuth@redhat.com/
Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/kernel/tests/kprobes/test-kprobes.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
index 3886ab491ecb..537f44aa9d3f 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.h
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
@@ -11,7 +11,7 @@
 #define KPROBE_TEST_MAGIC_LOWER    0x0000babe
 #define KPROBE_TEST_MAGIC_UPPER    0xcafe0000
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* array of addresses to install kprobes */
 extern void *test_kprobes_addresses[];
@@ -19,6 +19,6 @@ extern void *test_kprobes_addresses[];
 /* array of functions that return KPROBE_TEST_MAGIC */
 extern long (*test_kprobes_functions[])(void);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* TEST_KPROBES_H */
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
