Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40487CD37AC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 23:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ja7ZoVkGxRYeSqaFfABgTtyeq8VI/cxybXxnXLQwAOs=; b=a1mLe2U3B4Gruz
	Ahsgw/9z60Oz/c8r+U7GJ7IuwU5+Ka2rtMZpIWc7Z4dcAIUOXq88G/piplwBd3Hza3hgbdoiy8n5a
	KGw1dP4dKa8FdaH/dOIJJWJP4Zb2osn4QgmHJ2/sd56W0Hv4+HdMA4NhOdMt3Qle6ADgXWOue8qSp
	ul/gbNL+b9c3M0CCon+WJ/IqDxsV7V1W6wHoQJIM4MGm7L3EB3vsD8gNLKspcP1HZjvj/Gw6JdtID
	aywqa8RWJXQ64pDX+xu7G0RTk/3m3+cSji8t8MIyQZlr9n+fN33zdM0XxIqsJBimkTe4rzbfXgWbE
	I+QGngC5sDz/cdXqupDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIk5-000000040Gr-3T0w;
	Wed, 13 May 2026 23:11:53 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIk3-000000040GA-0gbX
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 23:11:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso15385ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 16:11:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778713909; cv=none;
        d=google.com; s=arc-20240605;
        b=B496qoDS2yuABf6NeJYMPICxF1MQiQkmdov/CH/hiuSVF4ldA9Zfu5sGZBir4NqmjV
         dHxzV5gwiwL43N5G2+OtL39jw+ycvxQ/vGzEL5QTVMMNIFsF8qTqk7fOq86b1XEW9Ssu
         1ZZXySJrPg7rGlw2qhTkZVWeqj2RQbJuYcaNukzVH09vVa0fgf/dWu5/1Z+npKhAgpZ1
         g6qMYNRA4MY/ZYdlM+pYhcxnqpP6p6fHwlQRN/lVZKu9RH9yPzqLmV6ZqDJdbD/Dp1T9
         Y76p05hNLrzXplMBKaujsaE7I9anizWHuMwG561aHStfTtAMyGR4h+OqXt6yvet/2EVM
         tNCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y7oHsVgzONedd/NOQ/D+5RaAW0/IiAT14ms3smWc8EY=;
        fh=Ry+7jEgKdVx+t5gnTKGMFxb01a6vrBq6pfN5evyo0W0=;
        b=BA6dGIBNx++YQTnbWt4uIbmW3sFunacKRarwcp4wxhaZhQjZcdmIr2InxEX2ONI8af
         X/8ZJdZsuAOzhhvnZaaFoHjXRV7SwRZ6pjaY6z0SgYjTNFwyI+oGdyiYDu510dli3ojz
         Q+ztL6txOiUSXF9sYcmdZJyUj8yszitHaWqHHn3OXNZVIRQiuy3WmRHHELxkscnWXK7q
         DOb3DU+7lIp+bhLkzl9GNgyfID1euGgTmuFl6LU4udEXWLm1cyUeaLnnuMakm+jkpqDn
         Y4jcT13PB7/sB9Az1UXj8NyfGn4Y2VQIP6wO28YqzE0rWWPRU2kozbFmqlx4u/cm72Ru
         NLsw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778713909; x=1779318709; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7oHsVgzONedd/NOQ/D+5RaAW0/IiAT14ms3smWc8EY=;
        b=RVKTFGXF4b+fbfNZ8vCWomHAlALfxvrRyc2YxsInmw2FyA4u9TFfMwmFWPLnmjii0A
         AMmZfG+0XNd0qeyMBHLVbOm4GFUPNO2K7QCKXLv56fC+kt0HMsBFL7OenAB84rHJYtCF
         fWzXDSGicY+uMLXaw8V82VMTYZvI6R+vI1j47m5+yji3oZnSODzfO8CeHxGQtDfMFeCC
         0aOsoi/Q6rRFPTrvo231OPunP8jXCAa0/cCPw/MLcY7eL1YAp2ufKIGNfZOswJdcPDTB
         Nb3lPYtUDPaGN0O/fqC4iiil60bjJ4mANEjvuPmWAJzcMCTIr2lDmZYiGhJB5dTu2YDi
         5Ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778713909; x=1779318709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y7oHsVgzONedd/NOQ/D+5RaAW0/IiAT14ms3smWc8EY=;
        b=sAbCqHibkph7R1Bwpijs8TsSEwhLYnlPRJe/e14PtErLoe4Hxg1bl74ICr2CNtTUb2
         buYXL1cuBXOMt6/JwVd+Dy09Zmv/fWzwnE7hrsWMHca+GNSVW6VfXH8fGdItZg1aUAxR
         LQnXEEWO1Xz/6EitFd/96nBp7pma32BlBMzmSBtM+ormOXi5WW1+3zCWTlbxx7DNabQI
         cLFFt5p+sBks2h9JQx7nsiZO57Bsi8nJsnTKzOqdYtdBto62G8xd4sOOGqH/wd89aQcM
         9zOvctRh+HWIzXFwGPOy/9qR0w3/MaYa6mmEZsZqDUERDrqWqSvp5dFhAroMAw2HN1mL
         3KOA==
X-Forwarded-Encrypted: i=1; AFNElJ9ZailIUzSCRs/IzKzg2GyVjHKZPuOv4LTRWE+rhePLxYo5vExy2SyjEIkrFw5BOAq+aZ29yc85Pj/rQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2d4mDMR9LdV9qKix+hdrttz9Cj2qHurI75kydY0QGb6kFykiW
	LSVXjpsiwsCnFNqeXs8JOQ26651KDTdvkGtQRoPpoV7ioTxfSkb+YM/FuSLUvs7XTBqnFzf90FJ
	iOGTab5ZtT8HUi4VANdgTLy+lMJpKRid+gdUp0EZs
X-Gm-Gg: Acq92OEzy4gSQV89cbSzqLjnIrBziOpBEYiLCcbjP1iXMFeP6+SZBeiEjxNPJXmq+Lm
	vm/Xh58qCAax6N50oUbctw9FxkWGdha35/KQhY8lmx28OVgNNJk1bZaxf2kvPFTus4jJP3kevEk
	27uhL9yJ0FDUVLEiTIN1QR17Fhs5iwOove/p4mL9Jsmqq+V5AjbD1SMGebsZTIbk6O72Uo+4fF4
	vhFoLkFhPSK+dLzkalkJ20+PUxVp8JgWm96W6nj9qGFSIC8rpCVGptHexEkf+Ss5+njdl1rVA9T
	qj5bNeuxhENEHKr3+cBUyxEeWbnR98JKQmeWemJYpHkPU9E=
X-Received: by 2002:a17:903:37c4:b0:2a9:5ef5:399b with SMTP id
 d9443c01a7336-2bd5e59a451mr755895ad.19.1778713908880; Wed, 13 May 2026
 16:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260513154851.1085334-3-guanli.oerv@isrc.iscas.ac.cn> <20260513180721.1179904-1-guanli.oerv@isrc.iscas.ac.cn>
In-Reply-To: <20260513180721.1179904-1-guanli.oerv@isrc.iscas.ac.cn>
From: Ian Rogers <irogers@google.com>
Date: Wed, 13 May 2026 16:11:37 -0700
X-Gm-Features: AVHnY4JI3zBs2s7CKrkzH-aajogXxsqtGXv-WR7gpfwi-u81Dnspy4M5jx-xnDM
Message-ID: <CAP-5=fVUPH4cry7kkp1H8qx4-bJQuWOw+oPJPXYk8fHh-PoCBQ@mail.gmail.com>
Subject: Re: [PATCH v2] perf riscv: Fix discarded const qualifier in _get_field()
To: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	palmer@dabbelt.com, pjw@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_161151_206337_9BCE9597 
X-CRM114-Status: GOOD (  19.68  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMTE6MTLigK9BTSBMaSBHdWFuIDxndWFubGkub2VydkBp
c3JjLmlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFRoZSBhc3NpZ25tZW50IG9mIHN0cnJjaHIoKSBy
ZXR1cm4gdmFsdWVzIHRvIG5vbi1jb25zdCBjaGFyICogdmFyaWFibGVzCj4gdHJpZ2dlcnMgYSAt
V2Vycm9yPWRpc2NhcmRlZC1xdWFsaWZpZXJzIHdhcm5pbmcgd2hlbiBidWlsZGluZyB3aXRoIEdD
QyAxNC4KPiBUaGlzIGhhcHBlbnMgYmVjYXVzZSBpbiBuZXdlciBnbGliYyB2ZXJzaW9ucywgc3Ry
cmNocigpIHJldHVybnMgYQo+IGNvbnN0IGNoYXIgKiBpZiB0aGUgaW5wdXQgc3RyaW5nIGlzIGNv
bnN0Lgo+Cj4gUHJvcGVybHkgZGVjbGFyZSAnbGluZTInIGFuZCAnbmwnIGFzIGNvbnN0IGNoYXIg
KiB0byBtYXRjaCB0aGUgZ2xpYmMKPiBmdW5jdGlvbiBzaWduYXR1cmUgYW5kIGVuc3VyZSB0eXBl
IHNhZmV0eS4gVGhpcyBhdm9pZHMgdGhlIG5lZWQgZm9yCj4gZXhwbGljaXQgdHlwZSBjYXN0aW5n
IGFuZCBhbGlnbnMgd2l0aCB0aGUgZGVzaWduIHBhdHRlcm4gb2Ygbm90Cj4gbW9kaWZ5aW5nIHJl
YWQtb25seSBtZW1vcnkgaW4gdGhlIHBlcmYgdG9vbC4KPgo+IFNpZ25lZC1vZmYtYnk6IExpIEd1
YW4gPGd1YW5saS5vZXJ2QGlzcmMuaXNjYXMuYWMuY24+CgpSZXZpZXdlZC1ieTogSWFuIFJvZ2Vy
cyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgoKVGhhbmtzLApJYW4KCj4gLS0tCj4gdjI6Cj4gIC0gRHJv
cCB0aGUgYXV4dHJhY2UgZGVjb3VwbGluZyBhbmQgd2VhayBzdHViIGFwcHJvYWNoIGFzIHRoZXkg
aW50ZXJmZXJlZAo+ICAgIHdpdGggdGhlIGNyb3NzLXBsYXRmb3JtIGFuYWx5c2lzIGludGVudCwg
cGVyIElhbidzIGZlZWRiYWNrLgo+ICAtIEZvY3VzIG9uIGEgY2xlYW4gZml4IGZvciB0aGUgY29u
c3QgcXVhbGlmaWVyIGlzc3VlIGluIFJJU0MtViBoZWFkZXIuYwo+ICAgIGJ5IHByb3Blcmx5IGRl
Y2xhcmluZyBsb2NhbCB2YXJpYWJsZXMgYXMgY29uc3QuCj4gIC0gVXNlIExpIEd1YW4gYXMgdGhl
IHByZWZlcnJlZCBuYW1lIGZvcm1hdCBmb3IgY29uc2lzdGVuY3kuCj4gIC0gVmVyaWZpZWQgdGhh
dCB0aGlzIGZpeCBpcyBub3QgeWV0IHByZXNlbnQgaW4gYWNtZS9wZXJmLXRvb2xzLW5leHQuCj4K
PiAgdG9vbHMvcGVyZi9hcmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmMgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2hlYWRlci5jIGIvdG9vbHMvcGVyZi9hcmNoL3Jpc2N2
L3V0aWwvaGVhZGVyLmMKPiBpbmRleCA0YjgzOTIwM2Q0Li44OTE5ODRlOTA5IDEwMDY0NAo+IC0t
LSBhL3Rvb2xzL3BlcmYvYXJjaC9yaXNjdi91dGlsL2hlYWRlci5jCj4gKysrIGIvdG9vbHMvcGVy
Zi9hcmNoL3Jpc2N2L3V0aWwvaGVhZGVyLmMKPiBAQCAtMTksNyArMTksNyBAQAo+Cj4gIHN0YXRp
YyBjaGFyICpfZ2V0X2ZpZWxkKGNvbnN0IGNoYXIgKmxpbmUpCj4gIHsKPiAtICAgICAgIGNoYXIg
KmxpbmUyLCAqbmw7Cj4gKyAgICAgICBjb25zdCBjaGFyICpsaW5lMiwgKm5sOwo+Cj4gICAgICAg
ICBsaW5lMiA9IHN0cnJjaHIobGluZSwgJyAnKTsKPiAgICAgICAgIGlmICghbGluZTIpCj4gLS0K
PiAyLjU0LjAKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
