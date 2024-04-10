Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022A4CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2waM5spc4hH+bK5rHuDalCv5CbrO0BRSRz+Cnq3ug7k=; b=edZwaTefDzaRGU
	GK6+8AKOuuY7dwCX5gWTfJVUVMiOs785e7L/aOCB7wfHFQi17jtgs7uQjSApWcbsSXdrFz4r5YtLJ
	eJkxFk2ySh38wQkiydS1/wHSd5Zv57oj5jQMDsF1k4k+jwWGAtPndfYpPeL0gggFV5beSVE8APHit
	BdY1h5crvnFI2z/28HmHwO2wX+PrUgHA1OaFMLaffb7pAQTaFF37fXri8xRmQ2um30ZpwB9xLNhOf
	nVWTA0xKVmH7aK1A6qD0mdeqIOjJ6cp+1IIHc6KVz572YpFBlhVbe+sGRvmFk6t+W0/Y+V6wnDKT5
	nk1ESOyCrL6uD7UL8ssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXuc-000000078Ia-3GnI;
	Wed, 10 Apr 2024 13:22:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXuY-000000078GG-3Ram
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 13:22:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C5431CE286D;
	Wed, 10 Apr 2024 13:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FF6C433C7;
	Wed, 10 Apr 2024 13:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712755364;
	bh=03D0DQleB9vxk8wekat4Pmx/RVLXpwIuxViW/1q3BPE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cPub9SDTJInpTD3h3i5Bm0XMXXDO2+Pu3RoVexjDEgpyIom8aOKTpUnOi2fKfG0v/
	 Z21+mTqNAwQ3B0ZxoDkdf+ioemD5P4CiEswiaqPYR2YMFl0r6A7CF6u2sRUasBR0fI
	 q3A3FvUeBdN0WnAVvvxKzvY9zqoV+OKEv93rhNpW8YB4lul59+n6aXt7SE73+lxvAm
	 UUp6giFw1XTo2UdIUxitRqf07eVX36sLFl2qCFX3CNINltqlz6x/1WSFC209Y5iFfx
	 f9yEfchlx+Wdet8CZIpQ7odYqnkYwAV2OIENdLL2IhQRy+7gqbGhgMQRycR3Pyrrb5
	 3f7InogKyfqbQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>, Miguel
 Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson
 Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/1] RISC-V: enable rust
In-Reply-To: <20240409-unsaddle-skittle-c93eb77732bb@spud>
References: <20240409-unsaddle-skittle-c93eb77732bb@spud>
Date: Wed, 10 Apr 2024 15:22:40 +0200
Message-ID: <871q7d73of.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_062247_067860_5DA5B823 
X-CRM114-Status: GOOD (  16.49  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IEZyb206IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBJJ3ZlIGludGVudGlvbmFsbHkg
bm90IHR1cm5lZCBvbiB0aGUgZ2NjIHN1cHBvcnQsIGFzIGRpc2N1c3NlZCBvbgo+IHYxLiBJJ3Zl
IGFsc28gc3dpdGNoZWQgb3ZlciB0byB1c2luZyB0aGUgdGFyZ2V0LCBidXQgaXQgaXMgYSBiaXQg
aGVhdmllcgo+IHRoYW4gdGhlIG9uZSBhcm02NCBzZWVtcyB0byBiZSB1c2luZy4gUklTQy1WIGhh
cyBmZXdlciB0YXJnZXRzIGF2YWlsYWJsZQo+IGFuZCB0aGlzIHdhcyB0aGUgY2xvc2VzdC4gSSBw
cmVzZXJ2ZWQgdGhlIHJlZHpvbmUgZGlzYWJsaW5nLCBqdXN0IG1vdmVkCj4gaW50byB0aGUgTWFr
ZWZpbGUuIEFueSBjb21tZW50IGZyb20gR2FyeSBvciB0aGUgTExWTSBsYWRzIG9uIHRoZSB0YXJn
ZXQKPiB3b3VsZCBiZSBncmVhdCBJIHRoaW5rOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxh
bmcvcnVzdC9ibG9iL21hc3Rlci9jb21waWxlci9ydXN0Y190YXJnZXQvc3JjL3NwZWMvdGFyZ2V0
cy9yaXNjdjY0aW1hY191bmtub3duX25vbmVfZWxmLnJzCj4gYXJtNjQgaXMgdXNpbmc6Cj4gaHR0
cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0L2Jsb2IvbWFzdGVyL2NvbXBpbGVyL3J1c3Rj
X3RhcmdldC9zcmMvc3BlYy90YXJnZXRzL2FhcmNoNjRfdW5rbm93bl9ub25lLnJzCj4KPiBJIHdh
cyBnb25uYSBzZW5kIHRoaXMgeWVzdGVyZGF5LCBidXQgZm91bmQgb3V0IGxhc3QgbWludXRlIEkg
aGFkIGludmFsaWQKPiBjb2RlIGluIHRoZSB0YXJnZXQgZ2VuZXJhdGlvbiBzY3JpcHQuIFRoZSBr
ZXJuZWwgdGVzdCByb2JvdCBoYWQgZ2l2ZW4gbXkKPiBicmFuY2ggdGhlIGdsb2JhbCBhbGwtY2xl
YXIgLSB0aGUgcnVzdCBjb3ZlcmFnZSB3aXRoIGFsbCB0aGUKPiAiZGVwZW5kcyBvbiAhRk9PIiBt
dXN0IHJlYWxseSBsaW1pdCB0aGUgYnVpbGQgY292ZXJhZ2UuIEkgYnVpbHQgZm9yIHg4Ngo+IHdp
dGggcnVzdCBlbmFibGVkIGxvY2FsbHkgdGhpcyB0aW1lIHRvIG1ha2Ugc3VyZS4uCj4KPiBBcyB0
aGlzIGFzIGxpZnRlZCBmcm9tIHRoZSBzdGF0ZSBvZiB0aGUgUnVzdC1mb3ItTGludXggdHJlZSwg
dGhlIGNvbW1pdAo+IG1lc3NhZ2VzIGZyb20gdGhlcmUgY2Fubm90IGJlIHByZXNlcnZlZCwgc28g
dGhlc2UgcGF0Y2hlcyBoYXZlIGNvbW1pdAo+IG1lc3NhZ2VzIHRoYXQgSSB3cm90ZS4KPgo+IEkn
dmUgdGVzdGVkIHRoaXMgb24gSWNpY2xlLCBhbmQgdGhlIG1vZHVsZXMgc2VlbSB0byB3b3JrIGFz
IGV4cGVjdGVkLgo+IFVuZm9ydHVuYXRlbHkgdGhlcmUgYXBwZWFyIHRvIGJlIGltcGxpY2l0IDMy
LWJpdCBkaXZpc2lvbnMgKG9yIHNpbWlsYXIpCj4gaW4gY29yZSBSdXN0IGNvZGUsIHNvLCBhcyBp
biB0aGUgZG93bnN0cmVhbSBSdXN0LWZvci1MaW51eCB0cmVlLCBSdXN0IGlzCj4gb25seSBlbmFi
bGVkIGZvciA2NC1iaXQuCgpOaWNlLCB3b3JrcyB3aXRoIG15IHNpbXBsZSB0ZXN0IG9uIFZpc2lv
bkZpdmUgMiBhcyB3ZWxsISBDb29sIHRvIGhhdmUKUnVzdCBzdXBwb3J0IGluISBOb3csIEJURiBq
dXN0IG5lZWRzIHRvIGJlIHN1cHBvcnRlZCwgYW5kIEkgY2FuIGhhdmUKUnVzdCAqYW5kKiBCUEYg
aW4gbXkga2VybmVscyEgOi1QIFxvLwoKVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBy
aXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
