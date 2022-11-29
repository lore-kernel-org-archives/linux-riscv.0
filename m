Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1741CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 19:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EdJVtsr60Zr+h5eJx2K5hNlu9IcM2caukGyJWxgyl1Y=; b=36FNQYSuVGZ8O35t4rDs5JYPLb
	5ZPSVTLzvnRlL7vTu1Eur9cl3RGJzO6o8YeJU7948YznjWbwHL8CShSvd9LvWBA8ikAC5Rl7Cl5hd
	5VU/0oGNy3bbTp2QEXVTngcPjrq4UCS962qZfXu+KIrYsHWTEgk43A4bFsgRXw5/r9KKUTQ6WYj9C
	Am178GIUoG0ansekrjvIUks10Bd2hxwQHkHvqiBMgurwQGM1GFcsVxdtTv5hs4j6KA7NOFSy+iuuR
	N1pgeE4KoWxrwEAVHNS0RVHfQi6eJntB/0dSn05nn4D27AWK/2QFf5sAo8ZnU7l7noGgLU7eggPPL
	iD0l+I/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p06OW-00B80h-SN; Tue, 29 Nov 2022 19:35:52 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p06OR-00B7vW-VK
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 19:35:51 +0000
Received: by mail-pg1-x532.google.com with SMTP id 136so13998406pga.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 11:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jeNLKahm+Am4JitgBj5bDl+MD2j2cYUsQaMLMrRxdls=;
        b=lf5UF//via5hAuw5nJTea573oTAxuhWoLW8Xnv6RgNlICEOxR/f3wTb44Yd/FyOiGH
         3ksl/fs4063vcHHXr+2WXy1DAT5OLb/d5iuORaHelsNPAZSPjYL2Mi/DFgMW19kURdbN
         ryEZP7tilrREc7bwCyHJN0f1jTgo731i4m3TGFsV4Y+QhEcurVHOf8+6X5FA3lihX0Pe
         e9/8SpO6WBskn2fdYmJYXPH2kbT/JXV1CKbWS9UD1WWrDnodAZJxupGH7d3PTL3MgP/N
         gFRqQL2XttqQfgEA7Kmex2dPswIgBcx2PJtIhEnvDZ3eSRC+15pVAJ2DP+EibB7i5Ytv
         Hd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeNLKahm+Am4JitgBj5bDl+MD2j2cYUsQaMLMrRxdls=;
        b=V6bI/7oSDeZw9o2ssxcTnvfznuM+NxCYQ3PhSdkMdpd+O2EzgZUuN54L3m3jM5sb1R
         ZZGhj5EBKwTdLz+fCyVY4g8lRqnXHFSNnbDA6naZJkXdg0QPIJOqjDtVeyVFqyIzpUcP
         TZZ3GAF1zmguaTGbpVFM8KT/yXYNm6D90dOLupsduWWtTqQoAkhN4OXKVF1GGym0Wzpk
         T/UBMLd1gQ30Lg/f+RBsBMV8lFpB7lV3jqx9ro7jMnhwz6oMc3escuqFW/5Y+2sSML/W
         IZXiANAKJ8NcZYIb/YuoZX2JGC69D9WY9BORggU9PZhh80VdKXIUBZZfHcd/sBcMpJEq
         O+yw==
X-Gm-Message-State: ANoB5pkpGSVeXaDsEVrzYvlYaINRBhLwCIoNLApzcTChh5RgfylgofqI
	pw3ZVkpeLnEOutHwip1vBHzKHg==
X-Google-Smtp-Source: AA0mqf49DxGKzuKOBJZvTLj9WYNEswvNMnFtDsF9yIjrVj8vvQAAzkvWlTEbV218qkjAAZ2eZeFobg==
X-Received: by 2002:a62:6205:0:b0:56c:14a5:2245 with SMTP id w5-20020a626205000000b0056c14a52245mr38471012pfb.12.1669750544170;
        Tue, 29 Nov 2022 11:35:44 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id f30-20020a631f1e000000b004351358f056sm8719174pgf.85.2022.11.29.11.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 11:35:43 -0800 (PST)
Date: Tue, 29 Nov 2022 11:35:43 -0800 (PST)
X-Google-Original-Date: Tue, 29 Nov 2022 11:35:33 PST (-0800)
Subject: Re: [QUERY]: Adding support for a platform
In-Reply-To: <CA+V-a8vT3AjnU1-s0k7ff0Y7WLofpHYnJPF+mKVnUspsrPvQtw@mail.gmail.com>
CC: binutils@sourceware.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: prabhakar.csengg@gmail.com
Message-ID: <mhng-17a43ac8-4700-48e4-9660-6f967328e8ab@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_113548_265125_7BF70407 
X-CRM114-Status: GOOD (  38.16  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyOSBOb3YgMjAyMiAxMToyODoxMSBQU1QgKC0wODAwKSwgcHJhYmhha2FyLmNzZW5n
Z0BnbWFpbC5jb20gd3JvdGU6Cj4gSGkgUGFsbWVyLAo+Cj4gT29wcyBJIHNob3VsZCBoYXZlIGlu
Y2x1ZGVkIGxpbnV4LXJpc2N2IHRvIHRoZSBDQyBsaXN0IGhlcmUgKGRvaW5nIGl0IG5vdykKPgo+
IE9uIFR1ZSwgTm92IDI5LCAyMDIyIGF0IDc6MjAgUE0gUGFsbWVyIERhYmJlbHQgPHBhbG1lckBk
YWJiZWx0LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFR1ZSwgMjkgTm92IDIwMjIgMTE6MTY6MjkgUFNU
ICgtMDgwMCksIGJpbnV0aWxzQHNvdXJjZXdhcmUub3JnIHdyb3RlOgo+PiA+IEhpIEFsbCwKPj4g
Pgo+PiA+IElmIHRoaXMgaXMgbm90IHRoZSByaWdodCBwbGFjZSB0byBhc2sgdGhpcyBxdWVzdGlv
biBwbGVhc2UgbGV0IG1lIGtub3cuCj4+ID4KPj4gPiBTbyB3ZSBoYXZlIGEgUklTQ1YgcGxhdGZv
cm0gKFJlbmVzYXMgUlovRml2ZSkgZm9yIHdoaWNoIHdlIG5lZWQgdG8KPj4gPiBhZGp1c3QgdGhl
IFRFWFRfU1RBUlRfQUREUi4gU28gYmVsb3cgYXJlIG15IHF1ZXJpZXM6Cj4+ID4gKiBXaGF0IGlz
IHRoZSBwcm9jZWR1cmUgZm9yIHVwc3RyZWFtaW5nPwo+PiA+ICogQXJlIHBhdGNoZXMgYWNjZXB0
ZWQgZm9yIGluZGl2aWR1YWwgcGxhdGZvcm1zIChmb3IgYWRqdXN0aW5nIFRFWFRfU1RBUlRfQURE
Uik/Cj4+Cj4+IElzIHRoaXMgc3RpbGwgcmVsYXRlZCB0byB0aGF0IGJ1ZyB3aXRoIHRoZSBzdGF0
aWMgYmluYXJpZXMgeW91J2QKPj4gbWVudGlvbmVkIGJlZm9yZT8gIEkgdGhpbmsgd2UnZCByZWFs
bHkgbmVlZCB0byBmaWd1cmUgb3V0IHRoZSByb290IGNhdXNlCj4+IGJlZm9yZSB3ZSBjYW4gbWFr
ZSBhIHJlYXNvbmVkIGRlY2lzaW9uIGhlcmUsIG15IGd1ZXNzIHdvdWxkIGJlIHRoYXQKPj4gY2hh
bmdpbmcgVEVYVF9TVEFSVF9BRERSIGp1c3Qgd29ya3MgYXJvdW5kIHRoZSByZWFsIGJ1Zy4KPj4K
PiBCZWxvdyBpcyB0aGUgcm9vdCBjYXVzZSBhbmQgdGhlIHNvbHV0aW9uOgo+Cj4gVEVYVF9TVEFS
VF9BRERSIGlzIHRoZSBzdGFydCBvZiB0aGUgdGV4dCBzZWdtZW50IG9mIGFuIGFwcGxpY2F0aW9u
Lgo+IFRoaXMgaXMgYmVpbmcgc2V0IHRvIDB4MTAwMDAgZm9yIFJJU0NWIHBsYXRmb3Jtcy4KPgo+
IFNvIHdoZW4gYW4gYXBwbGljYXRpb24gaXMgY29tcGlsZWQgd2l0aCB0aGUgc3RhdGljIGZsYWcg
dGhlIGxvYWQgd291bGQKPiBzdGFydCBmcm9tIDB4MTAwMDAgLSB4eXogKGRlcGVuZGluZyBvbiBz
aXplIG9mIHRoZSBhcHBsaWNhdGlvbikKPgo+IEVudHJ5IHBvaW50IDB4MTAxYzAKPiBUaGVyZSBh
cmUgNSBwcm9ncmFtIGhlYWRlcnMsIHN0YXJ0aW5nIGF0IG9mZnNldCA2NFByb2dyYW0gSGVhZGVy
czoKPiAgIFR5cGUgICAgICAgICAgIE9mZnNldCAgICAgICAgICAgICBWaXJ0QWRkciAgICAgICAg
ICAgUGh5c0FkZHIKPiAgICAgICAgICAgICAgICAgIEZpbGVTaXogICAgICAgICAgICBNZW1TaXog
ICAgICAgICAgICAgIEZsYWdzICBBbGlnbgo+ICAgTE9BRCAgICAgICAgICAgMHgwMDAwMDAwMDAw
MDAwMDAwIDB4MDAwMDAwMDAwMDAxMDAwMCAweDAwMDAwMDAwMDAwMTAwMDAKPiAgICAgICAgICAg
ICAgICAgIDB4MDAwMDAwMDAwMDA1OWI0OCAweDAwMDAwMDAwMDAwNTliNDggIFIgRSAgICAweDEw
MDAKPiAgIExPQUQgICAgICAgICAgIDB4MDAwMDAwMDAwMDA1OWI2MCAweDAwMDAwMDAwMDAwNmFi
NjAgMHgwMDAwMDAwMDAwMDZhYjYwCj4gICAgICAgICAgICAgICAgICAweDAwMDAwMDAwMDAwMDFm
NjggMHgwMDAwMDAwMDAwMDAzNTI4ICBSVyAgICAgMHgxMDAwCj4KPiBTbyBmb3IgdGhlIGFib3Zl
IGFwcGxpY2F0aW9uIHdoaWNoIGlzIGNvbXBpbGVkIHN0YXRpY2FsbHkgd2UgY2FuIHNlZQo+IHRo
ZSBlbnRyeSBwb2ludCBpcyAweDEwMWMwIGFuZCBsb2FkIDB4MDAwMDAwMDAwMDAxMDAwMC4KPgo+
IEFuZGVzIEFYNDVNUCBjb3JlcyBoYXZlIGxvY2FsIG1lbW9yeSBJTE0gYW5kIERMTSB0aGF0IGFy
ZSBtYXBwZWQgaW4KPiB0aGUgcmVnaW9uIEjigJkwXzAwMDNfMDAwMCAtIEjigJkwXzAwMDRfRkZG
RiBvbiB0aGUgUlovRml2ZSBTb0MuIFdoZW4gdGhlCj4gdmlydHVhbCBhZGRyZXNzIGZhbGxzIGlu
IHRoaXMgcmFuZ2UgdGhlIE1NVSBkb2Vzbid0IHRyaWdnZXIgYSBwYWdlCj4gZmF1bHQgYW5kIGFz
c3VtZXMgdGhlIHZpcnR1YWwgYWRkcmVzcyBhcyBwaHlzaWNhbCBhZGRyZXNzIGFuZCBoZW5jZQo+
IHRoZSBhcHBsaWNhdGlvbiBmYWlscyB0byBydW4gKHBhbmljcyBzb21ld2hlcmUpLgo+Cj4gU28g
dG8gYXZvaWQgdGhpcyBpc3N1ZSB3ZSBzZXQgdGhlIFRFWFRfU1RBUlRfQUREUiB0byAweDUwMDAw
IHNvIHRoYXQKPiB0aGUgdmlydHVhbCBhZGRyZXNzIG9mIGFueSBzdGF0aWNhbGx5IGNvbXBpbGVk
IGFwcGxpY2F0aW9uIGRvZXMgbm90Cj4gZmFsbCBpbiB0aGUgcmFuZ2Ugb2YgSOKAmTBfMDAwM18w
MDAwIC0gSOKAmTBfMDAwNF9GRkZGLgo+Cj4gRWxmIGZpbGUgdHlwZSBpcyBFWEVDIChFeGVjdXRh
YmxlIGZpbGUpCj4gRW50cnkgcG9pbnQgMHg1MDRlNAo+IFRoZXJlIGFyZSA1IHByb2dyYW0gaGVh
ZGVycywgc3RhcnRpbmcgYXQgb2Zmc2V0IDY0Cj4KPiBQcm9ncmFtIEhlYWRlcnM6Cj4gICBUeXBl
ICAgICAgICAgICBPZmZzZXQgICAgICAgICAgICAgVmlydEFkZHIgICAgICAgICAgIFBoeXNBZGRy
Cj4gICAgICAgICAgICAgICAgICBGaWxlU2l6ICAgICAgICAgICAgTWVtU2l6ICAgICAgICAgICAg
ICBGbGFncyAgQWxpZ24KPiAgIExPQUQgICAgICAgICAgIDB4MDAwMDAwMDAwMDAwMDAwMCAweDAw
MDAwMDAwMDAwNTAwMDAgMHgwMDAwMDAwMDAwMDUwMDAwCj4gICAgICAgICAgICAgICAgICAweDAw
MDAwMDAwMDAwNTdkYzggMHgwMDAwMDAwMDAwMDU3ZGM4ICBSIEUgICAgMHgxMDAwCj4gICBMT0FE
ICAgICAgICAgICAweDAwMDAwMDAwMDAwNTg1YjggMHgwMDAwMDAwMDAwMGE5NWI4IDB4MDAwMDAw
MDAwMDBhOTViOAo+ICAgICAgICAgICAgICAgICAgMHgwMDAwMDAwMDAwMDA0ZWUwIDB4MDAwMDAw
MDAwMDAwNjRiMCAgUlcgICAgIDB4MTAwMAo+ICAgTk9URSAgICAgICAgICAgMHgwMDAwMDAwMDAw
MDAwMTU4IDB4MDAwMDAwMDAwMDA1MDE1OCAweDAwMDAwMDAwMDAwNTAxNTgKPiAgICAgICAgICAg
ICAgICAgIDB4MDAwMDAwMDAwMDAwMDA0NCAweDAwMDAwMDAwMDAwMDAwNDQgIFIgICAgICAweDQK
Pgo+IFNvIG5vdyB3aXRoIHRoZSBmaXggZm9yIHN0YXRpY2FsbHkgY29tcGlsZWQgYXBwbGljYXRp
b25zIHdlIGNhbiBzZWUKPiBpdHMgb2Zmc2V0dGVkIGFuZCBlbnRyeSBwb2ludCBpcyAweDUwNGU0
IGFuZCBsb2FkIGlzIGF0Cj4gMHgwMDAwMDAwMDAwMDUwMDAwLiBTbyB3aXRoIHRoaXMgd2UgYXJl
IGZvciBzdXJlIHRoZSBNTVUgd2lsbCBhbHdheXMKPiB0cmlnZ2VyIGEgcGFnZSBmYXVsdC4KCk9L
LCBjb29sLCB0aGF0IGV4cGxhaW5zIGl0LgoKU28gSSB0aGluayB3ZSBuZWVkIHRvIHRlYWNoIExp
bnV4IGFib3V0IHRoaXMgcGxhdGZvcm0tc3BlY2lmaWMgYmVoYXZpb3IgCnNvIHdlIGNhbiBwcmV2
ZW50IGFueSBhZGRyZXNzZXMgaW4gdGhlIG9mZmVuZGluZyBWQSByYW5nZSBmcm9tIGJlaW5nIAph
bGxvY2F0ZWQuICBUaGVuIGl0J2xsIGJlIHVwIHRvIHVzZXJzcGFjZSB0byBkZWFsIHdpdGggdGhl
IGZhbGxvdXQsIGlmIAp0aGF0IG1lYW5zIGNoYW5naW5nIFRFWFRfU1RBUlRfQUREUkVTUyBpdCBz
ZWVtcyBmaW5lIHRvIG1lLiAgSSdtIG5vdCAKc3VyZSBpZiB0aGVyZSdzIGFscmVhZHkgc29tZSBz
b3J0IG9mIGF1dG9jb25mLXR5cGUgdGhpbmcgdG8gY2hhbmdlIHRoZSAKZGVmYXVsdCBpbiBiaW51
dGlscywgaWYgbm90IHRoZW4gYWRkaW5nIG9uZSBzZWVtcyBsaWtlIHRoZSB3YXkgdG8gZ28uCgpU
aGVuIGl0J3MgdXAgdG8gZGlzdHJvcyB0aGF0IHdhbnQgdG8gcnVuIG9uIHRoZSBpbXBhY3RlZCBo
YXJkd2FyZSB0byAKbWFrZSBzdXJlIHRoZXkgcmVidWlsZCBhbGwgdGhlIGltcGFjdGVkIGJpbmFy
aWVzLiAgSSBkb24ndCB0aGluayB0aGVyZSdzIAphbnkgd2F5IGFyb3VuZCB0aGF0IGZvciB1c2Vy
c3BhY2UtdmlzaWJsZSBlcnJhdGEsIGFuZCBpdCB0aGlzIGNhc2UgdGhlIApjaGVjayBmb3IgaW1w
YWN0ZWQgYmluYXJpZXMgc2VlbXMgcHJldHR5IG1hbmFnZWFibGUgdG8gd3JpdGUgZG93biAoc29t
ZSAKc29ydCBvZiBgZmluZCB8IG9iamR1bXAgfCBncmVwYCB0aGluZyB3b3VsZCBwcm9iYWJseSBk
byBpdCkuCgo+IENoZWVycywKPiBQcmFiaGFrYXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
