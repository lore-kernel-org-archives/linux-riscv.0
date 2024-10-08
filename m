Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7F5CED24D
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 00:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJtKOiofHWbWqbbKi92WxbDruw3jJuIpRHt0AAasPI4=; b=tuhTkxDTMbsv5v
	ZxTQOMGGvIwtyM9DdMEe1qJqmwO2DbsMTBqJRq2psSW4g7vTk7oF8xMRckSqKHDzI3inIh6MKz/8C
	Rm8L9aOJ/fre66/MRwzc3s9Fs4/akOGTVK1H9gbJxIwq65igS8a0TRN1s+bWnJB2zaP+rooRQ9/K8
	GXeqTKzbrXa8IcPAwXYNooe/vnCMpXcVZrohe61jM26HiAPxO+YhdBZ6tHi7KfAUqhrW5I1L0miJR
	s4sGKX0dcM4VpEwHUTvU8YGWMK7M0y5ck29QHVj4WhL/tSFMi3OFMKn5TqTuSeHZ3OKKn1bkeoAql
	+zX4ThbCN0rgs+Y4vxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxyMc-000000048Cn-239D;
	Tue, 08 Oct 2024 00:46:10 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxyMV-000000048C2-3EGJ;
	Tue, 08 Oct 2024 00:46:08 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-50c937b92d9so892815e0c.2;
        Mon, 07 Oct 2024 17:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728348362; x=1728953162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwrZU7+WRXa2SBCQtrdGDwpBC/7fI0xHGdzxrY4bl/4=;
        b=fh5nQpDAmpc5Cnb5qK291rsYUrW+o0fYzJGXpF+hyEfXNqSzua1ad8jdDjF009aw3g
         4CYjJTDcSBrxMhCJicmDQxtzyF4LR0s2RGPQqmt/DEA0xVQMJe5lHkym1suCA50rCv7z
         aXsAY9bIXNnoiA5b+FAdnmKWTCeoQ1+ponquE7Wazozwv5rFDn717k+Je3ed2xjNLZIb
         +3ncCV9vnFjCBZjwbbaVc4jh7xOPooKVmbQ761VAmqo83LjbTlcTVQlU9ooxMKqafbi9
         4NLnXfSGQ6JcZ56XOoXocxDvQZaY8RYQaLooZlZisBA6yJIsuMl3zVF1ojXCSEZGCmJC
         hajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728348362; x=1728953162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwrZU7+WRXa2SBCQtrdGDwpBC/7fI0xHGdzxrY4bl/4=;
        b=lgijIaFnnBy7wAUQ9Pv2hGu0wqt83OPUDggWsy6i+iUxtI/fnn+tWMIE73qu+djm+g
         wD+A6YSyhYvhYXMbRo33Evi54JX97prVh74PiPEiMZuuXyMCzjIzpm1XPPe3ZZJAiMxl
         MAelbqsa9lk4gnB27fMSHqdTDuP1J9MZPzqmqm/Nt+5cfave/JMgU6d2OcP8VAvNCEAF
         51Nw4GFvb/zxSIQwL/9Mk2YeRPP0jkeDWYG/wUpstjYP/8x7WuPOIlQUQJ9tWHk10C0u
         G2sYV8U6/ZbqNEFaompf+pCRs7pWXn1IXSFx5wmLPVNZQyRqODEv+N3UziLyVJfSjYYe
         Ed+A==
X-Forwarded-Encrypted: i=1; AJvYcCUTExDqoFSHabJE4s6cSvE15+ywH/0CK8Qyw18TPQfC/77X+KmOnFD9hasw16l+bpoJunlRIFEdSXsv2Jk=@lists.infradead.org, AJvYcCWh8uDgFKSsQGcehRZcXr6MYUJz+syYEIWb98QS2xZ6u02NwkGucZ9B/aJ9nDU6AyFZfOx0BRrd36E=@lists.infradead.org
X-Gm-Message-State: AOJu0YysXaH5JjP3EJh1aDIs63wJLpUvrwxZ3kVXDT6XhLAmenP82lEi
	ZayliOCZVvVBwo3PSz7HAnDjvI6qonQgh2Y7u7IQkaCSdeu51VguQUD3vvzunmk2ST+bQSy89uf
	0vhb33RKSvnqcnxorJ1UzNU/vMQs=
X-Google-Smtp-Source: AGHT+IHSJlvK4jZXDTbKT7zFv1I0YNJsGBRL7BUreec71rnnZExDUt435St1qHWdGUc4qJLEHqo7Brx0xwV9I6zN6Oo=
X-Received: by 2002:a05:6102:440b:b0:4a3:c830:81e9 with SMTP id
 ada2fe7eead31-4a40574966fmr11623307137.6.1728348362222; Mon, 07 Oct 2024
 17:46:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240916181633.366449-1-heinrich.schuchardt@canonical.com>
 <20240917-f45624310204491aede04703@orel> <15c359a4-b3c1-4cb0-be2e-d5ca5537bc5b@canonical.com>
 <20240917-b13c51d41030029c70aab785@orel> <8b24728f-8b6e-4c79-91f6-7cbb79494550@canonical.com>
 <20240918-039d1e3bebf2231bd452a5ad@orel> <CAFEAcA-Yg9=5naRVVCwma0Ug0vFZfikqc6_YiRQTrfBpoz9Bjw@mail.gmail.com>
 <bab7a5ce-74b6-49ae-b610-9a0f624addc0@canonical.com> <CAFEAcA-L7sQfK6MNt1ZbZqUMk+TJor=uD3Jj-Pc6Vy9j9JHhYQ@mail.gmail.com>
 <f1e41b95-c499-4e06-91cb-006dcd9d29e6@canonical.com> <CAFEAcA_ePVwnpVVWJSx8=-8v2h_z2imfSdyAZd62RhXaZUTojA@mail.gmail.com>
In-Reply-To: <CAFEAcA_ePVwnpVVWJSx8=-8v2h_z2imfSdyAZd62RhXaZUTojA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 8 Oct 2024 10:45:36 +1000
Message-ID: <CAKmqyKPoom+iQbrNn7xuebRdd9DfX3GAJQQM+8fswEqfRi3e_A@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv: enable floating point unit
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_174603_856856_9D2A70CB 
X-CRM114-Status: GOOD (  33.91  )
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

T24gVGh1LCBTZXAgMTksIDIwMjQgYXQgMTozNOKAr0FNIFBldGVyIE1heWRlbGwgPHBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIDE4IFNlcHQgMjAyNCBhdCAxNDo0
OSwgSGVpbnJpY2ggU2NodWNoYXJkdAo+IDxoZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5j
b20+IHdyb3RlOgo+ID4KPiA+IE9uIDE4LjA5LjI0IDE1OjEyLCBQZXRlciBNYXlkZWxsIHdyb3Rl
Ogo+ID4gPiBPbiBXZWQsIDE4IFNlcHQgMjAyNCBhdCAxNDowNiwgSGVpbnJpY2ggU2NodWNoYXJk
dAo+ID4gPiA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPiB3cm90ZToKPiA+ID4+
IFRoYW5rcyBQZXRlciBmb3IgbG9va2luZyBpbnRvIHRoaXMuCj4gPiA+Pgo+ID4gPj4gUUVNVSdz
IGNwdV9zeW5jaHJvbml6ZV9hbGxfcG9zdF9pbml0KCkgYW5kCj4gPiA+PiBkb19rdm1fY3B1X3N5
bmNocm9uaXplX3Bvc3RfcmVzZXQoKSBib3RoIGVuZCB1cCBpbgo+ID4gPj4ga3ZtX2FyY2hfcHV0
X3JlZ2lzdGVycygpIGFuZCB0aGF0IGlzIGxvbmcgYWZ0ZXIgTGludXgKPiA+ID4+IGt2bV9hcmNo
X3ZjcHVfY3JlYXRlKCkgaGFzIGJlZW4gc2V0dGluZyBzb21lIEZQVSBzdGF0ZS4gU2VlIHRoZSBv
dXRwdXQKPiA+ID4+IGJlbG93Lgo+ID4gPj4KPiA+ID4+IGt2bV9hcmNoX3B1dF9yZWdpc3RlcnMo
KSBjb3BpZXMgdGhlIENTUnMgYnkgY2FsbGluZwo+ID4gPj4ga3ZtX3Jpc2N2X3B1dF9yZWdzX2Nz
cigpLiBIZXJlIHdlIGNhbiBmaW5kOgo+ID4gPj4KPiA+ID4+ICAgICAgIEtWTV9SSVNDVl9TRVRf
Q1NSKGNzLCBlbnYsIHNzdGF0dXMsIGVudi0+bXN0YXR1cyk7Cj4gPiA+Pgo+ID4gPj4gVGhpcyBj
YWxsIGVuYWJsZXMgb3IgZGlzYWJsZXMgdGhlIEZQVSBhY2NvcmRpbmcgdG8gdGhlIHZhbHVlIG9m
Cj4gPiA+PiBlbnYtPm1zdGF0dXMuCj4gPiA+Pgo+ID4gPj4gU28gd2UgbmVlZCB0byBzZXQgdGhl
IGRlc2lyZWQgc3RhdGUgb2YgdGhlIGZsb2F0aW5nIHBvaW50IHVuaXQgaW4gUUVNVS4KPiA+ID4+
IEFuZCB0aGlzIGlzIHdoYXQgdGhlIGN1cnJlbnQgcGF0Y2ggZG9lcyBib3RoIGZvciBUQ0cgYW5k
IEtWTS4KPiA+ID4KPiA+ID4gSWYgaXQgZG9lcyB0aGlzIGZvciBib3RoIFRDRyBhbmQgS1ZNIHRo
ZW4gSSBkb24ndCB1bmRlcnN0YW5kCj4gPiA+IHRoaXMgYml0IGZyb20gdGhlIGNvbW1pdCBtZXNz
YWdlOgo+ID4gPgo+ID4gPiAjIFdpdGhvdXQgdGhpcyBwYXRjaCBFREsgSUkgd2l0aCBUTFMgZW5h
YmxlZCBjcmFzaGVzIHdoZW4gaGl0dGluZyB0aGUgZmlyc3QKPiA+ID4gIyBmbG9hdGluZyBwb2lu
dCBpbnN0cnVjdGlvbiB3aGlsZSBydW5uaW5nIFFFTVUgd2l0aCAtLWFjY2VsIGt2bSBhbmQgcnVu
cwo+ID4gPiAjIGZpbmUgd2l0aCAtLWFjY2VsIHRjZy4KPiA+ID4KPiA+ID4gU2hvdWxkbid0IHRo
aXMgZ3Vlc3QgY3Jhc2ggdGhlIHNhbWUgd2F5IHdpdGggYm90aCBLVk0gYW5kIFRDRyB3aXRob3V0
Cj4gPiA+IHRoaXMgcGF0Y2gsIGJlY2F1c2UgdGhlIEZQVSBzdGF0ZSBpcyB0aGUgc2FtZSBmb3Ig
Ym90aD8KPgo+ID4gQnkgZGVmYXVsdCBgcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtLWFjY2VsIHRjZ2Ag
cnVucyBPcGVuU0JJIGFzIGZpcm13YXJlCj4gPiB3aGljaCBlbmFibGVzIHRoZSBGUFUuCj4gPgo+
ID4gSWYgeW91IHdvdWxkIGNob29zZSBhIGRpZmZlcmVudCBTQkkgaW1wbGVtZW50YXRpb24gd2hp
Y2ggZG9lcyBub3QgZW5hYmxlCj4gPiB0aGUgRlBVIHlvdSBjb3VsZCBleHBlcmllbmNlIHRoZSBz
YW1lIGNyYXNoLgo+Cj4gQWgsIHNvIEtWTSB2cyBUQ0cgaXMgYSByZWQgaGVycmluZyBhbmQgaXQn
cyBhY3R1YWxseSAic29tZSBndWVzdAo+IGZpcm13YXJlIGRvZXNuJ3QgZW5hYmxlIHRoZSBGUFUg
aXRzZWxmLCBhbmQgaWYgeW91IHJ1biB0aGF0IHRoZW4gaXQgd2lsbAo+IGZhbGwgb3Zlciwgd2hl
dGhlciB5b3UgZG8gaXQgaW4gS1ZNIG9yIFRDRyIgPyBUaGF0IG1ha2VzIG1vcmUgc2Vuc2UuCj4K
PiBJIGRvbid0IGhhdmUgYW4gb3BpbmlvbiBvbiB3aGV0aGVyIHlvdSB3YW50IHRvIGRvIHRoYXQg
b3Igbm90LAo+IG5vdCBrbm93aW5nIHdoYXQgdGhlIHJpc2N2IGFyY2hpdGVjdHVyZSBtYW5kYXRl
cy4gKE9uIEFybSB0aGlzCj4gd291bGQgYmUgZmFpcmx5IGNsZWFybHkgInRoZSBndWVzdCBzb2Z0
d2FyZSBpcyBicm9rZW4gYW5kCj4gc2hvdWxkIGJlIGZpeGVkIiwgYnV0IHRoYXQncyBiZWNhdXNl
IHRoZSBBcm0gYXJjaGl0ZWN0dXJlCj4gc2F5cyB5b3UgY2FuJ3QgYXNzdW1lIHRoZSBGUFUgaXMg
ZW5hYmxlZCBmcm9tIHJlc2V0LikKClJJU0MtViBpcyB0aGUgc2FtZS4gU2VjdGlvbiAiMy40IFJl
c2V0IiBzdGF0ZXMgdGhhdDoKCiJBbGwgb3RoZXIgaGFydCBzdGF0ZSBpcyBVTlNQRUNJRklFRC4i
ICh0aGUgcGFyYWdyYXBoIGRvZXNuJ3QgbWVudGlvbgp0aGUgRlMgc3RhdGUpLgoKU28gaXQncyB1
bnNwZWNpZmllZCB3aGF0IHRoZSB2YWx1ZSBpcyBvbiByZXNldC4gR3Vlc3Qgc29mdHdhcmUKc2hv
dWxkbid0IGFzc3VtZSBhbnl0aGluZyBhYm91dCBpdCBhbmQgaXQgZG9lcyBzZWVtIGxpa2UgYSBn
dWVzdApzb2Z0d2FyZSBidWcuCgpJbiBzYXlpbmcgdGhhdCwgd2UgYXJlIGFsbG93ZWQgdG8gc2V0
IGl0IHRoZW4gYXMgdGhlIHNwZWMgZG9lc24ndCBzYXkKaXQgc2hvdWxkIGJlIDAuIFNvIHNldHRp
bmcgaXQgdG8gMHgwMSAoSW5pdGlhbCkgZG9lc24ndCBzZWVtIGxpa2UgYQpiYWQgaWRlYSwgYXMg
dGhlIG5hbWUga2luZCBvZiBpbXBsaWVzIHRoYXQgaXQgc2hvdWxkIGJlIDB4MDEgb24gcmVzZXQK
CkFsaXN0YWlyCgo+Cj4gSSBkbyB0aGluayB0aGUgY29tbWl0IG1lc3NhZ2UgY291bGQgdXNlIGNs
YXJpZmljYXRpb24gdG8KPiBleHBsYWluIHRoaXMuCj4KPiB0aGFua3MKPiAtLSBQTU0KPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
