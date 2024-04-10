Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBEACD1296
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 07:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xiCR0PYsxM8uJV2M+5ym5lThOZ3QOiQ0nFWb5UWPd8E=; b=ZIKVjYwsmCBf/N
	JvtqwR7gLvSLYGbAM5cMGJGkyHXDQOtvS3wIpEb/EGQL9tqIwMRFinvUnlgWtYvynmOyOgL7Bz3Og
	DA4+cEEo1TSHdbSfhqb3+v17TBIIBfdqYlT3bp/9iDz7rswAwkLeW9dR6bAlX7Y8RLNA3ci2nb5M/
	zzrQjTGShHkaGKRHqTynY82gDUWlSfjh14GfpV1Z7My7J6YsvTHEWxgkhNbVZd4I5yDOVahn/heOm
	USX5l6i2vQDGcUBVjslJgVF8KM8gJ0GH11LSj7FFcU2ruyQTUHuymZJtww4qrL60jobJm3Mt+nghd
	2IcxzqIzc+4Y09JZ3eLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSGJ-00000005aM8-2Jm1;
	Wed, 10 Apr 2024 07:20:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruSGF-00000005aKJ-3g8I
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 07:20:49 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a44665605f3so720997366b.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 00:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712733645; x=1713338445; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uLhNuIrSaoYe/9NO2TgswlnfBaBCyzfaiiheEplZdqE=;
        b=cLuYKqkh8TDVCHftDxxEf7oBmGmT+EkbB055UdS7uaH3pSMFe/oyn8PofjJ0q1UVV8
         5IC0j7mifXfgUqnwUBs0o7FW532vK6uxWTV7xQ7Mc+70cKtheHO9tMFfdvqoMCLDcfOd
         zTFEc/JpyHU73aYqywtFfpb1EMGxNWHW+ZaA+IqAFW0DZeRH6jCAUPzDXjaZqcHej6HL
         dUftkGwynP+7H/pGZofcWZRB6jLNS8/wf6gIjxX2AuE7paj66Y3+W5Y1hSp0u89/zBSa
         1bTgChKl6jfJ8kWYhUsKWo1CG1K75dFJohNIyraVy1RUzfAf+jXye21jAJd/2dz84mXr
         8AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712733645; x=1713338445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLhNuIrSaoYe/9NO2TgswlnfBaBCyzfaiiheEplZdqE=;
        b=Gp7P56vlTuaL/+c3nR08rfjMsjkE27YXSh7Ww2Hpa+QUtpCBHP/KdIq3rBi1qMM+U9
         Z0d8tlEeFK0Zqirm1Yqxf+1dixOKedlNBCFsgHsHeZmwEhQRdsw9BojpW7IngRO5sepu
         9B70wstC3f7nIWQVP+Mj6IX9K5XdnedIAyqilmnrUc1FLhUeA0WFLiiqr4xRTXqJGmX4
         w/yncCk1Ed8QDwgITx2vaKkcIUGLbJ+beDrVzyROMipHq1tiHB8NiWrQypiMD3drEoYC
         qNH0rvLNK/6Agmd3WQPjds+8XTUPC5vfSengcT6qkp/a09pe0de+UnrPIHhMl2RLAiRF
         97HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcHR7lBsE3NV9NWozm4/gyrLbIGrFOfHoJ86CdlYBks9Hi8W1svTDu1OGrJOSQB2vRbFiVcxLBQSeVUvq9luILy2LflqNb+ERSBLdJY7Xt
X-Gm-Message-State: AOJu0YwM/vGIYnPwgB7S27vAk/Aa5O9QJ7UaVyaU8i8SNpFYUktxcIca
	oiDu4OYq87P9p/4deQQS9WNf7zs/huRLWkvI3w5AhOxf0X498zDyLa89eUlkiDw=
X-Google-Smtp-Source: AGHT+IFblqSFRNSt8LD4P6llFistdn4FvvuYpArYI85OkCLQGw80eVNjwPfQ65XS4eljatieTXAaFA==
X-Received: by 2002:a17:906:c215:b0:a51:d7f3:324b with SMTP id d21-20020a170906c21500b00a51d7f3324bmr969037ejz.66.1712733644958;
        Wed, 10 Apr 2024 00:20:44 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id jz8-20020a17090775e800b00a4672fb2a03sm6720040ejc.10.2024.04.10.00.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 00:20:44 -0700 (PDT)
Date: Wed, 10 Apr 2024 09:20:43 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v4 09/15] RISC-V: KVM: Add perf sampling support for
 guests
Message-ID: <20240410-f1a4303dc73789aa6adbe730@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-10-atishp@rivosinc.com>
 <20240302-f9732d962e5f7c7760059f2e@orel>
 <c46c57c2-95bc-4289-ac99-efd5bad093b5@rivosinc.com>
 <20240405-de92b25fdc1ecf53770c49d9@orel>
 <388ef032-7030-47b5-bba5-852b00de7382@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <388ef032-7030-47b5-bba5-852b00de7382@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_002047_948762_04A58E2F 
X-CRM114-Status: GOOD (  32.75  )
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

On Tue, Apr 09, 2024 at 05:11:31PM -0700, Atish Patra wrote:
> On 4/5/24 05:05, Andrew Jones wrote:
> > On Tue, Apr 02, 2024 at 01:33:10AM -0700, Atish Patra wrote:
> > ...
> > > > but it should be possible for the VMM to disable this extension in the
> > > > guest. We just need to change all the checks in KVM of the host's ISA
> > > > for RISCV_ISA_EXT_SSCOFPMF to checking the guest's ISA instead. Maybe
> > > > it's not worth it, though, if the guest PMU isn't useful without overflow.
> > > > But, sometimes it's nice to be able to disable stuff for debug and
> > > > workarounds.
> > > > 
> > > 
> > > As per my understanding, kvm_riscv_vcpu_isa_disable_allowed only returns
> > > true for those extensions which can be disabled architecturally.
> > 
> > I think kvm_riscv_vcpu_isa_disable_allowed can return true for any
> > extensions that KVM can guarantee won't be exposed in any way to the
> > guest. Extensions that cannot be disabled architecturally must return
> > false, since their instructions will still be present in the guest, even
> > if KVM doesn't want to expose them, but extensions which KVM emulates
> > can return true because KVM can choose not to emulate them. IIUC, sscofpmf
> > falls in this latter category.
> > 
> 
> hmm. The Sscofpmf is dependent on interrupt filtering via hvien and SBI PMU.
> So you are suggesting to toggle off the CSR_HVIEN bit for overflow interrupt

Yeah, this is what I was thinking.

> or do more granular disabling for privilege mode filtering in SBI PMU as
> well.
> 
> Beyond that we can't disable SBI PMU. Is that okay ? A guest can still cause
> counter overflow and interrupt the host. However, the guest won't get any
> interrupt as hvien is not set.
> 
> It can also still filter the events as that is tied with SBI PMU.
> 
> We can put more granular checks in SBI pmu but I am just wondering if it
> provides anything additional beyond just disabling the sscofpmf in device
> tree.

If it's too much of a code burden for something we're unlikely going to
want to do for anything other than debug (where removing the extension
from the device tree is likely sufficient), then that's another reason to
not allow disabling. Maybe we should write a comment above
kvm_riscv_vcpu_isa_disable_allowed which points how extensions end up
there, i.e. either KVM is powerless to completely hide it or we don't
want to maintain KVM code to completely hide it.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
