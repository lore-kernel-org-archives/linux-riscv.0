Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E3606A32D
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mr2ZGepf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=f4QB4h7/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ao1cxKx3V2IX369kQQuLeBTUKAE9r57tn/SerIX4RAQ=; b=mr2ZGepf1EaUM0QZjAclNJpQEa
	KB+OtkLocq95LEyT75ht8UMQf5L2dwT+dYXaupvnyfeMf6uKcVgbvE9z8yfeNm/K9N3aacuRwpSLz
	3keDqiSbtIbRkujPlln+TSqVsIZQHtjog3/iCHPbcvMfNfIgBROA8EphYOXHrj32xJ2/Zoh9nWWEt
	OtaDTblXeupCnb42H3LgHabOER9eOm0Q+K9gJJORGY9E+vESS/WkxMXr/MfuI2mOEKCb7KWw81Ts9
	r8HsW+TFdNuFlejVeBWXaWd4GDbJ8BAhZs2pmnpxGI9jbMo8+vHIsN2ITXDnKNl2rFhkOKRxb/cvc
	rHi2qUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnIM-00000004IDI-03Gf;
	Tue, 10 Nov 2026 14:57:58 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQnIJ-00000004IBr-2e52
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 14:57:57 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jP8s03SYJz57HS4;
	Tue, 10 Nov 2026 22:57:40 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1794322660;
	bh=dqn1Jn0ErHB9uH7HxkRYY60ypmSrxKKbjunp47DpHy4=;
	h=Date:From:To:Cc:Subject;
	b=f4QB4h7/bBxOaZXy4RRZ9CqpyvvG297hfMUEd/oG0oL1vR358k34wTwIkY5YAXvl2
	 95sz63C/oli27FLOi57ErEIMrfZyavuJzXAYr+W8cdk42+omq0SP3nk3RHzuTDhwuA
	 PmuGWqzKOZCXTxLgGTbdjueuWh6jWcPkYkXbDRsagnokloGzElRq5igCiNEGOgQ+II
	 VtbCpJut6n3adQ/2IAnIGJbGPyTIb7dAximdvsTIDXCwNx8ZOifwcmM3klZoBIBijj
	 HYdFDkKNqxAO1uldmxDUyupw918hnIx08HAa/Fg+KdpBJWKFq842niDJ+vhEgp3Tra
	 Ywv/7xPxhsqog==
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 6AAEvcma005940;
	Tue, 10 Nov 2026 22:57:38 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 10 Nov 2026 22:57:41 +0800 (CST)
X-Zmail-TransId: 2af96af330e5ccb-fc314
X-Mailer: Zmail v1.0
Message-ID: <20261110225741763HzyrdGiR7ZOAU1NiFmCCZ@zte.com.cn>
Date: Tue, 10 Nov 2026 22:57:41 +0800 (CST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <broonie@kernel.org>, <linux-spi@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <pjw@kernel.org>, <samuel.holland@sifive.com>
Subject: =?UTF-8?B?W1BBVENIIHYyXSBzcGk6IHNpZml2ZTogY2xhbXAgdGhlIGNsb2NrIGRpdmlkZXIgdG8gdGhlIHJlZ2lzdGVyIHJhbmdl?=
X-MAIL: mse-fl1.zte.com.cn 6AAEvcma005940
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 10 Nov 2026 22:57:40 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AF330E4.000/4jP8s03SYJz57HS4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_065755_839074_6A18A8FE 
X-CRM114-Status: GOOD (  11.91  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shao Mingyin <shao.mingyin@zte.com.cn>

sifive_spi_prep_transfer() divides by t->speed_hz, which can remain
zero when neither the device nor the controller provides a maximum
speed. For a nonzero but very low speed, masking the divider to 12 bits
can also wrap it to a small value and program a much faster clock.

Use the maximum divider when no speed is supplied, and saturate an
out-of-range divider to the same value. Keep the calculation in an
unsigned long until it has been clamped, so it is not truncated to u32
before the range check.

Fixes: 484a9a68d669 ("spi: sifive: Add driver for the SiFive SPI controller")
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
This patch supersedes 1/5 of the v1 series; 2/5, 3/5 and 4/5 are
unchanged, and 5/5 is posted separately.

v2:
  - use the maximum SCKDIV directly for a zero speed, and saturate an
    excessive divider instead of masking away high bits (Mark Brown)
  - keep the divider wide until after the range check
v1: https://lore.kernel.org/all/20261106234756882V9wUQNCEZAYUGTAbexMSL@zte.com.cn/

Validation on x86-64 with GCC 13 and UBSAN: the verbatim preparation
function ran with clock/register stubs over all representable SCKDIV
values and the first overflow. A zero speed bypassed division and
programmed 0xfff. A 1 Hz request needing divider 4096 programmed 0xfff
instead of wrapping to zero; a divider exceeding u32 also saturated.
In-range requests retained their original register values.

 drivers/spi/spi-sifive.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index cee4d92e46f437319fa40f6377e5511e692d12c7..ca7b04520a682c3fffb070169ab0e3c485e323de 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -167,12 +167,15 @@ static int
 sifive_spi_prep_transfer(struct sifive_spi *spi, struct spi_device *device,
 			 struct spi_transfer *t)
 {
+	unsigned long div = SIFIVE_SPI_SCKDIV_DIV_MASK;
 	u32 cr;
 	unsigned int mode;
 
-	/* Calculate and program the clock rate */
-	cr = DIV_ROUND_UP(clk_get_rate(spi->clk) >> 1, t->speed_hz) - 1;
-	cr &= SIFIVE_SPI_SCKDIV_DIV_MASK;
+	/* Use the slowest clock if no speed is specified. */
+	if (t->speed_hz)
+		div = DIV_ROUND_UP(clk_get_rate(spi->clk) >> 1,
+				   t->speed_hz) - 1;
+	cr = min_t(unsigned long, div, SIFIVE_SPI_SCKDIV_DIV_MASK);
 	sifive_spi_write(spi, SIFIVE_SPI_REG_SCKDIV, cr);
 
 	mode = max_t(unsigned int, t->rx_nbits, t->tx_nbits);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
