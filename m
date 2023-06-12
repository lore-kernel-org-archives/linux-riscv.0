Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1618C88CB2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHeW1Gt8rpeJ42uOJ8qvsI61T9rq34WmvdFQThMMCPI=; b=ZktXXGRgQSkhF0
	4suWSzXfJmKPmE4BE4GYhr2V4Tb6dDCFQQ3Axf10qfIIIH5p8YcQu5Z268DtfbEbdDe4eiNtBj+Ke
	wAZlCfSXalGu4cCcW/zNzqEJ8EXax2YziYaUq4x5n5ta5ZZb09/acZ1g9UwzigjdB02OrvMvBNFyL
	QEAD+2zd7Qp6UG8/FgmI80MC29f3j7pmmqG/4MIXFPMc9S/p1EHXOot2kIcqk+/PztlQQjNw3jfZh
	IxPzfR1wh1MXlFYiVeyGdQkm530tTGNXtxGK/qkQPR0NW47/8U4TdBCbJeHDn9tx+Gn/phxy9QBnI
	S/URvxGSeTLjWniW6mYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ieS-004JuJ-1k;
	Mon, 12 Jun 2023 14:36:12 +0000
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8ieM-004Jq5-1a;
	Mon, 12 Jun 2023 14:36:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id 285EF14B87;
	Mon, 12 Jun 2023 17:35:42 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from sypressi2.dnainternet.net ([83.102.40.154])
	by localhost (sypressi2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id goenKB_nCimi; Mon, 12 Jun 2023 17:35:27 +0300 (EEST)
Received: from kirsikkapuu2.dnainternet.net (kirsikkapuu2.dnainternet.net [83.102.40.52])
	by sypressi2.dnainternet.net (Postfix) with ESMTP id B3EEC14C0A;
	Mon, 12 Jun 2023 17:33:40 +0300 (EEST)
Received: from basile.localnet (87-92-194-88.rev.dnainternet.fi [87.92.194.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by kirsikkapuu2.dnainternet.net (Postfix) with ESMTPS id 723807E;
	Mon, 12 Jun 2023 17:32:45 +0300 (EEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>, Guo Ren <guoren@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH -next v21 09/27] riscv: Introduce struct/helpers to save/restore
 per-task Vector state
Date: Mon, 12 Jun 2023 17:32:40 +0300
Message-ID: <5271851.rBgCu3BfMA@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230605110724.21391-10-andy.chiu@sifive.com>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-10-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_073606_870256_446521AD 
X-CRM114-Status: UNSURE (   8.49  )
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

TGUgbWFhbmFudGFpbmEgNS4ga2Vzw6RrdXV0YSAyMDIzLCAxNC4wNy4wNiBFRVNUIEFuZHkgQ2hp
dSBhIMOpY3JpdCA6Cj4gQEAgLTMyLDEzICs1NCw4NiBAQCBzdGF0aWMgX19hbHdheXNfaW5saW5l
IHZvaWQgcmlzY3Zfdl9kaXNhYmxlKHZvaWQpCj4gIAljc3JfY2xlYXIoQ1NSX1NTVEFUVVMsIFNS
X1ZTKTsKPiAgfQo+IAo+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgX192c3RhdGVfY3Ny
X3NhdmUoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUKPiAqZGVzdCkgK3sKPiArCWFzbSB2b2xh
dGlsZSAoCj4gKwkJImNzcnIJJTAsICIgX19zdHJpbmdpZnkoQ1NSX1ZTVEFSVCkgIlxuXHQiCj4g
KwkJImNzcnIJJTEsICIgX19zdHJpbmdpZnkoQ1NSX1ZUWVBFKSAiXG5cdCIKPiArCQkiY3Nycgkl
MiwgIiBfX3N0cmluZ2lmeShDU1JfVkwpICJcblx0Igo+ICsJCSJjc3JyCSUzLCAiIF9fc3RyaW5n
aWZ5KENTUl9WQ1NSKSAiXG5cdCIKPiArCQk6ICI9ciIgKGRlc3QtPnZzdGFydCksICI9ciIgKGRl
c3QtPnZ0eXBlKSwgIj1yIiAoZGVzdC0KPnZsKSwKPiArCQkgICI9ciIgKGRlc3QtPnZjc3IpIDog
Oik7Cj4gK30KPiArCj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBfX3ZzdGF0ZV9jc3Jf
cmVzdG9yZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZQo+ICpzcmMpICt7Cj4gKwlhc20gdm9s
YXRpbGUgKAo+ICsJCSIub3B0aW9uIHB1c2hcblx0Igo+ICsJCSIub3B0aW9uIGFyY2gsICt2XG5c
dCIKPiArCQkidnNldHZsCSB4MCwgJTIsICUxXG5cdCIKPiArCQkiLm9wdGlvbiBwb3Bcblx0Igo+
ICsJCSJjc3J3CSIgX19zdHJpbmdpZnkoQ1NSX1ZTVEFSVCkgIiwgJTBcblx0Igo+ICsJCSJjc3J3
CSIgX19zdHJpbmdpZnkoQ1NSX1ZDU1IpICIsICUzXG5cdCIKPiArCQk6IDogInIiIChzcmMtPnZz
dGFydCksICJyIiAoc3JjLT52dHlwZSksICJyIiAoc3JjLT52bCksCj4gKwkJICAgICJyIiAoc3Jj
LT52Y3NyKSA6KTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIF9fcmlzY3Zfdl92c3Rh
dGVfc2F2ZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZQo+ICpzYXZlX3RvLCArCQkJCQkgdm9p
ZCAqZGF0YXApCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgdmw7Cj4gKwo+ICsJcmlzY3Zfdl9lbmFi
bGUoKTsKPiArCV9fdnN0YXRlX2Nzcl9zYXZlKHNhdmVfdG8pOwo+ICsJYXNtIHZvbGF0aWxlICgK
PiArCQkiLm9wdGlvbiBwdXNoXG5cdCIKPiArCQkiLm9wdGlvbiBhcmNoLCArdlxuXHQiCj4gKwkJ
InZzZXR2bGkJJTAsIHgwLCBlOCwgbTgsIHRhLCBtYVxuXHQiCj4gKwkJInZzZTgudgkJdjAsICgl
MSlcblx0Igo+ICsJCSJhZGQJCSUxLCAlMSwgJTBcblx0Igo+ICsJCSJ2c2U4LnYJCXY4LCAoJTEp
XG5cdCIKPiArCQkiYWRkCQklMSwgJTEsICUwXG5cdCIKPiArCQkidnNlOC52CQl2MTYsICglMSlc
blx0Igo+ICsJCSJhZGQJCSUxLCAlMSwgJTBcblx0Igo+ICsJCSJ2c2U4LnYJCXYyNCwgKCUxKVxu
XHQiCj4gKwkJIi5vcHRpb24gcG9wXG5cdCIKPiArCQk6ICI9JnIiICh2bCkgOiAiciIgKGRhdGFw
KSA6ICJtZW1vcnkiKTsKPiArCXJpc2N2X3ZfZGlzYWJsZSgpOwo+ICt9CgpTaG91bGRuJ3QgdGhp
cyB1c2UgYHZzOHIudmAgcmF0aGVyIHRoYW4gYHZzZTgudmAsIGFuZCBkbyBhd2F5IHdpdGggYHZz
ZXR2bGlgPyAKVGhpcyBzZWVtcyBsaWtlIGEgdGV4dGJvb2sgdXNlIGNhc2UgZm9yIHRoZSB3aG9s
ZS1yZWdpc3RlciBzdG9yZSBpbnN0cnVjdGlvbiwgCm5vPwoKPiArCj4gK3N0YXRpYyBpbmxpbmUg
dm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUK
PiAqcmVzdG9yZV9mcm9tLCArCQkJCQkgICAgdm9pZCAKKmRhdGFwKQo+ICt7Cj4gKwl1bnNpZ25l
ZCBsb25nIHZsOwo+ICsKPiArCXJpc2N2X3ZfZW5hYmxlKCk7Cj4gKwlhc20gdm9sYXRpbGUgKAo+
ICsJCSIub3B0aW9uIHB1c2hcblx0Igo+ICsJCSIub3B0aW9uIGFyY2gsICt2XG5cdCIKPiArCQki
dnNldHZsaQklMCwgeDAsIGU4LCBtOCwgdGEsIG1hXG5cdCIKPiArCQkidmxlOC52CQl2MCwgKCUx
KVxuXHQiCj4gKwkJImFkZAkJJTEsICUxLCAlMFxuXHQiCj4gKwkJInZsZTgudgkJdjgsICglMSlc
blx0Igo+ICsJCSJhZGQJCSUxLCAlMSwgJTBcblx0Igo+ICsJCSJ2bGU4LnYJCXYxNiwgKCUxKVxu
XHQiCj4gKwkJImFkZAkJJTEsICUxLCAlMFxuXHQiCj4gKwkJInZsZTgudgkJdjI0LCAoJTEpXG5c
dCIKPiArCQkiLm9wdGlvbiBwb3Bcblx0Igo+ICsJCTogIj0mciIgKHZsKSA6ICJyIiAoZGF0YXAp
IDogIm1lbW9yeSIpOwo+ICsJX192c3RhdGVfY3NyX3Jlc3RvcmUocmVzdG9yZV9mcm9tKTsKPiAr
CXJpc2N2X3ZfZGlzYWJsZSgpOwo+ICt9Cj4gKwoKRGl0dG8gYnV0IGB2bDhyLnZgLgoKPiAgI2Vs
c2UgLyogISBDT05GSUdfUklTQ1ZfSVNBX1YgICovCj4gCj4gIHN0cnVjdCBwdF9yZWdzOwo+IAo+
ICBzdGF0aWMgaW5saW5lIGludCByaXNjdl92X3NldHVwX3ZzaXplKHZvaWQpIHsgcmV0dXJuIC1F
T1BOT1RTVVBQOyB9Cj4gIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgYm9vbCBoYXNfdmVjdG9yKHZv
aWQpIHsgcmV0dXJuIGZhbHNlOyB9Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCByaXNjdl92X3ZzdGF0
ZV9xdWVyeShzdHJ1Y3QgcHRfcmVncyAqcmVncykgeyByZXR1cm4KPiBmYWxzZTsgfSAjZGVmaW5l
IHJpc2N2X3ZfdnNpemUgKDApCj4gKyNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb2ZmKHJlZ3MpCQlk
byB7fSB3aGlsZSAoMCkKPiArI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJCWRvIHt9
IHdoaWxlICgwKQo+IAo+ICAjZW5kaWYgLyogQ09ORklHX1JJU0NWX0lTQV9WICovCj4gCgoKLS0g
CtCg0LXQvNC4INCU0ZHQvdC4LdCa0YPRgNC80L7QvQpodHRwOi8vd3d3LnJlbWxhYi5uZXQvCgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
