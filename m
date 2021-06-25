Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C054C49EA6
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 01:13:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C3A6137D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 01:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07C3A6137D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjDpCGOAT6UxkRD2r4LtAWvyFSfUsAMuxFQfVFYUaRA=; b=mnsXv3m6ErhiT0
	PdHkxHG9mQK4o/z2rpxEDjh5o0HIQhfBjKaDb4khmPq7hr58vbMmZsFbgJpZcriq9cxnRemNrQ7uj
	F1M3DtTOhmWD6SeG25jEhvNagcYdnFiJUUQkmP/VB+U7cXKdw6bnA90iIRFhLvDloFUleKI1k4Ezd
	4EjuZJKdB2FvJqJbOrNrE8dnXlwWjpKWn1N7OEZ+EA5QFjfn2BVnBs+5ywIYuPbPzFouXo+MRint2
	8G4JGoJyB9iZI1cCBtZ2xsvmMUq7QdHXgoZgLBBZWCpUAd/F8JQY8fOhdQDYeTgvniYWmeYY+y/qP
	UHn55lW7w/YEyPINAn1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwaPf-00Gz19-S4; Fri, 25 Jun 2021 01:13:43 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwaPc-00Gyzp-AJ
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 01:13:42 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id m9so2173743ybo.5
 for <linux-riscv@lists.infradead.org>; Thu, 24 Jun 2021 18:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d0qxPupN9xX/MROlm0ElwGrjb5EkmD1HQYEar67dhfI=;
 b=hwkuEQ2r8MR2kHEr6g1h2AShp6uH/l/GCyQbl49/Gewht8ybadsKlpismJSo/PWUnB
 TaNHucid+KA7ArBKvpXzshBRDuNCDpoEan4pE4q9e/6FsBHRAdRjs/KULZUQI1xTEmmO
 6IoQ6crJ2WFxWajWoRZ/1X17b0Va0/s9oyeqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d0qxPupN9xX/MROlm0ElwGrjb5EkmD1HQYEar67dhfI=;
 b=fhDdG15zFmsiRQexO+tFBxgwkOkonTqTptIgq+bZdiNzTPfc7jjhqMiTVVI/xb8T+6
 hrcygto5TLHXL2StcpPBMVDhunLCRz1FRYCfgfEUBj4rOsTVRZ699FVhx5mlVblqT25H
 9rsKSmYQNGrpN8Zf73cImRDpLxzm9lY9SAXnQh2Wl9Alz/raZlezOeG2xMNtww1kYhXk
 k2vwDWgmjLZltBAdytXloY1KB4c2ryh/M9uj4MwhgSt8nVXRcQLPdarTKxTmoEFaImCP
 HcCTY7ITWKyR4w9SH8NUjjbSI/UC4Zn4foTLxowaRhuN485kYEItxKIXNNsCjot5XBF7
 BKzA==
X-Gm-Message-State: AOAM532G7pkzNNfVdbskEtRVx+8B9QFfHYxImSfOg0xx1lM301zqENy2
 kUChcExfDqqYg0rv4pESfcbvZIOAyb1MmjbFoBul
X-Google-Smtp-Source: ABdhPJzoBF4yGGMmhwSDKtModRaqahZE7MGrEAmJq3wCwKyrjPsk2UTSEtdsH614PTd6ptQ4SfJ/oZ3iXkBzsnxKchs=
X-Received: by 2002:a25:3bcb:: with SMTP id i194mr8486526yba.442.1624583618557; 
 Thu, 24 Jun 2021 18:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210624120041.2786419-1-alex@ghiti.fr>
 <20210624120041.2786419-2-alex@ghiti.fr>
In-Reply-To: <20210624120041.2786419-2-alex@ghiti.fr>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 24 Jun 2021 18:13:27 -0700
Message-ID: <CAOnJCUKs-75Vd_Wmp_X5Wdf-5UPfXD3GzFnuDb8FjtT2WcFybg@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] riscv: Introduce set_kernel_memory helper
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, 
 Christoph Hellwig <hch@infradead.org>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_181340_462208_A87C24B5 
X-CRM114-Status: GOOD (  18.96  )
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

On Thu, Jun 24, 2021 at 5:02 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> This helper should be used for setting permissions to the kernel
> mapping as it takes pointers as arguments and then avoids explicit cast
> to unsigned long needed for the set_memory_* API.
>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/include/asm/set_memory.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 9d4d455726d4..96e317dcab13 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -17,6 +17,16 @@ int set_memory_x(unsigned long addr, int numpages);
>  int set_memory_nx(unsigned long addr, int numpages);
>  int set_memory_rw_nx(unsigned long addr, int numpages);
>  void protect_kernel_text_data(void);
> +static __always_inline int set_kernel_memory(char *startp, char *endp,
> +                                            int (*set_memory)(unsigned long start,
> +                                                              int num_pages))
> +{
> +       unsigned long start = (unsigned long)startp;
> +       unsigned long end = (unsigned long)endp;
> +       int num_pages = PAGE_ALIGN(end - start) >> PAGE_SHIFT;
> +
> +       return set_memory(start, num_pages);
> +}
>  #else
>  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
> @@ -24,6 +34,12 @@ static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
>  static inline void protect_kernel_text_data(void) {}
>  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
> +static inline int set_kernel_memory(char *startp, char *endp,
> +                                   int (*set_memory)(unsigned long start,
> +                                                     int num_pages))
> +{
> +       return 0;
> +}
>  #endif
>
>  #if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
