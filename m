Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ADCE7718A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 22:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mjttHHTw4zMftK/toaGB3s1tQ595b3YglKSTBBQM3fs=; b=qSKBqsTluaKnkKa7heEHGgdeAz
	iKTcQlijYwzgd0aKm1DIpKTijYGrV77iiLQggAIsISIm/HtikVonqNpGJviVB2E07mzh/ftMJNKXv
	JZt5HPeUwVHNDNjafeFUC4rKjGU5gcI0qf7Ll614by4B1NM+9CJOmtykENCRuTZA+/kEuI5oeTdnG
	2moaeF80pl6Tc+mjZHS5Pjkz/51vJD08TgV0jClsb9x/zd4hjx2i1gBRvyPMAVPs3n9da2EhXQPUv
	oiy+TG6IaS3twaZTCG9fXaO970ysgiuHpuwW+QAr4tSU756kiT9muAFdcOJX9FSryKTkw3NY+Y55O
	vc6jQe0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO2HH-00000000DFC-2vaL;
	Wed, 18 Dec 2024 22:12:23 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO2HE-00000000DDq-2CcQ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 22:12:21 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso138550a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 14:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734559939; x=1735164739; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H8/Bx7vVXdjG8Qup6CRv0EW1z1SiIeJxiXGSb6iiEaI=;
        b=iwY+CZTJvvJH6BzMUuH2VoiwmoSyMnTUAhM+aVKPXeGY6VWnj+8T+1fKgcycslebd8
         R9QNMdHzekVFmIKITzIHSaYL1aFHIpm4/qQ2atYiosrFKxs1W0rFUhR3/EaTwhtQJYYN
         Ll1vwCipZZ3Rt24GmqrLH/E9H++DBdMjVgP5KjmPLatQfihCwzD1fqD5NR+MSZf4JZrg
         bxuJ3ACTtLLAOgdr4k1to/VIh+qfRqo9HObKX13zNZ4SnPHn0lnYL0rpaHRTblSW60Yz
         j49vyoLvC5I3aWZt02M87H/RLfBF8Kip3ebsh1/Yk82g657SwGpuIoIl2x4m2AB89csU
         ZEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559939; x=1735164739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8/Bx7vVXdjG8Qup6CRv0EW1z1SiIeJxiXGSb6iiEaI=;
        b=i3FZi7efh020F2rfdtEdxoEVMTaxnaObGWU6DRl1Yj1t2ydaclY6+dyDZf5NMIfRL0
         tqOo3NvGH8eRDLWCO7hlfZEqKHVlgRW0sGEFPaAXfQ47+Vg59iuBGDzOR7QHlwyUfvW2
         maSkNLwrx5pHpzNyy5dW0gK322kB6xeDVk4ntZ9tQ6+5Who4drZ4uBrX8w5nSA77EV8v
         O0zmht4FFx23ysPH3DRYTsErzM/PX01s35jENaFwyI4gSbjFkopCHf3N48XpXqHgRY+p
         t/VewpPSE9uWXMmai5Dc1lLTaICQ9S7y9VVk69j4qrDzpEbuYMS8ATw24WrJDHrxjDba
         CaMA==
X-Forwarded-Encrypted: i=1; AJvYcCV0WZh+pRhaAzxscL62IHUKlxEnm+ag0NzqnhZYIF9T3oQtkl2QViKRIuap8vOiPCrEbCNWjK61weiOhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKhbQ7p2AF24MnKvr/j6cOzrHUKsGl4WH8qt0IdjNuBLY2BlOQ
	REvBIQo4Bg4j8t/yytiLvXI0KaIra74ijL2iJBmg7gjlFylPE5F0ccjlvF0RHnR2Rpu621ZCJNg
	+JA==
X-Google-Smtp-Source: AGHT+IErnWAR5psGjYVEFgNdPO9Ra9c1ykxsWobkdL6749/rPBHLJQjHXddkE3dKVeRJv5MVr7RsZhgUpzE=
X-Received: from pjuj8.prod.google.com ([2002:a17:90a:d008:b0:2ea:7d73:294e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:134d:b0:2ea:37b4:5373
 with SMTP id 98e67ed59e1d1-2f443ce8daamr1395725a91.10.1734559939355; Wed, 18
 Dec 2024 14:12:19 -0800 (PST)
Date: Wed, 18 Dec 2024 14:12:18 -0800
In-Reply-To: <173455833964.3185228.5614329030867008316.b4-ty@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com> <173455833964.3185228.5614329030867008316.b4-ty@google.com>
Message-ID: <Z2NIwmRDaZBc_V4o@google.com>
Subject: Re: [PATCH v4 00/16] KVM: selftests: "tree" wide overhauls
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_141220_571091_C2CFCB9F 
X-CRM114-Status: GOOD (  16.13  )
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

On Wed, Dec 18, 2024, Sean Christopherson wrote:
> On Wed, 27 Nov 2024 16:55:31 -0800, Sean Christopherson wrote:
> > Two separate series (mmu_stress_test[1] and $ARCH[2]), posted as one to
> > avoid unpleasant conflicts, and because I hope to land both in kvm/next
> > shortly after 6.12-rc1 since they impact all of KVM selftests.
> > 
> > mmu_stress_test
> > ---------------
> > Convert the max_guest_memory_test into a more generic mmu_stress_test.
> > The basic gist of the "conversion" is to have the test do mprotect() on
> > guest memory while vCPUs are accessing said memory, e.g. to verify KVM
> > and mmu_notifiers are working as intended.
> > 
> > [...]
> 
> As I am running out of time before I disappear for two weeks, applied to:
> 
>    https://github.com/kvm-x86/linux.git selftests_arch
> 
> Other KVM maintainers, that branch is officially immutable.  I also pushed a tag,
> kvm-selftests-arch-6.14, just in case I pull a stupid and manage to clobber the
> branch.  My apologies if this causes pain.  AFAICT, there aren't any queued or
> in-flight patches that git's rename magic can't automatically handle, so hopefully
> this ends up being pain-free.
> 
> Paolo, here's a pull request if you want to pull this into kvm/next long before
> the 6.14 merge window.  Diff stats at the very bottom (hilariously long).

Argh!  I completely forget to build test this on non-x86, and missed that arm64
snuck in 75cd027cbcb1 ("KVM: arm64: selftests: Test ID_AA64PFR0.MPAM isn't completely 
ignored").  *sigh*

Given that I just sent out mail, I'm going to cross my fingers and hope that no
one has merged the above branch/tag.  I've deleted the branch and tags from the
remote, but kept the tag locally just in case.

Please holler if you managed to grab the broken branch/tag.  If no one screams,
I'll assume I got luckly and will push a fixed version (with different names) later
today.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
