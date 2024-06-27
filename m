Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E69C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 17:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZNqmk1frlctWqL0FylFxf9WSU6XbFO/Z5406oq4XtM4=; b=yxv60TZ3ywslJn
	zGbOAxE3qbP6m5b0MTcMiNeyCTDRDjFU0hQWMKkogTsnJewKjlwaTLuhAF1FnbsjE57wYOMNRo9Ab
	sSy6XDY2QpeB/fpGFyPYaUC2+FpD9TAK6vmEf/q5GmqgdWKd4keqSd+asADOTwO0NBUcfigiWf0kZ
	PdeiY2XRa1ltJ0PXIKLe0Ra3hyQdczD7LBNv/nr+0NlR4TI7n+Ulm/22TwIFejcQ7VX3oGBqIhD4S
	wjzGCJkUWiyMyxtwJOuqSvzC6Wic4UbEpy4Hzi+jRrbnSTWdy0qyPZJoPVstpwEvUPykxyYzVsGc0
	PMq9njG804hko6fKv+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMspk-0000000BBcl-1e7Y;
	Thu, 27 Jun 2024 17:22:56 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMsph-0000000BBbQ-0ZVX
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 17:22:54 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3d5d7fa3485so541168b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 10:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719508969; x=1720113769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/OwRRE/tmpPiqQGOJB6aU4vaGReQEfSJOGUq6AR27Vw=;
        b=Fng6ITMMYTKQKOLjMw8JPx9pZ+0cqbpSYruzg9qI4hLtg2g5Z4uQBAzNFW9NoUpqlf
         Ye7Lr/azvyYYKb21uFEtAcQojW1UqnK8bFrEftfWSpXPqgtriCaFV4csv4a8ptr9OCAT
         asR/UJDDYupSSvw215Pkh2w8CauTk3MluY9netmng2RTiddXVrDVFpsvQ+bY8zCxB1iC
         ul6Og5GuvyShKKvwOg+NRkV3TrkVPwizWVVIX5VgCo6aPkQip0aETtshknhMIDGz6HGH
         yT9s8pBcnazukG+WsGWwy8Ae6ferNH7WhBtt4N+1ZQppPrqxx5M6Pr6Co/cG4JuoMNoh
         n2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719508969; x=1720113769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OwRRE/tmpPiqQGOJB6aU4vaGReQEfSJOGUq6AR27Vw=;
        b=F/uumydd4hTHZCdbJiq9EsrVcZVzbmfZxJ4WVU9Orh24sDGTbyb2vCYBPFKHw/Owrm
         PYQFNpTJRwfuk9gC3c8zZ74qgGiv7ma4F/rZcM0K8KltBrTqoG+d8xmDNj7h/3RB9kJ2
         IgHmkACn52vM1LqJq0tx7MNfaWaz2mWr90xintOORwF1w5CjiAh3HlUC/B4sJrqAYYR4
         +bDFyvNPsufDG17JbcrX0Hjoaqwz+eVUNdn1jAUKSlTsQ6OYh3Vt5VQwkN93akkfIZmz
         /kLdSmhbA78F4m4ryhB6uI22qGmKvibPmsrZviZDVOdTT2pOMJkvcaAGBD/Xf4lkD3RO
         34Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXsFMa0jfVFI1TmQd7hjI6iBNjHvVU8KCn96aOXF/BWOQiFHKLbvXSwrKix1wm3+Hb9r85eBgivTagFeUai9Bamvk1JLvYAWI3Kxa9Mg74d
X-Gm-Message-State: AOJu0YzlrzUxQjwehixCYFOlpGEDOjd2e9/QkaYQBfwRRYe2lFVjonxn
	p21SqaKDWpo9mJRkJzr5RX1hlls8ympucNLBTD8cdJXQ0bkWrao1P7jZyYLHHbE=
X-Google-Smtp-Source: AGHT+IHErKH2/DsqhBfhbtuV3XHsomNbK5PqNqpsP3gyRzpHI74BA5YQhJ+56xWSAkof/fTCbUywSA==
X-Received: by 2002:a05:6808:1389:b0:3d2:17c2:8301 with SMTP id 5614622812f47-3d5459cf707mr17529553b6e.30.1719508969365;
        Thu, 27 Jun 2024 10:22:49 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706b4a58847sm1617843b3a.186.2024.06.27.10.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 10:22:48 -0700 (PDT)
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
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/2] RISC-V: hwprobe: Misaligned scalar perf fix and rename
Date: Thu, 27 Jun 2024 10:22:36 -0700
Message-Id: <20240627172238.2460840-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_102253_202818_CF270FA6 
X-CRM114-Status: GOOD (  10.74  )
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

 Documentation/arch/riscv/hwprobe.rst       | 30 +++++++++++++---------
 arch/riscv/include/asm/hwprobe.h           |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h      |  6 +++++
 arch/riscv/kernel/sys_hwprobe.c            | 11 ++++----
 arch/riscv/kernel/traps_misaligned.c       |  6 ++---
 arch/riscv/kernel/unaligned_access_speed.c | 12 ++++-----
 6 files changed, 40 insertions(+), 27 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
