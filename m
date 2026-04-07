Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69049EDB7F0
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IrTOgwoKBfxF64DhkWokFNFmIYCfwd2ch78zaMyPBk=; b=OiBIWqmQA0kSG/
	0r/OahvOe/NjAMkwQPa5g+ZVZIRx62JD/mp8MKyrrVBYZfUEOJltzp6YYjEE/V+yxEq8fCONz/Lmn
	epFQkcTrS2RpuGPuMg4wAhMYj7JGVDQ6Uf1yDELiNbOFs/d20XPviYHMkX4p2kSMg+SOGcpibqkFd
	hhlb0ne0LLleM67aIrkygTEH9AReYKmvnBNTVb3YPfu7mimTu9EgIJZZpjkNWvbagJ3vLXPFjtyXI
	DxA1/IIwq5Tdwk/JfDITXX6POZeTdVj5T2pXI3jVd8Z1FP/UnAL8Syy1baHU60TZHheqDm3HIisjn
	BtLezo5s/jcP4unBxtaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3kR-00000006ITx-2JRr;
	Tue, 07 Apr 2026 10:33:31 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3kK-00000006ITE-1pYL
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 10:33:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775557940;
	bh=p5laVc/JzzUh8WALYWFDETKBdDg6PGDYWiZ91yMn3Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Wnbdg84INjidQlK/2ELCqicxvxU6Xb/xjFF34YOjmv8L8x9VKMhy0qu5mkGFFOR+a
	 9JxYykg/2UhAAuqZNQlYVhvWvBR/DCvibwwJ2AwtEOa+zktCO6sJ9tRQ1QX32752IU
	 pasrBJLGthWnhGtKel69x8NPbUtpy5w8JtL4RHSI=
X-QQ-mid: zesmtpgz4t1775557932tec77491a
X-QQ-Originating-IP: jGucKH2A7NSNNZCbmg5uxLphvaRvz7e5ZVUECwmRZqk=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 07 Apr 2026 18:32:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14828376588026486904
Message-ID: <62EC51B1F1EDFF8D+6534f38d-4efe-4280-a9f8-f734fecb761b@linux.spacemit.com>
Date: Tue, 7 Apr 2026 18:32:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] riscv: Introduce support for hardware
 break/watchpoints
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 shuah@kernel.org
References: <20260223044918.1359983-2-himanshu.chauhan@oss.qualcomm.com>
 <3D3CC7D372F7558A+6c0621bd-3021-40dd-88e3-697aa597dbd3@linux.spacemit.com>
 <CA+Ht8=bLxTz8_Cm2s=01CBNpmx4g6XhT6ZzTfJH9rPgDXPOUjQ@mail.gmail.com>
 <406D63D11CE43166+c3d29042-4097-4309-9117-3cdbce71ddb7@linux.spacemit.com>
 <CA+Ht8=bwQDR1rVp9AJxBnH8Qk_j_Ow9A2fAeYcvSh6pCkeA6ew@mail.gmail.com>
From: liangzhen <liangzhen@linux.spacemit.com>
In-Reply-To: <CA+Ht8=bwQDR1rVp9AJxBnH8Qk_j_Ow9A2fAeYcvSh6pCkeA6ew@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N7JaPSsNCN5wP2kQArILsafJr8xmjFByXiHaCHphr2lZilJEQ+/z1cwb
	DmKuaftfcOzb+TP87ncgod4RAxCHhvvBlHy4ElKqtG0XEVr5iBKRqQZwMWM63d7rRiIMxpK
	iDcdcKsjUyeLJkF+6DuV6oqWQHky7/3EPG1taJ2NB9EAYSLmdvviio+HpMqKxvox9Afgsow
	kcNqbvCtXEMaRyk0Cz1Nbw62kTPQHC5IY/R1EkKVZcU2TftFF6wtiEuZBGX+ozRz2RK2dcK
	6a28z6kfrN9N4ffSX3ezwvVzCt61sZyId9CWOTeGU/0ADXE2fnc5l/1cho+kg5bDEEwuJJj
	1aK97Ra6TL1OE395NCO4mCDV5JHo9hOZ5npiVjkn8sGXudoPnreDdnU/3ubs8Z6kMas/wAy
	woUS+ZRiooxC7Lpy2zC2gDEL+BMyUuOpWhKr4JAuDkyvWb5U5+xEmyP5UmZ9W1e6LZmIFHU
	PIebls004JcpZvEC4aWw7N4FiYlnXo7zo99u69900RXtTXR8JM7quQXKQuPOuahWDHIg6vN
	FWnORQgHPLFnQiiin0gZ57jQnvScW0vLGRJkZ4cgEeQKhGStQLNtp1Bc7GSJNSxRdeD4eEJ
	0ayvGzRBkEZxpkVrQpTrhgkr8bKHs0gWhjpyfxy+agcyOw6gjSY5YFA+5nzykvIZhT+Bg9H
	faEvdQEiu7Fd7cC1ciQqcyAnJz02HymK7DvwmvDB8/FoTtSUyc1xRv6E37kEqXJ29l5EGX8
	vFoTKImAiQxAY+RU/mUgTIsVjbP/iRjb9+FRIzAPA/FVtBxe5SyKFFwcBd5cClzfNpDQsio
	SlC5C1BcotPpiTRR9qVj2KZkgCkgHSwayo8oJZvU28GUfaXsQ/qNuNPzZKHdKCjUaB3Q/vF
	DtANKVoqhOe6ejErAfCdq0AQLAPGsxTm1d/TzRpFUS62si/eFTDVDtEhu9xKp1nV4ks2ibz
	NduFS5IPQaEfwBmRw57CERUlKvmNrrJXEtOzawRUokHyLxiFYk/JeZedKgiFqbz50DvZKz9
	rGQEBEy4Hbfs/U5CEHpw9BDND0XgbZpHsC4tbf283tBsHvbKuzftvcNLvmT34=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_033325_315110_D0C5A0DE 
X-CRM114-Status: UNSURE (   6.19  )
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

SGksCgpPbiA0LzcvMjAyNiAxMjo1MyBQTSwgSGltYW5zaHUgQ2hhdWhhbiB3cm90ZToKPiBOb3Rl
ZC4gSSB3aWxsIGJlIGZsb2F0aW5nIHRoZSBwdHJhY2Ugc3VwcG9ydCBpbW1lZGlhdGVseSBhZnRl
ciB0aGUKPiByZXZpc2VkIHZlcnNpb24gb2YgdGhpcyBzZXJpZXMuIEkgd291bGQgcmVxdWVzdCB5
b3UgdG8gdGVzdCB0aGUgcHRyYWNlCj4gd2l0aCB5b3VyIEdEQiBicmVha3BvaW50IHN1cHBvcnQu
IFBsZWFzZSBsZXQgbWUga25vdyB3aGVuIHlvdSBhcmUKPiBzZW5kaW5nIHBhdGNoIHNlcmllcyBm
b3IgR0RCLgpTdXJlLCBJIHdpbGwgZG8gdGhhdC7CoCBBbmQgdGhlIEdEQiBjaGFuZ2VzIGhhcyBh
bHNvIGJlZW4gcG9zdGVkOgotIGh0dHBzOi8vcGF0Y2h3b3JrLnNvdXJjZXdhcmUub3JnL3Byb2pl
Y3QvZ2RiL3BhdGNoLzIwMjYwNDA3MTAxMjE0LjI3NDQtMS16aHVhbmdxaXViaW5AbGludXguc3Bh
Y2VtaXQuY29tLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
