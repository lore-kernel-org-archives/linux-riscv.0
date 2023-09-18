Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD9DCD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 13:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kt7TDor2V8+i+0uLrI5Q0DY2HOyGX82IWXecX1Plj+s=; b=DSEviyXdpQskNV
	HTMMqGUOKUeQDuB7ZfBpDyHl2fU/w1aOQXC7U94o2H0aqGsqW10riU47OegviWYvMBFgfWNe+lDN+
	YJT98WA02FxQoY2klf5T/59+B4I6IgXoVCXMDf3m5kTNe5w8WbmZk++656Xoy9Ft337U9IZ3bXrjc
	mxARuy9Z+HXEbWWhWDma0NJ8fy4MkE4rzbKE54npW4lTexYNAh87dVPg5OgDo6p9i7bm2yWikv7tO
	G9matMHfgR4ee4NXtOfAFigegS55/GaozD45xS/+2543DikwMG94fbJCvalNTk8uwRN/MZ3TttwIF
	tLHsqcaJr+5WfSvnegAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE66-00FVlx-2Q;
	Mon, 18 Sep 2023 13:15:30 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE63-00FVjQ-0e
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 13:15:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9936b3d0286so602353566b.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695042925; x=1695647725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W2Ir1Sk4srM7JCVvNjwrt7XvrtWi/G5OfkZCNgeg30=;
        b=eqFS8Qyfo/QT4mfab06PcI32FOgQMjFqFmtES61mMqcJyzD7uDIGNrttDMPMmEpsUC
         VdHpOEmijKtulRctzhMYxW7e1vbg0wLZSZtGjBUdhPAmpOkp5Mo8vokysqrF5Ky7CHAA
         l0jePJ3uWSsWszZ4N1QvgRDi5f/lpGBxUOWYGDunPtS3U4AOpoyuwrZeQs/HEl6x3+Zy
         NxMSK2pgzIBjhGV8xTTU2KspBeEaXwR4Z0r33FtTUK3poe39fBzJjbgP1QkUbpYPq+8p
         KjTgooi9iJSdWIykK0N1vqSFUDSBVxNUaUVBKDAmNG/YZW5yQ847KaGnQNCRnReRgWCN
         GPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695042925; x=1695647725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W2Ir1Sk4srM7JCVvNjwrt7XvrtWi/G5OfkZCNgeg30=;
        b=oi6t5BGVSu+LZaGitSyF4zUEbUcbUGqj+l/GL/PJBqnmwwKlVyE8dsmO1R6Xxv/EmW
         J84DqEwdG1qD52tefO+4KMm/3gILH34zuksfmUvLbiOUpd84s0/JGMsIlGyBmKpqCXjl
         Ij/VpISy8wxUYEcU6tcpv09loESHklYrMIx/q5K8lFOP9XXX2TnZpWbtBTZcaGFucVM/
         ef/FyBIW5Ah1qTDRxrcrmL5+SA/tlqi++TyeE1qSDPMznPlkzNeQ21qER8W9WBy9z7PZ
         w+CA25SK2mjt77t8KIEFfLglkred7+blDU4pH+gKWHngerpySrI2Na8dCNLsEAz5ANBY
         uBhA==
X-Gm-Message-State: AOJu0YwhtZZs18ger5TWuwe6iOm7KFUvj+Ni8swHQPclFnhuHXbJee+2
	MONG47ml+hd3rFqjXQQtwH8rz5Lu7sFwMDeTsik=
X-Google-Smtp-Source: AGHT+IHpIpnGU8/JCW3LZvEJRchUFZgIb9pAALn49p4SxCE7tzd6QDd18aZmtar+ANSyPAVRvkIL4A==
X-Received: by 2002:a17:906:7682:b0:9a9:f239:d87b with SMTP id o2-20020a170906768200b009a9f239d87bmr7068197ejm.1.1695042925027;
        Mon, 18 Sep 2023 06:15:25 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b10-20020a170906490a00b0099b5a71b0bfsm6487309ejq.94.2023.09.18.06.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 06:15:24 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	xiao.w.wang@intel.com
Subject: [PATCH v4 4/6] RISC-V: selftests: Statically link hwprobe test
Date: Mon, 18 Sep 2023 15:15:23 +0200
Message-ID: <20230918131518.56803-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918131518.56803-8-ajones@ventanamicro.com>
References: <20230918131518.56803-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061527_239396_FD1655CA 
X-CRM114-Status: UNSURE (   8.59  )
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

Statically linking makes it more convenient to copy the test to a
minimal busybox environment.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 tools/testing/selftests/riscv/hwprobe/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index ebdbb3c22e54..5f614c3ba598 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -7,4 +7,4 @@ TEST_GEN_PROGS := hwprobe
 include ../../lib.mk
 
 $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
-	$(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
