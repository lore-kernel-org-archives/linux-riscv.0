Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F81BC67861
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Apr 2024 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nE2GY1nvqnzPDvnIf3f/je5evZLxQIRyLpr4Bbb+zRk=; b=CEp5rzhXVkK99j
	pPV7DQLsUYafta+ocPGGVeUCytO8u5saFCuuazGdCIykQbYKae3NfK7XPciAiKkXzCh79kLlQOv4U
	KidOxsYTVuStIRh5MlzpKbsRrYO1tVQ7KWlY82v3zh0TQIWf27n7l93ssxVoLoXzWhX3YQAwV/4Zg
	GffMFjbffvq0IDkxiWJ3aWqEIB0fTiyeBySMxG3vcsl/fhDdfFeQ2BGK2Urj8iSa1uGPvZ8HP9tds
	aYQgBIn9k7GE5Llg9wQrO8FIGaK/ch+i/1qs67s62mM93j45uI8rRC3P2or05/eiTYLWOwhKtjNT5
	iGdHw5M3RCTM7R8BZEEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiJl-00000006oai-0Sni;
	Fri, 05 Apr 2024 12:05:13 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsiJh-00000006oY8-0ijs
	for linux-riscv@lists.infradead.org;
	Fri, 05 Apr 2024 12:05:11 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a51ae869113so10919166b.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712318706; x=1712923506; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANigKjFKB20C56QgtDtNKw9YzFML+UBbBswsTMHl8ws=;
        b=biEny4E4M3qa1sOpNUtmM/Nmhbng+McYtrroO4KpqsSbdsSiYcqWohiNMbYl3WT9HU
         vD7GnEACqMRBJp4vGoSL8se75NDBEQIUjLGQmTYWFO68nFk1bvJ39Sigk6YFt0QzRsDI
         L30JkwJt7NxAtT+tQnfs/fmmO+JfrIAdDobHhHjOSBWKawc90Ky4rFcJ4NR+O+Pde1Hw
         gCMoihAQqNvmGaV/mmqaE5LhiLEQCfSDzD7vX6EeIxPKli7YgEG4ZWF0iOchEPiEg4kZ
         r91jsP/pWG43alS0t0NqmdHvMzOhF8Vv/zT6RIXOSQVS1tIzlaXMPigc/ZO+utCte5Ju
         8ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712318706; x=1712923506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANigKjFKB20C56QgtDtNKw9YzFML+UBbBswsTMHl8ws=;
        b=lJ4725J/qUg9SPian4aiA4l8eYt4RdcxrN/2Jes1mOT4HQ8oKEh1n5n5eJryURJnbs
         BRaA9g7pU4SyEXkrPQevEFD8vvbwMQAjrvYAclXBNiamTyCbFIYPJczWqCRXg118gmGT
         pFasVDbxLrCMXbmubUU3gw6t9KgXHqcDqiOz1/b96KHCj0MCj69ZGwsXHOl1xv5+bmUg
         u/nSZ7O8eG2aHX6Nwx4sMYMHdkGdqm1ICjXGb76LAudDpc7CJUIf48dTOgiTgi+DTTel
         y319pifSsEEB6grT3Gj6DQVwi82KhOayldf8FCmT+//WCZuAMv0Y13ai0kYeZgXjIQqR
         yLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9BO6IldY4MHODwdVbOOijOAgE3+J8brnlEUiSLKzAhuzTOJeVJLFXGCGweWDQW09MJaaESB2hX163fR4JM8kFElI+dgOewhJqsGCUnUrD
X-Gm-Message-State: AOJu0Yw3PXjEWbFwOWiJwiF7ml13ZmKt5MN2B2bKdb6h17X/Jd1RuT80
	36Cn7NYHo/CFJSAgDlmHMWXB9BESZGhYS7L1AEBBOOP1ZrBCHDvRMfNaLH4NmXI=
X-Google-Smtp-Source: AGHT+IESMNgkqXbtafANGbo2BARFo6uXoCxR7/FEaBsi9GwxuDZftgiVL+fjv6uvWjEhvAUc6QG2Uw==
X-Received: by 2002:a17:907:6d20:b0:a4e:48d6:b9d7 with SMTP id sa32-20020a1709076d2000b00a4e48d6b9d7mr1342167ejc.56.1712318706052;
        Fri, 05 Apr 2024 05:05:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id hd6-20020a170907968600b00a46da83f7fdsm763981ejc.145.2024.04.05.05.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 05:05:05 -0700 (PDT)
Date: Fri, 5 Apr 2024 14:05:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 09/15] RISC-V: KVM: Add perf sampling support for
 guests
Message-ID: <20240405-de92b25fdc1ecf53770c49d9@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-10-atishp@rivosinc.com>
 <20240302-f9732d962e5f7c7760059f2e@orel>
 <c46c57c2-95bc-4289-ac99-efd5bad093b5@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c46c57c2-95bc-4289-ac99-efd5bad093b5@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_050509_242168_CD6A37BD 
X-CRM114-Status: GOOD (  24.23  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 02, 2024 at 01:33:10AM -0700, Atish Patra wrote:
...
> > but it should be possible for the VMM to disable this extension in the
> > guest. We just need to change all the checks in KVM of the host's ISA
> > for RISCV_ISA_EXT_SSCOFPMF to checking the guest's ISA instead. Maybe
> > it's not worth it, though, if the guest PMU isn't useful without overflow.
> > But, sometimes it's nice to be able to disable stuff for debug and
> > workarounds.
> > 
> 
> As per my understanding, kvm_riscv_vcpu_isa_disable_allowed only returns
> true for those extensions which can be disabled architecturally.

I think kvm_riscv_vcpu_isa_disable_allowed can return true for any
extensions that KVM can guarantee won't be exposed in any way to the
guest. Extensions that cannot be disabled architecturally must return
false, since their instructions will still be present in the guest, even
if KVM doesn't want to expose them, but extensions which KVM emulates
can return true because KVM can choose not to emulate them. IIUC, sscofpmf
falls in this latter category.

> 
> VMM can still disable any extension by not adding to the device tree.
> In fact, that's how kvmtool can disable sstc or sscofpmf with
> --disable-<isa-ext command>.
> 
> The warning is bit confused though.
> 
> For example: if you run kvmtool with --disable-sstc
> 
> "Warning: Failed to disable sstc ISA exension"

I think Sstc should allow disabling since it has a corresponding henvcfg
bit which KVM could not set in order to force accesses to the Sstc CSRs
to raise ILL exceptions. So, let's put Sstc aside, since it's not a good
example. An extension like Zihintpause, OTOH, cannot be disabled since
the 'pause' instruction will be present even if KVM does not put
Zihintpause in the guest's ISA string. If a kvmtool user uses
--disable-zihintpause, then I think this warning about failing to disable
the extension is appropriate.

> 
> But sstc is disabled: Here is the cpuinfo output.
> # cat /proc/cpuinfo
> processor       : 0
> hart            : 0
> isa             : rv64imafdc_zicbom_zicboz_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zfa_zba_zbb_zbc_zbs_smstateen_sscofpmf
> mmu             : sv57
> mvendorid       : 0x0
> marchid         : 0x0
> mimpid          : 0x0
> hart isa        : rv64imafdc_zicbom_zicboz_zicntr_zicsr_zifencei_zihintntl_zihintpause_zihpm_zfa_zba_zbb_zbc_zbs_smstateen_sscofpmf

Removing from the ISA string is the best we can do in cases like
Zihintpause, and is likely good enough for well-behaved guests, but the
VMM's warning to the user is good for these cases too, since not all
guests are well-behaved.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
