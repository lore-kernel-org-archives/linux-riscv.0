Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF876CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XTKGT86Icsjn8yUHWRObNgPdPdaL7jbDmvU/0DrXis=; b=STGPf9dsgnkINA
	ismraw5HfM+NTK14b4+e5YkLUoErr+NZtknN8UrcUPCJ12NbsyPFcs41UY20tzocjtao5qqOmZp5q
	euqPG/CqHZSNSRizUYn9PDCzMiW9skSH25vHoY6PWZcqaa3xZxQaATTDzo1zmbqAjo6G2eIin5JRG
	swrWWF9tDwdxnF77Rb5uLViQPUU6ICYJbe/a3hedKMMF8r+FPGipMzHJPjJQiH4L32fxuSMsVoD3S
	ebEAK3mUYbh8IOYZ5jXRx3W5x+FbwKvJgVjVhtIXDtBmiSPhWX8yJq6TocQURgw6q3S5bcTkCs6MC
	mPZgyhMYFedJmdCjFKkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXyU-00000002UXV-3zRg;
	Fri, 19 Sep 2025 10:04:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXyQ-00000002UWD-3FRm
	for linux-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 10:04:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45f2c5ef00fso15143845e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Sep 2025 03:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758276253; x=1758881053; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cwSJqMLbkr+n3h9atzHQFhMdHOFSLWWZIBI6hzjzDlU=;
        b=azb8n7KtSmlj/RyyMmlhn6vm48h14CxqNqx0omGojbo3sLPTNgHcXePQCI3fj9vrsV
         L11OBhw3Rnps66q3SLJLFnD61xFjAVBvPiGcd24IAFXeTS7WY9sKfGaIezym+h24IOA8
         mt5vXmuT0XaO6RB1byW3j4DEZ/pBvZ9uylG469cnCj/vl7hpTjETe+M97gLtS2yKc8aQ
         IVSLnEdRQsdLGlN6hdBGu7i9KYwoeMHrjX7WuXpIbezIresIwUIQvEQPOvPYdgmOxdF/
         V+sFsO1ZceCrq4hlqf4BDmQw53740MmFr9LRLEQp7bMbz5lrv6MErK//zynENcKXEGid
         zH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758276253; x=1758881053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwSJqMLbkr+n3h9atzHQFhMdHOFSLWWZIBI6hzjzDlU=;
        b=ZS+BuLt3KTIkQvg3rKGP1GQPJ0tM0knI/5RVJwYPlDM7joYwpuMftDTsVo0OcxjCSG
         /hTGSkxHqXpwT3X2q2AfnYMk8/aFLA+5bJ+22qDXZfDWX7TrMhlFDb7iuxZU4dwWRn9K
         AMVJ4KlTjxm4V95e0ziQXcf4zRxdv923c7/3WgFvsEORWlpASKp1QfJepRr+FMmLUN4A
         HSdGnoNmkKWeL91DagSu5FUzQXHtKfTgmb3ABQrWvomhYgRtSVIVF/Ls0uVVnrPc5kYR
         sxX30u7afRsG5mT0B+HQoFUCH5LDeBg2qRnd6npZnCIYmzHRBzadZGTE9yB9Y3aNUnmZ
         McQw==
X-Forwarded-Encrypted: i=1; AJvYcCUBLz43GfaUli0uPvTk46z00iEh6J9dmPli/kmi2bzBiOSPVbD4qQ34w4eR797XJnBvKv6gQ0anqRa5Fg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5faUO95slWv0mF2V4d07YHBExwZZ9oP/sMVRrnd7O9hcgEAi2
	lcIPeiKmmJex+fWWz0WADSvh2t6IZGlIJ/drWnd984bU4ryQ1OLSN+MK
X-Gm-Gg: ASbGncu5/Yw6DAGMhtekmd6i+MeUbXTXk0fxKgPOiLUonzf55enempa4pND/hPw2ODZ
	rml6+OhpKvH9vLK9q3DO+gN1xRqilXjvgEvIqs3lirGZlZyouoqa6Q70n0ZD/6j8R6ihG05YYS1
	/d/J64hYiCd1ywEVUuo8VsBitU9aDBq8Kh338/Yesiu6OQvvcWnxH21UpguXj5zqmpZIAdBWFBJ
	E1vVdKv/0VljvOh4MVIkODcQxcPOqzyyaHNHNN+tPlYbxzCxHbPllh7DcRYdAvlQdW//tHRnZOh
	dNBSSza58f1N7ZlicewlXfOG2WGlj7lruQUwHU6cRckRvJ1e78uVC5ORWts5PbQTr/knLo71Gv2
	TPf1w9d5Kw5q4SYGLmmyQ
X-Google-Smtp-Source: AGHT+IHvZMGRRNi+u2pMIpVVRpaJCUA/81PZdTy1q3wdlCcos410V3il5VvXKBDg1PnvbPEV8rv3lQ==
X-Received: by 2002:a05:600c:6305:b0:45b:868e:7f7f with SMTP id 5b1f17b1804b1-467ee8c56d6mr28084075e9.17.1758276252440;
        Fri, 19 Sep 2025 03:04:12 -0700 (PDT)
Received: from andrea ([176.201.192.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f5a286edsm90295055e9.16.2025.09.19.03.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 03:04:12 -0700 (PDT)
Date: Fri, 19 Sep 2025 12:04:05 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com,
	ajones@ventanamicro.com, brs@rivosinc.com, anup@brainfault.org,
	atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/8] riscv: Add Zalasr ISA extension support
Message-ID: <aM0qlTNPiaQRY2Nv@andrea>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_030414_831235_93BE6F51 
X-CRM114-Status: GOOD (  20.52  )
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

On Fri, Sep 19, 2025 at 03:37:06PM +0800, Xu Lu wrote:
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
> Xu Lu (8):
>   riscv: add ISA extension parsing for Zalasr
>   dt-bindings: riscv: Add Zalasr ISA extension description
>   riscv: hwprobe: Export Zalasr extension
>   riscv: Introduce Zalasr instructions
>   riscv: Use Zalasr for smp_load_acquire/smp_store_release
>   riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
>     operations
>   RISC-V: KVM: Allow Zalasr extensions for Guest/VM
>   KVM: riscv: selftests: Add Zalasr extensions to get-reg-list test
> 
>  Documentation/arch/riscv/hwprobe.rst          |   5 +-
>  .../devicetree/bindings/riscv/extensions.yaml |   5 +
>  arch/riscv/include/asm/atomic.h               |   6 -
>  arch/riscv/include/asm/barrier.h              |  91 ++++++++++--
>  arch/riscv/include/asm/cmpxchg.h              | 136 ++++++++----------
>  arch/riscv/include/asm/hwcap.h                |   1 +
>  arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
>  arch/riscv/include/uapi/asm/kvm.h             |   1 +
>  arch/riscv/kernel/cpufeature.c                |   1 +
>  arch/riscv/kernel/sys_hwprobe.c               |   1 +
>  arch/riscv/kvm/vcpu_onereg.c                  |   2 +
>  .../selftests/kvm/riscv/get-reg-list.c        |   4 +
>  13 files changed, 242 insertions(+), 91 deletions(-)

I wouldn't have rushed this submission while the discussion on v2 seems
so much alive;  IAC, to add and link to that discussion, this version
(not a review, just looking at this diff stat) is changing the fastpath

  read_unlock()
  read_lock()

from something like

  fence rw,w
  amodadd.w
  amoadd.w
  fence r,rw

to

  fence rw,rw
  amoadd.w
  amoadd.w
  fence rw,rw

no matter Zalasr or !Zalasr.  Similarly for other atomic operations with
release or acquire semantics.  I guess the change was not intentional?
If it was intentional, it should be properly mentioned in the changelog.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
