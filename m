Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55343C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HS0tkJf/7+dN4HBzBAw+QATsQMBnLCRggUi2po0eA8=; b=g7CChl/86YH7dl
	kg/xK+RlRJlX+Tv8qxlw2+IChuZ6OvmVoPJoj28Yw7WYZAL+XWIvxtKn8VoiTe8tw0A22XqrCjvJY
	QCOTbt9Fxov4yJbqZhzytebmm2kKqgulIRkKG9y0YmnXnn9rMBkVtbugI7ZIkQs3XALt8BbUT6k33
	DUqUG8gsp8vw50cIaeNq7SAjmTeovFmQiJOV6Gb5msTOCCZhEA7lBOQTRGd2abi/cZU5MRix44CcO
	RK0NmqAfndcZF2s6c6LEAl19JISTwGCEnoEHXe/KiRIVGcX/K/8ZyhLmc+KKW/fd48WMWANIMk07Y
	8chAifPc+3t8qMgAUTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzgT-0000000F203-32UI;
	Wed, 17 Apr 2024 07:26:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzgQ-0000000F1zf-14Tn
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 07:26:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2FB8661280;
	Wed, 17 Apr 2024 07:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC43C072AA;
	Wed, 17 Apr 2024 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713338776;
	bh=NRb6yN6BiffLT8J6ikAQwA7PmQ1nwOOaImZKibq+JPc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oyjiaxXxi5PF3OhNR21u6QRUxmfn5vjVAVgkcfxbd+VINZDJc8tqAuABrtKNHrJEQ
	 7LnOMAkoy+IHfKiXWOh0zonVbEZ1XBJKw3bf4Z/dKU1sk2gXjgVLlL8sJ3p/MZ/drC
	 uEWjISNBLhdxY9We6mOvruIRJoRGyopeGStmcKQBZXY+rZ5WJSl2FZPp2vJSvv4Lvj
	 3tqE9XGsw94wJBZvvt57iu5AJsw1Paz64So+RHVjBMTAJIASWZxzeQ87jLgyAV02MZ
	 U3g3pz1h9+IDpgASKP32CagUHqQesmbsXtdxbHerJuVJw27ctS4leqv6+KaenBDEtg
	 BC4g5MCxI9SsA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: takakura@valinux.co.jp, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, apatel@ventanamicro.com, bmeng.cn@gmail.com,
 atishp@rivosinc.com, daniel.thompson@linaro.org, arnd@arndb.de,
 sfr@canb.auug.org.au, akpm@linux-foundation.org,
 conor.dooley@microchip.com, samuel.holland@sifive.com
Cc: taka@valinux.co.jp, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ryo Takakura <takakura@valinux.co.jp>
Subject: Re: [PATCH] RISC-V: Enable IPI CPU Backtrace
In-Reply-To: <20240417050711.41930-1-takakura@valinux.co.jp>
References: <20240417050711.41930-1-takakura@valinux.co.jp>
Date: Wed, 17 Apr 2024 09:26:13 +0200
Message-ID: <87bk68fo16.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_002618_414557_F57962D6 
X-CRM114-Status: GOOD (  10.61  )
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

dGFrYWt1cmFAdmFsaW51eC5jby5qcCB3cml0ZXM6Cgo+IEZyb206IFJ5byBUYWtha3VyYSA8dGFr
YWt1cmFAdmFsaW51eC5jby5qcD4KPgo+IEFkZCBDUFUgYmFja3RyYWNlIGZlYXR1cmUgdXNpbmcg
SVBJIG9uIHJpc2N2Lgo+IEN1cnJlbnRseSwgcmlzY3YgZG9lc24ndCB5ZXQgc3VwcG9ydCB0aGUg
ZmVhdHVyZSB3aGlsZSBvdGhlcgo+IGFyY2hpdGVjdHVyZXMgZG8uIEFzIElQSSBtdWx0aXBsZXhp
bmcgYWxsb3dzIHRvIGhhbmRsZSAKPiBtdWx0aXBsZSBJUElzLCBJIHRoaW5rIHRoaXMgZmVhdHVy
ZSBjYW4gYWxzbyBiZSBlbmFibGVkIAo+IG9uIHJpc2N2IGJ5IGFkZGluZyBJUEkuCj4KPiBUaGlz
IHBhdGNoIGRlZmluZXMgYXJjaF90cmlnZ2VyX2FsbF9jcHVfYmFja3RyYWNlKCkgd2hpY2ggdHJp
Z2dlcnMKPiB0aGUgSVBJIGZvciBDUFUgYmFja3RyYWNlLgo+IEl0IHdpbGwgYmUgdHJpZ2dlcmVk
IGluIHRoZSBldmVudHMgb2Ygb29wcy9wYW5pYyB3aGVuIG9wdGlvbnMKPiAob29wc19hbGxfY3B1
X2JhY2t0cmFjZS9wYW5pY19wcmludCkgYXJlIHNldCBhY2NvcmRpbmdseS4KPgo+IEJlbG93IGlz
IHRoZSBjYXNlIG9mIG9vcHMgd2l0aCB0aGUgb29wc19hbGxfY3B1X2JhY2t0cmFjZSAKPiBlbmFi
bGVkLgo+Cj4gJCBzeXNjdGwga2VybmVsLm9vcHNfYWxsX2NwdV9iYWNrdHJhY2U9MQo+Cj4gdHJp
Z2dlcmluZyBvb3BzIHNob3dzOgo+IFsgIDQzNS43MTY3NTRdIE5NSSBiYWNrdHJhY2UgZm9yIGNw
dSAzCj4gWyAgNDM1LjcxNjg5M10gQ1BVOiAzIFBJRDogNjIxIENvbW06IGluOmlta2xvZyBUYWlu
dGVkOiBHICAgICAgICAgICBPRSAgICAgIDYuOS4wLXJjNCAjMQo+IFsgIDQzNS43MTcwODZdIEhh
cmR3YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiBbICA0MzUuNzE3MTgyXSBlcGMg
OiBmYWxsYmFja19zY2FsYXJfdXNlcmNvcHkrMHg4LzB4ZGMKPiBbICA0MzUuNzE3MzAwXSAgcmEg
OiBfY29weV90b191c2VyKzB4MzIvMHg1OAo+IFsgIDQzNS43MTczOTFdIGVwYyA6IGZmZmZmZmZm
ODBjMzNkODggcmEgOiBmZmZmZmZmZjgwNTk4ZTNjIHNwIDogZmYyMDAwMDAwMGU4M2I1MAo+IFsg
IDQzNS43MTc1NDRdICBncCA6IGZmZmZmZmZmODIwNjZiZjAgdHAgOiBmZjYwMDAwMDkxZmQ3MDAw
IHQwIDogMzM2MzMwMzg2NjY2MDAwMAo+IFsgIDQzNS43MTc3MTFdICB0MSA6IDAwMDAwMDAwMDAw
MDAwNWIgdDIgOiAzMzYzMzAzODY2NjY2NjY2IHMwIDogZmYyMDAwMDAwMGU4M2I2MAo+IFsgIDQz
NS43MTc4NzRdICBzMSA6IDAwMDAwMDAwMDAwMDAxYWYgYTAgOiAwMDAwN2ZmNzRkM2RmNzRmIGEx
IDogZmY2MDAwMDA4MmNkYzgwMAo+IFsgIDQzNS43MTgwNDBdICBhMiA6IDAwMDAwMDAwMDAwMDAw
M2MgYTMgOiAwMDAwMDAwMDAwMDAwMDAwIGE0IDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgIDQzNS43
MTgxOTZdICBhNSA6IDAwZmZmZmZmZmZmZmZmYzQgYTYgOiAwMDAwMDAwMDAwMDAwMDAwIGE3IDog
MDAwMDAwMDAwMDAwMDAxMAo+IFsgIDQzNS43MTgzMzNdICBzMiA6IGZmNjAwMDAwODJjZGM4MDAg
czMgOiBmZmZmZmZmZjgyMDY2OTEwIHM0IDogMDAwMDAwMDAwMDAwMWRmMQo+IFsgIDQzNS43MTg0
NzVdICBzNSA6IGZmZmZmZmZmODIwNmE1YjggczYgOiAwMDAwN2ZmNzRkM2RmNzRmIHM3IDogZmZm
ZmZmZmY4MjA2YTViMAo+IFsgIDQzNS43MTg2MTZdICBzOCA6IGZmNjAwMDAwODJjZGM4MDAgczkg
OiBmZmZmZmZmZjgxZTI2MjA4IHMxMDogMDAwMDAwMDAwMDAwMDAzYwo+IFsgIDQzNS43MTg3NjBd
ICBzMTE6IGZmZmZmZmZmODIwNmE1YWQgdDMgOiBmZjYwMDAwMDgyY2RjODEyIHQ0IDogZmY2MDAw
MDA4MmNkYzgxMgo+IFsgIDQzNS43MTg5MDldICB0NSA6IGZmNjAwMDAwODJjZGM4MTggdDYgOiAw
MDAwMDAwMDAwMDQwMDAwCj4gWyAgNDM1LjcxOTAxOV0gc3RhdHVzOiAwMDAwMDAwMDAwMDQwMTIw
IGJhZGFkZHI6IDAwMDAwMDAwMDAwMDAwMDAgY2F1c2U6IDgwMDAwMDAwMDAwMDAwMDEKPiBbICA0
MzUuNzE5MTkxXSBbPGZmZmZmZmZmODBjMzNkODg+XSBmYWxsYmFja19zY2FsYXJfdXNlcmNvcHkr
MHg4LzB4ZGMKPiBbICA0MzUuNzE5MzMwXSBbPGZmZmZmZmZmODAwOTRlZWU+XSBzeXNsb2dfcHJp
bnQrMHgxZjQvMHgyYjIKPiBbICA0MzUuNzE5NDQ2XSBbPGZmZmZmZmZmODAwOTVlMTA+XSBkb19z
eXNsb2cucGFydC4wKzB4YjAvMHgzMjYKPiBbICA0MzUuNzE5NTk0XSBbPGZmZmZmZmZmODAwOTY5
MmU+XSBkb19zeXNsb2crMHg2Ni8weDg4Cj4gWyAgNDM1LjcxOTgxNl0gWzxmZmZmZmZmZjgwM2Ex
YTgwPl0ga21zZ19yZWFkKzB4NDQvMHg1Ywo+IFsgIDQzNS43MjAwMTddIFs8ZmZmZmZmZmY4MDM4
ZWE5Mj5dIHByb2NfcmVnX3JlYWQrMHg3YS8weGE4Cj4gWyAgNDM1LjcyMDI1MV0gWzxmZmZmZmZm
ZjgwMmZhZTIwPl0gdmZzX3JlYWQrMHg5NC8weDI2NAo+IFsgIDQzNS43MjA0NzhdIFs8ZmZmZmZm
ZmY4MDJmYjkwNj5dIGtzeXNfcmVhZCsweDY0LzB4ZTQKPiBbICA0MzUuNzIwNzA5XSBbPGZmZmZm
ZmZmODAyZmI5YTY+XSBfX3Jpc2N2X3N5c19yZWFkKzB4MjAvMHgyYwo+IFsgIDQzNS43MjA4ODBd
IFs8ZmZmZmZmZmY4MGM0M2VhMj5dIGRvX3RyYXBfZWNhbGxfdSsweDYwLzB4MWQ0Cj4gWyAgNDM1
LjcyMTIzNl0gWzxmZmZmZmZmZjgwYzRmNzRjPl0gcmV0X2Zyb21fZXhjZXB0aW9uKzB4MC8weDY0
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBSeW8gVGFrYWt1cmEgPHRha2FrdXJhQHZhbGludXguY28uanA+
CgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
