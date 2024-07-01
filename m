Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA3CC30653
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 09:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMyOztaCd5s/ugOZckcC58EcQG4Vvx4TYTbOViTShPU=; b=1B+mJekyCzPgTt
	602YG9Gw4lBg0wsr/jvBhB3vDSm7WM/3nx+DsMHcQfRJJPxrXnT9dayPP/+sz7UVsREvsqMP8UbFT
	K3aK+Vrvbag9PgeiYbXae798WTQ1zHlRBkUOzwRs6dIO5MeeK3yk3LHKP4tnOWVCep/SV1gnIs5OR
	Qx0TQp0b8YNLAnCgRRi1KdiKtm1d1btLckD/U4fKkCEmbIiARqq+nbmmkCRXIJFfZ6gqXa5iyF4as
	tDww+6i43P+pi56xUSHTaKPNoaHe/99z/Nfynq2hCY1/CHWwpiBRRVv06a8Qc4opizMyxcTckdzjF
	cEBnS45c4i1P2y/SefPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOD3i-00000002OXj-2TbG;
	Mon, 01 Jul 2024 09:10:50 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOD3f-00000002OWx-2vJy
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 09:10:49 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2c7b3c513f9so1454132a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 02:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719825046; x=1720429846; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VvOaQzlpnKiFlOfEz9Er17nO3pgB9yQmQ0QBuBPFt4=;
        b=kR0fGmbyUH1t2OgWjxJQAndQT85bNi+tjXn5pHVKnEw0UxAdnyj0QgzQKrN24xElnM
         09nwy5mTkKQIY+thGTiI/BaaYTMMQ9c0BLN7ERjorT/as/UDv1JE0tqHdmEBDwkFUkYw
         DGh4rEdgRRB2NbzPu5uepIAx7b1C1EcEOi0+OgYOYC/By/UpCXi6ttphlL2Uhs5vMJNr
         AzzaQja6bkLqU3Z9nFGsaMRo+UAYMhmH4W1qtfNAtI8EnUOgZWtbJw5dlYdugSNDjhu9
         XPiDCydmC6a7GY59x3vgImxftk+dmYDAq339Q9OKTXo2USMsvy4Mglpt1PjNSMnEhYyg
         htdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719825046; x=1720429846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VvOaQzlpnKiFlOfEz9Er17nO3pgB9yQmQ0QBuBPFt4=;
        b=DH1WX1wzH3sKm0Ldv+Y1tiP7COvJOThTI7wTNqMSuINRc/nTLW4Scu8QxL9oEwxGMC
         InkgQl94jURb+Op6Gc7/qEnxqj2T+C/OA8bl6kdSOQZqZZ1JQ3WP0Ug4l2+iyI4PeCZB
         7EsLgcHAkiohrOfrtQMNBNA0mlPXT5E5L0WSa6J6SvMf0W1nWtrjNz3R+76aHgSsOyqG
         zMtivHOOKgUACnqv2x4l1Ua6yOelu0ic+b+K+GiuIlgYJE6dAtfeZDMj5DjqkZihOF+B
         nIfbw0S/zBlW6gQNIPSK6v7eUy9mqJvqAJH9JG6nub8Rj98+qiIv18NOvOROuXtrKaui
         qELA==
X-Forwarded-Encrypted: i=1; AJvYcCVrPJh3S1uipfr2f6+NNNMeMkCwOrtNs7jIby9DqoEVTO4O1ewisHe3QfU/3JrKcRF7xgQnbDKq9RTPv71vWxB9vF8KkGzYUVuLAyOYoChT
X-Gm-Message-State: AOJu0YzBU9XOcfdlAgQRR7N6oawwyXP9q6n4BC+FYtqZIobDPWSurb4J
	sv3etfillac5RGcf5w+lIogzxUyj6etythEDIdziN/3UWymmCT3aky49TVpmeIDAFztp6LyB+QN
	HDVLsVD1iaQ0rco8V2NM0qOLvhShluUPRvEsyVw==
X-Google-Smtp-Source: AGHT+IGwkj24vCYggigVErwYUWeLyyQPYaxqLK9M4dtT+l3m8GW14hK5AXbiZ8Timfu0ZgNDZaYV9PwlM36bnRlfo7g=
X-Received: by 2002:a17:90a:fa03:b0:2c8:ec4c:436 with SMTP id
 98e67ed59e1d1-2c93d767652mr2217306a91.33.1719825046205; Mon, 01 Jul 2024
 02:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240701072908.25503-1-luxu.kernel@bytedance.com>
 <20240701072908.25503-2-luxu.kernel@bytedance.com> <CAH2o1u7j6pXhWHL2rBZak6LeXxn_KUbQHjygRGQKuEfS_vmtkQ@mail.gmail.com>
In-Reply-To: <CAH2o1u7j6pXhWHL2rBZak6LeXxn_KUbQHjygRGQKuEfS_vmtkQ@mail.gmail.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 1 Jul 2024 17:10:35 +0800
Message-ID: <CAPYmKFtCzQOOsN7vutoY0MrthtvcGxBqRsbr4ZgMQsaY1CrXHQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/1] iommu/riscv: Support sharing irq lines
 between iommu queues
To: Tomasz Jeznach <tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_021047_765232_9F611696 
X-CRM114-Status: GOOD (  25.94  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux@rivosinc.com, will@kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org, xieyongji@bytedance.com, iommu@lists.linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, robin.murphy@arm.com, lihangjing@bytedance.com, baolu.lu@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U29ycnkgZm9yIG5vdCBkZXNjcmliaW5nIGl0IGNsZWFybHkuCgpJbmRlZWQsIHRoZSBoYXJkd2Fy
ZSBpbnRlcnJ1cHQgbGluZXMgaGF2ZSBiZSBjb25maWd1cmVkIGluCnJpc2N2X2lvbW11X2luaXRf
Y2hlY2soKS4KCldoYXQgSSBtZWFuIGlzIHRoYXQgdmlydHVhbCBpbnRlcnJ1cHRzIG9mIGlycXNb
aW9tbXUtPmlycXNfY291bnRdIHRvCmlycXNbUklTQ1ZfSU9NTVVfSU5UUl9DT1VOVCAtIDFdIGFy
ZSBub3Qgc2V0LCB3aGljaCB3aWxsIGNhdXNlCnJpc2N2X2lvbW11X3F1ZXVlX2VuYWJsZSgpIGZh
aWw6CiAgICAgICBjb25zdCB1bnNpZ25lZCBpbnQgaXJxID0KaW9tbXUtPmlycXNbcmlzY3ZfaW9t
bXVfcXVldWVfdmVjKGlvbW11LCBxdWV1ZS0+cWlkKV07CiAgICAgICByYyA9IHJlcXVlc3RfdGhy
ZWFkZWRfaXJxKGlycSwgeHh4KTsKICAgICAgIGlmIChyYykgewogICAgICAgICAgICAgICAgIHF1
ZXVlLT5pb21tdSA9IE5VTEw7CiAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwogICAgICAgfQoK
VGhlIHZpcnR1YWwgaXJxIG9mIHF1ZXVlIGlkICdxJyBzaG91bGQgYmUgdGhlIHNhbWUgYXMgaXJx
c1txICUKaW9tbXUtPmlycXNfY291bnRdIGFzIElDVkVDIGlzIGNvbmZpZ3VyZWQgaW4gdGhlIHNh
bWUgd2F5LgoKUmVnYXJkcywKClh1IEx1CgpPbiBNb24sIEp1bCAxLCAyMDI0IGF0IDQ6NDfigK9Q
TSBUb21hc3ogSmV6bmFjaCA8dGplem5hY2hAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIE1v
biwgSnVsIDEsIDIwMjQgYXQgOToyOeKAr0FNICdYdSBMdScgdmlhIGxpbnV4IDxsaW51eEByaXZv
c2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IFdoZW4gdGhlIG51bWJlciBvZiB3aXJlZCBpbnRlcnJ1
cHQgbGluZXMgaXMgbGVzcyB0aGFuIHRoZSBudW1iZXIgb2YKPiA+IGlvbW11IHF1ZXVlcywgd2Ug
c2hvdWxkIGFzc2lnbiBvbmUgaXJxIGxpbmUgZm9yIHNldmVyYWwgcXVldWVzIGFuZAo+ID4gY29u
ZmlndXJlIGNzciBpY3ZlYyBhY2NvcmRpbmdseS4KPiA+Cj4KPiBJcyB0aGlzIGNhc2Ugbm90IGFs
cmVhZHkgY292ZXJlZCBieSB0aGUgY29kZSBpbiBmdW5jdGlvbgo+IHJpc2N2X2lvbW11X2luaXRf
Y2hlY2soKSwgYXNzaWduaW5nIGNhdXNlIHRvIHZlY3RvciByZWdpc3RlciAoSUNWRUMpCj4gYmFz
ZWQgb24gYXZhaWxhYmxlIGludGVycnVwdCB2ZWN0b3JzPyBJbnRlcnJ1cHQgdmVjdG9yIHNlbGVj
dGlvbiBpcwo+IGJhc2VkIG9uIGFjY2VwdGVkIElDVkVDIGNvbmZpZ3VyYXRpb24gKHNlZSByaXNj
dl9pb21tdV9xdWV1ZV92ZWMoKSkuCj4KPiBSZWxldmFudCBjb2RlIChwYXRjaCAnQ29tbWFuZCBh
bmQgZmF1bHQgcXVldWUgc3VwcG9ydCcpOgo+IGlvbW11LT5pY3ZlYyA9IEZJRUxEX1BSRVAoUklT
Q1ZfSU9NTVVfSUNWRUNfRklWLCAxICUgaW9tbXUtPmlycXNfY291bnQpIHwKPiAgICAgICAgRklF
TERfUFJFUChSSVNDVl9JT01NVV9JQ1ZFQ19QSVYsIDIgJSBpb21tdS0+aXJxc19jb3VudCkgfAo+
ICAgICAgICBGSUVMRF9QUkVQKFJJU0NWX0lPTU1VX0lDVkVDX1BNSVYsIDMgJSBpb21tdS0+aXJx
c19jb3VudCk7Cj4KPiBWYWx1ZXMgaW4gaW9tbXUtPmlycXNbXSBzaG91bGQgcmVwcmVzZW50IGFj
dHVhbCBpbnRlcnJ1cHRzIGFsbG9jYXRlZAo+IGZvciB0aGUgZGV2aWNlLgo+Cj4gQmVzdCwKPiAt
IFRvbWFzego+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNl
LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGxhdGZvcm0uYyB8
IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wbGF0Zm9ybS5jIGIvZHJpdmVycy9p
b21tdS9yaXNjdi9pb21tdS1wbGF0Zm9ybS5jCj4gPiBpbmRleCBkYTMzNjg2M2YxNTIuLjFkMGFm
MTI2MGQ1YiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGxhdGZv
cm0uYwo+ID4gKysrIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS1wbGF0Zm9ybS5jCj4gPiBA
QCAtNjAsNiArNjAsMTAgQEAgc3RhdGljIGludCByaXNjdl9pb21tdV9wbGF0Zm9ybV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gICAgICAgICBmb3IgKHZlYyA9IDA7IHZl
YyA8IGlvbW11LT5pcnFzX2NvdW50OyB2ZWMrKykKPiA+ICAgICAgICAgICAgICAgICBpb21tdS0+
aXJxc1t2ZWNdID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCB2ZWMpOwo+ID4KPiA+ICsgICAgICAg
Zm9yICh2ZWMgPSBpb21tdS0+aXJxc19jb3VudDsgdmVjIDwgUklTQ1ZfSU9NTVVfSU5UUl9DT1VO
VDsgdmVjKyspCj4gPiArICAgICAgICAgICAgICAgaW9tbXUtPmlycXNbdmVjXSA9IHBsYXRmb3Jt
X2dldF9pcnEocGRldiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAodmVjICUgaW9tbXUtPmlycXNfY291bnQpKTsKPiA+ICsKPiA+ICAgICAg
ICAgLyogRW5hYmxlIHdpcmUtc2lnbmFsZWQgaW50ZXJydXB0cywgZmN0bC5XU0kgKi8KPiA+ICAg
ICAgICAgaWYgKCEoaW9tbXUtPmZjdGwgJiBSSVNDVl9JT01NVV9GQ1RMX1dTSSkpIHsKPiA+ICAg
ICAgICAgICAgICAgICBpb21tdS0+ZmN0bCB8PSBSSVNDVl9JT01NVV9GQ1RMX1dTSTsKPiA+IC0t
Cj4gPiAyLjIwLjEKPiA+Cj4gPiAtLQo+ID4gWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNh
dXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAibGludXgiIGdyb3Vw
Lgo+ID4gVG8gdW5zdWJzY3JpYmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBl
bWFpbHMgZnJvbSBpdCwgc2VuZCBhbiBlbWFpbCB0byBsaW51eCt1bnN1YnNjcmliZUByaXZvc2lu
Yy5jb20uCj4gPiBUbyB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBz
Oi8vZ3JvdXBzLmdvb2dsZS5jb20vYS9yaXZvc2luYy5jb20vZC9tc2dpZC9saW51eC8yMDI0MDcw
MTA3MjkwOC4yNTUwMy0yLWx1eHUua2VybmVsJTQwYnl0ZWRhbmNlLmNvbS4KPiA+IEZvciBtb3Jl
IG9wdGlvbnMsIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vYS9yaXZvc2luYy5jb20v
ZC9vcHRvdXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
