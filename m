Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777B7C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 14:06:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45C4D20855
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 14:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RqbrvVQD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45C4D20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TE1aQj2mmi4zKYlNR/m1/mp05qJw/j3jicdxCbkcr3U=; b=RqbrvVQDwiMhby
	8nTevFDaDb8bSr935FdnH+B/jd1GNUNMMKwSaB1F3AybZY1ClLbTkJ7M9aoo6WNWeEJUKacgJIvKD
	EOF1BlYbG9uR8GVnaIAgQ+vGLVLYhIH6JejAy/t5Gxgwgm2LIuwxFNMmvq5rGdh0J81TAL8HJCGQy
	JDLtMBNdfbtQ06v1tkYJ+TdhuQQfYY7dx2HKVItoIgQ3pGRGcRswQGIHKSDrbY+9c0Ojo7ieqptI7
	hwqX1yyIYVU4AUk508GKOjJmvoNAhX5O5Zu2N/jAJB6V82aKUNGm5x8rWRRMiTv2LYbEO89u5/rTB
	ho8mrhw7IZvPsjW2Hi/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWMCK-0007nF-P4; Mon, 10 Dec 2018 14:06:12 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWMCG-0007mT-Kc
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 14:06:10 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BC76AACAB
 for <linux-riscv@lists.infradead.org>; Mon, 10 Dec 2018 14:05:56 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: BUG: Bad page map
X-Yow: Can you MAIL a BEAN CAKE?
Date: Mon, 10 Dec 2018 15:05:56 +0100
Message-ID: <mvmd0q9bhob.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_060608_997683_89BD4454 
X-CRM114-Status: UNSURE (   4.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This looks like a serious bug, especially without any swap defined.

swap_info_get: Bad swap file entry 4000000000ec9611
BUG: Bad page map in process struct-ret-3.ex  pte:764b08c0 pmd:6e2fac01
addr:00000000aa2a0c10 vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3ffffe4
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Not tainted 4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
Disabling lock debugging due to kernel taint
swap_info_get: Bad swap file entry 4000000000d38671
BUG: Bad page map in process struct-ret-3.ex  pte:69c338c0 pmd:6e2fac01
addr:00000000368d7802 vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3ffffe5
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
swap_info_get: Bad swap file entry 4000000000f82139
BUG: Bad page map in process struct-ret-3.ex  pte:7c109cc0 pmd:6e2fac01
addr:000000005d95fff2 vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3ffffe6
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
swap_info_get: Bad swap file entry 4000000000fef7d9
BUG: Bad page map in process struct-ret-3.ex  pte:7f7becc0 pmd:6e2fac01
addr:000000001eee406f vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3ffffe7
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
swap_info_get: Bad swap file entry 40000000012cd199
BUG: Bad page map in process struct-ret-3.ex  pte:9668ccc0 pmd:6e2fac01
addr:000000007af7568b vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3ffffec
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
swap_info_get: Bad swap file entry 400000000122f109
BUG: Bad page map in process struct-ret-3.ex  pte:917884c0 pmd:6e2fac01
addr:00000000fb140cbb vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3ffffed
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
swap_info_get: Bad swap file entry 400000000126d2e1
BUG: Bad page map in process struct-ret-3.ex  pte:936970c0 pmd:6e2fac01
addr:0000000096011bef vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3ffffee
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
swap_info_get: Bad swap file entry 4000000000f23849
BUG: Bad page map in process struct-ret-3.ex  pte:791c24c0 pmd:6e2fac01
addr:000000006948a5ce vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3ffffef
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
swap_info_get: Bad swap file entry 400000000134adf9
BUG: Bad page map in process struct-ret-3.ex  pte:9a56fcc0 pmd:6e2fac01
addr:00000000667b031e vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3fffff4
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
swap_info_get: Bad swap file entry 4000000000fc0fe9
BUG: Bad page map in process struct-ret-3.ex  pte:7e07f4c0 pmd:6e2fac01
addr:000000006fc86206 vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3fffff5
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
swap_info_get: Bad swap file entry 4000000000f484b1
BUG: Bad page map in process struct-ret-3.ex  pte:7a4258c0 pmd:6e2fac01
addr:00000000807001b4 vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3fffff6
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
swap_info_get: Bad swap file entry 4000000000fcdfd1
BUG: Bad page map in process struct-ret-3.ex  pte:7e6fe8c0 pmd:6e2fac01
addr:000000000ac58442 vm_flags:00100173 anon_vma:00000000dc561e1a mapping:          (null) index:3fffff7
file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
CPU: 2 PID: 13693 Comm: struct-ret-3.ex Tainted: G    B             4.20.0-rc5-00011-g3b8e7421e0 #44
Call Trace:
[<ffffffe000f2ac9c>] walk_stackframe+0x0/0xa4
[<ffffffe000f2ae9c>] show_stack+0x2a/0x34
[<ffffffe00146541e>] dump_stack+0x62/0x7c
[<ffffffe000ffe97a>] print_bad_pte+0x146/0x18e
[<ffffffe000fff6d4>] unmap_page_range+0x2d2/0x5ea
[<ffffffe000fffa1a>] unmap_single_vma+0x2e/0x40
[<ffffffe000fffb50>] unmap_vmas+0x42/0x7a
[<ffffffe001005a9e>] exit_mmap+0x7e/0x106
[<ffffffe000f2d8c8>] mmput.part.3+0x26/0xa4
[<ffffffe000f2d966>] mmput+0x20/0x28
[<ffffffe000f32232>] do_exit+0x23c/0x826
[<ffffffe000f32876>] do_group_exit+0x2a/0x82
[<ffffffe000f328e6>] __wake_up_parent+0x0/0x22
[<ffffffe000f29bd6>] ret_from_syscall+0x0/0xe
BUG: Bad rss-counter state mm:00000000e8bbd9eb idx:1 val:12
BUG: Bad rss-counter state mm:00000000e8bbd9eb idx:2 val:-12

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
