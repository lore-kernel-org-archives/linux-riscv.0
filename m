Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E182DC07E97
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Dec 2023 14:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTnVUzhCqFgZwP+SF0hq4hOKCE8Qp/QZ2+lxl4AIXec=; b=NddKtps3+nMoEy
	Hutvc75DNb1+GN49ZAu9Sjq3pxjfjlyEb9B4Ks5DssVSjajYpKjz/y7icUL0GrKPWW0l1t5lBd/8y
	URElzBr043IyKidLJhCfD+2adNCvWeBs/mttgMR0XSoL0Yj62VvA1xXlkiEOGNF8xbBLi3bs0gi4i
	d7t1GxUbnPShroO8K4TS08OFfcSaHlBBB0RDZ86kKJQHDcTiEMQ2u3G/8T5G8m7tBQOmHqtMZ/cvo
	s9XleSq1ZF57DyYguFoq1LAlLKvdTmwluYvcn3Kmt1yAD1cciBzNTq0d56qf8f0ZwKJYt16I1qmzX
	t5SIfCzWdmxiRMzSW+1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9n8d-00058i-1g;
	Sun, 03 Dec 2023 14:08:03 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9n8a-00054a-04
	for linux-riscv@lists.infradead.org;
	Sun, 03 Dec 2023 14:08:01 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-67ab5e015aaso6751046d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 03 Dec 2023 06:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1701612478; x=1702217278; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CiMNgzFr7xNUwBtnhCHdgoiuX87pimcKNL7aMsL6fgY=;
        b=FioGhmIALrw0fMrU5vHb5dmMUwRZpHgmOJMI6bOYno6heCZmyWpCWMV+hEjCUt0ddd
         j28OYcwm5mrpwPLWnE4s7bFMJoRTf2zcuFikJDeiQAebx0UvY+SqeSwT14VdKaePFmlQ
         XhrROnEUowWICLPjKdKy4XaD6NUcaLse1++Gn3kACxg1ZrkW5BYxT6WVo5cj1MUBU+tY
         Tg19RGDeuDvT0KgPv3X1KDkcMiCno0pmL6xRKaDXtzbIoG97b+DMELBoc441hs+nBY7b
         HdL/EIpYV9HLpogIlTxuqCkWcEibKEallURvabcVCtMEIxD1ZXIFql9eGirPYsomWarK
         2UIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701612478; x=1702217278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CiMNgzFr7xNUwBtnhCHdgoiuX87pimcKNL7aMsL6fgY=;
        b=NMT8uGO3kdqYv7C3rHKuAPIhwBs58IsZdNJuvRO6zzY8R/6TtD3p3kd5QovQskUJka
         Y1iAUI309ISTyTbGhbWbq2ntWW+bzatF8V2vJEyrkPAbLHOec5kvG1lbMEbq/EJeo8xD
         RSDW9dEWgPoYAaJ7Rgq2Am4iKTQDvPLOSKy9rnEHMCvs0P1TbAkisvYRVK7n21tauyqw
         DGlXYbc7gk+Mxo1LoQJtXj5Z4VW8tzklozgVcZzYMJWXUflTR7hcqd7NlnYDy2W8OscA
         HmdJsTpxHJZ4aGquvKiAVNTnguSejBoXhjlZwWF1vzlKFyDc1qfvimBiX24Xf6RCG2TG
         WTwA==
X-Gm-Message-State: AOJu0YxlkZrNFQeut6AbCGJNObLBXp/lzP/A3cEcqtqcPQq1TUKK1+HE
	GhLEygm//+WigfqptjvtcRe52A==
X-Google-Smtp-Source: AGHT+IHLblrSR9v9mU82kXzYVsIygmNXeBVbxztP2WE72q1qjIUsHC92qYjoWB74bCqvYp2tHSpE/Q==
X-Received: by 2002:a05:622a:7148:b0:423:e4f1:4958 with SMTP id jc8-20020a05622a714800b00423e4f14958mr3926493qtb.56.1701612477906;
        Sun, 03 Dec 2023 06:07:57 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-134-23-187.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.134.23.187])
        by smtp.gmail.com with ESMTPSA id z9-20020ac87109000000b00419c40a0d70sm3402958qto.54.2023.12.03.06.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 06:07:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1r9n8W-009HdE-5C;
	Sun, 03 Dec 2023 10:07:56 -0400
Date: Sun, 3 Dec 2023 10:07:56 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Sean Christopherson <seanjc@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tony Krowiak <akrowiak@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Jason Herne <jjherne@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, kvm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Anish Ghulati <aghulati@google.com>,
	Venkatesh Srinivas <venkateshs@chromium.org>,
	Andrew Thornton <andrewth@google.com>
Subject: Re: [PATCH 05/26] vfio: KVM: Pass get/put helpers from KVM to VFIO,
 don't do circular lookup
Message-ID: <20231203140756.GI1489931@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-6-seanjc@google.com>
 <20230918152110.GI13795@ziepe.ca>
 <ZQhxpesyXeG+qbS6@google.com>
 <20230918160258.GL13795@ziepe.ca>
 <ZWp_q1w01NCZi8KX@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZWp_q1w01NCZi8KX@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_060800_178906_9768FE43 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

On Fri, Dec 01, 2023 at 04:51:55PM -0800, Sean Christopherson wrote:

> There's one more wrinkle: this patch is buggy in that it doesn't ensure the liveliness
> of KVM-the-module, i.e. nothing prevents userspace from unloading kvm.ko while VFIO
> still holds a reference to a kvm structure, and so invoking ->put_kvm() could jump
> into freed code.  To fix that, KVM would also need to pass along a module pointer :-(

Maybe we should be refcounting the struct file not the struct kvm?

Then we don't need special helpers and it keeps the module alive correctly.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
