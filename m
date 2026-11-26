Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196FB606A334
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Un1P+/Fq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bjemo1Jk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UkgOFdSI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/h2O9+F2kpHDGyd9IxbWVqdIQQyqn+daITjDRX5DsTk=; b=Un1P+/FqojehwBSvEWl/RMKaR0
	5/Ly6wL8/DJA9HF7uBVjiDGmoNvszE0LhpsA7Psaq5YVljhOYwR6xpNtgXc+mqqVzBZpm70wMTbB8
	FjiPLZgCYi4AyIp3q4C/47pBACp3BtMpHRoU891zB2c4kY2+kmENmw+L0SFYAxGhXnKXFHdB8cg/4
	lgRIdenWooObbYL5qubxuAQ1XgiyZdiI+6uZ6GN1WrCnuGNayx3eP1LCzrQDv0gg/rtFW06wjZBoc
	GzFQCeN2QaIiBj/SVbh2kK6TdhaZ/vv+8t58qnbmDrDFHYdXe5Z6nYTG73u5zsYH+GA9X3V244ViG
	eT+sOjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDR-0000000Cea7-288w;
	Thu, 26 Nov 2026 09:56:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDP-0000000CeYW-281m
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:56:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B3NT1682473
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rXYnq/FMsaO
	0wy/3wLLDl97ZH6IKPomcYTZ4KmGBeUc=; b=Bjemo1JkjtvGIptSoufg5Z8swpI
	4LxdmRgrR+deEScb9VDujE5NyB4i/x3hu2TmI1RhZjze4DuQbFC9GUbrtrbla9AQ
	B62j2V35OZIt8I6+gipMrWQCUnJgNDxZ/dnOvOzXtUycmFwmUF8OCrTIu4QBo1Ri
	Fo5lIYSqbOkliwDqMvXVPuBtFc/NDu3bqrUo9WmC5faEq5VOeNza3jf+oN+3+5Ms
	hxftphfUJbh9yDqE+bkVQzcCYz5VfPu3o/sCWVoTpwMx6v6aMfUSfXd9eIT8/e2t
	ODeo/1YmhTVzVzdmjTnRgTKxm6yvMXDCBrP08Mqex97+VvPh5/bwoF5gCKw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekjtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so1578280a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686990; x=1796291790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rXYnq/FMsaO0wy/3wLLDl97ZH6IKPomcYTZ4KmGBeUc=;
        b=UkgOFdSI7OpBPfT55Sj+u02chO5ue1oNk6huuv9xmYHQyEOZWAf9OIO8u0xpqTUip6
         JUeFDLBH3INU8vyU2VsWDhIzuJzhGCCtA+oxamorEHPv35Y2CqyahUb2ktdJ8p5T6RFa
         3f7MUfYNhbWQw1oqnW3JiSuGJaraYjyVi7O/G4PfXJ4/1476aBkLgmil6KTwWof5VrIu
         5I/60Zk+OkDuYQAiXyyPoGs6L5Ey7kdQGSHawODYdpUQ/ykXHXpUos85wCJf3xuBwHXW
         SjtfS8mCuwQOsrZiqyR6YvmPPdhACONGCn0sasIeRQsIkEwUY9gMQu4FYuKCPBnWeOzA
         5+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686990; x=1796291790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rXYnq/FMsaO0wy/3wLLDl97ZH6IKPomcYTZ4KmGBeUc=;
        b=NKTRcRLUELQzD5AoJLcyiKK7ZJx9Sm5OXMpFI5eHsCuzI5ZDImDsjgke6dGEgtGCA4
         l+1snSnIkhXQ5dSD/qnw66tvK+P5RALs0gzPbwV/KXd9jpyso1ryefdfIIh0tk+HyMAt
         sFTm/TB2KIyw713aKYw3BTNzOK4K2KtoWc10QUMjX2evw0uDgVsVMykbzeTDipB59CAW
         vZAkgYcCwjykNETWWxRiM0W4/V/80VCjsVzfvrcx1iUSvEuHX5UNBcJJH4rLPs9o7cEj
         qYmLgn8CNrQXKGu4UK2zo4WQ858575M2TBvatNQjPaTBU8AZj6w2bPlgDVRW40Reuh2F
         h0fg==
X-Forwarded-Encrypted: i=1; AL+hErGTBMTbIuU7U1BgmfrMRCwCAHsqVkAjSR+2gdA0FRyr0BzG0uGHN8nCLtDuneFWxWposKdlwjOfg5ZJjQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9Neyk0DV67HZ9T6eVYUAjIhdPhFPL4hrTcCcXkoF8LZUKI1na3
	fNBebtEid0ZHnNa6iTyukiS65nXZa/uYBkzRfk2JkZB1tJtQiejtBDiUO5laUafOA4lSbMWHUpN
	/SMoxWN8QKnW+a96PIOIJpKKl/7mdnO7t/g75EUv7fgKCP67yqdjvmF5GAt1yOYa6cI+Wx7ZCsc
	ww9bw=
X-Gm-Gg: AZFdTZemyWpVynSTSiO95Sr2fLs9kgV7HCuBUINdyYdA7xDyHVaSVe3Uu19a4fF5TPi
	ZEx9sXQkAyDX1RRETcD3gm2fOwXiHbFDFi7yZY0e0ZhQquF0TlGwV2IicP7dyw8Vn6FKyEuB40z
	ChsafD0QbvLkoWOjnuPj6vJN4c5XGP+yEIzY7wn0ZzwAIV/XGrUgwI69Temos82NU6+WV3MlxJk
	66Ep1+Q5/hGyYGogM78g9s8eNUglnGcIOUp8Oo1CkGCAiYxPPePNhKcmd5pW7n6bBKzuvCKcYyG
	mexQN9KjLmhj9IJvT+ZzuoyL5kma/8p709+8h3LD0qcDuLgQV2ni5IsJhVyTQWNEwuQms+p6G3I
	j0iew1sxTlbaguMHDG22yQL8pvw8I034ODa5tl13MajXhRBvQpmDCqCJ9vwxtIbd9rD2QusFyZz
	fy6HEWiZ3mpnJZ50icu/CCXYHg24ibXrVMGrk20WsRP/fk02kMeZNhOO2xtJcuzOkrg8kYTo29P
	w==
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr21125798a91.67.1795686990018;
        Thu, 26 Nov 2026 01:56:30 -0800 (PST)
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr21125768a91.67.1795686989539;
        Thu, 26 Nov 2026 01:56:29 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:29 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 04/14] gtrace: Add functions to create/destroy a trace component path
Date: Thu, 26 Nov 2026 15:25:25 +0530
Message-ID: <7647f6d7e4435523423e5e392131f102da8ca56d.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXyG0PxUdbC6w4
 3VNoSxHNHer2OnIEQjV5caP1u21n9T6059wFQMK9wHpD/XhbRSohMwOIApPksPdEABSZJcvKIbh
 inN+D5473eLbmffUFO61WirvP2DVppnl1JtJ5FVlgS6kl/m+4ejnaO2ReX9BQnFniA3XgeVj0LL
 XyJ8s65aX7SgCZFVcfGrOgmgUgakG+EpFkBQXVPuWn07maXCXsBTmaeTBWkmZZLmAKp1TANOqD8
 SlsujLucjpVb0KvQhv+W5snV+3f37hbL5SPPWBFbCcEuK3M0v3G/8I4cNM4QzpgioN+vdeHnw0d
 ht1bTCyVnKV0WOn3m91+J7oUfQ7f+fLa2pTg2wRAv297T6CZQrVQwAXWNQUdOqoZ+nzF/j/usFc
 c6Xo9N5YczAny5523U27H6RhGkbFLCSOmD97Z1TxFOF3BIlFC+HEZSaxGrCy06Bwl6CLMkqjzxb
 7aE4eRvjDVjuFnAwzfQ==
X-Proofpoint-GUID: CmTWiBJJtBbQcPn3UNP-2KM8465L6ljC
X-Proofpoint-ORIG-GUID: CmTWiBJJtBbQcPn3UNP-2KM8465L6ljC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX5Yd3RRBOncUe
 8XBBVAVeEjghWZCHo0y+tklYr3pGWIMmQyja0y2vpWKIUr3iNVmqipRT+/evQvmpRFAGqh4gQut
 nSy1ha2Ym51Vi8Ltvt57+jCHWjmOE7s=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b08024e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=Z2DXsEUlK3EcHYVHAYUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015631_562875_04A93363 
X-CRM114-Status: GOOD (  23.56  )
X-Spam-Score: -2.8 (--)
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

From: Anup Patel <anup.patel@oss.qualcomm.com>

Trace needs to be configured on a chain of trace components which are
connected to each other. These chain of components is also referred
to as trace component path. Add functions to create/destroy a trace
component path which will be later used by gtrace perf support.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 257 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |  27 ++-
 2 files changed, 283 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 57554d5eb98d..728235fc9bfe 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -26,6 +26,7 @@ struct gtrace_comp_priv {
 	struct gtrace_component comp;
 	u32 type_idx;
 	bool ready;
+	bool visited;
 };
 
 #define to_gtrace_comp_priv(__comp)	\
@@ -230,6 +231,62 @@ int gtrace_reset_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_reset_component);
 
+static int __gtrace_walk_output_components(struct gtrace_component *comp,
+					   bool *stop, void *priv,
+					   int (*fn)(struct gtrace_component *comp, bool *stop,
+						     struct gtrace_connection *stop_conn,
+						     void *priv))
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	struct gtrace_connection *conn, *stop_conn = NULL;
+	struct gtrace_platform_data *pdata = comp->pdata;
+	int i, ret;
+
+	if (cpriv->visited) {
+		dev_err(&comp->dev, "loop detected, please fix the firmware\n");
+		return -ELOOP;
+	}
+	cpriv->visited = true;
+
+	for (i = 0; i < pdata->nr_outconns; i++) {
+		conn = pdata->outconns[i];
+		ret = __gtrace_walk_output_components(conn->dest_comp, stop, priv, fn);
+		if (ret) {
+			cpriv->visited = false;
+			return ret;
+		}
+
+		if (*stop) {
+			stop_conn = conn;
+			break;
+		}
+	}
+
+	ret = fn(comp, stop, stop_conn, priv);
+	cpriv->visited = false;
+
+	return ret;
+}
+
+int gtrace_walk_output_components(struct gtrace_component *comp, void *priv,
+				  int (*fn)(struct gtrace_component *comp, bool *stop,
+					    struct gtrace_connection *stop_conn,
+					    void *priv))
+{
+	bool stop = false;
+	int ret;
+
+	if (!comp || !fn)
+		return -EINVAL;
+
+	mutex_lock(&gtrace_mutex);
+	ret = __gtrace_walk_output_components(comp, &stop, priv, fn);
+	mutex_unlock(&gtrace_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_walk_output_components);
+
 struct gtrace_component *gtrace_cpu_source(unsigned int cpu)
 {
 	struct gtrace_component *comp;
@@ -496,6 +553,206 @@ void gtrace_unregister_component(struct gtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(gtrace_unregister_component);
 
+struct gtrace_path_node {
+	struct list_head		head;
+	struct gtrace_component		*comp;
+	struct gtrace_connection	*conn;
+};
+
+struct gtrace_component *gtrace_path_source(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+
+	node = list_first_entry(&path->comp_list, struct gtrace_path_node, head);
+	return node->comp;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_source);
+
+struct gtrace_component *gtrace_path_sink(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+
+	node = list_last_entry(&path->comp_list, struct gtrace_path_node, head);
+	return node->comp;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_sink);
+
+static int gtrace_assign_trace_id(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+	int trace_id;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		device_lock(&comp->dev);
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv || !gtdrv->get_trace_id) {
+			device_unlock(&comp->dev);
+			continue;
+		}
+
+		trace_id = gtdrv->get_trace_id(comp, path->mode);
+		device_unlock(&comp->dev);
+		if (trace_id == -ENODATA)
+			continue;
+		if (trace_id < 0)
+			return trace_id;
+
+		path->trace_id = trace_id;
+		return 0;
+	}
+
+	return 0;
+}
+
+static void gtrace_unassign_trace_id(struct gtrace_path *path)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+
+	if (path->trace_id == GTRACE_INVALID_TRACE_ID)
+		return;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		device_lock(&comp->dev);
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv || !gtdrv->put_trace_id) {
+			device_unlock(&comp->dev);
+			continue;
+		}
+
+		gtdrv->put_trace_id(comp, path->mode, path->trace_id);
+		device_unlock(&comp->dev);
+	}
+}
+
+static bool gtrace_path_ready(struct gtrace_path *path)
+{
+	struct gtrace_comp_priv *cpriv;
+	struct gtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		device_lock(&node->comp->dev);
+		cpriv = to_gtrace_comp_priv(node->comp);
+		if (!cpriv->ready) {
+			device_unlock(&node->comp->dev);
+			return false;
+		}
+		device_unlock(&node->comp->dev);
+	}
+
+	return true;
+}
+
+struct build_path_walk_priv {
+	struct gtrace_path		*path;
+	struct gtrace_component		*sink;
+};
+
+static int build_path_walk_fn(struct gtrace_component *comp, bool *stop,
+			      struct gtrace_connection *stop_conn,
+			      void *priv)
+{
+	struct build_path_walk_priv *ppriv = priv;
+	struct gtrace_path *path = ppriv->path;
+	struct gtrace_path_node *node;
+
+	if ((!ppriv->sink && gtrace_is_sink(comp->pdata)) ||
+	    (ppriv->sink && ppriv->sink == comp))
+		*stop = true;
+
+	if (*stop) {
+		node = kzalloc_obj(*node);
+		if (!node)
+			return -ENOMEM;
+		INIT_LIST_HEAD(&node->head);
+		gtrace_get_component(comp);
+		node->comp = comp;
+		node->conn = stop_conn;
+		list_add(&node->head, &path->comp_list);
+	}
+
+	return 0;
+}
+
+static void gtrace_release_path_nodes(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node, *node1;
+
+	list_for_each_entry_safe(node, node1, &path->comp_list, head) {
+		list_del(&node->head);
+		gtrace_put_component(node->comp);
+		kfree(node);
+	}
+}
+
+struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
+				       struct gtrace_component *sink,
+				       enum gtrace_component_mode mode)
+{
+	struct build_path_walk_priv priv;
+	struct gtrace_path *path;
+	int ret = 0;
+
+	if (!source || mode >= GTRACE_COMPONENT_MODE_MAX) {
+		ret = -EINVAL;
+		goto err_out;
+	}
+
+	path = kzalloc(sizeof(*path), GFP_KERNEL);
+	if (!path) {
+		ret = -ENOMEM;
+		goto err_out;
+	}
+	INIT_LIST_HEAD(&path->comp_list);
+	path->mode = mode;
+	path->trace_id = GTRACE_INVALID_TRACE_ID;
+
+	priv.path = path;
+	priv.sink = sink;
+	ret = gtrace_walk_output_components(source, &priv, build_path_walk_fn);
+	if (ret < 0)
+		goto err_release_path_nodes;
+
+	/* Before proceeding, check that a valid path was built. */
+	if (list_empty(&path->comp_list)) {
+		ret = -ENODEV;
+		goto err_release_path_nodes;
+	}
+
+	if (!gtrace_path_ready(path)) {
+		ret = -EOPNOTSUPP;
+		goto err_release_path_nodes;
+	}
+
+	ret = gtrace_assign_trace_id(path);
+	if (ret < 0)
+		goto err_release_path_nodes;
+
+	return path;
+
+err_release_path_nodes:
+	gtrace_release_path_nodes(path);
+	kfree(path);
+err_out:
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(gtrace_create_path);
+
+void gtrace_destroy_path(struct gtrace_path *path)
+{
+	gtrace_unassign_trace_id(path);
+	gtrace_release_path_nodes(path);
+	kfree(path);
+}
+EXPORT_SYMBOL_GPL(gtrace_destroy_path);
+
 int __gtrace_register_driver(struct module *owner, struct gtrace_driver *gtdrv)
 {
 	gtdrv->driver.owner = owner;
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 46264c775efb..562cd1eca162 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -269,6 +269,10 @@ int gtrace_enable_component(struct gtrace_component *comp);
 int gtrace_disable_component(struct gtrace_component *comp);
 int gtrace_reset_component(struct gtrace_component *comp);
 
+int gtrace_walk_output_components(struct gtrace_component *comp, void *priv,
+				  int (*fn)(struct gtrace_component *comp, bool *stop,
+					    struct gtrace_connection *stop_conn,
+					    void *priv));
 struct gtrace_component *gtrace_cpu_source(unsigned int cpu);
 
 struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
@@ -280,13 +284,34 @@ void gtrace_release_outconns(struct gtrace_platform_data *pdata);
 int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata);
 int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata);
 
+/**
+ * struct gtrace_path - Representation of a trace path from source to sink.
+ * @comp_list: List of trace components in the path.
+ * @mode:      Usage mode for trace components.
+ * @trace_id:  Hardware source ID, or GTRACE_INVALID_TRACE_ID if none is supplied.
+ */
+struct gtrace_path {
+	struct list_head		comp_list;
+	enum gtrace_component_mode	mode;
+	u32				trace_id;
+#define GTRACE_INVALID_TRACE_ID	U32_MAX
+};
+
+struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
+struct gtrace_component *gtrace_path_sink(struct gtrace_path *path);
+struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
+				       struct gtrace_component *sink,
+				       enum gtrace_component_mode mode);
+void gtrace_destroy_path(struct gtrace_path *path);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver, terminated
  *                 by GTRACE_COMPONENT_TYPE_NONE.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
- * @get_trace_id:  Get/allocate a trace ID.
+ * @get_trace_id:  Get/allocate a trace ID. Returns a nonnegative ID, -ENODATA
+ *                 if this component supplies no ID, or another negative error.
  * @put_trace_id:  Put/free a trace ID.
  * @driver:        Device driver instance.
  */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
