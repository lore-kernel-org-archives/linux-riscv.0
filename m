Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BB5C624D1
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIoEmms6i4rWY20h/GyXaWhASmgFZlJzo7rterGoDI4=; b=pYexqvrSLwtGAT
	qXDG2X/XE7u77op/vVL1onOfzKGD8x/E8r79dzlstGlNIqdhm5lPEJPVdmo37RtEQLXQA4xcR7lul
	CG5JSr0Twwo/M5a5glLyC2nWUvDGS+iBtYBB6HwrHVLNuaj2qA9qqhz2dPV5YM8f6E0IIT2i3FYD5
	BQfQnI58Fjc8uxhYl2p550K9jeJFpjhAIES/+8rj/td/v4MutAWrrRZh2hVcTHwvxre6ubXCa/qeD
	ARneT72f2eHP/l+Q6XOrsuNLhRMqoA2BbsXbc09zME2/nYwL0d4IWR0FfXymEFlSRekVxQTG8vpnR
	FwTiYA+90lAnvMnDK4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Uh-00000009ku0-0gMa;
	Mon, 31 Aug 2026 15:00:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UU-00000009kaz-0JPu
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 15:00:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VEUOke4052174
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o07feOcyhDQ
	/W09lIWlOcU9Y+oBFCGekfKPNEriMHlQ=; b=f2PLfl0ThuPJJ5IvyzAL32bL6+z
	ebwjCRLavaKdEY2BXjjKdm3BXXokMuh7ta3Ptmm4WuWmPbdkRWTDW/uyZb3QHt9V
	/9XHRkWxEMHdlETT0rtr85PYI139lGX7dvrTN6A3w4w7LmOa5V+Yksc9MEuZid4X
	ZKOXsLulYjb+LP/XLj/aDzIS4AvZzHlblx6RrekjFZUZAnr+YoMsWmCO+N9/8Nh7
	Ppuq5UqGlMdCF+ly7bNUuXn0lcKnThL5/POhEv02xPTUepOTJJ9AnxlFJcEFQ2sY
	Mry1LnLc12RQ8K7sXbufCxX6w9zAIjOHSd/RR+lC7Svdt9V8cDfJjzrmOcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6jghfy7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so552604385a.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188404; x=1788793204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o07feOcyhDQ/W09lIWlOcU9Y+oBFCGekfKPNEriMHlQ=;
        b=jJIaXgSwKnJmCNHlpZyIisYL4cp1nk15vwmbu3pPyYtSsBx7h2l/a/bfl6XitoDdiB
         MWlZ4iE7oTDim6c7Tk3MX9XDVUzP7VTlLRueifyygIZjNqR6n+RH9+ABHfso4gZoB9H8
         rka3uTtDpJ98laibTiV91MTQX3xzH3RsaQTamJ8mpDe+cHuakGuZVsmul66Z/jfAZooG
         mjzsHZXnmtqhMqYQIKIWjGJH/JmjR3OLDi8YnUNRqJOFewOAYzIZsW4GEYQ7e4mJxyL0
         HvD+dz+5N0xQho4w6tQkiv4gKH6TdyDnCZbrB+tjnTu1ji9ZI3AvWIBH64BPrvgGR6Q3
         3RqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188404; x=1788793204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o07feOcyhDQ/W09lIWlOcU9Y+oBFCGekfKPNEriMHlQ=;
        b=ML9d3EslfSkcWbPRbjYw1uUTBEdqYpgw66mnbJoZq1yEhDDjEBx0IxImT/aGe17cr7
         d34+eHmIul7a0YIh0f9BZ1c+4nx8wQjUQY9VZE8pdHViHlbtjorb7JugUfIWgeRayPQM
         HrFLBTy4mQE2otW6zuGpwns61TxGvFUnO8vq56TPd9pKqWyG/vhBdcnV2clRtvx9TtlV
         sxzYTwQD+231MtS231WCylYJaRJ1zWteN+nkBGCoekQn3AkVeFfyyxiAZb9dXDX0P48L
         wmxnZfT2iacV9tH4++6ZTvjOEzrsB1iiEg4gZTYQCgrksYj2tHEGhyE8UZ1gYV36m9FL
         rRgA==
X-Gm-Message-State: AFuF++lRBJ5phSknFYbmVFg0X7kq5K8WSMJnt0jboBrn1cXBl7vvg5wj
	3ESxIEW49M8yDUM/lu/E9ADOGqvXJPPDQUYIzE9JSkaXA998vAStEelhZrDU/nzNP1ffllqj1oz
	P0mT0VVGHEnwstMC80MYjT9cqeljt89ytjdCQ6fiJP1bJMDn2VCGgUUqQm49GJ80UdCxVpYHZZB
	ihzN8=
X-Gm-Gg: AR+sD107/Ny51iFzVYenavgY+4ZbRf/SDtQmgfr9QPS2J7K8m4+6ewBxT9Bry69xYt/
	fmQCRRGGAocBkYP2T7+jpWOtt+rnua4pbDVduIFeM0zSVK6gjeg0rIWWMwzaLgwKvgQ7Nt0aaq0
	UjLdYVFX61qkZQpYpF4v+j8YOsCSASzxlaPqjKD8Tthk+4Ry05uKtG1h6D1Qx+SPj5cGbYZSB8z
	HD4wMWXJ8hHLBwXCP41bGHn5sRCXM0ZDFVp5cKVZAKjULzhO4bmYi6R9yW4GERvUN8/sXhyGpaQ
	1y98jh4UdfsCtk56BUybnGxQMU7206HDPLaGmgCP3uQYvSk9dvCsKQodDNV1RBcZJ4MN8kPRSAD
	ma4P4gQQqzvr5oPB5FX7Ur+TVO7ZMcHHphq4=
X-Received: by 2002:a05:620a:2807:b0:939:4209:d5ff with SMTP id af79cd13be357-939480f8988mr221159985a.33.1788188403877;
        Mon, 31 Aug 2026 08:00:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2807:b0:939:4209:d5ff with SMTP id af79cd13be357-939480f8988mr221146685a.33.1788188403218;
        Mon, 31 Aug 2026 08:00:03 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b90f78244sm333359565e9.10.2026.08.31.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:00:02 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 11/17] irqchip/riscv-imsic: Add S-mode MSI address list
Date: Mon, 31 Aug 2026 16:59:37 +0200
Message-ID: <20260831145943.313726-12-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: g4kVbSahW4c6yOrK26o02zqCRGjc4tFv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXxNFGAWcw6O65
 kd4bMhrStJokc2sdUV72AJxUQIYS1gpFG7QVVPYOMRl10UHqnCXhC5CEHRLqkgrdabIBhGdsrW4
 WNFHHxLFJ5idZehhWdXomBwS7fXDYXU=
X-Proofpoint-ORIG-GUID: g4kVbSahW4c6yOrK26o02zqCRGjc4tFv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXx9VJ+hvvtKYo
 J2JB4xDRIFtskkGzoEmugGH+UuHfzWsvkcs89kxa7fPD2SVm9r7xHjiGjIy2R1eor8xcGmbzR+0
 8YF1ZzEXk5wLY0uAdpHBPK0gtNy451gkuYkkZ7pxdoNPtNctA2o6hGxgdwfohrvBcWXMnQN55GY
 8CZRu1/Rr0gfCPi1zvIPBg2L1m7JsEVSoaPZSv7VCe4Mm6qSmzWhkDA987Bh4thnQRQyewqMKa0
 teYj4JmKE9amzx2Lu6gy+RJviXMXmQJogZCi5u8AKGPkdQkbjKs7V2BZkh2+D2Ien8ZupGI4YBh
 pdwxJD5Ug06WqWHm7q4ztYWq+mi+7mIDcRrHVpf3PYCo43tuKvykbYI2FWgKbzZPGe21wO87k77
 zCZ7jHyruBGX0nrDntw1ImxQx3qNMZzptAovBem/ri/V5Wn54T3j10h1mkjPUc4u1cNGh+qsIOJ
 6K5ltHDh3H2MdLTZEGg==
X-Authority-Analysis: v=2.4 cv=YsY/gYYX c=1 sm=1 tr=0 ts=6a9596f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=yikt5F2n8VKCXyCzpw0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_080006_358227_45560CB0 
X-CRM114-Status: GOOD (  15.29  )
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

Upcoming RISC-V IOMMU interrupt remapping needs to map every possible
host IMSIC target into one contiguous MSI IOVA range. MSI message
composition then uses the target CPU's position within that range.

Build an S-mode IMSIC physical address array indexed by logical CPU.
Require every possible CPU to have an initialized IMSIC page before
publishing the array. This preserves physical address zero as a valid
target and guarantees the array has num_possible_cpus() entries.

The array size and each target's index can therefore be derived
directly, without storing duplicate count or per-CPU index metadata.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 32 +++++++++++++++++++++++++
 drivers/irqchip/irq-riscv-imsic-state.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index df38a7670a89..c7ebddd308ec 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -709,6 +709,31 @@ static int __init imsic_get_mmio_resource(struct fwnode_handle *fwnode,
 	return of_address_to_resource(to_of_node(fwnode), index, res);
 }
 
+static int __init imsic_init_smode_msi_pa(void)
+{
+	struct imsic_global_config *global = &imsic->global;
+	phys_addr_t *smode_msi_pa;
+	unsigned int cpu;
+
+	smode_msi_pa = kcalloc(num_possible_cpus(), sizeof(*smode_msi_pa), GFP_KERNEL);
+	if (!smode_msi_pa)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		struct imsic_local_config *local = per_cpu_ptr(global->local, cpu);
+
+		if (!local->msi_va) {
+			kfree(smode_msi_pa);
+			return -ENODEV;
+		}
+
+		smode_msi_pa[cpu] = local->msi_pa;
+	}
+
+	imsic->smode_msi_pa = smode_msi_pa;
+	return 0;
+}
+
 static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 				     struct imsic_global_config *global,
 				     u32 *nr_parent_irqs,
@@ -959,6 +984,12 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		goto out_local_cleanup;
 	}
 
+	rc = imsic_init_smode_msi_pa();
+	if (rc) {
+		pr_err("%pfwP: failed to initialize S-mode MSI addresses\n", fwnode);
+		goto out_local_cleanup;
+	}
+
 	/* Initialize matrix allocator */
 	rc = imsic_matrix_init();
 	if (rc) {
@@ -984,6 +1015,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 out_free_local:
 	free_percpu(imsic->global.local);
 out_free_priv:
+	kfree(imsic->smode_msi_pa);
 	kfree(imsic);
 	imsic = NULL;
 	return rc;
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index c42ee180b305..11352f14e32d 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -49,6 +49,7 @@ struct imsic_priv {
 
 	/* Global configuration common for all HARTs */
 	struct imsic_global_config		global;
+	phys_addr_t				*smode_msi_pa;
 
 	/* Per-CPU state */
 	struct imsic_local_priv __percpu	*lpriv;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
