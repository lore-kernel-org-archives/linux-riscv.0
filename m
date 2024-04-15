Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398A4C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4kQQ8FYXN3WnNz0EPiC7XSdmDixuT55hHKnzMXU8aQ=; b=R8uGuA/LbZCfhU
	ldH2ietLbfSSYa9Z2l4A+YjCwBQ13MFCnMrPyDX09X9ckINlfkIHA2MaWx60ncd1MHwZ+ZwhJzdSy
	c+f3N3rcSSipM6wcvSiI2FL8xuoDP3Cy6ElDLdWS6TpQ5NPQo+IlpzIf+ZeGBSRo+/U5u79quR+0Q
	oZDL2FJDK/EJUZSWJEZkNatP9u7Y8QKXfHypdkxddDEl5C/IrnQmBEN5+tGyVRpbXra0Gv6Hv4v0S
	r8ju0B+q2RDgq1o+0oavWqKII+141J8KFG3sgLiS8En1xWCk0BwIgy1O5/WKprMVozlUyDmZ788x7
	uvtGQgJpxpARILUnlHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwM0x-00000008MiC-1Vne;
	Mon, 15 Apr 2024 13:04:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwM0r-00000008Mgy-0Ry6
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:04:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 088EB60B84;
	Mon, 15 Apr 2024 13:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F057C2BD10;
	Mon, 15 Apr 2024 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713186283;
	bh=tr9yQ+4cpsOL+xDqeA+9j3kwvie9ouEBUsT3s2BSqh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ImXb6uTdlDCasCuJVRBnQ/oQfhr22tFWdjclh8WLsJ51AFkxolDjzhT2GQlm/+p/N
	 9lm5WzGsVB83N7l70F+8UV4g5QyTtAaKByZJWzsn10NHjWUs1BQNZz8O02ZqR5Jz7X
	 11S1K2ml15QnwoaSdSOLTYvNBvTclOyqiO4t5U6YTE09luSAa3KTHP2MG6UdfVS1xq
	 2gcKyRUnrIe0DlP28Iaka2T22JJBMh7r4Dy154gOf3CnUwBwjMrc7RXqZdv6/ve/u3
	 NSrJwKZRbvGQvJXWd4UWknDa6x/n2J4tQn1LR3oRrmJAU17jqx4f3yq7sN6OoU5/6N
	 s2Wurhmc8fQHw==
Date: Mon, 15 Apr 2024 15:04:36 +0200
From: Christian Brauner <brauner@kernel.org>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Andreas Dilger <adilger@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>, 
	Nam Cao <namcao@linutronix.de>, linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Jan Kara <jack@suse.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>, 
	Ext4 Developers List <linux-ext4@vger.kernel.org>, Conor Dooley <conor@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: riscv32 EXT4 splat, 6.8 regression?
Message-ID: <20240415-festland-unattraktiv-2b5953a6dbc9@brauner>
References: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
 <20240413164318.7260c5ef@namcao>
 <22E65CA5-A2C0-44A3-AB01-7514916A18FC@dilger.ca>
 <20240414021555.GQ2118490@ZenIV>
 <887E261B-3C76-4CD9-867B-5D087051D004@dilger.ca>
 <87v84kujec.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v84kujec.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_060445_369176_1D919C70 
X-CRM114-Status: GOOD (  26.60  )
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

T24gU3VuLCBBcHIgMTQsIDIwMjQgYXQgMDQ6MDg6MTFQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBBbmRyZWFzIERpbGdlciA8YWRpbGdlckBkaWxnZXIuY2E+IHdyaXRlczoKPiAKPiA+
IE9uIEFwciAxMywgMjAyNCwgYXQgODoxNSBQTSwgQWwgVmlybyA8dmlyb0B6ZW5pdi5saW51eC5v
cmcudWs+IHdyb3RlOgo+ID4+IAo+ID4+IE9uIFNhdCwgQXByIDEzLCAyMDI0IGF0IDA3OjQ2OjAz
UE0gLTA2MDAsIEFuZHJlYXMgRGlsZ2VyIHdyb3RlOgo+ID4+IAo+ID4+PiBBcyB0byB3aGV0aGVy
IHRoZSAweGZmZmZmMDAwIGFkZHJlc3MgaXRzZWxmIGlzIHZhbGlkIGZvciByaXNjdjMyIGlzCj4g
Pj4+IG91dHNpZGUgbXkgcmVhbG0sIGJ1dCBnaXZlbiB0aGF0IFJBTSBpcyBjaGVhcCBpdCBkb2Vz
bid0IHNlZW0gdW5saWtlbHkKPiA+Pj4gdG8gaGF2ZSA0R0IrIG9mIFJBTSBhbmQgd2FudCB0byB1
c2UgaXQgYWxsLiAgVGhlIHJpc2N2MzIgbWlnaHQgY29uc2lkZXIKPiA+Pj4gcmVzZXJ2aW5nIHRo
aXMgcGFnZSBhZGRyZXNzIGZyb20gYWxsb2NhdGlvbiB0byBhdm9pZCBzaW1pbGFyIGlzc3VlcyBp
bgo+ID4+PiBvdGhlciBwYXJ0cyBvZiB0aGUgY29kZSwgYXMgaXMgZG9uZSB3aXRoIHRoZSBOVUxM
LzAgcGFnZSBhZGRyZXNzLgo+ID4+IAo+ID4+IE5vdCBhIGNoYW5jZS4gICpBbnkqIHBhZ2UgbWFw
cGVkIHRoZXJlIGlzIGEgc2VyaW91cyBidWcgb24gYW55IDMyYml0Cj4gPj4gYm94LiAgUmVjYWxs
IHdoYXQgRVJSX1BUUigpIGlzLi4uCj4gPj4gCj4gPj4gT24gYW55IGFyY2hpdGVjdHVyZSB0aGUg
dmlydHVhbCBhZGRyZXNzZXMgaW4gcmFuZ2UgKHVuc2lnbmVkIGxvbmcpLTUxMi4uCj4gPj4gKHVu
c2lnbmVkIGxvbmcpLTEgbXVzdCBuZXZlciByZXNvbHZlIHRvIHZhbGlkIGtlcm5lbCBvYmplY3Rz
Lgo+ID4+IEluIG90aGVyIHdvcmRzLCBhbnkga2luZCBvZiB3cmFwYXJvdW5kIGhlcmUgaXMgYXNr
aW5nIGZvciBhbiBvb3BzIG9uCj4gPj4gYXR0ZW1wdHMgdG8gYWNjZXNzIHRoZSBlbGVtZW50cyBv
ZiBidWZmZXIgLSBrZXJuZWwgZGVyZWZlcmVuY2Ugb2YKPiA+PiAoY2hhciAqKTB4ZmZmZmYwMDAg
b24gYSAzMmJpdCBib3ggaXMgYWxyZWFkeSBhIGJ1Zy4KPiA+PiAKPiA+PiBJdCBtaWdodCBiZSBn
ZXR0aW5nIGFuIGludmFsaWQgcG9pbnRlciwgYnV0IGFyaXRobWV0aWNhbCBvdmVyZmxvd3MKPiA+
PiBhcmUgaXJyZWxldmFudC4KPiA+Cj4gPiBUaGUgb3JpZ2luYWwgYnVnIHJlcG9ydCBzdGF0ZWQg
dGhhdCBzZWFyY2hfYnVmID0gMHhmZmZmZjAwMCBvbiBlbnRyeSwKPiA+IGFuZCBJJ2QgcXVvdGVk
IHRoYXQgYXQgdGhlIHN0YXJ0IG9mIG15IGVtYWlsOgo+ID4KPiA+IE9uIEFwciAxMiwgMjAyNCwg
YXQgODo1NyBBTSwgQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4g
V2hhdCBJIHNlZSBpbiBleHQ0X3NlYXJjaF9kaXIoKSBpcyB0aGF0IHNlYXJjaF9idWYgaXMgMHhm
ZmZmZjAwMCwgYW5kIGF0Cj4gPj4gc29tZSBwb2ludCB0aGUgYWRkcmVzcyB3cmFwcyB0byB6ZXJv
LCBhbmQgYm9vbS4gSSBkb3VidCB0aGF0IDB4ZmZmZmYwMDAKPiA+PiBpcyBhIHNhbmUgYWRkcmVz
cy4KPiA+Cj4gPiBOb3cgdGhhdCB5b3UgbWVudGlvbiBFUlJfUFRSKCkgaXQgZGVmaW5pdGVseSBt
YWtlcyBzZW5zZSB0aGF0IHRoaXMgbGFzdAo+ID4gcGFnZSBIQVMgdG8gYmUgZXhjbHVkZWQuCj4g
Pgo+ID4gU28gc29tZSBvdGhlciBidWcgaXMgcGFzc2luZyB0aGUgYmFkIHBvaW50ZXIgdG8gdGhp
cyBjb2RlIGJlZm9yZSB0aGlzCj4gPiBlcnJvciwgb3IgdGhlIGFyY2ggaXMgbm90IGNvcnJlY3Rs
eSBleGNsdWRpbmcgdGhpcyBwYWdlIGZyb20gYWxsb2NhdGlvbi4KPiAKPiBZZWFoLCBzb21ldGhp
bmcgaXMgb2ZmIGZvciBzdXJlLgo+IAo+IChGV0lXLCBJIG1hbmFnZSB0byBoaXQgdGhpcyBmb3Ig
TGludXMnIG1hc3RlciBhcyB3ZWxsLikKPiAKPiBJIGFkZGVkIGEgcHJpbnQgKGNsb3NlIHRvIHRy
YWNlX21tX2ZpbGVtYXBfYWRkX3RvX3BhZ2VfY2FjaGUoKSksIGFuZCBmb3IKPiB0aGlzIEJUOgo+
IAo+ICAgWzxjMDFlOGIzND5dIF9fZmlsZW1hcF9hZGRfZm9saW8rMHgzMjIvMHg1MDgKPiAgIFs8
YzAxZThkNmU+XSBmaWxlbWFwX2FkZF9mb2xpbysweDU0LzB4Y2UKPiAgIFs8YzAxZWEwNzY+XSBf
X2ZpbGVtYXBfZ2V0X2ZvbGlvKzB4MTU2LzB4MmFhCj4gICBbPGMwMmRmMzQ2Pl0gX19nZXRibGtf
c2xvdysweGNjLzB4MzAyCj4gICBbPGMwMmRmNWYyPl0gYmRldl9nZXRibGsrMHg3Ni8weDdhCj4g
ICBbPGMwMzUxOWRhPl0gZXh0NF9nZXRibGsrMHhiYy8weDJjNAo+ICAgWzxjMDM1MWNjMj5dIGV4
dDRfYnJlYWRfYmF0Y2grMHg1Ni8weDE4Ngo+ICAgWzxjMDM2YmNhYT5dIF9fZXh0NF9maW5kX2Vu
dHJ5KzB4MTU2LzB4NTc4Cj4gICBbPGMwMzZjMTUyPl0gZXh0NF9sb29rdXArMHg4Ni8weDFmNAo+
ICAgWzxjMDJhMzI1Mj5dIF9fbG9va3VwX3Nsb3crMHg4ZS8weDE0Mgo+ICAgWzxjMDJhNmQ3MD5d
IHdhbGtfY29tcG9uZW50KzB4MTA0LzB4MTc0Cj4gICBbPGMwMmE3OTNjPl0gcGF0aF9sb29rdXBh
dCsweDc4LzB4MTgyCj4gICBbPGMwMmE4YzdjPl0gZmlsZW5hbWVfbG9va3VwKzB4OTYvMHgxNTgK
PiAgIFs8YzAyYThkNzY+XSBrZXJuX3BhdGgrMHgzOC8weDU2Cj4gICBbPGMwYzFjYjdhPl0gaW5p
dF9tb3VudCsweDVjLzB4YWMKPiAgIFs8YzBjMmJhNGM+XSBkZXZ0bXBmc19tb3VudCsweDQ0LzB4
N2EKPiAgIFs8YzBjMDFjY2U+XSBwcmVwYXJlX25hbWVzcGFjZSsweDIyNi8weDI3Ywo+ICAgWzxj
MGMwMTFjNj5dIGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4Mjg2LzB4MmE4Cj4gICBbPGMwYjk3YWI4
Pl0ga2VybmVsX2luaXQrMHgyYS8weDE1Ngo+ICAgWzxjMGJhMjJjYT5dIHJldF9mcm9tX2Zvcmsr
MHhlLzB4MjAKPiAKPiBJIGdldCBhIGZvbGlvIHdoZXJlIGZvbGlvX2FkZHJlc3MoZm9saW8pID09
IDB4ZmZmZmYwMDAgKHdoaWNoIGlzCj4gYnJva2VuKS4KPiAKPiBOZWVkIHRvIGdvIGludG8gdGhl
IHdlZWRzIGhlcmUuLi4KCkkgZG9uJ3Qgc2VlIGFueXRoaW5nIG9idmlvdXMgdGhhdCBjb3VsZCBl
eHBsYWluIHRoaXMgcmlnaHQgYXdheS4gRGlkIHlvdQptYW5hZ2UgdG8gcmVwcm9kdWNlIHRoaXMg
b24gYW55IG90aGVyIGFyY2hpdGVjdHVyZSBhbmQvb3IgZmlsZXN5c3RlbT8KCkZ3aXcsIGlpcmMg
dGhlcmUgd2VyZSBhIGJ1bmNoIG9mIGZzL2J1ZmZlci5jIGNoYW5nZXMgdGhhdCBjYW1lIGluCnRo
cm91Z2ggdGhlIG1tLyBsYXllciBiZXR3ZWVuIHY2LjcgYW5kIHY2LjggdGhhdCBtaWdodCBhbHNv
IGJlCmludGVyZXN0aW5nLiBCdXQgcmVhbGx5IEknbSBwb2tpbmcgaW4gdGhlIGRhcmsgY3VycmVu
dGx5LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
