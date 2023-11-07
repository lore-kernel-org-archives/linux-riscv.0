Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929EEC4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 07:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=d08YPsQQFbWke1ta5udxWlDy9gt2ZSZsg/UZNOHlY6A=; b=wekWDtoLytXXnX6OAXpnaUHuKd
	4IMwF4vlzbXrfizJXMnCt26VIN0robQIYOv3LFPmA5flZ8RFcbcvKqX4VzIp2lIWsIOJrX7RufC8T
	tEn/bCOg6kmuk6QTLUqizciUdDUvIms6IVVix0doyEPrxLR7AaJKZ6qqi/zQB0MwkIGVgSgLhYsdo
	DgQm+V/TbC1Y9RRXtmndcW8BExOFrIpmwHjUpWWUUtjiesua6xzz4OnQNTbrtszvET+MhbULwx0em
	Um06u/Uwe9rX/6u/4fh4nnkk8zdT9GkcPP8+SPuKnHgfK8HspE8bxmQxZXFSq/IrCyUGBNg+hYpiM
	Wb0LiYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0G4J-000g29-04;
	Tue, 07 Nov 2023 07:00:11 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0G4F-000g15-0y
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 07:00:08 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc4f777ab9so37771465ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 23:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699340405; x=1699945205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HT+fB+nShc13WFwJsBmCnkPpP2szplCX09J2M/XdGJc=;
        b=MNnAGC5rgNBRe01XA1pjJa0otUXrWoJFSXIOir6juvYj+7/6VNV/DuYkO0zYXwQF/5
         +chRbspe8mt+yTPNGm+DkNNDqm9G9wNJRurs0J3eOCO4+bXj3nmE7jZC7tdJK31SI5wZ
         YKDGfncOe+1FWIXW2BGURaiYCHq+wN8xwyn5mOQHM4KtQSlO+C2pMEp1IH/Wko1f2Dd5
         2c2a9VO3Mrx3lXpYHJep2anjHh7VPP8iEJoW3Z5j3eBPM8DzmkjEk/9C0EXSf/qgD5pq
         6Zo2HNB+PPvC7yiL4AVHtXTHOIVzYkQy9MP0WxmZBG7ZFq8kHgiWpzAQpOMtKFTwY63i
         KdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699340405; x=1699945205;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT+fB+nShc13WFwJsBmCnkPpP2szplCX09J2M/XdGJc=;
        b=XwVbpq7yMngekFxug6OrtL57+OaS1kwh7durhQcb/UKmHHkxRb/6156+vVR3obr8Fm
         rfa9v21kJpQrWqnLjbl4CDqKkd6OmV5QeKBlBHNRC35lWkXUueNkZrol3ANHC9q8xzoJ
         BF134Is41VMk9sJTSmcl+YkFbPr/6NgG5Xd63owV9Se5Z9nZwMk+vDw8ixjsbYbfF4Wp
         Sl5edzzGIsKvZcgWeKDtmDBjDSqmJBSK56rMJrZjJyucPguOQsXxZ2bbvD8PgymDn0Oi
         TGGx1EfEnywamYN5Jh8RmDATUzaacdLJ9pLp2NEB764qbdmtACsdYJg34dvIy+XY65ok
         V+2w==
X-Gm-Message-State: AOJu0Yw9F2c3bJF2N09SVHZ8BSi6IFRm+tBfmLaYX3h4pVMu+sa6KPDb
	sLfiYb5P/9qDYTN+8x412ki4mw==
X-Google-Smtp-Source: AGHT+IHfFOWchFvO8pJneXAWC0dzM9ECoTMi1CyG7yOXyLVhl6cL8Z+QF9QwrVc4186nG4cx0iwg+A==
X-Received: by 2002:a17:902:bd85:b0:1cc:ef72:8600 with SMTP id q5-20020a170902bd8500b001ccef728600mr1911154pls.62.1699340404326;
        Mon, 06 Nov 2023 23:00:04 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id kx14-20020a170902f94e00b001ca222edc16sm6950068plb.135.2023.11.06.23.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 23:00:03 -0800 (PST)
Date: Mon, 06 Nov 2023 23:00:03 -0800 (PST)
X-Google-Original-Date: Mon, 06 Nov 2023 22:59:59 PST (-0800)
Subject: Re: [PATCH v6 0/4] riscv: tlb flush improvements
In-Reply-To: <24E0FC81-810E-44FD-9494-CA9374E495B5@gmail.com>
CC: alexghiti@rivosinc.com, Will Deacon <will@kernel.org>,
  aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, npiggin@gmail.com, peterz@infradead.org,
  mchitale@ventanamicro.com, vincent.chen@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, linux-arch@vger.kernel.org, linux-mm@kvack.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, samuel@sholland.org, prabhakar.csengg@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nadav.amit@gmail.com
Message-ID: <mhng-4e3e3fa7-5e25-494c-a3ad-6ef7ec78cf20@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_230007_555901_2CF89134 
X-CRM114-Status: GOOD (  17.41  )
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

On Mon, 30 Oct 2023 07:01:48 PDT (-0700), nadav.amit@gmail.com wrote:
>
>> On Oct 30, 2023, at 3:30 PM, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>> 
>> +			on_each_cpu_mask(cmask,
>> +					 __ipi_flush_tlb_range_asid,
>> +					 &ftd, 1);
>> 
>
> Unrelated, but having fed

Do you mean `ftd`?

If so I'm not all that convinced that's a problem: sure it's 4x`long`, 
so we pass it on the stack instead of registers, but otherwise we'd need 
another `on_each_cpu_mask()` callback to shim stuff through via 
registers.

> on the stack might cause it to be unaligned to
> the cacheline, which in x86 we have seen introduces some overhead.

We have 128-bit stack alignment on RISC-V, so the elements are at least 
aligned.  Since they're just being loaded up as scalars for the next 
function call I'm not sure the alignment is all that exciting here.

> Actually, it is best not to put it on the stack, if possible to reduce
> cache traffic.

Sorry if I'm just missing something, but I'm not convinced this is a 
measurable performance problem.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
