Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457A0C3A5A7
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 10:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QkYsDeLMmDTim53NGOhpjK7OGoM6dbV1jUvsj76gM2s=; b=pBGvFDFXj9IeYf
	AuAYowAT0k40TWNxEBHHPyKMuFW/aJPVWU/JdHpFKngxHmA/JKaV7scGC89l2qb9czDZlTe+Wkw5O
	WsZrJ2RtskMxaikE/ZQ/jwPruOBQ9hApc387HV0XXmK5Fndn1dRkTwOANbWFwWq/m0fNN8g4DQpMI
	qw3c1/Kq/+qP9w+SVQ4Jpzcty3w8n2qwMTLvx5gc1iZu2vguzQD6Yn5ZxHM19sAouWiISy53CB4Li
	d+mOUHi+dDN7EZmt6gLHe+NsbX6xoUFeX8U3vjCedmnFB86oE3q48YVv83En+dnjicw7cQGlsJqAd
	F3OWQS99nET3/7uSwtTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DsN-00BscB-OF; Thu, 08 Dec 2022 10:11:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DsL-00BsSE-0T
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 10:11:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5DE3461E6A;
	Thu,  8 Dec 2022 10:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760AFC43470;
	Thu,  8 Dec 2022 10:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670494291;
	bh=/C3PeG6QmqsUjFX9pmrsV/3THNanZB7XaM6jQlH8kHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QsXxz9VBE5j1K9N9Vr2NNjQkOdQZkzz6Wr51x2qzouxLo6stZf0I6rVS8qlsfjTO7
	 bSwqVj0Mm5CZZN6XlhFMcKoffEtZhxtM2kw5JwoTBtdI4dAyc12fuO9wHybCwClmtL
	 mbHZDhtHM3YlRwBloq8IPVLauW5ATda/rOqwqZSBDhJO/HPPttvBQSdEhCgISRMkmE
	 pn+TQLtexdRaOX2GuQPeQZsQG3RawRSU/QDWh+koJ6dzLhUCfG2q6mi2XX9+u3Waub
	 mfNhcKPLlOp+n9MFXIC4uVU4RpLuZvbAd5NUfGyl6oGur9d0PYaJYNkrzPLQ3ATqls
	 0E4+7wg86K+iQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com,
 ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next V10 05/10] riscv: entry: Remove extra level
 wrappers of trace_hardirqs_{on,off}
In-Reply-To: <20221208025816.138712-6-guoren@kernel.org>
References: <20221208025816.138712-1-guoren@kernel.org>
 <20221208025816.138712-6-guoren@kernel.org>
Date: Thu, 08 Dec 2022 11:11:29 +0100
Message-ID: <87sfhqw6ge.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_021133_112170_A74621BF 
X-CRM114-Status: UNSURE (   6.43  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBKaXNoZW5nIFpoYW5nIDxqc3poYW5n
QGtlcm5lbC5vcmc+Cj4KPiBTaW5jZSByaXNjdiBpcyBjb252ZXJ0ZWQgdG8gZ2VuZXJpYyBlbnRy
eSwgdGhlcmUncyBubyBuZWVkIGZvciB0aGUKPiBleHRyYSB3cmFwcGVycyBvZiB0cmFjZV9oYXJk
aXJxc197b24sb2ZmfS4KPgo+IFRlc3RlZCB3aXRoIGxsdm0gKyBpcnFzb2ZmLgoKV2hhdCBkb2Vz
IHRoaXMgbWVhbj8KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
