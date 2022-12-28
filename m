Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAD6C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X0j+hFZnmZfho/ZMry8/JsIrV3nGrRbIfIfYFCK+4Jk=; b=Eb/Iidzvldm3lK
	lTIW1gjdd6S7i2NzyPUrr95NpL5rO5PpvfhqH+P4TVxtK53+cZWhmGo1hFEQRufRgHXDyb5qJymDh
	/U58DziIjib/m3q4hdzBsZ4T0Et869dJ708qzVg5mOUS0Ll/5yRmFgKGJnVk4WDelpUBcMyuLPeyT
	TxZsTX/rDs8YOU3ZRtZp6ttL02Sg6u8hB5y5rEZAabt/7AmwxUuj+A+KM/zWh2I3kah0Xy0Y1hoMU
	8iF7rcba6oapQSgkxSi2EKdT2P8XblNkdia++LvIkcwT9NDQ8VVUuOBN9QWmbHkjR5i5LOrd64id8
	hJbQ2sO7YCef3V2f0muw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAZ9S-006IzC-CM; Wed, 28 Dec 2022 16:19:34 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAZ9I-006Int-6k
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 16:19:27 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 228DE5C0185;
	Wed, 28 Dec 2022 11:19:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 28 Dec 2022 11:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672244359; x=1672330759; bh=+MzbJuL0sz6xYgyGW+zwedxik
	v2ybOeYdYhDY6xmhzg=; b=EgjRXLVlzDO3JjcYyL+wRRhrOb013Iu2nzK8NjvUB
	voaTsi/8c8J/dPerwe9GRP0c6h2r7/1P8I7k5Dz3zjoLOLnzpRU8SUk2qbWKg9eR
	1MLzORr7BDUczDuHhNXZGhy2Ls45lPa2bO+liasLEz0WVrrvLuOCMkwMOzwqgpkk
	xDjtrwkaMw6kJU1+CEvyLflxq6Bl/fIOIpWbCzlTWp6sMCrcXqEt0NzY9HNfkcdI
	BC+oa0TYHK567p9JMYeWEO5tsv1ArfMmEid7eDcDNbkz3xlZ3OooQATV9Z/6pLom
	F4+X1oRNzJU9vXuKwWnRu0rYvf4M9OcwSBts1UTpbMNpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672244359; x=1672330759; bh=+MzbJuL0sz6xYgyGW+zwedxikv2ybOeYdYh
	DY6xmhzg=; b=W7dQrHduKsuWY3JvJyYCqpaeZ5NviTqpcnpThpvNwbig6qO4O+g
	KSBtnpFupqSICqAVQ20+L2ya+/bB6kz0u2GCncnSukFUylW/6UZj7XNTvS79U6sm
	d6kbPvCMjIl+GndbnrU8dcctRC/WOF0oEPayQYUshOOGo7V6i3hVwVQ5M1oMFDP5
	g54UQjmMIcn994h6gbuJ1/lR14IxCLc4ZI9D0uDsWUaB3JcA2e7h+eFlKgco571U
	MPnEyq3zc0N/LBBbCHMgJVOy9pY5Wi8ZSD2YuPci1yORd68mrBlWDYONnuW7oj1C
	IPSlMlwJLsoWNTc3Ue7PpW/54De1kWPFOCw==
X-ME-Sender: <xms:hWysY_MIvyNk6Fl7igOS5ykwpW4bxcB89DCO3ihVnRYHh3-7L6yHmw>
    <xme:hWysY589Wxxp36pc5UhBaipoIkE80BSPT4j6zDXPzc_tINkYUzmqEzXCBv4ysu_-V
    9L-wUHbWopfsbcWxA>
X-ME-Received: <xmr:hWysY-RuKrR36tmIXILMS2__02PNQEw9NQKEpicgWMtt-1UUOY3hUzpJNu9MBIQv34FX_-kw-mZKGeRvF_KMQ3s0gkb6XY-zDHneg36afg7hIaox3OrWxfwa7SwW6NeEXZdqKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedvgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekheffteehtdetfffgfeetteejvdefleeuvedufffguedtjedvheelvddv
    fffhveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdr
    ohhrgh
X-ME-Proxy: <xmx:hWysYzt7xQyw9T6XNt25TH7IQjKZOIfbKJeQAUP-Rt_kmi4eK3_wJw>
    <xmx:hWysY3c-dN0q47s7C4QR5Ukc8MPYVkiRLA4m5vMaOdI-eJVp6s3_dg>
    <xmx:hWysY_0eOANcwUIgRg9k078yiHZhIUVygSKTUt9PjsTdiGhxnb-UgQ>
    <xmx:h2ysYytkq0BX7Gc454wV-4bRuk35MyCM4_MOQl5VOg_xsJkRaTVbjA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Dec 2022 11:19:16 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Petr Mladek <pmladek@suse.com>,
	YueHaibing <yuehaibing@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	tangmeng <tangmeng@uniontech.com>
Subject: [PATCH 0/3] riscv: sbi: Switch to the sys-off handler API
Date: Wed, 28 Dec 2022 10:19:12 -0600
Message-Id: <20221228161915.13194-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_081924_411474_CA686DA7 
X-CRM114-Status: GOOD (  10.97  )
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

I want to convert the axp20x PMIC poweroff handler to use the sys-off
API, so it can be used as a fallback for if the SBI poweroff handler
is unavailable. But the SBI poweroff handler still uses pm_power_off, so
done alone, this would cause the axp20x callback to be called first,
before the SBI poweroff handler has a chance to run.

In order to prevent this change in behavior, the SBI poweroff handler
needs to be converted to the sys-off API first, at a higher priority.

This series performs the conversion, after accounting for the fact that
the SBI poweroff handler is registered quite early during boot.

The first patch is a dependency for both this series and the PSCI
series[1], so I would like to get at least patch 1 merged soon.

[1]: https://lore.kernel.org/lkml/20221105214841.7828-1-samuel@sholland.org/


Samuel Holland (3):
  kernel/reboot: Use the static sys-off handler for any priority
  riscv: sbi: Share the code for unsupported extension warnings
  riscv: sbi: Switch to the sys-off handler API

 arch/riscv/include/asm/sbi.h |  1 -
 arch/riscv/kernel/sbi.c      | 63 +++++++++++++++++++++---------------
 kernel/reboot.c              | 10 +++---
 3 files changed, 41 insertions(+), 33 deletions(-)

-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
