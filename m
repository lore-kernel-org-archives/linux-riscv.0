Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49031CD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAGEO6h+Z5/gwc1s8W1XdYYCwNzpCYq54hgZJuxtyFY=; b=4D3PHBJcOruw/g
	L/LRuUjjZLufR9Ug+6fUYp27t50PHw0cinK/gyTEkmJmqe6Ie30TvuhfCxlotm3ilLJJ+Bd6plR3a
	UzJgDxZXz1kxfydZSTbWPezusTEGO+9jcwF/sE2lvnQ7TDCKzJHtyQov3FF/h3fqIeuYkhI1aqRKE
	gY/5PABdm1j0uD2svzV7wQ+2uWz/ltPYP7rBrylbSUeAAc/bM94dRHqPrNM9cuVg1UfVAUyHNk6nq
	j3bVl1ZI8Kxa1AQzDkt6wbn2Dm8SYSOYEG6TI3WgVXlWUV/tiQpKnd8mcwRhARtc6gh+fJwDqANJY
	6ng9exLD2KUMfPjDahOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8D6-00Eb9V-03;
	Mon, 18 Sep 2023 06:58:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi8Cp-00EazV-0F
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 06:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695020281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h2mcwAczqQrH8FC4T+/52u6VelTTkFaOGAGOTHdcUPg=;
	b=Pgj2Y72I4d9yHPKQd9L+va3BKKtO4Ftlfpq3FFCngbDZi7sYbGNmp0RTxokjk/WUL2Kc6f
	DA2k4DO4ywrTRe5991aCmJLYIZt1Gbiy25PnvDEguA/meKW8p0QvVdaJc2tY/9gWMHUArM
	PtS9tn1AqYCDQIPlGIadAKfO6Abcae4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-BHMwz38nPIuoTDRgDCFi9Q-1; Mon, 18 Sep 2023 02:56:13 -0400
X-MC-Unique: BHMwz38nPIuoTDRgDCFi9Q-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3172a94b274so2811243f8f.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Sep 2023 23:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695020172; x=1695624972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2mcwAczqQrH8FC4T+/52u6VelTTkFaOGAGOTHdcUPg=;
        b=En2TWnk8BAFuzk5Lw3ddrxW9kANUMnnsoHeybOHkq5VYci0ydSyPTlIW+0oSzlUFw/
         JmPPORS4PwErNNeHOk1i+yPnuKFPWvfYO6gwozL9FzKQtEyQcjtWB1J64MtchVTGlwT0
         dP1JS7eyvJkGlH/w5u86M1sYZLhIQJD8DXF2+5dqtK2KKWZs8orcuSstDUMiJAFTeXWm
         YPah0FrgZ3XbYzlh4rGvPW30+x7o26c4Frr7SDFvdM6SlugHoSBgEafmE02U39tzln9M
         YonFh5y/isktqOe2Gt+7Q31igMeMPsBVWI6Gqo8SiqlKKDdCrKAbWU05NA1dRRXCjMS9
         itRQ==
X-Gm-Message-State: AOJu0YyvUZPSH3fz/P1jPmOsS62iZjEfnGMy5qQqPJ3QtknnamDCfCIe
	9lg4UJCa9EMels0cdrSBnqH2H7Y9UTZDEogKJTNAeuXiq0KPTRXlFf7xyaosqtg0hR5Vh774tvr
	fWeAaEg5umb/MFyfoamG86cNWrFAw
X-Received: by 2002:a5d:4c4a:0:b0:31f:8999:c409 with SMTP id n10-20020a5d4c4a000000b0031f8999c409mr6947629wrt.66.1695020172215;
        Sun, 17 Sep 2023 23:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6F/Z9q4tB58E26+mCTcb2TpjD2EEslfwOYb0HqPPBuG0zLaR6K3OsqOUHedxMDM3AqkpDEA==
X-Received: by 2002:a5d:4c4a:0:b0:31f:8999:c409 with SMTP id n10-20020a5d4c4a000000b0031f8999c409mr6947581wrt.66.1695020171900;
        Sun, 17 Sep 2023 23:56:11 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id t3-20020a05600001c300b003143b14848dsm11523936wrx.102.2023.09.17.23.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 23:56:11 -0700 (PDT)
Message-ID: <a6a77718-219f-30f6-b8de-acd7aadf3b0c@redhat.com>
Date: Mon, 18 Sep 2023 08:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 18/26] KVM: s390: Stop adding virt/kvm to the arch include
 path
To: Sean Christopherson <seanjc@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Andy Lutomirski <luto@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Anish Ghulati <aghulati@google.com>,
 Venkatesh Srinivas <venkateshs@chromium.org>,
 Andrew Thornton <andrewth@google.com>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-19-seanjc@google.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230916003118.2540661-19-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_235803_202307_64666E70 
X-CRM114-Status: GOOD (  17.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 16/09/2023 02.31, Sean Christopherson wrote:
> Don't add virt/kvm to KVM s390's include path, the headers in virt/kvm are
> intended to be used only by other code in virt/kvm, i.e. are "private" to
> the core KVM code.  It's not clear that s390 *ever* included a header from
> virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a x86's
> Makefile when s390 support was first added.
> 
> The only headers in virt/kvm at the time were the x86 specific ioapic.h,
> and iodev.h, neither of which shows up as an #include in the diff for the
> commit range 37817f2982d0f..e976a2b997fc4.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/s390/kvm/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
> index 02217fb4ae10..f17249ab2a72 100644
> --- a/arch/s390/kvm/Makefile
> +++ b/arch/s390/kvm/Makefile
> @@ -5,7 +5,7 @@
>   
>   include $(srctree)/virt/kvm/Makefile.kvm
>   
> -ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
> +ccflags-y := -Iarch/s390/kvm
>   
>   kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
>   kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o

Reviewed-by: Thomas Huth <thuth@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
