Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33677606A693
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2V8CLeI8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oa4E+lK4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wgtzIPLPSdkfnbkuX8O7nFM/VocBIzQShRqPRLkeB0M=; b=2V8CLeI8C5zsaz9lWzxSS1eepn
	A70NIlKmkPMZQsC1bTyjPQHxRivCXnKT2ZcB46tSQyH3vcz1k1xO0qieBN52854qDJ+8hvvVRPCbE
	YdGlnvn35yO6wfQC5EOFIxQK3oQ5CUJXENK9WXNDKCshW4PTNe/kauCR6vhA5aOr8PfVcp81MRQJU
	FJ0WZDf7y991VaV0GbHzD0y1mnIJ5GwGCdd17aFR7TF70lfbqd9glIB47sNgcmK5Gc02CjH/FKHof
	GISUIfBHEhrJ7H6SQqECiK7VJB10Z8u5eb2m0v+swHSq2lTTGMi+E/7XJ7hGtHiJRpGGLqnMMbN/K
	2Z2y3qUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7iM-00000008vjh-15lW;
	Wed, 25 Nov 2026 07:46:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7iL-00000008vj5-1tVH
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 07:46:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1027622A6;
	Wed, 25 Nov 2026 07:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116A41F000E6;
	Wed, 25 Nov 2026 07:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592808;
	bh=M/Yg0u7/6WPlFEfzCatSVjj5BVXg6/i3iWEm4yi+0oM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Oa4E+lK4IVjeiDO97UoT9fbsFb7uDbTc17IM6oSoBwecZ6RxsqHq4BE87llULhfeV
	 mR321tGaNlcd0LiZXt2pV6rPgDBkggx1W/yidGlD0McbNSK87gZKjpQlnunVp45Ff3
	 V0Mdu/BqyasqSttZEq4oloXGVRExtMuyZV1oPoSD0IA+IDabB8ZSDQN+bLNy3ZgPrB
	 yXn6VS9fRp2xQaSEVoqbhtI1rA2wUoQn/TbxzKf0AxTIwDZ9txMx6W1okmQuG8XERI
	 B5AETfVAOgzwOUQQ89fIk+G0L/NQo+JirvOW60q+J4ife9kMn1vYPSCbRhuYhn8QrA
	 0ik3PuEk8c60g==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Nov 2026 07:46:16 +0000
Subject: [PATCH 3/4] riscv: dts: spacemit: k3: Add alias for MicroSD Card
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-09-k3-dt-minor-misc-v1-3-dd887a8eb326@kernel.org>
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=593; i=dlan@kernel.org;
 h=from:subject:message-id; bh=DOKR0EO79yhDzRsaEFOVBxWUE/Kc126K90RsB/fWYZg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrBpJRv/+qf9xm6aU3cM30hLpZ06hvKl8hD+N6x
 ErRQCiitWqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawaSURsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0mFw/+PbGaCMMJASnujCQaZaIxUjBC/SQl4MAgb4F2ICMrBUV8USvD+GdIQ
 E7yiiJ/vqPIa+d2zDTjiDLSMsYu/bSItbRrURUAT6ObUagOrp/V2fCmIHtGckWQp4sAM6KHNFxg
 5c+45/mSSeOuPw3ljp6V/+u9Smmg3Hfp+U/SrjlP0sQZ3hdegEHyye+hekt5V/AYxCE3JbDOOrG
 vukT+HCD/E7RSPRGzPRXRhBpYMKbdYz5pKbKEY3zJm7JqGPJ3+qRgi0wMRRn5a8TMFMY6fOHGK1
 MN3yVpEfD6GCLw2YTpJxGtjrRfEykMz/kFOL1ZhtNlX1C1IL65Pt+Yy4yo3tz5sFY09KA9p1uZv
 q/nZKkbfawMxTu4Fgrkygxm3WOHzpxvSdlHYiL30ys1QDFPU92xR6kzr+00nQl39krJq5O8v2kR
 kbKC8jABcH6KuYwnUjOU9H4uCrVuxT6gky7ac2c33ltQqrCOteuOV0VwLHGvwvkRBGlsABwlPq6
 HiDuvT2TbVCM67ZfYVjVajpA4H9ItWjGsacJv0IEYB5Ofs2qKf7Mjgz2VGav58e7NjKukJQ77de
 2pmnby2XQbTCJ85cG/C/tIWB4T1LvZ3k/OjqPess6hrz4B2BI+1/zE/hc5MYNybgKsKvtgiWene
 41wM4EahdamuzuqOxsyjk48KL6MH14=
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

Add an alias to the MicroSD Card for CoM260-IFX board.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 38809d01df82..c5c5e6d44918 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -14,6 +14,7 @@ / {
 	aliases {
 		serial0 = &uart0;
 		ethernet0 = &eth1;
+		mmc0 = &sdhci0;
 	};
 
 	chosen {

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
