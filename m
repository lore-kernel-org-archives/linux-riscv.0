Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB49CA5FA2
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kX5r3fiUUNRB4wS52HFQwU1cpz6Y5mgnI+FgaEcQPBw=; b=iNJPfoK/lG3+b3
	QE9fdn3m9LU3QboSwFFs8TteVBzW2jP2NP36DkZOGnGfKs0I/prZAdETDB9844F6fLIeBUoWwQNe2
	Xy5rI4CbtTw2y60ygW0LXPkRzqVWkfdXOLl/Y3B5kb39CUKGh+2C5AeJdkQQijDe2wQXvkGI4bIVp
	UnPlJmcjH6nciiO0Uyq5mitRwv1xcZOBWwG/VR3K43ufUXajWURgdZXdOFKJHnTyM+QQXTnIyoQeg
	/f2XHGqWwdodtKUgDZQxbccHoy5esoGtykuCUy1JM/z5GUUMeIWtjj2SXL6F6Em25+9lGMwxLa/ZI
	Qaj7L5+1C3Ps6XjBMuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCV2-00000000mzP-1AdF;
	Mon, 28 Sep 2026 14:38:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCV0-00000000myi-3vck
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Sep 2026 14:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cTgrUnplzPTsiEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=; b=NSRjhqQXpnB/zrSa04c7CemMgg
	x1AUSj0Vpm8TN4NH/RdpSKzjXlajkVgfimx2pfyIpRg07c8oTeVFZun6Q8U2ZThUgS2BJJvRWR95x
	IbvSFDCFLNaAAoox+EnagPEKnr40jdxNehu/NIWAt/+0CDodBlbq5/mtb8KBVId2T3AZ16Mn5LAdB
	Dqx3c42B+b1zEBZX+SHPIfnL1uUhruntanO+pB31sT7EqLHi9Hn+6fPhr4hwcGSc1R/ftxBYxcQ4O
	S0ULK0iIAG40l5qERyBFIIaRqcBB91ANTXcsssdLAZ+gNCIqWY4Ld3/iLhkAuNuTFxYdpSr+e7Eg1
	ymxHTC1g==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCUx-00000001ZuC-3Rr0
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:38:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA9Dw1433709
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cTgrUnplzPT
	siEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=; b=c73uNlh2ZtQ7oej8s2yZmevZ3k7
	REywjteFYrK1X5Mt2oFWX74+RMx/ANasUOMEci/WYpFAXC3eDSM5KKAzRlk3ReD7
	NUZtqsG30imxmipV6zJe4iKrMnyIydGyy5CtfKz83zRJXFTE9OM969wZ2NXR5Otv
	NAIQbJtoaIKI6VIJsMCp6Qw8twxVRMN/oM3cmg5y/rJX49tS6VfHXrbIsMlLtvre
	iX79BU25HrE3sHCpqucTiplywvFHg7xkKlgxy/GHBb+IBd7JAdfRd4vtTxc5ZUER
	GbzudQZgtsGlq26wWi4UY2xGnSHc4G2L9c73XXMYhDJooGSRemk8PoT7n/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s20nx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:38:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a01d1d1b6so583923185a.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606309; x=1791211109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cTgrUnplzPTsiEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=;
        b=hW7oigCZBHJVsN96eCwGkr9K8BOd0aNrEYMJePiahbLoIcx7ond+aE+PdpZVwFKBjf
         v5pCF3wXXdheU3SJjwqQc3k6HU3UFsjDGcS19rkbrXiuDwHKl5v+t51NeaPn4WZEEANu
         vj2Cncbs5+y1jC89H2ZOC96CnfAoUvGpx4VexuVOBs4xrhuh2xaqFYBcj7Y8fHrexI9T
         OZs+xBoWCktEESRWTvMo7Ar16AsJML098MYzJe4l3VrevYyHmPcvNAsbX1unmU6cYd6w
         u5ET+Vt8gAvMzRnANYuUFqXgEADKuieWNJ0OY9KthtaNlBEcQLNKFnToFYDAyaqpfdGn
         Sp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606309; x=1791211109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cTgrUnplzPTsiEHPRzeo3nJSaP/Fgn0ZqMMHeAun+wQ=;
        b=vErfcHYkiAbe3XGzEdTlhiA5JoBo4Cn2T56XestH6aKEVBjfcH4R6SLN1Cfds6tPdR
         mN5ilV/iWy8jdzJBZHHqXPrlU3gnOAYTiylztzF34/8uYC4C0BFtQyVAF/npUTqYtRbM
         LIhomBnDwpkIYhkRHhnLYTSdEEHZYuVCJdn0burJlcby9YEqN4LcNWxszOYDSo/F3FEH
         qTixJPiILsOsvzRCjuddyka7L35KYSIADuIxYnXkL0UuggbSgSjYkAjZ+pDjqsxGlbQi
         yDGUpnB5oTCJ4mdq3Dj+qy3b6LuR+L1xuUgnwYUIuLxgpNOqrWW2Ic7EMNP094JUhtlk
         RViQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvihR5jndaVyJoAPGrv0yyH6CLbpImzCwZt7vkxNEuINmwNBb5G/zmn7aNptfin93qJYIKc2mNx1wgwg==@lists.infradead.org
X-Gm-Message-State: AFuF++nxEmmlTqbT+3zpQlD9N+NAZ91ddfsKPud2L66qkfxoT6lI4DKr
	IS9JLdYpdknozBlwNLpbHISueSP/6V204tzkwhCr/4pghuHNkKQyzsIg27kN0GaOPHEI0Gttn5T
	KpT1js4JpjB61vRweJ39rg+xQnhJiKJUqRwNZ37TVYVMKPPd2No77FIhCHMWHr9Lxnd0rRE2/wj
	L8feU=
X-Gm-Gg: AYBFou14igzP24gLW+pRx+k++D/WFC6lLXkLMjTWc/DWMf/atLXIIqq1ZG2Y2q1dORw
	pnG0qNQFvkBPg76lpAuq6CSaJRLF1+gXDyAgDGZxjrYUBa3ICf6tcRXBgTfXKWYESNIZmUdzhXC
	tI7BGErgj2KTiUKyFzAzWK6+j1mYQL8BCGma6qeV3bjSJPHoKSYZtzUfOGzhzoe7m641aEwrNnb
	o4qevdteFUi3uBehLYlOvTxB+89015ffRnzxol/QHWT6IZ3qlh8pdmfynxFANixpO+rGV5k39v6
	vuTS2M6FyYxZtTt9k/GibievGC0y8DSp/wpGCugxqTfYgB0NPw4HM7tm+tTa8yp2o6z8Il7Y1Vb
	KOMiUUTedj5yNd4/7r+EqogU4Ts9nyIYNBGVPpg==
X-Received: by 2002:a05:620a:d96:b0:93c:3250:84f with SMTP id af79cd13be357-93c43d151b0mr2112627685a.45.1790606299762;
        Mon, 28 Sep 2026 07:38:19 -0700 (PDT)
X-Received: by 2002:a05:6102:2b89:b0:7b7:6dec:6eb0 with SMTP id ada2fe7eead31-7b76decd903mr718307137.15.1790605931408;
        Mon, 28 Sep 2026 07:32:11 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbed87650sm291164166b.50.2026.09.28.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 08/14] irqchip/riscv-imsic: Define IOMMU IRQ bypass protocol
Date: Mon, 28 Sep 2026 16:31:07 +0200
Message-ID: <20260928143113.49838-9-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX0xs92xiaFd1m
 TTeNtg4+yljXRvatJO5kORRvM518dWx84zSfLTQhYvPmqYJGVL26LdLtrdF87KD9WFm15RZv46A
 QHGBS8bMu9kgMhXnytPkjSLVerFByKgi8OSfxj17bxQGCT92tqn+Uor86J8OATVmCpRE2OjPIOm
 c2gq9b+6JBDZQ2h2WliqszVSCEvVU26y17DKpCQF5cuBrjlBU+fU+Mzxfv6lwIQ6ILOEQ9sz88h
 nxZ2qEja/Pkg2BJAxl++sS1sr//39bi//6hCgonL/mNn0LTO3AbfA0sLpifn38z+imP47+yFKmI
 MXVVXjFr4/1WzH7x/0P6Y3twnPTQnRYzIw4HXVaXYhOoKEKPKG73GSQiTwPWFCJKFgyqtn216da
 GtbDFHl+QYptoPXT9j2QNnTLeSHd019vYHdPGgCuzkBBRI3zZfuDp/dSh8xgZqU0mXD63nhHHR5
 SHf6rmmy2LR9CAuyTnw==
X-Proofpoint-ORIG-GUID: k8z8BtQCZ4en4GlNwk36a9RF5jkZxN5B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX5G4KdSl7CizI
 YeLHziNv7A/cz3pXl1+tWbKzccpFqk8NNZd4WccdVXPQ+KufMaHS3cnLXLGIXrvhWXXhhwazR9/
 xUzKwb2A/hWCsKbnfzP0ZYGnHf/BAAA=
X-Proofpoint-GUID: k8z8BtQCZ4en4GlNwk36a9RF5jkZxN5B
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba7be5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=4AuT_VmNVbg3FCPyVe8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153832_293706_1A5E3679 
X-CRM114-Status: GOOD (  16.07  )
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

Define the RISC-V IOMMU payload for irq_set_vcpu_affinity(), including
domain-wide target setup and individual target updates for IMSIC and
MRIF targets.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 include/linux/irqchip/riscv-imsic.h | 52 +++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 662cb0442424..d024a6524baa 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -104,4 +104,56 @@ struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev);
 static inline struct fwnode_handle *imsic_acpi_get_fwnode(struct device *dev) { return NULL; }
 #endif
 
+enum riscv_iommu_ir_cmd {
+	RISCV_IOMMU_IR_INVALID_CMD,
+	RISCV_IOMMU_IR_FORWARD,
+	RISCV_IOMMU_IR_UPDATE_TARGET,
+};
+
+enum riscv_iommu_ir_target_type {
+	RISCV_IOMMU_IR_TARGET_INVALID,
+	RISCV_IOMMU_IR_TARGET_IMSIC,
+	RISCV_IOMMU_IR_TARGET_MRIF,
+};
+
+struct riscv_iommu_ir_target {
+	u64 gpa;
+	enum riscv_iommu_ir_target_type type;
+	union {
+		u64 hpa;
+		struct {
+			u64 mrif_hpa;
+			u64 notice_hpa;
+			u32 notice_id;
+		};
+	};
+};
+
+/*
+ * FORWARD enables forwarding for one IRQ and provides the complete target array
+ * so the first forwarded IRQ can initialize the domain MSI table. UPDATE_TARGET
+ * replaces one target without changing per-IRQ forwarding state. The caller
+ * must quiesce all MSI producers using the table when changing both words of a
+ * live MRIF PTE because the update temporarily invalidates the entry. A NULL
+ * vcpu_info disables forwarding for the IRQ.
+ *
+ * A well-formed request which is incompatible with the producer or current
+ * domain configuration returns -EOPNOTSUPP, allowing the caller to fall back
+ * to host delivery. Invalid payloads return -EINVAL and operational errors are
+ * propagated.
+ */
+struct riscv_iommu_ir_vcpu_info {
+	enum riscv_iommu_ir_cmd cmd;
+	const void *owner;
+	u64 msi_addr_mask;
+	u64 msi_addr_pattern;
+	union {
+		struct {
+			const struct riscv_iommu_ir_target *targets;
+			unsigned int nr_targets;
+		};
+		struct riscv_iommu_ir_target target;
+	};
+};
+
 #endif
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
