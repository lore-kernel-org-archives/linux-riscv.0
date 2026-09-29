Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCB8CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8YwH/fCjPk/Cxq7A0m61EXJf0VcwPc/4FtkJ5tKCMI=; b=UNVkFXuQrdaUPY
	vtbU9i+0iLeJDoPUc++r6f/wen5cvwnqTc/4W2ns17zP/Ii/DGdnHGT8SzbsX7W7bo4ZfRN9WTLy5
	C02vh2+l/cb7nqMVwhMnRgSfY0svV1ELY2sQ6xgsUwUC84DOkHMkmlNB/AidomifWKveaDVT9lw88
	2iiuwLOA7lg+Be0uLzJVKYr3HFCiMYqN4106XaBsoOni1uQC7b/UN0za1LPpMLsTKlHrwpsLMXEj4
	LOL1+cY/tMf44bQeJV4R9ck1EJJyeS50XRi3IUl/r8kiouGZhRbhMd6/FiZFbrGfCqKRqhhuLQC8i
	sRoZf1uAwiy1rl8qbZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTcx-00000002t60-1OL2;
	Tue, 29 Sep 2026 08:55:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTcu-00000002t3R-0SER
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:55:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7Tqn63435284
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=DfhU
	act2XGE2bBOExBgkUlROXqvCW+0SiOtMheORWPs=; b=gtR15o0IoQGTPDu7h1oa
	BoPjYLSNSSwsYEhyQ4dgHc/VfdUs+sM3Vxj6G0IXarazd/gF6EUdzKVBPDIW2bRM
	loNH4T+oFj28MGIWw56OWNrwi8N18m2HN4UzT3pSL5+BnCrxzq+0/snO0Vy1eJHB
	Zg07Pc/H/6u0LkuWxR6nv7pHFjpZ9oo+Z69yK4tyFVoXait0maoyA/nz8htmom6c
	j1inTrXOJLM959zUcYjnYJM1LL9s+0Ekcwuk1YC6GBO3aWWApkmR/Wa/Ie9vKwiP
	6S5JFpqQpIzEdSAaL3dcZEHD2pc2fQzCLRMjNwlaYeoPromHUMmMDn+iRNytUoSC
	xA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnb53s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:55:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34344599f01so2145814eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672151; x=1791276951; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfhUact2XGE2bBOExBgkUlROXqvCW+0SiOtMheORWPs=;
        b=CVnGeawx0OOvP5XDv2mYjnG7RF8dlE6vbgAoBkyN/zVGIvQSrZZwS9OWZEkejKMCGr
         n8lkC8vYalQBGHaI92xc4nfVoaZGDGVtcjErvGENU7FL1tx0AmfzUL6wXR2nJiE2XZcG
         QtO4E7lmkrltvRxD/sopsDTn6e2kslV93eRU7L4bHrJ2l03KZWyOHOs8oKrd7Vjgw7Gq
         la8bNxe2iwOm+hWHoXPycnZqHlzA2yj3AXWZKcFgY7qQV/dOwsJHyCEn584qLq+motsp
         +5cV/C/yfdaQp+t78A5q0gJOyesv/eLBvsAzPnKk9hpQ4IzC/H1mATMQ6lWPRnR+FAzv
         bV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672151; x=1791276951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfhUact2XGE2bBOExBgkUlROXqvCW+0SiOtMheORWPs=;
        b=12ffHzcpAGbui0mYVjiBSPMtplYUMjjydmMoEasW+Sv2dMmWkXq4o1KOy/JOG2lVCb
         bbaOFmuFfcjNAdpLzDGjTM24FB8pXUJFoy3BlEeO/YiSeCJ56+bsxnLto+RI83xMPKEG
         4KwlE/U7ce6i7vWDoowE8ltSgSkor4C3usprGGA2YZ8yXFR01ZeOijmxpai7C0CSLiv8
         9RdxocyKnJPczsYVceRz9c4WNd51rgNdx0e2xX9N+3GKZ7vLtP93sMM9figkQxQsh+9S
         3wTkFy+T7AEqPXhCePl2ArJsCng5tVbPdtcOvxAByuzBT5JHIIKGS3Ia8Qfw4ES1qYqM
         +kzA==
X-Forwarded-Encrypted: i=1; AKwUvBwOjTzUQDJ5hCzJZqeuvjyyWO5ukYV0ih0VDEIj7Q5j21eX+oWQkbTfU44OD97UjDChcX/WN8bcwcKIWA==@lists.infradead.org
X-Gm-Message-State: AFuF++n8j+pVjzlxHsGuQkAOFgdGkSJz2HL0G9cSytZ5GbaA2ehQ5QFw
	z7XheXFFpShHAbQqoKQsMsc6Bz4tG6wVJZFzYQi33i3jlQXpxSV6+5RTpYRCL4f0NJLOUCG9cTe
	sAI6GaP/eH+8CQZRrBplkJpsXRgE9OUK7bTRetBwEZhGQizHFAKqkOI1DKhgO+Hh2/I8+lF0=
X-Gm-Gg: AYBFou0NY3T/AlimxxxRm5GvPxSKGFJwibjdXEVKkz9LlJllgMhGELhyMq6cnr7AIOf
	KScihGdMPZAB2b6MBD3FlqswNP1X/53sJYgLHXYqIgawXZ5e4jwemFZQNE9rhpgSc54A2mX+RJ9
	TCLmkWRnkB19iE4BB+lqWtktmqCrVgoa3FqCL5zd3hOufqUWeE5Vk6oqz3X+Twfaw06RxG/bIiJ
	RKokzDF0MzQZl8zu4x5vGlxz3jhbMCXUNCv4R2ZbdK17Neh01LaF3XDK52A44NKwxnXye4RtDJk
	UTCcvn1tawjrGw3zr71c6vjonfQ0BAvKWun6oHKL/fKbHMRfAOGYqoCFUY9XYJdGq71tqyXvZiJ
	wvNAPueMkBw7obDckS9yKSfYBQNgLnJpjesFGa3nvmETTB4m50jfiy1vg
X-Received: by 2002:a05:693c:8802:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34a48cec2bbmr4105935eec.32.1790672150811;
        Tue, 29 Sep 2026 01:55:50 -0700 (PDT)
X-Received: by 2002:a05:693c:8802:20b0:34a:48ce:b687 with SMTP id 5a478bee46e88-34a48cec2bbmr4105913eec.32.1790672150226;
        Tue, 29 Sep 2026 01:55:50 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:49 -0700 (PDT)
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [RFC PATCH 4/5] hwtracing: rvtrace: Move to fwnode_* APIs
Date: Tue, 29 Sep 2026 14:25:23 +0530
Message-ID: <20260929085524.1554507-5-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
References: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: SGZNwdEqKCqD4ldK3ivv4Y4Dp2lfuE7G
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abb7d17 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=R8tqjmwxtafIxTb_AOQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX/eQOutDB+HK2
 duEm7kzw/5fCZ/4FKlLvjRGjleVjIuMzztkZr1Xmq6mim5JhQZcvdV06J/w6FI8ZjdOWwJkLXIr
 CzixsB/Br64t/yDBQS7Fv/7A1zSasAYWMgHrbLDEpSGvxoUQuOs6nwfZZmH+iNc8aGt21g9c8kj
 nAVT7a6z6K7o8KOpppThprAGbkC9u7xHvffHxZWpyrpo/do3fiJbrMcqWlkFdB2uvtXwQK4jaPr
 R+LViw9PC0SM92O74rLsSXbrRypxC+/h8sBzY5o177Kjj7REv12a1LiShPlLipZszfJCWHDmXb1
 DfpmaEVxp+wdrZ4b/MQ2GytF+FcwdobliWQAtTd3WDXrx3wYRui+q/spKBtRL8QYTqXTkYnniI2
 OqIk8sgONeP9MJ/CQKihpCWedo/LcjUMX4NUidX4WPOBrXRU3oWQok2CRSlIqo7je8Jw7L47z0h
 umJ9tRdvC07pTcP7HUA==
X-Proofpoint-GUID: SGZNwdEqKCqD4ldK3ivv4Y4Dp2lfuE7G
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX4BjQBE+h3UNA
 TOoUAqsj+BzR0UUShHYd8vOpR3gNutieoa/PFabpsarATV2TJ/pof5gK03Xjz3iJWuuRx73MqnE
 x4HxQaUYYYj6JO8y+7ydBRXiAl1KEQU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_015552_158273_0963D0B9 
X-CRM114-Status: GOOD (  22.82  )
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

From: Sunil V L <sunilvl@oss.qualcomm.com>

so that it works for ACPI as well in future.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/Kconfig            |   4 +-
 drivers/hwtracing/gtrace/rvtrace-platform.c | 131 +++++++++++++-------
 2 files changed, 90 insertions(+), 45 deletions(-)

diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
index e5b62d65e2fd..86322250a6a3 100644
--- a/drivers/hwtracing/gtrace/Kconfig
+++ b/drivers/hwtracing/gtrace/Kconfig
@@ -2,7 +2,7 @@
 
 menuconfig GTRACE
 	tristate "Generic Hardware Trace Support"
-	depends on OF
+	depends on OF || ACPI
 	select PERF_EVENTS
 	help
 	  This framework provides an architecture-neutral kernel interface
@@ -18,7 +18,7 @@ menuconfig GTRACE
 config RVTRACE
 	tristate "RISC-V Trace Support"
 	depends on RISCV
-	depends on OF
+	depends on OF || ACPI
 	depends on GTRACE
 	default RISCV
 	help
diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index f34de9183d9a..12330d9dcddd 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -7,7 +7,6 @@
 #include <linux/gtrace.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/types.h>
@@ -61,52 +60,61 @@ const struct gtrace_hw_ops rvtrace_hw_ops = {
 	.reset		= rvtrace_hw_reset,
 };
 
-static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
+static int rvtrace_parse_outconns(struct gtrace_platform_data *pdata)
 {
-	struct device_node *parent, *ep_node, *rep_node, *rdev_node;
+	struct fwnode_handle *parent, *ep_node, *rep_node, *rdev_node;
+	struct fwnode_endpoint ep = { 0 };
+	struct fwnode_endpoint rep = { 0 };
 	struct gtrace_connection *conn;
-	struct of_endpoint ep, rep;
+	unsigned int nr_outconns;
 	int ret = 0, i = 0;
 
-	parent = of_get_child_by_name(dev_of_node(pdata->dev), "out-ports");
+	parent = fwnode_get_named_child_node(dev_fwnode(pdata->dev), "out-ports");
 	if (!parent)
 		return 0;
 
-	pdata->nr_outconns = of_graph_get_endpoint_count(parent);
-	pdata->outconns = devm_kcalloc(pdata->dev, pdata->nr_outconns,
+	nr_outconns = fwnode_graph_get_endpoint_count(parent, 0);
+	pdata->nr_outconns = nr_outconns;
+	pdata->outconns = devm_kcalloc(pdata->dev, nr_outconns,
 				       sizeof(*pdata->outconns), GFP_KERNEL);
 	if (!pdata->outconns) {
 		ret = -ENOMEM;
 		goto done;
 	}
 
-	for_each_endpoint_of_node(parent, ep_node) {
+	fwnode_graph_for_each_endpoint(parent, ep_node) {
 		conn = devm_kzalloc(pdata->dev, sizeof(*conn), GFP_KERNEL);
 		if (!conn) {
-			of_node_put(ep_node);
+			fwnode_handle_put(ep_node);
 			ret = -ENOMEM;
 			break;
 		}
 
-		ret = of_graph_parse_endpoint(ep_node, &ep);
+		ret = fwnode_graph_parse_endpoint(ep_node, &ep);
 		if (ret) {
-			of_node_put(ep_node);
+			fwnode_handle_put(ep_node);
 			break;
 		}
 
-		rep_node = of_graph_get_remote_endpoint(ep_node);
+		rep_node = fwnode_graph_get_remote_endpoint(ep_node);
 		if (!rep_node) {
 			ret = -ENODEV;
-			of_node_put(ep_node);
+			fwnode_handle_put(ep_node);
+			break;
+		}
+		rdev_node = fwnode_graph_get_port_parent(rep_node);
+		if (!rdev_node) {
+			ret = -ENODEV;
+			fwnode_handle_put(ep_node);
+			fwnode_handle_put(rep_node);
 			break;
 		}
-		rdev_node = of_graph_get_port_parent(rep_node);
 
-		ret = of_graph_parse_endpoint(rep_node, &rep);
+		ret = fwnode_graph_parse_endpoint(rep_node, &rep);
 		if (ret) {
-			of_node_put(ep_node);
-			of_node_put(rep_node);
-			of_node_put(rdev_node);
+			fwnode_handle_put(ep_node);
+			fwnode_handle_put(rep_node);
+			fwnode_handle_put(rdev_node);
 			break;
 		}
 
@@ -115,21 +123,25 @@ static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
 		/* The 'src_comp' is set by gtrace_register_component() */
 		conn->src_comp = NULL;
 		conn->dest_port = rep.port;
-		conn->dest_fwnode = of_fwnode_handle(rdev_node);
+		conn->dest_fwnode = rdev_node;
 		fwnode_handle_get(conn->dest_fwnode);
 		conn->dest_comp = gtrace_find_by_fwnode(conn->dest_fwnode);
 		if (!conn->dest_comp) {
 			ret = -EPROBE_DEFER;
-			of_node_put(ep_node);
-			of_node_put(rep_node);
-			of_node_put(rdev_node);
+			fwnode_handle_put(ep_node);
+			fwnode_handle_put(rep_node);
+			fwnode_handle_put(rdev_node);
 			break;
 		}
 
-		pdata->outconns[i] = conn;
-		i++;
+		pdata->outconns[i++] = conn;
+		fwnode_handle_put(rep_node);
+		fwnode_handle_put(rdev_node);
 	}
 
+	if (!ret)
+		pdata->nr_outconns = i;
+
 done:
 	if (ret) {
 		for (i = 0; i < pdata->nr_outconns && pdata->outconns; i++) {
@@ -138,29 +150,69 @@ static int rvtrace_of_parse_outconns(struct gtrace_platform_data *pdata)
 				fwnode_handle_put(conn->dest_fwnode);
 		}
 	}
-	of_node_put(parent);
+	fwnode_handle_put(parent);
 	return ret;
 }
 
-static int rvtrace_of_parse_inconns(struct gtrace_platform_data *pdata)
+static int rvtrace_parse_inconns(struct gtrace_platform_data *pdata)
 {
-	struct device_node *parent;
+	struct fwnode_handle *parent;
 	int ret = 0;
 
-	parent = of_get_child_by_name(dev_of_node(pdata->dev), "in-ports");
+	parent = fwnode_get_named_child_node(dev_fwnode(pdata->dev), "in-ports");
 	if (!parent)
 		return 0;
 
-	pdata->nr_inconns = of_graph_get_endpoint_count(parent);
+	pdata->nr_inconns = fwnode_graph_get_endpoint_count(parent,
+							    FWNODE_GRAPH_DEVICE_DISABLED);
 	pdata->inconns = devm_kcalloc(pdata->dev, pdata->nr_inconns,
 				      sizeof(*pdata->inconns), GFP_KERNEL);
 	if (!pdata->inconns)
 		ret = -ENOMEM;
 
-	of_node_put(parent);
+	fwnode_handle_put(parent);
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static int of_rvtrace_get_cpu(struct device *dev)
+{
+	struct device_node *dn;
+	int cpu;
+
+	if (!dev->of_node)
+		return -1;
+
+	dn = of_parse_phandle(dev->of_node, "cpus", 0);
+	if (!dn)
+		return -1;
+
+	cpu = of_cpu_node_to_id(dn);
+	of_node_put(dn);
+
+	return cpu;
+}
+#else
+static int of_rvtrace_get_cpu(struct device *dev)
+{
+	return -1;
+}
+#endif
+
+/*
+ * rvtrace_get_cpu - Find the logical CPU id of the CPU associated
+ * with this rvtrace device.
+ *
+ * Returns the logical CPU id when found.
+ */
+static int rvtrace_get_cpu(struct device *dev)
+{
+	if (is_of_node(dev_fwnode(dev)))
+		return of_rvtrace_get_cpu(dev);
+
+	return -1;
+}
+
 static int rvtrace_platform_probe(struct platform_device *pdev)
 {
 	struct gtrace_platform_data *pdata;
@@ -168,7 +220,6 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	struct gtrace_component_id id;
 	struct gtrace_component *comp;
 	u32 impl, type, major, minor;
-	struct device_node *node;
 	struct resource *res;
 	int gtype;
 	int ret;
@@ -189,24 +240,18 @@ static int rvtrace_platform_probe(struct platform_device *pdev)
 	if (!pdata->base)
 		return dev_err_probe(dev, -ENOMEM, "failed to ioremap %pR\n", res);
 
-	pdata->bound_cpu = -1;
-	node = of_parse_phandle(dev_of_node(dev), "cpus", 0);
-	if (node) {
-		ret = of_cpu_node_to_id(node);
-		of_node_put(node);
-		if (ret < 0)
-			return dev_err_probe(dev, ret, "failed to get CPU id for %pOF\n", node);
-		pdata->bound_cpu = ret;
-	}
-
+	pdata->bound_cpu = rvtrace_get_cpu(dev);
+	if (pdata->bound_cpu < 0)
+		return dev_err_probe(dev, pdata->bound_cpu,
+				     "failed to get bound CPU\n");
 	/* Default control poll timeout */
 	pdata->control_poll_timeout_usecs = 10;
 
-	ret = rvtrace_of_parse_outconns(pdata);
+	ret = rvtrace_parse_outconns(pdata);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse output connections\n");
 
-	ret = rvtrace_of_parse_inconns(pdata);
+	ret = rvtrace_parse_inconns(pdata);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse input connections\n");
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
