Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0903C5AC7A
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8t6IIzm/XBB9wQsxLVd+OALz/Pz8flO6Nhgq9VyXfM=; b=PNvrnTVq1c7R3C
	cYT4Sesszj4FFk2qS0fpYmeMhlje/BVdsG+Qz8HMZj/3iu5P9yis+NJGUAkvz6Cb06rfVKZTPl6oV
	BlZU4+/1xGjqbnvFY7VX05fZFcaAOqOrArGdPg15a8cJvTLtO6TnOxhJjR2vXVUe+bNNpzPRN35kS
	9/qfinVifNDbT+Mw9gwJ4vS2fKoCoOdAA6RbImQMaSfPWSmyTXSpXvFYwViE2osQenPj6+3+0AsRG
	W608dgl5BU1cLO2wLbKM6e2fbVyqNx7FGpTIlO1R4Hpj2/kDYTDZGdnDZ7EadiCWgrxwbsmc0mxUO
	BC13xoyNtM4spmuWIfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8F-00000008Z9e-0HfK;
	Fri, 07 Aug 2026 18:17:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8C-00000008Z8r-2Fqa
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GbWFt1826026
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x4BbeW4tbgB
	s5QyG02520XP2wqPwKgkuyyfFvzacp9M=; b=jSTHZsQNCDus3Y1t7VZCEp9azzF
	69zt/DYBg9EUlNYPu2zli6aNtxnqU8B5fSpbW2tCsPXPmyRfMq8VndH/qm13Rz7e
	jirJWPIFU3VUq8KLI/U1iSaleJ9O2xsvHWlq1jb5NoDmZDtbrkLUf1B3cfecnfnP
	bs7AxK4bli6sKg6bTr6NuCS1vAueYZSku/TihPYrazQvKt2kM/ADBNYkQE7f0O5B
	sKbmnjKytU4a+oEHkcvIwghLnCMo/Vx1SZAJFnsOAaVv0AYxN6jCxTZ9Pj3aOPVn
	P+Nx3kysuGL+ufNDih1r5cU56rZNx0WPtB1E6lzLeq6OEZAvNKjFYhNfaRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwk21geyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so62194011cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126639; x=1786731439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4BbeW4tbgBs5QyG02520XP2wqPwKgkuyyfFvzacp9M=;
        b=OtILobpID+9YLbIDwLqBb/w38w73saMzdZIPn6RSU94TPuPgBoh+CBUMZOowLgH7IS
         6r9WqKCjXkoxKTs+pSoXWr/loSpFj4duphWEGj9Si0iIn8W5SruuxDZUgs6q59WPYCD+
         wTD73SrRqLC3yi9hSc4ly5J9QXhQHwiDPvCw0IP+iseJN33XzdCfR8q1YnTqaVdlD65x
         M8TlmP9uBYCWXFrTS8EjaLd1g7vz8Rd9Cmc4dw5wMEtCbLdBAgkvd3cw3SE/1dx3JEbw
         UxLmQiMKksLuGgETNIA7X30dAvyzhso5GznZP0SMgxfU5JKNL7KqGX6KaYHgMlrj7p+h
         mDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126639; x=1786731439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4BbeW4tbgBs5QyG02520XP2wqPwKgkuyyfFvzacp9M=;
        b=r6Bv5S++AwhEdHs0fe98hAgOjbyJgKk2dkhyp9ImHbzKRP8lQVWDQ4p9EdEGwGoZr4
         BqwXqIZ+Z6BsUtxcjCGZ7XK8N9Mtz6pVpoKZhijGxjWxVRhu6mT02b5lb5aw/xmYESLs
         Kw8DTVfcVhhmb2UzLQYfPg71DP/2fctbalFXukCIEROaKW88FFzusyJxBPTRvVrHwBes
         45yziq+uoY5DzhAKcFXwfAgruZLBlaAZdULCwKdd7RjFNPcaLjVU+6fVRImJ7JEKVPOE
         /dYGHHgkTTaREnl0djAkKEWYAQu2jUHvH4EeCL0JTdhYUHYxW6xc5tGEyHYw+54TESdg
         ydsw==
X-Gm-Message-State: AOJu0YyS97bW7dd0aNJHO1iQOHwWwBfsBfUaX5DyMWQqlWKu7XkI+cwj
	5ueJKl/RANmxMrNDVJWffdH/7NzBbX+J9RGVWZ5+B0VWEzZuDy98AIkjGr0QXFMcrE3HZLs/GG7
	tHmhCYIjB0QeBXKyKnQYqK3BjW+v9ioyUQbQZv81EU0rfc0iK/ixwThuB90vhZMXAs5iC5wW5LK
	HCuOs=
X-Gm-Gg: AR+sD135CI61hWP/rhL3yk6hacoJM3Ov1cVyTuHFJsvNzCct9GXwI4Y+yhALJqq9POm
	W7sWb+CMF7F+0RPkhAosAiUxv4E0RuRw3sj+T3QGd8beeIqARua24Hjt0MzvDJA+DSwvQsvIomx
	Jl1HbKdDP/aBnAcgnxfuwrqdqQ5oHDmZbzgq0oQCX49Cw3Pv1JjQPbmDPxKkfEMQaNYI0zfbjIl
	Qq/6tDAi6fMaTfdgOhvpwtmavalSbqiQ6wuzYNYtb//6oSU8FEdU2ao0q8zbyQAT/ebB948bjuk
	DiDWKvBmUVwb4DYz1GS9Wq3dNcrH9x+J1jXhYe+i9jdr2wTcblOKPkmy6RN2/YVmYZCq558WVZA
	ZrOXfvF8O6G2d1dIQgCJbVYteC5eu/ERF3hkckMQ=
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr32327251cf.43.1786126638642;
        Fri, 07 Aug 2026 11:17:18 -0700 (PDT)
X-Received: by 2002:a05:622a:451:b0:51c:1006:a024 with SMTP id d75a77b69052e-52d20a9abe2mr32326551cf.43.1786126638220;
        Fri, 07 Aug 2026 11:17:18 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a1e7cae4d1sm857274a12.11.2026.08.07.11.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:17 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 01/19] iommufd: Convert struct iommufd_sw_msi_maps to a growable bitmap
Date: Fri,  7 Aug 2026 20:16:55 +0200
Message-ID: <20260807181713.228535-2-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: d7Rhz2V_GjJgxWPIsng3mU3Ur6aYDtW-
X-Proofpoint-GUID: d7Rhz2V_GjJgxWPIsng3mU3Ur6aYDtW-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX6ikhtsM/iYjw
 kyuF+cw76t9P9Degw+c6opE1QkqHjVmfFjmsruAWCb/Q4eCCKW9bE1MVh+vgVHcqPyKMvdSLOfp
 Ji4F+3cfTVhyCO5yqjqAQgz/a+c7BROHqA/KI1GRpDg49gQ1EWqCRQC48UiHEPKkFEkFDZ2/L/5
 f1hg8O0h3rYi7EGL1LrLSzG09Q+fW5vkeYYVaSyAU7T5E1NotAoKsCi3loUHPlQQBoUijStssj8
 SibjxWGTgR4fO78fi4CPsY/CWhemrEn1+h54dG1/xu+sSLul+ChNEnUzshV5PS0NUfDGlJMEQHp
 LW1H22hGvx5jsGHmQ/MAlAgwcuUtapPqiC38Z2rPWkSTMM+i23B2G8rC5WWbeM01ef5aA2rSc09
 7q0iyyctCJjrwXlBnSd129lvC/32lYhQ0gHZC8j17Tk+q7Z/u4Gq1t6DdZrXbAMW70x2MTv914K
 8plXiuL3bmN4b4DGYHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX4sNbIntZ1Wni
 0N/u0uaWAcCREULfpo0+SYT7UbnLirHZPaohhFPzpiN+uyItbA3Z/DtxXtZ67lzpsb0SI2RIVTB
 gxK//jAgjlhJkA5wfAK9TOACf2jQSG4=
X-Authority-Analysis: v=2.4 cv=YJevDxGx c=1 sm=1 tr=0 ts=6a76212f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=sJeJdZliiPf9M_nNF58A:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111720_848756_FA74F8C8 
X-CRM114-Status: GOOD (  20.60  )
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

struct iommufd_sw_msi_maps currently uses a fixed 64-bit bitmap,
capping the number of distinct SW MSI mappings a context or hwpt can
track. An upcoming caller needs one mapping per possible CPU.

Convert the fixed bitmap to a pointer plus size that grows on demand
via iommufd_sw_msi_maps_ensure(). Add iommufd_sw_msi_maps_test_bit()
alongside it: unlike the __set_bit() call sites, which always follow
their own successful iommufd_sw_msi_maps_ensure() call on the same id,
iommufd_group_setup_msi() tests an id from the fd-global sw_msi_list
against a specific group's required_sw_msi map, which may not have
been grown to cover that id yet. The bitmap is arbitrarily capped at
16K entries in order to simplify arithmetic validation (i.e. simple
bounds checks vs. integer wrap control).

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/iommufd/device.c          |  3 +-
 drivers/iommu/iommufd/driver.c          | 38 +++++++++++++++--------
 drivers/iommu/iommufd/hw_pagetable.c    |  1 +
 drivers/iommu/iommufd/iommufd_private.h | 41 +++++++++++++++++++++++--
 4 files changed, 67 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 170a7005f0bc..402251c7b887 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -34,6 +34,7 @@ static void iommufd_group_release(struct kref *kref)
 		   NULL, GFP_KERNEL);
 	iommu_group_put(igroup->group);
 	mutex_destroy(&igroup->lock);
+	kfree(igroup->required_sw_msi.bitmap);
 	kfree(igroup);
 }
 
@@ -384,7 +385,7 @@ static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 		int rc;
 
 		if (cur->sw_msi_start != igroup->sw_msi_start ||
-		    !test_bit(cur->id, igroup->required_sw_msi.bitmap))
+		    !iommufd_sw_msi_maps_test_bit(&igroup->required_sw_msi, cur->id))
 			continue;
 
 		rc = iommufd_sw_msi_install(ictx, hwpt_paging, cur);
diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index 3b8067976eac..9b9316ae4266 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -196,13 +196,15 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
 		if (cur->sw_msi_start != sw_msi_start)
 			continue;
+		if (cur->pgoff == UINT_MAX)
+			return ERR_PTR(-EOVERFLOW);
 		max_pgoff = max(max_pgoff, cur->pgoff + 1);
 		if (cur->msi_addr == msi_addr)
 			return cur;
 	}
 
-	if (ictx->sw_msi_id >=
-	    BITS_PER_BYTE * sizeof_field(struct iommufd_sw_msi_maps, bitmap))
+	if (ictx->sw_msi_id > IOMMUFD_SW_MSI_MAX_ID ||
+	    max_pgoff > (ULONG_MAX - sw_msi_start) / PAGE_SIZE)
 		return ERR_PTR(-EOVERFLOW);
 
 	cur = kzalloc_obj(*cur);
@@ -222,21 +224,26 @@ int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 			   struct iommufd_sw_msi_map *msi_map)
 {
 	unsigned long iova;
+	int rc;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
 
+	if (iommufd_sw_msi_maps_test_bit(&hwpt_paging->present_sw_msi,
+					 msi_map->id))
+		return 0;
+
 	iova = msi_map->sw_msi_start + msi_map->pgoff * PAGE_SIZE;
-	if (!test_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap)) {
-		int rc;
-
-		rc = iommu_map(hwpt_paging->common.domain, iova,
-			       msi_map->msi_addr, PAGE_SIZE,
-			       IOMMU_WRITE | IOMMU_READ | IOMMU_MMIO,
-			       GFP_KERNEL_ACCOUNT);
-		if (rc)
-			return rc;
-		__set_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
-	}
+	rc = iommufd_sw_msi_maps_ensure(&hwpt_paging->present_sw_msi, msi_map->id);
+	if (rc)
+		return rc;
+
+	rc = iommu_map(hwpt_paging->common.domain, iova,
+		       msi_map->msi_addr, PAGE_SIZE,
+		       IOMMU_WRITE | IOMMU_READ | IOMMU_MMIO,
+		       GFP_KERNEL_ACCOUNT);
+	if (rc)
+		return rc;
+	__set_bit(msi_map->id, hwpt_paging->present_sw_msi.bitmap);
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(iommufd_sw_msi_install, "IOMMUFD_INTERNAL");
@@ -290,6 +297,11 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
+	rc = iommufd_sw_msi_maps_ensure(&handle->idev->igroup->required_sw_msi,
+					msi_map->id);
+	if (rc)
+		return rc;
+
 	rc = iommufd_sw_msi_install(ictx, hwpt_paging, msi_map);
 	if (rc)
 		return rc;
diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
index 623cc608ca0c..54873de43eb0 100644
--- a/drivers/iommu/iommufd/hw_pagetable.c
+++ b/drivers/iommu/iommufd/hw_pagetable.c
@@ -32,6 +32,7 @@ void iommufd_hwpt_paging_destroy(struct iommufd_object *obj)
 	}
 
 	__iommufd_hwpt_destroy(&hwpt_paging->common);
+	kfree(hwpt_paging->present_sw_msi.bitmap);
 	refcount_dec(&hwpt_paging->ioas->obj.users);
 }
 
diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
index 43fbc5bed8de..9ca5f9f92cdf 100644
--- a/drivers/iommu/iommufd/iommufd_private.h
+++ b/drivers/iommu/iommufd/iommufd_private.h
@@ -9,6 +9,7 @@
 #include <linux/iova_bitmap.h>
 #include <linux/maple_tree.h>
 #include <linux/rwsem.h>
+#include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/xarray.h>
 #include <uapi/linux/iommufd.h>
@@ -29,11 +30,47 @@ struct iommufd_sw_msi_map {
 	unsigned int id;
 };
 
-/* Bitmap of struct iommufd_sw_msi_map::id */
+/* Bitmap of struct iommufd_sw_msi_map::id; starts empty, grows on demand. */
 struct iommufd_sw_msi_maps {
-	DECLARE_BITMAP(bitmap, 64);
+	unsigned long *bitmap;
+	unsigned int nbits;
 };
 
+/* Large enough for foreseeable SW MSI users while bounding bitmap growth. */
+#define IOMMUFD_SW_MSI_MAX_ID	(16U * 1024 - 1)
+
+/* Grow bitmap to accommodate id. Must be called under ictx->sw_msi_lock. */
+static inline int iommufd_sw_msi_maps_ensure(struct iommufd_sw_msi_maps *maps,
+					     unsigned int id)
+{
+	unsigned long *new_bitmap;
+	unsigned int new_nbits;
+
+	if (id < maps->nbits)
+		return 0;
+	if (id > IOMMUFD_SW_MSI_MAX_ID)
+		return -EOVERFLOW;
+
+	new_nbits = max(ALIGN(id + 1, BITS_PER_LONG), 64U);
+	new_bitmap = krealloc(maps->bitmap,
+			      BITS_TO_LONGS(new_nbits) * sizeof(unsigned long),
+			      GFP_KERNEL_ACCOUNT);
+	if (!new_bitmap)
+		return -ENOMEM;
+	bitmap_clear(new_bitmap, maps->nbits, new_nbits - maps->nbits);
+	maps->bitmap = new_bitmap;
+	maps->nbits = new_nbits;
+	return 0;
+}
+
+static inline bool iommufd_sw_msi_maps_test_bit(const struct iommufd_sw_msi_maps *maps,
+						unsigned int id)
+{
+	if (id >= maps->nbits)
+		return false;
+	return test_bit(id, maps->bitmap);
+}
+
 #ifdef CONFIG_IRQ_MSI_IOMMU
 int iommufd_sw_msi_install(struct iommufd_ctx *ictx,
 			   struct iommufd_hwpt_paging *hwpt_paging,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
