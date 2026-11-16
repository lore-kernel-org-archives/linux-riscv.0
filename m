Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF1D606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OvyGDooy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlEqd7Td
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nMUcNIKPjzEH/0zhECuM/ojb2Gt5WND97QYrZLZJDXM=; b=OvyGDooy4PaOkYYxVw97eEU2l3
	16J/kIQDYUoaRibs9hE/dThHTAR42E73Sy8GowMznJlPV206SMnrp7Z2Wc+AzlWkSeCciv43WpQPI
	4QQBak5LbPTsq7FFusR6Z6MTaDzCP4Fp3q4tXlruUUe6gvjZzZ6SdyXJxIhVEHygNVJscRhxqS5Y0
	LSxuUibK4V4DRtenZe7+62HqwUIVH5Y2dAcfK58ozcNXpA8mOpYRrf5xd+WHCsdm/6DchfHG67BsY
	8snKBAqIMLHuSXbP2qHe9VT12oNuDpcgTkQ/j1rTMvJ791hioOqOaUqDJwV+6WJES4Y+YnkhkfGuQ
	4to/GbBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYi-00000001ToT-0vba;
	Mon, 16 Nov 2026 07:55:24 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrYf-00000001TlY-0p7X
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:55:23 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-36dbde64409so4596349eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 23:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815720; x=1795420520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
        b=HlEqd7TdX/4ih7SQ/p/DusRRXYMcip5Yj8hkb3wvepZyYvzONASyswWDmw8/8bEqVD
         xW6UBUy2+SUichQVDtoijkD/QsO9T2YBsOf6h8pcU4c/1KIZeIZZwZsjvLj28acycNy2
         0Fmw8Q4+ZXE0jf+4yEycP8PGd0SvAkd0KImCWS1L4JEIVp0pQmpjm/0iKGgGJTNgbswz
         Xj8YVZcC7gFwZTfREV8c7nITmtk5/5cVBSugnc9h2tGo6XmT1xZcPUD+nnRGhVduo/rQ
         heiJEnMKNq57IoRXa8xXbHRAQws6KXc+rLhuYLLUNNi+FrPgXKmHYr+knwyG5MdtzV6C
         TAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815720; x=1795420520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
        b=18eqsiyk6b4lLiZHqjckEDT95J/0xC7Id9KrFnbTamsuY6SWRERdfTpnElLb/+/Q2W
         c0fVDfSYk9SWeMmplLXIuvjvqKQgaduPvPeKQkky5flVR5RU+kmGPV5hwXqe+KVod5Q3
         M0KjNhQx8VtHkQigbe5tO2KQGXu6aXAdbSzakq/JolQHn6qsdgGhx0RmDFZnX3YwYQdb
         KQ1+edQicG0rS4cihAVcwkr1CXq12HjTybrdnS2WwCYE+orEQnZEUPJn5p2WF/xwUtc9
         RyBqS9aL1/tDNtEe3REHYK1GMHEQN4JOqi6v/JEMSKku9ukOykuHAyIajzvBpGqUNVQn
         40aQ==
X-Forwarded-Encrypted: i=1; AL+hErEDL3NCTy8HeMGYLxh3arnsqOOmY/prk+N00VdaTTNF9mIOMo+9n0Ky/NC9EYLYe98fYieV6k1qTlxQgg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/SM4xeWj9wvOUabMh04MDIgu/xK84uHG7UBi0TmM+5yIorWdPR
	QsGEmGRI5nrOsBIzPOrjrAAw9hA5K2gyvoOY8xHjvCkJ6vcgERM6w7tW
X-Gm-Gg: AYBFou07O6iFIMUlOsOPaWhZ1J7TkwVRX+HYqB1Ah1fOWbd+xpt7ltDzXNW8FJkAtsr
	0G7RnsXm1H6QgddG/Rb/Cc/MPRRAPv3uQdNQvDwtU0PEWmtWE8SMrMNMEXpr2ztqN0JMkwyf5VR
	G42Je18LGzqRf87+Ak8XN/QRoemD47GrZomDmrB2gkE1Xg2OyLgaY0jbOo8C0Nbx0LTwfTnk5Vv
	oqldxPuOGV4VYmSQZcDRfJFHzEQHlvFLdUsJ2bpqQ4KfDkbX13Ls0ohP3ENnflPu8GJ2iVtSukh
	J0N1VxJPlfiGsGQzifH6cv7Qwf5IRbBXNaTUBMvXdpjCl6jhnzzOhMck4tS9rBnvscTthoiKsdV
	cIq/IfLjIUQaSee6cuIuiOYConbDnZ6BcjsGLsgAfoBaakNK2G9c99Jihm8n4ozA4tU/p2IQ2dk
	V4Z8QJql823EAcyFz1zJCH06eN0m4TyB6xOwaSBpvKtCYpLv+aEUyWbYmu6aMv4KmC57l5h0jiZ
	bNMzapCc1R6RPj5TwPsF5Int7UgHDGl37aEz/bVPoORNbrE8zFwcU3wktAL4j1uFRIIt9ABSXvv
	yuNea2pM9IeOsEUV1nkIfa91AkQm5DJEtE1+S2DNh/2j3doY0DAM
X-Received: by 2002:a05:7300:cc83:b0:37f:79f1:1a1b with SMTP id 5a478bee46e88-37f79f11a78mr2072488eec.22.1794815720090;
        Sun, 15 Nov 2026 23:55:20 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:19 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v2 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Mon, 16 Nov 2026 15:54:23 +0800
Message-ID: <20261116075423.1519438-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116075423.1519438-1-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235521_233372_DDD7C277 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
fixed-layout cells for the temperature calibration parameters stored in
bank 0 and bank 7, using controller-relative offsets.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..b548f5029d59 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_rtemp_trim1: temperature-trim@120 {
+					reg = <0x120 0x1>;
+					bits = <0 8>;
+				};
+
+				soc_rtemp_trim: temperature-trim@19a {
+					reg = <0x19a 0x2>;
+					bits = <4 8>;
+				};
+			};
+		};
+
 		mimsic: interrupt-controller@f1000000 {
 			compatible = "spacemit,k3-imsics", "riscv,imsics";
 			reg = <0x0 0xf1000000 0x0 0x10000>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
