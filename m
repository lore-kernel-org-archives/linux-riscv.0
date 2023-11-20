Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90BCC2BB3F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSTkP7YYKRoKarcrPE4GbIFVBbtE+iq3OWmwi677KrA=; b=xCQFbSjLevksz4
	vrsNTc+DnFvpp0WYPoMaJ8CuyKTBnvy8eDhFFDhjz6Z5N73Ph0OQ/Iuvm0i+t/+B6XQPgPlJCC3Cx
	su1BJecCvGviWXZ2p6etbHM7ICDsFloH9IG+od19HqzKJdf6Tn8yJn2BYX4+AKY8SVouNjAwM/Sjy
	4iDnuRm+KDaLCJQQKUxFFDk2ChkfD5x+Fn/eXA9OUwDVydLHpgFdH1YOMsHS5LLUY9sfTNDP8bf32
	q5d7JtC9yW6f/sSm3VRgfQYKO3qmLJQomv00je4tMNwcHEoxCqUnmX893ktyab2lIg70Fxj2prL4/
	pabTPv7r6e2MnHwHI0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r58Em-00DvLe-0b;
	Mon, 20 Nov 2023 17:39:08 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r58Ei-00DvH7-15
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 17:39:06 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1f938932bf0so687609fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Nov 2023 09:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1700501943; x=1701106743; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E1gQSuVHayDITZVhYvTVkRmd+fut2wqHs0SWlkuQxgs=;
        b=kpSzAQgpDXFBHAA/MMLXjY0/0RMzgKqF5ghzuf00VfW+svNBOQMe6JS0hw6g+frHYD
         t090mgU78YpePfHU0HwDHDSWQqqWfFeW+GaEQV5frI4EpOCEYRqijh2oXSe4wsu6M2X/
         8bbWPjy3hY4Yr2xVJqjfEiAgUtE50vhQyKT5Kg/gDORwq4ZgWDkCl9r+gPc6dMjvtzgM
         PPizbEm8pAunnDeaaDppu0QK963OtA+rcjln6Wf2teC6fHa4b5n4CzQOcA4i+UypCM7o
         TD1TEQPec6YFlreNNO77KhMkFdbOwYr4qaMwjiErYIuFJLC+kUxr3q6glKFtXb2SCdjS
         D8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501943; x=1701106743;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1gQSuVHayDITZVhYvTVkRmd+fut2wqHs0SWlkuQxgs=;
        b=CcTAQw/ua6WDGI4q2MiwwwMjU3SEPoURl+WR9Qhv/CJACVHQuKB77pUechAZyoV2/S
         LSEYVh49CVZMOHv2o7sqKT15oitblKrVYRa6/ZLDLen45dYb+mmyT8USFO8q627QY6ey
         DLPYYw+HkwC3uH+KqsxzaU3cdTX6iZAZHaMLj37NbNlwWU++oZPZPiJsC9ldl/ra/zRZ
         Nmmz6ZKEfKkavVIeZ4vmv1W/gGjunlt0K7SZ2K9Tu30JSAa5SKr0zpzjAUfj3n2DtEqY
         HF9ZOxAv03ElUAmWn6uzCh6q8DMzwcYo3GA+8AZmHr1d5H9iMaU/eP0sJWv/ka6tDobQ
         7hag==
X-Gm-Message-State: AOJu0YzJ5DDHs5f+Qdm5nFFfIFncA/ZGY+axt2xilzfC1K4+DWWFsCRj
	4zOLsBeS7DZgxbNvZZrpODmsZQ==
X-Google-Smtp-Source: AGHT+IF27jbkJfsCaBv6zWLDvUIthcg8v3DdkMtefnJksmG2hfeBcw+POYGJnzFTTZ7XWRwE/fcwkw==
X-Received: by 2002:a05:6870:1590:b0:1f0:8122:554c with SMTP id j16-20020a056870159000b001f08122554cmr11492131oab.45.1700501942736;
        Mon, 20 Nov 2023 09:39:02 -0800 (PST)
Received: from ghost ([50.146.0.2])
        by smtp.gmail.com with ESMTPSA id li11-20020a05687c354b00b001f5d2d47439sm946698oac.32.2023.11.20.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 09:39:02 -0800 (PST)
Date: Mon, 20 Nov 2023 12:39:00 -0500
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ron Economos <re@w6rz.net>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
	prabhakar.csengg@gmail.com,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: RISC-V regression on Linux 6.7-rc1
Message-ID: <ZVuZtNNYizysKZo1@ghost>
References: <444de86a-7e7c-4de7-5d1d-c1c40eefa4ba@w6rz.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <444de86a-7e7c-4de7-5d1d-c1c40eefa4ba@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_093904_530519_561ACC26 
X-CRM114-Status: GOOD (  11.91  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 20, 2023 at 07:54:29AM -0800, Ron Economos wrote:
> Linux 6.7-rc1 fails to boot on the HiFive Unmatched running Ubuntu 22.04.
> During boot, there are many random oops and kernel panics. Reverting the
> patch series "riscv: Add remaining module relocations and tests" (commit
> b51fc88cb35e49) resolves the issue.
> =

> Here's an example, but it does something different on each boot.
> =

> Nov 17 21:33:38 riscv64 kernel: Unable to handle kernel paging request at
> virtual address ffffff97e6cb45fa
> Nov 17 21:33:38 riscv64 kernel: Unable to handle kernel paging request at
> virtual address 0000005b7d944e0e
> Nov 17 21:33:38 riscv64 kernel: Oops [#1]
> Nov 17 21:33:38 riscv64 kernel: Modules linked in: sch_fq_codel auth_rpcg=
ss
> nfs_acl drm(+) lockd grace backlight sunrpc efi_pstore ip_tables x_tables
> autofs4 btrfs blake2b_generic raid10 raid456 >
> Nov 17 21:33:38 riscv64 kernel: CPU: 1 PID: 391 Comm: cloud-init Not tain=
ted
> 6.7.0-rc1 #2
> Nov 17 21:33:38 riscv64 kernel: Hardware name: SiFive HiFive Unmatched A00
> (DT)
> Nov 17 21:33:38 riscv64 kernel: epc : refill_obj_stock+0x4e/0x160
> Nov 17 21:33:38 riscv64 kernel:=A0 ra : refill_obj_stock+0x4e/0x160
> Nov 17 21:33:38 riscv64 kernel: epc : ffffffff802d9264 ra : ffffffff802d9=
264
> sp : ffffffd898e2fd10
> Nov 17 21:33:38 riscv64 kernel:=A0 gp : ffffffff81c4bdd8 tp : ffffffd884f=
9ec00
> t0 : 0000000000000000
> Nov 17 21:33:38 riscv64 kernel:=A0 t1 : 0000000000000000 t2 : 00000000000=
00000
> s0 : ffffffd898e2fd60
> Nov 17 21:33:38 riscv64 kernel:=A0 s1 : ffffffdbfed02f70 a0 : ffffffd89a2=
b1ec0
> a1 : 0000000000000000
> Nov 17 21:33:38 riscv64 kernel:=A0 a2 : 0000000000000000 a3 : 00000000000=
00000
> a4 : 0000000000000000
> Nov 17 21:33:38 riscv64 kernel:=A0 a5 : 0000000000000000 a6 : 00000000000=
00000
> a7 : 0000000000000000
> Nov 17 21:33:38 riscv64 kernel:=A0 s2 : 31413797e6cb45fa s3 : 00000000000=
00108
> s4 : 0000000200000022
> Nov 17 21:33:38 riscv64 kernel:=A0 s5 : ffffffff81cbb1e8 s6 : ffffffd884f=
9ec00
> s7 : 0000003fc0325028
> Nov 17 21:33:38 riscv64 kernel:=A0 s8 : 0000000000000000 s9 : 0000002b10f=
dc170
> s10: 0000002b10fe2290
> Nov 17 21:33:38 riscv64 kernel:=A0 s11: 0000000000000000 t3 : 00000000000=
00000
> t4 : 0000000000000000
> Nov 17 21:33:38 riscv64 kernel:=A0 t5 : 0000000000000000 t6 : 00000000000=
00000
> Nov 17 21:33:38 riscv64 kernel: status: 0000000200000100 badaddr:
> ffffff97e6cb45fa cause: 000000000000000d
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff802d9264>]
> refill_obj_stock+0x4e/0x160
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff802dce26>]
> obj_cgroup_uncharge+0x1c/0x2a
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff802b97a6>]
> kmem_cache_free+0x1b2/0x548
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff802f358c>] __fput+0x132/0x252
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff802f3702>] ____fput+0x18/0x22
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff80043e96>] task_work_run+0xa8/0=
xee
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff800bfc66>]
> exit_to_user_mode_loop.isra.0+0xf2/0x10e
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff80c4f2ac>]
> syscall_exit_to_user_mode+0x54/0x64
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff80c4eee0>]
> do_trap_ecall_u+0x5a/0x13a
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff80c5a716>]
> ret_from_exception+0x0/0x66
> Nov 17 21:33:38 riscv64 kernel: Code: 639c 94be 689c 8963 0aa7 8526 f097
> ffff 80e7 26a0 (3783) 0009
> Nov 17 21:33:38 riscv64 kernel: ---[ end trace 0000000000000000 ]---
> Nov 17 21:33:38 riscv64 kernel: Oops [#2]
> Nov 17 21:33:38 riscv64 kernel: note: cloud-init[391] exited with irqs
> disabled
> Nov 17 21:33:38 riscv64 kernel: Modules linked in: sch_fq_codel auth_rpcg=
ss
> nfs_acl drm(+) lockd grace backlight sunrpc efi_pstore ip_tables x_tables
> autofs4 btrfs blake2b_generic raid10 raid456 >
> Nov 17 21:33:38 riscv64 kernel: CPU: 2 PID: 376 Comm: modprobe Tainted:
> G=A0=A0=A0=A0=A0 D=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 6.7.0-rc1 #2
> Nov 17 21:33:38 riscv64 kernel: Hardware name: SiFive HiFive Unmatched A00
> (DT)
> Nov 17 21:33:38 riscv64 kernel: epc : __kmem_cache_alloc_node+0x286/0x2fa
> Nov 17 21:33:38 riscv64 kernel:=A0 ra : __kmem_cache_alloc_node+0x5a/0x2fa
> Nov 17 21:33:38 riscv64 kernel: epc : ffffffff802bacb8 ra : ffffffff802ba=
a8c
> sp : ffffffd889f07940
> Nov 17 21:33:38 riscv64 kernel:=A0 gp : ffffffff81c4bdd8 tp : ffffffd898d=
84380
> t0 : ffffffd88e1c3ae0
> Nov 17 21:33:38 riscv64 kernel:=A0 t1 : 0000940000000000 t2 : 00000000000=
00000
> s0 : ffffffd889f079a0
> Nov 17 21:33:38 riscv64 kernel:=A0 s1 : ffffffd880001700 a0 : 26856bdb7d9=
44dce
> a1 : 0000000000000717
> Nov 17 21:33:38 riscv64 kernel:=A0 a2 : 0000000000008500 a3 : ffffffff81c=
bb1e8
> a4 : 26856bdb7d944e0e
> Nov 17 21:33:38 riscv64 kernel:=A0 a5 : 0e4e947ddb6b0026 a6 : 00000000000=
0ff00
> a7 : 0000000000000718
> Nov 17 21:33:38 riscv64 kernel:=A0 s2 : 0000000000000000 s3 : 00000000000=
00dc0
> s4 : 0000000000000080
> Nov 17 21:33:38 riscv64 kernel:=A0 s5 : ffffffffffffffff s6 : ffffffff804=
66e7a
> s7 : ffffffff81c4c454
> Nov 17 21:33:38 riscv64 kernel:=A0 s8 : 0000000000000dc0 s9 : ffffffff024=
528c8
> s10: ffffffff81b1b7d0
> Nov 17 21:33:38 riscv64 kernel:=A0 s11: ffffffff81b1b880 t3 : 00000000000=
00000
> t4 : 0000000000000000
> Nov 17 21:33:38 riscv64 kernel:=A0 t5 : 0000000000000000 t6 : ffffffd880d=
57554
> Nov 17 21:33:38 riscv64 kernel: status: 0000000200000120 badaddr:
> 0000005b7d944e0e cause: 000000000000000d
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff802bacb8>]
> __kmem_cache_alloc_node+0x286/0x2fa
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff80247cac>] kmalloc_trace+0x30/0=
xac
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff80466e7a>]
> eventfs_create_dir+0x46/0x158
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff8015c968>]
> event_create_dir+0xac/0x2e0
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff8015dcdc>]
> trace_module_notify+0x1d8/0x264
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff80049e28>]
> notifier_call_chain+0x6c/0xe8
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff80049f2c>]
> blocking_notifier_call_chain_robust+0x5a/0xc2
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff800c4390>]
> load_module+0x16dc/0x1d1a
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff800c4bfc>]
> init_module_from_file+0x82/0xc4
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff800c4dda>]
> __riscv_sys_finit_module+0x19c/0x33a
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff80c4eed4>]
> do_trap_ecall_u+0x4e/0x13a
> Nov 17 21:33:38 riscv64 kernel: [<ffffffff80c5a716>]
> ret_from_exception+0x0/0x66
> Nov 17 21:33:38 riscv64 kernel: Code: 0813 f008 5613 0287 e7b3 0117 7633
> 0106 8893 0015 (6318) 8fd1
> Nov 17 21:33:38 riscv64 kernel: ---[ end trace 0000000000000000 ]---
> Nov 17 21:33:38 riscv64 systemd[1]: Finished Coldplug All udev Devices.
> Nov 17 21:33:38 riscv64 kernel: Unable to handle kernel paging request at
> virtual address 0000005b7d944e0e
> Nov 17 21:33:38 riscv64 kernel: Unable to handle kernel paging request at
> virtual address ffffff81e50b0eb6
> Nov 17 21:33:38 riscv64 kernel: Oops [#3]
> =


The list structure that was holding the relocation data was not being
freed correctly, causing some accesses after free. I just sent out a
patch fixing that (riscv: Safely remove entries from relocation list).
Perhaps that will solve this issue.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
