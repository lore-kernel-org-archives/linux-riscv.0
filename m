Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5B5EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEM2v8cQJUboyM0C+J/bdTP+bQpzUOpDgZBnxLb/vBM=; b=Cjmd+RdSpiu2iQ
	H6vKP7AJ4m3JRlxyqgFT/ibvH3QwBl9uy7Lv/7zx3dkge4XGymGAGPZobfAQ7p0CK83xr7ZOchrKH
	tOIfdCIKOYvqCse0GmlznyFkQsS5xHJXXaic1FCHD5imVKEAHbRCIsqz85j8Jeet5miOfOq4HB9Wg
	1ZKlmgoJrst3Ck9keOWLKMl7roe6DmaywpiAonPj000Kq375p5tGsuLB+CIXPwO4hbb2AG+nWPQs1
	fBTehlLg0ohrR21ASfVqe1ZfgpD39z8Oh4c9M0CMUxMWlVDbCbjiurX7vavcQ7bWRpbNe1uYc39Jw
	DT8r/gQOevQPxCtqr30Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qThmi-004pcc-17;
	Wed, 09 Aug 2023 11:55:28 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qThme-004pZf-1a
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 11:55:25 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-99bc512526cso972387166b.1
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 04:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691582122; x=1692186922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRg32Vzxt2vj6MCCwdIh2VMqWx1/ZnyNLml7KLO9kb4=;
        b=pnUHYfy/2hddM+UPN1qJvzjymd5wW5LWnePaXMfrVWbyw/3p5V9mbH8zGlbOjDHewO
         2MUxx6tqmawDtl9qb8F5ywJ2IVl4JFmx82u6/IwHHYk0JSKEs5+Ki5PD2f90gFxeHuUa
         Ed8Upxo0UGgC1/qu5kORSZaF8rNCyX2T/sISxYRjevBdbLIphzZqR5mT8hk7aAXayp9p
         SqzG+ZnntmKcStMij3q6/kwvGyv2w0l5IbktbGXKdmJYj4GUXcb3D/o84ow08secTei9
         08JiP53AgXt60wqpsli/l/Ndb/7oaVYt1R8V9dzSxEaxbtVoMdKn2GiiLCC6MN2OiNiS
         4eDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582122; x=1692186922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRg32Vzxt2vj6MCCwdIh2VMqWx1/ZnyNLml7KLO9kb4=;
        b=gMcF0Sn/wqPoHyMQNard0qcN7N6s0SAU9/YniudbhH1ZILYD64D5aOHtrBBMM/pS7u
         xa+FfDo08fF/Cy41lOzGlmyfDmwXUV1kPx+iMP+sgojBGLF2C8YoppAo4TWDhDUBCuOQ
         l8+wHGvvmv9g/LudsXA9s/7N+oyQ6UOvMaLPoyBy3fyNMwNhAiraPLK0zGqCzcU/cmlZ
         rd1KkkAAvo3jerUpT4iByuf1hAqVwqoE0USmwSCn+I32SHbniwf6r+NjBABPMcQvO4WA
         6Ys7q+Tb2X6ByJ4gz3jP8A8Gi8jifuM4T4datitvlh6BaVq9QG/sCdEuSn5qE1T7tOUb
         JyoA==
X-Gm-Message-State: AOJu0YymrJZ0Vz+hzR0azTVF8i4gXfDPb2FbN2ws/xAOS2f12tFaxyws
	S+T4H2rJHitWANcimsGuMXGCPrmE7XXDAX0Brb3XFua9U9w=
X-Google-Smtp-Source: AGHT+IHsXVQi1GObUmNYhZfkfUuPibUrD/iqz762JteZkmt7z8oDS54jQ15eNJg96hvt0/TjGqFtgA==
X-Received: by 2002:a17:907:2cc9:b0:99c:5728:aeb6 with SMTP id hg9-20020a1709072cc900b0099c5728aeb6mr1778237ejc.52.1691582122540;
        Wed, 09 Aug 2023 04:55:22 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j6-20020a1709066dc600b0099d45ed589csm413519ejt.125.2023.08.09.04.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 04:55:22 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH 4/6] RISC-V: selftests: Statically link hwprobe test
Date: Wed,  9 Aug 2023 13:55:21 +0200
Message-ID: <20230809115516.214537-12-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809115516.214537-8-ajones@ventanamicro.com>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_045524_534747_EA12C6F2 
X-CRM114-Status: UNSURE (   8.62  )
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
