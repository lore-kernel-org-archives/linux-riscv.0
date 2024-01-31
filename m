Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13C4C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 01:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=94rTcas5CO3iyta3LPvHjIUObDolQqlBRTU6rHzTKfI=; b=bAo5NP8ar7DM8Q
	lUkisIiIbx3ccPiLQuhvkD7y4iiSYz2oYU06uk6PxpENPqIHmjYC4DEcudsIb7PASyYmU+vqAg69D
	SPcaRKvfLuWMZtTLbbiZhCvO43X9TbHMvFbIi0UdL91HgPzPaWPVBZM8pz32Bdbn+tktRERTltkND
	X6MB9JoMwIxd95nSxlHKE8DGhIq8LGKOuczaAFbsSTT7GKeKnEbvEDRVA6c7Cym9BNcu24YxIbkZP
	b4rThhuxnoI6AM/Ui/GG6e9H6+Ftepitf/jzLNxwLGMSStEEpuJ7YJFfJW/V6Dy8dTuvNw7+skQFH
	y5F/1CioKP8mCvQFJ3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUz4K-000000016LS-3O3R;
	Wed, 31 Jan 2024 01:07:12 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUz4H-000000016IN-2ejt
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 01:07:11 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5d4a1e66750so2637033a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 17:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706663224; x=1707268024; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kpHLBVSDtt2Vi3PB1+vKZ4waG/FnYqHyoq4gGiKTKkU=;
        b=vtChfkRSrGn3ldghrvcdwV3R8ZSrXLReh/bMavcYGQnksOhoJhbVoNOOhIHe7QBCiZ
         KihizEF7lN4zpymBl5AP5+2i8kJ5F+35CDg9Q+ya7c/GivUgnEJe/3rDJXQAwywc1ZHG
         Fk9AnMVLQCxQv/aIx/9+Zh1MFdexCVjQ7YcKg4bVkN8Kv7uJX0s1K5CN2T5SGmMFecFT
         Th+v9KeRLUsVzQYdnNh3qJ/8CQ47tqs3eVLfwNKSxBQUBQyJuxQCO/vNQEpR09UJXhV8
         nxOMJQPL95da0qkU9cSVq0RPG1cPLiNko89ADA9BXRWfNErJx2eOsTfxJPTAxX6C8wmj
         IgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706663224; x=1707268024;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpHLBVSDtt2Vi3PB1+vKZ4waG/FnYqHyoq4gGiKTKkU=;
        b=rirOZmPOenYWGnkWnIYrElZwnbCh2VPu0S9LjZKQOJ6U2kN2wn3IASqJG8adTfAOgE
         ADqmioMGehXxIaHWVusxsg91bE5UQZX2dYudcDpEmaQOKfbpppI5/Ey8a3yNea/jSVK8
         sGvuT0zIR4hceG01kwkaLmakm+appjKTkPxL3LQSsNwqzm/5Pl7hXM0PsaPTPxUQhYIk
         U3ttht5tPoB/8WN02dgG3Qnh/DOfPhla3INOMDB83WGVleGdErYfAxj/XAfQMNH5o9UM
         ShWv/1XXRqyOQ+lfqgWbodXqQiKibov1qL8ICxiK5lwGcLAfBAw7j8EnUpda7SzIxY4g
         gpHg==
X-Gm-Message-State: AOJu0YysKS/7n8wdXtK2fYpjbOvT3fHJPEK3dersmtkoe1x+ZN5q9s6a
	I5ku2u6G1PcKQLi/tE36W365BtFOY+4dqZqp48QTwopvONLAODatL99ypg+14SE=
X-Google-Smtp-Source: AGHT+IEledlNCHKmoKtfP+m1/NFojyVfcYEBlPa2pMEEwNPBKFgNLr0k77Wiitvd/LQG/pfBvXvaYA==
X-Received: by 2002:a05:6a20:da88:b0:19c:912f:1cfb with SMTP id iy8-20020a056a20da8800b0019c912f1cfbmr162474pzb.12.1706663224274;
        Tue, 30 Jan 2024 17:07:04 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r12-20020a170903410c00b001d8d3c276c4sm4970822pld.35.2024.01.30.17.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 17:07:03 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/3] riscv: mm: Extend mappable memory up to hint
 address
Date: Tue, 30 Jan 2024 17:06:59 -0800
Message-Id: <20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADOduWUC/3XOywrCMBAF0F+RrI1kklitK/9DpOQxsbPog0SDI
 v13U3GhQpd3YM69T5YwEiZ2WD1ZxEyJhr4EtV4x15r+gpx8yUwKqQVAzW8Jm64zY9NSf22M9xF
 T4qEO2oKtwjYAK79jxED3t3s6l9xSug7x8a7JMF8/opQLYgYOvKqcxf0u6LrCY6Q8JOrdxg3d3
 PEB6mVAcO122ps9KGvgF5hXZfm1RIklSBYoKI02eKXEVv1B0zS9AI1VQNFHAQAA
To: Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706663222; l=2312;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=IbDUWk3KxJHGN3bPvPRSRgWjaoDgesrJOCG1kQ+QJ3I=;
 b=H2X+ZfEVZflQSr9sjSg75daZSBI4yo2Pp8YPZpTe6aqFR2nngVSjlVIm7BQM+Qe5pBNX4XkvY
 yrAhS+qz6eYBkMnzptrEfefikKErPddkr3rg0SrfPuiuPLi7+jspFb9
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_170709_681001_BDDDB8C6 
X-CRM114-Status: GOOD (  14.57  )
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

On riscv, mmap currently returns an address from the largest address
space that can fit entirely inside of the hint address. This makes it
such that the hint address is almost never returned. This patch raises
the mappable area up to and including the hint address. This allows mmap
to often return the hint address, which allows a performance improvement
over searching for a valid address as well as making the behavior more
similar to other architectures.

Note that a previous patch introduced stronger semantics compared to
other architectures for riscv mmap. On riscv, mmap will not use bits in
the upper bits of the virtual address depending on the hint address. On
other architectures, a random address is returned in the address space
requested. On all architectures the hint address will be returned if it
is available. This allows riscv applications to configure how many bits
in the virtual address should be left empty. This has the two benefits
of being able to request address spaces that are smaller than the
default and doesn't require the application to know the page table
layout of riscv.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v3:
- Add back forgotten semi-colon
- Fix test cases
- Add support for rv32
- Change cover letter name so it's not the same as patch 1
- Link to v2: https://lore.kernel.org/r/20240130-use_mmap_hint_address-v2-0-f34ebfd33053@rivosinc.com

Changes in v2:
- Add back forgotten "mmap_end = STACK_TOP_MAX"
- Link to v1: https://lore.kernel.org/r/20240129-use_mmap_hint_address-v1-0-4c74da813ba1@rivosinc.com

---
Charlie Jenkins (3):
      riscv: mm: Use hint address in mmap if available
      selftests: riscv: Generalize mm selftests
      docs: riscv: Define behavior of mmap

 Documentation/arch/riscv/vm-layout.rst           |  16 ++--
 arch/riscv/include/asm/processor.h               |  27 +++---
 tools/testing/selftests/riscv/mm/mmap_bottomup.c |  23 +----
 tools/testing/selftests/riscv/mm/mmap_default.c  |  23 +----
 tools/testing/selftests/riscv/mm/mmap_test.h     | 107 ++++++++++++++---------
 5 files changed, 83 insertions(+), 113 deletions(-)
---
base-commit: 556e2d17cae620d549c5474b1ece053430cd50bc
change-id: 20240119-use_mmap_hint_address-f9f4b1b6f5f1
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
