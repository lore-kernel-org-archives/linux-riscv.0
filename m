Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14ABF36B9F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 01:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLXE8nD+UD43IaiHgXK/wakrEV7+VeBqZFVnL7Ry3jg=; b=mOLApPM/agn0En
	TVFuo2zuHnwZFaONKRllAmVa0q/S1MUpfI78CNghJSyaEenz9xJPxjrwp3tLZn664kZs0Uf+hqwRw
	XhNlnfZY6+ppjXEAQnIGTHFMmwiCfROOr4UJ4z1NujeyPFkrH55D2SyhjgiZ24x+gR87vO74+ROGZ
	lnLsUkJCph/pUDl3Ws9uDZ+YNoJjH0FdBTMja/K4x2RovxizU/RnOO68aIy4qbYM0gB/4HXuN6TB6
	qiSS4xAnovJa3nFwP1yV2b1I8ab2sW6t8h9AdNRyyQAbnz53T6tT5vzcxoeFU0pDy1Gg7/MXvUPfA
	fWLIoAeM3MI2/BUJGoSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB11a-0000000BQVT-16ec;
	Fri, 10 Apr 2026 01:51:10 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB11X-0000000BQU3-1QiJ
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 01:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1775785761;
	bh=SZbYS0Qb7WvP36b6C+O8auN3UbA6aoly84MdaQv+5nc=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=aamjwK8b+k5BHXnqO4yWd5rPcqZqLLKR5p8OuhcerjfFUOIWE/xuyKVySI+vMpVv3
	 sa1F8kWSLpAo8ExncicVWrHVOw66tchmXkWnpOhK2ZnfvZ3gRPYcvHZ0V585a2RBjw
	 VzfJ/JXqsdinn+e/B8UYB7lw67nz8s/BQdkZfwEg=
X-QQ-mid: zesmtpgz9t1775785752t0ec45321
X-QQ-Originating-IP: jf/yfmslXbOw835KrUa4sX1NzoM1+TMW786OM3q7AQI=
Received: from = ( [183.48.247.238])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Apr 2026 09:49:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12731809444292626106
EX-QQ-RecipientCnt: 14
Mime-Version: 1.0
Date: Fri, 10 Apr 2026 09:49:10 +0800
Message-Id: <DHP3IFPL45T4.FI2WYSYGN8KX@linux.spacemit.com>
Cc: "Sebastian Reichel" <sebastian.reichel@collabora.com>,
 <linux-kernel@vger.kernel.org>, "Sebastian Reichel" <sre@kernel.org>,
 "Yixun Lan" <dlan@gentoo.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Aurelien Jarno" <aurelien@aurel32.net>,
 <linux-pm@vger.kernel.org>
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Lee Jones"
 <lee@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093347.GD8064@google.com>
 <E205F88FB1EE06C5+aQscI0Uy7pgiMzEt@kernel.org>
 <20251105100856.GG8064@google.com> <20251105101149.GH8064@google.com>
 <FA1DBD9E7CCB8027+aQtMvb5Br7MgMW4K@troy-wujie14pro-arch>
In-Reply-To: <FA1DBD9E7CCB8027+aQtMvb5Br7MgMW4K@troy-wujie14pro-arch>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M81xiSYYe+S8S3U2ozqDRTlSFEgI0/Rw8wJYqK7bQ+BSbAe3XAJK4hP5
	hxCCOos4VEUhdn7iGmhZG/EHUZAssS9ZeVJP5kBK+B/c0ZTGpU24rMVeBOj8x4qz38wmkzt
	OEcyA5zMuMhQIrd+9wNnJ4hdIrSIlp0aNjYWcypaBJDgEsMnuB6gJ48u2tW9iZSfj1ndn4j
	BSsfMkUOJDCwKtvNQpseYy+gAHThiXFJZK852AwZ4kKBA8O+R7yBI6gcRpTlhYMwJJ73aVe
	93q60inbMur4G+8Ip1+A0d8P4bNfR+gCrI906ICOkJa92MoXGldGHMyASaWuPPzPQIZpba6
	jmh6ibtgMfCNByrOc5T7SYAVx77B7cVCUuzN2a9Jm5Jhems9SZYgjBM3aUnD4l+zCNIi6HM
	lBqdKfqWj1fpR1pESil0IaahLGSailC9B/LkYHs/lEh8raxa82CeXBSNUq+OPa0nN7T0cC0
	cPi9k2NeUzjINiF2LCLqKYQIuaPgU4fXBqDLEwdtDY5i/X5v/d5cedeVPwFe9UpW0lP9Hv5
	Zw3X6f0Sj/s5l34d37Se3O1x1bw29sOX+WC33QqCw6QyplEqRVHUxZ0VTgJxjU6qZLVI4CE
	W4CZ8cnEYDKjLNpMhRGti/8bvBaaPNvNpymqlgmFgoWYw1w44ri6UaPT+749C1WbTzqcPNI
	ryEnobsNZ0Dy26nPFVz2ZCu3FowBy6QNAs8QtXwMEXLeqzIOctqdNnTm2aD5oVrcvHC+BTP
	X3jnM16oeMbOdp+kgRdGHzBigOM5HZHhJV1Ns2Ptj7dvIOF/ZpvOLyC78kfKBQymVrdpITF
	ooxB9wWjDAg8WFaW4zsA/CaDS32q+VvgaDbHk8m3DEEVLnGyqOsTVmgW01vUxFy12q9TQme
	U+SLrh8fV0QDkegnQCkZSxRl+onrKa9SpdAwjAre9yRwKOLuBh4dy6wssgcAdfWSXvfgqwu
	YsWjF+T9SFMs1Z8+Op2alEsvQWek+DqrnvnmOIQV4qX5cDiPS88KlraWoME+vhwutIilcf+
	uQ68bW8JAd7SyzHsioLHBqlEuo8DWJ5pUJr/nh7LKIszJZaE3r9W3Bac7mkBIYwzjgZhz73
	n1rFZ7ejmje
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_185107_843832_333424AE 
X-CRM114-Status: GOOD (  17.32  )
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

SGkgTGVlIGFuZCBBdXJlbGllbiwKCk9uIFdlZCBOb3YgNSwgMjAyNSBhdCA5OjEwIFBNIENTVCwg
VHJveSBNaXRjaGVsbCB3cm90ZToKPiBPbiBXZWQsIE5vdiAwNSwgMjAyNSBhdCAxMDoxMTo0OUFN
ICswMDAwLCBMZWUgSm9uZXMgd3JvdGU6Cj4+IE9uIFdlZCwgMDUgTm92IDIwMjUsIExlZSBKb25l
cyB3cm90ZToKPj4gCj4+ID4gT24gV2VkLCAwNSBOb3YgMjAyNSwgVHJveSBNaXRjaGVsbCB3cm90
ZToKPj4gPiAKPj4gPiA+IE9uIFdlZCwgTm92IDA1LCAyMDI1IGF0IDA5OjM0OjIxQU0gKzAwMDAs
IExlZSBKb25lcyB3cm90ZToKPj4gPiA+ID4gT24gVHVlLCAwNCBOb3YgMjAyNSwgVHJveSBNaXRj
aGVsbCB3cm90ZToKPj4gPiA+ID4gCj4+ID4gPiA+ID4gT24gTW9uLCBOb3YgMDMsIDIwMjUgYXQg
MDE6NDg6MzNBTSArMDEwMCwgU2ViYXN0aWFuIFJlaWNoZWwgd3JvdGU6Cj4+ID4gPiA+ID4gPiAK
Pj4gPiA+ID4gPiA+IE9uIE1vbiwgMDMgTm92IDIwMjUgMDA6MDE6NTggKzAxMDAsIEF1cmVsaWVu
IEphcm5vIHdyb3RlOgo+PiA+ID4gPiA+ID4gPiBUaGlzIGFkZHMgcG93ZXJvZmYvcmVib290IHN1
cHBvcnQgZm9yIHRoZSBTcGFjZW1pVCBQMSBQTUlDIGNoaXAsIHdoaWNoIGlzCj4+ID4gPiA+ID4g
PiA+IGNvbW1vbmx5IHBhaXJlZCB3aXRoIHRoZSBTcGFjZW1pVCBLMSBTb0MuCj4+ID4gPiA+ID4g
PiA+IAo+PiA+ID4gPiA+ID4gPiBOb3RlOiBGb3IgcmVsaWFibGUgb3BlcmF0aW9uLCB0aGlzIGRy
aXZlciBkZXBlbmRzIG9uIGEgdGhpcyBwYXRjaCB0aGF0IGFkZHMKPj4gPiA+ID4gPiA+ID4gYXRv
bWljIHRyYW5zZmVyIHN1cHBvcnQgdG8gdGhlIFNwYWNlbWlUIEkyQyBjb250cm9sbGVyIGRyaXZl
cjoKPj4gPiA+ID4gPiA+ID4gICBodHRwczovL2xvcmUua2VybmVsLm9yZy9zcGFjZW1pdC8yMDI1
MTAwOS1rMS1pMmMtYXRvbWljLXY0LTEtYTg5MzY3ODcwMjg2QGxpbnV4LnNwYWNlbWl0LmNvbS8K
Pj4gPiA+IF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eCj4+ID4gPiBkZXBlbmRlbmN5IGlzIGhlcmUuCj4+ID4gPiA+ID4gPiA+IAo+PiA+
ID4gPiA+ID4gPiBbLi4uXQo+PiA+ID4gPiA+ID4gCj4+ID4gPiA+ID4gPiBBcHBsaWVkLCB0aGFu
a3MhCj4+ID4gPiA+ID4gPiAKPj4gPiA+ID4gPiA+IFsxLzJdIGRyaXZlcjogcmVzZXQ6IHNwYWNl
bWl0LXAxOiBhZGQgZHJpdmVyIGZvciBwb3dlcm9mZi9yZWJvb3QKPj4gPiA+ID4gPiA+ICAgICAg
IGNvbW1pdDogMjgxMjRjYzBmYjhjN2RjMDFhNjgzNGQyMjczNTFlMjVkOWE5MmM1OAo+PiA+ID4g
PiA+IFNob3VsZCB3ZSBhcHBseSBpdCBub3c/IFRoZSBkZXBlbmRlbmN5IHBhdGNoIGhhc27igJl0
IGJlZW4gbWVyZ2VkIHlldC4uLgo+PiA+ID4gPiAKPj4gPiA+ID4gV2hhdCBpcyB0aGUgZGVwZW5k
ZW5jeT8KPj4gPiA+IEkgcG9pbnQgaXQgb3V0IGFib3ZlLgo+PiA+ID4gV2l0aG91dCB0aGlzIHBh
dGNoLCByZWJvb3QgYW5kIHNodXRkb3duIHdvdWxkIGVuZCB1cCBjYWxsaW5nIHRoZSBub24tYXRv
bWljIGkyY190cmFuc2Zlci4KPj4gPiAKPj4gPiBPa2F5LCB0aGFua3MuICBJIHdhcyBtb3N0bHkg
Y2hlY2tpbmcgdGhhdCB5b3Ugd2VyZW4ndCByZWZlcnJpbmcgdG8gdGhlCj4+ID4gTUZEIHBhdGNo
LCB3aGljaCBkb2Vzbid0IHJlcHJlc2VudCBhIHRydWUgZGVwZW5kZW5jeS4KPj4gCj4+IFRvIHNh
dmUgU2ViYXN0aWFuIHNvbWUgdHJvdWJsZSwgbGV0J3Mga2VlcCB0aGUgcmVib290IHBhdGNoIGFw
cGxpZWQuCj4+IAo+PiBJJ2xsIGhvbGQgb2ZmIG9uIHRoZSBNRkQgb25lLCB3aGljaCB3aWxsIGVu
c3VyZSB0aGF0IHJlYm9vdCBpc24ndCBwcm9iZWQuCj4+IAo+PiBMZXQgbWUga25vdyB3aGVuIHRo
ZSBkZXAgaXMgbWVyZ2VkIGFuZCBJJ2xsIGhvb3ZlciB1cCB0aGUgcmVzdCBvZiB0aGUgc2V0Lgo+
IE9rYXkuIEknbGwgcmVwbHkgdGhpcyB0aHJlYWQgd2hlbiB0aGUgZGVwZW5kZW5jeSBpcyBtZXJn
ZWQuClRocyBJMkMgUElPIHBhdGNoc2V0IGhhcyBiZWVuIG1lcmdlZCBoZXJlIFsxXS4KCkxpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hZGZWazgyT0MxYzNabjhhQHplbm9uZS56aG9y
YS5ldS8KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gVHJveQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
