Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00179C021BC
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 06:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EPvLbQgc5qPpcfAJTe7VtVkXkauH2ujptsFZVvLnwYo=; b=0tQHQShw5TuMeb
	xUD8THRc4VXlKjM/miOWB4SLfpx4brdmGBnZHZU5QR5n0tkNctDyfmv96XNRbD9ayhUkxOQfOmdLB
	HpQ5BUVg8zrrEePqDbcWsxILvCLzJIKGt3vFZIlzkdxxMeAP5QJWeIhqkeyqgwPflVEBHjGHFAeaS
	eDwNemKurYzxawn8dW20KlcTJafSQDN1en7uAcXhmhiWYukPIWLVS/xFzeDlGa8j4Mgv/xnh1B7fP
	UvOyiiCVYYgMAuzd4E3ALCpunsK00qlwYcP9T7LKoNhopxap/E1ne7AkGTv0gChM1t+SSbd8uri7Z
	zCRWEm6LCKk/xqAvRwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAz9-00000002XmD-2iHi;
	Wed, 26 Feb 2025 06:33:35 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnAxv-00000002XPM-2dl5
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 06:32:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2fcc99efe9bso9943782a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 22:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740551539; x=1741156339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QtUWquMOJu8M6vXYzl7Hez8XDGzXf5hk21OpP0Wr4oE=;
        b=D8HVeZZzjaO+JAT1CB6Af+4KTkv3LWxU1iBjiJn0HtaAOnMjvosU95A7HYL+2tAwiS
         BcBrK9xePJAbbaCf27lPAsI+ltGX1UUapEF9txIT6TJ4DK2fbcZZ9ex9TqSzynbDs+7p
         psa/rs7dMjFqkDfMeYUPrcnkn39vGnO+HtrDd8wnJ5Gbb/8pGGDwzqLa0SvTa0M+18h8
         2LvVPErbAFwiErkPfrAXpqyf4Y9Qg+sfSKJ6pJWu39jbGqOxs7r0blP6S/mO5jhK7TdG
         YNlSdkNcfaly3BJ4pr2eOHo2bYomDMBvQIgSLSDjYXJj34xHfhOdL6YcN9zrAljaYM9x
         3kHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740551539; x=1741156339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtUWquMOJu8M6vXYzl7Hez8XDGzXf5hk21OpP0Wr4oE=;
        b=tmE2nwgk9h60kFjUQJU16r2ZSeIipZDBmXyzRox3wWdq3k6YDqknF1vUKSCyfzZZAW
         Pt0cJChqXTQQqS34fPpcrTaOfMeG3AzdkBrJEv7JPfHr+K8tEEam+krdHBVBoeOfdx/u
         c8mZlmoeJ8V9syaHgzPyPnGvwY1p/NxuUwpNgdIXHnpguQW8pQ9pobDpxDPlYj6RT5FD
         KeKYzksDobEAzYsWIihTJ2xVu1wlle7o4rlAfsg66hGdIHz88D00jXurdFxK1zdiUL3r
         9RKk1nMy4IKN97hi35hNwaFDxnosUuxC99+RAkC9Ynux++cjsvk4KrHeVmQjFAT6YHJa
         5BtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGaR6gIs+WoLrGSNIEDAjIX0a9XvAWtOuknth60hhEoFiNdxWoRUuP34KetdP/gTh0HiNLYZe17ZLNQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6f/TpDSjR/bKAIzS5gv7nvnutu++HNuR6SInboxsFHZcp8mAY
	gaRrCxyV9WPhn/P9BeJGT1jKp0IHVcTlo5SJOvoB7w7y2/byJ8tw1VEZ9jn/VHQ=
X-Gm-Gg: ASbGncvvDiOl2rCDom5gelFhi9kkL/YEZdZc3x83bCha0Bl8RI4RidWzQkMK2iqUXiJ
	goj82PpRKpQnmiwc/VoDGnfNrVA7lyDpfZfRDKxijYOgsn5CUQSwlIU4CDw/P6JqXLkCbvC3mR5
	NTMygtpHs3CX3R9oKQ6fqA+Yk0oyoaWSOUTrynWdG5FtRf/O7FLyrIPSbw5O6LARnHHNEZ95RGT
	GmGAkjDP3592TbAQc4pKYrklFQkt/nbNyp3bDZbCh5TwJ2cdPzNY1LplA5cGKXAUOjZhLeksjuM
	Sj9DVOvnK4gIlQVNaf5GfgPGGHlsZx+T9bn6Uog5f+46eV0XPh7uDeYR6AlM
X-Google-Smtp-Source: AGHT+IG2mAiXspI0vkCYd+e4u0ND+Y2lMAuAlqRh2tnsq4uOKE0Trc7s5XDT5FmuMUha5uITuEAAhQ==
X-Received: by 2002:a17:90b:3e8a:b0:2f1:4715:5987 with SMTP id 98e67ed59e1d1-2fce86ae503mr34768209a91.9.1740551538640;
        Tue, 25 Feb 2025 22:32:18 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f152sm682599a91.46.2025.02.25.22.32.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 25 Feb 2025 22:32:18 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v7 0/3] Enable Zicbom in usermode
Date: Wed, 26 Feb 2025 14:32:03 +0800
Message-Id: <20250226063206.71216-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_223220_674265_7F524373 
X-CRM114-Status: UNSURE (   6.36  )
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

v1/v2:
There is only the first patch: RISC-V: Enable cbo.clean/flush in usermode,
which mainly removes the enabling of cbo.inval in user mode.

v3:
Add the functionality of Expose Zicbom and selftests for Zicbom.

v4:
Modify the order of macros, The test_no_cbo_inval function is added
separately.

v5:
1. Modify the order of RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE in hwprobe.rst
2. "TEST_NO_ZICBOINVAL" -> "TEST_NO_CBO_INVAL"

v6:
Change hwprobe_ext0_has's second param to u64.

v7:
Rebase to the latest code of linux-next.

Yunhui Cui (3):
  RISC-V: Enable cbo.clean/flush in usermode
  RISC-V: hwprobe: Expose Zicbom extension and its block size
  RISC-V: selftests: Add TEST_ZICBOM into CBO tests

 Documentation/arch/riscv/hwprobe.rst        |  6 ++
 arch/riscv/include/asm/hwprobe.h            |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
 arch/riscv/kernel/cpufeature.c              |  8 +++
 arch/riscv/kernel/sys_hwprobe.c             |  8 ++-
 tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
 6 files changed, 79 insertions(+), 13 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
