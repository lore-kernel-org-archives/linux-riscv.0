Return-Path: <SRS0=QRI7=AL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACC6C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 12:48:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 046322082F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2020 12:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tz+sOoQV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="L7LsXFHj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 046322082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PjW1yd6EAIalAQjcjxnwnaXfpNl1E/5EiSevGgwxRSU=; b=Tz+sOoQV4uwoeAXlksoTvVSJ3B
	RzrMkqIKXtLeGBzETgKCdnqK2yR86J9SLSKuL1MS+9tFPYTplrpvvqzlJFWxmYxJ9R4E/YFNDDLFN
	lz7ruypwvt5GkHWCU2WXCynHDq4yPzeASI/BrOR9YTAQk+rNBSYNqlcFDSPdpFIY254bkleLen4vM
	L3E7UtCSJy7C+Z2SLeuvk87ZIFrRgOGtRQ6w2rcqFla1bjGgRwiJY7l538ljzl/x/pRo4ORqZPCzC
	niaJbimPj4mXWA9iABgacTPfsWruKQQ28FTOYxenGRgx8U7w+mfN1Hcqui4acD4nDFSFZqgpApF5X
	QkszPsBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqFgw-0007hq-4a; Tue, 30 Jun 2020 12:48:50 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqFgt-0007he-A1
 for linux-riscv@lists.infradead.org; Tue, 30 Jun 2020 12:48:48 +0000
Received: by mail-qt1-x843.google.com with SMTP id z2so15420420qts.5
 for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2020 05:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CVRHLRbIFsGXExHi1n4/B5v1cNDReShuKCh1k8ZgztM=;
 b=L7LsXFHj3P6l8k/gZtzgdHwMrXYYXnyJ5gZFGbc1rz0bxKzdg9cmIPCSc3Ml9dilSN
 SxikM9/IeZUEsb9i4j/FugVEQiycjcZLtr6v5bJjF3SrIX4jQ5dA1ygyQb7g//qRKtaz
 0LPELfFBcMnn5gs4x6h0uHKMYGfqYkhLmqqn/p1h4enzVUP2IFNviH4PQzzk4OwhvtFn
 njtYQT4JTYfcaiRFE22zYMPmd0urVAPP/SkDdpqS4WHfUFbAwB8e6GOwjXoi/WlbTjWj
 1ZQM744KYXgjqbjl6veBh2B9PZOGl6kPcUXfZHCyFOu7GWEe+zxOa8lESrKIGC/xavq1
 y9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CVRHLRbIFsGXExHi1n4/B5v1cNDReShuKCh1k8ZgztM=;
 b=dxgD1apAZu8FibPze5DGYeSqZiSU3J2pbbYyc8cF8nvL0Kq6W+xKuS54xELmy3fpD/
 k1uLOf9c9WgPw5asuSDiAqKvxqiAG6Bk7j2B0YE/TZOTAbpwame+Oa/iMXmDtWWxkHRw
 ofa1KkfEEssVgXStfdV/RvSmdrv3qI9ptE+pap0pKGQiQp5Fo9EaQLxyypEjuv1Zp8aI
 Qz96K3Cd7+8aHsSYQTujGp6cUgcUGRORod9pSMhbActCqS6OIsKCknBMWtRPyckCVPN0
 bdLscfsLddB6pV0IYBU1ohaPMcSQwtYbSvvzvPlATa4uigZoknDPXxjITmn9iYC0f+Ro
 tiYQ==
X-Gm-Message-State: AOAM531aNm6VcvzfopWpMtTBVzwLTGAkMynhFsNBSsR7TOYXisjH8krl
 TJjg5XyThEkCsfTPCEBSTp+BwEMbUdox3ocXTJMFeA==
X-Google-Smtp-Source: ABdhPJyZNrWMJWCst2vNmIshx9hInAVog+Bc+Ufh2sdMQAE8JrzEa8RRNQ8Q3dbNvyP9W9AVaok0yxJsFjavgMqEcIE=
X-Received: by 2002:ac8:260b:: with SMTP id u11mr20854969qtu.380.1593521323330; 
 Tue, 30 Jun 2020 05:48:43 -0700 (PDT)
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 30 Jun 2020 14:48:31 +0200
Message-ID: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
Subject: syzkaller on risc-v
To: Tobias Klauser <tklauser@distanz.ch>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>
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
Cc: linux-riscv@lists.infradead.org, syzkaller <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hello risc-v maintainers,

Few days ago Tobias ported syzkaller (kernel fuzzer) to risc-v arch:
https://github.com/google/syzkaller/pull/1867
Tobias also provided nice instructions on how to run it using qemu+buildroot:
https://github.com/google/syzkaller/blob/master/docs/linux/setup_linux-host_qemu-vm_riscv64-kernel.md
I tried to run it and it works. I wanted to write down some findings
in a public place. Some may be known, some not, some may be easier to
address, some maybe harder. For now my goal is just to document this.

1. KASAN does not seem to work.
I've tried both v5.8-rc2 and 1590a2e1c681b0991bd42c992cabfd380e0338f2
with/without KASAN and KCOV, both inline and outline and all
experiments point to broken KASAN. Boot gets to "INSTRUCTION SETS WANT
TO BE FREE" banner and then it hangs dead in secondary_start_common,
you may see some details here:
https://github.com/google/syzkaller/pull/1875#issuecomment-650545255
KASAN would be a prerequisite for testing risc-v on syzbot.
The recent KCOV patch works well, though.

2. I've also tried to convert our beefy syzbot config for x86_64, it
includes both lots of debug configs and subsystem configs:
https://github.com/google/syzkaller/blob/master/dashboard/config/upstream-kasan.config
I've passed it via olddefconfig for risc-v, disabled KASAN and tried
to boot and got a similar boot hang. I did not try to bisect the
config further.

3. Running with a small config (defconfig+KCOV) initially I got stack
overflows all over the place. Here are some samples:
https://gist.githubusercontent.com/dvyukov/0b6c7d93e2059f91241677a115c8e1ef/raw/947b7626f724262ba6fa3eb67b81f1a3f65cb419/gistfile1.txt
I ended up doing:

--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
-#define THREAD_SIZE_ORDER      (1)
+#define THREAD_SIZE_ORDER      (2)

This eliminated stack overflows.
KCOV may increase stack usage a bit, but not radically like KASAN. So
I would assume some stack overflows can happen without KCOV as well.
So either we need this, or at least bump stack size under KCOV.

4. In lots of cases I did not get meaningful stack traces.
E.g. WARNINGs don't unwind past the exception, which makes the stack useless:
https://gist.githubusercontent.com/dvyukov/717c748dd5cc20f2214026331467cd9f/raw/dd5da078a0bc0210ecf00bdee1112d610305189c/gistfile1.txt
This also happened a dozen of times for stack overflows:
https://gist.githubusercontent.com/dvyukov/6f58a866c8ba53343fd2142b1dfcfffa/raw/1ac463c5924fa53fbe99fd8a4e093af3e3429c0f/gistfile1.txt
also rcu stalls did not get stacks past the timer interrupt:
https://gist.githubusercontent.com/dvyukov/bbad28c67d55fb4e12936da13c533cf5/raw/fb41b4805238fed753b39641d6c7e496519f7f56/gistfile1.txt
and various kinds of exceptions did not get any meaningful stack traces:
https://gist.githubusercontent.com/dvyukov/59fa9ef0f8e1f780c75a2f561b1efd24/raw/91e1f60c23992e6985fc155c2cfb081a30da7662/gistfile1.txt
This makes it hard to debug, but stack traces are also required by
proper bug bucketing by syzkaller.

5. Once we have proper stack traces, we will need to extend syzkaller
test case base to include samples of risc-v crashes:
https://github.com/google/syzkaller/tree/master/pkg/report/testdata/linux/report
and crash parsing code to properly understand and bucket these crashes:
https://github.com/google/syzkaller/blob/master/pkg/report/linux.go#L914-L1685

6. I observed lots of what looks like user-space process memory
corruptions. There included thousands of panics in our Go programs
with things that I would consider "impossible", at least they did not
come up before in our syzbot fuzzing. Also some Go runtime
"impossible" crashes, e.g.:
https://gist.githubusercontent.com/dvyukov/fb489ed93f7180621c71714ee07e53dc/raw/a7d2e98a56da17af2aec79c164cd3a8e154ecf5c/gistfile1.txt
Maybe it's a known issue? Should we use tip instead of 1.14? Is it more stable?
Though it's not necessary Go b/c kernel contains hundreds of memory
corruptions and we observed kernel corrupting user-space processes
routinely. This is especially true without KASAN because kernel
corruptions are not caught early. However, the ratio and nature of
crashes makes me suspect some issue in Go risc-v runtime.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
