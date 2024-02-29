Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF65DC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 19:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=b/TEiQokWDHCKD1rTeWH8o8UXARRzmGpkl9RR5C8sPo=; b=Saj/Zgqc75mt/eQExOtXmnbU61
	8+P9OAQqXdCl9RTL64OVojL6JYWi5CQuCfUX0M1l3zxBYR2Gfc0SX4KalwQ6UzaPpi74AtQN2KQvS
	fi3aehIUac8GPo2jK1Q41H4qy/IVxyNYMWskuWMs3LHfa97alUFTr83PynCMrUTD4gyhwepP7JZ8s
	OdJw5LXHgt4yT7rLGmpq+1sClstDrw+Hy5+uX2fuwwixAA/udkuqx2aemnpO4d1DjoDiDGYJ1mQk4
	oaD0DF44kikqSPy54oFlN2DIOMhi3h9OdCaXDKbOou8jSKiv/7nPKHF9kaLTxRqkGiXzSBJNDnDAn
	QjYKufzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflyP-0000000EqgI-2GAl;
	Thu, 29 Feb 2024 19:21:41 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflyL-0000000EqfM-2zLF
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 19:21:39 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6e56787e691so1598189b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1709234495; x=1709839295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tI0BeeYqM9dH4CtDmNU5Z89KyVB0ENS6fdLlu9zwgwk=;
        b=Zbl+9nmMxSrUMD7SZn9DzeWF0la9hYguM5JphTL9hgl456vFR0awVY6gtwfIRmrsuu
         yv3l+S6TvJM1bWURGnFWxQOH0Cii2WkPrg2zuomjMaa/ObMgZE50dznsjnE7iz7EKaxV
         ko1zEUScgp8dwkvQJ5S8KXciN6BSgnKTR3pWMSvrYO0VH3r2m28D99jB9EWb+W0+Hjns
         qFtngNSD9zPO3DNhfstOsmPKmiX27g/kitv1eJm/xMfeb4TURefQlEyf8iIgij2hmTlF
         fkZox003YRj/Z0DoFEu9txfEim54jWuWAEJHqR2dgF0bsWTfZYf/4PZt8nZjdKt1OBr5
         Yhbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709234495; x=1709839295;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI0BeeYqM9dH4CtDmNU5Z89KyVB0ENS6fdLlu9zwgwk=;
        b=eFR4L367XlER+LoTjby6VH+I1CZhPI8nF5tCIyF4Gx9Lsf4CeNDuR5Btb3gv+PeXgt
         WKKI46oHMaBx6HkXKFhxQ3denXyH/I4Yo9x4dEXug7EmPhGVPaZWnLTxyxNpwFX808mH
         5v+vxzqTHc2M9QFdh+iyhfoJ9hZUjcwd9mP8ihY5IZDvpcCRN3zJTzc5CX06FtFUXw1p
         02/DTpugUj8KNR958y0jffFTjimKrOelb5u+PPssivZsOgb5LDmbD0TGyth84zeWqCWM
         USUdPwvSzKoNjfW9mJq1mPAmn1nxG+pRAqNVO3nenj8W6eka7sC3QGsFl5hD37UASHS0
         eUqw==
X-Forwarded-Encrypted: i=1; AJvYcCXMDqjWGV1nvu8f0D439hUU04ZwYBdZz/yWt4yUyZUr3XVwSDw9RORq0FDIrF0v7y2MRuqU71nzvrsB3cLiSGGQL3HDi9ITykxa9U1IRoQi
X-Gm-Message-State: AOJu0YwzxVaKvi9hRw0QiQS2Gf9YlDbudnTb0D2G9iZQWStEiVVnimrY
	/fNQ/kLqdDNuUm6CE2Z7G9tUpxZODl9VmTJkv8VvWUa3XyTPqmCDiIdoRdQQfps=
X-Google-Smtp-Source: AGHT+IEb+gGTWSZJgyAaR/j/macgR4G7Qn8rFIkQpEZb0vtMqMn8yLy4/Fk0QWniPKOilz8fvl9fwA==
X-Received: by 2002:a05:6a20:e616:b0:1a1:209e:99da with SMTP id my22-20020a056a20e61600b001a1209e99damr4015579pzb.28.1709234494948;
        Thu, 29 Feb 2024 11:21:34 -0800 (PST)
Received: from localhost ([50.213.54.97])
        by smtp.gmail.com with ESMTPSA id e6-20020aa798c6000000b006e4f18784cfsm1625915pfm.124.2024.02.29.11.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 11:21:34 -0800 (PST)
Date: Thu, 29 Feb 2024 11:21:34 -0800 (PST)
X-Google-Original-Date: Thu, 29 Feb 2024 11:21:32 PST (-0800)
Subject: Re: [PATCH v2 0/3] RISC-V: mm: do not treat hint addr on mmap as the upper bound to search
In-Reply-To: <tencent_3E8D4B7CAE824BDA238EA2B821310F21EE08@qq.com>
CC: cyy@cyyself.name, alexghiti@rivosinc.com, andy.chiu@sifive.com,
  Charlie Jenkins <charlie@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org,
  jszhang@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cyy@cyyself.name
Message-ID: <mhng-67b02dff-5423-466d-bd90-f3ad3a3ab6a9@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_112137_790179_EE26BCA4 
X-CRM114-Status: GOOD (  38.17  )
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

On Thu, 29 Feb 2024 04:10:03 PST (-0800), cyy@cyyself.name wrote:
> This patch has not been reviewed for more than a month. There is another patch that did the same fix but in another way and still has not been reviewed like this. I'm here to do a comparison of some choices briefly to let the maintainer understand the issues and the solutions. I think it's time to make a decision before the next Linux LTS v6.9. As a number of sv48 chips will be released this year.
>
> Issues:
>
> Since commit add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57") from patch [1], userspace software cannot create virtual address memory mapping on the hint address if the address larger than (1<<38) on sv48, sv57 capable CPU using mmap without MAP_FIXED set.
>
> This is because since that commit, the hint address is treated as the upper bound to create the mapping when the hint address is larger than (1<<38).
>
> Existing regression for userspace software since that commit:
> - box64 [2]

Is this the same regression as before?  IIUC the real issue there is 
that userspace wasn't passing MAP_FIXED and expecting a fixed address to 
be mapped.  That's just a bug in userspace.

Is there any software that uses mmap() in a legal way that the flags 
patch caused a regression in?  If that's the case then we'll need to 
figure out what it's doing so we can avoid the regression.

The only thing I can think of are realloc-type schemes, where rounding 
the hint address down would result in performance problems.  I don't 
know of anything like that specifically, but I think Charlie's patch 
would fix it.

> Some choices are:
>
> 1. Do not change it
>
> Con:
>
> This behavior is not the same as x86, arm64, and powerpc when treating memory address space larger than 48-bit. On x86, arm64, and powerpc, if the hint address is larger than 48-bit, mmap will not limit the upper bound to use.
>
> Also, these ISAs limit the mmap to 48-bit by default. However, RISC-V currently uses sv39 by default, which is not the same as the document and commit message.

IIUC arm64/amd64 started with 48-bit-capable hardware and kernels, and 
thus the only regression was when moving to the larger VA spaces.  We 
started with sv39-based VA space, 

> 2. Use my patch
>
> which limits the upper bound of mmap to 47-bit by default, if the hint address is larger than (1<<47), then no limit.
>
> Pros: Let the behavior of mmap align with x86, arm64, powerpc
>
> Cons: A new regression for software that assumes mmap will not return an address larger than the hint address if the hint address is larger than (1<<38) as it has been documented on RISC-V since v6.6. However, there is no change in the widespread sv39 systems we use now.

The OpenJDK and Go people have at least talked about using the interface 
as it is currently defined.  I'm trying to chase down some of the folks 
around here who understand that stuff, but it might take a bit...

> 3. Use Charlie's patch [3]
>
> which adjusts the upper bound to hint address + size.

IMO we can call that compatible with the docs.  There's sort of a grey 
area in "A hint address passed to mmap will cause the largest
address space that fits entirely into the hint to be used" as to how 
that hint address is used, but I think interpreting it as the base 
address is sane and we can just update the docs.

This also should fix the realloc-type cases I can think of, though those 
are sort of theoretical right now.

> Pros: Still has upper-bound limit using hint address but allows userspace to create mapping on the hint address without MAP_FIXED set.
>
> Cons: That patch will introduce a new regression even for the sv39 system when creating mmap with the same hint address more than one time if the hint address is less than round-gap.

I'm not quite sure what you're trying to say there.  If users are 
passing a hint that's already allocated then they're not going to get 
that address allocated, so as long as we give them something else we're 
OK.

We might want to take more advantage of the clause in the docs that 
allows larger addresses to be allocated under memory pressure to avoid 
too many allocation failures, but that applies to any of these schemes.

> 4. Some new ideas currently are not on the mailing list
>
> Hope this issue can be fixed before the Linux v6.9 release.
>
> Thanks,
> Yangyu Chen
>
> [1] https://lore.kernel.org/linux-riscv/20230809232218.849726-2-charlie@rivosinc.com/
> [2] https://github.com/ptitSeb/box64/commit/5b700cb6e6f397d2074c49659f7f9915f4a33c5f
> [3] https://lore.kernel.org/linux-riscv/20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
