Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B3D606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 16:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HMGHxQME;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=freeshell.de header.i=@freeshell.de header.a=rsa-sha256 header.s=s2025 header.b=gOsvNgaE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eaujI+lm1iOqj8mcN5XSZK3HUUnYyM/OLY8Dv5lUBfk=; b=HMGHxQMETtab8lIQzH9YZbf6iF
	uiN1dW2qNkTa1QHKqCOdNhGPDJBxNdK9n33vNzALn/OjJdHXJVw8FHl/ng4PmruIBXJl8mkpIsBqw
	AHMSHENJrM6dJygVPcXIPow4SzpjzuedhanYMFJ63glqb8W9ZndHVgyWZ/CGoXY/b2lCGHSUDG7yU
	FwsEdgEk5b/qQMcbfz+f8UagPPcB9y4MwVUrHgmza5Ss0aOFWFWiYnSKJpdUCpi8sST0cpdvnG3kv
	8s7cEgdHHdANkXIyGcsZtYB1CBqBdt7hHEGPAXDVg61FgRXVXZddqNxsUXgaU5u/8IU3jaKaS9oKi
	Qf6HeHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSvb-00000009mz0-16aQ;
	Thu, 29 Oct 2026 16:24:35 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSvY-00000009myG-3KGX
	for linux-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 16:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1793291047;
	bh=qeMIukEMn4FWMnKM91p7ATwhTaOx7je9JpTEA3stbbg=;
	h=From:To:Cc:Subject:Date:From;
	b=gOsvNgaEhQZCmkU6U8zhjxrvOVrfi0dbGJuVLsW4/OSPkYeBKVPRmBy5uXK8+aBeg
	 iGS6TI9ZNxu8z0P5/re0TBaOM6Apla2tz1Bvd4gCj3iVhSszESotS2LkP5aIOy/lgc
	 uoKbYJB2+vDcmewom6l9WHrm51pY/dPeyzg3qucifbIBh/e5ZaqsrrwMIIXiYF+vPo
	 2X2A40r1aLDoty3CP4Ql6RGKrC9j3DgVAtwZPw0Ip6YvosE7aU3g9K3uTfyZDXLac8
	 6JQulH/CwtpH07Y7EzN1+hDE8s/DFWhQgl8nAyEMpx7+HfOe5NKiRfqOIiF5ooZ1Or
	 aKNshhq1HWUbA==
Received: from hay.lan (unknown [IPv6:2605:59ca:364f:d400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 2DB58B220761;
	Thu, 29 Oct 2026 17:24:04 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>
Cc: E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: spacemit: k3: enable status of mimsic and maplic to okay
Date: Thu, 29 Oct 2026 09:23:35 -0700
Message-ID: <20261029162343.1896134-1-e@freeshell.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_092433_311839_EDC793C8 
X-CRM114-Status: GOOD (  10.56  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Change the "reserved" status of mimsic and maplic to "okay". There is
an mainline OpenSBI user of this and setting status okay resolves the
stall of Linux when probing peripherals at boot.

Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
Signed-off-by: E Shattow <e@freeshell.de>

---

Follows a discussion changing the status at U-Boot mailing list:
https://lore.kernel.org/u-boot/20261028184526.1887640-2-e@freeshell.de/

Moving the discussion to LKML as there are differences of opinion on
whether this should be changed in Linux or let remain to downstream
users changing this in firmware that requires it. The change is
trivial to carry downstream in mainline U-Boot.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index a5fb72e23dcf..4b3362b64e26 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1452,7 +1452,7 @@ mimsic: interrupt-controller@f1000000 {
 			msi-controller;
 			riscv,hart-index-bits = <4>;
 			riscv,num-ids = <511>;
-			status = "reserved";
+			status = "okay";
 		};
 
 		maplic: interrupt-controller@f1800000 {
@@ -1464,7 +1464,7 @@ maplic: interrupt-controller@f1800000 {
 			riscv,children = <&saplic>;
 			riscv,delegation = <&saplic 1 512>;
 			riscv,num-sources = <512>;
-			status = "reserved";
+			status = "okay";
 		};
 
 		aclint_mswi: interrupt-controller@f1810000 {

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
