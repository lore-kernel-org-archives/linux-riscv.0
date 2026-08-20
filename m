Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A828CC5DF8E
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pMjFczlHfCuq0QdWmyaw5StYJFApxXfETrgy42DM7c=; b=rkC1RLDoEnxtnW
	VFaszDvNFiHWfo85XdbOefOLe7poAHsish0cOO8ZY/CM9ZtId3CKp5/5okykhNBEFKAL9+xewUh4u
	dlr+7C9Vy2lYAU04HPWyBspmhYnAsRmHf4HKfJyJ9Q0FVGQNtnO8YKQpYPX4CG7MwUJubgwk2OrWw
	/KuRAu/7rO8Rl/TXzF9Cd5X7Eok1cnxMwsRy6kFcsFgfaNLCpcHadgncFhgugO4sEOp1EUjwTJ9p2
	ij2PaYjQmffYrhVBai4n+ZEpWy4LYBGz72w7Vn/oJIFxd9AmQ8tOQ5H5+zR3+yyzTKpm/9FPKnGb/
	jJYROpgFOqXNtjaQof0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAX4-0000000CEFP-1N8F;
	Thu, 20 Aug 2026 21:42:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWx-0000000CE84-0wSc
	for linux-riscv@bombadil.infradead.org;
	Thu, 20 Aug 2026 21:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dlqDYRauZrdtzbPdixW6g/cCIJHkc6dtQCRANydj4Kk=; b=QLny13q4YAMKF4NGSl6WDTV6SW
	9+puIXsbVNgIhXFMeCkC/nD9/LyRkZlHHi/lN6+dwJANIRr5c8nKGRK0BElWXddlkvI5yW+LGHVE+
	QAG3dglwc0og/YbdwK0me7D0uQQeUFUkCs9n6OLplZ8JmFo5lifNZWnt/Ae8PzGVrXOZITH7v6hyD
	/ZlQKLq9QuSdMu6C8ilGFuJD2D9U640Ck6ZhWHN2eUrMSnkK0rEHG6wvejoFCidrbC9n1qKg3fgCR
	qjEbte6UksJXZcazPc97dJslGslKZWU9lckg5Uv9T/+Ev7Vs3g4K20LlOiXNz8ekhwSe/pSi3u2sL
	72WLbvTA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wxAWp-00000003MWY-2gxL
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK8ATS160309
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dlqDYRauZrd
	tzbPdixW6g/cCIJHkc6dtQCRANydj4Kk=; b=l7GeuEQA/Kqk6NCo0Js4snj8HmN
	Wf8v8aoXsL9TxUq+HEMfG0514vtTZipywQHua35F53Zk/sHh9mzmGsAMqkEuSDpk
	tUJkZQucFtZY8HrZ/FN0r7NR+vIKZq7SYpOrXNe4GHKYwtqMt77VBQbiFmsLct48
	RVLOtiiwjde7RXg+UBZRHG8mdKFaumBGuQ2JrXLIBpgFey7U+IVqVGcrIrKbhFKB
	8DDCqH9QIxlk4rAwnigG8WDZM7Tzpf4bh2Of129sGDJmEwXuDt+UZ/CSN712UU5c
	NlSJeKs4YsR4Ho1cW/K8PjphsIar4LX3yzRbR7TKhJ4rBX2mK69ifxWE/Sg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xuk3882-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e8004d60eso56123285a.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262143; x=1787866943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlqDYRauZrdtzbPdixW6g/cCIJHkc6dtQCRANydj4Kk=;
        b=JBEy5WToF/8DFGFxRDufgAj41xDpffABFtIHuEQ406xr0JGV098PrWb3I9bCRC9YHs
         AO+cmDYxM+RwYOKNkWECS1rrl80DEjlcWQZYwM5PgJVO6d+C0FVHxPcrxPGafmpK0L6v
         WCoMpRp/tDgxhtoHn6RO6IVbBIvLi15X6KInXq6MYD3iYOPqVgPgl5LlMl//6cp8SKUf
         DC0rtfrcWLftoJeIUkQfzXtfW0rbLyoSaKfYRBLPS/aQukMT5dRH9PAhRfYP7isWf/v9
         S9/gDoQ7qHwGiwLTZcw5//qDxl86AYZPLDOS4v2CYmmcH+FWm7hPlnsAhkfRBm35dnjN
         asZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262143; x=1787866943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlqDYRauZrdtzbPdixW6g/cCIJHkc6dtQCRANydj4Kk=;
        b=h3KXa9yLw4IwMlnOZgEdbubd3bWnhBT8eRB/7JKn6484XURMdDJL5yUH3domRBEhNA
         XPZcBC0vwD8oPygYHhZyg4EdD+/P6dznlBNSaR4BF7KmbehZE2kKfK/GknYCu7CFAFBI
         XxTfOjd8aG2uXJZl/V3NWum3xYd6ima6Rf5R1l4LesI7fzGhPas5F/cjTnCYmXp3Wqql
         4Z7ylWLmSPFU5Lo1f7SPMG+pS8mgJDZcUFzizwPmY9SfjgJhPziaSXYsm+xZkSzZ2mtr
         pBMog+BAYVT8AlqNFDXl6d7DSlP7du6sPhByPsN9A5hyU5GL/pfduIAMDK25+Sog2kKX
         eYjQ==
X-Gm-Message-State: AOJu0YzImiakp4bgYac9LKfnTxwtF39JT4bXfjX3skjjXyPGVVjN2ym2
	MaAJX2c87Acy9I5fN3OMmLuFvNcqdsEBNRYrD97Qig0Y1J9bqGS2IJoCW9auiwEnth+5ydMac9l
	9dXz+o+HxNjMRC9RU++BTJ+Gi1YF7yDCbtX685frEI11Te9/zOYukzwtCxWI3jmskBlAfZz08XN
	r/Ukc=
X-Gm-Gg: AR+sD13YYuFmNlDOIJpx1WyuvOYWdgJP1vo+2c5s7ykOjVzvuCDFAbl83dKcbG6ooFy
	C5JMcAC0B8Ei4hmKfRLQN656X70bR6Rq/j8E+3X6PnqvWtoQghbMdAJxYN1FedwJOQJ2PnNeMSM
	MZiodQiQWx45nXDLKoGmKB5HsER3BU1j7hyjSAI6abCc7kYW43VgeNikwsmBjbIBByG3gF9EYkK
	UGN04+FwN7LB876fctDjzBgaOHicFWT8Qx3Ugn5mDIaol9ClSKR9XJMGkR33Sty8958HzhGw8za
	MrDNrKkMISqMaAV+27vcaa4f/TEc7WeGrLVFdjR8OQ0CJOqRkq+q89gUbRVmDWmUf8aMQPKfRx7
	KOYYAcviV
X-Received: by 2002:a05:620a:459e:b0:936:cf5a:6061 with SMTP id af79cd13be357-937395d0e10mr115141585a.45.1787262143233;
        Thu, 20 Aug 2026 14:42:23 -0700 (PDT)
X-Received: by 2002:a05:620a:459e:b0:936:cf5a:6061 with SMTP id af79cd13be357-937395d0e10mr115136885a.45.1787262142839;
        Thu, 20 Aug 2026 14:42:22 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450fb9sm14977035f8f.14.2026.08.20.14.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:21 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 14/21] iommu/riscv: Gate direct identity boundary switches with live MSIs
Date: Thu, 20 Aug 2026 23:41:43 +0200
Message-ID: <20260820214150.545737-15-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 2KWDlMezMoV5fXLNdWUpzFup6JsbucQt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX1oMXHs5pORv9
 C9Cx9GcfqhsfNJTH/BwQf5L9LhfjB96vgpobJKHCUGjB9tYIMKkgWsc/jm5TpVdNrUaRg3PEGKR
 HQQC70KG0b7+hs/7S/eWWWPScQbX3Co=
X-Authority-Analysis: v=2.4 cv=T/O8ifKQ c=1 sm=1 tr=0 ts=6a8774bf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=X3j97Jsqqw8C7WG5k1IA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX257F3YYsg2G7
 31D7LX4noXzRTmrk4I58BxljeBLiPLQICWpxhGgqLRQAWc8972ubs5nNkaofasD/c8DiDs+zEzA
 kmhkyRYf/okV6AYZvLnyY8L6DwFv+tFdtnIFv4q7AAuqdAFuIR0NM0Fc4rdiB/GSypH6HQrWMwp
 DPZPinDCB2Zw/phHthqkKWYTfm5C1W1hxlzf1Qx0yW+VZ+Txzuf9sVxr2YjCTGCO1GxQHab6cyU
 UQluEcjy+TojL0ACkFdw0T8MoryixCACRUD0dy2uXjwhdqOc6zNy5Yx/4VhRHqlk8rV1RG67+DS
 E/JG50ZKhQ3GmOTNL/ZlXE5c9N3Hh2uyE4aNpWC3ZTRLTtdHbR0RyPX3D1CDPVKsPKMF+kXNWIU
 AuhIPvQzlR20hg9Nr3E6pKN/Cv9hgG37zYoYU/xU0AkuNXxamMLHeqbk25DavOgtT9mVnvmeqgZ
 YbceymzrsQkckRZZRNQ==
X-Proofpoint-ORIG-GUID: 2KWDlMezMoV5fXLNdWUpzFup6JsbucQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_224228_276373_554FCB21 
X-CRM114-Status: GOOD (  18.07  )
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

MSI composition may run concurrently with a domain switch and derives
the target address from the attached domain. A stale domain read across
a direct paging-to-identity or identity-to-paging transition can select
the wrong addressing mode, so reject these transitions while IRQs remain
allocated.

Keep the blocking domain available as an immediate fail-stop mode. Since
it does not retain the previous translation mode, transitions through it
cannot be checked reliably and still require callers to quiesce MSI
state. Paging-to-paging replacement remains supported because the new
domain's MSI IOVA table is prepared before attachment.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu-ir.c | 38 ++++++++++++++++++++++++++++++++++
 drivers/iommu/riscv/iommu.c    |  9 ++++++++
 drivers/iommu/riscv/iommu.h    |  6 ++++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/iommu/riscv/iommu-ir.c b/drivers/iommu/riscv/iommu-ir.c
index 5718f90affd6..f61b65f29888 100644
--- a/drivers/iommu/riscv/iommu-ir.c
+++ b/drivers/iommu/riscv/iommu-ir.c
@@ -278,6 +278,44 @@ void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_inf
 	irq_domain_free_fwnode(fn);
 }
 
+int riscv_iommu_ir_check_attach_paging_domain(struct iommu_domain *iommu_domain,
+					      struct device *dev,
+					      struct iommu_domain *old)
+{
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+
+	/*
+	 * IOMMU_DOMAIN_BLOCKED is intentionally not checked. The immediate old
+	 * domain does not reveal whether BLOCKED was entered from identity or
+	 * paging, so rejecting it would also reject valid same-mode restores.
+	 * IDENTITY -> BLOCKED -> PAGING can therefore bypass this check; callers
+	 * must quiesce and tear down MSIs before making such a change.
+	 */
+	if (old && old->type == IOMMU_DOMAIN_IDENTITY && info->nr_irqs)
+		return -EBUSY;
+
+	return 0;
+}
+
+int riscv_iommu_ir_check_attach_identity_domain(struct iommu_domain *iommu_domain,
+						struct device *dev,
+						struct iommu_domain *old)
+{
+	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+
+	/*
+	 * IOMMU_DOMAIN_BLOCKED is intentionally not checked. The immediate old
+	 * domain does not reveal whether BLOCKED was entered from identity or
+	 * paging, so rejecting it would also reject valid same-mode restores.
+	 * PAGING -> BLOCKED -> IDENTITY can therefore bypass this check; callers
+	 * must quiesce and tear down MSIs before making such a change.
+	 */
+	if (old && (old->type & __IOMMU_DOMAIN_PAGING) && info->nr_irqs)
+		return -EBUSY;
+
+	return 0;
+}
+
 int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struct device *dev,
 					struct iommu_domain *old)
 {
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 1a30bac88101..22cccc69bd2c 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1280,6 +1280,10 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	u64 fsc, ta;
 	int ret;
 
+	ret = riscv_iommu_ir_check_attach_paging_domain(iommu_domain, dev, old);
+	if (ret)
+		return ret;
+
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
 
 	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
@@ -1398,6 +1402,11 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 {
 	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
+	int ret;
+
+	ret = riscv_iommu_ir_check_attach_identity_domain(iommu_domain, dev, old);
+	if (ret)
+		return ret;
 
 	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
 	riscv_iommu_bond_unlink(old, dev);
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 24006c1c1722..19e2c0f29301 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -103,6 +103,12 @@ struct irq_domain *riscv_iommu_ir_irq_domain_create(struct device *dev,
 						    struct riscv_iommu_info *info);
 void riscv_iommu_ir_irq_domain_publish(struct device *dev);
 void riscv_iommu_ir_irq_domain_remove(struct device *dev, struct riscv_iommu_info *info);
+int riscv_iommu_ir_check_attach_paging_domain(struct iommu_domain *iommu_domain,
+					      struct device *dev,
+					      struct iommu_domain *old);
+int riscv_iommu_ir_check_attach_identity_domain(struct iommu_domain *iommu_domain,
+						struct device *dev,
+						struct iommu_domain *old);
 int riscv_iommu_ir_attach_paging_domain(struct iommu_domain *iommu_domain, struct device *dev,
 					struct iommu_domain *old);
 void riscv_iommu_ir_free_paging_domain(struct iommu_domain *iommu_domain);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
