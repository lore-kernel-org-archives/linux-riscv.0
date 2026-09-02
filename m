Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15532C624D5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 18:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGV4KR8Fs51WTSV5ng7gzwzROe4pf5T7SBiB9Coalhc=; b=H3B7KJ5wqS8fRV
	00iTpENjAtDlCif/G89K/kmtUv2k1xFFHoqbZPkN/5529xv+Hvpc/sG9BFWZj3BDiCm68LUN8jMZn
	KV/t/7m6COUHLQD9+1tx8+48tS4Te6bsdwwNkyLtOx0R5O6CeWimXlrV1s6wr39loFLuqRMpIvfkg
	sd2d6XnrNj3ON9cBKQLc42w1pDKfIVrejVCLh34VLgWjdyNPodF7S5u0GDnVt4rBvM4+/hUoNJKI/
	oqP4hLscfk+xqWwHSRhdCEzPHRZ2UYkVYmohn5dkCuoLaJufUrtBS+GfaGCZoIYmBreCH5Xdxd4z+
	1dLoq8U6HVjFwZveldgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pKw-0000000FXXl-3lZK;
	Wed, 02 Sep 2026 18:05:26 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pKs-0000000FXV6-3EE0
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 18:05:25 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1313691a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788372321; x=1788977121; darn=lists.infradead.org;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=;
        b=PuCaPRW/QVNgvt3V4HGNaA40SBkfx0hCDEI0+0BIbtZiGO74GfNMJyks9mLSHYMJD6
         u2LJJzGUT9Ia+t4HUUuNTyu/LOMHrdbarAcLqPmQ7CGLePigFbjywd+tHJ+HUP2sZDzM
         AoI/ZIy42MP/Z4UgOPre/XJvo/s3DSfSxJ13vbBliXDnudGUTf7xftVwZDNCGCfuOrQl
         MmpSMnF2bnTXw5bsL1Lf74naqrJVcwOiPYehbsCT56bvcxogZlyMyw/2/xO8SU/89nHv
         MO/I8R92XrVdSHh7lcHfemTfpzlJopDkWMVQ3lKt7FCZtX7h+eeWJumGWuqveqohMbyP
         tfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788372321; x=1788977121;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mIy9w1/7l+YPH2gFOr27PV6p4ska6UcSUlBoAUwTOLk=;
        b=FXZ5EzaG0Raa0boG1fRIdTl5e5/DSl2iS9Cr4GugB6SsmetT7X/jie+DgEzUBis59W
         0NzES9myUDxlODoy4dpMMiPpDaUrGEyaHeUUj0GXbq3cMfzJOo7dZi1lUCLoVFK1Im0k
         RdTI6EbXbiGltOwfA9sTOmiczNgZsCyK1wYYJmqCVG/sZWMWXPFYC0m947nLHDnXs/BU
         oU8keWUwEFdDECk4bLSy6Et1Eibq3VNy2ofUCmTphOn5ITrl+/ro8bmNP/4M5wvw0g+L
         ymcOdgb0OKv27isA04oJ93yIYfbZ+X3E67rowUshzsmXBsfIyplzANo8mJWUnqyuJlRa
         vBww==
X-Forwarded-Encrypted: i=1; AKwUvBzBiCLbOo65oZ40QOwGXgLSVijhXy7e5iqnaA15kuu7fkNAnfO8eudNFUiVzeVuWl3Yv+tTWD0jS9D5yQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lEWLnBQ1r4PS2ZP8752hw+pUNLADlRrM9sLj5bh9u5tBt+A/Xq
	8TVE6NcFsgzD3bSFzT2goh3jhvJG2YhyKChXKEWo0T1/O0WXeiy2Q4ES
X-Gm-Gg: AYBFou0gAMNysrH88NkMt2RIc7SKMFrutcXEDitb+Hcts1vsKw6X3O1D4N7wjh8zWtC
	+gbap7ROjp9YiubESxOo3NL8bUU1QcBsjwdKGdsMIWpyWR1gMOtHK/Gqa7SrB1ZsVjUZyUDyYE2
	Pkly6vn/m4Sjp1XI9BFRSRZ6aOYKH4+RQboAHlfwQjda6hVBXdC8+hvIgHqYwBmlfyrl40S8XqY
	lgQifX8I+Rx+HBhXVH5jjWc3uZiTMoT7wD7BlLpFJTU9daUpCG5DkebRMA1POHCJCHrcj4sz2Co
	gAAt5aAVgqRWadZmcercQQ3H/7OAhgEqsyu6dIr1p7OQQJ1Zs5wTq2DWyb6HW3pEHi85NqE3Xv9
	PRoGEVei8aGWv/NGGLAS4KWMDnkROSe62Z/MjLHhvi/EGBiaqDOBrhrCb5zuhS1bCzn8nZ2JSnu
	B+Q2TefjDPDgWk3Wz3f2Ql5vvDXOGbFHqyfQuh9TTwMNNqMcqOfcKALLvThOAs/DsgAeLH2QH/R
	35ymwRnNGeR/aByL530Pb8XIhEjogFufTFV9WZHmT9L
X-Received: by 2002:a17:90b:4b89:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39aee105a46mr9138561a91.18.1788372321290;
        Wed, 02 Sep 2026 11:05:21 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b79cf9sm9808273eec.18.2026.09.02.11.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:05:20 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Gautam Menghani <gautam@linux.ibm.com>
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
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/20] KVM: selftests: PPC pre-enabling
In-Reply-To: <aphioo_KTboUCtZd@google.com>
Date: Wed, 02 Sep 2026 23:29:06 +0530
Message-ID: <h5k7ttzp.ritesh.list@gmail.com>
References: <20260826230511.972824-1-seanjc@google.com> <aphhKDm7Vx7G5ivr@Gautams-MacBook-Pro.local> <aphioo_KTboUCtZd@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_110522_807300_937768CF 
X-CRM114-Status: UNSURE (   7.27  )
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

Sean Christopherson <seanjc@google.com> writes:

> On Wed, Sep 02, 2026, Gautam Menghani wrote:
>> 
>> + linuxppc-dev
>
> Ah, shoot, I *just* posted v2.  I'll add linuxppc-dev to that cover letter.
>
> https://lore.kernel.org/all/20260902164123.2546762-1-seanjc@google.com

Thanks Sean for sharing these changes.

Thought of sharing an interim update:
I have rebased PPC KVM selftests support on top of this series and the
initial tests ran fine. I am currently looking info few findings though
- but will soon rebase those changes on top of your v2, review that &
update the results.


-ritesh


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
