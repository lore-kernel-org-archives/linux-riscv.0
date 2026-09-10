Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D16C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 12:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oq/HZNW/kVwBpa5CnMvLsNw3TanA/AmfKKwBbgX9zpY=; b=1G364wy9Q62JBC
	A0Q5f529MCVpKOeH5t+XvKhT0PalmTEaJTSceRM+oPPhZjhpya3FnqeudPqmNnvc4JUWuxw9vXaXD
	3pBb+aMTJdYAfP+0P0VLl8oWaTszlOx5pVMtz99GOeilwTFASslzFeNBUrYn6XTYUAR1Cze2fsz8T
	UqmmpT7QR1WUL84BFv1XuCTWH4U2+yp4VySdcpnAIMdH32uj15HmNlEPl9BLM/R88pjMLkMmFn4kN
	R+JK0UbS2xUpTSsVA4PJr7Uy2XZaN2X2qTE/mHvxiG716BinLdHg0CTaYkKhsOW7j6hULaiQWfHNy
	aG6nYva3RV7Bo3zwCCKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dX0-0000000EIKB-3INS;
	Thu, 10 Sep 2026 12:05:30 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dWx-0000000EIIp-3Z55
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 12:05:29 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4bdf8acd6so289914a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 05:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041927; x=1789646727; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j5p0fnZhfsutRgdRJoA23rs+n3VC6+9xK2KvWtfvI90=;
        b=d3zaaHPApCf6kyW9z7pmJzrLfKhf29HJLpjSA5dsEssqMWqLIjsj5S0SSjoj5777t7
         H6FMfpsl4EqTxPa3t82q9XgWdMdmO4zBn71X+9BoLOw0coA4b1XzTZBm2V+BXsMz0eah
         cxq6I+n7hbeewF8jWQmKF0N/p4XNbWxiuOwfEThdwUKJL5PlMSTJFepldUcvon7UgCg7
         LFTrzpjaczFO3/YSuSXPZLnC8hEZU/IwI29ksZlPynEM10ctOHFqvVLVqOsO3UmhUnO/
         qCbRrP2BvpKoPgpcPCNW24Hj16/9E8UoqNQiryr+Ii4aJ1wDUpzpStB/iWgGdPbVD9c8
         bffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041927; x=1789646727;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j5p0fnZhfsutRgdRJoA23rs+n3VC6+9xK2KvWtfvI90=;
        b=CCx7Izzllls8HrQasSQqw4a6Svk2O8XcMc9503wbke9BntbWY09YaUjOAf8xG4eP8j
         9VSLyP2xUYbis7rDroLtoh+p0Iyx7UNYHTG7k3GZQnWgXDejVwuWQBDAaiHQ5KAK1tgd
         Z6b4R7KsO6OQvMXRIJvLIM2Hn4ZHIzQ0x/2ctuVcODDnxvcrprsJdK/s4ZKilbWAnkoH
         EoO3uXakBGNLRy9ZtoNFVmRdbI/qjO8MCWV0JbJ/blvseY03CIQtQ4Vfhyx2yOFxd42U
         qqil+e8r65eL5xUdxXcmOJ67CpsrdpoFXrB/wLkNjP2Im7y9LDHrctqWbft5PoLlc65O
         CZoA==
X-Forwarded-Encrypted: i=1; AKwUvBx5LzBM0v1nkcY3cWuZmqUax4i3uUCuUvCr+22wq9FKbrYlxe1nIId/w/oDY3AiTtToYAB+HXE4tMPJzQ==@lists.infradead.org
X-Gm-Message-State: AFuF++njwa7NqUdsnYtBOa63evdFPokBsdyVtiEsQYot9Ys0HBZkqyaG
	dDhqAG4bTCFq36VwqLpGgqrq8WUDUYFitjkTMs4WiDNo8Mc5pKa49TfPN5AE0w==
X-Gm-Gg: AYBFou2OxhxZ1TNvBZtv5locPmwZDJNFjClsG8xdy5Oy9pXe9yMrGBzIJ/Iewoejozu
	dgddNnHYc21BhvNuLv1/kPfZCQfdwUuGZ17lhiNMqt52O/ZYUKAATtPXvXpRFKtziUHRIWmQAcZ
	8dVR0+kKBQKoP0rtNb+nbbCAD50+fTigHFeFcAxfQhJ4PxtZd0wP38HVcvuzmLN0DK1Yg56ZFp0
	yodu6KhK/I4wZgf1JzNeE/McaXrZgHDcLUvuTvYkwdoQmrSTqvi7pv5u2yfxhY3qb5QeKuAq3T+
	BsVHfZ1WwgDJH7Z/8yRHLObgRMkrzrBgphpq7ZGnO1sSM3KDQFqhE2zt5FOujhvBeB4x+1m3VHU
	P7mfv7UoNx6AtlM95qkvTANaVKFpFfAH5TSZB+YRblJeaCOcROSYJUVyBbAAJncZSOCMvkuG3cF
	ypPFhBfuxooGEjZ7VQFxh2+yVX9pTYjAANSGQfcA7g6eR0iL/Mk5A6kppWacF9r977tuCyak7ap
	v+GdJTkdSZ1YW6aIm00Bm0iT2W3N5H3p27k7CkbxDNjAi1tT1n6KHk=
X-Received: by 2002:a17:90a:ec8b:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39d70bb1bd0mr11567376a91.19.1789041926812;
        Thu, 10 Sep 2026 05:05:26 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm59190560eec.21.2026.09.10.05.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:05:25 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 20/20] KVM: selftests: Add arch hook to force page tables to be naturally aligned
In-Reply-To: <20260902164123.2546762-21-seanjc@google.com>
Date: Thu, 10 Sep 2026 17:27:18 +0530
Message-ID: <zexpz5cx.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-21-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_050527_889417_83597DEC 
X-CRM114-Status: GOOD (  10.48  )
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

> Add an arch hook to communicate to the core physical page allocator that
> page table allocations need to be naturally aligned.  The hook will be used
> for upcoming PowerPC support, which has MMU tables that are larger than the
> guest base page size and need to be naturally aligned.
>

Thanks Sean, for these patches. I have addressed your review comments on
v3 of PPC KVM selftests support and ported those on top of this series.
I am still in the process of running the entire series on a real HW
(and some todos/minor changes to be done).

Will soon post v4 of PPC KVM selftests on top of this change series.

> Bury the hook in the physical page allocator to avoid having to plumb a
> rarely used param into the main APIs.
>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

As for this change. LGTM. Feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
