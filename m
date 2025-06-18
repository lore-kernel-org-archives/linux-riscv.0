Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121AAC7115D
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 12:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:
	Subject:From:cc:To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RDE2AtgLZiFrmWUDkJyKrcynb09kL4HINxbe7/zudUs=; b=MnNNds/FZmo436
	FHVwg+nPTVtP842EHvcUfeagNUyQpzDu0WWLPTCno71qFSDCywmGZgqhEzn+1G2LAF2MfULKpLg8t
	bIn4Tj3qI1hjjdbEV1xaE9aA66XDuhNZ8R9NBAwtsPqnLg9rG4/sgyi6ehclhhatMByPVp9/V/yO8
	aITAOT2FkBn3BpFfBudzr6DBcPmaZn+hkVMBjwljKncf1LetX1/VtLc/K9y+K0iWmkfHY9nMx8IgW
	DJjXZB9gGuQ6umrh0sI4pVrhukE0C9uKo1meonXhxxdJ4CSTsTzpiPyCMPGR6vldKHKeATnXqwnag
	kH1MjWRHFv3QfxzPUSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsNs-0000000ACwH-2wmX;
	Wed, 18 Jun 2025 12:59:20 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqge-00000009tPx-1O5I
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Message-ID:Date:Subject:Reply-To:
	From:cc:To:Sender:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GFVJwktuxpkRDvLIb8jZl5z0PhGj4POY3csp1DDe88M=; t=1750245034; x=1751109034; 
	b=goliRmJ2E5RLqUrm0yfOyymEp7pSjBUQTqLY+cu/x4NAbfaLhqUceB7cyruqAu16SmgRovQW7fz
	ZSzTLcPD+hAVZHdqVdkihjJpsVWRezkEcilaxZb3swzNX3uJ2nqXYimObpEn2mVzknUPS5mYQKRqn
	J9Xr6VntPMb7Hq13FNAAPXrtS3vCRIIN5cDGmurQcwt8/JUtGsUHfkOOy7Ogh8xxvl71AQj70jKW0
	E/9FkRP/M1+rJAB2mghZ7qizJNgFsnscg3zRZIIvBPpFj+uYFALS3u8fRGHC6rHl8ah3ry8oyop4c
	DlKHXLeUYy+7KidgQNWyb27qtziMEuC9/FFA==;
Received: from c-71-235-5-26.hsd1.ma.comcast.net ([71.235.5.26] helo=crash.local)
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rtm@csail.mit.edu>)
	id 1uRqgX-006fPi-IL;
	Wed, 18 Jun 2025 07:10:29 -0400
Received: from localhost (localhost [127.0.0.1])
	by crash.local (Postfix) with ESMTP id CCC4223DEF8E;
	Wed, 18 Jun 2025 07:10:28 -0400 (EDT)
To: Paul Walmsley <paul.walmsley@sifive.com>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
cc: linux-riscv@lists.infradead.org
From: rtm@csail.mit.edu
Subject: futex(0x1ffffff81300000) on risc-v -> mm panic
Date: Wed, 18 Jun 2025 07:10:28 -0400
Message-ID: <77605.1750245028@localhost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_041036_583212_4EC633D6 
X-CRM114-Status: UNSURE (   5.35  )
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
Reply-To: rtm@csail.mit.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This program on risc-v:

main(){
  futex((void*) 0x1ffffff81300000, FUTEX_WAIT, 0, 0, 0, 0);
}

results in:

BUG: Bad page state in process a.out  pfn:81500
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x81500
flags: 0x2000(reserved|zone=0)
raw: 0000000000002000 ff1c000000054008 ff1c000000054008 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
Modules linked in:
CPU: 0 UID: 0 PID: 105 Comm: a.out Not tainted 6.16.0-rc2-00067-gb61aa0e0059b #566 NONE 
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffff80025b62>] dump_backtrace+0x1c/0x24
[<ffffffff800023b8>] show_stack+0x28/0x34
[<ffffffff800205d2>] dump_stack_lvl+0x48/0x66
[<ffffffff80020604>] dump_stack+0x14/0x1c
[<ffffffff80262098>] bad_page+0x118/0x15c
[<ffffffff80264e96>] __free_frozen_pages+0x494/0x650
[<ffffffff80266fe2>] free_frozen_pages+0xe/0x16
[<ffffffff8020926c>] __folio_put+0x60/0xae
[<ffffffff800ec23a>] get_futex_key+0x2da/0x44e
[<ffffffff800f0474>] futex_wait_setup+0x52/0x23a
[<ffffffff800f06da>] __futex_wait+0x7e/0xd8
[<ffffffff800f0782>] futex_wait+0x4e/0xbc
[<ffffffff800ed3a0>] do_futex+0x74/0x100
[<ffffffff800ed4f4>] __riscv_sys_futex+0xc8/0x148
[<ffffffff811e4930>] do_trap_ecall_u+0x84/0x11a
[<ffffffff811f0b0e>] handle_exception+0x146/0x152
Disabling lock debugging due to kernel taint

and after running this program a few more times:

page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x81500
flags: 0x2000(reserved|zone=0)
raw: 0000000000002000 ff1c000000054008 ff1c000000054008 0000000000000000
raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: VM_BUG_ON_PAGE(page_ref_count(page) == 0)
------------[ cut here ]------------
kernel BUG at ./include/linux/mm.h:1034!
Kernel BUG [#1]
Modules linked in:
CPU: 0 UID: 0 PID: 110 Comm: a.out Tainted: G    B               6.16.0-rc2-00067-gb61aa0e0059b #566 NONE 
Tainted: [B]=BAD_PAGE
Hardware name: riscv-virtio,qemu (DT)
epc : get_futex_key+0x23c/0x44e
 ra : get_futex_key+0x23c/0x44e
...
[<ffffffff800ec19c>] get_futex_key+0x23c/0x44e
[<ffffffff800f0474>] futex_wait_setup+0x52/0x23a
[<ffffffff800f06da>] __futex_wait+0x7e/0xd8
[<ffffffff800f0782>] futex_wait+0x4e/0xbc
[<ffffffff800ed3a0>] do_futex+0x74/0x100
[<ffffffff800ed4f4>] __riscv_sys_futex+0xc8/0x148
[<ffffffff811e4930>] do_trap_ecall_u+0x84/0x11a
[<ffffffff811f0b0e>] handle_exception+0x146/0x152
Code: bdad a597 017c 8593 fa65 8526 7097 0014 80e7 a4a0 (9002) 8785 
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Fatal exception in interrupt

get_futex_key() calls get_user_pages_fast(), which returns a
PG_reserved page in one of the reserve_bootmem_region() areas. Beyond
that I do not understand the situation.

Robert Morris
rtm@mit.edu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
