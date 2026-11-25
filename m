Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59782606A329
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 23:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DMiixZrG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqlDXiQz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SiWGI+WqeVxi3XKFOEnT+IxkllXRMMT5ojIuYA0U+BI=; b=DMiixZrGPgX9mtg07BNTjzYR9c
	gIaOwl9Y3ZJHs/SAAUA9Cm8JLHlc2OMN478OSJqkZeKjklmkY6hogkcvcRQ98XyKajDhD+o1iaykM
	WkCNyNLVBOpQetXMy+0W+GV+DyfHqtTEYMR8SwiBhDa27vOGT1cCC2bWI2/cPd/njrMavkXeuG7jg
	IPB/l5m2kGwuBdbtzAdMp2yG4LNsiMEEE3FThxfidx889lBZBtYHMkCMAvW7jq9Mq/ileefiNkGv8
	rBrhfvaBVqYHnpkvkMu9hJBcQnqgxEyC+T5Ibh51ZWFr/DjauIkl5e75K5U0V2u4PZiDJgeMAjuPZ
	s15AFPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWM2n-0000000BWpi-1b0c;
	Wed, 25 Nov 2026 23:04:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWM2m-0000000BWpc-3R6Z
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 23:04:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D651446FE;
	Wed, 25 Nov 2026 23:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3BC1F000C4;
	Wed, 25 Nov 2026 23:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795647892;
	bh=FDGv/L1Nbww7c6KzWDxAyI1PsmHNVWcDz5orsyjliS0=;
	h=From:Subject:Date:To:Cc;
	b=iqlDXiQzPENteDV5216FnsrGn5fo75XQt/VYmVlTz/gMnfZ54mH8BG0jgP4RJPCye
	 7N1zZVJnh4Iraoueo34cekx2C3kfa5E0PYcM9pKm65wghnJuMe26NjXxwAEXLeiyxE
	 iXGBTFOolrT1x7XXKW0LgrPtG2ZYBcgNHQSNOHUN3ltrI46U7FiQ+B1TaTEJE2/LMT
	 F6aYbGn4T6aN2aEHePFkRmbPaf6OF106FmAfdUpB1wKeRvklcB92haBJnRxMkHH1Fv
	 2GsK+dAXWAm5AsuQYlB2I97iNd5xP9DQ94D5/Z4uo5Of0d06qd0/daKIH2gfZWFkmq
	 62JHvhWJs6VuQ==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v2 0/2] mmc: spacemit: Introduce tx delay DT property
Date: Wed, 25 Nov 2026 23:04:36 +0000
Message-Id: <20261125-07-k3-sdhci-dts-v2-0-a069659ba025@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr0Jm7Zi2gE1deQ/DQsoAIwZIB4mGc
 HcLxpXLl7z//gJCgUngnCwQaGbhoY9gDgn49tY3hFxFBqPMSTmlUVnsUpSq9YzVJJhbV2pbajI
 qh7gaA9X82ovX4svyLO/kpy2zGS3LNIT3fjnrzfvVzV99joeYkXXK+TozaXrpKPT0OA6hgWJd1
 w9YwUrawQAAAA==
X-Change-ID: 20260901-07-k3-sdhci-dts-579b17b1e205
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1035; i=dlan@kernel.org;
 h=from:subject:message-id; bh=fj6aBGWfSHhiwKTD1OCuD0+DY2GHc8/iqCOUwSsGIjc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrB2mHbg0WnK25HSXbp4+BjWUWQnXBk+jmh/+Ju
 QIVr0AFPJqJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawdphxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2L0Q/+OjNoQupHTvkESk6nYm1LUivpm3A/nOH/s12M5YCx2QNO0nOXXpZq/
 z6BI3qd5yibms5ta8a1QuLtmcjJw1Ia2fAgNJci9GaPjttd7xMWw5gPi6FWi+HkyF5hXwh+0r44
 Z/yHAOQZmA3A1PVOPp3GdDBA3iXppWswS4z0EaEWs9iAA7aKvPPReM4LwAGGaNzXrWyEmgJ95Sq
 dPbnpcj//9GHD9ee6zp8OEruTIOgaLoc2N4EyVdK50RJdPGUnUWvLLRCeiDQ6XUUlN+x3QmrtmP
 ETVDBKtAk6VmmKH5HiAAwNxE2HDum0F9giP6TUm9R8vKeJ3//mJCyL1bawhPfGxiJG4VoAP7pdP
 fHng0N0ncmTcXpVvlwgZSCgc9/BZgOYuQfd4hlEDZ+/wz7U7vhEqryMK5pqtHK7NX9c66KghXSZ
 cTrM4Y0mtEG70HA7n3jcuB5AqH5ZWdmVH+Q/j3BF0hb1YTChmZsQb8/FUsIPFMCfQaQqdFapUdi
 OXDUrM/m5YdzzG6aCom4BE1YJ53bok7LLFID/qe7nVcUxOflYLaBVfEX90nhTUuRWr4eXS+dV3B
 SXR+nCd/rul+EYn5kLgqYEFasTaWm4kBm0/evzHlAVzYm+kURpoWdLA96M2oMXzuRrhluTnQDsk
 oCizmEI1Py+G2i9U2en8CNC7N07rD8=
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

In this series, we try to introduce a tx delay property for SpacemiT
SDHCI driver, which used to configure the step count of TX delay line,
it is needed due to varous hardware layout has different tuning settings.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v2:
- drop the idea of introducing a vendor clock-frequency property
- use type of uint8 for tx delay property, and adjust code accordingly
- collect ACK tag
- Link to v1: https://patch.msgid.link/20260902-07-k3-sdhci-dts-v1-0-4e7909cf4233@kernel.org

---
Long Wan (2):
      dt-bindings: mmc: spacemit,sdhci: Add tx delay property
      mmc: sdhci-of-k1: Add TX tuning parameter

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml     |  9 +++++++++
 drivers/mmc/host/sdhci-of-k1.c                      | 21 +++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260901-07-k3-sdhci-dts-579b17b1e205

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
