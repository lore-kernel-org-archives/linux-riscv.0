Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05C2CA600E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 03:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRHZkq77FXksjF/7Wtp3O6YEyQst1byYJQf74CXbwjs=; b=SIQOXKzhYmCpw7
	T5UM1f59V1U+zow7ZAT8+p2Eg8tTsEuKnogGc9Cp7jLxFM04tRa8PbCRa2BYWNE+KsG1ThaqwqC1X
	a0v5Tu5zpgLkW4QNFoLLN2I4Ka0FYOvN8o+INz5PuWgoTgtCUwSklv0C2dLP5/enjQQVjS/uK4FHE
	aPYEaTqE1b9A9UiJh6QBvcurUaxkfOaTlLGa50IJruzQ6sLxj4jMDltXzTI4RHgYNd+4mXH3WLqKm
	KdMf8W1ktTLombl7gia+FREW1dhajAXhGJ5QHK4f0K0F/+AMtBqvzd/VsSx5jWjgbiVk3kR4i1Opd
	EF/2ZSH2k47rjFu/k6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoT-00000003Rxz-2m3q;
	Thu, 08 Oct 2026 03:28:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoR-00000003RvA-1ZSR
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 03:28:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hoxa4187003
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 03:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mApVFjc9rhNzsGXcLCP/umDupri6qQf4ON6W11wUO6o=; b=e0uQRsbMNM1GTMkf
	mqDIqtYpWvndDndgkwyOQJb48yWJ5yfhAIKztKOzBu//TC5mk4Nf8YhbOr2XcB/Z
	4Na0nbpmTzS9oqQElhyPIPqSgD96t8j4sp35cixqBIaBVDOkxLsPUAXcZ9wwKG2h
	QwCMxr5pKbxDuo1QNJhx9hTlLvhvwopCLrufxvEtWROhKcOFkM9bZq2ElM/aQ0As
	WgLE9t8dv6s7AKoljuV/3Uy/RAbrKbAbxH2Ek/XZL+c3E7VzxWIlbdsa77665shL
	UekeiVvudhEmytOrsk9B+Gcyahmn448KhnEWDA3izRTgIbUY9tgKhRtNGqn49UkI
	m2AKGQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe30uny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 03:28:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so8988562eec.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 20:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430134; x=1792034934; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mApVFjc9rhNzsGXcLCP/umDupri6qQf4ON6W11wUO6o=;
        b=NiWa2etAQ0x0//+Od4fAuw1aRrDSLZZJ2Cg9EIruAPMuyu/D3rQSwkgKc0fx3QbCS2
         Fkkt4lrSFsYYqElLYS1P5yzZDrTmQ9axu2EcKwNVRdUIHeTDz86YEKF3bGLIsQ/HXk2N
         M4phCFnSjNts4yvmTi/I2LA6nNzpJwg2m9koTw2ApKkZ8D9SYr+CXC3BvWadynvs1j14
         X7pcsoosBRKssx3/KfPuIbWwEUUftoltQuoXXD7DcSzj9VaSAsusNRx4LYMvow2npv7h
         0VuguHpXSUliADbk3pee469VIe8vvFj5vA/T+ZPLeFMBDEBMVrReAOexqS86Eo7P2FNo
         K5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430134; x=1792034934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mApVFjc9rhNzsGXcLCP/umDupri6qQf4ON6W11wUO6o=;
        b=B835684a5v0DEVBSpwj7UjGO7FHwC/x/hV/ZtTuoRFPGnJ1zevmAU22BBJ7d9npUvs
         4giKu9Pqv/y+N/FI1u0rkDKoncnl5aDvBobKbprKSauQoRq3UuYLzkANjCiFdKxYzXdH
         G/CDxagR36GKBAqmV5rAn7Z1MJWC04cOyOJvrqyioY8mpTiwpt78QZAHtKQWtYuT2r1u
         SmsJs8rWVt6UZb7VoEf5JXmEEmy5kiMYgL6dDHVZ03FOdJJCJNPqgT8mf/uTsmB9YuKh
         nLOVjDk538qQHocLzaroqZC77O7M2Qef7LAVvO56KLCJKbCeWR2BI7xZWctrto1R86tl
         k5CQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMUb99YHMMaaGiyNAbkarYci8UbgqWidXGzBV7pA12C+cpQAV2xErMe6FKR+3/r/4Wc1JbKyBKcsAImQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lr6/X2pgOER56cbOWrp5/syn3kAY8KN9pn5wfIj+4g1/kkDPdd
	TZWwDWXKKppbMlbyQBtpGo6tk/HfBVDMHk2Zx4763lvfnfTGWcq4sr5919018YhMF1eKaYPq/5G
	ukNcS6fsyGjrBFLxJCsgUlhzj0gLwH29U2VJDzaaxKdxl7451YU1WlNllxXgWjtnSUcXfRA==
X-Gm-Gg: AYBFou0iQlcIDltiXD/tAqUyxQE5i11V8J/An7WoupvPGJnt12QdVE2A6Y/P0npMjFE
	7tzBhrKTew40X4bDgc29zroOUa2o66zKoBf1v4jtVz0rZEkXIGjRzAB+228FH0QgCIUSSKtup1D
	9uIeYcWIdyvChZ7/LJJwcUnFiWNZYf7q3t+diaOM/80odiemD733eziH+nBQco/vYecFtxUvVbW
	qH6vr3Ux0Mnp/Np+gtkNxIhb0h2sHhsZ40F7rutAX4x3Lbq0sR6q1EwOh9VV843Fqbnahjev2ck
	7S9aH+5VPHUwBeRNXDm4qqbpgHcgcjKSt3poNsWtmLPY11RxzCBUDD8dMnJ4qxbvnCcn5ScSu7B
	LjE1dLxwTkkairMwxxo3X+qlqNe0N212sIYIkVnQk1BZWxAAlP74ouCFFLw==
X-Received: by 2002:a05:693c:4143:20b0:343:8d77:1d97 with SMTP id 5a478bee46e88-3515de5db65mr5691053eec.39.1791430133821;
        Wed, 07 Oct 2026 20:28:53 -0700 (PDT)
X-Received: by 2002:a05:693c:4143:20b0:343:8d77:1d97 with SMTP id 5a478bee46e88-3515de5db65mr5691012eec.39.1791430133132;
        Wed, 07 Oct 2026 20:28:53 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:52 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 20:27:15 -0700
Subject: [PATCH RFC v2 09/10] firmware: riscv: rpmi-tee: add memory parcel
 operations
MIME-Version: 1.0
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-9-45939a13d223@oss.qualcomm.com>
References: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
In-Reply-To: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Rahul Pathak <rahul@summations.net>,
        Anup Patel <anup@brainfault.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amirreza Zarrabi <amrzar@gmail.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, op-tee@lists.trustedfirmware.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX514SBSMswNEK
 zR+Oq9uhyBNq485RoW6QoZ9nzuMI1wfoFpKXOXf/ejp249jTan/PRVp72UQADZcieWPqhBbsaKw
 DT/SNZWLpmK8QZgspipPeTdRP9m6ovtmnJ84hwbu5G7bt9OaIsVvRNlivdjMkuJROzaLepsRDWH
 /KT+K1E0qm/WoqkfevquerjVKu7+ZI/8OnFnbWrdVIk1w2BIDqzvDuNreTD7/zUbyWzfq7yid8+
 ks3VfVsFh0iYnjvAaxJYqFrpFxKBxzBDZPOSQtHjIzWBFrwPiZYPp8PgRfHqj5qz4z07SNeme7N
 a0bA0/Li3iLjY1DAuH2cjqoHZPj5Da/reG2w0XFsX3hiFJBjJTjXb7nI4JXoljB/bw0Zlbrbxg5
 U0UZ4i/0J1zWMhrsCz7J0spJQa5F3ERJn3/9KEoOEisgRLWVdQ9l9fBMPYGuJFU9xUennDu3sFq
 b9HQGpAJrhCjL0gbSdg==
X-Proofpoint-ORIG-GUID: 935A0rwniql8X4fhdcSKyr3HE9zNDCTY
X-Proofpoint-GUID: 935A0rwniql8X4fhdcSKyr3HE9zNDCTY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX7JeQQRFwGgtW
 G2Al/xpG9H9B1owQiEXy/mwvz0vy2RhfsGgt+4E4x6UXil2OdSi99DbE+FlWbs6ddUCKMDpwI5k
 ldqkq/O3d2DI5HU+iOlLVVQGnlpNX6s=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac70df6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZqXtgL2Ob53jORvibrgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_202855_460581_23D74600 
X-CRM114-Status: GOOD (  20.54  )
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

Add memory lending, sharing and reclamation through RPMI memory parcels
so service drivers can exchange memory with TEE endpoints.

Support segmented parcels when memory descriptions exceed the mailbox
payload limit, respecting the firmware's limit on concurrent segmented
operations.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/riscv_rpmi_tee/driver.c           | 477 +++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h |   6 +
 include/linux/rpmi_tee.h                           |  58 +++
 3 files changed, 541 insertions(+)

diff --git a/drivers/firmware/riscv_rpmi_tee/driver.c b/drivers/firmware/riscv_rpmi_tee/driver.c
index b43a09f5e853..690561ed949d 100644
--- a/drivers/firmware/riscv_rpmi_tee/driver.c
+++ b/drivers/firmware/riscv_rpmi_tee/driver.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/rpmi_tee.h>
+#include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 
@@ -27,6 +28,20 @@
 #define RPMI_TEE_MEMORY_FEATURE_TEE_ONLY		1
 #define RPMI_TEE_MEMORY_FEATURE_FULLY_SUPPORTED	2
 
+/* TEE_CALL memory-access flags and block format. */
+#define RPMI_TEE_ACCESS_READ			BIT(29)
+#define RPMI_TEE_ACCESS_WRITE			BIT(30)
+#define RPMI_TEE_ACCESS_EXEC			BIT(31)
+
+#define RPMI_TEE_MEM_PAGE_SHIFT			12
+#define RPMI_TEE_MEM_PAGE_SIZE			BIT(RPMI_TEE_MEM_PAGE_SHIFT)
+#define RPMI_TEE_BLOCK_MAX_PAGES		4096
+
+/* TEE_MEMORY_PARCEL_CREATE flags. */
+#define RPMI_TEE_PARCEL_MULTI_SEGMENT	BIT(31)
+
+/* TEE_MEMORY_SEGMENT_SEND flags. */
+#define RPMI_TEE_SEGMENT_LAST		BIT(31)
 /**
  * struct rpmi_tee_probe_features_req - TEE_PROBE_FEATURES request
  * @feature_id: TEE feature identifier to query.
@@ -73,11 +88,116 @@ struct rpmi_tee_call_resp {
 	u8 service_data[];
 } __packed;
 
+/**
+ * struct rpmi_tee_parcel_create_req - MEMORY_PARCEL_CREATE request prefix
+ * @creator_id: Endpoint identifier creating the parcel.
+ * @creator_access: Creator's residual access permissions.
+ * @receiver_count: Number of receiver endpoint and access pairs in @data.
+ * @flags: Parcel creation flags.
+ * @nonce: Caller-provided parcel nonce.
+ * @block_count: Number of memory blocks included in this request.
+ * @label: Caller-provided parcel label.
+ * @data: Receiver endpoint IDs, receiver access values, then memory blocks.
+ */
+struct rpmi_tee_parcel_create_req {
+	__le32 creator_id;
+	__le32 creator_access;
+	__le32 receiver_count;
+	__le32 flags;
+	__le32 nonce;
+	__le32 block_count;
+	u8 label[16];
+	u8 data[];
+} __packed;
+
+#define RPMI_TEE_PARCEL_CREATE_SIZE \
+	(sizeof(struct rpmi_tee_parcel_create_req))
+/* Size of one RECEIVER_ID[] and ACCESS[] entry pair. */
+#define RPMI_TEE_PARCEL_CREATE_RECEIVER_INFO_SIZE	(2 * sizeof(__le32))
+/* Size of one BLOCK_HIGH[] and BLOCK_LOW[] entry pair. */
+#define RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE		(2 * sizeof(__le32))
+
+/* Store one receiver in adjacent RECEIVER_ID[] and ACCESS[] arrays at @data. */
+static inline void rpmi_tee_put_receiver(u8 *data, u32 count, u32 index,
+					 u32 id, u32 access)
+{
+	put_unaligned_le32(id, data + index * sizeof(__le32));
+	put_unaligned_le32(access, data + (count + index) * sizeof(__le32));
+}
+
+/* Store one block in adjacent BLOCK_HIGH[] and BLOCK_LOW[] arrays at @data. */
+static inline void rpmi_tee_put_block(u8 *data, u32 count, u32 index,
+				      u32 high, u32 low)
+{
+	put_unaligned_le32(high, data + index * sizeof(__le32));
+	put_unaligned_le32(low, data + (count + index) * sizeof(__le32));
+}
+
+/**
+ * struct rpmi_tee_parcel_create_resp - MEMORY_PARCEL_CREATE response
+ * @status: RPMI completion status.
+ * @parcel_id: Identifier assigned to the new parcel.
+ */
+struct rpmi_tee_parcel_create_resp {
+	__le32 status;
+	__le32 parcel_id;
+} __packed;
+
+/**
+ * struct rpmi_tee_segment_send_req - MEMORY_SEGMENT_SEND request prefix
+ * @parcel_id: Identifier of the partially created parcel.
+ * @flags: Segment flags.
+ * @block_count: Number of memory blocks in @data.
+ * @data: Memory block address and size pairs.
+ */
+struct rpmi_tee_segment_send_req {
+	__le32 parcel_id;
+	__le32 flags;
+	__le32 block_count;
+	u8 data[];
+} __packed;
+
+#define RPMI_TEE_SEGMENT_SEND_SIZE \
+	(sizeof(struct rpmi_tee_segment_send_req))
+/* Size of one BLOCK_HIGH[] and BLOCK_LOW[] entry pair. */
+#define RPMI_TEE_SEGMENT_SEND_BLOCK_SIZE	(2 * sizeof(__le32))
+
+/**
+ * struct rpmi_tee_parcel_reclaim_req - MEMORY_PARCEL_RECLAIM request
+ * @parcel_id: Identifier of the parcel to reclaim.
+ */
+struct rpmi_tee_parcel_reclaim_req {
+	__le32 parcel_id;
+} __packed;
+
+/**
+ * struct rpmi_tee_parcel_reclaim_resp - MEMORY_PARCEL_RECLAIM response
+ * @status: RPMI completion status.
+ * @flags: Reclaim result flags.
+ */
+struct rpmi_tee_parcel_reclaim_resp {
+	__le32 status;
+	__le32 flags;
+} __packed;
+
 struct rpmi_tee_child {
 	struct list_head node;
 	struct rpmi_tee_device *rdev;
 };
 
+struct rpmi_tee_block_iter {
+	struct scatterlist *sg;
+	phys_addr_t address;
+	size_t length;
+};
+
+struct rpmi_tee_parcel_xfer {
+	struct rpmi_tee_block_iter iter;
+	u32 parcel_id;
+	u32 block_count;
+	u32 next_block;
+};
+
 /* rpmi_tee_send_with_status() - Send an RPMI TEE service request. */
 int rpmi_tee_send_with_status(struct rpmi_tee_transport *priv, u32 service_id,
 			      const void *req, size_t req_len, void *resp,
@@ -326,6 +446,355 @@ static int rpmi_tee_op_call(struct rpmi_tee_device *rdev, const void *req,
 	return 0;
 }
 
+/* MEMORY_PARCEL_RECLAIM. */
+static int rpmi_tee_memory_reclaim(struct rpmi_tee_transport *priv,
+				   u32 parcel_id)
+{
+	struct rpmi_tee_parcel_reclaim_req req = {
+		.parcel_id = cpu_to_le32(parcel_id),
+	};
+	struct rpmi_tee_parcel_reclaim_resp resp;
+	size_t resp_len = sizeof(resp);
+	int ret;
+
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_MEMORY_PARCEL_RECLAIM, &req,
+			    sizeof(req), &resp, &resp_len);
+	if (ret)
+		return ret;
+
+	if (resp_len != sizeof(resp))
+		return -EPROTO;
+
+	return 0;
+}
+
+static int rpmi_tee_op_memory_reclaim(struct rpmi_tee_device *rdev,
+				       u32 parcel_id)
+{
+	return rpmi_tee_memory_reclaim(rpmi_tee_device_to_transport(rdev),
+				       parcel_id);
+}
+
+/**
+ * rpmi_tee_count_blocks_sg - Count RPMI memory blocks in an SG list
+ * @sg: First SG entry describing the memory to share or lend.
+ * @count_out: Returns the number of RPMI memory blocks.
+ *
+ * Validates that every entry represents one or more whole 4 KiB pages. An
+ * RPMI memory block represents at most @RPMI_TEE_BLOCK_MAX_PAGES pages.
+ *
+ * Return: 0 on success, or a negative error code.
+ */
+static int rpmi_tee_count_blocks_sg(struct scatterlist *sg, u32 *count_out)
+{
+	struct scatterlist *entry;
+	u32 count = 0;
+
+	if (!sg)
+		return -EINVAL;
+
+	for (entry = sg; entry; entry = sg_next(entry)) {
+		phys_addr_t address = sg_phys(entry);
+		size_t blocks;
+
+		if (!entry->length ||
+		    !IS_ALIGNED(address, RPMI_TEE_MEM_PAGE_SIZE) ||
+		    !IS_ALIGNED(entry->length, RPMI_TEE_MEM_PAGE_SIZE))
+			return -EINVAL;
+
+		/* One RPMI block describes at most 4096 pages. */
+		blocks = DIV_ROUND_UP(entry->length >> RPMI_TEE_MEM_PAGE_SHIFT,
+				      RPMI_TEE_BLOCK_MAX_PAGES);
+		if (blocks > U32_MAX - count)
+			return -EOVERFLOW;
+
+		count += blocks;
+	}
+
+	*count_out = count;
+
+	return 0;
+}
+
+static void rpmi_tee_block_iter_init(struct rpmi_tee_block_iter *iter,
+				     struct scatterlist *sg)
+{
+	iter->sg = sg;
+	iter->address = 0;
+	iter->length = 0;
+}
+
+/* Encode the next RPMI memory block from an SG iterator. */
+static bool rpmi_tee_block_iter_next(struct rpmi_tee_block_iter *iter,
+				     u32 *high, u32 *low)
+{
+	u32 pages;
+
+	if (!iter->length) {
+		if (!iter->sg)
+			return false;
+		/* Next SG. */
+		iter->address = sg_phys(iter->sg);
+		iter->length = iter->sg->length;
+		iter->sg = sg_next(iter->sg);
+	}
+
+	/* RPMI memory block represents at most @RPMI_TEE_BLOCK_MAX_PAGES pages. */
+	pages = min_t(size_t, iter->length >> RPMI_TEE_MEM_PAGE_SHIFT,
+		      RPMI_TEE_BLOCK_MAX_PAGES);
+
+	*high = upper_32_bits(iter->address);
+	*low = lower_32_bits(iter->address) | (pages - 1);
+
+	iter->address += (phys_addr_t)pages << RPMI_TEE_MEM_PAGE_SHIFT;
+	iter->length -= (size_t)pages << RPMI_TEE_MEM_PAGE_SHIFT;
+
+	return true;
+}
+
+static int rpmi_tee_fill_blocks(struct rpmi_tee_block_iter *iter, u8 *data,
+				u32 count)
+{
+	u32 high, low, i;
+
+	for (i = 0; i < count; i++) {
+		if (!rpmi_tee_block_iter_next(iter, &high, &low))
+			return -EINVAL;
+
+		rpmi_tee_put_block(data, count, i, high, low);
+	}
+
+	return 0;
+}
+
+/* Convert memory access flags RPMI_TEE_MEM_ACCESS_* to RPMI_TEE_ACCESS_*. */
+static u32 rpmi_tee_access(u32 mem_access)
+{
+	u32 tee_access = 0;
+
+	if (mem_access & RPMI_TEE_MEM_ACCESS_READ)
+		tee_access |= RPMI_TEE_ACCESS_READ;
+	if (mem_access & RPMI_TEE_MEM_ACCESS_WRITE)
+		tee_access |= RPMI_TEE_ACCESS_WRITE;
+	if (mem_access & RPMI_TEE_MEM_ACCESS_EXEC)
+		tee_access |= RPMI_TEE_ACCESS_EXEC;
+
+	return tee_access;
+}
+
+static int rpmi_tee_reserve_segment_slot(struct rpmi_tee_transport *priv)
+{
+	int ret = 0;
+
+	guard(mutex)(&priv->mem.lock);
+	if (priv->mem.multisegment_active == priv->mem.multisegment_max)
+		ret = -EBUSY;
+	else
+		priv->mem.multisegment_active++;
+
+	return ret;
+}
+
+static void rpmi_tee_release_segment_slot(struct rpmi_tee_transport *priv)
+{
+	guard(mutex)(&priv->mem.lock);
+	priv->mem.multisegment_active--;
+}
+
+/* Send the remaining blocks of a segmented memory parcel. */
+static int rpmi_tee_parcel_send_segments(struct rpmi_tee_transport *priv,
+					 struct rpmi_tee_parcel_xfer *xfer)
+{
+	while (xfer->next_block < xfer->block_count) {
+		size_t req_len;
+		u32 count;
+		int ret;
+
+		count = min_t(u32, xfer->block_count - xfer->next_block,
+			      (priv->mbox.max_msg_data_size -
+				RPMI_TEE_SEGMENT_SEND_SIZE) /
+				RPMI_TEE_SEGMENT_SEND_BLOCK_SIZE);
+		if (!count)
+			return -EMSGSIZE;
+
+		req_len = RPMI_TEE_SEGMENT_SEND_SIZE +
+			RPMI_TEE_SEGMENT_SEND_BLOCK_SIZE * count;
+
+		struct rpmi_tee_segment_send_req *req __free(kfree) =
+			kzalloc(req_len, GFP_KERNEL);
+		if (!req)
+			return -ENOMEM;
+
+		/* INIT request. */
+		req->parcel_id = cpu_to_le32(xfer->parcel_id);
+		req->flags = cpu_to_le32(xfer->next_block + count ==
+					 xfer->block_count ?
+					 RPMI_TEE_SEGMENT_LAST : 0);
+		req->block_count = cpu_to_le32(count);
+		ret = rpmi_tee_fill_blocks(&xfer->iter, req->data, count);
+		if (ret)
+			return ret;
+
+		ret = rpmi_tee_send(priv, RPMI_TEE_SRV_MEMORY_SEGMENT_SEND,
+				    req, req_len, NULL, NULL);
+		if (ret)
+			return ret;
+
+		xfer->next_block += count;
+	}
+
+	return 0;
+}
+
+/* Create a memory parcel after the caller has validated its operation. */
+static int rpmi_tee_parcel_create(struct rpmi_tee_transport *priv,
+				  struct rpmi_tee_mem_args *args)
+{
+	struct rpmi_tee_parcel_create_resp resp;
+	struct rpmi_tee_parcel_xfer xfer;
+	size_t blk_off, req_len, resp_len;
+	bool segmented;
+	int ret;
+	u32 i;
+
+	ret = rpmi_tee_count_blocks_sg(args->sg, &xfer.block_count);
+	if (ret)
+		return ret;
+
+	/* BLOCK_HIGH[] follows the request header and receiver arrays. */
+	blk_off = RPMI_TEE_PARCEL_CREATE_SIZE + args->receiver_count *
+		RPMI_TEE_PARCEL_CREATE_RECEIVER_INFO_SIZE;
+
+	/* Limit the initial request to the parcel's actual block count. */
+	xfer.next_block = min((priv->mbox.max_msg_data_size - blk_off) /
+			      RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE,
+			      xfer.block_count);
+
+	segmented = xfer.next_block < xfer.block_count;
+	if (segmented) {
+		if (!priv->mem.multisegment_max)
+			return -EOPNOTSUPP;
+		/* Reserve a slot against the firmware's advertised limit. */
+		ret = rpmi_tee_reserve_segment_slot(priv);
+		if (ret)
+			return ret;
+	}
+
+	req_len = blk_off + RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE * xfer.next_block;
+
+	struct rpmi_tee_parcel_create_req *req __free(kfree) =
+		kzalloc(req_len, GFP_KERNEL);
+	if (!req) {
+		ret = -ENOMEM;
+		goto out_release_slot;
+	}
+
+	rpmi_tee_block_iter_init(&xfer.iter, args->sg);
+
+	/* INIT request. */
+	req->creator_id = cpu_to_le32(priv->self_id);
+	req->creator_access = cpu_to_le32(rpmi_tee_access(args->creator_access));
+	req->receiver_count = cpu_to_le32(args->receiver_count);
+	req->flags = cpu_to_le32(segmented ? RPMI_TEE_PARCEL_MULTI_SEGMENT : 0);
+	req->nonce = cpu_to_le32(args->nonce);
+	req->block_count = cpu_to_le32(xfer.next_block);
+	memcpy(req->label, args->label, sizeof(req->label));
+
+	for (i = 0; i < args->receiver_count; i++) {
+		u32 tee_access = rpmi_tee_access(args->receivers[i].access);
+		/* Store RECEIVER_ID[i] and ACCESS[i]. */
+		rpmi_tee_put_receiver(req->data, args->receiver_count, i,
+				      args->receivers[i].endpoint_id,
+				      tee_access);
+	}
+
+	ret = rpmi_tee_fill_blocks(&xfer.iter,
+				   req->data + 8 * args->receiver_count,
+				   xfer.next_block);
+	if (ret)
+		goto out_release_slot;
+
+	resp_len = sizeof(resp);
+	ret = rpmi_tee_send(priv, RPMI_TEE_SRV_MEMORY_PARCEL_CREATE,
+			    req, req_len, &resp, &resp_len);
+	if (ret)
+		goto out_release_slot;
+	if (resp_len != sizeof(resp))
+		return -EPROTO;
+
+	xfer.parcel_id = get_unaligned_le32(&resp.parcel_id);
+	/* Send remaining blocks as segments. */
+	ret = rpmi_tee_parcel_send_segments(priv, &xfer);
+	if (ret) {
+		/* On error, retain the slot as firmware may still hold it. */
+		if (rpmi_tee_memory_reclaim(priv, xfer.parcel_id)) {
+			dev_warn(priv->dev, "failed to abort parcel %#x\n",
+				 xfer.parcel_id);
+
+			return ret;
+		}
+	} else {
+		args->parcel_id = xfer.parcel_id;
+	}
+
+out_release_slot:
+	if (segmented)
+		rpmi_tee_release_segment_slot(priv);
+
+	return ret;
+}
+
+/* MEMORY_PARCEL_CREATE. */
+static int rpmi_tee_op_parcel_create(struct rpmi_tee_device *rdev,
+				     struct rpmi_tee_mem_args *args, bool lend)
+{
+	struct rpmi_tee_transport *priv = rpmi_tee_device_to_transport(rdev);
+	u32 i;
+
+	if (!args || !args->receivers || !args->receiver_count)
+		return -EINVAL;
+
+	/* LEND relinquishes creator access, whereas SHARE retains it. */
+	if (lend ? args->creator_access : !args->creator_access)
+		return -EINVAL;
+
+	if (args->creator_access & ~RPMI_TEE_MEM_ACCESS_MASK)
+		return -EINVAL;
+	for (i = 0; i < args->receiver_count; i++) {
+		if (args->receivers[i].access & ~RPMI_TEE_MEM_ACCESS_MASK)
+			return -EINVAL;
+	}
+
+	if (lend ? !priv->mem.lend_ok : !priv->mem.share_ok)
+		return -EOPNOTSUPP;
+
+	/* A parcel must contain at least one BLOCK_HIGH/BLOCK_LOW pair. */
+	if (priv->mbox.max_msg_data_size < RPMI_TEE_PARCEL_CREATE_SIZE +
+	    RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE)
+		return -EMSGSIZE;
+
+	/* Check if receiver's info fit after reserving room for one block. */
+	if (args->receiver_count >
+	    (priv->mbox.max_msg_data_size - RPMI_TEE_PARCEL_CREATE_SIZE -
+	     RPMI_TEE_PARCEL_CREATE_BLOCK_SIZE) /
+	    RPMI_TEE_PARCEL_CREATE_RECEIVER_INFO_SIZE)
+		return -EMSGSIZE;
+
+	return rpmi_tee_parcel_create(priv, args);
+}
+
+static int rpmi_tee_op_memory_lend(struct rpmi_tee_device *rdev,
+				   struct rpmi_tee_mem_args *args)
+{
+	return rpmi_tee_op_parcel_create(rdev, args, true);
+}
+
+static int rpmi_tee_op_memory_share(struct rpmi_tee_device *rdev,
+				    struct rpmi_tee_mem_args *args)
+{
+	return rpmi_tee_op_parcel_create(rdev, args, false);
+}
+
 static const struct rpmi_tee_info_ops rpmi_tee_info_ops = {
 	.msg_limits_get = rpmi_tee_op_msg_limits_get,
 };
@@ -334,9 +803,16 @@ static const struct rpmi_tee_msg_ops rpmi_tee_msg_ops = {
 	.call = rpmi_tee_op_call,
 };
 
+static const struct rpmi_tee_mem_ops rpmi_tee_mem_ops = {
+	.memory_lend = rpmi_tee_op_memory_lend,
+	.memory_share = rpmi_tee_op_memory_share,
+	.memory_reclaim = rpmi_tee_op_memory_reclaim,
+};
+
 static const struct rpmi_tee_ops rpmi_tee_ops = {
 	.info_ops = &rpmi_tee_info_ops,
 	.msg_ops = &rpmi_tee_msg_ops,
+	.mem_ops = &rpmi_tee_mem_ops,
 };
 
 static void rpmi_tee_unregister_devices(struct rpmi_tee_transport *priv)
@@ -431,6 +907,7 @@ static int rpmi_tee_transport_probe(struct platform_device *pdev)
 	priv->dev = &pdev->dev;
 	platform_set_drvdata(pdev, priv);
 	INIT_LIST_HEAD(&priv->devices);
+	mutex_init(&priv->mem.lock);
 	priv->mbox.client.dev = &pdev->dev;
 	priv->mbox.client.tx_sync = true;
 	priv->mbox.chan = mbox_request_channel(&priv->mbox.client, 0);
diff --git a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
index 0c3cfa0f14ec..4df47d52724a 100644
--- a/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
+++ b/drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h
@@ -8,6 +8,7 @@
 
 #include <linux/list.h>
 #include <linux/mailbox_client.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/uuid.h>
 
@@ -19,6 +20,9 @@
 #define RPMI_TEE_SRV_PROBE_DOMAIN	0x04
 #define RPMI_TEE_SRV_PROBE_ENDPOINT	0x05
 #define RPMI_TEE_SRV_CALL		0x18
+#define RPMI_TEE_SRV_MEMORY_PARCEL_CREATE	0x0e
+#define RPMI_TEE_SRV_MEMORY_PARCEL_RECLAIM	0x11
+#define RPMI_TEE_SRV_MEMORY_SEGMENT_SEND	0x12
 
 struct rpmi_tee_notif_state {
 	u32 feature;
@@ -31,7 +35,9 @@ struct rpmi_tee_mbox {
 };
 
 struct rpmi_tee_mem_state {
+	struct mutex lock;
 	u32 multisegment_max;
+	u32 multisegment_active;
 	bool lend_ok;
 	bool share_ok;
 };
diff --git a/include/linux/rpmi_tee.h b/include/linux/rpmi_tee.h
index a76055149996..10f6cae4a3a7 100644
--- a/include/linux/rpmi_tee.h
+++ b/include/linux/rpmi_tee.h
@@ -10,6 +10,7 @@
 
 #include <linux/device.h>
 #include <linux/module.h>
+#include <linux/scatterlist.h>
 #include <linux/types.h>
 #include <linux/uuid.h>
 
@@ -70,10 +71,67 @@ struct rpmi_tee_msg_ops {
 		    size_t req_len, void *resp, size_t *resp_len);
 };
 
+/* Access permissions used by memory parcel operations. */
+#define RPMI_TEE_MEM_ACCESS_READ	BIT(0)
+#define RPMI_TEE_MEM_ACCESS_WRITE	BIT(1)
+#define RPMI_TEE_MEM_ACCESS_EXEC	BIT(2)
+#define RPMI_TEE_MEM_ACCESS_MASK	(RPMI_TEE_MEM_ACCESS_READ | \
+					 RPMI_TEE_MEM_ACCESS_WRITE | \
+					 RPMI_TEE_MEM_ACCESS_EXEC)
+
+/* One receiver's access rights for a memory parcel. */
+struct rpmi_tee_mem_receiver {
+	/* RPMI endpoint identifier of the receiver. */
+	u32 endpoint_id;
+	/* Bitwise OR of RPMI_TEE_MEM_ACCESS_* permissions. */
+	u32 access;
+};
+
+/* Arguments used to create a memory parcel. */
+struct rpmi_tee_mem_args {
+	/* Scatterlist describing whole, 4 KiB-aligned memory pages. */
+	struct scatterlist *sg;
+	/* Array of @receiver_count parcel receivers. */
+	const struct rpmi_tee_mem_receiver *receivers;
+	/* Number of entries in @receivers. */
+	u32 receiver_count;
+	/* Creator permissions retained by a SHARE operation. */
+	u32 creator_access;
+	/* Implementation-defined value carried in the parcel descriptor. */
+	u32 nonce;
+	/* Implementation-defined 16-byte parcel label. */
+	u8 label[16];
+	/* Returned firmware-assigned parcel identifier on success. */
+	u32 parcel_id;
+};
+
+/* RPMI TEE memory-parcel operations. */
+struct rpmi_tee_mem_ops {
+	/**
+	 * @memory_lend: Lend the pages described by @args to its receivers. The
+	 *	creator must not retain access, so @args->creator_access must be zero.
+	 */
+	int (*memory_lend)(struct rpmi_tee_device *rdev,
+			   struct rpmi_tee_mem_args *args);
+	/**
+	 * @memory_share: Share the pages described by @args with its receivers.
+	 *	The creator retains the nonzero permissions in
+	 *	@args->creator_access.
+	 */
+	int (*memory_share)(struct rpmi_tee_device *rdev,
+			    struct rpmi_tee_mem_args *args);
+	/**
+	 * @memory_reclaim: Reclaim the parcel identified by @parcel_id after all
+	 *	receivers have relinquished it.
+	 */
+	int (*memory_reclaim)(struct rpmi_tee_device *rdev, u32 parcel_id);
+};
+
 /* RPMI TEE transport operation groups. */
 struct rpmi_tee_ops {
 	const struct rpmi_tee_info_ops *info_ops;
 	const struct rpmi_tee_msg_ops *msg_ops;
+	const struct rpmi_tee_mem_ops *mem_ops;
 };
 
 extern const struct bus_type rpmi_tee_bus_type;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
