Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59057EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GL8dk3JEllWl8RMvWkwVYOQrWbO8UM6yY0tiJ/gj9+0=; b=c94IIqOWPhW/CTjDJY1zDhKjjx
	19iwSFuNO9tQOpGWhnUlUTowjWQyEyTh3gnyzt1of4n2OzgrxVniHFNDRDM+fTP96Pf0pmyxpmZhr
	/qEODNvfr/1hzgBMt1UV/U0HhX9peyq7A4T+Z7BbPRXq9NNcunbvaTfh5nle7oRBkpp0OMfAILrJ5
	kq0rRv9dSIZxq975Fur3q1ORcVf4cwtAteR4HHxvIFyGVh7YBNqJ9N8b+8qPoJAlfgC2b8CPKPEEB
	Dkm2MojZ45aGjVg2MJVJMkgMAPPaFDDC2czaydnsq5lK+JxNmwry6npG91D5/xzLxRui9bSLSj2sD
	NjBVhrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdZJ-000kRE-2n;
	Wed, 12 Jul 2023 17:24:01 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdZG-000kPH-2i
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:24:00 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6687446eaccso6443868b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 10:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689182636; x=1691774636;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tQ2ZbbyLLdcDDhvAxA5qEVgxy8o1H8UkklbLpk31ig=;
        b=hZjwQME8K62afCa/lKxAV5oDAQbtGEBFMc9MArh/PEz7oE9G6vUVAfOnb/9R4vBGxK
         1p1NcH+qnX13Ru4H4jouGvPcdhK1h6k+qCLXI8YVgtZPBu4W+jMhiqB+u/ZVxaEw0Hp6
         ihr02PgYKEWNMlwcQfr2/i7L4yiGRocd/mcHeDedHPSxJpwwaeiIvvgp1H7KSoPD7f+8
         o0jddnMArxfV1MgrK7mGxmRLv6ix4n+Nl1ki4KAFn1VZOXE1Fc/kMqnaq33dhWTBTKYY
         g2APClzhteWp3vYwyHS6lDvUJbrZdjwu2siZMPrkDOwHRcHeAF+ln9H611Ur9MnJmfCJ
         lZFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689182636; x=1691774636;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tQ2ZbbyLLdcDDhvAxA5qEVgxy8o1H8UkklbLpk31ig=;
        b=bthoMcsP/TNb7iQjxzXAQ3+ULiZQPEf9JcC1nHh5jxde2sP9KaRiWtR2+rF7M+4uLZ
         aAHBp6PScS892yrtAJRnzPTSUXuAiGMpOtQIo/clh/A5bWvkzo/ebAz4mk+P+A7gvqGe
         +Pckazm9i1e/xfUcHVyzslwXNlOZquumhSl/WabaLifxc4xS0uZyuJBXet+87akmOL8S
         vjBq+y8r2fNYaF7aqiqufh89J9LlXWArlvH0DgZU9S9ZZsN00u3RDJ92YdnaGsrGfqsR
         LY/oAdl9TtE5mRzhdOT+M773N0P5RHX8ExxO34kdyzQ/td87wt03XvCp7LYqkwOsAF+/
         7Bzg==
X-Gm-Message-State: ABy/qLYpLAaBXV2zxRllEPowxd6fk4C0Ey/F4MQngA4cqCcZHWbJddSj
	sXF4g8Gm5R1iPbV5jsk9T/8S6A==
X-Google-Smtp-Source: APBJJlGtz88dgA9P7FtTfAm49xR0+wVRjyt/ZcPAukIFsqkezm35JqgXO0FcyxCpfwYFDyT4jJgTMg==
X-Received: by 2002:a05:6a00:84d:b0:682:54b9:1093 with SMTP id q13-20020a056a00084d00b0068254b91093mr25574401pfk.15.1689182635685;
        Wed, 12 Jul 2023 10:23:55 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id ey24-20020a056a0038d800b00666add7f047sm3821151pfb.207.2023.07.12.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 10:23:55 -0700 (PDT)
Date: Wed, 12 Jul 2023 10:23:55 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Jul 2023 10:23:08 PDT (-0700)
Subject: Re: [PATCH 0/4] riscv: tlb flush improvements
In-Reply-To: <20230712-frying-unaired-e3acb5150e8b@spud>
CC: alex@ghiti.fr, Conor Dooley <conor.dooley@microchip.com>, alexghiti@rivosinc.com,
  Will Deacon <will@kernel.org>, aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, npiggin@gmail.com,
  peterz@infradead.org, mchitale@ventanamicro.com, vincent.chen@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-arch@vger.kernel.org, linux-mm@kvack.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-c59b13d7-fec1-4203-87f0-be6ac124580e@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_102358_881041_EC3412F6 
X-CRM114-Status: GOOD (  30.42  )
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

On Wed, 12 Jul 2023 10:19:47 PDT (-0700), Conor Dooley wrote:
> On Wed, Jul 12, 2023 at 05:18:00PM +0200, Alexandre Ghiti wrote:
>> On 12/07/2023 09:08, Conor Dooley wrote:
>> > On Tue, Jul 11, 2023 at 09:54:30AM +0200, Alexandre Ghiti wrote:
>> > > This series optimizes the tlb flushes on riscv which used to simply
>> > > flush the whole tlb whatever the size of the range to flush or the size
>> > > of the stride.
>> > > 
>> > > Patch 3 introduces a threshold that is microarchitecture specific and
>> > > will very likely be modified by vendors, not sure though which mechanism
>> > > we'll use to do that (dt? alternatives? vendor initialization code?).
>> 
>> 
>> @Conor any idea how to achieve this?
>
> It's in my queue of things to look at, just been prioritising the
> extension related stuff the last few days. Hopefully I'll have a chance
> to think about this tomorrow.. Famous last words probably.
>
>> > > Next steps would be to implement:
>> > > - svinval extension as Mayuresh did here [1]
>> > > - BATCHED_UNMAP_TLB_FLUSH (I'll wait for arm64 patchset to land)
>> > > - MMU_GATHER_RCU_TABLE_FREE
>> > > - MMU_GATHER_MERGE_VMAS
>> > > 
>> > > Any other idea welcome.
>> > > 
>> > > [1] https://lore.kernel.org/linux-riscv/20230623123849.1425805-1-mchitale@ventanamicro.com/
>> > > 
>> > > Alexandre Ghiti (4):
>> > >    riscv: Improve flush_tlb()
>> > >    riscv: Improve flush_tlb_range() for hugetlb pages
>> > >    riscv: Make __flush_tlb_range() loop over pte instead of flushing the
>> > >      whole tlb
>> > The whole series does not build on nommu & this one adds a build warning
>> > for regular builds:
>> > +      1 ../arch/riscv/mm/tlbflush.c:32:15: warning: symbol 'tlb_flush_all_threshold' was not declared. Should it be static?
>> > 
>> > Cheers,
>> > Conor.
>> 
>> 
>> I'll fix the nommu build, sorry about that. Weird I missed this warning,
>> that's an LLVM build right? That variable will need to overwritten by the
>> vendors, so that should not be static (but it will depend on what solution
>> we implement).
>
> Just make it static until we actually have a vendor implementation of
> this stuff please, since we don't know what that will look like yet.

It's just a performance issue, right?  IIRC the SiFive errata wasn't 
actually based on how many TLB flushes happen, they're just broken in 
general so it was a probability thing.

If that's the case I agree we can just start with something arbitrary to 
start and then figure out how to set the tunable later.  It's probably 
going to be workload-specific too, so we'll probably end up with both a 
firmware default and a userspace override (maybe a sys entry or 
whatever).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
