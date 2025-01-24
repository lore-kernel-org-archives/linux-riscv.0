Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FD2C02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 22:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G/1wNUhkWW+pWRQwh1Bcw5S9lZz/Gl/RPljdgiU6z44=; b=r0eGPWIeDRuFdz
	8uAe19ewHHoWbgDH/k+15lOvSAmb4ojqUVGfPT7hpy/2/anPfqhRtdHz1rEC7kOSDj1/hV711Ruex
	Tue5zn1dFC8XFz+FTlx6GOz55kZ9DPjms8I3+FTM6IYcMTKD2lkpgu35HUu91E+EbGzG0RsQPLOLC
	gGqCvD0ZXXW6A9QOWDJFR/WuvLjh/zVqe4s7Irlvf67lqOd/kQDtwiXuj4N0GasaoyYOiFt3uli6A
	AGjTWjOB+qi/4jCzKwnUfecoLrwrOJ3dwtBMEJ2Xg05tnT1GMWj9+LoBo2K/ORTxPYyQajB6IGe33
	7HWZHHG3E8tbI93XkYCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSDh-0000000Fcts-0omv;
	Fri, 24 Jan 2025 22:32:09 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSD1-0000000FcgA-1Qyg
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 22:31:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21619108a6bso45398485ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jan 2025 14:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737757886; x=1738362686; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCdnCBzEep19sj1mltTtEXamKsaejEfo5Qiz5jj87Z8=;
        b=eC4EmE5k4uxJYNWtDcfNdNe7HuAHJWfZfqH1IOBj0iHjWnUzQWE8PFX4Of1cCCFI4N
         363iM9bY9TEkPLRhDqw9Jqw0Q/kPp4hKiFGcpMJqEg7+L8YT2DZt3X/A55gqUbkSDKYg
         jDnRwzSdd6sDRRecTT9jhkWIStL2RzgWO59zzQcBpFxNc2UFdlZad9vxitge35Qd9gpd
         Lf++Bb164MicIfH6+E3g9XV/0RhJvv1/FCg8o475fnNnRk5jiDOJXzwe0jD9JqtUBeIs
         9PFwUsgABQAq4EbY2mDSjAzIqIYHNbatQVVE+Twbh9iaup1EeaCYVX5ctJ6R594BV5tb
         oHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737757886; x=1738362686;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCdnCBzEep19sj1mltTtEXamKsaejEfo5Qiz5jj87Z8=;
        b=E3tbx4l4UiJgcuJY6UeLsBEAKO00XNUUEjoApg+KZQJWvMqf+rd5IODyf0GHZrUQNR
         LFvTuUo57QnYW4gJRGxHgfwTYBTbujfDKRyAmVKP/yxBzUPVMF7Z/ZpTY01CFy/5vANa
         7o66V8BgzJSjVunqZCPNV+oMIDjazh20TTrplTYkX+zJzC2fZjPMVLG+fUnoJYMy9IMp
         6RZo6P+vnCpyeWcAeYPoQB+Qy4o+nXs/ENBa+SAyoiyv4CgosDreEpkaYw/9QOpidUMF
         +j93nuc0Xxmfk+gnzR2oE1EXEuJzsMUP2Mpmw5ULMy7XVLpScpp/YjeK0YEl+qhc/pQh
         VMBw==
X-Gm-Message-State: AOJu0YzSR1nMlWbgkYReCDDTlxZGHx80Y4Do74X4YuIOoRSn5nZ/sjkT
	UuHJ/ti+V6XTFJgSy8LaGEP+B2I8VIUGlNaPNThpjgeYBvjDEZFiCktST1gcxNw=
X-Gm-Gg: ASbGncu5LGJDooH0yCnujilh60G+FwJfW0eG9joa8GZ1UUaTZqBiH4Jnn8dTlHqr6aX
	5D+EHM2Ri2YfHpuatqeHcU7TIgufKViMYJNNVb/vJMtIktDwoJgiGhc0Q1MBms4pr+TL79tCiM5
	tt8plRklIcvo5G+ZDkqdcynDEeyuRt25TnWxFn6ywF4Tl0wbCCzeG2as7KFZioFLCZEvCljopgO
	DuT1Pq607ytFrQKitLpURC1Q2JTe4FARqbENEuBWtGUvvAeHFMFk6kdTDW/fcfdf3pWgJJ3Cvtw
	f/VBvvQ5+NBc5RGBk65p
X-Google-Smtp-Source: AGHT+IEEHymMdtBs9J+QK89q3SHcA3s5N088XlUlO7j0IZSWZHaUNaTFF3ke0CgoFEEi01F/zYr4WQ==
X-Received: by 2002:a05:6a00:448e:b0:72d:a208:d34e with SMTP id d2e1a72fcca58-72dafb557c2mr46816794b3a.18.1737757886587;
        Fri, 24 Jan 2025 14:31:26 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a761150sm2397183b3a.119.2025.01.24.14.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 14:31:25 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/4] entry: Move ret_from_fork() to C and inline
 syscall_exit_to_user_mode()
Date: Fri, 24 Jan 2025 14:30:58 -0800
Message-Id: <20250124-riscv_optimize_entry-v3-0-869f36b9e43b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKIUlGcC/3XNQQqDMBCF4atI1k0ZJwk1XfUepUiJY52FRhIJt
 eLdG12Vgsv/wXyziEiBKYprsYhAiSP7IYc6FcJ1z+FFkpvcAgE1aEAZOLpU+3Hinj9U0zCFWZp
 KVVppBIVG5NMxUMvvnb0/cnccJx/m/Usqt3UDDZR4AKZSgtRE1hhjXdvALXDykQd3dr4Xm5nw1
 1EHDmbn4tBYbbExUP0567p+AYLMPfsDAQAA
X-Change-ID: 20240402-riscv_optimize_entry-583843420325
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2085; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=QuTYhwkjqC2Q1qvisEg7E9GMLG0lRbTzGqUS/XuRBZU=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/oUkWVqjiq9v0POTmm/ff676f3HbWc2Lcr+dueW3cNas
 y/vDGe+6ihlYRDjYpAVU2ThudbA3HpHv+yoaNkEmDmsTCBDGLg4BWAil78xMmxVZP5oWDBHjUlx
 QvSs8hB966znfQcfawrPEmANFsitC2P478zY9FTVfenqsPl63zauXipzIyzV6Mcnic/hlWdl81N
 SGAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_143127_386699_A54A00E6 
X-CRM114-Status: UNSURE (   8.80  )
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

Similar to commit 221a164035fd ("entry: Move
syscall_enter_from_user_mode() to header file"), move
syscall_exit_to_user_mode() to the header file as well.

Testing was done with the byte-unixbench [1] syscall benchmark (which
calls getpid) and QEMU. On riscv I measured a 7.09246% improvement, on
x86 a 2.98843% improvement, on loongarch a 6.07954% improvement, and on
s390 a 11.1328% improvement.

Since this is on QEMU, I know these numbers are not perfect, but they
show a trend of general improvement across all architectures that use
the generic entry code.

[1] https://github.com/kdlucas/byte-unixbench

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v3:
- Fixup comment to properly reflect args (Alex)
- Fix prototypes for loongarch (Huacai)
- Link to v2: https://lore.kernel.org/r/20250123-riscv_optimize_entry-v2-0-7c259492d508@rivosinc.com

Changes in v2:
- Fixup compilation issues for loongarch
- Fixup compilation issues with CONFIG_CONTEXT_TRACKING_USER
- Link to v1: https://lore.kernel.org/r/20250122-riscv_optimize_entry-v1-0-4ee95559cfd0@rivosinc.com

---
Charlie Jenkins (4):
      riscv: entry: Convert ret_from_fork() to C
      riscv: entry: Split ret_from_fork() into user and kernel
      LoongArch: entry: Migrate ret_from_fork() to C
      entry: Inline syscall_exit_to_user_mode()

 arch/loongarch/include/asm/asm-prototypes.h |  8 +++++
 arch/loongarch/kernel/entry.S               | 22 ++++++-------
 arch/loongarch/kernel/process.c             | 33 +++++++++++++++----
 arch/riscv/include/asm/asm-prototypes.h     |  2 ++
 arch/riscv/kernel/entry.S                   | 20 +++++++-----
 arch/riscv/kernel/process.c                 | 21 +++++++++++--
 include/linux/entry-common.h                | 43 +++++++++++++++++++++++--
 kernel/entry/common.c                       | 49 +----------------------------
 8 files changed, 119 insertions(+), 79 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20240402-riscv_optimize_entry-583843420325
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
