Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C489AC4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 15:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0Hs97I3dk+yZFfyuOe0lTnUZ6MP6u8VRwWUQq7P+X4=; b=DNaczkQHxmUJ1D
	r5w2tIZ4yr/5SUqfPw96ifQxgzUd2zcd2xlO02LLsiB50VeTkTadtU/EaTHEamCe+EJ3djyyHpD2M
	KenSzH3K8UrlMNx3NF969SRERZmnPZfJ8g5lYjHnzoeV7ShbUhL0fV4Y3jK7UQyPwvOc/Wmiu3sDd
	edIGth3hVmE5M0yl0Vtz+KVxBA9wVJX7n3S9Jyd/ZMe4uoZXkin5hBgjM5vAWxfwcYSb1w3srGBbS
	Z/cRIB+DTKy27jD98XZxWjhqhUxtAo7WMVspEDTGHIgCreCJWLSB3qm5CoVBSC294XACESUyTESA6
	yhm+j0fUEszOkPeauU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026j-009XAv-Au; Tue, 29 Nov 2022 15:01:13 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026W-009X4T-MA
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 15:01:02 +0000
Received: by mail-ej1-x634.google.com with SMTP id ha10so34500389ejb.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 07:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45vMajD9uQw7DJBlJnq649nNKt2LRzKK21bL2UGoFbU=;
        b=CWNaeLXKYfhChhhmBLzBm3yP5Z+I7S3/9GB+BOOeGUtcyqZ9yMAaaCVtXYgtjyJLyZ
         m/xX3ZSqrNIzDJrHcIbW7k+DKDmGpVqJ9okpy9bra/ya1pq+5PYj0wZ19udrIcPnhDbP
         eQjjTzXdl2zV16uvkPROReHWX5sJNne5SqV1KsmkjYtRzTI4KPRe+0WST1KVbuLFMYPz
         bxyepF3IY6gPlQRM14lim7hpzMaoBckZvfiF2E9w9QgqkrJ4kIDeBvYYDFIQE6R1PWhW
         +UQC33kQCEh8eQih72uDNLfNRRhNa/5kf0n7yBlfgWdnGrwOOKAK9Zbe18xpCEEdUxcI
         M0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45vMajD9uQw7DJBlJnq649nNKt2LRzKK21bL2UGoFbU=;
        b=yguHIXQ7TlQ5rAhGx60Si0/epPz3xBHDmnHL7AgV0jk7iQl0Gt8Mu+hXhWS0QBD46L
         ktlIYmfSCmaZvHJxeHCZ/W+geoepIy10+QstNc75cNC6EKufTpmZeJiQwAHPHwg9nAzz
         VlK6wgGoo14jDPgIujLnjmp3VUiZhEKZNTEpCqTVUMQ+GrOg7dsRxYNSUqIiLdTFNODa
         oRweRwHabvRg5q13aB3gZa5IDK/Mrvzauxpj8qK4K0vEDakiA6zl8roGS3Dn9VKmBAyM
         WZ+d1DXD2AWwlYm4v6yPFhnBTAb1yvJ9juxFAXfXCxebBStoDGvQZOso9l/nIrLfX5dI
         i6lA==
X-Gm-Message-State: ANoB5pl52X7O0iNicIdRoc4S6LvjMIRTvRIYgzasaxSb5oUY9sGl1SjU
	TYCAv28DcOEbRdkA038nRXc7RE/DccgBUw==
X-Google-Smtp-Source: AA0mqf7Ppkky8sEIgnKbepBCRdJTKR/vIKo8H/Sr2xqUCIG/dYvqbAo8s0Tw+kpKhLdOPqoOxGnqzA==
X-Received: by 2002:a17:906:1748:b0:7b2:7fa8:3d84 with SMTP id d8-20020a170906174800b007b27fa83d84mr6382813eje.650.1669734058643;
        Tue, 29 Nov 2022 07:00:58 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id de52-20020a1709069bf400b007ae566edb8bsm6271333ejc.73.2022.11.29.07.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 07:00:58 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: [PATCH v2 2/4] riscv: alternatives: Don't name unused macro parameters
Date: Tue, 29 Nov 2022 16:00:51 +0100
Message-Id: <20221129150053.50464-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221129150053.50464-1-ajones@ventanamicro.com>
References: <20221129150053.50464-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_070100_737968_7021F164 
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

Without CONFIG_RISCV_ALTERNATIVE only the first parameter of the
ALTERNATIVE macros is needed. Use ... for the rest to cut down on
clutter. While there, fix a couple space vs. tab issues.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/alternative-macros.h | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index c7036166af2c..7cc2b587c5c4 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -130,28 +130,22 @@
 	\old_c
 .endm
 
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
+#define _ALTERNATIVE_CFG(old_c, ...)	\
 	__ALTERNATIVE_CFG old_c
 
-#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
-					CONFIG_k_1,			\
-				  new_c_2, vendor_id_2, errata_id_2,	\
-					CONFIG_k_2)			\
-       __ALTERNATIVE_CFG old_c
+#define _ALTERNATIVE_CFG_2(old_c, ...)	\
+	__ALTERNATIVE_CFG old_c
 
 #else /* !__ASSEMBLY__ */
 
-#define __ALTERNATIVE_CFG(old_c)  \
+#define __ALTERNATIVE_CFG(old_c)	\
 	old_c "\n"
 
-#define _ALTERNATIVE_CFG(old_c, new_c, vendor_id, errata_id, CONFIG_k) \
+#define _ALTERNATIVE_CFG(old_c, ...)	\
 	__ALTERNATIVE_CFG(old_c)
 
-#define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
-					CONFIG_k_1,			\
-				  new_c_2, vendor_id_2, errata_id_2,	\
-					CONFIG_k_2) \
-       __ALTERNATIVE_CFG(old_c)
+#define _ALTERNATIVE_CFG_2(old_c, ...)	\
+	__ALTERNATIVE_CFG(old_c)
 
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
