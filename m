Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F5F606A322
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZhHOd1dz;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=yQVK1Odl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f53FQj2pRpwxbrxp+EmdShHLHG1Rx+0Z6hN2STdEP0g=; b=ZhHOd1dzeNTiSOk6DlNsZaNo3i
	eUayzR5JfawhlBM4B/gYeIMf6WKE8li7j9HtMjWIy4utco9qiZD+iwpLms/d1CK5U9xWIivgAyM0X
	bVOvOb66O7oQcgw0elaM0cXZKdm0UMOFi8ifn+1jaqMI0m590r41H64s+qKuBaKHxy16+6rUYXYN/
	NonYKKr6Hk2UYiT7f6BO2LcshGbHueRq2R2IWN0bZQIdRKA8cyGE8TcvuCJrrA2vwvsWeakgwp11v
	xYyPONQZvWd+4UDZz8srDXLmtV0HhZ/JtlyLvydzCrByhycnalIzi00G0jd5x0CT0amQ1u0bELvHP
	F6ewLqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5ln-0000000FOAF-2IC4;
	Fri, 23 Oct 2026 03:16:39 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5lg-0000000FO02-2tOf
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725321;
	bh=53T+lOsiCJxQyCBaXPSx/2ETRZB4EWLtPkyWmCEPcuY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=yQVK1Odl1xTiYzQvoDxghrEcr6V/u2/N2LW+4gjmCfbKAmcbe4DzWJ37rad5VyhLv
	 nsC7IE+FQPY8BrXYAfJQM741O8jkrVyYsn72AVpo0t/PqZWmpoxvV21+jje/0dFplh
	 sQZPjC/NNhhmCurG5p+REMg8fJt6kssZoLDTwm1s=
X-QQ-mid: esmtpsz11t1792725313t965ea44f
X-QQ-Originating-IP: p7vMAcqPWqfRfANcWnhRaUeK6HXYkU330FgkFSMDiWA=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18378101809454944597
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
Subject: [PATCH 01/24] gtrace: Move connection release into component unregister
Date: Fri, 23 Oct 2026 11:14:42 +0800
Message-Id: <20261023031505.2020925-2-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NIaGbSI1IL4Z0JEMcj61Uhtpsz8Wyk8kmRfYtXH74mAtxKk2DzmnxdyX
	UlEQcB/0behkRw9vFA57V9RLqoZRos+jSMSzMo8UwiNblyDSrBV+sn0XzhjHLCAea+dGL4D
	+auqn4oeZJvy/JSYKo0838wCXP2l53g+I7a80YEBgbbDT367ojRllumPOp1ZyHZ9UpFoKAH
	NXLQr/3j0S0Rs+7TSctQavroE6bh602abSLYyS3HeQ5Z1qd3X81m0MSo3z77BhNTkAGRRaK
	Tw0VqvA7bDWl4ItTeOHEYjPJik/K5HnmFqFDRtyZz6bwM3tGCJ4UBL0rIisyKYH5TXsvqIa
	MimKYI07yHHjkAM5K7/52kgOH+vuX3W9apWUwZZPZKlxHt7hty4NegIJsIatR2qpxD9r/xU
	VmuwRob23KvjX7Goaj30efrCSd02bobYg83JHLWVI4JZdQb7UcWQw9sj2E7g1yXRq8s9XJ+
	p2UVW3D8PLOlhApA+ozFFnM2Z6jIwFOqTx6P7H0mWANnGbh0wKImIIXNPrXuynP5bRv9Wuh
	I2Cy4g/mvF+O2vzN0SzodAyjfpQV04Ts4DGZwIykthYhoX5uuiSdG3jmPfPw+Mx/uJYHpoi
	7Sl3wAJK9U9mCaM2hvenj7YQWXErOnlOJMtrdhZzNh30DQ2qOLOeYeh5EyOMSJp3ZZ8n1yp
	tAXEIpnUqw96k26qEySk67GTm/U1qfRl17d0lTiz5c30y2HQugOMIwnR5oz7kQD6cqL4kbZ
	0jhZDZMuOQN2OZHWI0FWcYu1YJnwnc2O4vQRa2Z0vbmbFQbBwdPaLnNrVEx1cJjERwYoJ/N
	uNvDhLTY10+JYngcDu7jO6kYIolMCNXsEUM/SKFc2p7JpIfEvqoMBcNGxoG5cLj2nrtoN4S
	atveKylbCLtwPyQKVhW16Nn9enkOtceI6oiIP4/vydob6IsbKWHR26Ujnym5KEDeaCeRFd8
	vCkftfd1AhH8+CDEJ/Rwwug2j2WUK5s2/kzBRYlBOhrXWam1zUNZPgL7PLlSnL1veXz+vxN
	/C8YiCcRNgc1fE9k2exkuXrGSXgzXbdUtsloY5eQ==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201633_273233_CE6B7BA1 
X-CRM114-Status: GOOD (  12.50  )
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

Add gtrace_release_outconns() and call it from
gtrace_unregister_component() so the output connection fwnode
references are released in the core instead of being duplicated
in every platform driver's remove callback.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c      | 15 +++++++++++++++
 drivers/hwtracing/gtrace/rvtrace-platform.c |  9 ---------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 034987237abc..5704e426abe8 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -479,10 +479,25 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 }
 EXPORT_SYMBOL_GPL(gtrace_register_component);
 
+static void gtrace_release_outconns(struct gtrace_component *comp)
+{
+	struct gtrace_platform_data *pdata = comp->pdata;
+	struct gtrace_connection *conn;
+	int i;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		if (conn && conn->dest_fwnode)
+			fwnode_handle_put(conn->dest_fwnode);
+	}
+}
+
 void gtrace_unregister_component(struct gtrace_component *comp)
 {
 	struct gtrace_component *c;
 
+	gtrace_release_outconns(comp);
+
 	mutex_lock(&gtrace_mutex);
 
 	if (comp->pdata->bound_cpu >= 0) {
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index a5655e983e51..189ff0b8bc18 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -141,15 +141,6 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 static void rvtrace_platform_remove(struct platform_device *pdev)
 {
 	struct gtrace_component *comp = platform_get_drvdata(pdev);
-	struct gtrace_platform_data *pdata = comp->pdata;
-	struct gtrace_connection *conn;
-	int i;
-
-	for (i = 0; i < pdata->nr_outconns; i++) {
-		conn = pdata->outconns[i];
-		if (conn && conn->dest_fwnode)
-			fwnode_handle_put(conn->dest_fwnode);
-	}
 
 	gtrace_unregister_component(comp);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
