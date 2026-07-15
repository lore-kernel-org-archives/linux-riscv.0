Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E839C4450C
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 05:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BBGdsjCUToac7tCeWnquOfoCqJ5pFPfzalMsKiXvY1Q=; b=wE52C+ZmX4xEHa
	daW+UstYMOJTZvP5Fa3AU80da9e9Prjn7iqjCzgEZPQTlh+Rg7toewkLYvOqQ/jt4z0KHX46gkrk5
	og9NH2fNAsYM/P82cesiP5jxwqnJtYGmdM6oo28lYDMSS0w4NAo+64fuhZ4MJMCo+n567z9q+j1tv
	c+hVRAIMUT7TLJ8MH+E/7XK9drKf6dOijqu6cTwzpLpXy+cO3pemtg+n52gt0DwsLZOH33Frk7UVr
	EoktOgr+AmP3lw+9WgGQAAinMfY6yTqAFS4vTS83KHlSscvvx7SW4as2DtOrvdGgB658Y2S2OOqGP
	cVL2kJjzcfAq5mS3ze/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrzX-0000000Dmh2-0DWR;
	Wed, 15 Jul 2026 05:17:07 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrzU-0000000DmfI-0IAz
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 05:17:06 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-80e2cfe6918so14846487b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 22:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784092622; x=1784697422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNLVT1fVgoho2VbuT114oTcZ59SH+ODJq/573N6mOo0=;
        b=O9Wot1MrR2W1BcJL/B12o7ofMtUdHCmIOQRJnPQ3vOvg2g+V5OH/7AhJVh1XXpGOFi
         RHvuJCyIRBKeJva6adphXhGozN3YxoC/4E91otCDmfQeUAzOaVhB+/edw31em/IY2gul
         6Oj9NI0DYLp0SuMz0MjSHBlHlMHGj/i8bwj8WGznLiUtOzeoXHEPHzNGlZVQoDw1dI4F
         y1UxiUseXRCv8obVDrp5bqL09H/p7hbusidsfQwnlXDxVZ3rk1PTOwn5/epq+JuMa4rd
         bjZWv2K2Bvl+GQSvYSs6w7hsxJMCWYgirgVCyrgGlxsvG9sWOLyfrGhrdAt2P/NZSsfQ
         kgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092622; x=1784697422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNLVT1fVgoho2VbuT114oTcZ59SH+ODJq/573N6mOo0=;
        b=I4D7cPsIm/+Avkt5id5fKLvCifQ1rek8YvNZrFUEveQTlTMomaJuoavOOlaiKl/dXR
         fWOmddcsN2fTCcOnA45la00uMQW/rnk4/NIsRpbjtY8IwmMebiGgX9GHgANZ52tkBWZG
         L+uBbXDQ/HuGWoqPeef5BTTz9+7PH3YFrcC+fsJhtVzgMz3lyNR5PrvCHnArcGwqgJaz
         QNfBZta03L2xtDCtR31vtRXAEkC4SeSl+AXt97zRZ8J+1gYdH1uWh5yz3SVamnITv5cH
         V+KJmkcQQgjSWzQX0W9Y8cIcfRmXbXNiBRKoUvm5YD8VWuhKN13NUYnuWt2yTAXWHjCe
         YrAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr418LHVJxiq/e+A/TV081tubKqWt1W4U8HkMHm6IK6r9V7cyNAwCD/734rSa0veXGF4dkPayOBFF5/bA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2aYibHMIsveRVHWUstb8kX1E0U3JVjPqKYgw6NfVsJN2fOqTn
	UUBxkF5LRAwxflhsXhw/Y2vhIiuj2qlgwU2bnZ7GkIfSG6ihzz9hTXC5j6HEiVP8LKk=
X-Gm-Gg: AfdE7ckDLGsZMSw/UrGupCyMfQeNxqOC9FOXOqVQHa6uzbZCilGYcjCH7LYmepD06z7
	+4aYvXHHKiCCPmizRQPQuVH4k+RxSO/P0D1jNXWmMj2kkidklusFqmYtwgECRYhN4WAZQwGvs30
	gcBqM37D1zg87oz8bYWiFrEniBhJPu3UteMJR/IQkWa7mJPvYAEgzGd3BHQ4XgBFTpFY/e2iRc6
	suZF7ghsIFDUiuWRmI7yeJyN3oqk0+BIsIvP99ZKmsrk8h1sE0SzcSxX+nnSaH4jiIBt/WenfVP
	TLVUQU+DLkWiRjp+2Yzf+xujWMW18M9vravWtJzpfxz7qUcrqciWx5tM4O1AsSUdK6VhAm5+z2w
	TQW25DJAyEpWzxA76ICRaXvohOaAFhdrE33Y883c/ymm7dCX8R43uBeGDyYQBXISn0oi/NBhpjO
	TLlByOduRaeFIDtXRT1bwa+w5TfNV282tBQ3NMFbaFnHmbGabrlp1u8TQJZGqHlo1hqiYk3fGAG
	hK02bXIk6UFta5AP7XedS/c4upiug==
X-Received: by 2002:a05:690c:e3c8:b0:80c:85c6:8987 with SMTP id 00721157ae682-81e902f38b5mr123274547b3.70.1784092622493;
        Tue, 14 Jul 2026 22:17:02 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm159625657b3.46.2026.07.14.22.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:17:02 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v2 0/3] RISC-V: KVM: fix vcpu vector context handling
Date: Wed, 15 Jul 2026 00:16:19 -0500
Message-ID: <20260715051629.1169645-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_221704_151629_5610823E 
X-CRM114-Status: GOOD (  10.12  )
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

This series fixes a vtype corruption encountered when running perf +
vector workload on KVM.

The root cause of the bug is that the kernel-mode vector (KMV)
misattributes the guest's vcpu context as the user's context. To solve
this, we need to correctly save the vcpu context when the kernel-mode
vector is serving a guest.

However, calling directly into KVM from RISC-V generic architecture code
creates a reverse dependency, which is problematic when KVM is built as
a module. To address this, we introduce an RCU-protected callback for
context flushing, which KVM registers during module init.

This series will create merge conflict with my v4 [1] series on syscall
optimization. I will send out a v5 that has the conflict resolved once
this series is sufficiently reviewed.

Patch 1 is a preparatory cleanup that refactors
riscv_v_start_kernel_context().
Patch 2 prepares get/put_cpu_vector_context() for gaurding the use of
vector in kvm_arch_vcpu_load/put()
Patch 3 implements the callback mechanism and fixes the context handling.

Patch summary:
 - unchanged patch: 1
 - new patch: 2
 - modified patch: 3

Changelog v2:
 - Address issues pointed out by sashiko (2, 3)
 - Link to v1: https://lore.kernel.org/all/20260711015835.767259-1-tchiu@tenstorrent.com/

[1]: https://lore.kernel.org/all/20260528190927.886558-1-tchiu@tenstorrent.com/

Andy Chiu (3):
  riscv: vector: refactor riscv_v_start_kernel_context
  riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
  RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector

 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 +++++++
 arch/riscv/include/asm/processor.h       |  2 +
 arch/riscv/include/asm/simd.h            |  8 +--
 arch/riscv/include/asm/vector.h          |  5 ++
 arch/riscv/kernel/kernel_mode_vector.c   | 79 ++++++++++++++++--------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 10 +++
 arch/riscv/kvm/vcpu_vector.c             | 20 ++++++
 8 files changed, 121 insertions(+), 31 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
