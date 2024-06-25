Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723FBC3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 16:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f7qwdiMH2BH+z9hf/yuuUJK72BUUKHN/sj5z+xGnmqE=; b=I9GrLugsVCVdvs
	cxbGBqxtgpM8iojPnPVR//aA2aUDrmk1sGH80QxHTDgSXH/DWir3LX22LNdzyYiAS55og8iVnuHws
	xx4Ois5Yq2g4LJDMCrkUxqCyit0hOhpcCv2ha6ijfANTD+dBAXgd66FLb+eptlbHi2cQXBPIYden0
	2j3Fi5CFVUb1J1nxw7SCp++7JLHUVu4k/p6u8Oh6ZuWT0w+6N+en+A409d6qB/RFS5qUDWb0dSJOd
	VmgtpP6db7sqB+we563Cx5JMDoQer2H8li7wagwJzOp7doE6XbqD3Mw/8igNNladOV+SWplnsWKBC
	51C3E3ZBj31OIzVnhTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9ON-00000003lN7-1edJ;
	Tue, 25 Jun 2024 16:51:39 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9OK-00000003lM2-2brh
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 16:51:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70683d96d0eso1692489b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719334296; x=1719939096; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7DHb9nEZIyQ9TZyVFBVE55L2or4EVbNlnKkt0llmzhQ=;
        b=lyTL66CtcvRD+lUk4PtMVQ97eYN+6nlWPs4twDz+mTaxVjMKsr53AwDmFZtgzr3NxH
         onp9LtALyGqBRbnK0Ok0N5FIMZ/rqI7XgCbx1zYWXmZVS4rTzRAC04CATuUhLZaIycJU
         lnbj+l5sAFTdUPcexAffQtPjI5MZ7xpBvOLVO/s8oRt/Y7/pp7WCKbxrrvfAi8JyMqzO
         YiHVYYS3M32C7w5Rj9Ojoc0JuVLbIz3lotNslOUh/wmjh4IoJMPVCvE7Y03zyUwZzpXs
         d5TPLiwUF9HcaqGfLuXghaXn3tM19UrUYnz18ajt4cBjpkvEWo+nnNfXJKRGw9Nplf2x
         0SWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334296; x=1719939096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DHb9nEZIyQ9TZyVFBVE55L2or4EVbNlnKkt0llmzhQ=;
        b=DmIu8GwjMz3S6vJV7NpXXR/bYLdXkilMZ8xcY3lfjI9Ws5G+NPZBLmg/yRBWF8xixR
         +tJdhfu8RgIG0hRzecrBmK81pM7frLoM70X4+aX3fgwIU4nMU9p77kMN3AcEoHZXIVq+
         AnPqnEWum9nK0PjDys5RrwL+P4NSMdFyXb/21cFa5a1zKn29S1eX0ceFeHNlgVkV7mmI
         UJq85Z/ZhmPDC5DbdoiMomX+udtox4AI6D3UgZdH4OSLRn18tfdsqka9gwRa/9JS2Tci
         2+6qG4nXt6iPhr7w03FZRUN9C3gAf8OVpA3XCueJ7hTAZ6gsLvVzPw1na2j9gyXYjet3
         u0WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpQ7gpiRRf1zbYF6To0uzDRWZW8AplRUGXAXTddRXUzZWzgn7im29TkSRiD/BVtDECE5NFW5gwzx2/kwuOGrlOhHBlEy5YkYVfxd01bwzS
X-Gm-Message-State: AOJu0YzQD9yiWd0kt2mIUQj5SYZpylpw0bT/nQbW7GwBm/l7gpxxlIeD
	36CfCeIbKt9Ky7kvaL36RZsXjLKJwPy9ZkZSvb96njsfE23Nssi6dDTt334vulE=
X-Google-Smtp-Source: AGHT+IEr5KdO47tCR36GyprkazgZVE78Pudd+YyNM8RkVP6FfAqnuG0pdu9FULtAHnIWPsI0hDA1/w==
X-Received: by 2002:a05:6a20:341c:b0:1b8:5967:45bc with SMTP id adf61e73a8af0-1bcee98ab11mr7553809637.61.1719334295798;
        Tue, 25 Jun 2024 09:51:35 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c819a623a3sm8991226a91.5.2024.06.25.09.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:51:35 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Erick Archer <erick.archer@gmx.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] RISC-V: hwprobe: Misaligned scalar perf fix and rename
Date: Tue, 25 Jun 2024 09:51:19 -0700
Message-Id: <20240625165121.2160354-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_095136_783221_EB026A6E 
X-CRM114-Status: GOOD (  12.41  )
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


The CPUPERF0 hwprobe key was documented and identified in code as
a bitmask value, but its contents were an enum. This produced
incorrect behavior in conjunction with the WHICH_CPUS hwprobe flag.
The first patch in this series fixes the bitmask/enum problem by
creating a new hwprobe key that returns the same data, but is
properly described as a value instead of a bitmask. The second patch
renames the value definitions in preparation for adding vector misaligned
access info. The second patch has the side effect of causing users
using the old key values to fail to compile, which may allow them
to see and update to the new key without breaking binary compatibility
with old programs.


Changes in v2:
 - Clarified the distinction of slow and fast refers to misaligned word
   accesses. Previously it just said misaligned accesses, leaving it
   ambiguous as to which type of access was measured.
 - Removed shifts in values (Andrew)
 - Renamed key to RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF (Palmer)
 - Added patch to rename misaligned perf key values (Palmer)

Evan Green (2):
  RISC-V: hwprobe: Add MISALIGNED_PERF key
  RISC-V: hwprobe: Add SCALAR to misaligned perf defines

 Documentation/arch/riscv/hwprobe.rst       | 29 +++++++++++++---------
 arch/riscv/include/asm/hwprobe.h           |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h      | 13 +++++-----
 arch/riscv/kernel/sys_hwprobe.c            | 11 ++++----
 arch/riscv/kernel/traps_misaligned.c       |  6 ++---
 arch/riscv/kernel/unaligned_access_speed.c | 12 ++++-----
 6 files changed, 40 insertions(+), 33 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
