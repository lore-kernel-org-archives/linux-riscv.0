Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C124606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 08:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GmAXPZhE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=TgZD9Fm/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TX4jr7q8k2ttJcL3E95YIsIuDy8JiBjEbitHAYPYKgg=; b=GmAXPZhEfj5UKfbqAyeifrsiJo
	dvgHGadZGmu1OfiiYcTLqoMomCVaGLEAWarp68OWRyb5MPc02BptLRFida/MDzIVhtKiDQYT2OF8B
	+0G1takL+m5tVxpRcqeYhHaQu1Q1Jk8MAcQlkGGJiJ4xw07PN1aFvHDzEZm7KUquXu41Rsub15MV+
	+3VkKAJJBOW1CsTWrjw+ZWDghY+bdz6kSfL0lifCr4yuEHqA+4IoEl9dxP8If7h3HE/Gwv0r+j1RI
	kbz9f9f8mG81kW6Fl5QN+xaVtSl2UQVtfAFOL77nWYCm81TWiXof35DlMRQ1mduYBtJ/22Nlqjlam
	kUroCc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUec-0000000CMX6-2iWC;
	Thu, 26 Nov 2026 08:16:30 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUea-0000000CMVm-2m6H
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 08:16:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795680952; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d28bMu5UbSY+z1mtwa0xXUQcF8yk9IUj5LS6t3JrWYwOHkC+hr0xyrmXnVk3XefB4U01tg4JY9oUmJ2pmwwQCC1w07+PN9rroRizAPz8r/3hJdFLNw+HGhtlYwvnbKFLKJK7PbkGOwRI88tonwdDzqe3MNiyEPSu5buXesM3Ig8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795680952; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=chm5h2uHfD3RH+9tEQ3/9r/BgZnc+Er/3JnIdSdTH3c=; 
	b=R5uXGTCQd1wF0QQ3UjnjxlyZ6Ou4OegdQH3DOVcQLMpBxIXaXFYEotwzmN2jwiBN9E9TVlxeC40GnTaly8SkM1nAaxJ06qM8vwsMIJSRxMuDV/9F2bA5ulF5SlvBsT7fIQRcQT5KeM+XDYof5Mk6dzMwTbfY7+oaikpXfI1KIF4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=TgZD9Fm/kI6BAnhbIxWr2/n62K2qAEesbhtgfUoLbKty8IEP/wm51K9zk0vpaQDVxeq0QYDiaT+xsSrkEzauZkrfMM0EvmTgBaXRQ1U+8O3rx6DjPmq79+Ch2Hd4YdKdwkcvquUcAV5TamtUVJKbQMfgi/np9/GeBqlHSISaGG5yvTunk4quLux579CabkCN603iLPUES6cgfmcR3r1+TLc3y3LVyQ8kRrh6NVknF0TtqrD3zw+ENCx0r+OvLkKdIKHiBFEIDd6pV0dDKPcHVxoYmCXqd+eNq8ZTcqAS667REextyAijtYFS2JxR2NsDSB5nok/gTbzLFLyXaGv52A==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=chm5h2uHfD3RH+9tEQ3/9r/BgZnc+Er/3JnIdSdTH3c=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795680949924288.2188422629731;
	Thu, 26 Nov 2026 00:15:49 -0800 (PST)
Message-ID: <dd22bc951015aabf3bcc86d3c16074d3eb23a070.camel@icenowy.me>
Subject: Re: [PATCH v9 1/4] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
From: Icenowy Zheng <uwu@icenowy.me>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Paul Walmsley	 <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Randy Dunlap	 <rdunlap@infradead.org>, Radim Krcmar
 <rkrcmar@qti.qualcomm.com>, 	linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	linux-kernel@vger.kernel.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>,
 linux-kselftest@vger.kernel.org, Andy Chiu <tchiu@tenstorrent.com>, 
 Florian Weimer <fweimer@redhat.com>, Peter Bergner
 <bergner@oss.tenstorrent.com>, Zihong Yao	 <zihong.plct@isrc.iscas.ac.cn>,
 Mark Harris <mark.hsj@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 26 Nov 2026 16:15:37 +0800
In-Reply-To: <4ea9d48592dbf0e1120f7db7305aae37.guodong.xu@oss.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
	 <20261109-rva23u64-hwprobe-v2-v9-1-ae846c5c7178@oss.qualcomm.com>
	 <ce886c3a5bf5af34df5c1ac3fefbd86a8f0567ff.camel@icenowy.me>
	 <4ea9d48592dbf0e1120f7db7305aae37.guodong.xu@oss.qualcomm.com>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_001628_747108_59353AB9 
X-CRM114-Status: GOOD (  19.34  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMjblm5vnmoQgMDA6MTYgLTA1MDDvvIxHdW9kb25nIFh15YaZ6YGT77yaCj4g
SGkgSWNlbm93eSwKPiAKPiBPbiBNb24sIDA5IE5vdiAyMDI2IDIzOjU2OjQ3ICswODAwLCBJY2Vu
b3d5IFpoZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjYtMTEtMDnkuIDnmoQgMDc6NDcgLTA1MDDvvIxH
dW9kb25nIFh15YaZ6YGT77yaCj4gCj4gWy4uLl0KPiAKPiA+ID4gK2VudW0gewo+ID4gPiArCVJJ
U0NWX0lTQV9CQVNFX0lNQSwKPiA+IAo+ID4gSSBtYXkgaGF2ZSBtaXNzZWQgc29tZXRoaW5nLCBi
dXQgd291bGQgaXQgYmUgd29ydGggdG8gYWRkIGEgR0MgdGllcj8KPiA+IAo+ID4gSSB0aGluayBt
YW55IExpbnV4IGRpc3Ryb3MgaGF2ZSBHQyBkZWZpbmVkIGFzIHRoZWlyIGJhc2VsaW5lLgo+IAo+
IFRoYW5rcyBmb3IgcmFpc2luZyB0aGlzLgo+IAo+IEEgc2luZ2xlIGJpdCBmb3IgJ1JWNjRHQycg
c2VlbXMgdG8gaGF2ZSBubyB1c2VyIHRvIG1lLCBzbyBJIHdvdWxkCj4gcHJlZmVyIG5vdCB0byBh
ZGQgaXQuIEFsbG93IG1lIHRvIGV4cGxhaW4uCj4gCj4gRyBpcyBhIGNvbWJpbmF0aW9uIG9mIGV4
dGVuc2lvbnMgZGVmaW5lZCBpbiB0aGUgZWFybHkgZGF5cyBvZiB0aGUKPiBSSVNDLVYgSVNBIHNw
ZWM6IHRoZSB1bnByaXZpbGVnZWQgbWFudWFsIGRlZmluZXMgaXQgYXMgYW4gYWJicmV2aWF0aW9u
Cj4gZm9yIElNQUZEWmljc3JfWmlmZW5jZWksICJvdXIgc3RhbmRhcmQgZ2VuZXJhbC1wdXJwb3Nl
IElTQSIgWzFdLgo+IAo+IEkgY2hlY2tlZCwgYW5kIHlvdSBhcmUgcmlnaHQgdGhhdCBpdCBpcyB0
aGUgYmFzZWxpbmUgaW4gcHJhY3RpY2U6IEdDQwo+IGRlZmF1bHRzIHJpc2N2NjQgdG8gLW1hcmNo
PXJ2NjRnYywgYW5kIERlYmlhbiwgRmVkb3JhIGFuZCBVYnVudHUKPiAoYmVmb3JlIDI1LjEwKSBi
dWlsZCB3aXRoIHRoYXQgZGVmYXVsdC4gQnV0IG15IHVuZGVyc3RhbmRpbmcgaXMsIEcgaXMgYQo+
IGJ1aWxkLXRpbWUgYmFzZWxpbmUgb25seS4gTm90aGluZyBjaGVja3MgZm9yIEcgYXQgcnVuIHRp
bWU7IG9uIGEgY29yZQo+IHdpdGhvdXQgRiwgRCBvciBDLCBhbiBydjY0Z2MgZGlzdHJvIHVzZXJs
YW5kIGp1c3QgdGFrZXMgU0lHSUxMIG9uIHRoZQo+IGZpcnN0IHN1Y2ggaW5zdHJ1Y3Rpb24uCj4g
Cj4gQW55d2F5LCB3aGF0IHRoaXMgc2VyaWVzIGludGVuZHMgdG8gZXhwb3J0IHRvIHVzZXIgc3Bh
Y2UgaXMgdGhlIHByb2ZpbGUKPiBsZXZlbCAoUlZBMjBVNjQsIFJWQTIyVTY0LCBSVkEyM1U2NCku
IEZvciBleGFtcGxlLCBhIGdsaWJjLWh3Y2FwcyBkZXNpZ24KPiBjYW4gZmFsbCBiYWNrIHRvIHJ2
YTIwdTY0IHdoZW4gaXRzIHJ1bi10aW1lIGNoZWNrIGZpbmRzIG5vIHJ2YTIzdTY0Lgo+IAo+IFBT
OiBJbiB0aG9zZSB0ZXJtcyB0aGUgY291bnRlcnBhcnQgb2YgcnY2NGdjIGlzIFJWQTIwVTY0IFsy
XQo+IChleGNsdWRpbmcgWmlmZW5jZWksIHdoaWNoIHRoZSBwcm9maWxlcyBtYW5kYXRlIG9ubHkg
aW4gdGhlIFMgdmFyaWFudHMKPiBbM10gYW5kIHdoaWNoLCBhcyBub3RlZCBpbiBod3Byb2JlLnJz
dCBbNF0sIGlzIG5vdCBpbnRlbmRlZCBmb3IgZGlyZWN0Cj4gdXNlIGJ5IHVzZXIgc3BhY2UpLgoK
WWVzLCBJIGFncmVlIHRoYXQgUlZBMjBVNjQgc2hvdWxkIGJlIGV4cG9zZWQgaW5zdGVhZCBvZiBS
VjY0R0MuCgo+IAo+IFJWQTIwVTY0IGFuZCBSVkEyMlU2NCBjYW1lIHVwIGluIHRoZSBMUEMyNiBk
aXNjdXNzaW9uIGFzIHdlbGwgWzVdLiBJCj4gd291bGQgbGlrZSB0byBhZGQgdGhlbSBpbiBhIGZv
bGxvdy11cCwgcHJvYmFibHkgbm90IGluIHRoaXMgc2VyaWVzLCBpZgo+IHRoZSByZXZpZXdlcnMg
aGVyZSBhZ3JlZS4KCkknbSBnbGFkIHRvIGhlYXIgdGhpcy4KClRoYW5rcywKSWNlbm93eQoKPiAK
PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvYmxvYi9tYWlu
L21vZHVsZXMvdW5wcml2L3BhZ2VzL25hbWluZy5hZG9jCj4gWzJdIGh0dHBzOi8vZG9jdWxhcnh1
LmdpdGh1Yi5pby9ydmEyMy9ydmEtbWFuZGF0b3J5LWV4dGVuc2lvbnMuaHRtbAo+IFszXSBodHRw
czovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtcHJvZmlsZXMvYmxvYi9tYWluL3NyYy9wcm9maWxl
cy5hZG9jLAo+ICAgICBSVkEyMFU2NCBzZWN0aW9uLCB0aGUgbm90ZSBvbiBaaWZlbmNlaQo+IFs0
XSBEb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QsIFJJU0NWX0hXUFJPQkVfS0VZ
X0JBU0VfQkVIQVZJT1IKPiBbNV0gaHR0cHM6Ly9scGMuZXZlbnRzL2V2ZW50LzIwL2NvbnRyaWJ1
dGlvbnMvMjYyNi8KPiAKPiBHdW9kb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
