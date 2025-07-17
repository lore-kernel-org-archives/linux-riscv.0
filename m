Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51409C83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 15:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1vj5SbYt6GMILemId7z2y997JE++h4m0gI5sGpe8ts=; b=PaKke8m6gxPRKU
	p1Qe9r3zhkB04d268jWKEuvkhP4njHEq2fxTKP2LfSTZSskKZX/QWi/rVXdYrZwmsHUafGKNwneJk
	fMG7dmFgxkHAeb9hr0OB9NnHHMikeMJRRxGv4KXb3EIRwopBHvsi+Z82QFvVZiqwxvUzPVHgVObdj
	h9wNcEj/TgtqskHSkwM19I9RL6xFQ7R2q2YiVncQE1UO9IbW/lVREhbHY0Pl2smD3XH2JebKtTLvu
	3Iz91aN0GevHToK8ywdRI4OXKNXUyqGdC6jRNS66zB8beNOkop0b9GC8+5Ot8Bgx0N+bHFhtxqurN
	LTHsDbq8e0vKUt+KpUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQ7v-0000000ARgl-35zj;
	Thu, 17 Jul 2025 15:02:27 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucP9L-0000000AJZP-1dr9
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 13:59:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43A8D43A13;
	Thu, 17 Jul 2025 13:59:48 +0000 (UTC)
Message-ID: <92e9a9a0-2654-4a0a-9e26-ee4de998aab1@ghiti.fr>
Date: Thu, 17 Jul 2025 15:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question About Access Fault Handling in the Kernel
To: Vincent Chen <vincent.chen@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: Greentime Hu <greentime.hu@sifive.com>
References: <CABvJ_xjsawGX33f1LLPeLR=OgT635GcqOSrMQpyzn6LQFqx00w@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CABvJ_xjsawGX33f1LLPeLR=OgT635GcqOSrMQpyzn6LQFqx00w@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepuefffedvleetleetjefhjeehudejteetvedtvddvtdfhieetffelvdffgefgieeinecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppedukeehrddvudefrdduheegrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudekhedrvddufedrudehgedrudehuddphhgvlhhopegluddtrddugedrtddrudefngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepvhhinhgtvghnthdrtghhvghnsehsihhfihhvvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepghhrvggvnhhtihhmvgdrhhhusehsihhfihhvvgdrtghomh
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_065951_574669_BB63B458 
X-CRM114-Status: GOOD (  17.51  )
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

SGkgVmluY2VudCwKCkZpcnN0IHNvcnJ5IGZvciB0aGUgdmVyeSBsYXRlIHJlcGx5LgoKT24gNi8z
LzI1IDA2OjI1LCBWaW5jZW50IENoZW4gd3JvdGU6Cj4gSGkgYWxsLAo+IEkgaGF2ZSBhIHF1ZXN0
aW9uIHJlZ2FyZGluZyB0aGUgY3VycmVudCBoYW5kbGluZyBmbG93IGZvciBhY2Nlc3MKPiBmYXVs
dHMgaW4gdGhlIGtlcm5lbC4KPgo+IEluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLCB0aGUg
a2VybmVsIGNvbnNpc3RlbnRseSByZXBvcnRzIHRhbGwKPiBhY2Nlc3MgZmF1bHRzIHVzaW5nIGEg
U0lHU0VHViB3aXRoIGVycm9yIGNvZGUgU0VHVl9BQ0NFUlIsIHdoZXJlCj4gU0VHVl9BQ0NFUlIg
c2lnbmlmaWVzICJJbnZhbGlkIHBlcm1pc3Npb25zIGZvciBtYXBwZWQgb2JqZWN0Igo+IGFjY29y
ZGluZyB0byB0aGUgUE9TSVggc3BlY2lmaWNhdGlvbi4KPgo+IEhvd2V2ZXIsIGluIHRoZSBSSVND
LVYgcHJpdmlsZWdlIHNwZWNpZmljYXRpb24sIGl0IHN0YXRlcyB0aGF0Cj4gIkltcGxlbWVudGF0
aW9ucyBtYXkgcmFpc2UgYWNjZXNzLWZhdWx0IGV4Y2VwdGlvbnMgaW5zdGVhZCBvZgo+IGFkZHJl
c3MtbWlzYWxpZ25lZCBleGNlcHRpb25zIGZvciBzb21lIG1pc2FsaWduZWQgYWNjZXNzZXMsIGlu
ZGljYXRpbmcKPiB0aGUgaW5zdHJ1Y3Rpb24gc2hvdWxkIG5vdCBiZSBlbXVsYXRlZCBieSBhIHRy
YXAgaGFuZGxlciIuIEluIG90aGVyCj4gd29yZHMsIGEgbG9hZC9zdG9yZSBhY2Nlc3MgZmF1bHQg
bWF5IGJlIGNhdXNlZCBieSBhIG1pc2FsaWduZWQgQU1PCj4gaW5zdHJ1Y3Rpb24uIEluIHN1Y2gg
Y2FzZXMsIGl0IHNlZW1zIG1vcmUgYXBwcm9wcmlhdGUgdG8gcmVwb3J0IHRoZQo+IGVycm9yIHVz
aW5nIFNJR0JVUyB3aXRoIHRoZSBlcnJvciBjb2RlIEJVU19BRFJBTE4sIHdoaWNoIGluZGljYXRl
cwo+ICJJbnZhbGlkIGFkZHJlc3MgYWxpZ25tZW50LiIKCgpJIHRoaW5rIHlvdSdyZSByaWdodCwg
aXQgc2VlbXMgbW9yZSBhcHByb3ByaWF0ZS4gQnV0IHRoZW4gaG93IGRvIHdlIApyZWNvZ25pemUg
YW4gYWNjZXNzIGZhdWx0IGV4Y2VwdGlvbiB0aGF0IGlzIGNhdXNlZCBieSBhIG1pc2FsaWduZWQg
CmFjY2Vzcz8gRG8geW91IGhhdmUgYSBzb2x1dGlvbj8gSWYgdGhhdCBkb2VzIG5vdCBzbG93IGRv
d24gdGhlICJub3JtYWwiIAphY2Nlc3MgZmF1bHQsIEkgZ3Vlc3Mgd2UgY2FuIGdpdmUgaXQgYSB0
cnksIHdoYXQgZG8geW91IHRoaW5rPwoKRGlkIHlvdSBlbmNvdW50ZXIgdGhpcyBzaXR1YXRpb24g
d2hlcmUgeW91IHdlcmUgcmVwb3J0ZWQgYSBTSUdTRUdWIGJ1dCAKaXQgd2FzIGFjdHVhbGx5IGEg
U0lHQlVTPwoKU29ycnkgYWdhaW4gZm9yIHRoZSBkZWxheSwKClRoYW5rcywKCkFsZXgKCgo+Cj4g
QXMgSSB1bmRlcnN0YW5kIGl0LCBtb3N0IGFjY2VzcyBmYXVsdHMgYXJlIHR5cGljYWxseSBjYXVz
ZWQgYnkKPiB2aW9sYXRpb25zIG9mIGVpdGhlciBQTUEgb3IgUE1QIHNldHRpbmdzLiBJZiB0aGVz
ZSBzZXR0aW5ncyBhcmUKPiBjb25zaWRlcmVkIGEgZm9ybSBvZiBwZXJtaXNzaW9uIGZvciBhIG1h
cHBlZCBvYmplY3QsIHRoZW4gdGhlIGN1cnJlbnQKPiBpbXBsZW1lbnRhdGlvbiB1c2luZyBTSUdT
RUdWIHdpdGggU0VHVl9BQ0NFUlIgbWFrZXMgc2Vuc2UgYW5kIGhlbHBzCj4gc2ltcGxpZnkgdGhl
IGZhdWx0LWhhbmRsaW5nIGxvZ2ljLgo+Cj4gSeKAmWQgbGlrZSB0byBjb25maXJtIHdoZXRoZXIg
dGhpcyBpbnRlcnByZXRhdGlvbiByZWZsZWN0cyB0aGUgcmVhc29uaW5nCj4gYmVoaW5kIHRoZSBj
dXJyZW50IGltcGxlbWVudGF0aW9uLiBBbnkgY2xhcmlmaWNhdGlvbiB3b3VsZCBiZQo+IGFwcHJl
Y2lhdGVkLiBUaGFua3MhCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
