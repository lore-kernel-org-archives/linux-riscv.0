Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C9CC43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MMRSzN3UXv6PZRjO2Eyidv1NFWt7lv325gS7qIJ9SRY=; b=2hqENdRWKvS43Y
	bO8mj0HB7dhrzWWSj3HiH5rrP6gcdDFZqIHk4PmpbLmtOBYpAcamV+QzLc6u2tsb38JyjXuUOX3Us
	DNvqwbkQagsSs+4r7MgD+q4zrLHAjGzKKA87R7hYhAwSQeuK/KqSXBSCC7Y1JBQNazchkrVbm7dNd
	SYnPghtDQ3O2AFQHAc6+CgDErz4he08zhH6LLTUCAWgKS8hzsmk78zGnjqrHuOAxVDkToYCsmjMAM
	FgbxEWQt2V1ByddaNxF/EtISe96tGTDiT9l/KOHnVej+fkYKdR/41TWzKK/x8f5sCy7mzlMWQFSaV
	PmHlzWi5PDIc5mRcEzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0irU-007LRM-Qs; Thu, 01 Dec 2022 12:40:20 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0irR-007LO0-VL
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 12:40:19 +0000
Received: by mail-pj1-x102c.google.com with SMTP id cm20so1752032pjb.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 04:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JDVN8n7be7B0/wylK2s/J0YT9jUx3OP/wVMDKZiwDvg=;
        b=dJrdRvSe8KMdfE5gN+fINZLIJXX/VXm0TAc++CWk5mFtZX6amsjp5PpwKxRNtXT7rB
         VYu+GTHHC5EcDNDjjMwbLyM9O1hlU3a++AHtRNU2svAi7VqmmGsw3vViHN0DctcdxCzV
         XNiVfjRd7zxsjLmPosFHYlXVJ9mPKp9A/d5qfspyVspp4Ikgf9GG4Wn8qXmvZhODH+BE
         3AoRs+4HQtsUtU/plaTWJoyCWM45ezYcQO3fVc6oZErZWoVLuh6C5w3Mt9b2jssK3cJv
         UC1DL2q16nL0oGNzgdL/3dx89rtxPUrlaGBiCfCZclPa+krPpkaUMqt3kqn8/mBvkzEZ
         7QCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JDVN8n7be7B0/wylK2s/J0YT9jUx3OP/wVMDKZiwDvg=;
        b=z+DCaw4z/v1d9hHDR0HCz+nVwdP7NanpYU4UEg0kY3xC7rrSJZsawhqudO0Fw6DcRK
         kjPMIW9mJ5wDZkLuL2NaysN59bh63br7Cg6tnj6esLf69kEJTQa8MNcdLPxcfohfXgqO
         DzEFAbaKjQ+rU8K9d7Tybp4+QwCwMbOI7rlFHfK3QzokUhAxaw1DErwjIWakyLJJvNAq
         0UEXTxDCSmaXDD+UAdrY9FgMXmYSmWoo/WeHLXIuZcEc4xhsWusJQ1zaL6to9joojWBb
         z49N1ic0lKj8Dlyw+ZNgj+BDw+YvEJHz3TQdjEhGqJqKNLO9VF2ebmHM3Eh3uZTl929F
         JnAw==
X-Gm-Message-State: ANoB5pkXHbbHIoWyhllu72O019WhHEz3vqjw5SaPr+8PmWFWCLlAEGC7
	4lxZBofDRhNFaAXod6xVNAKJQA==
X-Google-Smtp-Source: AA0mqf6cunRUAvtUCmUwa0kqMjczfEX9x8NDswgm0g3BXwbyrX5wsXjCNPF+VR8EYBKcTxOYNh5B5w==
X-Received: by 2002:a17:90b:1e0f:b0:213:c5ae:55ec with SMTP id pg15-20020a17090b1e0f00b00213c5ae55ecmr68341370pjb.182.1669898404308;
        Thu, 01 Dec 2022 04:40:04 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.81.69])
        by smtp.gmail.com with ESMTPSA id b65-20020a62cf44000000b0056f0753390csm3246981pfg.96.2022.12.01.04.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 04:40:03 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 0/3] Improve CLOCK_EVT_FEAT_C3STOP feature setting
Date: Thu,  1 Dec 2022 18:09:51 +0530
Message-Id: <20221201123954.1111603-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_044018_032174_D47BA21E 
X-CRM114-Status: GOOD (  10.70  )
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

This series improves the RISC-V timer driver to set CLOCK_EVT_FEAT_C3STOP
feature based on RISC-V platform capabilities.

These patches can also be found in riscv_timer_dt_imp_v5 branch at:
https://github.com/avpatel/linux.git

Changes since v4:
 - Update commit text of PATCH1 based on Samuel's comments
 - Renamed DT property "riscv,timer-can-wake-cpu" to
   "riscv,timer-cannot-wake-cpu" in PATCH2 and PATCH3
 - Updated description of DT property "riscv,timer-cannot-wake-cpu"
   in PATCH2

Changes since v3:
 - Rebased on Linux-6.1-rc7
 - Replaced PATCH1 with a patch to initialize broadcast timer

Changes since v2:
 - Include Conor's revert patch as the first patch and rebased other patches
 - Update PATCH2 to document bindings for separate RISC-V timer DT node
 - Update PATCH3 based on RISC-V timer DT node bindings

Changes since v1:
 - Rebased on Linux-5.19-rc8
 - Renamed "riscv,always-on" DT property to "riscv,timer-can-wake-cpu"

Anup Patel (2):
  dt-bindings: timer: Add bindings for the RISC-V timer device
  clocksource: timer-riscv: Set CLOCK_EVT_FEAT_C3STOP based on DT

Conor Dooley (1):
  RISC-V: time: initialize hrtimer based broadcast clock event device

 .../bindings/timer/riscv,timer.yaml           | 52 +++++++++++++++++++
 arch/riscv/kernel/time.c                      |  3 ++
 drivers/clocksource/timer-riscv.c             | 12 ++++-
 3 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,timer.yaml

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
