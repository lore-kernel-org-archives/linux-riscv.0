Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE82CD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AfBXoBuuc+ObjQOwSTLnrMWVbOSdUd+G50ziON9t/CQ=; b=t5U0AesRgscvi7
	DoIC1DL7+sIgq9gE45bHhhzetM7pAwaV8Cp3qdahxxtYWXTrPmQiAqgA13/ASrMalgtj8MyB+ogj6
	AaE87W3MW0tsyCXFtElk+3B1ZUwti12R1C/vDISnxDska9yPQkgSYV042VsW2i0yFOlzChS2FEigv
	VlIIvBa9u2++A0J7XzNQNO8bwkgjn8ubm8WUVdUOyOLMwqtFt22YJCaY+FQIm+qShXm7mw4MmhjN9
	zkuQPoZzq+TW28cCyFJTSAhASa02my04LIKdNMBRbxUcuETdRq5npvOmdcDJ6K5OK2DU1AvwHy7Xk
	q6nQA9qCrjnyPKALOWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFa-0000000AO9Z-2yH2;
	Mon, 01 Jun 2026 08:43:58 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFY-0000000AO8s-1mDe
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:43:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-841882f8f4bso3298244b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303435; x=1780908235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bMOIBVqvBN09I3lKcw/r64Gz2Mu49nZfhySphfExOPY=;
        b=QuYUI3PXY4HOoELxreEmrTOC3BYWKRgNbyd72eALNq0/M+sjp3p7IdhsiJ0SyZ81kc
         LmTOQ7p8azo9hDHoAJKtxhJkz3XZpSMaHWOfEN4a2tMbXBNiRoj23hoztCDxAUamE2dm
         kDy4bgSbnu2hUVhnoslzDOCxjhnWTthtNOidi1VhmMGvyrsua9YXu2mODkL8ipQcOelR
         sUM4o+9j3qlKY7PmPcdlOPctFTmONltyu2/xau23lk4aWJqUv57g2EDRR/JLD/VQyLMS
         gqLZB+e8b5Ye/5eDVcrv2DwWMyYJnkEtmnhmSpO9lsYcgiV9K9aZPEUvMw3cmXXfFqDA
         smIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303435; x=1780908235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMOIBVqvBN09I3lKcw/r64Gz2Mu49nZfhySphfExOPY=;
        b=g1sPL6Kl+aR/hs/HS7cozPBu1eCW7vLBvP+iVJlDhuAmNLqXxoXOhqRvCwQv5uy109
         F8M83IMgi2q8bUbDC0i7Iv4IcuuUpLKO4aa+YDdBojnh9JqEKfljtQvvqEZV706VGsMK
         8z4kvFCqqZqlnQEYv4KczrXwMdEkn81V2BAND2oymX0YtbbMCo1tltGaZ+9kzjzw8g/y
         Xzvo20YPyy3RCcwasvRXhEba6WPAUpd/R66Xw3qFAdToQjIBqI/iXiEPBHl8+LV/xcDq
         n4mRx7rUVs/3IeMgXCOb8+W2SMzGTpVVVoswH0L+bV/scktOQ87g2zEGFerpDykN9mKQ
         k3Vw==
X-Gm-Message-State: AOJu0Yzfbi96KlQ6VL7822oYw+vvLJaU5H5UNuv2poq5G/2DscNquavB
	GXJzrYFvZAISSLXfEJW8vrz3ga0lmJExrSftr62wlLkaQrczMcfKX0MV
X-Gm-Gg: Acq92OEQmp+LHTRPfRbH5bAeSamaLySAgW5uOj6o3afmHKJXaymQ1nAuyjKjC+NKx6T
	RGYIZ6FsW1MksK2GeWCnI0D/LCYKq/ZPAbUGzWm0L6aee7qoTfqG7H2mILkMfpKAgKYSqbbDW2G
	BdZWeGc9vwE2radUxMovNy0hSbWmWRCeXrE39DFJoRrsbn5UxQhgmMx2XdcBNt/prAnXUxWt8/5
	mFa5EkcREfXzlkYqDsKm0f5TaZdUdN0JslytwGFIT3DeY+/0EeD2PZwqQ6BU7ooDfoCzuZERrI7
	6Myn6qHEMPbyuavOJDTzZdf1f6SjNt4r2fnwhtO0IIYHvP7FTq+JCAgvZPgxGjRjJyHQB0ZP9+i
	FCcmqd7oa4cWLwKwzu8ZygWhouQFYP1FNrgaOziuMdbMQpBanvR14ti1Z9zM6HuGdWHzbEKflPc
	AGhY9YmMBaQTcwAMdj2BrDMxrybQ9FDgIqgQ==
X-Received: by 2002:a05:6a00:b50:b0:842:3aee:12c0 with SMTP id d2e1a72fcca58-8423aee3251mr6260126b3a.23.1780303435411;
        Mon, 01 Jun 2026 01:43:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8423828159esm5376710b3a.35.2026.06.01.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:43:54 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/7] RISC-V: KVM: Add Svadu/Zicfiss/Zicfilp FWFT support
Date: Mon,  1 Jun 2026 16:43:28 +0800
Message-ID: <20260601084336.2601675-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014356_483316_8B1CCEFC 
X-CRM114-Status: GOOD (  10.13  )
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

This patchset based on the patchset "RISC-V: KVM: Add Zicfiss/Zicfilp
support".

The patch includes all the function of original patchset from Quan:
adding the Svadu/Zicfiss/Zicfilp FWFT for the RISC-V KVM. And this
patchset already passes the KVM unit test.

Changed from Quan's v1:
- https://lore.kernel.org/kvm/cover.1764509485.git.zhouquan@iscas.ac.cn/
1. rebase to the latest master.
2. Split Svadu change as separate patch
3. Fix all build error from the original series
4. Remove the Svadu check in kvm_riscv_vcpu_config_ran_once() and in
   favor of the FWFT.
5. Remove the LPE/SSE setting bit in kvm_riscv_vcpu_config_ran_once()
   (kvm_riscv_vcpu_setup_config() in original patchset)

Inochi Amaoto (7):
  RISC-V: KVM: Add support for Svadu FWFT features
  KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
  RISC-V: KVM: Only enable Svadu extension when Guest/VM requests
  RISC-V: KVM: Allow Zicfiss/Zicfilp extensions for Guest/VM
  RISC-V: KVM: Handle software-check exits for VCPU
  RISC-V: KVM: Add support for control-flow integrity FWFT features
  KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list
    test

 arch/riscv/include/asm/csr.h                  |   1 +
 arch/riscv/include/uapi/asm/kvm.h             |   5 +
 arch/riscv/kvm/isa.c                          |   2 +
 arch/riscv/kvm/vcpu_config.c                  |   8 +-
 arch/riscv/kvm/vcpu_exit.c                    |   3 +
 arch/riscv/kvm/vcpu_sbi_fwft.c                | 142 ++++++++++++++++++
 .../selftests/kvm/riscv/get-reg-list.c        |  22 +++
 7 files changed, 179 insertions(+), 4 deletions(-)

--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
