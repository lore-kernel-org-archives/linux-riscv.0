Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9F7C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jan 2022 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHfumkVTir78Sec1whI3MTxmxjUkOa65N2ZnpH8qmuQ=; b=dJgUcSmL72rqBW
	/8z3mtQ9zIGwRmsUN/kWrr1UnsHr/zx9Iztmk0N1HAqvEx5b1BK04dLi81HMYAMRDMN2fBCwgbEaM
	OPG8+zk54cj/6lf6zk0BTz3t5ZYKq1EionjK8AqkoQRV91er3/Vg1305h/ABYi296kyfC2Cdhoal4
	aaRdImBmRKu+PAXP5u8AiOThKRHC0b2tkw2oRXYQdYH3JaeynwBuEEUBqqOmq0W1DYB0vPkwTw5Z1
	5Mg7FsFRYPjFya/8VAZnaHrs8k7hUkcxhppbRjP5/jhLLhENiLKbFyqkm5fleQXJASAaa82Jv89eN
	YXdmWTr7vds5CA4JJnxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7hJW-003Do8-1A; Wed, 12 Jan 2022 17:21:34 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7hJT-003DmW-0g
 for linux-riscv@lists.infradead.org; Wed, 12 Jan 2022 17:21:33 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 r16-20020a17090a0ad000b001b276aa3aabso13552579pje.0
 for <linux-riscv@lists.infradead.org>; Wed, 12 Jan 2022 09:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TYHRM7+kADwOp9diBRrPGp4L0N1LoYL1IUvHa0nGaUc=;
 b=UOi9kIvtR/IrJwzo5niwxDtXudsV6IxInf5Xux8zgZWocQk2IEmaYc0XSVBraMOzip
 1p6oktTDeAT0Xo0Y1Hv38DXQkmSLxGT3a21Lcwuzm9HPptZ8CwyjAsbDUolqExCQJBvI
 3/Ilf2Jr3LSRwS8m0x3JSZhofT299fDyux/e4JRm1BTZb8xRszyzcX2IlMX1MSEgYjMT
 4xhdcYSj8HE0lJizFcqyvQ1F0sIsor9GOdwCIFkIY/f5YjDSO/UpiSWU7FnrM6Aap0Ov
 XAwRUtuXNr7yYBD4h8SO2lxl+txc3ZtlyhAeUA7I20RlONuBzpovIUUx1rYk6w6DmC66
 icRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TYHRM7+kADwOp9diBRrPGp4L0N1LoYL1IUvHa0nGaUc=;
 b=de8S75Y/oBT1Ft+VmAgjw22eduWhIq4430KP/xxySXR8JvvpI6cOIUopfCm+rz8oSt
 Bh3XRLLGLIOeNzs0rJ+ppxuzzR3vyRVUUAYwL/FsXagPdEW2/Nlj5gtIV7XmwlzXmLVs
 aYWwnp8UJPTmjnznC5lq0cteXBX1Uj0WjW1GNbO+zZf66YsO801rrfW0ryjgfl23MlgU
 yOpLcEJexNdZxWP11NmrKnKeLI/iQ6uejCnIfSbZAEe5e854nR1iB2pWzSoELQWOu1IB
 tKk0ulJVZhsavdWCoi1OrnUsdIlTEMCAT58cQJ9OvKjvEDbxQ6RWAoIOtGxoJU/SE/4J
 l7pA==
X-Gm-Message-State: AOAM530j8vSmuYtNn42klYChPUa5mL+W2BymEyatF01cy/JyIqNGm1eK
 ADPl69PWQuDHvzPPal2SJON/og==
X-Google-Smtp-Source: ABdhPJzFOOljTybPaAkOSjlPQwykizLUTnzjLoFkEgLqIZkrqe/Ahlwi51dGj1hKKqsANfiIKGdNKw==
X-Received: by 2002:a63:7845:: with SMTP id t66mr576433pgc.103.1642008090029; 
 Wed, 12 Jan 2022 09:21:30 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id qe10sm7011428pjb.5.2022.01.12.09.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 09:21:29 -0800 (PST)
Date: Wed, 12 Jan 2022 17:21:25 +0000
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
 Paul Mackerras <paulus@samba.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>,
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
 Fabiano Rosas <farosas@linux.ibm.com>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 3/6] KVM: Remove opaque from
 kvm_arch_check_processor_compat
Message-ID: <Yd8OFT80exMeCMVA@google.com>
References: <20211227081515.2088920-1-chao.gao@intel.com>
 <20211227081515.2088920-4-chao.gao@intel.com>
 <Ydy8BCfE0jhJd5uE@google.com> <20220111031933.GB2175@gao-cwp>
 <Yd8N7PFqZbACzh2r@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yd8N7PFqZbACzh2r@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_092131_085212_A81560A5 
X-CRM114-Status: GOOD (  15.98  )
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

On Wed, Jan 12, 2022, Sean Christopherson wrote:
> On Tue, Jan 11, 2022, Chao Gao wrote:
> > On Mon, Jan 10, 2022 at 11:06:44PM +0000, Sean Christopherson wrote:
> > >On Mon, Dec 27, 2021, Chao Gao wrote:
> > >> No arch implementation uses this opaque now.
> > >
> > >Except for the RISC-V part, this can be a pure revert of commit b99040853738 ("KVM:
> > >Pass kvm_init()'s opaque param to additional arch funcs").  I think it makes sense
> > >to process it as a revert, with a short blurb in the changelog to note that RISC-V
> > >is manually modified as RISC-V support came along in the interim.
> > 
> > commit b99040853738 adds opaque param to kvm_arch_hardware_setup(), which isn't
> > reverted in this patch. I.e., this patch is a partial revert of b99040853738
> > plus manual changes to RISC-V. Given that, "process it as a revert" means
> > clearly say in changelog that this commit contains a partial revert of commit
> > b99040853738 ("KVM: Pass kvm_init()'s opaque param to additional arch funcs").
> > 
> > Right?
> 
> What I meant is literally do
> 
>   git revert -s b99040853738
> 
> and then manually handle RISC-V.

Doh, to be clear, "manually handle RISC-V _in the same commit_".

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
