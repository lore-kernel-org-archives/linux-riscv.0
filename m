Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60DCFF885A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krqE9qNSEGMFVPx9FzRLuC/B98ql3nIcGLyylw53XbQ=; b=Dp1hf4HAR9/uf6
	v0RA/PDibuMgKnh9u2KGaoIBv1ZQCggrxf472FcTSMxqR8OF1JC1TfFMZbmPCbvzJW3ZgT6udoBNQ
	vsyOZTQ/Z+gFbYlhcgqLLCAYrcW/wY/649YAqj3BGNeLQrIqOh66PK9kFTnWvzL9QDhpQawl9yq21
	Zvi5KzRuOBVcvgSMsTs+fhRUaE0PM7PB+5FG4MEpVSgGPuP4iInvqP28e4d21BkzGCUeR05Rj+Pt2
	rN+0Bj1WukZS0IRX4CN51doS2sR2WSv0DyTUresNIEbBUHHKk7uafv69xrYIjKoTy/3oekWQ/pY86
	v3zE7cU9IlHgEYDnjcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiYQ-00000001YBu-0toU;
	Tue, 28 Apr 2026 13:32:46 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiYN-00000001YAm-1TaK
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:32:45 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-682fce74c06so8832506eaf.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383162; x=1777987962; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPdjCZsKcHNqWuo5+pnokV+zhe1DyX7GyGi+9Un3LHM=;
        b=QVpx67lEKEgq8z/C5pCV8Hz6KmKYidockP7kPtSnXQTkBEi5YMWyvJVNjrG7yBarmS
         5/4bCvtoW74WP7ZnV1nVCzCSftbBzH0duLf3p9CPheGqFuwIReieVR3deuePs9Ah6R9W
         Gpv7HN2vWxlmt1vINS4NV0omeEVtHrufZ1dkQwAUxfCgp1IYUPwWg9ZOWIZtIOXNDRgU
         bI/qy0/WX8P+pho1t/hN7h2URWzmhaML4qyp7lezkZcklVfN8DGXK+SXiSsiZxyyy7Uj
         F02zwyuM8ElJLr/h0EMoflm0DatWQ1esH2x6FjvzmIH2RjQS6tuCHx8OL5IY6R9J8pwX
         qbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383162; x=1777987962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPdjCZsKcHNqWuo5+pnokV+zhe1DyX7GyGi+9Un3LHM=;
        b=nU6Nk7DLJXAvCZEpSu4YKiWw3Hnfvs2JoHwoI+CfQWqMYjArZQrZE1Hi06IWkxALKU
         PHDStrM9MuqdgjHNjZ/k2EUspPLnZbXGBnAUsOEMJRrVBdcQKFx/7G0t2j1wOKYxlmtv
         aZQF8orAGRyoTtScCrkRBHdCYVa7OgJW4i1K0UTosBBlsQugChu/XZIyCDdmUbKrq4Eu
         ugyNyPuB8QKJdL3uKSVHW2UJUL9p2R1SLvtcjrllEmmLLYyq626BiaWrattCM9pnMM5C
         EIJ/6cLSTjAMcPSkHc8PxkqP4ob4xFJ7fe3HvQfbIjO02utmMLcnzKAeyMJgp2dSp2GX
         E+DA==
X-Forwarded-Encrypted: i=1; AFNElJ8j01qYFA7NTleXuO8DA9nTAaqEE4EW+0B5vRIadJt4LtLzRaOLikTRkaA/q4tXDJ5OZCrrymJfTmhACg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY7HfKTVACcs6xTgXspuDX8o07GWvGg0wJk+RoJl1AGbabYgWr
	bDSTU890YBCtAVpL63vOOFfXbXtcoOjbFHdJlthBGibjeFxi+VLrnIJdBV4rM6lRlDkVw7gbczw
	FdywVHvM=
X-Gm-Gg: AeBDiet3r4oY8JBhowIQciNOfdVisWVFhiA/bt3IOdQlVo1Stoj8npCB0bPJTfHMsEM
	ua6a13Qn2kHrfhWw4hcaGgPpbbTW3qAkccLE3ZXZmmBPOUuLvcACARTKNAJ9/VtETzbxoa47Db/
	hjdlfJf4HzliwiO9P42bt9z83bGu2JvBk7nVLoqcWtm2ISVXQTKwC1YB1LwM5NaiPdKNJqTiVPT
	ahVRjzm7xVgxTQHbcYfa6JE4G/nR3On4NXynMVvMJarh0VVDzQVrUkADz0PrU8qyvRLe+pProma
	zBazWYXdUnsHT67sd4YWI8x6Bk7khLFG9whJaG1cbHmfAeTSEd0uqf2zP7j4HTrWtPV4ujYYdn9
	iOuql+wSzkhVoa9lMG61LbYwAIHhbYI8Y9OXLIo+kirw1SwD512Q3NIO360TWmZ3u3v5sIrcjbJ
	zs7keLYovOJCRkqv4+f05A4bXvHB4BJVbZPp/KzORoE2MHV8oC1C0bh0xlEMTxbqM1r1k5VhFic
	QgJYx+6IhNZrEhG
X-Received: by 2002:a05:6820:f008:b0:694:8683:3867 with SMTP id 006d021491bc7-6965cbbc6e8mr1334311eaf.46.1777383161926;
        Tue, 28 Apr 2026 06:32:41 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c48c71f3sm197040285a.7.2026.04.28.06.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:32:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHiYJ-0000000AhcL-1zNy;
	Tue, 28 Apr 2026 10:32:39 -0300
Date: Tue, 28 Apr 2026 10:32:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
	atish.patra@linux.dev, skhawaja@google.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 01/11] iommupt: Add RISC-V Second-stage (iohgatp)
 page table support
Message-ID: <20260428133239.GC849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-2-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-2-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_063243_390554_AED92878 
X-CRM114-Status: UNSURE (   8.35  )
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

On Tue, Apr 28, 2026 at 09:13:49PM +0800, fangyu.yu@linux.alibaba.com wrote:
> @@ -263,6 +281,22 @@ riscvpt_iommu_fmt_init(struct pt_iommu_riscv_64 *iommu_table,
>  	case 57:
>  		pt_top_set_level(&table->common, 4);
>  		break;
> +	/*
> +	 * Second-stage (iohgatp): Sv39x4 / Sv48x4 / Sv57x4.
> +	 * The top level is the same as for the first-stage counterpart.
> +	 */
> +	case 41:
> +		pt_top_set_level(&table->common, 2);
> +		table->second_stage = true;
> +		break;

Second stage needs to be an explicit PT_FEAT not implicitly deduced
based on the vasz.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
