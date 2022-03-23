Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A0EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 17:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fHYgpi+sbUebaLcVq/Cc1OsAERrhZtkRmOvQgEqmmU=; b=vL+Sisw2QhsDGq
	Q65CWISvNw+nltH2rlqPxivXVkDJi+mwVxmr9zXVRd9hXohG6QoQJT+t1i6kIMpe56+C/Q2sJK/dS
	p+tlNSgXw7qmVpuOxfuvBkSf4m0IB9DdwA07syo8JopyLOpDYJIZGfykWF9l927eULnBcg38YiGOY
	TnSvcwtQJaL1Z1K4pjSP4IqslKsoF+rU+0WR7ML7BV97hRlVi98xrS1yDUblXFKqXJlW8A7F2Ct8J
	9fh2le+9JBA+HRa7xqYsxLEXpn8qa7gyiBsSW6xr6/7K+u6mqfWAD0TmX4OpXUGrbJlA/Nalpv8tX
	Me8dxQGS5x9xvOtXpDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX4sy-00ETJm-QZ; Wed, 23 Mar 2022 17:35:04 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX4sn-00ETDm-Qw
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 17:34:55 +0000
Received: by mail-ej1-x630.google.com with SMTP id pv16so4388362ejb.0
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sSwzHlwSz23lvNtLo13bFAIrxFRCXX53K/CMQWwbRmc=;
 b=eho+7tpnDRTL+44l04LLUo+wv1fUtZvszL0rupuFXL6S5K4e00IplNblrGZ2/VchBC
 gAMGRJMGn7oXIS+0Yoye69b87Qa71Wn1Yzl+EcrdS3AUHzHmmj1cfTjhvNYalkB8vw3h
 6Pors1dQZGvTMTBn10VggfVLiF1jcfUjH9O/iDrPsa11zUyp46c9DPy735KBLmK0IEfL
 b13VH8xR90mm0/t93esJsccRYWVw9gVImdAQH+zw632De5CmgjTeLPtzVRD++RMILX3X
 dkWE4Wqg2XTF0Q4DrBzQSBuIrMJjjuugqAcpe1RhM6drRKWw/1WyP53oowoLbuAw8sQG
 viHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sSwzHlwSz23lvNtLo13bFAIrxFRCXX53K/CMQWwbRmc=;
 b=JRhI7ca+06yZeSl5anuMj38Ye13XavMa9sxLCtDnfjQFW9glesDg83hT2aeb/9apFv
 m9hTJBMo0OJHfKqNa2vgmGTVi9ZVSYRmyy4vPefasP0i9dtC8kBpyebKsouOArQAExVE
 6ufUOugVpyab8ZlQPBngfKSVqtVldBLSjcIju12Xt9mMPwmDbAQiJHYC8DPBOJVd2wWX
 CpJEIxNvl8673yGybkgomzDl6u2zt+IxxxmhICgggT2nklTD2evno/ofOFcSNeW7lg95
 HevtF2A38UawMch48nwNGsck2NF/GuqUF+2SkwYLxUEVt6gEfaV5tRqKm8Bmids9gGMV
 KFJA==
X-Gm-Message-State: AOAM531bCcWi89g2GnCHvdgc7qj24siRHY+gxHXFlUGd8wFmQ+KNcntc
 oUxqvuZNb0sJMrasztlnWUqVHhUxB9ll2McUvgFY8A==
X-Google-Smtp-Source: ABdhPJwz8c++mc+m2Cqc/41NOOuHOiA6+RTyfPiOBMGZtngJZJD0Xv8B5WGZ85z3FwLIjo9C7ItQfgASkZAORNo6RGw=
X-Received: by 2002:a17:906:4a96:b0:6c5:5ea9:5366 with SMTP id
 x22-20020a1709064a9600b006c55ea95366mr1199621eju.473.1648056891284; Wed, 23
 Mar 2022 10:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220322144447.3563146-1-tongtiangen@huawei.com>
 <20220322144447.3563146-2-tongtiangen@huawei.com>
In-Reply-To: <20220322144447.3563146-2-tongtiangen@huawei.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 23 Mar 2022 13:34:14 -0400
Message-ID: <CA+CK2bAPiMbdv441+B+_4aGyPeAgyyaZ=n5ni3WgfyDP3bEADA@mail.gmail.com>
Subject: Re: [PATCH -next v2 1/4] mm: page_table_check: move
 pxx_user_accessible_page into x86
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_103454_038871_BF1ED82C 
X-CRM114-Status: UNSURE (   9.21  )
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

On Tue, Mar 22, 2022 at 10:25 AM Tong Tiangen <tongtiangen@huawei.com> wrote:
>
> From: Kefeng Wang <wangkefeng.wang@huawei.com>
>
> The pxx_user_accessible_page() check the PTE bit, it's
> architecture-specific code, move them into x86's pgtable.h,
> also add default PMD/PUD_PAGE_SIZE definition, it's prepare
> for support page table check feature on new architecture.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Acked-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Thank you for this work!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
