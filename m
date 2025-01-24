Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA80C02181
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jan 2025 04:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mEt1ZN9jhUFpcAN8lMmbG0bLV15jBMrbb0R8/hrPKuY=; b=f4AmP2vIvvLpMM
	GUvTxV7n/wyPvQX4v4h3s2XgBjcEdfO1qrjyup/qj+R88pNojArBm/McvOQTxOOR1Ndl8orzmmcvE
	OTfg/+D3mru56+W+GzrkHi9irYkTFS4rhvpRoHSo4/h9dblfvym4aCzfo2u5tu34OASyIQ0Juggrs
	MY7uH3kIlBJROSREb4tyI5Zs1fpjOAYmjWr1YzAI7lGHp/yWXPbWHeINlpZxxHNca6MvocMaIYJQp
	EzSwFIRmtegzLd8BoJqUZ6GD2QeFszP6HxlpJeHir9bdtT5iTcf0KqtvJfov1fDuL8tyl9GlHfmZL
	n6Hp5so371yl9/pOFLYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAsO-0000000DqkM-3Zv9;
	Fri, 24 Jan 2025 04:01:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbAsM-0000000Dqjw-1RJT
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jan 2025 04:00:59 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-216395e151bso22524215ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jan 2025 20:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737691256; x=1738296056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lowTk9aiYfu2S+1YMHhjcUoy6Ifdfd28cH1lFEtMNxg=;
        b=aocyjvhGzt7pVKDnRV0rd5ajsrBBOhST9gZFDeVT8ZK5Pdy1+UrdYf+lRdLBKeLPpr
         k+7IWxvi+yXdJ2xYzbY4fwWPm6GKZay/N20O3MZRJZin1xV2gcjM8UxsT30Oq+JkqEUt
         mna+IEbSeTTyuleDfzHk1lV4H0hosSsfVZTokCl2p5dRWdAkzxSg5SGdbTY5Wz+K2qeV
         KZSeXIgcMX1pNxVv6+Mx2T7/x/LcmD7hflMYjpAv2VbxDG7ugiCljQjrQbUIhhmDZpKd
         9haATDWH9SOWSr1ANWvHU4MVlUz6dP5Sca7PyHVxL9BbOUj0gqegpoSeIevD0dhzYVep
         ezDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737691256; x=1738296056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lowTk9aiYfu2S+1YMHhjcUoy6Ifdfd28cH1lFEtMNxg=;
        b=cGpVVd9RQTBisVo6SOMoivUWFFFevQbnW/mfQHcU9EjsZP83HMtBQF/wvTJp/E6+z0
         G4hTEIdJguziT/tTXu7byLA4+E1lFTrFfGn2W8dNNvuz47w3Af1ICN7y6Cu8YqxUcONr
         2Z0huLnyrIYlBst3xgjGJ+ptX9SwRPVPVtv0kh069V0jn/YftKrCiul94oTlbaCbsX82
         Qu2PYaoiOIsc15n4toqCxzFwoe5HOYiUhBddDWklj7k8jWzcv1lbrHnMTZBl0mn+kdR/
         PxdnZBWc9xyXRcZqzMg2kBQIgrvMsjiOqj0Rc5wd6+maxm1hWN8ZWWm28CRCoGK9xhXg
         cilw==
X-Forwarded-Encrypted: i=1; AJvYcCVmobLr19qczCNM66xoRI66/7d0pMt8rm8a/st6ifOOA6ijcNGLcHEyoIORG6RNzIqLhKHn3Sdbj97jzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdgzsF9ZCmjE0kByoSFuWZMOng/EYIA/oNuLUIXMCKSHyNSivJ
	yid6cak8tqtJIwipePq0OEl4viSCIEwehdR4A2cqIydXC9Sz6yGv6BAFstx9rJI=
X-Gm-Gg: ASbGncv9ibOYiOtu/6g5UU5pmGHrL8pfdqdLJa8AR45TBIgA7ecDjmL0cLGMbOsFCN8
	xs+ztuCiO0BzRodP0NTZ8VimZ5+QxpTNUe7IU0u7+85eKP8zimqFHqJs4abrp6XbRHubuVXGnNT
	u3c6YJMaTJiX9z+uRyHjiSQLs6IH4+qC9ig+IxslbsWlp9Do5Aj9kuPtPEPrVvRzGUdCSt4wUgU
	7DVQEaG2l8x4WPZR6YHVdJ1C5zOG8ca2POOV6mG4hdcwIMV2qMJzduVTpUiSY/LwIPzYPd1dIDp
	NIvin8CBaM/32U7RRJW2JDo9IAkiqEyLevTH7VRCPvV5cV11/g==
X-Google-Smtp-Source: AGHT+IF2S4YVOk72i+gmuMaJGfQDN5Q2NrC3RvrGrOxrDJRorKXpriRqzs16K3FSFHQ6l7Vpi8ulYw==
X-Received: by 2002:a17:903:124b:b0:215:98e7:9b1 with SMTP id d9443c01a7336-21d993177a2mr87571155ad.5.1737691256294;
        Thu, 23 Jan 2025 20:00:56 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([2408:8406:78d1:bf49:24c4:f518:9b3b:36de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141d67sm6758915ad.153.2025.01.23.20.00.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 23 Jan 2025 20:00:55 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v6 0/3] Enable Zicbom in usermode
Date: Fri, 24 Jan 2025 11:59:56 +0800
Message-Id: <20250124035959.45499-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_200058_531399_A327DE4A 
X-CRM114-Status: UNSURE (   5.79  )
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

v1/v2:
There is only the first patch: RISC-V: Enable cbo.clean/flush in usermode,
which mainly removes the enabling of cbo.inval in user mode.

v3:
Add the functionality of Expose Zicbom and selftests for Zicbom.

v4:
Modify the order of macros, The test_no_cbo_inval function is added
separately.

v5:
1. Modify the order of RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE in hwprobe.rst
2. "TEST_NO_ZICBOINVAL" -> "TEST_NO_CBO_INVAL"

v6:
Change hwprobe_ext0_has's second param to u64.

Yunhui Cui (3):
  RISC-V: Enable cbo.clean/flush in usermode
  RISC-V: hwprobe: Expose Zicbom extension and its block size
  RISC-V: selftests: Add TEST_ZICBOM into CBO tests

 Documentation/arch/riscv/hwprobe.rst        |  6 ++
 arch/riscv/include/asm/hwprobe.h            |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
 arch/riscv/kernel/cpufeature.c              |  8 +++
 arch/riscv/kernel/sys_hwprobe.c             |  8 ++-
 tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
 6 files changed, 79 insertions(+), 13 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
