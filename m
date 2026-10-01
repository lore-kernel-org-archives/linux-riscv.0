Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED921CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T0viwwPZqFhn4zhJSHZjJ4Qr3+U5k4VPLUgJfBVP89g=; b=qvG3f/gGUi9XjU
	Gckg3W2T8O89zA8u63S4sEWT/WKKKWsmbg7efZ+z5J92DORKSdJvUCiNg1i9T1mui1ZS0LZCLAsTD
	EhOHKdzmgB17S5JzwVX8rzIr2H52WIK5rc22BGYhEAwgEfDhJ6tPKbT5eRPCI4XuC8wcZaw4cmKhg
	9d6tyXnyFkL2OOevA4OYnUuCfRISXVKbj4ywxDUYHpDsijFjCfCzzR6eb23PwZg1p8sVLgYEBPJ0J
	2UsU1CnThsrPUPbb1tVfyatk83Jka/7+LnC/jvUvRYUuB4jUtw1grMP7gtrUCrcgmSX/Ov/gl/Wrz
	O7AzL3b9kk69l65wUvPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9H7-00000007naI-0xvN;
	Thu, 01 Oct 2026 05:24:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9H4-00000007nYi-1dxG
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:24:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gXw91240206
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hdmJBOURZFk
	lDL2G+CgifetZhhumtO7AZp3GzGIPueQ=; b=pzKcGLkoAGuQyphMlTQGjDL5nHr
	RUGVSK6PwFnL6jcgXJvVsOhumo6LKovj/FJEiwMafqQVd6NaxgJ2Ux3FiYWYL6l0
	0xjszU2WBrX0xs2CzpRtdIIrIw8Ca4zkF5kPuipwyLZpfOvF4RM3u2QSkG3h+4xk
	ctfVyXKIFmQI2n4iaMFaU0CT4DYUN7dbPLmtZ/hjLsKbovmRZogqzGeQwt9Nlzke
	ZJptSenFJBxmbZQMtu+oaiNM7zp10QNaqQrpIxKnrHeRFwlRfW2iImiy+UsToqHY
	XnS7Ebnr2OQvKoWT7kLy25FN2FSl7HB71ZKAsFJPdzsxrlsvGw2G+/kQ6tA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pjm97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:24:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2e0bc619fso14531175ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832244; x=1791437044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdmJBOURZFklDL2G+CgifetZhhumtO7AZp3GzGIPueQ=;
        b=HSgsrqq78QrOoiwQEOOyCFBdQBAfRPkgtAq5whk0rRQETFfvl/ioBFAQIs3YDIU25S
         6Gj5B0aoVpPxdHmIT35Drn3X+EkD0bJ3pVSHWNv4HcpegQsB1Oz7qBpEpaa3GYUbOCds
         zAfnkWtZsdyoVCHg1cd0uA2jJkbpBiS/KKx1mIo8NIDSJSE4LofKAjEW/UvWywJ+c2mo
         Onq46YY0gP5FKb3tpqZIvSJPp/O5sUnR27Y2exmc6wI9z/m2TOTNZkTFjBwH5EabcdVB
         ImQ7aX94wkp7DHMOwJkU9oW6QwBXL5MXMvuuDoXi10JX1voekvwKgI95nD7xy+vFc7tJ
         8+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832244; x=1791437044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdmJBOURZFklDL2G+CgifetZhhumtO7AZp3GzGIPueQ=;
        b=ebv/tgprT85wGBZm/5LwT6E+ULB0MJRaWVBqRP6Ix/r1vway4iJYrg07keST2JV6v/
         rpwJgolfW3UUB1DjEWN8B8n+1N4Vhog4vt8lt/Z6CRBdMdkN3b+3DCUFSiFVTb0FYcGs
         /Vzue6Ampsa3u6JL7XCb7xYOFZbKSnjdEaz2mfDhlpbrjTUPt3IBuUcHS0sTW7C8+IWZ
         ZnmRRixXIaCI5zf+CamSMk+Eh9437vPEPWGtzjdVa+fNj3H8dtdrwmeA/QTQEXUx22+7
         QLV+Yun9/WjUQjq518BuVi3orn7kD8c4FWWK8nq3J1KODV+0zJvZ8hx9rCdaDhUeNS5j
         fzuQ==
X-Forwarded-Encrypted: i=1; AKwUvByC3GUwg9uaJVdLEImaAJp/RGh6yMA+v0YqTtEuYhAA1i+wD3cye9cub7y9u/10hKbz8QnOxmbs3AFYGA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKUaKhHV4zFyvH8ZBEICBBgfTwTsAql9VrtQAIyMpFYyv6ZK/19
	gWjD5Uml4FzWJGlWnzdPp+rptdBmykvrWIexJ7nU0Smx5RrvQLZEZF3iAbUDmjTMyDkOu6+uX9c
	omzd0tQtQKs5mE/s0rcss3+y7AVN53kW40d2pHooGeGIffCo/abIBOVuaifJttYacmtq3WWA=
X-Gm-Gg: AYBFou1rm/aCaupZlzJljzg9ZWMDxvza0Aa4mchBezwcTRAuMY2evrXRYA9dSbAvE5H
	ZpUu6TViIsd85kBQf5E6uGEfDLkiwl/XkQUjvQyhbjEfBfWMqRjW/Trepk+aZgzQp7Q05uN5L8U
	JgiocbsVr+aKULp42mTa2orw0pCzpUQ/Wt3S2jG7mBoTArG5QiMqxkvpVxX/2mLj2gZPBh5tADe
	/iPBHpQce2cNOrOHJaV6b3e0xeTCrY5d4BtIvb6pCBT384TAMlR3ZdeIkM/MBi7WJnMciWsa2dz
	yxhhyMUYAyu9IQYhXrjuD8XLFT2dwRq7SiOIp93wKKpvv+s41dZ6aIJJri0A9gZV++IW09sQibI
	jDK2ap7QCWpsujRbVqqgdzeTFdCEZKxnO2n5Hj5s1C8e7JwLwgcZb3fRL081h/RFzfws2m62EjN
	SLaFAkzbHxvZIdMjddr4nssAyP
X-Received: by 2002:a17:902:d489:b0:2e2:c2a6:48bf with SMTP id d9443c01a7336-2e2e4b33993mr27533875ad.26.1790832244402;
        Wed, 30 Sep 2026 22:24:04 -0700 (PDT)
X-Received: by 2002:a17:902:d489:b0:2e2:c2a6:48bf with SMTP id d9443c01a7336-2e2e4b33993mr27533625ad.26.1790832243901;
        Wed, 30 Sep 2026 22:24:03 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:03 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 05/14] gtrace: Add functions to start/stop tracing on a component path
Date: Thu,  1 Oct 2026 10:52:16 +0530
Message-ID: <20261001052243.3042627-6-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: zF-Y2x_FWGfN4yaLmiHqRtVEQFSKOmJN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXybD2p5yi+XGX
 b81kH5b1HxACYhsnKzViL9M/SBvBMoFSUwlE0rCJhgkk+oa891Wklby7D7TSK+gVViZA7YJyuHd
 feaopw9QSx65K7gjZmTbpah0bwsjAQI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXwQRIHgp74sEG
 GzhN7weQTQSeJ64nVP1Kxm3H0jBgkh+4pLXbo7RGW1Tct99Zwo86FEJ0IygFzexyk7bX2i+N/N9
 wyhFXSqvJ3JTVCP723uahGWJ/1cXbVJoN911lLYIOl/jIcTJ4BpMb3cA0zb3DHvRnPJ0wHVIYFQ
 j5Pocjoyyv4bZcZaSMjYz0GUR80wLlhbUVYbXyRB8sOWhNHPiuC6gYkGuukbRGzqmaAH6Jc5KRG
 jc2az5vjR1RuuLizyyEgphtX1gdxiRsrFiG5PICvESPt0vm9JOFAHwQFmWboBhkAYy8fjIQYP6g
 JE7noCBmqyA+ISkB3RnUV1IE5wbZ917dmw6aqZNEzJJ/SpT+htD8L55RGHBuqF59IEeE3hlTMG9
 +eEF2EYw7UKMcv6bYs/4jv0cYvn1QTXRElWf6I/hitmuwJ9ypO7DW2epN9ONDFo5F53bVr3Un/C
 f0FqsF/egwusrKtw4lA==
X-Proofpoint-GUID: zF-Y2x_FWGfN4yaLmiHqRtVEQFSKOmJN
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abdee75 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Be7mbbALSbNoa8F8jQ8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_222406_551086_E6289531 
X-CRM114-Status: GOOD (  23.57  )
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

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add gtrace_path_start()
and gtrace_path_stop() functions for this purpose.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 104 +++++++++++++++++++++++++
 include/linux/gtrace.h                 |   7 ++
 2 files changed, 111 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index f750025104ec..d7f1df90aa31 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/percpu.h>
+#include <linux/spinlock.h>
 #include <linux/xarray.h>
 #include <linux/gtrace.h>
 
@@ -24,7 +25,15 @@ static DEFINE_PER_CPU(struct gtrace_component *, gtrace_cpu_source_comp);
 /* gtrace comp specific data, to be used by core functions only */
 struct gtrace_comp_priv {
 	struct gtrace_component comp;
+	/*
+	 * Protects start_count and owner. Serializes start/stop against other paths
+	 * sharing this component and, for a sink, against gtrace_path_copyto_auxbuf().
+	 * Raw because the PMU start/stop callbacks are called with the rq_lock held.
+	 */
+	raw_spinlock_t lock;
 	u32 type_idx;
+	u32 start_count;
+	pid_t owner;
 	bool ready;
 	bool visited;
 };
@@ -418,6 +427,7 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 		ret = -ENOMEM;
 		goto err_out;
 	}
+	raw_spin_lock_init(&cpriv->lock);
 	comp = &cpriv->comp;
 	comp->pdata = pdata;
 	comp->id = *id;
@@ -611,6 +621,100 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 	}
 }
 
+static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
+	unsigned long flags;
+	int ret = 0;
+
+	if (!gtdrv)
+		return -ENODEV;
+
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
+	if (cpriv->start_count) {
+		if (cpriv->owner != owner) {
+			ret = -EBUSY;
+			goto out;
+		}
+	} else {
+		if (gtdrv->start) {
+			ret = gtdrv->start(comp);
+			if (ret)
+				goto out;
+		}
+		cpriv->owner = owner;
+	}
+
+	cpriv->start_count++;
+out:
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	return ret;
+}
+
+static int __gtrace_comp_stop(struct gtrace_component *comp)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv = to_gtrace_driver(comp->dev.driver);
+	unsigned long flags;
+	int ret = 0;
+
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
+	if (!cpriv->start_count) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	cpriv->start_count--;
+	if (!cpriv->start_count) {
+		if (!gtdrv) {
+			ret = -ENODEV;
+			goto out;
+		}
+
+		if (gtdrv->stop)
+			ret = gtdrv->stop(comp);
+	}
+out:
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	return ret;
+}
+
+int gtrace_path_start(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+	int ret = 0;
+
+	list_for_each_entry_reverse(node, &path->comp_list, head) {
+		ret = __gtrace_comp_start(node->comp, path->owner);
+		if (ret)
+			break;
+	}
+
+	/* If a component failed to start, stop all the components that were started before it */
+	if (ret)
+		list_for_each_entry_continue(node, &path->comp_list, head)
+			__gtrace_comp_stop(node->comp);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_start);
+
+int gtrace_path_stop(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+	int ret = 0, err;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		err = __gtrace_comp_stop(node->comp);
+		if (err && !ret)
+			ret = err;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_stop);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 2c3be4d161c6..a4b99c87d250 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -254,6 +254,7 @@ struct gtrace_path {
 	enum gtrace_component_mode	mode;
 	u32				trace_id;
 #define GTRACE_INVALID_TRACE_ID	0
+	pid_t				owner;
 };
 
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
@@ -262,10 +263,14 @@ struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode);
 void gtrace_destroy_path(struct gtrace_path *path);
+int gtrace_path_start(struct gtrace_path *path);
+int gtrace_path_stop(struct gtrace_path *path);
 
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @start:         Callback to start tracing.
+ * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
  * @get_trace_id:  Get/allocate a trace ID.
@@ -274,6 +279,8 @@ void gtrace_destroy_path(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	int			(*start)(struct gtrace_component *comp);
+	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
 	void			(*remove)(struct gtrace_component *comp);
 	int			(*get_trace_id)(struct gtrace_component *comp,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
