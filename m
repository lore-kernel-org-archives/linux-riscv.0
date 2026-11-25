Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930CF606A31E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WwZEFeBh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQq2x4CO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U6yWJjYrmS7r8W+2qtBczWnDQsSB77ESm28Ms8fEdgs=; b=WwZEFeBhA9mYXMD0Vn0byx5Siv
	gbcMB6ItJce/ng8HOy/K0cdBimQ6kieMOnmLCqYW7oGJ348dLzxuczBGeCPoEj5j8a+tBczHCAGG4
	AZ+4ZzQfeqqgqTKhQr/nha9eZycN7tdqKa+6B3QEYBZvU+EWpAh+IpFgKYCXw1KWvLyglC9qClgQP
	xic8D0tuIYoVqJVFXy++frijhuejTZU651eoi+iPtK513CjFgT47jYwkqZYnjouz74P4BJW6AcQP6
	cf5jqvHNnfqhyBM04mxdxSwNtbjPZOfiP4/ibRAObR1YYaHBgtkHvxky4LLqMLU3ApFFenYCqNBnQ
	i9GmeCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWM2r-0000000BWqP-1xa5;
	Wed, 25 Nov 2026 23:04:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWM2q-0000000BWpv-0c4d
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:04:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3973E61D29;
	Wed, 25 Nov 2026 23:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DE11F000CA;
	Wed, 25 Nov 2026 23:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795647894;
	bh=VHeuitJP9vddzspc29UV0scFtTGU1OuMS5fNcziVF70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DQq2x4COkXdfkFWHw/zzmTQw9f5vDGgzWVT5KEswOQI96rrRnRQlluIJ8vt8h+/tN
	 6UoJOz8PIfoA9FpVRuL7GmBQuot2Tq8b59ClxVuD4xj5YNiYlo06iR+ucMot9HTs+d
	 wrsykJX/4+h3J85gSP0tD1Wjcx2eLSPQUEFAqBFOeB1XOkCAx2MhGCEytN4o1A3yUl
	 ZqdGejeTinqV7DXSBEGgIySrx+tekD1EfpmNP7chP2/sU4+uWmliKI36jA1ILjWfwe
	 sNJnW3FsTAnzTXyKn9C1EYvn4OcfFK5YmuQNfG+NHakFqWy71Kply5cJGoI9FqklZQ
	 yzQcURk/0hzqw==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Nov 2026 23:04:37 +0000
Subject: [PATCH v2 1/2] dt-bindings: mmc: spacemit,sdhci: Add tx delay
 property
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-07-k3-sdhci-dts-v2-1-a069659ba025@kernel.org>
References: <20261125-07-k3-sdhci-dts-v2-0-a069659ba025@kernel.org>
In-Reply-To: <20261125-07-k3-sdhci-dts-v2-0-a069659ba025@kernel.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416; i=dlan@kernel.org;
 h=from:subject:message-id; bh=860qpvL1n3nNzeJAqEF8XFOw+kpybSxzsA3ypMKT5eA=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrB2mLwAWqzq/T9KBLeEKZxEybp9fNlFdYndS4K
 Z3kDU2J+ZaJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawdpixsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2SYg//QnDRgZjFby6xjoUdhB+C9ckZmTZdQaS3EbIPP9KAoUhWO8WROvFYi
 EZKZsMU6Aai5IH7NPoI0toRCaBL6wWMq1ZRPz+lB1f7fLinQ1T/3qnmeLCi0ODpKSWLg0V38mnU
 7zGCVyQWfbC5DB71e5BogSlqgcdYADpgxHwTf/2qkbyVxb/VqF5T0TockB27QpN282Bh1+BTpRx
 2DaSKY6SqVmLnAk02v8P5tl7LH6QXohzvA2cxmGU9v9KHKWv/vbekn7ybnWuK8H7MJrygDbIZX7
 BVA1Bokpt7wzHEhWTNdERXB5fsJVoPIeiBpH1mWfzd2/w/zGSfC8r0PLAcYfqhMKiY/kqKEDz9h
 L3JHrQ4Iw9UiLsP3TRwlLvdq2YiHdQXCjRuPEpVj7WKHBvvVspSZlGJFjm/t7clH/n5Dq+aGbwJ
 rhQeo/iA8pX9yRWkKU7Oivdzl8v2ytTwdp88kLy6sqSrEPJAWIBZUQvL0rSAT/QK/EzgPdFrKQN
 uf650ikCd+iwnAFyPz0YtG803gukqMWC9z2a8bmcAh/TlItHO4328KOvll2QyAs1i8B3yar1JHQ
 MmsI/DWsR6/6wmLrRSivBvapSW1DifNPCKY2f0Dxsd3YBtVB2xIVSp++QR2sUqQUjGU2uo8BKP+
 hgH3GbNKSsqoYh+jagsyqs4c80v2BE=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Long Wan <long.wan@linux.spacemit.com>

Introduce a vendor specific property to configure the step count of TX
delay line which should be applied before RX tuning, compensating for
board level trace differences. The TX delay line result comes from test
out of real board which vary from different hardware layout.

Signed-off-by: Long Wan <long.wan@linux.spacemit.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 34d202af909f..7df48fedc982 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -56,6 +56,15 @@ properties:
   pinctrl-1:
     description: Optional pinctrl state for 1.8V UHS operation with "uhs" name
 
+  spacemit,tx-delay:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    default: 127
+    description:
+      TX delay line setting applied before RX tuning, compensating for
+      board level trace differences. This is a delay line step count with
+      no fixed time-per-step conversion; determined empirically per board
+      specific, used on SD/SDIO hosts.
+
 required:
   - compatible
   - reg

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
