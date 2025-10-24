Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7C6CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 23:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rWjcPnqYy6HHyaJ4wShcp+Xrn51c4YB5CsDNPdIibo=; b=NEK8w7aT7PZ7N1
	1VTWN2oM9Js8NvOnnSpFxDeRGXtlnEMJOvaD19d1I1WMF5yxKxamj665eS+duy82taEvDF0n6WWwp
	czwLZkoUtEcaRyDIEkwTafO8lurpTwzXBsD9UTLLmDAj5npxhfom7tYc2RX19TOu/7wiPaG/8c98T
	eee0INP1+OdUfOzhpOdRGfyQ8/az4avzR/nFJW4SesmVmIqw/wLxFNTXndS6NOakuBAt+TRllNHxI
	63UIDpPe5nAIFrV7lgyG+AjkWBP8BYCaP7gGQtik2cicLFLSevtlWI/AOFjCbCg9CzaaNdPz/YPoF
	Rg8StPnber/BR8XVE5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCRNP-0000000AfXs-0Ct5;
	Fri, 24 Oct 2025 23:39:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCRNM-0000000AfXP-0Gz8
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 23:39:17 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso4630905a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 16:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761349154; x=1761953954; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4qshgmZlkIM4+vcn2er+R5ZwtdRF9Gko5Hx8ZyCDhMI=;
        b=it+vc24WTx3c8wqAJOCLDnchfzJskkTZslHl0g3T5Zt3iAfUahqmpVggQcTgDhOGPV
         4tUAPWvNEfu4n03LLOzuxFCR3rhcV+b9Wtk7NijfHAcSsRxSQ+pKQqCglAD+azcvYw35
         MLj70BtWPTZyN0qlUEZTOLwQTYKGLEVY+tYRHvd1dSbE6fPyZH81aQ6uv4Fmcp58gnp3
         wEQOEqzHY7XJv3iKm8p2B5oAdnsM+aAqhvNPlf4OpjYLXQak9zcCOp8iV7DG6QyDUW8v
         GxJqIiAEmtKsk66nJgrMlBQn8Nt9zic0lQcgwd4dZ+La8TM8uD/IhEi6CJLqPGWHI7jC
         /+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761349154; x=1761953954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qshgmZlkIM4+vcn2er+R5ZwtdRF9Gko5Hx8ZyCDhMI=;
        b=Qk52vHaH8PceT+Rb3XAJpUyk1IVJQLlck1mahcmfIj7gAY9FhOXrp5pgSrAoiU9ElZ
         zjDf5NzAdPW4WFhZtEZYZrDkCp1Qs24NixH9DzdtXJWerIhsbyd41YEPjM4fZ4jMywNS
         PNl7i5mEVHoGM51JK2M2aUDwxvOWpe01FLBUD2QFwgeyOgoMzl/IYfctjqW84fjUjJBz
         sVJasaXW1dgSh/Wdg+LAHY3qGj+JMgM3lHPglCXsdRbwOFL3CvJRihQv7YyUOpvv3sMo
         u3ORMHMyIR5qKF7lmWO3JjFKsHqCv0lgY2gTyIxVwZpNgfCjW/L0K3tdUTLIB1iaPGtd
         ksKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIsIBOYWhCd60TmDeReJtxynrz+j0qrPD0EYyGqU7fUsOnI7LZk/aX9kU3eM1iqpb6ARQxyEucD8bv/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCe7QISrOOqO5BKel+m6c3rFF6UCw40MX9dZSZg6rw741uyzLk
	QIrP+WHPC8mlA9xivN2+l7ukXg8lbQTmsAae+ihDnSmrw2jMjN58ByHCwfjF8Q==
X-Gm-Gg: ASbGnctC9sB9TJznkLE6XrSqRDp3BQv+Ee5F9evypssm7k+7Y7H+0dSDCt8y6/jfSwe
	pcuMUYB/mK6GeFltDuZ+QwTg02vPsYwwt9aDdWBuSqQC9n9HF2acMJAOCykd3kVNi/OP3XY7Cqq
	nwrsElJvOpOKK6/YHd/VUpSszcOLsUN2dHhZN/AFf42gd4MTVIp1pYjFTqBJ7gIBaFEnhm0tWtd
	fn1ziA1nMgJEM6PkgBpE2KxnLaAOAjZ+sJDYVlDLvq6+jIanIX8i/diC76Gy72dlGqi5jchP8BD
	CwOevHo5NqpYpzhjDpR4MfeZ0foXxeswg5LEl08pSXdyzXuiZ+cz/64LDCEMpg4yHHRjXHzvjqt
	t2o3WLK5XVN2gWWe3iVA9w4VVVwL69OIigbAs3BguJZgRlLA6yzWWsA7j7IrQaVmdSfXmeASLlR
	uxWeJYpg==
X-Google-Smtp-Source: AGHT+IEQw0TA1CC7no4fMAMA9oQRoUt9Lgbn+Uft1azRKrTnyGz7lCiyNuO6p2GHKFOC05VVJ/iKvw==
X-Received: by 2002:a05:600c:4f89:b0:471:a98:99a6 with SMTP id 5b1f17b1804b1-475cafae164mr64272055e9.11.1761342429974;
        Fri, 24 Oct 2025 14:47:09 -0700 (PDT)
Received: from andrea ([31.189.53.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496d4b923sm89676705e9.14.2025.10.24.14.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 14:47:09 -0700 (PDT)
Date: Fri, 24 Oct 2025 23:47:04 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com,
	anup@brainfault.org, atish.patra@linux.dev, pbonzini@redhat.com,
	shuah@kernel.org, ajones@ventanamicro.com, brs@rivosinc.com,
	guoren@kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
Subject: Re: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
Message-ID: <aPvz2Pb6RuWnw9Ht@andrea>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_163916_127223_C409A17C 
X-CRM114-Status: GOOD (  18.98  )
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

On Mon, Oct 20, 2025 at 12:20:46PM +0800, Xu Lu wrote:
> This patch adds support for the Zalasr ISA extension, which supplies the
> real load acquire/store release instructions.
> 
> The specification can be found here:
> https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc
> 
> This patch seires has been tested with ltp on Qemu with Brensan's zalasr
> support patch[1].
> 
> Some false positive spacing error happens during patch checking. Thus I
> CCed maintainers of checkpatch.pl as well.
> 
> [1] https://lore.kernel.org/all/CAGPSXwJEdtqW=nx71oufZp64nK6tK=0rytVEcz4F-gfvCOXk2w@mail.gmail.com/
> 
> v4:
>  - Apply acquire/release semantics to arch_atomic operations. Thanks
>  to Andrea.

Perhaps I wasn't clear enough, sorry, but I did mean my suggestion
(specifically, the use of .aq/.rl annotations) to be conditional on
zalasr.  Same observation for xchg/cmpxchg below.  IOW, I really
expected this series to introduce _no changes_ to our lowerings when
!zalasr.  If any !zalasr-changes are needed, I'd suggest isolating
/submitting them in dedicated patches.

But other than that, this looks pretty good to me.  Perhaps something
else to consider for zalasr is our lowering of smp_cond_load_acquire()
(can't spot an actual bug now, but recall the principle "zalasr -> use
.aq/.rl annotations ..."): riscv currently uses the "generic", fence-
based implementation from include/asm-generic/barrier.h; compare that
with e.g. the implementation from arch/arm64/include/asm/barrier.h .

  Andrea


> v3:
>  - Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
>  so as to ensure FENCE.TSO ordering between operations which precede the
>  UNLOCK+LOCK sequence and operations which follow the sequence. Thanks
>  to Andrea.
>  - Support hwprobe of Zalasr.
>  - Allow Zalasr extensions for Guest/VM.
> 
> v2:
>  - Adjust the order of Zalasr and Zalrsc in dt-bindings. Thanks to
>  Conor.
> 
> Xu Lu (10):
>   riscv: Add ISA extension parsing for Zalasr
>   dt-bindings: riscv: Add Zalasr ISA extension description
>   riscv: hwprobe: Export Zalasr extension
>   riscv: Introduce Zalasr instructions
>   riscv: Apply Zalasr to smp_load_acquire/smp_store_release
>   riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
>     operations
>   riscv: Apply acquire/release semantics to arch_atomic operations
>   riscv: Remove arch specific __atomic_acquire/release_fence
>   RISC-V: KVM: Allow Zalasr extensions for Guest/VM
>   RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test
> 
>  Documentation/arch/riscv/hwprobe.rst          |   5 +-
>  .../devicetree/bindings/riscv/extensions.yaml |   5 +
>  arch/riscv/include/asm/atomic.h               |  70 ++++++++-
>  arch/riscv/include/asm/barrier.h              |  91 +++++++++--
>  arch/riscv/include/asm/cmpxchg.h              | 144 +++++++++---------
>  arch/riscv/include/asm/fence.h                |   4 -
>  arch/riscv/include/asm/hwcap.h                |   1 +
>  arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
>  arch/riscv/include/uapi/asm/kvm.h             |   1 +
>  arch/riscv/kernel/cpufeature.c                |   1 +
>  arch/riscv/kernel/sys_hwprobe.c               |   1 +
>  arch/riscv/kvm/vcpu_onereg.c                  |   2 +
>  .../selftests/kvm/riscv/get-reg-list.c        |   4 +
>  14 files changed, 314 insertions(+), 95 deletions(-)
> 
> -- 
> 2.20.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
