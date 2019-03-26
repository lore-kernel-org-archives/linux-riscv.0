Return-Path: <SRS0=JiLF=R5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B798C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 09:43:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B70320857
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2019 09:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KAqcDlNL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Od44wVPa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B70320857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=neGf38Djm2q1G3GxnmXu8vLNbzkg4Gzp1ZH4lz7ww+o=; b=KAqcDlNL8El+iB
	syyu8pJeVBRW54x+LkhiPndK1f1SfayE6eNUXNedvLg6KLndNtmseQiWlO1S2RnfdtMDF40ZN/LBg
	Ojon30JMzN+7musrPoY0cNg9naq5ZvU/dBm0B5VB4wZmv2Ivc31r7IiPM0IGBZVsh8QTfOb/HBSkb
	f5q/EGrUlYVZz+GLyTQgA/A+VZDm9oUFWfgNlTTh35mRw1hZuOsACGi1UR01pooJYn2zcdatH/nWd
	yoz+yhTRiiyRfA1q7MdezscuWXBwLNI8BuIETb/S4ZZbd9nEUCyS9s5gjONxvlMLBl9TL6S7TAxE2
	Jcwnne2hWTEQDoKVux5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8ica-0003FP-D5; Tue, 26 Mar 2019 09:43:52 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8icK-0002ur-FN
 for linux-riscv@lists.infradead.org; Tue, 26 Mar 2019 09:43:49 +0000
Received: by mail-wr1-x441.google.com with SMTP id o1so13448177wrs.13
 for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2019 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nGPxhPDoi8PjJm2gPegJmcCvpyxpN0OAxU2l6yWZTBo=;
 b=Od44wVPa7isf9D2Xwxz51E5Ddk1E6pK+OaoG5Ui5Vnfjrx/osC6/p+rqnGJCk254Xm
 pPn6dfcJhk2XJEiKh97FQ/yLoXqoc2Jex2M185GlCHR9Kan1Vr4geSejI61rI7eGFpvW
 Phz9MZ15JJN8jy83yk+dBc5eCcHseTqD2zCKE7u10RNl3YJ5R/2gZFEbEuVyQIc1Fw0v
 Am8LpbJTfu9R9OWZSat+AqFChxCs1WQgf2AB6cP1/g3KiJqN0qhXZlrczNRm2tRp/0Wy
 Lmq3h3RXIKWB8m67YQj2Ik+PNyzSlWWl1+IssZk5DoUp3hkwUb0G6TLIBya2SoBWFaEu
 Is7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nGPxhPDoi8PjJm2gPegJmcCvpyxpN0OAxU2l6yWZTBo=;
 b=cZcqMxS6DKDdybaT6mGeOe2YCGSiT158sTqivH5EE2ScQZ3STHw6+wxfra3nAK94EY
 SuTG6jPXbBQB7h2r0NLwtjkN6synp0h4/VVZkfJRTJN1UgwR2POb330ZVPr9AUVheSgD
 e8Yee+U2gcGflpRTBUtpTLUrfBIWjenzJManujwamO5BA6pw8H8aWKRbD0sJt8v7sDS5
 JqNyudpB5JUm9JoOa+wnfFp+I3U9voSpNlKNMJRLf3CMjlDsfKa76dZeTws5S5NiJT9i
 +Q5IMWQ/uUFn2ps1415ookXSExFFoOPQxZjAnRh34x1ENCxpKfQzmfwUubfR24Qh3F8s
 H73A==
X-Gm-Message-State: APjAAAVvrtDS1r/a5qtP+Vfdo3icpyLaFWir1FEbASgNacKYri4wJvp9
 ucRUHkhL6aPtxeBL539XSkcMQfoTeaa880KkaHuUYau3FBw=
X-Google-Smtp-Source: APXvYqxeyRjks0FyHDs0qT4aNGXl/tDCuMxw3uvf6S+381aX/Mojo14PCFl4UCnpQuPqkLtTgYVZ0efepLJ7l1PY0Oo=
X-Received: by 2002:a5d:4087:: with SMTP id o7mr7367180wrp.9.1553593412368;
 Tue, 26 Mar 2019 02:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190325092234.5451-1-anup.patel@wdc.com>
 <20190325092234.5451-5-anup.patel@wdc.com>
 <20190325113935.GD27843@infradead.org>
 <CAAhSdy2dds7pp8=XX+zbKbMoWbgjPxP6r4aMZJeHyqHV2MP4CQ@mail.gmail.com>
 <20190325145919.GB14826@infradead.org>
 <CAAhSdy2je-_=AHPawbV-8cUR0P7WvqDZ5wNdEmDVQkR-a88Eog@mail.gmail.com>
 <e12f6bc2-c993-1dbf-37b8-9562870806f1@garyguo.net>
In-Reply-To: <e12f6bc2-c993-1dbf-37b8-9562870806f1@garyguo.net>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 26 Mar 2019 15:13:21 +0530
Message-ID: <CAAhSdy00nORndLg3mV9aodefUrLKd90fxV=Q70hH7DfLaz3w4Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] RISC-V: Allow booting kernel from any 4KB aligned
 address
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190326_024337_420761_D37A65D7 
X-CRM114-Status: GOOD (  13.38  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 25, 2019 at 11:06 PM Gary Guo <gary@garyguo.net> wrote:
>
>
>
> On 25/03/2019 16:16, Anup Patel wrote:
>  > 1G mappings will give better performance compared 2M mappings.
>  >
>  > This will be very useful for performance hungry system with lot of RAM.
>  >
>  > This patch selects 1G or 2M mapping at runtime based on load address
>  > alignment.
>  >
>  > Regards,
>  > Anup
>  >
>
> Not always the case. In general, if set-associative or direct mapped
> TLBs are used, then either
> 1) separate TLBs are used for different granularities. Usually very few
> entries will be there for 1G mappings. E.g. Intel CPU's D-TLB has a
> separate array of 1G page TLB which is only 4 entries.
> 2) a smaller-granularity PTE is "faked" by page walker and inserted into
> the TLB. E.g. Intel CPU's I-TLB can't hold 1G entry at all.
>
> In either cases the performance won't differ by much. In fact if 1) is
> used there are cases where performance can be negatively impacted by
> using larger pages.

The above is just one way of designing/organizing TLBs in HW. It is also
possible to have a unified-TLB (like ARM/ARM64 world SOCs) supporting
multiple page sizes in each TLB entry.

Depending on the TLB micro-architecture the performance gains will vary.

Irrespective to TLB design, there will always be some gains because
after all we are saving page-table walks by creating bigger mappings.

In case of virtualization with nested page tables, the savings can be
even bigger because it's a two dimensional page table walk. For example,
let's assume M = "number of levels in guest page table" and N = "number
of levels in hypervisor page table". Now, number descriptor access would
be "MxN + M + N" so if we are able to reduce M or N or both then it will
save lot of memory accesses.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
