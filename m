Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B654C52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Aug 2024 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioOAIEwL17z7e1Mg+qUnz1dl+/IET/DzoHscdq3EfNM=; b=23wqoyyhWpmeXP
	wmX32R5/3Zw1l32vtda+2N5HBiR80MTk6lpczjFBaRpIQqFq0IwGZYd+06kfd9DRgq/Dj0BXo8Ajd
	zAWNEixAJVut0PJ+gEmiAQJhtBvxX/cd+er3FjNl99cTBk14+tXfDfidbPeY/TvXUCynx+JxDG+Tq
	RBKgyftJid4s81AbLRaXOCllnx8z/iOZPRZq35x8hr4z+3nRvv9fT7EacxkiicYpDFX8cMRXLA0gO
	mQv57ImmN4oU5yESQLsv8NxoVIeeD5ChRVxUcv2AtdPMHnwqfrZFgrcPu1t7ygRkw64Auw45ZnkXw
	otiBFZj5cctpwzqksH+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8l8-0000000D8xo-1Xob;
	Thu, 22 Aug 2024 14:25:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8kJ-0000000D8db-1NOi;
	Thu, 22 Aug 2024 14:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E66B6122F;
	Thu, 22 Aug 2024 14:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C97C32782;
	Thu, 22 Aug 2024 14:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724336702;
	bh=//vs0/j3dL5aitkeEHYmbgKTgUS1rli4/RnXiCWDaiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mzydcEVwqkNhOKyJ5orBT6Sxiv1o3CueKVoCZOlKhB05hbfqLL4sRKMuFCWl3Pw6u
	 RRseBCTvZyCyCoLYr0nNUMCuPOOIVvq5vPvNsK+Sq4f9+d1ZOsnRLFCwa/7/Svz+7U
	 UnNdivfK/+izhZv/9R4l2xx7bS71Lmmcj0fMTebbQaShjAZYSIeCBaUWBYmh0HwFMH
	 h0axtuuZBYajoYjtLRupBGNS0Cz7je99YbSxJY/5mRCFAyAQefFTDdwQgGNA25wZEk
	 z2NtC8y+9AZo4jIXZD72NHp9laSWfTbJqAhMdUge6Qe1Srqq43pkpMpq2NO5+/NSVR
	 Morx7oLq2+asg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sh8kF-005yRg-MG;
	Thu, 22 Aug 2024 15:24:59 +0100
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
Subject: Re: (subset) [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest memory while KVM is dirty logging
Date: Thu, 22 Aug 2024 15:24:54 +0100
Message-Id: <172433664068.3702537.15170661496841359831.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240726235234.228822-3-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-3-seanjc@google.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, oliver.upton@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, seanjc@google.com, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, dmatlack@google.com, stevensd@chromium.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_072503_585355_900DB883 
X-CRM114-Status: GOOD (  10.31  )
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

On Fri, 26 Jul 2024 16:51:11 -0700, Sean Christopherson wrote:
> Disallow copying MTE tags to guest memory while KVM is dirty logging, as
> writing guest memory without marking the gfn as dirty in the memslot could
> result in userspace failing to migrate the updated page.  Ideally (maybe?),
> KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
> and presumably the only use case for copy MTE tags _to_ the guest is when
> restoring state on the target.
> 
> [...]

Applied to next, thanks!

[02/84] KVM: arm64: Disallow copying MTE to guest memory while KVM is dirty logging
        commit: e0b7de4fd18c47ebd47ec0dd1af6503d4071b943

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
