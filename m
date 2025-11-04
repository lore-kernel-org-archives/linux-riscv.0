Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C40CCFA03
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 01:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQXjw9viXTKLzd1P9ke9isS3y2FDT1Inv6ZW7f7MV3w=; b=yqbz5fx/XLLDiZ
	9B+e0BD6RTeQepLeu61RR8bHZ5+T3MT29UBQXC32MlhP74tw7FdzQ3OQJwRi10GM6qYwvYammipNU
	tEr9QvaQTLZmmbbqCv/c8Je0tgO4Mg4JTblkZP3meYgUPa8Qc9lmdFV//H+WxsBNoHGuAqCQKRqb2
	3T9J3ojhZlZAAEg+8WpvmZ0Tt8sqchkKqxI7vEZQwSlF0dg5y8gKcE/rwPC/h5h1DnJOi73QVmcnO
	x1N4bxhfC5bCSbob4CSWBRjmEdmQJx4VN8IIj3BfleQrBx79b/faZayYlOVaAyfQVtnfPW5HxqxlK
	YVbgvPNm+thvFbhmN7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG5ks-0000000AtJE-3WLP;
	Tue, 04 Nov 2025 01:22:38 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG5kn-0000000AtID-1UEU
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 01:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762219327;
	bh=PzAHLHHFoGCUz6X48qei81ozO59TioTzXVcGf03QZvM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=cfgMtV3zz5XrgN2kIzMTkfCNmo0zRK6dTFs2hO0znf/HDoNrgnakuKUzeg5sgSN6M
	 +l2rE6wKVoLMcP+0u01v4sSAOwaSASj+T2RLrA/dl8G4LUv5xcUerUCfbhn3ORJn11
	 swP74QeZlmNSF8iUP1H7Cdc6Y/bBq95JPwXDxwY8=
X-QQ-mid: zesmtpgz8t1762219321tb851fb03
X-QQ-Originating-IP: JztjGiKrit1lX5of7v0LQ4ORFK9KYoWUVAFGXsRMA2E=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Nov 2025 09:21:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5613329585161487684
EX-QQ-RecipientCnt: 4
Date: Tue, 4 Nov 2025 09:21:59 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
Message-ID: <DA278404237CBF3D+aQlVN4Hnu9b_Mv5l@kernel.org>
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
 <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
 <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
 <D8EC2D64D80DFAFE+aQgXCTbGv9o9t9IS@kernel.org>
 <40d90aa9-4ab2-4d8c-939d-337e63179515@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40d90aa9-4ab2-4d8c-939d-337e63179515@rootcommit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M+niivh25UZIoawQuqISKTkBpFlaH/tTOMChTFqVSxgehp459HubhQjZ
	nbV1M4tNK/vjIdPLJI/6O57Y5eu2d49vE+V2Ge3zJgcysOQwm4X2Y78jPS2OsZEOREebB3a
	r5w4qC5GGBNEN9c89kVsBmHlDA0gV9TgNjfffh+g4oa+D5fEEGfFrhhbCMIGQ0XgVos/+6g
	fNTooheGd5dW3ByfuEi/HfiGzCQ24fWU6hBIM1hO8mRfZCKI8wD94kIGa8ff7k2lwMtHNt3
	jmhv5p6oryjLwFs1rBe0lfnXMewEre/+M7hRsUeIUbOXBIXJj3XORJxbNLN9PF83SqNoH+o
	V2TpKnrAgIjXCSRHGzyyN2yKoZQp+2opx3MA1YHJa4zH6ReLxqpBI9gxZBezV+A8/oTs953
	aN28M1X2bsVeGFZ1SmHVbHNc5Obgp0sBIDtwhOTv2ygzuKFllBt82dhzsI/YRytlBSA1jgo
	RdL75wNyNmQXgI1r8ndMyUVaVj+k3EOY7RFAaHQzvXBGNjytQ+mGvqQB19kiyqfLTGjX+/I
	7/jDREeLELQiFNIfk15g9XMKHAdB9uBkmw7I1MC0KFDOy0SAg1OHQWdqbe+NbC76MPVMVxa
	v3GszvGK+J3g+MCQ0iHDxAaEcvUaLvlkUCcYvUB53t8tJx/jS1qvcUrmq54BWCEBkBa/X4n
	1tKUkO20+dVVz0CIVtiurayFzOkTECdRj9T4dn8d7W2C79rc7XU6amFAgAzx3J3mBb29v2i
	Dnt8C6Y5FVFgknycGiVeEy0qFgjErCutCGmmTduwWoElFeAmkQOHfYQv7ccAHRS2aSVIAHJ
	oOdQTh3FM1t3Txqj8hfoe2Cd0qiGfK9podKK7mkFplpGH/MvuDHGKPm7qJYhhFxIAK4oyPm
	tYX4V+owsRPMbsZPgaP1WrnghdFnxMTfS3sdeguyfT51GUKBskrkXljVBk7zv7UT/r8N1My
	lN8vpzAGw8nMxuWmXw9crBm/2IeYa0arfvTRrtmKswqDQt0VSplgea2E7x+p/LxC6YTaTgV
	hgKNMWTZF1iXUI/wyMT3nM2nb8+HHTeRDofGh3hzoKGd2K72xvq7ikWjVjQhJvAjm49RyXH
	0vlxPpnLoKw
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_172234_615002_E86C93B5 
X-CRM114-Status: GOOD (  15.56  )
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

T24gTW9uLCBOb3YgMDMsIDIwMjUgYXQgMDg6NTE6MTFQTSArMDAwMCwgTWljaGFlbCBPcGRlbmFj
a2VyIHdyb3RlOgo+IEhpIFRyb3ksCj4gCj4gT24gMTEvMy8yNSAwMzo0NCwgVHJveSBNaXRjaGVs
bCB3cm90ZToKPiA+ID4gPiBVbmZvcnR1bmF0ZWx5LCB0aGVzZSBjaGFuZ2VzIGFyZSBub3QgZnVu
Y3Rpb25hbCB5ZXQgb24gT3JhbmdlUGkgUlYyLCB0ZXN0aW5nCj4gPiA+ID4gb24gaHR0cHM6Ly9n
aXRodWIuY29tL3NwYWNlbWl0LWNvbS9saW51eC9jb21taXRzL2sxL2R0LWZvci1uZXh0Cj4gPiA+
ID4gCj4gPiA+ID4gIyBpMmNkZXRlY3QgLXIgMgo+ID4gPiA+IFdBUk5JTkchIFRoaXMgcHJvZ3Jh
bSBjYW4gY29uZnVzZSB5b3VyIEkyQyBidXMsIGNhdXNlIGRhdGEgbG9zcyBhbmQgd29yc2UhCj4g
PiA+ID4gSSB3aWxsIHByb2JlIGZpbGUgL2Rldi9pMmMtMiB1c2luZyByZWNlaXZlIGJ5dGUgY29t
bWFuZHMuCj4gPiA+ID4gSSB3aWxsIHByb2JlIGFkZHJlc3MgcmFuZ2UgMHgwOC0weDc3Lgo+ID4g
PiA+IENvbnRpbnVlPyBbWS9uXQo+ID4gPiA+ICDCoCDCoCDCoDDCoCAxwqAgMsKgIDPCoCA0wqAg
NcKgIDbCoCA3wqAgOMKgIDnCoCBhwqAgYsKgIGPCoCBkwqAgZcKgIGYKPiA+ID4gPiAwMDrCoCDC
oCDCoCDCoCBbwqAgMTI0LjY3NTMyMV0gaTJjLWsxIGQ0MDEyMDAwLmkyYzogaTJjIHRyYW5zZmVy
IGZhaWxlZCwgcmV0IC0xMQo+ID4gPiA+IGVyciAweDQwMDAwMAo+ID4gSSByZWNhbGwgdGhhdCB0
aGUgUE1JQyBzb21ldGltZXMgcmVwb3J0cyBJMkMgdGltZW91dHMuCj4gPiBDb3VsZCB5b3UgcGxl
YXNlIGNvbmZpcm0gaWYgeW914oCZcmUgc2VlaW5nIHRoaXMgaXNzdWUgb24geW91ciBzaWRlPwo+
ID4gSWYgc28sIGRvZXMgaXQgc3RpbGwgb2NjdXIgd2hlbiB1c2luZyBteSBicmFuY2g/Cj4gVW5m
b3J0dW5hdGVseSwgSSBjYW4ndCB0cnkgYXQgdGhlIG1vbWVudCwgbm90IGhhdmluZyB0aGUgYm9h
cmQgdGhpcyB3ZWVrLgo+IEknbGwgYmUgYWJsZSB0byB0ZXN0IGFnYWluIG5leHQgd2Vlay1lbmQu
IApUaGFua3MhCj4KPiBIb3dldmVyLCBJIGRvbid0IHJlbWVtYmVyIGhhdmluZwo+IGl0IHdpdGgg
eW91ciBjaGFuZ2VzLgpJIGZvcmdvdCB0byBwdXQgbXkgbGluay4KSGVyZTogaHR0cHM6Ly9naXRo
dWIuY29tL1Ryb3lzZWxmL3NwYWNlbWl0L3RyZWUvazEvZml4LWkyYy1kZXRlY3QKCiAgICAgICAg
ICAgICAgICAgICAtIFRyb3kKPiBDaGVlcnMKPiBNaWNoYWVsLgo+IC0tIAo+IAo+IE1pY2hhZWwg
T3BkZW5hY2tlcgo+IFJvb3QgQ29tbWl0Cj4gRW1iZWRkZWQgTGludXggVHJhaW5pbmcgYW5kIENv
bnN1bHRpbmcKPiBodHRwczovL3Jvb3Rjb21taXQuY29tCj4gCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
