Return-Path: <SRS0=esFF=N6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D0FC433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED0F6108B
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Sep 2021 17:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EED0F6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xE+nZ9P2qZRfnU/oAv1wTKezfvpLrzYay8zZE56JoCc=; b=SoJNG12wSSsatF
	gJjzJFvlWeyJUMxib1DecYPntrgU6vf7zS9aH7XQOmI4N0hs4VYMnCdqHsJKGvqnWmvEC5t9GrWS/
	YMolYj2v/GUbRWZThBQt9k0Agy6e/r9il2HJkHEW9pZw1V1CRVeZ7t2L3D0yM5Ds4Kcxt8QT9v8bE
	FKSYTWeu9zk63vYjJmwhgGeSlZtxkdAr0cjU5FwkUgXV6M/dkS8KIlWVJKFd9E5PfjhvgpjUbIIyr
	UDdWCHGMy+9Giky1iXQxwcss9dw+zBe9GhXJsGh2HXu8N0/MstRIoSG9VnYqACn2Z5t160AJI9keV
	Jf/mqRG7ljkQOMyMewUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO1dy-007IUt-MG; Wed, 08 Sep 2021 17:45:54 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO1dq-007IOi-5m
 for linux-riscv@lists.infradead.org; Wed, 08 Sep 2021 17:45:47 +0000
Received: by mail-pg1-x52e.google.com with SMTP id t1so3415086pgv.3
 for <linux-riscv@lists.infradead.org>; Wed, 08 Sep 2021 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7XkWr62oJEVCe0UkWr1Pq747FULmbnq2d1BeCwv5JME=;
 b=KkX3o+mwumw1PmtYzRmn3yb2Lt1FwfifxyLr2h4/tRIhJHOadsUY849d9UOHMOctyk
 DMPd0emSS5ekDAU4TXqnMRmTDMaWRS5a1B/xcD8ljMLeY21BhGaUnVLn4mh4rQSyyoF4
 Z6F7iTMcaA1u3SXKcnk87S/NJDhs20++Y0Z+GNtgEv2H+FdAjJYGqxrdo3FupLCdU5iz
 MDn56QiQMw6xYSnfhHx4xCDyhHSOpLIl9nMpNxeFGHhJ6j+npwkwgBlo2RV9rjE/NPwz
 JGOWEsA749WP/Noc4rZRn7n1aN9FjDYX93G4gu0MpnJDumoffp+N9klKvTQPsSWxpQjD
 oBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7XkWr62oJEVCe0UkWr1Pq747FULmbnq2d1BeCwv5JME=;
 b=6WV3F/UkeFTh1lVAuL1BGfd2zq6YQ4QhFS/ukAvt1vAS7xPQkXaMA+p9daCHd7Hy40
 aZNzXCRpM4vZJuE8j0jRJA/HVBQ9W0e8kFA/9qVkHqqeGLQ1EvYyGQWlmmc0EDj28DgK
 NP1aMcM3HBQqyyDLNNPE6ql5rwjPM5C5BqYzmGWHFJaBgEZXDbca8BnU2xluPAg9n5it
 Zmsak7HilTlR6R2EzYXC+8vpbbX+vTCdrzkiSz8JVyM9FVdN8t3c6WZ+zEGafZve4GAD
 L9rfRpET8Hs0nVALtUufw2Cb0AY57SWS6GX1vROhM5+q+bdkkdEH0/t0xAzDnJESI7YK
 F/nQ==
X-Gm-Message-State: AOAM532qZqUHStR1v93SHkZiq0v4X3vY0jxAYML6ymGlvfKhRIGAUAGW
 jWrNdi1tGfuK4dkTr781ba/Pvv+usmSiWw==
X-Google-Smtp-Source: ABdhPJw1bfI+VZ6LgcKZ/m09m39T+LvYgh0MYgMaEQbHKN4lFwSePf2BSdrAs8yeIYa5VwS5sM6+YA==
X-Received: by 2002:a63:4f0d:: with SMTP id d13mr4774759pgb.169.1631123145337; 
 Wed, 08 Sep 2021 10:45:45 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id b5sm3108466pfr.26.2021.09.08.10.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 10:45:45 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
 vincent.chen@sifive.com
Subject: [RFC PATCH v8 06/21] riscv: Add has_vector/riscv_vsize to save vector
 features.
Date: Thu,  9 Sep 2021 01:45:18 +0800
Message-Id: <05f277fa32f74cefc76a8171abd7430e772753e3.1631121222.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631121222.git.greentime.hu@sifive.com>
References: <cover.1631121222.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_104546_268275_C7238023 
X-CRM114-Status: UNSURE (   9.64  )
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

This patch is used to detect vector support status of CPU and use
riscv_vsize to save the size of all the vector registers. It assumes
all harts has the same capabilities in SMP system.

[guoren@linux.alibaba.com: add has_vector checking]
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Co-developed-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kernel/cpufeature.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 7069e55335d0..7265d947d981 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -21,6 +21,10 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 #ifdef CONFIG_FPU
 __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #endif
+#ifdef CONFIG_VECTOR
+bool has_vector __read_mostly;
+unsigned long riscv_vsize __read_mostly;
+#endif
 
 /**
  * riscv_isa_extension_base() - Get base extension word
@@ -149,4 +153,12 @@ void __init riscv_fill_hwcap(void)
 	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
 		static_branch_enable(&cpu_hwcap_fpu);
 #endif
+
+#ifdef CONFIG_VECTOR
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		has_vector = true;
+		/* There are 32 vector registers with vlenb length. */
+		riscv_vsize = csr_read(CSR_VLENB) * 32;
+	}
+#endif
 }
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
