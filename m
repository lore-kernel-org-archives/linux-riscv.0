Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F68606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 01:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KGjIz3MB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NQrj5JFy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fAVkNS7vf4lW/bqu43+8x1J8M/ht+88lbU9IImyskIo=; b=KGjIz3MBEHU8KOAygFQVzeshTQ
	6xt9oqcu84p+a+ljY7XlVQw894LFX7GO7GoXzNosq5ESIjuYZAJgMhh8bVxdtlyU/l68qvObpQW58
	gYX4zy1O2lf0DjPyXvy2NlnEebzsHAvwVR+Wf4vTUbXTMjYPGWQXj07Fu8RBDIaShhFx5yspiE989
	sFStjGbFbSB+DmixXJQZmpba72QSQLRFta1X40G+6de0s1/xG4yhx3/OGX1pJTLoGu4HH8ii0gHiL
	+b3jmsw2Mjy1R3y0qIDo3cECPbn9ZgLCMHom31gxQ99PX4JssAMpH7DxnRjXjYdx2QPXb2iDjarxe
	OIIxdyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJz4-00000008S5y-1bIf;
	Thu, 12 Nov 2026 01:52:15 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJyx-00000008S3S-15bv
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 01:52:13 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-533797e72e8so23789121cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 17:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794448325; x=1795053125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
        b=NQrj5JFyCvmxonspAneju5NqmKlgSY8o5Y6qnHnvINDaAhtuykU8gRrRrXuENDJOUT
         e7qcCZnFC8aLCcf/xtjPUwukDk2iyD/GWN6HBHSeEQbtvDCDSHP7ZDHbpIikIOSa8YTT
         wD+Bx1n1OqvFlOzWEnVraJreWy0MvX+sgbrgTwMKZM/xQlveNS9DHZPOTak2S5FrMEuy
         TiuSGv6RhKFGfMmiIA7WkV91ytY+5zPXjy2qnGEegcbCbpi356dBL6IJN5P1KDucOn8U
         OStgGH05SDFIT4++qahaLm29W+nQ5qTI4sjGszkh7SWMhxCEFDUXIDOfHjIt8C8uPLxl
         aHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794448325; x=1795053125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbUxlU2+BMbm8RpR8jkfpxDIh7mK30z7i6lZAljhk+w=;
        b=Uux4ipQlr7kvtVKjLNtyRMtcYkoUETAX20w5dPdjupqXX7hx4Prx81SnUE01xkKqvR
         UpYghAJUCrcq+XdYYeBoMZSYUzIGNnJPafapmK2K8oXm2JeWOcTmY2J5XEac3EPxy24W
         6w8d3y1Nk2hE0gGnIlSyydBbU3eUP5T6FLBPCNID2iZekuvY9JFSxdN04LyZDg7o2Eby
         duJAsC1IYW803/IdpQEKmfmimYFGxaoR21pOywNe8UT681qtufZ76dNLuKfCKoQtW1i+
         9mIyHRuvbvCgxiF5f4vMLvM/zAM1cbbhzgtQusmInp3Ht3mxKX/4wBMrEiIKEEmfoTbP
         X45A==
X-Forwarded-Encrypted: i=1; AL+hErEHsnFA6+F8ceXAYlSsy7wqL95Vebx+t69H9ZdOiBA+zcZr5MIk3WLFdyqjpCMJ4T/NoVF3i+MLT2fC8Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z/REiA9XFvw+CUYOlaM5FVXTYDTr/+SmuQMFcy29JE+eioy3S8e
	ee5/2jxxF0PFbQqK9ATvzFZUcAvfSeTUi575UqZK0YBXLMX1kPv5cYw=
X-Gm-Gg: AYBFou3jo7ejz8P8W6fUvfHbB32TvFnaiEwVisWBSwrVY7Q1k8t6ggo5wRkFx9qcFsn
	8Uo82zteAICfn7OmwiMN0r6DKBoWXLGLj6sL/8ziAz+Q7951GDmdZyLDK9z3rOYZWnhAUcwd/Dh
	7CT1+zaKj90qA3xoPDwmufLCFwQFpe2ywsfmzTQV9mXmQinkNWkW8F1WMCY3WolvIbe519Po6KL
	XUmolrQypwmC8o8a/deXSmpHhbMZSXGteT+U6XiX4ihXeGxxVfrn/SMGl8DgzV45o+m9PAhbJ6I
	yxzWstEPQP0es6M83+iiRLhHQapXAy9arCgHoyuUeHOimB6Zfla3vvX88FephrMFSZBSKf58BQQ
	fXJ+DMR3+2jOWx0RE7VCdW/i2VXMVuvgPXIAkHLMmaJZzqSOhZRa+CHRci/ETJwLhjy8w/DsqKG
	q0L2I7Vs3PP+B3hizROA+4Gfdd0K4HGE8wPBp6TeZ+r/g/xA8hm56rnXrS4j/ohyFe78mZtt2o5
	hpLgpzuIVnd6CmXQhAbGMbZgUyvgQ6uDOtSCE2AUhDrUgPdLFDF6PE4Eq4pLTRaRJ2NFitF+2lL
	hVrYkx3NrDm3aHZLzpfH/0Rolo5b
X-Received: by 2002:a05:622a:5917:b0:536:98a5:cd8c with SMTP id d75a77b69052e-556c06e37c4mr54334061cf.30.1794448325483;
        Wed, 11 Nov 2026 17:52:05 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f0ffc6f60sm16052726d6.14.2026.11.11.17.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:52:05 -0800 (PST)
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
Subject: [RFC PATCH] riscv: dts: spacemit: k1: give each PCIe port its own DMA window
Date: Wed, 11 Nov 2026 20:51:47 -0500
Message-ID: <20261112015148.3911178-1-montrealtango@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_175207_496514_0B359FF8 
X-CRM114-Status: GOOD (  13.06  )
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

The dma-ranges of the shared pcie-bus skip bus addresses
0x8000_0000-0xb7ff_ffff, the union of the three ports' outbound memory
windows. CPU addresses 0x1_0000_0000-0x1_37ff_ffff are therefore
unreachable from all three ports.

SpacemiT's vendor device tree gives each port its own map that skips
only that port's window (dram_range2/6/7). Do the same here. On boards
with more than 4 GB of RAM, each port can then reach another 512-640 MB
without SWIOTLB bouncing.

Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---

Notes:
    RFC: the per-port maps come from SpacemiT's Bianbu kernel (linux-6.6,
    k1-bl-v2.2.y, arch/riscv/boot/dts/spacemit/k1-x.dtsi). They imply that a
    port's inbound DMA to another port's outbound window reaches memory. I
    have not verified that on hardware. Yixun, Encrow, can SpacemiT confirm
    that this is how the K1 routes inbound PCIe traffic?
    
    On an OrangePi R2S (8 GB, RTL8125B NICs on pcie1 and pcie2), up to 87
    SWIOTLB slots were in use under load with the shared bus, and none with
    this patch. Receive pages were kept below 4 GB in that test, so only
    transmit buffers could use the new ranges.

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
