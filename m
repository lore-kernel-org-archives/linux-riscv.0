Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28925C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WW6zWVtrdco7rIGKgWycHgvK1+cL98K2TQLVpkTO9As=; b=lUBEDVWO9H/Kdj
	VcRN687gOqtcd6tbq/iCDk5ZczA8KPY8qHEDg84Qcuuz9Wa34xISLUsZZGLieVUQze5RDVAiLkBGY
	qh4k+jjE83KBe+5CjqD88Pb7CGZwCg3jhop4S4PCB8lJl59FVjBBMGp1M09pyphB3ep+wtqCq4qFb
	PF+C+s8ndxOpFfPazP+wNZnZk1OxGjprb7oL9Us/AB1/wopgIi0C8STQOe4mTDODSrBgvfZ930Iz+
	aCt5fCJjfzvJnrWk1wcpEd9AYukk80JPfserAnUlHBuQO+R/YK9QpvUemxXONUi9Xe8sbnpYcbMdb
	9mUWsa3Sa2QPLJWWJmng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZah4-00000006PbE-33V3;
	Thu, 01 Aug 2024 18:38:30 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZah2-00000006PYU-1Lju
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 18:38:29 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2cb576db1c5so4815011a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 11:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722537507; x=1723142307; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5vq4jHV8nbxc5imvEqzCuTIu9VwOjDaomzudxx3WtyA=;
        b=UU9YInpgxgPus4A/C5n8tRYQo2mMxeIuqZUDqrUBgD3HJnA5CRJwL4t0F7B7E7VoP7
         k4YZi+xMmWdyX6FbhnrWNlZZJHjbRoCoKk/8Z6hfGfndpX5yisM7+q8Fv74Gf1Cw1Kgr
         9/d17AJHAbX/yf06ByQVYRwTrY+uvuCK8+6gt0dfqCFBOYuhn7JvkgN7sIqfRKWcOGWo
         PafYq4wxaWXKLoM+eZJWZVoxQyo5TubWps2t0ux08gBOKr1zM2KC2GbVejjvA4R0IJYV
         hNEFXQdiSBNZGMOdxT6Q9CeD8tlHf2m0n935gjPEQw4w5CHRx2Q23aV2A7dxki9Le40k
         SpeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722537507; x=1723142307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vq4jHV8nbxc5imvEqzCuTIu9VwOjDaomzudxx3WtyA=;
        b=fdjFsdrIOXtgxiLFlGkNbLW4NFcjUkWohA6R2q/HWBOoVrorKG/fcBjohltEq8g6hX
         DcBAuBtNvqjunJ/RhtgV6i31fpCUK6z87BjaIdR8skRQolyQEHylrqs9/yohyFRf3iz2
         dMo/LLaqBIro5O/TzGbGaYJ9kNLacbltqjiKq+wPAGfZk3p85Z+rYrw4Cx1yklYmYWlD
         lQzIXuFRIpll4fFq/5ey52BjvXOrbJ01cMSVi3Addmnb5HeX7K+FxjqtVy96XF2YfFmz
         SjIZn1BEIG58ZApvAKSzCaYhTetj039pNc33uhsayQ+SZkN3oFtgqU7Tx5nAQ4Hxrx/p
         00uw==
X-Gm-Message-State: AOJu0YwPBrMurZSiKDCE5zCYTMKlNqYtIBAj042+kkkTPzab0RLhhakU
	uucSgwPJgTpj+ChWWbLjTCWKVzRmzsnsd+k3dZprmAm9DM1i4N7qRe6aBmaCyW0=
X-Google-Smtp-Source: AGHT+IHnPHgk53nMt9sJxkeT7R3JYwKkr0GOY6NgiaPiYEwg+ooJVjf3p/z5vpN557IayqH1ywEWjw==
X-Received: by 2002:a17:90b:8c2:b0:2ca:1c9e:e012 with SMTP id 98e67ed59e1d1-2cff93d4117mr1330754a91.6.1722537506992;
        Thu, 01 Aug 2024 11:38:26 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:dfa1:41a7:9478:9d47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cffaf69d54sm279728a91.12.2024.08.01.11.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 11:38:26 -0700 (PDT)
From: Drew Fustini <drew@pdp7.com>
Date: Thu, 01 Aug 2024 11:38:09 -0700
Subject: [PATCH 5/6] riscv: dts: thead: add clock to TH1520 gpio nodes
MIME-Version: 1.0
Message-Id: <20240801-th1520-clk-dts-v1-5-71077a0614b8@pdp7.com>
References: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
In-Reply-To: <20240801-th1520-clk-dts-v1-0-71077a0614b8@pdp7.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>, 
 Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <drew@pdp7.com>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=drew@pdp7.com;
 h=from:subject:message-id; bh=L05YOZ6P7b77yQdqua1ed/hLSCwatc60q8wYDB+6T9E=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMaStviZ1Nn7JpyPK8uce7rlh2D/xSpjfu91qh5hX7lsU/
 7R145otCR2lLAxiHAyyYoosmz7kXVjiFfp1wfwX22DmsDKBDGHg4hSAiahMZPif9uS1ncGMoE3s
 NtuM37J+MtSfJrjra44Ss9GDmMDzly2BKrwjy5qyfr+boZahwBBQdXrqnff1u7dqNH75PlfiUaL
 6a1YA
X-Developer-Key: i=drew@pdp7.com; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_113828_408097_63BBA9F5 
X-CRM114-Status: UNSURE (   9.21  )
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

From: Drew Fustini <dfustini@tenstorrent.com>

Add clock property to TH1520 gpio controller nodes. These clock gates
refer to corresponding enable bits in the peripheral clock gate control
register. Refer to register PERI_CLK_CFG in section 4.4.2.2.52 of the
TH1520 System User Manual.

Link: https://git.beagleboard.org/beaglev-ahead/beaglev-ahead/-/tree/main/docs
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 6ea5cabbcf60..5f4f94ca9cc7 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -327,6 +327,7 @@ gpio2: gpio@ffe7f34000 {
 			reg = <0xff 0xe7f34000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO2>;
 
 			portc: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -345,6 +346,7 @@ gpio3: gpio@ffe7f38000 {
 			reg = <0xff 0xe7f38000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO3>;
 
 			portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -363,6 +365,7 @@ gpio0: gpio@ffec005000 {
 			reg = <0xff 0xec005000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO0>;
 
 			porta: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -381,6 +384,7 @@ gpio1: gpio@ffec006000 {
 			reg = <0xff 0xec006000 0x0 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			clocks = <&clk CLK_GPIO1>;
 
 			portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
