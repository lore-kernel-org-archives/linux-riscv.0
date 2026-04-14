Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335BEF9D0D2
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 14:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzw8hxlq33QSUPKAsLvNN6s4RW9OW5BRxAOAdTu3kLs=; b=aPByDGsF6XWaOw
	HXNCn7M+jVJggbzAbf6BAjOEBvQ12vngrNOAOTkxFcPqAXGcGHSSIoYDFJD7a6c9MSSqkMNoU9Pj9
	63oZ4aafmU1CLN3RQRkXKDjF9i135ypiuTYjjr34ikDmDDODYHciv4sztXwVckg/9GemQdVQ1pbTR
	wElRpX8DBQsC3pHrXyQ/ZLY88Dep+u48rqOp2650y2QfQ9OwBuzg3dxKnTgcxvGliUDMA6rBCbd45
	FAJEphihrTYuulJmArepiusVMmHNAqnH4psH9PMuUN5ZFHFdAw9NsfTOJ1DfyJ0JgRIXjfTmGa+sE
	3+bnRf82SgWp8hMOB1Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCf3s-0000000HTYT-2dSz;
	Tue, 14 Apr 2026 14:48:20 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCf3q-0000000HTXl-2qvF
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 14:48:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-482f454be5bso60416705e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Apr 2026 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776178096; x=1776782896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qs3FTaDVrhGRqFvZSZtkN7YawmSROR8+0cRgAi/+3fA=;
        b=P/guCwW1CNI+Pq4EAXGUXmgnny9G72rcLIgBpcR9RkmXa03voWUsT+A/x5yfFsAQtO
         2pMelcdjw8dtXemFP4+yylrfNGCGUVubkO36IwS+kriRpfDqU4G8BAVtWmDnALR65EBa
         rw4yglkAUmSx3X/8hApgSponRaxlvXpUxtPasW29v5RijNgAkVYlZYjvpTjqrJ4+/Ov1
         zlUYrwXhbw8xqgSlWugNdrdqfy9RUvxIjxn4CMt4T/WHWXwEnf65phKxxyXMZA+5Inm+
         ao33BJA6YfG5bkoKJt6dC/kZRZMO95wD64dGaXuW5TQjfgbrnIiOksQbjjObXPN0A3rI
         gcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178096; x=1776782896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qs3FTaDVrhGRqFvZSZtkN7YawmSROR8+0cRgAi/+3fA=;
        b=Ab9ivfjzhj7A843Ijcyh2ak8eWuHTOhLps9clRVSo6TPTrwnP1Cuk0QZaX+kdx4jVg
         YEMCAWLHIYIVgNwRKQt5B5ygnCs44P4j+U5BUi3rxZ+UfKUr6/pqEl39I8IyPktFHipg
         kEpnc9DGtzZq5uwItr8zalNPt2Ndt3hKQFSJTJQu+Xqs0Fb41hDRNbV3qh+3Q0L0eU03
         tahghWr65yNx1qSf7CNOKhvcONhK5CXDsBldJxbhTGPA9nejTe1SpierCUHza0Ssaoiu
         pFRmAbXXv/FXYQ57YIlGrqVMIX/L89QzEPthfuYGS21Nqoc1CPqg98o8zmba7nslnHf3
         RDOg==
X-Forwarded-Encrypted: i=1; AFNElJ/xed+mII2zY/BWazgPQFZaEOIEQGaj7zzNmP3+MO4x9HgeYvYpdmCAnrZer4MZu9IMUWUDMUWa9YOrXw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa+1uVy7eAGOEJb/kN9AfC7SWM4I1e40ssb3lcWFsyoPaZfzAb
	vExU0wY2mRu/ULQKQ6I7F9xdhA6Mf37x/q6JPvJAgwOorMs/8A6ANavH
X-Gm-Gg: AeBDiesFltwoRLVL/x71XaAWa1NKP7S+sIB+/U3tRWH1WNvU3T57O9OWj1eTMM9RtWe
	W1qxwG6hZ9kTJ1VVVvsg3N8ZP48Y083+xcG1A4ws8mg2M5eMhbpbdZhXM7zz3bDwJWPjyS/Ze0N
	h1Q7b8PzlhFNBBv5lIPk5go7EuL4bWSqv1L5tweEuBuehs7x1Ms7VhA+WOC4WZr88MXhM+oUMk3
	en0mBMxvPFopx6HEO+DQ2bVq8GHK8hSY++Y2ToAZWWHee53drURSFd0QQ7n+1yfQCGOMgHnj4Yi
	IlXlR8ZkStUGvJEHSm73ZXXXB7tX0hFH1XQ6rT4yfWbKBiRH6/tw0q8+rbl/oc71Nw72wetE9Of
	UMmQrUVgVa5H+zPMtVgtejHVCGJQR0Sdhw5023e7WlI5R9LBekOvGWUKO2gIohOh0lVbR9/1CuT
	Etq/loW2cxiKInTPl4MsVpgl5GPyswdKFRMhKSR72HMZb+FR2+ySyaPbcKpdYPQFObDgqGgWW7g
	hFWaSZ+q6FtSuDtlZJib0S5tYA2qSxDOLVsupRmOZan4NJQ389TinXUDDoe/VAS+pFKfTPOZZS1
	MCxjFKgX6/TCrdAakxUDguLiSbLOW1pOGCAEXpR+LWz6AcHYABejCA==
X-Received: by 2002:a05:600c:19cd:b0:488:c239:d498 with SMTP id 5b1f17b1804b1-488d68712d5mr246717425e9.8.1776178096002;
        Tue, 14 Apr 2026 07:48:16 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e002e3feaf8ac5b1b0d.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:2e3f:eaf8:ac5b:1b0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5d768afsm183992125e9.2.2026.04.14.07.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:48:13 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:48:12 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Puranjay Mohan <puranjay@kernel.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>, Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 2/2] bpf, riscv: Remove redundant
 bpf_flush_icache() after pack allocator finalize
Message-ID: <ad5TrE-wIiw4rHvg@mail.gmail.com>
References: <20260413191111.3426023-1-puranjay@kernel.org>
 <20260413191111.3426023-3-puranjay@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413191111.3426023-3-puranjay@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_074818_764591_EFC3804D 
X-CRM114-Status: GOOD (  11.06  )
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

On Mon, Apr 13, 2026 at 12:11:09PM -0700, Puranjay Mohan wrote:
> bpf_flush_icache() calls flush_icache_range() to clean the data cache
> and invalidate the instruction cache for the JITed code region. However,
> since commit 48a8f78c50bd ("bpf, riscv: use prog pack allocator in the
> BPF JIT"), this flush is redundant.
> 
> bpf_jit_binary_pack_finalize() copies the JITed instructions to the ROX
> region via bpf_arch_text_copy() -> patch_text_nosync(), and
> patch_text_nosync() already calls flush_icache_range() on the written
> range. The subsequent bpf_flush_icache() repeats the same cache
> maintenance on an overlapping range.
> 
> Remove the redundant bpf_flush_icache() call and its now-unused
> definition.
> 
> Fixes: 48a8f78c50bd ("bpf, riscv: use prog pack allocator in the BPF JIT")
> Acked-by: Song Liu <song@kernel.org>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

Tested-by: Paul Chaignon <paul.chaignon@gmail.com>

[...]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
