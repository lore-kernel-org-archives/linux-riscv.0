Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FA2C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4efL24iNYNVftuok6an1wEbGxUHFV2HT21dwcG5ik8E=; b=hc+bAI3c0jggmT
	IbWk/Nd7PnaDDZ+CBsGWGLw5J88hgRYVOXAM56w2WBDDgMN95l96DDkZXSOyrQZApAbu0OSLvXrkD
	JiM+FFWHMd3116c5Fb/HUbKb3+9RmOO6L3vsp1xuAiZOIxf6h5XpNP026fIimnEeSnlA0dKbJiPic
	YQjPwzMetalx4nm4QR8MHnrzcG64/i0ThJgX0+YG7xNGe0jyuPyN3T2Q9fVBiqRpHn/mnv8lk80aH
	m6SzdYlLHlm4UM86yyWdoKnoPG62bLc9Sd0QbeEQqnh5XryTvCNMf9ghlvz9CN5OagzPh+VnQnN12
	bOHq80g4HfPxw/aGBjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0TbC-0000000EAL8-3Rxo;
	Fri, 26 Apr 2024 21:59:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Tb4-0000000EAGl-13mn
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:59:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1e8bbcbc2b7so24593285ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714168749; x=1714773549; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj3ZfOCdGCKn/0DhPn4SIIdN3JBrIasn6yJrQRPZkc8=;
        b=OWixlo+6xe/EpxnXsByJmwRD3ik64U/X/5gvFR4FYQXDwmiZqF+rEB1hWyBs4oxDr7
         CoSWlEdUSHsdgIlvpIcPKiey6W2/REuffgnMkvALu3OWKhb8l7qjKLkNEfMYkGJ6taQW
         6jkS1XtsWIDFqXjiIJsNH8irlcj2fzllDv07iuuMOgscfvLimU2Z3KCbyFtPmEXMb1nh
         cMqDGg11++YqVQePd8iA3LGIVh95vRJmpV8RQAmYXt7Mut+USWo8LBlJDPqYCLjkx5ml
         5/gPAWJFvAJlFUJwxYZpNolTjEdTwlZ9SSY5NpU/1JrsOZ96beVRNqQtdYMhWSiJag/j
         nuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714168749; x=1714773549;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zj3ZfOCdGCKn/0DhPn4SIIdN3JBrIasn6yJrQRPZkc8=;
        b=bYftdAmWgoWVZonv3fBKYtNysDg/k/A2OeS70MZJYgQHl1MrhcWaP8lLfamYi94wkL
         dD6Z2smj1Nr1+ELZx2r/NLa0Lk7Z57N74ZfBU9O6WZ1DerYe76TvdI8mDjaPSX4gZv2G
         7bQkJujGJ7K5O+LeWoV1tKotkSF/dw6P4K9YLmsgu71ucMKbFqBcK8sfJS4dVDZxg1cK
         lXEUtVuDyag5Bv0aVukFwy5O6IHuukk+BvTIu0YNREWFld0pqMg0IHuF2xAaIVccsEb1
         iQN0MF4JSr1CTgk6K27A91qialfEaUptwfru4K4cAcqIo9gO85LyFT2CXezFBnBsz9qM
         daJw==
X-Forwarded-Encrypted: i=1; AJvYcCXP3eTEML07psYwdY+CZGLmtLyohiZPTip6Vf/htEJLGA7YOUe6MzP74GeLkikLaPAQTimjsL4ehOsJIkq3Y2wTywiJAuZAh3a3RIbAEKHY
X-Gm-Message-State: AOJu0YwF0WlwwzF+P+aKkIrshVV5sSgIFMdFsIedr/3JAhw60KEe1tMi
	fXEd0F/Nel+OcUUWP1gVPRiQXbCXCQqEAj34gQH4i/fxfpqsqMpww2rUPjqhdM4=
X-Google-Smtp-Source: AGHT+IG7k86hc6hdKQHC8igjv13gkothiiFulM58+LED4PQeT+W1pZHbYoVdgr5bSDxG80Q9uvmrnA==
X-Received: by 2002:a17:902:e806:b0:1e2:81c1:b35e with SMTP id u6-20020a170902e80600b001e281c1b35emr5209034plg.54.1714168749479;
        Fri, 26 Apr 2024 14:59:09 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d2c100b001e2a7e90321sm15899787plc.224.2024.04.26.14.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:59:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/2] riscv: Extension parsing fixes
Date: Fri, 26 Apr 2024 14:58:53 -0700
Message-Id: <20240426-cpufeature_fixes-v2-0-7377442b1327@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ0jLGYC/32NQQ6CMBBFr0JmbQ0diggr72GIgXaQWdiSFhoN6
 d2tHMDl+z/v/x0CeaYAXbGDp8iBnc2ApwL0PNgnCTaZAUtUpUIl9LJNNKybp8fEbwqilSNpZZq
 2ogaytng6imzd+8wzh9X5z/EQ5S/9MxalKEV9rampDCJexpvn6AJbfdbuBX1K6QsTP6TCswAAA
 A==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714168747; l=1793;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=L8Ab5WCMlj93ZkUK7fmvA+6skCeg0/MC1ZxRnpvL1eI=;
 b=Yz03ohFque1N3oTKp/GjR4zQxP/h0b8sAvW+OXNnA2qpFgnnv7bfK6TqTgSpQFstclUqkqqr0
 ukjE3hC06gnCxk3HXla2IMV+CaU5FQiXaZwoK/AXHjyOarKnVxPDLNc
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_145910_337823_0BFCAABD 
X-CRM114-Status: GOOD (  10.01  )
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

This series contains two minor fixes for the extension parsing in
cpufeature.c.

Some T-Head boards without vector 1.0 support report "v" in the isa
string in their DT which will cause the kernel to run vector code. The
code to blacklist "v" from these boards was doing so by using
riscv_cached_mvendorid() which has not been populated at the time of
extension parsing. This fix instead greedily reads the mvendorid CSR of
the boot hart to determine if the cpu is from T-Head.

The other fix is for an incorrect indexing bug. riscv extensions
sometimes imply other extensions. When adding these "subset" extensions
to the hardware capabilities array, they need to be checked if they are
valid. The current code only checks if the extension that is including
other extensions is valid and not the subset extensions.  

These patches were previously included in:
https://lore.kernel.org/lkml/20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com/

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v2:
- Move comment about assuming all harts to have the same vendorid/archid
  to apply specifically to the code that expects that (Drew)
- Link to v1: https://lore.kernel.org/r/20240424-cpufeature_fixes-v1-0-585e73d2226b@rivosinc.com

---
Charlie Jenkins (2):
      riscv: cpufeature: Fix thead vector hwcap removal
      riscv: cpufeature: Fix extension subset checking

 arch/riscv/include/asm/sbi.h   |  2 ++
 arch/riscv/kernel/cpu.c        | 40 ++++++++++++++++++++++++++++++++++++----
 arch/riscv/kernel/cpufeature.c | 13 ++++++++++---
 3 files changed, 48 insertions(+), 7 deletions(-)
---
base-commit: ed30a4a51bb196781c8058073ea720133a65596f
change-id: 20240424-cpufeature_fixes-91bec4d793e7
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
