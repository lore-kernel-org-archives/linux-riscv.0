Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB5AC001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 00:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtHNaUFecVNg6DFUumt+ltTAbUISLiDRP8qVjRbGzIA=; b=DVS280tCaF4S/o
	9G7ZLxwfMiFVbtduFm3Fj74JcQs5Dk2SnBdK/t2ghozuujc8xxKiZVr+Ar2TLegteIHiCh7XOdBNo
	KSOsCM9NbJSLnKYnzOsx/iCgxtNT5kuPl5w/DD1q/Tu4qLDbPA9Yv38CcEOLht2nAK2jeyoepX+9b
	QFywNNzwMV/lv4NVVaUPi0HkDN5wRd//4ZQF7JHaHL7Rs4iSq7mQ0cEMCmkDgEHi1jcbsBxY8Bkb4
	9HPBuJs8rXwnN/hQKFMuPSMhC4d2jwKP8Nw48hKzz2EtoA9n/aIcIASyneybUFyHLz9VT2MPgIjD1
	YBndrAB2vK8OXFrHQtsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMHNp-009Kj8-28;
	Thu, 20 Jul 2023 00:19:05 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMHNn-009KiB-0t
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 00:19:04 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-666eb03457cso125421b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 17:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689812338; x=1690417138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a2fKBNDS/BT8xGkvmwL61aPgUlEwLkJXN1Vosidytos=;
        b=nhnqQPqCsEQfk2zBKweGKXt6Cl32Y6PunHxs3U/u0Kf9PjG4qHM31zoobvLsSb2uMc
         WRa2n8gseylakBnGjXA77Dyh0glgkIYAMht7oJeSvjbIRosiJhwLPqpcXmXBi1lx2Jit
         +E8i0vJ+fFwhThGuGPt7OLVfm6J9BNfX2IwVa5AT3ykX+Nch77o3BcCYMYzQKf17yeMn
         4Ab6VrmAt5wiVwktJW+A0z7VbS0mDePAa5NnH+5bB6BCX7IZVV9zYqKLoEHfd7cBblCG
         icXCZ12el4wjMHmanyFBdxESZKKX0gCL4pzku2SfMAkmaQGujdUNRWYMw3pDev+IrG2Y
         vQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689812338; x=1690417138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2fKBNDS/BT8xGkvmwL61aPgUlEwLkJXN1Vosidytos=;
        b=kNAHddVG8BHvmjRilVF2nCqHlTTEIRwCKomc5f6JcqdqcEuDlr0px/9bQrSDF+A2ny
         HVJrlMvjSfpDuV0vIGH1/asL1uOqbM28IfEuIVHprY/p3SjlQVcL7iYIkXSzGB2CsZU+
         /rgKAFTS5/cy5mkpLp/6xXMcSwOPqF+esfDet7EjZ2T6vQmZEnrPsy0kzoImYrc+0HoO
         nH0JPYL2nqugrThu/zvo8ojLI4m4JJyRBqTXIhuzhVxu1nAPdLoUw/8gcOjaX8YoE+si
         n77Qw//E8HYwP7RmcbXceD84L5yx+WHRICiv20H0U4vOC67qlQ6uWOomBvsguYvoX+/w
         gAiA==
X-Gm-Message-State: ABy/qLasocOAei71+iKp0Yp1a8fzly0q8NdAe8O6i93E7Bn3FmKG4NcX
	fmCb+4B/bjNjA6cIyT1BcDjZPA==
X-Google-Smtp-Source: APBJJlFQmMOLjyeCBsSqHlhl4h+9nw3quYgNKgWBuSFdNrZsRcFIHQbIBl60W2H14/GlzRWfDZ1T0A==
X-Received: by 2002:a05:6a00:2295:b0:686:2539:9ff2 with SMTP id f21-20020a056a00229500b0068625399ff2mr7643647pfe.9.1689812338252;
        Wed, 19 Jul 2023 17:18:58 -0700 (PDT)
Received: from google.com ([2620:0:1000:2510:cdd4:99fa:ade4:1608])
        by smtp.gmail.com with ESMTPSA id fm15-20020a056a002f8f00b00666b6dc10desm3839975pfb.56.2023.07.19.17.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 17:18:57 -0700 (PDT)
Date: Wed, 19 Jul 2023 17:18:52 -0700
From: Sami Tolvanen <samitolvanen@google.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: palmer@dabbelt.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2] riscv: VMAP_STACK overflow detection thread-safe
Message-ID: <20230720001852.GA572618@google.com>
References: <20221124094845.1907443-1-debug@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221124094845.1907443-1-debug@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_171903_336501_DC13A8F2 
X-CRM114-Status: GOOD (  10.56  )
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

Hi Deepak,

On Thu, Nov 24, 2022 at 01:48:45AM -0800, Deepak Gupta wrote:
> commit 31da94c25aea ("riscv: add VMAP_STACK overflow detection") added
> support for CONFIG_VMAP_STACK. If overflow is detected, CPU switches to
> `shadow_stack` temporarily before switching finally to per-cpu
> `overflow_stack`.
> 
> If two CPUs/harts are racing and end up in over flowing kernel stack, one
> or both will end up corrupting each other state because `shadow_stack` is
> not per-cpu. This patch optimizes per-cpu overflow stack switch by
> directly picking per-cpu `overflow_stack` and gets rid of `shadow_stack`.

Are you planning on resending this patch? I see it didn't gain much
traction last time, but this looks like a much cleaner solution for
selecting the overflow stack than having a `shadow_stack` and calling
to C to compute the per-CPU offset. The asm_per_cpu macro also would
come in handy when implementing CONFIG_SHADOW_CALL_STACK, which we'd
like to have on RISC-V too.

Sami

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
