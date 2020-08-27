Return-Path: <SRS0=FYRI=CF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024FAC433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:22:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C606020738
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 08:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a8748Pb7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="j8c/SjYZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C606020738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N0Dm6HDGBjAK/n/iPl+/AaGc21vaN1Cx/G+njCMiAVE=; b=a8748Pb7QgPi3+Lh9GNCnTfHC
	95c9us53O6eaTFiaD0k4WoXm8zv/g7OfPo5l4uZiF1QypvO+MNaob8ZOS+NasV1gDZujdbPZF7qQp
	3J5bPFyENWsdPQpXWY/nyPcoCcRrzfb4v2de+51HiYLO8ZiF8aQCNJn/8xphUrCMN3aGfMjx4bwrC
	0XZbBL25AAQSeACBCttQIZlPbzpLN1aX+xYk61doC+g97jw3FwIRQSKewB0nsGFPEpPZKZWECfRW1
	xUePC/1OmVt9V67ZByv1QdSOkwXzWtVjdn6wrNHtuVTsai1InG9aHlOj/f/EanbPZaB6lPV7M1JFa
	WMU738+ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBDBE-00018B-0R; Thu, 27 Aug 2020 08:22:44 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBDB9-00015o-3p
 for linux-riscv@lists.infradead.org; Thu, 27 Aug 2020 08:22:41 +0000
Received: by mail-pg1-x543.google.com with SMTP id d19so2816758pgl.10
 for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2020 01:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WSKyECKPJv3nU8Dw0z78rbKPD6Ym+7wJ1BP9bvbD4E8=;
 b=j8c/SjYZEaoP7zhOS5rATU7Hbq5B89gNnCBQQwgj5uyPgChWzW8s0/U/DJBwmChybQ
 J2cTBCa+9z+RT19XRaIcp2db+JQlBlgzvDHur8GGCVqRrSd3xptZn16LsVAQJ+LmpKIp
 r5qGd9bDL87qMsY5u6SuExOU9j+Vg0xFyx2gs8BkjXfnNxwgdRdIhAuq8IvDFtwcsEAX
 xdg9wWmdNANi3h1Dg1fYVG1m8PIbCqkdbG0N6ehkzEsLDpoWjKceiL6Io476EB8Sx3hV
 t93KgFL5wWuSvZRajz3af8lo4VmVjD9ep0Zu7tXsUW2OkGLJfWb1kbGfzraLC2yMKPln
 2u6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WSKyECKPJv3nU8Dw0z78rbKPD6Ym+7wJ1BP9bvbD4E8=;
 b=hh0Q9FViU507QFsL7LDc4h4q4bTSqM+EV4DAADsQj3wR50t6x9AYQqm4vE2Pr8UW95
 zbTDc64iuHmbtJUvliEBahpT8BPgOPQIqgGQwjQrozgFKRRFI2HPpUgSg/swUw++Cil8
 DKr0ddDaFqtUuMcwR/BiumBG1cgQzTAMSjv1mgvTe4wdbIWpFZMXx7RY72aVea03nBRx
 PjDxuWicIqBVLgWqqtFVoJi1O/NT0ln4gKvVTNulRC64616KOa41B8U3TxnEHI3WSyL/
 UIwvUGe6eMdjhSOKcIewxZN4jRhxZ9tb/Adma3avHuhIoZJkEooLpKNkAXwJPsfkl0Dr
 ngfw==
X-Gm-Message-State: AOAM5328uP2+oRgzS+EVRpjNv/r1RiN4Me20aLQ3KnDK2Z5NFbdG9qmb
 JhqghC7bh6ErQNp146t2phIIIA==
X-Google-Smtp-Source: ABdhPJzkF7i7qpJvM+h8ORtoArVh4alXGnJMZV02SIWConIcos1OiM32m8VKq0zhaKQR/l3q0g05OA==
X-Received: by 2002:a63:7b54:: with SMTP id k20mr13013755pgn.75.1598516556721; 
 Thu, 27 Aug 2020 01:22:36 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 124sm1828351pfb.19.2020.08.27.01.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 01:22:36 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
Date: Thu, 27 Aug 2020 16:22:27 +0800
Message-Id: <1591b508db1564adcb2179e310d9df2e79411c92.1598515355.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1598515355.git.zong.li@sifive.com>
References: <cover.1598515355.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_042239_227384_DBD8AB5E 
X-CRM114-Status: GOOD (  10.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

AT_VECTOR_SIZE_ARCH should be defined with the maximum number of
NEW_AUX_ENT entries that ARCH_DLINFO can contain, but it wasn't defined
for RISC-V at all even though ARCH_DLINFO will contain one NEW_AUX_ENT
for the VDSO address.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/uapi/asm/auxvec.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index d86cb17bbabe..22e0ae888406 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -10,4 +10,7 @@
 /* vDSO location */
 #define AT_SYSINFO_EHDR 33
 
+/* entries in ARCH_DLINFO */
+#define AT_VECTOR_SIZE_ARCH	1
+
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
