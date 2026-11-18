Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39E606A33B
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 23:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lt3OTpC3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cMpa0cuf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=m1BKElI5vzS1HbNRYvG6NG44IUEtHnc1PmIX5hdyHTg=; b=lt3OTpC3x/isvy+g72wgYz5yYf
	OcIr8SS28EJ59HP0WtVvW5JYkVmh2p0NG2PGoia/+ObdwJJ3sLF/mwCHXOW4+V44XVPj+VpnKW8Hw
	oPGiVwSpJTq1NnpGKlGmIndQMc7kTDxovoNQpc6fKJmBmdewm0fkZwO52Kq1eYg0ff3w8s2IxWzRu
	7+UAH9X7m0g3gcOyrrXbKOgQ2CyR18+b8IjGwc9ROg8MTOyf3BcijgdWFwPQAMy9Lb9ixyxNiTUxe
	DKbBDPRydx3GbViGPOqTY5vJUnz7GJvVIufUc+wBgWFMJ49Mni9UUy2rdPidGWiY6sMaeqz+YI6jR
	xaDHjJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToqW-0000000AScI-0hmG;
	Wed, 18 Nov 2026 23:13:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xToqU-0000000ASbe-2bWQ
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 23:13:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 06C0C43CE9;
	Wed, 18 Nov 2026 23:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E4E1F000C8;
	Wed, 18 Nov 2026 23:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795043621;
	bh=Ho/SJRRXKfR8E8InR6yIipzjTEX73uVp+KDQpwqfDkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=cMpa0cufPC6YaznjOGX3iUfWZXjMd/fGC3mfBNkREFkGVeMe/ADk7NOoTux1FdylL
	 Qa5KSMD+pB45qc9zcUU3kGCKniViSWI6ya3u5aRy1AbO9RNpWfFMqP5eyHLLe4W//i
	 Iqh4Zxy6ZQjVjEMPMGMG1+SxDoXvIjO50eusH2zYvWb93bklN2FoSHffz/tPDASoOo
	 gEw3T57r5Fyk/hEdUjsp5FSKU1bfBImR7VbrFS8OKGcFBD7WalFq5rbLAnIxTwHlFd
	 cjZMPUzUkYeBX/g3QUypGXWj7tKLqo4ELpiwuDImRH1omRShVSV545fppvwH8w8zuj
	 7lwjdsxLdm2RQ==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 18 Nov 2026 23:13:09 +0000
Subject: [PATCH v5 1/2] dt-bindings: power: spacemit: Add power domain
 controller IDs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-04-k3-pm-support-v5-1-42394acdf3e3@kernel.org>
References: <20261118-04-k3-pm-support-v5-0-42394acdf3e3@kernel.org>
In-Reply-To: <20261118-04-k3-pm-support-v5-0-42394acdf3e3@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980; i=dlan@kernel.org;
 h=from:subject:message-id; bh=ZGjBATuMj77MYSRucrBFIOVycrvyLdzdato4w2GM7iQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBq/jEYKpohQR0yGCw9uurxNdJ+PnPPuBjTE9t2t
 t/WMFrC17uJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCav4xGBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0AKw/+Me+ttXcHAtQDVIGYrjzbLgVr+AYEkQhZRsOanhjx54j9RiOM8g20W
 3IoQTiF9n2QCkHPhbhI0zh9MYN9d9ZMSYlVBUoajkMFnDbAHQuVC/adX60XiFLvEOimIpqywNiV
 YcsqmI9urhcSUP72Y6ah3jc3yB1LiBnJeAkXBpzb6j1ttEt2dh3h8546lgo3b6nssWC2SxzpYHy
 WAXOYNaDrCf6tTdu89QrIGagY7nwN51mJNvlz5NULVtAZvfONZdP7YftsWKKYw6bu1awGuMfFVa
 VolnpcxelgTRaKE5wNnnU33kDDlf4ulS3hrMNsFuII16jmcRc/LL+G1DoP0iPnszP64wgSa10i+
 faJkdxkZhN7zfYth8bZQha1LoSSHNlwUDuOTAHN8/tplZpAteM86dDlSP6tAT6HnV/ZB1ikSbHs
 9AhMCkNhzswoQt8ijdHyXJXRfW9apFO8CcK+ZU+kCeyWQER7yCN/6EN/vQejEDdRfVM5EIc1DgY
 USRXBOjT7uyYPnlpY2hTKZ1tn2kMBAzxnCULT6RlaCsIGT8hVaUw4mS63+yjsTl7dX5Ti+GBPVn
 6fsPYQ7Wmbl/AxEI0rEMUV2WvVQeX/y+rLNx/6uG2wOsxtnPHahJ/MylYNffE4fGH9oPXdLm79Q
 Nvc9qxLyhl8+kHpnP60Rltfs4xMDrA=
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
Tested-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Iker Pedrosa <ikerpedrosam@gmail.com>
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
