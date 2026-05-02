Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88054CD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 05:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cLNs7Jy7J8NUyJ1j8MM2r5qECNwxjqfFEhIV9u/Z298=; b=jsxM8ese8qReSA
	l//ZM5Ur5GozEGDMyClyNq+RFI1f9f/PYiUTHCTcj29QhiAvHTE80fVfgHijTVgjxto3OPLTaV2wf
	d0x9vw8zPRHxzYTBKGop7hEcwKCU/QIoc25W/5R4AoW70o4Ls54wdmeK3W9Jj+fhonnNlASWwfl2Y
	qOVj+Icf8fA+Aij5jXGYH86/PWP2/ReiTym+Ox24w9b0t7uieUlUCqmfjaaAiBG6NP8x4a5IW0Ea3
	21IvqB3T3YnvACbD30Wi7lafyGYs9LvE89OSyzpNLk2NBPEvEVW6ijCJe5oCLDXkrbgRL5CZ66r3j
	943z8BMM2OFD3p1ZwRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ2la-00000008KvX-0ahl;
	Sat, 02 May 2026 05:19:50 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ2lX-00000008KuL-1BmO
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 05:19:48 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82faf871346so1564972b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 May 2026 22:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777699186; x=1778303986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdApWjaHRT3KmgOlTPslnfl4o6cjdKhl3SDC6pKKciY=;
        b=a2UJbEXC22q+Gw7tKI/kIPlpDfY/KCTqHV6TA9RpaD/PR+oRN/yoEF5pV/pWnEjsFM
         Eo0U2h+2/GfFNvhnTHnqATMkDHjwCb2MdZFPnfU7ou3vEAHgGEBh6y0ikwlfWU4zGmb9
         JSiEz64yAbxdVULg1c6h1YancTQ6igy4H6IOKyFmP31O01p0njhIFEIxlXg56ibQPE2R
         KzLed09LdOTSz/dfHxXG9GERwqTSloUxu9qfs7KHgsqQhZegvS70+z4JFjlKCT4/nyfv
         KmpZkYTcEeqBNlLkiHR/herQXyNun25oJhgXsdgvsP6K3Nqvlelxt87jAKa2ZIS+zHej
         mdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777699186; x=1778303986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bdApWjaHRT3KmgOlTPslnfl4o6cjdKhl3SDC6pKKciY=;
        b=mBJFjvhNemQpTNnAwCDyZVd1H8zylv5+MRzN/4w5UJgIOWlSLiR4G2awbctkWBtNku
         3gqjwxCGjIpDufxWj3b/IcCYsyf8afsIRL43mdXc5cNKagnYJhK6QGat/TSlqeeCTYp6
         BMvpBs+bhQI9mMsEsI6H6OFu0GuRd3GIX7P/5zMSeNykX4JKSuz4fIw904qS4vMatQPc
         re9O8VG6MN9/6BFsmGYz6CgWzyN45rc6YXFvHW/00OCgGTePFPuz3yBtDcDcG6+w0ohZ
         ZD+gUbr57mchlbtua4ZOCYFsSRWvvrDzaMGyvSNckPq9haJ008WrrAte4bFA6KCcCjyt
         u2WA==
X-Forwarded-Encrypted: i=1; AFNElJ+7SeX7wdaDfLuZp8YmEq4eKU0ACfg03tJUDRUTz0EB5O+bjbOqb9/OVVnFZd66k4q0S8aOLtgHOQeJiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoKud0CKaOd0leyvOWNhft363wzrbz1B8skdU0Lyv0hXu+M/IP
	mn58iX2jclZdrJaj5MhkrrZONXWCviVthwUK4sCTxTkaZ/8NAi8Jh124
X-Gm-Gg: AeBDieskmQVtq7UcOTc5+B9JsbEHDVu8tXd8jqRXYZ72f11+eOhW6d6oeiWe90S/9cm
	xiN6khahibA/KyYFBDgPeO7AoRlGyop2EB5OA4W7k0Qc196j9xu94YZtCISpBad58c6LFBkNQqy
	Iinh3OQDYZsba3lKLEEO9ga3a8LmkUF6YmC8+DhrRF53WycO46wkZLIILZFF9QVZZLtG4weUdob
	dPuS44x9VY2wWkgtOapcww+rljVWRIMe3qH3iJhIyGb+leJe0FQEElKLUSrCX71augc5xckePrm
	WjD9tLeXa7IeZnZRdbkq3+y1/ZBCyFnE1On1bGxVi2jvL8TGX3bUOaLFS7q2huN1C5a4Ou9THWP
	3Iaio9sWV3VKiCbfHzyY9AbwBaQNUxWCTJRzQ9zz8yIH8miVR5bkZ6ko1R7pu2xipeikzTb7aor
	nrUSNF2bUCvP3DO9tUuscYa41ZzcsLbB6AHMiD1Hor
X-Received: by 2002:a05:6a00:2d8c:b0:82c:7335:4f71 with SMTP id d2e1a72fcca58-8352d22cc38mr1915843b3a.36.1777699186327;
        Fri, 01 May 2026 22:19:46 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4f7c1sm4224838b3a.51.2026.05.01.22.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 22:19:45 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V SPACEMIT SoC Support),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 4/4] riscv: dts: spacemit: k1-bananapi-f3: Add vin-supply for PCIe 3.3V regulator
Date: Sat,  2 May 2026 10:48:57 +0530
Message-ID: <20260502051906.8160-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260502051906.8160-1-linux.amoon@gmail.com>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_221947_325024_53090393 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: Han Gao <gaohan@iscas.ac.cn>, Chukun Pan <amadeus@jmu.edu.cn>, Ze Huang <huang.ze@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The PCIe 3.3V fixed regulator node (pcie_vcc_3v3) lacked a parent
supply reference. Wire it to the 5V system rail (reg_vcc5v0_sys)
via the vin-supply property to reflect the actual board power tree.
This ensures correct regulator hierarchy in DTS and allows drivers
to resolve supply dependencies cleanly during probe.

Cc: Han Gao <gaohan@iscas.ac.cn>
Cc: Ze Huang <huang.ze@linux.dev>
Cc: Chukun Pan <amadeus@jmu.edu.cn>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: new patch in this series.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 3dbdf53b6d8e..6c06480ba100 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -39,6 +39,7 @@ pcie_vcc_3v3: regulator-pcie-vcc3v3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		regulator-always-on;
+		vin-supply = <&reg_vcc5v0_sys>;
 	};
 
 	reg_dc_in: regulator-dc-in-12v {
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
