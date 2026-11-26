Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD96606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fyuTFBlc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=lGXCkNen
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=blZyDB1sJ4Mr3k+2cKUm17QABESN0vWbvVcfc0Ew1mo=; b=fyuTFBlc36U77sEn4rsoWevK6V
	PPeQBnhXQPbTZ3xRJVOtKT4dpn6mi4+dI1IhqobphRnrOsN9m9qNjrmqfl4o/ElBSE2c7YmGSOghk
	bbRY59xWf67fE6sYQefaSqSbb7z9Cq7lbVyPN6N9zzZ0jg8Q6r6Fr4BmcB2sAGVII4qFXxDCC+Aha
	BTDEUFQzFso93nmxwjEtmvlHBZFEa8461yQCDD4zC9+Z1GKI/C35AUiZ+TGjDJMJBpRrWEF5jePQ7
	MGbPVIt1HVn+kduQk6YTs5osJ7FjNY9trPOXoseeYTeMHP2T4v4rhZy66wOQ3TykjGyxtjLGEK2wh
	j2vQBbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVS2-0000000CU91-1QAz;
	Thu, 26 Nov 2026 09:07:34 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVRu-0000000CU38-36YR
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:07:28 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1b563e32936so2653548c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684046; x=1796288846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zePae+AgwsxBTIqUJW1YaRElDL4kYS7QZ0ec/q5slnw=;
        b=lGXCkNenoNZKWQi1hnLIWXlQKUPLN5hGChGTMqAJRaXVzaiA+hC58M04ufFlRvJDJc
         ghmLnCz2B3/N9ttEpTo/dLLiMbM/Jgw0o62BrDmw1GwBzWhmhmO4l35QiFdAcFaovtDP
         Qba4rDbMevpXRPpBt4OebKRqUsNVbNHDiiTbInXGyRghiR796VHGARj1D6+zztyzF/sC
         AgJLT9viTcfZlIuUI2+YpjFEQiFMI3SWtJW9UpTegTDa7Q15QTAqkCtt3clXjqbJt15/
         86yLKqqsx/UO7+Wyl07ROIqzlfZ/z9F+xNxANV+l5h4YG5IwgeuDmM+plPBkZdfHrIcP
         YIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684046; x=1796288846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zePae+AgwsxBTIqUJW1YaRElDL4kYS7QZ0ec/q5slnw=;
        b=pFPU8FHXgd7J12BZmYP4Hr1KyVHtm1vUlOEo6oERhK5DZX7siUqS7/BrBWTTNw2q69
         8urVMBANq584JiW9zoB32+fONIuFEC80jL46CtTl8jfhVHb6ngrNrbrmCc32a5V5sS28
         NJ0dx+P9x4FuKNfE82gHRSfKAYnnk8IeLLNwLuM0I2yiA8icMx7hsMcfx9jvtbq3UvqY
         CrN/+SnBJsIaTUHE0DoZFhDfvLDgtkuqIaLRDmlodXCRr7UQCX0Lzp200B0+qM1Xh0E+
         qbI2QBon+sacnwd2trP1llbvJp4cMbc6FcBMtb2dkxHp2Fh6Q2uuSsd1rLCotXax3poh
         H/+g==
X-Gm-Message-State: APuU4Z/bHly4EP423Smb+DI93Qjvvbmafzukv/Q1IsKplV/kA0wgaax8
	zCIPMrWu2G0JBVN6QWqAZCXWn+/y1XtIeIwkBctC69CPesZnXKmmULkWmlO3dEtZRKg=
X-Gm-Gg: AZFdTZdZMThiYFNmDtg517NMQTaXNXWL1zWhYXai/edX3wKZe9GHDvr3pFjBzZygQlm
	yc56BPfq8E3F0t6rzvlfLlcv0vyGbgrZKr/wBdMoQFDFBIRCjg5FtSoAYS21dR0U9um+3jNwBSY
	SYhrN/+mbJMjD/WRUoFPOL+jFiO/Y5FR1nzxCwzj+wzrKm5tj1xLxxX+SnYeEqs1l0gx1xOLeHY
	YhhwUf0uedM5P9htPIm45OrlYELhrgfPFNwFpHMFAeprW1t+mGL7avBCW7qTnMXCZnRUb2d0cFW
	oxo5cMUZ2V0kcHB3afTjuJ6mFSacEUrTR/E75fvhz60jQiX0dsknTDqGuDEAun+TtLFpR9GBeNR
	QwrTuSEW16RjOX90n6Z1/MlOWXWtLS7K1wz5a9nnAVXavsQEnQMw/Q1YZz+rAR5Gkgb6rTWntIs
	q/TdcWsD6oOzYfYQQWajvcnZCeqAAUBf+HQ31xHm5siFanbg5qhydJYe09Hv7Rmz17XHPGOEZnn
	Gi6h12XPMXDJOsRFoyS75FUhXx1Gvl/4a6d5hW9I5zO8BT5GCQctJqnZSHK9AVYgJ+d8QRY7n7x
	3o/SUCcRgvcyAqFdF6A2B361cgXRo8ghidoqhvXF5DNK
X-Received: by 2002:a05:7022:b0c8:b0:1b3:a22e:b74d with SMTP id a92af1059eb24-1b5569225afmr18971488c88.34.1795684045709;
        Thu, 26 Nov 2026 01:07:25 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:25 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:10 -0800
Subject: [PATCH 04/10] gtrace: rvtrace: Add pre-ratified encoder support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261126-send-preratified-trace-v1-4-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_010727_390826_C2285B46 
X-CRM114-Status: GOOD (  18.55  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Eric Lin <eric.lin@sifive.com>

Add pre-ratified version support to the encoder driver. This allows
pre-ratified trace hardware to leverage the gtrace driver framework.

The pre-ratified encoder has a different register layout for the
source ID: the SRC field width (nSrcBits) and value are preset by
hardware in teImpl, while offset 0x8 is the read-only teImplExtra
register rather than trTeInstFeatures. Add rvtrace_comp_is_v0() and,
for pre-ratified encoders, derive srcbits from teImpl and skip
programming the trTeInstFeatures source ID fields.

Another difference is the encoding of the trTeInstMode field,
so set the corresponding "Optimized intruction trace" for
the pre-ratified encoder.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 42 +++++++++++++++++++++++++-----
 drivers/hwtracing/gtrace/rvtrace-v0.h      |  4 +++
 drivers/hwtracing/gtrace/rvtrace.h         |  6 +++++
 3 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
index 1f06b1a2b412..0a23c78c0caf 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -11,6 +11,9 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include "rvtrace.h"
+#include "rvtrace-v0.h"
+
+#define RVTRACE_V0_COMPONENT_CTRL_INSTMODE_OPIT	0x7
 
 #define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	0x7
@@ -95,6 +98,23 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	if (!priv)
 		return -ENOMEM;
 
+	if (rvtrace_comp_is_v0(comp)) {
+		/*
+		 * Pre-ratified encoders have the SRC field width and value preset
+		 * by hardware in teImpl. Offset 0x8 is the read-only teImplExtra
+		 * register rather than trTeInstFeatures, so don't program it.
+		 */
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+		priv->srcbits = (val >> RVTRACE_V0_IMPL_NSRCBITS_SHIFT) &
+				RVTRACE_V0_IMPL_NSRCBITS_MASK;
+		if (priv->srcbits) {
+			val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+			val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+			gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+		}
+		goto out;
+	}
+
 	ret = rvtrace_encoder_set_format(pdata);
 	if (ret) {
 		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
@@ -123,6 +143,7 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 			priv->srcbits = srcbits;
 		}
 	}
+out:
 	if (!priv->srcbits) {
 		dev_warn(&comp->dev, "cpu %d trace will not carry source id\n",
 			 pdata->bound_cpu);
@@ -141,13 +162,15 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 	int ret;
 	u32 val;
 
-	if (priv->srcbits)
-		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
+	if (!rvtrace_comp_is_v0(comp)) {
+		if (priv->srcbits)
+			rvtrace_encoder_set_srcid(pdata, priv->srcbits);
 
-	ret = rvtrace_encoder_set_format(pdata);
-	if (ret) {
-		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
-		return ret;
+		ret = rvtrace_encoder_set_format(pdata);
+		if (ret) {
+			dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+			return ret;
+		}
 	}
 
 	ret = gtrace_enable_component(comp);
@@ -159,7 +182,10 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 	/* set mode */
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
 	val &= ~(RVTRACE_COMPONENT_CTRL_INSTMODE_MASK << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
-	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	if (!rvtrace_comp_is_v0(comp))
+		val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	else
+		val |= (RVTRACE_V0_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
 	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
@@ -204,6 +230,8 @@ static int rvtrace_encoder_stop(struct gtrace_component *comp)
 static const struct gtrace_component_id rvtrace_encoder_ids[] = {
 	{ .type = GTRACE_RVTRACE_ENCODER,
 	  .version = rvtrace_component_mkversion(1, 0), },
+	{ .type = GTRACE_RVTRACE_ENCODER,
+	  .version = rvtrace_component_mkversion(0, 0), },
 	{},
 };
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.h b/drivers/hwtracing/gtrace/rvtrace-v0.h
index 0681405fa414..5abdc4788f64 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.h
@@ -24,6 +24,10 @@
 #define RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT)
 #define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT)
 
+/* Number of SRC bits preset by hardware in the Nexus messages */
+#define RVTRACE_V0_IMPL_NSRCBITS_SHIFT		24
+#define RVTRACE_V0_IMPL_NSRCBITS_MASK		0xf
+
 struct rvtrace_v0_comp_features {
 	bool has_sram_sink;
 	bool has_atb_sink;
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index b0cf2e1d875f..308de9fe39ae 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -72,6 +72,12 @@ enum rvtrace_component_impid {
 #define rvtrace_component_mkversion(__major, __minor)	\
 	((((__major) & 0xffff) << 16) | ((__minor) & 0xffff))
 
+/* Pre-ratified (version 0.x) components are identified by major version 0 */
+static inline bool rvtrace_comp_is_v0(struct gtrace_component *comp)
+{
+	return rvtrace_component_version_major(comp->id.version) == 0;
+}
+
 /* Map a RISC-V hardware component type to the global gtrace type */
 static inline int rvtrace_type_to_gtrace(enum rvtrace_component_type type)
 {

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
