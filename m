Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8413D5C0C0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LcCywPKMNIcF5mpVYYa0TxkTIIDpWTaupJKJuWxvmHI=; b=XT6Q77VwlYhjPL
	mVPaoys44ft/OCHYQs3nVcM5z1q/JkwRIyROWD4Q3AMGo671T5ipvRcHM/WlJqlThFU5ZbqO50+8/
	EMyBsMERH31DZCAaL1UHrom023q4U4mCQfoheQsD8CE1LJQ4Hc8JUKT5kA5vipSUw2xBu5LlVBROr
	M3muq9YrKB48KuhV8qFn5VcTygtlCN8vJzh+wPqfwMwp+cYaQAlA3+nTLXALm+d2gx9dI7yNlJqz2
	6TqlbRd2DOkf4kgkMHJYc27y8QQWIqtSlsuGdOpTm1InqIRo43SJtuo07bJfJaS42vsoKdsggoB4z
	9/Lg6oTTomMoJLlNuxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPnP-00000004sR3-3iIw;
	Tue, 16 Dec 2025 07:48:35 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVPnN-00000004sQc-16D8
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 07:48:34 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-65727896f35so2120220eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Dec 2025 23:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765871311; x=1766476111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frKHPX5ywrYd/FCcOy5yUMER90cU/9Dl+nl5fOqZwf8=;
        b=WBUptCK4WN4bT20bTzdcnppFo8ljFGNMtvluzXrLV7+QVs0AhXPqx34qFM/Br7NTys
         aWaD1GgNTVtuVWRHpHo1laq8w5/pSUOjqLO8SIlh3sEHjh59uj00MxzlHNI2985iKRlZ
         5gF4Mj6+1s1k91nVcl+X2237/lORze9i6P+nH2JiQbyuub+tKcelS9pdRK5hy0M6sFrq
         5S4YdgyRTJ/Q8y8MDvGl2q5Fnv7lwlGeAu5OvAGj38NaqOmCpzx+O/JBeQTDceKw1jWg
         ymSHjJxZExH23+oRnjpsVHolmNuLIaS8Hglu4h6Etc/N6Gnf8Kw+ebkVXaOzgSv5OMHC
         02vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765871311; x=1766476111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=frKHPX5ywrYd/FCcOy5yUMER90cU/9Dl+nl5fOqZwf8=;
        b=hlzSN5YXrFtRUqyt7/kVg4HB8JVXOzwcqg6heYEqBP7YZ8nNIIzLoR5NcWxR40KGNg
         TplkMIEi2O6YScJPwj0L758VW5hued0V1z5s7uPkmD/WGS0S+3q4dal9TDTC32aryJIv
         xs/OcJXWMKU1ht5C1h5o9YX1Kz8zRJUc4dW+rp8abxQL5Vg4JdcmkNeaudSmkqK9m/NT
         VoiJHJHHHttUy0iiNe0RYop5NWiMxshuEt72GV/vXyXNUL0ceSeD5zE9evyRhIVccCaC
         zqCdgTfkucSvY3aGN/upOE7jaW7Ux6iyaS7pjcDAK3qSrch6dsXyKwanrrAk5maNQRpn
         Dl5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU//OqeypCy4+FHoiSuj7AbcKHh2/RsaHHJNDlP3kF49wHBXPp0gBphhvf2jlUqelQUUNSgqylIn2hz+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3dXOZMrFrmyz6wCFRFfkAFneo4xI3iREO9XKH5ESLhz34ivdR
	lMpmggYdpFXGsV9I1rSVaV49f7CAfNAV/NI5ZwWJe1EZ562MqOy26IGvNMjqGyS7Yyksglb7NyG
	T/ieBzpiv0kerE0ntGruDKHA77JRnNCy08w4D5qPhGw==
X-Gm-Gg: AY/fxX6H+eoQBWQER+YjChc9gbl4z889L+Ko+HOY7Ilhi7/Lj44gnFAme/c76D404Og
	S5g6Z3ruc9zP1OfO0AGPKwR6xY2argUtjO/ooVsrfYUnvJs+0Eb2KVaRaXDKnrj3J5qSo6wUMhZ
	o3ICty9RAWdCIscn3pISP+aFc/CoHwOixuOIEWoq6or9fF7n31XCR43GPvdL/I8wRzlLjJt/owm
	Ta0ny7E2XXOzzFdP+wU2kHWoEeNsuQrmTgPA3M0yz/hA/b6k/1a7AreGGrkHSSPSHVlaO9U2oFY
	TeDBNhkXId3v4hOKjgcW+apw6w==
X-Google-Smtp-Source: AGHT+IEPOrKRWGgu+OxdDtx4IXb/qFP/j2ZNORsdxOva2CcQ8h0GLVsvgak9Sq1RKOKGOEcea3C4ZEcZYByXnUuFT0g=
X-Received: by 2002:a05:6820:f021:b0:659:9a49:8f9d with SMTP id
 006d021491bc7-65b451b5949mr6140936eaf.22.1765871311449; Mon, 15 Dec 2025
 23:48:31 -0800 (PST)
MIME-Version: 1.0
References: <20251204101730.1036671-1-arnd@kernel.org> <CAHUa44H1Ejbbuzr1hF1HrT69JGgnvfkkDkh+9KvEvBT+eWBDhw@mail.gmail.com>
 <0b061075-ab71-4ac1-93ec-438ddaaec903@oss.qualcomm.com> <aTbCqyOuprPOyU4X@sumit-X1>
 <2c0d09b7-0d8c-4bf2-a1bd-1dc4b58cd0a8@oss.qualcomm.com> <3aacf997-3a21-4e4b-b6bd-c55c36fb4c74@oss.qualcomm.com>
In-Reply-To: <3aacf997-3a21-4e4b-b6bd-c55c36fb4c74@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 16 Dec 2025 08:48:19 +0100
X-Gm-Features: AQt7F2oK7tpsUtSf_m-ZV3B6e3UN6ZLzybBTQt7InLkT3ExTm7qpHEoEcmffuZA
Message-ID: <CAHUa44GO-D1YcQ_36pe-vQ83fB9rcOkny+M7a=CThAxWb6TLTQ@mail.gmail.com>
Subject: Re: [PATCH] tee: fix tee_ioctl_object_invoke_arg padding
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Harshal Dev <harshal.dev@oss.qualcomm.com>, Sumit Garg <sumit.garg@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Etienne Carriere <etienne.carriere@foss.st.com>, Randy Dunlap <rdunlap@infradead.org>, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_234833_332263_D8030E19 
X-CRM114-Status: GOOD (  26.81  )
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

SGksCgpPbiBUdWUsIERlYyA5LCAyMDI1IGF0IDQ6NTTigK9BTSBBbWlycmV6YSBaYXJyYWJpCjxh
bWlycmV6YS56YXJyYWJpQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gSGksCj4KPiBPbiAx
Mi84LzIwMjUgMTE6NTQgUE0sIEhhcnNoYWwgRGV2IHdyb3RlOgo+ID4KPiA+Cj4gPiBPbiAxMi84
LzIwMjUgNTo1MCBQTSwgU3VtaXQgR2FyZyB2aWEgT1AtVEVFIHdyb3RlOgo+ID4+IE9uIE1vbiwg
RGVjIDA4LCAyMDI1IGF0IDA0OjI0OjE3UE0gKzExMDAsIEFtaXJyZXphIFphcnJhYmkgd3JvdGU6
Cj4gPj4+IEhpLAo+ID4+Pgo+ID4+PiBPbiAxMi81LzIwMjUgMTI6MjcgQU0sIEplbnMgV2lrbGFu
ZGVyIHdyb3RlOgo+ID4+Pj4gSGksCj4gPj4+Pgo+ID4+Pj4gT24gVGh1LCBEZWMgNCwgMjAyNSBh
dCAxMToxN+KAr0FNIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+
Pj4KPiA+Pj4+PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+ID4+Pj4+Cj4g
Pj4+Pj4gVGhlIHRlZV9pb2N0bF9vYmplY3RfaW52b2tlX2FyZyBzdHJ1Y3R1cmUgaGFzIHBhZGRp
bmcgb24gc29tZQo+ID4+Pj4+IGFyY2hpdGVjdHVyZXMgYnV0IG5vdCBvbiB4ODYtMzIgYW5kIGEg
ZmV3IG90aGVyczoKPiA+Pj4+Pgo+ID4+Pj4+IGluY2x1ZGUvbGludXgvdGVlLmg6NDc0OjMyOiBl
cnJvcjogcGFkZGluZyBzdHJ1Y3QgdG8gYWxpZ24gJ3BhcmFtcycgWy1XZXJyb3I9cGFkZGVkXQo+
ID4+Pj4+Cj4gPj4+Pj4gSSBleHBlY3QgdGhhdCBhbGwgY3VycmVudCB1c2VycyBvZiB0aGlzIGFy
ZSBvbiBhcmNoaXRlY3R1cmVzIHRoYXQgZG8KPiA+Pj4+PiBoYXZlIGltcGxpY2l0IHBhZGRpbmcg
aGVyZSAoYXJtNjQsIGFybSwgeDg2LCByaXNjdiksIHNvIG1ha2UgdGhlIHBhZGRpbmcKPiA+Pj4+
PiBleHBsaWNpdCBpbiBvcmRlciB0byBhdm9pZCBzdXJwcmlzZXMgaWYgdGhpcyBsYXRlciBnZXRz
IHVzZWQgZWxzZXdoZXJlLgo+ID4+Pj4+Cj4gPj4+Pj4gRml4ZXM6IGQ1YjhiMGZhMTc3NSAoInRl
ZTogYWRkIFRFRV9JT0NUTF9QQVJBTV9BVFRSX1RZUEVfT0JKUkVGIikKPiA+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+ID4+Pj4+IC0tLQo+ID4+Pj4+
IFRoZSBuZXcgaW50ZXJmYWNlIHNob3dlZCB1cCBpbiA2LjE4LCBidXQgSSBvbmx5IGNhbWUgYWNy
b3NzIHRoaXMgYWZ0ZXIKPiA+Pj4+PiB0aGF0IHdhcyByZWxlYXNlZC4gQ2hhbmdpbmcgaXQgbm93
IGlzIHRlY2huaWNhbGx5IGFuIEFCSSBjaGFuZ2Ugb24KPiA+Pj4+PiBhcmNoaXRlY3R1cmVzIHdp
dGggdW51c3VhbCBwYWRkaW5nIHJ1bGVzLCBzbyBwbGVhc2UgY29uc2lkZXIgY2FyZWZ1bGx5Cj4g
Pj4+Pj4gd2hldGhlciB3ZSB3YW50IHRvIGRvIGl0IHRoaXMgd2F5IG9yIG5vdC4KPiA+Pj4+Pgo+
ID4+Pj4+IFdvcmtpbmcgYXJvdW5kIHRoZSBBQkkgZGlmZmVyZW5jZXMgd2l0aG91dCBhbiBBQkkg
Y2hhbmdlIGlzIHBvc3NpYmxlLAo+ID4+Pj4+IGJ1dCBhZGRzIGEgbG90IG9mIGNvbXBsZXhpdHkg
Zm9yIGNvbXBhdCBoYW5kbGluZy4KPiA+Pj4+Cj4gPj4+PiBUaGlzIGlzIGN1cnJlbnRseSBvbmx5
IHVzZWQgYnkgdGhlIHJlY2VudGx5IGludHJvZHVjZWQgcWNvbXRlZSBiYWNrZW5kCj4gPj4+PiBk
cml2ZXIuIFNvIGl0J3Mgb25seSB1c2VkIG9uIGEgZmV3IGFybTY0IFF1YWxjb21tIHBsYXRmb3Jt
cyByaWdodCBub3cuCj4gPj4+Pgo+ID4+Pj4gSSB0aGluayB3ZSBzaG91bGQgdGFrZSB0aGlzIHBh
dGNoLCBidXQgbGV0J3MgaGVhciB3aGF0IG90aGVycyB0aGluay4KPiA+Pgo+ID4+IFllYWggc2lu
Y2UgaXQncyBub3QgYW4gQUJJIGlzc3VlIG9uIGFybTY0IHBsYXRmb3JtcyB3aGVyZSBRVEVFIHJ1
bnMsIHNvOgo+ID4+Cj4gPj4gUmV2aWV3ZWQtYnk6IFN1bWl0IEdhcmcgPHN1bWl0LmdhcmdAb3Nz
LnF1YWxjb21tLmNvbT4KPiA+Pgo+ID4+Pj4KPiA+Pj4+IFRoYW5rcywKPiA+Pj4+IEplbnMKPiA+
Pj4+Cj4gPj4+Cj4gPj4+IEkgYWdyZWUuIFdlIHNob3VsZCB0YWtlIHRoaXMgcGF0Y2guIEFzIG5v
dGVkLCB0aGVyZSBhcmUgbm90IG1hbnkKPiA+Pj4gY2xpZW50cyByZWx5aW5nIG9uIGl0IHlldCwg
c28gdXBkYXRpbmcgdGhlIHVzZXJzcGFjZSBzaG91bGQKPiA+Pj4gYmUgc3RyYWlnaHRmb3J3YXJk
Lgo+ID4+Cj4gPj4gWW91IHNob3VsZCByYXRoZXIgdGVzdCB3aXRob3V0IGFueSB1c2Vyc3BhY2Ug
bGlicmFyeSB1cGRhdGUgdG8gdGVzdCBpdCdzCj4gPj4gbm90IGFuIEFCSSBpc3N1ZS4gSnVzdCBm
b3IgY29ycmVjdG5lc3Mgc2FrZSwgeW91IGNhbiB1cGRhdGUgdGhlIGxpYnJhcnkKPiA+PiB0b28u
Cj4gPj4KPiA+Cj4gPiBJJ2xsIHRha2UgdGhlIHRpbWUgdG8gdGVzdCBpdCBhdCBzb21lIHBvaW50
IHRoaXMgd2VlayBib3RoIHdpdGggYW5kIHdpdGhvdXQgdXBkYXRpbmcKPiA+IHRoZSBsaWJyYXJ5
IEFCSS4KPiA+Cj4KPiBTdW1taXQsIHRoYXQgd2FzIHRoZSBwbGFuIGZyb20gdGhlIGJlZ2lubmlu
ZywgdGhhdCdzIHdoeSBJIGRpZCBub3QgYWRkICJSZXZpZXdlZC1ieToiCj4gaW4gdGhlIGZpcnN0
IHBsYWNlLiBUaGFua3MgSGFyc2hhbCBmb3Igdm9sdW50ZWVyaW5nLgoKQXJlIHdlIGdvb2Qgd2l0
aCB0aGlzIHBhdGNoIG5vdz8KCkNoZWVycywKSmVucwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
