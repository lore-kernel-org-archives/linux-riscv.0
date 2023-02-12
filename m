Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B94C636D3
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Feb 2023 22:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzOsp4LlH7dlDnFRIdwXfK0KECYZ/5Bi6BJ04GMlp7s=; b=gCuOwJhgzSBl2i
	KJF49eAqcQnKydSMa8maA2N9zMXITZh13TrzqUGB4SHAHGfQs+QNzZbUwqZNiGnndaScLOcYgo+wG
	JAn61Y7BjNA8wbBzm1/0qwhYXUDWACGAVOBukB9+qMBvshJcwe+bh+XRxSo8TB08xyVxEciHTV1ea
	/IYc160UNMb9P/xYgv7liMwwFzbP3vSbyfPzRvRyxDFf7Rj5FJDgFLq9yy3BOUUbogWGcP5hShNht
	lAM5o+21feHF8pNuI78HXpKjYz9JBPP+1/AlF8FXD4x4GQ7KwhoKduwkloknXsrrpxKgQYBNUFAmq
	HLXWGnCPIhj9qZcT6wdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRKjY-00CVV4-Td; Sun, 12 Feb 2023 22:22:09 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRKjU-00CVUT-LM; Sun, 12 Feb 2023 22:22:06 +0000
Received: by mail-oi1-x230.google.com with SMTP id v15so8815725oie.9;
        Sun, 12 Feb 2023 14:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wRZLgFwe8qTLyDFbzYz9mAFnMb7vTZuOjkc/nwdQDCU=;
        b=kpJ0iI2pLpq27nGkf+gBLYzbxVqwdXgBT+WUyc7wUFzeXyCQTFJFWqtupseCK3eVxN
         x4/fhiBXLm2ZqfdbQ6izgKGTiPEA37rkroRpuHPjFQjkTgq4OopZlJCsBYcugafkY374
         SSn/Qa5CASx55lo6D0t71Zr/dseIA1UyqJj2gYyPUHP/xfIp6MQjtZ1iTVUqJ8pnnsm6
         hnujN1B+hf2VlAZyp+NFQ4m02fnPO3RTAsb1xrPattjGNWxFDv8yADF0hvkur3cVmpe5
         7c7kTpYOV5UZB8FKWv/SqysgKPTw+eKlVl+ZltGqQrXC8u4zTKDX3bbcaV8sspcUVvY3
         wEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRZLgFwe8qTLyDFbzYz9mAFnMb7vTZuOjkc/nwdQDCU=;
        b=X3ouTD0xhaehV41GASgr5CNuNI3jZsZjeMo8nQDEKGgvDlrVOnIXJE4xYwyECA1sgU
         zYmZ7mlMZcb/vR8N3iJqDc0EYqyOH+AWMXL8MucARQqiOi4HS58ePiH8sJBGywXZLSeh
         Zrxcca+9m7XNMvAzPVIreYs7UvRlrVo+FA8YnB5lSIXWoQkB+IfUtjKeR/qYjWDY+pRc
         HPz43Ol2bxqfJMxtOx2LVUWoSskKUfH+q9R1/jeTA3k0h9Ahg8j4uRY23xVDXg5JJsMR
         TdtnNtYZxIAPDdy6qthMP92HgkjrNj2CYaoY5h3PL8Ylb4QUpLd6BVs02FDGM4qkiIHo
         qJwQ==
X-Gm-Message-State: AO0yUKUjeMCwhNM7zOw2QjRs+2WwtQmQIHdjFznN0XD/DdsegO4bDeaR
	4V3asUiujGyiYhkq8kCn2lxE4BHMWmM=
X-Google-Smtp-Source: AK7set8v8D/KLVdtbo4c+77G55RpiQgSBgAdszw/gLVqK6rwVtcdQXi3hC+/jwfjG8QqFjXMn1CxGA==
X-Received: by 2002:a54:4693:0:b0:364:d114:875e with SMTP id k19-20020a544693000000b00364d114875emr10286147oic.4.1676240522562;
        Sun, 12 Feb 2023 14:22:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z14-20020a05683020ce00b0068bb6043362sm4581287otq.11.2023.02.12.14.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 14:22:01 -0800 (PST)
Message-ID: <7b4df6c3-e5bc-d551-a644-492ca061d439@roeck-us.net>
Date: Sun, 12 Feb 2023 14:21:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Heiko Stuebner <heiko@sntech.de>, Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <20230212154333.GA3760469@roeck-us.net> <Y+kM//nuDv29Z9qJ@spud>
 <Y+kU9nDBTttZRLLq@spud> <Y+kcgcncQO/2DNLo@spud> <Y+kqi8bQE+8hLfOF@spud>
 <a059a815-dcb0-c575-b5a4-f9433e268e9b@roeck-us.net> <Y+kt04c1iRlzUNLA@spud>
 <48d2ac96-abdd-23bc-b167-08dc2c1a1dbe@roeck-us.net> <Y+kzy1y3Z3j3Ohs9@spud>
 <89c99d4a-8f0a-4e7e-9f93-2dc9f881ab9f@roeck-us.net> <Y+lOmmdakfHH6ENr@spud>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v5 00/13] riscv: improve boot time isa extensions handling
In-Reply-To: <Y+lOmmdakfHH6ENr@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_142204_745289_44A85869 
X-CRM114-Status: GOOD (  25.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/12/23 12:39, Conor Dooley wrote:
> On Sun, Feb 12, 2023 at 12:27:10PM -0800, Guenter Roeck wrote:
>> On 2/12/23 10:45, Conor Dooley wrote:
>> ...
>>>
>>>> However, I still see that the patch series
>>>> results in boot hangs with the sifive_u qemu emulation, where
>>>> the log ends with "Oops - illegal instruction". Is that problem
>>>> being addressed as well ?
>>>
>>> Hmm, if it died on the last commit in this series, then I am not sure.
>>> If you meant with riscv/for-next or linux-next that's fixed by a patch
>>> from Samuel:
>>> https://patchwork.kernel.org/project/linux-riscv/patch/20230212021534.59121-3-samuel@sholland.org/
>>>
>>
>> It failed after the merge, so it looks like it may have been merge damage.
>>
>> Anyway, I applied
>>
>> RISC-V: Don't check text_mutex during stop_machine
> 
> That being:
> https://lore.kernel.org/all/20220322022331.32136-1-palmer@rivosinc.com/
> Which handles the lockdep assertion during stop_machine...
> 
>> riscv: Fix early alternative patching
>> riscv: Fix Zbb alternative IDs
>>
>> and the sifive_u emulation no longer crashes. However, I still get
>>
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/riscv/kernel/patch.c:71 patch_insn_write+0x222/0x2f6
> 
> ...but doesn't prevent the early "spam" of assertion failures from the
> code patching for alternatives. I sent a patch to take the lock during
> the alternative patching which should get rid of them for you. It did
> for me at least!
> https://lore.kernel.org/all/20230212194735.491785-1-conor@kernel.org
> 
>> repeated several times.
>>
>> I then also tested
>>
>> riscv: patch: Fixup lockdep warning in stop_machine
> 
> This one just deletes the lockdep check, so I would expect it to remove
> the complaints.
> 
>> riscv: Fix early alternative patching
>> riscv: Fix Zbb alternative IDs
>>
>> which works fine (no warning backtrace) for sifive_u, but gives me
>>
>> WARNING: CPU: 0 PID: 0 at kernel/trace/trace_events.c:433 trace_event_raw_init+0xde/0x642
> 
> Hmm, do you have the full splat for this one handy?
> 

[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at kernel/trace/trace_events.c:433 trace_event_raw_init+0xde/0x642
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W          6.2.0-rc7-next-20230210 #1
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] epc : trace_event_raw_init+0xde/0x642
[    0.000000]  ra : trace_event_raw_init+0x45a/0x642
[    0.000000] epc : ffffffff8010571a ra : ffffffff80105a96 sp : ffffffff81803e60
[    0.000000]  gp : ffffffff81a1ab78 tp : ffffffff81814f80 t0 : 0000000000000000
[    0.000000]  t1 : 5245432d3e000000 t2 : 0000000000000000 s0 : ffffffff81803f20
[    0.000000]  s1 : 000000000000045f a0 : 0000000000000000 a1 : ffffffff81331ef0
[    0.000000]  a2 : 000000000000025c a3 : 0000000000000001 a4 : ffffffff801056fa
[    0.000000]  a5 : 000000000000002c a6 : ffffffff8192e4d8 a7 : ffffffff81157a90
[    0.000000]  s2 : 0000000000000000 s3 : ffffffff81922870 s4 : ffffffff8192e4d8
[    0.000000]  s5 : ffffffff81011c30 s6 : 000000000000000a s7 : 0000000000000021
[    0.000000]  s8 : 000000000000005c s9 : ffffffff81331ee8 s10: 0000000000000001
[    0.000000]  s11: 0000000000000000 t3 : 0000000000000007 t4 : 0000000000000070
[    0.000000]  t5 : 0000000000000025 t6 : 0000000000000009
[    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[    0.000000] [<ffffffff8010571a>] trace_event_raw_init+0xde/0x642
[    0.000000] [<ffffffff80104d32>] event_init+0x28/0x84
[    0.000000] [<ffffffff80c0f7ca>] trace_event_init+0x9e/0x2ae
[    0.000000] [<ffffffff80c0f3a0>] trace_init+0x10/0x18
[    0.000000] [<ffffffff80c00bc6>] start_kernel+0x50e/0x8f8
[    0.000000] irq event stamp: 0
[    0.000000] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
[    0.000000] hardirqs last disabled at (0): [<0000000000000000>] 0x0
[    0.000000] softirqs last  enabled at (0): [<0000000000000000>] 0x0
[    0.000000] softirqs last disabled at (0): [<0000000000000000>] 0x0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] event btrfs_clear_extent_bit has unsafe dereference of argument 1
[    0.000000] print_fmt: "%pU: io_tree=%s ino=%llu root=%llu start=%llu len=%llu clear_bits=%s", REC->fsid, __print_symbolic(REC->owner, {IO_TREE_FS_PINNED_EXTENTS, "PINNED_EXTENTS"}, {IO_TREE_FS_EXCLUDED_EXTENTS, "EXCLUDED_EXTENTS"}, {IO_TREE_BTREE_INODE_IO, "BTREE_INODE_IO"}, {IO_TREE_INODE_IO, "INODE_IO"}, {IO_TREE_RELOC_BLOCKS, "RELOC_BLOCKS"}, {IO_TREE_TRANS_DIRTY_PAGES, "TRANS_DIRTY_PAGES"}, {IO_TREE_ROOT_DIRTY_LOG_PAGES, "ROOT_DIRTY_LOG_PAGES"}, {IO_TREE_INODE_FILE_EXTENT, "INODE_FILE_EXTENT"}, {IO_TREE_LOG_CSUM_RANGE, "LOG_CSUM_RANGE"}, {IO_TREE_SELFTEST, "SELFTEST"}), REC->ino, REC->rootid, REC->start, REC->len, __print_flags(REC->clear_bits, "|", { EXTENT_DIRTY, "DIRTY"}, { EXTENT_UPTODATE, "UPTODATE"}, { EXTENT_LOCKED, "LOCKED"}, { EXTENT_NEW, "NEW"}, { EXTENT_DELALLOC, "DELALLOC"}, { EXTENT_DEFRAG, "DEFRAG"}, { EXTENT_BOUNDARY, "BOUNDARY"}, { EXTENT_NODATASUM, "NODATASUM"}, { EXTENT_CLEAR_META_RESV, "CLEAR_META_RESV"}, { EXTENT_NEED_WAIT, "NEED_WAIT"}, { EXTENT_NORESERVE, 
"NORESERVE"}, { EXTENT_QGROUP_RESERV
[    0.000000] event btrfs_ordered_sched has unsafe dereference of argument 1
[    0.000000] print_fmt: "%pU: work=%p (normal_work=%p) wq=%p func=%ps ordered_func=%p ordered_free=%p", REC->fsid, REC->work, REC->normal_work, REC->wq, REC->func, REC->ordered_func, REC->ordered_free
[    0.000000] event btrfs_work_sched has unsafe dereference of argument 1
[    0.000000] print_fmt: "%pU: work=%p (normal_work=%p) wq=%p func=%ps ordered_func=%p ordered_free=%p", REC->fsid, REC->work, REC->normal_work, REC->wq, REC->func, REC->ordered_func, REC->ordered_free
[    0.000000] event btrfs_work_queued has unsafe dereference of argument 1
[    0.000000] print_fmt: "%pU: work=%p (normal_work=%p) wq=%p func=%ps ordered_func=%p ordered_free=%p", REC->fsid, REC->work, REC->normal_work, REC->wq, REC->func, REC->ordered_func, REC->ordered_free
[    0.000000] event find_free_extent_search_loop has unsafe dereference of argument 1

and so on.

It bisects to "RISC-V: add zbb support to string functions", which also seems
to cause various boot failures. Unfortunately that patch is difficult to revert,
but marking TOOLCHAIN_HAS_ZBB as broken "fixes" it. I don't know if there is
a problem with the patch or with qemu. I'll disable RISCV_ISA_ZBB in my tests
for the time being to work around it.

Guenter


>> and a whole lot of
>>
>> event btrfs_clear_extent_bit has unsafe dereference of argument 1
>>
>> and similar messages when running the "virt" emulation. That was there before,
>> but drowned in the noise. Ok, guess I'll need another round of bisect.
> 
> Thanks for all of your testing :)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
