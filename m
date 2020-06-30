Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96903C433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:03:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64D8F2068F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I5aQSMC5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64D8F2068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EEQRus9tHDTE9rYUs5UAs2/nsP+6U/HWF0PvH5kne94=; b=I5aQSMC5D5fVFdpFI9zs3iRCl
	XmjYlEB8YnrrSixk4XABbH4R/TH79/KPwvdR2c0+ZBb/wzgISo3gdRamaNGDlUZQjWApLMHG1iu4z
	rVmPos4Th+7+C7bB3MUy1kL1Xqr+wiAQG6Rofnf1eenaEZf6sWk+1XN5SCca4HX+Kd6vS809jDp1a
	d7gPUqg2Jbd9ELLwmlOa4AKdqHpZGIQ2EvLyDvtc0fx2pRZv1/xcjkllkbWT56h5FLxkfp+gcUmqh
	PTVvnmrWcyYWy+x44vW7WPjErAltgyj2bkxdQOwWB5A88QPiwX+r1xLrUUlhAeV9tav6FmZp5yivt
	dQFOi0C/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqFvS-0000zF-1Z; Tue, 30 Jun 2020 13:03:50 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqFvP-0000yk-Tq
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:03:48 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08DD7AC50;
 Tue, 30 Jun 2020 13:03:47 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: syzkaller on risc-v
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
X-Yow: ...Just enough time to do my LIBERACE impression...
Date: Tue, 30 Jun 2020 15:03:46 +0200
In-Reply-To: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 (Dmitry Vyukov's message of "Tue, 30 Jun 2020 14:48:31 +0200")
Message-ID: <mvmpn9gn1sd.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Jun 30 2020, Dmitry Vyukov wrote:

> I would assume some stack overflows can happen without KCOV as well.

Yes, I see stack overflows quite a lot, like this:

[62192.908680] Kernel panic - not syncing: corrupted stack end detected inside scheduler
[62192.915752] CPU: 0 PID: 12347 Comm: ld Not tainted 5.7.5-221-default #1 openSUSE Tumbleweed (unreleased)
[62192.925204] Call Trace:
[62192.927646] [<ffffffe0002028ae>] walk_stackframe+0x0/0xaa
[62192.933030] [<ffffffe000202b76>] show_stack+0x2a/0x34
[62192.938066] [<ffffffe000557d44>] dump_stack+0x6e/0x88
[62192.943098] [<ffffffe00020c2d2>] panic+0xe8/0x26a
[62192.947785] [<ffffffe00085ab9c>] schedule+0x0/0xb2
[62192.952561] [<ffffffe00085af36>] _cond_resched+0x32/0x44
[62192.957859] [<ffffffe0002f18ea>] invalidate_mapping_pages+0xe0/0x1ce
[62192.964193] [<ffffffe000370aa4>] inode_lru_isolate+0x238/0x298
[62192.970012] [<ffffffe000308098>] __list_lru_walk_one+0x5e/0xf6
[62192.975826] [<ffffffe000308516>] list_lru_walk_one+0x42/0x98
[62192.981470] [<ffffffe0003717e8>] prune_icache_sb+0x32/0x72
[62192.986941] [<ffffffe000358366>] super_cache_scan+0xe4/0x13e
[62192.992586] [<ffffffe0002f1fac>] do_shrink_slab+0x10e/0x17e
[62192.998142] [<ffffffe0002f2126>] shrink_slab_memcg+0x10a/0x1de
[62193.003957] [<ffffffe0002f5314>] shrink_node_memcgs+0x12e/0x1a4
[62193.009861] [<ffffffe0002f5484>] shrink_node+0xfa/0x43c
[62193.015067] [<ffffffe0002f583e>] shrink_zones+0x78/0x18c
[62193.020365] [<ffffffe0002f59f0>] do_try_to_free_pages+0x9e/0x23e
[62193.026352] [<ffffffe0002f65ac>] try_to_free_pages+0xb2/0xf4
[62193.031991] [<ffffffe000322952>] __alloc_pages_slowpath.constprop.0+0x2d0/0x6c2
[62193.039284] [<ffffffe000322e9a>] __alloc_pages_nodemask+0x156/0x1b2
[62193.045535] [<ffffffe00030c730>] do_anonymous_page+0x58/0x41c
[62193.051266] [<ffffffe00030f50e>] handle_pte_fault+0x12e/0x156
[62193.056994] [<ffffffe000310444>] __handle_mm_fault+0xca/0x118
[62193.062725] [<ffffffe000310532>] handle_mm_fault+0xa0/0x152
[62193.068278] [<ffffffe0002055ba>] do_page_fault+0xd6/0x370
[62193.073666] [<ffffffe00020140a>] ret_from_exception+0x0/0xc
[62193.079222] [<ffffffe0004fc16a>] copy_page_to_iter_iovec+0x4c/0x154

or this:

[200460.114397] Kernel panic - not syncing: corrupted stack end detected inside scheduler
[200460.121553] CPU: 0 PID: 32619 Comm: sh Not tainted 5.7.5-221-default #1 openSUSE Tumbleweed (unreleased)
[200460.131090] Call Trace:
[200460.133623] [<ffffffe0002028ae>] walk_stackframe+0x0/0xaa
[200460.139091] [<ffffffe000202b76>] show_stack+0x2a/0x34
[200460.144212] [<ffffffe000557d44>] dump_stack+0x6e/0x88
[200460.149335] [<ffffffe00020c2d2>] panic+0xe8/0x26a
[200460.154109] [<ffffffe00085ab9c>] schedule+0x0/0xb2
[200460.158969] [<ffffffe00085af36>] _cond_resched+0x32/0x44
[200460.164348] [<ffffffe000498572>] aa_sk_perm+0x38/0x138
[200460.169559] [<ffffffe00048d4b4>] apparmor_socket_sendmsg+0x18/0x20
[200460.175817] [<ffffffe0004508e0>] security_socket_sendmsg+0x2a/0x42
[200460.182061] [<ffffffe0006f4c0a>] sock_sendmsg+0x1a/0x40
[200460.195979] [<ffffffdf817210cc>] xprt_sock_sendmsg+0xb2/0x2b6 [sunrpc]
[200460.210450] [<ffffffdf81723bde>] xs_tcp_send_request+0xc6/0x206 [sunrpc]
[200460.224930] [<ffffffdf8171f538>] xprt_request_transmit.constprop.0+0x88/0x218 [sunrpc]
[200460.240731] [<ffffffdf81720610>] xprt_transmit+0x9a/0x182 [sunrpc]
[200460.254858] [<ffffffdf8171a584>] call_transmit+0x68/0xb8 [sunrpc]
[200460.268817] [<ffffffdf81726660>] __rpc_execute+0x84/0x222 [sunrpc]
[200460.282787] [<ffffffdf81726cea>] rpc_execute+0xac/0xb8 [sunrpc]
[200460.296493] [<ffffffdf8171c5ca>] rpc_run_task+0x122/0x178 [sunrpc]
[200460.314422] [<ffffffdf82e1533a>] nfs4_do_call_sync+0x64/0x84 [nfsv4]
[200460.332514] [<ffffffdf82e1541c>] _nfs4_proc_getattr+0xc2/0xd4 [nfsv4]
[200460.350813] [<ffffffdf82e1cafc>] nfs4_proc_getattr+0x48/0x72 [nfsv4]
[200460.363307] [<ffffffdf8292c1f6>] __nfs_revalidate_inode+0x104/0x2c8 [nfs]
[200460.376204] [<ffffffdf82926d18>] nfs_access_get_cached+0x104/0x212 [nfs]
[200460.389112] [<ffffffdf82926f20>] nfs_do_access+0xfa/0x178 [nfs]
[200460.401176] [<ffffffdf82927070>] nfs_permission+0x8e/0x184 [nfs]
[200460.406497] [<ffffffe000361936>] inode_permission.part.0+0x78/0x118
[200460.412838] [<ffffffe0003638ea>] link_path_walk.part.0+0x1bc/0x212
[200460.419086] [<ffffffe000363c7e>] path_lookupat+0x34/0x172
[200460.424559] [<ffffffe0003653de>] filename_lookup+0x5c/0xf4
[200460.430114] [<ffffffe00036551e>] user_path_at_empty+0x3a/0x5e
[200460.435931] [<ffffffe00035b838>] vfs_statx+0x62/0xbc
[200460.440966] [<ffffffe00035b92a>] __do_sys_newfstatat+0x24/0x3a
[200460.446870] [<ffffffe00035bafa>] sys_newfstatat+0x10/0x18
[200460.452339] [<ffffffe0002013fc>] ret_from_syscall+0x0/0x2

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
