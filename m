Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6781DC71141
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 13:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B82tJ31AvyhFGzLuKEzheIbaJENlyqlyK2Rh+yUq0MU=; b=UGCiiAd+2uzE1C
	NLSkKWLDkFBDeL/Wxh+vNFQmvbi9uyUQTZgccBXvQIqIXCqzl0qthBFUckho4ubFEoT27FGZQkAk2
	8T/xYbMBCRLuWYki4rWAeqhxVtMIL8t6hcjkiUXAydZypYqhz04QMfWIZyrOgSA2tpueK1jqXtJs7
	taFTUJPkoQmM8eqfPSpx5lvwcCfG24u3kccBx7URDmU6jY1s42LseagnD17G969+kqnVL7g0T5RGT
	s2JIkLCKPovX4wLk4oJw0OoVyy+1Go3DVpqVoy3KgCyEXVIVg3r4a4sSTP0ER43Z/U1NlTj5rqm6j
	K1i1nCNJVMnRRNFOou2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhrg-0000000DQ09-0THK;
	Thu, 12 Jun 2025 13:21:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhKR-0000000DIbt-2Ry7
	for linux-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 12:46:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60581432A3;
	Thu, 12 Jun 2025 12:46:39 +0000 (UTC)
Message-ID: <df439eb4-4dbd-4f0f-bfd2-27c6b1534f39@ghiti.fr>
Date: Thu, 12 Jun 2025 14:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Broken 32-bit riscv debug build with ZSTD and FTRACE
To: Marco Bonelli <marco@mebeim.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "terrelln@fb.com" <terrelln@fb.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <960240908.630790.1748641210849@privateemail.com>
 <1552795452.650306.1748692371190@privateemail.com>
 <c239ee1b-f201-4e7b-80f8-03a7fb02b666@ghiti.fr>
 <1338988468.1011577.1749045125350@privateemail.com>
 <191074362.1248877.1749238947947@privateemail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <191074362.1248877.1749238947947@privateemail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduhedutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepjeeiuedujeeikeevuedtgeeuhfekudeludegveehffefjedugeegudffgfeluefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegspdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmehfudgvsgemfhgulegrmegrugduugemiehfhegsngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehmrghrtghosehmvggsvghimhdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhop
 ehtvghrrhgvlhhlnhesfhgsrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdrohhrghdprhgtphhtthhopehmhhhirhgrmhgrtheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqthhrrggtvgdqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_054647_751539_21D75287 
X-CRM114-Status: GOOD (  13.37  )
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

SGkgTWFyY28sCgpPbiA2LzYvMjUgMjE6NDIsIE1hcmNvIEJvbmVsbGkgd3JvdGU6Cj4gSSB3YXMg
YWJsZSB0byBhbHNvIHJlcHJvZHVjZSB3aXRob3V0IFpTVEQgKGkuZS4gYm90aCBaU1REX0NPTVBS
RVNTPW4KPiBhbmQgWlNURF9ERUNPTVBSRVNTPW4pIGxpa2UgdGhpczoKPgo+IAlleHBvcnQgQVJD
SD1yaXNjdiBDUk9TU19DT01QSUxFPXJpc2N2MzItbGludXgtCj4gCW1ha2UgZGlzdGNsZWFuCj4g
CW1ha2UgZGVmY29uZmlnCj4gCW1ha2UgMzItYml0LmNvbmZpZwo+IAkuL3NjcmlwdHMvY29uZmln
IFwKPiAJCS1lIEZUUkFDRSBcCj4gCQktZSBDT05GSUdfREVCVUdfSU5GT19EV0FSRl9UT09MQ0hB
SU5fREVGQVVMVCBcCj4gCQktZCBSRF9aU1REIFwKPiAJCS1kIFNFQ1VSSVRZX0FQUEFSTU9SX0lO
VFJPU1BFQ1RfUE9MSUNZIFwKPiAJCS1kIEJUUkZTX0ZTCj4gCW1ha2Ugb2xkZGVmY29uZmlnCj4g
CW1ha2UgLWogdm1saW51eAo+Cj4gRGlkIGFub3RoZXIgYmlzZWN0IHJ1biBiZXR3ZWVuIHY2LjE0
IGFuZCB2Ni4xNSB3aXRoIHRoZSBhYm92ZSBjb21tYW5kcwo+IGluIGEgYmFzaCBzY3JpcHQgYW5k
IGdvdDoKPgo+IAk0OTRlN2ZlNTkxYmY4MzRkNTdjNjYwN2NkYzI2YWI4ODczNzA4YWE3IE1lcmdl
IHRhZyAnYnBmX3Jlc19zcGluX2xvY2snIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9icGYvYnBmLW5leHQKPgo+IFRoaXMgbGVhdmVzIG1lIG1vcmUgcHV6
emxlZCB0aGFuIGJlZm9yZSBob25lc3RseS4gTm90IHN1cmUgd2hldGhlciBpdCBpcwo+IGEgcmVh
bCBidWcgb3IgYSBwcm9ibGVtIG9uIG15IGVuZCBhdCB0aGlzIHBvaW50PyBUaGUgZmFjdCB0aGF0
IEkgY2FuIHJlcHJvCj4gaW4gYSBEb2NrZXIgbWFrZXMgbWUgdGhpbmsgb2YgdGhlIGZvcm1lciwg
YnV0IHRoZSBmYWN0IHRoYXQgSSB3YXMgYWJsZSB0bwo+IGJpc2VjdCBpdCBkb3duIHRvIHR3byBk
aWZmZXJlbnQgY29tbWl0cyBkZXBlbmRpbmcgb24gWlNURCB2cyBubyBaU1REIGlzCj4gd2VpcmQu
Cj4KPiBBbGV4IChvciBhbnlvbmUgZWxzZSByZWFsbHkpOiBhcmUgeW91IGFibGUgdG8gcmVwcm9k
dWNlIHdpdGggbXkgRG9ja2VyZmlsZQo+IG9yIGNvbmZpZyBJIHByb3ZpZGVkIGluIG15IGxhc3Qg
bWFpbCBieSBhbnkgY2hhbmNlPwoKSSdtIGFibGUgdG8gcmVwcm9kdWNlIHlvdXIgaXNzdWUgd2l0
aCB5b3VyIERvY2tlcmZpbGUgYW5kIGxvY2FsbHkgdG9vIApub3cgdXNpbmcgeW91ciBsYXN0IGlu
c3RydWN0aW9ucywgd2l0aCB0aGUgcnYzMiB0b29sY2hhaW4geW91IHByb3ZpZGVkIAphbmQgbXkg
cmVndWxhciBydjY0IHRvb2xjaGFpbiAoMTMuMS4wKS4KClNvLCB0aGF0J3Mgd2VpcmQsIGxldCdz
IHRha2UgdGhlIGZvbGxvd2luZyBmYWlsdXJlOgoKRVJST1I6IG1vZHBvc3Q6IHZtbGludXg6IGxv
Y2FsIHN5bWJvbCAncmlzY3ZfY2FjaGVkX212ZW5kb3JpZCcgd2FzIGV4cG9ydGVkCgpXaGVuIGF0
dGFjaGluZyB3aXRoIGdkYiwgSSBnZXQgdGhpczoKCkJyZWFrcG9pbnQgMiwgY2hlY2tfZXhwb3J0
X3N5bWJvbCAoc3ltPTB4N2ZmZmNmYzVhY2E4LCAKc2VjbmFtZT0weDdmZmZmN2I3ZTNhYSAiLmRl
YnVnX3N0ciIsIGZhZGRyPTcyLCBlbGY9MHg3ZmZmZmZmZmRlYzAsIAptb2Q9MHg1NTU1NTU1NmIy
YTApIGF0IC4uL3NjcmlwdHMvbW9kL21vZHBvc3QuYzoxMDg3CjEwODfCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVycm9yKCIlczogbG9jYWwgc3ltYm9sICclcycgd2FzIGV4cG9ydGVkXG4iLCBtb2Qt
Pm5hbWUsCjE6IG1vZC0+bmFtZSA9IDB4NTU1NTU1NTZiMzM0ICJ2bWxpbnV4IgoyOiBsYWJlbF9u
YW1lID0gMHg3ZmZmZGZjZDk2NWYgIl9fZXhwb3J0X3N5bWJvbF9yaXNjdl9jYWNoZWRfbXZlbmRv
cmlkIgooZ2RiKSBwL3ggc3ltLT5zdF9pbmZvCiQxID0gMHgwCihnZGIpIHAveCAqc3ltCiQyID0g
e3N0X25hbWUgPSAweDMyMWRlZCwgc3RfdmFsdWUgPSAweDNkOTExMSwgc3Rfc2l6ZSA9IDB4MCwg
c3RfaW5mbyA9IAoweDAsCiDCoCBzdF9vdGhlciA9IDB4MCwgc3Rfc2huZHggPSAweGI2fQoKd2hl
cmUgc3RfaW5mbyA9PSAwID09IFNUQl9MT0NBTC4KCk9uIGEgd29ya2luZyBydjY0IGJ1aWxkIHdp
dGggdGhlIHNhbWUgY29uZmlncywgSSBnZXQ6CgpCcmVha3BvaW50IDEsIGNoZWNrX2V4cG9ydF9z
eW1ib2wgKHN5bT0weDdmZmZjNTZkOTRhOCwgCnNlY25hbWU9MHg3ZmZmZjdhZTllNTQgIi50ZXh0
IiwgZmFkZHI9MTIwLCBlbGY9MHg3ZmZmZmZmZmRlZDAsIAptb2Q9MHg1NTU1NTU1NmIyYTApIGF0
IC4uL3NjcmlwdHMvbW9kL21vZHBvc3QuYzoxMDg1CjEwODXCoMKgwqDCoMKgwqDCoCBpZiAoRUxG
X1NUX0JJTkQoc3ltLT5zdF9pbmZvKSAhPSBTVEJfR0xPQkFMICYmCihnZGIpIHAveCAqc3ltCiQx
ID0ge3N0X25hbWUgPSAweGU2YWEsIHN0X2luZm8gPSAweDEyLCBzdF9vdGhlciA9IDB4MCwgc3Rf
c2huZHggPSAweDIsCiDCoCBzdF92YWx1ZSA9IDB4MTFiYSwgc3Rfc2l6ZSA9IDB4MmN9CgpUaGUg
ZGlmZmVyZW5jZSBpcyB0aGF0IHRoZSBzeW1ib2wgaXMgbm90IGluIHRoZSBzYW1lIHNlY3Rpb24u
CgpJJ20gc3RpbGwgbG9va2luZyBpbnRvIGl0LCBqdXN0IHdhbnRlZCB0byBsZXQgeW91IGtub3cg
dGhhdCBJIGNhbiAKcmVwcm9kdWNlIGFuZCBob3Bpbmcgc29tZW9uZSB3aG8ga25vd3MgY291bGQg
anVtcCBpbiA6KQoKVGhhbmtzLAoKQWxleAoKCj4KPiAtLQo+IE1hcmNvIEJvbmVsbGkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
