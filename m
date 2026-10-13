Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE919CC6B0A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 05:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rnTQ2SdU+50o1VgH6MXVyylQH9kFPNBQV29sL/fvFqo=; b=HcrLRiiGXQYBl2
	XdxjhN99QlnsZ1yvCEmMlOW6AB8mG7CgzjZBc1WcJvptZbkV/s6kuj1axgo7PhBpo5S9Dkj7+Xx9b
	bZ2Ni79kMfv2q08ZH7pL2LSXmDOgXcPVxRuIJzsiubhLjQAp2UeU5F+VuTmwfHSRy9KTkA26bhGuB
	53lbaRosZA+nVBTZg/6u5BQ3+ZBkm09+j3dRmn4m1bjDTO8TmR+zztrx6fpTpvBbkQLYLgE+dErYj
	9XIvuB7QZ8DWeZ3+BlzayWvzbKdcFocGJyNlKwrVP+D0vXbPV50Vmb4gbZY25/1OMW6I0L82IPcwf
	oUJveby8hadQJmAmOc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVH9-0000000C2Bz-15qV;
	Tue, 13 Oct 2026 05:42:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVH7-0000000C2AB-3FwP
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 Oct 2026 05:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HcNd2IlEKJzNOkdFebRLg0raV2gMq1sWftz0bNxKsos=; b=b9c6Bu5LfF2TEPe8Ki+i/YVIrx
	C8pJSkHu+Mct3f1RieEfOW7QFhcu+FqWZ2kuGoBx38x/NEg38hz5SQIh13zoggGOoHmPGwU40cNeX
	FKx853Q9+DCix2oMxtuppsdOESW5W68yVWeiEjK8dudyJCCyrzq61RmuKPtxYsUdwGjS/rzVNs2nh
	wA8dBrRENho7nqu61dcQ0NXm0v56aqy0sFAVbGSOlutNomflrviu6FF3bF1agpmvHRCyi+j01JLum
	+Cll1zRgNGzGvhE9uht7zHy5FnzarUP+sirW53QVkKksfXds+2I53ZwwyPKL63TZ1YXfBiEq+BOC1
	F2DsHAWQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGVH3-0000000F7gh-2z2D
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 05:42:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21N8C3509571
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HcNd2IlEKJzNOkdFebRLg0raV2gMq1sWftz0bNxKsos=; b=h3wuXcy7W5oqq1HK
	w80XrogfnSKQCrpuWz6MsLhiOpOgyO2bIOc/hTPoDIUUFvRNI6mdZbMJdCPCVdbZ
	sU2AZ89qI9B6Apo0iQWVvcjvWr+2snoHoJ312AO0TWhzBHx0gQ1NAbNmzoe/rbBJ
	sEBS0r1zdQOiHCu0k4J+N7Tg2Io3URmVWy/Puhv08o0U4xI+g1NQ7hAyierFvZuT
	qHZ4K44mc1CVfjoJURUedT2QGkznFAuPeHwYJ0HfEzT2Cj/tZ3fh3HoxeMeZ0cho
	xIRR5jfkqU8ipuAyLdWL4o2+ZizeEiesheEU6eeS8x9QFHY1cQSLVa2xryyYNaTh
	dEFNdw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc4fe5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:42:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so4183745a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 22:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870123; x=1792474923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcNd2IlEKJzNOkdFebRLg0raV2gMq1sWftz0bNxKsos=;
        b=UALLonnBqmSbN7CbSUMFylx/J7epSXhaIIREnz3a7nQvkZiUk+0fSYunXa43ZBuOqn
         VjHC6gN9DamUUh2IdaNZeOdI27GKrEbb5CxOLgerx4Q4nh4kME8CaAm1tGXU4K2l/lmG
         rb+pnCz1p7GQhDOg4XUwF4v4IMMmXJQ5sSc8M0gcOnnChBGlUV2NVhn0Xwm4gUxD819J
         +IsU9yw/B7NvRs4SJwMVaWiQRNNeHtSJLdKDODcDNfZN8vvp7U4uW8kaAe9PIeNbi8Uv
         qQliQ7ixOVLsdaexL+1JIx8jIJjwz+Npc90GOjmgp+XZdoDpqRFLjEZge7ZMIi1boVd8
         dVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870123; x=1792474923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcNd2IlEKJzNOkdFebRLg0raV2gMq1sWftz0bNxKsos=;
        b=O1TJm53nZ07AnJvgk5MhTl7glrr+HF1l2mzqNGEik653jSq9OM/62XXeLLzqScDTgB
         lXRZpcVDZNfrkgC7rv8jXbgA2sagiSPsIZMjS+j5zzUeJ9ZcHY2sQGIP+XcNXv52MSUt
         FASERJR/9uyAcDcyGjEGP6FEFKvjekXhjoTklkSssihGwd0x2fZbwQtFCYaMfuVC1eQh
         NrScftelch1ociSmvGX09x3LwhUAGxn+G1fBUmLFrv13U1wCrc7Im42Yh3fhZF3+I4Hk
         UuO1g1uBCSW6dfLqYlOfxEo6IuKEjL5n5Fo6vpr717cG8QBVyAMf3lHZJwK1DDWgrg7X
         9iZA==
X-Forwarded-Encrypted: i=1; AKwUvBz5qAyPzWgmByw5JEnLR4+GgHODBtA/BUKwhInHKTmOVDHCQl44i97Dloa4C0NXP56F9qxaq+6IirwNrA==@lists.infradead.org
X-Gm-Message-State: AFq9FYK2ii+JT0pdVL7V0FJi+MYuMPb1aSZLkAelkqJuBh+fZm59Awpf
	pOonXxBeIG5FgGkrHI4MVBrMVVIvL6oMCQMlfW24zr86iHsifkiMxBzK+uVkWEuS7q+EPLhwM21
	FXz01Rxi8z+Wt1uVZxg9PuhVtpqAsGYyvgIIUk4geIaDzwOz0wfYmmWaiPWTuteTsTzgHIQ==
X-Gm-Gg: AYBFou3c5T8zib0GP3q099HinDjohJhESnDGWRPVT1Us7drCCEMVPlJYSVQ+n92QnJt
	sbg/Z+IbsCowRPIt8Yp5+SSm1hiU0jZ62fJ1/png4qobEHGJnQIjoOO+XZfvh5xjIiHrTDZAtOo
	S2RuLjDlkh+jjwNf4/YqMASDXE7NIyipVmQwhapQ/frbWFSW1+QimRRR0qla440MDx7qn6OnNrJ
	HrJ3ZbtD4fWzbnJUpS/jsrf108odiwAegx1sUiAFSuQplIrxDO6n7gX2kIZA9Ipl+JVhsd/Vve+
	UHLQBASQbA9uTl3vGUP3zeAkUniLq6xHheeXG1FmMh0yb2r6CtC971H2e+hAbkojfhCEf6ZDBCX
	duOlJjCgqVs28DA2LYXO7s5sJaQ3n7w2qCCtiYyy82P/F12LyeyicKdq31g==
X-Received: by 2002:a17:90b:224c:b0:3a4:9c30:425 with SMTP id 98e67ed59e1d1-3ab3ab20a11mr10348958a91.44.1791870123159;
        Mon, 12 Oct 2026 22:42:03 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:3a4:9c30:425 with SMTP id 98e67ed59e1d1-3ab3ab20a11mr10348924a91.44.1791870122630;
        Mon, 12 Oct 2026 22:42:02 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:42:00 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:34 -0700
Subject: [PATCH RFC v3 7/9] tee: optee: execute yielding RPMI calls
MIME-Version: 1.0
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-7-975b574667e2@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX+rjr+FTPE/04
 wgMmcaRs1nQtrFhc5O2GntRHKEvvRWkZYQXfnMaSBQ7NPYOBqixSg7DHQ2NUQchInXhmFScUu4Z
 NA7F6indDXqwEX+XVrs/FVmU16jn/hk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX5po3z/kTvksM
 BIytih4kputPaYHaDLCwsOP0rLbARgZSXyBdIkxtVy+d7b1qRR4GRINptmwMnN4CZQBNDU4QcTK
 lKGgUfe993DWMNAO5PdgGon6FtngWcbwPAOhOGSuLF/2F84I6o10W6s62eDAysPPp+aYlmwOE+M
 SZS2c/35ZItypZZ2ufqYIjzend116sXRo4dmJnDTBNgCoGt1BIaqoc5cRZ8c7c6Lbv6nyiWNJhR
 e39GTkJk34oVyqIWt8VAd9uLr0RUl05WcS1m29xPEUCx47moiitJedvY2hFIsWQ1nZfFztZuDTY
 mpm0sSFWhUBhojmlyw8Qe64LqBu61abZ/kUyTZ0BiYeIG4TROKL+solHXAG7GPhza2Mi0B07DLE
 +jQ/bbkxKccXCuOLc8YGsuMMLeCxr4bRzMg7TC2zhsDgnM8Fj+CMQOhwRgFCFZRhXygYrXYZwF6
 i/XihS8KzZKpdHnbMWw==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acdc4ab cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=aLZfyF7oQ8oiUT2OKIMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: K4g7OW9woGogdB_v0xsmPQNArFrfBwQk
X-Proofpoint-GUID: K4g7OW9woGogdB_v0xsmPQNArFrfBwQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_064206_678217_5245C0F0 
X-CRM114-Status: GOOD (  17.90  )
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

OP-TEE commands can span multiple exchanges with normal world. A call
may yield to request an RPC service or allow interrupt processing
before continuing execution in secure world.

Add the RPMI yielding-call path used by the common OP-TEE session
operations. Submit the command and RPC argument buffers as ranges
within a shared memory parcel.

Handle RPC requests while the call is suspended and resume execution
using the token returned by OP-TEE until the command completes.

Use the common OP-TEE call queue to wait when an initial request is
rejected with TEE_ERROR_BUSY, allowing another active call to complete
before retrying.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 122 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index 8b90c3653e80..9a6439e15a33 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -8,6 +8,7 @@
 #include <linux/mailbox/riscv-rpmi-message.h>
 #include <linux/overflow.h>
 #include <linux/rpmi_tee.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 #include "optee_private.h"
@@ -457,3 +458,124 @@ static void optee_rpmi_handle_rpc_cmd(struct tee_context *ctx,
 		optee_rpc_cmd(ctx, optee, arg);
 	}
 }
+
+/* Handle RPC command or interrupt returns from a yielding call. */
+static void optee_rpmi_handle_rpc(struct tee_context *ctx, struct optee *optee,
+				  u32 result, struct optee_msg_arg *arg)
+{
+	switch (result) {
+	case OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD:
+		optee_rpmi_handle_rpc_cmd(ctx, optee, arg);
+		break;
+	case OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT:
+		break;
+	default:
+		pr_warn("Unknown RPC func 0x%x\n", result);
+		break;
+	}
+}
+
+/**
+ * optee_rpmi_yielding_call() - submit and resume a yielding RPMI command
+ * @ctx: calling context
+ * @req: initial command request
+ * @rpc_arg: shared RPC argument buffer
+ * @system_thread: caller requests TEE system thread support
+ *
+ * Only TEE_ERROR_BUSY rejection of the initial command permits retry.
+ *
+ * Return: zero on completion, or a negative error.
+ */
+static int optee_rpmi_yielding_call(struct tee_context *ctx,
+				    const struct optee_rpmi_call_req *req,
+				    struct optee_msg_arg *rpc_arg,
+				    bool system_thread)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct optee_rpmi_resume_req resume = {
+		.op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_RESUME),
+	};
+	struct optee_rpmi_call_resp resp;
+	struct optee_call_waiter waiter;
+	bool resuming = false;
+	u32 result, status;
+	int rc;
+
+	optee_cq_wait_init(&optee->call_queue, &waiter, system_thread);
+	while (true) {
+		if (resuming)
+			rc = optee_rpmi_call_with_status(optee, &resume,
+							 sizeof(resume),
+							 &resp, sizeof(resp),
+							 &status);
+		else
+			rc = optee_rpmi_call_with_status(optee, req,
+							 sizeof(*req),
+							 &resp, sizeof(resp),
+							 &status);
+		if (rc)
+			goto done;
+
+		switch (status) {
+		case TEEC_SUCCESS:
+			break;
+		case TEEC_ERROR_BUSY:
+			if (!resuming) {
+				optee_cq_wait_for_completion(&optee->call_queue,
+							     &waiter);
+				continue;
+			}
+
+			fallthrough;
+		default:
+			rc = -EIO;
+			goto done;
+		}
+
+		result = le32_to_cpu(resp.result);
+		if (result == OPTEE_RPMI_YIELDING_CALL_RETURN_DONE)
+			goto done;
+
+		cond_resched();
+		optee_rpmi_handle_rpc(ctx, optee, result, rpc_arg);
+
+		resume.resume_token = resp.resume_token;
+		resuming = true;
+	}
+done:
+	optee_cq_wait_final(&optee->call_queue, &waiter);
+
+	return rc;
+}
+
+/* The caller supplies SHM with room for command and RPC args. */
+static int optee_rpmi_do_call_with_arg(struct tee_context *ctx,
+				       struct tee_shm *shm, u_int offs,
+				       bool system_thread)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct optee_msg_arg *arg, *rpc_arg;
+	struct optee_rpmi_call_req req = {
+		.op = cpu_to_le32(OPTEE_RPMI_YIELDING_CALL_WITH_ARG),
+		.global_id = cpu_to_le64(shm->sec_world_id),
+	};
+	size_t arg_size, rpc_size, rpc_offset;
+
+	arg = tee_shm_get_va(shm, offs);
+	if (IS_ERR(arg))
+		return PTR_ERR(arg);
+
+	arg_size = OPTEE_MSG_GET_ARG_SIZE(arg->num_params);
+	rpc_size = OPTEE_MSG_GET_ARG_SIZE(optee->rpc_param_count);
+	rpc_offset = offs + arg_size;
+	rpc_arg = tee_shm_get_va(shm, rpc_offset);
+	if (IS_ERR(rpc_arg))
+		return PTR_ERR(rpc_arg);
+
+	req.arg_offset = cpu_to_le64((u64)shm->offset + offs);
+	req.rpc_offset = cpu_to_le64((u64)shm->offset + rpc_offset);
+	req.arg_size = cpu_to_le32(arg_size);
+	req.rpc_size = cpu_to_le32(rpc_size);
+
+	return optee_rpmi_yielding_call(ctx, &req, rpc_arg, system_thread);
+}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
