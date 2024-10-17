Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C29D3C52C
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 19:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4GZW2cwf/GRBiP7XMMOMkYm4lcMFNW/+tAIZgE1/qL4=; b=NpTguRURRpaJdZ
	UkGZG1D5rdNvNVz+GQHO9pe2PZdclOB1VtO+zEhD8EoWAR0fIHmrg2oEoC8V4Km/yxu4QXrnOpWdA
	YRgAK4Mj2U1NB3FOAR4RXr1Jprgb6r4pH8NSxnCFoO90ls3H47RoIWhwSYMZZM7hLMcw4Hp/i05D5
	KJpTJmQwpQ5QJRkUA6p4ovQW4M4OHW0zBDs/njUd5LiIGUwIGqZGtyRWHjokzIRlqKSShWsEsjJGN
	IU/Sr53nmdNZKGuW/aXQHM42oU5L8rS/5E+B4SZGPyneyebgZE0ixtBhD3TcyF8bxE11hQDnyiyvb
	sMDp0taGyAiwv2lcZgbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vjg-0000000Fxfz-32rV;
	Thu, 17 Oct 2024 19:00:36 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Vjd-0000000Fxej-1llF
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 19:00:35 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7d916b6a73aso892024a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 12:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729191632; x=1729796432; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zxSczehEe035W5CU04y0FkOvPuUKpp9p7Yd16WBzeN8=;
        b=lZRrV6/p+WZPE0kfqhFQ4899c6LhFw8kV/k6A8a/Au1SaF1Mk3LEV88iar25450XrE
         xTzgUGn9xCqrihmRFtH2+T+DWjq8mWuH4T8V9r98Ckh2d2KuZvKv3oRLP4ZAdIGGD7jr
         AxPJOzku3HAp7dl9tZ8wIrh899GvflL1hUVFhqrv/zzNmnx3NS3Vt4VDalli4JHt5c1d
         MQDR+NbXZ3cc+oF1SHR2zcVCbowzyIcgeIi1DtTOVfPmbZV4GyKSCjNMAqz1MzfUF46N
         DY96eFu6i0wuo5i88HpvmDZ1HhNHpw9w38oTxtgqDuJAXsiRZ4sobHnQQIGFxduEEyiz
         7t7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729191632; x=1729796432;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxSczehEe035W5CU04y0FkOvPuUKpp9p7Yd16WBzeN8=;
        b=vQB7xE+MG86DYKbvJtVsXw2NWkhxhsblBsUuc6+kkJQLHrLNYyg+kq03Y796cc1S4R
         1LJqxxZFUUd3mi0h07d3+pjxgFa5GV4op+OO6M/6vX3vMtrCkH8rlgE6jU67Xez1zkmO
         z/8VgJyZunC2/8DhQRRE7FsNk6qweMo9pefwQ1g1fMJEZjnN5Gl0U/97c9oTYUU9qwi6
         en+l3aFvyqqTqxpWUIQE6RZHqn3jmsQwH5pvViYQLTG72BHMPUsILnjdMsz/y5BfqOIN
         S4IDgYYrO+XDpF5L2OqARMlXI0veA1aV90omeKO8iRGXv+AvGdcUxwUP2df8Yx1EC6kS
         vTWg==
X-Forwarded-Encrypted: i=1; AJvYcCX+Vs+cQgOMUES5OrIsidbFZ6sApfqpbTeMGgSVGWgbcaKIzR5diWiYtj59NMMIiznG4OqP+M+1IjZilw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmlbiUxZbsYbPFJalQ2QwF1j29y2HoV5/9u0OOTRwlR8euT2gT
	7m5B1W2WJabMQRzwTHQyaRsaCVpb9NWijlbQXcmvIkMXcRpHR1mwNGHdUG5oMU0=
X-Google-Smtp-Source: AGHT+IGpwyQf2rcH+WzoDhFYXE176SHL014MFUoPQcIpoNd1sTNXjuIoM/j+GeIybPGawXZSP9zyHg==
X-Received: by 2002:a05:6a21:a247:b0:1d9:275b:4ee2 with SMTP id adf61e73a8af0-1d9275b51f0mr2038031637.24.1729191632029;
        Thu, 17 Oct 2024 12:00:32 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e55d7bf9a8sm217766a91.13.2024.10.17.12.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:00:31 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v10 0/6] RISC-V: Detect and report speed of unaligned
 vector accesses
Date: Thu, 17 Oct 2024 12:00:17 -0700
Message-Id: <20241017-jesse_unaligned_vector-v10-0-5b33500160f8@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMJeEWcC/x2MWQqEMBAFryL9baDNLC5XkUEkeWrLEIe0yoB4d
 4OfVVB1kCIKlJrsoIhdVJaQoOA8Izf1YYQRnwRZtk+uLZsZqui20H9lDPDdDrcu0ZRcPQZvq/e
 rdpTiX8Qg//vcfs7zAtvOmnFpAAAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
 stable@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2567; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=viB41ymerrNs1V8lxnas3H8vFE72zXnqdr82GJQKPN4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ7pg3JGG12euWlQy9DvKHBQ0nxMz8c6TL5anFe59fH1hW
 V3qk+ttHaUsDGIcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEzEs5Lhn93O7isqHavDq15P
 rPI4ofHUflJP9NGucKUu2ZP8awIb0hgZJs58KLO8wStM+qeDwZsbfwP9hK+0SMa2r10j367AXnu
 bGQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_120033_558310_44E6B1E9 
X-CRM114-Status: UNSURE (   9.26  )
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

Adds support for detecting and reporting the speed of unaligned vector
accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
adds Zicclsm to cpufeature and fixes the check for scalar unaligned
emulated all CPUs. The vec_misaligned_speed key keeps the same format
as the scalar unaligned access speed key.

This set does not emulate unaligned vector accesses on CPUs that do not
support them. Only reports if userspace can run them and speed of
unaligned vector accesses if supported.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
Changes in V6:
 Added ("RISC-V: Scalar unaligned access emulated on hotplug CPUs")

Changes in V8:
 Dropped Zicclsm
 s/RISCV_HWPROBE_VECTOR_MISALIGNED/RISCV_HWPROBE_MISALIGNED_VECTOR/g
  to match RISCV_HWPROBE_MISALIGNED_SCALAR_*
 Rebased onto palmer/fixes (32d5f7add080a936e28ab4142bfeea6b06999789)

Changes in V9:
 Missed a RISCV_HWPROBE_VECTOR_MISALIGNED...

Changes in V10:
- I sent on behalf of Jesse
- Remove v0 from clobber args in inline asm and leave comment

---
Jesse Taube (6):
      RISC-V: Check scalar unaligned access on all CPUs
      RISC-V: Scalar unaligned access emulated on hotplug CPUs
      RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
      RISC-V: Detect unaligned vector accesses supported
      RISC-V: Report vector unaligned access speed hwprobe
      RISC-V: hwprobe: Document unaligned vector perf key

 Documentation/arch/riscv/hwprobe.rst       |  16 +++
 arch/riscv/Kconfig                         |  58 ++++++++++-
 arch/riscv/include/asm/cpufeature.h        |  10 +-
 arch/riscv/include/asm/entry-common.h      |  11 --
 arch/riscv/include/asm/hwprobe.h           |   2 +-
 arch/riscv/include/asm/vector.h            |   2 +
 arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
 arch/riscv/kernel/Makefile                 |   3 +-
 arch/riscv/kernel/copy-unaligned.h         |   5 +
 arch/riscv/kernel/fpu.S                    |   4 +-
 arch/riscv/kernel/sys_hwprobe.c            |  41 ++++++++
 arch/riscv/kernel/traps_misaligned.c       | 139 +++++++++++++++++++++++--
 arch/riscv/kernel/unaligned_access_speed.c | 156 +++++++++++++++++++++++++++--
 arch/riscv/kernel/vec-copy-unaligned.S     |  58 +++++++++++
 arch/riscv/kernel/vector.c                 |   2 +-
 15 files changed, 474 insertions(+), 38 deletions(-)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240920-jesse_unaligned_vector-7083fd28659c
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
