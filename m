Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A185AD11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9ze021CeDVoQURh16auzbtYxDi2CCXIJwy2J1CSuDR8=; b=xVhjO3pAIYyyPP
	QcahEoKJlD1kox8A8SXmLxTwuUURRI+1gJAyvOH1me/ql/S0juMO0o/fHoz71eZxpndXWwc81yspx
	K+pafa+PMFrK0BKYmaXGK0YOLInfaG1SP7W+nvrEmQF6WyUsHi3TEM31QDjjk8g2nsF9yh3TRUwsZ
	/BLz2ll34jShGD7s2J0sFyI3VWU1OBnk/kB5JVWJQts+KtQzbMG24kj6OwFWgL3c0LvA2PsGzcmVi
	cf/OIVfGL67C7BIwZdaE+84Erte2Dgcq2gsOq9nTviIqVgUnwROnp0UMrYb5cPFj0KKPO8VrCbIIx
	In2d4TcyNvdO0gjQ36MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObUx-0000000GbDP-0oTK;
	Thu, 27 Nov 2025 12:53:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObUu-0000000GbCe-0CO9
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 12:53:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-29812589890so10276145ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 04:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764247999; x=1764852799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZNZVofZGu1foCFk4iS7YYI+xiRyGLmnKQ99yJXtiPY=;
        b=k9A7JDsWEaUN7Bnju4SuqPOvV5rYRc1rV7gZEQNVSfOXLPdnnrikZwHaF6qgaeJwMp
         +lBnK6dz0T2cGYJUM4z7u1LwG6t/H8NuiK3H43wQSpjGTKPWcNWzPtRzbZ23vHF+BUuA
         VtJ7R4PGGrV9IP50P2L/x3QUTNOHlipCpnnXGf7409HMWaQ0GBdxKTdnlxO6ZkMhAM9i
         3dEZuW8kPtkb2RwlA3HZM5R8EOo9RbaAuEa8oDC3J5L6clMXL+gBG5k0gIhZfgl8ps8i
         AMIBmtryC/fn2s5AkBfuveMNI4+WBK+8nLrD1GX0PfCiuX7pOjlVihPvkHtdgmLvX/UU
         OMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764247999; x=1764852799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZNZVofZGu1foCFk4iS7YYI+xiRyGLmnKQ99yJXtiPY=;
        b=K+QvoKMW08nP6OxeQpFHgGDtjU085s6Mog8zsjkcjNEF7jo1sVcloYek9xRsGBZdcb
         8fBUqXHSgEun9XI18bn+Rj2lJCWR1lequOXDwMwVYFs/Lmcel5xsnJtiYQjEmpEuSStw
         w7rAaWWikCwSLK3VVPYoTB5DoSGq5DcQKlNE0sGP9GQU40aGRfUoRNQSPgEqYbN6Ax32
         7TamdCz3ea/ium/NpuRmINTQX3mvhLNxtDFarVfQGzCA9u2QwJHDVsFWdehr66hW5eGq
         ZJHSkWDTEyJg6RFo2tBiN79q3elr5+iQSsBmqtbx8o109Kdi3lY0h2eu73t0mK120Q3O
         +Ixw==
X-Forwarded-Encrypted: i=1; AJvYcCUYRFZl15sOVfxMzsIobfmyx0+m/FQJxGnchKjabxVnCTDjVx6egT9CqTm1hmWB/S+Jnu+DZ9oQapVOHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4D7i53VL+0q03ub60vO5eGvasfU3/uX9jPbFs+lsjzMI2VhNa
	UqJvCLeRfDP/HWh1hOpTq1nG9p+IEVWMzj3zG5jao9kQRQuh+4lAGuXhen+hfTwq6Ao=
X-Gm-Gg: ASbGncu2I8aiMbMDTGiLBC4KkLNmprfsjHD3VzKG4HfyVSniCWS3gZcdWaQ948Wbnmb
	oYG+v0gJO8aC+1/a/z6SCFl0lUcTl/QU9VVvXN7y4fNjPxlsPgi3wI5WcJG02biwREW2FREF5DM
	qM6D6mR2/7UmOqnawIeq0pPZ2gai14i/Z+b7eGjgMIdlNr6j2dn2F2eiHQPf4dK0TdQ6z60kiEF
	m//5w+BBTD0aQRjF/TREaC+WzYITthyEo6vLq7rH0tzWr4LaxxZcus7prGy/tqqbfVMBX/0lL2U
	RREl0PY30X1qRuJkmbYZQnt8gP3CLyGgALpOL6Cs0X53eTB/cofwiPB2VjAg+PHoNtscHO+MNFW
	nnnUjresBsa0DC8l12/FI+q/u7sthVyZQfn6MmmkD+S2bDqpXkPaEqLIOMe5O38sek9r06Ww40J
	4B/kMV+FE1FcLNSQcgofrDNUSOQolZiTqdWDY87bPjAA11
X-Google-Smtp-Source: AGHT+IFbPB3VBDRPpGKotxjjK89VWCiAp8ON0AApdZA0so65+L08mE9nOchaP5UOxH57kW6BMrEMPg==
X-Received: by 2002:a17:902:e548:b0:295:28a4:f0be with SMTP id d9443c01a7336-29b6be8e2ddmr285613205ad.10.1764247998954;
        Thu, 27 Nov 2025 04:53:18 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.53.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:53:18 -0800 (PST)
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
Subject: [PATCH v3 0/8] Add NMI Support to RISC-V via SSE
Date: Thu, 27 Nov 2025 20:52:57 +0800
Message-Id: <20251127125305.89961-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_045320_097109_6DF2773F 
X-CRM114-Status: UNSURE (   9.95  )
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

v1->v2: Utilized SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED for inter
CPU NMI communication.

v2->v3:
1. Since CPU stop is not a high frequency operation, NMI is directly
used instead of IPI, without first attempting IPI and using NMI as
a fallback.

2. The parameter local_nmi_arg used by sse_event_register cannot represent
local NMI types (Crash, Stop, Backtrace, Kgdb) for multiple CPUs, so a new
per CPU variable local_nmi has been added to address this.

[1] https://lore.kernel.org/all/20251105082639.342973-1-cleger@rivosinc.com/
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/pull/223

Yunhui Cui (8):
  drivers: firmware: riscv: add SSE NMI support
  riscv: smp: move ipi_cpu_crash_stop() declaration to smp.h
  smp: move num_other_online_cpus() into smp.h
  riscv: smp: use NMI for crash stop
  riscv: smp: use NMI for CPU stop
  riscv: smp: use NMI for backtrace
  riscv: smp: kgdb: use NMI for CPU roundup
  drivers: firmware: riscv: add unknown nmi support

 MAINTAINERS                            |   8 ++
 arch/arm64/kernel/smp.c                |  11 --
 arch/riscv/include/asm/sbi.h           |   1 +
 arch/riscv/include/asm/smp.h           |  11 ++
 arch/riscv/kernel/smp.c                |  58 ++++----
 drivers/firmware/riscv/Kconfig         |  10 ++
 drivers/firmware/riscv/Makefile        |   1 +
 drivers/firmware/riscv/riscv_sse_nmi.c | 175 +++++++++++++++++++++++++
 include/linux/riscv_sse_nmi.h          |  26 ++++
 include/linux/smp.h                    |  11 ++
 10 files changed, 277 insertions(+), 35 deletions(-)
 create mode 100644 drivers/firmware/riscv/riscv_sse_nmi.c
 create mode 100644 include/linux/riscv_sse_nmi.h

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
