Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A4DC369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZQgYQlarqU5h5tmCntRX+QclA9FTEgEUJ83ZYQBZ6UI=; b=sHzDBxHi10/CZ6
	UAbrd9sK7txTiWC7aoeTQkRlcRLWUObnHPk4zUDG22eJONxKwduzu+RaKKJsZ7Th34ppFx6NMunR6
	XBTZKPa8sycBHH2QSXEm19Dfeaqz4RnDwdyo6ru4s348jgBRUGeYflZvVq51QGeN6P/KLuUEAKKp+
	t4PKHb67qFLbg0SYTyvsKvSQuqkwRCsYbHTZpXhE8clJGNzyYAEbWYRefhXtFKjJOpgUjcgjJOYYL
	m/HV1bl5ZHHrFDguHW3H5maXP946KAjdvZxIiDS0jgJdm6w0SLZjfPHNODQWJPSvq10NLG2yfsoIC
	EDGd9GoXG7dR70lALZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2op-0000000C9SS-0Yp7;
	Wed, 30 Apr 2025 08:29:27 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2cN-0000000C7Ji-1kWP
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 08:16:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso7007820b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 01:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746000994; x=1746605794; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsXzG0OPFSj9Y/N7ILSDxyejpILMY8rt11Cw8ETnit0=;
        b=BAe/rBhcKKnnSmnJP36NPQxOL7QRzZsjpOOcs8yH8+qamft3oDDHwKknJWYmP4Ein0
         SNkZaOxq2XIkGlEJTCx+inQVDG6x3NnuLNK8aTfYJ6a3P1ZPgWOnnZtWytccuhnUGSrT
         fkjCMewefFb0MI2NgvQCRCEk2+NZIvaZ8AcuVgtr+BqKmYxpFxAum3zbnC033pku6VhT
         wURVf0oPMhOZKxLGkCv8fWcrgDv/fHrwpgdRjcS3e6RDHUiy1vr+1P98k3AHNcmWv4/T
         0iJVgMX2+zFwslrGL5JtpSp2zrpfZECTsCWaDRlL/NzGLOw9siVQ8pJWbc8svh5NCjKp
         7VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000994; x=1746605794;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsXzG0OPFSj9Y/N7ILSDxyejpILMY8rt11Cw8ETnit0=;
        b=XagNkPozra6zDxQEriJsHqiLzvkYkemjcIt8mjY8xJKg/jKHULacHsVLKVEhHx+5+B
         7uLU7rEhihs0M/sgEkrKVSJakwR95J9TACtbDkLBegCNPot3Ta3fSusvp1WpdkNgHBn6
         GrYUs0uENReJd558+9HEAXmjy2jCTmdV+kZbnwh3mLepd4tqquX67ivrDGOkw1ApA+OK
         7BDvvq1LeKB4BJHMPE5S9kJbWPvbRsgbqMJcrFFnczcSr44MxIpiiFP3GXlpeWDDuNwM
         Cd12VnGuBbp9JqLsohfT0AXJlECUyzRdDzxm9gGu4Bdwu2GaM1s3v4rtrgf4dXsQQXF9
         NEDg==
X-Forwarded-Encrypted: i=1; AJvYcCUFHBD4rBjAoxfPyPVbRc0CZsuA3ZQWsXgXzD0K+k6TIa3/laJy/kPltY5h53jSXraVjK+H2zzm5Q/ZoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjZG5AOY0ZRAtLbHbSw/WN8WT/bsBRmcm/zNk6oxwDeFegQmmq
	zVwYjyc0SGdZRAhEdn/rAx+tVGCi/Yj357qglhIileUg4vi1+SkuPeezwG4BgtQ=
X-Gm-Gg: ASbGncvVY3k2qhOMyobWbpPYNkd3DBSF88tvtVuiJobBe8Rg75RjS1W5qkvdexKA2aG
	+8/0Sxuu8aQ1OhDkOEIS408eAtm3GfRI2oAHjHT+Alfo+5/ILDvaNl/pc8th2ogcd/4Jl6DZT+v
	8SXIJr8xDsj84gcvhKJk40Lckl/BKs7f3pDY9LNmQMzQ9VXGaMqarUyaht5NicPqr8PXWsRVawB
	Q2lKzy3l/w5ornYBwQLv0/+qhgH9CNukgIWREcaEVpCWizzzxbpmcnzRbbYgA2/Jouisg75jyUK
	QWHL4FgSrVVe+IKXWOWPKil7CTGiI1vk3x92Bnsbq6ZEkNDFLZ3+0g==
X-Google-Smtp-Source: AGHT+IH6seQgwJqi/FP/vswGEFmbX1nzlJ/wu6PVrapojvhfM+Yipa5sWjHxHBJfv7qDYrJjbCoowA==
X-Received: by 2002:a05:6a00:1146:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-740389bbc36mr3347820b3a.14.1746000994070;
        Wed, 30 Apr 2025 01:16:34 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a309edsm1073084b3a.91.2025.04.30.01.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:16:33 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 0/3] RISC-V KVM selftests improvements
Date: Wed, 30 Apr 2025 01:16:27 -0700
Message-Id: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFvcEWgC/4XNSwrCMBCA4auUrI3k1WpceQ+R0jYTO2iakpSgl
 N7dtBtBEJf/MPPNTCIEhEhOxUwCJIzohxxyV5Cub4YbUDS5iWCiZFIoek+ujvCwE8SpRjcGn4D
 qFkyrLWsqI0k+HQNYfG7s5Zq7xzj58Nq+JL5O/4CJU0bLo6zyGtdG2XPA5CMO3b7zjqxmEh9HC
 f3DEavDD1xazYGp5stZluUNvbqg9gMBAAA=
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
X-CRM114-CacheID: sfid-20250430_011635_594716_AFE20425 
X-CRM114-Status: UNSURE (   9.08  )
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
Changes in v3:
- Dropped the redundant macros and rv32 specific csr details. 
- Changed to vcpu_get_reg from __vcpu_get_reg based on suggestion from Drew.
- Added RB tags from Drew.
- Link to v2: https://lore.kernel.org/r/20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com

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

 .../selftests/kvm/include/riscv/processor.h        |  23 +++-
 tools/testing/selftests/kvm/lib/riscv/handlers.S   | 139 +++++++++++----------
 tools/testing/selftests/kvm/lib/riscv/processor.c  |   2 +-
 tools/testing/selftests/kvm/riscv/arch_timer.c     |   2 +-
 tools/testing/selftests/kvm/riscv/ebreak_test.c    |   2 +-
 tools/testing/selftests/kvm/riscv/get-reg-list.c   | 132 +++++++++++++++++++
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c   |  24 +++-
 7 files changed, 247 insertions(+), 77 deletions(-)
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
