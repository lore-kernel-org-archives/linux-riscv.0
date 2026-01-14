Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1292D3CC84
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 23:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYmNSvUx6+Ee+O9zeQFOSTFyRLJWF/LoLD4afnzvVIs=; b=lvyXvNipSdavN1
	RJRsnXwUqwDusJ6x9CG+tfT5EBGqdUvUmcR066iyO+j5lK9CcZSkV/6Xk27UdCB4gPPP5KZR5lOaj
	S7zoVNYqyWD1jVyvTjnmB4PTnTRGUCVVlPqV3hMa5ke8QV/GgxvqcHPc9YyuiXFM/O0kK5T4JDZWH
	t+uwdRbt5PMYLGxwjf+rG7gs22EEpfg4YAXFj9ba0nnPanZyqeey7243RErVB+lL8+LClSpBaxM4E
	O2K3/q7IGHBXqlp28f/b2IDraxIiGncpmD3+bAtXszq4YS6yq3PBF1UrTBU0Drn19vbX1mYEnMSpI
	C1+CB1cYCwekOw3o6sxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgA98-0000000B4Bc-19FK;
	Wed, 14 Jan 2026 23:19:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgA95-0000000B494-3RMb
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 23:19:24 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0d5c365ceso2542575ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 15:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432763; x=1769037563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kaSWKwxLaghni7N9hjcOEG+LzgsthN0XWKW1He+SYHg=;
        b=MPSgMX43EZExzlagYga0YGqD4LBkVaxrUpfGuaLylGHoxD9FXnly+5Gau1U3k9Vz1I
         t6KnPKTN6fZDrJ+dEBQ2DYR1AXIzrUmx6A5474lHU2/aTJUGxDZwAsgBYipIzZDH3Jon
         OBV/ZHAdsMUUjOYfCQ1DvfNwYGuXeF/wKqQQN5194hzDIogwdnivMmVVhNgChXD6vmxz
         w12dp0EQfxEwj2TkAX6A+XMHHaycvWXB9xO8SfMBQ2cqDIltC925FMLDKtmBKFtudY/H
         bw7mKVfT35zcY1Dn8wZPymuSDMkEHZp95rd23CTKuWzB4eiJ4lai987pgiEIF3dI33dR
         Ee7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432763; x=1769037563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kaSWKwxLaghni7N9hjcOEG+LzgsthN0XWKW1He+SYHg=;
        b=qiKm9iRl7CkkUpepNGsZ7nzDoNLjYHnTjGkD64PQxIzsQBFpTw3BWFSGIprMiqUR75
         FU3iNcAfuWZXRd21s66FSvhDPeWNF77J/01e5KkhPgR8qYcVuGd4fl7uIIE6PbT7oVvI
         ErWbl8z4MMJMfKJ0vbueEaWyJTjo8e0QnhY4Zzj3ty9LavB+I7cEBry7LRXNE/YohrtL
         3pDjKdwbvkxrDiTTK8HbGF/XYFGeq0VfW4B86bEfHQnPEnYevAdJOMhCwA+WbRXyKsFB
         7bMBWdaJHJJPRc64YOVpPD4+AexQDR5ljATta3XT/oqDcctflYQdWiz0h22jXDy0zw4A
         CY6g==
X-Forwarded-Encrypted: i=1; AJvYcCUXJyoZ9ljArDrVo+XDkslIlrxWrSw9+IsvSLVYh9mK+GyXS/56mJ+5FvAYPzsk1hNma1PFaBJXQcYwsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmV6+AahbSGop8hZckv13a7i5F+VS7sHm+UFVqaW2fj6Fzg+xE
	uON2C8uwZJIiSfX4uqrd+Y1q7vc8xV7rhGgKCpPY5D49U7xTKNsiODjGMijeGgRAuEc=
X-Gm-Gg: AY/fxX4d7ALFBK7Ntb5CncNZEZeOv4eTerDJm8Yd62SLOdsOQeHF8Gj3Wkpsk/DGIlL
	hqEqLiYSQFaiHbNRnmJslrpjd7GokomFtLNub8RKGRqviifBCYlI2Ay0IltpQ+u3W0iBmN9JnyJ
	KQIWi7EOwomdeULcOLPO3mHxYRiRw0LTgrIlKrbTglYcn7Y7h9G2t1xchYSFsmOp7QqVBLpIW62
	25HcXSgczJ317fEUzuwBPHmHeQP/qFaOuwsQJ6QXYojdQj4+qbWqmcv7U3oDMwXpeWoISsfMYIX
	jE1PmEaivxXffpZA/77NN1FZRtsR7y7uC227EJODIydEe2MHKwXos/w2PZn/OirhkjiJC39zC4O
	GvNPCUQBRClkXpCAUVYjcXSf4oHSH0dL8zYkc2chk1SYnOUC61qBjdGr7NkS7zc1SH+oUJuULXk
	LFYqnB1CabXOtAbHX2BE/jDkCZty4cAZLFMhRA1Y5in5iOON+5PC+1Lg==
X-Received: by 2002:a17:902:fc8e:b0:297:f09a:51cd with SMTP id d9443c01a7336-2a599daf6afmr44260145ad.14.1768432762876;
        Wed, 14 Jan 2026 15:19:22 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:22 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 07:18:58 +0800
Subject: [PATCH v2 2/4] riscv: dts: anlogic: dr1v90: Add "b" ISA extension
MIME-Version: 1.0
Message-Id: <20260115-adding-b-dtsi-v2-2-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_151923_866441_77C5E4D4 
X-CRM114-Status: GOOD (  10.45  )
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

"b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
(Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
checking rule is now enforced, which requires that when zba, zbb, and zbs
are all specified, "b" must be added as well. Failing to do this will
cause dtbs_check schema check warnings.

According to uabi.rst, as a single-letter extension, "b" should be added
after "c" in canonical order.

Update dr1v90.dtsi to conform to this rule. Line balancing is performed
to improve readability.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch, a split from the Patch 2 in v1. This patch is for
    Anlogic dr1v90.
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
index a5d0765ade32..9fe183f5f5c8 100644
--- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -27,8 +27,9 @@ cpu@0 {
 			mmu-type = "riscv,sv39";
 			reg = <0>;
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zbc",
-					       "zbkc", "zbs", "zicntr", "zicsr", "zifencei",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b",
+					       "zba", "zbb", "zbc", "zbkc", "zbs",
+					       "zicntr", "zicsr", "zifencei",
 					       "zihintpause", "zihpm";
 
 			cpu0_intc: interrupt-controller {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
