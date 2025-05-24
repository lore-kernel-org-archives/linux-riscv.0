Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8225FC54FC6
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xc/mpd9/CAedbq3D4/+jXfsX0R4JNTILgXvSpW9ip0c=; b=03jN5T1oBvm2Sy
	UckmCwgVy05QP4K1AuTLTSdfbIW0pQBNUZXV6RWDar14dwOj5YnXEdp1PwkFCgirzlgETgi+ULw85
	EmSIBarzAaWHXkoVtK2X+7hYAcO3bLrfqYtfhjfBD+sBjOC457zcGu+GtVRB7mtCXTpl81SNds+j1
	Z9uXYZfvtVwPBSukcdhBE+izTmK7JdEjDB+TJ7BhvNLh6EI1MzLcgeQ5Kz5J+Q9034dFuk4yGcixU
	w6BPA3OeiVoF4fka7tQp7/ONZlE8aIK4pftjnU7rgw5InJBWfq+IxAXgTnbE/wNWavA1D9ziqBbyh
	GdHvVik47fTzzelQ6qtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIrDp-00000005yEl-2HV8;
	Sat, 24 May 2025 15:55:41 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIrDm-00000005yEB-31ZC
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 15:55:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-231bf5851b7so5474285ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 24 May 2025 08:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748102137; x=1748706937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5NzQXNu49XBtQeENiXLHMtGN2kWzF78ktALbXii2Y0=;
        b=IeF8GpP3afNVBY+XVqjR9cCYHEXN+oTZnvM0EVFO5j+1Tsvds+4AKhr1hAa+CJeFWm
         +Y1xjj47sbjyLuRHOetDY9bncPZ8D/UTAn7U2ytgT7P4iXjCd/wymBQfViSVLF+rxGj5
         AgbUKoyiBi4+a8eiTR0mkI4DcovpecPqp3JOnYKlPy03fv9+EQhezUwygzwgKs8nG9/C
         ew8IFIv6GPoOL96/BPQhhFXPDD1GPX+FvrBuaS4UMCu21KzthJFQ15jLPAG1brrjEQsd
         xZxedvPC4L3dnSvqB+MsAbj2mzKOI0DNhGdWHOSlaHS87n8nLmJMZHtjOYEPj7oe+GQh
         FHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102137; x=1748706937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5NzQXNu49XBtQeENiXLHMtGN2kWzF78ktALbXii2Y0=;
        b=HLdua+8P62cSaMz4/MyhL+EW53HL6VLSIBiNKQbvOPIAqa/QlLAu5NDDYQsOdOxkzb
         kw0pRbsLssu58nDk3OLu/zeD4MhjIPAIKgKvq5CIJNroNfDqQppI07Ul00QrTFtUoVju
         je3HG+PUQEk7HNy0I0nd22qNhrRG4ZDXNcI5dnRjno4jS09o31OCax/lauKKUnYNmwRE
         wJajVl0Cj82a2LDT1G8XYCjws86WzkIsWo4t8JCiO6WPIqqAGtCPCkkCHyvGtl2C419Z
         ZiZLYm/nCjTl71huNfiWipr26Gzrf09cbropqqy1ijCe4vUFopa45Es0O+mrnzm1c4tu
         JdrQ==
X-Gm-Message-State: AOJu0Yzpua+TSA1z+XvUou9pG4cJZQRC+mHrRwJFB2kJ1jaOpfYGRahn
	1m2bXdO3odZwsClvBODyq4+04n7nAmIZX34WXXyGIex3NFyMaz97gy9c
X-Gm-Gg: ASbGncsatKRN0bdt75bWoQ73sBNAL0vVznfDgOD7QsBlYDqXeZHyhwjVgPIu7NzclbH
	H3xUYLPKogqOKrEBeWEvgW7/RVJkpZHQDN8SPr0WXpwZV2QnkB/MTyDU57fjUFnlX7IGBRXR/Ev
	P32LIoW6+JQ3Ys4lAdf50OlqP6vmYdJwSO5U4PNhSO+qZt4KjWs/VcmEMxudvlHy7R2Y4RIK4BZ
	FjFZfQCAsrlzFzqLKWa2Adbal9QJbdnmaOooZhPNJQHxuvMV52z5AHLa21tQKfeBTkLa883bcI2
	Pn4VyfAMVCW1y2b4c/mL/nyGntG8enMbar+QgB4Eedf91PYfaXRSrnJx132z2rUlyO5Ju1z1SEa
	jll+qwA==
X-Google-Smtp-Source: AGHT+IHb1auLczNBxaTokKxKT8OTNVUuMgd7gpT41ZORQNU8eQ5rzK5+ef4IEIxT0hdT8elE8OmEcQ==
X-Received: by 2002:a17:903:22c6:b0:234:1df:4409 with SMTP id d9443c01a7336-23414f61b86mr49644245ad.16.1748102137007;
        Sat, 24 May 2025 08:55:37 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234396eaf62sm1200745ad.9.2025.05.24.08.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:55:36 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v2 0/3] Optimize GCD performance on RISC-V by selecting implementation at runtime
Date: Sat, 24 May 2025 23:55:16 +0800
Message-Id: <20250524155519.1142570-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_085538_762064_48C64323 
X-CRM114-Status: GOOD (  11.76  )
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

The current implementation of gcd() selects between the binary GCD and
the odd-even GCD algorithm at compile time, depending on whether
CONFIG_CPU_NO_EFFICIENT_FFS is set. On platforms like RISC-V, however,
this compile-time decision can be misleading: even when the compiler
emits ctz instructions based on the assumption that they are efficient
(as is the case when CONFIG_RISCV_ISA_ZBB is enabled), the actual
hardware may lack support for the Zbb extension. In such cases, ffs()
falls back to a software implementation at runtime, making the binary
GCD algorithm significantly slower than the odd-even variant.

To address this, we introduce a static key to allow runtime selection
between the binary and odd-even GCD implementations. On RISC-V, the
kernel now checks for Zbb support during boot. If Zbb is unavailable,
the static key is disabled so that gcd() consistently uses the more
efficient odd-even algorithm in that scenario. Additionally, to further
reduce code size, we select CONFIG_CPU_NO_EFFICIENT_FFS automatically
when CONFIG_RISCV_ISA_ZBB is not enabled, avoiding compilation of the
unused binary GCD implementation entirely on systems where it would
never be executed.

This series ensures that the most efficient GCD algorithm is used in
practice and avoids compiling unnecessary code based on hardware
capabilities and kernel configuration.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

---
This series has been tested on QEMU to verify that the correct GCD
implementation is used both with and without Zbb support.

v1 -> v2:
- Use a static key to select the GCD implementation at runtime.

v1: https://lore.kernel.org/lkml/20250217013708.1932496-1-visitorckw@gmail.com/
---

Kuan-Wei Chiu (3):
  lib/math/gcd: Use static key to select implementation at runtime
  riscv: Optimize gcd() code size when CONFIG_RISCV_ISA_ZBB is disabled
  riscv: Optimize gcd() performance on RISC-V without Zbb extension

 arch/riscv/Kconfig        |  1 +
 arch/riscv/kernel/setup.c |  6 ++++++
 lib/math/gcd.c            | 25 ++++++++++++++++---------
 3 files changed, 23 insertions(+), 9 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
