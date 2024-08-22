Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2390EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 14:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T3VEpf5vKSTvgS3BwvGEip6TfmEiG7/5Ax2SuKBVt/s=; b=PCPiF/9tEqYI8F
	Q7sZBC+SV6DByYxJuE+0IffvwYQttTqCdWMipybHuWK3gePLCFgcMD30P36T8L0LeyMwkefbWQlH0
	f1DuOx6Tsmebcpm2nFxmwNKK+vs70PHq5mZtFLr0qnDJ7onjsJV8RRqZfSvsHkZbfvFiqxixh/p27
	tSl+aFHGqGrsmLFAU0HGCFL6R9fofdqBiV3xZO2uaiGo61pau2b9qZbLGb+y3Xq1hT69DOLR95cc5
	ysTbCimTyt08Nb5cSygcFoVvZdFTYhtWdn/HLwAgBOGP0RfL6M5SB4JqesWZbW05GlOz53Ne3yQV9
	XC3ojcU32SWACsVR/R9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8kO-0000000D8ea-04Bi;
	Thu, 22 Aug 2024 14:25:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8jc-0000000D8Sp-1IJX;
	Thu, 22 Aug 2024 14:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90E096119B;
	Thu, 22 Aug 2024 14:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3890DC32782;
	Thu, 22 Aug 2024 14:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724336659;
	bh=0qohOtlUlbQ+S7qqgBywKvuqNp39ChdhI74mz8dd2Dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ozyO7lH51LENj0pz8yJ9fFnASqP4aSjXxFuKZyH76eEZfApci5B9okfoLmHxgZvRl
	 kmY9knEHycx303qDiMZFMJsfJpqn6tVYWhMcbpsPdtqyR08wW7dGyBdAsKT/SPSplB
	 fsLLGJh7rF1T+sOm5wl9+C8L1ISbJpzVAWk59zSHzqRq0uD/9uvelRrd7eTZKAPmsX
	 EE6ZTNoCRSU4stcONEEC1E2/aGmZZLiutDtV3jSzJnNIXTcN7FHtjLNHbi+zf06rbl
	 jcQwthABEVYJa5D5/i7LiPEJzJe88IgPhkFgJFPF1dhSGtFvraxCKRnGO8MM55oKVU
	 JebJWUwYL2VmA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sh8jY-005yPd-K8;
	Thu, 22 Aug 2024 15:24:16 +0100
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Matlack <dmatlack@google.com>,
	David Stevens <stevensd@chromium.org>
Subject: Re: (subset) [PATCH v12 01/84] KVM: arm64: Release pfn, i.e. put page, if copying MTE tags hits ZONE_DEVICE
Date: Thu, 22 Aug 2024 15:24:11 +0100
Message-Id: <172433664067.3702537.13271681605926473288.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726235234.228822-2-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-2-seanjc@google.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, oliver.upton@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, seanjc@google.com, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, dmatlack@google.com, stevensd@chromium.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_072420_787229_BED58968 
X-CRM114-Status: UNSURE (   7.37  )
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

On Fri, 26 Jul 2024 16:51:10 -0700, Sean Christopherson wrote:
> Put the page reference acquired by gfn_to_pfn_prot() if
> kvm_vm_ioctl_mte_copy_tags() runs into ZONE_DEVICE memory.  KVM's less-
> than-stellar heuristics for dealing with pfn-mapped memory means that KVM
> can get a page reference to ZONE_DEVICE memory.
> 
> 

Applied to next, thanks!

[01/84] KVM: arm64: Release pfn, i.e. put page, if copying MTE tags hits ZONE_DEVICE
        commit: ae41d7dbaeb4f79134136cd65ad7015cf9ccf78a

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
