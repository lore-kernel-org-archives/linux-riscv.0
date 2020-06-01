Return-Path: <SRS0=95at=7O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C15C433E1
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 09:14:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC8EE206E2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 09:14:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RWNlyTW6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CL4iEJwq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC8EE206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FZM/b1eDgF0VRuzV5FNLC1MkpBePtD4A8RkD/b1RyRs=; b=RWNlyTW6Z6OwlPsioh4Ae25sX
	41F1H/EyIMn0qt06kso7RUoou9DYSs7kD21QdHmv5ERab2QPvyU/GxtSy7JEBpeKahzk4ZtpVvVfN
	wHsRZohNV4zQ8WIi/A6cj9S+bBJBWBADkdScXnBa8ughvtkN8c2BYJBHbPvV0bniCcfSy8xHvTCWg
	kDC9XkD3aTo9EByLG0eU7MjiLu8JQ7kP8+BLhqJBDwni1HdM4j3CMRax5AVmIS2Tv3IxU9o/O0Fo7
	4sL26XCAEyJqWkrX1F7pNsk9xYUxieJsS3Zne2YlCJ7mNV0UeSWwhdb/mTx2y2Ux6n74PILzg3l1J
	qn7jtbENg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfgWA-0004qJ-Vv; Mon, 01 Jun 2020 09:14:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfgW8-0004og-30
 for linux-riscv@lists.infradead.org; Mon, 01 Jun 2020 09:14:01 +0000
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7204A207BC
 for <linux-riscv@lists.infradead.org>; Mon,  1 Jun 2020 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591002839;
 bh=x7c+S0R2buWnKrtRNJziq9FOv/13giWgGdxyEHxAFdA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CL4iEJwqcN+m3tDYIC0n6yPU+A3vjClNIAaiG26YnpaUM/v60ddvDAF5oBErqDx0U
 GRFtEDDPjQ7GU1ZTX9FizTDAA+hyTklX9I0K57vRPNF22PW9AUTsMvBhJbhaT8UOXA
 dzgvCNEmoj1pN0BzVIpOR1MhDXfPLGYDWr84XcQ8=
Received: by mail-lj1-f177.google.com with SMTP id o9so7208454ljj.6
 for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2020 02:13:59 -0700 (PDT)
X-Gm-Message-State: AOAM533cQDho78/ZEr3c23ZBOqPnW0zKq8AZjljNhWKuzZgCFRmiFRTX
 pjJwO1C+GrLDbmvasbQXQLi7YFppQeh9oIvnnH0=
X-Google-Smtp-Source: ABdhPJxhsOdKWEAtnlJOb15IZGLETXZ6MaQD5nPaEjaODsGv89c/S4kRUUC2nWJF1njCgh9v8Uy5Hh9o1HSWcOJoyE8=
X-Received: by 2002:a2e:611a:: with SMTP id v26mr8809271ljb.265.1591002837783; 
 Mon, 01 Jun 2020 02:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590474856.git.greentime.hu@sifive.com>
 <e896db91e3303f64ac401021f848e536e9d42aaa.1590474856.git.greentime.hu@sifive.com>
In-Reply-To: <e896db91e3303f64ac401021f848e536e9d42aaa.1590474856.git.greentime.hu@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 1 Jun 2020 17:13:46 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT81u=Kk3XPvnoh-AFJn5JGRpNXZjWAKGT5T_4KzLreag@mail.gmail.com>
Message-ID: <CAJF2gTT81u=Kk3XPvnoh-AFJn5JGRpNXZjWAKGT5T_4KzLreag@mail.gmail.com>
Subject: Re: [RFC PATCH v4 07/13] riscv: Add has_vector/riscv_vsize to save
 vector features.
To: Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_021400_155495_3260D7BE 
X-CRM114-Status: GOOD (  17.83  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Since it has been redesigned with new version spec, please change the
first-author :)

And add me as Co-developed.

On Tue, May 26, 2020 at 3:03 PM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> This patch is used to detect vector support status of CPU and use
> riscv_vsize to save the size of all the vector registers. It assumes
> all harts has the same capabilities in SMP system.
>
> [greentime.hu@sifive.com: add support for dynamic vlen]
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  arch/riscv/kernel/cpufeature.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c8527d770c98..5a68a926da68 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -16,6 +16,10 @@ unsigned long elf_hwcap __read_mostly;
>  #ifdef CONFIG_FPU
>  bool has_fpu __read_mostly;
>  #endif
> +#ifdef CONFIG_VECTOR
> +bool has_vector __read_mostly;
> +unsigned long riscv_vsize __read_mostly;
> +#endif
>
>  void riscv_fill_hwcap(void)
>  {
> @@ -73,4 +77,11 @@ void riscv_fill_hwcap(void)
>         if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
>                 has_fpu = true;
>  #endif
> +
> +#ifdef CONFIG_VECTOR
> +       if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
> +               has_vector = true;
> +               riscv_vsize = csr_read(CSR_VLENB) * 32;
> +       }
> +#endif
>  }
> --
> 2.26.2
>
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

