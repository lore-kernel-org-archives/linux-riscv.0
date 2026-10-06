Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2333DCA5FF0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 00:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9k+B0Huwoe3oepelFhIvWadgHbRSZXpr5WqZj1I7nH0=; b=sbZCShUzbYmcU2
	gFcHaMu39Q4cPF94CTPGdxB0lmH7j7WEavETSSeUSxxUE05DxJ4dFXnihFO5+TAHrM+38evEyOV9M
	UY3kxVD2zEZqmFpD+oqMp6gmVIPFPnvYp3nwlVNT2QkcuW/gb8C+oQbGXqmvXhSgRRZ9yZWm9d/Zs
	c7kf1gmZhZYHZINVVufSz7tnLQfP4QLoPf829Rv91mo90tagRs4aDONUA0RKxQ/vEbGKv892bl7F7
	tVpaGS7dZ8QgHsUdszyQrnxwoZsyvm62EkIHKNG37sChKQvBCcwPYvGYr7UZ3qpXCmvqEkiBOq7I/
	jqBDz9abIEG2aEoJNpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtDp-0000000HP07-3Kh2;
	Tue, 06 Oct 2026 00:39:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtDn-0000000HOyv-2Qik
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 00:39:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KN0wt3299801
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 00:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IsDRn63F1MTcQ80JVeDfNz
	DYjnKG8K9IOfHI2D6YUAs=; b=OJk1AieWEhmc3sW+TPPMYs1Dc47Ie4CEluAbH3
	cpGLNulRnef1HZLRSNwdA0b0C2XRV2huk+MfGIE4hMSvjxzY9eX2Skl2V/zV+UG6
	hWJ4I/CHoJ9su3sqC/tr92yWRibIPxzSdjZzO8Q969b+xKb9Bxf8wEJUBr8FXUFi
	ap7MzkK6kBLBXQARCwjenkf2FsYAEH6zNaSkEWQuKxAXR41w6M551pOMDLZYmotr
	vx+8YrbWjemI9jjmuIiK6bMoBmVQLttNXkXMovt9gS9J5NX8mEDKx1aQBkoO1BPQ
	nsQ6m41O1j2y1ZCx038TuQN1zEbtRzNlBmHyx41SflNBYnIg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4bhg2ra3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:39:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4647704eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 17:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247192; x=1791851992; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IsDRn63F1MTcQ80JVeDfNzDYjnKG8K9IOfHI2D6YUAs=;
        b=N5WftRpgEt9sDRCXSCEh1fUP8E0SLwawcNzQgNkgnNv9g2LjD8Pxuz9b1mhCVcVHBf
         O1f+9MaiOxTIIWTHbks/BwVDQ23ptQ0+Br3AWacdYejgiZw9SlilKBkAaGDkWshmY+6I
         YpyugGbpzLIbw9bYfyxHnLjEGYcAlOQadYhjovbOeMVWFe9m6IBIdVfFZxj7j3JBY3ZS
         NjVG7ddU1Z3eyqe/qiYabTNdvPHb+QQAbmj/J24Ux7y7hfNEaVMa6T4JZIWokxLWqwsI
         SqT9yVcNCra4Ec5tg59KfhtzsnzaJEgzJKgZ74t+OLoqD77uovMo9NKgg7HEnj8sJNmR
         hQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247192; x=1791851992;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IsDRn63F1MTcQ80JVeDfNzDYjnKG8K9IOfHI2D6YUAs=;
        b=mIjRktnHXP52odNv1ZXtwFSnaxtcwm6lE5lreg1lacEPzo9UU7YA1veISgG2ST5ELO
         Yrm1coy92AQHuY33uE5ao+NzBFE/iCMdCQiXm0lAa4sGp/RpoFjtt2mkTVAQ62iq3jui
         fW5lCT8Ixews2aqnbZKf/6FPCtQ4yimOZFldO5NLey50y12PFLGHKJ5kufmrXbISTvxQ
         oizjRdi1tpoRQpatxvd8X/ZEKnHySex/gDc2CGjCZE6jlnrs7reMCUzRaYZqqWjU9uLn
         cPTFkuz/GVWmmkIP20CeAhsuITAXD5mxUmu1iWGz8RuAM2ROyKMsyywwmJ0QMxbBfNek
         /Ubg==
X-Forwarded-Encrypted: i=1; AKwUvByiV5TJhRgX7C0S1JGsWjneTmA1o47Fexb+EYSBYJemfasLQ9wpHceBcC9ioACiAGizi9W/rTGzxHww9g==@lists.infradead.org
X-Gm-Message-State: AFq9FYLUr2e28WzOMRR/akiD4pjVRHQadx+YjH0mcijeG8XOMXMVgXkm
	1JVrQEzyjH/SxXSzi5a6srWtDNp6sZMSbM2Hxj6/p57V7Fr0im2hlfeQ7Qr6Xqa4YvrO6J/b2o3
	D3Gz/ibnmiGw0wP9Q6HUSrRXeT4eEClEiwvWIZFYpxmZ7UQaxTEHqUIxBdBo4kSr5TSoY4g==
X-Gm-Gg: AYBFou1uH6U4JsKOfbgOQ8nOaKzXsb7sEZM5VKDRXiNSdpEg/gsjdVuASy4PlNCFTyX
	Yl05RNE0ldWMEYeyIvFmf6iiN0hGlb6Z8pgwWN2Zn8nfG8nK56ctFUO2MHB07wUIVakxqGe4XpJ
	OfwN+b+U63nrWPuxzwwBPQ+hDZOYJjMc7FyCcO98cIxUDFburbKNqTIWi/jZ2dqZUV99A2k4+07
	jweYfUe00a+O8Y+rmQmNkXTtvIoMtkkikuII1GG1z6R9Q53Yk0qQ649vAioam6o+pxG5+gzQKUt
	jWp+PeidoHF5hakejLuawEenDmOkt6YkP7imSeXKWVwyU6v1CFUCxp1oArg3rgTuPRgYQu+RCdb
	9A8vHreA9HX+ncB2eqDcKWagtHw5kFH/Qfct62bCz8llQ4N5O0IDS4QFGFw==
X-Received: by 2002:a05:7300:4628:b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-35105291bd8mr13290848eec.4.1791247192341;
        Mon, 05 Oct 2026 17:39:52 -0700 (PDT)
X-Received: by 2002:a05:7300:4628:b0:34c:d1f2:b552 with SMTP id 5a478bee46e88-35105291bd8mr13290821eec.4.1791247191741;
        Mon, 05 Oct 2026 17:39:51 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:51 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/8] tee: optee: add RPMI backend support on RISC-V
Date: Mon, 05 Oct 2026 17:39:44 -0700
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFBDxGoC/4WNwQqDMBBEf0X23JVkRak9FQr9gF6LB5usulCNT
 WxoEf+9wR/oZeDNMDMrBPbCAU7ZCp6jBHFTAjpkYIZ26hnFJgZSVKlaE/p5FFyYMRWjGMbez2g
 54oMMU1cVrGwHqT577uSzT9/hdr1Ak8xBwuL8d7+Leo/+L0eNCrXVtigNtceyPrsQ8te7fRo3j
 nkSaLZt+wE/f/jqzAAAAA==
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
X-Proofpoint-ORIG-GUID: NhhhSAwSXlh-lLtrSGPDFnyDIEdMz9gG
X-Authority-Analysis: v=2.4 cv=GMGdgeNK c=1 sm=1 tr=0 ts=6ac44359 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pTLlcG3b_zTeakJ_RZwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX4ZHaoBd/rURo
 eAViEkh43s54KLWpg6MWEhnZX8wk7Kez8e6OG7VgYac2HL5fyiBKN59LyM20Chi6y1Njmu3xskt
 nYqlArJyVzC1ELcNS1AQSCtJfQxOfng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXxacRFBEkpXiq
 M2GjWPXiBpE8N69aM6JHOPcjGlEqJ83V7VXmV3dVll42Vw+q1hcICCBQDIul+e8+Um/XfyzbQ+G
 ucxno0lkXQC9aAeLs5aeQk3FFFGxQoroLg26AyHrdNCypey+uosHuUn3s6vK/HefYiGdWbrQa1a
 HM4UwD7CihBht+YOoynDKNmhY1RBvQJ1tNTL5I4A+kzuGxJm+QLxvvjbM09alrqEMbkES3Bj+cp
 O/LSSmsx3EitO7VVCeD9ka+OtOCJ1TV6CE/KIiUipRUOYDqnhKQZXxXJKduHVi8nyLbUw4qjnRB
 kIquSaSHRWQvjMukdTIS5OIG3jmw3Jwn26kCWM1lziqiN6+i6wBuxSv4C3BnIOyMk0HGpkk6/SG
 KUEY+QWqHe3Li5dcVsZvcltSwsuH5t2cHiALOC15wJsbb9+God8jLdy/O57yk8MFxDRLGD17TUW
 5W+eV72bsv9QGA0Kfcw==
X-Proofpoint-GUID: NhhhSAwSXlh-lLtrSGPDFnyDIEdMz9gG
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
X-CRM114-CacheID: sfid-20261005_173955_781261_19DC189F 
X-CRM114-Status: GOOD (  14.85  )
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

This series adds an RPMI backend to the OP-TEE driver for RISC-V.
It builds on the separately posted RPMI TEE transport series [1],
which provides service discovery, synchronous calls, memory parcels
and asynchronous signals.

This revision is effectively a full rewrite of the original RFC.
The generic RPMI transport has been separated from the OP-TEE backend,
and the backend has been reworked around the service bus and a new
OP-TEE control ABI.

Unlike v1, the OP-TEE backend no longer manages SBI MPXY mailbox
channels or implements RPMI TEE service-group operations directly.
It binds to the OP-TEE service UUID on the RPMI TEE bus and uses the
transport's public operations. No additional OP-TEE device-tree node
is required.

The backend reuses the common OP-TEE session, shared-memory, argument
cache, call queue and RPC infrastructure. Shared memory is represented
by RPMI parcel IDs and nonces. Yielding calls pass command and RPC
buffer ranges within a parcel and resume suspended execution using
an opaque token returned by OP-TEE.

The OP-TEE control ABI uses fixed-width little-endian messages carried
in TEE_CALL payloads rather than reproducing FF-A's register-based
message layout. Asynchronous notifications use an allocated TEE-to-REE
signal as a bottom-half doorbell, while ordinary logical notifications
continue through the common RPC path.

Matching OP-TEE OS support for this ABI has not yet been implemented.
This remains an RFC for review of the backend integration and the
Linux-to-OP-TEE protocol.

[1] RPMI TEE transport dependency:
https://lore.kernel.org/op-tee/20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com/

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Changes in v2:
- Effectively rewrite the backend around the separately posted RPMI
  TEE transport and a new OP-TEE control ABI.
- Remove backend-owned per-hart mailbox channels and the OP-TEE-specific
  device-tree binding.
- Replace the register-like control payload with fixed-width messages,
  explicit command/RPC buffer ranges and opaque resume tokens.
- Add a parcel-reference parameter layout carrying the parcel ID,
  nonce, and 64-bit offset and size without changing parameter size.
- Make argument-offset support part of the baseline ABI and retain
  the common shared argument cache.
- Use a transport-allocated signal for asynchronous bottom-half
  notifications.
- Link to v1: https://lore.kernel.org/r/20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com

---
Amirreza Zarrabi (8):
      tee: optee: allow RPMI transport builds on RISC-V
      tee: optee: define the RPMI control and parcel-reference ABI
      tee: optee: add RPMI shared-memory and parameter support
      tee: optee: add RPMI dynamic shared-memory pool
      tee: optee: add RPMI RPC handling
      tee: optee: execute yielding RPMI calls
      tee: optee: bind RPMI services and negotiate backend capabilities
      tee: optee: support RPMI asynchronous notification doorbells

 drivers/tee/Kconfig               |    3 +-
 drivers/tee/optee/Kconfig         |    3 +-
 drivers/tee/optee/Makefile        |    1 +
 drivers/tee/optee/call.c          |    2 +
 drivers/tee/optee/core.c          |   10 +-
 drivers/tee/optee/optee_msg.h     |   38 +-
 drivers/tee/optee/optee_private.h |   54 +-
 drivers/tee/optee/optee_rpmi.h    |  234 ++++++++
 drivers/tee/optee/rpmi_abi.c      | 1059 +++++++++++++++++++++++++++++++++++++
 9 files changed, 1389 insertions(+), 15 deletions(-)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20260912-rpmi-tee-service-grp-dev-b2ce2f63e0df

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
