Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AAFC83F03
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMlKCyiL/Wfz7TyA2dvaF4RjeOGOUSG/z8GG+43PplQ=; b=l6IFqCoiIzcBJ8
	GDt6kce3q/znnHLiDBwIxTJ+TVIoObKv4vwXte8Sz9RclUl9H4S1D0PJMQ6z5eSwq+xfed6+Cfj/j
	tr4Ebjq/byWvMND54j0UR6GWTWYg0D41HQ4fglK2LgGzea8rwubMrt+dBjobOGn9CtnD1MwOw0mmL
	/HbEPfjCyVgw6NVIJCGBcveKqLTB+3YdbIjN11OnQ6vv4gUxmluDXeyIhol4d7g+awBifheRWwWm/
	Ym1HZRDl1wBiG7spDpLJjk6OpqzeL0FCY8VRMQ9dBsumvCq3vF7HkUOBPlhtHMneY7w6u8NI3JGBg
	23ycsX4ddem/dPHtLsFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2P-0000000CXgq-3qlR;
	Thu, 03 Jul 2025 21:00:09 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNGa-0000000C3zy-1ZEc
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 16:58:33 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7490acf57b9so182319b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Jul 2025 09:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751561911; x=1752166711; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vaMWvr/LwOy/DPFt7E6Ou21vzc6EQJXl4tZisI0lbDw=;
        b=F/ZSR7Cb0wVghvZksIH99dHZ5AQXZDT4UHmvPTqCoDF5p/ko/X2uu3UpTXWH9OENFZ
         3Vxqmi8MYNzdKEc2oa0HgOTWiZto9Xj59N+ZtgYiT4L+1WVWBtXOTXETtJcDgqcUAnGF
         sijffsBPvksqGrJMaqyhg8W6cFXcMtsuR9CFsP4Al5I2WcZovLt6FkKdxz4z81kROLvt
         HEx4UZPa40UhF3I/fALzetcxEM/T7cF7gURxyxixUydSY91P9jzdha/00Ym3dVmt744U
         H5LC/q4Op+nkTb7/2rVI7nEefs3r4JusLQrxN2ULP48f/ylHOFMBkpOI72fGZqF5MaE0
         isMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751561911; x=1752166711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaMWvr/LwOy/DPFt7E6Ou21vzc6EQJXl4tZisI0lbDw=;
        b=lg9MlGa1stqkEQ8YrAkrz5oD7+xU7KwDNucFvLnlauQeaAissGVUuSevig3LFAlKBC
         ICfmjyaHXYAtaZKeNTd3kcwbHaInk0jo/HdVbiSK2qPLU+1sdvM9q1KxWX5wMTxr4eha
         /yYckLgA0uLkR3g6Z9dYbVzTokl2Tn5sKxiV+zwRZPL2I3u1Lre+IDz6nt7gstWHMd7g
         9Brpwi24W7KwOE9dYX/t6AUDo/qCiYKlpiYrr1UeR9cIB9UWMxj8KqQlbvgpf2YJwjd3
         RV7ECYRJivNKhN2v8hTEmTr6TfsfSNZpz65IR9Yjx6wUzA3J7zLRbt564dCIxOH1ab1W
         r7Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWj7icz0K97cpaxwN7gg7PHXo4B5Ap4w+8AfqoTozmT6zN184jr66e9D0B6cy45ZhRAWwNHUVw7H4+8ig==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRLUyV6m35AfGxOaVXrgvBgw9lCuBDevK1yHzSIM4FzqD4DZZu
	tcHN1GyDD8QNgvIeD1IyeRKLxNBSZS7e1CRCFDeGCL5m6WtuYKjXVjpcabqi/g==
X-Gm-Gg: ASbGnct+Dhv+VKHlmdB0bgqBDBwvC+8HKU0hcc0u0QcTLSuLwhEeehlP2hS9ZVGHsON
	BF51u47ZHFXQya7dQy5eTcyOtgQWTQAeITk+BA3f530fCTdHdGsrAay/V68Nc7ewj8gjmf4nIg4
	mnJtWz93lop6QWS3FPKB16lgUVYc4fP7kEL1ClTHoXABaZCSfYNSmYMjWFV2LDGVQ+lxUNdPI4o
	s+EAEOleus34BiExUkibfPq/4mJbGbcn5tdsi65lWP6m+KGWOkjbeEk+gnFEXIPTUMyW3h/uKxO
	X6GP+/bDSifOV/LQ/Y9YyCapqFBwBORDXbvSwPnYlc37s66Qzt95B8cGmz7kuw==
X-Google-Smtp-Source: AGHT+IHBLGDwR+y0/xmd0/Az+y9ZiXd4ddJjrXR1M7ccldKrPt5j62yq3oXJYN+rOaUM3mayriZ9mQ==
X-Received: by 2002:a05:6a20:2d06:b0:1f5:92ac:d6a1 with SMTP id adf61e73a8af0-224096f8835mr7006936637.4.1751561911487;
        Thu, 03 Jul 2025 09:58:31 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4755c5sm111522a12.20.2025.07.03.09.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:58:30 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:58:28 -0400
From: Yury Norov <yury.norov@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: cp0613@linux.alibaba.com, alex@ghiti.fr, aou@eecs.berkeley.edu,
	arnd@arndb.de, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk, palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb
 extension
Message-ID: <aGa2tKXJutz_Gvsi@yury>
References: <aGLA78usaJOnpols@yury>
 <20250701124737.687-1-cp0613@linux.alibaba.com>
 <aGQprv3HTplw9r-q@yury>
 <20250702111135.37854d1b@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250702111135.37854d1b@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_095832_412484_55DB7BD3 
X-CRM114-Status: GOOD (  26.95  )
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

On Wed, Jul 02, 2025 at 11:11:35AM +0100, David Laight wrote:
> On Tue, 1 Jul 2025 14:32:14 -0400
> Yury Norov <yury.norov@gmail.com> wrote:
> 
> I'd not worry about rotates of 8 bits or more (for ror8).
> They can be treated as 'undefined behaviour' under the assumption they don't happen.

Good for you. But generic implementation is safe against overflowing
the shift, so the arch must be safe as well.

> The 'generic' version needs them to get gcc to generate a 'rorb' on x86.
> The negated shift needs masking so that clang doesn't throw the code away when
> the value is constant.

...

> > > I compared the performance of ror8 (zbb optimized) and generic_ror8 on the XUANTIE C908
> > > by looping them. ror8 is better, and the advantage of ror8 becomes more obvious as the
> > > number of iterations increases. The test code is as follows:
> > > ```
> > > 	u8 word = 0x5a;
> > > 	u32 shift = 9;
> > > 	u32 i, loop = 100;
> > > 	u8 ret1, ret2;
> > > 
> > > 	u64 t1 = ktime_get_ns();
> > > 	for (i = 0; i < loop; i++) {
> > > 		ret2 = generic_ror8(word, shift);
> > > 	}
> > > 	u64 t2 = ktime_get_ns();
> > > 	for (i = 0; i < loop; i++) {
> > > 		ret1 = ror8(word, shift);
> > > 	}
> > > 	u64 t3 = ktime_get_ns();
> > > 
> > > 	pr_info("t2-t1=%lld t3-t2=%lld\n", t2 - t1, t3 - t2);
> > > ```  
> > 
> > Please do the following:
> > 
> > 1. Drop the generic_ror8() and keep only ror/l8()
> > 2. Add ror/l16, 34 and 64 tests.
> > 3. Adjust the 'loop' so that each subtest will take 1-10 ms on your hw.
> 
> That is far too many iterations.
> You'll get interrupts dominating the tests.

That's interesting observation. Can you show numbers for your
hardware?

> The best thing is to do 'just enough' iterations to get a meaningful result,
> and then repeat a few times and report the fastest (or average excluding
> any large outliers).
> 
> You also need to ensure the compiler doesn't (or isn't allowed to) pull
> the contents of the inlined function outside the loop - and then throw
> the loop away,

Not me - Chen Pei needs. I wrote __always_used for it. It should
help.
 
> The other question is whether any of it is worth the effort.
> How many ror8() and ror16() calls are there?
> I suspect not many.

I'm not a RISC-V engineer, and I can't judge how they want to use the
functions. This doesn't bring significant extra burden on generic
side, so I don't object against arch ror8() on RISCs.

> Improving the generic ones might be worth while.
> Perhaps moving the current versions to x86 only.
> (I suspect the only other cpu with byte/short rotates is m68k)
> 
> 	David

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
