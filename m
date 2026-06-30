Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AA7C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9n3B/HSqKRhyOvz6XUSjWVN8XjG1eAHbj+J3FgYyz4s=; b=oK8ODcgl4+c2qV
	PNiNpyxnfJaYeBHhI8mvusUCO7FHQjSVmjCP0DXCiVxYYUdYw5n4q6GvtcvEdtK50FTFI6sibgVvo
	BAuWckOQgQKNJ3v+TSP3qWVqt1EgUqC03guFQaq3Xj+YWuDKTd22oXlAnCs1p8uTxNSXUqzw84Qsh
	u5ZBrVeC18kvweydVdYeHr3NFuuUGU5h74G9QEdoQaPXqXel/lmKVuxR9TvKtgodbX1TSixCMj9yV
	D/IN6qE9iMCcGKarUoKoWR31MmpYWIMxGyMhy3rDYT6PJSjHNo3hoeabG9mpp+yvZ/e+VW0t5Fudz
	+A8JRspQzrCqWQ1AYX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV4C-0000000GVyn-1LrJ;
	Tue, 30 Jun 2026 09:47:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV47-0000000GVsv-3YL0
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c821a50615so21686965ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812859; x=1783417659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFsJfZ32F6Q33KlT3GRF0Vk1wwyPPazlo0zzpNaRXQQ=;
        b=Z1HpnMTuxh31AKCX0DS1EhGCf8o69s4rp0XJc50WF6c5QKYbm6frawR1zHZWY7IGt6
         lpl0mjKlp9mwfZ+ZLSDfQc5SVnI0bbMiufxSUuRCiRAN5Y92luVt7fecIX2SRBQM5Dl6
         Eb+IJ30Bq7t4SMvgKHDvogq5aifxVabz3u6vmm9e4flyjMXCI36ks4tBEcr/aRj3gYPk
         N0Bx9wKhboppHavd3Alv8nUZ96c/6gFISpPhGZ9a/1PVWUP6EltjrqY7Fx5v7qm6elsG
         SwoM/HFEkvshtWi91UL5wFsV798+O172/HjwghrkC2ntRt8EdCHNh5NAc4P+rtGbJB9a
         uCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812859; x=1783417659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZFsJfZ32F6Q33KlT3GRF0Vk1wwyPPazlo0zzpNaRXQQ=;
        b=YAiTqQaz4IK7jBg1qYzIqP9223Iw0G5Y3zzlqwokKKXoBltR8Y06JvD2qSi+La72lV
         +etFeZph7gCGd05aLuKJbu8AZGiB6MQU/EAsz4BPs/cKlHOZvvNC6XOV4lRdGbbcMSwa
         taj1OopVq/IKKF0QV1b5VGWTDWupOErIF3QiagChekS0oXXX3BqOdZ5PpG1CvBHx34Rv
         AlkAdVlGniWQYM5/6+DQ7svvivshYmbNuwJIdW3eFcSYwjgK4kZEREGVMI8V1OtNVk74
         fnax0+PfQ4rjmSKwBXUnhRuQixNVolzHsdJwTTe6LFjqkFu3pZgSv1D3Mh1UA2f7A2lX
         vVxw==
X-Gm-Message-State: AOJu0Yyrrtbam2uZjHUUH4LpKPJOEthJmvP41+Z3v9wD5lVUdJF4oAw5
	NM67M9uChIfuzlsacB3kncsAN/wm3mE1TQk3aNUnsqLOfozhOVoWdrIXgwxBQ6HE23g=
X-Gm-Gg: AfdE7cmqg31b6wxZh/gM+8nNAFLtRGcvuFHpxDlg4w5BNRgMnp8XfGG+IkBLke/XKgo
	BdhKRFPOUp9VhhkKibfo5cflBMgtRfjCGtgIy0bWan7Kwjo0rvy0aB9YZy4VkKhulpfGyMwVaAz
	6KqKhflTEy4BL5hkwR4Unfr3SbRPBQaPxRRQbVC7Y1sEd5/zqbmkZhhGEiZuKpVFQSK3bsQZBBR
	PqFbj8CT6uiaekk+2bN+Qubj/HPJBQM0+gg0yMdGN3Gtq8eRgpdDxIwufBqjdPdetZ7s5ZW2ZPc
	TK9YmCc1TFRvfnoqq7lV2ya4WHU+bKUjChZjIWVMotBmGXNFFJmsUG1yojRWPKuY0nDJcBlXdV4
	IbC4HaFGUGad5cAvmmXWR+I+6tFNpsai8mBHuSU4yIY4mt6KbsiXtnp0UquhOcaz8jGhuHSvH8+
	B2vSzFbiCgdaDwUeQWsXJ53O/85b18Dd4=
X-Received: by 2002:a17:902:ebc4:b0:2c9:97a8:aff0 with SMTP id d9443c01a7336-2ca2ea3388fmr21338425ad.41.1782812859217;
        Tue, 30 Jun 2026 02:47:39 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:38 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:34 +0800
Subject: [PATCH RFC 11/12] rvtrace: encoder: Add probe success message
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-11-c9c1ffc64e4b@sifive.com>
References: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
In-Reply-To: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=1379;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=1DguEThOFK/qO7Jm1cWRlcqvhEd0dc0090D81DcdQow=;
 b=/dMSHAP906vhEj0vt5nUrkzlLHcedt2N4JOw30g7lsEItaFkSqYKHji+b8bPWprDBukjb9fqh
 joNfvv76/iSAkJpr1sGzylgqpxJzBcsH+zLe50OtTNKX1IHA3/cxXWQ
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024739_908263_3B6B59F4 
X-CRM114-Status: UNSURE (   9.99  )
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

Add an info message upon successful probing of the encoder driver.
This allows users to easily determine how many trace encoders are
available and successfully initialized on the platform.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-encoder.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index 41e74cac0c25..e95a55808f4e 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -79,6 +79,7 @@ static int rvtrace_encoder_stop(struct rvtrace_component *comp)
 
 static int rvtrace_encoder_probe(struct rvtrace_component *comp)
 {
+	struct fwnode_handle *fwnode = dev_fwnode(comp->pdata->dev);
 	struct rvtrace_v0_comp_features *data;
 	struct rvtrace_driver *rtdrv;
 	int ret;
@@ -103,6 +104,8 @@ static int rvtrace_encoder_probe(struct rvtrace_component *comp)
 	if (ret)
 		return dev_err_probe(&comp->dev, ret, "failed to enable encoder.\n");
 
+	dev_info(&comp->dev, "%s is available\n", fwnode_get_name(fwnode));
+
 	return 0;
 }
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
