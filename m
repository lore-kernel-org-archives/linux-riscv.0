Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D78CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PENnpqrUSuQGKK/74JWpFGlp5VHgO6Y0OXGN+FWRzg=; b=kjM2wAUTpAM6PZ
	NQaqXmDtrCpjqPApauY1yrap8ic8n6P6dKUyWDrUqa8fR5QDB5ZhE5pFrK/LAq0dHRLTWNunBd9JF
	z3P5xCf6F8NZC8Dv0X/CwP2XMiBoDIxr8FMyPK1CAy0BZ6uNBcSCFBmO1pjxgObqt5nhEGv3qQ1zH
	r1IjNMk8dBOQYlTQY9Jy/ahHZVaVdEk4E32DAqItebgItf48tyUMpzKrQMhTLftuZOtLQMj2ZL48/
	+ZMQs2c99nyRxbLNabzT3ATMfVG8YiwfE001zigMXSQfTjjrS4laSQIVUmh/FbM4QQ2znAY0tYv1O
	HukEPPl2vGNQdTWw5vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiG0o-00FjnI-3D;
	Mon, 18 Sep 2023 15:18:11 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiG0m-00FjkL-0y
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 15:18:09 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-412091b9035so31055861cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695050286; x=1695655086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skILK3+RqLs29/E8NIb2upQKKLhMeBuYLpBX+o8j0o8=;
        b=n6jL8wh9yZ+YgRCLkcZ7AcXMqtF/+gWvKXPg79MBnBzPl+oy3YGjGVxJHE0oTf+grK
         4eBpJn2CkNmuZLQ6JXhw8gi92dSULrCQ68cbue+gfH+gI3TMpgvflAe41qWA/H9yl5y0
         F2Tk3h5NyUF0vt7XtXH1LTU0D7CgV7suKA1JRT0DuAsvJ6fPGd7yorKBW3ptnFHR4qzB
         jsZT9Id1Wp2BRJBHPTFDuG/lxCbfoGl3a+x5R2K82rt6xJCAY5ivDf2AZKoD5bN4Gx2N
         mXINTA8WpsFcfrKuOoZ+9Vp7cu+6pKubcCsD+0lb3X0mfbUdaZwjU9LS50fLmW0+Ml/6
         WqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050286; x=1695655086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skILK3+RqLs29/E8NIb2upQKKLhMeBuYLpBX+o8j0o8=;
        b=p4aNX5u9w8hbwarfdCY++oxMb4jjkrvcRo+WgGVdCTKYne0fj8HDDZYViZAqTOds0j
         hUTUkId0tiAwbUfU92NAmBksIxr0uZUbsxtepfIfcCUFiniJMrLS3HrvdlyaCcR8VBLe
         Wf1450roIMxRaOIcyFkPsWyPc22WPWJJso0g9lxUw74oVKi1MkfrN8Y/HiJa9iefVoC+
         sA12L7x11NRpNYQ8pkk3ESFxMNX4bBEAlUy175/l56C/57hrjAtumhpH1V+RofIkDzTN
         /67exD5kZJ+ol9rSBAbk9sadCDQ0Wb1N139o3rfM28PPdcz3w3M1mOiZFVcLfVu/HCRF
         r4sQ==
X-Gm-Message-State: AOJu0YwwlLoxZviKWpJS4L+/LpiclYfvxxKRBYnz2txpzJxUxlHdF5Wl
	RfyRYMzZEABH6jvuFHrzgplGFQ==
X-Google-Smtp-Source: AGHT+IEPjZK20Aqh4DOH80nyWTVB2XY8RoIapnvcyiksM3wp5qxi6JV9wSTNi2A0D4DmrBL930vlSw==
X-Received: by 2002:ad4:458d:0:b0:63f:9aa3:867b with SMTP id x13-20020ad4458d000000b0063f9aa3867bmr9395365qvu.40.1695050286275;
        Mon, 18 Sep 2023 08:18:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id r28-20020a0cb29c000000b0063d038df3f3sm3532215qve.52.2023.09.18.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 08:18:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qiG0i-0005OR-Iy;
	Mon, 18 Sep 2023 12:18:04 -0300
Date: Mon, 18 Sep 2023 12:18:04 -0300
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
Subject: Re: [PATCH 03/26] virt: Declare and define vfio_file_set_kvm() iff
 CONFIG_KVM is enabled
Message-ID: <20230918151804.GH13795@ziepe.ca>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-4-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916003118.2540661-4-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_081808_337756_1E003998 
X-CRM114-Status: GOOD (  13.69  )
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

On Fri, Sep 15, 2023 at 05:30:55PM -0700, Sean Christopherson wrote:
> Hide vfio_file_set_kvm() and its unique helpers if KVM is not enabled,
> nothing else in the kernel (or out of the kernel) should be using a
> KVM specific helper.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  drivers/vfio/vfio_main.c | 2 +-
>  include/linux/vfio.h     | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)

Patch subject should be vfio not virt

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> @@ -1388,6 +1387,7 @@ void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
>  		vfio_device_file_set_kvm(file, kvm);
>  }
>  EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
> +#endif

We could even put this in a symbol namespace..

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
