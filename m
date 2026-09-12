Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0302C88E53
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Sep 2026 10:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YMSJ3mU+KcAFhvHnnAXthgZ1PCnvH2vbcmG+tCh+Hr4=; b=ISj7eqfEolutvE
	+UreTmjpQ3y0VGOpqUmBVs5Jk9pkxPdxUamKOqbblQitnyB4k877ko8g0/6Y6lK/nXnkN00gx+eiz
	K1WK0SLSXnXNAvQRKCYaYZ+bnbigNl0WuZV1OBhlbGTIg5OuOJPo5GEZhKta2pUBE8TVaG8mwo3H2
	PfCiKNHljUJ/U5bYCRjfOo/YPP8ohp+iXyPYbMvK+JKXl5dq57dAhc4xEMkmBCM4PmMUOraAo5/fA
	Uyl2fjOhVcx7tiE8mzvFukBPhf11xqMInr8aUNquiOB3dChvpccTtSGSOixdDBhJOLClktVXOn8M/
	y5GoVId4hVDDjPi96Q9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Km0-00000000lmW-2Z7g;
	Sat, 12 Sep 2026 10:15:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Klx-00000000lky-0l5Y
	for linux-riscv@lists.infradead.org;
	Sat, 12 Sep 2026 10:15:51 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68C852hP1803878
	for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 10:15:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=R5jHNQqpCxih0uhIATPS5R
	+CswhgM6mi1nkI0T2LCp8=; b=hZNawyG1cAWEXrtAytMyqklfS03eL509lBJneE
	b2VbFNBOd5m5zXDHkmAUqxntKNhlOVwtcx1/mOjxlsRg7zpPNlaHlN8G4bioqCva
	VWbNBG7R6+PnTjBdIj40swU6nbXPGIBGqNv+25uClJFoSFY+FDU6CLkqArHsUDKb
	PDmAOuT86uAAQkJVlLiWSoBY4dxCHcKrVxCAPQMFnIsLVIXvf+LVm6SLJVgiUwpJ
	6rtd9w3vJvA435vbapOsOzEz1p6FCcvCklRYok9IPml02JWekCwv/e+koo+3f8ns
	XcyFWa0RdyEeJ+e1iykMy/GHhUHrkjHRHXBiJ6+sD7CWd2Ew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c8nyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 10:15:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso2094085a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 12 Sep 2026 03:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789208128; x=1789812928; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R5jHNQqpCxih0uhIATPS5R+CswhgM6mi1nkI0T2LCp8=;
        b=VxmjHpIl6TVXnai6mpHXRcRZ/ZMizc5BXsZT9CQY068vPQnLqbse7to9HZrGXMXSH7
         swCyDnHSA5i+LlKILOGOs6bjQNhP+rIUol+0YLf2zWGSzBQb0fj7M+9w2q53wT6uqS7+
         gst5BFHQ+hG9Dx05TiqcMNIlZPV/CNw+JNefIcRumlIMShr+FJLDkSLd40t03CQjMoln
         y0dyrSaMVieJceUYg5rrEP5p9Ry8PfuBFMnhGJKJX/PNd8zcHcsj4Wky3ZfHJNaj9qxS
         dFtas6o3SI6IPIHNWEUgaNV9pD/zFXzF26d7w6noOjkgUTw47hPTomdUz/PoI3F7r3Tk
         UI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789208128; x=1789812928;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R5jHNQqpCxih0uhIATPS5R+CswhgM6mi1nkI0T2LCp8=;
        b=S6/eJwUDND4utkEELJLFUW57Uw3eXIXoFKgzGOgNHMtXb8g3tJLK3LdqQruvIsUei7
         nVHJfSDpOn2glSuI7SRyy4B6qa+4FoNvM9TUWQzVumHCPt9UWe/TKlTe20Ob+1g00Ee3
         CYzNlyFbOQG+bYdLckU5T27mf6gMO+89NqNoCDyjCzIoxoZScwXtW4YxR+g2H0FSS3IN
         AWwh1El0YvDaVAZkgRULRJpkbUcil3PRUUdfZodafjeR0gaKwotlTCDIWvgurfX9L5qK
         vYEn2zbgH8r+rDQ7uEWUMVq/fq9bA2uze6vLbEqCIX1hxAswYjJKMF9rGZWJCC+2Gyf4
         +MUw==
X-Forwarded-Encrypted: i=1; AKwUvBwZbogaEMi5YdXmebUjp4hq/OeVuTvZaMWy7g6EPVZ1G7SvaIE6H79NIVGzYJHsAx2qoY5gUK//pLwWWg==@lists.infradead.org
X-Gm-Message-State: AFuF++kO3W7m20S1dgzMD5FqAZs7Iu+718FITZ9TorXQR/HrB61VoxJV
	W6Kediui1FcV7rAt47hgnoBaPBTg6z2iqMAWCLrJH8sdl1vlW5eTR07Yz6tyn2Zoa03KWxtKoyp
	CEMS8hfZpqnA6RF+v5Jou5hjQ9b1TmT4bqYv8gDzwLDqRM1puWtUXiq7fYeLP9FUBxEIq7g==
X-Gm-Gg: AYBFou1t7tsBxdDCISIZtubVlx8XvAeu+DXZDMD1ofhiJGRaslXwIMFyRvfpW3HYXUP
	cyFXGKhcMVjq4r6I6Vkw5eakHeQabYXBXQpupQwh7HkYaV4a03TsXqFkY+DauZq63tqCofqp4oB
	RH96+of9iu+oqCxnwAlyM7YRbKSsRNjF/O4U2yV9jcu177tmev+RE7qE40GfytN/1M6BYMW+Evj
	Q2RfzqtbkTk/U0IeKbxEqq7/McIvGlMrx05KM4UUEh5tGR6M1/Vl5hgM/aJU7C4jwWg+VnuE9hn
	dsLh++fxl3rSsVdpjjSzVUy9K9zZuSdCjtlt9ekKXq4GtwyJ5JeZiTaMg6ONFPDgJLr6jZpYElL
	xGdTDOK/q2dslcFoE6d2O7uuYCF0O0o2tMUIInPHRD5PootMdBzq6PGxSKAM=
X-Received: by 2002:a17:90b:4b83:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39d9bd67a22mr13716496a91.8.1789208127845;
        Sat, 12 Sep 2026 03:15:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4b83:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-39d9bd67a22mr13716438a91.8.1789208127398;
        Sat, 12 Sep 2026 03:15:27 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33baf0ea9a1sm10340085eec.8.2026.09.12.03.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 03:15:26 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC 0/5] tee: optee: add RISC-V RPMI TEE transport
Date: Sat, 12 Sep 2026 03:15:11 -0700
Message-Id: <20260912-rpmi-tee-service-grp-dev-v1-0-1d1d35c2a859@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC8mpWoC/x3MMQrDMAxG4asEzRE4KgTatZADdA0ZWvt3qiGpk
 YMpmNy9puMbvlcpwxSZbl0lQ9Gsn73F0Hfk3899BWtoTeJkdNdB2NKmfADcYFEPXi1xQOGXeEg
 cL3AhUuPJEPX7X8/0mO60nOcPQEwISG8AAAA=
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: JJclM6CIm7IFHVwwP7XGGHlWpD7Fp0eR
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa52653 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=V1jnuoLLAAAA:20 a=EUspDBNiAAAA:8 a=MT4jQWGmPZThi4S9qkAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX05a1dq6J0hGM
 juHkTFfQca0zSHxIv1+xXM5CtlL+iPQlgJZTByMWFovZyvCKy7vlSIsM2BpZHDK7jKZYMhBMBCp
 6IozqT3kXvc72NhCaxIn4Q0OaEtEQDo=
X-Proofpoint-ORIG-GUID: JJclM6CIm7IFHVwwP7XGGHlWpD7Fp0eR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDE0NiBTYWx0ZWRfX8WoXtI9im/0q
 dE2xADbyMvQAB7xi8tsdUpO+Y6ywP+SrPIWUyFlfvgV7SUIlLD5LrvWbjgzGh5dSDHHSG5gnhWc
 Hxzgci5JoDZjDQhp8mocvfKTCq926SllhvR+DaXSyeBHaL1qmytEX8anXAAcRmRwJqLqgn+T+qf
 87nv6z9MuFEt6iNlj+HojueaCAPJ5qAM/bbOGJSX05MV4nD3JRNWyiJQ0BvGjDLjBXbwymV/vrp
 atdjMKX7nUTE11nBcmG/K0pn5nbB+bnkrjfvW42OQ/cJfJ00hxMAZEXwspKMbzEPo+BVl+fZYwy
 MvhK5+7thgJS43VyOZ+Hp7dYwWF6BNzd5nTEpiajK+0D9+J2GJrVPItmwCO2jSedB7y0YjwHXjT
 0Bm/URWPOnpAxBvCsGVITWqGfRL1+qCXYYVBb3HWTMyucDUjHBZsknrbU4fKV2lAaXatQV4rWF+
 +/cvcEZFAO8Z+7J2L0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_03,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_031549_352041_5EE61A26 
X-CRM114-Status: GOOD (  21.06  )
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

This RFC adds initial support for communicating with OP-TEE on RISC-V
using the RPMI TEE service group [1] over the SBI MPXY [2]
mailbox framework.

The intention is to provide a transport for RISC-V systems similar in
purpose to the FF-A transport currently used by OP-TEE on Arm systems.
Linux and OP-TEE act as endpoints of the RPMI TEE service group, while
the RPMI framework in machine-mode firmware mediates communication
between them.

The implementation closely follows the existing OP-TEE FF-A backend in
drivers/tee/optee/ffa_abi.c. Where possible, the same overall design and
lifetime rules are preserved, with FF-A operations mapped to equivalent
RPMI TEE services.

For shared memory, FF-A memory handles are replaced by RPMI memory parcel
identifiers. Linux creates an RPMI memory parcel for shared memory and
makes OP-TEE a receiver of that parcel. The parcel identifier is then
used in OP-TEE message parameters in a similar way to the FF-A global
memory handle.

RPMI TEE_CALL is used as the entry mechanism into OP-TEE, serving a role
similar to the FF-A direct-message path. The request and response contain
a small register-like payload carrying the OP-TEE call information and
state required to resume yielding calls. The existing OP-TEE call queue,
RPC handling and shared-memory infrastructure are reused as much as
possible.

The transport uses one SBI MPXY mailbox channel per hart. A TEE call is
issued using the channel corresponding to the CPU on which the call is
running. This preserves the execution model where entering OP-TEE on a
hart results in secure-world execution associated with that hart.

Shared memory is implemented using RPMI TEE memory parcels. The driver
maintains a mapping between parcel identifiers and struct tee_shm objects
and uses parcel create and reclaim operations to manage the lifetime of
memory shared with OP-TEE.

Asynchronous notifications are implemented using the RPMI TEE signal
bus. The RPMI TEE service group does not provide framework notification
events corresponding directly to the OP-TEE asynchronous notification
mechanism, so the signal bus is used to carry notification values from
OP-TEE to Linux.

This is an early RFC and the implementation is not complete. There may
still be functional bugs, incorrect assumptions, missing pieces, or
interfaces that need to change.

The series is being posted at this stage primarily to get feedback on the
overall architecture and on how the OP-TEE ABI is mapped onto the RPMI
TEE service group.

The implementation deliberately follows the FF-A backend and ffa_abi.c
closely. This allows the existing OP-TEE driver design to be reused and
keeps the RISC-V and FF-A transports as consistent as possible. Some of
these abstractions may need to be adjusted where the RPMI execution,
notification, or memory model differs from FF-A, while others may
eventually be shared between the transports.

[1] https://github.com/riscv-non-isa/riscv-rpmi/commits/main/src/srvgrp-tee.adoc
[2] https://github.com/riscv-non-isa/riscv-sbi-doc/releases

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Amirreza Zarrabi (5):
      optee: riscv: add RPMI TEE service group transport
      optee: riscv: add shared memory and scheduled calls
      optee: riscv: enable persistent shared argument cache
      optee: riscv: add asynchronous notifications over the signal bus
      dt-bindings: tee: add RISC-V RPMI TEE transport

 .../bindings/tee/riscv,rpmi-mpxy-tee.yaml          |   65 +
 MAINTAINERS                                        |    1 +
 drivers/tee/optee/Makefile                         |    1 +
 drivers/tee/optee/core.c                           |    8 +-
 drivers/tee/optee/optee_private.h                  |   47 +
 drivers/tee/optee/optee_riscv.c                    | 1621 ++++++++++++++++++++
 drivers/tee/optee/optee_riscv.h                    |  334 ++++
 include/linux/mailbox/riscv-rpmi-message.h         |    1 +
 8 files changed, 2076 insertions(+), 2 deletions(-)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260912-rpmi-tee-service-grp-dev-b2ce2f63e0df

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
