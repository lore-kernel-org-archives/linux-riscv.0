Return-Path: <SRS0=aIEb=AO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984D8C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 08:58:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 633DD20826
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 08:58:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WptRVGqa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UOKz7YMB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 633DD20826
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0N6yfv0+uAab4F+oHC/TP/Dgw4vf825/X4G+zhi0x6E=; b=WptRVGqaucAoma5hp2kpLh/xT
	QPc2p1NpY32nglkyW53EJecHm9g6hEGw127GeXabWFe3oXAKfcqd9sSx/mCXs6bV5efm9x0A/+fZH
	+XMTwqzwjnCp7BJIr7u05XepPm2+FlTrniqZ+atmZv9pA/coD8lno//Q1KO5IPDNgXP8oVmRhd8ia
	nTG9y6rvyBMF0+91LehZFGGCQ3UzKI48X5bYZ6Lr15jQtI1odbw7CH/73IbbfyH0/zDs6zOUx+0pm
	MyjymsmGWS77E7ZW9XJj3+mbgLmnpyhmh7eE3xuqwP/MCYhHbbIjTYyadrqQxLeVWVvQ6LA0tFT74
	twBNMgNqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrHWJ-000363-Rb; Fri, 03 Jul 2020 08:58:07 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrHWG-00034I-Dv
 for linux-riscv@lists.infradead.org; Fri, 03 Jul 2020 08:58:05 +0000
Received: by mail-pl1-x642.google.com with SMTP id u9so8805647pls.13
 for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2020 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ru8jPTPnBePyvGJchZOluuKt4Npgi7HZT0olX4LUWXA=;
 b=UOKz7YMBAA7xCoh6IUPLnINGs19MzIg/FeTTNL9SyQ3krPdSHHWxE9imlLWxdVCnj6
 SMLoMv5sAXFQe5U3/eLs0J0yhfELchfSq2eAnkx9ubF/dY1msRjhnXHxXD6XRme4U8BT
 4U5Q9dyTUB5yPXrEnU0W0tCgO+nlb5o5A10VPkQFJDwSGk5x1JCFlGA29+x0QvYNIsqN
 WKYkzcRIfMb8Iyu5kYkEyc6/+s39WrbltcztHTYXXqmwtbtBQs4Ymtvsm6/1hDs0lXTx
 7WA2GZUxjsJZqVMPrZou7uFHOyd4ro2irxp3OUeDtWEcaCy6zfx/szcaBAf2QapPsCDE
 8DyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ru8jPTPnBePyvGJchZOluuKt4Npgi7HZT0olX4LUWXA=;
 b=N2T20U2zjmacqk8pQ96qRVHkjftuZ4G+gVykM9igYNCv25F0GyWbLYdVokYr+pVRU6
 orc5wsZgEUK9KPTj9np4H3C5aam/mo0w7SnEEHYT1gWIwO13daHFwM2Ckg798nAuCb6+
 Rc3mnDdp60IASVmxYyOz/vtX5KJcIWVIeqRVoTWwYg7CZY8ufG4/xXpnDHNmB4PVFaz7
 pkGnMNmEYbSI7EVwlT3nmDx+hm3IxoYo/ldgHbuh2q5Z7R6MyprKzxGnJgj6UucgH+K0
 RJ34djzf31cQ5UWVQ7eWl+qjAG6UNt9qBofiPuObIDD/1qv4xIGL64jp32pyyBiFiviD
 6X1A==
X-Gm-Message-State: AOAM533ra8uWEnYOEGHuEN9rw0sex+DufpyF4J2o1udq7ClgGYWKP83t
 +I9keF8PRpzfkuZVwsK+8xr0cQ==
X-Google-Smtp-Source: ABdhPJzFsePizfLV1p2UZMgva9HWjdbpZ0ufsa2hiTQZfkyspRzfC1m6tnO6H1gH/ILSFkoaUKdfHw==
X-Received: by 2002:a17:902:fe04:: with SMTP id
 g4mr19644353plj.66.1593766682799; 
 Fri, 03 Jul 2020 01:58:02 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l23sm2126287pjy.45.2020.07.03.01.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:58:02 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
Date: Fri,  3 Jul 2020 16:57:54 +0800
Message-Id: <25223adbad5badb3cd0000df078b407bafc129fd.1593766028.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593766028.git.zong.li@sifive.com>
References: <cover.1593766028.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_045804_549755_2F217E87 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

AT_VECTOR_SIZE_ARCH should be defined with the maximum number of
NEW_AUX_ENT entries that ARCH_DLINFO can contain, but it wasn't defined
for RISC-V at all even though ARCH_DLINFO will contain one NEW_AUX_ENT
for the VDSO address.

Signed-off-by: Zong Li <zong.li@sifive.com>
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
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
