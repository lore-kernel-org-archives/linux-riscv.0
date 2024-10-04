Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5E7CFA77A
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 13:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dBZkXBc/+QjtcqFHtw8vPPp0eJrNdT3bBirckyLzVkQ=; b=Gvyv9EcJKn/i6Q
	Oz5/KT6sDhZYAAOTgw3GUMxp3PG472YXRSc9WCcSLydBnXEdk5oGUc8bttJsR1FZAMXfP7iYj7rvo
	4Fc4VnvSEt2LNg/q4ARGePoelXHhBcpLVk+SYJYMrTtw8O1Lt9WddJyylM5UHZK8QAjTVsc0bO+9P
	Pmy+riW6E1+3avkKrhdSwBpNeGwrUhOXNuSI+ia4I5LlSHcm+7HQjVLpNaZNgwmCC7Cm3Vm0uNQeB
	n4no/vaCVaWb0NR5A9szs7h+SzC4hPhFWg1OYXw0J4zdenE/QXSwst089zPs0Q4w3/QtJH/bCX1za
	XJ035hc0EQaldh1EFtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swi3x-0000000CRfj-2v7p;
	Fri, 04 Oct 2024 13:09:41 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swi3t-0000000CRcf-2jrm
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 13:09:39 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71dec222033so59302b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 06:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728047376; x=1728652176; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e4ZhVHNkBAzYmsO0ZGXrAiB+IgektorsBuRogI5Nz5g=;
        b=kcN6yI3Q7hswmV9msXdhtYoYqU0BKTLRsmcPe2LK92hpXyyAoLGjdgLUpdjUmBkV7u
         +GJ3sw1x+dkwqYgSJnis19SArKf/hAZqB/X3WDLsqMUV+dKiC8DtyQUinblf/3+fcb78
         FF+gQbHUlv3RKRkEtR05plwGZqwba/SM/J84rklo+n12Jsw1k2edPzwdpUBqrkUq7Olf
         l+SXnW6r+8OoTgtPu3Enes5LWOjpsYRdFZzJ+dyXqw25s0ku+0APXhkrLce3CC6cYQus
         UCmT0Vun2HO65mpgeIFUy8DI8KQxwVNnMFnxXtGmnNACXavWCUTaBjTwJSMWG4VFDfVo
         LYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728047376; x=1728652176;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4ZhVHNkBAzYmsO0ZGXrAiB+IgektorsBuRogI5Nz5g=;
        b=Nd9zh+30ZJw03rj1d/Cq4Z64KEoGzcHDB6IKSfwpruRX2hTKN7u/8g47It8fzwtxXC
         SUXCP/Cq9vzYaGF94wBqi1grsvgoQCcf+zTXLIBvmql4ZhjDyNjOWAgdjTE2cPgBCHw/
         R20HX7YVQscNkjIvnRvTxaVsJTvThqvYrOShcPZuVrdb81MFF6mkRIeku23Xu/5NtOIt
         4TmU3AZ/sD7fcQbhgsnOvHpK3mLsuRO4ZlmONnSsD/Vk1Ny6OK9+lrxbIPWqoJN0rUiV
         v/vmL5O4N0+RRguT0BpkEnqZMvhVDOp3Kn/aFLo06zprqXQ8GIPBh0nWqIeWKSevXwqR
         XQvA==
X-Forwarded-Encrypted: i=1; AJvYcCWuGbvbl7r2SzK9sxWfUFuQ9EisE+6Tyo2Cr7dtr+tThYkc80SQBeWvijjALoidDBWuJATnuy0eZ0R2WQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmiVmVOPJxPUVO+1Up2VNQDx5sr+nEKbeJLCI35Cb1WM0Tty6X
	lRVGCqUzEHNRI+csHTcE9Lz4aPhOiMojdN2OR5wOu+GJ/07xSX+XpOt6pzvvZ4BCFLcG3VKN6iP
	B3gubNd7xDUxiSqLS0wmsprd1oIs=
X-Google-Smtp-Source: AGHT+IHg+G4TX0kPJfI06ALZgDkNwEzzofGoP8Ha/LpJC21IwlTeMCQUaiHCQ5UVPBFNBp3SNVwbFRCW8Rzlc7A+MmQ=
X-Received: by 2002:aa7:88ca:0:b0:717:8ee5:e9d2 with SMTP id
 d2e1a72fcca58-71de23a0d3dmr1761038b3a.2.1728047376137; Fri, 04 Oct 2024
 06:09:36 -0700 (PDT)
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Oct 2024 15:09:22 +0200
Message-ID: <CANiq72k-wbyR=FeBVBPMqqF6Re9eO4LtdHYqvMQgXSe3cHQsGg@mail.gmail.com>
Subject: VM_BUG_ON_PAGE(PageAnonNotKsm(page)) defconfig riscv64
To: Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Linux-MM <linux-mm@kvack.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_060937_870141_3822E800 
X-CRM114-Status: UNSURE (   5.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Matthew,

I noticed riscv64 defconfig seems to reproducibly hit
`VM_BUG_ON_PAGE(PageAnonNotKsm(page))` in today's next-20241004 --
please see below.

I hope that helps!

Cheers,
Miguel

[ 0.676534] Freeing unused kernel image (initmem) memory: 2260K
[ 0.677337] Run /init as init process
[ 0.680562] page: refcount:1 mapcount:1 mapping:0000000000000000
index:0xfffffffffff pfn:0x81034
[ 0.680882] memcg:ff60000001893000
[ 0.680993] anon flags: 0x20008(uptodate|swapbacked|zone=0)
[ 0.681620] raw: 0000000000020008 0000000000000000 dead000000000122
ff60000002751001
[ 0.681846] raw: 00000fffffffffff 0000000000000000 0000000100000000
ff60000001893000
[ 0.682098] page dumped because: VM_BUG_ON_PAGE(PageAnonNotKsm(page))
[ 0.682588] ------------[ cut here ]------------
[ 0.682691] kernel BUG at include/linux/page-flags.h:1134!
[ 0.682876] Kernel BUG [#1]
[ 0.682905] Modules linked in:
[ 0.683094] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.12.0-rc1-next-20241004 #1
[ 0.683183] Hardware name: riscv-virtio,qemu (DT)
[ 0.683261] epc : folio_add_new_anon_rmap+0x330/0x518
[ 0.683623] ra : folio_add_new_anon_rmap+0x330/0x518
[ 0.683640] epc : ffffffff801ca72a ra : ffffffff801ca72a sp : ff200000000139d0
[ 0.683654] gp : ffffffff815223f8 tp : ff600000018a8000 t0 : 00000000000000bf
[ 0.683667] t1 : ff20000000013768 t2 : 0000000000000018 s0 : ff20000000013a10
[ 0.683679] s1 : ff1c000000040d00 a0 : 0000000000000039 a1 : f635137454d54500
[ 0.683691] a2 : f635137454d54500 a3 : 00000000ffffefff a4 : ffffffff8142e8b0
[ 0.683704] a5 : ffffffff8142e898 a6 : ffffffff8142e8b0 a7 : 0000000000000000
[ 0.683716] s2 : 0000000000000001 s3 : ff6000000274a000 s4 : 00fffffffffff000
[ 0.683728] s5 : 0000000000000fff s6 : 0000000000000001 s7 : 0000000000000001
[ 0.683741] s8 : ffffffff81526090 s9 : 0000000000000000 s10: ffffffff812c13c0
[ 0.683754] s11: ff6000000274a000 t3 : 0000000000000003 t4 : ff60000001870f00
[ 0.683766] t5 : ff60000001870000 t6 : ff60000001870f00
[ 0.683777] status: 0000000000000120 badaddr: 0000000000000000 cause:
0000000000000003
[ 0.683855] [<ffffffff801ca72a>] folio_add_new_anon_rmap+0x330/0x518
[ 0.683924] [<ffffffff801b9f20>] do_anonymous_page+0x2fc/0x4d6
[ 0.683936] [<ffffffff801bbcdc>] handle_pte_fault+0xe4/0x250
[ 0.683948] [<ffffffff801b47da>] handle_mm_fault+0x1c4/0x28e
[ 0.683958] [<ffffffff801aa322>] __get_user_pages+0x33c/0x78e
[ 0.683968] [<ffffffff801aaee0>] get_user_pages_remote+0x102/0x2da
[ 0.683977] [<ffffffff80228c7e>] get_arg_page+0xa8/0x14c
[ 0.683987] [<ffffffff80228a9a>] copy_string_kernel+0xe6/0x222
[ 0.683997] [<ffffffff8022a136>] kernel_execve+0x198/0x2c6

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
