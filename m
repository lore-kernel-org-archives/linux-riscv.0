Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C90C624D3
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 17:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2mOa/2U3FaGu77ylTx5mekXI7b9OpfTPyMAiRVeu/Jw=; b=UGJ5vcr5uXrLuRVfOk+Pbi9m+R
	nQpwvNFyhJ2FmvfZQ8XJ4uaB5xsm7Bargy7bKvqJ99xcG1a3/T54TJrmg5f4uoOwOYQZaByYG//dB
	3ixBLRCdHFOLGXnluZTpUBfkfdRzjkm/YaMh6B1uruGpgOOpWb/CPqNV97UMLyCbQ9rI3xbyOMBKy
	iR3H4TGyz8fGmVkcae12DJdIsyl2c3w/nROaaketWSvRn2mcAv8u1usg1QVKqWoEcJb854UVZhyQB
	6oOQ9aEVbXKY4+lw7RYAuNJ6zHDQRlqe9RvZwfW4j+C/9jBTCQgL7yCle3bMy2EYqVKWEbrRGb1oC
	8Ks+HVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1p9a-0000000FV74-2QB4;
	Wed, 02 Sep 2026 17:53:42 +0000
Received: from mail-pf1-x448.google.com ([2607:f8b0:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1p9Y-0000000FV4p-24b2
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 17:53:42 +0000
Received: by mail-pf1-x448.google.com with SMTP id d2e1a72fcca58-855315ccb64so1214807b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788371619; x=1788976419; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdKJUU1oimzE531v2SlLnET8xKOYeS+3soklD8mAhs4=;
        b=blaHIsYa4LUu9+06G5DwbbvARTfgCgoQvlOJ7txCm1KuFO1w8z84fj4CPuxLH+AKyV
         GZf4ELoAoH0eUoBT/Sjyn6zDkyYo0jJdPyL4GmLAKo1vFBSF3wywaxPuK9Nf/juwBzru
         aQuuDKlGfo6XtQf0b9vzllvKDhzyx8n4z0KOZlF5WHKeNv1IcaMSDQ90eOLio0/n8XMa
         5YAwzc1WnRmu+dsV0h/y29JwFtIcvZPR+MHWs6fMvfd/Gkt8gzsFLySz4qFJp1pmcipe
         zln2FkPBZ77CXV+lG8wT3SBEpElA+bUBnII/r58kCJWMNXNnC+4gTfu4ywAnyNsBfh3i
         FiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788371619; x=1788976419;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdKJUU1oimzE531v2SlLnET8xKOYeS+3soklD8mAhs4=;
        b=CPs3UR7Ck65Dd38xofl7KF4HjLK6GK5Z++GclbZZEcKfGTnyVat36sOwM333dsjxXB
         zghFbjU5EMFRQAXKVSCAsznFC8YtS/0DrXKqRUjXgY4htWJvuOu1oVaqN0/LXezQVsrT
         PJh47L6ZWJNOn4cakC5dwOwbSzu/TKc9CLhhSaWW5AmjP2hxvjytCuRWDVddrnH5gexN
         aBVOqNOs0sgUIxYLJPjNO46+MsmdYo5HEuxKmsm3i5rEE39C0Ebv/tVkEGm4LhTjnIsd
         ZnHa37X5mU8J42plJvbuvoax0Qgo+woiZRUtg9UPUbx0Xs+PNRS7RhE0ZKgFJ26fjyi9
         cRkw==
X-Forwarded-Encrypted: i=1; AKwUvBz09EcYWelBF4OaZ/ygH+a5uTNL4gRlyNca7kvqtNvKKCAVc4+wVyG68KzOTqVAJLbkaX/dD/7laHGplg==@lists.infradead.org
X-Gm-Message-State: AFuF++kPGBvCzx4kob7rSbxhFxZNsdzpNZ9ov9kFjzSj/zhtKxuTS0zO
	HpfATnXyJPI0OPdqMkibQ9vwJ4eCIbaRlPCIkWMkMkH/BEixhcafykKtBkdtL9xuhRVzv1R4ZAj
	78K9mGQ==
X-Received: from pfan9.prod.google.com ([2002:aa7:8a49:0:b0:842:83c0:8d73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:440b:b0:847:9aa8:d3ce
 with SMTP id d2e1a72fcca58-85ed1b0e821mr10816352b3a.2.1788371618918; Wed, 02
 Sep 2026 10:53:38 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:53:38 -0700
In-Reply-To: <aphhKDm7Vx7G5ivr@Gautams-MacBook-Pro.local>
Mime-Version: 1.0
References: <20260826230511.972824-1-seanjc@google.com> <aphhKDm7Vx7G5ivr@Gautams-MacBook-Pro.local>
Message-ID: <aphioo_KTboUCtZd@google.com>
Subject: Re: [PATCH 00/20] KVM: selftests: PPC pre-enabling
From: Sean Christopherson <seanjc@google.com>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
	Ritesh Harjani <ritesh.list@gmail.com>, linuxppc-dev@lists.ozlabs.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_105340_536624_28615809 
X-CRM114-Status: UNSURE (   6.14  )
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

On Wed, Sep 02, 2026, Gautam Menghani wrote:
> 
> + linuxppc-dev

Ah, shoot, I *just* posted v2.  I'll add linuxppc-dev to that cover letter.

https://lore.kernel.org/all/20260902164123.2546762-1-seanjc@google.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
