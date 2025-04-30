Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBC4C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 05:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rc0t6Ig8N6s0c8KaSl6g44P4oBXuS3a+5N+FpuDoASQ=; b=gHNG7Ejszde44v
	hevE5n/CB1t7Pq2tzCCh+DGqjPr5V1Y6nMNJR1CMTPRe2Y+HsI9hmQ0AwrFbLVMiWmt2tBY5fuf6a
	y3aEdI5sZKmYPeCsWvs/Z1DbuteuBdj/iSs9fbgda2IegBDWNYDI9It56rKwTzDsEIDLVYavK/szz
	RYgMPKhTveVvPzjjUnIIwTl4Qqaubu3kqt6EvAkummhR2BZWN0HDdtOOM3oS1V2LNP5ZhuS3MeX/7
	Mo6Gq877AgV5dCF4/ViSIWEo0zuRLRAh9/Zs3AKOKiBX5e7X6XvHS+GJfvQqm/Nd4Jw2H1eJ+vOff
	AAEuIFQaBw9SDuTUUBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zny-0000000Bj4U-06HN;
	Wed, 30 Apr 2025 05:16:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vAK-0000000BHz3-1snx
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=h9CDC77dPHm0sLL9zARbZU/pLEdmRrLjaN9hFpvRuxw=; b=QAqy2pROC2Up81o5gFIsYenNSL
	NqSSxGxuKJOlO1zLvgvFnAdWfC1IVDa5JJY5yNtolLn5lxro2FvqZWT+3ZUu1HTM17h0T9yKftafB
	Jr2vAXLqB9MFMM+mTWz/2j1VJGAagzuNnL51A0iqxiEFBqjcEmv4FeW0g2d6xpk8SYM6BudH3u+OG
	oCeWWwGXnT2/rRtbcspHlPfuqEsjRbxqhvlji5RgZBJPCh5cCK4k/sOW4wa+mIfd/K1NDTpcO0WOn
	9K3zt9yw1Q/qsNoSunlaAZay6hdU4lENU81ms8d2G3LYYZ9XVO8vs5t4TCmOY8CPhbCajw1Nu1lPu
	7afsx25w==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9vA7-0000000DYK4-1MSj
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:19:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22c336fcdaaso80324555ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972332; x=1746577132; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9CDC77dPHm0sLL9zARbZU/pLEdmRrLjaN9hFpvRuxw=;
        b=TnqN8N3UcsiIaiMlXkKQCz25bU1Ob1EeTUVHqXQFCt4gIe8in79u/KY0+r2+XiHmTB
         f3z06pg/Xiup3iFqcbpidC7qwTYB6qEd4UlYrUGF4kWFdfjqgq0kvhQt4rKGuIGDMBSJ
         CyN+47QaF+O59bX7L1XLqNXIzHMQ8wXCzALbtM8KR12vT6+BtT6p4k1ZdQovnKYhpa9a
         6muSiLVhEAiW7AijaGNGTxg4aQLCr3kZ0xJzm8wT/NDlZ6sjGhvN304w2lDJGoQ7eCbZ
         qvt51iHakHE/JnblQRZL1pjwb8cTs2gNrWKD3xgBtFAyM0W2IkKe/5Hw+YMrxgsVtd3s
         +zHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972332; x=1746577132;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h9CDC77dPHm0sLL9zARbZU/pLEdmRrLjaN9hFpvRuxw=;
        b=pISGt1vs9t/LMJmeDTlULfz+Ruo5xzdH5iQZPQ60xYetrQK9zhZuubdO8z5GlNV0x2
         b8eJai/h7j8LrzLbbbtw9TawdpXAMW/u8kHErcObDBh3IHDPTDuSlbnxMfRsbl+wrFeB
         9axoImbTxdkYmiCtnZulHnKQqiFEJwj0Z75CewPGXz4+5lbkP0iR0fAfeIhcLopDojry
         iVhWIACATH5hgeiaFt5AmOI3doTE5g3OR9Xi40VuQIL687fL92V326pfdwoCj9PHQril
         rqXDTO7+enuG6JsQ7mRzfJ7KjdzFQx3/q6PfTgX8+8T/xgKtl4C+UExUBGTKgy0M5mOZ
         R6QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUAHipZmljXRQl6yIQWM1cfmQK/ZfmTFYZSjpBuD91HGYen9FlkkIBYp/+P1lm/Q7qN3YajbcYzH5Lsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoPNoi7KnVimDhj/ZOrFxQRUv16fzD4wM06b+CRHq6uy97wLqT
	k7xSPkUOOx/ug1GszDYon+hRelyL4rgBnE/Ur6+MjA5QQT67CuuwT0VyN3RxRRM=
X-Gm-Gg: ASbGnctpkP/DsGDiUSRU8EkM5DxfL2j83HDFUsPZz8tKF/DYims7rKBhgisdfD1Dj+o
	ufG3oFOVc2XeE3ww5+WWDtgkp/kjcRQ7zrj8AyJerhaqf29O7Io01zssP2mPlqV6hccakw3uxTJ
	f4G6IOdTk9ivIJc/HIsAdbvr5mEInv7EMKzoaemAYvwqFfpntdeij1TaVDX0aEtxl/gi5wd2iUb
	8hYI3dVVL8mkmzh3hUJw7lkatt7b/qA5oWZFlAFAmM+5sGuG/BOOnFSw85s2YhoUwNNaovYHJhZ
	3ohw+qUNuPff4Y7KJZ8U0QwjZPBIsGJ/A9JYLgcpPLw+k+doOFmgQQ==
X-Google-Smtp-Source: AGHT+IGcjNS30ZUbgOqbJ+3hZtDKq2g7yhYNKy+e5TbCHxGgjZoKOda+bZdglX1wUFE80tZeA/2XMA==
X-Received: by 2002:a17:903:1aaf:b0:224:1e7a:43fe with SMTP id d9443c01a7336-22df3585814mr19158975ad.46.1745972332359;
        Tue, 29 Apr 2025 17:18:52 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f68988ca4sm1907790a12.74.2025.04.29.17.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:18:52 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 0/3] RISC-V KVM selftests improvements
Date: Tue, 29 Apr 2025 17:18:44 -0700
Message-Id: <20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGRsEWgC/4WNXQ6CMBCEr0L22ZpSfiI+eQ9DCLRb2Sgt6TaNh
 nB3Kxfw8ZvMfLMBYyBkuBYbBEzE5F0GdSpAz6N7oCCTGZRUjaxULZ5pGRhfNiLHgZY1+ISim9B
 MnZVjayrI0zWgpfehvfeZZ+Low+d4SeUv/SNMpZCiuVRtrpWdqe0tUPJMTp+1X6Df9/0LFkf1c
 rsAAAA=
X-Change-ID: 20250324-kvm_selftest_improve-9bedb9f0a6d3
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_011855_543776_C19C3A5E 
X-CRM114-Status: UNSURE (   8.74  )
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

This series improves the following tests.
1. Get-reg-list : Adds vector support
2. SBI PMU test : Distinguish between different types of illegal exception

The first patch is just helper patch that adds stval support during
exception handling.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Rebased on top of Linux 6.15-rc4
- Changed from ex_regs to pt_regs based on Drew's suggestion. 
- Dropped Anup's review on PATCH1 as it is significantly changed from last review.
- Moved the instruction decoding macros to a common header file.
- Improved the vector reg list test as per the feedback.
- Link to v1: https://lore.kernel.org/r/20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com

---
Atish Patra (3):
      KVM: riscv: selftests: Align the trap information wiht pt_regs
      KVM: riscv: selftests: Decode stval to identify exact exception type
      KVM: riscv: selftests: Add vector extension tests

 .../selftests/kvm/include/riscv/processor.h        |  23 ++-
 tools/testing/selftests/kvm/lib/riscv/handlers.S   | 164 ++++++++++++---------
 tools/testing/selftests/kvm/lib/riscv/processor.c  |   2 +-
 tools/testing/selftests/kvm/riscv/arch_timer.c     |   2 +-
 tools/testing/selftests/kvm/riscv/ebreak_test.c    |   2 +-
 tools/testing/selftests/kvm/riscv/get-reg-list.c   | 133 +++++++++++++++++
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c   |  24 ++-
 7 files changed, 270 insertions(+), 80 deletions(-)
---
base-commit: f15d97df5afae16f40ecef942031235d1c6ba14f
change-id: 20250324-kvm_selftest_improve-9bedb9f0a6d3
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
