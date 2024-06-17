Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA39C27C53
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 02:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4EKPJeT9DPaEHXf67evf2WcpQlbKY9AEvsnGnFNPFI=; b=BwWIooZ856l9sk
	VQ5bOiEJ4lZW3yMflsY7TIJ0zc4wlQsaZIZaONNXqTGQYUvBhxZAHV2wojizIXOBWYcvxl2U6PCYv
	7j4/PNxZn1njrgc+kpP8lkOe++voC92w2PYzzfZMTOBuAwVimFoJTnsmty0RAWCGZzbyTjrCNNkrg
	h6YSSpZZI8ts2ZgbHQOl1sftgRnHkjccv7zqfuGomOoxeSHvWO8ILHXNw52+N5JBk8BvCMmntQKKn
	BDU8I+PQiUxzptspvPrYm2tbrcTnESgJRcfUnOv6UdVhAfPQNsvcVitHbXRLvOXnMCq2kk0HPKwPX
	UwGOD0O/CiqvMqbA98cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1gC-00000008mvG-3Ev4;
	Mon, 17 Jun 2024 02:01:08 +0000
Received: from out203-205-251-72.mail.qq.com ([203.205.251.72])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1g6-00000008mrL-1pZr
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 02:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718589647; bh=dmN8w5lvDABL/jRmeeyfuJVRMrvYcjC38E/Re9ZnOA0=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=HLH4wQDUDrmaZV+RlUwByqgqN6frxhjCKmEgFfhT7NTHpgdwqXUngDnOgfcJPp00o
	 FXQ3Z39aS+3WVAMNV7rMtvQiBgXxdi2mAr1jYVZM+2g6Oo5QKLUcwpqIBjDHzfZsRn
	 LBrJAnU2+d6SnO//2QNqM9WMZCA8TN5CePcjCWdg=
Received: from smtpclient.apple ([2409:8929:843:88d1:dc81:b668:28ec:a360])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 2B1D8F3; Mon, 17 Jun 2024 10:00:43 +0800
X-QQ-mid: xmsmtpt1718589643tpc4joxcu
Message-ID: <tencent_2ABAC5E885F8354EF1F9084A6B5B398EE00A@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25Gg9vSwwFthgrvTbwpz3NxSuSAGiSJ0OsHx1aEr6wSqGtvRecWDU
	 96gAAjThu0UmEyWsk89edyCwqWJ/4OuSmvSDIQNZ7NXeJHSqelrTi4Cf0iPIB2EF1ic4mjqGdvyh
	 Kj/i2ugDtcScxhgVY9+8WCpMsGOH83aqjXbtdw2nqIfJQqPR5ob+dzhk1ubQr9hmhadjSFFF05Wg
	 q2mtwSiHxung2k4oYGP0iyZYOD5mv6J/qPNRMLXD298cig/c1H4LGWBTLgvBdWz2EmphmQOkMgnX
	 bAzvR99/kz7ORtPKTZ4N8vyjRZdDDSHsci2s1UyuX7DgD4cNNV3PdYs+KqclMS7Aysm2ilz/ZO3n
	 cGq7Nxq2s67YfBcs8I5vXYT2O4foKJZhMKF9NQ8+CPx3V5a+WWvyyWPlaP+0JkLnYbWvhhg0pZBQ
	 iSP0b3QKkGAS06K14joB9xfuZc55O+izvCdzR9pVduxPfkHHlTHZK7Dxi0b1bkBK85RP0wSgnH2Q
	 iJGlskwBfGs+wyoGLSqhtjjH8RXkwfOCwcxZ53R9wsNnbb0/yp16K834PiMt4D2a+tTJaU9Xg5jE
	 bb7kRe8ePuyLPdMPwWipS5MA1lSmFkZ81iaHRgpFV5zz9GFMAXJ2UZSeGqkrS6Q24Y657Bt7jmAg
	 N51Sa/KS1PMu1hfkO0TN3PM5dmdn8PPUjmdo9RoFTUVvnHi8jqw+liyO0wkoNum08SftpViIeO03
	 +IqRjByS7S0q4kU9jnJ/4bbCrxYUeqYsMYF7p08zxCWIOrBC1hybPTGtlk4hv1SxzweMGZPvA7/4
	 9yy61W5vVKcVi23wJ2p+txavTBl2GY2jJsmhdwbRF3mh4ISjwQDnBRrHyDhKpgWw4Vj1xq8MxjLf
	 jhK77dAShBadVwola43ibQfafTW7fOYZ4KoCzZ7OdoEIVM1yfpbRfaOc70RXYkuZCitGXyMzEV96
	 piNn5kbPN01ZwOAbOWG1crsUvCm8zqU4/WYr3AJ0AsHIN1/a/JiS+FmUSWFKOGYi9xQOv4Xa8Mms
	 HQ3Q1/IqQ4XOYbmUTrdfxGwF4wPA0=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240616224811.GC3983622@ofsar>
Date: Mon, 17 Jun 2024 10:00:32 +0800
Cc: Yixun Lan <dlan@gentoo.org>,
 linux-riscv@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Anup Patel <anup.patel@wdc.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jesse Taube <jesse@rivosinc.com>
X-OQ-MSGID: <B3951194-7F51-4D44-A643-FB29533119E4@cyyself.name>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <20240616-exorcism-computing-e11e26084a62@spud>
 <20240616224811.GC3983622@ofsar>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_190102_960905_E23D05DB 
X-CRM114-Status: GOOD (  18.47  )
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

Cj4gT24gSnVuIDE3LCAyMDI0LCBhdCAwNjo0OCwgWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+
IHdyb3RlOgo+IAo+IEhpIENvbm9yCj4gVGhhbmtzIGZvciBicmluZ2luZyB0aGlzIHVwCj4gCj4g
T24gMTk6MzUgU3VuIDE2IEp1biAgICAgLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+IE9uIE1vbiwg
SnVuIDE3LCAyMDI0IGF0IDAxOjE4OjUyQU0gKzA4MDAsIFlhbmd5dSBDaGVuIHdyb3RlOgo+PiAK
Pj4gTm8gTUFJTlRBSU5FUlMgdXBkYXRlLCBzbyBJIGZpZ3VyZSB0aGF0IG1lYW5zIHlvdSBkb24n
dCB3YW50IHRvIG1haW50YWluCj4+IGl0IGdvaW5nIGZvcndhcmRzPyBJZiB0aGVyZSdzIHNvbWVv
bmUgb3V0IHRoYXQgdGhhdCBkb2VzIGNhcmUgYWJvdXQgdGhlCj4+IHNwYWNlbWl0IGsxIChKZXNz
ZSBtYXliZT8pLCB0aGVuIEknZCBiZSBtb3JlIHRoYW4gaGFwcHkgdG8gaGF2ZSB0aGVtCj4+IGxv
b2sgYWZ0ZXIgaXQuCgpBY3R1YWxseSwgSSBkb27igJl0IGtub3cgaG93IHRvIGJlIGEgbWFpbnRh
aW5lci4gU2hvdWxkIEkgaGF2ZSB0bwpwcm92aWRlIGEgbmV3IGdpdCB0cmVlIGFuZCBhbGwgdGhl
IG5ldyBwYXRjaGVzIG1lcmdlZCB0byBteSB0cmVlCmFuZCB0aGVuIHN1Ym1pdCBhIGdpdCBwdWxs
PyBPciByZXVzZSB0aGUgUklTQy1WIG1haWxpbmcgbGlzdCBhbmQKanVzdCBnaXZlIGEgcmV2aWV3
LCBhbmQgdGhlIHBhdGNoZXMgY29tZSB0byBzb2MgbWlzYyB0cmVlPyBJIHdvdWxkCmxpa2UgdGhl
IGxhdHRlciBvbmUuCgo+IFlhbmd5dSBraW5kIG9mIGhhcyBsaW1pdGVkIHRpbWUsIHRvbyBtYW55
IHN0dWZmIGZvciBoaW0uLgo+IAoKVHJ1ZS4gTWF5YmUgSSBjYW4gaGF2ZSBhIHJldmlldyBhbmQg
dGVzdCB0aGUgcGF0Y2ggaW4gb25lIHdlZWsuCkhvd2V2ZXIsIHByb3ZpZGluZyBhIHJldmlldyBh
bmQgdGVzdCBpbiAyLTMgZGF5cyBpcyBzb21ldGltZXMgaGFyZApmb3IgbWUuCgo+IEknZCB2b2x1
bnRlZXJlZCB0byBoZWxwIG9uIHRoaXMgaWYgaXQgY2FuIGZpbGwgdGhlIGdhcAo+IEFsc28gSSdk
IGJlIG1vcmUgdGhhbiBoYXBweSBpZiBhbnlvbmUgd2lsbGluZyBzdGVwIGZvcndhcmQgdG8gY28t
bWFpbnRhaW4uLgo+IAoKVGhhbmtzLiBSZWFsbHkgYXBwcmVjaWF0ZSBpdC4KClNob3VsZCBJIHBy
b3ZpZGUgYSBkaWZmIGxpa2UgdGhpczoKCmRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5U
QUlORVJTCmluZGV4IGQ2YzkwMTYxYzdiZi4uNzE4ZDMwOTk2ZjEyIDEwMDY0NAotLS0gYS9NQUlO
VEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTkzMDYsNiArMTkzMDYsNyBAQCBGOiAgICAg
IGFyY2gvcmlzY3YvYm9vdC9kdHMvCiBYOiAgICAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5u
ZXIvCiBYOiAgICAgYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzLwogWDogICAgIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvLworWDogICAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
CiAKIFJJU0MtViBQTVUgRFJJVkVSUwogTTogICAgIEF0aXNoIFBhdHJhIDxhdGlzaHBAYXRpc2hw
YXRyYS5vcmc+CkBAIC0yMTAwNCw2ICsyMTAwNSwxMyBAQCBXOiAgICAgaHR0cHM6Ly9saW51eHR2
Lm9yZwogUTogICAgIGh0dHA6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJvamVjdC9saW51eC1t
ZWRpYS9saXN0LwogRjogICAgIGRyaXZlcnMvbWVkaWEvZHZiLWZyb250ZW5kcy9zcDIqCiAKK1NQ
QUNFTUlUIERFVklDRVRSRUVTIGFuZCBEUklWRVJTCitNOiAgICAgWWFuZ3l1IENoZW4gPGN5eUBj
eXlzZWxmLm5hbWU+CitNOiAgICAgWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+CitTOiAgICAg
TWFpbnRhaW5lZAorRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9zcGFjZW1pdC55YW1sCitGOiAgICAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC8KKwog
U1BBTklTSCBET0NVTUVOVEFUSU9OCiBNOiAgICAgQ2FybG9zIEJpbGJhbyA8Y2FybG9zLmJpbGJh
by5vc2RldkBnbWFpbC5jb20+CiBSOiAgICAgQXZhZGh1dCBOYWlrIDxhdmFkaHV0Lm5haWtAYW1k
LmNvbT4KClRoYW5rcywKWWFuZ3l1IENoZW4KCj4gLS0gCj4gWWl4dW4gTGFuIChkbGFuKQo+IEdl
bnRvbyBMaW51eCBEZXZlbG9wZXIKPiBHUEcgS2V5IElEIEFBQkVGRDU1CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
