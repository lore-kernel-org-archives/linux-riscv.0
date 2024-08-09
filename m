Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4606FC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Aug 2024 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DCy68rjhHmcg//jODmHF/tkGpOJ2chLStUtB1UlEba8=; b=YT3gRBPkYUFqrk
	kjmF3G5xXch083bp3+6+Bju6jUDH9XwF6mM9jwaDKKyo/tWRnlduLT+XJwE1DfxA3Bq1xREzrRKbR
	bdidZ7STpwbOqc4b78qT8O5hFQhdl7c5TUqnBFuN/cJZMnOBXJW54O5TEwImHJiSnvoDNOPdA1woZ
	tf2CxosPzSvq6G9hCF8S4lP44Rq4qEKTOWE4PLow20jCEImz6AuUd2slITTEP0LTNwpn7UJbCh2J0
	Y+37Md2QAdGtizqbxfiKOhsbFbPuyrL6gfoeHvSg3+UgskJ6GdqeJgjQ/qz0g+hqIXSSwYNXXhG0n
	y+tUivmZAGbmvNzwxcbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scXPr-0000000CcFt-1391;
	Fri, 09 Aug 2024 21:44:55 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scXPo-0000000CcFO-2otM
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 21:44:54 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-6e7b121be30so1821177a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Aug 2024 14:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723239891; x=1723844691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFVEa+6FYfEUaLF0deMiv8D8IxrvrJD54aZshK+oobU=;
        b=zIJbBOHQnKdNFxxcenSytrc7/C5OX8nKqGHLazjvKvKLGmC9BoPciDASxWDb0kJusK
         vBkC9Ng/WbTxZ2besil9Cpr23Mc/Idv2cDjh/PxBRrX2QdqefA5SIKe7aDC6TriAhd9c
         k5DmQtbQ4+GzDOhsEc5kdgvOBEOP0fhkt1uMxfDahrlVsE8ypLa3sQuneHysGH5PN7vg
         WzWdHd5UFvk1vFyQf6KwyIWn6ea+rLLnxpIFrdJOriXsWZ9bH7eX+RSaWBfX5lydHUub
         xGkfphW0iv6WOwn42Bg00lzbt2qwnLq1I6xGuj2kS8pEUT/pRQVr3UrqkYT05n2pi6v1
         6upg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723239891; x=1723844691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFVEa+6FYfEUaLF0deMiv8D8IxrvrJD54aZshK+oobU=;
        b=M7VTaYh70CDexCEiHOyx7cwJqG8XPTSZymu3K302wlGVWQEji5eEC5QCILKCv4anm4
         tWesW09TQ0GgIXoFFjZefLMbHv59znVJSIdVus/vS3+OOepuDyU3qDGsZchFFtAJjmUa
         vL7a50WBs6LJK8uq33M9l2U7gGyLy5PJuAs8kNW4KvD2hVpLA6U2DA3Pjbk5K/J8PZ5o
         mQA8VgQti0WRfvYIFZJ84oDF+rd+IB66/WlQv0Tp+A/UFD0pV1GLJVagZbmu6zWDzJCU
         8HI6nynM3tds3FSKkRrejR+oqZM2A240TNA8EnasBW7Biv72kl9Rs3LDBbB8iMgUk0ex
         JEFg==
X-Forwarded-Encrypted: i=1; AJvYcCVLZ57JBXE4/N2Tu/sbIZ2b22ruA8H3WHBYoiBUkydn4g2T8c4rzkZw4XAbxpjGia2erfLFUuJp7gZAEKGxRZqWdVE+tEiS7dc+robja2N9
X-Gm-Message-State: AOJu0Yz257B1ck2O90bT9ugxRPGiHxXTiwnAICm40qx6S88xjPtE3Tdc
	kvBTfWQVfXQX+EiBK3OEkUmKei/JhQ3X+e8AF5a6vNE0NxRLhJ66VpX2y5r2evY=
X-Google-Smtp-Source: AGHT+IEIQGIlcJkuXdHdnqgIFBd988zwGWuS+RZnMCFZ5blJtXDE4KnUgqtwnNd4P70lZgiR4fLR7A==
X-Received: by 2002:a17:902:fc4b:b0:1fb:9471:84b5 with SMTP id d9443c01a7336-200ae5a9fe3mr30084305ad.37.1723239890802;
        Fri, 09 Aug 2024 14:44:50 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb7e93fesm2073905ad.43.2024.08.09.14.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 14:44:50 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Anup Patel <anup@brainfault.org>,
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
Subject: [PATCH v4 0/2] RISC-V: hwprobe: Misaligned scalar perf fix and rename
Date: Fri,  9 Aug 2024 14:44:42 -0700
Message-Id: <20240809214444.3257596-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_144452_734204_0CC7166C 
X-CRM114-Status: GOOD (  11.41  )
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
access info. As of this version, the old defines are kept in place to
maintain source compatibility with older userspace programs.


Changes in v4:
 - Rebased
 - Add the word scalar (Charlie)

Changes in v3:
 - Further documentation wordsmithing (Conor)
 - Leave the old defines in place (Conor, Palmer)

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

 Documentation/arch/riscv/hwprobe.rst       | 36 +++++++++++++---------
 arch/riscv/include/asm/hwprobe.h           |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h      |  6 ++++
 arch/riscv/kernel/sys_hwprobe.c            | 11 ++++---
 arch/riscv/kernel/traps_misaligned.c       |  6 ++--
 arch/riscv/kernel/unaligned_access_speed.c | 12 ++++----
 6 files changed, 44 insertions(+), 29 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
