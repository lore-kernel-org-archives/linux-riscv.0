Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97E8C52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 05:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a8ar2hvJFgYd7nANb6g41UWhs3hPv9yuEGzIEN9z58Q=; b=qzplSdTas1NY82
	dQoEczZM4rBE7HyvnnY/JNa6u0B0f9E6vnGtMOp/wGJIkeCaw7gb0kY/zqrVp8Ny8QhOnBmDnu/jU
	8gwRUo9tPKAuuJ9CVFBCWFZLAcfc76uIUwPqlQbdsnc9vDcovaanDleAY/XwFwgmh9J4jb/er45oD
	kiCWTiVhojwBEeOId256OXQiG5xGURCuwEAQFgKc1lUTVjVPGFa6khoTfZyLHYSIRuXmvbESIJFMo
	BsvDQnr1mXBToCBUPKCtj3jeDGAxefTiOK9F9Q37b6sQSemF7GhyCPKTxzqUGiN/jLrMTF7p8yY/R
	4BoekgrqXeREDRHRHUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se6oP-00000005pnj-3PmA;
	Wed, 14 Aug 2024 05:44:45 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se6oM-00000005pnF-1H8n
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 05:44:44 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-76cb5b6b3e4so4129530a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 22:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723614281; x=1724219081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOO7x8iSBvV0De6dCZQ1mV4ufVqP7fre5DuTvGToFgw=;
        b=fIR0YVS1rUixfdd5Xx5pac+7rCYg03TSZlYanwrgpiGkRNdzEqM4W+elY5YfZofNAr
         9T5e9Z1lMI4ppyHQjJyXPUkNAZAk4P6yaBOrUnvw8HDe7bAxhzQfmiW3A0AMsYv1RHdJ
         hiEmxgq39/OiFHk4DBt1HIfaNrZLtXIY4Jaxw0ZEFddFuPq98LkvOMjGTQjEQ+75rKVP
         coEIiPfSeDpRaQ0JIyUwbZxC6Hqm6qyqZkq5gNwIazdLcAEOr/ey6l80cf5z1r+4exnX
         QxD8c40b4DG0QwUyXd9A+/+x75hxOrcmSer1LLGRYFZyQwab0lbGEsgT03Yf9YImyDsm
         pEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723614281; x=1724219081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOO7x8iSBvV0De6dCZQ1mV4ufVqP7fre5DuTvGToFgw=;
        b=CryCPFeelhxjBTfac8lxns5cNRLXqamAcQkogYdiVcxJ2VwxEDIAOiP//BL/K88fS2
         PI31oCIYtFBerZBTrB1TRZcl1iIbgSoDJqoVTFkurPSjrOmYjmZ/c4Qzw3y6KKk/4Rs8
         /pHBrGyWujwd+a1YYg8/NnHI4lZKyLGnjrzvV0Y0060X/RAXO9x9XnoY714a9ielKkSS
         n5H42nlF+pyzAeS/dosNXS82tRdSyFoNHh7s2a5mEdhsLRjqPUghWWUI/tBo+4ya/D+n
         JE9+LgQ70dTULHr7L4SP7QLn9J/omj35M3xTwLbxQLaT3k8aooOFxIB6eko0aMJ+tHJX
         Zq8g==
X-Forwarded-Encrypted: i=1; AJvYcCV6eaYoxJW8vVWr1yMmPMN8ZGT5oIg3zs2vZB/8Ev99J9M6tnYfPUtp79Jr/1kv9Wqtke3LObfbNA1i61RItWmTZz/Q9E1h3/LUsanenEpr
X-Gm-Message-State: AOJu0YwOVA3KqaRsVZAbXQq0zfYwpRiX9wI7Z9a3hREXyhZBuwnxrkR8
	d3Ec73UqdU/zXGpgWhKXmztEoD1NthA3uPVr50ZPRM7T+RDMJDLC+9+vjoOsGC8=
X-Google-Smtp-Source: AGHT+IGuQTz6SVKJdGR7qOzZH2eW0RKBxe5F6pnliwORwQw6IjLS/PZfnZvv68tOCBbgMC5KQYJ5VQ==
X-Received: by 2002:a05:6a20:d49b:b0:1c6:b364:dbd1 with SMTP id adf61e73a8af0-1c8eae6f450mr2704301637.19.1723614281087;
        Tue, 13 Aug 2024 22:44:41 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1ab486sm22062085ad.150.2024.08.13.22.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 22:44:40 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: anup@brainfault.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	greentime.hu@sifive.com,
	zong.li@sifive.com
Cc: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH v2 0/2] cpuidle: riscv-sbi: Allow cpuidle pd used by other devices
Date: Wed, 14 Aug 2024 13:44:32 +0800
Message-Id: <20240814054434.3563453-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_224442_404604_9671E158 
X-CRM114-Status: UNSURE (   6.89  )
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

Add this patchset so the devices that inside the cpu/cluster power domain
can use the cpuidle pd to register the genpd notifier to handle the PM
when cpu/cluster is going to enter a deeper sleep state.

Nick Hu (2):
  cpuidle: riscv-sbi: Move sbi_cpuidle_init to arch_initcall
  cpuidle: riscv-sbi: Add cpuidle_disabled() check

 drivers/cpuidle/cpuidle-riscv-sbi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
