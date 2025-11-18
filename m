Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC22CEBF91
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SrmntFwsGrZsVer4W7k+1KGJjAn5XMza7/bJGsSZFbE=; b=tLQD8Ebccfhr+0
	h13YVfGyKKc2oD4kPAHoWZbM1TVm7FoBh/Mht5pF4A1GIttvImffDEZQ35X2hPyotUhNC2XS9fouH
	3f3a1GRpvoJu9L9p3357nQQ0jqK3wGgu8jezKcqDFx1XNiYPGaHvqeBSVbWeFFuQ9cTUc1gC2oFgJ
	f4pXeU7+KA/zQJb4zogTh92BR6lIIFUErcecLATZ0l+dY+HdVM3HN/HoToDi5AY3yH+SGMsssFysW
	i6Tt5WgZXWaByt8JK7WRRT0bBZY348cxiQVKe+oi+f2VYap90rIIU8uQ+ZNRLfwEzBJzZI8q+qvr/
	92ZW/TjwGj1NwDbYuhNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBni-0000000HFK5-0fkw;
	Tue, 18 Nov 2025 02:50:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBne-0000000HFIz-1NWQ
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 02:50:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-297dc3e299bso48237705ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 18:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434229; x=1764039029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QM24pHmOGe73VnNxtQT+ZKbda/Zu23oD+FjlwZTAOyI=;
        b=EX4noy+xIfbQbB3sOYAC4UBkAeFtRN1vIzIXoxTq9FwAFWO3TdX4XwxRRmiiBbMd8C
         4hJhfXhny8Ee+Md6eC+4u+lBbXgIBzMxuWchgQIr0/7U88nuaRoSw4iVyc/qtFIuI91F
         hi9e6RXf7WGN5aBXJS02lkzyTCqxEnFknVxrzDlNYjxnNh/HBpdf1PaVcg0Voy9Fnr9t
         uFqiuC/M+htUSeMVdUFs7b8SZAoQ2uUW8g5tHuQXg2aU68oAn/x/n4475OM3HOli4KcS
         wrlfroZ/07CSKUlO37whjVPnJXybOFnuV4BydE98q8GEVeVehqs+kqwInOCVMVCLdMEr
         LUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434229; x=1764039029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QM24pHmOGe73VnNxtQT+ZKbda/Zu23oD+FjlwZTAOyI=;
        b=BTTCLWABUI+6pacghWEVSYk9l9ALbwo42UiCBJllmt6/BMok9zTcNeBA1PQqO9lbmj
         fYBjXdhlWR+hrwFt3oGdOMwF1IGdjdFieH1E8kpb/Uy2Wpbkoaxp9booiPayaLBQCHUn
         HqHgyuEXTJYBf87Q4onKL32d2lyEzyPyWVHgv/ApccoqUfQhY2or5/fqHOr0rJDA1r/Y
         LWRIupdMPIQJUEiso6Oh0YW9ZoVGgfdF2ibF75s1D6xX88/8Mfm52J28vLBhIoE7sPis
         KlwAobx+GjkN3PobeyCk+RQRkd7hRKC9HA0vuRVHNSKfitH4pzHfoJ8Ht6JP/0aQ/nyx
         r7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCXP4X3Y/nsQdOQaMMClzffl0FlCQpkq+E7lFYAtb2up34pqDzpTPRCJoqy7bs+3y7dNGMg9mtTwtfqIWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfsSfe2as1c+lZt/eKGu8w8nsZpxUEool0U41lpEq6yhwc4mbC
	ck7NlP8VZHUvoMejXBChEtG0dssY8XffH+isjQMXJqdocLMnnykUipMlmYbD5d3DV/o=
X-Gm-Gg: ASbGnctFlHVdyJSwPZXK3Rg2DyNj7aObRTfl5SWXu0IbAmjSTFGQQ0itFt+vn4q8psu
	mck70X0wHNJ2Ura6YjaQQcrdQVmqTw/NVl1i0+4s+nAGQaA/kcFVDWSrhAh/Z/jRMzo53e1aEaU
	FO3KoDMwYva/qXo5brNV966MiO9BELwejHbD6KfqHRBoxJdoVeh6ycdh6DBuDRG3Yc6X82EAOdW
	GALNIIfTlRy9FaicKMivxbduuaikFgFVPTZu4czmAKsCT7clD222qF+BdIqjHCNiE0fXeNU9xNb
	wHylcS0V9CWlYFsDLFF3w97oAGAcQwKgKQ7UvQiwIiDy0zFDBUyqc13fArpPBicrKzE7bLZcqpK
	4xx2gVQDQlKjhD+KyVrvUyWYbfJCzdj4v6HAVI1L5T0wWZF5AReorXGTUymY4nez5Krg+wnu78f
	NnltjxA21ZPpPUpI6KR2A+FOuqQZRLDJwQzWbBE81PkS06
X-Google-Smtp-Source: AGHT+IG//MmOioKgeQxyquQSV+AQABBbek9ef0Tyb8nGN6zx2RjXRR+H2j9PabPhGgsPfYEQSkY3oA==
X-Received: by 2002:a17:903:3bcb:b0:274:3db8:e755 with SMTP id d9443c01a7336-2986a733f65mr177018075ad.30.1763434229196;
        Mon, 17 Nov 2025 18:50:29 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.50.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:50:28 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v2 0/8] Add NMI Support to RISC-V via SSE
Date: Tue, 18 Nov 2025 10:50:07 +0800
Message-Id: <20251118025015.42491-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185034_378365_80DFAFB8 
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

This patchset is based on SSE[1]. It adds support for inter CPU NMI
interfaces, enabling operations such as CPU stopping, backtrace, and
kgdb to be performed via NMI which is a more robust approach compared
to IPI. In addition to inter CPU NMIs, it also adds support for unknown
NMI[2].

v1->v2: Utilized SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED for inter CPU NMI communication.

[1] https://lore.kernel.org/all/20251105082639.342973-1-cleger@rivosinc.com/
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/pull/223



Yunhui Cui (8):
  drivers: firmware: riscv: add SSE NMI support
  riscv: smp: move ipi_cpu_crash_stop() declaration to smp.h
  smp: move num_other_online_cpus() into smp.h
  riscv: smp: use NMI for crash stop
  riscv: smp: retry CPU stop with NMI if IPI fails
  riscv: smp: use NMI for backtrace
  riscv: smp: kgdb: Use NMI for CPU roundup
  drivers: firmware: riscv: add unknown nmi support

 MAINTAINERS                            |   8 ++
 arch/arm64/kernel/smp.c                |  11 --
 arch/riscv/include/asm/sbi.h           |   1 +
 arch/riscv/include/asm/smp.h           |  11 ++
 arch/riscv/kernel/smp.c                |  74 +++++++----
 drivers/firmware/riscv/Kconfig         |  10 ++
 drivers/firmware/riscv/Makefile        |   1 +
 drivers/firmware/riscv/riscv_sse_nmi.c | 172 +++++++++++++++++++++++++
 include/linux/riscv_sse_nmi.h          |  26 ++++
 include/linux/smp.h                    |  11 ++
 10 files changed, 289 insertions(+), 36 deletions(-)
 create mode 100644 drivers/firmware/riscv/riscv_sse_nmi.c
 create mode 100644 include/linux/riscv_sse_nmi.h

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
