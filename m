Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B15CC6B03
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 05:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERcd7L7AYDKfjeHVBsjr61hNp0szYVaTWSqjAtAkZuk=; b=YnMvueS8J5DvoW
	VWDL1TaKqa74dhxmoGhjZutot87D2UqCmc1W54lfNBFy2S9hcR49VOFYtzAnJV6pBrtCeLWjuHQJu
	LC6oWtGp+fpQp26gYG9kCwzyX7DkTYMawg+7XUyZS+1433fu2yUEW9TsEncDvpEiLuc6VDUeX/g0F
	YrvPHmTrewwnxXj7X9aGot6kqSwuRj6Nq90qEWaLqLaZx4sj1mlZm1v5CZIJE3xWguW7UUU1oPNu/
	jV89xnpFQpUdKxMWZ7fKh6968gOpCYBZ8g423ry3SUlaaKZsisXY1hXbjDhK9e/qaI+RzAERZPSU4
	ne62qHIx5LGzcj1OiI7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVH7-0000000C2AC-0e7o;
	Tue, 13 Oct 2026 05:42:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVH4-0000000C265-0GM1
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 Oct 2026 05:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rd65ljd9yXesQac/jFW5/g1sKZN3hISajAVdGuSexr0=; b=Mdyhk4tr9v+Ay0fyuuPqxLf4tS
	rYLtiMkopb0h9J2BPm+KcPpQvMxh1iXEfKf1efTht71B42cjAgggVW3O/NnDTeuasygSMWnCTxqsr
	D1pxh8tXjZA4R+TdTfGVfsFwiRvxYOhcRQcPhba7rJwaJKqBOz/0tBwKY8KVY++O7nwhSxu7xJgts
	sBrzk5mQtu7krqvN6f3eXE1tnxy+9YtFSKAKiFI51m0mMHozdgsNc0N8wnJOJdSVuh9mL6jkNPvq5
	EexW3V5Nz0DlmEB78fiQKt7U2V9Uc1fG5eidUseGfmlwGQWpWNrtAPkfXm2uwJwkidR1G7z6U6IVt
	KplWKXdg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGVH0-0000000F7gF-24zD
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 05:42:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20lK6988760
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rd65ljd9yXesQac/jFW5/g1sKZN3hISajAVdGuSexr0=; b=BjGhVx1FntWvYtaD
	TyU2KTvHMMl22qHKhKBFeh3bJBxlmq8Xh3CyzU1IOuMa4goYuiMSSO1SDdtxw5sW
	Mqnd74KyCy4JtWXqA7p6NZ/IFMn9AiDKNAc4M+sf+dzde6BfQwk4RO2NzWz9+gZn
	jVhTD+jvBRNqAo/eMo5FWxOdziAUMoISYxj2oj5S7FmAF1HC1qtPH7Zru44OIHW5
	vesN55n9wEYRgsAnXwNMBYTRgPhGB7heOsnYAfGBKB9SEVheemStYtBYY9Pcq1d1
	9PIMQdxs2q1DR12LgRVg2h3falQ4K52r2sBVWVZfJAuOf488WrZPw7O6SDi0cSMW
	SIu+Fg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hc98y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:42:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2204865a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 22:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870120; x=1792474920; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rd65ljd9yXesQac/jFW5/g1sKZN3hISajAVdGuSexr0=;
        b=YDw/4q6rRzWI53dFmshlkSFfI3I2navmuX2aZlUxBeRbA3NQIABJEPBfl1EnsBc28q
         Bowm15H7ylTN9lYdWg9Z7E5npHHMkf6nkRxWAfswJ+iCGFDB3AIPI5/SWGr9zm5ewvqX
         YiY63kx8QtVw6SfazRFVZu77Ul2wCyNZi/5C90baCkjPqdlMUdlvi9BCqZ30vTtnDnS9
         vksifHy0xma9Omo5rmLRagogazShU58vX2kfAwhg4vzw3t30Hek5ZcmQLgsHvw6yQqJT
         9IEF2ktM4gqX6q62A9swj1X5/54YQUDAr2hX4Hh56oz8lRJ3uIZktWIe+fNlUHpP2kCI
         ad+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870120; x=1792474920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rd65ljd9yXesQac/jFW5/g1sKZN3hISajAVdGuSexr0=;
        b=m6Zlw0qO7PlpkLQNeBcIoRQcrfMMkuntr/gNLT8LhAEvZRz0T3JIRZXvIsJHiTSGrd
         UmaRiz8bKUw8P7Vyr/dmu1r/rQrw2lXA9O/85hDu+Q01YtnZT59MLBMegtesx/rBAauc
         xKQ0UuUQd2f1fcvpmBN7Fa67O91AuKvWfRRoLbtLXrueK2AsGGvBCB+TJpu4NjlgJDB8
         FHUzURyJJ7Dimh+xTsUwXSPUd9lx3lQpeZ9K6Tg2IEHG8og8X6bPbNoydfYQW8XTQzh1
         1FDMgzOMVQ3CIQm9pBsiHB+m4cfCGeKms11u/8IvSXJA+B2ltzApEpc+8LukW7JsaFYb
         PY1w==
X-Forwarded-Encrypted: i=1; AKwUvBxnPW+sPZggkFskAnEri6c6pIVyAhEkflWpJQ57yWpUMNnjl9B0v4emXb4bZo48lsOv4oZ+iDUiOIijGA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL+eb9FtYuOZRk4uMf91bnXDTMDL6B9OeLW2K5bmiNTjMWVAE/H
	F3Sx+4Lm5oanghYLvmyXx4pl8UYyk8quxPWSmdoVZ4iQXtpKj5hl0IvgeQtqq9/axmAnMtWy8s3
	82sm1ah8KBhCDO7XN/R7A/w5gGjbjzcnuDLmT/3SfDsp1ySHySDWzg4+Kf5rhvLOcmQ2o1g==
X-Gm-Gg: AYBFou39mw/22Qxlccrd1Qd9mIdKSohQYG4eVG/ftk0BNZxfojhutjW7wXq4p9wwfGv
	Zt6L2UVWrzavwRq8kUXcbjnQycv5tlNp13p0idXVbM+ISJAqMOXhnO7HWVLS6bS28MExJPPVQnk
	gJjzRm+Cv7AjHwC6Nu8gQ/xhmKIqHjewLWti0jkrC+t2M+AgSRwi91czPjpO+pWfLGnWDvKRscv
	p3unbKxw4uJhJA28amF6qv7Qp9uDTS2xGCW3sj4BlVWq4luLt4kU/iTw4HA/cfXPfqi7+8YOKPt
	m5IeFuFASJuL9Wz5kmlxcICf2D/5dg/E5gxtSpGLOQTlC453gex2uLVxpEwoVCSWF8/fsc6vwvq
	phQHsQQm+RPGN2NlY2Wrq/w0Z6OSgibEkI+3tzQxFqn5oj7fQG5p6FoprSg==
X-Received: by 2002:a17:90a:109:b0:3a8:2046:7e5f with SMTP id 98e67ed59e1d1-3ab3a747e69mr6959396a91.12.1791870119625;
        Mon, 12 Oct 2026 22:41:59 -0700 (PDT)
X-Received: by 2002:a17:90a:109:b0:3a8:2046:7e5f with SMTP id 98e67ed59e1d1-3ab3a747e69mr6959373a91.12.1791870119113;
        Mon, 12 Oct 2026 22:41:59 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:58 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:33 -0700
Subject: [PATCH RFC v3 6/9] tee: optee: add RPMI RPC handling
MIME-Version: 1.0
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-6-975b574667e2@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX2nq9IivJsqIx
 bircc302mq9rTuCIeYSKzWjN+r1TEoaRkfLoiizFdsJDynkR4Gb5OYGgQDHSbMFg+vmOZnw2KgP
 7MjQqZ4yRP4Oo5Izp/jtCYL/Kga14AjLAgvH7O7P3JN1OqRe6HuUHEgyGdFOjY/DLkvGtKuJEQk
 +l+gOngcknOZZxEJIEAH9sjgulPMyR/KNGjHzTgImHSJZA1/rYF9WlK3swO4z0xTTy+vx54wkMJ
 lUdClPgQV2DCFpjcqf0+Z8Ir0D+8iNhVGJoz/0D/SHl9Hbp+mJhiixtpSo6nFKo4ZfO0+YiGijr
 6/+4SV+Tj0KJY7LAeknbrmO3dc2utXf4+NTj9sCb0vVPQwgKY6jjs+BDqU1PKX650IIe+b/MfCi
 lBZPyIZ/ab+vXCoviVmqE9FZUkVZ/bEEEwl5nhGh4gS79xYw8nJPWq87eiCxjABfXylQehtz/86
 kDezRuEJgPcXX9Uj+sQ==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdc4a8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6VhrBSHLQm3oGo9yYzUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: cBV1jeypRw7v5_1g3bRdNDcpu1cSiWGM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfXz65sAAXoWO2G
 q2I1AxKP1qd48nGhCln73duRnGywja4+doLfr/UaomGrry1wtRn3dU7NXP4N5l+uC8UxkUtqDtX
 WwB+uCmuPF+lsQYolVCJW6NYW55uzXM=
X-Proofpoint-GUID: cBV1jeypRw7v5_1g3bRdNDcpu1cSiWGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_064203_411963_B9ED187E 
X-CRM114-Status: GOOD (  16.93  )
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

OP-TEE can suspend a yielding call to request services from normal
world through RPC.

Add handlers for shared-memory allocation and free requests. Use the
existing kernel and supplicant allocation helpers, return RPMI parcel
references for allocated memory, and resolve those references when
freeing it.

Route other commands through the common OP-TEE RPC dispatcher. Store
RPC results in the shared arguments for OP-TEE to consume when the
yielding call resumes.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/rpmi_abi.c | 104 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index bbb219ddab38..8b90c3653e80 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -12,6 +12,7 @@
 #include <linux/unaligned.h>
 #include "optee_private.h"
 #include "optee_rpmi.h"
+#include "optee_rpc_cmd.h"
 
 /* Keep transport errors separate from the control status in a response. */
 static int optee_rpmi_call_with_status(struct optee *optee,
@@ -353,3 +354,106 @@ static int optee_rpmi_from_msg_param(struct optee *optee,
 
 	return 0;
 }
+
+static void optee_rpmi_handle_rpc_shm_alloc(struct tee_context *ctx,
+					    struct optee *optee,
+					    struct optee_msg_arg *arg)
+{
+	struct tee_shm *shm;
+	u64 type, size;
+
+	if (arg->num_params != 1 ||
+	    arg->params[0].attr != OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
+		goto err_bad_param;
+
+	type = arg->params[0].u.value.a;
+	size = arg->params[0].u.value.b;
+	if (!size || size > SIZE_MAX - PAGE_SIZE + 1)
+		goto err_bad_param;
+
+	switch (type) {
+	case OPTEE_RPC_SHM_TYPE_APPL:
+		shm = optee_rpc_cmd_alloc_suppl(ctx, size);
+		break;
+	case OPTEE_RPC_SHM_TYPE_KERNEL:
+		shm = tee_shm_alloc_priv_buf(optee->ctx, size);
+		break;
+	default:
+		goto err_bad_param;
+	}
+
+	if (IS_ERR(shm)) {
+		arg->ret = TEEC_ERROR_OUT_OF_MEMORY;
+		return;
+	}
+
+	arg->params[0] = (struct optee_msg_param) {
+		.attr = OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT,
+		.u.pmem.size = tee_shm_get_size(shm),
+		.u.pmem.global_id = shm->sec_world_id,
+		.u.pmem.offs = shm->offset,
+	};
+
+	arg->ret = TEEC_SUCCESS;
+	return;
+
+err_bad_param:
+	arg->ret = TEEC_ERROR_BAD_PARAMETERS;
+}
+
+static void optee_rpmi_handle_rpc_shm_free(struct tee_context *ctx,
+					   struct optee *optee,
+					   struct optee_msg_arg *arg)
+{
+	struct tee_shm *shm;
+	u64 type, global_id;
+
+	if (arg->num_params != 1 ||
+	    arg->params[0].attr != OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
+		goto err_bad_param;
+
+	type = arg->params[0].u.value.a;
+	global_id = arg->params[0].u.value.b;
+	/* SHM_FREE requires a non-NULL identity. */
+	if (!optee_rpmi_nonce(global_id) || arg->params[0].u.value.c)
+		goto err_bad_param;
+
+	shm = optee_shm_handle_map_lookup(&optee->rpmi.shm_map, global_id);
+	if (!shm)
+		goto err_bad_param;
+
+	switch (type) {
+	case OPTEE_RPC_SHM_TYPE_APPL:
+		optee_rpc_cmd_free_suppl(ctx, shm);
+		break;
+	case OPTEE_RPC_SHM_TYPE_KERNEL:
+		tee_shm_free(shm);
+		break;
+	default:
+		goto err_bad_param;
+	}
+
+	arg->ret = TEEC_SUCCESS;
+	return;
+
+err_bad_param:
+	arg->ret = TEEC_ERROR_BAD_PARAMETERS;
+}
+
+/* OP-TEE leaves the shared arguments unchanged while Linux handles the RPC. */
+static void optee_rpmi_handle_rpc_cmd(struct tee_context *ctx,
+				      struct optee *optee,
+				      struct optee_msg_arg *arg)
+{
+	arg->ret_origin = TEEC_ORIGIN_COMMS;
+	switch (arg->cmd) {
+	case OPTEE_RPC_CMD_SHM_ALLOC:
+		optee_rpmi_handle_rpc_shm_alloc(ctx, optee, arg);
+		break;
+	case OPTEE_RPC_CMD_SHM_FREE:
+		optee_rpmi_handle_rpc_shm_free(ctx, optee, arg);
+		break;
+	default:
+		optee_rpc_cmd(ctx, optee, arg);
+	}
+}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
