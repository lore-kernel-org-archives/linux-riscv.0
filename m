Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F65C79F99
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DWIsLPsVF6USHeERaOcNJKObDg2B4ByO2EBgXEHFubw=; b=DGKyhGAqcmTLfY
	rhD8i8znj4Micf9pMV4+Ra63lojJo4ArJcbtGFSW6WT3S9/QbgueOSPUNU1qjeTlIeKWoorDtFz6I
	3J4whGdta6/863vBAehqaiY3KJIUbGsbcE9XS22rS/R+nUxxLMT/VLQFSkYKtUWiVR/nrc3H5u67Q
	ZFvMl45GO1Y2qh1/Ex2ICaKbtpExtAJwhEHc/Cjxczt1yIwk0TrMKNGXiTvOlM7DVFwT5NP033sfX
	vA3EjtcZd1VuaWd47DHGBT6/Z0gFd2QMvblIJ0YMow4XfBZYYtUTdy9N3SidrbDj47uYrVMVFUiSw
	5vsda0VmFckAHdpDOR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yi1-00000009g0w-3zVD;
	Tue, 08 Sep 2026 16:30:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yi0-00000009fzK-37sV
	for linux-riscv@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/9QZvkOZHRFMbQlA8yETT7Zrff/My6zZYclqPzswPRI=; b=dyoFyGmunMsVgGcNzPR3UMG3BC
	DXjnIhqe/BnkkTJVxHbVGvEEYUJE6Q9jQDD8VW3D9MaK36XTD9IB9iiB3VgopvfTp6/DIrpGVoJ9H
	T+x/5Vaj65kp+fZV63cC106RokM1s5F2u6Y/gU/L6A/ffCDCNhE0QeuZ/ZO8LNKZ6noPHu0VJdXu4
	EPdMEh08aE/eAZV5DFACqg4Xmrv7qgnZwkR5yRLAsSnukHm/lO5nbIzSB577VOA5MbcmheptUcV4O
	IVeoEiA/7l7PYQzFKGBmg6ScfDzVMeFwHUB1CF6F7Pavcm1lIcviBmB2BV/S/PVDqjoOMWlourjcT
	ixi+P34A==;
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3yhx-000000005qS-1HV2
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 16:30:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788884991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=boK9vYXnxR/YWBYNjKtZZutjveIttpelz4kLBY5m3i37/Geq7mXInqMx8AEj1yrIgMKS35PprZCTt+pUN+yv6k/+WX3dSdg4VzkUTaMs4cwjlQ8fai3qJ9pQnTZ2UITpk2LoV40JnHT4ZU9FxKEDfH3FiPOqdhWtnpchyU94RtA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788884991; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/9QZvkOZHRFMbQlA8yETT7Zrff/My6zZYclqPzswPRI=; 
	b=KEJtKMdXA6pxMb1suCo4ibrsgbZdiRm8N92KvDMAiNqt2NexrypDyGPPd3RuP72hu6An012/+d72N1hBwTfD3ClWxMUS7Xrjhie/Tq1SuQbUigeNy6KuBZh1H9otDO9taA2OQKoynb7w6ovpU9FChURUeNogw4z5rCffdQ6mKmk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788884991;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=/9QZvkOZHRFMbQlA8yETT7Zrff/My6zZYclqPzswPRI=;
	b=APjkHUQqMofmkYL0mJ+nItLfYYgrxhCVLEz5oP85MLjoS/C9nSBk+UOUnRbOnmm+
	LbD1fqymk/WApxlqwMMYnacve600HoNlJyxdiTrnEFH/7uDosUcyIBEyp4kX2qlrQpy
	O3mBrQO0j5C6kWgSpd1lIzFjfbAky7U86OoRO4Is=
Received: by mx.zohomail.com with SMTPS id 1788884990679638.4373991668011;
	Tue, 8 Sep 2026 09:29:50 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:47 +0800
Subject: [PATCH v2 4/6] dt-bindings: timer: sifive,clint: Deprecate
 spacemit,k3-clint
MIME-Version: 1.0
Message-Id: <20260909-k3-aclint-v2-4-7931e5bc86ad@pigmoral.tech>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=v6JrUjrzrdCIbaOlSOoebt20KhWC8xvvqpXbkT9cQx8=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmJ9p2Xqln7uu4Xvy9eL3Pw4GbFI+/PODZbZG0bmoi
 /JZB+PXdpSyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjCRHkdGhif/Zj7s+VtrUTlx
 ssRR9/nnFKIdkz4Ile88cViCuz5nqykjw+1ZhRUJ/h4rkjVcTuh0c02Q8vP28ZXIy1s75dxyvSI
 mFgA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173006_201734_88DECD85 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

The SpacemiT K3 implements separate ACLINT MSWI, MTIMER and SSWI
devices. The existing spacemit,k3-clint compatible incorrectly describes
the SSWI register space as a legacy CLINT.

Deprecate this compatible in favor of the K3-specific ACLINT
compatibles.

Fixes: 6cdeb30db4d8 ("dt-bindings: timer: add SpacemiT K3 CLINT")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..88b9be2230a1 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -34,7 +34,6 @@ properties:
               - microchip,pic64gx-clint # Microchip PIC64GX
               - sifive,fu540-c000-clint # SiFive FU540
               - spacemit,k1-clint       # SpacemiT K1
-              - spacemit,k3-clint       # SpacemiT K3
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100
@@ -62,6 +61,10 @@ properties:
           - const: riscv,clint0
         deprecated: true
         description: For the QEMU virt machine only
+      - items:
+          - const: spacemit,k3-clint
+          - const: sifive,clint0
+        deprecated: true
 
     description:
       Should be "<vendor>,<chip>-clint", followed by "sifive,clint<version>"

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
