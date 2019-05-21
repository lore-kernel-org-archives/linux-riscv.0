Return-Path: <SRS0=Dqti=TV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58595C04E87
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 14:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2659920862
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 14:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZD0llom"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2659920862
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wv2snChADookf5UHPm1Uly5QVpzjL2TWbNa8AlXUOs0=; b=GZD0llomAXPsZw
	Ajiu+F7jOM1E02HFGMChJEX8/aMAoy5S66+/mxTB/NHYtSgpdqZ95whfJ27Wa7RmM4pwn3W5W409c
	ZIfeuE1QfRpWQ35lUBt9DEBkV6aYeVNWUnG/8o2BY9JsBE56fa/Dj6mTWQEi3uY6dWLhivun0rUot
	u2vhFl+A/hYUs7A/UG7TugPt1Ei19Zb13OexiZ5j9jVo1KwkdHzYA6vcGAcewUL8MXUmgeZc8rVkm
	ZGTPjpuijVdiaK5pKWfdRPCc7iztCWRFti4VSNMNlMmwWCjob3iBkEJ0wfA/6uLwpUelyZhdrxhPT
	VxhRGT4JgnTImmm5EBgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT5MB-0003Av-I0; Tue, 21 May 2019 14:03:07 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT5M8-00039E-2O
 for linux-riscv@lists.infradead.org; Tue, 21 May 2019 14:03:05 +0000
Received: from [78.46.172.2] (helo=sslproxy05.your-server.de)
 by www62.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <daniel@iogearbox.net>)
 id 1hT5Ly-0006DJ-9f; Tue, 21 May 2019 16:02:54 +0200
Received: from [178.197.249.20] (helo=linux.home)
 by sslproxy05.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <daniel@iogearbox.net>)
 id 1hT5Ly-000IeH-3T; Tue, 21 May 2019 16:02:54 +0200
Subject: Re: [PATCH bpf] bpf, riscv: clear target register high 32-bits for
 and/or/xor on ALU32
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>, ast@kernel.org, 
 netdev@vger.kernel.org
References: <20190521134622.18358-1-bjorn.topel@gmail.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <49999b2d-f025-894a-be61-a52d13b24678@iogearbox.net>
Date: Tue, 21 May 2019 16:02:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20190521134622.18358-1-bjorn.topel@gmail.com>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.100.3/25456/Tue May 21 09:56:54 2019)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_070304_107540_91D9300B 
X-CRM114-Status: GOOD (  11.95  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Jiong Wang <jiong.wang@netronome.com>, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDUvMjEvMjAxOSAwMzo0NiBQTSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBXaGVuIHVzaW5n
IDMyLWJpdCBzdWJyZWdpc3RlcnMgKEFMVTMyKSwgdGhlIFJJU0MtViBKSVQgd291bGQgbm90IGNs
ZWFyCj4gdGhlIGhpZ2ggMzItYml0cyBvZiB0aGUgdGFyZ2V0IHJlZ2lzdGVyIGFuZCB0aGVyZWZv
cmUgZ2VuZXJhdGUKPiBpbmNvcnJlY3QgY29kZS4KPiAKPiBFLmcuLCBpbiB0aGUgZm9sbG93aW5n
IGNvZGU6Cj4gCj4gICAkIGNhdCB0ZXN0LmMKPiAgIHVuc2lnbmVkIGludCBmKHVuc2lnbmVkIGxv
bmcgbG9uZyBhLAo+ICAgCSAgICAgICB1bnNpZ25lZCBpbnQgYikKPiAgIHsKPiAgIAlyZXR1cm4g
KHVuc2lnbmVkIGludClhICYgYjsKPiAgIH0KPiAKPiAgICQgY2xhbmctOSAtdGFyZ2V0IGJwZiAt
TzIgLWVtaXQtbGx2bSAtUyB0ZXN0LmMgLW8gLSB8IFwKPiAgIAlsbGMtOSAtbWF0dHI9K2FsdTMy
IC1tY3B1PXYzCj4gICAJLnRleHQKPiAgIAkuZmlsZQkidGVzdC5jIgo+ICAgCS5nbG9ibAlmCj4g
ICAJLnAyYWxpZ24JMwo+ICAgCS50eXBlCWYsQGZ1bmN0aW9uCj4gICBmOgo+ICAgCXIwID0gcjEK
PiAgIAl3MCAmPSB3Mgo+ICAgCWV4aXQKPiAgIC5MZnVuY19lbmQwOgo+ICAgCS5zaXplCWYsIC5M
ZnVuY19lbmQwLWYKPiAKPiBUaGUgSklUIHdvdWxkIG5vdCBjbGVhciB0aGUgaGlnaCAzMi1iaXRz
IG9mIHIwIGFmdGVyIHRoZQo+IGFuZC1vcGVyYXRpb24sIHdoaWNoIGluIHRoaXMgY2FzZSBtaWdo
dCBnaXZlIGFuIGluY29ycmVjdCByZXR1cm4KPiB2YWx1ZS4KPiAKPiBBZnRlciB0aGlzIHBhdGNo
LCB0aGF0IGlzIG5vdCB0aGUgY2FzZSwgYW5kIHRoZSB1cHBlciAzMi1iaXRzIGFyZQo+IGNsZWFy
ZWQuCj4gCj4gUmVwb3J0ZWQtYnk6IEppb25nIFdhbmcgPGppb25nLndhbmdAbmV0cm9ub21lLmNv
bT4KPiBGaXhlczogMjM1M2VjYzZmOTFmICgiYnBmLCByaXNjdjogYWRkIEJQRiBKSVQgZm9yIFJW
NjRHIikKPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybi50b3BlbEBnbWFpbC5j
b20+CgpXYXMgdGhpcyBtaXNzZWQgYmVjYXVzZSB0ZXN0X3ZlcmlmaWVyIGRpZCBub3QgaGF2ZSB0
ZXN0IGNvdmVyYWdlPwpJZiBzbywgY291bGQgeW91IGZvbGxvdy11cCB3aXRoIGFsdTMyIHRlc3Qg
Y2FzZXMgZm9yIGl0LCBzbyBvdGhlcgpKSVRzIGNhbiBiZSB0cmFja2VkIGZvciB0aGVzZSBraW5k
IG9mIGlzc3VlIGFzIHdlbGwuIFdlIHNob3VsZApwcm9iYWJseSBoYXZlIG9uZSBmb3IgZXZlcnkg
YWx1MzIgYWx1IG9wIHRvIG1ha2Ugc3VyZSBpdCdzIG5vdApmb3Jnb3R0ZW4gYW55d2hlcmUuCgpU
aGFua3MsCkRhbmllbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
