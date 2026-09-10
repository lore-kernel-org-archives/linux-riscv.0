Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D084AC79FB7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 06:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8ATFl5AuTkFj5KMV+HTwYEOfXewGnWJRjls/9hzMSA=; b=m5Xu65APxA1+GU
	TubdQeGgVfcxgaf++OJUWr3FDv5lblzG2TuXCebNWVepAMmGWXrBkCoPFvpxf+tbS6T4xO74kVpyl
	eCQvO1d5H+Y1ELWt9T/2/2zM8xZuNvONhDpQ8tAZeef5Tzb9ZtjKRx4MhCUuQW0GDU4SroMneL1Xw
	7DQZ3dMFEO3u0rJI07+NdGQMvIBGNROBaoIhiPVbALDADr0CeHN2cfalN3xuR/eXcmYK1/vxlSs5B
	OdWUcfOBpQEk+0/eOLYfUk/hSgPc38VLcLC6Wp3EG96ZlGf1pRd7VAFi4hAw2Lns9eDlVGiCNHarC
	+P/6pXoAjB3ZeTAdPeSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YMz-0000000DWfJ-0btA;
	Thu, 10 Sep 2026 06:34:49 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4YMv-0000000DWe4-0Gvu
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 06:34:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ceab75934dso64933755ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 09 Sep 2026 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022084; x=1789626884; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
        b=jcHLg3DLryz/LmqgqW6DgVA9xbuIk/1iNGYkocVjPj+3mFYXrtbAAHvFE0t37u0+az
         3soVBwmYt4/qTfQtdeJVDCOpblbg5G6Gs2V9jhtWlM+ZyzVPbad4NhotF4bKwTcUkpV5
         EMwJ9uAWGy7VjUrE82Y6IhuDUtJLbY+Qv+epkov9euJCTwJ2gRl4Hu4oBj0w6y/b4/kQ
         Uy2pk7zg/RUHHLv2v1VrujmFNG1u9yz+cnrYEwaajit71h/cCb8aB+ANZISWJpYHfedI
         XrE6F0gXy15T05tGrau4PwDAzEDOld3wnzAe61hy9Ed9PE5obt2mRV8PysT5jTxCfu4i
         /cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022084; x=1789626884;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
        b=m3cf4qFKRR+uNOHxb9NeZOIEPz7yP+sOpO9oFdmkD3qpAL8uOiueuIxGgsWEiiCvM6
         f1L0bcCq2C13D/9DkeVRPzPVngEPvPclNO9W7OmdmHnD4pC4ZXCEVl2uYqTp6ILDAM9j
         5538J26oSrNrLGMrnwn5O5MMvwqued/zs/SeAImRHS2XiUPQ6HwL+L/e5vh9jOtJVI7b
         JfVc8GkbtADbsiiTfPy+YSG9JOkM7pC3sOGDpNjxk4DZHptTJqcMjxvdlJRHCyQMWdm3
         ZynUFytpYEvT6purKAbSS4T76WPqcNR4T6/6+vLvqOSVySDYTYjIEY4vvIaRZz3zv5hn
         pYRA==
X-Forwarded-Encrypted: i=1; AKwUvBzcGZm3kowPEDB6g9Lt93uSqWD6uW22uuydmmi2D2/WBDVN2TDpEV8/UTliSjUAvsvdp9KnZaoXeFYZZQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nUU3rtbCAr0YlBbcn4SlA/muc08ZVkajL01e+O6/T9uEAX5BpM
	eHJmsxhb8a86m8yFBYg7TTtTSaWQP+svuy7UGVWKGCmPcAAXQXd2o7yI
X-Gm-Gg: AYBFou2/JBEd3knvR6UaD9lcHeUMz2Bct8rtNTS6dAVbLmrHspsz6L3F0f2HX71HMgG
	t0HbesCFmnZR3o23JsC9JAfEqDkjzrgaUKBFhUBIsmpNDesld1ZpTo4MrD1VxSy2O7Kv6CttVeG
	j2/xuDN2OHh3BKzdWpaF75jU/9K3hKxpj2D1pC+a8YDLR2bnFbFDwWQ3rkeXftYgw9jNqCYG2Yd
	mPrVSYqqrqAPiUJphoLbqT56mUeQxY2JdL56BrxbaCZ982on7fvw+0RfInjayAkwlpWnD9PEHPJ
	IHWijZGFVljJcJD/55Dqup2JW6YaD712MK7PPVjXy5UvXHmmueAwwY4OTd6AZfpAe/qHgw+JEZp
	EoQtDEiXvY7nFGhXj9NvApd6Arv6m8ZaNqme2pz+VEJd7rSpX6PcbolHxRS/xwbHOEKGMhZNVgK
	g+uldLl2hqtEIVYOmtsun6hubJtTGljtQgPwvzHuH34Pf55V0Awr76y9CyCFPssA1nfzj43KhMi
	N1qDBiVVid1cjDzVJBtc7D8vWjsCzeqQdu8JTE9gAXBQSX9+SCIzE0=
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr57429977a91.1.1789022083690;
        Wed, 09 Sep 2026 23:34:43 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm10434389eec.20.2026.09.09.23.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:42 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 06/20] KVM: selftests: Extend page allocator to support naturally aligned allocations
In-Reply-To: <20260902164123.2546762-7-seanjc@google.com>
Date: Thu, 10 Sep 2026 10:57:06 +0530
Message-ID: <fqzh1xsl.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-7-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_233445_100875_E24ACC2C 
X-CRM114-Status: UNSURE (   6.61  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Extend the page allocator to support naturally aligned allocations, as some
> flavors of PowerPC page tables require multiple guest pages per table, and
> those tables need to be naturally aligned.
>

That's true.

> Take care to align the potential base address *inside* the retry loop, i.e.
> the base needs to be (re)aligned on every attempt.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Thanks for sharing the changes. Looks good to me.

Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
