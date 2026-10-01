Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE85CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4c9t2iEnQXWQ25foNwkivw96Zp/Dfz1F4fjOhY1txI=; b=wrfYk1rU00bz20
	7xZNNN1UmW8UH7r1ngpgg7qyA5yxaHUxhFn8UPJfaGcpHEcXhPA4cZswhwiqte3AZMyc1oikjvgLB
	ZNrkUkfS7mXq4gXFJFhwUldn8Wj/hPQJ1cYsjuJPxyc0/sJuLpm9+GsQZg5Rtixpyb4WjgUlBGDlg
	YFNTIn7zxBPxAjaXyyBjCuIQbwZw6bzx2T0RyVqJhJpyfkIA3AM5qvmLjqU6XWXntYoArjwm8LvPf
	Yu1KT/Kt2+TOe+0BCEQYosEnrVPzzoJbK/FvExYyQ+c9qesPiss1yEqeeDatGejBKBQhYbloeEc5/
	O2Lbs3NQCDMzPNjg8bnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9HD-00000007ndm-1Sfq;
	Thu, 01 Oct 2026 05:24:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9HB-00000007ncd-0t5X
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Oct 2026 05:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N+RkyGHAtZ4jeVfeYfJcIP0Ux1XRCteHgZPTH9XttmY=; b=XUbTifNqeE02DC1y2S0sxsbBxs
	nbK3ZLTLmOZjk9lBVcH3RsuxJ9ABvXUbHrJX1l4xp/71GalLQOqBHyG7/B18SPm4nodaborNjxKLN
	BhxS7Is2Doc/CaZWf1sb9RY26vHGSEdkRzO7JApcVA+S8wdLuTO2k4gEMOksi0q4KH0ta+V2LjZ8v
	UnS5RqyWms0wMOKyhR59ssniBYN859QYRalX1sleJUv9TzUuL2Ho9dxMbYS17Dp/LW+MNbcswMG0m
	SrXFh/PkMywCtoyiQGd6SpZ/vU7nfcJYfzhfvxTbXbNz2usGNv6UBXZQ7oNoGZuoeMlNQKBuIGGp1
	delz6iwg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC9Gx-00000004aj6-2WAo
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:24:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6915GM9I1953560
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+RkyGHAtZ4
	jeVfeYfJcIP0Ux1XRCteHgZPTH9XttmY=; b=ji/BgsvIC+b247yWn+Xq+qQxWUc
	A8AqWvwnSt25Tjn1VYXPsJdndfKwwtDGTZkXJRC7iWlHVHDQWWXoFRKTNZQZSxvj
	QhmQ3xp0RU1FXc/dfKBgzOoy4Ka1+1DkX3vEkz01fiysh2L8x1Bs9GKkS3xrD4Cp
	w3ceBBVTU3SyGeuCpYXxhP+sDDKqAUdlNpQFZP60cicErZsg4u893i3nYckMLqEA
	xXnkgw/Lb5pkx2ZDYG01n7+yayA7DYIy6a2Ek6j900Axu6zRU9BnB9I+jjVwsIQm
	TNVdo6NQuacZduFc3wrucnIxY6akY1/R+lMqKuxzso+uTafpzAFKflcc7Xw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nr19q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:23:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a470ead068so3674680a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832236; x=1791437036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+RkyGHAtZ4jeVfeYfJcIP0Ux1XRCteHgZPTH9XttmY=;
        b=ZRBHe5kGbrmxP6JS/2BRH52IE3U9tmmjl6nG3p3TsI31qwJYYsS8JWyMO+NZhsNU8e
         452q9KcODdCAX7r59cT7XX6pNpOT1DL1VTQmKUWPmXrLmbfydFkbQEqVY/k3aXY2nPUW
         hCphqCYnYst7Fm7rHuw6j04Xwj+S9POSo0zyqTzFSgniwPxnwcuQ4tnP6v9kvbpT7zmj
         kx3tvN6ehYrn/wVBdSS52uQu2/dktuTZiOLGp5tAooNB5DXY4m0dR5H9yWbavKCcngqr
         ojc2COXW3ia6pDrfQK4OxXmoqtL5GK5h82SySJAOBEAAPBQN+r17/UnJTL+O8SGRIOMD
         xqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832236; x=1791437036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+RkyGHAtZ4jeVfeYfJcIP0Ux1XRCteHgZPTH9XttmY=;
        b=d6/+igJiE97QzGaMardte0zHZjCJy4GWpOpAEUO88XyxAgVa0rrEpw8FXejLalPUwm
         bsjihE1kHk2kQqoe5e07tU3SoCFCkbeZ1FrpZf09sfhLHHTNNhXwqryoWuwDR+EE7DYk
         9U1FS2bMDv35YynubSUnCcnMMA3+cBBnZgdhLpgr+4JL1P8k6tYA8T4REppoteMzwCe6
         mhzWt0ebBmQcaWAKw96l0RltRfcFcj91ljK6hdaelsi3kVVed4xly5Cj/NMmcOVWCZ7F
         tynAy3+JNQOnyXs4y95A71ev4MN5RiBrVF7o3GpQ5xTPsK0ZuNvyNJa+jCxJtgd+ogmq
         pI4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxISpYh0JfoaRI1dml0w/kKlfND/prsqDLtbLt0+igo3rlJz/EQKqcKiZPMtUyHxPV0YrVZnbNen1xTCA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLY32hXQlvYXVRABUrCBkvCeTMuyP8z7wkFlwIVm8zgFUqDO212
	T4vF7QVVnaBvUM6uZOUCfNkANzMIQDEBSmlaVynRjjqwN/72aBc4cUudKi3d+70C5O3FK73HII8
	VaZqR+IAyaAXedcAdFhw03O91fX9c5RsXrj8lJ5CjygUzM6IKzGWo4y1kdVQp3i3i+FANW6M=
X-Gm-Gg: AYBFou00FbvcJz5caInREVehaALwCAz6a38fK9y0g6JvQETJO9K+FqJhIQo6OkQ0bWo
	sjeOEZvDleDyip4Z+klz+If4hDVQ6rmUways73nLaZ/PxzDHMRrK8OHwrxccbQCopIxr+3UREw/
	C1hGZ4Tdhmr7X8dZUNBgJ9A/ajgIiNxCexb+MgJYuOGPqFnBNW95MoFb009TpgBv20w0ZMCNQTa
	bGeti6m4AcCymFPM7FrAdhGOS46Mm4i8/6nmA3UA0O1rI7r+iPH/dGccHUelsBy1yQouYA8tTiC
	40HBmi4D1sFTGurq8rMnYIoeWxNP2efLys4i23enwLwPe7OgQBpgTOBzy7etCQT6i5Gz8RWNw0J
	y5mpMLrMlHegRVM0daZMnYakTtH33fLqsF2xYiPVQbmD2uHA3a3fyb9jRpDVTZSdlNkBLQxRnKc
	/Lehv11vRKlnvrADEDhJM5EDPj
X-Received: by 2002:a17:903:b8e:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2e2e48b8521mr28656225ad.3.1790832236325;
        Wed, 30 Sep 2026 22:23:56 -0700 (PDT)
X-Received: by 2002:a17:903:b8e:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2e2e48b8521mr28656015ad.3.1790832235856;
        Wed, 30 Sep 2026 22:23:55 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:23:55 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 04/14] gtrace: Add functions to create/destroy a trace component path
Date: Thu,  1 Oct 2026 10:52:15 +0530
Message-ID: <20261001052243.3042627-5-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abdee6d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Z2DXsEUlK3EcHYVHAYUA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX3TLh0kiZUAFJ
 03K3RbNwTes8MAOFHa/Pv4NisiOwxKFnvORWIG8eJoqFogAHvpnvuk8zU0ab3oPJ81aYWksJwJr
 PVPA4ADNY5XErtUfF3LeYCKrbvsIN2M=
X-Proofpoint-ORIG-GUID: G2yKR_eezco-EO-mmkSzAk9bsC8UR8_m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX4KaP8ApnmDHv
 FkM+FAgY6Ax9Ztq9Az0ddFdyADGfaaUs57yyGZ/1wwUkPoy8Fg8TZwDbApOGDbohdevE4HJX4sQ
 m5eeM/NLQMwG7Z0L4GduFvYODY7Rg2oq0FVnEEKF7k+uxabVoS9w1eUnlPYkFEh2htDMlwt4NpZ
 BwnU6S7XmWyBK2oqgd0qSFDPkrrOn8Ky3cSldVAyyo3lLALKD9HZenWmmvHP0IoK2RpUcv44A9w
 vH0Jddj9qNyOaJUIsnl8VrchpDvA/pnjT1MIt7x7m3iEhm44ABQldLRjY0jqcOBcXRHwznw7YzF
 8hDsxN+QUd9Lbuji9nQ439LCbf92zdpQ1jfv4JeFl3NkiNlHKV2x9Q9y90OwG5pTMvBAiXBMGaC
 0T4ZcZWbs8hbuAAa1KKNzv0oiCxQ7MQtJpeCHP/gskAdPlamsjoYP/pUeVgS9U2yc2KKdD3LUkH
 Yhk9egco/SEJvnsfO9Q==
X-Proofpoint-GUID: G2yKR_eezco-EO-mmkSzAk9bsC8UR8_m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_062410_196455_E369361E 
X-CRM114-Status: GOOD (  26.01  )
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

From: Anup Patel <anup.patel@oss.qualcomm.com>

Trace needs to be configured on a chain of trace components which are
connected to each other. These chain of components is also referred
to as trace component path. Add functions to create/destroy a trace
component path which will be later used by gtrace perf support.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 241 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |  24 +++
 2 files changed, 265 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index d374c679a649..f750025104ec 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -26,6 +26,7 @@ struct gtrace_comp_priv {
 	struct gtrace_component comp;
 	u32 type_idx;
 	bool ready;
+	bool visited;
 };
 
 #define to_gtrace_comp_priv(__comp)	\
@@ -224,6 +225,62 @@ int gtrace_reset_component(struct gtrace_component *comp)
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
 	if (!cpu_present(cpu))
@@ -431,6 +488,190 @@ void gtrace_unregister_component(struct gtrace_component *comp)
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
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv || !gtdrv->get_trace_id)
+			continue;
+
+		trace_id = gtdrv->get_trace_id(comp, path->mode);
+		if (trace_id > 0) {
+			path->trace_id = trace_id;
+			return 0;
+		} else if (trace_id < 0) {
+			return trace_id;
+		}
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
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+
+		if (!gtdrv || !gtdrv->put_trace_id)
+			continue;
+
+		gtdrv->put_trace_id(comp, path->mode, path->trace_id);
+	}
+}
+
+static bool gtrace_path_ready(struct gtrace_path *path)
+{
+	struct gtrace_comp_priv *cpriv;
+	struct gtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		cpriv = to_gtrace_comp_priv(node->comp);
+		if (!cpriv->ready)
+			return false;
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
index 5368dca0e936..2c3be4d161c6 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -229,6 +229,10 @@ int gtrace_enable_component(struct gtrace_component *comp);
 int gtrace_disable_component(struct gtrace_component *comp);
 int gtrace_reset_component(struct gtrace_component *comp);
 
+int gtrace_walk_output_components(struct gtrace_component *comp, void *priv,
+				  int (*fn)(struct gtrace_component *comp, bool *stop,
+					    struct gtrace_connection *stop_conn,
+					    void *priv));
 struct gtrace_component *gtrace_cpu_source(unsigned int cpu);
 
 struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
@@ -239,6 +243,26 @@ void gtrace_unregister_component(struct gtrace_component *comp);
 int gtrace_of_parse_outconns(struct gtrace_platform_data *pdata);
 int gtrace_of_parse_inconns(struct gtrace_platform_data *pdata);
 
+/**
+ * struct gtrace_path - Representation of a trace path from source to sink.
+ * @comp_list: List of trace components in the path.
+ * @mode:      Usage mode for trace components.
+ * @trace_id:  ID of the trace source (typically hart/CPU id).
+ */
+struct gtrace_path {
+	struct list_head		comp_list;
+	enum gtrace_component_mode	mode;
+	u32				trace_id;
+#define GTRACE_INVALID_TRACE_ID	0
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
  * @id_table:      Table to match components handled by the driver.
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
