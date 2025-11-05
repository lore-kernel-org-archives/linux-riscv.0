Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09716CCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHGjMOwljlVfP7LYVxurkuqbrH4rrwJj18iUTUJ4BeQ=; b=fLqTR7vInXaTbf
	0J/3zi98CLhmr6Frnds92licmm7XX+bxBPVefr1apqA/tACGdazB/6lPS8jbVZQU6pZjCtKUynZ1L
	eQGhoEsy1dHHwJVfccPbTRQ+6mB6Qp+oxTrAKMo3Y74k3dyqkT15torxyHABDZs7fQm033OywuzVg
	pWt/VJrDKDmRVf2X7cabTmW8ykWbm8Zk0VWUq8I+5R/6/tynggkXdNY+cKosg7m9k/FFU64xij37H
	MQJUNi6uTPeTcAkeS/AKeUYVm3hv2HwbKAjkENUgw9jR4emOLspP3TTipmrbn3Wnckc8poCOKkG+u
	bj4bw7D0OmFfqIOfWE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa1n-0000000DP9k-3bxH;
	Wed, 05 Nov 2025 09:42:07 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGa1j-0000000DP8s-0sLF
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 09:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762335633;
	bh=K9p96Az0vCcI2Emov1fVQ5bmu6QW46dlAQR5fZt//iA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=JBAN08fMlI3bxYQjn3FTsS8VmhNZUiut9ysNuwjRySCQ9dLWpbxCuatvkQA99vjCl
	 1xPAClUK8IZxUUlDMIOQazTU9OUjeIfeNg7gx2F9Enbsr8dNTHjMH1SPUCZsKb3syZ
	 HvujQ8lANNII9cIB5ccqUF36ULwie0SvVkgA4lTs=
X-QQ-mid: zesmtpgz6t1762335631t1e862f50
X-QQ-Originating-IP: T4f5BgaEKZsfrThhwXckLHTlcpww6njpPZICjjiO+ac=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 05 Nov 2025 17:40:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7969792345943648528
EX-QQ-RecipientCnt: 14
Date: Wed, 5 Nov 2025 17:40:29 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Aurelien Jarno <aurelien@aurel32.net>, linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-ID: <315F0431BCF1D233+aQsbjbI6J9OAHTaI@kernel.org>
References: <20251102230352.914421-1-aurelien@aurel32.net>
 <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
 <FA447DF1D2398A79+aQlVuEbrLMCiGMpc@kernel.org>
 <20251105093544.GE8064@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251105093544.GE8064@google.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OFoXdVIInG+RlH8sMcnV76zXTdDtJLHV/LYJD/55XZ0PbRdGgKmYDGvN
	eQsJRZu7TXkmBvsIbhJ2FKH95a7zSe9VdDENWJeqs2+eF/hb5VbF3FOjlX3xiQHkAqX3KHe
	MaS1/iIYSLbABbpHRKNe4btHTsagMTwjxM5yqq9X1T7orm5Ce45ZN5cV7nV9OLTTPKik6cs
	v4EtUpXQGazKderj8aM+coltd+HOhgAeyX/8Uu6TKBQF0Gttn9zhjX16YOjlqKXBUwFGnRd
	VHbASxK+CNUEjiVJHHQWCxKr6CQPt3ITg9m/X3m4j7Ty9+h0A04AWj9pAC4WGJcRkh7RFGF
	yUOc/6xPK8RYrQ2TgXOT825qevOM8NzvwNmjnJGx6UIS2ikPILIoecVlrJHAnHXVc1rnmLx
	9XAtk3WxRs0Kq6wILN+p+QdTn3qL9A4mXCh2s+K8yccWzlQ6bLAxzCHzXSSGTCb++DwFybC
	KILofX3BxyjGs9Po8FTuoXZjWX2XjEzexnRadX2sZiwzR962XYC3nVfYCIwYPujxOrFndi9
	HIJ/TX7q5zb/PtKSHOmsYsL+et2ih0hner3Q/kiDOVhq6gbXQB71yOF+qegj6/lm5SFuqsK
	lJ/17QILXbQbG3e6yMl0pcmiXtXt7RpJwmgLgepN1idz0qYa4YOLeqQGCK1pEYA+XuKRYgI
	x2jmD6COKnpHcILW/yh7rp+6sHzwARndaD4X2CxsrCjGmkuonGXBxlgXal/qgBZiGoW6uek
	VSeUPUwmaQcnpSzysLq2atlfPedPw6vFTQpkqQMnrNLuhGCGxQpl+CP4YV27cNgkv3zNP7B
	Ixcz3xfVjfDdpDh3HAVZea/n0KsccxPEWJ9uANH5fxvGmI/NPDIVg4IKMhM+5puNmaBvElY
	S9OMSSZOMtgv6/77zRu7bUXa4Km4Mnvr5R89n5K8hEtTCIHAhlkP+ImBkC104g4yT/+Lenz
	xkNHbjJ1tkP0gugUb9xbW20M7pbtQ1bn099yH25ISdLaGsOFwEkRu6yyXX1Wgz6pozLXQzx
	soSXWCD+BwB0Cye/dym43Nu11qrpBEMbAHpGkiGBlhk+XML6XyE7K9Xq673gXXFPUZ1aa6x
	iXakKw9iKT9jk4opHt+gZ+9BoLNa02npA1JPV7VXrlWNtqfr3761UTHr6F57yRaLggOSA/J
	pn+7xekj6BJiUxVi16ndTWBqtw==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_014204_099017_BB8443E9 
X-CRM114-Status: GOOD (  13.23  )
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

T24gV2VkLCBOb3YgMDUsIDIwMjUgYXQgMDk6MzU6NDRBTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFR1ZSwgMDQgTm92IDIwMjUsIFRyb3kgTWl0Y2hlbGwgd3JvdGU6Cj4gCj4gPiBPbiBN
b24sIE5vdiAwMywgMjAyNSBhdCAwMTo0ODozM0FNICswMTAwLCBTZWJhc3RpYW4gUmVpY2hlbCB3
cm90ZToKPiA+ID4gCj4gPiA+IE9uIE1vbiwgMDMgTm92IDIwMjUgMDA6MDE6NTggKzAxMDAsIEF1
cmVsaWVuIEphcm5vIHdyb3RlOgo+ID4gPiA+IFRoaXMgYWRkcyBwb3dlcm9mZi9yZWJvb3Qgc3Vw
cG9ydCBmb3IgdGhlIFNwYWNlbWlUIFAxIFBNSUMgY2hpcCwgd2hpY2ggaXMKPiA+ID4gPiBjb21t
b25seSBwYWlyZWQgd2l0aCB0aGUgU3BhY2VtaVQgSzEgU29DLgo+ID4gPiA+IAo+ID4gPiA+IE5v
dGU6IEZvciByZWxpYWJsZSBvcGVyYXRpb24sIHRoaXMgZHJpdmVyIGRlcGVuZHMgb24gYSB0aGlz
IHBhdGNoIHRoYXQgYWRkcwo+ID4gPiA+IGF0b21pYyB0cmFuc2ZlciBzdXBwb3J0IHRvIHRoZSBT
cGFjZW1pVCBJMkMgY29udHJvbGxlciBkcml2ZXI6Cj4gPiA+ID4gICBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9zcGFjZW1pdC8yMDI1MTAwOS1rMS1pMmMtYXRvbWljLXY0LTEtYTg5MzY3ODcwMjg2
QGxpbnV4LnNwYWNlbWl0LmNvbS8KPiA+ID4gPiAKPiA+ID4gPiBbLi4uXQo+ID4gPiAKPiA+ID4g
QXBwbGllZCwgdGhhbmtzIQo+ID4gPiAKPiA+ID4gWzEvMl0gZHJpdmVyOiByZXNldDogc3BhY2Vt
aXQtcDE6IGFkZCBkcml2ZXIgZm9yIHBvd2Vyb2ZmL3JlYm9vdAo+ID4gPiAgICAgICBjb21taXQ6
IDI4MTI0Y2MwZmI4YzdkYzAxYTY4MzRkMjI3MzUxZTI1ZDlhOTJjNTgKPiA+IFNob3VsZCB3ZSBh
cHBseSBpdCBub3c/IFRoZSBkZXBlbmRlbmN5IHBhdGNoIGhhc27igJl0IGJlZW4gbWVyZ2VkIHll
dC4uLgo+IAo+IEFuZCB3aGF0IGlzOiBeW0BrZXJuZWwub3JnIGluIHlvdXIgcmVjaXBpZW50cyBs
aXN0PwpNaWdodCBoYXZlIGFjY2lkZW50YWxseSBtZXNzZWQgdXAgbXkgZW1haWwuLi4KCiAgICAg
ICAgICAgICAgICAgICAgICAtIFRyb3kKPiAKPiAtLSAKPiBMZWUgSm9uZXMgW+adjueQvOaWr10K
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
