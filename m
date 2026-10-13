Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B5BCC6B09
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 05:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H2PqUuKC7MlCgMvXorSHmhBmGjaXpefTbMLKJKU9BHc=; b=lBkQq+3G85tkhp
	yI642eA2LAeihnJgXRU3fJXMoJIHjcImJ3bMAWo2s5uSBxTvCHBfqw4urArRaaGyOiLOqNSBibkCV
	qiCuK/CUmClxXdj+x40PPKOEfZWYOPhlpeiIOyURCPJbNOMNukisH5fmuo3MIYjlWD43u4XGUWFI3
	vD8G1rI8bZJpJvLOuD2P7ax/4+nNwZCzIlnem6bkVkn4BIZz8ZltisbB1tHWHYyFvZTHlcuNRP3Mr
	PF8dhDJBoOnaeJMDragK6U3cOX38C0+gXxai3rS/Xxn6/BUGGMHWan09wlU3gn3KeKQncf7lCtWVO
	9UBiqvcrvFKYC3EQp5Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVGp-0000000C1xJ-0i1f;
	Tue, 13 Oct 2026 05:41:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVGm-0000000C1vg-3KqO
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 05:41:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21jm92620908
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fywdYSI+QwC3MxSFOMdWKg
	lnBFD0ZX+8NEQ03S4/7tA=; b=gqdYoTgZGf5IjK5iUfVOUexRw3UKrGN6us/1gm
	IUlMQFYerLX4BtF5n2YMb0M+BsEwQClp+WuY4ZdGO7R0Y5IP3RVhp40sLp9TaZhz
	LAjwZFPF6d3iXQQo+5QJhXP3EjSm0hfTOeqkB3Ehj4ShFIg9l90tastmJb2XH5rv
	6IUfqXw2aMg3i1BdCF6pVYT5M0hLNFU1QAizwO5B9ZSTx5muoM9yBDXnQEn4+dN3
	Sa8+oQQLZatkaJ8cj6SWUBSIImg4JPKhb7z7wLIbuXBNlF8s5rVuJD2De/rNrvJl
	RXvh+t7XP+1cZXsmbOvDaK0AV+StZe6FcD2CrAM8dJQzmO7A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcvb5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 05:41:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so2663380a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 22:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791870107; x=1792474907; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fywdYSI+QwC3MxSFOMdWKglnBFD0ZX+8NEQ03S4/7tA=;
        b=IWiBFxg/1y7UXnCis6TSWmIf1cEARoN2vaq75Zyrffw4qxr95rVQ1qhZwZC/U6Kdaj
         lPSXvzK0DXpnA+2n1z9n9J7bgOxHOXa9ov1aOFiTMDCNvMaJvsqGxtyHM0/SitVMJ9Lk
         /6WhiV4Ejmbqbdah7klLU4ELj2R/02L+wUUR4rPObiWdsOSKCzJZ9z2iNId/fq5DOlLj
         Ets4agN+jBA7EvEXwGurLJT4ebDXqwS0ProRIaNk7kL6FyUFYZT70xdYUizBiihz+goH
         29H4zg8aW/J+1eWjdBqKZTS68QNxNd62dsX3BA4z192u1+rRIDIa31Pww4rNg6Rf5kOD
         ghnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791870107; x=1792474907;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fywdYSI+QwC3MxSFOMdWKglnBFD0ZX+8NEQ03S4/7tA=;
        b=a9FzkdzBidxytkqzVdzEcLDJi8RTghvumHGUclZMDZeBmDu5Qd08WfyH942Yy5wt4a
         e2fA/zH/mrthc9MTtFMUnrHPbvjxvFteLxs66GHv7TrMqwhmTT4vHbj9YFz+zXjyydF8
         /LH/EALN73DosM5KBnn9tr34Jl9Eq88s3ybxQiLAopkDUiPcEzjcipvoiMcLSQMcMMLR
         rtoezqgrYYcH4cgnYbp7hDDQmju8Z+t0DnFy+YXVklGlJKsg5djK3AYmfepVTkh2Lhf5
         bXobrpGF3CXa60cFqzY3n9jPloK9CxXBPHR+xC2MAfXynY/nnOM/RjUag5e8zLww1G/0
         7AAA==
X-Forwarded-Encrypted: i=1; AKwUvBzi/RBRGUbtgO8PTfZHxPwJkLmLMk6A/AL0iJHjn13hnYqU7euzkAjv8g2ibf2/8V9pJG5c6AXpPYpiYQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJwnhcVpVmf3Gt0mQQ7hDknoah9gXc/gY9QEQ0ruLjcuRTjhT5e
	rqVYBJ4uZT3o4HrqxrRRmDwarhJ17pXjSIG3C6lLAz8jAdNxMJkYyqf5r0hbtRfvM3haKv4XpkC
	l/2LlOAZnCg+XrT0ntgON5zDhGfIBD85g1VF1ZJthRcB/5cgQu7LQDrTwuLASBviLXt6eBg==
X-Gm-Gg: AYBFou3fkiOiiO1lqY+DhI5He+Wyy/NGirMftnxznMJQLnM6zG+8iG23T9s0z2mP6Hk
	OwtiBS0f65zNG3i2pbG11/CJNy4KlP7PcE2pYOswkY+smi/h45TRnRj1QN1sHEutv3L/oGohWTr
	MpjGKat0jV2YtmzOGbxRSCUGI8zZVg/WGUYdNh16itsRmn4ttuvPagOK6ARqLFFnEpE9YoEah7i
	T1QfimqIAALh9Gmet1RGdAduO86CPgTa+SJcwq9xPdlCrTSsKPfrNhuHQE/kp5mvsvL7MlvarhX
	1jJze9qxdNiMFJF7Lv9JTRjCBNilhFaxpmgdum2Ll2eNiOsp+z+hYpeI6iEKkhckOnjVWKvPj/1
	wiU4rzNuDt5ZMOUXXguGaV657csQOLuVFWKwesKWh4JR2la4P8kKRgc4xwA==
X-Received: by 2002:a17:90b:28ce:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3ab3a79df67mr9708196a91.29.1791870106699;
        Mon, 12 Oct 2026 22:41:46 -0700 (PDT)
X-Received: by 2002:a17:90b:28ce:b0:3a4:85c4:68fc with SMTP id 98e67ed59e1d1-3ab3a79df67mr9708173a91.29.1791870106161;
        Mon, 12 Oct 2026 22:41:46 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm22926361a91.11.2026.10.12.22.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:41:44 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/9] tee: optee: add RPMI backend support on RISC-V
Date: Mon, 12 Oct 2026 22:41:27 -0700
Message-Id: <20261012-rpmi-tee-service-grp-dev-v3-0-975b574667e2@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIfEzWoC/4XNwQrCMAwG4FeRns1oUzadJ0HwAbyKh9mmW8Gts
 51FGXt3Sw+eRC+BP+H/MrNA3lJgu9XMPEUbrBtSkOsVU10ztARWp8yQY8VrgeDH3sJEBKkYrSJ
 o/QiaIlxREZpKEteGpfroydhnps/sdDywS1p2NkzOv/K7KPLpvxwFcBBaaFkqbLZlvXchFPdHc
 1Ou74s0sh3x4wnOyx8eJm+DBhEJJSnxxVuW5Q12Ove/HAEAAA==
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
X-Proofpoint-GUID: rvHJ1KXVmUR0ZPKf5dUc4lWepxv1uPl4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfXyREMrzWpiqsu
 o2NLikbIjp0QetILprjF0EfHyTV08cYHKoa7ARsrrimWJ8ySni8GedxMaG6pRxMy6sdbl9QfIOm
 o/uobKF7Qjkc+5M3hfc7qzsle7jaRH0=
X-Proofpoint-ORIG-GUID: rvHJ1KXVmUR0ZPKf5dUc4lWepxv1uPl4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyMiBTYWx0ZWRfX/I8gpfzsRfHG
 8v41V+DE+iXGhBuvMfSQO+nHdBZ0bvkSR7vvY2CUSC5ZfYSVWiRWZ/A097YyU6bw2LBBEJUbWU8
 d6QKa8kY8K/ORyyaaX68T3Ru7AbzO3kGHwtU1TFHx5v5YiGBNSSy+Daz4Jl5nEyNu2NBJgsqUpF
 wH1O+1r71V493VBu9j7X+3gJAQoNJvnEm1+4CLnaFhXDXWNZxUk2vvFr0lwDiltfxzPEz6qxFU1
 bUBB/MYjijgwnMTQYH/C7DP6BCENIcNKodKG/E4rz2pCzee8rK1Iur5nhDeZYxB25O+mWUKgwpg
 gTZRCM7umfBRPDkgrnm7oFSWxBe3ugmDqAStj0dxUsYjamq63FIS1RCX1imnS9zC00SbmZYBjIQ
 4zej3jmlmwk18WwScNoJyVoW/WE8jMpEnhAMZALRZVCVWgnt8cToVCi/k+GI7kyUxIuZH6E53Ip
 XuNuJYUBRllnuUjhfXw==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acdc49b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CKDX5oWuAds2uq8u-J8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_224148_869866_F36B6A33 
X-CRM114-Status: GOOD (  15.11  )
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

Matching OP-TEE OS support has been implemented locally. OpenSBI
integration and end-to-end validation remain pending. This remains an
RFC for review of the backend integration and Linux-to-OP-TEE protocol.

This series depends on:

- The RPMI TEE transport series [1].
- The OP-TEE notification bitmap fix, which allocates space for the
  inclusive maximum notification key [2].

[1] https://lore.kernel.org/op-tee/20261007-riscv-rpmi-tee-abi-v2-0-45939a13d223@oss.qualcomm.com/
[2] https://lore.kernel.org/op-tee/20261009-fix-tee-max-keys-v1-1-1462d96bf438@oss.qualcomm.com/

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
Changes in v3:
- Use GlobalPlatform TEE result codes for OP-TEE control responses,
  keeping them separate from RPMI transport errors.
- Combine the parcel ID and nonce into a single 64-bit global_id.
- Make resume tokens opaque 32-bit values and track initial versus
  resumed calls separately.
- Remove unnecessary __packed annotations from the OP-TEE ABI structures.
- Share the global-ID-to-SHM mapping implementation between the FF-A
  and RPMI backends.
- Replace the fixed SHM nonce with a per-instance IDA allocator; reuse
  nonces after successful reclamation.
- Report the maximum notification key instead of a notification count,
  and use the negotiated maximum during initialization.
- Consume capability-exchange results during probe.
- Remove cleanup macros and use explicit resource-management paths.
- Use rc consistently for Linux error returns.
- Replace unnecessary unaligned accesses with endian conversions for
  naturally aligned ABI fields.
- Link to v2: https://lore.kernel.org/r/20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com

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
Amirreza Zarrabi (9):
      tee: optee: share the global shared-memory ID mapping
      tee: optee: allow RPMI transport builds on RISC-V
      tee: optee: define the RPMI control and parcel-reference ABI
      tee: optee: add RPMI shared-memory and parameter support
      tee: optee: add RPMI dynamic shared-memory pool
      tee: optee: add RPMI RPC handling
      tee: optee: execute yielding RPMI calls
      tee: optee: bind RPMI services and negotiate backend capabilities
      tee: optee: support RPMI asynchronous notification doorbells

 drivers/tee/Kconfig                |   3 +-
 drivers/tee/optee/Kconfig          |   3 +-
 drivers/tee/optee/Makefile         |   2 +
 drivers/tee/optee/call.c           |   2 +
 drivers/tee/optee/core.c           |  10 +-
 drivers/tee/optee/ffa_abi.c        | 133 +----
 drivers/tee/optee/optee_msg.h      |  23 +-
 drivers/tee/optee/optee_private.h  |  73 ++-
 drivers/tee/optee/optee_rpmi.h     | 263 ++++++++++
 drivers/tee/optee/rpmi_abi.c       | 972 +++++++++++++++++++++++++++++++++++++
 drivers/tee/optee/shm_handle_map.c | 138 ++++++
 11 files changed, 1498 insertions(+), 124 deletions(-)
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
