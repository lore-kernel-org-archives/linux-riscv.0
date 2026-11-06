Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4390D606A328
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 06:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D0oCfuER;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ai9QYXV4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u9Sx/DD0ZwuiIPeESe+jZgcaw4QUVwe6PaQWNLP5yyk=; b=D0oCfuEREF7BPMs0mO26ePRjsf
	SZCfUnf5+bUCqlbMhF2JFwAhrs74fC9HAza9lohn8fHWCSEtkQ+dcQ/9THBS6+6ZQCMXBhxh4lk1F
	Y34e13fd5LAUsypNmkhWyuTlLYlsPuJzPv7u6w8UIviZ7Yrn+AV6Fi2VzaZ3JzSq/oZwrzzIISpFp
	Mi01s+uVRpsMJw+cqjmvthrGlwImrfJbqc3dR6TKBHg+uyfgWwAWd58XK3MoYx+yDGWjck1c5LfWU
	T93obNDsUXTEooNArk6/elkIQV4fnUlBlf/J9L997asWSW3/pD4kQ5lyIk85eXJZp5b+48Yl7GNzD
	npdcNvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD6h-0000000BK1p-05qf;
	Fri, 06 Nov 2026 06:07:23 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPD6e-0000000BK0K-1BZa
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 06:07:21 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1931ff67a29so1058385c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 22:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945240; x=1794550040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
        b=Ai9QYXV46H0h/M/RTeTQo46YL9z3c4Q0hzesn+UdxBlEzI9tneQO6GOTfEAzbFkTFR
         G2IJZ8xjCwwayk6083j7aV/1YFnnai4F73nawU48XW3+utwYTDfEmUY38F/mROeEoNsQ
         mkwxrkJCCI4XY9r7vW2oPNiNUzThZWdGhFDJ2pnnKakDWoOGJBQvm5gHvTUlZryHxvFb
         tsx2CwJuiKw934RjGWbxli1QetKp3Ktbsi6xEwDHWo+9B6gOo9NV6mUTyZ2G2SzT/gpW
         /W8MCucUW8NcURGbXNe+yC1QfhTQFloGep4JW8hiKfpdS6QiBbj+z6r1JEkOT8PEhW0z
         WYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945240; x=1794550040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
        b=TZOf942+oDLIJAPs77/pOzlXuWO7iv3ouC9YJCnO6xdC03/CX5dC/bjgBgE5QAfHeC
         zmTIEzRxpHPfuWdvclCJRka9q3zYQXABKkMJkjD1d7FVWMJeMsgMolVkJVigdNqJv4wN
         5Qc5ScpsAZUxebXohzyVBgJlqvJp1Bz9l5pxZr0UW1F9JNaMl2pSWF8ooJ7pQDaPBfhA
         yQd/2wmNKJVGReMS3BLN6P0Q9a+hak+oPVHmvU9+Zc8TIu6hGcY8turZAVMVX1Y/LSTP
         2t3asswl7TclBXijqhrJM2Li7DJukARFlO846e0s67VUX/wdza27U7tA/i1nmKiMN08S
         2kIA==
X-Forwarded-Encrypted: i=1; AKwUvBzohbBQmJebTssOJAe5oLSILf8zNFzMziCVvgS/DUy37BQK7RgTXm6yvLeWI/jX11ZaUDi/eapx5EcjVg==@lists.infradead.org
X-Gm-Message-State: APuU4Z95m2IMraN+HLfsJvmbHLCdMG7BzSZy5cEaut3yvCS2lbaQgkAM
	e4olIOiaL7KtqJ6VH087GGeEeLLIzZIcLGHHXzj/V51qEdlPO7HZ2zge
X-Gm-Gg: AYBFou0YCdDkCLdaNA2Dp9rfms+x1/GBiFnG4YiAmerU+m9m117al1xV489eboJ5E+u
	vesNpoAiWfiL5xg6xALex2iH0ntTswOI7OONtftSCyivwmvbLK5NLQX9cmkvlbRvR5D+FE5A8fp
	qJ/0A3PoOcaPmhG27UysVXpbKrK6ebXSrBx3t88oanVFlRC2eAL/tqudB0dsGqTj7g2eFRl4N/d
	GlSsQoqO4cUmz28TnQmcjQwueIDqGONplGsehf24KGcJMmRfgYgX46oNSKxuqqZTNDlgSbSmxbF
	j9TAmcdh+sctSgaYBaRMVOitRGwAHnq8lb+a8jZreSRAJwGdl+sJG+d2mZpcMmwowx7dWlcleYf
	fjUm0/e0C1aQEHJTP8KnXi7YRF8sU5NrcL/5wlHyJHGu2qzjZdpvs75YYbtw107LTUQSpiXOMBX
	r3fo8Wsr7W73CzdUn30ECmK/DU/TdDrZgXsgBwBkdLV03zukc5FdRanMJTnLCyAKNveku2xIrTh
	LBJXVY1bSsHvCEWdVx1mQMuiG6hHK9CXGPoKgi3MCvG0Rl9qgRnaxeeaMc77K9at6DI2hbCPz3b
	xK+/IHqtC/seqU5xU1yy1RpfYq8juIpCRh2pKBN5kZGKhmE+mgSP
X-Received: by 2002:a05:701b:2302:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b25d336486mr1698470c88.28.1793945239501;
        Thu, 05 Nov 2026 22:07:19 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:19 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
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
Subject: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Fri,  6 Nov 2026 14:05:25 +0800
Message-ID: <20261106060525.346873-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_220720_324787_76FA3651 
X-CRM114-Status: UNSURE (   8.56  )
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

Leave the controller disabled for board-level enablement.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..51861fdc6a21 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,31 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+			status = "disabled";
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
