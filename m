Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBDFC388F9
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 12:35:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1398C20709
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 12:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="md2OHCbL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyAFvZqH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1398C20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ylq4PAIL5VZnwLxEXSvRed4lmxBI33UClzIW3CO+RHc=; b=md2OHCbLNm6mZDaONnlDv9Fvu
	oH9uP8A7FlKy2GPU2KmDT/tGrbSLv3KOwMWQAYk539XP/NbgFZqWaYABZwv4tIXio1/DqQIi/LZdG
	pFxGTqO/uxue6K02AfZV4hbZgV13vM+EzVFJsyRCD825Ofdzie5vb8c2jquNgkX3O1wT0ikH1i7as
	bqHFd3nb8MlKzNPoSsGJLi/cWCvumf/JZoN5L4edFvnKMYwDKaciz/mLZmlG1/XHn53uXTq32jtZj
	U2+8mm2QPQ1SdfzGSNh0EkMZahZyB/W0ipke446q8BMuRXniPM3c7h5ETDX0yLvH1PPUa9TPGwukZ
	NuH4sDXTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcpL6-00080D-19; Wed, 11 Nov 2020 12:35:04 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcpL2-0007zS-T3
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 12:35:01 +0000
Received: by mail-lj1-x243.google.com with SMTP id 11so1906374ljf.2
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 04:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sxopMefyOZuMWtHDz3N25STLYVSufc9Bwo1Q3pDwMLQ=;
 b=IyAFvZqHTMGdn3b/ISjq/jPQj84QCYG05CSuT2A5Exn9FAX9c6ZqIn0gKL7Dr3mozT
 q7wywE9dOU9B2Yn9HUMLJeVNABZf3hmyoQhWoZ8YNibncYk1jqaxR5vcvBYssHNKd9Bw
 AP+G8EgxjeRBA5ma1m97oKYlw/NyjmysnDK8/zG+8gkAch4VuJ70xhjloPzsUDWnyQHS
 h/40lTJ3IKkbM2bJ99YqvytsM9wwArbtP18T0vwE2s8fleMnUFR3ivnenqCQ0EItUKtu
 eYOlq4DnYJMi0dH2xbB/BR3lxk2YaAQfLS3vZhPlDcfivpbnJnW3AkfjomvuvSOLVDXX
 5hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxopMefyOZuMWtHDz3N25STLYVSufc9Bwo1Q3pDwMLQ=;
 b=iSNukcyeYxWTGBgXD+p0dTRuMjlRZWsaHjSFwYLVrCwm3Sl1gudK/fL2RY8vxI75E1
 rBwX+r0mQ2JsSVpI5krGf1OOEkMAYe3/2c2jlpQu52EYrlzDBzk7JE1m1+2pb83TPDXg
 gRWLiQcsm71WM9QATRW52IuJ5x6cxw9LxylCHTvuzfZdnS+36uMs2jrs57XFwP2rlnax
 TmaorcnWzMAqer5XBfuOhLClbGiNwaQTucb7nurGduLpWAQf2KdH/8E8c4WYnfDLTS+4
 7eCtlasg7BrUoxB+Do7ISk9lEBILjFoCEHylc2i5Rme1qPHbHZA6EVHXxPDzS1d768Jc
 VKFg==
X-Gm-Message-State: AOAM532lpe7AWlMhTfKvtQZUL7V/nNRJ9dVR2sVtg9WbGWWfdCywa0uF
 VtFKMq2JQNrDEqA1R6dtROxOliE4QVgwSDDoxuQ=
X-Google-Smtp-Source: ABdhPJxf5nIVB1lCh4+O5nYGy43p3vRGyv72tmZv7YuPEku7I11DEovYJLwHuVBgjNQgT0ydMGVF3yDxEfLu8HdedCI=
X-Received: by 2002:a2e:810d:: with SMTP id d13mr3425038ljg.28.1605098097481; 
 Wed, 11 Nov 2020 04:34:57 -0800 (PST)
MIME-Version: 1.0
References: <20201111115216.31447-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20201111115216.31447-1-wangkefeng.wang@huawei.com>
From: Pekka Enberg <penberg@gmail.com>
Date: Wed, 11 Nov 2020 14:34:38 +0200
Message-ID: <CAOJsxLGQJjgxe+Fm3oSkcAegd3X51-pNXrEnk3zv1kyE3CN=3A@mail.gmail.com>
Subject: Re: [PATCH] riscv: Drop a duplicated PAGE_KERNEL_EXEC
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_073500_974189_B3A750AF 
X-CRM114-Status: GOOD (  14.52  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 1:47 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> commit b91540d52a08 ("RISC-V: Add EFI runtime services") add
> a duplicated PAGE_KERNEL_EXEC, kill it.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>

Reviewed-by: Pekka Enberg <penberg@kernel.org>

> ---
>  arch/riscv/include/asm/pgtable.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 183f1f4b2ae6..73e8b5e5bb65 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -99,7 +99,6 @@
>                                 | _PAGE_DIRTY)
>
>  #define PAGE_KERNEL            __pgprot(_PAGE_KERNEL)
> -#define PAGE_KERNEL_EXEC       __pgprot(_PAGE_KERNEL | _PAGE_EXEC)
>  #define PAGE_KERNEL_READ       __pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
>  #define PAGE_KERNEL_EXEC       __pgprot(_PAGE_KERNEL | _PAGE_EXEC)
>  #define PAGE_KERNEL_READ_EXEC  __pgprot((_PAGE_KERNEL & ~_PAGE_WRITE) \
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
