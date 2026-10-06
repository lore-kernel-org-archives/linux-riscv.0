Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCEECA6001
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 00:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVBS/aJE6QgI4QGMRBwVoGPzEZTSus/PUAr4yZwEl2E=; b=wQh9HAsj/Km0yp
	/4ICcGn9f21Fynj6MCQrmJbW/Z7DF6vyVW6pph9RGlIHbjmVS5ZuXRXWq8PiQPJtiyiWSVWynteU6
	N6MLHuzkgFG0ZOpPJtqa98X2WlJj653HvUiYk2zdXF01AQx9HRXGeENsQhs+1aR7c752mu/m5jjXP
	lxYJR+aVxiTuRUDPqwsEsQVX5PzST6IGNWHqUoLogno+zUJPaNUqRG/Z5cE32QdRJsWYYBkbxXnO8
	Qy8eikf6G/OSJFEBAIsdDeWFfIsyXfUkvz+GWcpUXV70txWYkGlvwAKRW9vC5vK3w4JyjNOtcUeUe
	bcRUrkzPzl/zFdZKm6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtDw-0000000HP5U-2DJV;
	Tue, 06 Oct 2026 00:40:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtDt-0000000HP1l-1GjV
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 00:40:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KNeam3301933
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 00:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wua//ehqYe/k1gM6cXEAgLdAS/bL/RuV3uXFJa/HKLI=; b=h3P+c/Kdq7wfiKNC
	W6FNGDWCulEdDxpm627gK4TtbkaY5u8Tmw1S8yzXKkC04OPMoK3GHoB5492mfomA
	LLLeGOuEqJPn2hd1kWWZftiU0E6H7JuWuci1kNV7sNfZxIiPKzxrgvbOnVYSaWQ+
	uQBjhesYudXfxcIQRDrMslxxmwlOhSbEWFPv5IMLupjMYIQeZ9CnbR5eS+LXLYPq
	b5FRV0WRH6Y/n1c7HOtYQnId9MWg66yfxXvSlQAo9u0CQGTGmtpAgAusVoRdVgKk
	j3nyrloTAM7kx+hzqYcz5wNzMepbUxlOYb/DSs7ivlBhES+Mrmrxui8rhUh8g/l5
	k6gc+Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg2rav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:40:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so5850287eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 17:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247199; x=1791851999; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wua//ehqYe/k1gM6cXEAgLdAS/bL/RuV3uXFJa/HKLI=;
        b=BMRKhAg2kv0PqqNDFW0lzMcapicRbx37tjEZ6rFQzB2X/rDlfkECvQiLWo7XW4fRj+
         cEIHypcm6ubUti2vR0Rohoo0HTHEN2f/QS+iAvfz1f6ueSPC12MuLbj1T56x/bT5+5ES
         RMG0I7wRQDJsXDQBGFc/dkT/iP4USxq6JNHUYVxpUWJ++ixRQrdzckpAPGHf5qgBoXZs
         WHm0rsqEDayDcXoo7m3UkDkCgjFqS2vga36ftsYngB32H09BkfFaIo2Byeno3esOclv6
         pqWmGIoVADiYNRrhrTb6JCD+aNKkaGZPEaN7pOEbIGPHWkZ7sg1a9tF6uJqbNtAr2OZN
         iqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247199; x=1791851999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wua//ehqYe/k1gM6cXEAgLdAS/bL/RuV3uXFJa/HKLI=;
        b=1dj0jQdyGmt92EiZvvDLRO/PzjW/1H72oQ1axmRoO8QIUc1pPYip0RtBDfme8p6AzZ
         h+eCRN4dCb7giSpf6lCnmK1Em/9u5Xb9tNnI5QfqpSFFhUp7GTthqIdqd1MKQvNLoWT+
         SoJCCtFW+zpD2f9Ir8E5SnpzLnWJTlPIHRt3eC7bpyyisthVIlMCrlFjdla5+DMEuBbm
         IA5cviP3aZGYGhJ9plz9BoETKykHgxYqLPN7ldNsiyRk/uD52Dp2xw4IjmeRYijEO/ft
         gC2KDvZrfjxwWxQ9QozdMwsxHPjBEnoOpUW71AXqTCQdSZhI5X4yDyGVcmrBXaA8FYNg
         GAog==
X-Forwarded-Encrypted: i=1; AKwUvBwCxU8/obvoI7hLa2Oum4gCG0s8F+ryRwC4sYr77Pshd89K69GsaeaXaLSmtM/uN1xT7jUO7CYXgS5EgQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKYTm+90flCJqnV/Nz60NjV/ElLAXwVN/B1yPFdxBalGxSiOqkI
	b3RQXDHDdWGzBhwHvBFKXhYu20DUrvHM7S9pQd9nTOWKQ1LcVhev3KuDzJw93oCV2xvuEac7YS8
	24vTo0kcS9idvr60VeLEm1rhccESuISU3jurZ1NUc6PSAdxj1Q6xRzjJTBmqG1rrI5QmtKw==
X-Gm-Gg: AYBFou2BijGFB+2cZYl2NLH1J/GSbS1QfSwwaN7oYRDiVeO5YY1OL5rWQglIMrQ19Vz
	VUyyXYJihzuilkQJuMm575koUuzy9+3h8XEq9aZ1wRF2COUIJr5uuzjC0p1u7/joffLKx7+uybF
	jHxjN1IufYRL8L3dsHg8QiYr498kYWRH1MqdCiYD7+hZi4eyRq3n98XbLAYJlg/1OHAFynyqkqS
	BYAllECMbpaDU0S2yawGNE5bxrXYoTm3oYsl2XjJnmzib05UUHTU0X7maou218kJtTvvYF1A0+n
	HiQH8s/Qiw1hja849VCtydDyY7H62qK7W95UAF9gKJ9+b3OSwUniRtySjqv4f218YzvZCMrVz+B
	yQ13O2g9IpS+2+Fv3//0aF+T2FcbubFEfpnZSioqMrcTTyDzizh1bETFJXg==
X-Received: by 2002:a05:7301:2324:b0:351:fc0:d080 with SMTP id 5a478bee46e88-3510fc0d605mr11956034eec.12.1791247199207;
        Mon, 05 Oct 2026 17:39:59 -0700 (PDT)
X-Received: by 2002:a05:7301:2324:b0:351:fc0:d080 with SMTP id 5a478bee46e88-3510fc0d605mr11955999eec.12.1791247198578;
        Mon, 05 Oct 2026 17:39:58 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:58 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:49 -0700
Subject: [PATCH RFC v2 5/8] tee: optee: add RPMI RPC handling
MIME-Version: 1.0
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-5-72f222e23ec1@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: TV7jXIjEkW2AGVmbETPRLfgOVWIsOI2n
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac44360 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6VhrBSHLQm3oGo9yYzUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX1mImx71e1Ueb
 AjHwr8PGxEr8myl0fNQTY8w3OylSThsRJQ83rlGfVbIg2KaCx9O35+EVj/URZPa7fOJMKzs7Uut
 t1x0XrsM7VKruHufpZtyOQ/YV/udj40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX/+nU0sK37IWb
 NX5C4YTaX/GR3qo96vrOaIQ5nXtALf0/iXy5B/VWt00b0iAH24Rim+VUe+1GkY+0lVwOJXdTUXA
 X+K+8G1VtrSV5cPXDERfVuUIGJ6k/CdpUDQWS3zU4IUQj3MRY/kt9fTYPfWpxsglG7tFj6tM0Fi
 LYKOItaeXp+bqFDX+mJnqY8G16N9rkUxEYGbh9w9gxcIaZ0Ekq6jzH9RjZi+WFrsKSfdGY5RwYy
 UeYO0YIiS63EpjefddY29viHhEUrpkb+7O77cQw4hxZUJoMudmRPSKex59Rlv7IO+oExUKiAYFk
 6NYNLy5y7GnB5V1c4jBYvnYc2WOJma/Y4gFcp2bc8MsaPol4Ca53PQ/mNaY4dmIbmpfmjg1OvTs
 BItHO6lZeSWh6T8TZaQuJADtnHDAn6zLhWmDoyu2PEu7rygzt5CpgUXCjiQOEEIjP6fEznSzQgi
 OTxvO5i8EBUKEXo+8wQ==
X-Proofpoint-GUID: TV7jXIjEkW2AGVmbETPRLfgOVWIsOI2n
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
X-CRM114-CacheID: sfid-20261005_174001_511505_22F59B04 
X-CRM114-Status: GOOD (  15.95  )
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
 drivers/tee/optee/rpmi_abi.c | 109 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
index c29b7ac4552a..58d82678be98 100644
--- a/drivers/tee/optee/rpmi_abi.c
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -13,6 +13,7 @@
 #include <linux/unaligned.h>
 #include "optee_private.h"
 #include "optee_rpmi.h"
+#include "optee_rpc_cmd.h"
 
 /* Nonzero nonce keeps parcel ID zero distinct from a null reference. */
 #define OPTEE_RPMI_SHM_NONCE	1
@@ -451,3 +452,111 @@ static int optee_rpmi_from_msg_param(struct optee *optee,
 	}
 	return 0;
 }
+
+static void optee_rpmi_handle_rpc_shm_alloc(struct tee_context *ctx,
+					    struct optee *optee,
+					    struct optee_msg_arg *arg)
+{
+	u32 parcel_id, nonce;
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
+	optee_rpmi_shm_get_identity(shm, &parcel_id, &nonce);
+	arg->params[0] = (struct optee_msg_param) {
+		.attr = OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT,
+		.u.pmem = {
+			.offs = shm->offset,
+			.size = tee_shm_get_size(shm),
+			.parcel_id = parcel_id,
+			.nonce = nonce,
+		},
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
+	u64 type, parcel_id, nonce;
+
+	if (arg->num_params != 1 ||
+	    arg->params[0].attr != OPTEE_MSG_ATTR_TYPE_VALUE_INPUT)
+		goto err_bad_param;
+
+	type = arg->params[0].u.value.a;
+	parcel_id = arg->params[0].u.value.b;
+	nonce = arg->params[0].u.value.c;
+	if (parcel_id > U32_MAX || nonce > U32_MAX)
+		goto err_bad_param;
+
+	shm = optee_rpmi_get_shm_for_parcel(optee, parcel_id, nonce);
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
