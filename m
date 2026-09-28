Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B702CA5FA5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1Nvm3RfGQptWGmbhluM6/WDaX4szK60xiqzqT2OOSc=; b=bJrh0VuZHXlgil
	JZGzAg/JfjSu3CUgTMxbof2DsBvr/rw8Wm4q63sUO5sPfod0wU/GxDPcKBGdGTH5U3b18h4Ha/+39
	NMF9fQjKpqTqhx4xegPFFdFISYWzI0EbpRYHnpEctzDS2I1nx+91JdCke0rbzr/oDpgH5QOmnvyiP
	NzgjbJe69DrJ1LGfwxu7GsKGaVLCn345T9TfXQte88cx41iZlgKOP8H50qkXht+uO88Tu8EWG9Pdy
	ZjLp8CItU+HmUcqLa/NRaDomcT45Wiq+ziFUaTKUPKR2CaljFhTlqiP596Fx0ji850hvhgsc6/YEJ
	dUV9aHuypfXboxq6sDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCP4-00000000ljJ-1xJT;
	Mon, 28 Sep 2026 14:32:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCOx-00000000ldU-3M4W
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:32:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA9D71433709
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g7ykt7LSEJe
	/IvR1ZzOjMBU3wKZ7WY6AweTJQ2yjaag=; b=A1khsbUY53TyX+IouxKKcQgcDYK
	8RmG3YIwh2qQRPk8L9AOg75iU5OhtzUQo61HU6vp30hzLq8NwzUNx3kABtBGg8bB
	zFC3VvlPM/YcW73HckfLlY8b6h1eHSfB79tRRdkKLZYXGZvUlzpOCqLolVE/fOMz
	9SDa14kaU0pqJkAuyegYSvTOjpLEQO+VzjNVEX2T6oCjSEhv0VsItB82zWcvTth0
	KSM3IeTuI+7qhUIK0Vdgz4ClN4LxsH7fpUi4hsp+TVNP04VOUCVNboUePJxH0T4v
	MDK4OqUJJhF49TuMdt+sEFKGLQ5SyOyP5hOVkMx67Z2RNROj3R9QZAJNVzQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s1yw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:32:19 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso2512818241.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790605938; x=1791210738; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7ykt7LSEJe/IvR1ZzOjMBU3wKZ7WY6AweTJQ2yjaag=;
        b=S8NGc/PTKN228FwBaz3CB7ZAoNFG8AWEW2/pZ/bOkuTrnft6aVG7UVBs04if4IX7fq
         Y4gAGBsZv2cU/yGIXHtxTn16AKPDRHNhpZRFW9SlpQnaXn084IdXqbIy+WKouUQ/ETmQ
         6Yi5drOcatY9xQNQik6bsuheWcMwcShh7cmMXm8EJVGRRLhPCqrMbFoSexw8rh9nflSS
         cu9a+Pf0Vai7x9KBPcoo6/Cc+VBK82SMleQaNvFuxxI++58i4tnwHQZ/0vfTmBFlA1CF
         oZfh3jRVWBy7bpiWRbI+nnnculvatUJ8ZNEm69nLk9Igkk0i+z2xRjNRo4Kte4KSV4rz
         i0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605938; x=1791210738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g7ykt7LSEJe/IvR1ZzOjMBU3wKZ7WY6AweTJQ2yjaag=;
        b=fBFGSvrj+NGiCMdn/j4pno1xMmJ/y3YAMeVLSD+tzrrgtRBAr9wUjcH5VKeFOEJhwo
         C72m+t556JqYzxrF1E9H1JpWMeQrxdfHTO/tjFB3mXap01CbyalLOyeIoV9fjQTpN4V1
         b+U/+cYkAPaaF4cEgUqBK5mvArpOInFwaqzj4/J8qaet0hrbcDjzOmQW+JLymsd2D6ag
         z1NWyyzvvWX2SrycPGFZa2WTGY6C75vjSHl3/XAlpB0CYr08mXIQP01p3yLC4srktZQN
         AlRKACyD5uugLe7ol38/Jx/FTq9j008SBqL88QC+hSob3dqzWjLmM9Dum7WVSzcg/IV+
         7UHg==
X-Forwarded-Encrypted: i=1; AKwUvByR5nfzojREMBzucIpVs04fU1MGzyHXeyZPVarEJgPzRNnl3Yih8hKtkjCzz6g8KhSNZfKTNucTnCtMkQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKrfhGZNPWFR+R4wxUPkeWuXiT76+6TkDz3KZLueAK1dmfB3e9d
	CoSh09/ggvqpIQujB5nbg//tfM5j8LYSb24xK1w3Q4sluXdQn/yALbuYZG9yyrnLL5FX0rU0Rt2
	Xc9dOe+2O22Nq0X26cIlxJtHQFH5Fn/Lym/j5a/PWU5PcOjdIpjYgMBxB5Jyj6/fWR8myO/M=
X-Gm-Gg: AYBFou0EL5lmDmE0ymARFJRgy75iSwci1E3ylR+EjR9z5/2qVEPoUNaP4a9s7oBFfjy
	gbU/Dr85bFn2FoNx3J27Zr1VlPqZC8p6d3vmlNtA4BPgE4rtwV8AsJ3CYNGx+r6aHm7ZykxLC6t
	npLoWITg1bmkEAP6NmZjy6cafn+N5pjLzTrerqaFtkDZV1dO5gyikisZJL6fconW0U8pEwe61ja
	5Ww07lDYeruIJurG5yA25BuXNtFyLgcxF67k+votyOPK/ajJbudWXq5ThtqRSV4BA3UyWo2saNT
	/glkLfpZqRhIW2G+kO1oar2KiU7ueVVEZ5HhET7fhpRsc5Lct3loU6+fvQeSZXgj7AMPKfgSoJh
	O7xmIzbNKYq8VXQtkl4fm8uPwcFApOFOq/Yz5Aw==
X-Received: by 2002:a05:6102:32d0:b0:7b2:7aac:8ccf with SMTP id ada2fe7eead31-7b27aac8d4bmr3266550137.29.1790605937943;
        Mon, 28 Sep 2026 07:32:17 -0700 (PDT)
X-Received: by 2002:a05:6102:32d0:b0:7b2:7aac:8ccf with SMTP id ada2fe7eead31-7b27aac8d4bmr3266533137.29.1790605937424;
        Mon, 28 Sep 2026 07:32:17 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dcf626b3esm211882366b.27.2026.09.28.07.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:16 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 11/14] iommu/riscv: Prepare info->domain for concurrent RCU access
Date: Mon, 28 Sep 2026 16:31:10 +0200
Message-ID: <20260928143113.49838-12-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfXzuaFzE9aU1W5
 xysP84t6ownDj4eRpYbmSz36UAXOl0UmU364lE6+JhkLeyxNNwgVFBnxAi1yR/RtETjlS/iZsvW
 InqFbyhB9hFYY/IFWP67ZkFuI8FCjguCZIn8VZypOSHU/JYYAGH7nCRZ7BRozFEIdOl6W7IgpJi
 0P5wW9AoloqaIRj5Swv3BaERJcMreBCr2Vx4diJXtBVAF4Xi9eBffa6ge2LQ/KxTqvHrNpEq5tM
 KDbAEPQ/IBPdXhazx+Cn54shEO7V3abd4fB+iCDP5cwCIcbxTXAKHUz3L6fDEIW1jR7578M9Swr
 NT47TRGpSefG49fp5upoVDbBlr9MedAv/qPtZJ8IVntRAETNKJdO9sUH9BKYDEjfAEASNtoD7Na
 ZKi/nYt2aRclCjtdZ7qySIsXJbTMmbfN2PJUnUQCzsNo+n2fe1nkTwzNAcaP2BO79IJClPVtkuG
 Ny+MDDgxP37ECkl92eA==
X-Proofpoint-ORIG-GUID: wRn2brLlkAkOAJXIb3WYpfp_CdoGbrh0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NyBTYWx0ZWRfX0s8OQNotR1Lq
 JMxG6wjvzL77kgIhxSYLvbDjZGExQ/kuxPgeilfTXkMiysd6paqfugV78NpES8ysm/wznC5E8i+
 llTEkdwwvbVJfjD7kvhcJ76L7BSYxEg=
X-Proofpoint-GUID: wRn2brLlkAkOAJXIb3WYpfp_CdoGbrh0
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba7a73 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YVOiLqTVN_ovv9J5ge0A:9 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_073219_855798_2B42A580 
X-CRM114-Status: GOOD (  19.37  )
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

Upcoming interrupt-remapping callbacks need to resolve a device's
currently attached domain from IRQ context, concurrent with domain
switches.

Protect info->domain with RCU and wait for readers before freeing paging
domains. Provide an RCU accessor for the domain-owned MSI table so
interrupt-remapping code does not need the private domain definition.

Use the stable old domain supplied by the attachment callback when
unlinking its bond instead of dereferencing the now RCU-protected
info->domain.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 34 +++++++++++++++++++++++++---------
 drivers/iommu/riscv/iommu.h |  5 ++++-
 2 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 7a8b40d311ea..514470291fd9 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -869,6 +869,16 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 #define iommu_domain_to_riscv(iommu_domain) \
 	container_of(iommu_domain, struct riscv_iommu_domain, domain)
 
+struct riscv_iommu_msi_table *riscv_iommu_msi_table_rcu(struct riscv_iommu_info *info)
+{
+	struct riscv_iommu_domain *domain;
+
+	lockdep_assert_in_rcu_read_lock();
+	domain = rcu_dereference(info->domain);
+
+	return domain ? &domain->msi_table : NULL;
+}
+
 static struct riscv_iommu_msi_table *riscv_iommu_domain_msi_table(struct iommu_domain *iommu_domain)
 {
 	struct riscv_iommu_domain *domain;
@@ -968,18 +978,22 @@ static void riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
 	smp_mb();
 }
 
-static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
+static void riscv_iommu_bond_unlink(struct iommu_domain *iommu_domain,
 				    struct device *dev)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_device *iommu;
 	struct riscv_iommu_bond *bond, *found = NULL;
 	struct riscv_iommu_command cmd;
 	unsigned long flags;
 	int count = 0;
 
-	if (!domain)
+	if (!iommu_domain || !(iommu_domain->type & __IOMMU_DOMAIN_PAGING))
 		return;
 
+	domain = iommu_domain_to_riscv(iommu_domain);
+	iommu = dev_to_iommu(dev);
+
 	raw_spin_lock_irqsave(&domain->lock, flags);
 	list_for_each_entry(bond, &domain->bonds, list) {
 		if (found && count)
@@ -1415,6 +1429,8 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 
 	WARN_ON(!list_empty(&domain->bonds));
 
+	synchronize_rcu();
+
 	if (domain->pscid > 0)
 		ida_free(&riscv_iommu_pscids, domain->pscid);
 	if (domain->gscid > 0)
@@ -1577,8 +1593,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	info->dc = dc;
 	riscv_iommu_bond_link(domain, bond);
 	riscv_iommu_iodir_update(dev, &info->dc);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = domain;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, domain);
 	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
 
 	return 0;
@@ -1732,8 +1748,8 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	info->dc = dc;
 	riscv_iommu_iodir_update(dev, &info->dc);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = NULL;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, NULL);
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
@@ -1760,8 +1776,8 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
 	info->dc = dc;
 	riscv_iommu_iodir_update(dev, &info->dc);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = NULL;
+	riscv_iommu_bond_unlink(old, dev);
+	rcu_assign_pointer(info->domain, NULL);
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
 
 	return 0;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 4c1c681ba2a2..ed973979d795 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 #include <linux/iopoll.h>
 #include <linux/irqdomain.h>
+#include <linux/rcupdate.h>
 #include <linux/sizes.h>
 
 #include "iommu-bits.h"
@@ -85,7 +86,7 @@ struct riscv_iommu_msi_table {
 
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
-	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_domain __rcu *domain;
 	struct riscv_iommu_dc dc;
 	struct irq_domain *old_msi_parent;
 	unsigned int nr_forwarded_irqs;
@@ -100,6 +101,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 
+/* Caller must hold rcu_read_lock() while using the returned pointer. */
+struct riscv_iommu_msi_table *riscv_iommu_msi_table_rcu(struct riscv_iommu_info *info);
 void riscv_iommu_msi_table_inval(struct riscv_iommu_msi_table *msi_table, unsigned long addr);
 void riscv_iommu_msi_table_inval_all(struct riscv_iommu_msi_table *msi_table);
 void riscv_iommu_msi_table_update(struct riscv_iommu_msi_table *msi_table, bool activate);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
