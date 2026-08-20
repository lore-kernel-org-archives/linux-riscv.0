Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D62C5DF8C
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1gTt6K2wWv9mTPb0aSmnKwPiTET31Rq/dpnjOXPPx4=; b=rI6Cep0HaZN5OH
	UbMsykQohFCK6GPW+l+OkEdRbEAF75b7kBdmCzN4JfPrNDCfyJnnH9OTkdKtJsJuGvXUoUNlUezAx
	N+gtwXPQB49fMt9D+oZgIKLzSeD8906stvGGvMuJonS4Npp8X0NaJkTIp7twjWkcEfKekFUHysRnv
	3iolxfJYAlp/jgfAHOMsOCIlWb5ZCzqUt82//cOtGht8XoZ//vPY02DF/4mnRZP4iRdmTMtbvRa9J
	pKX4+DD7WeINnyZgM9wHmeCDIZxGQGhCc/XkklJWX4NVIzzTFclWULsoNd0m7zj1orHuiUF1/Rpnf
	9VkszZqP8DNzBiu/MhVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAX4-0000000CEGs-3kud;
	Thu, 20 Aug 2026 21:42:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWs-0000000CE2l-0TiC
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:36 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7X5a250313
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=79+EUc5zjJ0
	5uChddI9OeEyTI1SRgR19Uh5B705ZPJc=; b=guCYsuq3akatpiGz28vkfo8wojh
	oogzY9QFfOvzIO+XE5UNVoW6M8Kx0fjB1a/Hi3eXp0v7Mnqzf60ahKQpdGI6JkaV
	qxAMpwiH2t8MCKNn1flp0hWsr8liF2CB3jELUoSz2wrEQ5pTLzbNeFuMZZgYu+42
	I6w7/1tDTzvBZtjAlhOXyx+O1wlfD9FHpRu2YdYwMjNI5uNlQwhFB+nSlDWoP1Eu
	BMi+xZ5Sv/h+k93y2W3iUQ8LSIogsf1QczoETPZMmiNOTlgPfWyloI8EikngIvy1
	O3R8KMKGh/MetekRacaSR9J8H4n4Jxtb1Ul654Coyn3CU+xvYMQkAyvQTzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w49bqrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso31047585a.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262149; x=1787866949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79+EUc5zjJ05uChddI9OeEyTI1SRgR19Uh5B705ZPJc=;
        b=Bkaa8Bg8vrARszs+EhOL0tZeSgaXCGbjGAfuSVBITHStFOznQYzqFmw3Cpd1Rdqnim
         3Vr+gva7MIwCQk6vDg9Jkq6fowGyN4OswmyWTzx1PGG1QngJWs2+dFWd9jLbb0V57j/X
         dCHTgv/ipp2dK9+B1DOU0rwH+PwX3iFSfzVdr2ffyKgKXZYNZUb1pYdYOp9PCCWBTWdC
         KWSNl42vkshn5+Yuyio8PGkTWroQAkdxwN9arScsVy/6z4K838CkC/8P2MXokYSSulNp
         2/LNPTUb09MRT6qd41own4PuYHZ3n5mnY2FLdrXRzxIZOkKCPmDy/pcGQEForqtAHCq8
         LIHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262149; x=1787866949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=79+EUc5zjJ05uChddI9OeEyTI1SRgR19Uh5B705ZPJc=;
        b=re6wkjqI5tXr46SmvwotkC2wS1lRG3f1txcv/hVVbC69xzZks+Q394GiIkGO2Rx/rT
         fFfEbjcU+aEUz/8m2pVsKX3u4xtoKP/FWMHp0rKkS1aQKCsTm73OlZ75lOCBs3n/6w9h
         mU8ZcJEhvszV7zEtHU0qySek82+IqQ/nzlE47dO7VYWZdp8NC8/XgjjK+7wsQEUt+43D
         9EmXCREYKRHyW3IByRwha9xcNCBMB0eTUBYnlbHAkpDcGYeoLhDaw8pW6sHB+y5lvQ55
         JysTZKGmgtUtAcnAXhpeZtrYsevOhj1NIMPnf/p3bBmIG795Hh2pROS7CT6CyP+EGadU
         QQXw==
X-Gm-Message-State: AOJu0YzzDyjTqCNSUMxUxIc+9JV36+QeG4vhNcTPCmELZ22/HOaA7o6B
	JM9gilWNcyJXAznk2aWVpVp62R/nN7vTkqP7DiHBJ8Yq48Y4RK4LByWV0HIkCtqSui7g8J8lzm3
	M15m7uXkbwNUpUO+DMfFNmvWCdiwEhu8wyaQBRFtCws2EsOW8h8eYueIJCywjhmJiPbKHoRtH6W
	eil1I=
X-Gm-Gg: AR+sD13UCQHhNkgXRKUT2NNxPJlfmDG9QEv8L4igJL29wtEQYG9cjE7u8x4F8oSmydu
	sf+F315UWMCiYxEwli1dVCPAFH3MU54R2p+INF+fmiVuhkvM1aEFXhuxWPhjkp583lLFFDUhEk9
	zIj17BV5YK/9RPPXiy88RQpSLayyM7+7Svwm5sJzrQdRV+6Q7+1JX9lylpOK2JgquD6BtCupAzI
	E/PXl8gSgaFKgIA8CcGat3fZFg+CQsQOUP45QvZSZs80e5Kl4O5RMy7EoayfD9yL32iZ15B/9pU
	1vF5LC35fVx49DS6NNwyQMdOu1+qRZNZgpOaJmaMU5s47q2VxPbnPyVTqBbRPnbVLpicJtMyZhy
	B/gLt7jkR
X-Received: by 2002:a05:620a:6018:b0:925:56bc:b8bb with SMTP id af79cd13be357-9373942e505mr132608885a.9.1787262148625;
        Thu, 20 Aug 2026 14:42:28 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:925:56bc:b8bb with SMTP id af79cd13be357-9373942e505mr132605685a.9.1787262148227;
        Thu, 20 Aug 2026 14:42:28 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b90f7e24sm5954095e9.8.2026.08.20.14.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:27 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v4 17/21] iommu/riscv: Report cache coherency capability
Date: Thu, 20 Aug 2026 23:41:46 +0200
Message-ID: <20260820214150.545737-18-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX923UWsA8dmNg
 bUHfK8ykk6RgF8ZSijWsMgFS2ywcXR0d72mp0XOqUDhUFN5g0EkXQPoyw9R32OYWiFAwgwRsgIj
 oDOhqB3Gxtb36IBga67iEHL7PK2B9Sg=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a8774c5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ITBYzW_wA1tX7bdzKc4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: mb4Oh8WvQApdECb5iQUKDd966VS_9d6c
X-Proofpoint-GUID: mb4Oh8WvQApdECb5iQUKDd966VS_9d6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX8mg8hCkkNeS6
 mnV31Wwo8lUJK6QeLg3vp4wKu4pi2KYhzI0N+7rsizWyHZH6Ob1RiwTBd4IlrMVc6FgbMtCrPmH
 lqhEQVv8xZn/wmCAWQxiAErkYz1XN8uaEjpPnIHvQQeNxkzrUqSpuaB1QgRYqRp8590FQouS55T
 ipbFE1kKYghsfvwJUTVgu6ZlU9IRBsnsNLDumZgRA1j24TOQIZAYCJ1Gica61/8eAIb5C0Y1dd+
 5HipJiUUSsf8BW8dJY9WgHt7rsa5gB3L+O0Ac+XtgxigeQFoJN6eod0R0nU1+Z43AQvLLmpmncR
 9vs/1KtvIYtb5htR5aApnAbxCxFU1I/ZuAFqOz3flesw/cbZS9qzmrGhh1Vx625sJwjR9I4QnD8
 MFwq/gi3qbqBm5GTvlwEyLGVJ8UrxGVSiwi+43F0ihjb1P3i1j80wj5ijFtjpmRmFBxvlWVuRaf
 Rxofdet3qAz0Byl+HgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_144230_185978_1CC2D4C0 
X-CRM114-Status: GOOD (  13.85  )
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

VFIO and iommufd require IOMMU_CAP_CACHE_COHERENCY because they use
IOMMU_CACHE mappings and have no userspace cache-maintenance path.

RISC-V page tables preserve physical memory attributes for IOMMU_CACHE
mappings. Svpbmt marks mappings without IOMMU_CACHE as non-cacheable,
but preserving physical attributes cannot make a noncoherent device
path coherent.

Report the capability only for devices marked DMA coherent. This limits
userspace assignment to paths that can honor cacheable mappings.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 22cccc69bd2c..161093b1d9c5 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -16,6 +16,7 @@
 #include <linux/acpi_rimt.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
+#include <linux/dma-map-ops.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
@@ -1429,6 +1430,16 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 	return generic_device_group(dev);
 }
 
+static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		return dev_is_dma_coherent(dev);
+	default:
+		return false;
+	}
+}
+
 static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -1520,6 +1531,7 @@ static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *h
 
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
+	.capable = riscv_iommu_capable,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
