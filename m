Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5D6C3DA7A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 22:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKlqgXqFv+YIAGBArh5WjZl/yI3AsBi9f1VZVi8Cxzs=; b=UY7YFoTIQlju8B
	aKAzAmIvHvBhloP2x8SsuSKeDmbM9ohjMIGZWJcfykXch1D6iDgBhHNaBXdc9LhwnNF3Lc/nNg4li
	0QllFkZuFojLdF0xZdcGBg45zcb+BDsKPfpmCVpzEwYhtPSfQG6JkfXdkcERWlMS4/rPjyZPdhvBg
	/yE0JPSlYei8iskmeMKTOyNBSLFye9s8JhCWy7pbTGK4msZPv9rMhvnq7on+0kk8fpDi4Tehwj5Ec
	nh+iJrqErIFt0bMSy74wkwhs+LpbBYhbOihQuWVsJL5rRUtXdCWl76hOMbFdWJPIFqaVQj6FeMHmo
	mjwtSH8Yx64XI3OoopLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBjvw-00AonI-Sj; Sat, 31 Dec 2022 22:02:29 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBjvM-00Aoc3-Np; Sat, 31 Dec 2022 22:01:54 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 20D4F5C00AF;
	Sat, 31 Dec 2022 17:01:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 31 Dec 2022 17:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672524112; x=1672610512; bh=Of
	0xMXPiylA4jEfEw42JIYQDYz/9F74OJjr6iVQvau4=; b=ZtVwNinm/RpM0BF/8n
	PJsJKk0KygymBCIAtE3iFPJgywtNXNjJHhXRmg2JPeUpEQUlHn2MGHyOYURQdEDz
	qC7f20sSNOczGEi0szqVyko9sKEw8IXB7Da5HSJC2iCvBdbZzm2qobf/y8QM8Dge
	8EVfYoqn28YJ8HkEtuIKvaPX7TXQBHcf9E+uY67NZk/4Dv4y3g5H+v0BKh8CyWJf
	uDAwFpO+XTi+5rpxtoSv5ka7qg0VESI5FqLH/ljKqtdrtiQ0Dv/k2hPVRfQOUrD+
	747ghfg/q89gUP5a0xKVxVjqL/CEdgd59goHus+aH7G8U6W2xhIDYoeq/+O3+h2T
	MBDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672524112; x=1672610512; bh=Of0xMXPiylA4j
	EfEw42JIYQDYz/9F74OJjr6iVQvau4=; b=OwHK5qO2/4aDZGB5DGZ/hUW7iIeNu
	RtZV5v/8WuTM+DRux4vF1WzAs2Lsg2+dqHQXo3Egd8vlSicV6k8xE5dTTveBecY/
	xAfGfWvG02dPvxhZ5+B5l59J+Cs7waj4GCYAFlvTAwekKnumOGd3b2Whn7EiOtNN
	64HXNlvklQ+vvBr6QiPiGIPJUjeahO1G2wenG2JBhvkyfROXKWdyf/NG2HfWgHoE
	KbLfubEzbHYBINk7cDcU9n8Qe2jy2n/nahB19neL5c+gmvf9XCVb6hamqjvimtm8
	QuHvWcIP0P9ABaiQ46tumgR3jeYEG8zSZj5He7vLdyyZXN17mOCHgnq+g==
X-ME-Sender: <xms:T7GwYzB1Rg8xL_sl_VbihINQ2TubtreQHmZ8My0MBoscDJUgZEcU0A>
    <xme:T7GwY5ghf74rrxuSMHU7XqTTrWoYp_6PJbFUvt02MQNRzyFXWmwZ0SMc0UzvN6qHs
    oRXGHS8IzSLTZE-eQ>
X-ME-Received: <xmr:T7GwY-k10BMt7a-shmDDSnQvIyb4HVD5dCqbKcfvg3IfPR-PYWw84pIFJgWM9tKoU06AQ-ZybdQun4ZfKoFAcyjceuveQN7V8vGbvTpOQSwo6svZwfHQE3b900WScr4K2gRKqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgdduheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:ULGwY1y2xYVyqhRfrpWaB8QXB6YMR0XVv2daCa8Um0xl2Tk6FnPb7A>
    <xmx:ULGwY4QRGbj-wZhVYzaONRqkcdTwzMCV9QNZVdkl8HqbkJjCwva8kw>
    <xmx:ULGwY4ap_waPZDn8ytvxG5Mf8NJIhA7tvAqy-E-VdH1apWdfFpkR7A>
    <xmx:ULGwYxAamVEpoRXdVh6rpqbWNtg5Q8tQQD2DRrTCxwq0leGQQh7khg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 17:01:51 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 2/3] crypto: sun8i-ce - Add TRNG clock to the D1 variant
Date: Sat, 31 Dec 2022 16:01:44 -0600
Message-Id: <20221231220146.646-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231220146.646-1-samuel@sholland.org>
References: <20221231220146.646-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_140152_873355_837930A1 
X-CRM114-Status: GOOD (  13.17  )
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

At least the D1 variant requires a separate clock for the TRNG.
Without this clock enabled, reading from /dev/hwrng reports:

   sun8i-ce 3040000.crypto: DMA timeout for TRNG (tm=96) on flow 3

Experimentation shows that the necessary clock is the SoC's internal
RC oscillator. This makes sense, as noise from the oscillator can be
used as a source of entropy.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - New patch for v2

 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 1 +
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index 9f6594699835..a6865ff4d400 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -118,6 +118,7 @@ static const struct ce_variant ce_d1_variant = {
 		{ "bus", 0, 200000000 },
 		{ "mod", 300000000, 0 },
 		{ "ram", 0, 400000000 },
+		{ "trng", 0, 0 },
 		},
 	.esr = ESR_D1,
 	.prng = CE_ALG_PRNG,
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 8177aaba4434..27029fb77e29 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -105,7 +105,7 @@
 
 #define MAX_SG 8
 
-#define CE_MAX_CLOCKS 3
+#define CE_MAX_CLOCKS 4
 
 #define MAXFLOW 4
 
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
