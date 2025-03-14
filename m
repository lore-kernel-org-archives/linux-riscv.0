Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C90C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bv2iDhMly4RcFddnMBZ1p8bMcTxd2F+Z50Ni0xzmmF4=; b=j5en+etZbD5UGp
	Mv5a/JwCu0eDgk0Axkg3QWdsJJybqGWgwtjxvrPtaT0G0lMrc2jVIAKx2xoipI5/4/PNTZtG2N5fz
	DAdWNK3pPPU0tLMDDhhzL/TClPzEbjHdmx0Tli4m5/ZQvhYJR8NHn5hvEu6kReVTb7R67LruaZcqb
	RsOMvQx5ymAgxiHNS1/FX+slu3PsYQI1aUyeOLlVNs9XFOqheN/mGbcvABbLYs/FlMDXXuL4K/jPe
	nyZBmAtnk1Rt7fFgOmlb3HbLb7ar/TZN/6ses1Am/KKCj1VCIVowRCxEnlca+tJ0MX88/m58Qo87m
	vnv31AaN3gtbcu+ttoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6se-0000000EY1e-3KOf;
	Fri, 14 Mar 2025 15:23:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt6sZ-0000000EY0O-0jx3
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 15:23:20 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aaecf50578eso387662066b.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 08:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741965797; x=1742570597; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SZ7EUzDkggWA/pzQu9ZQkMN9eRwOa+n3WjsOJVcqJvU=;
        b=eolbWaXYugcaB96eBnHwr7VPNE+luyJOEApViwTehRUIpvb0K+X8QFqChLh0STz0Qh
         jWpZVdWvXXLK+fS2tmtoOJH/1k5rTh6UkwzxDy7am03GXy6B+X8ZlYt+XsOGNuMZcTqJ
         GrO6CxhmVFH6sqD4mm6MrWvPIVIWDDGEJnNbcaXIoy8V/cAsQcvUhA6i+8wohzZ/g6UQ
         F2Cj4CTrGHAqEc3+t/c87WuSCHw+9tdvyQNahsYgOsUD/Zf8LBYgYqph4pbpmOFjBiYA
         ouzDnT2gg77K5jZJcAT8x9cBYy5qycqIVwQD//rtwE8iDMiTxy6i3TfiprKTR6pdRxUK
         4zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741965797; x=1742570597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZ7EUzDkggWA/pzQu9ZQkMN9eRwOa+n3WjsOJVcqJvU=;
        b=W28ydEe6HlpTuWk1vWkcqvtsq4RGsjsRgKozeE9vT1wMmQkYEU9MVES8dqbyT2m45Y
         cuhpS4mavezwTtPgJnx/5Rh5AqlkgdIZmiPmRoBnw41H5bz5ibStPOhYZ43W7h/uWgyh
         HRFoEgy+H4/hV6DCL0etsMXx89hWv0w5/KuNTyzcVtnSj1FdM1wXKAk+cKECMqbOrojO
         DcT17W0sHrJ8w9I5DJT0jQ2nRiqedq/RjGFVqyKPh5ESyz5H1jRkXoRre9ETYZsYSYwN
         OZuF1FPzrrDO7mu9b71T6fbHaAc/81IUmKh+bDy/aTczGzn3p6GVrTdbyaVWGhGFf/rl
         A5pA==
X-Forwarded-Encrypted: i=1; AJvYcCV8l8LseebrmQSfBlrzEHR60XkWCwiHbY+XvKKDZCm0Pr58vezGergpMB/PMP7H+XTZ1uag6RAGny/PuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAvStPw9QJLZfULmVoz2izy02pd6Zqw/ukVUSgQiBMrFx0nFFE
	eRrvYboFD1kdYk/MWvcIB3jR/+uteKmYM2VgZgz9qX6fI7spL08e
X-Gm-Gg: ASbGnctULPBZjAdbUTlxFlsihj7GWvd9AIno6hFk/foVUTL17ng3tsgElkfXprGz4pL
	L173l0W9Jr16f10uwLqjVW8c/G4ukjnRkN3ea0bp1mgI1K04mhcOavHRTdpEKz8Wha7KLsFeKE1
	zk/ewAZfWTFfCa1XG/u9w60qtJ2x7/gogHr4FUsgCsEaaAVXkt8pJeQvL68w1inKp6RiHg9CMeS
	m83V2HNjjhRLrbpxqohbo+zxda0+TnOChoqheEjWLEByO0IxPmXOpjFtFptQH9m3TRIiD2TEhgx
	3p77hEwb4hqHWKdCM47t5WZXLAR75GJmJ0aCYxGS
X-Google-Smtp-Source: AGHT+IFRZHaKw/M0LwPzqxvi7UcpNKMZqHHUGZAlPcs/3janJF5m6KNqjVQYLlLF7g1QT60YMvUAsw==
X-Received: by 2002:a17:907:6ea9:b0:ac2:510c:a3cc with SMTP id a640c23a62f3a-ac330129f06mr347515366b.1.1741965796739;
        Fri, 14 Mar 2025 08:23:16 -0700 (PDT)
Received: from andrea ([31.189.82.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac31484b0e5sm235067566b.76.2025.03.14.08.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:23:16 -0700 (PDT)
Date: Fri, 14 Mar 2025 16:23:12 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, bjorn@rivosinc.com,
	puranjay12@gmail.com, alexghiti@rivosinc.com,
	yongxuan.wang@sifive.com, greentime.hu@sifive.com,
	nick.hu@sifive.com, nylon.chen@sifive.com, tommy.wu@sifive.com,
	eric.lin@sifive.com, viccent.chen@sifive.com, zong.li@sifive.com,
	samuel.holland@sifive.com
Subject: Re: [PATCH v3 6/7] riscv: add a data fence for CMODX in the kernel
 mode
Message-ID: <Z9RJ4D2VdtNmfpqC@andrea>
References: <20241127172908.17149-1-andybnac@gmail.com>
 <20241127172908.17149-7-andybnac@gmail.com>
 <87ldtck8k0.fsf@all.your.base.are.belong.to.us>
 <Z9AwF5hwF0ES9Grl@andrea>
 <87ldtbwrdb.fsf@all.your.base.are.belong.to.us>
 <Z9B8vgdTq1M9r3_k@andrea>
 <CAFTtA3NawdhM3fF_xc9a0EogaejHGWSxhWGre+FpLeXH9J+q5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFTtA3NawdhM3fF_xc9a0EogaejHGWSxhWGre+FpLeXH9J+q5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_082319_214771_A37153D4 
X-CRM114-Status: GOOD (  19.08  )
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

> I found that Apple's aic irqchip uses writel_relaxed for sending IPIs.
> I am not sure if it is a practice using relaxed mmio in the driver to
> deal with IPIs. I am more convinced that driver should use the relaxed
> version if there is no data/io dependency for the driver itself. But
> it is true that a fence in the driver makes programming easier.

I emphatize with this viewpoint.

Perhaps a first counterargument/remark is that lifting those fences (e.g.,
irq-gic-v3) out of the various drivers into core/more generic code would
mean having some generic primitives to "order" the stores vs send_ipis;
however, we (kernel developers) don't have such an API today.  Perhaps
unsurprisingly, considered that (as already recalled in this thread) even
on a same architecture send_ipis can mean things/operations as different
as "do an MMIO write", "write a system register", "execute an environment
call instruction" and what more; as a consequence, such matters tend to
become quite tricky even within a given/single driver (e.g., 80e4e1f472889
("irqchip/gic-v3: Use dsb(ishst) to order writes with ICC_SGI1R_EL1
accesses"), more so at "Linux level".


> As far as OpenSBI is concerned, there is a wmb(), which translated to
> fence ow, ow, in the generic code path. Regardless, there may be more
> than one flavor of SBIs, should we also consider that?

For the sake of argument, how would you proceed to do that?

Let me put it this way.  If the answer to your question is "no, we should
not", then you have just showed that the fence w, o added by the patch is
redundant if riscv_use_sbi_for_rfence().  If the answer is "yes", then I
think the patch could use some words to describe why the newly added fence
suffices to order the explicit writes before the ecall at stake _for each_
of the relevant implementations.  IIRC, the ISA wordings for ecall (and
fences) do not appear to provide much help to that end.  Hence, to iterate,
I really don't see other ways other than digging into the implementations
and asking the developers or the experts of interest to achieve that.
After all, what I'm saying seems to align with what you've done for (some
version of) OpenSBI.

  Andrea

[1] https://lore.kernel.org/all/6432e7e97b828d887da8794c150161c4@kernel.org/T/#mc90f2a2eb423ce1ba579fc4f566ad49a16825041

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
