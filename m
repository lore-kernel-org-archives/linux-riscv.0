Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36D9C35274
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 13:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMqeVXQVlxnI0kWaw0TyC3b9vEIW5DhdcBhxdXqX2RE=; b=WoSYIY/bTnL4YK
	PjAT3Det0yF4BQi3LZFvfDY7eT/zgoL+qPSU8ShhRtma9nRo4sroawN97RXaf++lhzoJ5nRBsAuZb
	6PBtyRjnolq0GM1WjkY2H5Fahz6vO2XCWwP2wej06FZjD5sSOiKnrL4VktNIcl+UDFHCmxmjENxj8
	fsYblnuwyA8aM81pp1TnJJjqWFXrYGzP7e0ssNSYuIs4+sDj3fKyEv0/PNBjfYSbSIMBPrr3PHYpo
	wP9jWZvh3EcH77wkiC9gKI5cw9Aa5pCRuLjTZ4HlDGFMYpI6hgFzJwTzHFMdOY/P0Y5Xb1nesrtJh
	4COTxIwiowl+r1rCpSew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8gp-003SRw-16;
	Fri, 15 Dec 2023 13:57:19 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE8gl-003SNw-2S
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 13:57:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57C80E000F;
	Fri, 15 Dec 2023 13:57:03 +0000 (UTC)
Message-ID: <edf7b71a-2f1d-4da9-b257-9700473ebe59@ghiti.fr>
Date: Fri, 15 Dec 2023 14:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] tools: selftests: riscv: Add missing include for
 vector test
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>,
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Shuah Khan <shuah@kernel.org>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andrew Jones <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 Xiao Wang <xiao.w.wang@intel.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andy Chiu <andy.chiu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
References: <20231123185821.2272504-1-christoph.muellner@vrull.eu>
 <20231123185821.2272504-4-christoph.muellner@vrull.eu>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20231123185821.2272504-4-christoph.muellner@vrull.eu>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_055715_939141_6135F0CB 
X-CRM114-Status: GOOD (  12.36  )
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

T24gMjMvMTEvMjAyMyAxOTo1OCwgQ2hyaXN0b3BoIE11ZWxsbmVyIHdyb3RlOgo+IEZyb206IENo
cmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1Pgo+Cj4gR0NDIHJh
aXNlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cj4gICAgd2FybmluZzogJ3N0YXR1cycgbWF5IGJl
IHVzZWQgdW5pbml0aWFsaXplZAo+IFRoZSB3YXJuaW5nIGNvbWVzIGZyb20gdGhlIGZhY3QsIHRo
YXQgdGhlIHNpZ25hdHVyZSBvZiB3YWl0cGlkKCkgaXMKPiB1bmtub3duIGFuZCB0aGVyZWZvcmUg
dGhlIGluaXRpYWxpemF0aW9uIG9mIEdDQyBjYW5ub3QgYmUgZ3Vlc3NlZC4KPiBMZXQncyBhZGQg
dGhlIHJlbGV2YW50IGhlYWRlciB0byBhZGRyZXNzIHRoaXMgd2FybmluZy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBNw7xsbG5lciA8Y2hyaXN0b3BoLm11ZWxsbmVyQHZydWxsLmV1Pgo+
IC0tLQo+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvdmVjdG9yL3ZzdGF0ZV9leGVj
X25vbGliYy5jIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRl
X2V4ZWNfbm9saWJjLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0
YXRlX2V4ZWNfbm9saWJjLmMKPiBpbmRleCAyYzBkMmIxMTI2YzEuLjFmOTk2OWJlZDIzNSAxMDA2
NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3IvdnN0YXRlX2V4
ZWNfbm9saWJjLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0b3Iv
dnN0YXRlX2V4ZWNfbm9saWJjLmMKPiBAQCAtMSw0ICsxLDcgQEAKPiAgIC8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiArCj4gKyNpbmNsdWRlIDxsaW51eC93YWl0Lmg+
Cj4gKwo+ICAgI2RlZmluZSBUSElTX1BST0dSQU0gIi4vdnN0YXRlX2V4ZWNfbm9saWJjIgo+ICAg
Cj4gICBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCgpZb3UgY2FuIGFkZDoKClJldmll
d2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFua3Mh
CgpBbGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
