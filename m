Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA786CA5FA5
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zr8SLsudnE6WBdH7ldd0yC2f/yfUsw6Fe0C4TaYeoM=; b=VgNLIvK9ilyAGt
	Eh/dfvuuMpy7mWHhJe1DRIBlSy+6EU+aWnJfA5TVfr4KLQHo/k09X66irL9b8E+EOtP62buG1kx2u
	0GQPvnzOShLvj2OxzfE5w5h041EKuXrafEpQm8Y+yWvTtgr6PZbRVImnMtHj3Ud2hwXE0F9b7UUDK
	/Vf6rsuAvr6CUonUkSxw8+LD/LO+q3yiOM96iqL3JKDOWsYN8E44P+6mIplKlyL0CLlg3D1M8y3hD
	k1ewwwmSu4dTXUGwD5ESsaOF80zvlV83So/+rVRGqxUOW31grlPXVjucjhRT6OReejI7QX4EdFW15
	d5GAq7ZWtxMl7mdS9p2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Hn-00000007nxB-0MGQ;
	Thu, 01 Oct 2026 05:24:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Hk-00000007nux-2q6T
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Oct 2026 05:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AsfNws2Wxi6oDbK2RrL2JLATMl8Lm+Wmiu7rIwOVrBI=; b=Dx8nFx/jCTKkTyU+5Ki3k7sAeN
	l8tNGoCzte51dDTl2uxmwTUCfZfH0YiONwcMpzGwHtK2G5HWz87VPNmHa+d4TgF857pSfoodB4bKV
	Heba70fT2yOo+gw6KHCU0DaXFwOnv52bQH8UBEx4fg5wu8F9/JQEkzuxxSbVNRahwMQtxEDA1iQdu
	rbarRG7kUSKJCSuRWdpObjHU1aw0UxfyYoi4mtVScoGLff9Co63oqzDr9an5pnxj7AFJcJCzDl+Ok
	oRHJk+PdJrFERTHl+BKaEM+ftNtBMc6fsOTmKwx1+MLCabYdNV7nvGzh75DOFooALwwuleOGMNUZc
	WOQFq9Qg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC9HN-00000004amO-2MIp
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:24:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913ghAe1089593
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AsfNws2Wxi6
	oDbK2RrL2JLATMl8Lm+Wmiu7rIwOVrBI=; b=mAgcg8btd9GAMeC33eHJTLWPvT7
	8ScBZdWEZqje0FxgWLuvKL5XYJkrWL4TUNgMxU7mcP9FjsD8WL6CgOAFFQE7Ihio
	rb5h/QJ0eivFmYph935XH3qYd5UlwCVabC1K9m19ANzqYZilXkIkYW3j65rut5hC
	ioedY3qiX/TqWNd+BK2aanlLZ1h347KCpFfwP+7Q6E4Gmp0iPPJM+rI5zuHwc1DH
	0/3yxuD2hxv6LOfoDZO09jKHrJgL+4s7YS/hJpdFxQe1RZyVP4Ek7dty66HzsLN0
	YqSJoTmA/dyoM0esjK42YGg7e7KMQkNr9KSEJ/LzXjIREMetlEkVWp5bCxQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188ssw8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:24:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so94004025ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832261; x=1791437061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AsfNws2Wxi6oDbK2RrL2JLATMl8Lm+Wmiu7rIwOVrBI=;
        b=YSCCzyCU6rOIBGuvigGfE6xv1y8S05yUUjcwUhtNEHkcJsiq7UbN+x1Q2b0YMBKl3R
         qhDQec/TvWu+TQvs/SwMO6A7GXLwohz46hYw0CFYnr58j+wxDw2IKyztDEvyffhaIPLy
         rf88dpEKSn7xc8LAxLNyKKPV5aZ431gSJpBD+PHRrz2ogRVwlaYuouLw6rlA1C1BMomV
         Nh8ufwne8Jl5Vmcm1SpFME6POdZrs/lRaUPI7YdVT1pg11Pwg6IKdy8WaVJLQbfhDn+3
         gM/lhR0rPuMhwmxnTB913W2pCsg6c2UDhJIN7dGzf7nfsIzjBLgCafonllzj9Kc5SKcO
         GX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832261; x=1791437061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AsfNws2Wxi6oDbK2RrL2JLATMl8Lm+Wmiu7rIwOVrBI=;
        b=Mm92pTe+1lmQLvChwchC4uQVH5rKWG7sY5uR++M18HJzFMQdxTZGjnIdp3yxVECAnw
         OMgFFKKXbO5g897zIZff33/5xRwtyB0WhfjblfKw5BeKQVT6jn/SusLsUuF4+k2Hk9+m
         Q9u78SDokip6rDSKM0s2nGbLlrNCMVMrszWEhhOHEB5jTDHXquBi86SP2nPIYzx8lBZC
         3EaTZe03o24MhRWY5zfx/J3qYSJvjHXiX+swo6iJOrfLPeeUegnz3Wtw6eqnegdHE1ny
         6iUVZF4ac6G4TPu81BYqNGpjV2FaqxH9Jbir2ehzo8gI23GYI9d+d8+grc3RiWM1bysj
         w9fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkq+SSKha7nhJOQSTC4Ccs9si1fr4BydAt+2q4cfzCONTpKpSsn6vJoohuhq8lhSVbJduus2VvySKOww==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ8JCLE7S4PdYaeNjDufDTn6xPXdy3pFKTD32oQ8KiT0XfFawmw
	xCQ4dD5DtI95N2bUyo5dm2gLStmZPcuqU+d6xba3rxwp4z9vxfF7M2quLQI9RTaul3Xmkx84Nnh
	0sd95s29tn/srqvy4QA8Z4/RyQha3t9hCge3/QU5BEwDDqo/Qg5b0PqTWnOwOguKXnMWUbPo=
X-Gm-Gg: AYBFou0NbpWJE67I4ndfs6U+/djFqTD9DBipj7cBLX52gokKQwRuwGiaWxPCJsLt0WU
	+0v57ErAub26wPYqlwiRVvIs5qWC0AOSWSs32GIWZAYZIoZSb9k9upLKs00++321TtjCcBKyvkO
	I283HsDs9eOu2+prJlyUp7Wh6FolL2CllCElIk8gcG2vW1ysY3TWcFhf/VZWBgFAPmDC80j2szM
	kx7duUTqsdphTaJ5xcREblm1oLeGizeK76+QBH7CCtVk1wXXoy0v7pxu859/q9UkBSbf+I3xuKy
	ikgw6P7WwYCPj+IqJacrwJcyOJBsJujLSzDejE+/URQISdw/V7e/XcGCQ3F86b9si05R5ljfZ/p
	G39tPLApxJy5fa4EDBkOAMMqOlzCXzuCIyYfCL/ubq/8sCX7/Z8HGKvtUmEqF/BYuxLjj0r8D/n
	gLPMYv6LVE6p/SWjWmo+IpC/Vr
X-Received: by 2002:a17:903:234a:b0:2dd:c132:dc01 with SMTP id d9443c01a7336-2e2e49fe5c6mr25551705ad.46.1790832260437;
        Wed, 30 Sep 2026 22:24:20 -0700 (PDT)
X-Received: by 2002:a17:903:234a:b0:2dd:c132:dc01 with SMTP id d9443c01a7336-2e2e49fe5c6mr25551455ad.46.1790832259877;
        Wed, 30 Sep 2026 22:24:19 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:19 -0700 (PDT)
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
Subject: [PATCH v6 07/14] gtrace: Add function to copy into perf AUX buffer
Date: Thu,  1 Oct 2026 10:52:18 +0530
Message-ID: <20261001052243.3042627-8-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXyvoLLHM6Y5SE
 M/pxSbPVzpeMsmbR8qAHEneb8+1EglqYMAsoUkYmy2MKaZiSN5JIM5oAKko+sc+trMcj5XN/fK7
 ZeY98MNT3E1OIrleCK2OuJI/53kdEtk=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdee85 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=TflMzYLVq8MTiglY7lUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: DeYvB2fw-cDCX1V6_kookD8T-T1N6lHL
X-Proofpoint-GUID: DeYvB2fw-cDCX1V6_kookD8T-T1N6lHL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX522JwyekLU+3
 IFpBjXDoT3fyfMo2AIVq+af7vombu0OyHoQruDN9VJj1JoHlCElZMapVMoe+G8OfkRbHsH/Fafo
 O5dJ+FRxIcNPD6kKv5TrC4Qv95vjfH1yS4iiatZ1Ye3sG3r70E2qF7oDWFcw7IJPaCcNbCTQR3S
 shLvD/pyqx9SiGVeKMQXgmyu6ZVbKcdZN489IIe15c1bq9fIASTP0TJhQpYDE8SbgWOmHgIQtON
 VYhXZ9JWQJlBQFSNRhsSPERYYIcZOfAkylPeD66RVPVUnh6MmXoJV7XQUizKDhPh0zE7GZqgbRF
 NNZSUm5IiBWehn3p4ajHa/uXbu24nFd/P7aJJSah0eQRAK0ygLXkDbhcHYY1Yq9aRexabx7/QUN
 kfEdTsMAYyonSxuj3W39uSFCEVlKqKmoPQiKlWod4vwHIIfyCPgMdcBSz4Ql5ETz1MuzKH8BzRk
 yMAejhf7C1cUcIjSozw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_062435_642336_52D7CC4A 
X-CRM114-Status: GOOD (  22.03  )
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

The RISC-V trace ramsink will need a mechanism to copy trace data
into the perf AUX buffer. Add gtrace_path_copyto_auxbuf() function
and corresponding trace driver callback copyto_auxbuf() for this
purpose.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 41 ++++++++++++++++++++++++++
 include/linux/gtrace.h                 | 24 +++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index d7f1df90aa31..acbeb3df2135 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -715,6 +715,47 @@ int gtrace_path_stop(struct gtrace_path *path)
 }
 EXPORT_SYMBOL_GPL(gtrace_path_stop);
 
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *bytes_copied, u64 *format)
+{
+	struct gtrace_comp_priv *sink = to_gtrace_comp_priv(gtrace_path_sink(path));
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+	int ret = -EOPNOTSUPP;
+	unsigned long flags;
+
+	/*
+	 * Copy only after every path using the sink has stopped; otherwise the
+	 * hardware may overwrite data being copied, or the same data may be copied
+	 * to aux buffer twice. The last path to stop does the copy. Holding the
+	 * sink's lock also stops another path from starting the sink before copy
+	 * completes.
+	 */
+	raw_spin_lock_irqsave(&sink->lock, flags);
+	if (sink->start_count) {
+		*bytes_copied = 0;
+		ret = 0;
+		goto out;
+	}
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv || !gtdrv->copyto_auxbuf)
+			continue;
+
+		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
+		ret = 0;
+		break;
+	}
+out:
+	raw_spin_unlock_irqrestore(&sink->lock, flags);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index a4b99c87d250..ed0e751faa91 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -266,9 +266,30 @@ void gtrace_destroy_path(struct gtrace_path *path);
 int gtrace_path_start(struct gtrace_path *path);
 int gtrace_path_stop(struct gtrace_path *path);
 
+/**
+ * struct gtrace_perf_auxbuf - Representation of the perf AUX buffer.
+ * @length:   Size of the AUX buffer.
+ * @nr_pages: Number of pages of the AUX buffer.
+ * @base:     Start address of AUX buffer.
+ * @pos:      Position in the AUX buffer to commit traced data.
+ */
+struct gtrace_perf_auxbuf {
+	size_t length;
+	int nr_pages;
+	void *base;
+	long pos;
+};
+
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *bytes_copied, u64 *format);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
+ *                 reports the PMU specific trace format of the copied data
+ *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
  * @start:         Callback to start tracing.
  * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
@@ -279,6 +300,9 @@ int gtrace_path_stop(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
+						 struct gtrace_perf_auxbuf *buf,
+						 u64 *format);
 	int			(*start)(struct gtrace_component *comp);
 	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
