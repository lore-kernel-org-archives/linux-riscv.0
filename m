Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BD9C25B67
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 11:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=4Y/TBmMi35bK150ArlRgxkhHX2hFlA1tbSiCjY5CmEs=; b=xCvEd3Op/BjIsr
	cm8ZJhS9bbQai9p5oQuYC5KeQmy5ifkEj6SoA7Vi/n6MTIpB7MCwP9lBxSgR2nQ3UdzZGLJtoEcCY
	09aoieG1mjVvVVIVD7O34b57J0VlRXLk9wfKtr3jd6VSop6wHrSX25NP+f/t5Ca/Ka9gfeLxp2Ugv
	6u7HIpQstRe7/sZ8qJaSboK+KeKgoWNXQ5ePg22pUTiNVIF42oxR0mhnw2QNsRn39of6ZBAbgrdsK
	UBqDYA5vSS0/SV67L8yeoiE7Rpyd/rzw9qdFRSCK9yUGFOWk1QDQJmpNaz8gdf2V62W0jT432PpVS
	xFNGgXuJDE89lExwt8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwL8A-00GK0B-2f;
	Fri, 27 Oct 2023 11:35:58 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwL87-00GJzi-0W
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 11:35:57 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20231027113548epoutp04228efe6475b09ec5b3cb9483deade6f4~R88H3aDZk0258602586epoutp04P
	for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:35:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20231027113548epoutp04228efe6475b09ec5b3cb9483deade6f4~R88H3aDZk0258602586epoutp04P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1698406548;
	bh=o8zC97W40HaJAtd94JYOgrGY5d3qk2mLoKwpUP01vpQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=ha2eGpi2EVwiu2FlxkU35zZ2qmfFzW84oBbb2ypeiwqOAGvQv09fBdlcPU3p1imNs
	 J+G1AHX88GmTKfzrZgVbQNpgUG6LQVQfF7yXjsx78OuQ9F+3BR0OmjpfdrZ9Xfbfij
	 fJRhXM5OhzAosEwB6ngzIaVwYNw0SfwYXrkRIv8M=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20231027113547epcas2p3c56d232b48b7a08bf35b022d2d6f0c17~R88G7z-PD2506125061epcas2p3P;
	Fri, 27 Oct 2023 11:35:47 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.102]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4SH0wM2dyxz4x9Pw; Fri, 27 Oct
	2023 11:35:47 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	6C.9B.10022.390AB356; Fri, 27 Oct 2023 20:35:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20231027113547epcas2p1c6b08e800408ee234230d3d02b8301d0~R88GGKz1t1816018160epcas2p1I;
	Fri, 27 Oct 2023 11:35:47 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20231027113546epsmtrp2d13d2c113cbd8e67c6415d71835676fd~R88GFmq-i2930829308epsmtrp2p;
	Fri, 27 Oct 2023 11:35:46 +0000 (GMT)
X-AuditID: b6c32a47-9a3ff70000002726-60-653ba093ddb3
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	39.9F.07368.290AB356; Fri, 27 Oct 2023 20:35:46 +0900 (KST)
Received: from cometzero-ubuntu..
	(75-12-16-202.lightspeed.irvnca.sbcglobal.net [75.12.16.202]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20231027113546epsmtip13591f878ceadc6405ae2729e829bde04~R88F6qP-31293412934epsmtip1w;
	Fri, 27 Oct 2023 11:35:46 +0000 (GMT)
From: Chanho Park <chanho61.park@samsung.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH] riscv: defconfig: Regenerate defconfig
Date: Fri, 27 Oct 2023 20:35:25 +0900
Message-Id: <20231027113525.2227513-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrIKsWRmVeSWpSXmKPExsWy7bCmqe7kBdapBsv2CVls/T2L3eLyfm2L
	bZ9b2CxeXu5htmibxe/A6vHm5UsWj8MdX9g9Ni+p9+jbsorR41LzdfYA1qhsm4zUxJTUIoXU
	vOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zByg1UoKZYk5pUChgMTiYiV9
	O5ui/NKSVIWM/OISW6XUgpScAvMCveLE3OLSvHS9vNQSK0MDAyNToMKE7Iypl08yF/TzVOz6
	/IetgfEYVxcjJ4eEgInEgsaZbF2MXBxCAjsYJSYf/8wM4XxilJjYcokJwvnGKDGl5SsjTMup
	T41QVXsZJV58nMUI4Uxjkpiy/S87SBWbgK7EluevwDpEBMokzvyFsJkFfCQeL7rOBmILC5hL
	TG7eDlbPIqAqse9fK9BUDg5eAQeJR0uSQUwJAXmJxQ8kQCp4BQQlTs58wgIxRV6ieetssBsk
	BPaxS+w6vIcJ4jgXiW3HnjJD2MISr45vYYewpSQ+v9vLBjGzXGLHsiSI3hZGiea2PVD19hI/
	bk5hBalhFtCUWL9LH6JcWeLILai1fBIdh0EeBAnzSnS0CUE0qksc2D6dBcKWleie85kVwvaQ
	2LN7EdhhQgKxEvd+TGWcwCg/C8kzs5A8Mwth7wJG5lWMYqkFxbnpqcVGBcbwKE3Oz93ECE57
	Wu47GGe8/aB3iJGJg/EQowQHs5IIb6SPRaoQb0piZVVqUX58UWlOavEhRlNg4E5klhJNzgcm
	3rySeEMTSwMTMzNDcyNTA3Mlcd57rXNThATSE0tSs1NTC1KLYPqYODilGphyqkx+zWzcxPLK
	pD7r1OXXSyaw+Sc84Ar8kf/gh0Kh13Opl1FLReQMTr0LaK0+9TOyYI/VNZMuhq/e7yazafFy
	+3e/bDLUOfSQ+910mb4QlilBgUJsCtx/aivzdqyNaHsZ/pHZvDHxwtRYh+KT+2aefykmdr4p
	gvfPzWkLd++e/bTbZL6pTkx785s/k3nvf331+JfWKTUJDU+fxqIm8S+cE1JERCV6d4jWiu5Z
	Ybil9N3S4I0Flu+kzrNwL9z59uec3GURX8O/mb5Kmm/a7Vf1UyRWOqHSRujDv0n7zZ1W53/r
	3yZ3XHZfgoC9bYVf5or8fbWKve8yy1dq9y97lb5fRynzn3/bwQWSl3c5CCmxFGckGmoxFxUn
	AgCoWYefBAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrILMWRmVeSWpSXmKPExsWy7bCSnO6kBdapBoueWFhs/T2L3eLyfm2L
	bZ9b2CxeXu5htmibxe/A6vHm5UsWj8MdX9g9Ni+p9+jbsorR41LzdfYA1igum5TUnMyy1CJ9
	uwSujKmXTzIX9PNU7Pr8h62B8RhXFyMnh4SAicSpT43MXYxcHEICuxklpn38xgaRkJV49m4H
	O4QtLHG/5QgrRNEkJolpz3eCFbEJ6Epsef6KEcQWEaiQuHDiMguIzSzgJ3H41RFmEFtYwFxi
	cvN2sEEsAqoS+/61AsU5OHgFHCQeLUkGMSUE5CUWP5AAqeAVEJQ4OfMJ1BR5ieats5knMPLN
	QpKahSS1gJFpFaNkakFxbnpusmGBYV5quV5xYm5xaV66XnJ+7iZGcChqaexgvDf/n94hRiYO
	xkOMEhzMSiK8kT4WqUK8KYmVValF+fFFpTmpxYcYpTlYlMR5DWfMThESSE8sSc1OTS1ILYLJ
	MnFwSjUwhaRcalJyEfFV18t5G/7w6OZ2loMT/9ZMZ6j/ruT1gmvX/b67Sxvi93Rc1Lp505Hd
	0oxbVE7u91nPKvODgafkuL/J/ZZgceeoCT9vuic7todxi7/YxHVuzfbdrhyv51v8Z84/cCbx
	n9fDK+vZ/i5b/W7OlnjTjsJ3CpueTJ+ypXxXrsbHdy3r93u7X0ubfNMg8L+IjtROxZu7FtjM
	V0hPnhUWdnUDj9elHa5vXKUUpy8sX2L4YKGNUrNQnZrEyhvmd0V/zfHzM/1nLr5JNcpnluiX
	4+fmf/QoXMYlaHYvM0O+LWztvyssyQ5ndn4s23Sz00zp/tvAf2WmFcuFhGbzTvfe+rdjhlyI
	XOgzpyc6SizFGYmGWsxFxYkAD3WT6LQCAAA=
X-CMS-MailID: 20231027113547epcas2p1c6b08e800408ee234230d3d02b8301d0
X-Msg-Generator: CA
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20231027113547epcas2p1c6b08e800408ee234230d3d02b8301d0
References: <CGME20231027113547epcas2p1c6b08e800408ee234230d3d02b8301d0@epcas2p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_043555_819060_FE3E6681 
X-CRM114-Status: GOOD (  11.49  )
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

Run 'make defconfig savedefconfig' and copy the defconfig file to
arch/riscv/configs/defconfig.

Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 arch/riscv/configs/defconfig | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9eab..83fa02611284 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,15 +27,12 @@ CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_ARCH_RENESAS=y
-CONFIG_ARCH_THEAD=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
+CONFIG_ARCH_THEAD=y
 CONFIG_SOC_VIRT=y
 CONFIG_SMP=y
-CONFIG_HOTPLUG_CPU=y
-CONFIG_PM=y
-CONFIG_CPU_IDLE=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_ACPI=y
@@ -43,12 +40,9 @@ CONFIG_JUMP_LABEL=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_SPARSEMEM_MANUAL=y
-CONFIG_BLK_DEV_THROTTLING=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-CONFIG_UNIX=y
 CONFIG_XFRM_USER=m
-CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_ADVANCED_ROUTER=y
 CONFIG_IP_PNP=y
@@ -151,7 +145,6 @@ CONFIG_DRM_NOUVEAU=m
 CONFIG_DRM_SUN4I=m
 CONFIG_DRM_VIRTIO_GPU=m
 CONFIG_FB=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
@@ -183,7 +176,6 @@ CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_VIRTIO=y
-CONFIG_ARCH_R9A07G043=y
 CONFIG_PHY_SUN4I_USB=m
 CONFIG_LIBNVDIMM=y
 CONFIG_NVMEM_SUNXI_SID=y
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
