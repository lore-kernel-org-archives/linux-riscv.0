Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AC2C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LESClge/4FKeRyLcgzBX8jlAVcQ6zz3fyQ3KPiP6IXk=; b=Rvp9TamGIwEKqI
	y24otilqkoHb6bjwHZdGCOzF/5bES4LXsRsOI7Bw2Uv1m2phcQYRespfvxFq8MYdIkcS9QwRJJtjy
	DskGAxyDgdEelajFYOpY1YY9pjzkKuSCp11AKA1dxFZzPexG+UdIZorqRg468Ya4bx9ZXqMYAGS8E
	d6xRCb6SqVXMcbLK9au+KdAQl9HWTcGZu2QqgQ53LrYY1/GD7kjSx5LrYaKX5OYiW5DEQYSXJ291D
	zPvh/soU5CsMCHPp7gT9iouaC3WisvWGSpuOCpLURBJZTIy+KtlRpuugH7sYyCc9asCQ0FYQutT1p
	AR2vQLk2CGaoFMq59mDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3m-0000000GVWT-1wwG;
	Tue, 30 Jun 2026 09:47:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weV3f-0000000GVOx-2AwL
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 09:47:13 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c9878bbe88so1687975ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jun 2026 02:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812831; x=1783417631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoDvUFSbpWFWDFAGwr7Cb8xFfiU1BKwTjMo6sTAkXFQ=;
        b=jBi/65mYlMRnnaSqvjXYNCS1m00lf+95P7+zCBMljagWKb5Iy0IXfSKBzawN9Vkp6T
         8lAGyKHZ3kF9am1IWz1nbBSYOAncji2+yaDiS3lZzywUWc6XZkVFh2HXx6vtCAsEKhDo
         GwtOYjFFWf5cAXtw62m1SmyQTTtBS4hC8T48CloJBNwX2tq1hxBZWhmzc7tEKKX7h8+y
         qXnWhIW6o9ndSS5nmW8BpOatNDJc+kbZTmjTcFd5TDG8R5zLtQqc3NIy8Yo2AW4V9lKh
         xk2YeqH/rlweoI0kt4qkPPNWaR1DbsC1heUl83RsWsLXZzFZ0b/msuZfq5+GQVlkTvSo
         8Kjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812831; x=1783417631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uoDvUFSbpWFWDFAGwr7Cb8xFfiU1BKwTjMo6sTAkXFQ=;
        b=mGf10SQa8lT8pN1o9dfb28hu1Ww+goT25kw0T4zRQkDpzyPQezp+f0tjHnl3GMHgcK
         wHMeKC8kHYv+ev979unVAdqjnwD2f2KjnsQnxBDLlcv3Mg2YLU8lA7icd6yRlVJArkm+
         /zAQTLaurkDEGsP9xD/IimdU7mNlXs/GUwAZhsv4C6MP8/FugsC+DkW9LiGNC1ywUT63
         NL6tO/6Ar66vfb16ruvtn8a1qe3zeavxLS0YBTxU+Ws++9jZUObPOFLMEBsq1kuDoAU2
         vAjC8gsN54fl4JDbt35i4tUhJkmIZ073gAfcV82EUHl13V8ZgEE8LSRwVE6RCQrjSj+u
         dFwA==
X-Gm-Message-State: AOJu0YyOwytCqbeg1Ct/YyKfbJ+mL6xVayaCccaDNjf0+Y8B0KxqyuoJ
	OOsTvNtdEPt5YG+e7j6pPZtAjoEO4obGotMJwAIhR7hPxiBBf5/l5+81++BZ+wcJ5hQ=
X-Gm-Gg: AfdE7cm8Wz9aJgXMbP3vFOlkuJ3QGCo0SGZR8Nro/J/Y9O6FIPXzNmIK/phIrbNf7gY
	zRxOwjcKYyrOR4Si9dIXL22w1clkGRu4Q3Sv5YfLcF+vT2nzBuer5XQ9CDfCoqyE7CYRcTUmaxu
	eFF+l5TTtprobIJeQwdDkw4V4XdP/TflKIta8ttSx0wJcYGG8PBlruyNBmfKS/vu8e9fgGm/g9S
	JNHVMPmAcsllcEpHDJD3bhSnJoKGD/rPYobEaSz4qZTdNcOTIay8dbG9otITMxGZr22ns3ZnKju
	vIIeW0qgJFnBf7ej7eDHiFCSI29QMWXxAO71RtSTQb7eSC1eesKPTqdyP1+cJDQRgb6hiugU5gz
	TUh3w3me6SNzo1K1+45BRNG2Jh517/MBFh6j/dO+vfTdItIvfR/rg2qSER2Qe8NfmQmUSGbT8+I
	vUrGaYJwo3WwuGJz73IfNCt/U4G+h2aHM=
X-Received: by 2002:a17:902:dac2:b0:2ca:5023:f983 with SMTP id d9443c01a7336-2ca5024043cmr2642635ad.29.1782812830607;
        Tue, 30 Jun 2026 02:47:10 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:09 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:28 +0800
Subject: [PATCH RFC 05/12] rvtrace: encoder: Add pre-ratified support
MIME-Version: 1.0
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-5-c9c1ffc64e4b@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=2855;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=QoNMGIUYb5ckj3iodRy9nthm6QrHS2TBc4gwTKRkf4U=;
 b=axAYvX5FAxovTVQcAx9nJEbghhz8lRFT+KV1TWlo1K9KXq8vpVIQET+BK+hsKzBCwbwm1mcTb
 y2p+lqIszsgB2XKqeIMjNFdOemHCdTsKNxIFIdPwnF7gP44fq0Ye7th
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_024711_568772_ECB20957 
X-CRM114-Status: GOOD (  16.88  )
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

Add pre-ratified version support to the encoder driver and a
pre-ratified match rule in rvtrace_match_id(). This allows
pre-ratified trace hardware to leverage the rvtrace driver
framework.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c    | 24 ++++++++++++++++--------
 drivers/hwtracing/rvtrace/rvtrace-encoder.c |  2 ++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 12ffc6917c70..153cf3ebffff 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -70,7 +70,7 @@ const struct rvtrace_component_id *rvtrace_match_id(struct rvtrace_component *co
 	u32 comp_maj, comp_min, id_maj, id_min;
 	const struct rvtrace_component_id *id;
 
-	for (id = ids; id->version && id->type; id++) {
+	for (id = ids; id->type; id++) {
 		if (comp->id.type != id->type)
 			return NULL;
 
@@ -81,13 +81,21 @@ const struct rvtrace_component_id *rvtrace_match_id(struct rvtrace_component *co
 		if (comp_maj > id_maj)
 			continue;
 
-		/* Refer to Ch. 5 'Versioning of components of the Trace Control spec. */
-		if (comp_maj < id_maj)
-			dev_warn(&comp->dev, "Older component with major version %d\n", comp_maj);
-		if (comp_min == 15)
-			dev_warn(&comp->dev, "Experimental component\n");
-		else if (comp_min > id_min)
-			dev_warn(&comp->dev, "Newer component with minor version %d\n", comp_min);
+		if (comp_maj == 0) {
+			if (id_maj > 0)
+				continue;
+		} else {
+			/* Refer to Ch. 5 'Versioning of components of the Trace Control spec. */
+			if (comp_maj < id_maj)
+				dev_warn(&comp->dev, "Older component with major version %d\n",
+					 comp_maj);
+			if (comp_min == 15)
+				dev_warn(&comp->dev, "Experimental component\n");
+			else if (comp_min > id_min)
+				dev_warn(&comp->dev, "Newer component with minor version %d\n",
+					 comp_min);
+		}
+
 
 		return id;
 	}
diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index f0a4ac46b6a9..f3be47e448cf 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -98,6 +98,8 @@ static void rvtrace_encoder_remove(struct rvtrace_component *comp)
 static struct rvtrace_component_id rvtrace_encoder_ids[] = {
 	{ .type = RVTRACE_COMPONENT_TYPE_ENCODER,
 	  .version = rvtrace_component_mkversion(1, 0), },
+	{ .type = RVTRACE_COMPONENT_TYPE_ENCODER,
+	  .version = rvtrace_component_mkversion(0, 0), },
 	{},
 };
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
