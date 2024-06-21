Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5580CC27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 10:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8suZG1KpyAOgf3osANjK/jOtnHEYcqdM8hrfToKt3bs=; b=1lpJ0tlUg7pD43
	03Ve9ZJ9Edz3Yr+duzUt8G+XMOAWTt3Mkpj+Yz6l8P72IS410bYrNo7Y61IH6wdy/frl0io00+M3G
	jXOXqGWrF/fSFANqK1xZLVBYuLCYEVGTULCmejvREPl51mNxQhUEUM2nusvNmYZW6Q2kbZgzeKEfc
	STupkhyzddLnESROkEIKg9dQSzVhYK+KCludPW+FbQIEZYnRsgPgd2CsjIL+TPgFJSF6g3RB1wvYQ
	YAhnCbxFHdyJpbosGJp2BA1foo/jguvZcz63TqT8n1tNXx1eSu1BpgeEmN4dTDnvnALJbrmcvjhtB
	LKQA+u/oWkHVWik8tfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKbb4-00000008nFZ-2vMV;
	Fri, 21 Jun 2024 10:34:22 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKbb2-00000008nF8-27Xz
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 10:34:22 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-25980546baeso895456fac.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 03:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718966059; x=1719570859; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiEIJ+aB3LoELXi0g19POXyK7Fvva+QATDGmieXdJiU=;
        b=URc2b1WFFbjrllRsmpOhWxXrLwvbf8fL0eVzayoHam5Q6fvnKL9qh8AOo6jOhhoat+
         dZrEfLP3BBu+d0SGzR9gfS1vXxQX1B7LVe97M6ZKRT+phI+GmKlujKNSwkO2RoLxw0ho
         LYzgNVxPqtk90HYKOi1EC/j39AIcjvAPiJ+ctT0IdasUI1n299ez2iNQCZ9Jxl81Ju+0
         VBA+T47NSe8vO71IL5m9nayZ6IInpHoaVGn8Iyoufo/vpk9WZqG5Iabgcj+nFuuTB4rz
         jDOdfKEAKmkbCjRoeGYTc2e8B9l6aIwOTHQ9u4XR4RSNHX+UqY0yDhpMjnC5YgdIHjc9
         I4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966059; x=1719570859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uiEIJ+aB3LoELXi0g19POXyK7Fvva+QATDGmieXdJiU=;
        b=CJddimw4LGr5GFANsS0CMNdymdL2dpCodrqvHnbDbF1O0akkitCLIt363+LVUexL6T
         GYXCuQN8liG7pZOz7JBQMTnP/zndPb+OHQaJ9NWFiKgzlefHXfRC1tFGiXJ9X0U1nHLV
         1bs8AKXtUOot42x53kx3jjf06xH7jXXhUneCKN8wV8H59ztbD26HA8Ohn6K0slKbRdD4
         Nxe91l12StH0UwWHeC8b845ZVnh8yS1l6h1V9T3ObAfkHkbIxSC/cRHsY9zkJf1o2hkJ
         D2ezTm7R/pWZM6QgzGcjfw3bcJd1I4dNXAdhUAF1/qJgqH0do5gEM28aLle/wI4hxTHL
         cWNw==
X-Forwarded-Encrypted: i=1; AJvYcCVt8xbzXyiYOYfdsquI0lYhBE210ZdEkjbmc+p36MvCVZEhgO7YOjTcSknqL5XUnBwVp7nAFAX7A5jSrOSTHfW1uZjQc+J/o7QNprgSeRZV
X-Gm-Message-State: AOJu0Yw9ieSNnHv4MWRYDwjMSqh0yRWgmVailcM11Mv8BcICACXZQAPG
	IdDVDXiw5icKAK3VqGnS8jMgm1Vao7ajEGa76UsryxvCuuN+fxg4fpJTu7KnQayFtjrwf85J4rN
	Hq/JdvULFTBvsLFr8k6+Tj3/J149h6lWtUP7eJg==
X-Google-Smtp-Source: AGHT+IFl6dpz/wOwOogwSSMMm3/tdCg8DTplBhqHoRnvMWb06zdb/xiwjF6rv5JWL8TKTe41hMECUKSqGMX19Tn1ZxQ=
X-Received: by 2002:a05:6870:41cf:b0:24c:4fcc:9011 with SMTP id
 586e51a60fabf-25c949a7793mr8938055fac.19.1718966059436; Fri, 21 Jun 2024
 03:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240618114653.12485-1-cuiyunhui@bytedance.com>
 <2BA519C8-D258-4D98-AD49-AC7D30D8B0D2@jrtc27.com> <3c20c9f15cd7a9fb1f2e88560c1b089ac8032898.camel@icenowy.me>
 <CAEEQ3w=HZptMOgXp2Rtuz-VtzPabN=h5N3=3wS4AMk3Lo7E7FQ@mail.gmail.com> <8fac6e0f11ab5f5fc28be6e73f196b38e99f8c39.camel@icenowy.me>
In-Reply-To: <8fac6e0f11ab5f5fc28be6e73f196b38e99f8c39.camel@icenowy.me>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 21 Jun 2024 18:34:08 +0800
Message-ID: <CAEEQ3wmX9r=Xv=Ue9HOwEvBAHV2=CM5dTiHgd=hzgHBMn27sbw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: Provide the frequency of mtime via hwprobe
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, costa.shul@redhat.com, 
	Andy Chiu <andy.chiu@sifive.com>, samitolvanen@google.com, linux-doc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_033420_658031_BE28E595 
X-CRM114-Status: GOOD (  24.21  )
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

SGkgSWNlbm93eSwKCk9uIEZyaSwgSnVuIDIxLCAyMDI0IGF0IDE6MTjigK9QTSBJY2Vub3d5IFpo
ZW5nIDx1d3VAaWNlbm93eS5tZT4gd3JvdGU6Cj4KPiDlnKggMjAyNC0wNi0yMeaYn+acn+S6lOea
hCAxMTowMSArMDgwMO+8jHl1bmh1aSBjdWnlhpnpgZPvvJoKPiA+IEhpIEljZW5vd3ksCj4gPgo+
ID4gT24gV2VkLCBKdW4gMTksIDIwMjQgYXQgNzo1MeKAr0FNIEljZW5vd3kgWmhlbmcgPHV3dUBp
Y2Vub3d5Lm1lPiB3cm90ZToKPiA+ID4KPiA+ID4g5ZyoIDIwMjQtMDYtMTjmmJ/mnJ/kuoznmoQg
MTg6MTEgKzAxMDDvvIxKZXNzaWNhIENsYXJrZeWGmemBk++8mgo+ID4gPiA+IE9uIDE4IEp1biAy
MDI0LCBhdCAxMjo0NiwgWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+
ID4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gRnJvbTogUGFsbWVyIERhYmJlbHQgPHBhbG1l
ckByaXZvc2luYy5jb20+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQSBoYW5kZnVsIG9mIHVzZXItdmlz
aWJsZSBiZWhhdmlvciBpcyBiYXNlZCBvbiB0aGUgZnJlcXVlbmN5IG9mCj4gPiA+ID4gPiB0aGUK
PiA+ID4gPiA+IG1hY2hpbmUtbW9kZSB0aW1lLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgo+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiA+ID4K
PiA+ID4gPiBJIHdvdWxkIHN1Z2dlc3QgcmVmZXJyaW5nIHRvIHRoZSB1c2VyLW1vZGUgQ1NSIGlu
c3RlYWQsIGkuZS4KPiA+ID4gPiDigJx0aW1l4oCdCj4gPiA+ID4gcmF0aGVyIHRoYW4g4oCcbXRp
bWXigJ0gdGhyb3VnaG91dCBpbiBuYW1lcyBhbmQgZGVzY3JpcHRpb25zLCBzaW5jZQo+ID4gPiA+
IHRoYXTigJlzCj4gPiA+ID4gdGhlIHRoaW5nIHRoYXQgdXNlci1tb2RlIHNvZnR3YXJlIGlzIGFj
dHVhbGx5IHJlYWRpbmcgZnJvbS4KPiA+ID4KPiA+ID4gQWdyZWUuIE1USU1FIGlzbid0IGV2ZW4g
YSB0aGluZyBkZWZpbmVkIGluIFJJU0MtViBJU0EgLS0gaXQncyBwYXJ0Cj4gPiA+IG9mCj4gPiA+
IHRoZSBBQ0xJTlQgdGltZXIgc3BlYywgYnV0IGJlZm9yZSBBQ0xJTlQgZ2V0cyB3aWRlbHkgYWNj
ZXB0ZWQsIGl0J3MKPiA+ID4ganVzdCBzb21lIFNpRml2ZSB0aGluZyB0aGF0IGdvdCBjb3BpZWQg
YnkgbWFueSBvdGhlciB2ZW5kb3JzIChhbmQKPiA+ID4gdmVuZG9ycyBzdWNoIGFzIFQtSGVhZCBl
dmVuIHByb3ZpZGVzIENMSU5UIHcvbyBNVElNRSByZWdpc3RlciAod2VsbAo+ID4gPiBiZWNhdXNl
IHRoZXNlIFQtSGVhZCBjb3JlcyBoYXZlIHJlZmVyZW5jZSBzb3VyY2UgY29kZSBhdmFpbGFibGUs
Cj4gPiA+IHRoaXMKPiA+ID4gaXMgYmVjYXVzZSBvZiB0aGVpciBDUFUgZGVzaWduIHVzZXMgYW4g
ZXh0ZXJuYWwgY291bnRlciBmZWQgYXMgVElNRQo+ID4gPiByZWdpc3RlcikpLgo+ID4KPiA+IE9r
YXksIFRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9ucywgIEkgdGhpbmsgdGhpcyBtb2RpZmljYXRp
b24gaXMgbW9yZQo+ID4gYXBwcm9wcmlhdGU6Cj4gPgo+ID4gUklTQy1WOiBQcm92aWRlIHRoZSBm
cmVxdWVuY3kgb2YgdGltZSBjb3VudGVyIHZpYSBod3Byb2JlCj4KPiBTdXJlLCBvciB5b3UgY291
bGQganVzdCBzYXkgdGltZSBDU1IsIHdoaWNoIGlzIGEgZGVmaW5lZCBDU1IgaW4gdGhlCj4gdXNl
ciBJU0EgZG9jdW1lbnQsIGFuZCBhbGxvdyB0byBiZSByZWFkIGZyb20gdXNlcnNwYWNlLgo+Ck9r
YXksIEkgd2lsbCB1cGRhdGUgaXQgb24gdjIuCgo+ID4KPiA+IEEgaGFuZGZ1bCBvZiB1c2VyLXZp
c2libGUgYmVoYXZpb3IgaXMgYmFzZWQgb24gdGhlIGZyZXF1ZW5jeSBvZiB0aGUKPiA+IHRpbWUg
Y291bnRlci4KPiA+Cj4gPiBXaGF0IGRvIHlvdSB0aGluayA/Cj4gPgo+ID4gPgo+ID4gPiA+Cj4g
PiA+ID4gSmVzcwo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dAo+ID4gPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPiA+Cj4g
Pgo+ID4gVGhhbmtzLAo+ID4gWXVuaHVpCj4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
