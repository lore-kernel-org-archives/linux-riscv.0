Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA462CA5FFF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 00:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2yZrjD10kGnKJM+rKKj/qeEL0cCh8R5O96rsyyKs3eA=; b=hFRh6E2oHH5a3J
	MwtF3e8n14hj3qsciwu2+tFQuASZOJ5Payl4j/r9AkUtTTBPLGEDtFNr17Uxd/lrflHlshqeMgSyT
	8dImhFhMhZ1TfmcdXth2MSXqhzsKObVkBmjNe91CjeEymHeH8KfA1YkyaJ6bMwzh5wJX5VVWt2CPB
	Uf1vAgbZNkGb9USsPuoeRFL1fZ2ISctMWN1rqR0zQpPjM61JTdjXNVLK7WNRTm2RfgRGFj30/eJc9
	kJoCpHoeFAWqWasUUqyseXLj91mdbXiM6NlMaEg9FnQh4Vl+NTHgwAJoBUjEB516JCFvFMCSaFebX
	N1RhiWBS/VcB/neRSZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtDz-0000000HP99-3t8x;
	Tue, 06 Oct 2026 00:40:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtDx-0000000HP6R-2NJd
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 00:40:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KN0Hk3299819
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 00:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IMtzZeKCMAa+ITg30dZJWQsG6U23gbt3P7bYwJipKpI=; b=WJBHUgB0X3/JGa2J
	bTCFQ/W0ALtJnWq+kuZTmRbg41C6dw160r5JxyfoG5vtdAKFDMajG5UUKQUKSPJb
	+dc5DjZZ/zSIzNRomCYaQs7UKP374pWPbSRJ0gJm4rRsKxY1a03qtQPwj8QUND6g
	ot2lBIIIJF+f4TFnswk6DwZ3StMhrYWMBGo2zYPcg+P5B6JGo3TSwOIw8dAGmdy4
	OXrKebuIr8yDnEtn9ZBpEY7LUwGwFQN+kv8Urk4z3bkETiDmz0go90XEnhlPsQXq
	aPDNk9xElb+rY4y+G4aR0cDJEmwbyCVhceZDZ4QJoRgznVHXoLeWXzXi1jfzRFbT
	rknFog==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg2rbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:40:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ef0362d95so4364987eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 17:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247204; x=1791852004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMtzZeKCMAa+ITg30dZJWQsG6U23gbt3P7bYwJipKpI=;
        b=eu4asY1ZTICDDCmGoaNOO4fW1h0LeLrYqmgpfV6fM7GkqxcS/fASSQXv7HSDeyNe1b
         RZhi5kaH+rgfHYGVmv4mSIAIIO7QXjX7WvdsBuunkuAFOhIaGsdQtqSFGzUFvITEeQAt
         Q6OWdfHSd0eSUuKzAwo/CdXEnKSVlkwn/9rz7fMIW1norwZKDfgDqCFS9zLwmYAEyV4i
         H7qxKuo05lS0QbWjt4e60b7qsVSDJBxCWjkQnvztA18frr9rDSw2B3GIJ9U8NuUkdfv4
         c0ZPApyfFCuC1maTcWyHSh/iCXOnabkyTvxPYHSGyiIEx6mRDWI+MWHmOWf+b3hApFqB
         aaxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247204; x=1791852004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMtzZeKCMAa+ITg30dZJWQsG6U23gbt3P7bYwJipKpI=;
        b=j41SDGhmDfab2LeKmD58eZF7XeneKAv5CTTLBIzESyTslFTVBUF7IpgPSosIn+qK8Z
         dzCLbyd10NUx9waIpOU6fwPuMpOnUMtqwXYyoJ0AzB2jGlZf+L6YeIzlRbkDCrU608Zy
         XwefLeFFb4xq/llgpl6UXCIy03yU7lUA3n0dm09dX3xDR/CvCe7c7WvAvyNBFtRdXtTW
         JAb9qC+oCllR59EqV9YmyMV3YsPZXDDNDMnKVVd8WQC69XezeyfX3nmNzAa7X2qZIjWk
         +kQICScWGGTcMil0LrDzEFnfj6Y5vWvWm5n4mMZlOAJO1JT58ov+kZ8y9IlwgqXUSD4z
         b8Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwjnBedf5oBg6FLGS32H51MOJktyMVBvsSFZPFfd3PN4VU/67zAwt1iRwDddZkLaKwdvfHtW5505lPfIg==@lists.infradead.org
X-Gm-Message-State: AFuF++lR1n4gLo3lseSKYaK0rjNDa3kS6D0cUhrMgkX3QUt3QMtDukx/
	DY8gRxlyrCE/NcUeMKfGud5Hyd/07e2EackD8nSyJyr5NBFCkjYHcPTqkvBf6JFPgd7U8baLv3Z
	ZY7KDgeISgLRvNQhGIxDAN431tmgkc82HStB5VqrWYFtt6Fn3ba6mlJWgugppntxxAm751Q==
X-Gm-Gg: AYBFou1tP4Ku96uqV1Bk6UbxcLD931knvICGzUQVRRDjqaGtzgj3f4YdhipJGDjwACy
	yJ5D/8oTFjh+NlmF5tQ25HVKyHu5NrhalRn1fsHXdDKAbNu4nn8OFBxxxMmd4tXqcvWJjDEXOrA
	40UBGel4Ai/MBUnEf4fiA58tkFjdibBFczAvCkUYMsWzZvKgw3ZmNqCjYRK4ycPPIdjuhpJc+f/
	jhNLjtQNhBeziV/3z9EsC2PlCifvZxmrcgPnz//ayznTZGrBDBh8VWO5koUJLT0F7Ojs4S/HMCo
	siJ2uHI5KOt+C5kgMsGrj3ryShMWVDieKC2IdRo0Zkyf4z6CcowaNfeJLHrkPiIyMoBV80iK8fK
	+kq8RDeStSc/yHakqSjB9i260pt3W09P8uyWLTvwm1vkD8zwTMgtoWbsmJg==
X-Received: by 2002:a05:7301:fc09:b0:34d:755b:d60b with SMTP id 5a478bee46e88-35111514891mr11504994eec.34.1791247203562;
        Mon, 05 Oct 2026 17:40:03 -0700 (PDT)
X-Received: by 2002:a05:7301:fc09:b0:34d:755b:d60b with SMTP id 5a478bee46e88-35111514891mr11504954eec.34.1791247202887;
        Mon, 05 Oct 2026 17:40:02 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:40:01 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:52 -0700
Subject: [PATCH RFC v2 8/8] tee: optee: support RPMI asynchronous
 notification doorbells
MIME-Version: 1.0
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-8-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: zKi77dnLHwInuzl9m7Q2KvfSqDR1HhdV
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac44364 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=nExbU_x0mLWtth5-Sj8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXwvb+Xip8fYfg
 MZBo9xART0Zwce/Vd1zY1+oR70YYOihXqF5HRTwYjemxiV3GxOccHBo2pvkbp97B7/b61tNzuVU
 zd9ZClYGNc6YJp82noB9n3GPxLAomyo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXzhG/MgQziz8A
 8v1GL7A6hp//EQ+MUglUtnXv+JX/COHaP/5rDgYanGr6jTRv2UHNjXGIxKlt+QtXq6jmaNucZbK
 2j56SWH8BnNDlj0/oMegW84PW0wUrp6Wr5k3VNsi+3S866PwsUa4LjTnyg1bF0bxySluW/EQbpd
 LR8m/LcKIrFhjGzUzgyRm/S4gK40g+h+o2envv5+v8WMnLUvGwYdtrCVr3v9IVbqK6LWraSPKpn
 vJbwWNasXx7XU20b5bZfB62B90qckJ7oiT8JMYqkXt7Er7sZGoKuVhn33oXfSZVnqH4SomcjbJz
 UaicNtfdl1EVRAOa7WzxVj9kvAKoNhWTOPgGXBISMNPmeRt1V7n5UZ8NIVhSVWIZsxWmPeLIMIO
 YuPrODG1qq0nTtNvBM9ONNUt+vDMC9K2YbrunzsEB9NzotUKNL9YVHcaxawv1W3IdD5JtvgO7Zf
 9GySSjggulWojs8Sctg==
X-Proofpoint-GUID: zKi77dnLHwInuzl9m7Q2KvfSqDR1HhdV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_174005_748808_FF5592B0 
X-CRM114-Status: GOOD (  17.02  )
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
 drivers/tee/optee/rpmi_abi.c      | 87 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 07c27e322a71..e5c6381bb872 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -190,6 +190,9 @@ struct rpmi_tee_device;
  * @shm_rht: lookup by the host-endian parcel ID and nonce pair
  * @sec_caps: negotiated optional OPTEE_RPMI_CAP_* features
  * @notification_count: negotiated nonzero number of logical notification keys
+ * @signal: allocated TEE-to-REE doorbell, independent of logical keys
+ * @notif_wq: private bottom-half workqueue, NULL when notifications are inactive
+ * @notif_work: processes bottom halves requested by the RPMI signal
  *
  * Callers keep their tee_shm alive while using its registration. Lookup
  * returns a raw pointer; the mutex does not protect its lifetime after
@@ -203,6 +206,9 @@ struct optee_rpmi {
 	struct rhashtable shm_rht;
 	u32 sec_caps;
 	u32 notification_count;
+	u32 signal;
+	struct workqueue_struct *notif_wq;
+	struct work_struct notif_work;
 };
 #endif
 
diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index db541f3de425..ffe44d81e857 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -685,6 +685,88 @@ static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
 	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
 }
 
+/* Yielding bottom halves run here, not in the transport retrieval worker. */
+static void optee_rpmi_notif_work(struct work_struct *work)
+{
+	struct optee_rpmi *rpmi = container_of(work, struct optee_rpmi, notif_work);
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
+	int ret;
+
+	if (!rpmi->notif_wq)
+		return;
+
+	ret = optee_stop_async_notif(optee->ctx);
+	if (ret)
+		dev_warn(&rdev->dev, "stop notifications failed: %d\n", ret);
+
+	ret = rdev->ops->notifier_ops->notify_relinquish(rdev, rpmi->signal);
+	if (ret && ret != -EOPNOTSUPP)
+		dev_warn(&rdev->dev,
+			 "relinquish notification failed: %d\n", ret);
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
+	int ret;
+
+	INIT_WORK(&rpmi->notif_work, optee_rpmi_notif_work);
+	rpmi->notif_wq = alloc_workqueue("optee_rpmi_notif", WQ_UNBOUND, 1);
+	if (!rpmi->notif_wq)
+		return -ENOMEM;
+
+	ret = rdev->ops->notifier_ops->notify_request(rdev,
+						      optee_rpmi_notif_callback,
+						      optee, &rpmi->signal);
+	if (ret) {
+		destroy_workqueue(rpmi->notif_wq);
+		/* Checked in optee_rpmi_async_notif_uninit(). */
+		rpmi->notif_wq = NULL;
+
+		return ret;
+	}
+
+	ret = optee_rpmi_enable_async_notif(optee);
+	if (ret)
+		optee_rpmi_async_notif_uninit(optee);
+
+	return ret;
+}
+
 /* Query and store the trusted OS revision. */
 static int optee_rpmi_get_os_version(struct optee *optee)
 {
@@ -823,6 +905,7 @@ static void optee_rpmi_remove(struct rpmi_tee_device *rdev)
 {
 	struct optee *optee = dev_get_drvdata(&rdev->dev);
 
+	optee_rpmi_async_notif_uninit(optee);
 	optee_remove_common(optee);
 	optee_rpmi_shm_rht_uninit(optee);
 	kfree(optee);
@@ -901,6 +984,10 @@ static int optee_rpmi_probe(struct rpmi_tee_device *rdev)
 
 	optee->ctx = ctx;
 	dev_set_drvdata(&rdev->dev, optee);
+	ret = optee_rpmi_async_notif_init(optee);
+	if (ret)
+		dev_warn(&rdev->dev, "async notifications unavailable: %d\n", ret);
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
