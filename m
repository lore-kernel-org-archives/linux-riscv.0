Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5940C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 14:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CesxTWLsYeTS1nkJCOQbgWswfIOF2COY5X7YULV+ZA=; b=ksbYu1bi2qfeu6
	MD6tiYZ+njMDPK89qHJkZl4QpfuwF5LRBEOioPoqdezVVjUiz6zB0gZoRnTmKW9R0kyk0hmqthj/x
	X8VIm2Y+1IOPmWdiSZx/hVlX0NZ4wHLJWq55VR6j7sKOZuRj0+XZNqNX3dBokfwCfhytleWoc2Isq
	z0xUYLsZxQodpmdCFf97q5EWoZuP+/sBjWvjaQyadjk4pXjGuuQ/8qfEiI4f88WxB7ftt5yVmv96D
	NFhse/liIIQBUQGbx2NadeNmdHk1U3SiRMfP7W8+0PL8itq1CT8yvdFLB0aZM0WRXlzHowFkwDmQ1
	MI+RXEdtuduyHTnzceQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSqL-003S1U-2c;
	Mon, 30 Oct 2023 14:02:13 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxSqJ-003RyJ-30
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 14:02:13 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507b96095abso6451305e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 07:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698674522; x=1699279322; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pM4/raj46zgv4xk5bfFK6Dn9w2JTEPZCoW46aHiMDU=;
        b=jjJPx3KvknDykyXyiecmOm9JZujYa6Qssawp4f6g1U9Rm9yIMmfrrrXdzWLk7kj3pb
         emhZD99qPgDuwfLl5ZM0QU7QmJfO+7VR+Hc9qrcbLtULn0/iE8aB2EhGNCJMoBQ/MwCY
         513fpudMCP1+6qbm/5mAW5JDCYDu6MF5Q9hk2LWx+GkMQ8M3TPMgjI5A/nTI+s6ErjTT
         3eKg9C95SdsWCBrp4+eJpcjrpjhUCtRZ7LjIa8SIvMMAkX7YNVjqZijhE6x4Cc2ZVoPp
         BOV9ItT6f7qWl6nJ9KltLyhahSPGDbRkQ8afM9ppLiUGvQDscYbB63arGm+hOFlhclXA
         0aPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698674522; x=1699279322;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pM4/raj46zgv4xk5bfFK6Dn9w2JTEPZCoW46aHiMDU=;
        b=H0VyNi8ErTsVKap9NgcBIbz/qxI6iM+yPz3puRGSvP6Nx1RSI6wue1oONlucjRe+wn
         PThNFioyBdM/5GenffvhCjl/e+/mFms7o8SrJ8NSZRlrRUoiVjtp5Hj5iqjnNJM1m57i
         2IR5Bxhh3dwhN4Iz918tc72a2ufaERyvK3IvAdYm1olWL3/wvDrcvV5W8q8jX9ANUO9C
         KofiYCYMFRqf3QcsVQf88EsXeOvwk/ymlf2QG3lm9IfVgqi9FyJDAG+b+3dYFxeSNaG2
         P1E+IE3Gzwj235kAcGxwvrQp2EGHJ0qliHjcKrY2+YcIEnmOtPdFi7ibH/uQEoxFyu5K
         ZrDw==
X-Gm-Message-State: AOJu0YxQRmsadEvAkouNZSsJmDoINdmks2q3r7gYS4PVioLTjERGgokc
	dIk/tBVsou85gcFuNCdYkDA=
X-Google-Smtp-Source: AGHT+IExXDR5h/gb2Xkd0IPxFcJr1nDMGyjwni4lSAmtf29yb2qVdb4yT3orag51W3s1lUikBA/nsQ==
X-Received: by 2002:a05:6512:3a96:b0:505:7896:18de with SMTP id q22-20020a0565123a9600b00505789618demr1445170lfu.45.1698674522086;
        Mon, 30 Oct 2023 07:02:02 -0700 (PDT)
Received: from smtpclient.apple ([77.137.74.70])
        by smtp.gmail.com with ESMTPSA id q3-20020adff503000000b0032d09f7a713sm8316888wro.18.2023.10.30.07.02.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Oct 2023 07:02:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v6 0/4] riscv: tlb flush improvements
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20231030133027.19542-1-alexghiti@rivosinc.com>
Date: Mon, 30 Oct 2023 16:01:48 +0200
Cc: Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-arch@vger.kernel.org,
 linux-mm@kvack.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>,
 Lad Prabhakar <prabhakar.csengg@gmail.com>
Message-Id: <24E0FC81-810E-44FD-9494-CA9374E495B5@gmail.com>
References: <20231030133027.19542-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: Apple Mail (2.3731.700.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_070211_973015_A0D72B70 
X-CRM114-Status: UNSURE (   9.98  )
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


> On Oct 30, 2023, at 3:30 PM, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> 
> +			on_each_cpu_mask(cmask,
> +					 __ipi_flush_tlb_range_asid,
> +					 &ftd, 1);
> 

Unrelated, but having fed on the stack might cause it to be unaligned to
the cacheline, which in x86 we have seen introduces some overhead.

Actually, it is best not to put it on the stack, if possible to reduce
cache traffic.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
