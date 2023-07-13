Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39DBEB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 10:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDwH6Da01EmVdHipxEVQBcWfr0BTxkPEG/MhS3v1l5A=; b=VK+zgbNXvGl+Us
	Gj/x9AJM683huj5xFZOHUV4pMTS1zICzDFZ8a+WlOYb+6ZV8ncB3OnPvVzZoLoTa3CVeUVTjtc+wU
	KRL69qJmiUdXgSYpDo9n8QKpN98DeYnLyeI+TlL0VNk27+OYmGHgrHAVWcC5xFEHAm2vXYXY6sQlV
	gpKOzUlZFhRKNLMA3mihzuN5xgV0pzyEXJrHPW9N2+lNAPcYGAuWPudKKqWq6WmyR+MIdUQX+KhtP
	7BAC2pUqgIMq67LQK0v2D91tRuTW6ll+MAtY++Z5/nEsDbW0YguC1G97+DFqd9wKP0kpQFA/SkkO1
	e6JZuxcjcJOMJ/f6nM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJu0Z-0030Yy-00;
	Thu, 13 Jul 2023 10:57:15 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJu0W-0030Xl-1w
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 10:57:13 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99384a80af7so82086866b.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 03:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689245829; x=1691837829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9NtgBLjv1J96zLCU/pO/Q7azYyogqr/cagIRcD64aI=;
        b=gj7kW8GV0O+RnxEUvB7Rzg92T+cWgaDBZOj/LehCMJmClgK/jAbkEyOOD74xx2BxB0
         aU2wUxt3DFCdM9tzd5JjcJUPXSoZDtRPlYrKTsP3IcYQLSMBinBJV8suJ+v37y+DASZE
         VReqO0d0RaoyVVG+/RKukaeB4OzssFWjZKq1q5ZgSBTuwlof83ML2aYwvWOWYazMbx0R
         HotbzEFISAwilTgLj8Ap8pLnJta6CiLKzIKo9BRtfOM6Lk/dgcJa8rc/G0ojulEbvmyA
         52usDTRQRfBRN9kkhvEVcjDK5u34uly8pnzMqz9C1JPnVLCvaFBdbzyVy2odpJySNsrP
         ii2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689245829; x=1691837829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9NtgBLjv1J96zLCU/pO/Q7azYyogqr/cagIRcD64aI=;
        b=RUcSVJNs+b7kjTV1lkzuC1Ot+Acqnki/gpYQ6J3lyaAJipgpB6Y8JOVtgBDhsVr/ks
         uFYy9dEDf+mU0oRJTJNMq+l2IXEHm2OAmjUCwn0L1K7kEwoS9S8hvqKql/cc+2R/b7Jz
         5clfm6pGC7PES9AaMcINDdN9EF/ORqULfBTgP0p4ofqbA/oPYrMReuekrEDXPjRODehL
         5tPG2Esl58ZsyrqUFD7JY3Y7swPlVR2kuiSAVBrATin3UNzAS/fsaclKCgxMo+eINhvj
         HADftc9cRmDV2w/zbl28UOFE76DtZstvfYb9/uypnI5Cv4a1ZBzBCCmCHcUOKqEeZl+N
         FhOw==
X-Gm-Message-State: ABy/qLasXvJfIqAcB1BHLRVVH34yQ3QScv0HmF9CAdpw+PoeEYxrf93v
	awedN9/oDZ9Aa9xHFNMbMtIdyw==
X-Google-Smtp-Source: APBJJlFU4O4KO6QzME5VoehHAND0oIP1yprw6Nl8SlJa+4axe1vxNp8uN0pFbJlOPz1ClqZEcY+osQ==
X-Received: by 2002:a17:906:30d3:b0:982:82aa:86b1 with SMTP id b19-20020a17090630d300b0098282aa86b1mr920230ejb.43.1689245829265;
        Thu, 13 Jul 2023 03:57:09 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ay9-20020a170906d28900b00992bea2e9d2sm3835016ejb.62.2023.07.13.03.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 03:57:08 -0700 (PDT)
Date: Thu, 13 Jul 2023 12:57:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Heiko Stuebner <heiko@sntech.de>, 
	Samuel Ortiz <sameo@rivosinc.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] RISC-V: KVM: Factor-out ONE_REG related code to its
 own source file
Message-ID: <20230713-40f6804b248987add29f83aa@orel>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230712161047.1764756-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_035712_658605_BF645CDB 
X-CRM114-Status: GOOD (  10.98  )
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

On Wed, Jul 12, 2023 at 09:40:41PM +0530, Anup Patel wrote:
> The VCPU ONE_REG interface has grown over time and it will continue
> to grow with new ISA extensions and other features. Let us move all
> ONE_REG related code to its own source file so that vcpu.c only
> focuses only on high-level VCPU functions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |   6 +
>  arch/riscv/kvm/Makefile           |   1 +
>  arch/riscv/kvm/vcpu.c             | 529 +----------------------------
>  arch/riscv/kvm/vcpu_onereg.c      | 547 ++++++++++++++++++++++++++++++
>  4 files changed, 555 insertions(+), 528 deletions(-)
>  create mode 100644 arch/riscv/kvm/vcpu_onereg.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
