Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1668BC433E4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 01:21:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9AFC2192A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 01:21:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xbo28A6P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Kt0vQNDk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9AFC2192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=frRzI+1g69S3+Irph497//TXg2K5kv0o3OTSPCwnEY0=; b=Xbo28A6PI0lOV5KPRj0zELYX+
	GSBmiY51b/E4jQhsz3prSIljhMPImIiIi3enCAdEyU3SdPD1ZIgTZZUnl0EVFSkK1dSGWwzM7qJUg
	LqDbpVWGI3oZDQenv3nMKVTaPUfEk7gY77hGwqJ5Rry3C9MKr/nZ7jTMllZ5kgL1uR/wceKWZonWL
	d8RlV1w8ghSjQz+Cghji4NRrbxyVK9U7v2fWV0ASqq3S5Gq7gT5jcflJPBaI7B2wsVEBKK2HubPMj
	MSDspmfTfDB7XVMID3+xazAjtfmV5jNKDeVuKg5KOtquRm/iX2PWgb8S9/ZOtJ9X8JjU5h8DE27Jx
	sUjfFalCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv9dP-0005Z9-8V; Tue, 14 Jul 2020 01:21:27 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv9dM-0005YI-Jr
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 01:21:25 +0000
Received: by mail-pj1-x1041.google.com with SMTP id k71so782624pje.0
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 18:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sWnb+gthe9x90ok2xM2dbHoyY21tz4yzg4eowq9VW40=;
 b=Kt0vQNDk9u4MOrwkaJaWy7vwPiADkwLX0apTn5IadVZYKmoWMniPgCb8W5Qis9nZrG
 2nE9XgnUwYgT1hC6kkHiMQ9szK9vh2hdPzsfUYJaYA4fOXTsKw03FeVo8YRBqVFSBs7v
 1GA/T6nqS4ZzxhNVBFkeU6H4Tw3I2bH47Sk0+ZGXmtp6l1oBhFEbn7r4VlpxXzdJqd7z
 wSJTxJsroZWRo2jGfHZPTyQk0pV0OAjKXfXslqD99tXQgJdBB8v7iTHIMWsvI3a/yvHS
 H0zMR7JBR/FuuWthkpYgVpsHJ5ipS4y1W/CaOiD/UG4NMIhf3/zWvXQXpN/WietnKqyT
 aswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sWnb+gthe9x90ok2xM2dbHoyY21tz4yzg4eowq9VW40=;
 b=VcdpwomPopBspayGNvMSFdPok0cSomQpoCXAYBi1/4nCDfNq1Z+CdLCUq1/fhXCy4x
 YSlCMP6+zlxNUq4hja7fzQwgJ96p9JMymfDLOSwEhcVs024fMWPsDUgZlrksEFT6Q0ez
 riJW0Sm92OaYSNsPxeGQ03WhTTX8f8qqBaFsbqyWXWbz5cwFrvCzmhuocMkrNHv7bsfj
 fJ+2fmu8qpwQT4tFs2IPaRXg2fsKh67teQrtOk3fIM4R5Ew4XXqxjAp5VLttVONTu6mu
 GEZua/h9+OtjEHVbSfPzUbbjvnMgS83NKf831ecJkBGVo1b+yFrjGbq0XW/m6iiAzLUF
 xXvQ==
X-Gm-Message-State: AOAM532aF1s2go+I6zjV6REhgk0tE1DMRehOMfC9K3HftwY6dCCrdH9O
 uvsQXWzpq9dtPN9mZ7zIt+Gw8w==
X-Google-Smtp-Source: ABdhPJw50C1pKgy4aWqXPm+z2QIbpBrolQtNxyX/pYZ9XA3S69J07UNHN+iU57Xy9o6DhWNXL0WvrA==
X-Received: by 2002:a17:902:a412:: with SMTP id
 p18mr1867568plq.283.1594689682492; 
 Mon, 13 Jul 2020 18:21:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 83sm15799984pfu.60.2020.07.13.18.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 18:21:21 -0700 (PDT)
Date: Mon, 13 Jul 2020 18:21:21 -0700 (PDT)
X-Google-Original-Date: Mon, 13 Jul 2020 17:44:32 PDT (-0700)
Subject: Re: syzkaller on risc-v
In-Reply-To: <eca54139-e4a7-5370-fd86-110fd198f44c@canonical.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: colin.king@canonical.com
Message-ID: <mhng-113ca485-43e4-4454-beb3-5fe333db5080@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_212124_687251_246578A6 
X-CRM114-Status: GOOD (  19.92  )
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
Cc: aou@eecs.berkeley.edu, david.abdurachmanov@gmail.com, schwab@suse.de,
 Paul Walmsley <paul.walmsley@sifive.com>, syzkaller@googlegroups.com,
 Bjorn Topel <bjorn.topel@gmail.com>, tklauser@distanz.ch,
 linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 06 Jul 2020 03:12:05 PDT (-0700), colin.king@canonical.com wrote:
> FYI, increasing the THREAD_SIZE_ORDER to 2 fixes the gcov stack crashes
> I'm seeing on a 5.4 kernel.

Sorry I'm a bit slow here, but I think setting THREAD_SIZE_ORDER to 2 on the
64-bit targets seems in line with what everyone else is doing.  IIRC this is
essentially the stack size, which does tend to be larger on 64-bit platforms,
so it seems reasonable.  I wouldn't be terribly surprised if we also have
larger stacks on rv32 than other platforms do, but I think it's best to avoid
increasing the size over there without at least seeing some failures.

I've just sent out a patch, as I don't see one in my inbox.

Thanks!

>
> On 30/06/2020 14:57, David Abdurachmanov wrote:
>> On Tue, Jun 30, 2020 at 4:38 PM Colin Ian King <colin.king@canonical.com> wrote:
>>>
>>> I believe I'm also seeing some potential stack smashing issues in the
>>> lua engine in ZFS on risc-v. It is taking a while for me to debug, but I
>>> don't see the failure on other arches.  Is there a way to bump the stack
>>> size up temporarily to test with larger stacks on risc-v?
>>
>> Dmitry wrote on the original email that the follow solves issues with
>> KCOV enabled:
>>
>> --- a/arch/riscv/include/asm/thread_info.h
>> +++ b/arch/riscv/include/asm/thread_info.h
>> -#define THREAD_SIZE_ORDER      (1)
>> +#define THREAD_SIZE_ORDER      (2)
>>
>> I see MIPS have:
>>
>> [..]
>>  80 /* thread information allocation */
>>  81 #if defined(CONFIG_PAGE_SIZE_4KB) && defined(CONFIG_32BIT)
>>  82 #define THREAD_SIZE_ORDER (1)
>>  83 #endif
>>  84 #if defined(CONFIG_PAGE_SIZE_4KB) && defined(CONFIG_64BIT)
>>  85 #define THREAD_SIZE_ORDER (2)
>> [..]
>>
>> david
>>
>>>
>>> Colin
>>>
>>> On 30/06/2020 14:26, David Abdurachmanov wrote:
>>>> On Tue, Jun 30, 2020 at 4:04 PM Andreas Schwab <schwab@suse.de> wrote:
>>>>>
>>>>> On Jun 30 2020, Dmitry Vyukov wrote:
>>>>>
>>>>>> I would assume some stack overflows can happen without KCOV as well.
>>>>>
>>>>> Yes, I see stack overflows quite a lot, like this:
>>>>>
>>>>> [62192.908680] Kernel panic - not syncing: corrupted stack end detected inside scheduler
>>>>> [62192.915752] CPU: 0 PID: 12347 Comm: ld Not tainted 5.7.5-221-default #1 openSUSE Tumbleweed (unreleased)
>>>>> [62192.925204] Call Trace:
>>>>> [62192.927646] [<ffffffe0002028ae>] walk_stackframe+0x0/0xaa
>>>>> [62192.933030] [<ffffffe000202b76>] show_stack+0x2a/0x34
>>>>> [62192.938066] [<ffffffe000557d44>] dump_stack+0x6e/0x88
>>>>> [62192.943098] [<ffffffe00020c2d2>] panic+0xe8/0x26a
>>>>> [62192.947785] [<ffffffe00085ab9c>] schedule+0x0/0xb2
>>>>> [62192.952561] [<ffffffe00085af36>] _cond_resched+0x32/0x44
>>>>> [62192.957859] [<ffffffe0002f18ea>] invalidate_mapping_pages+0xe0/0x1ce
>>>>> [62192.964193] [<ffffffe000370aa4>] inode_lru_isolate+0x238/0x298
>>>>> [62192.970012] [<ffffffe000308098>] __list_lru_walk_one+0x5e/0xf6
>>>>> [62192.975826] [<ffffffe000308516>] list_lru_walk_one+0x42/0x98
>>>>> [62192.981470] [<ffffffe0003717e8>] prune_icache_sb+0x32/0x72
>>>>> [62192.986941] [<ffffffe000358366>] super_cache_scan+0xe4/0x13e
>>>>> [62192.992586] [<ffffffe0002f1fac>] do_shrink_slab+0x10e/0x17e
>>>>> [62192.998142] [<ffffffe0002f2126>] shrink_slab_memcg+0x10a/0x1de
>>>>> [62193.003957] [<ffffffe0002f5314>] shrink_node_memcgs+0x12e/0x1a4
>>>>> [62193.009861] [<ffffffe0002f5484>] shrink_node+0xfa/0x43c
>>>>> [62193.015067] [<ffffffe0002f583e>] shrink_zones+0x78/0x18c
>>>>> [62193.020365] [<ffffffe0002f59f0>] do_try_to_free_pages+0x9e/0x23e
>>>>> [62193.026352] [<ffffffe0002f65ac>] try_to_free_pages+0xb2/0xf4
>>>>> [62193.031991] [<ffffffe000322952>] __alloc_pages_slowpath.constprop.0+0x2d0/0x6c2
>>>>> [62193.039284] [<ffffffe000322e9a>] __alloc_pages_nodemask+0x156/0x1b2
>>>>> [62193.045535] [<ffffffe00030c730>] do_anonymous_page+0x58/0x41c
>>>>> [62193.051266] [<ffffffe00030f50e>] handle_pte_fault+0x12e/0x156
>>>>> [62193.056994] [<ffffffe000310444>] __handle_mm_fault+0xca/0x118
>>>>> [62193.062725] [<ffffffe000310532>] handle_mm_fault+0xa0/0x152
>>>>> [62193.068278] [<ffffffe0002055ba>] do_page_fault+0xd6/0x370
>>>>> [62193.073666] [<ffffffe00020140a>] ret_from_exception+0x0/0xc
>>>>> [62193.079222] [<ffffffe0004fc16a>] copy_page_to_iter_iovec+0x4c/0x154
>>>>
>>>> There was a report from Canonical that enabling gcov causes similar issues.
>>>>
>>>> linux: riscv: corrupted stack detected inside scheduler
>>>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1877954
>>>>
>>>> Adding Colin to CC. So far we couldn't reproduce this locally, I
>>>> guess, because we don't have the right config.
>>>>
>>>> david
>>>>
>>>>
>>>>>
>>>>> or this:
>>>>>
>>>>> [200460.114397] Kernel panic - not syncing: corrupted stack end detected inside scheduler
>>>>> [200460.121553] CPU: 0 PID: 32619 Comm: sh Not tainted 5.7.5-221-default #1 openSUSE Tumbleweed (unreleased)
>>>>> [200460.131090] Call Trace:
>>>>> [200460.133623] [<ffffffe0002028ae>] walk_stackframe+0x0/0xaa
>>>>> [200460.139091] [<ffffffe000202b76>] show_stack+0x2a/0x34
>>>>> [200460.144212] [<ffffffe000557d44>] dump_stack+0x6e/0x88
>>>>> [200460.149335] [<ffffffe00020c2d2>] panic+0xe8/0x26a
>>>>> [200460.154109] [<ffffffe00085ab9c>] schedule+0x0/0xb2
>>>>> [200460.158969] [<ffffffe00085af36>] _cond_resched+0x32/0x44
>>>>> [200460.164348] [<ffffffe000498572>] aa_sk_perm+0x38/0x138
>>>>> [200460.169559] [<ffffffe00048d4b4>] apparmor_socket_sendmsg+0x18/0x20
>>>>> [200460.175817] [<ffffffe0004508e0>] security_socket_sendmsg+0x2a/0x42
>>>>> [200460.182061] [<ffffffe0006f4c0a>] sock_sendmsg+0x1a/0x40
>>>>> [200460.195979] [<ffffffdf817210cc>] xprt_sock_sendmsg+0xb2/0x2b6 [sunrpc]
>>>>> [200460.210450] [<ffffffdf81723bde>] xs_tcp_send_request+0xc6/0x206 [sunrpc]
>>>>> [200460.224930] [<ffffffdf8171f538>] xprt_request_transmit.constprop.0+0x88/0x218 [sunrpc]
>>>>> [200460.240731] [<ffffffdf81720610>] xprt_transmit+0x9a/0x182 [sunrpc]
>>>>> [200460.254858] [<ffffffdf8171a584>] call_transmit+0x68/0xb8 [sunrpc]
>>>>> [200460.268817] [<ffffffdf81726660>] __rpc_execute+0x84/0x222 [sunrpc]
>>>>> [200460.282787] [<ffffffdf81726cea>] rpc_execute+0xac/0xb8 [sunrpc]
>>>>> [200460.296493] [<ffffffdf8171c5ca>] rpc_run_task+0x122/0x178 [sunrpc]
>>>>> [200460.314422] [<ffffffdf82e1533a>] nfs4_do_call_sync+0x64/0x84 [nfsv4]
>>>>> [200460.332514] [<ffffffdf82e1541c>] _nfs4_proc_getattr+0xc2/0xd4 [nfsv4]
>>>>> [200460.350813] [<ffffffdf82e1cafc>] nfs4_proc_getattr+0x48/0x72 [nfsv4]
>>>>> [200460.363307] [<ffffffdf8292c1f6>] __nfs_revalidate_inode+0x104/0x2c8 [nfs]
>>>>> [200460.376204] [<ffffffdf82926d18>] nfs_access_get_cached+0x104/0x212 [nfs]
>>>>> [200460.389112] [<ffffffdf82926f20>] nfs_do_access+0xfa/0x178 [nfs]
>>>>> [200460.401176] [<ffffffdf82927070>] nfs_permission+0x8e/0x184 [nfs]
>>>>> [200460.406497] [<ffffffe000361936>] inode_permission.part.0+0x78/0x118
>>>>> [200460.412838] [<ffffffe0003638ea>] link_path_walk.part.0+0x1bc/0x212
>>>>> [200460.419086] [<ffffffe000363c7e>] path_lookupat+0x34/0x172
>>>>> [200460.424559] [<ffffffe0003653de>] filename_lookup+0x5c/0xf4
>>>>> [200460.430114] [<ffffffe00036551e>] user_path_at_empty+0x3a/0x5e
>>>>> [200460.435931] [<ffffffe00035b838>] vfs_statx+0x62/0xbc
>>>>> [200460.440966] [<ffffffe00035b92a>] __do_sys_newfstatat+0x24/0x3a
>>>>> [200460.446870] [<ffffffe00035bafa>] sys_newfstatat+0x10/0x18
>>>>> [200460.452339] [<ffffffe0002013fc>] ret_from_syscall+0x0/0x2
>>>>>
>>>>> Andreas.
>>>>>
>>>>> --
>>>>> Andreas Schwab, SUSE Labs, schwab@suse.de
>>>>> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
>>>>> "And now for something completely different."
>>>>>
>>>>> _______________________________________________
>>>>> linux-riscv mailing list
>>>>> linux-riscv@lists.infradead.org
>>>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
