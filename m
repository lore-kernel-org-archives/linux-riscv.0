Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EC2C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 21:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWVgjW8Pc8srgiFx9hoszejj+AfLZo13AXWW+8j5J2Q=; b=OeJhk0kEyZ9Wo2
	MXnSJgzxzVgZyeeBthgFfIeFORFQOEXHGPtgFv/1oKYDonhv3tDPR0dDMonlGjUnYzi3c4bqpPGMR
	05D3/7BG0s7BFdeUnSd4+TgksUXnTr+pR/pZsSB2czrvr9UoxAM6LPQL+Sx8BQDghahU51RDP9YLn
	+JQx07Ul1doHL5F07yQE9R5PUCsPVBTFDd8hfg68aVFJJLzP5Kc965QaI/70D/ufWJ++DTOVb4oTP
	K2ZcQ2AZRdILznPo3YgFLAIvVcwj6fcHjllcypwaZXREjq4tT1IJhVEto+O3p5G2oyVowjF4/ytKM
	JEJXMAtS/j7RPMiQDaXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08M3-00BRCF-2s; Tue, 29 Nov 2022 21:41:27 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08Lz-00BRAR-K1
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 21:41:25 +0000
Received: by mail-ed1-x533.google.com with SMTP id z92so11146517ede.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 13:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1ZOpRUq9IKTjBd+YMI41bw1D4YMKvGEKqmuWoLlIuY=;
        b=Ma/SbJwfjdc7DuTaZrMz9WtA2d0mQ8sgJpg23zxb6R64MMXNnSUZ/EyLqeqW2wtMi9
         GZk+d/BdgMs1ribCdHrAbS+u0mMpfVE3DlipKxX3E4k9620i+b83CJMFnQ6MGW1iCJ5z
         9KZyaqTx6ztGgKUBqyUam6T2A8z+kmuz4JI7NjgIoJLRGqj5s8BgQX4hA07tzy0kinwO
         CBoLoQz1doyKrhD5mLuC16kul2cmUFjnIhs5x8s0+qyCw2IqjGAxviq1Cb81VjH5wFJO
         xZ3VNZcKJoD4CjihtobWGoqoPDXvE2tWr3Oflgs5lvwXBUPjxBUDZJQzy5Yy4UtAAx+R
         tUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1ZOpRUq9IKTjBd+YMI41bw1D4YMKvGEKqmuWoLlIuY=;
        b=3Jyrmj/ZVmKmfWv6JoV7bvcBrVPjJMzI0/8WWMhjuSOO7VFb4ygOXp97SYdE4/hDpI
         5fudPXQq08ROee9c7nniuQXn9cuIunQ9WokTzH4HKkZdkrMEdvYtr9tL8D8HkUv9I2JQ
         KfPFOOya+EpAigaXBU4C/BR+OKQq4BsjvrcJ3K/dOrQVNYOtGbHSSURkNXc2jGC/7pZZ
         BLcMR5Y/ZRZzVOMIafqm/aMqtTwMa4Yz6IWBNlgs5VrfGOpOjOVekQRw5JzTitg0vZgr
         WRIR8wIG7vSGqg7NasvOL2z2EFDutYIC/fiUrENglDgfs0AB/dv4uUyRCqeBzVj/LpZ0
         1ROQ==
X-Gm-Message-State: ANoB5pk8b+6zm1djAUQsXJ3W8b7LFKeLtNCkA9BDo1Z/NLECMzGYsavr
	N1Yr88MiatX6UtNknE1GwPAs5dlNfTi2ailROO+7PiZ9YdnIyA==
X-Google-Smtp-Source: AA0mqf4wKnPJM24VqvjCZZQ3vgKw+3yJfwPmoNUTQov8gflJsz3bLz+QQlQBqbTNA0n3bMVGegkM1mR9fIZHYAur70Q=
X-Received: by 2002:a05:6402:2b8b:b0:468:cae8:f5a6 with SMTP id
 fj11-20020a0564022b8b00b00468cae8f5a6mr54887328edb.263.1669758080034; Tue, 29
 Nov 2022 13:41:20 -0800 (PST)
MIME-Version: 1.0
References: <CA++6G0Do001Bo+kxhUNz5T937TYU-K5Y43MH+X=Q2TgFCaxcfQ@mail.gmail.com>
 <mhng-69edea29-43f4-4ef9-9cfe-7108938247fa@palmer-ri-x1c9a>
In-Reply-To: <mhng-69edea29-43f4-4ef9-9cfe-7108938247fa@palmer-ri-x1c9a>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 29 Nov 2022 21:40:53 +0000
Message-ID: <CA+V-a8tQD8gHA9Q2oBNYTAZTMwEik-gGVraEWP47FyFNE+E+9A@mail.gmail.com>
Subject: Re: [QUERY]: Adding support for a platform
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrew Waterman <andrew@sifive.com>, jrtc27@jrtc27.com, binutils@sourceware.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_134123_686170_785FA0F0 
X-CRM114-Status: GOOD (  44.37  )
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

SGkgUGFsbWVyLAoKT24gVHVlLCBOb3YgMjksIDIwMjIgYXQgODo1NyBQTSBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgMjkgTm92IDIwMjIgMTI6
MjE6MzEgUFNUICgtMDgwMCksIEFuZHJldyBXYXRlcm1hbiB3cm90ZToKPiA+IE9uIFR1ZSwgTm92
IDI5LCAyMDIyIGF0IDEyOjEyIFBNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4g
d3JvdGU6Cj4gPj4KPiA+PiBPbiAyOSBOb3YgMjAyMiwgYXQgMTk6MjgsIExhZCwgUHJhYmhha2Fy
IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4gPgo+ID4+ID4gSGkgUGFs
bWVyLAo+ID4+ID4KPiA+PiA+IE9vcHMgSSBzaG91bGQgaGF2ZSBpbmNsdWRlZCBsaW51eC1yaXNj
diB0byB0aGUgQ0MgbGlzdCBoZXJlIChkb2luZyBpdCBub3cpCj4gPj4gPgo+ID4+ID4gT24gVHVl
LCBOb3YgMjksIDIwMjIgYXQgNzoyMCBQTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQu
Y29tPiB3cm90ZToKPiA+PiA+Pgo+ID4+ID4+IE9uIFR1ZSwgMjkgTm92IDIwMjIgMTE6MTY6Mjkg
UFNUICgtMDgwMCksIGJpbnV0aWxzQHNvdXJjZXdhcmUub3JnIHdyb3RlOgo+ID4+ID4+PiBIaSBB
bGwsCj4gPj4gPj4+Cj4gPj4gPj4+IElmIHRoaXMgaXMgbm90IHRoZSByaWdodCBwbGFjZSB0byBh
c2sgdGhpcyBxdWVzdGlvbiBwbGVhc2UgbGV0IG1lIGtub3cuCj4gPj4gPj4+Cj4gPj4gPj4+IFNv
IHdlIGhhdmUgYSBSSVNDViBwbGF0Zm9ybSAoUmVuZXNhcyBSWi9GaXZlKSBmb3Igd2hpY2ggd2Ug
bmVlZCB0bwo+ID4+ID4+PiBhZGp1c3QgdGhlIFRFWFRfU1RBUlRfQUREUi4gU28gYmVsb3cgYXJl
IG15IHF1ZXJpZXM6Cj4gPj4gPj4+ICogV2hhdCBpcyB0aGUgcHJvY2VkdXJlIGZvciB1cHN0cmVh
bWluZz8KPiA+PiA+Pj4gKiBBcmUgcGF0Y2hlcyBhY2NlcHRlZCBmb3IgaW5kaXZpZHVhbCBwbGF0
Zm9ybXMgKGZvciBhZGp1c3RpbmcgVEVYVF9TVEFSVF9BRERSKT8KPiA+PiA+Pgo+ID4+ID4+IElz
IHRoaXMgc3RpbGwgcmVsYXRlZCB0byB0aGF0IGJ1ZyB3aXRoIHRoZSBzdGF0aWMgYmluYXJpZXMg
eW91J2QKPiA+PiA+PiBtZW50aW9uZWQgYmVmb3JlPyAgSSB0aGluayB3ZSdkIHJlYWxseSBuZWVk
IHRvIGZpZ3VyZSBvdXQgdGhlIHJvb3QgY2F1c2UKPiA+PiA+PiBiZWZvcmUgd2UgY2FuIG1ha2Ug
YSByZWFzb25lZCBkZWNpc2lvbiBoZXJlLCBteSBndWVzcyB3b3VsZCBiZSB0aGF0Cj4gPj4gPj4g
Y2hhbmdpbmcgVEVYVF9TVEFSVF9BRERSIGp1c3Qgd29ya3MgYXJvdW5kIHRoZSByZWFsIGJ1Zy4K
PiA+PiA+Pgo+ID4+ID4gQmVsb3cgaXMgdGhlIHJvb3QgY2F1c2UgYW5kIHRoZSBzb2x1dGlvbjoK
PiA+PiA+Cj4gPj4gPiBURVhUX1NUQVJUX0FERFIgaXMgdGhlIHN0YXJ0IG9mIHRoZSB0ZXh0IHNl
Z21lbnQgb2YgYW4gYXBwbGljYXRpb24uCj4gPj4gPiBUaGlzIGlzIGJlaW5nIHNldCB0byAweDEw
MDAwIGZvciBSSVNDViBwbGF0Zm9ybXMuCj4gPj4gPgo+ID4+ID4gU28gd2hlbiBhbiBhcHBsaWNh
dGlvbiBpcyBjb21waWxlZCB3aXRoIHRoZSBzdGF0aWMgZmxhZyB0aGUgbG9hZCB3b3VsZAo+ID4+
ID4gc3RhcnQgZnJvbSAweDEwMDAwIC0geHl6IChkZXBlbmRpbmcgb24gc2l6ZSBvZiB0aGUgYXBw
bGljYXRpb24pCj4gPj4gPgo+ID4+ID4gRW50cnkgcG9pbnQgMHgxMDFjMAo+ID4+ID4gVGhlcmUg
YXJlIDUgcHJvZ3JhbSBoZWFkZXJzLCBzdGFydGluZyBhdCBvZmZzZXQgNjRQcm9ncmFtIEhlYWRl
cnM6Cj4gPj4gPiAgVHlwZSAgICAgICAgICAgT2Zmc2V0ICAgICAgICAgICAgIFZpcnRBZGRyICAg
ICAgICAgICBQaHlzQWRkcgo+ID4+ID4gICAgICAgICAgICAgICAgIEZpbGVTaXogICAgICAgICAg
ICBNZW1TaXogICAgICAgICAgICAgIEZsYWdzICBBbGlnbgo+ID4+ID4gIExPQUQgICAgICAgICAg
IDB4MDAwMDAwMDAwMDAwMDAwMCAweDAwMDAwMDAwMDAwMTAwMDAgMHgwMDAwMDAwMDAwMDEwMDAw
Cj4gPj4gPiAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMDAwMDU5YjQ4IDB4MDAwMDAwMDAwMDA1
OWI0OCAgUiBFICAgIDB4MTAwMAo+ID4+ID4gIExPQUQgICAgICAgICAgIDB4MDAwMDAwMDAwMDA1
OWI2MCAweDAwMDAwMDAwMDAwNmFiNjAgMHgwMDAwMDAwMDAwMDZhYjYwCj4gPj4gPiAgICAgICAg
ICAgICAgICAgMHgwMDAwMDAwMDAwMDAxZjY4IDB4MDAwMDAwMDAwMDAwMzUyOCAgUlcgICAgIDB4
MTAwMAo+ID4+ID4KPiA+PiA+IFNvIGZvciB0aGUgYWJvdmUgYXBwbGljYXRpb24gd2hpY2ggaXMg
Y29tcGlsZWQgc3RhdGljYWxseSB3ZSBjYW4gc2VlCj4gPj4gPiB0aGUgZW50cnkgcG9pbnQgaXMg
MHgxMDFjMCBhbmQgbG9hZCAweDAwMDAwMDAwMDAwMTAwMDAuCj4gPj4gPgo+ID4+ID4gQW5kZXMg
QVg0NU1QIGNvcmVzIGhhdmUgbG9jYWwgbWVtb3J5IElMTSBhbmQgRExNIHRoYXQgYXJlIG1hcHBl
ZCBpbgo+ID4+ID4gdGhlIHJlZ2lvbiBI4oCZMF8wMDAzXzAwMDAgLSBI4oCZMF8wMDA0X0ZGRkYg
b24gdGhlIFJaL0ZpdmUgU29DLiBXaGVuIHRoZQo+ID4+ID4gdmlydHVhbCBhZGRyZXNzIGZhbGxz
IGluIHRoaXMgcmFuZ2UgdGhlIE1NVSBkb2Vzbid0IHRyaWdnZXIgYSBwYWdlCj4gPj4gPiBmYXVs
dCBhbmQgYXNzdW1lcyB0aGUgdmlydHVhbCBhZGRyZXNzIGFzIHBoeXNpY2FsIGFkZHJlc3MgYW5k
IGhlbmNlCj4gPj4gPiB0aGUgYXBwbGljYXRpb24gZmFpbHMgdG8gcnVuIChwYW5pY3Mgc29tZXdo
ZXJlKS4KPiA+PiA+Cj4gPj4gPiBTbyB0byBhdm9pZCB0aGlzIGlzc3VlIHdlIHNldCB0aGUgVEVY
VF9TVEFSVF9BRERSIHRvIDB4NTAwMDAgc28gdGhhdAo+ID4+ID4gdGhlIHZpcnR1YWwgYWRkcmVz
cyBvZiBhbnkgc3RhdGljYWxseSBjb21waWxlZCBhcHBsaWNhdGlvbiBkb2VzIG5vdAo+ID4+ID4g
ZmFsbCBpbiB0aGUgcmFuZ2Ugb2YgSOKAmTBfMDAwM18wMDAwIC0gSOKAmTBfMDAwNF9GRkZGLgo+
ID4+ID4KPiA+PiA+IEVsZiBmaWxlIHR5cGUgaXMgRVhFQyAoRXhlY3V0YWJsZSBmaWxlKQo+ID4+
ID4gRW50cnkgcG9pbnQgMHg1MDRlNAo+ID4+ID4gVGhlcmUgYXJlIDUgcHJvZ3JhbSBoZWFkZXJz
LCBzdGFydGluZyBhdCBvZmZzZXQgNjQKPiA+PiA+Cj4gPj4gPiBQcm9ncmFtIEhlYWRlcnM6Cj4g
Pj4gPiAgVHlwZSAgICAgICAgICAgT2Zmc2V0ICAgICAgICAgICAgIFZpcnRBZGRyICAgICAgICAg
ICBQaHlzQWRkcgo+ID4+ID4gICAgICAgICAgICAgICAgIEZpbGVTaXogICAgICAgICAgICBNZW1T
aXogICAgICAgICAgICAgIEZsYWdzICBBbGlnbgo+ID4+ID4gIExPQUQgICAgICAgICAgIDB4MDAw
MDAwMDAwMDAwMDAwMCAweDAwMDAwMDAwMDAwNTAwMDAgMHgwMDAwMDAwMDAwMDUwMDAwCj4gPj4g
PiAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMDAwMDU3ZGM4IDB4MDAwMDAwMDAwMDA1N2RjOCAg
UiBFICAgIDB4MTAwMAo+ID4+ID4gIExPQUQgICAgICAgICAgIDB4MDAwMDAwMDAwMDA1ODViOCAw
eDAwMDAwMDAwMDAwYTk1YjggMHgwMDAwMDAwMDAwMGE5NWI4Cj4gPj4gPiAgICAgICAgICAgICAg
ICAgMHgwMDAwMDAwMDAwMDA0ZWUwIDB4MDAwMDAwMDAwMDAwNjRiMCAgUlcgICAgIDB4MTAwMAo+
ID4+ID4gIE5PVEUgICAgICAgICAgIDB4MDAwMDAwMDAwMDAwMDE1OCAweDAwMDAwMDAwMDAwNTAx
NTggMHgwMDAwMDAwMDAwMDUwMTU4Cj4gPj4gPiAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMDAw
MDAwMDQ0IDB4MDAwMDAwMDAwMDAwMDA0NCAgUiAgICAgIDB4NAo+ID4+ID4KPiA+PiA+IFNvIG5v
dyB3aXRoIHRoZSBmaXggZm9yIHN0YXRpY2FsbHkgY29tcGlsZWQgYXBwbGljYXRpb25zIHdlIGNh
biBzZWUKPiA+PiA+IGl0cyBvZmZzZXR0ZWQgYW5kIGVudHJ5IHBvaW50IGlzIDB4NTA0ZTQgYW5k
IGxvYWQgaXMgYXQKPiA+PiA+IDB4MDAwMDAwMDAwMDA1MDAwMC4gU28gd2l0aCB0aGlzIHdlIGFy
ZSBmb3Igc3VyZSB0aGUgTU1VIHdpbGwgYWx3YXlzCj4gPj4gPiB0cmlnZ2VyIGEgcGFnZSBmYXVs
dC4KPiA+Pgo+ID4+IFdlbGwgdGhhdOKAmXMganVzdCBhIGJsYXRhbnQgdmlvbGF0aW9uIG9mIHRo
ZSBzcGVjLgo+ID4KPiA+IFJpZ2h0IC0gdGhpcyBpc24ndCBhIHBsYXRmb3JtIHF1aXJrOyBpdCdz
IGEgdmlvbGF0aW9uIG9mIHRoZSBJU0EuCj4gPiBVbmxlc3MgdGhpcyBiZWhhdmlvciBpcyBlbmdh
Z2VkIGJ5IGEgY3VzdG9tIG1vZGUgYml0LCB0aGF0IGlzLCBpbgo+ID4gd2hpY2ggY2FzZSwgaXQg
c2hvdWxkIGp1c3QgYmUgZGlzYWJsZWQgYnkgZGVmYXVsdCBhbmQgbm9uZSBvZiB0aGlzCj4gPiB3
b3VsZCBiZSBhIHByb2JsZW0uICBJZiB0aGUgYmVoYXZpb3IgaXMgdW5jb25kaXRpb25hbGx5IGVu
YWJsZWQsIHRoaXMKPiA+IHNob3VsZCBiZSB0cmVhdGVkIGFzIGFuIGVycmF0dW0uCj4KPiBJIGRv
bid0IHNlZSB0aGlzIGFzIGFueSBkaWZmZXJlbnQgdGhhbiB0aGUgVC1IZWFkIHBhZ2UgdGFibGUg
YXR0cmlidXRlcywKPiB3aGVyZSBpdCB3YXMgbWFkZSBhYnVuZGFudGx5IGNsZWFyIHRoYXQgdmVu
ZG9ycyBzZWxmLWNlcnRpZnkgdGhlaXIKPiBpbXBsZW1lbnRhdGlvbnMgYW5kIHRodXMgYW55dGhp
bmcgZ29lcy4gIEl0IGRvZXNuJ3QgcmVhbGx5IG1hdHRlciBpZiB3ZQo+IGNhbGxlZCBpdCBhbiBl
cnJhdGEsIGJ1Zywgc3VycHJpc2UgZmVhdHVyZSwgdmVuZG9yIGV4dGVuc2lvbiwgd2hhdGV2ZXI7
Cj4gaXQncyBSSVNDLVYgc28gd2UndmUgZ290IHRvIGxpdmUgd2l0aCBpdC4KPgpwaGV3IHRoYXQn
cyBhIHJlbGllZi4KCj4gPj4gV2hhdCBoYXBwZW5zIGlmIGEKPiA+PiBtYWxpY2lvdXMgKG9yIGJ1
Z2d5KSB1c2Vyc3BhY2UgYmluYXJ5IGdvZXMgYW5kIGFjY2Vzc2VzIHVubWFwcGVkIG1lbW9yeQo+
ID4+IGluIHRoYXQgcmFuZ2U/IERvZXMgaXQgYWN0dWFsbHkgZ2V0IGFjY2VzcyB0byB0aGlzIElM
TS9ETE0/IElmIHNvCj4gPj4gdGhhdOKAmXMgYSBnYXBpbmcgc2lkZSBjaGFubmVsLgo+Cj4gSUlV
QyB0aGF0J3MgdGhlIGNhc2UsIGJ1dCB0aGF0J3MganVzdCBmcm9tIHJlYWRpbmcgdGhpcyBwb3N0
Lgo+Cj4gVGhlcmUncyBub3RoaW5nIHdlIGNhbiBkbyB0byBwcmV2ZW50IHZlbmRvcnMgZnJvbSBi
dWlsZGluZyBoYXJkd2FyZSB3aXRoCj4gc2lkZSBjaGFubmVscy4gIEluIHRoaXMgY2FzZSBJIHN1
cHBvc2Ugd2UgY291bGQgc3dhcCBvdXQgdGhlIG1lbW9yeQo+IHJlZ2lvbiBvbiBjb250ZXh0IHN3
aXRjaGVzLCBmcm9tIGEgcXVpY2sgbG9vayBhdCB0aGUgZGF0YXNoZWV0IHRoZXNlIGFyZQo+IHNp
bmdsZS1jb3JlIHNvIHRoYXQnZCBiZSBzYWZlLiAgTXkgZ3Vlc3MgaXMgaXQnZCBiZSB0b28gc2xv
dyBmb3IgdXNlcnMKPiB0byB3YW50IHRoYXQgb24gYnkgZGVmYXVsdCwgYnV0IEkgZG9uJ3QgaGF2
ZSBhbnkgdXNlIGNhc2UgZm9yIHRoaXMgSFcgc28KPiBJJ20gbm90IHN1cmUuCj4KRW5hYmxpbmcg
dGhlIGxvY2FsIG1lbW9yeSAoSUxNL0RMTSkgb24gdGhlIGNvcmUgaXMgYSBzcGVjaWZpY2F0aW9u
Cm9wdGlvbiBhbmQgaXMgZW5hYmxlZCBvbiBSWi9GaXZlIFNvQy4gSSdtIGNoZWNraW5nIHdpdGgg
QW5kZXMgaWYgdGhpcwpjYW4gYmUgZm9yY2VmdWxseSBkaXNhYmxlZC4KVGhlIG9ubHkgdXNlIGNh
c2Ugd291bGQgYmUgdG8gc3BlZWQgdXAgdGhpbmdzIGZvciBzb21lIHNsb3dlciBibG9jawooYnV0
IHNhaWQgdGhhdCBpdHMgdXNlciBhcHBsaWNhdGlvbiBzcGVjaWZpYykKCkNoZWVycywKUHJhYmhh
a2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
