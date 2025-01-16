Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216B3C02183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 23:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YX84auhU5xTI6RZEHe19qX/MWMzVqARMRrKW4tomgok=; b=jk0UHcNrtuTcU5
	NR2051Md0T3rgqEhr9/KIvIlEEaeEImznlvajNy8bkvEYRNC8MTmd8585dhGdNMBiQXSbMvqCDSBt
	PVWpnbImZJPsBAbi88mGd3cASvCsCuS97FRWVWrExB0tdCBRepE8dROevnoB1bKbNLCvI2afipK8U
	mSK1uFMVvg3zc3NVgGlNEHY7jPiCZqCWghFsb/mkWFUJeuZSdE3HZTtXOzjAru5LPTi4QlfXyGqV8
	5ieav23WBl5CYQFGnLlM2VRikm9k7VTd60upG7MB80CgX2eU8I/DhLqICs8lHDCxHize6qr2NNf/q
	AWqJ0zgmoU08Ucz7DmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0I-0000000GJcY-3OLe;
	Thu, 16 Jan 2025 23:10:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZ0F-0000000GJae-2g99
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 23:10:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-385df53e559so1166690f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jan 2025 15:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737069017; x=1737673817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8uJh+xH3eI/c9V3pGChrDiSvCKIcHtU+7c19/VbDB0=;
        b=mRKXOl2WBbf3JIIw0PEnUU67ikrvp1Gi3X6XzhpOyWYhWaxa+/qmbLe1NXSgpK9NOK
         r6TL4r6CvX21iH/kezOG/DuM4rfne3ATdtBKbsizvxMiLbYoiawm10UgPqGJldCN8a8A
         CpidsVFhbF3iRg1h62xZJm9XzrbXpo0REMfpXut4Zq3MLG9a6JKLDQOlVCPm6XKjKPWv
         c56OOVCwQ1jlaAzpGdlsAShmrAwh0dXHKOwfNFsDf6KhXTDRVYL7y+W/3LWE/Q3c7gXS
         /hJGJLeHFVHyDiM6+yVAsQusyFgqcIznR13WTC/IfzruaZ5qWuAySgitBQiIMGsn8LaV
         i9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737069017; x=1737673817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8uJh+xH3eI/c9V3pGChrDiSvCKIcHtU+7c19/VbDB0=;
        b=Gfq2Qlsd8sUhzIAdabQUuZyQCeXqREWAq/DOlVTyQTaFlKXSld/QKavs2+XuVXhe/M
         7TvN0CAhoanZwybpYkJp6/uBCnp5szd7NqemEFj/iuy1tyC9ox9ymLONv5znXmcKZkPD
         7QNPqmPlCo0zyOyPy4bD9UM0vibupRVSQxw+sJzpWePQeBO+Hui7XfgcRWPYa3fx2mGa
         IXpgv+y62o44djIzkQyZp1h9mnLyZ9POLMyepdUuB6DUqZ5nnBawL6rwooZfk9dAmAUy
         rwfLdgbQ0/F4RBdlYoq5Q8xFFU5wpol0BJ8l8EfESJ6jN4d8NFsM2srkDQunx8vworVg
         CGgw==
X-Forwarded-Encrypted: i=1; AJvYcCVzF7wjYQ7nIC9AHc9waasYlYj6LbA1VHYmRL0l7vuzBvu9i28F0y3sdL+a/U66fXMiLooxjhtpotiIQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5AYhDrLxdlSVD1ZOuXbqBoLqLYEmI1QMytHiD13tNEu/RwvYn
	VHbNe8E/WK3tm25QXjTErqg9QnludYGDY90FZM8FleROJxwVoW2FuOh2kD05D58=
X-Gm-Gg: ASbGncvWiK38dwrO9Hkwel0+vEJ+fvm43bhoVVLF9STynxq5mYtYiz0eitsOYe3MRDo
	QglE0EGfNBIWfqO2SkpTQBBVHmJFhQTK8FMooCbJzN7Yn5fVFQxM5i9t3203I8oQUkjnj4bUMbS
	do0oUW8yov3YiFDiOxuPlpa59Ue9Cwv9dZyzBH5RjTNvUphlX1LeJXZh1Oynm9016cVFdjzy1k1
	C0ceJ19qYv0aytX4f2RyW3MyRicFJ8s1p+HtNbAIK53mh71VtOzt92WY0nH/jqQEg4ZgNjsx8P5
	5N1KbdSVK2WvAxeF
X-Google-Smtp-Source: AGHT+IF0eMc8RsiD3vYznSPkvx/UK3bXs0kRUnvDYnuRW301R33pMrAUnJVLjjR2VGZTLTvqShRQuA==
X-Received: by 2002:a5d:5848:0:b0:38b:e1b3:16dc with SMTP id ffacd0b85a97d-38bf57d339amr277724f8f.50.1737069017185;
        Thu, 16 Jan 2025 15:10:17 -0800 (PST)
Received: from rkanwal-XPS-15-9520.uk.rivosinc.com ([2a02:c7c:75ac:6300:b3f2:3a24:1767:7db0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322b337sm974991f8f.59.2025.01.16.15.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 15:10:16 -0800 (PST)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-perf-users@vger.kernel.org,
	adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	acme@kernel.org,
	atishp@rivosinc.com,
	beeman@rivosinc.com,
	brauner@kernel.org,
	conor@kernel.org,
	heiko@sntech.de,
	irogers@google.com,
	mingo@redhat.com,
	james.clark@arm.com,
	renyu.zj@linux.alibaba.com,
	jolsa@kernel.org,
	jisheng.teoh@starfivetech.com,
	palmer@dabbelt.com,
	will@kernel.org,
	kaiwenxue1@gmail.com,
	vincent.chen@sifive.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH v2 0/7] riscv: pmu: Add support for Control Transfer Records Ext.
Date: Thu, 16 Jan 2025 23:09:48 +0000
Message-Id: <20250116230955.867152-1-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_151019_902786_715EC80D 
X-CRM114-Status: GOOD (  12.86  )
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

This series enables Control Transfer Records extension support on riscv
architecture. This extension is similar to Arch LBR in x86 and BRBE in ARM.
The Extension has been ratified and the latest release can be found here [0]

CTR extension depends on both the implementation of S-mode and Sscsrind
extension v1.0.0 [1]. CTR access ctrsource, ctrtartget and ctrdata CSRs using
sscsrind extension.

The series is based on Smcdeleg/Ssccfg counter delegation extension [2]
patches [3]. CTR itself doesn't depend on counter delegation support. This
rebase is basically to include the Smcsrind patches.

The last patch is in the perf tool to allow processing 256 entries. Without
this perf seems to consider that sample as corrupted and discards it.

Here is the link to a quick guide [4] to setup and run a basic perf demo on
Linux to use CTR Ext.

Qemu patches can be found here:
https://github.com/rajnesh-kanwal/qemu/tree/b4/ctr_upstream_v5

Opensbi patch can be found here:
https://github.com/rajnesh-kanwal/opensbi/tree/ctr_upstream_v2

Linux kernel patches can be found here:
https://github.com/rajnesh-kanwal/linux/tree/b4/ctr_upstream_v2

[0]: https://github.com/riscv/riscv-control-transfer-records/releases/tag/v1.0
[1]: https://github.com/riscvarchive/riscv-indirect-csr-access/releases/tag/v1.0.0
[2]: https://github.com/riscvarchive/riscv-smcdeleg-ssccfg/releases/tag/v1.0.0
[3]: https://lore.kernel.org/lkml/20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com/
[4]: https://github.com/rajnesh-kanwal/linux/wiki/Running-CTR-basic-demo-on-QEMU-RISC%E2%80%90V-Virt-machine

Rajnesh Kanwal (7):
  perf: Increase the maximum number of samples to 256.
  riscv: pmu: Add Control transfer records CSR definations.
  riscv: Add Control Transfer Records extension parsing
  dt-bindings: riscv: add Sxctr ISA extension description
  riscv: pmu: Add infrastructure for Control Transfer Record
  riscv: pmu: Add driver for Control Transfer Records Ext.
  riscv: pmu: Integrate CTR Ext support in riscv_pmu_dev driver

 .../devicetree/bindings/riscv/extensions.yaml |  14 +
 MAINTAINERS                                   |   1 +
 arch/riscv/include/asm/csr.h                  |  83 +++
 arch/riscv/include/asm/hwcap.h                |   4 +
 arch/riscv/kernel/cpufeature.c                |   2 +
 drivers/perf/Kconfig                          |  11 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/riscv_ctr.c                      | 608 ++++++++++++++++++
 drivers/perf/riscv_pmu_common.c               |  23 +-
 drivers/perf/riscv_pmu_dev.c                  |  82 +++
 drivers/perf/riscv_pmu_legacy.c               |   2 +
 include/linux/perf/riscv_pmu.h                |  55 ++
 tools/perf/util/machine.c                     |  21 +-
 13 files changed, 898 insertions(+), 9 deletions(-)
 create mode 100644 drivers/perf/riscv_ctr.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
