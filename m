Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F931CA9ED0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 05:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3wgz88zLUy4v5C/KnMnKGXsWGIGpmPrRKOFtWPNxIq4=; b=Am0Kro+9NllsAh
	QUHqUfSMo0zguXc200g4fpJn8v2NZY1h/GNvblosxPg+pncGHcAXCpSg1A1QxcLLYwn4Cu5CqTnVx
	X5oTnnCvKS4UpdmV78dCHw9ggl7nPPbsTO9Qqkqp6b+Xpxvk85pmHRHX3hW/JemQWDO+e1hkKVRUS
	40yFZTbbAyhLTKORcTzuzarqogyXyqXvxiZ6TEUmssCilG4mzqBnZrwkDS4ONNCNW+SwuqVe1t3RS
	GNCVs4GvwKUEZdnQLLSmREScEzhYiCYhSe+BfUIZb/olHMFyWu2gAbgoC1jk2sYjb+0NF8O+okciI
	u8a7Ms2rRX+rtUMtqT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVH4-0000000C26Y-04z5;
	Tue, 13 Oct 2026 05:42:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVH2-0000000C24t-1fKK
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 Oct 2026 05:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ypuDZSakPalBX7M4x+LFJr9Z+MgpyzNsrKt1TNFFTZ8=; b=YKPK4KxlDyWmRD3pymMnZr01Be
	8ibN6Kvy+Sw2dRAfvpuUqIs6wkZp+NJdX/6L9q+U8FgmtgxP5bSDEkaTrTw+0Z3YvfqUhlPQCWrin
	HlTxghyx+fYrB+u093UiP7wDxKwBHjU/eywQ24pifN7CPz407CmmSARoSUNpIZ5hdnEMhgkQE/Uo0
	exJ5xeWb2G0qUwVnGRUHKnJ0Jqcr1V7cL/dHAcaODE59lkzGSoW6Bq8vdVu5TeEmZ4zjplD40aBVO
	Bp6TKX1IFhz47XpYiFEKBC91rioPlHzwYKtC7qKAMk8waV54QUQClv5dvmslsPhuU/cvxo1TsKDPv
	e/Zom7dA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGVGx-0000000F7fJ-2sQ6
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 05:42:02 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D211Pq989018
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ypuDZSakPalBX7M4x+LFJr9Z+MgpyzNsrKt1TNFFTZ8=; b=TJ7+nHzN42EAS1or
	gzAMXvBNTrwpNYzBkPt/S/D/gXxqPGlSEWDF8zFaCAU/YIZldv6yXSBoscE7w1aP
	u2ZLmR+lZSagyuMaxhEDzHfJyrzsJHQ6GTzVzqlri1qLt9imnmbR7XZ6EQlQnJ9J
	66LTK2C+KbV3HvvcL+2VIDT+nweaIhuY0yIbX5WuamFQ19K6Imr66lCmhQRZUc9V
	ajEy0NhHFfE89puJyCzzn7TohyqJ30n6kA5GD1kyRqJUPhBFuN8GADM+3p7SLSD1
	7VEEWJLofA59tScCVquCvCJAlJADEqJMkEIyqQSpGNXVIXnLD/uYq3wk7J2bjnht
	4t89oQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hc98xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:41:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab1e771632so3105479a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 22:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870113; x=1792474913; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypuDZSakPalBX7M4x+LFJr9Z+MgpyzNsrKt1TNFFTZ8=;
        b=D788HEheBTrn7SiWrqYdCT7dWeMYX2W0MLNpstCZa2c7a6Gvkdev7C+SktL/gCjjHt
         7/6256XvpdmiGAOMdD//kgxVj9dwiyuLPgbOFR1lxvXI7p740Gh690qmEY8YoWpAGvZy
         ggGyDRYpktMSH2SXgvHEmVURTcUw33kAE4Lw0Mla1yY4vmdbqSiREkt+lpF1CRCqb0zr
         pQX7fq5ZW2h/UowRYukmsy18UHArugYL3ptVhtX4GkHVwhC4MPXwUKXZjRMmTCCw4o7L
         Pp0vQgz0a489Z2XedYr1l2pFdbS9/C6ZDv4n6oPmrFEHZ7+hIM8xYM8EhqKRGOVatdir
         PxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870113; x=1792474913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypuDZSakPalBX7M4x+LFJr9Z+MgpyzNsrKt1TNFFTZ8=;
        b=UwfJHZ8THzvyZuLppBHZxcNS8tB2do9XMpL+uQJqSLxD32KJpwCdIM2B/gbdZ4KgdD
         uHUq+KFbqXgQ+VeEE6yATqHjNPW01mkNXuSbauFJSRy9gavbPmWP89j7sfSwoqDxInOC
         XEttG00qanxZ3HqocLDsbAeenSo4l4KtYvawPOyfvZPEWxLR1EbMcHh2dLs1u5zUf7Go
         MaGu72fNvqFQPXSI0ChU2cPkWdik7iKQ7oY9ntYTS8F7mU4Sr9uzPGnLv9E1voLLUtMB
         n3r2L2DM1dIENlkItBscHD417HcsaSey7xgmGFBIJLW2wKKqL5fep96ewgKkrpvduQ0x
         mHDw==
X-Forwarded-Encrypted: i=1; AKwUvByXsBgsZ8IUiFYCS/rZYrA+A7QjaiLTxL0oUKMGEsxwF3OWthbjgwMngIheJ/GINgJXLPTrSr70qpznbQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2JE/ekhwsJUpqYZLVoEDVe6F2ow39MR7jXkSdBTXG7lgqTJ/T
	is+O6GfYLWSiH3hwNLLNF8JXK82BZ1gplZONM3CXE84Qui5SBkW9z2hCildHTZq0uH48sKLkPtr
	wW83Kcz0ajwjQpw+QgpETSFZ+TZXhpv0gA8rpTK5UM4cIElXQjAcDuMcBP8DupCRfsuPhCSVB16
	mzPA==
X-Gm-Gg: AYBFou3NShHkFk5/TY20QAKP6KRF6Wo2lIigwe4TS8xRwMpu7WfV5LsY2CH+OPCLSEJ
	0i7c6bLV4VD7/sjCuMpD5mMS0e39UoZgLWFj6NGLebjJXeuWSns/E5bPmnbyByAnl5aPvncYt7J
	uV4dGLAWvy8YhHiGxPPyHkvjdmHIqotWPs+ph8XD5nH42dwJr6gF8+/xjTOXr0PMgWPsTkBCjn4
	3ozM0NxAXzybn+GAomTUfAdVFd7N1DPh5mZ6FGGNs4ihqHrZh5jrbjsad3TwekEzKmuhYEqeWIs
	vwGFgzA3J4NW126g307I0WG2tnZUye1QC6skSKjBt3prjt/UAbF3HQwGQfbtWXtbuBNqRr5Kpkc
	VfXHmkXU9XSCjkEsKtZ0oRZbSoVljaKRMMTg/EabO/gokEeePdCYeH/uvhQ==
X-Received: by 2002:a17:90b:3c0f:b0:3ab:b764:8256 with SMTP id 98e67ed59e1d1-3abb7649df1mr4161358a91.17.1791870112902;
        Mon, 12 Oct 2026 22:41:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0f:b0:3ab:b764:8256 with SMTP id 98e67ed59e1d1-3abb7649df1mr4161339a91.17.1791870112091;
        Mon, 12 Oct 2026 22:41:52 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:51 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:30 -0700
Subject: [PATCH RFC v3 3/9] tee: optee: define the RPMI control and
 parcel-reference ABI
MIME-Version: 1.0
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-3-975b574667e2@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfXzCaZli16WClU
 iGutb/eg4lUyorhPM5OFIfQE3o6Axs8wnDrsqiGrRt6Fb32aqUHobQOYmKdx3L0oYOvnA2HkLWl
 IhsB58H8sMuEPRNiv9pQ1W4F+KoYofx4rpudUrIS3UKvxUK5YlUlD0a6pSzMn3Phbso0fdToey+
 oMC754LtjnHpMIEpLx7Lfto2B8053KbUga3+YbmmRIUgUpwxkXbAQGVjnm/5TWcMeVtbbEuvcpd
 vSqOasOs++V8SVyN9vmuZZqimdhjVIEOMUAjRHPvi8cTrqCW7t2lOA1HfVYvn/9krhKFtNVZJVd
 oAvKXkCbu3zY6sThQLYrYJujfv2SclrcvUYSkiHEKaDItqAiYBtbbfa3N4j9biM/0A+k7VtmnlK
 1jheY5wPaHF57iTxhzuPxbds7nFm///BmBTYAaLMaMOVz3JsTPEBoGi47q/9sVqeSoTZPDgICI3
 1tYJUyDA9YzREVluR+g==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdc4a1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=G3s93uPkn6CA8LbIO-UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: LM-KI8vS3QicfyNkcBZfZnM-h2ivRQQ2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX5W5Nb90UUx5Y
 y0P9pQEJNk0kRSiliwBOIzrZ9hMOhRHrudtFW6XJ7qpcWP0Ajte+nzOIalICqkM6wtZZ7r9GHL/
 dHKbm46xwQy1cNdyYLuPNKZzTFEmn1w=
X-Proofpoint-GUID: LM-KI8vS3QicfyNkcBZfZnM-h2ivRQQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_064200_856753_7D54FD59 
X-CRM114-Status: GOOD (  22.50  )
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

Define the OP-TEE service protocol carried by RPMI TEE_CALL payloads.
Add operations for version and capability queries, shared-memory
unregistration, asynchronous notification enablement, and yielding-call
start and resume. Use fixed-width little-endian control fields and TEE
result codes for control responses.

Add a parcel memory-reference layout with a full-width 64-bit offset
to the common message parameter union. Encode the RPMI parcel ID and
nonce as an opaque 64-bit global ID. A zero nonce denotes NULL, leaving
parcel ID zero usable with a nonzero nonce.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/optee_msg.h  |  23 +++-
 drivers/tee/optee/optee_rpmi.h | 263 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 283 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
index 6c3043f8da33..dc331cb0dace 100644
--- a/drivers/tee/optee/optee_msg.h
+++ b/drivers/tee/optee/optee_msg.h
@@ -31,6 +31,9 @@
 #define OPTEE_MSG_ATTR_TYPE_FMEM_INPUT		OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
 #define OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT		OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT
 #define OPTEE_MSG_ATTR_TYPE_FMEM_INOUT		OPTEE_MSG_ATTR_TYPE_RMEM_INOUT
+#define OPTEE_MSG_ATTR_TYPE_PMEM_INPUT		OPTEE_MSG_ATTR_TYPE_RMEM_INPUT
+#define OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT		OPTEE_MSG_ATTR_TYPE_RMEM_OUTPUT
+#define OPTEE_MSG_ATTR_TYPE_PMEM_INOUT		OPTEE_MSG_ATTR_TYPE_RMEM_INOUT
 #define OPTEE_MSG_ATTR_TYPE_TMEM_INPUT		0x9
 #define OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT		0xa
 #define OPTEE_MSG_ATTR_TYPE_TMEM_INOUT		0xb
@@ -149,6 +152,18 @@ struct optee_msg_param_fmem {
 	u64 global_id;
 };
 
+/**
+ * struct optee_msg_param_pmem - RPMI parcel memory reference
+ * @offs: Byte offset from the start of the shared parcel
+ * @size: Reference size, or required size for a short-buffer response
+ * @global_id: Parcel ID in bits 31:0 and nonce in bits 63:32
+ */
+struct optee_msg_param_pmem {
+	u64 offs;
+	u64 size;
+	u64 global_id;
+};
+
 /**
  * struct optee_msg_param_value - opaque value parameter
  * @a: first opaque value
@@ -169,15 +184,16 @@ struct optee_msg_param_value {
  * @tmem:	parameter by temporary memory reference
  * @rmem:	parameter by registered memory reference
  * @fmem:	parameter by FF-A registered memory reference
+ * @pmem:	parameter by RPMI parcel memory reference
  * @value:	parameter by opaque value
  * @octets:	parameter by octet string
  * @u:		union holding OP-TEE msg parameter
  *
  * @attr & OPTEE_MSG_ATTR_TYPE_MASK indicates if tmem, rmem or value is used in
  * the union. OPTEE_MSG_ATTR_TYPE_VALUE_* indicates value or octets,
- * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @tmem and
- * OPTEE_MSG_ATTR_TYPE_RMEM_* or the alias PTEE_MSG_ATTR_TYPE_FMEM_* indicates
- * @rmem or @fmem depending on the conduit.
+ * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @u.tmem. OPTEE_MSG_ATTR_TYPE_RMEM_*
+ * and its FMEM/PMEM aliases indicate @u.rmem, @u.fmem or @u.pmem depending
+ * on the conduit.
  * OPTEE_MSG_ATTR_TYPE_NONE indicates that none of the members are used.
  */
 struct optee_msg_param {
@@ -186,6 +202,7 @@ struct optee_msg_param {
 		struct optee_msg_param_tmem tmem;
 		struct optee_msg_param_rmem rmem;
 		struct optee_msg_param_fmem fmem;
+		struct optee_msg_param_pmem pmem;
 		struct optee_msg_param_value value;
 		u8 octets[24];
 	} u;
diff --git a/drivers/tee/optee/optee_rpmi.h b/drivers/tee/optee/optee_rpmi.h
new file mode 100644
index 000000000000..d4cf2d927a7f
--- /dev/null
+++ b/drivers/tee/optee/optee_rpmi.h
@@ -0,0 +1,263 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+#ifndef OPTEE_RPMI_H
+#define OPTEE_RPMI_H
+
+#include <linux/bitops.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+#include <linux/wordpart.h>
+
+/*
+ * OP-TEE service ABI over RPMI TEE_CALL.
+ *
+ * Requests and responses are carried in the TEE_CALL service payload.
+ * Control fields are little-endian. Response status fields contain unsigned
+ * 32-bit TEE result codes: TEE_SUCCESS or TEE_ERROR_*. These are distinct
+ * from the outer TEE_CALL status, which uses signed RPMI error codes, and
+ * the GP command result in optee_msg_arg.ret.
+ *
+ * Memory references use a global_id combining the parcel ID and nonce.
+ * A zero nonce denotes NULL regardless of the parcel ID. A NULL reference
+ * must specify a zero buffer offset; its requested size is preserved.
+ */
+
+#define OPTEE_RPMI_SERVICE_UUID \
+	UUID_INIT(0x486178e0, 0xe7f8, 0x11e3, \
+		  0xbc, 0x5e, 0x00, 0x02, 0xa5, 0xd5, 0xc5, 0x1b)
+
+#define OPTEE_RPMI_VERSION_MAJOR		1
+#define OPTEE_RPMI_VERSION_MINOR		0
+
+/**
+ * optee_rpmi_global_id() - encode an opaque parcel memory identity
+ * @parcel_id: firmware-assigned parcel identifier
+ * @nonce: REE nonce supplied when sharing the parcel
+ *
+ * Return: A 64-bit identity for memory parcel.
+ */
+static inline u64 optee_rpmi_global_id(u32 parcel_id, u32 nonce)
+{
+	return ((u64)nonce << 32) | parcel_id;
+}
+
+/* Extract the firmware-assigned parcel ID from a memory identity. */
+static inline u32 optee_rpmi_parcel_id(u64 global_id)
+{
+	return lower_32_bits(global_id);
+}
+
+/* Extract the nonce; zero denotes a NULL memory reference. */
+static inline u32 optee_rpmi_nonce(u64 global_id)
+{
+	return upper_32_bits(global_id);
+}
+
+/**
+ * struct optee_rpmi_probe_req - request without operation-specific arguments
+ * @op: GET_API_VERSION, GET_OS_VERSION or EXCHANGE_CAPABILITIES
+ */
+struct optee_rpmi_probe_req {
+	__le32 op;
+};
+
+/**
+ * struct optee_rpmi_status_resp - response carrying only a TEE result
+ * @status: TEE result code; TEE_SUCCESS on success
+ */
+struct optee_rpmi_status_resp {
+	__le32 status;
+};
+
+/*
+ * Return the service API version.
+ *
+ * Request:  struct optee_rpmi_probe_req
+ * Response: struct optee_rpmi_api_resp
+ */
+#define OPTEE_RPMI_GET_API_VERSION	0
+
+/**
+ * struct optee_rpmi_api_resp - GET_API_VERSION response
+ * @status: TEE result code; TEE_SUCCESS on success
+ * @major: incompatible protocol revision
+ * @minor: compatible protocol revision
+ */
+struct optee_rpmi_api_resp {
+	__le32 status;
+	__le32 major;
+	__le32 minor;
+};
+
+/*
+ * Return the trusted OS revision, not the service API revision.
+ *
+ * Request:  struct optee_rpmi_probe_req
+ * Response: struct optee_rpmi_os_resp
+ */
+#define OPTEE_RPMI_GET_OS_VERSION	1
+
+/**
+ * struct optee_rpmi_os_resp - GET_OS_VERSION response
+ * @status: TEE result code; TEE_SUCCESS on success
+ * @major: trusted OS major revision
+ * @minor: trusted OS minor revision
+ * @reserved: must be zero
+ * @build_id: trusted OS build identifier, zero if unspecified
+ */
+struct optee_rpmi_os_resp {
+	__le32 status;
+	__le32 major;
+	__le32 minor;
+	__le32 reserved;
+	__le64 build_id;
+};
+
+/*
+ * Query secure-world capabilities and limits.
+ *
+ * Request:  struct optee_rpmi_probe_req
+ * Response: struct optee_rpmi_caps_resp
+ */
+#define OPTEE_RPMI_EXCHANGE_CAPABILITIES	2
+
+/**
+ * struct optee_rpmi_caps_resp - EXCHANGE_CAPABILITIES response
+ * @status: TEE result code; TEE_SUCCESS on success
+ * @secure_caps: reserved for future optional features; zero in version 1
+ * @rpc_param_count: nonzero parameter capacity of each RPC argument buffer
+ * @max_notification_key: inclusive maximum logical key, including synchronous
+ *			  keys; zero selects the default maximum of 255
+ *
+ * Version 1 defines no capability bits. Unknown bits are ignored by Linux
+ * for compatibility with future extensions.
+ */
+struct optee_rpmi_caps_resp {
+	__le32 status;
+	__le32 secure_caps;
+	__le32 rpc_param_count;
+	__le32 max_notification_key;
+};
+
+/*
+ * Unregister a shared parcel from OP-TEE.
+ *
+ * Request:  struct optee_rpmi_unregister_req
+ * Response: struct optee_rpmi_status_resp
+ */
+#define OPTEE_RPMI_UNREGISTER_SHM	3
+
+/**
+ * struct optee_rpmi_unregister_req - retire a shared parcel in OP-TEE
+ * @op: OPTEE_RPMI_UNREGISTER_SHM
+ * @reserved: must be zero
+ * @global_id: identity of the parcel to retire; nonce must be nonzero
+ *
+ * Success means OP-TEE stopped using the mapping and released its receiver
+ * interest.
+ */
+struct optee_rpmi_unregister_req {
+	__le32 op;
+	__le32 reserved;
+	__le64 global_id;
+};
+
+/*
+ * Enable asynchronous notification delivery.
+ *
+ * Request:  struct optee_rpmi_enable_notif_req
+ * Response: struct optee_rpmi_status_resp
+ */
+#define OPTEE_RPMI_ENABLE_ASYNC_NOTIF	4
+
+/**
+ * struct optee_rpmi_enable_notif_req - bind an incoming RPMI doorbell
+ * @op: OPTEE_RPMI_ENABLE_ASYNC_NOTIF
+ * @signal_id: allocated TEE-to-REE signal, not a logical notification key
+ *
+ * Success activates delivery and raises the doorbell for pending work.
+ * Raising the signal requests OPTEE_MSG_CMD_DO_BOTTOM_HALF.
+ * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF stops future doorbell generation, but does
+ * not drain already-raised signals or release the signal ID.
+ */
+struct optee_rpmi_enable_notif_req {
+	__le32 op;
+	__le32 signal_id;
+};
+
+/*
+ * Start a yielding command using shared command and RPC arguments.
+ *
+ * Request:  struct optee_rpmi_call_req
+ * Response: struct optee_rpmi_call_resp
+ */
+#define OPTEE_RPMI_YIELDING_CALL_WITH_ARG		5
+
+#define OPTEE_RPMI_YIELDING_CALL_RETURN_DONE		0
+#define OPTEE_RPMI_YIELDING_CALL_RETURN_RPC_CMD		1
+#define OPTEE_RPMI_YIELDING_CALL_RETURN_INTERRUPT	2
+
+/**
+ * struct optee_rpmi_call_req - start a yielding command
+ * @op: OPTEE_RPMI_YIELDING_CALL_WITH_ARG
+ * @flags: zero in version 1
+ * @global_id: argument parcel identity; nonce must be nonzero
+ * @arg_offset: command argument byte offset from the parcel's first byte
+ * @rpc_offset: RPC argument byte offset from the parcel's first byte
+ * @arg_size: command argument extent in bytes
+ * @rpc_size: RPC argument capacity in bytes
+ *
+ * Firmware validates ownership, RW access, alignment and disjoint ranges.
+ * TEE_ERROR_BUSY rejects an initial request without acquiring call ownership.
+ */
+struct optee_rpmi_call_req {
+	__le32 op;
+	__le32 flags;
+	__le64 global_id;
+	__le64 arg_offset;
+	__le64 rpc_offset;
+	__le32 arg_size;
+	__le32 rpc_size;
+};
+
+/**
+ * struct optee_rpmi_call_resp - yielding command response
+ * @status: TEE result code, distinct from the command's GP result
+ * @result: OPTEE_RPMI_YIELDING_CALL_RETURN_* value when status is success
+ * @resume_token: opaque token for a suspended command; ignored for DONE
+ *
+ * DONE releases all access to the call's argument and RPC ranges. RPC_CMD
+ * requests RPC command handling; INTERRUPT requests resumption without an
+ * RPC command. Tokens belong to one accepted call, service and caller.
+ */
+struct optee_rpmi_call_resp {
+	__le32 status;
+	__le32 result;
+	__le32 resume_token;
+};
+
+/*
+ * Resume a suspended yielding command.
+ *
+ * Request:  struct optee_rpmi_resume_req
+ * Response: struct optee_rpmi_call_resp
+ */
+#define OPTEE_RPMI_YIELDING_CALL_RESUME	6
+
+/**
+ * struct optee_rpmi_resume_req - resume a suspended command
+ * @op: OPTEE_RPMI_YIELDING_CALL_RESUME
+ * @reserved: must be zero
+ * @resume_token: opaque token copied unchanged from the preceding response
+ *
+ * Resume must not return TEE_ERROR_BUSY.
+ */
+struct optee_rpmi_resume_req {
+	__le32 op;
+	__le32 reserved;
+	__le32 resume_token;
+};
+
+#endif /* OPTEE_RPMI_H */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
