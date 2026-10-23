Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5517606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q44qvdtl;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=S9XpunWy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=A9vbJVJrN8H+CcED9+214dKUh4nJ1yXCotwthqpg/LI=; b=q44qvdtlwfYV4yOXi6VgNJy3lq
	PJHjvr08zydyK1bd4owtuc3oz9BH/4keImVz3madBGAB3LRI1LyhXx86/HeenKtMjeQ2+c8VMyM6m
	IZe/3CJ/XXQ0H7PPmomUvluTwVFL4IZ/ict75phSeXBLKl7cHBltHVEZCLv1jnxdoNf4nsesIfymc
	n7tmRAD6zizxK1MY9Mwh7VSRKebhcpXyq/0tYz9xBqqcaqvpABvHNgUP9zih8GFMojWH1WX1AeF27
	q08BVJGlVzmglR8aTlBo56JqfwZGMlcennckkNFk42E+aRWYtGjIkEUSC3mnbwSdxdV2/3F1d1MB0
	YHWo++cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5lo-0000000FOAV-087h;
	Fri, 23 Oct 2026 03:16:40 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5lh-0000000FO0E-2LJd
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725328;
	bh=MMlf6J75nDVXumN3lYDEd291b9v7/FkjUcwdAXybsaU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=S9XpunWycfuGmGy9fdt+LpRbYt634Xie+uPzI+kilb5O+CE5OycqOGrVKe/AEYttQ
	 vkhmSCHHQDxX0yC4KrKMfNZ9rNTKsdVmq4Af3SXUkPpdzfKCsxyyTjGeDNnFKCI2J+
	 XSy4ODrInqaqYZvujHZZsmIUki55xnS0ORmYwkSM=
X-QQ-mid: esmtpsz11t1792725321t509a5208
X-QQ-Originating-IP: ohnxhK38InInZiVBUyKsKzYkj35gb18qCuBUfmUW/BI=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16734880007413768572
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
Subject: [PATCH 03/24] gtrace: Drop trace format field and helper function
Date: Fri, 23 Oct 2026 11:14:44 +0800
Message-Id: <20261023031505.2020925-4-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N8Jy6PtD39R8njWRoc1/EZyqsd43MwudQW/prjNK4SrstxuQoOf2q+Rq
	3mE1Yp/KC4axuvDcK96R4WQs0hLRMxunbLKGTtDHCy8LgM6IuF0b3gGwCaxnVWkjZuULCAp
	m6bYbXaepTnpqM35AWnZyZyTy/XsxHfe1xtpHH5IPH3OREOMxVSsGJjU+sQ3PmCkjcMklJh
	I8VLH7dZeyHkvvk2uWrHgOSBzDfX4HRYT6zkpHpPJ/M3ylZPsEliNPxmbrx+DAMdAn8ptdy
	6IvtYgO2I6gmIV+1oFupwmseOUTZQnGR6PKHpo9uNlE3Gp7x26VTiGwTJ9Px/Gj4N2NTY7R
	sMhdjNlL75IqlJdsppmURueIh1217gSvd5qoXzLE3XAYNcVtFZWhZ4srv7/D1SPdFGy6LEJ
	Z6bKDIyTDTX5PU66n7G0PyAw2+nrBq5APly8ov1ML3aoNcArq+jpoMoRk/UFLPNOSMQOfvM
	8ZRmBr9E4RZyRz0P0Z6KjZuQF9VROyl6OB3ZQAfPFebzNojS1J/aTFJK6J/PUBMQbmZGvGS
	tFGzKlsmhdPahrJqKpCXP1gENpl0+wWHH96H4wme9ufeWiySYUmNnvXaU3h5a1o4RLd0jUD
	XkiBSZtIWNbstkemrY5r2cnhOCjMpj6vEkMECnqcYgcpR5eigT8kzOUkOZeSsWScDn5XxuX
	3Wd8Im9Mtd6VBL2s3cE6r8g1HNi4XnMBZ1PA02hD4keeLv1Uevewkb0vMra1H+2oH6HN8LD
	xP7pcgUFnCkRYKC67PP4qA6SwM3VkFu4c+R9ewP+LJ664F3rf/PLChaQ6cX8PsaMM3Zpsq5
	kItqHGHCtzEY0NC3oqzz3zb8ybfpESvWOtQejAeTySEH1nAvSXRokv9Jh4Kxe7cLRTsJZZW
	C26rkWC8qSYY2FEWnih0lVNpW+dHUClKGO5f20N+RQZoGP/WmEkEJtn02hEot3fmZJGQQWT
	+Br+Sen3dFfG/QJN0BJqePrF1eq60nglqk8caeBWKJM0O6YcD6tGJgGMaU/JzQXoShoDJG3
	SAQToz1pqCOvPAG5kA3Im6MDU6RKKQW5lFUhICzfgzxnzOETjl
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201634_059037_15030EE6 
X-CRM114-Status: GOOD (  15.42  )
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

Remove the format field from struct gtrace_platform_data and drop
the associated gtrace_path_aux_format() helper function.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-perf.c      | 15 --------
 drivers/hwtracing/gtrace/rvtrace-encoder.c  | 39 ---------------------
 drivers/hwtracing/gtrace/rvtrace-platform.c |  3 +-
 drivers/hwtracing/gtrace/rvtrace-ramsink.c  |  1 -
 include/linux/gtrace.h                      |  3 --
 5 files changed, 1 insertion(+), 60 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 928f0405c6c1..56713c8ee850 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -167,20 +167,6 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 	return NULL;
 }
 
-static u64 gtrace_path_aux_format(struct gtrace_path *path)
-{
-	struct gtrace_component *src = gtrace_path_source(path);
-
-	switch (src->pdata->format) {
-	case GTRACE_FORMAT_ETRACE:
-		return PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
-	case GTRACE_FORMAT_NTRACE:
-		return PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE;
-	default:
-		return PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN;
-	}
-}
-
 static void gtrace_event_read(struct perf_event *event)
 {
 }
@@ -295,7 +281,6 @@ static void gtrace_event_stop(struct perf_event *event, int mode)
 			return;
 		ret = gtrace_path_copyto_auxbuf(path, &event_data->buf, &size, &format);
 		WARN_ON_ONCE(ret);
-		format = gtrace_path_aux_format(path);
 		if (READ_ONCE(handle->event)) {
 			/* Tag the AUX data with the source's trace format. */
 			perf_aux_output_flag(handle, format);
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
index 1f06b1a2b412..f24780b1ca1e 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -53,38 +53,11 @@ static void rvtrace_encoder_set_srcid(struct gtrace_platform_data *pdata, u32 sr
 	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 }
 
-/* Set requested trace format and return 0 if hardware supports that format */
-static int rvtrace_encoder_set_format(struct gtrace_platform_data *pdata)
-{
-	u32 val, fmt;
-
-	switch (pdata->format) {
-	case GTRACE_FORMAT_ETRACE:
-		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_ETRACE;
-		break;
-	case GTRACE_FORMAT_NTRACE:
-		fmt = RVTRACE_COMPONENT_CTRL_FORMAT_NTRACE;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	val &= ~(RVTRACE_COMPONENT_CTRL_FORMAT_MASK << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT);
-	val |= fmt << RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT;
-	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
-
-	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
-	val = (val >> RVTRACE_COMPONENT_CTRL_FORMAT_SHIFT) & RVTRACE_COMPONENT_CTRL_FORMAT_MASK;
-	return val == fmt ? 0 : -EOPNOTSUPP;
-}
-
 static int rvtrace_encoder_probe(struct gtrace_component *comp)
 {
 	struct gtrace_platform_data *pdata = comp->pdata;
 	struct rvtrace_encoder_priv *priv;
 	u32 val, hw_srcbits, srcbits;
-	int ret;
 
 	if (pdata->bound_cpu < 0) {
 		dev_err(&comp->dev, "cpu property missing. Please fix firmware.\n");
@@ -95,12 +68,6 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	if (!priv)
 		return -ENOMEM;
 
-	ret = rvtrace_encoder_set_format(pdata);
-	if (ret) {
-		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
-		return ret;
-	}
-
 	/* Check if trTeInhibitSrc is hardwired to 1 */
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
 	val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
@@ -144,12 +111,6 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 	if (priv->srcbits)
 		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
 
-	ret = rvtrace_encoder_set_format(pdata);
-	if (ret) {
-		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
-		return ret;
-	}
-
 	ret = gtrace_enable_component(comp);
 	if (ret) {
 		dev_err(&comp->dev, "failed to enable encoder.\n");
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index 189ff0b8bc18..e5c1f47388a2 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -78,7 +78,6 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	pdata->dev = dev;
 	pdata->impid = RVTRACE_COMPONENT_IMPID_UNKNOWN;
 	pdata->hw_ops = &rvtrace_hw_ops;
-	pdata->format = (uintptr_t)device_get_match_data(dev);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
@@ -146,7 +145,7 @@ static void rvtrace_platform_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rvtrace_platform_match[] = {
-	{ .compatible = "riscv,trace-component", .data = (void *)GTRACE_FORMAT_ETRACE },
+	{ .compatible = "riscv,trace-component" },
 	{}
 };
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
index 67b6779aacee..9588c32c5b13 100644
--- a/drivers/hwtracing/gtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
@@ -161,7 +161,6 @@ static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
 	dst.cur = buf->pos;
 	src.base = priv->va;
 	src.len = priv->size;
-	*format = PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
 	wp = rvtrace_ramsink_read_pair(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
 	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
 	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 9945303d2713..0a017f1f888d 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -96,7 +96,6 @@ struct gtrace_hw_ops {
  * @bound_cpu:   CPU to which the component is bound, or -1 if unbound. For a
  *               source component bound to a CPU this must not be -1.
  * @control_poll_timeout_usecs: Delay in usecs when polling control bits.
- * @format:      Trace format selected by the platform driver.
  * @nr_inconns:  Number of input connections.
  * @inconns:     Array of pointers to input connections.
  * @nr_outconns: Number of output connections.
@@ -128,8 +127,6 @@ struct gtrace_platform_data {
 	/* Delay in microseconds when polling control register bits */
 	int control_poll_timeout_usecs;
 
-	enum gtrace_format format;
-
 	/*
 	 * Platform driver must only populate empty pointer array without
 	 * any actual input connections.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
