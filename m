Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F8EFD88E3
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 03:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+nTWrUuYeD9CqvfboLEe/dTgaeBT0vJmTFolO6fYa8=; b=vqDY61kzzeZjV7
	qUiULL/+M95sYr168juENgP7EZVcHPIqyJsjmWOpceX8er3xnSucWYv/EjLwrjig6TCRmgadYczt+
	HZPdSNBL4pK2nuWWoN3V3RJ4BAx981Qu+ZLe2ywg4bT21i31Yt5XsNYv/e3n/l8OkE29OUN7ah4cf
	B6C5bDUy+Y/yUgGUc18GoOuYLu3K2o8JmZaoub5bFZDgMzdZ1FlLHcDWyOcjbTp/vnDwlvE1/OpKK
	Dt9gOg+bOENRLopaSTTFFT/QXc5kFGtYglMBhCHkTvzTmT1JZkQ4+kO2hTt/QACRhLhSLErNVnE3T
	bZeI4sRP4aXN6b6OmLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09qN-0000000AaSc-1RAq;
	Wed, 11 Mar 2026 03:02:43 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w09qK-0000000AaRd-33xl
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 03:02:42 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c7382731edfso4592234a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Mar 2026 20:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773198159; x=1773802959; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vO8RhD7fGikYRNYtDoD/8DClVqthT19fczPJykhciJA=;
        b=VarAXYfXtzV9d6vdd7cx/DXmfEO8i7GvX2FuMCctz/ivE8M0BB7/yvGBddRHs5MnY7
         U6gV6cY8XgMs34qjCiuNDjAZ90oaRo5L+zQZIPH2TQwYvHqr3HsU70TH8YUNHpnZidSk
         rSh1w3neVgR4+rQV+PmyhgR9bUazJN4RddPTVrIip+wQoywi1mCnMHbHhi0Ed3999AkB
         UtC5tcMFCUMNEpS2Xci+k6azUOLXf2AAXyFNfHPSPEAQqBexaJHGQTnG96vVnJjgHO5d
         E6eQhbt5yJMAN0tYp3xp06geg/TMMvBR7nuunUSTV3qOfotG9CCb/0vbFH2pXy7FzGUm
         PJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198159; x=1773802959;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vO8RhD7fGikYRNYtDoD/8DClVqthT19fczPJykhciJA=;
        b=oAQzKno9DJqSmwdW28t/Q7CGWoUcgpkYgFNCw2thS3r5jTNlO3mCy/pW2MFi6aV0iW
         514Na4eGIS9ktjmpbCjz6jOPnrFALFUL1bN+c4+5G+wu+M3C3oR7s59IjzazEIb/Afab
         We1WiNk4s7EORv/nEHvi7jeZVFqh0f9hVdmXyajutEM0N76yYfHDOXTWBj7uKn/m1B2u
         /AUlPynqrJEpDqNNKGUk8mFY1ztDoG3aEIF81BiVTbAO/Bc2pdHR1b1GMvYMhyMtTX/2
         kLn5eIyZU91/lRnSLGBNG77uc5b8yiER3GR0kxdRAHIzkuho/AHl4LlFkOIXw40CsSck
         9CUw==
X-Forwarded-Encrypted: i=1; AJvYcCULiBSQZHL2FxL7FirTPBDfk3CHh7JxFbqc/XGrzIg/vwDZ0KNq3fGEWCOo6gggp7ceBtpq9m//Tsyb/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YznBSmoYNA/fbWzK05gAihLpWTcO+3Lyv+d/JzSvC+7766QAGcO
	Kk2HTCwmM8N/Pp1pM4d/VucmiF7TupT6Wvq5bDESYhbsxA+CiPiPHGsa
X-Gm-Gg: ATEYQzzNs9qVjV7HYHPs/eS09du9jVAIXLYXzpuCGJOamNi4gr8cSS2Fvf78u+jigWu
	Tl/J3CxsnNiAZfD7Ec37UORD+u628dgKGHleZuniPlWTkMAn2AITdaqqDXnouWcbiVtE1UOaJwP
	/TZaTapQXVjyHAAPl8c446hhoIdRKcx+bQkJUkGGqE4m7DKOgkw/h9LioLq0aS6CTslNWZi9Yr1
	MHVvreOFdJ767YaEuovU/b1P8I1Hbh+IggNWANmL6/egvA61uBeb5s0VeGfM2lmayGxEEmWfwkg
	i4NKFAL+L9TSZx0pjjwsq5TKv3slgvVhfNQBNF18x6R/GYDIdEqo6iGclLWzx3uhLKHd371UjpF
	V22Nc4v/IPIbKsXNdzAVvHHYcmz+xkme5hQSN+lJ2JstqXLb8tQ1vTLAtwuMARPtDR4dXGrJC7N
	4OYDMTJgYYwyZgapnTqRw/Zg==
X-Received: by 2002:a05:6a21:38a:b0:398:778f:6973 with SMTP id adf61e73a8af0-398c60e5857mr818593637.40.1773198159334;
        Tue, 10 Mar 2026 20:02:39 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf2725csm548196a12.13.2026.03.10.20.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:02:38 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Pasha Tatashin <pasha.tatashin@soleen.com>, Andrew Morton <akpm@linux-foundation.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH v2 1/4] mm/page_table_check: Pass mm_struct to pxx_user_accessible_page()
In-Reply-To: <ca77f3489453c2fe01b25e50e53b778929e0dfc5.1772812343.git.agordeev@linux.ibm.com>
Date: Wed, 11 Mar 2026 08:29:53 +0530
Message-ID: <zf4ft6ja.ritesh.list@gmail.com>
References: <cover.1772812343.git.agordeev@linux.ibm.com> <ca77f3489453c2fe01b25e50e53b778929e0dfc5.1772812343.git.agordeev@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_200240_757923_0C6078A8 
X-CRM114-Status: GOOD (  10.65  )
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

Alexander Gordeev <agordeev@linux.ibm.com> writes:

> From: Tobias Huschle <huschle@linux.ibm.com>
>
> Unlike other architectures, s390 does not have means to
> distinguish kernel vs user page table entries - neither
> an entry itself, nor the address could be used for that.
> It is only the mm_struct that indicates whether an entry
> in question is mapped to a user space. So pass mm_struct
> to pxx_user_accessible_page() callbacks.
>
> [agordeev@linux.ibm.com: rephrased commit message, removed braces]
>
> Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> Reviewed-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/arm64/include/asm/pgtable.h             |  6 +++---
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 10 +++++-----
>  arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
>  arch/powerpc/include/asm/pgtable.h           |  4 ++--

straightforward change for adding mm struct param in the page table
check calls. Also verified building different powerpc configs using ci.

The changes looks good to me. Please feel free to add:

Reviewed-by Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
