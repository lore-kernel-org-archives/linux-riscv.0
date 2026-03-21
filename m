Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498E91093174
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 05:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6agmuMMpE+YpjbRw5XXqs1yp9sCE3cleKHyKUJhUkw=; b=H864aLq+2l+Psw
	1sEuYMqZTG8gI2Z1aKbm0M96CXc14glM6x9vSUC8dpwkUc9mzzDDggz7w6R6GdGxoPKcdx7bL3O2T
	bixzdc71s8lvmeAQbpr9bGngFLGPot1vICsK6jl3pippMGDvKQ73sbdZwMKSLSs72TtSMMjl4QKH7
	oBYwiLCZxAVxcdfSfNEeBct4mv+qfxN3fJcTpmkZuAq5MIoiK1EfkbLlNG/aCungjJc2udSnUvsq5
	DdI9fNqhrW6Hh3YGoUmdEChMpS0deiVo6MfD2EQQTzqDnDtCesZlDL8fKh0tUOwjH6rxIOAiaxt43
	NB5E/z+g9hGraYjUjyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3owA-0000000E60x-0Pl4;
	Sat, 21 Mar 2026 05:31:50 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ow7-0000000E60C-2xM9
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 05:31:48 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35b9d29480aso1015322a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Mar 2026 22:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774071107; x=1774675907; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TSrGnm4uwHURRo/Dbgx7AVRGahiZ5mij0ljFmYODkAo=;
        b=KAluqOM85iJiJJoCvwphJt4ct7z7HbylGcfx0LG273PmjozpQ02rlecQsqQlQBWUrR
         tpS9YacWJaD2NHLu5xyJiJ1d7GoVA4rt+TnAQk0ELQ92FLiX4nXNMqSmKmACoovjgyD3
         0tw0v785+OoYAbV50IyZSEQOS3rPbTbBVX+WZhqsBkYrXbU5IBK+d4SPloyswYiM4VAM
         tmjUB3OmrHNTUSnqGXkdL7taIDWOw30rmaY9gPMkxCJXdm0rvzgYP0gFKbIz04QvrPo9
         dkfbyAj91kOJ+slTsMXkXBDlKxGf9Kp/tWv/sks4CDhwenllAx3iRi4FT+7y8O3IR7wz
         F1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774071107; x=1774675907;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSrGnm4uwHURRo/Dbgx7AVRGahiZ5mij0ljFmYODkAo=;
        b=n9nyEok9dogofA4hME8ca9OSBWOiq5WLDTk/973gkIFmr9yvDG4lkq0pWoLRP+goGT
         SQ2uEHn83thpX7QqCvOumvMJEjkHowvNGdaRQiwDdhDBw+qgSym3EwIm6CEzvRdEd+Q0
         VY601UqRzFv0Pqc0OtLvl5QbUUAujuL6s39ajOeQBATqq/sRro1X4id3VuZAdqWGOSMc
         WY5gJkhdl8/fITKJgNdtq6+DhnDX94nkOLVT5Rp1qDfyPOOAKKn2XVKxgG+ni6FqV+qr
         jPn2Crgko4DxY5O0pwfWLLMXo6rodlx78v4JHbdg82qtT2WyyFz4RLDF3jT7/OAa74iT
         4Deg==
X-Forwarded-Encrypted: i=1; AJvYcCXVNjBmDy98kRngspdxcf4Cgq4CdKI+NR2vNT3P/Ep2ko4bjFzOTcvUTNOEbKzlEZxEsuqoqrEDwm00jA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWt95f1LhcxHDZnm/DyzlZZO5eCo0ihysUiiqY4O+IFNfmosXi
	FvDvDyh+XsMrGnlnTsf3vdAMBUEoNdm4G9SyoUM53DHr0cANOEz7IIIY
X-Gm-Gg: ATEYQzw7O1+SpP31s/oUrzCOwYniwaGxasY2detmjFGh3q1uRWBC/MgLqLkAKjzb9P8
	DYXaW2FJrDU+kWJ5BgpxfNJhYXBGCMM0rWKk55IH9FSbA4B8jfeLPZd6ln9mbQs8dKass/fJVPS
	3Ek3uIf7CvG+mhTr4zOuMXQRZ1mmm895uPI+ENPjdORJJma0Ksel0MGJNqwgndeSgKqXx4WihmB
	7ZdRUhyh55oYn0BYBGWCL+gt6CTmhHcSgKn7teKBWbBiAh2kfppcdR30laQzMPQ5z3q4h2Bmcfv
	dl9wYR5ZOSvGAaO+W3gVhSRCqJ7NG78rZEOrqSps9vZz4bRD9YiTi5Lf1Apbfp57+VtJRkaesl8
	eznYL9brcpsh0boQrKlHkCRzsgFMXgu6wh8XYu9a1U28unPR3ZPf28PCuXuz2GT+rsdsYYQFVCY
	XYt3zv9hZtqV17Qzu5XcpuMg==
X-Received: by 2002:a17:903:191:b0:2ae:8272:deb0 with SMTP id d9443c01a7336-2b0826feb3dmr54931105ad.15.1774071106610;
        Fri, 20 Mar 2026 22:31:46 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516aa6sm55638395ad.9.2026.03.20.22.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 22:31:45 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, david@kernel.org
Cc: ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, baolin.wang@linux.alibaba.com, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] mm: change to return bool for pudp_test_and_clear_young()
In-Reply-To: <2711ec4bf6c30182004e34027fb31a2e8e24749e.1773890510.git.baolin.wang@linux.alibaba.com>
Date: Sat, 21 Mar 2026 11:00:45 +0530
Message-ID: <cy0xycje.ritesh.list@gmail.com>
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com> <2711ec4bf6c30182004e34027fb31a2e8e24749e.1773890510.git.baolin.wang@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_223147_768696_F6822A53 
X-CRM114-Status: UNSURE (   8.14  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Baolin Wang <baolin.wang@linux.alibaba.com> writes:

> The pudp_test_and_clear_young() is used to clear the young flag,
> returning whether the young flag was set for this PUD entry. Change
> the return type to bool to make the intention clearer.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
>  arch/powerpc/mm/book3s64/pgtable.c           |  4 ++--
>  arch/riscv/include/asm/pgtable.h             |  4 ++--
>  arch/x86/include/asm/pgtable.h               |  4 ++--
>  arch/x86/mm/pgtable.c                        |  6 +++---
>  5 files changed, 14 insertions(+), 14 deletions(-)
>

LGTM. Please feel free to add:
(assuming you will anyway kill the unwanted externs)

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
