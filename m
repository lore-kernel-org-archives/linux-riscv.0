Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA63C3ABC5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRu+FWXo/l8TmO0yVmteqEbeAZVAdN4n0P0RwPr6f98=; b=AhmOAsgrhfGcDA
	EVdRgT0Odvv/1sMA7AmhWW9q6fuHy64Y+2T4DfZjx3fKcXi1lB+5P6u1OUDDn2B/TvRRYYzYQzdUP
	w5DACVG0l+n3/3b3i4i8yBRNFi1m3TQCl+keAKzpg48BNqKENpdfQbyPkc4yRHfIhup7AWcAsfsCC
	Ukc4y9of4lSVncNzAf9fRwIq09sY+DPZX9AB4vd3F2ZEfeqs1rDBW9kG7YQs/kT0QZNnLxsZniRp3
	SeDijmqLZQS2Bv8LEPPGU9VWU6EkGAHVvXFO/LmOQnrxLBogR2uSc1nxPVgrK8EM0F6WWXNCHZtB0
	W1boFVCSH3rsc0mKpbQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCviW-000000000Fr-1Y7G;
	Thu, 08 May 2025 07:30:52 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCvTc-0000000HZ9i-38cR
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 07:15:29 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-60638c07cabso432549eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 00:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746688527; x=1747293327; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+6hEwmNbvDrX8ZUAsqAq49EAFin/5oOteZQpulus6Tc=;
        b=DvCWLldsXmldMWEgcluQS0g0geM8rLSOhLwl60fw6WUVwIvDoZT9K+1v4IvCKJAz7S
         Mgxci9JlgeIZE0vw9mzNhKKF0xoa3XxAvbd6b1+yjPTBJuvTy4dTBOr6+XN3KsbAYLj2
         hJUAYCEhYuw7h4FdyluHdN8xzr/v18nvLALr2bOnPQgHJg70d6GrIzMUNXQ6k/7p7nEA
         IQS+bFdQG8cS8rG/yCs1p0U5IVcDmv6urP36prmc+FnMXXuSVLDqxZ7xO+4iy/TE9RWF
         dFQLhgQsqLgeA2EPR63lpT1+qXE9aCDDs0i14OU2GAVI8ZIXenMy0jq6HYtb1oBm0Dst
         buFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688527; x=1747293327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6hEwmNbvDrX8ZUAsqAq49EAFin/5oOteZQpulus6Tc=;
        b=tfTHrmifJDQ3rHFB3PF5a54zGukQ6IzHpvA9GmNUDwsfLiT+Pq6aRJIm8aTEu3ZPD+
         5EHGqBFIEiRkeCVV3Swsr0g0YH4gQ3M+hHoqZ1v7fMJUR7acYMx8cmC2ZQndFOniwoGk
         IuAMEhLS6ylyxI+diC4ndzl32lj+7J5YNVQTaBT42k6N9qegJOdn6RyyBz7h0nPZHzs6
         9hhkEbMQXf+zZuLulkQwz5Z9AxidbFiy7f0Prarjbc/JwQoGE5iHsc3Mw6KzZciOWQu3
         9/IFojiEEevt/77RJYrQxyafmhwL7/6L8oxph5x+Yis1Om4kp4RhBa7cJQlm+n1GpUZp
         2CoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFzgFJKTuhzYCSCQaBMxijXu3DMpValB7rJsDqUTr8HLSGpZMs4OXgMZQ0jcRsPOzuLT9jflB5+xgNfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIfxiEMS+M1/Akn/UK++ZBYd6CSwyN30faHstggMVVsvQHbbqj
	xsr5XTx5voNlb/c6UxPTgFj5bH0tTnP8dbpYNj58mBUhMVGZ7qFxldJAB/2XHhiQ5PqmABPVav4
	lSP1RG6F8oipvEbG+GW4H4y71nqA=
X-Gm-Gg: ASbGnct7R201Sqr6LbxlCuDvRBe41iO3ElmXfZkL1HDAlrnQzqHHGlSXJ6jNrmv+azD
	LxlI6+LsI2nKZa3nVhEnh9JBy8nEOOnCJnrlRny4u4IrTUwWKbjmGOkoE/40x+GHZ0bY4oSXpn8
	TkC/plk9tT2skkN7MIyxHECofQkpLDHHEikpVpQlZeNXYi2AaNQvwMvA==
X-Google-Smtp-Source: AGHT+IH2EyRJKsRob0eFF+uoEduxPFeAuaPWyoQOX+ekx3T7de4gceRUCwFsPI+rPxKDLq8u+Ohe4WJ4VNimGAumXD4=
X-Received: by 2002:a05:6820:203:b0:607:e15c:be07 with SMTP id
 006d021491bc7-60828d4dcf9mr4371937eaf.7.1746688527253; Thu, 08 May 2025
 00:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250305083707.74218-1-zhangchunyan@iscas.ac.cn> <mhng-63c49bc7-0f86-47f7-bc41-0186f77b9d6f@palmer-ri-x1c9>
In-Reply-To: <mhng-63c49bc7-0f86-47f7-bc41-0186f77b9d6f@palmer-ri-x1c9>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 8 May 2025 15:14:50 +0800
X-Gm-Features: ATxdqUHZ_WeGypQ24ll_k9Tlw-2jyRAQMCglZpNZhX8QH-tmXjBcBV4g9oFBEAg
Message-ID: <CAAfSe-vD_37uihLjGwOqQKnyKJaJ36OwxDeocMOhK4s6-cpzAA@mail.gmail.com>
Subject: Re: [PATCH V5] raid6: Add RISC-V SIMD syndrome and recovery calculations
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: zhangchunyan@iscas.ac.cn, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, Charlie Jenkins <charlie@rivosinc.com>, song@kernel.org, 
	yukuai3@huawei.com, linux-riscv@lists.infradead.org, 
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_001528_785539_39C0B0F0 
X-CRM114-Status: GOOD (  14.34  )
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

Hi Palmer,

On Mon, 31 Mar 2025 at 23:55, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 05 Mar 2025 00:37:06 PST (-0800), zhangchunyan@iscas.ac.cn wrote:
> > The assembly is originally based on the ARM NEON and int.uc, but uses
> > RISC-V vector instructions to implement the RAID6 syndrome and
> > recovery calculations.
> >
> > The functions are tested on QEMU running with the option "-icount shift=0":
>
> Does anyone have hardware benchmarks for this?  There's a lot more code
> here than the other targets have.  If all that unrolling is necessary for
> performance on real hardware then it seems fine to me, but just having
> it for QEMU doesn't really tell us much.

I made tests on Banana Pi BPI-F3 and Canaan K230.

BPI-F3 is designed with SpacemiT K1 8-core RISC-V chip, the test
result on BPI-F3 was:

  raid6: rvvx1    gen()  2916 MB/s
  raid6: rvvx2    gen()  2986 MB/s
  raid6: rvvx4    gen()  2975 MB/s
  raid6: rvvx8    gen()  2763 MB/s
  raid6: int64x8  gen()  1571 MB/s
  raid6: int64x4  gen()  1741 MB/s
  raid6: int64x2  gen()  1639 MB/s
  raid6: int64x1  gen()  1394 MB/s
  raid6: using algorithm rvvx2 gen() 2986 MB/s
  raid6: .... xor() 2 MB/s, rmw enabled
  raid6: using rvv recovery algorithm

The K230 uses the XuanTie C908 dual-core processor, with the larger
core C908 featuring the RVV1.0 extension, the test result on K230 was:

  raid6: rvvx1    gen()  1556 MB/s
  raid6: rvvx2    gen()  1576 MB/s
  raid6: rvvx4    gen()  1590 MB/s
  raid6: rvvx8    gen()  1491 MB/s
  raid6: int64x8  gen()  1142 MB/s
  raid6: int64x4  gen()  1628 MB/s
  raid6: int64x2  gen()  1651 MB/s
  raid6: int64x1  gen()  1391 MB/s
  raid6: using algorithm int64x2 gen() 1651 MB/s
  raid6: .... xor() 879 MB/s, rmw enabled
  raid6: using rvv recovery algorithm

We can see the fastest unrolling algorithm was rvvx2 on BPI-F3 and
rvvx4 on K230 compared with other rvv algorithms.

I have only these two RVV boards for now, so no more testing data on
more different systems, I'm not sure if rvv8 will be needed on some
hardware or some other system environments.

Thanks,
Chunyan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
