Return-Path: <SRS0=oXW+=7N=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBB5C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 31 May 2020 00:58:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67A12074B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 31 May 2020 00:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e5OGmpGT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvXbct1L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67A12074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d6k70Y3Xeve10A3ow/LySMpgRDspwv95uVqKQmGeEUM=; b=e5OGmpGT9LU6qFKbrrkcydU3i
	eAChTs2foxCd3e/lzxKacmTIETxtIROxCiR5GrJo+evkBFssS3Ka5036bzcJusrA37l7d80iDrpqh
	eDGj8hJkxuHWFa+SUGK3N8Io6n4R5DMKbrqeVvYWMhvFST4jU0cUhETfDwW3ZdMfQ+IXrVnDTQw7y
	S5PS1MWGLmtuV8ebxTJyzNYIagrO3tBU0h9Ws5O4JTW3z2rG4pJf82GbI6h5+ZXDpy9SG6exNdLQY
	6ykIVcVhoiazIxAwUvYD6QGn3eez4aEfOgoIvfUyPTBLptYohNfXnY8/E2DVQu2K5Rbh+80zyetVp
	keUq6K/Tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfCJA-0004At-Lq; Sun, 31 May 2020 00:58:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfCJ6-0004AR-Ry
 for linux-riscv@lists.infradead.org; Sun, 31 May 2020 00:58:34 +0000
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9917B207BC
 for <linux-riscv@lists.infradead.org>; Sun, 31 May 2020 00:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590886711;
 bh=JbOlPoSFTbkOH73nISpJKwEQd/K9csLx3Rzwa6BPkrk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cvXbct1LgEqRN/PobmWFvR5aqQ9BiTwClqTK1FZrkyyBVWkfEtsS5vegje0iGV+XM
 JGNpb2J6ai25wyT8pLlCThYe0Clh5AsPicS+B72p5cx086V7oZ2CkhZVwrj8RFhuYr
 mQyaVMITewT3Ji/IflYw+zwxmVvz7+HfsXcMsyx8=
Received: by mail-lj1-f181.google.com with SMTP id b6so3840201ljj.1
 for <linux-riscv@lists.infradead.org>; Sat, 30 May 2020 17:58:31 -0700 (PDT)
X-Gm-Message-State: AOAM5317Jq3+USlp/DLsjk7qVvNVG9yHV0KRQb1zpCQtnWkkr89nTI7w
 nD8rPPfS/aEKf6Z2nduqPKFrWQ9uwIw+KIgBeY4=
X-Google-Smtp-Source: ABdhPJwkIEnM5+gFTBl2ysUpEWPJtTPeA2XcCNsOs/ru0Ac1pwGW4eju8vBsmFep5QctcbFMC7fClt9xUUS1LCo0HqI=
X-Received: by 2002:a2e:8654:: with SMTP id i20mr6924125ljj.79.1590886709942; 
 Sat, 30 May 2020 17:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590474856.git.greentime.hu@sifive.com>
 <e896db91e3303f64ac401021f848e536e9d42aaa.1590474856.git.greentime.hu@sifive.com>
In-Reply-To: <e896db91e3303f64ac401021f848e536e9d42aaa.1590474856.git.greentime.hu@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 31 May 2020 08:58:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTdyXybMGPzqKi1Z_ueQkf5XxiZK2X1HrDnZkCaVU1DAg@mail.gmail.com>
Message-ID: <CAJF2gTTdyXybMGPzqKi1Z_ueQkf5XxiZK2X1HrDnZkCaVU1DAg@mail.gmail.com>
Subject: Re: [RFC PATCH v4 07/13] riscv: Add has_vector/riscv_vsize to save
 vector features.
To: Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200530_175832_925946_7189556C 
X-CRM114-Status: GOOD (  16.10  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, palmerdabbelt@google.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, oleg@redhat.com,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Reviewed-by: Guo Ren <guoren@kernel.org>

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
No magic number 32.
eg:
#define VECTOR_REGS_NUM 32

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

