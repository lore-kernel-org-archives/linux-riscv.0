Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EBFC43217
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 08:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bo2zd4n/hva4LyuUM8ouQIMDAsrcYJiJRN/lYykmc10=; b=fQK5Cwv8qsnpIJ
	52RPbDHF249i32Ae92EwljVobt+dxuAuhpgaStjv8BKEsFLhQJiG9IpFfTHnKFSzEZaj6qzPsHDGo
	H9TiahjfjsCHYx4Q69VLXLASImLofmVog294B48kfQy7TjOq2D3NaxVOpu+EKTErLV0WbGjolStV8
	pXjiBolbJjQyz3NuuDNoBrYf/puVRpButLxrh2Oe4aoOLJg6QpuGIliT1bl6/v1NiCys7JF2tMgT3
	E6D2+hhWoCZ4tD5A4PoGraHX7ZQ/iK+5Djf6oZPaJauCgAmtncK/02rKYhmGtbxjm9/uZpO6ochcW
	wwz4N2nO0FHHSdLEme6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnWJ-006PkG-D6; Fri, 21 Oct 2022 08:36:47 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnWF-006Phm-79
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 08:36:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id ot12so5455736ejb.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 01:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mWlggewwQ2CX40hUS4GSRzTQWdVPxQZUeJIdfD+dQpQ=;
        b=LM5zc1Q+qfjdx6E4WnvpByRQACYeR/byOzm7yHhAaReRav7UR15c0zyhwYYND9kkbs
         TQafY1htznkzikqS55d5KyqB8oRR6sQDGWZCGuHI3mqeV6p7oyf8nnvad3/5BdnCr8G4
         I7hO7DvrnbLfDWFTK7dGjKWESGu3cNR1PBHvCkrXQV79/L5X5GTWuXPI8RUz1CLL3oH4
         uXj8fvZOYw1EY4OKEzOGtWMZ46V6hVkTUtpdKrm09BYsa6acK05k34oAMuDhwVyyHY3N
         mjz4F9Xbjd90HNdQwuNhiO4l1DBUiI3Jlmb4kFepvVmLsDHgicRPk1j6QP7iBKIdfHul
         tkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWlggewwQ2CX40hUS4GSRzTQWdVPxQZUeJIdfD+dQpQ=;
        b=GKc2VNnstJv2eRqi/pOSCitWfvmBtF2uYspshel2Ms7mQddJU4GRQvItVLCbwsq3jh
         nNXA10WWJACcNtpc9FRFcZRcYS31KrKfWDpXhrCTR9Yn6gJkL1XlPF5iSynGyfVGPxU+
         xmYC3ML4VGDBngm7g6lBe2rgSvRHQBI4yU8Ln/CMll9WR0Vg+ym/7+CWgPnTVe+8fmVG
         AtwPkVEYhxlGA7z2SeGdqEAO3DhaQM+hToPyKbNekCUr0LPM2V7HiXNkT88I3PIFwGDW
         Iv4OpRfKzywS6l5WrWe8OtpGZKm33/tUN/hbpiA10EPL++R2WrLkiIKt9JvN+oiD/POE
         fEPg==
X-Gm-Message-State: ACrzQf2xG4MIlyGuOHS4NKs7IzBIQXB5eUFfyzg1vTDFy5X2FLHOPXpA
	vcsHoVlja9FRhQKQlDPvhqEMGzNr8T+u+g==
X-Google-Smtp-Source: AMsMyM559GL9KMPxBwSGFGSi8fj7Y7iF48EDnyiNRRD5154qdFlvaUXoONBbSIUPtqAi5iUkVEqFHw==
X-Received: by 2002:a17:907:3ea7:b0:78d:cb74:3d1f with SMTP id hs39-20020a1709073ea700b0078dcb743d1fmr14781477ejc.483.1666341400762;
        Fri, 21 Oct 2022 01:36:40 -0700 (PDT)
Received: from andrea ([77.89.52.45])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906211200b0078ddb518a90sm11220650ejt.223.2022.10.21.01.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 01:36:40 -0700 (PDT)
Date: Fri, 21 Oct 2022 10:36:35 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix race when vmap stack overflow
Message-ID: <Y1JaE/ot91Z0KXuC@andrea>
References: <20221019154727.2395-1-jszhang@kernel.org>
 <Y1HZFcBo21SQzXVj@andrea>
 <CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRAEX_jQ_w5H05dyafZzHq+P5j05TJ=C+v+OL__GQam4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_013643_313283_B5C8CBC3 
X-CRM114-Status: GOOD (  13.06  )
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

> > > +     atomic_set_release(&spin_shadow_stack, 0);
> >
> > Have not really looked the details: should there be a matching acquire?
> 
> I use atomic_set_release here, because I need earlier memory
> operations finished to make sure the sp is ready then set the spin
> flag.
> 
> The following memory operations order is not important, because we
> just care about sp value.
> 
> Also, we use relax amoswap before, because sp has naturelly
> dependency. But giving them RCsc is okay here, because we don't care
> about performance here.

Thanks for the clarification.

I'm not really suggesting to add unneeded synchronization, even more
so in local/private constructs as in this case.  It just felt odd to
see the release without a pairing acquire, so I asked.  ;-)

Thanks,
  Andrea


> eg:
>  handle_kernel_stack_overflow:
> +1:     la sp, spin_shadow_stack
> +       amoswap.w.aqrl sp, sp, (sp)
> +       bnez sp, 1b
> +
> ....
> +     smp_store_release(&spin_shadow_stack, 0);
> +     smp_mb();

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
