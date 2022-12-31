Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D65BC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 16:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h/aPzaU1s/h8sEb7GmG+rIc/4DLtOJANV+eHK9u+uf4=; b=3WhH+OCo++WeH6
	lsxtsZ01vnHdMOAgQrkdg2HnyaLfAzZEMQ0BnW9Tec3IbWfEygY1aqm0nC7HTKOECw1rjJLvdq5xT
	fjeiDZqsYGfRQVIGjj5mcWJ0xfB6WhVBK+zhCqVP2/O48hwRzpeaUKyTlIn0Tub0wq27l0yWgwyvU
	xsUGOPQivw5rroT4nDJvYyjnMiNO+4jLAcLJ73zDJll9iGVmTMWGChhZ+cklDP4oVm4/v2mHW0dbZ
	jkAyTZ4CmQMZHrc98hM7PNbCMVIS0bsQT2cgevqvZT4TtzrsIpoZRLmn1Y5AsCRttnc+xKkTPh46N
	E5AbtWS/6YeS9YH+rDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBf2h-007fFS-KD; Sat, 31 Dec 2022 16:49:07 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBf0G-007dhZ-1H; Sat, 31 Dec 2022 16:46:37 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 5CE985C009C;
	Sat, 31 Dec 2022 11:46:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 31 Dec 2022 11:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672505195; x=1672591595; bh=vE
	ylqdPcoZ0euJOiHbHp34nwz64q54ysKO9PHy+mOik=; b=1rPKUsxgmjqpFZdAfi
	a3OPrH3yZL9jXRY32T0irAR/mW9JrzsVFHMTs4wS1TTBaAScL4NRv+FRu/6aqzZg
	KaKcIqdsK9o+Q6uDBMPGCetRpHL3rY+6NNGDuLcfIFtcDly/XnEBlntPQ5suVzxP
	8ohCJq2ioga4MSmhHkNlIHJKH1gW1RTx2h0be6Bid1jgoXk0d9m91BATEY/uU9+r
	FbyzufJrJFRRELVwD9aMsm7lRHgG1431KxLxivrxuSACB8wCeH9Vl+4197TigYFa
	QBIZ5wB11Q2M2WhcdNAkdKaDamGnCxS5PeREAM0gELUHqUJ7uiTNbnZVpwU8qOir
	WlFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672505195; x=1672591595; bh=vEylqdPcoZ0eu
	JOiHbHp34nwz64q54ysKO9PHy+mOik=; b=dM6ESZzOqo3QpkRhPj0cexpFFM+QN
	qFoHLzZo6/l1TtN2trAen82Y1JOQUfWLhvVQms4inKKS2PWH7+KckhL8YrWhiNkU
	V3eSIky9nSyfFbBrQnGW8lrJPQm4VGGW3Tcez3KNuvFfPBE8eewZuH3o7FU6kSq0
	+I8L9DGHEtLApZDbHZkOT+lME2kzTmQjdcwrz70Z2gXb7tA73mbsB0+gQ3iw/HbR
	UItu3LEfHsYCoCzTRBNEJRfVMRR9AY7zRce97J2wkksxmpwshN5IahK/NC9antDY
	R2vmeBzMXKqKoU/YiGQTivbT17QJ2GvicLQdZh63vAZOCeQwCrNzviiYg==
X-ME-Sender: <xms:a2ewY9cmL_dKrM9irEQfRcZcxZsYZS4WM8iCUjSHoAIVCFX6qlP2_w>
    <xme:a2ewY7PPIiScSxUaz9veZGEIGRxogu2Ctuvlmc-pvQ9hRV7ab9uc_yghpUZ3Sr2Mu
    5nnGTRIBdh5O7MHlA>
X-ME-Received: <xmr:a2ewY2iZ0VPLnbvRFdFYfx7COZk6i_k879ld-Zep9vJpsH9TCwJGQpgitZmOiicUrM_pVu9TbfkF_gyjuRz7VDqNcVF39FHRJk19DcFEDzaFiMiOM-NtPEAe-nzP-YORhfXlLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:a2ewY28t1eAnWEhOQwggTbIIFtstW7qRSw4S6RgXsdRn7-DsZmTg4g>
    <xmx:a2ewY5vWLaIfG5o9d6bAzvRajKdViiqOCvTCIQodqrgoWM8HNFyQdw>
    <xmx:a2ewY1E-Hv5TlgTo46ufI9apB9MorSw4wL9j7eeRyaFSc9NaStRUsg>
    <xmx:a2ewY0nj0fcA6jli-MEERMn9d4J2sqV5BIiW65e4esUsu69xyJ2erg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 11:46:34 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/4] media: cedrus: Make SRAM section claiming optional
Date: Sat, 31 Dec 2022 10:46:26 -0600
Message-Id: <20221231164628.19688-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231164628.19688-1-samuel@sholland.org>
References: <20221231164628.19688-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_084636_308668_8742A223 
X-CRM114-Status: GOOD (  11.05  )
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

The video engine in the D1 family of SoCs does not have a switchable
SRAM section. Allow the driver to probe even when the SRAM section
reference is missing.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index fa86a658fdc6..11e859617932 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -257,7 +257,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 	}
 
 	ret = sunxi_sram_claim(dev->dev);
-	if (ret) {
+	if (ret && ret != -ENOENT) {
 		dev_err(dev->dev, "Failed to claim SRAM\n");
 
 		goto err_mem;
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
