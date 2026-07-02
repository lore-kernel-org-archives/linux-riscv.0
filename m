Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A28C43602
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 02:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KZHaPyBfV8wud7rqa9uIaVsUby5WNumc+X7rMP8PZ2k=; b=LrLkfZEwXmF0fU
	fEzXDmX54ZTtrpQbC4+W0XkI7jO8ScbShf9DSZkwZJUjCrbY9hyTMgzPeb8Ux3xTSjaUwRhsvHzgA
	O8Whf7zysIAVMOqwYacOibTf6Nv0SYLdPQV4j7em9rhaLAj6udTW9ZLNPEN4doOnL8nzpkkHZnRx3
	XH5JBqeYIa8SuwFPCPuhifo0+R9KPaN62aYgxvI8+cpUxta8uyUIMUXAn0JV7Tbef+9e1Wz2iuH9X
	k93AhOJ01vvePx3OtbuUr+1gimo3vmZvIdBPmcfbeJWjh3v+0cFHEMOvQ5LtvLKEJLabRAeoXvX7r
	HofgaT7Jmh2c7CIdoKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7Dg-00000003QRl-3TXQ;
	Thu, 02 Jul 2026 02:32:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7Df-00000003QRY-2Pux
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 02:32:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DD43843FAA;
	Thu,  2 Jul 2026 02:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A091F000E9;
	Thu,  2 Jul 2026 02:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782959522;
	bh=0mzufPi/gcdYrtWTe+eFUdf5gAg5oV6c3Nf6kNqYd38=;
	h=From:Subject:Date:To:Cc;
	b=TiXMZpdpoCbUEgRlXTvmzBNivUO+fTxVuM2YuxXa7yyh/yxhSnNGdT/Q3Z73VVlVa
	 iUs54TF8k0mTEz3hv6qhx7kKZB8xBY+sQCa7RGkWqDGcRn4N326A2j0iiW8LeNhjKg
	 6X4k1vs1LilXbfcevocB6E7mXa49LXGS9FDHcu3pgiDWHMH5Oqz7cEfc093faBfnm5
	 9qVb9p4h0PbjWG3BPO/JHbcEUATs+D4NMUjOuxsNdvlHz+hxwwPDbAYxRpu5qVnW7N
	 k3efegEyVGsKDBEUdJGsiDz9PkZRfNlHDiq6zF4U7rFW6kUkbFC/BevSMf7VrhyqdU
	 tx3XQ84MjckLw==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/3] Add UFS Host driver support for SpacemiT K3 SoC
Date: Thu, 02 Jul 2026 02:31:34 +0000
Message-Id: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIbNRWoC/yXMTQqEMAxA4atI1hOI9YfiVWQW2okaB7Q0VgTx7
 tPR5bd47wTlIKzQZCcE3kVlXRLyVwZu6paRUT7JYMjUVFOFZPFbYBwUNXq/hg2d7QuyXOYVG0i
 dDzzIcT/b92ON/cxu+4/gun7b8bPQdQAAAA==
X-Change-ID: 20260605-08-k3-ufs-support-c8b308e415e2
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=dlan@kernel.org;
 h=from:subject:message-id; bh=0m5J9NbGxKRymNVGA9lJ8TLozdjBBPgBgLpzf2DlPwE=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqRc2Qb2OLDYHTyGsT/k/gIcqtfxuquTB0Lo0UM
 dxEgNRRmpaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakXNkBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3yzQ/7BopnXC574D0cLsH6ODlTjX4GyGGbiaaqryxYBq4AGrhqdG7R7N5s8
 wDrUZJnVSdVeyeg+jdC2Um32WnirRL0213BgTpU8qnMtFhxoyUvQe919w9aUSym7TXShfflCa8a
 7Q7Bl4y5GAtdbm509OYiQowUDQNQL2mU5bJaUsNnIJtGEpxrRBOtGP4cPcb7JvZ4o2i7UwFVre+
 GYtSTFGCvftXTe8tTvAZue0Mm+mTm4tQVBmj0pFeb/I2E0LdB24sb0lQy7Ipp8Z8X1t8tLNJNdB
 YPH0lsEY8K7JpTw7esgZieH89jDqvVWrF0zzZy3lS5RYjyAb8y/UKoML1znQu7/HLzdM//beYnp
 U83asFtF+NxE+GKDtMfrzv4HYwM6AOe8Us6IWwlWQuoiNcAZ9affOnzZwOoRBVkSnSuAOJsNLOd
 PukY5ZsFQrsTgtIgEWCU3jcjZjTXV0qYf0WlRU6HKqzdeeFnC5OyVcx+Y5qFQwiXf9eYZs44B96
 o51TKLH0C9uKEM30B/c0z5Yq43z+UKMAbsrZxLVBhQMCloLmNT/lu6Xgr+ZVN244/oEp/LjAZGc
 YUjTnxS4ubuj5ce9x2uUFPP9aSeLJlYk32OqTjJJE3w85DTcjffqZYM0Vxpzj9i4hRgYVo/k3X0
 /NdhOBvuSdAx00WnzcCB5Juak5R2RI=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

This series try to add UFS support for SpacemiT K3 SoC, the controller
components consists of System Bus Interface Unit, UFS Host Controller
Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
Management Entity (DME), Transport Layer, Network Layer, Data Link
Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
block diagram can be found in SpacemiT website, chapter 9.7.3 [1]

Please note, in order to test this driver, the UFS clock driver[2] here
should be applied first as a prerequisite patch.

One known issue is that the device will occasionally raise BKOPS interrupt
when doing some high load test, log from dmesg shows

[  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_event_handler: device raised urgent BKOPS exception for bkops status 1

Link: https://spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=en [1]
Link: https://lore.kernel.org/all/20260630-06-clk-ufs-support-v1-0-cf7521d1d0fe@kernel.org/ [2]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (3):
      scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
      scsi: ufs: spacemit: k3: Add UFS Host Controller driver
      riscv: dts: spacemit: k3: Add UFS support

 .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  54 ++
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts     |   4 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   4 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  13 +
 drivers/ufs/host/Kconfig                           |  12 +
 drivers/ufs/host/Makefile                          |   1 +
 drivers/ufs/host/ufs-spacemit.c                    | 931 +++++++++++++++++++++
 drivers/ufs/host/ufs-spacemit.h                    |  90 ++
 8 files changed, 1109 insertions(+)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260605-08-k3-ufs-support-c8b308e415e2

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
