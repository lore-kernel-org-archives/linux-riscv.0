Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8E2C4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 15:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gc1uxrQCiWeypdD4AT43u7UobvKvsNMokBdWOCa6m1Y=; b=u4KB5oGmFJM/es
	gEcwPlc+VOLAkv+7fAKJ50asHvXOc/+rHd6U3gmJkcEiDOLoeMj9ECWTUfWuK+c4ZYvcc49jjD2cq
	4g82EvzsmATdU13Dx+Tpjuf3Wstdd2YBOFrI4vhywAgDGgwRuR10jji1gluvsTUexoyGb6W93+Z2v
	nfm+Tm5v9VOmb9F0N68hkaJUoOaf2Q3aKakvHirxeENkkzrMXOjwZRSUaYOftMEjR6QRnPn6dbNNJ
	FcdSy0RUNfY8q0gRCC3WkDYZPg1BWHlKUq0m9kXj+QCnynXMk8zm1R5QotLZr3CIMjtThmlEXHn5K
	X/Unyb1OnB1eFAKqYMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVYbh-00000008MRm-2EOb;
	Thu, 01 Feb 2024 15:04:01 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVYbd-00000008MRD-2uNW;
	Thu, 01 Feb 2024 15:03:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40e80046264so9256555e9.0;
        Thu, 01 Feb 2024 07:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706799834; x=1707404634; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQI82xkebwfzT3j+NbzdVCePUJoKXQTTgiIMRHd9tA0=;
        b=Tm/A0N2XpuLIlzEEooWciuDOgDOxEROW7vOAkytefRjVtPsvsXHt/y95txpZmTMPB2
         7yOJI4JAEgyRHggjk7KH6M/n7PV4oLaGSkxbwrHEdHSm/4EDZzqUWsQ5rQd74+93yLYe
         D6MVq+Ol3ZWrwmmdK5iUrBkrNmKtFMkkdb4hey6rTLdyMAHdO3xWo7JALmmBNVf5ncEQ
         8UmuKWLC2u/Xnw/QeRERgY2fDVIIl7nU3VSJMUM48xvhwQ9pBLpdWyCU21X9WmE3AP+G
         lb0tfV4/FGLCg+nkKi5Pjjytdre28w6KlNhHQzDj/al7eIUPZN/Zxlf+lF90OKuykiD8
         eGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706799834; x=1707404634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQI82xkebwfzT3j+NbzdVCePUJoKXQTTgiIMRHd9tA0=;
        b=j+hR2QufpJ4OEM5lemBwTBjxUA7xpwKs1mDXjJ98QdKSyRsVtSGtPZBlCPa9A74dWV
         Y0+8L2w360Al7KPorXc1RwJ5IVrVdRr9iEvZI4sngPcLnctFKLR5ktsBKApsA27pC62d
         ykqDMYDSkTFB3w9gnH0DXuZAftE3nbH5WhUSNIUzlHt+nAAqFpOwuWdH8E8wZ2CWwvHk
         7UGJsddavuDTlY8XUzJ3fMgoTgo1j6lnai6UrCh6Aa3nKmSvGep8PHIf6/bIiglauDUH
         IX99bkLUhy55l/ON8qFa4lM5d6ZsLQx3YHbpvl7tkiSiTutDEXl5ruCx+e6PTwLe/KHJ
         FH3Q==
X-Gm-Message-State: AOJu0Yx67KXkpwh4HG9RJEnKBByTinBN/Dtv5LdD4RBZkSHmmuqWH2KF
	TheypVVMKcHw2JZS7d606SplOLAlzJHGAg6BiAMxbNqizQ6BcZh/
X-Google-Smtp-Source: AGHT+IHgq8VDz2gMVFec1rt9xa8alnLqg6m1IYYBrYWka6TlPpdIpPCK3IdQ6EOAmX4jWd4gg88q+A==
X-Received: by 2002:a05:600c:1c9b:b0:40e:f702:a304 with SMTP id k27-20020a05600c1c9b00b0040ef702a304mr3558063wms.32.1706799833416;
        Thu, 01 Feb 2024 07:03:53 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUDpgq0/uHUFP6DOMM/DOOgv6iaPTfvvlORJEtejjXG7NB3wNC7NPVgdP/a80SSBXcJjbaEEIyh+mqStaWE9ShiuHnhGiu0Ude3P4CSFQ3d+CGq9+DAjgcm1aQxefjN0mJjaRHu+d+pEnI81EDPulpbkTCKWAzVI1NQ2CjyFnruwvjT3XSCNT2xi8Rz/Pm9l+yrTYDvmZzT8WwkDZ4TJRCZL7qKJ7JE0w208ZTXS3EdwtHkyMVxRJFjaC6vmbIEV3KJHxW+9E8y6RugEGGGc+RAgrRS2/mcChzL72DvHvv09MdkNJ3SyGTtS/aWraB/umbXkoKBO3eu0iaPDyYl45cI7AIDf4cvnmpMVE36WXwBNDuS5C+dFi6826+JbRT5aVrMB/812NuBe36eW2blfMeKt3OBcyvpvyCF+9r1L742OlcdPyGlBCXjfCg1ZVYrnPqeTySi49U/aQRdxiXSjmMzo/VA+l2tLlv2iNnZdz/5YM0P8SL4ZrgKVPAT0fLShXJOKH7m6PpeKfu+0fpLDF8QTj1FESwPMhuWww/x2V1Ed9CIW4dUvtVF5d9pzMZaqIdpMFOCe6tTae1G15CtxUebt68+gSBiml4shJT3SMHsg1px/hmq3Vr8DBHs63fugiLnN0pAWPPBo3jKqA==
Received: from andrea ([31.189.34.185])
        by smtp.gmail.com with ESMTPSA id bk7-20020a0560001d8700b0033addbf2d2csm16043387wrb.9.2024.02.01.07.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 07:03:52 -0800 (PST)
Date: Thu, 1 Feb 2024 16:03:48 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>, Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH RFC/RFT v2 4/4] riscv: Stop emitting preventive
 sfence.vma for new userspace mappings with Svvptc
Message-ID: <Zbuy1E7mz9Oui1Dl@andrea>
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240131155929.169961-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_070357_753375_B11CACA4 
X-CRM114-Status: GOOD (  11.54  )
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

On Wed, Jan 31, 2024 at 04:59:29PM +0100, Alexandre Ghiti wrote:
> The preventive sfence.vma were emitted because new mappings must be made
> visible to the page table walker but Svvptc guarantees that xRET act as
> a fence, so no need to sfence.vma for the uarchs that implement this
> extension.

AFAIU, your first submission shows that you don't need that xRET property.
Similarly for other archs.  What was rationale behind this Svvptc change?


> This allows to drastically reduce the number of sfence.vma emitted:
> 
> * Ubuntu boot to login:
> Before: ~630k sfence.vma
> After:  ~200k sfence.vma
> 
> * ltp - mmapstress01
> Before: ~45k
> After:  ~6.3k
> 
> * lmbench - lat_pagefault
> Before: ~665k
> After:   832 (!)
> 
> * lmbench - lat_mmap
> Before: ~546k
> After:   718 (!)

This Svvptc seems to move/add the "burden" of the synchronization to xRET:
Perhaps integrate the above counts w/ the perf gains in the cover letter?

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
