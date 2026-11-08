Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E86E606A333
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 10:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xp5ADlci;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ujz7Wsxz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=82mrQWcoX1ySoxTDXRJmJ2Ckh06vmGSe9zaFUbXKUlw=; b=Xp5ADlcibvBe8556EbMPL1Dj+x
	wcgDkdi1hlgkB7gMuj/Ojcyvrt7nSfMWgABylXTkI1rndFLGBs9e/gAoee7d4BIwwdz+Gdng803hO
	AnCBiALefA1Izv533sJES6p+QGpL+DOXF3LC0+TfwwUjivRimPI7m9YhZFH4pW5FXsAwR1oHsE+7m
	OFTxLpqhMQrWGQK4V/v2MGIQ1Nb7oRo5z2t3JvojCYFPv4ZAi5CLIoZBoQ/iEjSTIoMtmtiU2brWz
	wQYgT7/ClCbAIflg7WglTdtFz1cr6kRB6dk3h5tObGVVAx/s8tdwR/2w8i6Vcq0teCAYkHkybwPdN
	gfjQhfbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0G6-0000000Fz3k-03SZ;
	Sun, 08 Nov 2026 10:36:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0G4-0000000Fz3Z-3lIl
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 10:36:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DC97433C5;
	Sun,  8 Nov 2026 10:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90E31F008A1;
	Sun,  8 Nov 2026 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794134180;
	bh=KK9NjKBQVwDD/CXpCVVduyC6A+LtlFiYYxKc6QYa3Bo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ujz7WsxzEzpfr2LWtiW1c7aqJSFeBlPUl4DWAtQZqLSmdnphhk/gCS+eJfEKIo9Rk
	 WU42X+Dy24oIjDYG7kZebObH8embKD8S+3a1CYGfiSZ4wa/MMOm27ZbgWdesNcyC7y
	 TkkhCNX60GHT8fvsxWQB5kVdQupBuYAim+6PdC481ZbdM9ghJ6Dk6iSz8ODaXoHEGt
	 EqjE7es5dhDDcIUGO7iseUcsKNj7jZYvUOZR+Uexxn+Er3heICJOo3qeWGN8sFXy/K
	 PJbP0KPKWzT3WX2HbhNtNBWRaI/TzFIHvsARKbjt3UMCk96C3m48/sRs+HGE3xrhCI
	 a5duPF8WRLAAg==
From: Yixun Lan <dlan@kernel.org>
Date: Sun, 08 Nov 2026 10:36:01 +0000
Subject: [PATCH v3 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-04-k3-pm-support-v3-1-b9dc0857039b@kernel.org>
References: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org>
In-Reply-To: <20261108-04-k3-pm-support-v3-0-b9dc0857039b@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878; i=dlan@kernel.org;
 h=from:subject:message-id; bh=5A3P3lNyfLxpWqu9V/0ASbTdE7gwL6dSptdYzkszeFk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBq8FCWIamQTn7+yPfQcaEcSjMrBuFi8AXoSGsx4
 KgpDA93b4aJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCavBQlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3tjQ/+MWDSOSxb7zCV4jtiy4KsdOBfTgVWxfqDSQwm3bNzdkvwtajtA2Hkk
 xUb0EX67nh9FIFRfUZFoxjiO7iDj/cpH01YbPLnitLHVLWp1XqcS8tRYcriAkEMylul+9v8EoAg
 2dW+arWwPw8QEqoWlDnDZPAiIpLyyxP1goTwABthVAqsHOBlOj5QDpi3Fxlaor82d+p/MuV0xxk
 CNLpZyiAAM7ucNhVkGt4QG0cigEkyKsEJvXsdkUsdtfButUo1rqyeCGRKJ41TyOElnOP+fLv06S
 rAJp639xL18Wcr5hKKdtEEvl9Ba47xQb1OQCp0W/XCTnxLuHB9qQvstAa5e80cm4+wdlyBeEpbL
 R7Cf9M5GYfy5syd7dYVpruRpAPsYehLo+rTzZS55xCXNwZUr4DgDu5vRsyT/Wt40RFX87WoFR7Y
 gouGgchIMuBJccbcooBUJu0ElCZSGzsxn7sjhX/eZysD9ycge/nq+yoXW7UcY6mMnnUW7x5hGae
 PNJ1RlIWx/pWwMp8Z1nAxp1iMHS/XmNL0ESYqkuqTjL5Uu06EhtBfDhGekhHDfUWa9RU57bh/F4
 3OaxrRxN6aoc0HcFNHJCdcTYSOXUqbCpiteuJaj/ZyyQ6y0DsKdd/ruxinh3+wRWw7WpY4qwSJI
 zs0Ms0YG/q57iFpEICruTmbiUECIeo=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add initial power domain driver support for SpacemiT K1/K3 SoC, The Power
Domain Controller is SoC internal module which is part of APMU (Advanced
Power Management Unit), it is responsible for managing power across multi
power domains, which includes power on/off, isolation, power-on sequence.

The DT documentation for the power domains already exists in file of
spacemit,k1-syscon.yaml.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 include/dt-bindings/power/spacemit,k1-power.h | 14 ++++++++++++++
 include/dt-bindings/power/spacemit,k3-power.h | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/dt-bindings/power/spacemit,k1-power.h b/include/dt-bindings/power/spacemit,k1-power.h
new file mode 100644
index 000000000000..41ef540b5c44
--- /dev/null
+++ b/include/dt-bindings/power/spacemit,k1-power.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_SPACEMIT_K1_POWER_H_
+#define _DT_BINDINGS_SPACEMIT_K1_POWER_H_
+
+#define K1_PMDOMAIN_VPU		0
+#define K1_PMDOMAIN_GPU		1
+#define K1_PMDOMAIN_LCD		2
+#define K1_PMDOMAIN_ISP		3
+#define K1_PMDOMAIN_AUDIO	4
+#define K1_PMDOMAIN_GNSS	5
+#define K1_PMDOMAIN_HDMI	6
+
+#endif
diff --git a/include/dt-bindings/power/spacemit,k3-power.h b/include/dt-bindings/power/spacemit,k3-power.h
new file mode 100644
index 000000000000..519fbf946312
--- /dev/null
+++ b/include/dt-bindings/power/spacemit,k3-power.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_SPACEMIT_K3_POWER_H_
+#define _DT_BINDINGS_SPACEMIT_K3_POWER_H_
+
+#define K3_PMDOMAIN_VPU		0
+#define K3_PMDOMAIN_GPU		1
+#define K3_PMDOMAIN_AUDIO	2
+#define K3_PMDOMAIN_LCD0	3
+#define K3_PMDOMAIN_LCD1	4
+
+#endif

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
