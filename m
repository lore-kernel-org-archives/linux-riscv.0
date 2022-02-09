Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C851CC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 19:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcQi7xtJkKwzqA2wZHZLfEbxA8GYWZ1OjWZSKpVqf0s=; b=QnhdGZVJtPwIvb
	FfjlvzQPtshD4AAz+nqWPyNXe28zfz7MQnpnrOev2cccsOyOpEKWH69QJsfNyEQUyIKFJ3wLfV/Ww
	e7fblS4OmAPWpOHWSg8rmTucX2IG0kswhhFQtI+DGu0/aRXIkT07aK90l1uKDgpIH1gxx3s6vNICt
	u148EoAEeZJxDxHq0bUJANigG1V+h4SdeZgYT0OdO/1At38BT/i4RPPLxCI8abnCR9U76w8HtzlKW
	gxyzuL6EZrayMrkVDgmszNF1Vf0JRl2oUp4T+EnAHKQaC3gD0BEPcmVzB1aK2LFuApXqkAUb4sJZz
	5YoHBxH8nM2XHX4Q0dsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHt1H-001QWA-Fy; Wed, 09 Feb 2022 19:52:51 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHt1F-001QV5-00
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 19:52:50 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d187so6091582pfa.10
 for <linux-riscv@lists.infradead.org>; Wed, 09 Feb 2022 11:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nFEbKA8UOj2F0aYmafhYdx9MoDnLhZL6FzGdA3foG6Y=;
 b=kMS+/VC4xCdhdLklBPMZrl1DDgsPdemkNlQ+9xJdsF7MXhYOau3XWTVe4FOrwEqNCE
 AtJl33LpEFo6tfuoyyjy0zXo24YUgl2rkRpZDMF8C8XU1aeb1hng1SUX4zjzRKukMAQ9
 27hgmz8ku+LmTHBmD6JLUcxGm2ViDLqKuaJNEonZsgpd0HlXbksTP9GkQqwkK3nofxzk
 9N3WOhuOj7Zmr/5Cp7EeaMz/pprsSKTROefT+5wZO27PB8CVnklUVAkPBIVMBiLCrHCw
 jl9lkCtgzT6We8ITi8RRxUdBU2p3bPtKzg04MIXkdCVNZOh+d/Fln2r4rSPfvBbdqxfm
 cNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nFEbKA8UOj2F0aYmafhYdx9MoDnLhZL6FzGdA3foG6Y=;
 b=X11n3jTkp7uCIXlDM9JRzI2lctiYe0AUC0g2Vi45aK12+xLx1DFsLeNIjQPZVLhOLG
 DpuOgOA9peqjzD4zp/U2dYtznYv6Wd5LTCg5oNgqjY45FFlozv/5QQFzR3/Z6gx8NZZ5
 O5/y6YPQJ2VW+quYdBrJ1ZzodmBMdmYDZgtM+SsSTB4RcJGRnucSPmDFiS6Iz/N5Sie8
 6u1XGT+51VpUwWGbXZhoK3H7b/5+qtCApCd7GdNfMumY72Aszb2tcxnhHMuO1IR5OghA
 ovqxkADK69C5H/sNssqjlBQ9gzryPsgZE2cLmUJJ4JS0qbbebZTj28I4kzbVNMn9cz8s
 Ncyg==
X-Gm-Message-State: AOAM5311lh7J6rJYb1xWuKPiyP5o5oJrEACNqagEbt6DV1OZmjFJDgEJ
 R+/gEVdzgegsX7DVRQjogir4aA==
X-Google-Smtp-Source: ABdhPJxEijFR2ADtO2dJpv7+eOnsj3GAeQVvJQZsu/Pn1kY2yGlTgcOn0LgYSwuqCOLhd8P+Pi4JPg==
X-Received: by 2002:a05:6a00:23d0:: with SMTP id
 g16mr3889078pfc.19.1644436367723; 
 Wed, 09 Feb 2022 11:52:47 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id pi9sm7744343pjb.46.2022.02.09.11.52.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:52:47 -0800 (PST)
Date: Wed, 9 Feb 2022 19:52:43 +0000
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, kevin.tian@intel.com,
 tglx@linutronix.de, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Juergen Gross <jgross@suse.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 2/5] Partially revert "KVM: Pass kvm_init()'s opaque
 param to additional arch funcs"
Message-ID: <YgQbi1VcxA5OTo77@google.com>
References: <20220209074109.453116-1-chao.gao@intel.com>
 <20220209074109.453116-3-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209074109.453116-3-chao.gao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_115249_084491_3EB7A991 
X-CRM114-Status: GOOD (  10.58  )
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

On Wed, Feb 09, 2022, Chao Gao wrote:
> This partially reverts commit b99040853738 ("KVM: Pass kvm_init()'s opaque
> param to additional arch funcs") remove opaque from
> kvm_arch_check_processor_compat because no one uses this opaque now.
> Address conflicts for ARM (due to file movement) and manually handle RISC-V
> which comes after the commit.
> 
> And changes about kvm_arch_hardware_setup() in original commit are still
> needed so they are not reverted.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
