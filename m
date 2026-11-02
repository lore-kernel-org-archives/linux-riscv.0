Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCCC60A0CA8
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 15:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bxGPjBWm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oPe0IcYv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=wJsnBpTlw8gKB9DxhxCZXTIuYdQsxqypnbwdW6QYPR8=; b=bxGPjBWmIfo408XURbly2hF3JW
	PoLUI6lx99wfIDXToHHs+rd8thMfbTzJJce90FjUeoSazmHnn2xYB3Y+T1g8Aq+NcoMPn5f6rGHU0
	qoiZ5uSb3/wk7PXfg+ozLd64ssBvUpOjtPP7M9/1Sy/10VghV6cLjLsHVpCTjf3aMeVunXHltIDOA
	m+adwj6a++t9O1SmDAxriehJKzSKI1z66FY1Qh3geg9oolwSlv49jAYw19rho89hriK688BB4+SsP
	znhxachaVOlIE+ARKj4dO0QbwotLVBoSu28JKevftqrEg3eJjdDFW1hhO68gk8SCCvlMTrc6SsMlt
	AhxAJpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNu3S-0000000H8T3-0QoF;
	Mon, 02 Nov 2026 15:34:38 +0000
Received: from mail-pj1-x1048.google.com ([2607:f8b0:4864:20::1048])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNu3O-0000000H8RZ-4246
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 15:34:36 +0000
Received: by mail-pj1-x1048.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso2537076a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 02 Nov 2026 07:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633673; x=1794238473; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4vRCplgEoCQN3eUv6q9zSWbIbV1TXU7YJjG5+iZQYY=;
        b=oPe0IcYvzRVIEPSrn83v8Zxlre0REOvLhv6juNd/Yejhv+zHjL3g8CeVoppGvuxmXu
         xYycZfW817swvXZxIunZyYzewVqyVZ16Zw+OTMuRwTlozhUVpD92CFExGr5NH3kwgP3U
         tmZtpYkQrhIoig7e3/4tWMUhe8JNgwCwHRxZzQOrQ1lVF2E59UYbAbH4fTSB5rPkWh/D
         awTXoCdo1EiXQi74VjXLn1m4RkJJi36IRj71F4U5hlGzzqY3BVXLQBz+AnlvSMG30iAM
         eVdipn0/A+l4WraFhi2x0EotRLa2xQE+VmX9Pny7TPG5isBJR9znrpQD5ehtoHfGt1iS
         CdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633673; x=1794238473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4vRCplgEoCQN3eUv6q9zSWbIbV1TXU7YJjG5+iZQYY=;
        b=WIY/iuKcnbWvdWdgLIZ3owj6gpp/ECShU0KgUcoVYeXosfOzMuhIPNFxTJezr0kuDk
         8PdvowZJbuUPszNzmqknnJsp3R2BJ+CwWiskM3Be4yt7WZAUuasBw88I6jM5uzvUg9UA
         hr7+Lrq+7VY8j8h/Ms5wUPGEyDSYCU/Gr6mysDAhec7CWV3bmuJw4/pP51UIeDGqNdgx
         0ZSuN57BAUekbJ1Kfn4+MY4sRkHZGeD8ydPQ+EFlRi4RB1VwAd1GpNi7CXSXfcO6eXG/
         bvO5GdvdyUtfwT7MBnATfgaXZlL1A2QXnovp2ovR3gsfZMpW4NKacyTtDqCo6pC3LtIk
         E1vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwxALzBn97h39m4EUdwggPi9beiudQzbz5JWkvvHSb1q2lgRiZpg3JfxX1gTVfPezHZ3C/QXCYarPtJg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9gFUwBfVhcTTyPo0NDSm9Eio193KQGg+Ig0e6RCckCQqvZG6NP
	meBD0jn7jEUev+fy14PDS0wgbgQRuPh8DjzrPoKZ8PCiCPO8XLg2QP1FtIuBa1YOpVroOq8d/vZ
	fuq1unw==
X-Received: from pjso1.prod.google.com ([2002:a17:90a:c081:b0:3a8:211b:6c8b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2749:b0:3ad:43c1:7d41
 with SMTP id 98e67ed59e1d1-3ae897429b9mr7590262a91.33.1793633673063; Mon, 02
 Nov 2026 07:34:33 -0800 (PST)
Date: Mon, 2 Nov 2026 07:34:32 -0800
In-Reply-To: <20261102153228.240804-H-seiden@linux.ibm.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com> <20261028190259.1819571-2-seanjc@google.com>
 <20261102153228.240804-H-seiden@linux.ibm.com>
Message-ID: <auitiPKnFueBJzPA@google.com>
Subject: Re: [PATCH 1/7] KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_073435_328225_0BA65A64 
X-CRM114-Status: GOOD (  12.15  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026, Steffen Eiden wrote:
> On Wed, Oct 28, 2026 at 12:02:53PM -0700, Sean Christopherson wrote:
> > Drop s390's kvm_arch_vcpu_should_kick() stub as the one and only call site
> > is wrapped with "#ifndef CONFIG_S390".
> 
> In the somehow near future I'll remove those #ifdefs and use the kick
> stuff for kvm_arm64. The native s390 KVM then must at least keep an
> (unused) symbol at hand. It seems that the compiler could not optimize
> those calls away. So let's keep it there so I do not have to re-add it
> soon.

Please read the rest of the series.  kvm_arch_vcpu_should_kick() goes away
entirely.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
