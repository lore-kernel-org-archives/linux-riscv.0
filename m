Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4129C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2p8/URRCYBGVK5zAaVyEPZcZaOZ49phwu7pBi7AS2E=; b=VZG5p3fRnMCAQR9ltbRLL8EdfB
	ldhvCjQGOu887g8dVprLAVVtar43PoDUWtqHgv27+FO/5Zhj4pZFAj+R9r7IgOqKSreFKIAv7R5t+
	lRx/qMuuPvN5REzpfTieUy+9u7t9yqMKHykYUDv4PYXspzYg5RObnOaoHKSjVsP5Ix5zd5O1f8Ol5
	UbpK7uz75KaWvcQYkNMOB0WR3BDLedM0wI9BUee7aUADr3UzkCCsd9jUy5AmP3xE2VSsc47lcWpJg
	FFCjFIKjibHGkYloYCS5WXgsTJSXnKVdd+wCiQwWpNXbjkmHR7jUC8OHYy8jV+vLjD180KQQsdTMR
	A5XSrcgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiHSY-00FuTY-09;
	Mon, 18 Sep 2023 16:50:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiHSU-00FuSc-2w
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 16:50:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CBD06CE10F6;
	Mon, 18 Sep 2023 16:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70B6C433C7;
	Mon, 18 Sep 2023 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695055847;
	bh=8JxeeNt0YIANYdkuILxO1QdRpilUqSWyV1gcj/PegTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlpAl0p0ot/ZdMds5/dzHxWvSvCvoB6UFz2DNFt8l8uvRG06FlLRX1IMnpZk5FAWt
	 xp0hbr0IHEFQ8Fc9h3/iFakdDYOh+hd7LgzCYbXYqenvfRcEONW4VaxI42nvK2WIZZ
	 0Qr1iqebzd7NopusIhwRMtqzJSmzNtRUve6/yNd/Fc3zlQ1DesWAeVlu/qQ0Cf7puc
	 5/ZrtsowpVcbuRfia4JAsYX+W/BVhF9UFxa9SiAAx+NIbe3W5bA5S0KuHJ9fybFKPZ
	 CPO1pzBAZTZXVwmZhaqHYiWkwPs6RrmFUErlYXc8RYn6MYkOpjlgGUWaqpHI9NmPkD
	 x9hzbmwpPZKJg==
Date: Mon, 18 Sep 2023 12:50:45 -0400
From: Sasha Levin <sashal@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, keescook@chromium.org,
	Conor Dooley <conor.dooley@microchip.com>, nathan@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	ndesaulniers@google.com, peterz@infradead.org,
	ajones@ventanamicro.com, heiko@sntech.de,
	prabhakar.mahadev-lad.rj@bp.renesas.com, liaochang1@huawei.com,
	namcaov@gmail.com, andy.chiu@sifive.com, guoren@kernel.org,
	alexghiti@rivosinc.com, Bjorn Topel <bjorn@rivosinc.com>,
	jeeheng.sia@starfivetech.com, jszhang@kernel.org,
	greentime.hu@sifive.com, masahiroy@kernel.org,
	apatel@ventanamicro.com, mnissler@rivosinc.com,
	coelacanthushex@gmail.com, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH AUTOSEL 6.4 25/25] riscv: Add CFI error handling
Message-ID: <ZQh/5ZnoI6dnTonS@sashalap>
References: <20230909003715.3579761-25-sashal@kernel.org>
 <mhng-e2cedb63-0933-4752-bfd8-592e4e1f6e2c@palmer-ri-x1c9>
 <CABCJKucm3KjYKgjP9OT4GLe8KZ3QxpRk9GqPD5JgwMaoZumnQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABCJKucm3KjYKgjP9OT4GLe8KZ3QxpRk9GqPD5JgwMaoZumnQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_095051_136190_7B23C103 
X-CRM114-Status: UNSURE (   9.62  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMDg6MDM6MzhBTSAtMDcwMCwgU2FtaSBUb2x2YW5lbiB3
cm90ZToKPk9uIEZyaSwgU2VwIDgsIDIwMjMgYXQgODozM+KAr1BNIFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+PiBTYW1pIHByb2JhYmx5IHVuZGVyc3RhbmRzIHRo
ZSBkZXBlbmRlbmNpZXMgYmV0dGVyIHRoYW4gSSBkbywgYnV0IEkgZG9uJ3QKPj4gdGhpbmsgdGhp
cyBvbmUgaXMgc2FuZSB0byBqdXN0IGJhY2twb3J0IC0tIHRoZXJlJ3MgYSB3aG9sZSBzZXJpZXMg
aGVyZSwKPj4gYW5kIElJUkMgd2UgaGFkIHRvIHNldCB1cCBzb21lIGNsYW5nIGJpdHMgZm9yIGl0
IHRvIHdvcmsgY29ycmVjdGx5Lgo+Cj5BZ3JlZWQsIGl0IGRvZXNuJ3QgcmVhbGx5IG1ha2Ugc2Vu
c2UgdG8gYmFja3BvcnQgdGhpcyBwYXRjaC4KCkFjaywgaXQncyBnb25lIDopCgotLSAKVGhhbmtz
LApTYXNoYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
