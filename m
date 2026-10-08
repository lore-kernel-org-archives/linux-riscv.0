Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92F8CA6007
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 03:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=10Wc5WA0mqQSiJj8YByeoXqrHxyIocNgprNJrSs0eso=; b=fpMorofBHi2azh
	bRtiJDFcaXQPAN9rEs57CKqFJPpnxD2O1uK+YyFNwg/r9ev/jDGIfv94SpnofReED70vmu+MxOPBu
	VVMpwSAqe/E24hvPiIlt7+ECrpVZPRVUivEMBSl8Nt1p73DobXwevgICjBWvUHjS4Y4EBnOuRPa+q
	IUrz3eWtnGBoDZDfD+KH+ttUCfKyCZi/J068fTXmZpakvPuVGNjfjpOSMT8Bs8nElLWWlDvg+cDDa
	A2HjY1Gs87PUCWw62AhNqomDB5Dfa54DAVm8KbNzhoRteHIllP4hEPkB3u7xDVH5FD64I3bA6lLx2
	phZ30ZGzeR0DVvGP/HIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoI-00000003RnL-1Uwc;
	Thu, 08 Oct 2026 03:28:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeoG-00000003Rm5-1NJs
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 03:28:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6981hc2l2575242
	for <linux-riscv@lists.infradead.org>; Thu, 8 Oct 2026 03:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5gK0vuRBFrk8vBpkM5BWnX
	DfFggS1T8IA5KrEN635M0=; b=Fts2kROdMYAjKia4zIi+65KIR+xMwC/gZ2eHfi
	O9RJxWbpfJ9U8+9BCAXzJ1ga63zNX8sU2bMKEaax8gVFIaOHI48MAI0PXYvaRotg
	cmrnlMS9Mb4XWw5dRcdOoD5SyuISsSToYPoLpqWIIDeXNFRIWYvf8WP0QgbNDkLN
	1fxqS5a3Sxt5iSdxFuBmfwZT09qyDiNM2ZNTPeqqL853tRz4IOB1x66NWfuU0NUY
	Rqt7A2amwKCj2ITPgsi2IW/38kXz+g+egW+dyExpVlq/wBcVnpAk0BXpyxyVkku+
	LovvrEEN6jX2AezxcfK3WmFFXFV4tX+P6FUYgSTE8C9587sw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg8fp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 03:28:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso9286744eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 20:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791430122; x=1792034922; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5gK0vuRBFrk8vBpkM5BWnXDfFggS1T8IA5KrEN635M0=;
        b=RvkdiYb7bzH6jui33Wb5BxkePjpJ1GVSSz98eO5o3pgSHcIveIm3hRfxgeYEa8iZ9S
         TIKjTLw++QCmfoywUpRalFYxxAM3DJXCl45rx2OQVeDQ69aaMaqiBwBiuVMyM5EWni9K
         nqFv9jmPNuj7br1/kqxqEjmFQ2akLMjK8PBuD/tKt7C6ydpUG1HSVZA/DZe0Fv1qkR+V
         Oh9M5Xpgr2YKqwU+Es8WAHtz4NwwhqDllpBEjgldh+lmRDA00/26naQ1oN1LKslKCn1M
         xKe/BPRAQi1oAFaZR0r7lzyP7vPboLvShKzJjSo4e4nEWsPC/SFAcgooTcwvr38svEdv
         /8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791430122; x=1792034922;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gK0vuRBFrk8vBpkM5BWnXDfFggS1T8IA5KrEN635M0=;
        b=ztF3pEt703bbtFoXxgkErJnwr2uOJ+E5nj1WDB0fCYRkKCDg8d4Wg1ZHSKy+yJziEo
         RyxUKOeU25Dep2fWKbJr2m/H8T0tnSHpXP9IYuhXEpUU/2G+pgN96qtpj7j69e/8/GMz
         v+VWtml4JL6JhtcTHY9NVTW+wFAUOZ4kHOixvGRoK+dnuVyOgzIMBuzOEkG8ZEwo3srv
         4Di4t3tSpJJ4B5EaWqI697d1us0NlQq/ntbyackSe7YWW+vYD/xPFxMoDwNXOJL+TM69
         l6ppa9STYjX5dQFGZlFt3fT03uLx0oihIuG3kxoyG3jco+wLZLgs1gJDq317KKfbFkfq
         i1tg==
X-Forwarded-Encrypted: i=1; AKwUvBxzw9A/dnymd5f7cffCvbdl7RUBpcqWZmhRB3vR5DIIkL/L57rjfWs+H8JXwppTqS67NobRhAcInU5PqQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIN8fk/HZV42M9pTeKzMeFQbHv4vsh2gfiB0nnB1/ZG9KAKxNUF
	XzdSh55ZN9nmXqv5+u41DHDn/Y3uwCdUYFvLaqED1H+9zZG9FPUgQ6AT9elrd7g0VdNnGPCBUOf
	W6WtQgM2Nb0LqnSbGvyGC7bgTHCy+8pwxl8THof42hVcr0QT6J6yM7zJX157Dc4r5E8k9Ug==
X-Gm-Gg: AYBFou1KGOMvnAGO4qUUjnHWwNwqDhq1Xxgi2bVsrIWsWLNKGYQPTNot1eviMb1c/YR
	Hp3thfdZOiwqngkq5Y6aDgFNIOdK+p2tPHNOKhaGAyCP/fO86RjKLXjQ5MUPAmEhWX4vBIXEs3+
	LzZGTTBt4viNrQpWAB3Max5XAnezVsoqIRJnspKPPUxTr7+7IUEK14h0Yxm4c8yaDBkSNuDuz/s
	NCqWwjlWrba1WpjYtkXF6pS9qMz3bqUWigd+MLadMm5Zv9WUyGLjfy8jhFZRMcUbsVLrh0P8Gbz
	yKkgjkdsJF+tBcPrWyBG3eqBMtk0ZIcLZ2zRGqSs4USkrMMKO6Qw6GQsCjX7R/oALSTLVNpybtQ
	hqe5F8XtSJn8EJzGkRViESkh7QWFFX2EAk7mOHX4qMMdq7iBtYA2kdtPmKg==
X-Received: by 2002:a05:7301:700f:b0:350:869:d106 with SMTP id 5a478bee46e88-3515de5a743mr4808194eec.34.1791430121621;
        Wed, 07 Oct 2026 20:28:41 -0700 (PDT)
X-Received: by 2002:a05:7301:700f:b0:350:869:d106 with SMTP id 5a478bee46e88-3515de5a743mr4808156eec.34.1791430121023;
        Wed, 07 Oct 2026 20:28:41 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35179d07566sm2168349eec.30.2026.10.07.20.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 20:28:40 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC v2 00/10] firmware: riscv: add RPMI TEE service group
 transport
Date: Wed, 07 Oct 2026 20:27:06 -0700
Message-Id: <20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIsNx2oC/32NwQrCMBBEf0X27JY0rSXxJAh+gFfpIW1Xu2Cbm
 q1BKf13Qz/Ay8CbYWYWEApMAsfdAoEiC/sxgd7voO3d+CDkLjFopStltcHA0kYM08A4E6FrGCt
 VkHVFUxbWQipOge782UZvcL2coU5mzzL78N2OYr5F/zZjjgpVaZVpTN4Zczh5kez1ds/WD0OWB
 Op1XX9lLf7dwAAAAA==
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
X-Proofpoint-GUID: bbgl26Cd9Ps0asRAM99OBOr4k_Dmid44
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX/YZ5PMPKH5Ck
 7rbcG/lr0xEXlWgsh/65GYbSHQ4GGfiuZeFOj45x9e+TeGNVlYaKK9zwLP1GovV5KRZobFz8DbJ
 auLWsUUwda5SXm8VV6GhGQ2R5M8Ct44=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMyBTYWx0ZWRfX3PqesCBSftKq
 J7FD/wGidq4+/1gCjdKFPkfnWLtk8zRZMVRB6OjhBptdgVAeiWyQRTOGR9IOMifYGU3sKRpXad4
 XtNlmbdgdDnSOKgUYmXmYVDtN289e+IUZYzTItp4QTARkBD5GYBPApNHjaK1N15kZvId+eDO7QE
 3WMUtNdn6+HWrE91ss9sOGVymqSrv86jFuqKRHGFML9iG5AYGKv66p/7Hi/CZ1SsI5pdsX/ZY+D
 vBnKqt7ycIiXMjPLckS2ikK1Fwf14eZ87z2KNb3/izXrZ5cujrxXcnIYE4rKSZofqb51OrMq/EB
 xSMEDy3blbwI3Ql6Od0PZspTAXKQAEZsjkeKYT+qQKWmqsLeJkuKuHgFEFIPH2W8UmjEe3sA7Ti
 FSTNBDTWfS/74wnFg1NctlUI5lxplkQ2ZL7T179uOW39GbcbCey3V7pcjQ8hfkHb0p/PrXVgEya
 7otQaArwv8OmZJWotDg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac70dea cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=hZ86olN1w1Q2TqJtmf8A:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: bbgl26Cd9Ps0asRAM99OBOr4k_Dmid44
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_202844_382161_DE6B8C84 
X-CRM114-Status: GOOD (  19.19  )
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

This RFC series adds the RISC-V RPMI TEE service group transport [1],
which provides RISC-V systems a mechanism for Linux to communicate
with TEE endpoints. Linux and a TEE act as endpoints of the RPMI TEE
service group, while the RPMI framework in machine-mode firmware
mediates communication between them over an SBI MPXY [2] mailbox
channel.

The series is layered as follows:

 - Two mailbox patches add a direct synchronous send mode
   (mbox_send_message_sync()) and its implementation for RPMI MPXY
   channels, needed because RPMI TEE requests must complete
   synchronously in the calling context.

 - The RPMI TEE bus registers one device per discovered TEE endpoint
   and service UUID pair, following the device-per-service model,
   so individual service drivers can bind independently.

 - The RPMI TEE transport core binds to the mailbox channel and
   validates the RPMI and TEE service-group versions before any
   discovery or service traffic is attempted.

 - Discovery uses PROBE_SYSTEM, PROBE_DOMAIN and PROBE_ENDPOINT to
   obtain the local endpoint identity and enumerate physical TEE
   endpoints and their services.

 - Memory parcel operations (lend, share, reclaim) let a consumer
   driver share memory with a TEE endpoint. Linux creates a parcel and
   the parcel identifier is then used by the consumer's own protocol to
   refer to that memory.

 - Signal buses let a consumer driver exchange asynchronous
   notifications with its TEE endpoint in both directions.

This series only establishes the transport, bus, and discovery layer.
An OP-TEE backend using these interfaces has been posted as a separate
series [3].

Feedback on the overall architecture, the bus/device model, and the
memory-parcel and signal-bus abstractions is especially welcome at
this stage in this RFC series.

[1] https://github.com/riscv-non-isa/riscv-rpmi/commits/main/src/srvgrp-tee.adoc
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/releases
[3] https://lore.kernel.org/op-tee/20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Changes in v2:
- Fix memory-block address encoding to preserve the full physical address.
- Report the blocks included in the initial segmented CREATE request,
  rather than the total parcel block count.
- Correct the CREATE block-count documentation and remove an unused
  include.
- Stop signal retrieval during shutdown so continuously arriving signals
  cannot prevent the notification workqueue from draining.
- Drain notification callbacks before unregistering child devices, including
  on partial registration failure. Keep the mailbox and signal buses
  available until client removal completes.
- Allocate signal-bus state before firmware setup and use automatic
  cleanup on setup failure.
- Skip disabled System-MSI nodes when locating the notification IRQ
  controller.
- Add rpmi_tee_info_ops.msg_limits_get() to expose maximum TEE_CALL
  request and response payload sizes, excluding transport headers.
- Cache TEE_CALL payload limits during transport initialization and reuse
  them for capability reporting and call bounds checking.
- Include missing <linux/idr.h> for the RPMI TEE bus's IDA APIs.
- Replace SYSINFO descriptor-table discovery with PROBE_SYSTEM,
  PROBE_DOMAIN and PROBE_ENDPOINT, and update service and feature
  identifiers to match the revised RPMI TEE specification.
- Move discovery into discovery.c and shared internal declarations into
  rpmi_tee_private.h.
- Store discovered endpoints and their service UUIDs in per-endpoint list
  entries, avoiding array reallocations.
- Link to v1: https://lore.kernel.org/r/20260928-riscv-rpmi-tee-abi-v1-0-04908b81d885@oss.qualcomm.com

---
Amirreza Zarrabi (10):
      mailbox: add direct synchronous send support
      mailbox: mpxy: add direct synchronous send
      firmware: add RPMI TEE bus support
      dt-bindings: firmware: add RISC-V RPMI TEE transport
      firmware: add RPMI TEE transport core
      firmware: riscv: rpmi-tee: discover TEE endpoints
      firmware: riscv: rpmi-tee: register TEE services and support calls
      firmware: riscv: rpmi-tee: cache TEE capabilities
      firmware: riscv: rpmi-tee: add memory parcel operations
      firmware: riscv: rpmi-tee: add signal bus support

 .../bindings/firmware/riscv,rpmi-tee.yaml          |   35 +
 drivers/firmware/Kconfig                           |    2 +
 drivers/firmware/Makefile                          |    1 +
 drivers/firmware/riscv_rpmi_tee/Kconfig            |    8 +
 drivers/firmware/riscv_rpmi_tee/Makefile           |    8 +
 drivers/firmware/riscv_rpmi_tee/bus.c              |  202 +++
 drivers/firmware/riscv_rpmi_tee/discovery.c        |  383 +++++
 drivers/firmware/riscv_rpmi_tee/driver.c           | 1583 ++++++++++++++++++++
 drivers/firmware/riscv_rpmi_tee/rpmi_tee_private.h |  128 ++
 drivers/mailbox/mailbox.c                          |   72 +-
 drivers/mailbox/riscv-sbi-mpxy-mbox.c              |  196 ++-
 include/linux/mailbox/riscv-rpmi-message.h         |   13 +
 include/linux/mailbox_client.h                     |    3 +
 include/linux/mailbox_controller.h                 |   10 +
 include/linux/rpmi_tee.h                           |  200 +++
 15 files changed, 2772 insertions(+), 72 deletions(-)
---
base-commit: 6375e61c01e93e35ee7acd336a689ac1fae4b509
change-id: 20260928-riscv-rpmi-tee-abi-603e9a3b4399

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
