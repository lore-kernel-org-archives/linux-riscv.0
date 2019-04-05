Return-Path: <SRS0=YX5X=SH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B19DC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 21:17:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A3B42173C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2019 21:17:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EpdoTa1s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ixL2l2Vf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A3B42173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Gfj3sN3scga8NcwDHeJa3gDxbu1TkpEV4TD4qsGCWUI=; b=EpdoTa1sprQKCKYM89ZNqXZmO
	6kvSHN4RW6tTcQ2+M4YcEqGZTS4z5gofAs7fkMVIjHj0dZHv+965dUKfu/x5DEzGn8JLuaXzer4pI
	1zPKsqtOTeUXR2aKoHNSM0f6Rt4PcHz40P5JrCp6rkBDNZpCu/o2M5Ivf8VD5eWtc+f/BiU8iwfX7
	saghkXmJECh81lQMZkDI+MXk9kGXSumr6SKSpNjOPvCRWzgkUIRvnqD8vamXppwiFfjIGMJrdQYyJ
	tZdA+lsSyT8SGpbhSMcKWnJ1CdZ8OvDjDQAndapYMWMw2PgKEynxFomh2lqWic49lyTkb/IW0kEP0
	1BoqaGhSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCWDM-0002tv-K1; Fri, 05 Apr 2019 21:17:32 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCWDJ-0002tX-NN
 for linux-riscv@lists.infradead.org; Fri, 05 Apr 2019 21:17:31 +0000
Received: by mail-qt1-x843.google.com with SMTP id k14so9137717qtb.0
 for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2019 14:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=i1e4wK7Wp/95BF47ls3i/xUTVnvFhsWDCLNPMoB/w6I=;
 b=ixL2l2VfaumUHMV8DKvjljQXGinkk4t//a60hFA8P9qeQurcO/nNRbapEWSRhk5qGm
 t6/Gu++IXEGPSncAeLvXDX8ODSfsL7z8ci24Yld8/N6JQFJIo4sPsoEBmfWodb9K35hl
 TKGMi+71VqJ/PjUF2x+qqHzqPlAvtPIjnSx37ChtA1hgXb8QSgwZycLUyBSf/FLkp+FC
 FUsIBkBdhipUtJs9Dr8gn6c6BXSPntg8GZfEuvU8vhS2hh7IIL9SGzqcc8B31fvaZ7Ob
 ImS7IPMnHN3XjJjRt7roSAV/0EgkzT8dssQ46Zao4pqrhfHE9WLt6ISBoQbcA/Nz2i57
 6bcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=i1e4wK7Wp/95BF47ls3i/xUTVnvFhsWDCLNPMoB/w6I=;
 b=Bz54E2t5CMqnsK5zyJv4MU63PRx6feJ4n9Yaw+Tf68+r8ukua8b2sAGFxup1Q6rcCP
 +H+Ov/HyYYO5BTTQwTGCfDtteidF8CxRcq9e0Jl7BaCh7dLdE5frBwlDl4R9Mx7InE0A
 Q8oNhHlpvLRTYBCdNfXkNWrhzn5nk5NoSnbpnnePntf78Qj2ekQb8n90Z6H8omu6Mm36
 RRilqiTsBncYx0KnVIZDg/vZ4XQjJ+MD4QSSHx4TuiGD2qtnnXRJcDpN7BU6SvySkhcS
 tGh9f7Yha70K5IQ7PXmbU1kIPIG/u1W+lsp5m44c3y+s50OY20fn71Kqj90Y+3v0xZM7
 Ft/Q==
X-Gm-Message-State: APjAAAUPUve4lRJHUHwwp8ajSPIdcxSVsPNEqkNb88Cf5WkYC5Jd/BOJ
 o3ISb/73D6a4GrwWWwJDPt1Rkg==
X-Google-Smtp-Source: APXvYqyZF9VJqS+i3Kd0Boli1jbCdp7vkSNuAywV8rNAZKej8AKs5tHkV7ZHIaz5r2tUUgXFJavNpA==
X-Received: by 2002:ac8:65c3:: with SMTP id t3mr13074389qto.12.1554499048388; 
 Fri, 05 Apr 2019 14:17:28 -0700 (PDT)
Received: from localhost ([199.255.44.128])
 by smtp.gmail.com with ESMTPSA id o136sm12487543qke.48.2019.04.05.14.17.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Apr 2019 14:17:27 -0700 (PDT)
Date: Fri, 05 Apr 2019 14:17:27 -0700 (PDT)
X-Google-Original-Date: Fri, 05 Apr 2019 11:20:51 PDT (-0700)
Subject: Re: [PATCH v3] RISC-V: Fix Maximum Physical Memory 2GiB option for
 64bit systems
In-Reply-To: <CAAhSdy0k0gSipzne1=agZzTWa0URoq3OH7vefJsr2=SEMyJ1tg@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-6bd91073-ecae-4da5-8332-0e6c9f8aaac1@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_141729_847995_4C62D47E 
X-CRM114-Status: GOOD (  17.24  )
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
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 04 Apr 2019 23:01:11 PDT (-0700), anup@brainfault.org wrote:
> On Fri, Apr 5, 2019 at 11:24 AM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Fri, Apr 05, 2019 at 05:49:34AM +0000, Anup Patel wrote:
>> > The Maximum Physical Memory 2GiB option for 64bit systems is currently
>> > broken because kernel hangs at boot-time when this option is enabled
>> > and the underlying system has more than 2GiB memory.
>> >
>> > This issue can be easily reproduced on SiFive Unleashed board where
>> > we have 8GiB of memory.
>> >
>> > This patch fixes above issue by removing unusable memory region in
>> > setup_bootmem().
>> >
>> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
>> > Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> Btw, what is the rationale behind even offering the 2GiB option and
>> the medlow model on 64-bit?  Do we reall have use cases where the
>> slightly more effient generated code matters so much to keep up
>> the support burden of this mostly unused and unusual configuration?

I'd be OK dropping medlow on rv64.  The performance impact of medany is pretty minor 
these days, and even back when we added the option it was mostly paranoia about 
the linker being correct.  medany has been solid on rv64 for a while, but we 
did recently find a pretty major toolchain bug in medany/rv32 so if we were to 
drop that we'd need to enforce a pretty recent binutils version (the latest 
release is OK, I'd have to check on the previous one).  I'd prefer to avoid 
that, and since medany doesn't really buy us anything on rv32 it seems fine to 
leave it that way.

Given how many issues we've found here recently I doubt anyone is flipping this 
option away from the default for their base ISA.

> Yes, if we want to use medlow with 64bit then max physical memory
> can be 2GiB. Otherwise, I don't any practical use of restricting max
> physical memory to 2GiB on 64bit systems.
>
> BTW, as-per latest revision of RISC-V priviledge spece the MMU SV32
> mode will be able to access 34bit physical memory (i.e. 16GiB) so
> max physical memory 2GiB will also be required for 32bit system for
> medlow.

It's a bit more complicated that than.  The 34-bit physical addresses have been 
in the spec for a long time, but we've never bothered supporting them in Linux.  
Right now we assume we can map all physical memory into a contiguous region, 
which is why we tie PAGE_OFFSET to the maximum physical memory.  It's 
impossible to map all physical memory with 34-bit physical addresses on a 
32-bit system, so we'll need to break that assumption to move forward with 
34-bit physical addresses anyway.

Additionally: medlow can map everything on 32-bit systems anyway, so moving to 
medany doesn't buy you anything.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
