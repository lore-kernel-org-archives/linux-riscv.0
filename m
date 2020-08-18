Return-Path: <SRS0=g+2U=B4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B08C433E1
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2020 09:30:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3116A20639
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2020 09:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ENaeR36W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iB7njDfk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3116A20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RmVYX6c+ljDfGFciX1r2o48KdxvgchyY/Yb6EAkJAIY=; b=ENaeR36W3c1xTjDsNSKuKk2u2
	olFti0M0uG01Y5KhGTBb+tImAbbnei0APBM6N9qB2ITEGajDPkyj3VvA/lWNPPCd2surUhXhlrCba
	tCptyZD4fI7aGRIXXIMStTxAxowv/g64YTuZupLU/Cju4quxjzoVyxrfkgch+IWPer8nGrCLU/9ZH
	bbRPU+4nt4zYsqkCidEluB6SfIvyGz0rbuvE9tbctX8srtHEVydHLnCO1xw54FUPUfPfEeCucSoBI
	5G5Epl9WMWwzgLCBv/STC/+x2OiIIvYwPgiGCBeLE+vGD07O3XNYYYI6FcAyM1A18Wbdew2TQWTnD
	A8vS/jchQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7xwY-0006CL-4h; Tue, 18 Aug 2020 09:30:10 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7xwV-0006BI-A0
 for linux-riscv@lists.infradead.org; Tue, 18 Aug 2020 09:30:08 +0000
Received: by mail-yb1-xb43.google.com with SMTP id q16so11016379ybk.6
 for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2020 02:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=481phWAt8mWnm/w37igX0FBuMwcl7pH6Y12b99av8uM=;
 b=iB7njDfkGMWSB25RqCTukPDN6G8BUqT8FDIKPbEpQC0PPxPKPgNd8/0ZoLApCGD6ue
 XnS3FZJTv1c66qJCmonlcde0qkn6fnGDolHBy4V4Iy7tRB5/nvEa3ADjeE6r1OeL48iU
 bZm6hPBgkSg4uRDECLSbVnYWMtpvFFDbrSDHHGibZZOWZTeiklukC2lU14Zyk2rNFlHz
 dnAUmQDjkrhjT1TdxXFGbYRAJLch4zTWjKgr88wZaXB03+Co74Q8FMdnvvjXDAizqCSs
 Hw/G7Zg3SD6lJtnXyxAH74PdHYt4wZhmUPhRSGUqVf5nsS1UkbhyCIYnmbhEFumURfnd
 etoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=481phWAt8mWnm/w37igX0FBuMwcl7pH6Y12b99av8uM=;
 b=bNhY6eDE4VEFnsGfbkU7TP40HNP+7LANRs3bKyP1d+7VUNoGgAzT9nIyKlnvhzSVqh
 tYnzdMxyEGy65dmPEEMax8iShvlVTl0MPhR8+q1/Q39i0AK09Lj3rsgo4L80h6CygUoa
 PezXxn3kh07dTQIQVvf0Kp+CwyAaLlC6H3588S0QYcru7mFAnJsMQjIUtFX5LnLkT8/n
 4CqmM7grNqmFDFX66A2h3CFoDydtGsIj/NNhq8pR6wPcOXWHi6hDPQ/GG7DrfKsilQZi
 3Q2HsYz2b5smhD0JZV4hi9iTcBNOxYASCKPmSXAGO1+Z459oTG72AsEuIdKrRlFjbhbi
 kSNA==
X-Gm-Message-State: AOAM531rwyIOoDxn17VCglQ5vfHcLqVEGgVpAJr0i8bpdsQxYOL8thUE
 kCG3M4QYAS91csWxGtZQO9JbQqD0YAv/XeLBbbUbgxnI
X-Google-Smtp-Source: ABdhPJxM39/++p6F5f8iE4zXgPZAJlZZwZ9z86P+Ell1ALaX6vv0I5U7iT8v0iQCnIO3MMPqEkRjotqjVYYM6yDylkc=
X-Received: by 2002:a25:3b0d:: with SMTP id i13mr25465799yba.314.1597743004557; 
 Tue, 18 Aug 2020 02:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <1594874393-23620-1-git-send-email-bmeng.cn@gmail.com>
 <edca7c9e9a8934fc66d09c7056e92a6aa7f0d645.camel@wdc.com>
In-Reply-To: <edca7c9e9a8934fc66d09c7056e92a6aa7f0d645.camel@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 18 Aug 2020 17:29:53 +0800
Message-ID: <CAEUhbmW6S2TG14w0smXQ6foZvmSfVvcdYf4kgkLwT9ivXV+m0Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add SiFive drivers to rv32_defconfig
To: Alistair Francis <Alistair.Francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_053007_439809_D70B5030 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: "bin.meng@windriver.com" <bin.meng@windriver.com>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2020 at 12:39 AM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> On Wed, 2020-07-15 at 21:39 -0700, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > This adds SiFive drivers to rv32_defconfig, to keep in sync with the
> > 64-bit config. This is useful when testing 32-bit kernel with QEMU
> > 'sifive_u' 32-bit machine.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>

Ping?

Is this patch applied anywhere? Thanks!

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
