Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D03C531D0
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 01:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfSAOulxzyLB2RBUqiWyI+CUMCes6Xpxp2YnURWWTME=; b=3dx4LFmU1jaRLB
	1IDoTpT209H1xJ2NC7zVilCAvxo9PVof2MMTLLCzMnAi/ePtv02gpBUP7gsbWoFyVLXqg/+JD/iIb
	Aw+qqtvLwIP7dQtQx+wJ+1NCCLTVztUVlDUHTvEY4NyFpNGszj2IeuSLUqj0yB4X2s/rDytBo+1fV
	uEXnHJZyCWIFxd2fRuF+r7pTJqPza7uxQe9dDgbnpTsFXK0ByciqIYrIlFqsYBIEUTWsfmeDFNZm0
	P9JebF7xXo3uNSFLJ4TYXOvlvrxWFTULgPZDZI/JaAHqSMMmAN2rr/EX3PNChcDhQTH1C6MdT6ccQ
	XRmwLxS3aMnRRR4mnWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWH0-00000004AH0-2I3G;
	Tue, 28 Jul 2026 01:06:22 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woWGu-00000004AEl-1t1c
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 01:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785200737;
	bh=abrj0YhkjdX5tIEw1QYlhdxieuLgqQ+aot0tju4kSGo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=JNI2WuwtuIBzEoKe9qh4X4evFWllqWx6ySLc+Um73cA0whw54D40RFj0PlXxzqPOd
	 1hx7drZbbbWkbvCmdreTsTBMDg0DAT9w1/IfZFpRJ0pHucmDuvJI0MxO9I9iSiWrk0
	 E3i6haleN0oOEPbuMVy4QoRXr7MZUOtK4LwJ0k7A=
X-QQ-mid: esmtpsz20t1785200729t3d4b9290
X-QQ-Originating-IP: a2tKt8NaLB4fW8LMxzOmxD7eLoRxrdnEhFFebeT55yw=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Jul 2026 09:05:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17787826967055244228
From: Sterling-Ash <liangbaihui@linux.spacemit.com>
To: Frank Binns <frank.binns@imgtec.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH v3 2/2] drm/imagination: allow probe when no power-domains are described
Date: Tue, 28 Jul 2026 09:05:13 +0800
Message-Id: <20260728010513.1627950-3-liangbaihui@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260728010513.1627950-1-liangbaihui@linux.spacemit.com>
References: <75c9382d2bda766aa459b00321153d715254d1a4.camel@imgtec.com>
 <20260728010513.1627950-1-liangbaihui@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NAtipnnbTPeaCe3+ePoEXunKLK732IY2Mx39vHQruFW1ZY1NJW5TTLgu
	ZO6zVyaZryJEzz1eXOFHlfs43NYKhUHSovd/2td74GNOR4Wg8HCTwbVb3dQYuz3i9FVQC8T
	NXXKoM/MLapVNNIjG17WcIb+Yc3vXVPWqIogFcb0+z61n1hLiUraG7aE7X4qIaTqVmXMSxl
	QYmkNSjv694jVqQyFlqtb1ajpilqdcQ84Gvd8VWeLeMjVpNKZJXJX8BKkOX7mhyiuQOAa41
	7Jy4AF1Eolly4CKuCjBY32V8zElFV8Ewra8iYG7q763ArejUEoDWKSzroi/tkNO/Tyy7CRk
	R0derfZfqBSQAOY5uXwmd84mwopOZiJ/5U+0q+nD8F4ZGR8FbJmN+069Bxr4UHxLIh93P6Q
	Dp8FjEpj1F7wxRdgsJegooTAMj+w/cpQeHZhvaxpZYnbRJ+s0oEjp99w7HcXJxW/lOJv+CY
	44ojXGeqoq6lsZynU4HVmbxzYTJHXK8JtN+5vVhvXuDGmZBu5fw11wB/eerdthLJcqeFcan
	mn5U9RI3W4oTPtD9qbvx3izCfIaza69eOP7EPe3XlvTetRnijyLK8/uHP9u/cZ1Nsnv8Rez
	F5h19eFIbSKt+q1lQU3XQn2ZUWz5bjCZUWBS1boZdyjSyIr/paoZaxaaugxPSv4YIIkebfB
	Mf0u8mrKNiDnO0Kbov+B85i43jZP5HdUhPGqUvbCzopS7m6dqCw+bzqxoG5OpWpdYQDFbdp
	chVLEbvHyPMQ/YLt245Ky1UUlXYIB0czREA3rd1ewZxkmY2jc+EzPdw10oOtRoF3210pXq+
	YbgDrRlsQh/31uuslbbTdpLpfCxzxp1+w3RVLwe3+LhBFIfTUSeVX1PRqTlkoetAgS8iNVU
	/hL2yKqftGbJ2/NfQbh8/JuXaI/cIkvaEA1v5lpVLAjA3p7rLwGkULU160SvhnkaAbkISDl
	RWewezgbRqwyLw8BTgxemW/fWYb3B+/0iBP9sKINjjK6sc82OMONGG85dZ+UA7lhRGnEWcZ
	nmsf+qWQ==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_180617_360419_C6D84294 
X-CRM114-Status: GOOD (  10.02  )
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

pvr_power_domains_init() currently fails probe with -ENOENT when the
device tree node has no "power-domains" property. On some platforms
(e.g. SpacemiT K3) the GPU power domain is brought up by the bootloader
and is not modeled or managed by Linux, so there is legitimately no
power-domains phandle to attach.

Treat a missing "power-domains" property as "nothing to attach" and
continue probing, rather than failing.

Signed-off-by: Sterling-Ash <liangbaihui@linux.spacemit.com>
---
 drivers/gpu/drm/imagination/pvr_power.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index a71d5b35601e..5751e2d814b0 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -635,6 +635,15 @@ int pvr_power_domains_init(struct pvr_device *pvr_dev)
 
 	domain_count = of_count_phandle_with_args(dev->of_node, "power-domains",
 						  "#power-domain-cells");
+	if (domain_count == -ENOENT) {
+		/*
+		 * No "power-domains" property in the device tree: the platform
+		 * handles power domains transparently or at the firmware/bootloader level,
+		 * so there is no domain to attach. Treat this as non-fatal.
+		 */
+		err = 0;
+		goto out;
+	}
 	if (domain_count < 0) {
 		err = domain_count;
 		goto out;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
