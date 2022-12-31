Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FB9C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 22:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e0HhNygaC347J1oSnKXsU0iEFt4lluTDuvZna0SMVQc=; b=QmH6Wj5ARA/g8D
	ou5+2izsy4I9p72vjzt/Cj5+07BAoc9nLmGQoxBSKmmhusvUWtaenLadwauLsoWq/3N/F2wVYFKwv
	geIRQvpUPRFbxBgksfyjTwJsLZZZocs6w45YfT+EL8XycyB/BbCEbvtYXqy8ItjQnBNgyvMpddMvr
	qyGbWe4VPcXQPZBNXdz85NWNKL0vVqwbxPpEuDwcWDCOVRudc5fAjWP0n8tIyt1bqVzLrooCXxqX6
	GopfL3Gsd81arTNzCzWah4mzWVt3Vo4qZN6sQejtRWimcBac8pAYXVJuiXu3P/gKU79S2ZSpjTGWx
	1EgUqN6Yo3uI51YF4FTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBjvm-00Aol8-S8; Sat, 31 Dec 2022 22:02:18 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBjvL-00AoaS-5c; Sat, 31 Dec 2022 22:01:53 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 7B5BA5C00AB;
	Sat, 31 Dec 2022 17:01:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 31 Dec 2022 17:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672524109; x=1672610509; bh=uEGwd78iouIBfqIK3t/RRS7S+
	+4GQDRNvKIt4E61Pgc=; b=T7zIRNB7y343XX5YH2dmlezUMp+hc2shyHwqMfd6S
	1lRhKykBUE5ynNXNfY5JEe56s6/drHw+pGSUWkE30nl/ZE7BjxuTi5voaPkt70CJ
	ytfzZVNPmpj8xqNPeUrAjULzx5LYcCaT9cheOg9D9dRMRjb7aHF6rHFSxiVIJ4uO
	PcRgBeEwpo4KeKwZyM1KWq7cRPAt5KxcPw8WkILDzgbEss7HBo++dng4FFxEgBiH
	2UBozlU6oBiaCg0r4gk57NeugKJh39z5y2IOMZCF9saG6WRfLCLNpmCMorA5G4tj
	re2w/xl9lN8pfGajmfyomJtp9GpbsWu3Ksqgr/vMKTCNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672524109; x=1672610509; bh=uEGwd78iouIBfqIK3t/RRS7S++4GQDRNvKI
	t4E61Pgc=; b=G7lOHcQgKBoGMWpvwy6cOD6JEJzXzdc26/du93Hn6fwYmzDaDlr
	QPjwWVFCfcp8vmAiEjaOzQzVEms/AVZKoHZMM9q4sTRBQ3LaFHgQBdj/9CumLqdK
	uYkPcmFH1xVWJygQww7+4smC3sAohtXsoVjhj0HPo0G4G+ti88CXmWNV72OIq3bq
	er2bcNVxlWhNbGiwvclg0eD/rZItnLeqlk0A5nQ4Lozr5apJjgzLaf94cKhbQuZZ
	pLyKfNMHofkpryOUCxQt97KxY8wg8cmkvZr/X+RmhEJCrQQZIqILYFYDNzKOhRvb
	fI/EUNWStiEPWV7unPNGqe/1ZbB1L6jALkg==
X-ME-Sender: <xms:S7GwY6FQd6hZJEG4YIRcIq-0J7QcwvL0LZI70BYVYc3sxQ5CaG67yA>
    <xme:S7GwY7UWoCcAeDdOarYJoHUhTzBufT8U8e9bojz6NlbeU6DrQDZ3kELA9yWsF_5sX
    GXokwZPxn3ATtiNlw>
X-ME-Received: <xmr:S7GwY0KhzI81Va4aLI6SCksAv4w2zCruZVNDjyS8wGmNIMaxrAtvTtE7KgRV9sLctzbxhNXDCDUtxg0Y3iGqdWyEwT5uH4I7CIPYKjetMZDxlmvcBf1_u_7pMwhDY75qamkWpA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgdduheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepkeehffethedtteffgfefteetjedvfeelueevudffgfeutdejvdehledv
    vdffhfevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:S7GwY0FhvTw1JxpLhzraacJm7Uby1ptVkwc_xqWU9fHGEpq9z-zbhw>
    <xmx:S7GwYwWTMkRDvIzRhCJu-8q8ysKNwu74KYpBwJQrYIhJGIqbLazqiQ>
    <xmx:S7GwY3OzIdkhZUpR--lWaCybgzz0u19jz3uHkb0XbYVgW8hzb72-mQ>
    <xmx:TbGwY8mHggTyKBxh-0GO0wvPyIIv5VTAA1jdtcrZpLAzkGYZQShSQQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 17:01:46 -0500 (EST)
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
Subject: [PATCH v2 0/3] crypto: Allwinner D1 crypto support
Date: Sat, 31 Dec 2022 16:01:42 -0600
Message-Id: <20221231220146.646-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_140151_806102_D3590FD4 
X-CRM114-Status: UNSURE (   9.99  )
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

This series finishes adding crypto support for the Allwinner D1 SoC. The
driver patch from v1 was merged, but not the binding[1]. This turned out
to be a good thing, because I later found that the TRNG needed another
clock reference in the devicetree. That is fixed in v2. I include the DT
update here too, since the SoC DT has been on the list for a while[2].

[1]: https://lore.kernel.org/all/20211119051026.13049-1-samuel@sholland.org/T/
[2]: https://lore.kernel.org/lkml/20221208090237.20572-1-samuel@sholland.org/

Changes in v2:
 - Add TRNG clock

Samuel Holland (3):
  dt-bindings: crypto: sun8i-ce: Add compatible for D1
  crypto: sun8i-ce - Add TRNG clock to the D1 variant
  riscv: dts: allwinner: d1: Add crypto engine node

 .../bindings/crypto/allwinner,sun8i-ce.yaml   | 33 ++++++++++++++-----
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 12 +++++++
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  1 +
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  2 +-
 4 files changed, 39 insertions(+), 9 deletions(-)

-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
