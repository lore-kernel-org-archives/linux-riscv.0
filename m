Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBF4C43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 18:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OaYY0YWc0jtePZvE4J/LzQG88E+ZLiiv8FHRyQbVHa4=; b=ugsUBoEFfZCbm1
	t0skbtgmrrBbO/ByD+i8WCELieFUDMfqbrKeomqwOe7LxP0ZDxz8uBCXjARM1PNZq3iFxgzh62MLZ
	ugqMtC0VG3jqHaKxGkH6QdlFpu8FIEht5GkCHijj9cH+tFnDaxQC5XNnO3e1A/tqkrUAgfOI2d1nT
	cD8LvEvJr4LsGBmFBQ5Xvns2UvqUptzuwbDbUsrcxM2LyjeFZXXZ3HNx+yUSoTgZUaV8zzXyQ4Hvb
	Xe2fvYzlP8tmLM0nYPCFGB2x6BCl9MsVhNX+WshlVoQv7fHEBXV6558K0XhTfPi7YDh9pVEW110hg
	NUky6oq3M2d+dLux//lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9WfP-00HTJi-EQ; Thu, 07 Jul 2022 18:55:59 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.183])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9WfL-00HTHc-IE
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 18:55:58 +0000
X-KPN-MessageId: a57e30ab-fe25-11ec-8ee3-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id a57e30ab-fe25-11ec-8ee3-005056992ed3;
	Thu, 07 Jul 2022 20:50:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=MGz8SrgGh5/hCflKLJeJ+jAX4G1tQH6YpgJmkmIE+nw=;
	b=itT0+T0YCiVzm54Bfoh+ODsU+3bm5N4I20lJgwqKalFNXpCLG+ljr9vonvNUWkD9PLYAN0cf2XdIt
	 lMEoLfIuXKyfobK3hv4P/o7z8NrvOyhhwjs9mPtDiUOuGtP3isT5RcIdkw4YEyEpDP/mzUtNKPbO9N
	 0pXjYnfJGln0iUX0=
X-KPN-MID: 33|lBCj8tP3hSBtrfO5Tokf0TYKY+xl1N9saTTr9uJ3VHzpxCLYRJlHmQZ23abroOJ
 kw3pIsu4nbusocAEv7SPmG4MtyMrol/abn3ppE+HwaA4=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|cqXLFDEyk0g+mW407f2sKvaVuzLvoBkAk/A9yYS7N3NZp30e/6G1pTZP6M8b3LY
 iRZajsG+2gpSiY+FYCW0JLg==
X-Originating-IP: 80.61.163.207
Received: from copland.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 6c789f36-fe26-11ec-8bc8-005056998788;
	Thu, 07 Jul 2022 20:55:52 +0200 (CEST)
From: Mark Kettenis <kettenis@openbsd.org>
To: Conor Dooley <mail@conchuod.ie>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Mark Kettenis <kettenis@openbsd.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: dts: starfive: correct number of external interrupts
Date: Thu,  7 Jul 2022 20:55:28 +0200
Message-Id: <20220707185529.19509-1-kettenis@openbsd.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_115555_781800_922E3E25 
X-CRM114-Status: GOOD (  10.79  )
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

The PLIC integrated on the Vic_U7_Core integrated on the StarFive
JH7100 SoC actually supports 133 external interrupts.  127 of these
are exposed to the outside world; the remainder are used by other
devices that are part of the core-complex such as the L2 cache
controller.  But all 133 interrupts are external interrupts as far
as the PLIC is concerned.  Fix the property so that the driver can
manage these additional interrupts, which is important since the
interrupts for the L2 cache controller are enabled by default.

Fixes: ec85362fb121 ("RISC-V: Add initial StarFive JH7100 device tree")
Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
---

ChangeLog:

v2: - Fix commit message


 arch/riscv/boot/dts/starfive/jh7100.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 69f22f9aad9d..f48e232a72a7 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -118,7 +118,7 @@ plic: interrupt-controller@c000000 {
 			interrupt-controller;
 			#address-cells = <0>;
 			#interrupt-cells = <1>;
-			riscv,ndev = <127>;
+			riscv,ndev = <133>;
 		};
 
 		clkgen: clock-controller@11800000 {
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
