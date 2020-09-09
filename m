Return-Path: <SRS0=4W5w=CS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCD9C433E2
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 03:14:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D61921941
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2020 03:14:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CBJXzlYj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="OhXYvS++"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D61921941
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=HOSKD1c9U9UpMioM4IHhBC5itUJXG3Sf3wLI8aEnEIk=; b=CBJXzlYjJkIm8gm7YbEoe35cI
	16d7RXu7xs/qUmjl6ofZh1TshcaaOEo2hUfY5YntmQ3q/rQ4EkDxm6KQjsXJoKbsIRShZ/w64tk3j
	bvmx5QEwygeyBoqw41xdxGmxbR7QS0UI9VdL12/4RToLWYtCg/Tjki4Ti2bNtG2A8V+mwgH5rkFZC
	D/021bNBEvoxqERCxqjVt5Yc7OtXrXE819nzwZY3bnIt1g8J6Wm/QdKvwT2v/69cqPjiQoq/ELrMY
	ro0Qq3EThIT1wLf+YQgCjYgFqaPaqmc8GQtjOZTQiehtmFtLT1G4GDEj5H3YkwnMvR05Ip2LP7uyL
	ykxUVoHvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFqZA-0002HW-0p; Wed, 09 Sep 2020 03:14:36 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFqZ8-0002Gj-C4
 for linux-riscv@lists.infradead.org; Wed, 09 Sep 2020 03:14:35 +0000
Received: by mail-pj1-x1042.google.com with SMTP id q4so616212pjh.5
 for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2020 20:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=39m4LhZs45laqOmhmZyfSXwnM8OfEqR9cCChjoKnUXc=;
 b=OhXYvS++MysMWZ/N7jmaM+P1xjT45DXxaphHO3ioFPAF1YF9ypY6NNkKy/xn4O+fxg
 WGhqfn8oTYU32yikjkVEN/B3w9AUP8ADvOzR3tVH8AFEcc74HEcRyl5WRy09oSosSb0J
 PCNncI4YD7ID/1n73i69vZ0NmVe1Ct2LPMJdA59O5nRVRyFI0A2MRniIiqT0S2d9oFMl
 cPt7g6BVEoMOthZ78eh6wOaJMVKW2jIoRNDD7ts9wm+VxUopDPWwOaf1M46OL0d3v5/v
 KiMJYO4qK0KqieWXmxd/A9mbb1l/j0OOFa9V4XvKy5L7dqF3HUeIjj7NxRuLn9SNiCEV
 XRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=39m4LhZs45laqOmhmZyfSXwnM8OfEqR9cCChjoKnUXc=;
 b=m2YsTPeMVTp+MH3vnIQneJMEBvHtjmXMSyOOE2QpSB9hHWJbkja4JxGuVH4sXOwYWr
 2SIiOjbGDZ2RzHn22+TNo7cDfTLPe33RXSYwp/PYElIlb96vHTVwEXu0AIo+Gl4FMEF+
 Z1DdKUg8GKZRFCFJDJq/Bns3jDYt5E4TG7D3kFjiy84haMeyFLxrE4LMEGLfc9UE3BB+
 AREy3PlHwaf8EjYbrk93bRuwn7/w5NmPBMVYAXkE8oAhAWIgtwU+h5MMp/MI85EOoGFq
 AxuDXepbRgsA5bzxIKC+o9k0OmsWxPWUIqimCfCiZ8ssHQ90lSc1UTwePOq8QiZZ7ic1
 v9jg==
X-Gm-Message-State: AOAM530t1QBkiie0KFeWdBGKG/+YTk85Mjp83dpFUWhLPVL2iAywAydS
 PzLwjZGd/4IUV8ltpv2TMYn2fjInRXiygQ==
X-Google-Smtp-Source: ABdhPJy11kwRfPCM17eAjhgifK7xK4cqTDajM7DnZhZg+FPQGP9IQFtQC/NQDu4oJsKxHyS0gY8JDQ==
X-Received: by 2002:a17:90a:3d0e:: with SMTP id
 h14mr1749442pjc.34.1599621271892; 
 Tue, 08 Sep 2020 20:14:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q71sm506450pja.9.2020.09.08.20.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 20:14:31 -0700 (PDT)
Date: Tue, 08 Sep 2020 20:14:31 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Sep 2020 20:14:22 PDT (-0700)
Subject: Re: [PATCH for-next] riscv/mm/fault: Set FAULT_FLAG_INSTRUCTION flag
 in do_page_fault()
In-Reply-To: <20200905060726.529182-1-penberg@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: penberg@kernel.org
Message-ID: <mhng-35dd7f07-a03c-4238-b28f-1aea7f0677a5@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_231434_424883_B6E994A2 
X-CRM114-Status: GOOD (  18.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: penberg@kernel.org, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 04 Sep 2020 23:07:26 PDT (-0700), penberg@kernel.org wrote:
> If the page fault "cause" is EXC_INST_PAGE_FAULT, set the
> FAULT_FLAG_INSTRUCTION flag to let handle_mm_fault() and friends know
> about it. This has no functional changes because RISC-V uses the default
> arch_vma_access_permitted() implementation, which always returns true.
> However, dax_pmd_fault(), for example, has a tracepoint that uses
> FAULT_FLAG_INSTRUCTION, so we might as well set it.
>
> Signed-off-by: Pekka Enberg <penberg@kernel.org>
> ---
>  arch/riscv/mm/fault.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index a173432ccf82..1359e21c0c62 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -234,7 +234,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
>
>  	if (cause == EXC_STORE_PAGE_FAULT)
>  		flags |= FAULT_FLAG_WRITE;
> -
> +	else if (cause == EXC_INST_PAGE_FAULT)
> +		flags |= FAULT_FLAG_INSTRUCTION;
>  retry:
>  	mmap_read_lock(mm);
>  	vma = find_vma(mm, addr);

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
