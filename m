Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60506C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjXdI26v8I2XXWgfnW3bNc/Fo+1IhQ4B8yl4A9QGDFg=; b=EXnl2sMt9YCZXR
	6cQpe+zrg1oNuvldANDsIxugmJy2430K255d//9UIU1NoFhHPK6yXVbhLGXadueQArDlpTvDCtFkR
	F44M1ZLxv/F/sbKBYOM/owlIfZqsrKmceKUYN6S02C3T+C2pE7XYYtijuP8+fWpACliAU5C3pLNij
	Og1CDFcfSgT0jy2ApU7n5QT/wah3X2pqrUm0qIp1LpaCYF2Fskhi/3CxsBi8UIDlYFelmoMcxghwK
	6nXGWkw+hA9PgeMp23D8c476o/DZ4AoFd305SWJE5w+gPlE9NC+SK7tehTiT1hVTNZISFo0ZSPOTG
	LP8/Cg6TZr365dbO7d4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAZ9M-006Iv3-C1; Wed, 28 Dec 2022 16:19:28 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAZ9I-006IpV-6l
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 16:19:25 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id EBBFE5C018A;
	Wed, 28 Dec 2022 11:19:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 28 Dec 2022 11:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672244361; x=1672330761; bh=ES
	stYnp5wyCE49c6/wy64Qn4j/wTNxpyUZDW8WgeRUg=; b=KGPw76T8n9MIoY9Oog
	5UaC3+g6MNNikDTuxkQ4OAuqigX6iTB3WI4R4Sk2uXqOKSqCGlnxKQAoO1BjwqNN
	he8M+zq2JjzvpS0ot0vIfuvCpwG2LzU7uB5W8xpL5Gctu51tYHgkXEdtA1QzOKQm
	OiNjf2Aqz3+GAccv3ggUvuItBTG3r47dxR+6HRJfaTWKtmGIq6TEQrQUGiY8BJdx
	3Uj6zgyEF4ONDf6EdlUW4BoUD/VKO2pPNzpVdupP6TgL0pBdkX7AnOD9YdwmKsjM
	MGcqjK9iCpxA+QzbzBKp+ZkcuytmmHnQ3CHL2vTKf/2zaC+gAAmgPcj16asE1nTx
	daPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672244361; x=1672330761; bh=ESstYnp5wyCE4
	9c6/wy64Qn4j/wTNxpyUZDW8WgeRUg=; b=HmXYANKpWMSa6HeXX9i9y1m493z9A
	HUeDYwPYYbRqMVqN5vrsMkn7f03KMMc0/NRYQKzIKuXx2tFPFTczPkvCgP2CMBWN
	Rj3bZDhT/zn6JnqMW1OR2HeQh0NTLMBxcUEreyZsXOseWS/srZGbIpOEV9xXm9K4
	/rE7uvzfg33XRbit+JUF3L8kYDN163hqwxuVvFDIcxnu1Td3c6bw843Am2khLZMY
	Rf30Bb7vk7KFGFdn/KqFW1fKjV0qfP9lehYVcFXpd9YxMLmbP+6Xl2yTgIFxWCKS
	mZcdr2antmAc6VhECZkiCn9bVphwwgtX9UmCWfQMStTYm0Um+IbNf9dKg==
X-ME-Sender: <xms:iWysY_13qTjtLDuDaFTr_irxvzDaLtSquZTpM211VtzG8A-0iozZyw>
    <xme:iWysY-GAJ618vsVLc9tbn4HT2RmTs2jhWda_HhsVIHgwnyj5u3COCfZyO71iU5-JN
    34PwkVe8YxPqnZldA>
X-ME-Received: <xmr:iWysY_5daBzabDa9BWqDtIeytGnwFKRmWbUnm-0WUhe8gYxD1y0KcNHsBkqykhS0rxnJO5ue3I4ieDr-liNzduXWsHMSy5QehiNoX8ZyWrUXSEhaODQbtZ5tGpl9hBFIheiV6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedvgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:iWysY02l7QsJhZsXu3ExjXSi5YcWzug7-o6C29zbrtA5iYNgW05a_g>
    <xmx:iWysYyFU8vv9eKRcvcd-B4yibdIpN038Bd-nYfmEjdBKxKb8-S0Q4Q>
    <xmx:iWysY18UFqugYp5qx6RK6Nys45ZSYS_NvzODI_SezOFpozA9KaFBMg>
    <xmx:iWysYwUnYbN6iBLVq8pEhbUeok9CKN6Re3O4POWKmQH5SZ3RyXzngA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Dec 2022 11:19:20 -0500 (EST)
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
Subject: [PATCH 2/3] riscv: sbi: Share the code for unsupported extension warnings
Date: Wed, 28 Dec 2022 10:19:14 -0600
Message-Id: <20221228161915.13194-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221228161915.13194-1-samuel@sholland.org>
References: <20221228161915.13194-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_081924_360026_8C651BA6 
X-CRM114-Status: UNSURE (   9.85  )
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

This reduces the code size by sharing most of the code and the format
string across all affected extensions.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/kernel/sbi.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5c87db8fdff2..1196c12299f6 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -210,16 +210,20 @@ static void sbi_set_power_off(void)
 	pm_power_off = sbi_shutdown;
 }
 #else
+static void __sbi_warn_unsupported(const char *extension)
+{
+	pr_warn("%s extension is not available in SBI v%lu.%lu\n",
+		extension, sbi_major_version(), sbi_minor_version());
+}
+
 static void __sbi_set_timer_v01(uint64_t stime_value)
 {
-	pr_warn("Timer extension is not available in SBI v%lu.%lu\n",
-		sbi_major_version(), sbi_minor_version());
+	__sbi_warn_unsupported("Timer");
 }
 
 static int __sbi_send_ipi_v01(const struct cpumask *cpu_mask)
 {
-	pr_warn("IPI extension is not available in SBI v%lu.%lu\n",
-		sbi_major_version(), sbi_minor_version());
+	__sbi_warn_unsupported("IPI");
 
 	return 0;
 }
@@ -228,8 +232,7 @@ static int __sbi_rfence_v01(int fid, const struct cpumask *cpu_mask,
 			    unsigned long start, unsigned long size,
 			    unsigned long arg4, unsigned long arg5)
 {
-	pr_warn("remote fence extension is not available in SBI v%lu.%lu\n",
-		sbi_major_version(), sbi_minor_version());
+	__sbi_warn_unsupported("Remote fence");
 
 	return 0;
 }
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
