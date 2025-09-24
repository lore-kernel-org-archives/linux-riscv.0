Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AD2CAC5A5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 03:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPFCBlTHCzyp8N2NTLZd0VFUhB5CeIq5R0QvBpMOKso=; b=ilNVODqUUqWEC6
	QOHxF/wdTYJPm7n6iD4DmqY2aUY3k06IMSZ7b0JnAyfOrs6scRn3pcWBuvi8xYdYIbMMJupzG+5si
	Q0+xFvzfd52P9PUqTqZbFgj29jEQD0rIk5dhcNFCAdNHN2vFEbwR0Q7FaGk4K2ykvODD/p5ahjfpY
	qFDMRN7okSRkJ6Tp7MENpatvjjRJL6RIEvuMl81/PfeVmGcJscfxrhFnuyl4g7V3lPw/ESn17CWjy
	/7g9pKJemvDhm2pn4LUo7OYywGOty1n8FDDPHmWkccDLsr4SFgib14onYa+ZPJ7BFiOPt5PGrOSK2
	ZGRAHCSaS+/QNoBLzxRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1FwZ-0000000FPow-1vdn;
	Wed, 24 Sep 2025 03:13:23 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1FwW-0000000FPlF-1Z0i
	for linux-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 03:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758683532;
	bh=wyZnq1brHXp0eEo0IcKGDfiavTz/KfAQPMcIkigjxZU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=sUSe0sY+pI6tHi+1qeaGwbeFbSiRUYKvR+yXdPjZCvYlK3F7MluUyHOXkq+GzbMfd
	 CtLAOFOpdWDnfV7WHDKp02qvmaaaFRvpUSBVZqawjhJrr+Uln9xG6hJDfrranGYcUc
	 EeIPavXcrpVVzxwGHOeO11Ihr6E9MAs9e4feRPcs=
X-QQ-mid: zesmtpip2t1758683524t33056b91
X-QQ-Originating-IP: bWui7aEgfFXT5ttQPtbdeAfhB/8ClfNTxNloyvrmXlY=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 24 Sep 2025 11:11:59 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12855521764817172808
EX-QQ-RecipientCnt: 19
Date: Wed, 24 Sep 2025 11:11:56 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ziyao@disroot.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: spacemit: define a SPI controller node
Message-ID: <BA5C7E3F6EED54EF+aNNhfO5CHCLVbpBR@troy-wujie14pro-arch>
References: <20250922161717.1590690-1-elder@riscstar.com>
 <20250922161717.1590690-4-elder@riscstar.com>
 <20250923001930-GYB1303776@gentoo.org>
 <ED4C67FD136DEB19+aNINJJVYbNnT87va@LT-Guozexi>
 <a9054501-03ce-4db2-a753-81741c6237b6@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9054501-03ce-4db2-a753-81741c6237b6@pigmoral.tech>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NgI28YG7ifEWR4Y+9v5mo6Oc9Dnv8GtuEPs6uLc1wHynWOiPUnZmrbQb
	7aZbJv35hPY1cBGXcL+GLcfPtPgsrkoneVf9FMk4zRZNSSP05NVSX6H2Quv9od31feJ8Rbw
	lrrQ6oVDKfRKvUrn5Hs5OvsvBq7x5P4eTVMsilE3xUuJfFAKq3X2miT9AQkvy3FvOLWOuLH
	DzOOQWfhxK7Dwr7n55an9qrCvGHa1pMwBl9EFUAqNVjSPE2iUu4GldhPcIgsUgq0bZAif3/
	XTDe5Wc1uIfqbx0tTcWj8FDx/xpXbX3MKMozmZdWMMiqFQiHlqj0gaVZ5wPE6WmoFnxezzs
	1q5rb46HSdp7GshLXBioH/mWZdyjjneBDWbqlxTL8c4ayylTd0m4UkG3K5nnYZPGKWjj3Sf
	H/ZgwMG11hnl52nfaL6drfQy/Mb7xWQ45Etdfit59yP8s/yEsTzNFcwqWdttypNeRpH7vae
	WqV12MCsmG2+WcyeVhXekLNNEDjMr9M0ZwJhtALKSzeMRj2jcIeLHH9HGvluk/i1sGR+Pof
	EanGDVwLJJnRhesTaH6Na0ZxBcGgfHfs5SD0nu92kBHoZLi08gyBfPOG3eyL/d+ENQdd1zO
	d5dDiZ+SwBx1Q7fc/BNUiwxfOCU/i6F7Uota5iC/1O+GCjAv/4aF+PUerC8jcXDpY70UquB
	VhB2vEZYq9QjdtJwGb7aAI7WxHlopzgCtZxLXNmuG4zwWri/oZ84A6ybuvCCFS5mhOOpP+P
	BQHthLzrpG36EFCdupXlLYmG7HR9KtN/zwebXoYe3XlXh7Dyu586kxrrxVkQp5LnoHWIj1Y
	qX9TxRu67haEtW0zX74F6n134Lu9aljXMtTZ3sLLAzAEnknPHBTvOS4blvsnlIqe7R9N/lT
	ena/JV+StTfKvVz+9QlUmrPzkSeHGy3Xox0GORjrTXZTeMLNjrC791DlO07YuUn9Jl0GalU
	fRChRvwk6Lg7Pu7NCIhThvX/trW10I+6IqMtp+m4KXwrRHk4ThYbmHgAHrgasLvGIq1D/3n
	fzIbgoBVJ/3B1iozQ6I2AHWjTtSbTigrgb6S5j5emWn/tPr3hIXteqsWkvLGTmhVMV2WPSJ
	0JE3UmOfjvGwWDlfg8Up7mzgMrlQPXLxA==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_201321_118449_D3FDA337 
X-CRM114-Status: GOOD (  29.04  )
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

T24gVHVlLCBTZXAgMjMsIDIwMjUgYXQgMDI6MzE6MzFQTSArMDgwMCwgSnVuaHVpIExpdSB3cm90
ZToKPiBIaSBUcm95LAo+IAo+IE9uIDkvMjMvMjUgMTA6NTkgQU0sIFRyb3kgTWl0Y2hlbGwgd3Jv
dGU6Cj4gPiBPbiBUdWUsIFNlcCAyMywgMjAyNSBhdCAwODoxOTozMEFNICswODAwLCBZaXh1biBM
YW4gd3JvdGU6Cj4gPiA+IEhpIEFsZXgsCj4gPiA+IAo+ID4gPiBPbiAxMToxNyBNb24gMjIgU2Vw
ICAgICAsIEFsZXggRWxkZXIgd3JvdGU6Cj4gPiA+ID4gRGVmaW5lIGEgbm9kZSBmb3IgdGhlIGZv
dXJ0aCBTb0MgU1BJIGNvbnRyb2xsZXIgKG51bWJlciAzKSBvbgo+ID4gPiA+IHRoZSBTcGFjZW1p
VCBLMSBTb0MuCj4gPiA+ID4gCj4gPiA+ID4gRW5hYmxlIGl0IG9uIHRoZSBCYW5hbmEgUGkgQlBJ
LUYzIGJvYXJkLCB3aGljaCBleHBvc2VzIHRoaXMgZmVhdHVyZQo+ID4gPiA+IHZpYSBpdHMgR1BJ
TyBibG9jazoKPiA+ID4gPiAgICBHUElPIFBJTiAxOTogIE1PU0kKPiA+ID4gPiAgICBHUElPIFBJ
TiAyMTogIE1JU08KPiA+ID4gPiAgICBHUElPIFBJTiAyMzogIFNDTEsKPiA+ID4gPiAgICBHUElP
IFBJTiAyNDogIFNTIChpbnZlcnRlZCkKPiA+ID4gPiAKPiA+ID4gPiBEZWZpbmUgcGluY29udHJv
bCBjb25maWd1cmF0aW9ucyBmb3IgdGhlIHBpbnMgYXMgdXNlZCBvbiB0aGF0IGJvYXJkLgo+ID4g
PiA+IAo+ID4gPiA+IChUaGlzIHdhcyB0ZXN0ZWQgdXNpbmcgYSBHaWdhRGV2aWNlIEdEMjVRNjRF
IFNQSSBOT1IgY2hpcC4pCj4gPiA+ID4gCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQWxleCBFbGRl
ciA8ZWxkZXJAcmlzY3N0YXIuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+IHYzOiAtIE1vdmVkIHRo
ZSBTUEkgY29udHJvbGxlciBpbnRvIHRoZSBkbWEtYnVzIG1lbW9yeSByZWdpb24KPiA+ID4gPiAK
PiA+ID4gPiAgIC4uLi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMgICAgICB8
ICA3ICsrKysrKysKPiA+ID4gPiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGlu
Y3RybC5kdHNpICB8IDIwICsrKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazEuZHRzaSAgICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKwo+
ID4gPiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNlcnRpb25zKCspCj4gPiA+ID4gCj4gPiA+
ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGkt
ZjMuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMK
PiA+ID4gPiBpbmRleCAyYWFhZmY3NzgzMWUxLi5kOWQ4NjVmYmUzMjBlIDEwMDY0NAo+ID4gPiA+
IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4g
PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5k
dHMKPiA+ID4gPiBAQCAtMTQsNiArMTQsNyBAQCBhbGlhc2VzIHsKPiA+ID4gPiAgIAkJZXRoZXJu
ZXQwID0gJmV0aDA7Cj4gPiA+ID4gICAJCWV0aGVybmV0MSA9ICZldGgxOwo+ID4gPiA+ICAgCQlz
ZXJpYWwwID0gJnVhcnQwOwo+ID4gPiA+ICsJCXNwaTMgPSAmc3BpMzsKPiA+ID4gPiAgIAl9Owo+
ID4gPiA+ICAgCWNob3NlbiB7Cj4gPiA+ID4gQEAgLTkyLDYgKzkzLDEyIEBAICZwZG1hIHsKPiA+
ID4gPiAgIAlzdGF0dXMgPSAib2theSI7Cj4gPiA+ID4gICB9Owo+ID4gPiA+ICsmc3BpMyB7Cj4g
PiA+ID4gKwlwaW5jdHJsLTAgPSA8JnNzcDNfMF9jZmc+Owo+ID4gPiA+ICsJcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IjsKPiA+ID4gPiArCXN0YXR1cyA9ICJva2F5IjsKPiA+ID4gPiArfTsKPiA+
ID4gPiArCj4gPiA+ID4gICAmdWFydDAgewo+ID4gPiA+ICAgCXBpbmN0cmwtbmFtZXMgPSAiZGVm
YXVsdCI7Cj4gPiA+ID4gICAJcGluY3RybC0wID0gPCZ1YXJ0MF8yX2NmZz47Cj4gPiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpIGIv
YXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1waW5jdHJsLmR0c2kKPiA+ID4gPiBpbmRl
eCBhZmYxOWM4NmQ1ZmYzLi4yMDVjMjAxYTMwMDVjIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gv
cmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpCj4gPiA+ID4gKysrIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1waW5jdHJsLmR0c2kKPiA+ID4gPiBAQCAtNzYs
NCArNzYsMjQgQEAgcHdtMTQtMS1waW5zIHsKPiA+ID4gPiAgIAkJCWRyaXZlLXN0cmVuZ3RoID0g
PDMyPjsKPiA+ID4gPiAgIAkJfTsKPiA+ID4gPiAgIAl9Owo+ID4gPiA+ICsKPiA+ID4gPiArCXNz
cDNfMF9jZmc6IHNzcDMtMC1jZmcgewo+ID4gPiAuLgo+ID4gPiA+ICsJCXNzcDMtMC1uby1wdWxs
LXBpbnMgewo+ID4gPiBJJ2QgcHJlZmVyIG5vdCB0byBlbmZvcmNlICJwdWxsIiBpbmZvIGluc2lk
ZSB0aGUgbmFtZSwgeW91IGNhbid0IGVtYmVkCj4gPiA+IGFsbCBwcm9wZXJ0eSBpbmZvLCBiZXNp
ZGVzLCB3aGF0J3MgaWYgeW91IHdhbnQgdG8gY2hhbmdlL292ZXJyaWRlIGxhdGVyPwo+ID4gPiAK
PiA+ID4gaG93IGFib3V0IGp1c3QgbmFtZSBpdCBhcyBzc3AzLTAtZGVmYXVsLXBpbnMgb3Igc2lt
cGx5IHNzcDMtMC1waW5zPwo+ID4gdWFydDogdWFydDBfMl9jZmcgYW5kIGZ1bmN0aW9uIGlzIDIu
Cj4gPiBwd206IHB3bTE0XzFfY2ZnIGFuZCBmdW5jdGlvbiBpcyA0Cj4gPiBzcGk6IHNzcDNfMF9j
ZmcgYW5kIGZ1bmN0aW9uIGlzIDIKPiA+IAo+ID4gSeKAmW0gYSBiaXQgY29uZnVzZWQgYWJvdXQg
dGhlIG1lYW5pbmcgb2YgdGhlIHNlY29uZCBudW1iZXIgaGVyZS4KPiA+IElzIGl0IGludGVuZGVk
IHRvIGJlIGFuIGluZGV4LCBvciB0aGUgZnVuY3Rpb24gbnVtYmVyPwo+ID4gCj4gPiBJZiBpdOKA
mXMgYW4gaW5kZXgsIHNob3VsZCBpdCBzdGFydCBmcm9tIDAgb3IgMT8KPiA+IFRoZSBzdGFydGlu
ZyBwb2ludCBzZWVtcyBpbmNvbnNpc3RlbnQgYWNyb3NzIHB3bS9zcGkvdWFydC4KPiA+IElmIGl0
4oCZcyBzdXBwb3NlZCB0byBiZSB0aGUgZnVuY3Rpb24gbnVtYmVyLAo+ID4gdGhlbiB0aGUgc3Bp
IGFuZCBwd20gcGFydHMgbG9vayBpbmNvcnJlY3QuCj4gPiAKPiA+IENvdWxkIHlvdSBjbGFyaWZ5
IHRoaXM/IFlpeHVuLgo+IAo+IEkgdGhpbmsgdGhlIHNlY29uZCBudW1iZXIgcmVwcmVzZW50cyB0
aGUgaW5kZXggb2YgdGhlIHBpbiBncm91cCBhdmFpbGFibGUKPiBmb3IgdGhpcyBkZXZpY2UuCj4g
Cj4gVGFrZSBwd20xNCBhcyBhbiBleGFtcGxlOiBhY2NvcmRpbmcgdG8gdGhlIG1hbnVhbCwgdGhl
IGZpcnN0IHBpbiBncm91cAo+IChpbmRleCAwKSBhdmFpbGFibGUgZm9yIHB3bTE0IGlzIEdQSU82
IHdpdGggZnVuY3Rpb24gMywgd2hpbGUgdGhlIHNlY29uZAo+IGdyb3VwIChpbmRleCAxKSBpcyBH
UElPNDQgd2l0aCBmdW5jdGlvbiA0LgpUaGFua3MuIEp1bmh1aS4Kd2l0aCB0aGUgaGludHMgZnJv
bSB5b3UgYW5kIEFsZXgsIGl04oCZcyBub3cgbXVjaCBjbGVhcmVyIHRvIG1lLgoKICAgICAgICAg
ICAgICAgICAgICAtIFRyb3kKPiAKPiA+ICAgICAgICAgICAgICAgICAgLSBUcm95Cj4gCj4gLS0g
Cj4gQmVzdCByZWdhcmRzLAo+IEp1bmh1aSBMaXUKPiAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
