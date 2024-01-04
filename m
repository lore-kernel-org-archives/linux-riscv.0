Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E139AC47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 09:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDACMNMtlah8OwAoJo9FC0I3S5Ll/HoD9nC4TQeW0UA=; b=ZwUwiP9LgUjNLS
	hrMZvpYgcpPLhTjkQE99gLIzGaNWTkg6E9IhQi5JOt22cv/nb2e/vDqn/yck3l8vHsu9FOZxD5Nkp
	QjJeCN/PMLy2Im/twx6Xs9veMy+dMtatg1j4+BA82+X0x78t5Obv7sZLn00a9A/k/2lfOzFvWk5u7
	rJLPr4llIXUT7ANh78HIgCalgvXe3jAhKB9KKbFiNX8Z+2NC8qHCV0JOOEVqCfuLkWYaTBi6munqU
	akOKqxy+7trPl6kesJQDBR8gergaZte5vttPPWv+2nchOWDXWhskHq0/nm2fhWBpXLsAKdrrqsjjG
	n0dzyopAxWAffHHyolDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLJcK-00DITr-0p;
	Thu, 04 Jan 2024 09:02:20 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLJcE-00DIRj-16
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 09:02:18 +0000
X-QQ-mid: bizesmtp72t1704358843t6ba86ak
Received: from [10.4.6.71] ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Jan 2024 17:00:40 +0800 (CST)
X-QQ-SSF: 00200000000000B0B000000A0000000
X-QQ-FEAT: vLOCICHxEeAwlZUMrSPexGDL47dlp5BocL41e8R6efEoiaYKLJ5DvHa67uys3
	WgCfs9zY8gwvIhQT6zyDu/ZrV79S5U4akKfXfs9E9UH9EA2VPJ5i0EQZT4k48KTMDRbbpDF
	4Qe9STrrh+ycGff6kX1wBEzw/++CQMLfkeoeNWyePUCCncwmhTDKW9hL4EQnK7Qx9E5Hc2Y
	Li6yQtVe6lU8Y3xSLA+C1f7NqDlN/1MVL5Fc+PL43WnlCSw8GKGy9ifetWHMcmVL1HVt6Yr
	hEyFvhkovTSwkKTAPEimXXowjlrOPr4rdr9qPlhp3JoDEB6aOirPmmqG9gVLBAxONXnI1dD
	eB3nRi+qRHd6sXz/950E0OJknvHHX+YYtQXtBQq+94lqZgg2CI=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5428542609856036191
Message-ID: <12003A17C98AD4CD+ebb068d6-9d31-e322-34e4-49b604a23dc2@tinylab.org>
Date: Thu, 4 Jan 2024 17:00:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [v9, 06/10] riscv: fpu: drop SR_SD bit checking
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com
Cc: paul.walmsley@sifive.com, greentime.hu@sifive.com,
 guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com,
 ardb@kernel.org, arnd@arndb.de, peterz@infradead.org, tglx@linutronix.de,
 ebiggers@kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Jisheng Zhang <jszhang@kernel.org>,
 Xiao Wang <xiao.w.wang@intel.com>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
 <20231229143627.22898-7-andy.chiu@sifive.com>
From: Song Shuai <songshuaishuai@tinylab.org>
In-Reply-To: <20231229143627.22898-7-andy.chiu@sifive.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_010214_721696_EBEC5B13 
X-CRM114-Status: GOOD (  11.75  )
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

CgrlnKggMjAyMy8xMi8yOSAyMjozNiwgQW5keSBDaGl1IOWGmemBkzoKPiBTUl9TRCBzdW1tYXJp
emVzIHRoZSBkaXJ0eSBzdGF0dXMgb2YgRlMvVlMvWFMuIEhvd2V2ZXIsIHRoZSBjdXJyZW50IGNv
ZGUKPiBzdHJ1Y3R1cmUgZG9lcyBub3QgZnVsbHkgdXRpbGl6ZSBpdCBiZWNhdXNlIGVhY2ggZXh0
ZW5zaW9uIHNwZWNpZmljIGNvZGUKPiBpcyBkaXZpZGVkIGludG8gYW4gaW5kaXZpZHVhbCBzZWdt
ZW50LiBTbyByZW1vdmUgdGhlIFNSX1NEIGNoZWNrIGZvcgo+IG5vdy4KPiAKU2hvdWxkIGhlcmUg
YWRkICJMaW5rIiBhbmQgIkZpeGVzIiB0YWdzPwo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8
YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N3
aXRjaF90by5oIHwgMyArLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0
Y2hfdG8uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3dpdGNoX3RvLmgKPiBpbmRleCBmOTBk
OGU0MmYzYzcuLjdlZmRiMDU4NGQ0NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3N3aXRjaF90by5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zd2l0Y2hfdG8u
aAo+IEBAIC01Myw4ICs1Myw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3N3aXRjaF90b19mcHUo
c3RydWN0IHRhc2tfc3RydWN0ICpwcmV2LAo+ICAgCXN0cnVjdCBwdF9yZWdzICpyZWdzOwo+ICAg
Cj4gICAJcmVncyA9IHRhc2tfcHRfcmVncyhwcmV2KTsKPiAtCWlmICh1bmxpa2VseShyZWdzLT5z
dGF0dXMgJiBTUl9TRCkpCj4gLQkJZnN0YXRlX3NhdmUocHJldiwgcmVncyk7Cj4gKwlmc3RhdGVf
c2F2ZShwcmV2LCByZWdzKTsKPiAgIAlmc3RhdGVfcmVzdG9yZShuZXh0LCB0YXNrX3B0X3JlZ3Mo
bmV4dCkpOwo+ICAgfQo+ICAgClJldmlld2VkLWJ5OiBTb25nIFNodWFpIDxzb25nc2h1YWlzaHVh
aUB0aW55bGFiLm9yZz4KCi0tIApUaGFua3MKU29uZyBTaHVhaQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
