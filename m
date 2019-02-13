Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E50C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 21:57:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44E921872
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 21:57:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bpMhM0wf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Vqf0GKKy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A44E921872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Bh5gKM8GgqvOXHebbNhw08vdN+1bmWlZgKazS2MZ5gA=; b=bpMhM0wfE7BsrYKCvHNbyEEHi
	XY+Dc1mffk9G9Zb+jAWiSvbvA7Kl1LWTB0DCcU7aHXtDisSBLr+XsXUoEiXV8rUWCg9xBgD3BhF3t
	E1RygbAV5ihIh/0NFuN6/KOBPzPo2JdyDJREI6uQhet4I8Ygcl5oaS8WRcSRArVZTsBs1PJYPjymM
	aWpDFDCQU4eXAMKaeEeE5E8DjWZzUm+mE9mGZea+TqGd80AiRVZ33ydth55auFA2jNswH/nCskaF7
	HYSuI5yls+XnZcEHADZg20Y9DB/JhszWm/htqLhdfCXX8uFXTGDmXRYrOU3T4J67C5zgYsM2oAGGS
	bdZUqUnDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu2XU-0004Vx-2H; Wed, 13 Feb 2019 21:57:56 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu2XR-0004VW-GG
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 21:57:55 +0000
Received: by mail-pg1-x544.google.com with SMTP id g189so1807806pgc.5
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 13:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=h0Tt7SZyTDJ6DflBzZW46vY/WCNY5xb1qWVxyZRRry8=;
 b=Vqf0GKKyzNkk4nQm+4Xbx9oKn4obU6LQiO6pE1hKrlrIj4xj4e/mz2ygDTD+y2zeQh
 X3TuRdLAGNV205LVrDX4AAp+B0u4ZjFNs9I/C3WVhgXT/4QO7H1vQgmYq4DRyAXPkfJQ
 gLiYQ8M82F8N8pIbiMd3LcgfC+mdq1Y+1nx99C1EzhtKGE4Beun6oQ0AAxETw9ql02ro
 VQCN5K6tMgSi26tsAAkV29bU+hlGyVuKBl3OdFCyjfRXx3/ffKAA0gDkSB4/98noOevR
 8gNhlGcDpdQUOWLrOjCNvVXO/J9wJCVzcE011GRmlSDtHD/Ij1WDXR96HM//MvYEA93r
 xgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=h0Tt7SZyTDJ6DflBzZW46vY/WCNY5xb1qWVxyZRRry8=;
 b=PLD2qYLgxUyUgL6dZj7DfGWqU1dK6cob9j8z739v0tQ88V7QCPr72So+9bc1etME5j
 zdRtZA54nqNCJP8BT0fwTe2/P9CcXxlQdsW7sg+xMsFIet1pwtSwo2LplQQLDlXeoyKc
 4EIwZCK6nrD+Np+dwT64UMvnMLrxSD1GYL3u0t8Jkt6i2OhdHKU+0W0IgV54HsRgHPdS
 33kzkHyqcdUxr0kbyiZKNctHaWt5z9OW2bJ89Sotfv5jgM6NpxW91fad3jEVRuBqNUCo
 hQIElwcY0qq4U4tt550YCJSbo2apCX5/pF7XJNLgeQZ8eTZ7HLUHo10GPJ3m21FtkiYZ
 ivfQ==
X-Gm-Message-State: AHQUAuZHovV0InQo7dTAlX334hOrlPxGJb3wNPgNsc6C0xIhUF1bvvgT
 wd9DxETMsL4Yl4aZ0/QsndaociA6OPk=
X-Google-Smtp-Source: AHgI3IahHRtXpofHtjjbypHnnY7Tj9D7QERZaFKffAubePpNTQsXnXATfP9TX1zXO7ZCRQrIedHtvA==
X-Received: by 2002:a63:d49:: with SMTP id 9mr338847pgn.27.1550095072073;
 Wed, 13 Feb 2019 13:57:52 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 15sm432030pfs.113.2019.02.13.13.57.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 13:57:50 -0800 (PST)
Date: Wed, 13 Feb 2019 13:57:50 -0800 (PST)
X-Google-Original-Date: Wed, 13 Feb 2019 13:57:35 PST (-0800)
Subject: Re: [PATCH 1/2] asm-generic/io: Pass result on inX() accessor to
 __io_par()
In-Reply-To: <CAK8P3a1-CA_d+tRRKh50+7-PU14AV=9S1JUSF4d-VUxZ+DcW4g@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-30e76674-df9d-4689-8c77-3a3b4723ee24@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_135753_576073_021E134D 
X-CRM114-Status: GOOD (  22.20  )
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
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 andrew.murray@arm.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 13 Feb 2019 12:59:28 PST (-0800), Arnd Bergmann wrote:
> On Wed, Feb 13, 2019 at 6:46 PM Will Deacon <will.deacon@arm.com> wrote:
>
>> On Tue, Feb 12, 2019 at 12:55:17PM +0100, Arnd Bergmann wrote:
>>
>> > For all I can see, this should not conflict with the usage of the
>> > same macros on RISC-V, though it does make add a significant
>> > difference, so I'd like to see an Ack from the RISC-V folks as
>> > well (added to Cc), or possibly a change to arch/riscv/include/asm/io.h
>> > to do a corresponding change.

Thanks, the original patches didn't make it through my filters.

>> There's already a comment in that header which says that the accesses are
>> ordered wrt timer reads, so I don't think anything needs to change there.
>> For consistency with the macro arguments, I could augment their __io_par to
>> take the read value as an unused argument, if that's what you mean?

FWIW, we don't really have a way to mandate this in the ISA yet as there's no 
formal model for either CSR orderings or the IO memory space.  

> Yes, that's what I meant, I should have been clearer there.

That sounds reasonable to me.  It looks like we can also go ahead and delete a 
bunch of arch/riscv/include/asm/io.h now that this stuff is in asm-generic, 
which would cause us to actually start using these things.  I didn't know this 
had all been moved to asm-generic otherwise I would have cleaned this up 
earlier.

I think this should do it, but this does bring up a bit of an issue: the RISC-V 
versions of reads and friends put barriers outside the loop, while the 
asm-generic version don't.  What are these actually supposed to do?

Either way that resolves, feel free to consider something like

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index b269451e7e85..378975f180a7 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -198,20 +198,20 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
  * writes.
  */
 #define __io_pbr()	__asm__ __volatile__ ("fence io,i"  : : : "memory");
-#define __io_par()	__asm__ __volatile__ ("fence i,ior" : : : "memory");
+#define __io_par(v)	__asm__ __volatile__ ("fence i,ior" : : : "memory");
 #define __io_pbw()	__asm__ __volatile__ ("fence iow,o" : : : "memory");
 #define __io_paw()	__asm__ __volatile__ ("fence o,io"  : : : "memory");

-#define inb(c)		({ u8  __v; __io_pbr(); __v = readb_cpu((void*)(PCI_IOBASE + (c))); __io_par(); __v; })
-#define inw(c)		({ u16 __v; __io_pbr(); __v = readw_cpu((void*)(PCI_IOBASE + (c))); __io_par(); __v; })
-#define inl(c)		({ u32 __v; __io_pbr(); __v = readl_cpu((void*)(PCI_IOBASE + (c))); __io_par(); __v; })
+#define inb(c)		({ u8  __v; __io_pbr(); __v = readb_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
+#define inw(c)		({ u16 __v; __io_pbr(); __v = readw_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
+#define inl(c)		({ u32 __v; __io_pbr(); __v = readl_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })

 #define outb(v,c)	({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
 #define outw(v,c)	({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
 #define outl(v,c)	({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })

 #ifdef CONFIG_64BIT
-#define inq(c)		({ u64 __v; __io_pbr(); __v = readq_cpu((void*)(c)); __io_par(); __v; })
+#define inq(c)		({ u64 __v; __io_pbr(); __v = readq_cpu((void*)(c)); __io_par(__v); __v; })
 #define outq(v,c)	({ __io_pbw(); writeq_cpu((v),(void*)(c)); __io_paw(); })
 #endif

@@ -261,9 +261,9 @@ __io_reads_ins(reads, u32, l, __io_br(), __io_ar())
 #define readsw(addr, buffer, count) __readsw(addr, buffer, count)
 #define readsl(addr, buffer, count) __readsl(addr, buffer, count)

-__io_reads_ins(ins,  u8, b, __io_pbr(), __io_par())
-__io_reads_ins(ins, u16, w, __io_pbr(), __io_par())
-__io_reads_ins(ins, u32, l, __io_pbr(), __io_par())
+__io_reads_ins(ins,  u8, b, __io_pbr(), __io_par(addr))
+__io_reads_ins(ins, u16, w, __io_pbr(), __io_par(addr))
+__io_reads_ins(ins, u32, l, __io_pbr(), __io_par(addr))
 #define insb(addr, buffer, count) __insb((void __iomem *)(long)addr, buffer, count)
 #define insw(addr, buffer, count) __insw((void __iomem *)(long)addr, buffer, count)
 #define insl(addr, buffer, count) __insl((void __iomem *)(long)addr, buffer, count)

as

Revewied-by: Palmer Dabbelt <palmer@sifive.com>

when included along with the other diff.  That way we can at least keep the 
macro signatures matching, the cleanup can come later...

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
