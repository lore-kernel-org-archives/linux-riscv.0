Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E4AE7F154
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 21:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNVBUPrnWWpASp0iN6psHhPIbC1j62J7/0NyD2KXro8=; b=3kYmaz3E31D+N+
	5JTTZ2BwN9lj0bFFILyz2NATkhn54uXUi91F0gWMi0mxVK0VNNbwKipaIcnnBs1owoWKYp8UqNMGL
	S6HRDK3ds1HbIZFMqjcoX89AybtzVJhunFbcazhRb2HLvXlRm5ld1a8bpiIT/UtfAaCERBvpsmP3S
	mqkpvNUhhzKkk8gPwGfebFaiocB3N5xoi8bhNkCPa85XjOmxFsn2WFviGdBBj9iqu+Vzrm9Y9Egxo
	RVCNHo3Fujy0Lp0V2twLb6shscTJ/Cy3hYPackDTPD8RkexfDOBF+0sgTYPj1wbJeajpS/InGDl9D
	LNN15v5mlDAe4EB5NJTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmLR7-008cfR-1S;
	Fri, 29 Sep 2023 21:54:13 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmLR5-008cef-04
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 21:54:12 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-279067b9823so3349555a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696024448; x=1696629248; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHH0ku3cnEfuovvq4TN+nU7rjq4fes2yQy9ZicPmfy0=;
        b=PrfyLfKJyKnt3hsKy9CuGLppxhKT+3fhXUjxoCO43n5Zjdkrg5i0lz+gZZ9nb7iu0l
         EMafL1qj8VDtS6HToxsoiIjjjcZwyui1/NNARSYzWPOgYjzkT9/MVzU6804HuF84HaOp
         0wj6UIKpEzbZKx4mgMCfGIby4XcjYivX2iO58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696024448; x=1696629248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHH0ku3cnEfuovvq4TN+nU7rjq4fes2yQy9ZicPmfy0=;
        b=j74N4EgjCvhVGt17F1aJRj0iDktajL8iNMnVASeVUerp9G6ufFxTFtn0OWG0EAteyw
         HoObDCkObbutrfxpkhYGxPdMA3vmhSpOfruzKeZO7fZSSczEcZ183cec6EntJZCx/nea
         0XQfnTv1jD/FgxHl85Tq/Lmzwvb09aHrGsl/ltHOkIoovkZgqWN1kye4sujOS2+6BIt0
         wPQ2yGhMeHrdeAohOeBdVfw8KasKVFkqnkIR+FzMYXeOgyqD+/eBWV52gXtdDegjaUFz
         HlX0YmFqsIUgGE0zX9f0WI8NkQzUvi4LTKw6Ea31q+YcaVff6cCFpyyQCdakuLGz3QGp
         kGSw==
X-Gm-Message-State: AOJu0YzKGHDOSrMagYxvv84BS72A9Zmbkh+ZQAXvFBOYlKz1RnU66223
	s45NDkMvXglHUnKE3A7x6Jj0zw==
X-Google-Smtp-Source: AGHT+IHoF/OLpRNDzLcj85xtbvZ3DJsBh49hVBXu73MEqXR3MZRoTXPQbKi7O4iIRyczmIbUISS/lw==
X-Received: by 2002:a17:90b:8c6:b0:26d:2bac:a0bb with SMTP id ds6-20020a17090b08c600b0026d2baca0bbmr5064809pjb.6.1696024447861;
        Fri, 29 Sep 2023 14:54:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 11-20020a17090a004b00b00273fc850342sm2114438pjb.20.2023.09.29.14.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 14:54:07 -0700 (PDT)
Date: Fri, 29 Sep 2023 14:54:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
Message-ID: <202309291452.66ED9B4D83@keescook>
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230929211155.3910949-6-samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_145411_056162_94E3F241 
X-CRM114-Status: GOOD (  10.68  )
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

On Fri, Sep 29, 2023 at 09:11:58PM +0000, Sami Tolvanen wrote:
> ARCH_MMAP_RND_BITS_MAX is based on Sv39, which leaves a few
> potential bits of mmap randomness on the table if we end up enabling
> 4/5-level paging. Update mmap_rnd_bits_max to take the final address
> space size into account. This increases mmap_rnd_bits_max from 24 to
> 33 with Sv48/57.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

I like this. Is RISCV the only arch where the paging level can be chosen
at boot time?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
