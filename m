Return-Path: <SRS0=fzfn=4O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4C0C4BA21
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2020 19:14:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A25F320656
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2020 19:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j7ASc+S8";
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lynomhex"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A25F320656
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=II+mmd4o8Thv9U8AkaEb8+H9vZCo78uQ32TXbZDWSJs=; b=j7ASc+S83V+vsM
	VoRZrgRZN0qWGNHJUg76VwPeUIiN+Rrc++FL18OM1/PokvCOYLbR+uXSZAEXMlBzhI5j89pmi6Ecf
	Zx6GePivfR+dCaoQcuF1kNQKHnn77q/VMGWy2suW6gWd4H4fNTEYV0AQbXemrDOQZGSanH9+cNtzG
	E774O8x8k0w6o4vVqPjnEn+A2j7oVj62sKAOCVifL9G5DSA3/CuA9FIYvlJMFg0N/Nn01mGqaAkaP
	FHgD9SnKU5mmoWqk5K7C4wwNKhP9xM1Vcq2Um1961jOcpXdxPDJwa431u202UeJciPbq4jWAl616N
	DUBuLurvIu8TcL9C/Lsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j728y-0007tV-UH; Wed, 26 Feb 2020 19:14:52 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j728w-0007sq-63
 for linux-riscv@lists.infradead.org; Wed, 26 Feb 2020 19:14:51 +0000
Received: by mail-pj1-x1042.google.com with SMTP id n96so55095pjc.3
 for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2020 11:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=II+mmd4o8Thv9U8AkaEb8+H9vZCo78uQ32TXbZDWSJs=;
 b=lynomhexXn+T3hobct4dEhAkKUBooMzG46ig+lFR3nqPLY1Tcs+kYI72Bztx/AxP47
 rZ2gV/crLo1Q8v7yuzzJDCkb1eIw11IcOCNhyhp7oPNRNdnhYGiE1ZSlcEZQX7QUPXfc
 0ftFf1cnM7fFsqy3Oxmj1Jgo+NFodElHbtmfXhOe0zCrMFERtQ4IFv2OzwoZYemUXxEO
 v8fRLTqd65edidpf7lVVbSGWpVqlwMMVM3uyMn6MaYzRiG963bdh60ajgm4z9pFOiYjs
 2U8CYAYjaGFrsHneTOICUYUvwaRJkgSh57sB3zp2esinOaeqXsqo8F+3E6/UIq4tAl9B
 rLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=II+mmd4o8Thv9U8AkaEb8+H9vZCo78uQ32TXbZDWSJs=;
 b=VbOdSQk2Sm6b940q56Scgunge+1uLzcB/3lGLek6oWbiOF8Jgk+Aj9n3igSnjwarKs
 AE8iB7g9N9p7a8RCpuCrkF+G0JEK8MKkyDbN4ag1/aVJWi3VnHw3SxwrFBrsi43TcG3W
 I5TDwOjBIjAo1blKa0AT1QdOiJaND1eMfFx7Upn51fmyeb6qLWEa+1FlaMb/BVWkzZ3X
 9FGnxrnL3ewDv+xxPLWvN1JeUKibnR7ugcuCaT9KvNQjX7A2ij3q2n3zqj2hSl9kPyso
 p31Ltj56AyXQe61kQYaHag0fL7+p7zqYR/xn/f9gK/MxZPzkN3RPh4R9Wk6bwadiRQxT
 3ofw==
X-Gm-Message-State: APjAAAVvVF6xU2GIUT9p+rvSil20WeCRJXxPVCDIbasXYijfhKB+x1Zk
 LHWE/xZyM13lBDLZmMZaUUBLtQ==
X-Google-Smtp-Source: APXvYqxgwE8i5lOdoCI9nD6vqdTgXjxGcDQJ2HHnuQj5ks3jysXLE7aUpKyoGIoUfgaath9Z67nAAQ==
X-Received: by 2002:a17:90a:a587:: with SMTP id b7mr643340pjq.18.1582744486510; 
 Wed, 26 Feb 2020 11:14:46 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id 5sm3895584pfx.163.2020.02.26.11.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 11:14:45 -0800 (PST)
Date: Wed, 26 Feb 2020 11:14:45 -0800 (PST)
X-Google-Original-Date: Wed, 26 Feb 2020 11:14:44 PST (-0800)
Subject: When are my patches getting merged [Was: Re: [GIT PULL] RISC-V Fixes
 for 5.6-rc4]
In-Reply-To: <5226d756-e348-29d1-258d-0ab4b63c0677@ghiti.fr>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: alex@ghiti.fr
Message-ID: <mhng-75f261ed-b883-408f-84ea-6425b49abb20@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_111450_248815_A267B2A2 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

[Moving Linus and linux-kernel to BCC, as it's a RISC-V thing]

On Tue, 25 Feb 2020 23:56:54 PST (-0800), alex@ghiti.fr wrote:
> Hi Palmer,
>
> On 2/25/20 6:37 PM, Palmer Dabbelt wrote:
>> The following changes since commit 11a48a5a18c63fd7621bb050228cebf13566e4d8:
>>
>>    Linux 5.6-rc2 (2020-02-16 13:16:59 -0800)
>>
>> are available in the Git repository at:
>>
>>    git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linux-5.6-rc4
>>
>> for you to fetch changes up to 8458ca147c204e7db124e8baa8fede219006e80d:
>>
>>    riscv: adjust the indent (2020-02-24 13:12:53 -0800)
>>
>> ----------------------------------------------------------------
>> RISC-V Fixes for 5.6-rc4
>>
>> This tag contains a handful of RISC-V related fixes that I've collected and
>> would like to target for 5.6-rc4:
>>
>> * A fix to set up the PMPs on boot, which allows the kernel to access memory on
>>    systems that don't set up permissive PMPs before getting to Linux.  This only
>>    effects machine-mode kernels, which currently means only NOMMU kernels.
>> * A fix to avoid enabling supervisor-mode interrupts when running in
>>    machine-mode, also only for NOMMU kernels.
>> * A pair of fixes to our KASAN support to avoid corrupting memory.
>> * A gitignore fix.
>>
>> This boots on QEMU's virt board for me.
>>
>> ----------------------------------------------------------------
>> Anup Patel (1):
>>        RISC-V: Don't enable all interrupts in trap_init()
>>
>> Damien Le Moal (1):
>>        riscv: Fix gitignore
>>
>> Greentime Hu (1):
>>        riscv: set pmp configuration if kernel is running in M-mode
>>
>> Zong Li (2):
>>        riscv: allocate a complete page size for each page table
>>        riscv: adjust the indent
>>
>>   arch/riscv/boot/.gitignore   |  2 ++
>>   arch/riscv/include/asm/csr.h | 12 ++++++++++
>>   arch/riscv/kernel/head.S     |  6 +++++
>>   arch/riscv/kernel/traps.c    |  4 ++--
>>   arch/riscv/mm/kasan_init.c   | 53 ++++++++++++++++++++++++++------------------
>>   5 files changed, 53 insertions(+), 24 deletions(-)
>>
>
> What about this patch https://patchwork.kernel.org/patch/11395273/ from
> Vincent that fixes module loading problems described here:
>
> https://lore.kernel.org/linux-riscv/d868acf5-7242-93dc-0051-f97e64dc4387@ghiti.fr/T/
>
> Do you consider it for 5.6 ?

I haven't gotten to them yet, but at a glance it's probably a big enough change
that it should should go in during a merge window.  The module loading stuff is
a bit of a rats nest because it never really got finished, so I want to make
sure things get sufficient testing over there.

I'll try to take a look, though -- it's only ~1K messages deep in my inbox, so
there's hope :).

