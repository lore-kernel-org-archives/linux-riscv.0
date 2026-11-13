Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B17606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 02:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NCt5Nx+c;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0JCasRD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=L4YaKk33Ep4lcon1FTV4n0dGXmEs7GRIZI4h71N8Kkk=; b=NCt5Nx+cfhCRyonai4Q2tUDgG6
	9aMDc8iU4KO9cpK37wTee/fgzdXmQmk7o9I0S/CrNIGYrxUG3XgIVrWQXGOu+w50BhN0nKJNkgYkN
	fROv+ECB40cK2epxMSpDTH3fOw7+daNstcSnv4PdmC/Z5QJ3zDu8Wo/koWTm1JHBAkZ/9IIYW++1U
	+CTbLGP4qZWC9GsnwClVdgYTjBmY2EjWcfXt/CcqEAm7ycgd2awXOS9PAhGlQ6EDLXw83V6/EGB23
	HWNRh2xtfpbPbAaKJNefWVZO+FKfPOCqcZ34WiimiSpFi1XWdLW0P00uZa9dUvF3dBT6bcs3wvvin
	Av+vOHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRh5N-0000000BV1u-40Bm;
	Fri, 13 Nov 2026 02:32:17 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRh5K-0000000BV1Q-3nkx
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 02:32:16 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-53644ab1f7bso5997191cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 18:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794537133; x=1795141933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
        b=H0JCasRDDYRpuZAH7a/Po9Z9mknvmK8iWu0F9S41GBkfve0Te8rZw7ESPyKx02Mq7P
         k93ld6OlbNN/Ek/HI/0MX8sSxZa5jlm4XdtLijPEDdOjTVeiLJ4Py4cNfR3cQ/RSsr0u
         BYEkBr3sDk5+5VrbDnTRVCQX01zIAlmZiZF+HV2b0lg8IG8fgDNFsMkIjUemXQ/vnrM0
         H85gA7X0bA/IXHwzwJvG4hRoOFvG6/IQOelj0zt5sRLdPY6FbyM3VpgjyPNfEXtzChRS
         I38Yx2B2rEaaGDgFfqsFt32bTjOunCj8PN22tdXsudYL+BUC+0wnTW1o+1qh498Wav4Q
         ydAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794537133; x=1795141933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMxjreD4y0QHP2JtQOEuC4CITCprzlNYUq02BXC432Y=;
        b=YJnC+PmkpAmqii5cFwM8+GSGpOxgcGIoIIyJy/UseSv7yxkDAST3+LSaaDSpW+evto
         MHCWx+vhfZQpOEzj5hMngWRI38761tyrpDlxOFutRmwGVVbWLgtUySyEz1wFgryp9eG0
         8GEDS7nNTOfwEb6N4nR11XfseyoKOJdDq/cglBejnQc8J78gRtf5+FrtDkiSBBvAf6mI
         2ghdEA119EgRwk+IuYYc4Uyrq69K6G/BHSPwORcFPNGmpZP5pEfrjflW4d+8V2Aa9EhR
         nZn4Yqa6nbbDhQkodsNudLgNM1IBSZOI0y396mW7U6GefXInkNOt6Rd1JAEDBNDv9wsc
         jPDA==
X-Forwarded-Encrypted: i=1; AL+hErE9I/osZmkvSQ0uOvUQoqRzdgIK0lFXttTmZI7y2wEVTycTN/6tI6x/vafrmeRnWxkh9A8pVUErtiHlnQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8wS/2bnyscf6ZuRY6h83mScdG0RWE+gEr8+SvgyhXe+vQOeNoq
	DYE/RRezgHMBO98un3WAetZT4b8+He+Lab2Il5rUF9eRI5NKmnt48hw=
X-Gm-Gg: AYBFou37TTCR2tBABhL4GFvXp/9OMS674QYkxUpaOxMO8HB02vUVmAORvZpmOHbRSU8
	BDFNs4PhbwH42xgY2eO6k73SXV7QiCAUFB+ZzGpBNQ4UnqN4I1ci8Bn859V3K6JSxnkdEshN9yC
	FsSOsiZav1nWnTRWDVWqPKYFuNqsKhu4I+fp26Dyn0CEinPpvvAfmZgKC4upRpowMxE+xDNcM62
	G141jbNfJvkxOpMlb7zB44K2X/XiLtMu66i2eW4Qn/n7euwfuaFMfEJrExjZNT/eGMAJwBNylva
	TTkqoo2dpmPJNWboFYGV5xR0J3XJlVzgQG6g74eirBTfwTBViIkyK6Rbb7GZ13bWnF6UTu5CBTy
	lLWUhgivLpjkUgXzIFQcZ9J0SLkO6Kb+R3PTXzqLXZ83AH9rf4IC9PK3IIv+H5mlGJyrZ2maCGH
	TiAs1n6wvJ/vMXgun+vieui3BjBhhW5xP9/csmnrc4HguJjWxO+0/JXUaswhJbRykqtm135JdOj
	wtgwgdNnoXaSIjdq0CRy/3Fqs4Iq6u+p1PtadIvrfsV6EzzexDqlO4sbAR45dxmmx9N1+iK7TuY
	GVggAUbf/Ab3+bbBzhy8h9uB4q0T
X-Received: by 2002:a05:622a:180b:b0:535:87c3:79e5 with SMTP id d75a77b69052e-55ac7568907mr20793741cf.39.1794537133164;
        Thu, 12 Nov 2026 18:32:13 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dbf30dsm9688926d6.44.2026.11.12.18.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:32:12 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: troy.mitchell@linux.spacemit.com,
	wangruikang@iscas.ac.cn,
	guodong.xu@oss.qualcomm.com,
	jyc0019@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Thu, 12 Nov 2026 21:31:58 -0500
Message-ID: <20261113023158.2872492-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_183214_953195_29DCB50F 
X-CRM114-Status: GOOD (  10.08  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On K1 a PCIe master only sees DDR: bus addresses 0-2 GB map to CPU
0-2 GB and bus 2-16 GB to CPU 4-18 GB. A root port does not forward
upstream an inbound access that falls inside its own memory window, so
dma-ranges must skip each port's own outbound window; the other ports'
windows reach memory.

The shared pcie-bus skips all three windows, bus 0x8000_0000-0xb7ff_ffff,
which leaves CPU addresses 0x1_0000_0000-0x1_37ff_ffff unreachable from
every port. Give each port its own bus that skips only its own window.
On boards with more than 2 GB of RAM, each port can then reach another
512-640 MB without SWIOTLB bouncing.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---

Notes:
    Changes in v2:
    - describe the K1 PCIe address map instead of citing the vendor DT (Troy)
    - "more than 2 GB" instead of 4 GB (Troy)
    - drop the RFC tag
    - RFC: https://lore.kernel.org/all/20261112015148.3911178-1-montrealtango@gmail.com/
    
    Tested on an OrangePi R2S (8 GB, RTL8125B on pcie1 and pcie2): SWIOTLB
    use under load went from up to 87 slots to none.

 arch/riscv/boot/dts/spacemit/k1.dtsi | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 3fabfd34114b..949843bb7789 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -1152,13 +1152,14 @@ eth1: ethernet@cac81000 {
 			};
 		};
 
-		pcie-bus {
+		pcie0-bus {
 			compatible = "simple-bus";
 			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			/* skips pcie0's own window, bus 0x8000_0000-0x8fff_ffff */
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
-				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
+				     <0x0 0x90000000 0x1 0x10000000 0x3 0x70000000>;
 
 			pcie0: pcie@ca000000 {
 				device_type = "pci";
@@ -1203,6 +1204,17 @@ pcie0_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie1-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie1's own window, bus 0x9000_0000-0x9fff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x10000000>,
+				     <0x0 0xa0000000 0x1 0x20000000 0x3 0x60000000>;
 
 			pcie1: pcie@ca400000 {
 				device_type = "pci";
@@ -1247,6 +1259,17 @@ pcie1_port: pcie@0 {
 					ranges;
 				};
 			};
+		};
+
+		pcie2-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			/* skips pcie2's own window, bus 0xa000_0000-0xb7ff_ffff */
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
+				     <0x0 0x80000000 0x1 0x00000000 0x0 0x20000000>,
+				     <0x0 0xb8000000 0x1 0x38000000 0x3 0x48000000>;
 
 			pcie2: pcie@ca800000 {
 				device_type = "pci";

base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
