Return-Path: <SRS0=M4pA=O5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FROM,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B7BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 06:17:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E400205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 06:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EbyTksUZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wiq26En0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E400205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nyw7o3gy8j2GqOa5Etm+YuBCWNReZlOSwOUlaYz8mgc=; b=EbyTksUZWL310Z
	g5aFwJSMFijF5z65tM+k+/1Bejcp8B0GPeaK1V+4RVAu33g3Lvs1szPB5uU6f+1qtJVTXZYkYdJzZ
	b++bhEw3UOlIFG6ghlmCspX3O2hYciGVtsNbDeAuc7nebpAHZDqhalPzvXjJztEHcYCiQHJwr0uxg
	sCsq9GARZ+5NPx69AOr+ReDSjn8l7lJcPMoWQ65MTVTRfaXh3eVb5WIHayT2E2QKVVrO6Rjd5SECl
	9lik7T20ryK+2Zg1euI+42tIbBR8qtOBQSuWGS4HqhG04c6ZqSbMH2LOone+ZVoGZwR6+zjf5yD5u
	a50jl2jWWlXKtXjZty8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gZrdx-0003Kl-Kf; Thu, 20 Dec 2018 06:17:13 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZrdu-0003Iv-LL
 for linux-riscv@lists.infradead.org; Thu, 20 Dec 2018 06:17:12 +0000
Received: by mail-ed1-x543.google.com with SMTP id d39so700998edb.12
 for <linux-riscv@lists.infradead.org>; Wed, 19 Dec 2018 22:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uSH8Px44l+044lB7ulMznZksHkH6jpW/e6qzUQ/ZZ+A=;
 b=Wiq26En0qPUdxtT1NfYNP47NrXDB628RGKZkVe0FLdHadP5Nrj8p20h9L/v0+VSePc
 CE0Kx2IM4OM/G00JzADi3pGm/c2OGFBcUt5iuoFxCLCtObjWQwIYnWhIks7n/lhmRDzJ
 /pUbbPDRwN6MNtRl3/Bl77KfBUduIEWB5/0ZQPQn//eCohX1ngrEouuFSkHK7ulufZ9V
 UoxXieVjjKIYBT6cI83ztBMpY89HXxSzkHS6DAJPFpSXuzmgAHnmIxPzpOCkxvnjSke9
 YRzpg8breNAFUTUr98GrdThmklcufbdLZTHW37S1OfZdaIERyUQsghnYoRC3iloFmqjk
 /+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uSH8Px44l+044lB7ulMznZksHkH6jpW/e6qzUQ/ZZ+A=;
 b=nJEF2FO9XajZitZrgpoD3Ov283y/XkHBZ43Dt/a9YnSsBiUesthik0VgKj4rlETOTx
 Kk6K6yB0k9oi9S3oguAMq1EYzNMrg4yX2YgCZbSVlsdctyJK5Gxu8QI3tRZMwlZ9djBx
 u8BkLbeXs3svWtozNgo41Deiv8un//5Po/s5g3o/ugivjzX+s0YHgEbgnxo00fYS67y/
 4tcbj950tNmxwFC0sslCTSxlb2/+hE04CLQM8v2Kbsh6ADJ+0cKREHEk5PY2i3UmzsNp
 XaQlJYJQoJleTdb7Hv7zfs4IbujNiw3S8cMMZJs6RkcsXA+j01CNHU01WTaoNo2OKpeQ
 DC/g==
X-Gm-Message-State: AA+aEWYhVBIMFw9q0ERGvOjYlgKG5p4PFMInqI6vtPwlM4RHz3qJRuSY
 nAbMOcMNo44WnKMpzq/Thdf931w0zsgDt/da9Jk=
X-Google-Smtp-Source: AFSGD/WbfSLKlQIlGUFPt5Me8Yd9oZKphDudRGUpqogHXDXJ/3tW4ZjKVsiGWP2qOTsvjThnfPT0WYG9uyBZJCqbkCg=
X-Received: by 2002:a50:9291:: with SMTP id k17mr20863951eda.243.1545286618433; 
 Wed, 19 Dec 2018 22:16:58 -0800 (PST)
MIME-Version: 1.0
References: <20181219123657.61270-1-anup@brainfault.org>
In-Reply-To: <20181219123657.61270-1-anup@brainfault.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 20 Dec 2018 14:16:47 +0800
Message-ID: <CAEUhbmXNmzHVnzj88T5jxDXs=Rx_kD9fgayZ4r3xvgAOYXKWjw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Make BSS section as the last section in
 vmlinux.lds.S
To: Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181219_221710_730383_E6C284BE 
X-CRM114-Status: GOOD (  11.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 19, 2018 at 8:37 PM Anup Patel <anup@brainfault.org> wrote:
>
> The objcopy only emits loadable sections when creating flat kernel
> Image. To have minimal possible size of flat kernel Image, we should
> have all non-loadable sections after loadable sections.
>
> Currently, execption table section (loadable section) is after BSS
> section (non-loadable section) in the RISC-V vmlinux.lds.S. This
> is not optimal for having minimal flat kernel Image size hence this
> patch makes BSS section as the last section in RISC-V vmlinux.lds.S.
>
> In addition, we make BSS section aligned to 16byte instead of PAGE
> aligned which further reduces flat kernel Image size by few KBs.
>
> The flat kernel Image size of Linux-4.20-rc4 using GCC 8.2.0 is
> 8819980 bytes with current RISC-V vmlinux.lds.S and it reduces to
> 7991740 bytes with this patch applied. In summary, this patch reduces
> Linux-4.20-rc4 flat kernel Image size by 809 KB.
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> ---
>
> Changes since v1:
>  - Introduce MAX_BYTES_PER_LONG define and use it in-place of
>    0x10 magic value
>
>  arch/riscv/kernel/vmlinux.lds.S | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
