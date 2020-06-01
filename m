Return-Path: <SRS0=95at=7O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDFCC433E2
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 18:39:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6361220678
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2020 18:39:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oIohM9oU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="iJyFyog3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6361220678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DxSxb4qJ2PqYBDzQWgigjbwPlUa5UGLq42V80vRyc3I=; b=oIohM9oUH9SJQoZgTmki4KNTJ
	4b+8nNAuAUrfoyt4nioRZ/S9/f8IQh0IYB+Tgw8i5qajnUPxTRKJ5cCeCGXXcmcJqzSSISicd7n04
	FxZEyaUlyjusSBmhrQUq04IfWL6QuDthbQgI/O9IjdcjYanO8bscpTFxkZW2ZLXTULbiftx+CBrn6
	wCKCoGsNUx3Jki6ACxXaSpgwX1c/hLec1e3YEwUUp6YWpWIFoJ996SU6jlT4Q4pGWjD4MoJTp02Zt
	2jcHfdiCUog/qq7IQ+ggoKPjSElt7/rcn8eXicSsQ2TThdvgDuPlJWlGT0XgN5uATZt6MPSREjVmN
	S5TmTGxRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfpLC-00010y-Ck; Mon, 01 Jun 2020 18:39:18 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfpL9-0000zJ-Jt
 for linux-riscv@lists.infradead.org; Mon, 01 Jun 2020 18:39:16 +0000
Received: by mail-wm1-x344.google.com with SMTP id c71so472429wmd.5
 for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2020 11:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DxSxb4qJ2PqYBDzQWgigjbwPlUa5UGLq42V80vRyc3I=;
 b=iJyFyog3o3AHmohKhPz332v36/Qyh0qrg3OZFBu48aDgBLACJW+ckIyF4yBGM+HpQi
 zD+FX6hrwmvP5eMczRZ5Uk6xutCdSeIZjgOy/6+Ms+iN4KvG0tY1+EhLW2bPJHrtGYCu
 ErdUmh2LXxdejN7Bof0/e/MeJjlLxk4jgpxvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DxSxb4qJ2PqYBDzQWgigjbwPlUa5UGLq42V80vRyc3I=;
 b=lnkuBPcAl6dEpELWoQu4SW/fiP+2WwVYolvDLZ65gxZoLDw3641U0ZC49nLt7IaSWP
 Nmdenp7icDXKN/toyKBJA+7Lp2vDRd7PoAJZJsNMZheveAfQkrXqJKlF+Iair6hq2yW9
 SiRkbZJcQMmRsDybQZ6gxfOpByR5EbU5JtLTbbTJcQ12+5vj5hbo4xAiDkRQ/pn77tar
 S4lDR2kKI8ZBpVBM5bDHGtF1WpLLk5AiJ8PVgZXnNQmnOmRJ5gFTvy7f0P54i9ez37m3
 bjpcuYUFPmwzM8aW+vLBtlFcC+5PiAfLZvChGtTVEMaqAklkMMju26TSTaIWpvPBkAm8
 pdww==
X-Gm-Message-State: AOAM5318459nJ5aCfdGumcW2z0QBZrvFf5Uusm+l+7CKpdkIwNYVsUZl
 qEyKQHskC3b/W5bfp2QVE+gY+JEECGjJ5L3eDuVR
X-Google-Smtp-Source: ABdhPJwAD8zGThyfWXoJiI+rafDHc+O4vEm2xlxQg4Z/EpXFQAHDx/Gpl90tcbfPP+vrQbnuJhlQEyxbIADBdZ0LHig=
X-Received: by 2002:a7b:c622:: with SMTP id p2mr562073wmk.55.1591036754065;
 Mon, 01 Jun 2020 11:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <29cb3d8c72db7fe36507f487a71224b812805197.1590994864.git.zong.li@sifive.com>
In-Reply-To: <29cb3d8c72db7fe36507f487a71224b812805197.1590994864.git.zong.li@sifive.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 1 Jun 2020 11:39:03 -0700
Message-ID: <CAOnJCUKKvSvH5ZcsHE95goE4UpfrpJeJbVzgBvhMC3xhSF_08Q@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: fix build warning of missing prototypes
To: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_113915_654386_38881075 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: kbuild test robot <lkp@intel.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 1, 2020 at 12:11 AM Zong Li <zong.li@sifive.com> wrote:
>
> Add the missing header in file, it was lost in original implementation.
>
> The warning message as follows:
>  - no previous prototype for 'patch_text_nosync' [-Wmissing-prototypes]
>  - no previous prototype for 'patch_text' [-Wmissing-prototypes]
>
> Changed in v2:
>  - Correct the typo of commit message.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> ---
>  arch/riscv/kernel/patch.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 5805791cd5b5..d4a64dfed342 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -11,6 +11,7 @@
>  #include <asm/kprobes.h>
>  #include <asm/cacheflush.h>
>  #include <asm/fixmap.h>
> +#include <asm/patch.h>
>
>  struct patch_insn {
>         void *addr;
> --
> 2.26.2
>
>

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

