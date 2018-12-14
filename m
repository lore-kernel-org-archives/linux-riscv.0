Return-Path: <SRS0=7WNQ=OX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F32C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 14:21:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D191F20643
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 14:21:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fpgg60sE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6NmpfZh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D191F20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=57JGS2uMzHEuMsiF8RfWx7luY+zihROg2cn1OQwHGfg=; b=fpg
	g60sEaoUojqFR0AVfQJvYOekEb7EU4h5qzc9nyMWztg3u5zFpPG2l4i1HlNqu0tFl0W7G4rR5HlOv
	wJK08nrKOkQaZyiZ6yfZ9Xh03C5RmpvZosesOyp6MHsqACCDqWhYCsl8jTTTDCRnMiIkVTAjc3KCa
	JsSDrR7DgZ5L2zsUkeUC7EIK8rhpDV5n/IO6Eims6NFTMHxlhYYTWSrh5zmXuAI+sqShC8iZlTqO8
	xtWuVH/R3PXQ6EIf0MS+UJALoUa/T+G12F8aYuGlB7SxF0xVzcqGRed9ucC0zktnIDollJWKO0IFu
	UQwY2hbKLc4qp8WrBf2drlKyImH+xjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXoKs-0004DX-4a; Fri, 14 Dec 2018 14:21:02 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXoKm-00041l-9g
 for linux-riscv@lists.infradead.org; Fri, 14 Dec 2018 14:20:59 +0000
Received: by mail-ua1-x943.google.com with SMTP id e16so2024556uam.12
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 06:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4eh125GcVcHnddteb7zeVVD8l1vR4U3v4scNLd+7wz4=;
 b=F6NmpfZh13i6fM4/vUCuedKEMrwvWb03PPop/WXABUEtbU+4Fy/R7ziN9pbXBgVF6N
 ypxZrq+wdoctDo1ThESHTUIj+EIvI63m41nhhZRJbulLkHz1Ij4AaWNOwfdqQPzQEwsR
 iBsiWCT5oCbdCJpK3rkQcsFuOiHLV3ellrYChsMT14dSJEeleH4XBNE8mfX3m7hAnV9r
 fUD2Dtn8fmfkADxViXDeFxiwsHIGKfzPD4wcPgGbIWWzOHIqf6QVQWDD1EYQyptediT7
 Hake7c8uQEj4tDAoMADtpMrMJNxOsV533VBrSkBBK16dCx4TYjAH37xu/lkMssBehFp5
 sgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4eh125GcVcHnddteb7zeVVD8l1vR4U3v4scNLd+7wz4=;
 b=PinGx2QqdIX7oM4jYnvR/X83Sc5W+ZtZep+XhNM7NiHDokSYdr9c8ZP6JlzAEsnsm8
 pU1DN1Ddhd5qOrNPRMX7M7MSLy+0Rs5Y6FpQD0mXQabk+5255fBQV0fM3lfr/GEavKCv
 qtLIEE43hmikzrb8y4wvgiPHfj0CRutAWisUbfOy4kDX4Jd/aPSP41NECVYcXmJUwo5G
 Phk0/JYD2WLNhDOsUzpqTseEmY5bP6LMrfaOXmCxhYKD2kpoj5cF9r432bE+t5xHDLGL
 ixMTh/uxus9NSDm30l/Oyhx1MAAQ+uhOtOXH+knHu1ZVKvOONjZoE3Ufs78bItz2i92+
 pUDw==
X-Gm-Message-State: AA+aEWZ4XGHgOv86wigd0oWlp9x12hiL/u1NKtB+z41XMLh+MRiKaJSh
 F34xKQ69P3/p7pMa9mCgjp5MaRJOE7DUQ95K2aO66S5ydNQ=
X-Google-Smtp-Source: AFSGD/VFR8VvMp5t7fXxryuEnQTbR0nPWhz1gjpY1AZkIWUyjANVRLbskLxyclIk9ydO0jat5OjU4R+dWtqiiVWAOGc=
X-Received: by 2002:ab0:8d9:: with SMTP id o25mr1423768uaf.127.1544797244240; 
 Fri, 14 Dec 2018 06:20:44 -0800 (PST)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Fri, 14 Dec 2018 19:50:31 +0530
Message-ID: <CAOuPNLi-_R4+wpc834Ku2PkHcHgSydA2HT_s1aYsMeNRqpDg=w@mail.gmail.com>
Subject: riscv-tests-benchmarks tools not working on qemu linux
To: isa-dev@groups.riscv.org, linux-riscv@lists.infradead.org, 
 sw-dev@groups.riscv.org, Gurucharan Kaur Saluja <gurucharankaurs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_062056_684573_97886942 
X-CRM114-Status: UNSURE (   7.17  )
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

Hi,

I am interested in using : RISCV/riscv-tools/riscv-tests/benchmarks
But I am failing to execute it on QEMU environment.

This is my environment:
RISCV: rv64imafdcsu
Linux version: 4.19.0-rc8-00001-gf0a7d18 (gcc version 8.2.0 (GCC))
Tool chain: riscv64-unknown-linux-gnu-  8.2.0
rootfs: busybear
Platform: riscv-qemu
Command:
qemu-system-riscv64 -nographic -machine virt -kernel
PK/riscv-pk/build/bbl -append "root=/dev/vda ro console=ttyS0,115200"
-drive file=busybear.bin,format=raw,id=hd0 -device
virtio-blk-device,drive=hd0 -m 1024M -smp 4

Building the tests:
#/riscv-tools/riscv-tests/benchmarks$ make
Note: We changed the tool chain to:
RISCV_PREFIX ?= riscv$(XLEN)-unknown-linux-gnu-  (instead of unknown-elf)
All benchmarking programs compiled successfully and created program.riscv files.
Example: multiply.riscv

After this when we execute:
# spike multiply.riscv
We get this output:
mcycle = 24098
minstret = 24104

So, we assume this tool is working on spike.
But, when we try to execute the same on QEMU environment, it crashes
will illegal instruction:

root@(none):root# ./multiply.riscv
multiply.riscv[77]: unhandled signal 4 code 0x1 at 0x0000000080000040
in multiply.riscv[80000000+1000]
CPU: 0 PID: 77 Comm: multiply.riscv Not tainted
4.18.0-rc6-13938-g4060877-dirty #14
sepc: 0000000080000040 ra : 0000000000000000 sp : 0000000000000000
 gp : 0000000000000000 tp : 0000000000000000 t0 : 000000000001e000
 t1 : 0000000000000000 t2 : 0000000000000000 s0 : 0000000000000000
 s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000000000
 a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
 a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000000000
 s2 : 0000000000000000 s3 : 0000000000000000 s4 : 0000000000000000
 s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
 s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
 s11: 0000000000000000 t3 : 0000000000000000 t4 : 0000000000000000
 t5 : 0000000000000000 t6 : 0000000000000000
sstatus: 0000000000002020 sbadaddr: 000000003002a073 scause: 0000000000000002
Illegal instruction


So, we wanted to know how to make these tools works for normal Linux
in QEMU with riscv64-unknown-linux-gnu tool chain (without spike)?
Moreover, we want to make these tools works for qemu-arm linux as
well. Is it possible? What kind of modification will be required to
support it?
Or, is there separate tools for linux?

Or, is it possible to create a simple and common benchmarking tool
like: {Sorting, Multiply, Matrix Multiply, Tower of Hanoi, Factorial,
etc.} using normal C programming and system calls (if required)?
But, question is, how should I measure it?

Please help with some reference.


Thanks,
Pintu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
