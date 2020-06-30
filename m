Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0813C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:27:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C629206B6
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 13:27:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AnqRLQRW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ns+7EkLG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C629206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kyyuXbVdeCv48OKSL+yeAdMtvEmFNHm04ZoIluYOoVY=; b=AnqRLQRWFhDNhHK0HRK9/HUvv
	tTjsK9GPDUdV6PqC9Dsv6WePhJWlCFGu1mTO5mNDTEa1P1Z9s7uBx+2JGwgjKQSWhhgCofWUDuR3p
	tdRTMZ9MiRdJiRs3X3todbHDfVifCkamm0bnpTxA8F/HYcBlyPU6V0F/4+05ZmtYB+zju2ZEjCX4B
	Rf4lUkFMk4zgUju/H3oDND/T0WnLdVWkgkalBkxfkeyl0bx+U7guzzvVGI5+qJkBfPSUwRCA83Gyx
	l4n9vl1fOkBGR9242eb/DUnM+f14ReyJwxC9+rQbWgmtpAAGYgySV+VzZZgUSSsRAr/1V3PdZjc6R
	s2YEWhhUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqGIK-0003NN-IP; Tue, 30 Jun 2020 13:27:28 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqGIF-0003Lj-1P
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 13:27:26 +0000
Received: by mail-lj1-x244.google.com with SMTP id b25so18917387ljp.6
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 06:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=46OadEk0GnKD8Ui9qLR3mzsU/6JBe0FAt8jeJWRbnG4=;
 b=ns+7EkLGfWNKHD/Y0o9yxHR0wJFJK36H9O0lOOqAYSp2bXCHb6hOSMtlxRVLhgxNMM
 rDIze8e/1BrfOnGCWNargmIrmwUpvIfGNWoqunPl+hgpGtfAEXOtADmf7BxJC/bmOyI0
 Ef6onkDyYizEx806uhDbduLctyC/LKUVXoCmYMEqRf5mjIpriqx8lduMdbriwvZ5em/E
 esMf+tjVrsFVYv/H0D98xjkmLoKR6YTGPOTK6JxFw8nAf/5m4V8+TMPupZIciFJSaLHX
 5WmIjwgy8dmqUBRRCvfLfLWXMBgp48A1GvNSZ1AZjyQo65aV8I2A8qdmAe1yx8akSyt6
 zddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=46OadEk0GnKD8Ui9qLR3mzsU/6JBe0FAt8jeJWRbnG4=;
 b=P3DzzJKpf67++8UQhNPEdfnawmdllqgHwwiA2JfV8pODzQwFv8L869B1jFpeoblj0k
 ZH4K8jUCmliZ4gnN0CUUBSAh5gkYX5jOhR2dZUFSj2MM/SHAfpLfIbY9rV80XpHBUXOa
 /q508aMn7cs5W9MGGxWBzntzfmpGSjhN2uymPpKnnYAG/R5IxPxyqkMtf1eNNPh1rPnt
 CaVrlP5ZjQ/TCb9fpTeb6+GZW+deIHfVUXseydZc49rmGA/slDeDFqE867JcZVqGIacG
 tck+cFKpJNcnIrEtYvCHYU9sjgU/CwwwPd18Dy4mII+IVfOxael8m0ElLeS35lX3dOfn
 q/uA==
X-Gm-Message-State: AOAM532+w6MOdk1ya0Gvtx4GkwtGtv3jGBety8XUOYnUCBrGiFD8RRHM
 L5k7Wa0d9GaOHEjWbmV1pZKuLtQMcr+gcIogSJHGYzOykwc=
X-Google-Smtp-Source: ABdhPJzqrhmfppkeeB4RuVDFNwwID34sVuEWxR0XJNtvQqOl505AGkuGgWaYLxsBiST3huW9/EIHJXBZGzlRQ9+FuK0=
X-Received: by 2002:a2e:908f:: with SMTP id l15mr9916699ljg.307.1593523641419; 
 Tue, 30 Jun 2020 06:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <mvmpn9gn1sd.fsf@suse.de>
In-Reply-To: <mvmpn9gn1sd.fsf@suse.de>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Tue, 30 Jun 2020 16:26:45 +0300
Message-ID: <CAEn-LTpDV5QQ1nkYVP9sE9T23YM_6cthT+LNUsLWYeQJ00xy7Q@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: Andreas Schwab <schwab@suse.de>
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
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Colin Ian King <colin.king@canonical.com>,
 Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 4:04 PM Andreas Schwab <schwab@suse.de> wrote:
>
> On Jun 30 2020, Dmitry Vyukov wrote:
>
> > I would assume some stack overflows can happen without KCOV as well.
>
> Yes, I see stack overflows quite a lot, like this:
>
> [62192.908680] Kernel panic - not syncing: corrupted stack end detected inside scheduler
> [62192.915752] CPU: 0 PID: 12347 Comm: ld Not tainted 5.7.5-221-default #1 openSUSE Tumbleweed (unreleased)
> [62192.925204] Call Trace:
> [62192.927646] [<ffffffe0002028ae>] walk_stackframe+0x0/0xaa
> [62192.933030] [<ffffffe000202b76>] show_stack+0x2a/0x34
> [62192.938066] [<ffffffe000557d44>] dump_stack+0x6e/0x88
> [62192.943098] [<ffffffe00020c2d2>] panic+0xe8/0x26a
> [62192.947785] [<ffffffe00085ab9c>] schedule+0x0/0xb2
> [62192.952561] [<ffffffe00085af36>] _cond_resched+0x32/0x44
> [62192.957859] [<ffffffe0002f18ea>] invalidate_mapping_pages+0xe0/0x1ce
> [62192.964193] [<ffffffe000370aa4>] inode_lru_isolate+0x238/0x298
> [62192.970012] [<ffffffe000308098>] __list_lru_walk_one+0x5e/0xf6
> [62192.975826] [<ffffffe000308516>] list_lru_walk_one+0x42/0x98
> [62192.981470] [<ffffffe0003717e8>] prune_icache_sb+0x32/0x72
> [62192.986941] [<ffffffe000358366>] super_cache_scan+0xe4/0x13e
> [62192.992586] [<ffffffe0002f1fac>] do_shrink_slab+0x10e/0x17e
> [62192.998142] [<ffffffe0002f2126>] shrink_slab_memcg+0x10a/0x1de
> [62193.003957] [<ffffffe0002f5314>] shrink_node_memcgs+0x12e/0x1a4
> [62193.009861] [<ffffffe0002f5484>] shrink_node+0xfa/0x43c
> [62193.015067] [<ffffffe0002f583e>] shrink_zones+0x78/0x18c
> [62193.020365] [<ffffffe0002f59f0>] do_try_to_free_pages+0x9e/0x23e
> [62193.026352] [<ffffffe0002f65ac>] try_to_free_pages+0xb2/0xf4
> [62193.031991] [<ffffffe000322952>] __alloc_pages_slowpath.constprop.0+0x2d0/0x6c2
> [62193.039284] [<ffffffe000322e9a>] __alloc_pages_nodemask+0x156/0x1b2
> [62193.045535] [<ffffffe00030c730>] do_anonymous_page+0x58/0x41c
> [62193.051266] [<ffffffe00030f50e>] handle_pte_fault+0x12e/0x156
> [62193.056994] [<ffffffe000310444>] __handle_mm_fault+0xca/0x118
> [62193.062725] [<ffffffe000310532>] handle_mm_fault+0xa0/0x152
> [62193.068278] [<ffffffe0002055ba>] do_page_fault+0xd6/0x370
> [62193.073666] [<ffffffe00020140a>] ret_from_exception+0x0/0xc
> [62193.079222] [<ffffffe0004fc16a>] copy_page_to_iter_iovec+0x4c/0x154

There was a report from Canonical that enabling gcov causes similar issues.

linux: riscv: corrupted stack detected inside scheduler
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1877954

Adding Colin to CC. So far we couldn't reproduce this locally, I
guess, because we don't have the right config.

david


>
> or this:
>
> [200460.114397] Kernel panic - not syncing: corrupted stack end detected inside scheduler
> [200460.121553] CPU: 0 PID: 32619 Comm: sh Not tainted 5.7.5-221-default #1 openSUSE Tumbleweed (unreleased)
> [200460.131090] Call Trace:
> [200460.133623] [<ffffffe0002028ae>] walk_stackframe+0x0/0xaa
> [200460.139091] [<ffffffe000202b76>] show_stack+0x2a/0x34
> [200460.144212] [<ffffffe000557d44>] dump_stack+0x6e/0x88
> [200460.149335] [<ffffffe00020c2d2>] panic+0xe8/0x26a
> [200460.154109] [<ffffffe00085ab9c>] schedule+0x0/0xb2
> [200460.158969] [<ffffffe00085af36>] _cond_resched+0x32/0x44
> [200460.164348] [<ffffffe000498572>] aa_sk_perm+0x38/0x138
> [200460.169559] [<ffffffe00048d4b4>] apparmor_socket_sendmsg+0x18/0x20
> [200460.175817] [<ffffffe0004508e0>] security_socket_sendmsg+0x2a/0x42
> [200460.182061] [<ffffffe0006f4c0a>] sock_sendmsg+0x1a/0x40
> [200460.195979] [<ffffffdf817210cc>] xprt_sock_sendmsg+0xb2/0x2b6 [sunrpc]
> [200460.210450] [<ffffffdf81723bde>] xs_tcp_send_request+0xc6/0x206 [sunrpc]
> [200460.224930] [<ffffffdf8171f538>] xprt_request_transmit.constprop.0+0x88/0x218 [sunrpc]
> [200460.240731] [<ffffffdf81720610>] xprt_transmit+0x9a/0x182 [sunrpc]
> [200460.254858] [<ffffffdf8171a584>] call_transmit+0x68/0xb8 [sunrpc]
> [200460.268817] [<ffffffdf81726660>] __rpc_execute+0x84/0x222 [sunrpc]
> [200460.282787] [<ffffffdf81726cea>] rpc_execute+0xac/0xb8 [sunrpc]
> [200460.296493] [<ffffffdf8171c5ca>] rpc_run_task+0x122/0x178 [sunrpc]
> [200460.314422] [<ffffffdf82e1533a>] nfs4_do_call_sync+0x64/0x84 [nfsv4]
> [200460.332514] [<ffffffdf82e1541c>] _nfs4_proc_getattr+0xc2/0xd4 [nfsv4]
> [200460.350813] [<ffffffdf82e1cafc>] nfs4_proc_getattr+0x48/0x72 [nfsv4]
> [200460.363307] [<ffffffdf8292c1f6>] __nfs_revalidate_inode+0x104/0x2c8 [nfs]
> [200460.376204] [<ffffffdf82926d18>] nfs_access_get_cached+0x104/0x212 [nfs]
> [200460.389112] [<ffffffdf82926f20>] nfs_do_access+0xfa/0x178 [nfs]
> [200460.401176] [<ffffffdf82927070>] nfs_permission+0x8e/0x184 [nfs]
> [200460.406497] [<ffffffe000361936>] inode_permission.part.0+0x78/0x118
> [200460.412838] [<ffffffe0003638ea>] link_path_walk.part.0+0x1bc/0x212
> [200460.419086] [<ffffffe000363c7e>] path_lookupat+0x34/0x172
> [200460.424559] [<ffffffe0003653de>] filename_lookup+0x5c/0xf4
> [200460.430114] [<ffffffe00036551e>] user_path_at_empty+0x3a/0x5e
> [200460.435931] [<ffffffe00035b838>] vfs_statx+0x62/0xbc
> [200460.440966] [<ffffffe00035b92a>] __do_sys_newfstatat+0x24/0x3a
> [200460.446870] [<ffffffe00035bafa>] sys_newfstatat+0x10/0x18
> [200460.452339] [<ffffffe0002013fc>] ret_from_syscall+0x0/0x2
>
> Andreas.
>
> --
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
