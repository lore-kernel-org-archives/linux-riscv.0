Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F90C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Nov 2022 00:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2xHoUFrhuXxbqhojtQxxDRJ5mZJiR6p7HfGH4L48WE=; b=qi2odJMrQXKsno
	6hd8c+anWhJQEw8eMMXChbyMLWnWzcFWdeuvbHrR3O3OQF1MloH24ASXOLg7nRzrakykjRteitI/F
	CWKgX1jAzdV9TI/FJkEgFg0xQS6Ch/i+blV9OzHpWgqCeocgabE6mYXV5l2yN1PN8H9SiBd8+Ix1v
	dCiLELWUNVRSAN8T8WVDZozdo+bcx/QjLoyc7H3NCjfmdzETvrJ9LvqRYwGUUGxyTpawZ/SrO2bhh
	5lt6xCWMH9BZ1BDvc2zE7t42xSaWxlqIJVU91xygtD9GdHXHn60KRnXx0qPZtZ0xhNEACdkpbXKk8
	JGyL2wM/heWBXWR0j9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxGxv-001VD1-1v; Tue, 22 Nov 2022 00:16:43 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxGxs-001VCS-FF
	for linux-riscv@lists.infradead.org; Tue, 22 Nov 2022 00:16:42 +0000
Received: by mail-ej1-x636.google.com with SMTP id i10so32148098ejg.6
        for <linux-riscv@lists.infradead.org>; Mon, 21 Nov 2022 16:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ur6y58owifFAZLuBvRdGFsM0HSacfIeyNdpeCcw2DM=;
        b=QqY3qxtzRWO5ae7oYI/adsFgbgXJvJgTzJUly7909RGcHQgTSMZKxW6o1PVK0wXp0D
         JN1I00Iyz+E5WkH1ZjRWKAnzWFs4SN00OrxzRol+/n0ySVTBzjHkzMuzUH2P7AmIW1iB
         8MTJhuy+VwiuUoAmAML+QmUS/+/1ALor5GwlDJmAjWZnN6xaP0XGn+zbWAzPRotbnDCk
         nidDlpRfuGeaKc7Ll3Sj+mBeLG9xCI/PCcHPlrJLLgHXnRwtwDxsvp45rETd7MHdlpP2
         +UsG4GJjV83wd4Yo5LaU1iWr0BWph4wLSGvorxPAIPkx3wUh04VP/bqKjBlPP0eoy1vd
         +Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Ur6y58owifFAZLuBvRdGFsM0HSacfIeyNdpeCcw2DM=;
        b=xE0fFOkcqdMfZvtaU8Wz8d6Q3C2/4PrGeaAfwnfu9N2jpJS2eY6JzqDmQefFPgRvi0
         cV4Iz+Qpdjz0uN0Z3CGJzAe3QDTiixG39UrGo9dXEw6y14AW50fxXSNwVfuefsxvzb3Z
         9zgiEJu33SBFxkJja2LEIuV9NqZ4JlbIMoNqQIJLha2lhtZMaK6zO6/aGioBw7neUL0k
         fcnZ1sjPbhzHj/gvRWfs1gVGLlnk7c1gkVsgn03H6hmNNpOh0pcrdUVnKfOTEha1SQv4
         3hblg8JN729B46pUkPu+acxN9j2o8o9NQJuXpYA7AB195VomgaoDWGHQqjU3LK/pbOPY
         C8EA==
X-Gm-Message-State: ANoB5plQ2h9QYKAYxGvTvsL8vejxU6aCuHf3Mdf8OrVoEsnuUDzHvgID
	RVZwb+9VrNdQVP3MdctUDX8fWCyaw4K4FhSBJggARUH/z5DXBw==
X-Google-Smtp-Source: AA0mqf7pdBfHbLPgeYmrKg4WM/0QxvkCM4PB05ag1/wVlMZv//EbUulSsCh5JB70zZUOczMsB9/1xLghVaM9lsNcESw=
X-Received: by 2002:a17:906:560c:b0:7ae:5884:81b1 with SMTP id
 f12-20020a170906560c00b007ae588481b1mr2819514ejq.155.1669076197311; Mon, 21
 Nov 2022 16:16:37 -0800 (PST)
MIME-Version: 1.0
References: <20221110164924.529386-1-heiko@sntech.de> <CA+V-a8sqEjLKdGm67Sm5YbYUVRuntAM0Wqw_Gk+V6i9x+b1Exg@mail.gmail.com>
 <14108757.uLZWGnKmhe@diego> <4163934.aeNJFYEL58@diego>
In-Reply-To: <4163934.aeNJFYEL58@diego>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 22 Nov 2022 00:16:10 +0000
Message-ID: <CA+V-a8v+YGtgwJz_7NUxno0aMHxFCnE8HcLMNWVpi7ksAvLQ0g@mail.gmail.com>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched alternatives
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	christoph.muellner@vrull.eu, conor@kernel.org, philipp.tomsich@vrull.eu, 
	ajones@ventanamicro.com, emil.renner.berthing@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_161640_531236_A31E6F22 
X-CRM114-Status: GOOD (  27.08  )
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

SGkgSGVpa28sCgpPbiBNb24sIE5vdiAyMSwgMjAyMiBhdCAxMDozOCBQTSBIZWlrbyBTdMO8Ym5l
ciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPgo+IEFtIE1vbnRhZywgMjEuIE5vdmVtYmVyIDIw
MjIsIDIzOjE3OjExIENFVCBzY2hyaWViIEhlaWtvIFN0w7xibmVyOgo+ID4gQW0gTW9udGFnLCAy
MS4gTm92ZW1iZXIgMjAyMiwgMjI6MzE6MzYgQ0VUIHNjaHJpZWIgTGFkLCBQcmFiaGFrYXI6Cj4g
PiA+IFNvbWUgbW9yZSBpbmZvcm1hdGlvbiwKPiA+ID4KPiA+ID4gLSBJZiBJIGRyb3AgdGhlIHJp
c2N2X2FsdGVybmF0aXZlX2ZpeF9hdWlwY19qYWxyKCkgY2FsbCBhZnRlcgo+ID4gPiBwYXRjaF90
ZXh0X25vc3luYygpIGFuZCB0aGVuIHByaW50IHRoZSBhbHQtPm9sZF9wdHIgaW5zdHJ1Y3Rpb25z
Cj4gPiA+IGJlZm9yZSBwYXRjaGluZyBJIGNhbiBzZWUgdGhlIGluc3RydWN0aW9ucyBhcyAweDEz
IChub3ApIHdoaWNoIGlzCj4gPiA+IGNvcnJlY3QuCj4gPiA+Cj4gPiA+IC0gaWYgSSBjYWxsIHJp
c2N2X2FsdGVybmF0aXZlX2ZpeF9hdWlwY19qYWxyKCkgY2FsbCBhZnRlcgo+ID4gPiBwYXRjaF90
ZXh0X25vc3luYygpIGFuZCB0aGVuIHByaW50IHRoZSBhbHQtPm9sZF9wdHIgaW5zdHJ1Y3Rpb25z
Cj4gPiA+IGJlZm9yZSBwYXRjaGluZyBJIGRvbnQgc2VlIDB4MTMgKG5vcCkgY29uc2lzdGVudGx5
IGZvciBvbGQKPiA+ID4gaW5zdHJ1Y3Rpb25zLgo+ID4KPiA+IHdoaWNoIGlzIHRvIGJlIGV4cGVj
dGVkIEkgZ3Vlc3MuCj4gPgo+ID4gYWx0LT5vbGRfcHRyIHBvaW50cyB0byB0aGUgbWVtb3J5IGxv
Y2F0aW9uIHdoZXJlIHRoZSBsaXZlIGtlcm5lbCBjb2RlCj4gPiBsaXZlcy4KPiA+Cj4gPiBJLmUu
IHRoZSBjb2RlIGF0IHRoaXMgbG9jYXRpb24gaXMgdGhlIHRoaW5nIHRoZSBrZXJuZWwgYWN0dWFs
bHkgcnVucy4KPiA+IFRoZSBjb2RlIGF0IHRoaXMgbG9jYXRpb24gdGhlbiBnZXRzIG92ZXJ3cml0
dGVuIGJ5IHRoZSBhbHRlcm5hdGl2ZQo+ID4gYXNzZW1ibHkuCj4gPgo+ID4KPiA+ID4gLSBJZiBJ
IHJlcGxhY2UgdGhlIG5vcCdzIGluIHRoZSBvbGQgaW5zdHJ1Y3Rpb25zIHdpdGggbXkgYXNzZW1i
bHkgY29kZQo+ID4gPiBvZiByei9maXZlIGNtbyBhbmQgdGhlbiBqdXN0IHVzZSBwYXRjaF90ZXh0
X25vc3luYygpIEkgY2FuIHNlZSB0aGUKPiA+ID4gY29ycmVjdCBhY3R1YWwgaW5zdHJ1Y3Rpb24g
YmVpbmcgcHJpbnRlZCBhcGFydCBmcm9tIGphbHIgKGlzIHNvbWUgc29ydAo+ID4gPiBvZiBvZmZz
ZXQgYWRkZWQgdG8gaXQgYXMgSSBzZWUgbGFzdCA0IGJpdHMgbWF0Y2g/KSBhbmQgdGhlbiBpcwo+
ID4gPiByZXBsYWNlZCBjb3JyZWN0bHkgYnkgdGhlIHNhbWUgYWx0IGluc3RydWN0aW9ucyBhcGFy
dCBmcm9tIHRoZSBqYWxyCj4gPiA+IChsb2cgWzBdKS4KPiA+ID4KPiA+ID4gLSBJZiBJIHJlcGxh
Y2UgdGhlIG5vcCdzIGluIHRoZSBvbGQgaW5zdHJ1Y3Rpb25zIHdpdGggbXkgYXNzZW1ibHkgY29k
ZQo+ID4gPiBvZiByei9maXZlIGNtbyBhbmQgdGhlbiB1c2UgcGF0Y2hfdGV4dF9ub3N5bmMoKSBh
bmQKPiA+ID4gcmlzY3ZfYWx0ZXJuYXRpdmVfZml4X2F1aXBjX2phbHIoKSBJIGNhbiBzZWUgdGhl
IGFjdHVhbCBvbGQKPiA+ID4gaW5zdHJ1Y3Rpb25zIGRpZmZlcnMgYSBiaXQgYW5kIGFnYWluIHRo
ZSBqYWxyIGluc3RydWN0aW9uIGRpZmZlcnMgdG9vCj4gPiA+IGluIHRoZSBwYXRjaGVkIGNvZGUg
KGxvZyBbMV0pLgo+ID4gPgo+ID4gPiBbMF0gaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0LzEyNjE0
MTIvCj4gPiA+IFsxXSBodHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTI2MTQxMy8KPiA+ID4KPiA+
ID4gQXR0YWNoZWQgaXMgdGhlIG9ianVtcCBvZiBkbWEtbm9uY29oZXJlbnQubyBmb3IgcmVmZXJl
bmNlLgo+ID4KPiA+IEkgZGlkIHJlYWQgdGhhdCBvYmpkdW1wcyBhcmUgbm90IHJlYWxseSBjb25j
bHVzaXZlIHdoZW4gbG9va2luZwo+ID4gYXQgYXVpcGMgKyBqYWxyIGluc3RydWN0aW9ucywgaGVu
Y2UgdGhlIHByaW50aW5nIG9mIHRoZSBhY3R1YWwgaW5zdHJ1Y3Rpb25zLgo+ID4KPiA+IEFzIGVp
dGhlciBtYW51YWxseSBvciB3aXRoIGEgaGVscGVyIGxpa2UKPiA+Cj4gPiAgICAgICBodHRwczov
L2x1cGxhYi5naXRsYWIuaW8vcnZjb2RlY2pzLyNxPTB4ZjRjMDgwZTcKPiA+Cj4gPiB5b3UgY2Fu
IHRoZW4gZGVjb2RlIHRoZSBhY3R1YWwgaW5zdHJ1Y3Rpb24gYW5kIGNvbXBhcmUuCj4gPgo+ID4g
SW4geW91ciBsb2cgdGhlIHR3byBqYWxyIGluc3RydWN0aW9ucyBkZWNvZGUgdG8gZGlmZmVyZW50
IG9mZnNldHMsCj4gPiAgICAgICBqYWxyIHgxLCB4MSwgLTE4MAo+ID4gdnMKPiA+ICAgICAgIGph
bHIgeDEsIHgxLCAtODM0Cj4gPgo+ID4gQ2FuIHlvdSBjaGVjayB3aGF0IHRoZSBwYXRjaF9vZmZz
ZXQgdmFsdWUgaXMgaW4geW91ciBjYXNlPwo+ID4KPiA+IEludGVyZXN0aW5nbHkgdGhlCj4gPiAg
ICAgICBhdWlwYyB4MSwgMAo+ID4gaXMgMCBmb3IgYm90aCBjYXNlcy4KPiA+Cj4gPiBJJ2xsIHRy
eSB0byBidWlsZCBhIHJlYWwgdGVzdC1zZXR1cCBtaW1pY2luZyB3aGF0IHlvdSdyZSBkb2luZwo+
ID4gdG9tb3Jyb3cgKGV1cm9wZWFuIHRvbW9ycm93KS4KPgo+IGFsc28sIGlzIGl0IHBvc3NpYmxl
IGZvciB5b3UgdG8gcHV0IHlvdXIgY29kZSBvbiBzb21lIGdpdGh1Ygo+IG9yIHNvPyBTb21ldGlt
ZXMgbG9va2luZyBhdCB0aGUgYWN0dWFsIGNvZGUgbWFrZXMgdGhpbmdzCj4gYSBsb3QgZWFzaWVy
IDotKQo+CkkgaGF2ZSBwdXNoZWQgbXkgY2hhbmdlcyBoZXJlCmh0dHBzOi8vZ2l0aHViLmNvbS9w
cmFiaGFrYXJsYWQvbGludXgvdHJlZS9yemZpdmUtY21vCgpDaGVlcnMsClByYWJoYWthcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
