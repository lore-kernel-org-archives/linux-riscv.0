Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD96C83F22
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 09:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBQSckW4OAydhpixQ/U5pbiXno47cNzTnUFEQiuBDUY=; b=tnudQOWQokZ3Jv
	6Oja61xK7aA948iGUPegL2FnhZceAejASch7PyDLnePSgIfCmonTzGp0jOlaFe2EsJetac/cAzgPC
	hJ0Wto/iNQD3uh4dBQv1g2xjdfD20faW9L84XidrZTei/00jgb2mCpqrpGDs3I1JrwP/giDJ3BIvQ
	5VkFUonyHgmNOH6OBH5X6xuY3J9bJfPdfq7Ol1xTwnof/RJ7SR1Gf0F2m6kuRbPnzhfXPbXjecCUj
	4/oRKB7+bTLJPJrQDAcLX6aNAXJX97S1kjN+dGf/a2GJzizGV5L107mFH14yZq5M7xJBVJ3p1xlty
	nm8hCmjk24YDRYW0PLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKnM-00000009iM8-25tp;
	Thu, 17 Jul 2025 09:20:52 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKOM-00000009dnM-2Og0
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 08:55:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15AFA41DF1;
	Thu, 17 Jul 2025 08:54:57 +0000 (UTC)
Message-ID: <3daff60c-0cf1-437e-bc70-8c84f1866613@ghiti.fr>
Date: Thu, 17 Jul 2025 10:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] riscv: Add xmipsexectl PAUSE instruction
To: aleksa.paunovic@htecgroup.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
 <20250625-p8700-pause-v4-3-6c7dd7f85756@htecgroup.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250625-p8700-pause-v4-3-6c7dd7f85756@htecgroup.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitdduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdeguefhhfevueejteevveeikeelkedvffdufeelveeggfeikeekgfeghfdttdevnecukfhppedukeehrddvudefrdduheegrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudekhedrvddufedrudehgedrudehuddphhgvlhhopegluddtrddugedrtddrudefngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegrlhgvkhhsrgdrphgruhhnohhvihgtsehhthgvtghgrhhouhhprdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvl
 hhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvth
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_015502_752056_DD272236 
X-CRM114-Status: GOOD (  14.16  )
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

T24gNi8yNS8yNSAxNjoyMCwgQWxla3NhIFBhdW5vdmljIHZpYSBCNCBSZWxheSB3cm90ZToKPiBG
cm9tOiBBbGVrc2EgUGF1bm92aWMgPGFsZWtzYS5wYXVub3ZpY0BodGVjZ3JvdXAuY29tPgo+Cj4g
QWRkIE1JUFMuUEFVU0UgaW5zdHJ1Y3Rpb24gb3Bjb2RlLiBUaGlzIGluc3RydWN0aW9uIGlzIGEg
cGFydCBvZiB0aGUKPiB4bWlwc2V4ZWN0bCB2ZW5kb3IgZXh0ZW5zaW9uLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogQWxla3NhIFBhdW5vdmljIDxhbGVrc2EucGF1bm92aWNAaHRlY2dyb3VwLmNvbT4KPiAt
LS0KPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVuZG9yX2V4dGVuc2lvbnMvbWlwcy5oIHwg
NyArKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZW5kb3JfZXh0ZW5zaW9ucy9taXBzLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlbmRvcl9leHRlbnNpb25zL21pcHMuaAo+IGluZGV4IDc1
N2M5NDFjZmQ4NmU5ZmNlZDYxNjliMWE4MjIwMGU2YmI1YzYxMzIuLmY4ZWNhMGJjZjUzZTJkZTFi
YmRjNjY4MjFmZTk1OTg3MTA1ZWQ4NWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS92ZW5kb3JfZXh0ZW5zaW9ucy9taXBzLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlbmRvcl9leHRlbnNpb25zL21pcHMuaAo+IEBAIC0xMyw0ICsxMywxMSBAQAo+ICAgCj4g
ICBleHRlcm4gc3RydWN0IHJpc2N2X2lzYV92ZW5kb3JfZXh0X2RhdGFfbGlzdCByaXNjdl9pc2Ff
dmVuZG9yX2V4dF9saXN0X21pcHM7Cj4gICAKPiArLyogTUlQUy5QQVVTRSBpcyBhbiBhbHRlcm5h
dGl2ZSBvcGNvZGUgd2hpY2ggaXMgaW1wbGVtZW50ZWQgdG8gaGF2ZSB0aGUgKi8KPiArLyogc2Ft
ZSBiZWhhdmlvciBhcyBQQVVTRSBvbiBzb21lIE1JUFMgUklTQ1YgY29yZXMuICovCj4gKy8qIEl0
IGlzIGEg4oCYaGludOKAmSBlbmNvZGluZyBvZiB0aGUgU0xMSSBpbnN0cnVjdGlvbiwgKi8KPiAr
Lyogd2l0aCByZCA9IDAsIHJzMSA9IDAgYW5kIGltbSA9IDUuICovCgoKVGhlIGNvbW1lbnQgYmxv
Y2sgc2hvdWxkIGhhdmUgYmVlbiBsaWtlIHRoaXM6CgovKgogwqAqIC4uLgogwqAqLwoKCj4gKwo+
ICsjZGVmaW5lIE1JUFNfUEFVU0UJIi40Ynl0ZSAweDAwNTAxMDEzXG5cdCIKPiArCj4gICAjZW5k
aWYgLy8gX0FTTV9SSVNDVl9WRU5ET1JfRVhURU5TSU9OU19NSVBTX0gKPgoKVW5sZXNzIHRoZXJl
IGlzIHNvbWV0aGluZyBlbHNlIHRvIGNoYW5nZSBpbiB0aGUgZm9sbG93aW5nIHBhdGNoZXMsIG5v
IApuZWVkIHRvIHJlc2VuZCB0aGUgd2hvbGUgcGF0Y2hzZXQganVzdCB0byBmaXggdGhlIGNvbW1l
bnQgYmxvY2ssIEknbGwgZG8gCml0IHdoZW4gSSBtZXJnZSBpdC4KClJldmlld2VkLWJ5OiBBbGV4
YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFua3MsCgpBbGV4CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
