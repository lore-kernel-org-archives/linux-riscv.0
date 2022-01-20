Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AACC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jp67pweC1X/fCczGQVEpkZvUzHpXf9rdcGVGjSUzx64=; b=RPhgUx7DUfz321
	iNBJXG9fmYXEcn1Jdavq7+KIPAnyhpnjMYndQO1Fy/loR4TMBQOUIaPBeQsiuUEYGu8RgJD7kXCOf
	iw7BMF91YFo16S6jvJkkIJOnW4b4JnOjXGiZ/Y9DTlksGHa01/NvaxLDhPz7FC/qK0XfQ6hBCWMxq
	TNGHn8RVKP087eNDozHhV1BpTOlAIwsnEAwur3Y7/YfQvAVwfZty9N6DLLiB9WnpLquIGzU4DY/H0
	o003P3az/RqriqPSy13krYArGDS3nm/H8vF72GP7oZUCLJan6W35uAKrGGu/Jy5OKDZX7M5HOLFrk
	8jPr+hvFd0+LpNnJFMbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAU5S-00AN41-1F; Thu, 20 Jan 2022 09:50:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAU5P-00AN2Y-Bc
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 09:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642672230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZNWy14bNC4fJbtyD6GpQKM/LUxExM+x+l77VyG1ixgQ=;
 b=W122MDsb0tcrPaGG5+WzQmu6HxQF6OkIcytJQIfkm9H5YUPTbdKwW3KzClbDzmccbj9KNN
 u54kxEYhlSnGcWffkFrJ5Hgo2lqxezgdGySP+rT2OLtxS1MunOFv0ZRwsgu9wWET7/ySls
 HqQ3+Avk/O+ejbxGGzEaIyijckq3tLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-uRckonSkOxqb_rkLypEbFA-1; Thu, 20 Jan 2022 04:50:27 -0500
X-MC-Unique: uRckonSkOxqb_rkLypEbFA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E251932482;
 Thu, 20 Jan 2022 09:50:24 +0000 (UTC)
Received: from localhost (ovpn-13-177.pek2.redhat.com [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9AC47CAD5;
 Thu, 20 Jan 2022 09:50:21 +0000 (UTC)
Date: Thu, 20 Jan 2022 17:50:19 +0800
From: Baoquan He <bhe@redhat.com>
To: Jisheng Zhang <jszhang@kernel.org>, akpm@linux-foundation.org
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Alexandre ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 0/5] kexec: use IS_ENABLED(CONFIG_KEXEC_CORE) instead
 of #ifdef
Message-ID: <20220120095019.GA4579@MiWiFi-R3L-srv>
References: <20211206160514.2000-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206160514.2000-1-jszhang@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_015031_524820_648122F5 
X-CRM114-Status: GOOD (  18.15  )
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

On 12/07/21 at 12:05am, Jisheng Zhang wrote:
> Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
> by a check for "IS_ENABLED(CONFIG_KEXEC_CORE)", to simplify the code
> and increase compile coverage.

Only checked the x86 patch, but the whole patchset looks good to me,
thanks, Jisheng.

Acked-by: Baoquan He <bhe@redhat.com>

Maybe Andrew can help pick this whole series lest each patch need be taken
care of by its own ARCH maintainer.

> 
> I only modify x86, arm, arm64 and riscv, other architectures such as
> sh, powerpc and s390 are better to be kept kexec code as-is so they
> are not touched.
> 
> Since v1:
>  - collect Reviewed-by tag
>  - fix misleading commit msg.
> 
> Jisheng Zhang (5):
>   kexec: make crashk_res, crashk_low_res and crash_notes symbols always
>     visible
>   riscv: mm: init: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
>   x86/setup: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
>   arm64: mm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
>   arm: use IS_ENABLED(CONFIG_KEXEC_CORE) instead of #ifdef
> 
>  arch/arm/kernel/setup.c |  7 +++----
>  arch/arm64/mm/init.c    |  9 +++------
>  arch/riscv/mm/init.c    |  6 ++----
>  arch/x86/kernel/setup.c | 10 +++-------
>  include/linux/kexec.h   | 12 ++++++------
>  5 files changed, 17 insertions(+), 27 deletions(-)
> 
> -- 
> 2.34.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
