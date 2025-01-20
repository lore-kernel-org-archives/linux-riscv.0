Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A99C02185
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 07:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNwcYqvSJjm5ygXk3C57eq6TSDy3q1ty7UgNGFceBf8=; b=QEuqdu3C+5hLWo
	bOp2s/VIuuGO/9X28HYmQoVdv2Y8cc1WK46Y9szX5uTtlSQ8cmnMujf1IUjuHZsaLZiZecebS20IT
	qnxNfeXjGSx6iWkhJPiXubpvSsMGM9Mfb9xYo40bHPrI3xt9+AF7PwS4OQWb3dEij6gzfJb8oVYWu
	GFs7ItNekmzcsYpYSobCGmTWU96MEoZYBAumwydJHPhkG/HYKrMXtzAdrn4TEBS5/rqX2ka+pPTm9
	Hq0IeBEFpCiFeyw7rHchCTfc9+GDuV2c9RbdEfXbVI0vUr87FW7ooP879WqFtFVOYUo4pOzYxCHIK
	+DhNgBNIQiWLGRvEz2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmLx-00000004wie-2AbZ;
	Mon, 20 Jan 2025 07:37:45 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZmLu-00000004whB-1oPu
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 07:37:44 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737358658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94gHCrclhJ8NEhggf/2SeD20YartfOWGhKHSTZJsRIE=;
	b=UuMQ4OPUchjamOeDlCKd556Bxya70t/9132nejDOfsXoimV7Fw66XRvBAwsqYuuFdhBbi2
	MbZSXGDDKqM0hVAp0lM9T8PsMjhpg22XMl+VpLPFPlpS6pod95LXRjj1feK5REozGpoMlN
	Sgfh9DlnmxyrD2t/9Dhgtm6YSemVkri/rDnZgpYLt73PPQlkJRih7LvlpuL12OrJJpuJVM
	/ZN5DX1SXF2D0VYxR1CDbPBOqfZ35ON6vrLAyit0vGECvk8VqNu632KgumFarR4QXmnY4U
	Jr3MZKyXR4QLiCMDDLITeuCVi0gsnsCY2QY4aGKP4CBI3TfgTV0hw1nP7xmjHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737358658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94gHCrclhJ8NEhggf/2SeD20YartfOWGhKHSTZJsRIE=;
	b=T6Ah/KrLDv/nwjv0i4LgCXfFvrDagPr6fUdKKnRZfidUOcKQnOPmx5inC+4F3EGkkENE6p
	Qmsn4YUCHJ7QCeCg==
To: Anup Patel <anup@brainfault.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Xu Lu
 <luxu.kernel@bytedance.com>, paul.walmsley@sifive.com, palmer@dabbelt.com,
 lihangjing@bytedance.com, xieyongji@bytedance.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip: riscv: Order normal writes and IPI writes
In-Reply-To: <CAAhSdy0cDUHASb0iOfGFdh_AW3NH-M+2JHTOG+O_FYkhAS4dDw@mail.gmail.com>
References: <20250116120710.51673-1-luxu.kernel@bytedance.com>
 <Z4l1fklnUPyTSLO4@ghost> <87ldv9afso.ffs@tglx>
 <CAAhSdy0cDUHASb0iOfGFdh_AW3NH-M+2JHTOG+O_FYkhAS4dDw@mail.gmail.com>
Date: Mon, 20 Jan 2025 08:37:37 +0100
Message-ID: <87frle9br2.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_233742_987917_6E0B67C1 
X-CRM114-Status: GOOD (  18.76  )
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

T24gRnJpLCBKYW4gMTcgMjAyNSBhdCAyMToyMywgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBGcmks
IEphbiAxNywgMjAyNSBhdCA0OjA14oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+IHdyb3RlOgo+PiBPbiBUaHUsIEphbiAxNiAyMDI1IGF0IDEzOjA5LCBDaGFybGllIEpl
bmtpbnMgd3JvdGU6Cj4+ID4gT24gVGh1LCBKYW4gMTYsIDIwMjUgYXQgMDg6MDc6MTBQTSArMDgw
MCwgWHUgTHUgd3JvdGU6Cj4+ID4+IFJlcGxhY2Ugd3JpdGVsX3JlbGF4ZWQoKSB3aXRoIHdyaXRl
bCgpIHdoZW4gaXNzdWluZyBJUEkgdG8gZW5zdXJlIGFsbAo+PiA+PiBwcmV2aW91cyB3cml0ZSBv
cGVyYXRpb25zIG1hZGUgYnkgY3VycmVudCBDUFUgYXJlIHZpc2libGUgdG8gb3RoZXIgQ1BVcy4K
Pj4gPgo+PiA+IERpZCB5b3UgZXhwZXJpZW5jZSBhbiBvcmRlcmluZyBpc3N1ZSBmcm9tIHRoaXM/
Cj4+Cj4+IFRoYXQncyBub3QgdGhlIHJpZ2h0IHF1ZXN0aW9uLgo+Pgo+PiAgICAgICBDUFUgMCAg
ICAgICAgICAgICAgICAgICAgIENQVSAxCj4+ICAgICAgIHN0b3JlIEEgICAvLyBkYXRhCj4+ICAg
ICAgIHN0b3JlIEIgICAvLyBJUEkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJ
UEkgaGFuZGxlcgo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvYWQgQQo+Pgo+
PiBUaGUgcmVhbCBxdWVzdGlvbiBpcyB3aGV0aGVyIHRoZSBSSVNDLVYgbWVtb3J5IG1vZGVsIGd1
YXJhbnRlZXMgdW5kZXIKPj4gYWxsIGNpcmN1bXN0YW5jZXMgdGhhdCBBIGlzIGdsb2JhbGx5IHZp
c2libGUgYmVmb3JlIHRoZSBJUEkgaGFuZGxlcgo+PiBsb2FkLiBJZiBzbywgdGhlbiB0aGUgd3Jp
dGVsX3JlbGF4ZWQoKSBpcyBmaW5lLiBJZiBub3QsIHRoZSBmZW5jZSBpcwo+PiByZXF1aXJlZC4K
Pj4KPj4gVGhhdCdzIG5vdCBhIHF1ZXN0aW9uIG9mIG9ic2VydmF0aW9uLiBJdCdzIGEgcXVlc3Rp
b24gb2YgZmFjdHMgZGVmaW5lZAo+PiBieSB0aGUgYXJjaGl0ZWN0dXJlLiBQZW9wbGUgaGF2ZSB3
YXN0ZWQgbW9udGhzIHRvIGFuYWx5emUgc3VjaCBmYWlscwo+PiB3aGljaCB0ZW5kIHRvIGhhcHBl
biBvbmNlIGV2ZXJ5IGJsdWUgbW9vbiB3aXRoIG5vIG90aGVyIHRyYWNlIHRoYW4KPj4gInNvbWV0
aGluZyB3ZW50IHdyb25nIiAuLi4uCj4KPiBUaGUgUklTQy1WIEZFTkNFIGluc3RydWN0aW9uIGRp
c3Rpbmd1aXNoZXMgYmV0d2VlbiBub3JtYWwKPiBtZW1vcnkgb3BlcmF0aW9ucyBhbmQgSS9PIG9w
ZXJhdGlvbnMgaW4gaXRzIHByZWRlY2Vzc29yIGFuZAo+IHN1Y2Nlc3NvciBzZXRzIHdoZXJlIHIg
PSBub3JtYWwgcmVhZCwgdyA9IG5vcm1hbCB3cml0ZSwKPiBpID0gSS9PIHJlYWQsIGFuZCBvID0g
SS9PIHdyaXRlLgo+Cj4gVGhlIGlwaV9tdXhfc2VuZF9tYXNrKCkgZG9lcyBzbXBfbWJfX2FmdGVy
X2F0b21pYygpIChlcXVhbHMKPiB0byAiZmVuY2UgcncscnciKSBiZWZvcmUgY2FsbGluZyBpbXNp
Y19pcGlfc2VuZCgpLiBUaGlzIHByZXZlbnRzCj4gb3JkZXJpbmcgb2Ygbm9ybWFsIG1lbW9yeSB3
cml0ZXMgaW4gaW1zaWNfaXBpX3NlbmQoKSBiZWZvcmUKPiBzbXBfbWJfX2FmdGVyX2F0b21pYygp
IGluIGlwaV9tdXhfc2VuZF9tYXNrKCkgYnV0IGl0IGRvZXMKPiBub3QgcHJldmVudCBJL08gbWVt
b3J5IHdyaXRlcyBpbiBpbXNpY19pcGlfc2VuZCgpIHRvIGJlIG9yZGVyZWQKPiBiZWZvcmUgc21w
X21iX19hZnRlcl9hdG9taWMoKS4KPgo+IFRoaXMgbWVhbnMgY3VycmVudGx5IG5vdGhpbmcgcHJl
dmVudHMgdGhlIEkvTyBtZW1vcnkgd3JpdGUgaW4KPiBpbXNpY19pcGlfc2VuZCgpIHRvIGJlIG9y
ZGVyZWQgYmVmb3JlIG5vcm1hbCBtZW1vcnkgd3JpdGVzIGluCj4gaXBpX211eF9zZW5kX21hc2so
KSBoZW5jZSB0aGVyZSBpcyBhIHZlcnkgdW5saWtlbHkgcG9zc2liaWxpdHkKPiBvZiBhbiBJUEkg
aGFuZGxlciBvbiB0aGUgdGFyZ2V0IENQVSBzZWVpbmcgaW5jb3JyZWN0IGRhdGEuCgpWZXJ5IHVu
bGlrZWx5IGlzIGEgdmFsaWQgYXNzdW1wdGlvbiBmb3IgYSBzaW5nbGUgc3lzdGVtLCBidXQgYXQg
c2NhbGUgaXQKYmVjb21lcyB2ZXJ5IGxpa2VseSA6KQoKPiBUaGUgY29udmVyc2lvbiBvZiB3cml0
ZWxfcmVsYXhlZCgpIHRvIHdyaXRlbCgpIGluIGltc2ljX2lwaV9zZW5kKCkKPiBhZGRzIGEgImZl
bmNlIHcsbyIgYmVmb3JlIHRoZSBhY3R1YWwgSS9PIG1lbW9yeSB3cml0ZSB3aGljaAo+IGVuc3Vy
ZXMgdGhhdCBJL08gbWVtb3J5IHdyaXRlIGlzIG5vdCBvcmRlcmVkIGJlZm9yZSBub3JtYWwKPiBt
ZW1vcnkgd3JpdGVzLgo+Cj4gQmFzZWQgb24gdGhlIGFib3ZlLCB0aGUgY29udmVyc2lvbiBvZiB3
cml0ZWxfcmVsYXhlZCgpIHRvCj4gd3JpdGVsKCkgaW4gaW1zaWNfaXBpX3NlbmQoKSBsb29rcyBn
b29kIHRvIG1lLgoKQ2FuIHdlIHBsZWFzZSBoYXZlIHNvbWV0aGluZyBsaWtlIHRoZSBhYm92ZSBp
biB0aGUgY2hhbmdlIGxvZyBzbyB0aGlzIGlzCmRvY3VtZW50ZWQgZm9yIHBvc3Rlcml0eT8KClRo
YW5rcwoKICAgICAgICB0Z2x4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
