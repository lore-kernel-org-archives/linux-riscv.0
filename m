Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9A2C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 18:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ju3MDmN1oHIWl/FPOkXCcNrrAmV5WZH+L8mo4QZDQk=; b=e6AjSUJM6iLJ0e
	oRGJSnvukowhwOFSHd5rz19L9dSXJwi80IRs2Y+6kiwX55wRg0d6i3bBvWps1+qNwQm89Ii8bSU3h
	ymPhFCp7eBbGQSORrFzHTiXeuv/4uNLlCebCv9o5vCFODyhXG+c/mLtJmJsj3OOq75wptTmKexnv5
	11a5Jt3NrLW7rlFkurV5JiV7+8Z9mhgZEbpNT95TSPBIa4/YOXUxKdSEyJik9P6St83ds43i5+U0M
	CtOYNaHjn+vnnc9U3Uhrr3MGGwX+c1/7+sukVwfp4VGMEvedvsAvzqvYLdCPjN4XIqCP59pycgOEZ
	6BOPGNi57G20X6SlMR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS1X-0040Zk-2f;
	Tue, 09 May 2023 18:25:19 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwS1V-0040YM-0O
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 18:25:18 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-52c759b7d45so5646963a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683656714; x=1686248714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQsI7h047J9FHkjLVaXj4pH2wY6fQ46ZjPRlcK756GA=;
        b=IeSl81BoOzHrMaM71UWd43qvo4LpjjbcRojb0PFFREcu+EAplF8fFu6fEGBkIcnROT
         Wf7umgahqyJegB8VHPl61sHJ30b2c+X6EhBJFgE8dFYp2v+yct0tS/wo4KuNedFCVUhK
         G331wHGJkHJe1FWse6mD3SRvz5ewJBw0tKLRlHqrFtahcLcLXqYkuc9s5UxAJlCYro1x
         C+/cYASlnMnKQYcQkyDbfnVTX0ngOPCQtFuQ1zNiOocaVSoet0dTsBswBypa0OxCPyxt
         Z0w2CCrbZkGrLaik8Y+yYGz08Mpws/io/c2gYZA3dZ9rb6rXdBWa3yu99JRt7AvU3Een
         X1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683656714; x=1686248714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQsI7h047J9FHkjLVaXj4pH2wY6fQ46ZjPRlcK756GA=;
        b=NPA5HyftEVa1dumJ3+0L1B3lG4ia86GWElpiHTEA1LXmqu0I7uBex2Egf29JUD6keJ
         urXCWCAZJchchrF3+oe483tnYdCkDJxzXLDtcqqplOuqlAQc6ZILbb6lccplbit+SulH
         ntJjlhwpYlf+2IpajqWCBppoyKzDi/rlGXnWt2eOUUMfiClTW7K2VcJUU2q5r1QAMwvj
         2F71gakJwGjUZ+Dg3go/OKmPMIzajLdC44B6j9SjvfoI85gJN/1XxP0pRc3zSM+UYAvb
         boA8/eb/TYwUlID7hDPzNPZwO9PKfWOtBU3eDoFU58/qpg58/4/s3ABZLzjKNFyGo4C5
         jgSQ==
X-Gm-Message-State: AC+VfDyIojQCbxNwiH7MH04lk+HANGHFiYENBRepm5f6kUaNdr4hvLB/
	3yy5wu1xvb67qCHhG7oQbf3Xl2UBDkRV3VazmD4=
X-Google-Smtp-Source: ACHHUZ4bPA7+HJDF8p8EUdGuXAjSzxnfS5SkECRtZUqMSM2tkTOQALtX2I6a7jlXMuannRQs5jwBfQ==
X-Received: by 2002:a05:6a21:7897:b0:100:4b1c:4528 with SMTP id bf23-20020a056a21789700b001004b1c4528mr11560461pzc.60.1683656714132;
        Tue, 09 May 2023 11:25:14 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id q12-20020a63cc4c000000b0051eff0a70d7sm1633559pgi.94.2023.05.09.11.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 11:25:13 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v2 1/3] RISC-V: Add Zba, Zbs extension probing
Date: Tue,  9 May 2023 11:25:01 -0700
Message-Id: <20230509182504.2997252-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509182504.2997252-1-evan@rivosinc.com>
References: <20230509182504.2997252-1-evan@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_112517_159843_B3D7A4A4 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the Zba address bit manipulation extension and Zbs single bit
instructions extension into those the kernel is aware of and maintains
in its riscv_isa bitmap.

Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

---

Changes in v2:
 - Add Zbs as well

 arch/riscv/include/asm/hwcap.h | 2 ++
 arch/riscv/kernel/cpu.c        | 2 ++
 arch/riscv/kernel/cpufeature.c | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e0c40a4c63d5..6b2e8ff4638c 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -46,6 +46,8 @@
 #define RISCV_ISA_EXT_ZICBOZ		34
 #define RISCV_ISA_EXT_SMAIA		35
 #define RISCV_ISA_EXT_SSAIA		36
+#define RISCV_ISA_EXT_ZBA		37
+#define RISCV_ISA_EXT_ZBS		38
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index c96aa56cf1c7..bd294364390d 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -184,7 +184,9 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b1d6b7e4b829..a1954c83638f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -236,7 +236,9 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 				SET_ISA_EXT_MAP("svnapot", RISCV_ISA_EXT_SVNAPOT);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
+				SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
 				SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
+				SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZBS);
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zicboz", RISCV_ISA_EXT_ZICBOZ);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
