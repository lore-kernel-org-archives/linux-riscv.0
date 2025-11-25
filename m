Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889CACFD379
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 09:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MVgOlK/RO0OVNWaH1pH5HVYtwJCUO19SbX3lHRjz8Os=; b=i2fCFSj4V6Cxhg
	8CT46TaoNjn/BphMh1mPAfRGyW3FtRIzJ20tGO4QYJL2KosiuykerMoXVu2ZApwqxQkRiwDojfATs
	eCX+IWc6RqWN7JOyiGTaMTbojnDKasT6hOgnHunmqdERhnoZzWnNootw+Bq5XPsxQBSseAu7ZYvhD
	VD/mbXiaDwQyTb8by3C9QqS3sSUSxg00BZAcoWqFXrKR4o1yfWRq1VQvsA3SGSYMgjRayZAtfqy+e
	voDN79lXV9i2OBbklvKBez0gbsrzXFIUDc7GVOP936xK9vpmQvAucohntJpmWxbFoxoJ+rxB/smFu
	bu2+7DeRq5VpL6OPj1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpaK-0000000D2bZ-2MYx;
	Tue, 25 Nov 2025 09:43:44 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpaH-0000000D2b6-2kzI
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 09:43:43 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-45034dbaaabso2400185b6e.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Nov 2025 01:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764063820; x=1764668620; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1DEMhoyJR5Ya2N+6ATmyeN5MRN5ywYpjrwxCrvpqK9g=;
        b=k0pZhpgJn3V+GFjKaQ23K3dWTShyfpuAT4S3+zgrLY4K6vRXJK6vjo8RJJL1xjz+yH
         sfcJew+Ls2/d+B4r33vB+Z63SX/guC3480/Xv5p9UoI21mHwVkDgTrKAXiXNckbfi85F
         TfDk9qKcxFgxylWh547ukhRl+SY8liTh0AbkZRTS+Z4CVblPnkciv/s+9NLRmy5wnx1S
         kkvtL5rzT5F2hGrDtd0t4bzeOjMVty4Fqt+2dOskejSs1MNkZLPZ6Y5Gq9wh0o3RaPTy
         CMMVYc6zRCPLfA1bROBqWOp/pbqCEe0g0acGuwObZimSYimk4Of6O/RSYkeclEciE+R8
         yfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764063820; x=1764668620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DEMhoyJR5Ya2N+6ATmyeN5MRN5ywYpjrwxCrvpqK9g=;
        b=XIP9TT7HnjF2XsYk7B4iwz9LYq9Jj4oz1HZAzWZ6BeGrt1VVdkv3WJth6HQ9nTidtU
         5pvJ6v9ujqY5b0VpFCOnnfASau6kA2gNrKe6PlHljZNBCblqfOmSEJ3b6oWI+HjHdkUF
         BjGuz3muK0a4DLtbk4bPtKABdOsXLhew6Q/qpYnDYfno6BeC2JJ2na5D9t8yNZ4fCwlL
         ogLOeMPl7Gwp1KUh2WXlkZuB7cUNr81mP3OCYhZ2GzZa9TlifCfvbYSbqMRnqvKMfPR+
         VpTXompLbuOgtmVIs70IwU5cfDhLOPyfd4M5AQFBLjL7UJYsU7WIzcyGcF1wg32lg8t2
         RXsA==
X-Forwarded-Encrypted: i=1; AJvYcCUQPReiLg76CKafjSUoJ3ZssvGYSm7okryttolzN5lYkYyu47089afSIB8RYZ15azY5/9kt5qPhkowttw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7IU6R0HcB6z+Quoo9MfDdtAGYDzSiRuAFL3ktBGlFxQiz6714
	r/LK4qUJe64tK2g8VrnK6hvypVpi/DbTrIutLtM9Igj3g1YK3JomTXBB7jIBwkWp3AxaZanRwQ9
	351cMaGmPRKa5FHwlgDD293WGVqZyo5I=
X-Gm-Gg: ASbGnct+bCiR8LombKouum5Ht1loIYVDkdpuS2gyPKjQlfmA1p9Z7BMwHJ7d92WqtXf
	kGPDBtordvQV7ByGQJLiWf66sOsEE4zy+3/RcMhgeRYy3HSUgDOimCsjK9p41NdZ+9OHed0z7zL
	hwaPYlyHSptGGCsPrf+adpFHKkGaoOC1425WU56IvFqLiaDQqsNR1mr/3suHtChmxV45XTK+9YY
	2AZL8TWMlMFtmqvbOur3tsVEoS42/526SIkMlLSUDm+Ey7Np0f75Nu733mCqdG5o9AMCbI5ENSt
	HyclbVqa/4Uk1qdWTAQT1o1f
X-Google-Smtp-Source: AGHT+IHjzSP1vWUEYyBNaB+pfgCIn3GULdkosRoCxVHby5roWsTS+mvA7mK21fdZj6eeT1wFTa8Kc1BkazSk1OlxVSU=
X-Received: by 2002:a05:6808:d4a:b0:450:d143:b79f with SMTP id
 5614622812f47-45112d661afmr5677499b6e.66.1764063819856; Tue, 25 Nov 2025
 01:43:39 -0800 (PST)
MIME-Version: 1.0
References: <20250718072711.3865118-1-zhangchunyan@iscas.ac.cn>
 <20250718072711.3865118-4-zhangchunyan@iscas.ac.cn> <6c2a11f4-27ac-1389-23a6-5f5bcf1c5048@kernel.org>
In-Reply-To: <6c2a11f4-27ac-1389-23a6-5f5bcf1c5048@kernel.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 25 Nov 2025 17:43:04 +0800
X-Gm-Features: AWmQ_bkkJeJE09vs1ypjMmGjNJm9TFEXHZ69kcAmZZd9hlplsqwCoCW6EAigUqQ
Message-ID: <CAAfSe-uMCVGS6a0YLQxBrQAdYK16EOUPNM1t-7jPaoGgZzbs6g@mail.gmail.com>
Subject: Re: [PATCH V3 3/5] raid6: riscv: Prevent compiler with vector support
 to build already vectorized code
To: Paul Walmsley <pjw@kernel.org>
Cc: Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, Song Liu <song@kernel.org>, 
	Yu Kuai <yukuai3@huawei.com>, linux-riscv@lists.infradead.org, 
	linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_014341_709032_CFC70F84 
X-CRM114-Status: GOOD (  21.19  )
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

Hi Paul,

On Tue, 25 Nov 2025 at 17:26, Paul Walmsley <pjw@kernel.org> wrote:
>
> Hi,
>
> On Fri, 18 Jul 2025, Chunyan Zhang wrote:
>
> > To avoid the inline assembly code to break what the compiler could have
> > vectorized, this code must be built without compiler support for vector.
> >
> > Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>
> This one has been queued with a somewhat modified commit message to
> reflect what I thought the intention is.  But I might be wrong.  Can you
> check it, please?
>
> thanks,
>
>
> - Paul
>
> From: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> Date: Mon, 17 Nov 2025 21:19:24 -0700
>
> raid6: riscv: Prevent compiler from breaking inline vector assembly code
>
> To prevent the compiler from breaking the inline vector assembly code,
> this code must be built without compiler support for vector.

This is more clear and easier to understand.

Thanks for the review and rephrasing the commit message.

Chunyan

>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> Link: https://patch.msgid.link/20250718072711.3865118-4-zhangchunyan@iscas.ac.cn
> [pjw@kernel.org: cleaned up commit message]
> Signed-off-by: Paul Walmsley <pjw@kernel.org>
> ---
>  lib/raid6/rvv.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> index 89da5fc247aa..015f3ee4da25 100644
> --- a/lib/raid6/rvv.c
> +++ b/lib/raid6/rvv.c
> @@ -20,6 +20,10 @@ static int rvv_has_vector(void)
>         return has_vector();
>  }
>
> +#ifdef __riscv_vector
> +#error "This code must be built without compiler support for vector"
> +#endif
> +
>  static void raid6_rvv1_gen_syndrome_real(int disks, unsigned long bytes, void **ptrs)
>  {
>         u8 **dptr = (u8 **)ptrs;
> --
> 2.48.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
