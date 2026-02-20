Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11784C55162
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeMl9zxm6wn3FLM4EXnPGbwDfNt0nkot4Z0wUssbByU=; b=kcPOKeGUoREs0C
	cnUYJyulX2+2xbqWT6aKCAGNL2tWEpivX8KnmbI9IRIfplBaUzcXdiSb/h0mPJaAkgJb1uKObgUoH
	Wja46RPxiCJRrvQ4R0xAceNhL3FlzEp6iBIrMVGWpKYlSh/sDp7i0ey4BFsG9FzyMLiTcpLzw0ieD
	ESU4u2CsqOp+W/EBuFv9ut5QfqD29sLliJggWaD41oUSkbX728mkKk3LI8P214jUxOtSgRsOYcQQA
	Mv22YIC1o2Z1mFHt1aTv41tHJibqqzyfs8CnMnBBoi1HehCHUw5diO9zPWvVm0eyua3NjU+uW1QOT
	fxP7o/lq3ZI7SYRQI8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLs9-0000000DPof-0Cbh;
	Fri, 20 Feb 2026 08:28:25 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLs5-0000000DPmx-2bz9
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 08:28:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43638a3330dso1497365f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 00:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771576100; x=1772180900; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mcr+ylFRvbVQSvo6VBml7OoEWOKRfpbvT57xdCCmX1Q=;
        b=C68naU5XnUVk7mi6ZH7aGLg3e80+vXWbxBuJ5OuJX2zqpG3eDkb1hFcDTxTfDGA9iH
         PChjoS+EhAfalHaVy6gGMUPQRWdIBlJSuI8tQzqJ1+xqzuLdinG/tLFdPmjGhjj1LFkw
         37yiSSSHMQiVE1BQlNFVm7MVbhKfGIqZTytT00bKlRv8bEtxc4dagqxX1OHEgqoxt38+
         0LDoSS2l4zXRECuzKTmJvmYJhj7khZag4inLS605s/jZ2FgDFswYsLWwgui8JfyFoV/j
         uRITIMLCLjDRTNapphzwLsG1866HDSNrtX4sBzyP8RaNXL20Q9najX4iHJfgy+I7/cXW
         Ge7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771576100; x=1772180900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mcr+ylFRvbVQSvo6VBml7OoEWOKRfpbvT57xdCCmX1Q=;
        b=Xwa3hyWGjMBo4MXyfJgvcxldJtNDS/0AOeXFFPv1KCuNjq+DbKCIXUr7qStIu0z0sk
         IlBYo3t8NjmoD2RxBZ2KATvD/4/qzcBDRHI8cJNT5U5aCPVcP8qkENHH2NV+7MT2lpOl
         7xK/rcCcTSNRj4jazYGeLSenBwHDsjoDR26p2GUWmW3uND0KX5cHFDoZN36drqw0FFHg
         EyY1DrjKdBnK3+uAdNJ/Um+z8NkEd3d7m5CQ3UzOhHUETYAKPqrTdhhskUueS1wQDyV6
         xT1xHOUEWIjAXY8qwJksyX5CNrvV4yIotTGrFTUg9+gaBP25OGQ6Y2YKDeqN+On//C2l
         1IEw==
X-Forwarded-Encrypted: i=1; AJvYcCWMk/gJHUK3PF24P5SHmTGumv6YTBrUj6EJOy6/VMFofQHBkJgQ4fZgQ6vXxNrmbIiNxfHqnKZQM/4Z4w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOe+B1PiaDlqntwCCPGRzRBlp9lzry56P9SGu+ZW1NTTrR9GF+
	1JQx4T4JFRLN7oV270tKpRRe/DOh37VPV9slWVUevnpCbP3wGSsG+5HXTEl26I+KgiA=
X-Gm-Gg: AZuq6aIKSnIN3/6LTqOxN0wXYAsoykAk2st2Np0aZ/MWgwwm/NFN9CnSmrRhMs7np5c
	6Wvnnj+qugTHcH85BD7Oks3v5EjKOpuRB7UgvEBNAE/nJSFH6+fU4eWT46BPJtduDpU2ZTtUPeE
	hf2aaok19Mq6+vvyxcVuQpHR3tGcxbeTDtOkuhZ8r4VGJrsI0IvTABtKiuNhpUd9yi8vnSuw/i1
	6VOuuRDNATo4ahwBHti1nVAG5G+mu/HcUvlw2JedHtutecdP0eShfDHSdfXi1Nz2RB9jAF0SKmY
	QTAtt4MlNnnY2Zhqljojj8i8/DKJKrBQVPhc/w8vYnj8nZPNw2Gm0MkU8dpuYZebpasyBhzuZxy
	SbyfpFakunGsmr8FSbww3XmT24W6aXXfJ+GZbPSHzYTJLEQbkSFjIr5gVkgKvEwQCuDS4if/g1V
	jVMIEgppJjrnxhElTFfINE
X-Received: by 2002:a05:6000:2001:b0:435:96ec:679e with SMTP id ffacd0b85a97d-4379db61cccmr37806593f8f.23.1771576099874;
        Fri, 20 Feb 2026 00:28:19 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1bfsm54717688f8f.13.2026.02.20.00.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 00:28:19 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 20 Feb 2026 16:27:09 +0800
Subject: [PATCH 5/5] riscv: dts: sifive: fu740: Use correct PLIC compatible
 string
MIME-Version: 1.0
Message-Id: <20260220-fu740-v1-5-c8af54130c58@sifive.com>
References: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
In-Reply-To: <20260220-fu740-v1-0-c8af54130c58@sifive.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=4GANKwuw4Gmvjt4yzo6mJduIJtLD4oH0IHu2XPGqRsA=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmBr8A5x0AN6WLq/BdWL/ZvvVR001n1rPKS373
 hQAgd5vgOmJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZga/AAKCRDSA/2dB3lA
 vUkOC/0emc5DX/XLv6NvlYCRNIsC14BaTvJqWzTvJMubMPLS86hHgd3FKQ7Uyb58051WiOLwAsz
 cZ5AXNu8PWhFfZ+5aMcENxul9NU7y/aIYoD/m7oTozg+qnQ/Auiuw+sA68uBPKrR+nloV55s2/4
 y4L0wfIX9asSx+Wx1H9rVEWCSt0F7vyAJw2ZPxe63ySqy5Xo94rukEpaYDcUb2eCyNT7bpjyiv4
 BWMESgWKFLD4SERy6CSScQ8HgNkc9cuYdPLH/28EmfXvLqeiZtlAfcCmFbdRQdUQcXCnTiw8IyU
 bHvBM5KnFqNqVI4WlO2dSppzOYM+1fUoyYNHls4yC0x3v7XZpkZUvvniJ+wfD2ySZ9SmdhwOSx9
 nlEe39EPyWVPTjorh6pmsmrTHzcdAhma1I3FuhiD4+WjzpcJYmH5mhmY4jIifqvSgffVzDRpohV
 99j6p2JFWXqHmVfIA9TtlV+Uai6/eMHYdklOUmBQQKzTSc1q0dMYAPOUoVbPxQ7Nurf7A=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_002822_759861_193D7E15 
X-CRM114-Status: UNSURE (   9.75  )
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

Update the PLIC compatible string from "sifive,fu540-c000-plic" to
"sifive,fu740-c000-plic" to comply with the SiFive IP versioning
scheme documented in sifive-blocks-ip-versioning.txt.

The versioning scheme requires SoC-specific compatible strings for
proper hardware identification.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 15e11a03582a..a44ccbf4822b 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -182,7 +182,7 @@ soc {
 		plic0: interrupt-controller@c000000 {
 			#interrupt-cells = <1>;
 			#address-cells = <0>;
-			compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
+			compatible = "sifive,fu740-c000-plic", "sifive,plic-1.0.0";
 			reg = <0x0 0xc000000 0x0 0x4000000>;
 			riscv,ndev = <69>;
 			interrupt-controller;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
