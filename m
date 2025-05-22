Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CA5C54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojuG3RxzUSXOKXX2S5DN+ziDkVoozQ6qT6+LIKY0DQ8=; b=k0a/IIp3NFkiT9
	vVfOpDt320dVAzX1LKE/HIGZYoKNahTPSth8VSEMpeEP0UZCjsRadLrR1A4I6iFXjK0qS0V/QZBNI
	yAyI6KoQ2GK1QfvFc2DGse2q0ns8WcHPk/GIcKmhYhBOlc+Dq4zNKVTflmqxbvLof4b4K8HpAFxA2
	17joMXHzY4qUKB/j6si10VmjCafyW+XRQwGMjY0kFiGgvQgaUnMx0V7wGx5wqgWaEGHRwkm72n0OG
	RBiqe94zNF2gUCDcl8Ta0WOU4HexiIZeqg+yWNifV1xLHN82xU2dQKswkOOYpzLaLhRyWGVwVvTnn
	vHIGb5Y9mhQFBPCJdmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCo-00000001wOc-00Ox;
	Thu, 22 May 2025 19:03:50 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCk-00000001wJy-20Py
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2320d06b728so46161525ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940625; x=1748545425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1p4+AtteizaQRcJNZKx3uxkrKCkThIoqx663iDBnv3Q=;
        b=g7xfVixSDqssAwetdlQA8iXef2n2fdmbszILS6sFBGgxQuqT0KYTsSaoc6iFALJi4k
         I457tUyqdX6zqhGkCA6deQ7co78y+YcCz6BhHvQXzsCKD7dMzJjTZngQXTKNNFOAikol
         gYXk6lTw2piMNFAf4r+PEIolDL36c1GxhZSmSEtinDUX9o47RW3KHgwNAoK0FVT/q7Bp
         Arhvncjt5fNzRYbFtNrRVODqCx0oxRzGwpqDAZit+vaoEhlqvR+U5m7LPBDAY/aAhRoF
         fra2w1BkWruHsZPCIvjo+jL4lFckgmj/Dnja7NAMjL9b9m7mepF74QbQOOLFH+J4QnNt
         4vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940625; x=1748545425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1p4+AtteizaQRcJNZKx3uxkrKCkThIoqx663iDBnv3Q=;
        b=mvpYo7tkY6t+6YrfzV1qMdNCnubyk7B949QgSekyAaPrxpYrImHOR59L9SrE5VEoVk
         rS6utOJd8yQ4tu2jkOSZ8NEwtC99TFLuDpRunXzk1w0UWhoLnoHlkyCA8aS8uvUUMoKQ
         H2pe0r3QvuzOaKGbyFgiatxvj6J9MnxeDnf1FsJ61Xpq3MGTMO0JFYnvHcLNJfDhCFiS
         FwLAX4qTw1cjB+lq4VbGpYbqP2p6irTV/WVimB5449KHOT9DtXMTI39jQeJwkAT+w/Tv
         d5gXDqteZAw0pxjQ+7crDRt6ERW9bVPeFawsvwUns5ZRs+5nhysK6mxjchmTMgwdusQs
         shuA==
X-Gm-Message-State: AOJu0YzFOZJ/GWatjzOgSF0wEnFQGwWCjTV81WpU1mRfnuDSej9HUtLc
	pCYrH6rFlOyrWQRgoXujd0PEcjaunW7tFd5N91CNbfe1VRwFFrIWYGx9F0htoFx2BpU=
X-Gm-Gg: ASbGncu08eOYTtr2/BDT0+A/UVLAYw4d4PvsCXG5yQHeDLNKTJISEfgWoGmtxmT544o
	rzdHkwUTHZIsjEkV6+5CaQruoyLJ9SwYX270Q2Hq0TVWblaK30/Wlh6dhCd9VrKDOp+KE+WFPXs
	Qpal3glOWv3qchM8bWe0oT09/gZ/i1zabYTJYKa5nMHQ/Qvlvlpznthg6c50AXbltS4FHvbl9oQ
	sxzWkpwh/1gEPjtAML8EALSAWqgsJhRT5lyYRncrRxlTCPdgM5eb7WUiinLFNtp6BY6H+DprT4y
	B+ONqeHyKbwyQ0qaFyUIxVxLPeUqItUMazkvy25viDTYmU3sUNuI+lSrvZyCRXr+
X-Google-Smtp-Source: AGHT+IF60CjGVS+XkZOaK5ku4lafcj/BktLeKZMLaYLRiMYA2gu0KSgvj+oaPNmS3vGSkFgOpISftg==
X-Received: by 2002:a17:903:18d:b0:224:c47:cbd with SMTP id d9443c01a7336-231d3257fc6mr374153715ad.0.1747940625547;
        Thu, 22 May 2025 12:03:45 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:45 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:35 -0700
Subject: [PATCH v3 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-1-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120346_530551_8159440D 
X-CRM114-Status: UNSURE (   9.10  )
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

There are new PMU related features introduced in SBI v3.0.
1. Raw Event v2 which allows mhpmeventX value to be 56 bit wide.
2. Get Event info function to do a bulk query at one shot.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..cfd6946fca42 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -63,6 +63,7 @@ PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
+static bool sbi_v3_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -1452,6 +1453,9 @@ static int __init pmu_sbi_devinit(void)
 	if (sbi_spec_version >= sbi_mk_version(2, 0))
 		sbi_v2_available = true;
 
+	if (sbi_spec_version >= sbi_mk_version(3, 0))
+		sbi_v3_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
