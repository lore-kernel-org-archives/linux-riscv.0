Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3233B606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NLd+5Jjy;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=YVTpT7Qw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6QYKHyFCF5NlOYlVU52AMuh8/C5Vo654hhJylPzKZpg=; b=NLd+5JjyO0nxEI1yDH3kOb/QXq
	VkyCAIRWle/hCT9T+Q0WbKNS20IuVMlxT7uha6zmalPwT1JwQr7m1U4UJVvucLZsco7sT4g8z9D/w
	qafk+je5UaAimW6mxhbzQX1uIduhGUVehGBtiejf9dplDUYlZCTHFmCs+fQlagefcMDVxjRJTpx1t
	tvSQEiYHKQqZ6Z/6nSn3cK5O9fGGM9qAT14sYI0WARAhOtDULz0jI7nh8a7R/GEWZ7GcXwSrvR8br
	GW3omjJ9CvzTggKN0RmiyYwa7NjjySdOcCHbfvbTCerDE7vV+CnalF20gXLeuX2RfinbemDyKZZxA
	mYamuHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5n6-0000000FPER-2rAC;
	Fri, 23 Oct 2026 03:18:00 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5n0-0000000FOxG-0vyQ
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725415;
	bh=mkGGwXbQybCvoYCC3csEwc/txTzlfZkmjYSHY29OcVA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=YVTpT7Qw1n5wFl2rSvoxK/NUAkHg22STNcu7LlMOz9yoxgVwNJR/o77ZKAvwAu/22
	 guEAPm3qJsyrqdszYkEAgYS6xf/0e3u+8mTNVA29JRf1AMubjf6hJh1kQJnBQbu0mJ
	 RvDnZ3L47Kn31RqQBrfe8z30k45iLzCPjr0eBfQ0=
X-QQ-mid: esmtpsz11t1792725351t814e59f4
X-QQ-Originating-IP: yzOEdM5/KM/iy2YXPZCwe3IX4Cbiir/s+/R1sBcG26I=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12203296309924822045
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/24] gtrace: Add RISC-V trace timestamp support
Date: Fri, 23 Oct 2026 11:14:52 +0800
Message-Id: <20261023031505.2020925-12-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NkePUIh4Ak4YualQUQhVuXIBehEKHSVRFdNYbHrdZfbD8ZVNxecLh2VD
	Wab4E2kF9dvIj/8lrZry6nkjPMKiBak/HFGojGYDxDHmMj4C7VMW+ApKmBCKBR8A+d78RWz
	xXwrUeWmZgCWStCDhTjXw4gcZNYQ4iWtBVIZhIM00VRtXTtnjJwCjuZ1a4eqA1oPh/AIHe+
	jSCZV71oOjbwWQEsqLZyI6+RFHQWtdvMEG/Fol3rHUq8mmWf0OQADRCqFF1xWScR9zNdCER
	SA6HCaJeOY5sLwBIeDnZobkNuo6UtVHOeW7z02920zt+GwKy00hKo+T/P/s9kiM+FgIaA12
	Q+/72TVxiS348UEs9pOR/gjZT95Nn7YmNpGvSmaR2gIE9xDzQwbxv6zc1tPzh+WugatZjPR
	8qZ2EGOCIXHFOs79zZ9ehjJSdkkja8vbDB78iHF7pljZCTlJOcup+ZfoNFYqJhoeeMo6A0F
	kQPTlIKBkIEXX1VCQdTDu1yoAI8jyfBL/jwUmDWv7R+oahOhYr0yCJCS8J9wMumjAVTH7x7
	gTlnl08e6DW714TYPe11+9x3n/AXWpO5VDBzAcyAamaVgyoK6CeR1c/JeC8xTVpv8zKP4vV
	Kq2YiqTSv7IcyS+UpKDs7Crf/VJ8PbYdceVBxiAnoIf/WCsQeEt36AHgFF0UIpM5zBOOS5N
	zp0HNZSnQMdeihPm6Gf5GGjfGgorbyg0TWnveB3DPkq41prQENGpBwHWbdBh9pfnXfS+gd1
	EHLybgZE4pwXEpu/czCR3DfaRcno6xFe9YfpLgH/QmRQq8tadSuO628kzXav0Uxejn2ctkE
	uFkT4jivxhqiW0gGKR0YsQod+HFj2idY5DNmuk57qccP+RLvNaCX3Ti08CUt7zeNsi+qCfm
	WPs1QWwmdiybhUpy+IHSbdbt+tTSxqwRLZ3sSO4/75bMB6iegxIweP4Q9JQP3CwRRBIs8ob
	T8wflHnxXC3PDr1sAygUG4ATGQ/otcZoYlcZUGY6DM7Y3bNs3/84AdpDidG27fdjKjOLR2j
	WjGVUNdDKr6PTQ9PPNwH6x7hqX0IbfPdIcdvaBNZtZW9pRm1m0BkO/bhbZd7vGcYqoTqoFp
	mYZBfTce1CmD5G2Al6Cm5g=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201754_918963_A7020366 
X-CRM114-Status: GOOD (  22.35  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a shared timestamp component for the RISC-V trace encoder and
funnel.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/Makefile             |   3 +-
 .../hwtracing/gtrace/rvtrace-encoder-core.c   |  16 +-
 .../hwtracing/gtrace/rvtrace-encoder-sysfs.c  |  33 ++
 drivers/hwtracing/gtrace/rvtrace-encoder.h    |   8 +
 drivers/hwtracing/gtrace/rvtrace-funnel.c     |  55 +++
 drivers/hwtracing/gtrace/rvtrace-funnel.h     |   8 +
 drivers/hwtracing/gtrace/rvtrace-timestamp.c  | 336 ++++++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-timestamp.h  |  44 +++
 8 files changed, 500 insertions(+), 3 deletions(-)
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-timestamp.c
 create mode 100644 drivers/hwtracing/gtrace/rvtrace-timestamp.h

diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
index 9c99d917b9f4..b60d3cfe5248 100644
--- a/drivers/hwtracing/gtrace/Makefile
+++ b/drivers/hwtracing/gtrace/Makefile
@@ -4,7 +4,8 @@ obj-$(CONFIG_GTRACE) += gtrace.o
 gtrace-y := gtrace-core.o gtrace-perf.o gtrace-sysfs.o
 gtrace-$(CONFIG_OF) += gtrace-of.o
 
-obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
+obj-$(CONFIG_RVTRACE) += rvtrace.o
+rvtrace-y := rvtrace-platform.o rvtrace-timestamp.o
 obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
 rvtrace-encoder-y := rvtrace-encoder-core.o rvtrace-encoder-sysfs.o
 obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
index 17a3dde1314c..c0541fee6b93 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
@@ -127,6 +127,10 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 		val |= BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
 		gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 	}
+
+	priv->has_timestamp = rvtrace_timestamp_reset(pdata) == 0;
+	if (priv->has_timestamp)
+		rvtrace_timestamp_init(pdata, &priv->ts_priv);
 	dev_set_drvdata(&comp->dev, priv);
 
 	ret = gtrace_perf_symlink(comp, true);
@@ -155,6 +159,8 @@ static void rvtrace_encoder_parse_event_config(struct rvtrace_encoder_priv *priv
 	u64 config = event->attr.config;
 	enum rvtrace_encoder_syncmode syncmode;
 
+	if (priv->has_timestamp)
+		priv->ts_ctrl = config & BIT(GTRACE_PMU_ATTR_CFG_TIMESTAMP_SHIFT);
 	if (priv->has_context)
 		priv->context = config & BIT(GTRACE_PMU_ATTR_CFG_CONTEXT_SHIFT);
 
@@ -170,11 +176,17 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
 	struct gtrace_platform_data *pdata = comp->pdata;
 	struct gtrace_path *path = comp->path;
+	struct perf_event *event = NULL;
 	int ret;
 	u32 val;
 
-	if (path->mode == GTRACE_COMPONENT_MODE_PERF)
-		rvtrace_encoder_parse_event_config(priv, path->event);
+	if (path->mode == GTRACE_COMPONENT_MODE_PERF) {
+		event = path->event;
+		rvtrace_encoder_parse_event_config(priv, event);
+	}
+
+	if (priv->has_timestamp)
+		rvtrace_timestamp_setup(pdata, &priv->ts_priv, event, priv->ts_ctrl);
 
 	if (priv->srcbits)
 		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c b/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
index e973d0e43036..638759be2987 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder-sysfs.c
@@ -84,8 +84,40 @@ static ssize_t cpu_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(cpu);
 
+static ssize_t ts_ctrl_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->ts_ctrl);
+}
+
+static ssize_t ts_ctrl_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	int ret;
+	unsigned long val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+
+	if (!priv->has_timestamp)
+		return -EINVAL;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	priv->ts_ctrl = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(ts_ctrl);
+
 static struct attribute *rvtrace_encoder_attrs[] = {
 	&dev_attr_cpu.attr,
+	&dev_attr_ts_ctrl.attr,
 	NULL,
 };
 
@@ -285,6 +317,7 @@ const struct attribute_group *rvtrace_encoder_groups[] = {
 	&rvtrace_encoder_mgmt_group,
 	&rvtrace_encoder_control_group,
 	&rvtrace_encoder_features_group,
+	&rvtrace_timestamp_group,
 	NULL,
 };
 EXPORT_SYMBOL_GPL(rvtrace_encoder_groups);
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.h b/drivers/hwtracing/gtrace/rvtrace-encoder.h
index 733d44c0e641..579567dabb3a 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.h
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.h
@@ -3,6 +3,8 @@
 #ifndef __RVTRACE_ENCODER_H__
 #define __RVTRACE_ENCODER_H__
 
+#include "rvtrace-timestamp.h"
+
 #define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT     2
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	GENMASK(6, 4)
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
@@ -38,6 +40,9 @@ enum rvtrace_encoder_syncmode {
  * @has_context: Hardware flag for scontext/mcontext and privilege tracking.
  * @context:     Current configuration for scontext/mcontext and privilege tracking.
  * @boot_enable: Flag to automatically enable tracing on boot.
+ * @has_timestamp: Hardware flag indicating if timestamp generation is supported.
+ * @ts_ctrl:       Current configuration state of timestamp control.
+ * @ts_priv:       Private configuration data specific to the timestamp unit.
  */
 struct rvtrace_encoder_priv {
 	bool syncmode_hw[RVTRACE_ENCODER_SYNCMODE_MAX];
@@ -48,6 +53,9 @@ struct rvtrace_encoder_priv {
 	bool has_context;
 	bool context;
 	bool boot_enable;
+	bool has_timestamp;
+	bool ts_ctrl;
+	struct rvtrace_timestamp_priv ts_priv;
 };
 
 #endif/* __RVTRACE_ENCODER_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.c b/drivers/hwtracing/gtrace/rvtrace-funnel.c
index 941cd3360395..c4b3396568f7 100644
--- a/drivers/hwtracing/gtrace/rvtrace-funnel.c
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.c
@@ -9,10 +9,28 @@
 #include "rvtrace.h"
 #include "rvtrace-funnel.h"
 
+static void rvtrace_funnel_parse_event_config(struct rvtrace_funnel_priv *priv,
+					      struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	priv->ts_ctrl = config & BIT(GTRACE_PMU_ATTR_CFG_TIMESTAMP_SHIFT);
+}
+
 static int rvtrace_funnel_start(struct gtrace_component *comp)
 {
+	struct gtrace_path *path = comp->path;
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+	struct perf_event *event = NULL;
 	int ret;
 
+	if (path->mode == GTRACE_COMPONENT_MODE_PERF) {
+		event = path->event;
+		rvtrace_funnel_parse_event_config(priv, event);
+	}
+	if (priv->has_timestamp)
+		rvtrace_timestamp_setup(comp->pdata, &priv->ts_priv, event, priv->ts_ctrl);
+
 	ret = gtrace_enable_component(comp);
 	if (ret)
 		dev_err(&comp->dev, "failed to start rvtrace funnel.\n");
@@ -99,8 +117,40 @@ static ssize_t disinput_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(disinput);
 
+static ssize_t ts_ctrl_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+
+	return sysfs_emit(buf, "%u\n", priv->ts_ctrl);
+}
+
+static ssize_t ts_ctrl_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	int ret;
+	unsigned long val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+
+	if (!priv->has_timestamp)
+		return -EINVAL;
+
+	ret = kstrtoul(buf, 10, &val);
+	if (ret)
+		return ret;
+
+	priv->ts_ctrl = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(ts_ctrl);
+
 static struct attribute *rvtrace_funnel_attrs[] = {
 	&dev_attr_disinput.attr,
+	&dev_attr_ts_ctrl.attr,
 	NULL,
 };
 
@@ -110,6 +160,7 @@ static struct attribute_group rvtrace_funnel_group = {
 
 const struct attribute_group *rvtrace_funnel_groups[] = {
 	&rvtrace_funnel_group,
+	&rvtrace_timestamp_group,
 	NULL,
 };
 EXPORT_SYMBOL_GPL(rvtrace_funnel_groups);
@@ -123,6 +174,10 @@ static int rvtrace_funnel_probe(struct gtrace_component *comp)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->has_timestamp = rvtrace_timestamp_reset(pdata) == 0;
+	if (priv->has_timestamp)
+		rvtrace_timestamp_init(pdata, &priv->ts_priv);
+
 	gtrace_write32(pdata, RVTRACE_FUNNEL_DISINPUT_MASK, RVTRACE_FUNNEL_DISINPUT_OFFSET);
 	priv->disinput_mask = gtrace_read32(pdata, RVTRACE_FUNNEL_DISINPUT_OFFSET);
 	dev_set_drvdata(&comp->dev, priv);
diff --git a/drivers/hwtracing/gtrace/rvtrace-funnel.h b/drivers/hwtracing/gtrace/rvtrace-funnel.h
index 41547c8971ba..dddab5db8bef 100644
--- a/drivers/hwtracing/gtrace/rvtrace-funnel.h
+++ b/drivers/hwtracing/gtrace/rvtrace-funnel.h
@@ -6,16 +6,24 @@
 #ifndef __RVTRACE_HENNEL_H__
 #define __RVTRACE_HENNEL_H__
 
+#include "rvtrace-timestamp.h"
+
 #define RVTRACE_FUNNEL_DISINPUT_OFFSET	0x008
 #define RVTRACE_FUNNEL_DISINPUT_MASK	0xffff
 
 /**
  * struct rvtrace_encoder_priv - Private driver data for the rvtrace funnel
  * @disinput_mask: Bitmask of inputs supporting disable.
+ * @has_timestamp: Hardware flag indicating if timestamp generation is supported.
+ * @ts_ctrl:       Current configuration state of timestamp control.
+ * @ts_priv:       Private configuration data specific to the timestamp unit.
  */
 
 struct rvtrace_funnel_priv {
 	u32 disinput_mask;
+	bool has_timestamp;
+	bool ts_ctrl;
+	struct rvtrace_timestamp_priv ts_priv;
 };
 
 #endif /* __RVTRACE_ENCODER_H__ */
diff --git a/drivers/hwtracing/gtrace/rvtrace-timestamp.c b/drivers/hwtracing/gtrace/rvtrace-timestamp.c
new file mode 100644
index 000000000000..0ec7436add16
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-timestamp.c
@@ -0,0 +1,336 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(C) 2026 Spacemit Technologies, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/gtrace.h>
+#include <linux/bitfield.h>
+#include "rvtrace.h"
+#include "rvtrace-timestamp.h"
+#include "rvtrace-encoder.h"
+#include "rvtrace-funnel.h"
+
+int rvtrace_timestamp_reset(struct gtrace_platform_data *pdata)
+{
+	gtrace_write32(pdata, 0, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	gtrace_write32(pdata, RVTRACE_COMPONENT_CTRL_ACTIVE_MASK, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	return gtrace_poll_bit(pdata, RVTRACE_TIMESTAMP_CTRL_OFFSET,
+			       RVTRACE_COMPONENT_CTRL_ACTIVE_SHIFT, 1,
+			       pdata->control_poll_timeout_usecs);
+}
+EXPORT_SYMBOL_GPL(rvtrace_timestamp_reset);
+
+void rvtrace_timestamp_init(struct gtrace_platform_data *pdata,
+			    struct rvtrace_timestamp_priv *priv)
+{
+	u32 ctrl, val;
+	enum rvtrace_timestamp_mode mode;
+
+	ctrl = gtrace_read32(pdata, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	priv->mode = FIELD_GET(RVTRACE_TIMESTAMP_MODE_MASK, ctrl);
+
+	/* get timestamp mode hw */
+	for (mode = RVTRACE_TIMESTAMP_MODE_NONE; mode < RVTRACE_TIMESTAMP_MODE_MAX; mode++) {
+		val = ctrl & ~RVTRACE_TIMESTAMP_MODE_MASK;
+		val |= FIELD_PREP(RVTRACE_TIMESTAMP_MODE_MASK, mode);
+		gtrace_write32(pdata, val, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+		val = gtrace_read32(pdata, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+		val = FIELD_GET(RVTRACE_TIMESTAMP_MODE_MASK, val);
+		priv->mode_hw[mode] = (mode == val);
+	}
+
+	gtrace_write32(pdata, ctrl, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+}
+EXPORT_SYMBOL_GPL(rvtrace_timestamp_init);
+
+static bool rvtrace_timestamp_is_internal(struct rvtrace_timestamp_priv *priv)
+{
+	return (priv->mode == RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM ||
+		priv->mode == RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE);
+}
+
+static void rvtrace_timestamp_parse_event_config(struct rvtrace_timestamp_priv *priv,
+						 struct perf_event *event)
+{
+	u64 config = event->attr.config;
+
+	if (priv->mode_hw[FIELD_GET(GTRACE_PMU_ATTR_CFG_TSMODE_MASK, config)])
+		priv->mode = FIELD_GET(GTRACE_PMU_ATTR_CFG_TSMODE_MASK, config);
+	if (rvtrace_timestamp_is_internal(priv))
+		priv->prescale = FIELD_GET(GTRACE_PMU_ATTR_CFG_TSPRESCALE_MASK, config);
+}
+
+void rvtrace_timestamp_setup(struct gtrace_platform_data *pdata,
+			     struct rvtrace_timestamp_priv *priv,
+			     struct perf_event *event,
+			     bool enable)
+{
+	u32 val;
+
+	if (event)
+		rvtrace_timestamp_parse_event_config(priv, event);
+
+	val = gtrace_read32(pdata, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+	val &= ~RVTRACE_TIMESTAMP_MODE_MASK;
+	val &= ~RVTRACE_TIMESTAMP_PRESCALE_MASK;
+	val |= FIELD_PREP(RVTRACE_TIMESTAMP_MODE_MASK, priv->mode);
+	val |= FIELD_PREP(RVTRACE_TIMESTAMP_PRESCALE_MASK, priv->prescale);
+
+	val &= ~BIT(RVTRACE_TIMESTAMP_COUNT_SHIFT);
+	val &= ~BIT(RVTRACE_TIMESTAMP_ENABLE_SHIFT);
+	if (enable) {
+		val |= BIT(RVTRACE_TIMESTAMP_COUNT_SHIFT);
+		val |= BIT(RVTRACE_TIMESTAMP_ENABLE_SHIFT);
+	}
+
+	gtrace_write32(pdata, val, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+}
+EXPORT_SYMBOL_GPL(rvtrace_timestamp_setup);
+
+static struct rvtrace_timestamp_priv *get_timestamp_priv(struct gtrace_component *comp)
+{
+	enum gtrace_component_type gtype = comp->id.type;
+
+	if (gtype == GTRACE_RVTRACE_ENCODER) {
+		struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
+		return &priv->ts_priv;
+	} else if (gtype == GTRACE_RVTRACE_FUNNEL) {
+		struct rvtrace_funnel_priv *priv = dev_get_drvdata(&comp->dev);
+		return &priv->ts_priv;
+	}
+
+	return NULL;
+}
+
+static struct gtrace_component *rvtrace_find_funnel(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn = NULL;
+	int i;
+
+	if (comp->id.type == GTRACE_RVTRACE_FUNNEL)
+		return comp;
+
+	if (!pdata->nr_outconns)
+		return NULL;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (conn && conn->dest_comp)
+			break;
+	}
+
+	if (!conn)
+		return NULL;
+
+	return rvtrace_find_funnel(conn->dest_comp);
+}
+
+static struct gtrace_component *rvtrace_timestamp_get_source(struct gtrace_component *comp)
+{
+	struct gtrace_component *dest = comp;
+
+	if (dest->id.type == GTRACE_RVTRACE_ENCODER) {
+		struct rvtrace_encoder_priv *priv = dev_get_drvdata(&dest->dev);
+
+		if (priv && priv->has_timestamp)
+			return dest;
+
+		dest = rvtrace_find_funnel(dest);
+		if (!dest)
+			return NULL;
+	}
+
+	if (dest->id.type == GTRACE_RVTRACE_FUNNEL) {
+		struct rvtrace_funnel_priv *priv = dev_get_drvdata(&dest->dev);
+
+		if (priv && priv->has_timestamp)
+			return dest;
+	}
+
+	return NULL;
+}
+
+static ssize_t source_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", dev_name(&comp->dev));
+}
+static DEVICE_ATTR_RO(source);
+
+static const char * const modes_str[] = {
+	[RVTRACE_TIMESTAMP_MODE_NONE] = "none",
+	[RVTRACE_TIMESTAMP_MODE_EXTERNAL] = "external",
+	[RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM] = "internal_system",
+	[RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE] = "internal_core",
+	[RVTRACE_TIMESTAMP_MODE_SHARED] = "shared",
+};
+
+static ssize_t modes_available_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_timestamp_priv *priv;
+	enum rvtrace_timestamp_mode mode;
+	ssize_t size = 0;
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	priv = get_timestamp_priv(comp);
+
+	for (mode = RVTRACE_TIMESTAMP_MODE_NONE; mode < RVTRACE_TIMESTAMP_MODE_MAX; mode++) {
+		if (priv->mode_hw[mode])
+			size += sysfs_emit_at(buf, size, "%s ", modes_str[mode]);
+	}
+
+	size += sysfs_emit_at(buf, size, "\n");
+	return size;
+}
+static DEVICE_ATTR_RO(modes_available);
+
+static ssize_t mode_preferred_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_timestamp_priv *priv;
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	priv = get_timestamp_priv(comp);
+
+	return sysfs_emit(buf, "%s\n", modes_str[priv->mode]);
+}
+
+static ssize_t mode_preferred_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t size)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_timestamp_priv *priv;
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	priv = get_timestamp_priv(comp);
+
+	if (sysfs_streq(buf, modes_str[RVTRACE_TIMESTAMP_MODE_NONE]) &&
+			priv->mode_hw[RVTRACE_TIMESTAMP_MODE_NONE])
+		priv->mode = RVTRACE_TIMESTAMP_MODE_NONE;
+	else if (sysfs_streq(buf, modes_str[RVTRACE_TIMESTAMP_MODE_EXTERNAL]) &&
+			priv->mode_hw[RVTRACE_TIMESTAMP_MODE_EXTERNAL])
+		priv->mode = RVTRACE_TIMESTAMP_MODE_EXTERNAL;
+	else if (sysfs_streq(buf, modes_str[RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM]) &&
+			priv->mode_hw[RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM])
+		priv->mode = RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM;
+	else if (sysfs_streq(buf, modes_str[RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE]) &&
+			priv->mode_hw[RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE])
+		priv->mode = RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE;
+	else if (sysfs_streq(buf, modes_str[RVTRACE_TIMESTAMP_MODE_SHARED]) &&
+			priv->mode_hw[RVTRACE_TIMESTAMP_MODE_SHARED])
+		priv->mode = RVTRACE_TIMESTAMP_MODE_SHARED;
+	else
+		return -EINVAL;
+	return size;
+}
+static DEVICE_ATTR_RW(mode_preferred);
+
+static ssize_t prescale_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_timestamp_priv *priv;
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	priv = get_timestamp_priv(comp);
+
+	return sysfs_emit(buf, "%u\n", priv->prescale);
+}
+
+static ssize_t prescale_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t size)
+{
+	struct gtrace_component *comp = to_gtrace_component(dev);
+	struct rvtrace_timestamp_priv *priv;
+	unsigned long val;
+	int ret;
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	if (val > RVTRACE_TIMESTAMP_PRESCALE_MAX)
+		return -EINVAL;
+
+	priv = get_timestamp_priv(comp);
+	if (!rvtrace_timestamp_is_internal(priv))
+		return -EINVAL;
+
+	priv->prescale = val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(prescale);
+
+static ssize_t control_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	u32 val;
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	comp = rvtrace_timestamp_get_source(comp);
+	if (!comp)
+		return -EINVAL;
+
+	val = gtrace_read32(comp->pdata, RVTRACE_TIMESTAMP_CTRL_OFFSET);
+
+	return sysfs_emit(buf, "0x%x\n", val);
+}
+static DEVICE_ATTR_RO(control);
+
+static struct attribute *rvtrace_timestamp_attrs[] = {
+	&dev_attr_source.attr,
+	&dev_attr_modes_available.attr,
+	&dev_attr_mode_preferred.attr,
+	&dev_attr_prescale.attr,
+	&dev_attr_control.attr,
+	NULL,
+};
+
+static umode_t timestamp_attr_is_visible(struct kobject *kobj,
+					 struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct gtrace_component *comp = to_gtrace_component(dev);
+
+	if (rvtrace_timestamp_get_source(comp))
+		return attr->mode;
+
+	return 0;
+}
+
+struct attribute_group rvtrace_timestamp_group = {
+	.attrs = rvtrace_timestamp_attrs,
+	.name = "timestamp",
+	.is_visible = timestamp_attr_is_visible,
+};
+EXPORT_SYMBOL_GPL(rvtrace_timestamp_group);
diff --git a/drivers/hwtracing/gtrace/rvtrace-timestamp.h b/drivers/hwtracing/gtrace/rvtrace-timestamp.h
new file mode 100644
index 000000000000..75924d397996
--- /dev/null
+++ b/drivers/hwtracing/gtrace/rvtrace-timestamp.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(C) 2026 Spacemit Technologies, Inc.
+ */
+
+#ifndef __RVTRACE_TIMESTAMP_H__
+#define __RVTRACE_TIMESTAMP_H__
+
+#include <linux/types.h>
+
+#define RVTRACE_TIMESTAMP_CTRL_OFFSET		0x040
+#define RVTRACE_TIMESTAMP_COUNT_SHIFT		1
+#define RVTRACE_TIMESTAMP_MODE_MASK		GENMASK(6, 4)
+#define RVTRACE_TIMESTAMP_PRESCALE_MASK		GENMASK(9, 8)
+#define RVTRACE_TIMESTAMP_PRESCALE_MAX		3
+#define RVTRACE_TIMESTAMP_ENABLE_SHIFT		15
+#define RVTRACE_TIMESTAMP_WIDTH_MASK		GENMASK(29, 24)
+
+enum rvtrace_timestamp_mode {
+	RVTRACE_TIMESTAMP_MODE_NONE,
+	RVTRACE_TIMESTAMP_MODE_EXTERNAL,
+	RVTRACE_TIMESTAMP_MODE_INTERNAL_SYSTEM,
+	RVTRACE_TIMESTAMP_MODE_INTERNAL_CORE,
+	RVTRACE_TIMESTAMP_MODE_SHARED,
+	RVTRACE_TIMESTAMP_MODE_MAX
+};
+
+struct rvtrace_timestamp_priv {
+	bool mode_hw[RVTRACE_TIMESTAMP_MODE_MAX];
+	enum rvtrace_timestamp_mode mode;
+	u32 prescale;
+};
+
+int rvtrace_timestamp_reset(struct gtrace_platform_data *pdata);
+void rvtrace_timestamp_init(struct gtrace_platform_data *pdata,
+			    struct rvtrace_timestamp_priv *priv);
+void rvtrace_timestamp_setup(struct gtrace_platform_data *pdata,
+			     struct rvtrace_timestamp_priv *priv,
+			     struct perf_event *event,
+			     bool enable);
+
+extern struct attribute_group rvtrace_timestamp_group;
+
+#endif/* __RVTRACE_TIMESTAMP_H__ */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
