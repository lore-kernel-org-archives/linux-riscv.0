Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD5FCF6496
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Sep 2024 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwP0KxSNNuCHf1GWhjM31yOBfCwI+yasrFx3MEOeEf0=; b=ofcl+ugE+shQog
	sd5dFPI1QizVdaUfg9g5JU5eDElBQydynPIS5Z8lgxdADp8h+uYH7An2AcJZ6lZMDKPItActRFFZD
	Z99lKbQwNR9u7hScu1RRow7F/E7qeIRz8m5gIRWLEg7X6rKcqZcGzn0PoNYP7BH2j1H+tKz/lTg6q
	xOGYLzcQEGE2dncp7eEGSPLdrs3ZcQG2HsGt/AHYPPV75sSGi9b9VTzWUSUny38J13LBBPR+CLMc0
	q81yzJE8KMZ16hfd1vE4oqnuB3PgwX8fvep46ARcDpJVMMctxRct+z/i4LaQg9iRF3hP/PHV5mTXr
	Fd/WGWzEK2IXNdRiupAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suee7-0000000DdGg-1q5t;
	Sat, 28 Sep 2024 21:06:31 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suecu-0000000Dd7T-36xQ
	for linux-riscv@lists.infradead.org;
	Sat, 28 Sep 2024 21:05:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71b00a97734so2755227b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727557515; x=1728162315; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9i+1khY6cZCPGetGL9p/QuDc4cg82jy9GCe3mjkCw+I=;
        b=IG+GmB6NvyQAV4mOYLqQYBPpSXs0x/1hHT+iQbpRIJQ1WvbNQ421jI3AX6MGXKbCjj
         +O6b/1k9ZoqBJRcVbsuZDalc3KZXaNO5YCyyYwcFlNclbpbMMwofihaLCsKWo2/REVng
         8Xpz49yEd+e4SZz4NCqbRAtWMwNUVm3nv7eBhg5FUBJRBkPzU3cbPV6Hojoyp4joiUsH
         ibnIBND9V6GhgvRvmAufL8uLV8u80ROTIklzAwtCxGJQkwj+9Cfh8Zyp44mGziIThTem
         ExVE++1auXqEhLyJ74GFOMr2csV5h/sRrdIylZvyTVIRI3y+8aXMrxY23nRJQApf7H0u
         PmpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727557515; x=1728162315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i+1khY6cZCPGetGL9p/QuDc4cg82jy9GCe3mjkCw+I=;
        b=Qk6AtbmCGybVnopzeMxzStrHs8AnqASK/2gnTXCbnX/IgfCedKYmJYDEWj3SBm+3wY
         u5hFhD6TTiKSkNXBYkRJyi7KmLx2udVi9Jy7QXzRvzxry9GeflXlQlcp+NW9305O17kf
         S3bRjEjfDd+PiDGzXmVJqQDl1XVJdQLchwbTbZbI5pRZTpfcAb8vZt2XCJajnmr56JFB
         BBRAadUKY/v3g1DpEf6lYaoGoeDddg3IdGcZTh+IJBXMoMoPCaa8lK5MofP/YxZCNpa6
         XRdTeyFyhT/HgrrbM8ZnfXhv/KvuLYoyz6aEmHfWWK6xKKLLywuJ8HnU08BaZJiuSJTh
         E3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWAhHVSnB46gXzOr6vUWpKmsv1YhqKXnGeuoni9LKOucKYGSpmkUKkKDybOX/1zYS9FYFh0Sa6qe9RZ2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yycu4P21LmeKE96U6Z4ExT+pKssKNSkleiVeuOHb/6x4O7yfHtW
	0Jj3tzLfg7X1KnOhTY20UMAQSGo//ZWuF9EAzGozVkyz5i0819kJadL7XFGBYe8=
X-Google-Smtp-Source: AGHT+IFPA8N1lIApwXdlaSl/HNsi0gfOXQ+7UfB2eYS+MdF/mHrjX6Aptdb7GIyUvtzl3aI6WvOevg==
X-Received: by 2002:a05:6a00:22c8:b0:70d:33b3:2d7f with SMTP id d2e1a72fcca58-71b260790a9mr10956907b3a.26.1727557515302;
        Sat, 28 Sep 2024 14:05:15 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264bb2b8sm3550025b3a.61.2024.09.28.14.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 14:05:15 -0700 (PDT)
Date: Sat, 28 Sep 2024 14:05:13 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: Add TH1520 ethernet nodes
Message-ID: <ZvhviRUb/CitmhgQ@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <3e26f580-bc5d-448e-b5bd-9b607c33702b@lunn.ch>
 <ZvWyQo+2mwsC1HS6@x1>
 <0b49b681-2289-412a-8969-d134ffcfb7fc@lunn.ch>
 <ZvYJfrPx75FA1IFC@x1>
 <5076789c-3a35-4349-9733-f5d47528c184@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5076789c-3a35-4349-9733-f5d47528c184@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_140516_825236_FF32CE48 
X-CRM114-Status: GOOD (  24.25  )
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

On Fri, Sep 27, 2024 at 01:58:40PM +0200, Andrew Lunn wrote:
> > I tried to setup an nfs server with a rootfs on my local network. I can
> > mount it okay from my laptop so I think it is working okay. However, it
> > does not seem to work on the lpi4a [3]. It appears the rgmii-id
> > validation fails and the dwmac driver can not open the phy:
> > 
> >  thead-dwmac ffe7060000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> >  thead-dwmac ffe7060000.ethernet eth0: validation of rgmii-id with support \
> >              00,00000000,00000000,00006280 and advertisementa \
> > 	     00,00000000,00000000,00006280 failed: -EINVAL
> >  thead-dwmac ffe7060000.ethernet eth0: __stmmac_open: Cannot attach to PHY (error: -22)
> 
> Given what Emil said, i would suggest flipping the MDIO busses
> around. Put the PHYs on gmac1's MDIO bus, and set the pinmux so that
> its MDIO bus controller is connected to the outside world. Then, when
> gmac1 probes first, its MDIO bus will be probed at the same time, and
> its PHY found.
> 
> 	Andrew

I'm trying to configure the pinmux to have gmac1 control the mdio bus
but it seems I've not done so correctly. I changed pins "GMAC0_MDC" and
"GMAC0_MDIO" to function "gmac1" (see the patch below).

I don't see any errors about the dwmac or phy in the boot log [1] but
ultimately there is no carrier detected and the ethernet interface does
not come up.

Section "3.3.4.103 G3_MUXCFG_007" in the TH1520 System User Manual shows
that bits [19:16] control GMAC0_MDIO_MUX_CFG where value of 2 selects
GMAC1_MDIO. Similarly, bits [15:12] control GMAC0_MDC_MUX_CFG where a
value of 2 also selects GMAC1_MDC.

Emil - do you have any suggestion as to what I might be doing wrong with
the pinmux?

Thanks,
Drew

[1] https://gist.github.com/pdp7/1f9fcd76f26acd5715398d54f65a2e27

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index ca84bc2039ef..f2f6c9d9b590 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -11,6 +11,11 @@ / {
        model = "Sipeed Lichee Module 4A";
        compatible = "sipeed,lichee-module-4a", "thead,th1520";

+       aliases {
+               ethernet0 = &gmac0;
+               ethernet1 = &gmac1;
+       };
+
        memory@0 {
                device_type = "memory";
                reg = <0x0 0x00000000 0x2 0x00000000>;
@@ -55,6 +60,22 @@ &sdio0 {
        status = "okay";
 };

+&gmac0 {
+       pinctrl-names = "default";
+       pinctrl-0 = <&gmac0_pins>;
+       phy-handle = <&phy0>;
+       phy-mode = "rgmii-id";
+       status = "okay";
+};
+
+&gmac1 {
+       pinctrl-names = "default";
+       pinctrl-0 = <&gmac1_pins>, <&mdio1_pins>;
+       phy-handle = <&phy1>;
+       phy-mode = "rgmii-id";
+       status = "okay";
+};
+
 &gpio0 {
        gpio-line-names = "", "", "", "", "", "", "", "", "", "",
                          "", "", "", "", "", "", "", "", "", "",
@@ -87,3 +108,101 @@ &gpio3 {
                          "GPIO09",
                          "GPIO10";
 };
+
+&mdio1 {
+       phy0: ethernet-phy@1 {
+               reg = <1>;
+       };
+
+       phy1: ethernet-phy@2 {
+               reg = <2>;
+       };
+};
+
+&padctrl0_apsys {
+       gmac0_pins: gmac0-0 {
+               tx-pins {
+                       pins = "GMAC0_TX_CLK",
+                              "GMAC0_TXEN",
+                              "GMAC0_TXD0",
+                              "GMAC0_TXD1",
+                              "GMAC0_TXD2",
+                              "GMAC0_TXD3";
+                       function = "gmac0";
+                       bias-disable;
+                       drive-strength = <25>;
+                       input-disable;
+                       input-schmitt-disable;
+                       slew-rate = <0>;
+               };
+
+               rx-pins {
+                       pins = "GMAC0_RX_CLK",
+                              "GMAC0_RXDV",
+                              "GMAC0_RXD0",
+                              "GMAC0_RXD1",
+                              "GMAC0_RXD2",
+                              "GMAC0_RXD3";
+                       function = "gmac0";
+                       bias-disable;
+                       drive-strength = <1>;
+                       input-enable;
+                       input-schmitt-disable;
+                       slew-rate = <0>;
+               };
+       };
+
+       gmac1_pins: gmac1-0 {
+               tx-pins {
+                       pins = "GPIO2_18", /* GMAC1_TX_CLK */
+                              "GPIO2_20", /* GMAC1_TXEN */
+                              "GPIO2_21", /* GMAC1_TXD0 */
+                              "GPIO2_22", /* GMAC1_TXD1 */
+                              "GPIO2_23", /* GMAC1_TXD2 */
+                              "GPIO2_24"; /* GMAC1_TXD3 */
+                       function = "gmac1";
+                       bias-disable;
+                       drive-strength = <25>;
+                       input-disable;
+                       input-schmitt-disable;
+                       slew-rate = <0>;
+               };
+
+               rx-pins {
+                       pins = "GPIO2_19", /* GMAC1_RX_CLK */
+                              "GPIO2_25", /* GMAC1_RXDV */
+                              "GPIO2_30", /* GMAC1_RXD0 */
+                              "GPIO2_31", /* GMAC1_RXD1 */
+                              "GPIO3_0",  /* GMAC1_RXD2 */
+                              "GPIO3_1";  /* GMAC1_RXD3 */
+                       function = "gmac1";
+                       bias-disable;
+                       drive-strength = <1>;
+                       input-enable;
+                       input-schmitt-disable;
+                       slew-rate = <0>;
+               };
+       };
+
+       mdio1_pins: mdio1-0 {
+               mdc-pins {
+                       pins = "GMAC0_MDC";
+                       function = "gmac1";
+                       bias-disable;
+                       drive-strength = <13>;
+                       input-disable;
+                       input-schmitt-disable;
+                       slew-rate = <0>;
+               };
+
+               mdio-pins {
+                       pins = "GMAC0_MDIO";
+                       function = "gmac1";
+                       bias-disable;
+                       drive-strength = <13>;
+                       input-enable;
+                       input-schmitt-enable;
+                       slew-rate = <0>;
+               };
+       };
+};


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
