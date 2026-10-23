Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656B9606A319
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bC/Ak77E;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=JFWucXxY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9OuNjZGDlvFYFR47r9Scbnvc3rnHnH8+DWLEOiOFTP4=; b=bC/Ak77ER947DdEm97wroVCgTb
	OXrflhYeU6aegM54PwTXXYRgR9LdovvJBEA9ummrDdxDdijpUTnsuuOf9PfBgnErvJ251oL/T0ndW
	lcnwUKb1vrVADU02KBGppROq3hUNNiFci28f7zmgW7rMZYky+Q26ElRE8DfdXDQo3i2DCYWJz/6RO
	NchmQ9CqA+TnWUCVMJ9vZoS5FTuXJ15jSN7CnOdcRVcwwIB+um9NKk4/wCyYacJBoXCB/fi+3rboW
	b20sRCFewtN/G0dgRF9MPqJ6vUt6RVYMIbugFTbhl0mJtoe7S2XPccPkImcPRhrEuDJXkAlffPx4/
	wVipfFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5lr-0000000FODX-0vZW;
	Fri, 23 Oct 2026 03:16:43 +0000
Received: from smtpbgau2.qq.com ([54.206.34.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5ll-0000000FO1C-1cxn
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:16:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725344;
	bh=w+SKr0yx2bzLRT2ts2C0c4p0JIw7KUOgOOjNRZexgGI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=JFWucXxYWXQX11P6vPPNSQUPLYrQq5jd7r0rbPAVbEYHn4I0yo0/kUnEwKGOzpOqw
	 tCp+6JsjeihRzEJjWjsrmVj+qur2Z3qak+9tRDvf+PSAfDxEYuQRgFqrPSGE9iW4XR
	 TYqQ+C7/q+sqjvoeZbGuBEXdHnQTA6IiLejeC8QY=
X-QQ-mid: esmtpsz11t1792725336tc6848384
X-QQ-Originating-IP: A0yp6TFKp3KclDrjVG+PDZ5DijhTQYFbPhgQy1uYzec=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13943008464653737948
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
Subject: [PATCH 07/24] gtrace: Parse RISC-V Trace encoder config from perf event
Date: Fri, 23 Oct 2026 11:14:48 +0800
Message-Id: <20261023031505.2020925-8-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mg90GDIyb2xWUg11jdUqCIiNHSJg+H+0wnpyxoiWbl1M/+x1fWEwCRDK
	nVoAl3sSpwaqEA4yyeQY92bMmd01qlQnlQNmlipzVd1QouYUms05lEHBv0ZypP9v3ITscne
	0T6iax7UNjMAY0UmQtZ2GQUNOqsvIxhAdKOq6JTEmC/IepZZWsBa4C2u02m3g1W3VgrVd67
	/ovVkCEXR2XAubdFws68FFF6H0dGab875w2nD7HWM2aw3exPTzapBf7X9Nac1+WFe0N4arM
	jH26eUnV66fCw3SrCa2sFjOaJkKe2fbfGuCFIo/u7WCYu3tBUEJp1Qb7kmYROCMry/lRYVe
	1jfKV/Te7ZIXWK27hd3imsN7+v8kJgPUBHjuVzz6meQz9HmibFaCJ2AJNNHLZRMB8dyV3KA
	1dK7ijbskP8gKTAUmatj+L3S2v77zeP/4CzsUt+K0TjyEFKNA6NpgAexXtZMbrrumFxBNFS
	z3pa6mxXCasnBlvwMwr1aH8muts6S3tv5lI4faQ6EJK7EKm0OMH3DNYjKFD/ZR5ATBWeiFX
	K4rkKlKBnFZVJgoPtIU6GGQRP7Sp1re9DbxVTHnmG8mviHVNcyo3hovOwXvcwmMqfww0RYa
	9ntjuKPQAWHt9Wxfr0BGwIPK0PMxY7ryo8gyQo1WL3n9ggXn/9yMn0YrPycO6X6uZtHhdxi
	6MobU9XjjDziynOi7+lRuOIeOrhBLaMACjXEiZOj8xsrBuJA+Z0lxOP6/RKYiTI69j9ygXo
	UFGHaR9L1xB1f1RiMXk0BKthhpJP/81IjrxdasWGw31hJSAFXblJO7Ky0/ROtrxa+3A4OEi
	151H5EvM2A/D5WpUipqrOWYjbkf7TIaHXFRAanAGoLopjABn8z+8yfZ+dwADbZYLg5s3IP4
	pHoqlp4v4F8vndwOYg+dWEGhp+LQaz3ojpsj9BLSjr9oV2ENRbEjL1wpL3Y3ALXRLi8BzVy
	BInOg3OIihsz6ci+TyvMiCCcK6jQDNvph1nKhgcRKIfTPZ9AVJ9yqmqy9ZBijdmK9DH/hgM
	xs9I8/NNbz1vt6FjfZY9KzUwgg/t4g4re9+yvsgbMP0ocZ7rt+pIQpxStkoICMq6vycJpPp
	q8jDQ4OIfNenjp6+tJG0wDu2+O4yAyxkQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201638_061134_49A73685 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

Parse the hardware trace encoder configurations (timestamp, context,
syncmode, and syncmax) from perf event attributes when operating
in GTRACE_COMPONENT_MODE_PERF.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 .../hwtracing/gtrace/rvtrace-encoder-core.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
index 01925ebdfbde..817535ff9558 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
@@ -140,13 +140,33 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	return 0;
 }
 
+static void rvtrace_encoder_parse_event_config(struct rvtrace_encoder_priv *priv,
+					       struct perf_event *event)
+{
+	u64 config = event->attr.config;
+	enum rvtrace_encoder_syncmode syncmode;
+
+	if (priv->has_context)
+		priv->context = config & BIT(GTRACE_PMU_ATTR_CFG_CONTEXT_SHIFT);
+
+	syncmode = FIELD_GET(GTRACE_PMU_ATTR_CFG_SYNCMODE_MASK, config);
+	if (priv->syncmode_hw[syncmode]) {
+		priv->syncmode = syncmode;
+		priv->syncmax = FIELD_GET(GTRACE_PMU_ATTR_CFG_SYNCMAX_MASK, config);
+	}
+}
+
 static int rvtrace_encoder_start(struct gtrace_component *comp)
 {
 	struct rvtrace_encoder_priv *priv = dev_get_drvdata(&comp->dev);
 	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_path *path = comp->path;
 	int ret;
 	u32 val;
 
+	if (path->mode == GTRACE_COMPONENT_MODE_PERF)
+		rvtrace_encoder_parse_event_config(priv, path->event);
+
 	if (priv->srcbits)
 		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
 
-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
