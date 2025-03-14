Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E74C282EC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 22:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=McRtMQ7bAZV6YkrWYLZo8QtF40xdR65OeFwcQF7jflo=; b=kjjv9L3u+xDL2ABErUTJnTfbS5
	53B7BVUhwJoHs9ZxyhO7ORGxpGpUNbIqPfD28HWy28Mv0OxP26zHeu3PpCnAEOuxemb+aMYOnsDDg
	q9WGPArmH4N4+68Wbnk+5XF3NCaxExm4A0RvlwhumAmJ6NPkeQ/J2fptrjyQTy4TqV0ozz6uRbTEC
	wdGpGSrEQRl349DinT1412XgZrFrTiI+gvBbMka0WQXBSCAZfyZy1YNZf8Fq/TK6tmupw3Di9678q
	/Frr5/GJxtvu3PDcPT+Sl4uK3XFVGJGyUVTPN8S/oYRRyIOKLaVVV7t5aQN0B2OJGaJdyoH1oY8/d
	DExk+wVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDAN-0000000FPeE-0qiZ;
	Fri, 14 Mar 2025 22:06:07 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttDA7-0000000FPd7-43XQ
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 22:06:06 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 67B0C1382DA3;
	Fri, 14 Mar 2025 18:05:46 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 14 Mar 2025 18:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1741989946;
	 x=1742076346; bh=uoQvjhMmNQg10emVMUUVDGU0v2uRuDY9lOGERp/ZUZk=; b=
	L8XlQFRjBtg+uePPnQAcCavtnZJvYBShZu2eQ0eT1NMU/auMd6Aou88gSNLbrP1S
	6Bm4yAY7+ZMQZd6CCAhdnMFDhrGlwdpbop58acBfPPtnXTcUZtzEJjVBRJjhJD5B
	sk5vrLgrjr+USsQhPBCg5qyvH0hhPf5udu9SnKFfRW1+5VhVE5vB2sW1HRNh4Q8s
	hVaA7lJFsYGx3RhneVKpHEsvsvcOzvG7W8R38mptJCtkxxj9qi/TBAizY0EgRS4i
	OSiNmaN0cFuoXiyICRxSHRl5Iq/PWsMavKcfhN8NTjQwo95Su2wT1VHmpEs9NpUL
	kxwc+Uq1HQVnSASTtx+Suw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741989946; x=
	1742076346; bh=uoQvjhMmNQg10emVMUUVDGU0v2uRuDY9lOGERp/ZUZk=; b=P
	UHUsyzzLUsROGybmyLVc+5v9Yv5LNhz6F4vuBk4B4bFn5GzC5HpEOoW8AhA94P//
	U16cXUE1qo51otrAM59YI4XmdgcJncasrilFDFoZj0BOR+8FTI6II14w4+PldGML
	X0YswS1eMPopg28+ohCAvqut6Jy4pZPWmkMiRf0aUxXGHDQZ2bVT+oEAPA+u4j3j
	HozbFbPB6OM2d/r8/MAriX06WRsmgV7Z29ZXob9238E7tfPuiic8skrPjH8AUZuL
	mcGondW7YlwW4fNki1mgh+uTMa1/jt8+oJni5bhbl/Tpta58Aoa3/G75+/gYNTya
	WZu7YxUBgkou1iTwXABkg==
X-ME-Sender: <xms:OKjUZ20wYyzvXBU5C-J2oeM8CwPZILEzyDDL_mckZ3alPUSzeSLZIQ>
    <xme:OKjUZ5GoL3Ya_YNry2k0F9Ppoe4wv6uex65hu6Q69ktc1Ocfnmd2nEQihC_VWAT6S
    _NYBhie2OH9asgDEsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeduleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    ledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepihhnohgthhhirghmrgesghhmrg
    hilhdrtghomhdprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllh
    gvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehl
    ihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhophhhghhosehlih
    hsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepuhhnihgtohhrnhgpfigrnhhgseho
    uhhtlhhoohhkrdgtohhmpdhrtghpthhtoheptghhrghordifvghisehsohhphhhgohdrtg
    homhdprhgtphhtthhopeigihgrohhguhgrnhhgrdigihhnghesshhophhhghhordgtohhm
X-ME-Proxy: <xmx:OKjUZ-5jyT6VLmZzgnIYR9eHBYWNF3wz5umQ1vAlbB323zNfuwhlXQ>
    <xmx:OKjUZ33M0nPUV9kgZr1VArOxsoBmf9GSO6a8-axDbckSaLA43PdNLg>
    <xmx:OKjUZ5Ej-dkLf40_JE3DgUMQKlSGuMqXPG1EoY_rzkmgrofP7DqwvQ>
    <xmx:OKjUZw8Hm60nNyP4Bd2bwpLzIunTGOwvw22JvER9DhKKhL3LJmFS4w>
    <xmx:OqjUZ_YjcUPLzW07JAK3eMGa0wraXUdWx33jHm90vQH9_U1pDxTJoy7h>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 59A7E2220072; Fri, 14 Mar 2025 18:05:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 14 Mar 2025 23:05:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Chen Wang" <unicorn_wang@outlook.com>, soc@kernel.org,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: "Conor Dooley" <conor@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "Inochi Amaoto" <inochiama@gmail.com>,
 "Xiaoguang Xing" <xiaoguang.xing@sophgo.com>,
 "Chao Wei" <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Message-Id: <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
In-Reply-To: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_150601_611487_1213BB23 
X-CRM114-Status: GOOD (  15.11  )
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

T24gVHVlLCBNYXIgMTEsIDIwMjUsIGF0IDA4OjE1LCBDaGVuIFdhbmcgd3JvdGU6Cj4gSGV5IEFy
bmQsCj4KPiBQbGVhc2UgcHVsbCBkdCBjaGFuZ2VzIGZvciBSSVNDLVYvU29waGdvLgo+Cj4gUGxl
YXNlIG5vdGUgdGhhdCBpbiB0aGUgY29tbWl0cyBJIHN1Ym1pdHRlZCwgSSBtZXJnZWQgYSBicmFu
Y2ggaWItc29waGdvIAo+IGZyb20gTGludXMgV2FsbGVpaiAoc2VlIFsxXSkuwqAgYmVjYXVzZSBw
aW5jdHJsJ3MgZHRzIHBhdGNoIGRlcGVuZHMgb24gaXQuCj4KPiBTbyBhbW9uZyB0b3RhbCAxMyBj
b21taXRzLCB0aGUgZm9sbG93aW5nIDUgcGF0Y2hlcyBhcmUgdGhlIGFjdHVhbCAKPiBwYXRjaGVz
IHRvIGJlIHN1Ym1pdHRlZCBpbiB0aGlzIFBSLCBvdGhlcnMgYXJlIG1lcmdlZCBmcm9tIHRoZSBi
cmFuY2ggCj4gaWItc29waGdvLgo+Cj4gNTI3NzY1N2Q1MzgzIHJpc2N2OiBkdHM6IHNvcGhnbzog
c2cyMDQyOiBhZGQgcGluY3RybCBzdXBwb3J0Cj4gZjA0N2E5Mjg1ZjlmIHJpc2N2OiBzb3BoZ286
IGR0czogYWRkIGNvb2xpbmcgbWFwcyBmb3IgTWlsay1WIFBpb25lZXIKPiA2MmNkZjBhMDZkZDUg
cmlzY3Y6IHNvcGhnbzogZHRzOiBhZGQgcHdtLWZhbiBmb3IgTWlsay1WIFBpb25lZXIKPiA4NjMw
ZWQ2ZjJhZGMgTUFJTlRBSU5FUlM6IHVwZGF0ZSBpbmZvIGZvciBTT1BIR08gREVWSUNFVFJFRVMg
YW5kIERSSVZFUlMKPiAyNTVmODNiYTVjMTYgcmlzY3Y6IHNvcGhnbzogZHRzOiBhZGQgcHdtIGNv
bnRyb2xsZXIgZm9yIFNHMjA0MiBTb0MKPgo+IEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIG9rIGZv
ciB5b3UsIGFueSBxdWVzdGlvbnMsIHBsZWFzZSBmZWVsIGZyZWUgbGV0IAo+IG1lIGtub3cuCgpT
b3JyeSwgSSBjYW4ndCB0YWtlIGl0IHRoaXMgd2F5IGluIHRoZSBzb2MvZHQgYnJhbmNoLCBzaW5j
ZSBJIHdhbnQKdG8gaGF2ZSBvbmx5IGRldmljZXRyZWUgY2hhbmdlcyBpbiB0aGF0LgoKTm9ybWFs
bHkgdGhlcmUgc2hvdWxkIG5vdCBiZSBhbnkgZGVwZW5kZW5jaWVzIGJlY2F1c2UgeW91CnRoZSBk
ZXZpY2UgdHJlZSBpcyBtZWFudCB0byByZW1haW4gY29tcGF0aWJsZSwgc28gYW55dGhpbmcKdGhh
dCB3b3JrZWQgYmVmb3JlIHRoZSBjaGFuZ2VzIHNob3VsZCBrZWVwIHdvcmtpbmcgYWZ0ZXIKdGhl
bS4KCkFyZSB5b3UgYWN0dWFsbHkgZG9pbmcgaW5jb21wYXRpYmxlIGNoYW5nZXMgaGVyZSwgb3Ig
aXMgdGhpcwpqdXN0IGFib3V0IHRoZSBEVCBiaW5kaW5nPwoKPiAgwqBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9zb3BoZ28sc2cyMDQyLXBpbmN0cmwueWFtbCB8IAo+
IDEyOSArKysrKysrKysrKwo+ICDCoE1BSU5UQUlORVJTIHzCoMKgIDQgKy0KPiAgwqBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItbWlsa3YtcGlvbmVlci5kdHPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgCj4gMTA4ICsrKysrKysrKwo+ICDCoGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgCj4gMTUgKysKPiAgwqBkcml2ZXJzL3Bp
bmN0cmwvc29waGdvL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgCj4gNDYgKysrLQo+ICDC
oGRyaXZlcnMvcGluY3RybC9zb3BoZ28vTWFrZWZpbGUgfMKgwqAgOCArLQo+ICDCoGRyaXZlcnMv
cGluY3RybC9zb3BoZ28vcGluY3RybC1jdjE4MDBiLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IAo+IDI3ICsrLQo+ICDCoGRyaXZlcnMv
cGluY3RybC9zb3BoZ28vcGluY3RybC1jdjE4MTJoLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IAo+IDI3ICsrLQo+ICDCoGRyaXZlcnMv
cGluY3RybC9zb3BoZ28vcGluY3RybC1jdjE4eHguY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAKPiA2MDIgKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCllvdSBoYXZlIG92ZXJseSBsb25n
IGxpbmVzIGhlcmUsIHByb2JhYmx5IGZyb20gY29weS1wYXN0aW5nIHRoZSBwdWxsCnJlcXVlc3Qg
ZnJvbSBhIHNoZWxsIGluIGEgd2lkZXIgd2luZG93LiBUbyBmaXggdGhpcyBwYXJ0LCB5b3UgY2Fu
IHBpcGUKdGhlIG91dHB1dCBvZiAnZ2l0IHJlcXVlc3QtcHVsbCcgaW50byBhbm90aGVyIGNvbW1h
bmQsIGUuZy4gJ3hjbGlwJwpvciBzaW1wbHkgJ2NhdCcuCgogICAgICBBcm5kCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
