Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB4BC19F4E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 19:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GT648ZWVJExjfmITK3uMweE8Ha9JyGJ4lmpNRpf0ptw=; b=eCSo3CCEpft7QE
	jZAIdUnBxzIVZ4ZDGQR0e5cHKu/0bEeVonYQubihm2v3MMzl7hHWfYkLn4yyvhMVOvkK/FiT/JlR6
	5E937MP5bz2uPR0pjSJVaU4SVwj13TTLDhEUneqR5E5pr4QxzOKVRHzGiebURVsWrSGfuaEUE9J3L
	hNRO1qmJLh3swB2JEmr0rKtzNOCHp7wfepsxNFj5wbo069afgJjFZhjgXCyDbIN38FKtCdWbdOZF3
	PKfr2UdqFZganTgNCYofzKAzYbUCBXIrMCGqWpanJSR5T+QwdI2fQLhl/0yaFxDCIrlokZA/38bRT
	WW6lvPwQ8aQo170hq22g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s04wu-00000009uyx-1KYK;
	Thu, 25 Apr 2024 19:40:04 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s04wn-00000009uwC-1j3i
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 19:39:59 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ed9fc77bbfso1194965b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 12:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714073995; x=1714678795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6MTGRYaUIHK6Fet8BjuAzpG4Jp++enVeHDo3J8VQ3BU=;
        b=cy27DCuiSFkRppyRPti9Z49QWAJecisyYh00wnClVxDRylZEfksPcmnXW6UWM1lZu3
         5uXR5oAD2D9+zNJbK7neLFdyVVZhnZcFxZmQ2jOGfV/4S7P8V1SAzD2AEHER67v6RlT1
         1/a7YPH1QChKRFQhIXq3Oty2Mc051hS+ASbmRCDG4LKRI/KsZD/aQ+vVCVQOJajt2Vg4
         qvZy2xHQuf0ZkmSoLhW7vooQC7ztCh2HnUaI2EgjEP2HT0wKxSv7S9f3Kcjv352BlDSm
         GLh9NtXaPYZihvDcUpOsw6yPgUNe891HkIAqo9tye+3iyF/LWHsuiDBPYt1cJ5CIYnHJ
         Dgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714073995; x=1714678795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MTGRYaUIHK6Fet8BjuAzpG4Jp++enVeHDo3J8VQ3BU=;
        b=qjskqRMIE05uKab90maHupsVTgGOY1oGLd1iO7A+bWufHIW5SJBWAKKIIA8etaUmX8
         UE1DyYXcr5tf9mJG5rlFOuuRuRWj8gdvlpsraNMvNowAwdoCOsn+kr0T/vOdzIeJvx1o
         iuV+HSzzhQSAcnLckoNKvfIMr03Gju5OeBopUWZSOJtilhufhOleirf8deq+aUQSzrXU
         N2uleUfkJHiUS4jRtJU+RsksNNXUWWP8svXpn9tuIr7okEE0x/PgvGkcWv4C9vXI4O+m
         0gM8aeC3JcfwXfdcNYYt1aiOVBbqGEsugBQoFv044yMTx+vi+HUG+avS4KrdUJ1Km3r2
         tAbA==
X-Forwarded-Encrypted: i=1; AJvYcCVJRHJ5PrXnEkfJQdyym4KAzBjZ1QhOi6Ebr0wLIwSDKuTuSvAw24EhUbQSKYqxjpYHGF4C8ilDglMXZ4wTXRGmmtc0WfdZUZFNAPSQx0/0
X-Gm-Message-State: AOJu0Yzn27Q7LNUEFBPB1ghZ0QH2Yo/3qDIEhQfWYjx67WzbJsYxQnKX
	TnBH+HQVba7Fmx62IVclUYwF5qPSUCx3VvZBqpG/Dg3FPCUE3J4uiejp/CkDWxQ=
X-Google-Smtp-Source: AGHT+IEVwY448vWFB2jsVNySqj5bBnZ/RoQHWs45mANoicnS0fF3sAvuTjEUyQlM04N/W+0OKM0nDQ==
X-Received: by 2002:a05:6a20:1046:b0:1aa:14a1:e5ef with SMTP id gt6-20020a056a20104600b001aa14a1e5efmr737836pzc.38.1714073995020;
        Thu, 25 Apr 2024 12:39:55 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fk12-20020a056a003a8c00b006e6a684a6ddsm13525487pfb.220.2024.04.25.12.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 12:39:54 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [kvm-riscv/for-next 0/2] Fixes for kvm-riscv
Date: Thu, 25 Apr 2024 16:29:30 -0700
Message-Id: <20240425232933.4111680-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_123957_539854_484D8E31 
X-CRM114-Status: UNSURE (   6.96  )
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

Here are two fixes for issues found during review/testing after the
series[1] has been queued for 6.10.


@Anup: Can you please squash them into the original source commit 
22f5dac41004 that introduced this ?

[1] https://lore.kernel.org/all/20240420151741.962500-1-atishp@rivosinc.com/

Atish Patra (2):
drivers/perf: riscv: Remove the warning from stop function
drivers/perf: riscv: Fix RV32 snapshot overflow use case

drivers/perf/riscv_pmu.c       |  2 --
drivers/perf/riscv_pmu_sbi.c   | 49 +++++++++++++++++++---------------
include/linux/perf/riscv_pmu.h |  2 ++
3 files changed, 30 insertions(+), 23 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
