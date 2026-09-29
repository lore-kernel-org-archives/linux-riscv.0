Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A37CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 12:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=454hmkdvphQkLQXuN4pKv7ivnKlgHQ0FLdPseYlfoiI=; b=CYMZhCpQiCC18r
	Lz2i4m3DVn/+7HplI8IDRyrjY3ngKwbY569aja3kuhSExQ7Rr9zRRUtN7DZCUUxZHs3lIAEUsaVJ8
	DsoOj1KuisA2lOqrEj+dVAgHxaSPIFkTjU/GtS765OF39N6mHYrxxcNMTb4bUdlY7XIDTwsIIzaQO
	Zws7d7V6TOK7IYTCvEBh+8BhILYWmVci/aJLmR0vrNxexhd9+3Gjbk8vq0aCNV8PUsImVK1ZOtSew
	vb2czdymMiuEbQLP5tnzgiI13Zp11wa7htTsHRsWgmEgAKjyKCdeDy1wbDUmIxgVNCAyFoAm61RYr
	M/MjB4Rom4c+ZTYp9pBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWaQ-00000003TmZ-3zkG;
	Tue, 29 Sep 2026 12:05:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWaM-00000003Tll-3AQl
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 12:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790683525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9cJgdJ7LhmXl6+yqSKNaV6ms6joh7PI+1Jj005bKoCM=;
	b=eQjQJKNx3RRVQnBseGZMnf1AKX+ff88+pZL9ZBSQOhzp81YSytSGoPbsmdpp/Nb2/i26J+
	zCuQGRz8FK4id7KA36Hk5uPLjUXV/lUWyaOT3kLTwmBMr+9S6Yu4Sd7AjShUa8meN3zJqW
	oumlDrrBLz55A06PKMgnfCjWW2pF6XA=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-mHjXbhtcOrOFPB_95bpP1w-1; Tue, 29 Sep 2026 08:04:01 -0400
X-MC-Unique: mHjXbhtcOrOFPB_95bpP1w-1
X-Mimecast-MFC-AGG-ID: mHjXbhtcOrOFPB_95bpP1w_1790683440
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c8337b12d0so1260612e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 05:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683440; x=1791288240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cJgdJ7LhmXl6+yqSKNaV6ms6joh7PI+1Jj005bKoCM=;
        b=K/LRGRtl5ngna7rbfGDzU87CEdovWHrVP0ry9xY4T/cUt/E3EAQgqDiulwCm4XOSjN
         cfM5qofJJedNYMJSvvg4GyvCAqqme1InZ7l/jhx1BrJSfYk0gR4oI7EC2xOS8IMLeV8q
         dJSEyvGumxjw3RFhaEnehbEHQXl7Cst7L5Ej1/ON3sLVpVR/E5Sjq9EkK5lgqzbh2Ibt
         HOc+Hfi/rdyU0ihCae4BlbrGw6cYDTrmiubnsw+izz2rUbrVmONXr20ScD1UQpBvV59v
         jGl1e9Jm09NOYPpOBEIwkvMJbgt1WLaJNtPwaIlDydh9wph6yPu/W0ihZIUQyQwjszK0
         FF1g==
X-Forwarded-Encrypted: i=1; AKwUvBypPhVeknfQJWKG5sPSfhbkA/qSBIxpV5ejTdSWT5kWtAlw9LkODB+AB51AwhJSmESC0/evcbdS5LQtmA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLQXZhzrhqtzHa2EGev+6ORd28wucAYyp3RrtPjWRlqMv/8TcxW
	ozuMvdV3b/J/nxErHayxJLkD+0X0CqR/u4Tz1Qyb2rDLlMJ29j0mW7+rV9HYAnsSGkhBO0CWauo
	C3Rrt7uAzavu3GCTmgeZeAbw71W0/tPqzAER+JQrzsOrw8QmcGxdbepcUNG1ZvBBu9vLwZA==
X-Gm-Gg: AYBFou0+FmDwl4lUVYdHOyVLLeD2DdLx2kqXWyjZvSWW16MJEUlWBtx7NLNPbTOyLPq
	0p9I/K4KYuXbrXR+HST+k8AKhYyJqREb5x2kH12An5EzTaXaRnkQboadqCmttenqmZ/IQBusyK8
	n4jHKLZI7Sjr4bMMb6OZ1TUgx39G4LRJwhleciL7HkZvewSOp5SSe6SCiHiUz9Sg83XNA1uOhXN
	Q2tnORimADBkgxp24gz5QnuWr6Rgt6F7Wm4OSUabZ8ZJPSKfMt0p7kh/A/r2NzK3F7iEOMjSKGx
	SJABhWhBLAm6/ljX5MK+Apx7er/lj+X6MUeoy72kdfWNtuzO3430Zw==
X-Received: by 2002:a05:6122:1d06:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5cb0c14ae0fmr6920972e0c.22.1790683440524;
        Tue, 29 Sep 2026 05:04:00 -0700 (PDT)
X-Received: by 2002:a05:6122:1d06:b0:5c9:a610:cecf with SMTP id 71dfb90a1353d-5cb0c14ae0fmr6920964e0c.22.1790683440083;
        Tue, 29 Sep 2026 05:04:00 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde4f99222sm12410835e0c.4.2026.09.29.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:03:59 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v2] riscv: dts: spacemit: set console baud rate on OrangePi RV2
Date: Tue, 29 Sep 2026 08:02:27 -0400
Message-ID: <20260929120227.1791356-1-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RBU4PlTUkj3e90oRVZQjopKkdyH0GH_JTwgMZFUG70k_1790683440
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_050526_895688_DEAF6729 
X-CRM114-Status: GOOD (  11.82  )
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

Set the baud rate to 115200, matching what is used by U-Boot on this
platform so that the console is usable even when console options are not
specified in cmdline.

Fixes: bab8dea259100 ("riscv: dts: spacemit: Add OrangePi RV2 board device tree")
Tested-by: Vincent Legoll <legoll@online.fr>
Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
Changes in v2:
- Collect tags
- Rebase onto spacemit/dt-for-next

Link to v1: https://lore.kernel.org/spacemit/20260520111150.3300707-1-jberring@redhat.com/
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 0cf60d1985604..d8b2cace4e7a3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -25,7 +25,7 @@ aliases {
 	};
 
 	chosen {
-		stdout-path = "serial0";
+		stdout-path = "serial0:115200n8";
 	};
 
 	leds {

base-commit: 4947ee60bf48caddf5caefc08dbbc84d09fbbc6b
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
