Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B239BC4451B
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2026 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GzuZIaGYDpQDg/FmEXRLy1CdfDoY23Yh5DLOo4aeGwc=; b=w6uf5ZTT+lpH8b
	gBhFyMO9iyfWzpQM4eY0RLVIQKzam2Egmk7kBC1kGa/2NJeTjfI2x+h6FkUN3qY70mADA6evJlsau
	RG21e3wtb6x3qk7UXiUa56rdCo2mU5mtGQwv63OW4dDQSLvTGinCdqaDRY7VkqBrsqwIQmQUY5Gfs
	kJj4IuDqoFbRfV4Zo6wVdWsv7lH1+7z4ulsHvDVbs68jGozdjo5cUWqA5DTYuDjlVu3O2vHxgND9E
	+VFShW+O06Q/pCmv+OIV2Aw3JeaOuIQJfrHZe78URMXZdYrHgjrLvf13ZoTuVhRl/Sbn7q6TNEfWQ
	wPBB/rVfTqYGv+fZ67uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl00k-00000003sSf-1vZl;
	Sat, 18 Jul 2026 08:03:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl00h-00000003sRu-2ckP
	for linux-riscv@lists.infradead.org;
	Sat, 18 Jul 2026 08:03:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4954dff6536so5150485e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jul 2026 01:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784361777; cv=none;
        d=google.com; s=arc-20260327;
        b=jxvUnEyhtfy8Nlba9GvWjNgOaHQ6NsEZ7Z2bfNnIKTGMaTzeDEu9S5BCtpiqNFFQop
         tkxsvTY7pDuaRXA3k9vnwOSXubNDjO+GXZz7WWXbgEFz3qYQq0Kffe3hUPUP+hKQScVw
         k+nIMDhsESe7Iln9ZJ3dD3I2todIHiIzySt7MRA1Rk+xJOaVnlrYSdQL+gqOOS6FfOTy
         +hE40iguBPk14zvltygqbhqYokgX02Lb4/IxemblvEOYd+h53w2UYxJ6sC1Mfv/YvmYT
         Dkv4gixJXThdVadDWy8jpr3+z0HJRRF0NeT/Cw5Y4QlaupGFvA6rxtQnGzyznWCFi212
         h1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Rm7XhSy4D7GsNEFlHs1pBrGpKvn/WVAo06Ys8zEN9MY=;
        fh=IzTCgZFdHGhHOcfTGW7rzs2JcebfFi4Nn5Yeex8CjmA=;
        b=TdRmGIjTaG2It1/CV7QrQ3h/mlooDitUOfkEjZFX8+u23xNfgNhqivuguo1gBHa4jn
         FCAdk94itkjvx/ZnGeQde5p/X/rWnkA8/QpVQNEUP/ZjqD3J5ZejoF+Bep6c9jD7mD1r
         bzbAOF9WnJaHgTL4KSiqOyrn3k5TObX7T0SzsapfK7sIWR2SlMLK/de6jsuD4nuoW74K
         E+v2VBvA4jcTg2Vjqg2rQT1OnrJLEJ6vo4VOm7HueCpcTIvPmE9douqXSxTIRa8WUV1g
         lMdVFjquRL1SOOs9WbwTc2ZO8JI7lixEMDf0M4DVny7Mwk/ykU3Telcyp6hONlHIC3Mo
         3fXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784361777; x=1784966577; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rm7XhSy4D7GsNEFlHs1pBrGpKvn/WVAo06Ys8zEN9MY=;
        b=p4xw7sPglkYk0f4fjGdSEZHUZ5pVNhZIjClDLZce2DXhDxII6aa7rJ5z4KYJLrRLfj
         FFMa6qFd0tFPHfvtoUbTmWcJc3UdXW1qv7pgsDCcfeqW47FxUR5bwF4J6Mr/XdyqNZtP
         upFhaGItiw+X0Pg81pi9PMBLIdWZo2DzZnWkaq/6GzExJD87QzggFk3OPcyLQV89c7rL
         nr9rDPnl8lILW+dlBmaEf8FLWQsi+y6DrCFCv2hxVwb4LLfeXlk94H/7nlJ8uCSbS6gc
         qqPhYY7e3X2irAaXpw4u1sXmQ/e3QBOrIZ5TRDSchMqoZHCo0Fo/z01OJBRRRCY/F8dd
         PJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784361777; x=1784966577;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rm7XhSy4D7GsNEFlHs1pBrGpKvn/WVAo06Ys8zEN9MY=;
        b=ObjZ4Vvt318N1hGxhAWK7FGVhvqjOGNXoBz3GMd4bLpqkC/6udJi4K7PEi169QLYI5
         JU2PGJ/Uz1CD2QeCe4hOC4WsFe6vXzwElWSQMUOCO/cMbPCp5D4JrHWnajRSOgj01cRl
         G0Fct2BTfHbv7WKE/73KXHedw3wr5qtr41Qn61COV/iC6XcZLfEXWsEM1zdA8MQtcpPq
         icTwN0MMvOoIjmbBdh8sc0GKasA2YQIjyf+bI+SOovIdwMUgeJjmP1CpztJzXPKzKAqt
         KKhQnm79C2BaAIBGuO2DlLpnSUzH1Ujc4hE+CUAKasHk1ao6xzitg9HEIqH8lgE1xRSj
         ebfA==
X-Forwarded-Encrypted: i=1; AHgh+RoSD1m318/vULSv2OzBu0scnH5krqPNnjO9S41xYZQ7HwBQ8dBxtClyHOQkGIfS2BrM0nsdBJWlOK12hA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt2JYBbH0CAs0n3pQDsSKNQnsJN0jP+VU+4nzhUa1NrahitsIq
	lGsMF/ad6CD2VsoO0krG2wKn+axvLHIB7p5psqFpSnrUAdL7rj5yRP+HVMKZWhAI5+msmZmCNTL
	ulxSTNt8N/42yKCmSNV5Rc0DUNSrCNEzHvFt56t6esA==
X-Gm-Gg: AfdE7ckGyviAX/2PggC8GaoUaG//4PK09QO5Mz6OfizZViKXyDCgSOJbFcgBTOtFe30
	rJpLtWW0Ac7iSF5rahGNFfMDiYxRWlrj0Wc6dsyVc5TBpxBaDaQhnT39+NLLIwxHxjfyXTJwnFH
	AYFn7BXGOPQwH47uUW6YZ453Zfw46qxqI1Qq1db6bGYjIoSrgJ742kvqbfAOpGquNOXxsIVYX4i
	y5hM7/8WBWX/sO0d0yhD6DKZX1PwbWdOkLSb1Ubg6bJQHt1MZ6KhwYG8yHO1KMFJ8g3Uzj/1vMo
	/o3rGFRDU4wf2IsE9x6wHvhV/kX05VdIV8BUGE2hAjDxa3tllQm2ILrp6XkX4/jLPTnoxpdfoSr
	jZwlJ
X-Received: by 2002:a05:600c:4f09:b0:490:e19b:bd99 with SMTP id
 5b1f17b1804b1-4954a40bc1emr61521315e9.30.1784361776913; Sat, 18 Jul 2026
 01:02:56 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 18 Jul 2026 13:32:45 +0530
X-Gm-Features: AUfX_myMNGzt4ZSbXXn9B7HyuNCD1fPJy5lCNbHrmQgj6yVz1oiBXt5EwnVWQEg
Message-ID: <CAAhSdy2iT3GmYz+n_jzbQ4V_5P7UdfFhmq=BSOgYCDEQ6PPuZA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 7.2 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_010259_946208_047007C0 
X-CRM114-Status: UNSURE (   6.45  )
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

Hi Paolo,

We have the following fixes for the 7.2 kernel:
1) Avoid redundant page-table allocations in ioremap pcache topup
2) Apply SBI FWFT LOCK flag only on successful set
3) Bound SBI PMU counter mask scan to BITS_PER_LONG
4) Skip TLB flush when G-stage PTE becomes valid with Svvptc
5) Zicbo[m|z|p] block sizes should be always present in ONE_REG
6) Inject instruction access fault on unmapped guest fetch
7) Serialize virtual interrupt pending state updates using a raw spinlock
8) Fix Spectre-v1 in vector register access via ONE_REG

Please pull.

Regards,
Anup

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-7.2-1

for you to fetch changes up to 8d9c9b135b5c23de9811a8426257cbd2fa024a99:

  KVM: riscv: Fix Spectre-v1 in vector register access (2026-07-15
18:06:16 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 7.2, take #1

- Avoid redundant page-table allocations in ioremap pcache topup
- Apply SBI FWFT LOCK flag only on successful set
- Bound SBI PMU counter mask scan to BITS_PER_LONG
- Skip TLB flush when G-stage PTE becomes valid with Svvptc
- Zicbo[m|z|p] block sizes should be always present in ONE_REG
- Inject instruction access fault on unmapped guest fetch
- Serialize virtual interrupt pending state updates using raw spinlock
- Fix Spectre-v1 in vector register access via ONE_REG

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: KVM: Zicbo[m|z|p] block sizes should be always present in ONE_REG

Dylan.Wu (1):
      riscv: kvm: Skip TLB flush when G-stage PTE becomes valid with Svvptc

Fangyu Yu (1):
      RISC-V: KVM: Avoid redundant page-table allocations in ioremap topup

Qingwei Hu (1):
      RISC-V: KVM: Inject instruction access fault on unmapped guest fetch

SeungJu Cheon (1):
      KVM: riscv: SBI FWFT: Apply LOCK flag only on successful set

Shengwen Cheng (1):
      KVM: riscv: PMU: Bound counter mask scan to BITS_PER_LONG

Xie Bo (1):
      RISC-V: KVM: Serialize virtual interrupt pending state updates

Zongmin Zhou (1):
      KVM: riscv: Fix Spectre-v1 in vector register access

 arch/riscv/include/asm/kvm_host.h | 10 +++---
 arch/riscv/kvm/aia.c              | 35 ++++++++++++++++----
 arch/riscv/kvm/gstage.c           |  6 +++-
 arch/riscv/kvm/mmu.c              |  3 +-
 arch/riscv/kvm/vcpu.c             | 68 +++++++++++++++++++++++++++------------
 arch/riscv/kvm/vcpu_exit.c        | 19 +++++++++++
 arch/riscv/kvm/vcpu_onereg.c      | 46 +++++++-------------------
 arch/riscv/kvm/vcpu_pmu.c         |  4 +--
 arch/riscv/kvm/vcpu_sbi_fwft.c    |  6 ++--
 arch/riscv/kvm/vcpu_vector.c      | 14 ++++++--
 10 files changed, 137 insertions(+), 74 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
