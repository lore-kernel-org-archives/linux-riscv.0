Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C296FC3ABC3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/qoL6UfLk45A+F46Cf3s/+G7nolFYIbpp1WXLyEMoQ=; b=nUTccEpyiDXoJ0
	Yn6B5RolRWEZ3j21SL3ZWNohxx/QrXAFYScb32sojOa2G+ck/EqHZictf/+usxkfW9+jHHA7xBLTz
	D8hdSahQtBnqWwjHxn4A8roSmgacrvw1jr9mZ+QycTNhmT/envoCIk4dtZCAP4sQgIUCW04Q12VqG
	ZV3yimL+SmQxWiNpQfBuNqOkmiDn6wJs9XcEdWW9xeCETsfh1ZrMkUmyQqqlLazBEfIa/o/SgrJzR
	c0g1O1/qnxZ02umjnXqhlrEyokP29PxWoxIVmzlxJxu6ISk/sEnZ2VhGT84n1330wCksK2WVn7UE/
	zg5kkrRgVHZ5qqa1b8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMr9-00000003amQ-00gi;
	Fri, 09 May 2025 12:29:35 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLvT-00000003RBI-38kc
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 11:30:00 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a1fb17bb8cso252522f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 04:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746790198; x=1747394998; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PS161WiIseqQMvNduUZogtk3N3mmBOCWz6m7XRDgGoE=;
        b=e/03okHfapOxFA25OL1YX/B1rxN9Yz2EELJQdYRI599sjczwJY96v56RGiY2Gf/iU8
         vUZGn0qDW9bYn1VGFDzwTsGGe+T8vWN5RR8FwokcOHXr2VRWrIZTVobUm4l97bYUqtrV
         5LH0q5YCHj2VY0t802WW0KY85xl0OiZqFrd87U0dMQ0zxOhBoTI/cTKos9RCwLIwypss
         h7Y0whwP6W7+U/nA0aXVxvI6hDUbMWP9oXzU6pnk9ZXHigZBO6Oo+v9lyofEtMJe6gFG
         H4o2gEsXjSOVC6fOhdSzlTkJgpXWT5lSRUsnAvxqgc6n1fr0JfVmG5uYYfRueKQskvU8
         GPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790198; x=1747394998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS161WiIseqQMvNduUZogtk3N3mmBOCWz6m7XRDgGoE=;
        b=h3HyOTvZNrDj8ISo9iL8LJ1UVy4mHgT8zX/bY2avKklA3Bc/nt/aQu+GKCuFqPXNpT
         PO2iHifpGp9c3I6c8LOO4kHos703Eth6Nag+4+dM3vbN/Jz7aDzkVQYKBjEU3GYiUnqb
         kSiMoKAS6l9WxbLKV+S9eNWhfZ0pcf7MVPTPruHScrmALE/pHfCv2SO0gwxZ6tq6qAXA
         UOV+bmUiJYmtYNT/CizlCzS2mcRz0LrvBOt2jiRCrUW3xGeXGtLRpBfyeBSQ2S7M2ER4
         GnSnL2OXqKSSd5E56SUgnNPV63KSzXbWtzChy9JtYJW9Np0R4dlYJGo7I7CP6AU+aIVU
         d0PA==
X-Forwarded-Encrypted: i=1; AJvYcCXAX93HjfDJWjKpqGeqYzGlfg5dnsHEAlwgDuIRZpm6r6ElM9IxaLICg1nrI2LL38ufj+fanEx8kzN2ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD5JU1C7K41OXwmUQ2kW9PnagudGtDbwc6pt75GnsZybJ1hizt
	JJNcv85ou6eS3N1nuu4r1Xhm9YO7BfDev8bHmI+NdT38XdFJGTK1W6+VG9s2TYI=
X-Gm-Gg: ASbGncvIQUA5S4JfYPq+H7RRxcGZSszPER3j04h1QOOsHnjs5FP6mY6VhuTkp8ndwky
	x4ryZPhiKnlLC8Nf7dKFaPTyA970A8sRiAtgJ/lggSQpfwUWyPWgO2TtxLCLFiIZUIfTCeRVqB9
	G4PsfmHojj2KUqda0H3v++/70Vf40t+Zi1x8PGuyaSD4xTgv0sgyx76R+3EI38MDcO8DGqB0h9l
	0aHmE5iJt1R4iDrVFIbiTVIrcuDfaUbkRFlwDO4L/v5b24xlnn/nMdxrjjsxCAQ+vP3VQ0f/ix4
	y1tHcYEBT5+x6O6jMReQkurbzF0R
X-Google-Smtp-Source: AGHT+IFyD+sjIl6oyk+GUqpe3q06X8ef9h4zpi/ejp13lhZHBDbgLcyRC1n+m1ZiSGeYARfIOQsk7g==
X-Received: by 2002:adf:e78b:0:b0:3a1:f70c:19bc with SMTP id ffacd0b85a97d-3a1f70c19d8mr1667927f8f.48.1746790197611;
        Fri, 09 May 2025 04:29:57 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::ce80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d2c8sm2977553f8f.61.2025.05.09.04.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:29:57 -0700 (PDT)
Date: Fri, 9 May 2025 13:29:56 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
Message-ID: <20250509-1b7cbe3ce1c23a20c571d3c6@orel>
References: <20250508125202.108613-1-alexghiti@rivosinc.com>
 <20250508125202.108613-3-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250508125202.108613-3-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_042959_793026_6D0F092C 
X-CRM114-Status: GOOD (  11.01  )
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

On Thu, May 08, 2025 at 02:52:01PM +0200, Alexandre Ghiti wrote:
> RV_X() macro is defined in two different ways which is error prone.
> 
> So harmonize its first definition and add another macro RV_X_mask() for
> the second one.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/insn.h        | 39 ++++++++++++++--------------
>  arch/riscv/kernel/elf_kexec.c        |  2 +-
>  arch/riscv/kernel/traps_misaligned.c |  2 +-
>  arch/riscv/kvm/vcpu_insn.c           |  2 +-
>  4 files changed, 23 insertions(+), 22 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
