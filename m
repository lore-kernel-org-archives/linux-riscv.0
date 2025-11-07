Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B42FCCFA1F
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 19:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N5oBuwbYZzWqHG+NZqtgTm1CZ7vNugmRQHMWSoA8T3A=; b=ltA6Q33F5q217v
	zt2C8s3r1q3O22YsJ4gV/RvpUz2Y3s5KAv7MS294RumOBD+PHX2CfTiH8cjv/DhU2mHHL+th0HScI
	dAzyZZq1TQaPWgeGVpPLetnE5uxr3FFK9zR23IfAHgdIJ7VAN9TeXBYB/z6GgCsbQDCmi7qTgAR5C
	Kv2FOrdbY146RKFxS6uUxjlBCbSLOWmujEIUuSiwgIVfqnYPFuZMGag/sZiham4sWIEM3lH/G6zlf
	RMmgqV4hQtISMNeaaDUjwmtknGB7dDrztEQhNiMmRZbR9CLqu3e9Z79Eo4bOGL0/n8niT4qWsgPSS
	t7fSqQTAlW71iAD1qQXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRwX-00000000fjI-01Gm;
	Fri, 07 Nov 2025 19:16:17 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRwT-00000000fec-2hlw
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 19:16:14 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-4330dfb6ea3so4129235ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 11:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762542972; x=1763147772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIkVe+mugmsixDMdOtfVXmcZx3cul0N4BhQxpoGzDAo=;
        b=Lc99vkvAQuRxV0ChePTCdRMPNe5muHwUiIzJ40ztvai97MMbwUIiB0F0KAamW+mBSO
         ckMwEKDUxluHgfmPiPd0s1vLaAqdrhpdPZ+DF6NxR/XzONhzPYEZG4/ITd4OYZGvdRZX
         GgitTByRgeiAcSOOsBvfQw+fVl/4lUztgRlQSQe+UCK55P+ORtfO2cN1l+CcQM3Dl51X
         XZcaog+BSTYIS0Lvj1gLF12fjdn6ang4DwPQZuHusM4LcPEQH5nNVQ5auQpyUl3INWz0
         +UiTT1TUDItJWr2yPIUnLaSyaJe21raWLGzhivIZbdcg2CqZ2eVfxW8h6ZzL4ou4bsLn
         bJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762542972; x=1763147772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UIkVe+mugmsixDMdOtfVXmcZx3cul0N4BhQxpoGzDAo=;
        b=hP270Jvaq3TBHKHYqt9By1RsjQfOx8YPLu6hZVZ3ukT8rlHqPBYLil7gSA/qLxNqU8
         fy0uuFxp/ShuZq6+hOwa5geTJaV1rsj88ppV1nuS/J5R/Xa2KsK5frF015REJu0a35sF
         DimoYgk7u7DBQN2py5xeN04wIc/6tM2abO4uCdcncYz50AslSLld5b+pirwXgsu9yFjJ
         2/43/JLmv6nvJgI1Oz5jMsRJTtB5EL9FuaGv5v56vr8Te1npN8RcyPCxUJA2OM+oMq8N
         UBlHth7ebJSGfupvHo2teSVYWiKhqlE0k8YXLrkpJR07KML9XeXPPwdeJCG7yQBWLHAl
         nojA==
X-Forwarded-Encrypted: i=1; AJvYcCVN/yP00DRk9e4ZBChTJ/Es4p5kYZiKzit0dkm6N6ktGiE/YhdsVcm/+ODYFCswQ2l7uyiPG93bkHnv9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwD+5Nb/l2onFef+FjoaYMwX/JZ21FDpFtzum+XY3gGVXdQ2GuJ
	uTKe7UTB4KNMMPPuWYNmKnsSX/rvW8pqZnf8G+R5jqlXne/+qS6bEqI6blKwjkAZNG8=
X-Gm-Gg: ASbGncuNq9m5CKfVicka935nUvQPYghbIRYvuH46VZ3bragINwJHrEJ5dweIxvkJwUL
	S9KpTgCUACTEuwS8xfhvBQU1sOvDKZlH7In3t6r86aHf0JeGCN+SEjFOKnpvp1svuJI5gV8flJf
	MBZpdlZCf7HSsjRGFuE0gn2xnmiFlwUkoSPnUf3uDWfQIHf+OcP8HNOGa7687qw3bsFfziBzJC9
	Nx6N8vRXPot4OEt3E1iFhjns23N9xiwhhpcLBLbZg6pK3J2c8raS6hGJ15hVXqIOfVPdOxQYhxW
	xcJMXARCx6KXlMJA8pzl3+ukUtqk0o25AcLrWst8quEexetN5IxQ1tzZcVUpIYcYyd25vSciLQb
	TXrwfVKi2cnaxr1H08M930CzouLABlcci7iOaVgrq/wsX9YMghHjOaUP0vtQi2TAMNzRqLSDIi7
	cTpRw5TiF1Vre+KIzNAvHfzqF6gLZZvYkmLq/z8Hqq0ED3d8epfKJ4OA==
X-Google-Smtp-Source: AGHT+IFlqajTRrH6GkEYkSY6pfJF5GBL4YJImuL4SDohElEvyYDysB5Vc0X5vM04WS5bSAaQD5USYA==
X-Received: by 2002:a05:6e02:3e91:b0:431:d8ce:fa15 with SMTP id e9e14a558f8ab-43367dfa481mr8936525ab.5.1762542972541;
        Fri, 07 Nov 2025 11:16:12 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94888c34c6asm118772939f.10.2025.11.07.11.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:16:12 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] riscv: dts: spacemit: Add a PCIe regulator
Date: Fri,  7 Nov 2025 13:15:55 -0600
Message-ID: <20251107191557.1827677-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251107191557.1827677-1-elder@riscstar.com>
References: <20251107191557.1827677-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_111613_682615_B31C1A53 
X-CRM114-Status: UNSURE (   8.50  )
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

Define a 3.3v fixed voltage regulator to be used by PCIe on the
Banana Pi BPI-F3.  On this platform, this regulator is always on.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 33ca816bfd4b3..a269c2cca3ac9 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -33,6 +33,14 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_dc_in: dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
