Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FCFECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 21:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZ2/OzTNuBaISWduDZ36r/kdp/+shVEV3N1BrccEMWE=; b=JGXDbepVQFmJtn
	tUDEohs3Lmr2iHYeBAxRftD9erOLoWFBwz/H7/u3/YltIsQed7Plp0MwrD0KHTcz+RdnlWctES4IM
	TGNMXsZcOwoLEZ0XFis0pyD+O4ii2ERKPtaiqcKM0M89Pyp7n7TQ1iu4TmabOgdouV7YFFW/FUEGn
	3Pr2Prh+bgBzHxjaElNdE4+D1sQW3T/GDV43sKlAFf4/lcIFf2ZFjeTIHCIHTh3XLQ72W+wBehxId
	Oz1G8Pt5W8iZRxpYTWq0nGdZU90pDFbxOuRo0K5glkDJw4AUIGHgaQUjva5fcoArZcZ1TYoVNrY+n
	agbRTWOfyoBRNd2XH7RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRgwc-00D4i0-7C; Fri, 26 Aug 2022 21:32:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRgwZ-00D4e6-6v
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 21:32:48 +0000
Received: by mail-lf1-x12c.google.com with SMTP id d8so3621836lfq.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 14:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=fGX1OPYHOyAdnf6z71dmW2DwOr7H4Y5wRyKl79aJ7R0=;
        b=ZC1efQqpG/Yl12c9Sf0lbSneIvuydmkz6lD+4KwRibO24kQUatXopq6xrBTE+YeeyR
         q7A0vfCIleUquEfbTOnSyFHAwePTyBPeqv2/ma8GgFea/Ixx3aLVwoY9Fes1qIrjLDr1
         Nd6jCOOn88THmF7GLR+a8EWPAuq3Zz3zn1PzhUigNoDANZ/JbADf29mivcvkYSmlIyPY
         Mljmir8oMpLOPvbS8ez1m+7uKdlmCp6LGxmF12PPwjzauVS8cA/Z9xWvqjCO8f0T0wuz
         kyy+4B1CYpyEZxjTV7uWkKZFEeBcp8NRBYb+60p59rhCoYViV4f4TSJ6kjl/TbfqRvpL
         g1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fGX1OPYHOyAdnf6z71dmW2DwOr7H4Y5wRyKl79aJ7R0=;
        b=ec5hXit2JGb5dSssG/Ynn31HfK2xVMkHYxpgizmxtKjfLsNmGuH1jpxQJiV/TQmfS8
         Eh0uyqjnJlwwPX9gbDVMBO1Q1dVMYTifsvUm8gGZfqEMVWezd6yTXcQh6cUZdL7g2/HC
         ZxYiHzGPqmujxX2OO4aHzXOSjLO4ow3o1daSAOO57I49V+Jg4hCNxAuwSlAXKa/BsR/n
         +5tPRPwekk3zgbOYDMryuuaPgKt/RDAKLwcflRjlEAzNH/zctmbFS0fsgz/Zp75TIsSq
         d06bz/JQkeoQyziqa4EEUDbynvuW1nNcmAzj/UT36UDIj0rvxgNO8gF1KEjNDcde6zd2
         Ducg==
X-Gm-Message-State: ACgBeo1vqBR0I8SNfOMEJZCdeqjQipSPUSNUqXsLOtrco92zju6YIQoa
	2yesIHaKur87ZzOMxwJrEt6X4v6EBIUlSsvLc6MwkA==
X-Google-Smtp-Source: AA6agR4p8yZHknOzoft/51CAneJ1hrsnJGIMJ3qvD2H+dBtk7IsckDNc/Agfws5rxxUjM+VYCG98DW+qqx4b3NOZuyc=
X-Received: by 2002:ac2:4e15:0:b0:48b:3ad2:42c8 with SMTP id
 e21-20020ac24e15000000b0048b3ad242c8mr3415436lfr.391.1661549562159; Fri, 26
 Aug 2022 14:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220825232522.3997340-1-seanjc@google.com>
In-Reply-To: <20220825232522.3997340-1-seanjc@google.com>
From: Peter Gonda <pgonda@google.com>
Date: Fri, 26 Aug 2022 15:32:30 -0600
Message-ID: <CAMkAt6ryLh-gQYvmUYfxS3+CRwCLfK3Fby1W5NxxFLSK7M_v0w@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] KVM: selftests: Implement ucall "pool" (for SEV)
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>, 
	David Hildenbrand <david@redhat.com>, Tom Rix <trix@redhat.com>, kvm list <kvm@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
	Colton Lewis <coltonlewis@google.com>, Andrew Jones <andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_143247_307100_0D995A66 
X-CRM114-Status: GOOD (  11.95  )
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

On Thu, Aug 25, 2022 at 5:25 PM Sean Christopherson <seanjc@google.com> wrote:
>
> Non-KVM folks, y'all got pulled in because of the atomic_test_and_set_bit()
> patch.
>
> Rework the ucall infrastructure to use a pool of ucall structs to pass
> memory instead of using the guest's stack.  For confidential VMs with
> encrypted memory, e.g. SEV, the guest's stack "needs" to be private memory
> and so can't be used to communicate with the host.
>
> Convert all implementations to the pool as all of the complexity is hidden
> in common code, and supporting multiple interfaces adds its own kind of
> complexity.
>
> Tested on x86 and ARM, compile tested on s390 and RISC-V.
>

Thanks for the help on the ucall-pool Sean!

I rebased the SEV selftests on these and everything works as before

TESTED-BY: Peter Gonda <pgonda@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
