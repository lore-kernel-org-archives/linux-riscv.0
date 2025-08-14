Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F9FCA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arvaMp3dVDUnfRtDdma9pOm3QFMiWhD2jv/HRQIfn6I=; b=2cOW5NL18m2J7w
	5RFKk257jnedgsbGDPUGuA7u8tDpW1tB8+9T4NhKYSZ8Im5eAI6yr39yrOgM10FZ3QKDrvSlnXNC6
	4Tz6i6iUu1hPBegkUlO9lwePwwHc35Q2XAeHcjAHrCMJclZ7jv65qfggcHeOasZQD+q+jlXuOE+Gb
	cCCvQ/ClKD9hv0AE3eHdD0OFBldMfMFRFhIA206mWF4IYTVWsgbSmS0AAx8S3kXIr+8dQDHkGunrr
	Tw3QL74K4/qShLMhBXtFoQZwGK/rNXtSBQT83ZIOOwGKwtmV/gcPHCHensBSR8BmulJFgHP2Aa/Zw
	UnEsf8NS5yhv0KH+B7VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXmt-0000000GxQT-49N2;
	Thu, 14 Aug 2025 13:14:35 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umS56-0000000G2Qm-3llE
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 07:09:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755155335; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LWEDSFKbpMaUCdImQ1DRsFbnXyu06Lg9fu7akWCg7onqXewQ74/9DgaxASt5PQOaPoHOIMToe4LJNbRfOzUbxVQQJ70yHNrJoY7FD3q8CH1DPctJC9W6ZyPV4baMUpBLX2KnjXh1RJmae2Q5cuJ9wfHo1bbVfJ+P3v9X1kuphbU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755155335; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=g+6aGbgSqL+o5xd1mrzWWr83B6zwR2FugBnE+jwf0eY=; 
	b=hPQeqbPtBFIRsufu23wPmwVKIbxWupzgMcD71F+m73sxMjZoI7RUISRwCnVivIN/+3zzEs1yEY7CJ4yIZjfj9emYWiRm4tzIITzTYEA5p33LF262Te0+CZdOwlzitl7AiiAdqIKXEULucNeSf7YMBL/4W1mIJmDbQpFWi5URPEA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755155335;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=g+6aGbgSqL+o5xd1mrzWWr83B6zwR2FugBnE+jwf0eY=;
	b=HrOlw9ewXqzttP/pB71sOsPTXyeLNo7vOpmtR3/E4IVtQVa/qswS3x7tmVmXl5/M
	l05fAP2hlCWYY1q5xgNqqIUhVcrgtWgLvNmr1xzSYcA/MJDbNPkABNcQpXD045YQ/Ko
	2Hxg4jDuJ+XGon2GypSGayZNv2SwR9J5MU6NshyNXftR1vqm2QGZdfL8aNBQn/ouXuo
	ynRAtoYJKCZ4IWxkjvDukmFzj/9sDMS5GX5d5qfyy/sNDV0eD/7Y8BS6FE3N6erRo87
	pqbMZyvcyVCP0wUlQEn0NTVIeF5vK5xXhfwbERbZWHkfpMdV5/2kua5D7/fZha5nYGE
	niSiFGRtfw==
Received: by mx.zohomail.com with SMTPS id 1755155332438337.2232936507686;
	Thu, 14 Aug 2025 00:08:52 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 3/4] riscv: dts: thead: th1520: add reserved node for C910R mailbox
Date: Thu, 14 Aug 2025 15:07:56 +0800
Message-ID: <20250814070757.2267325-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814070757.2267325-1-uwu@icenowy.me>
References: <20250814070757.2267325-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_000900_996053_970874DF 
X-CRM114-Status: UNSURE (   8.61  )
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

The OpenSBI firmware might want to communicate to E902 CPU too. As we
have two mailboxes assigned to the C910 CPU, declare the other C910
mailbox as a "reserved" device for OpenSBI to use.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 42724bf7e90e0..136ebe210b876 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -565,6 +565,22 @@ timer3: timer@ffefc3203c {
 			status = "disabled";
 		};
 
+		mbox_910r: mbox@ffefc53000 {
+			compatible = "thead,th1520-mbox";
+			reg = <0xff 0xefc50000 0x0 0x6000>,
+			      <0xff 0xefc48000 0x0 0x6000>,
+			      <0xff 0xefc3e000 0x0 0x2000>,
+			      <0xff 0xefc46000 0x0 0x2000>;
+			reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
+			clocks = <&clk CLK_MBOX3>, <&clk CLK_MBOX2>, <&clk CLK_MBOX0>,
+				 <&clk CLK_MBOX1>;
+			clock-names = "clk-local", "clk-remote-icu0", "clk-remote-icu1",
+				      "clk-remote-icu2";
+			thead,mbox-id = <3>;
+			#mbox-cells = <1>;
+			status = "reserved";
+		};
+
 		uart4: serial@fff7f08000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xf7f08000 0x0 0x4000>;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
