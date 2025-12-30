Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3FFE94121
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 14:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LX3/V46fWdtJ6Lnpv1NF7H8g06UBB08cf9G1mgRaR9c=; b=f5UtIz9iBzJLvx
	BST95maJ4WAy9PAIbviFUc7Ooxxbd9fQu4gU7p1Cb2tD4E0Et0YRDcmrPeXex9C56SNJrAxiy3NTd
	BZPHIyMjzHxreXjUfin89ojxdHqd7ijx4UNCGTuuRcQ61DB8NYQLUfJKMO7u+u1R+ihO0ItHSl5AC
	llr+Zya1RFdyRzbqWgJmI7W6+6YF+Thx9gBtA3aLS3MX97/SScOpmT45Z12HcNXJ1PKt/zSbcqE+8
	1PAD8Th/gabSBAKAkdUh+c9+WTJ7lECFwf46o4M8ZG8z30Q4Ok7+KS9E09sK7Lbt8YcUG0eYEA3aE
	NwourJ590C/gFDoBIUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaSI-00000004v3x-3Pxe;
	Tue, 30 Dec 2025 14:12:10 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaaSE-00000004v29-0xYs
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 14:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767103880;
	bh=HGcM/4CGiCg5j1GuuOjB4A3W1LbzH42pGnBqQOzGYas=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ShnyEpODwop694fgDxtILKWs4zmbdLHuNzk+x/a5i4ol3owp9kuA01xMir6Q+w6yp
	 Qtsmn6A9eJDVgmcrTjm3zncMCtEnosCXXzLwETPPT6xEHTsKLtMBE7ZcBFywU4QRbp
	 R3j0fmzzKBS1h/19AB81B+O5Rb04uNa6MKhkhqUA=
X-QQ-mid: zesmtpip4t1767103878t2e71f83a
X-QQ-Originating-IP: aRra+fta2Rh/1Rh/TuAarSVo2Eo0tTTTZHbS8NjGWpY=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 Dec 2025 22:11:16 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12681321409791623687
EX-QQ-RecipientCnt: 19
Date: Tue, 30 Dec 2025 22:11:16 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Guodong Xu <guodong@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] i2c: k1: add reset support
Message-ID: <541066FE3973E490+aVPdhNKK70qltaVV@troy-wujie14pro-arch>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-2-ad201a602e74@gmail.com>
 <2dmrli7yzznpurg74wet4oidhljjf3csdjly2dwpyvyndhrec3@uc6ke7mep6fv>
 <CAH1PCMbGbe6MQtAucf-4W+H_G0LrvPNGyaB_OUyxqf5TF=jixg@mail.gmail.com>
 <zjrd3dgvcg3pxmn4455iljtugbufr4igyokdycusyhpykbzyl5@nrwgz366wm67>
 <CAH1PCMY9A3CO1PXo-b5_BGY13xdx3nvAqb-R28hUz1VMLzTHWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMY9A3CO1PXo-b5_BGY13xdx3nvAqb-R28hUz1VMLzTHWQ@mail.gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NUTz4BkILuKLfPgngVy2VbSwqKFERblinWpytd78pVsafI+Y7EQFZAVv
	IKnumd+i4592ZOf8feHQuLzd+dmKjyO1UxGtvg69KkbufDgZkOSj1WnKLykMZ0PA75lE7OH
	nN2ZsyjqQxgduF17crVSHfqnt76Zbi5dUTHdUHk0Dk/RD8ntGlsa2zC4C6//fa5yMvzkGxU
	+P9HI0o83Vpb6/DMzVcVUjl1jLXqMY5c2wVfahjZZHt4KUCx73Wkj14V9SMvArzdL7dEX9k
	3QBiQqL/cJeT9Ocr6pKbKVr2B4VGzW0v6YjKLaBONQr8dTLLXoPnfLMgTm1AQaRTCXP0YEm
	0VfbuTmKAk1WwNdrS7AgmH+5gWWUk0VRNmEXeRuEW+5l+qp1uKwOIXeVRICMVfMGM2xUJYA
	3bbuP9lmHUtw1yswDtsNk1SfLv8GWzQk2SOOVVyP4rzQgNsojQxjVaIYUFw0Yatuzmv6sf9
	oDWIp9iHB9a6ha9hliHyNN7zXEzKM3WApDkTVCwQqIEkTmvOKjThysUNv6ckY5vZB7VBhNL
	BXYP7QD2pBQ/1SVcUnyp+O5HApl7gwOqNomLtS7UGNAHJUIzu3hd/ajchoRVoc/IUq5zqDm
	d33cuK8ahMIuynaQ48S6ZY/8OHlJvMPj8lAIAUhN/kMNVez6cBIYqIz78e7saFoA49Wenv9
	Uw0/R+Yre34DLvW/hzewT9vqYqm2p3wzWmlf+q5SiTnAzmdOX3ZEFjYS8vpK7CLUJncoJX5
	T6xY2oWJ6kPd6dFf+VNfI3X6GZmM8LTYC9tuh1hwR+YWQCHqXUZWPsgx1t33strwymPZiCy
	7mZN9ITu07hqAGOG+ejQu8tN8vQQLdm5fVWHwMRQNgMH4BBoVqXfq1n/hwu+00dL3SzLm9W
	5ETg1GcnLtbmqmukSE8i7msN4izjztvUe3hHnKKBI2yLYe3dI12AoH128ASS5+FZhahMw4o
	GA+pgSHOblbg1W+8oA8I2mljIwVveA0CwA8Sq638nBbZWV0AZcSNV+mYDc7p0w5GLeGW4p9
	ThWI5h9xKgVcWR6i598G7P4q4cm0klmLC3F+3VoUFog7aPQF+IIDbk4/r03vZTzQrjocs1j
	Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_061208_301204_1983B8C8 
X-CRM114-Status: GOOD (  22.64  )
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

T24gU3VuLCBEZWMgMjgsIDIwMjUgYXQgMDg6NDI6NDdBTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBIaSwgQW5kaQo+IAo+IE9uIFN1biwgRGVjIDI4LCAyMDI1IGF0IDM6MjbigK9BTSBBbmRp
IFNoeXRpIDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIEd1b2Rvbmcs
Cj4gPgo+ID4gT24gRnJpLCBEZWMgMjYsIDIwMjUgYXQgMDc6Mzg6MjJBTSArMDgwMCwgR3VvZG9u
ZyBYdSB3cm90ZToKPiA+ID4gT24gRnJpLCBEZWMgMjYsIDIwMjUgYXQgNTowMeKAr0FNIEFuZGkg
U2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4gPiArICAgICByc3Qg
PSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZV9kZWFzc2VydGVkKGRl
diwgTlVMTCk7Cj4gPiA+ID4gPiArICAgICBpZiAoSVNfRVJSKHJzdCkpCj4gPiA+ID4gPiArICAg
ICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihyc3QpLAo+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIGFjcXVpcmUg
ZGVhc3NlcnRlZCByZXNldFxuIik7Cj4gPiA+ID4KPiA+ID4gPiBJZiB0aGlzIGlzIG9wdGlvbmFs
LCB3aHkgYXJlIHdlIHJldHVybmluZyB3aXRoIGVycm9yPwo+ID4gPiA+Cj4gPiA+Cj4gPiA+IEFj
Y29yZGluZyB0byBpbmNsdWRlL2xpbnV4L3Jlc2V0LmgsIGlmIHRoZSByZXF1ZXN0ZWQgcmVzZXQg
aXMgbm90Cj4gPiA+IHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRyZWUsIHRoaXMgZnVuY3Rpb24g
cmV0dXJucyBOVUxMIGluc3RlYWQgb2YKPiA+ID4gYW4gZXJyb3IuIFRoZXJlZm9yZSwgSVNfRVJS
KHJzdCkgd2lsbCBvbmx5IGJlIHRydWUgZm9yIGFjdHVhbAo+ID4gPiBlcnJvcnMgKGUuZyBwcm9i
ZSBkZWZlcnJhbCkuCj4gPgo+ID4gQW5kIHRoaXMgaXMgcXVpdGUgb2J2aW91cywgYnV0IHlvdSBo
YXZlbid0IGFuc3dlcmVkIG15IHFlc3Rpb24uCj4gPgo+ID4gV2h5IGRvIHdlIGNhcmUgb2YgaW50
ZXJuYWwgZmFpbHVyZXMgaW4gcmVzZXQ/IElmIHJlc2V0IGZhaWxzIG9uCj4gPiBhbiBvcHRpb25h
bCByZXNldCBjb250cm9sIGZ1bmN0aW9uIHdoeSBzaG91bGQgd2Uga2lsbCBvdXIgZHJpdmVyPwo+
IAo+IFRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIEkgc2VlIHlvdXIgcG9pbnQgbm93Lgo+
IAo+IE15IHJlYXNvbmluZyBpcyB0aGF0IGlmIHRoZSByZXNldHMgcHJvcGVydHkgaXMgZXhwbGlj
aXRseSBsaXN0ZWQgaW4gdGhlCj4gRGV2aWNlIFRyZWUsIHRoZSBkcml2ZXIgbXVzdCByZXNwZWN0
IGl0LgpJdCdzIG5vdCByZXF1aXJlZC4KCj4KPiBJZiB0aGUgcHJvcGVydHkgaXMgcHJlc2VudCBi
dXQKPiB3ZSBlbmNvdW50ZXIgYW4gZXJyb3IgKGxpa2UgLUVQUk9CRV9ERUZFUiksIGlnbm9yaW5n
IHRoYXQgZmFpbHVyZSBjb3VsZAo+IHB1dCB0aGUgaGFyZHdhcmUgaW4gYW4gdW5kZWZpbmVkIG9y
IGRpcnR5IHN0YXRlLgpUaGVuIHdoeSBpdCdzIG9wdGlvbmFsPwoKVGhlIHJlYWwgcmVhc29uOgoi
T3B0aW9uYWwiIGhlcmUgbWVhbnMgdGhlIHJlc2V0IGxpbmUgaXMgYWxsb3dlZCB0byBiZSBhYnNl
bnQgZnJvbSB0aGUKRGV2aWNlIFRyZWUuIEl0IGRvZXMgbm90IG1lYW4gd2UgY2FuIGlnbm9yZSB0
aGUgZmFpbHVyZSB3aGVuIGl0IGlzCmRlZmluZWQgaW4gdGhlIERUIGJ1dCBmYWlscyB0byBiZSBh
Y3F1aXJlZC4KCklmIGRldm1fcmVzZXRfY29udHJvbF9nZXRfb3B0aW9uYWxfKiByZXR1cm5zIGFu
IGVycm9yIChlLmcuLAotRVBST0JFX0RFRkVSKSwgaXQgaW5kaWNhdGVzIHRoZSBoYXJkd2FyZSBk
ZXNjcmlwdGlvbiBleHBlY3RzIGEgcmVzZXQKY29udHJvbCwgYnV0IHRoZSBzeXN0ZW0gaXMgbm90
IHlldCByZWFkeSB0byBwcm92aWRlIGl0LiBJZ25vcmluZyB0aGlzCmVycm9yIHdvdWxkIGJyZWFr
IHRoZSBwcm9iZSBkZWZlcnJhbCBtZWNoYW5pc20gYW5kIHBvdGVudGlhbGx5IGNhdXNlIHRoZQpk
cml2ZXIgdG8gYWNjZXNzIGhhcmR3YXJlIGluIGFuIGludmFsaWQgc3RhdGUuCgogICAgICAgICAg
ICAgICAgICAgICAgICAgIC0gVHJveQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
