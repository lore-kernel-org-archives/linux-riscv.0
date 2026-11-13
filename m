Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FA8606A8A2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f1PsuJWC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=P6ISGYgj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=Xoil2Oy1BHzaqt6hAMoIwOxPkgehX4Gdma/ZAihtu/o=; b=f1PsuJWCsIi+ceO44zvFJzxUKD
	f3c3QARFKXX8+Y2799f4lrNUIZUcvf8SW4ffWp6abtXWIdndPydQtczc3fpeiCvnZ/8jbhotjeaK9
	8t6iRwXhFhmOXAULUevGIWCBFVgG5zi6RLwwlMVptnA7KkEGOEHs2jJkz/Uq/U8TmGqLTeQ3YVhYO
	LAvwh0LHautSXKW027snZKbVV/6xHMrl1vw0+Hux/XYg4cYCyEGBkgZuFxlHFIW10xG7jnGMbINHK
	bzUO4K4Xu/MMVAYavr58PGt4QFIWlnEwtTU/z4jxe1olIaoaaPXq9c9G0YOkhlzTqNHTsbClwMsRo
	5eyzFffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrdH-0000000D0ru-43R3;
	Fri, 13 Nov 2026 13:48:00 +0000
Received: from mail-pf1-x447.google.com ([2607:f8b0:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrdF-0000000D0ql-3rIb
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 13:47:59 +0000
Received: by mail-pf1-x447.google.com with SMTP id d2e1a72fcca58-8b7cc3f8a4aso665963b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577676; x=1795182476; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ihy3Y1Ag1S58REu5bFFliNMMA5gpdpH88jS//LlU0Y=;
        b=P6ISGYgjAZt1uDXi2bnfgeDFvBLvQ5TR11pCaUpmE7Bni5eltjD+ITI26Hru2ZRYRX
         qKEAzewp2CwtBWaiotceFrImjwc9yc9nxfcgVnFj8/N9HDahZHxAnime4c7F271L+oUL
         85ueNKm7qA4GChT2eTHAm/s6YIsPkD997B245xeDk+DayEXY013E+Lvywi70bJnPdgAq
         FEWnaZdBN75twCgqvZV0iLm1w46idT1qd3lf5AJeSFg4qE7Nww+xoRXlpS563L6CdT1B
         ADobzzLQhsWv8ETsyKB583Zq4iAeWK7Og/uNuNZxf4gEVNlym5lFq8Bjg4twKkGUqltt
         oCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577676; x=1795182476;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ihy3Y1Ag1S58REu5bFFliNMMA5gpdpH88jS//LlU0Y=;
        b=fajSW9/a2/X4w1Sj7TQJkAEa5dhwhHHYa1WJPo4b6pT+OVxGYTo8bqF2Y5BhR9hXwH
         eaNkCPPustfm2uqR+yPsdLcx55IUNU8p2kIdZWvBn+Q5dD2a+E9yfoF8F7MJroZA9cGC
         YGGNb5zmDv4V7e69hJkcBr5T+xQfQzPZlHYjqnHiYkHDirzQgiWfKXSU53wiGVy2A6xp
         7YESp4KVxpn92wY2S1/Y2zIA8nh40BtdPptSuJzrxnjFJj/KWABn1BqtELZtJ1wqS6ry
         wLPR7A4EjlWiPvU3uUmzW0OyJAU1Iti76N4Cd41hOuA1RCwheOu/n06E91AiCSGSDu4w
         J9Bw==
X-Forwarded-Encrypted: i=1; AL+hErEo7yHB0jaeUX9IkGMQ6hSLEPYvI24rZBYGzdvcO6i8RUJvU3vRsbRRMyVrfOUCreZ6Ug0j/HMzvvKdXQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9cs/ToPCqaU4J+HoTdXd3swkBzxuSRSg6Kh97Wzh/uUmn/FoxO
	0U03Tb42SNr+OfJaWh4u+q8uCnjbVqBtd6DVXSDH7Br+/W8UuzNIr6F7YNCCThvEvGjtzp0uI3M
	ZObtvCQ==
X-Received: from pgbda11.prod.google.com ([2002:a05:6a02:238b:b0:cd6:1a09:f41d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e212:b0:3e1:c6e6:d101
 with SMTP id adf61e73a8af0-3f7a76c2160mr2595125637.29.1794577676197; Fri, 13
 Nov 2026 05:47:56 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:18 -0800
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441821375.80587.11807540842100479305.b4-ty@b4>
Subject: Re: [PATCH 0/7] KVM: Ensure WAIT requests actually wait
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_054757_959256_CFEBC3B8 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 28 Oct 2026 12:02:52 -0700, Sean Christopherson wrote:
> Fix a bug in where kvm_make_request_and_kick() won't actually wait if the
> kick races without another non-waiting kick.  The issue is that all of the
> conditional kvm_arch_vcpu_should_kick() implementations are missing this code:
> 
> 	if (req & KVM_REQUEST_WAIT)
> 		return mode != OUTSIDE_GUEST_MODE;
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/7] KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
      https://github.com/kvm-x86/linux/commit/20cf5e54a1bc
[2/7] KVM: Add a @force param to __kvm_vcpu_kick() for PPC backwards compatibility
      https://github.com/kvm-x86/linux/commit/0ee75a9dee9c
[3/7] KVM: PPC: Explicitly force IPIs when directly kicking vCPUs
      https://github.com/kvm-x86/linux/commit/2530231b023e
[4/7] KVM: MIPS: Rework kvm_arch_vcpu_should_kick() to use standard implementation
      https://github.com/kvm-x86/linux/commit/a8dabc687ddb
[5/7] KVM: Move kvm_arch_vcpu_should_kick() to common code as kvm_vcpu_should_kick()
      https://github.com/kvm-x86/linux/commit/7e52636d9c37
[6/7] KVM: Plumb the full request into __kvm_vcpu_kick()
      https://github.com/kvm-x86/linux/commit/5c430e211f4d
[7/7] KVM: Drop kvm_vcpu_should_kick() and use kvm_request_needs_ipi()
      https://github.com/kvm-x86/linux/commit/fd3dd4d9c186

--
https://github.com/kvm-x86/linux/tree/next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
