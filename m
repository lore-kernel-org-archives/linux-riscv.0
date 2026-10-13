Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54F2CA9ED0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 05:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZg+IZYUcvYPxyAEivwhadPeGr2ZoiXna47Gq3LXVE8=; b=Jvsu1bge0ugHr/
	Zf3ugW08t+afoSX9uCaggLCqQN0vNVqLtjMwoGFMNtLmZl6xYxlY3gTnFo+uUfiJN5kYuJK6z3Sbw
	0trN7Y8vl/SXUtNLhNC9LYcwz6EC4R97YodlVHea5DD2nDUlXyH83xxyVwDDvG9unOyB1hQ1XlcAb
	7T7lr2k4RiG9j6zk4Y3rYdGUlsmm9eoRTHrn48lua34LZBqs9i6E+3anTX+rjSOYVFPvcelHx1wtX
	/chZ3WI5wiFW7Dst3vjZ5cewPE8gTm7LNSytWVJM/f4M6ykAoKD/FgrOGhhiuS5ljiMx8BnOLz1uu
	tNVaMU35XKJ1FJ2IzQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVH3-0000000C26O-3mrU;
	Tue, 13 Oct 2026 05:42:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVH2-0000000C24s-1ZfS
	for linux-riscv@bombadil.infradead.org;
	Tue, 13 Oct 2026 05:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=h7YZRIa+NRNY0y0wXCVE1k0DjUJFm0HRtljake6wepM=; b=RFjWjPdKzDYjyv2cyjckCOSh4U
	8A1NlkOFpMRmJ0WQkJMWbiy4GxoRdl/XXy2LTZ1pcbBSC2+kgZBaiO0TkNCHXZnfC8i8vDZUpfEk7
	UJC6caK32sagoUGaAzjDaFtzKwj1DZ9X5iWJsrUjmm+BAcG7uBvRwPL2PR/sIJzS+rIwMSQvtGYw4
	tZMH5pAQfEhd5ZEQIv5p2uyyfDquE5ZPesQlpnVZEJ4YTSAGmTVzaXDMNuhhBymyBDdnOw5eqZtGi
	24CocfVeBrtFF3LV6fjitOv0UUwWlpqV962vr4vxDjFC43l6AmWzGXCrNCzxsE6rs2afbxX4JLzdg
	DLPOLleA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGVGx-0000000F7fR-3klp
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 05:42:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D20rwQ302938
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h7YZRIa+NRNY0y0wXCVE1k0DjUJFm0HRtljake6wepM=; b=DVWwE8b8Rx8t2r6m
	11Lj1DzUuo6jymUVXc6PIdpnQdj9fueuGkZIYwnFRZ6xNKzSdu23aGqkasjmAO9k
	FMzoR1LZ2gMN1WRbYhNNJAEIf4wqzAqt2yUlRmrZHhaHaudgz6dxkSMjU3lc968d
	kl0qPY0sKlmq3EiISNXv9i8nw6UOx1uSSa8uExfCtsDc9L1/z7wq7S19+TDEqDT5
	8A6+/tN5Jd75GBI94OF2EblFYQvUKYlcDKuV9LWFHRUYkNQXss1u8uapdlLVBd3D
	nJSgShcXcyjnn8ptc9glyDOnx0PznPmlnhvvIL952zwqJAI8GXqK4AKgZM8NPkZK
	f3pI4Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98sq96ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:41:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4a0017549so4183565a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 22:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870115; x=1792474915; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h7YZRIa+NRNY0y0wXCVE1k0DjUJFm0HRtljake6wepM=;
        b=Z4HjmNA/yhRik2Fsx1IMTz1FceIH5WgcqIZStBE4bpksPkB9H0dpKkahoYK1NRBmE7
         dEL2LwMMKDgm/B0yXyJ1dJ2COiiDsuboLGAyiFmr/5IMXR+lxPn5RalI2+H0j+S1Kyi6
         LuHHvITTAWvM4cMM0jK74WTLFdyEgfHL1wgs4vzgrCX//OClXJ094wb3Kbi1KiToQ9J+
         VSYJSWu+59NZKIlYbL02aWmR8MKA+8UL72mEErw7iFMMI40jxEWnStz1dThKPsAv23A/
         VmysEzdDD7ZfPEXuId+Nm6xoAUEVkhZ032YebSefC3Fv3Lt9wUJx+wIpXJdJhV9VwPOg
         4rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870115; x=1792474915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7YZRIa+NRNY0y0wXCVE1k0DjUJFm0HRtljake6wepM=;
        b=xsJ9FmU4PuOcekIZzrhDPgPaaBu45+8aes8w1PVTOJmOCJd4hbbmJoeE4BWEKpJBT/
         0pJa7PmVvFmlzC34f9GzDia0iFMJ5pdH1lWSgyJ02spD0cei84LIaNgj7TuatvP+QSRa
         JGJzRE4RV5cttphMbC5zEmTNPxln3qO267B1cv7Hz3uq5gbZFQ58N1qCKIBbZaFHkQj9
         DtBzRcX5jPI9ouH6KsxEwxyp8G8RUmXuavL6Jak2X3wqpBGwUbuPUkPlWHZTQlKG2i+6
         19TCEan0r8hkkLkF3hnFRKysCZBYeogyr0/RxVrLMFjOeqgM0xh2seNjUN547qrDtOCq
         qYNw==
X-Forwarded-Encrypted: i=1; AKwUvByk1z5AfuaGP9DuXkEXdSeva8PKXp8D3bH+59XEw+Tj+wZh9ygQZYrn+QOg3d2CJhz78eZwzJxy8OpDbQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYI2BoO0vPorsWyI7kiPab6nWlTFydYd8la51ig8xKYLc6Y/aU4d
	JFuhFslDZw0nbK25KnNyez9aaAzNzppDBLDFwmUalyTATSuiulfQWasmDSNvfGUtLovoiTrpcZ6
	8C64WFumeIaii1G4+1K4rLDkXs3A3pxEN8ssKfwJWlvzNlCg5nVF2+ZIWtpjWMb5vRLUGjg==
X-Gm-Gg: AYBFou3ZfCMqe/ynwR0RuuK9Qnp8VvHO2S1GiStzeYhPxBLQBCYLsGj8yFgKDHsmxN5
	URmRPKqIesJTi9sd0lbxfTpax4fRB0F1Fv5yFe53/AzotIikAlARuvdx7coQfN+V/9IiHi7pRSc
	0WDnqQP3LqUtfKCV7RbbiDZLV9jvsklkgORw9GtGomuNU5ThQW6Icb3DokNSboRYs0vQk1iXZJr
	uUJe6fAK7mmdpGUv5fVZ6ocEjfkxz82kO4ekZbo1efSC7JhWWfgFQ9OKAQML42G8HWj4OQtEp2j
	4rfXs7nc116/I1PjeNq5iSw9lHC0DWsXDmQ4vCFawvNyH4Rmf0MvOTh5A8JQNlizZBnWSY6qH0a
	X8MX+aWcg1upmEv+srQzDN1p8QZYC9wyqbs5uCjCIeuTPm6T2Dp77Tszr+A==
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr8356616a91.12.1791870114636;
        Mon, 12 Oct 2026 22:41:54 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:39e:53a:c8d4 with SMTP id 98e67ed59e1d1-3ab3a90e57amr8356597a91.12.1791870114075;
        Mon, 12 Oct 2026 22:41:54 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:53 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 22:41:31 -0700
Subject: [PATCH RFC v3 4/9] tee: optee: add RPMI shared-memory and
 parameter support
MIME-Version: 1.0
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-4-975b574667e2@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfXzyW7pLSivhtA
 SNCIOmDx6jwAC0dYAZCbRU84IpGqUTfbsvU2YIMC6exSaXinhYBqAcj1+hkYvDifpYxNiwNrWfi
 261V9/9K5jEQODsKfg7J22d3Fdy0vlMnvOEtZeFDBtM5EyW555Au00Ahf9HyeZr98lBeCrlBly8
 Jaj5scfJKflyma73nFnuRZK+AvjV/GhYWpi1tsMvffhee5WeCrdJzX6+BD8wW0uLgZndZwQtdqb
 ctfGk0cyFnSrSMBbZo+rahr1nqz2H40X334M30mJ2ARRhlQVrBxHZoobT+oDYFEtN2fZp9twBV/
 xUWrylIng6tHG6dXVCO3HPgLsS80jb9x3lxL31l4QVewRgv/5hkQWVoXJCygWEdi0VHsZwZnlAq
 BJbxkExnL3ql4bzbHybPqoBZjchtkEm91U7IPyqQ+55zY/4JCik0btgUhZfClkNIuE1UH5PrfTS
 DEEJf2FwHfyU+ucG6wQ==
X-Authority-Analysis: v=2.4 cv=JN+uIMKb c=1 sm=1 tr=0 ts=6acdc4a3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bl3zVpOXNXRnPWSUSmgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX4SkTGZIVOWpT
 eLmNpdzOvmSiXCdQ6cX7F771ggXMizDADTdt1U0IrdwvpxVUli2dAIfJxONFUSu5SI+wxe3WLE6
 Hnbw5/AQLCfQO4qJ9jBtpFIL6MDAS9Q=
X-Proofpoint-ORIG-GUID: ej7x-pYoZrac-mEuirR5UOFrsoYfXUyG
X-Proofpoint-GUID: ej7x-pYoZrac-mEuirR5UOFrsoYfXUyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_064200_874421_4D668C98 
X-CRM114-Status: GOOD (  23.34  )
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

OP-TEE commands and RPCs need shared memory that secure world can
identify through RPMI parcels.

Register normal-world pages as read-write parcels shared with the
OP-TEE endpoint. Track each parcel ID and nonce with the common
shared-memory map. Store the combined identity in tee_shm.sec_world_id
and allocate nonzero nonces to distinguish registered memory from NULL
references. Reuse nonces after successful parcel reclamation.

Add conversions between TEE parameters and parcel memory references.

On client memory unregistration, ask OP-TEE to release its mapping
before reclaiming the parcel. Supplicant memory has already been
released by OP-TEE through its SHM_FREE RPC and only needs reclaiming.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/optee_private.h |  19 +++
 drivers/tee/optee/rpmi_abi.c      | 319 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 339 insertions(+)

diff --git a/drivers/tee/optee/Makefile b/drivers/tee/optee/Makefile
index ec2efc27ef05..4794c7c0ef91 100644
--- a/drivers/tee/optee/Makefile
+++ b/drivers/tee/optee/Makefile
@@ -10,6 +10,7 @@ optee-objs += device.o
 optee-objs += shm_handle_map.o
 optee-$(CONFIG_HAVE_ARM_SMCCC) += smc_abi.o
 optee-$(CONFIG_ARM_FFA_TRANSPORT) += ffa_abi.o
+optee-$(CONFIG_RISCV_RPMI_TEE_TRANSPORT) += rpmi_abi.o
 
 # for tracing framework to find optee_trace.h
 CFLAGS_smc_abi.o := -I$(src)
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 92428945ee33..efc1e37fe1bf 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -6,6 +6,7 @@
 #ifndef OPTEE_PRIVATE_H
 #define OPTEE_PRIVATE_H
 
+#include <linux/idr.h>
 #include <linux/notifier.h>
 #include <linux/rhashtable.h>
 #include <linux/rpmb.h>
@@ -200,6 +201,20 @@ struct optee_ffa {
 };
 #endif
 
+#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
+/**
+ * struct optee_rpmi - RPMI transport-specific OP-TEE state
+ * @rdev: owning RPMI service device
+ * @shm_map: lookup by the host-endian parcel ID and nonce pair
+ * @nonce_ida: nonzero SHM nonces, reusable after successful parcel reclamation
+ */
+struct optee_rpmi {
+	struct rpmi_tee_device *rdev;
+	struct optee_shm_handle_map shm_map;
+	struct ida nonce_ida;
+};
+#endif
+
 struct optee;
 
 /**
@@ -260,6 +275,7 @@ struct optee_ops {
  * @ctx:			driver internal TEE context
  * @smc:			specific to SMC ABI
  * @ffa:			specific to FF-A ABI
+ * @rpmi:			specific to RPMI ABI
  * @shm_arg_cache:		shared memory cache argument
  * @call_queue:			queue of threads waiting to call @invoke_fn
  * @notif:			notification synchronization struct
@@ -291,6 +307,9 @@ struct optee {
 #endif
 #if IS_REACHABLE(CONFIG_ARM_FFA_TRANSPORT)
 		struct optee_ffa ffa;
+#endif
+#if IS_REACHABLE(CONFIG_RISCV_RPMI_TEE_TRANSPORT)
+		struct optee_rpmi rpmi;
 #endif
 	};
 	struct optee_shm_arg_cache shm_arg_cache;
diff --git a/drivers/tee/optee/rpmi_abi.c b/drivers/tee/optee/rpmi_abi.c
new file mode 100644
index 000000000000..940676794280
--- /dev/null
+++ b/drivers/tee/optee/rpmi_abi.c
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/mailbox/riscv-rpmi-message.h>
+#include <linux/overflow.h>
+#include <linux/rpmi_tee.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include "optee_private.h"
+#include "optee_rpmi.h"
+
+/* Keep transport errors separate from the control status in a response. */
+static int optee_rpmi_call_with_status(struct optee *optee,
+				       const void *req, size_t req_len,
+				       void *resp, size_t resp_size,
+				       u32 *status)
+{
+	struct rpmi_tee_device *rdev = optee->rpmi.rdev;
+	size_t received = resp_size;
+	int rc;
+
+	rc = rdev->ops->msg_ops->call(rdev, req, req_len, resp, &received);
+	if (rc)
+		return rc;
+
+	if (received != resp_size)
+		return -EPROTO;
+
+	*status = get_unaligned_le32(resp);
+
+	return 0;
+}
+
+/**
+ * optee_rpmi_call - Send a control request and check its TEE result
+ * @optee: OP-TEE instance.
+ * @req: Control request, including the operation number.
+ * @req_len: Request size in bytes.
+ * @resp: Response buffer, beginning with a little-endian TEE result.
+ * @resp_size: Exact expected response size, including the status field.
+ *
+ * Return: 0 on success, a transport error, -EPROTO for an unexpected response
+ * size, or -EIO for an unsuccessful control response.
+ */
+static int optee_rpmi_call(struct optee *optee, const void *req, size_t req_len,
+			   void *resp, size_t resp_size)
+{
+	u32 status;
+	int rc;
+
+	rc = optee_rpmi_call_with_status(optee, req, req_len, resp, resp_size,
+					 &status);
+	if (rc)
+		return rc;
+	else if (status != TEEC_SUCCESS)
+		return -EIO;
+
+	return 0;
+}
+
+static int optee_rpmi_shm_register(struct tee_context *ctx, struct tee_shm *shm,
+				   struct page **pages, size_t num_pages,
+				   unsigned long start)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct rpmi_tee_device *rdev = optee->rpmi.rdev;
+	struct rpmi_tee_mem_receiver receiver = {
+		.endpoint_id = rdev->endpoint_id,
+		.access = RPMI_TEE_MEM_ACCESS_READ | RPMI_TEE_MEM_ACCESS_WRITE,
+	};
+	struct rpmi_tee_mem_args args = {
+		.receivers = &receiver,
+		.receiver_count = 1,
+		.creator_access = RPMI_TEE_MEM_ACCESS_READ |
+				  RPMI_TEE_MEM_ACCESS_WRITE,
+	};
+	struct sg_table sgt;
+	u64 global_id;
+	int rc;
+
+	rc = optee_check_mem_type(start, num_pages);
+	if (rc)
+		return rc;
+
+	rc = sg_alloc_table_from_pages(&sgt, pages, num_pages, 0,
+				       num_pages * PAGE_SIZE, GFP_KERNEL);
+	if (rc)
+		return rc;
+
+	rc = ida_alloc_min(&optee->rpmi.nonce_ida, 1, GFP_KERNEL);
+	if (rc < 0) {
+		sg_free_table(&sgt);
+		return rc;
+	}
+
+	args.nonce = rc;
+	args.sg = sgt.sgl;
+	rc = rdev->ops->mem_ops->memory_share(rdev, &args);
+	sg_free_table(&sgt);
+	/* A failed exchange may leave a parcel using this nonce. */
+	if (rc)
+		return rc;
+
+	global_id = optee_rpmi_global_id(args.parcel_id, args.nonce);
+
+	rc = optee_shm_handle_map_add(&optee->rpmi.shm_map, shm, global_id);
+	if (rc) {
+		int rrc;
+
+		rrc = rdev->ops->mem_ops->memory_reclaim(rdev, args.parcel_id);
+		/* Keep the nonce if firmware may still hold the parcel. */
+		if (rrc)
+			dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
+				args.parcel_id, rrc);
+		else
+			ida_free(&optee->rpmi.nonce_ida, args.nonce);
+
+		return rc;
+	}
+
+	shm->sec_world_id = global_id;
+
+	return 0;
+}
+
+static int optee_rpmi_shm_unregister(struct tee_context *ctx,
+				     struct tee_shm *shm)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct rpmi_tee_device *rdev = optee->rpmi.rdev;
+	struct optee_rpmi_unregister_req req = {
+		.op = cpu_to_le32(OPTEE_RPMI_UNREGISTER_SHM),
+		.global_id = cpu_to_le64(shm->sec_world_id),
+	};
+	struct optee_rpmi_status_resp resp;
+	u32 parcel_id = optee_rpmi_parcel_id(shm->sec_world_id);
+	u32 nonce = optee_rpmi_nonce(shm->sec_world_id);
+	int rc;
+
+	optee_shm_handle_map_remove(&optee->rpmi.shm_map, shm->sec_world_id);
+	shm->sec_world_id = 0;
+
+	rc = optee_rpmi_call(optee, &req, sizeof(req), &resp, sizeof(resp));
+	if (rc)
+		dev_err(&rdev->dev, "unregister parcel %#x failed: %d\n",
+			parcel_id, rc);
+
+	rc = rdev->ops->mem_ops->memory_reclaim(rdev, parcel_id);
+	/* Keep the nonce if firmware may still hold the parcel. */
+	if (rc)
+		dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
+			parcel_id, rc);
+	else
+		ida_free(&optee->rpmi.nonce_ida, nonce);
+
+	return rc;
+}
+
+static int optee_rpmi_shm_unregister_supp(struct tee_context *ctx,
+					  struct tee_shm *shm)
+{
+	struct optee *optee = tee_get_drvdata(ctx->teedev);
+	struct rpmi_tee_device *rdev = optee->rpmi.rdev;
+	u32 parcel_id = optee_rpmi_parcel_id(shm->sec_world_id);
+	u32 nonce = optee_rpmi_nonce(shm->sec_world_id);
+	int rc;
+
+	optee_shm_handle_map_remove(&optee->rpmi.shm_map, shm->sec_world_id);
+	shm->sec_world_id = 0;
+	/* OP-TEE has already retired the parcel through SHM_FREE RPC. */
+	rc = rdev->ops->mem_ops->memory_reclaim(rdev, parcel_id);
+	/* Keep the nonce if firmware may still hold the parcel. */
+	if (rc)
+		dev_err(&rdev->dev, "reclaim parcel %#x failed: %d\n",
+			parcel_id, rc);
+	else
+		ida_free(&optee->rpmi.nonce_ida, nonce);
+
+	return rc;
+}
+
+/* Convert a memory reference to an OP-TEE RPMI parcel reference. */
+static int to_msg_param_rpmi_mem(struct optee_msg_param *mp,
+				 const struct tee_param *p)
+{
+	struct tee_shm *shm = p->u.memref.shm;
+
+	mp->attr = OPTEE_MSG_ATTR_TYPE_PMEM_INPUT + p->attr -
+		   TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT;
+	memset(&mp->u, 0, sizeof(mp->u));
+	/* For !shm, a zero global_id encodes a NULL reference. */
+	if (shm) {
+		if (check_add_overflow((u64)shm->offset,
+				       (u64)p->u.memref.shm_offs,
+				       &mp->u.pmem.offs))
+			return -EINVAL;
+
+		mp->u.pmem.global_id = shm->sec_world_id;
+	}
+
+	mp->u.pmem.size = p->u.memref.size;
+
+	return 0;
+}
+
+static int optee_rpmi_to_msg_param(struct optee *optee,
+				   struct optee_msg_param *msg_params,
+				   size_t num_params,
+				   const struct tee_param *params)
+{
+	size_t n;
+
+	for (n = 0; n < num_params; n++) {
+		const struct tee_param *p = params + n;
+		struct optee_msg_param *mp = msg_params + n;
+
+		switch (p->attr) {
+		case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
+			mp->attr = OPTEE_MSG_ATTR_TYPE_NONE;
+			memset(&mp->u, 0, sizeof(mp->u));
+			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
+			optee_to_msg_param_value(mp, p);
+			break;
+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
+		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
+			if (to_msg_param_rpmi_mem(mp, p))
+				return -EINVAL;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/* Convert an RPMI parcel reference to a memref; callers own SHM lifetime. */
+static int from_msg_param_rpmi_mem(struct optee *optee, struct tee_param *p,
+				   u32 attr, const struct optee_msg_param *mp)
+{
+	struct tee_shm *shm;
+	u64 offset;
+
+	p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT + attr -
+		  OPTEE_MSG_ATTR_TYPE_PMEM_INPUT;
+
+	if (mp->u.pmem.size > SIZE_MAX)
+		return -EOVERFLOW;
+	p->u.memref.size = mp->u.pmem.size;
+
+	if (!optee_rpmi_nonce(mp->u.pmem.global_id)) {
+		/* Return NULL shm. */
+		if (mp->u.pmem.offs)
+			return -EINVAL;
+		p->u.memref.shm = NULL;
+		p->u.memref.shm_offs = 0;
+		return 0;
+	}
+
+	shm = optee_shm_handle_map_lookup(&optee->rpmi.shm_map,
+					  mp->u.pmem.global_id);
+	if (!shm || mp->u.pmem.offs < shm->offset)
+		return -EINVAL;
+
+	offset = mp->u.pmem.offs - shm->offset;
+	if (offset > SIZE_MAX)
+		return -EOVERFLOW;
+
+	p->u.memref.shm = shm;
+	p->u.memref.shm_offs = offset;
+
+	return 0;
+}
+
+static int optee_rpmi_from_msg_param(struct optee *optee,
+				     struct tee_param *params,
+				     size_t num_params,
+				     const struct optee_msg_param *msg_params)
+{
+	size_t n;
+
+	for (n = 0; n < num_params; n++) {
+		const struct optee_msg_param *mp = msg_params + n;
+		struct tee_param *p = params + n;
+		u32 attr = mp->attr & OPTEE_MSG_ATTR_TYPE_MASK;
+		int rc;
+
+		switch (attr) {
+		case OPTEE_MSG_ATTR_TYPE_NONE:
+			p->attr = TEE_IOCTL_PARAM_ATTR_TYPE_NONE;
+			memset(&p->u, 0, sizeof(p->u));
+			break;
+		case OPTEE_MSG_ATTR_TYPE_VALUE_INPUT:
+		case OPTEE_MSG_ATTR_TYPE_VALUE_OUTPUT:
+		case OPTEE_MSG_ATTR_TYPE_VALUE_INOUT:
+			optee_from_msg_param_value(p, attr, mp);
+			break;
+		case OPTEE_MSG_ATTR_TYPE_PMEM_INPUT:
+		case OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT:
+		case OPTEE_MSG_ATTR_TYPE_PMEM_INOUT:
+			rc = from_msg_param_rpmi_mem(optee, p, attr, mp);
+			if (rc)
+				return rc;
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
