Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F227CC6B03
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 05:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5foqx0vbHYHiGMx4w34taRZAeYbdbwT2kawS2anJoI=; b=QxQ1bsspjXDDfx
	20a27hw0VIvmhD3+C29fDWm5wEytpghbIlnmGONgUN0b5969ujA1GmoOfpUKPkA3Fn05F5bw86Xpo
	IP9pvTv6MGwO1PpFq3G7W26br8rtZU+ihYpGAxH/lzL8YYqqn5xoIjoJ7G2BBCg0pwCNK29HUOB5W
	b+TqireMelzmTXxhyZyfoCpqAdi+lmdgfR/iMJF6lmnBFsXa1itSTE+ddT9RYJjRrnnOFRCUe/xFx
	6+zvIAoCPnwuQ7mqtcuyy49GgFY32gjoNdcz0o+vV8lCfRqYIaxOEH5394+O14AtpRPAacmeVwN2E
	7zksurAM7YRVYJVmkTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVHR-0000000C2Qq-2Icv;
	Tue, 13 Oct 2026 05:42:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVHQ-0000000C2PH-1aEa
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 Oct 2026 05:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EuzD4n98XFQr8qVxMc+ujFNUBJUiJ93/Y53lGr/WPlg=; b=EsUQUtOGuvJ/w6vqVU6GlIcIxW
	Exw9IpqL6qStAnNFW4yX1Ad79o30eSbpNrbPdotcY/0Za0YcGxJPQlofmG+Ndw4ga2UA3Ad7mxbAR
	n004JdIzVI0DghXA48M8vk/NF7Rojc5r57nFb3wKfZvIj15lmmRW5FnvXBNS3anEJuZllqX4SLd15
	+lP7ILsZ0sqMguzN9hL8K084G7JENRlYo4q4kxFiyp9s2NwmNmXuyElE67Pl/u4zpTeZDvPUurtyR
	dtNf+3PMhfNOyPZqzdJdAsOMGXFR/EqgsV8XsQLv5vd0IAfX3M5UnDA3+u/ULf8tsd5PbGg6oGHZT
	avEGPxBw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGVH7-0000000F7hT-00Oj
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 05:42:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21k1T2621163
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EuzD4n98XFQr8qVxMc+ujFNUBJUiJ93/Y53lGr/WPlg=; b=i443NBo2gZptrYak
	t0haq4df02oH/e2IQ5VglKIZOwLdUWmL33Hwa1PCkX5fJOIRThLN+LdzjNJ8iqfV
	ZK79fnjWNkW7UCxwHlXw+gcC5KPpzf475hi83ipMT63fd84YcKPGsgJTJRTCUD1T
	z9GxM/e2zdh4p7+HgR9PxVkHWzJ6sPiG0TYTrzlEnUv9r0TNzn4hwSGJWd4PF+do
	At7g0Y1pMIV+YFFaVqSKMvYAIk+86bdfkBzw4P+fW+0cKU4Ay7XOCZX7FM1JCArj
	5nNURyRYpItAqa7fBAN+oASy9el8qL9r0qRRjwXXGQX8HSLIeOvXz852rO83W6CP
	XpiiBw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcvb8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:42:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39deda201bcso4031723a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 22:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870126; x=1792474926; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EuzD4n98XFQr8qVxMc+ujFNUBJUiJ93/Y53lGr/WPlg=;
        b=bDLN+iNtgyHLF0HfFmWw3i7dIaXy8bh+tufi9znvBcHSTH29DoCJOlquiWa1bvxReV
         fCaT9wSm8YdlGH/3UF+rSPUc0C3d5oYU3oxV8nDv+3X65ujy0sM7oyeyLa4LaiUrgxle
         Gnw2GHx24LI2QDKwtjcnNjjGkt7GTErDm5/85wNl4uGF/u4+wd2Pc2eC4CQSJIPuAmsN
         8ma8w4z5IWgU2+vJORcaErtVj9tE/qFgus6mJqEcWE279su/SCMGK9/yaKSQMadFBdVR
         hmoAANeaF3NxUWKmaR07COvFtIs6E2xnFS6jpDog1zUSdz8fTNq3wLWMqfEDwknNEZNI
         dInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870126; x=1792474926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EuzD4n98XFQr8qVxMc+ujFNUBJUiJ93/Y53lGr/WPlg=;
        b=0gJOcIIU8TkXxB4hu+/oVRYMdmIs991YlzI3xHzyq1zxoE4hCeSjY7mHr1sI5oOfdk
         Bo4sSECCgZDiYsWEFqfKeyyBIzGsD/NPUVpKKtTm4bSGwZ90q5YDUFCqEhQ+nBXzFBts
         Wa1ZD/2zruVvMdY9W/CsG1DH0kTI43OyP+CQM6MDEPenhw/2uPkgKZ771tGF/z6gwW/F
         3HYpq+dEO9MhjanMJpjGNKWTexQz+ZuXHIkEhWTKQH9hT5Xp6TCyrAET0gfob8GbJkyN
         838R3RTOuhKn/J4MEoOLg+NJu/GMKEKk8VUonWzFofUXeV6utBKHumP0FfLcWLSIL0r7
         uuBA==
X-Forwarded-Encrypted: i=1; AKwUvBzuyC3gWQK+PncjoxtLYbJhXdGK+Zy5G7B4Pk9KRe6TBsrfU7H7dK6pzZp7FUeN3NKsU3DvwTYjqumqyA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKfXTgBXxKO9XZxO7RchA5COk+eiWvGLiyxYbIw502H0WaBrNBr
	uVXgMAA0Wn4BJzSATZxJ6uII91gJZA74kzZd0FUMawmdiUd/p/G9xnHdhJM3hvF1/AaJE0x9YtN
	Xzc0k0UlBe4FBtywiVoisJGSiLVrZKQFRuAkd4WZAb3Wrz/JfbpJYEnTeTONjLS+e+YzZQw==
X-Gm-Gg: AYBFou2UkAku1yyBVK2GUiuNfMMskZJtYdXM6X4fB7mjb7LAlJLc8HzDZGF7zpp+c5f
	BZ1goyr/tx9rSBVxo3t2gfasQ+yNTxiR6zmVOrTRAjDDf+ULdMXOqgyqvar+r3YNXcxfJ0Q5leP
	yLrYcRux+oaiznRmjhUDj+xIGgvPwX5ax73HiUSyaUnLW1DiqYeNW1XULgb0VlNrc7LcI9lAFkJ
	GiL4pX7ckCODNLfN0OyWsLUuuqN6tSB4G7M3y0EvsQucJOiu0oXMZNTaNBEo50DG4Z0WYAdqFFT
	roF8YZf11RcZ9mH2PRRcImSgm12i7uaJzLa3V8y5VwPikRseJqoZwdYqSwVV46RZDBLa/Pgiyeg
	L1Jq7D6aCF1eadpTMm+MLNO2bu5jxlESWL2L5uOReHyBVtisypEKjMUs5CQ==
X-Received: by 2002:a17:90b:3d92:b0:3a8:5cab:ff5 with SMTP id 98e67ed59e1d1-3ab3ab1fa22mr10874791a91.43.1791870126258;
        Mon, 12 Oct 2026 22:42:06 -0700 (PDT)
X-Received: by 2002:a17:90b:3d92:b0:3a8:5cab:ff5 with SMTP id 98e67ed59e1d1-3ab3ab1fa22mr10874775a91.43.1791870125744;
        Mon, 12 Oct 2026 22:42:05 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:42:05 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:36 -0700
Subject: [PATCH RFC v3 9/9] tee: optee: support RPMI asynchronous
 notification doorbells
MIME-Version: 1.0
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-9-975b574667e2@oss.qualcomm.com>
References: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
In-Reply-To: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: Fg527vE2iXKYoYf248jBNhvtM116UJYb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX6nse/9ebHFpv
 p592t6+DroX/RLu2VZI/Y/SSCJb6ZlPsP4+LTJPzL8JpSl5Am1FpC4uFMlGS3CQTIkgmiy1iVlX
 dk5CzOw8PrcS5dBq1MY/KVA6GxILWv4=
X-Proofpoint-ORIG-GUID: Fg527vE2iXKYoYf248jBNhvtM116UJYb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX6cZag2N9vk0j
 Dza4TNbr4J/tyqiC0w0Q0GtOWayUNebl1ROvR5pMAe7LlmctD/ZYg+iycE9Ws/cGOhJ9dRB/Did
 gkQ2r6U1JR+Avxpg1TCBRgqeBTKCMautypAYP6BfLoRiGEfvt5XD8iRr5vCZTRWWBY+hJkKLqlx
 9/gusUlXb+GqjYOtPFU0Hi8JKeSoT6tTmmhRk0ZurfnbhjcV03Gz3FnkLCbVUFplWcUYHJvExKX
 iWB9087bkyS/W8TrjswPldatrMVm10dkcLlZFf5ufbZ+Z0INHhX5rqe4B4N5V2oscumdpDgQSSt
 qZAFAOCYxbiTH5HRnz8OwYek2pnD1fWZMG2ycN1+BebRwxerpIvyzItNV0FKI54m2V6v36Trfzs
 6kO26ppG5IBvD7bp2iHFWSzgbz/swOhzBP9GitcYvVkN93r2z0117/H9hRsDmVkKZteUCIQ2JKr
 VeK7KcYbxqNN2hURxLQ==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acdc4af cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_064211_846898_7DE31FC7 
X-CRM114-Status: GOOD (  16.85  )
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

OP-TEE uses asynchronous notifications to request bottom-half
processing in normal world without waiting for a client call.

Allocate a TEE-to-REE RPMI signal and pass its ID to OP-TEE when
enabling asynchronous notifications. Queue bottom-half processing on
a private workqueue.

Initialize notification delivery before publishing the TEE devices.
Allow probe to continue if setup fails, keeping synchronous RPC
notifications available.

On cleanup, request that OP-TEE stop asynchronous notifications,
relinquish the signal and drain the bottom-half workqueue. Transport
relinquishment does not synchronize an already-selected callback.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/optee_private.h |  6 +++
 drivers/tee/optee/rpmi_abi.c      | 92 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index fcb291a43b7b..3bc65ffb6f99 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -207,11 +207,17 @@ struct optee_ffa {
  * @rdev: owning RPMI service device
  * @shm_map: lookup by the host-endian parcel ID and nonce pair
  * @nonce_ida: nonzero SHM nonces, reusable after successful parcel reclamation
+ * @signal: allocated TEE-to-REE doorbell, independent of logical keys
+ * @notif_wq: private bottom-half workqueue, NULL when inactive
+ * @notif_work: processes bottom halves requested by the RPMI signal
  */
 struct optee_rpmi {
 	struct rpmi_tee_device *rdev;
 	struct optee_shm_handle_map shm_map;
 	struct ida nonce_ida;
+	u32 signal;
+	struct workqueue_struct *notif_wq;
+	struct work_struct notif_work;
 };
 #endif
 
diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index 0ed2de96758e..6434767a2249 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -580,6 +580,92 @@ static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
 	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
 }
 
+/* Yielding bottom halves run here, not in the transport retrieval worker. */
+static void optee_rpmi_notif_work(struct work_struct *work)
+{
+	struct optee_rpmi *rpmi = container_of(work, struct optee_rpmi,
+					    notif_work);
+	struct optee *optee = container_of(rpmi, struct optee, rpmi);
+
+	optee_do_bottom_half(optee->ctx);
+}
+
+static void optee_rpmi_notif_callback(struct rpmi_tee_device *rdev, u32 signal,
+				      void *cb_data)
+{
+	struct optee *optee = cb_data;
+
+	queue_work(optee->rpmi.notif_wq, &optee->rpmi.notif_work);
+}
+
+/* Relinquish is not a barrier for an already-selected transport callback. */
+static void optee_rpmi_async_notif_uninit(struct optee *optee)
+{
+	struct optee_rpmi *rpmi = &optee->rpmi;
+	struct rpmi_tee_device *rdev = rpmi->rdev;
+	int rc;
+
+	if (!rpmi->notif_wq)
+		return;
+
+	rc = optee_stop_async_notif(optee->ctx);
+	if (rc)
+		dev_warn(&rdev->dev, "stop notifications failed: %d\n", rc);
+
+	rc = rdev->ops->notifier_ops->notify_relinquish(rdev, rpmi->signal);
+	if (rc && rc != -EOPNOTSUPP)
+		dev_warn(&rdev->dev,
+			 "relinquish notification failed: %d\n", rc);
+
+	destroy_workqueue(rpmi->notif_wq);
+
+	rpmi->notif_wq = NULL;
+}
+
+/* Enable OP-TEE's bottom-half doorbell using the reserved RPMI signal. */
+static int optee_rpmi_enable_async_notif(struct optee *optee)
+{
+	struct optee_rpmi_enable_notif_req req = {
+		.op = cpu_to_le32(OPTEE_RPMI_ENABLE_ASYNC_NOTIF),
+		.signal_id = cpu_to_le32(optee->rpmi.signal),
+	};
+	struct optee_rpmi_status_resp resp;
+
+	return optee_rpmi_call(optee, &req, sizeof(req), &resp, sizeof(resp));
+}
+
+static int optee_rpmi_async_notif_init(struct optee *optee)
+{
+	struct optee_rpmi *rpmi = &optee->rpmi;
+	struct rpmi_tee_device *rdev = rpmi->rdev;
+	struct workqueue_struct *wq;
+	int rc;
+
+	INIT_WORK(&rpmi->notif_work, optee_rpmi_notif_work);
+	wq = alloc_workqueue("optee_rpmi_notif", WQ_UNBOUND, 1);
+	if (!wq)
+		return -ENOMEM;
+
+	rpmi->notif_wq = wq;
+
+	rc = rdev->ops->notifier_ops->notify_request(rdev,
+						     optee_rpmi_notif_callback,
+						     optee, &rpmi->signal);
+	if (rc) {
+		destroy_workqueue(rpmi->notif_wq);
+		/* Checked in optee_rpmi_async_notif_uninit(). */
+		rpmi->notif_wq = NULL;
+
+		return rc;
+	}
+
+	rc = optee_rpmi_enable_async_notif(optee);
+	if (rc)
+		optee_rpmi_async_notif_uninit(optee);
+
+	return rc;
+}
+
 /* Query and store the trusted OS revision. */
 static int optee_rpmi_get_os_version(struct optee *optee)
 {
@@ -720,6 +806,7 @@ static void optee_rpmi_remove(struct rpmi_tee_device *rdev)
 {
 	struct optee *optee = rpmi_tee_dev_get_drvdata(rdev);
 
+	optee_rpmi_async_notif_uninit(optee);
 	optee_remove_common(optee);
 	optee_shm_handle_map_uninit(&optee->rpmi.shm_map);
 	ida_destroy(&optee->rpmi.nonce_ida);
@@ -807,6 +894,11 @@ static int optee_rpmi_probe(struct rpmi_tee_device *rdev)
 
 	rpmi_tee_dev_set_drvdata(rdev, optee);
 
+	rc = optee_rpmi_async_notif_init(optee);
+	if (rc)
+		dev_warn(&rdev->dev, "async notifications unavailable: %d\n",
+			 rc);
+
 	if (optee->in_kernel_rpmb_routing)
 		blocking_notifier_chain_register(&optee_rpmb_intf_added,
 						 &optee->rpmb_intf);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
