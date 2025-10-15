Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436E6CCD18E
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 01:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVim6SCkKYcvZpJ6aqoKzAvGPCd2GEBSf1xkvj7CyPI=; b=SCDhcXV3L+DQ/Z
	bCZXHsNLLL504oIUOCh0EW/zilV7zjRACVgy0z42UiQLjKTK4430G52nCJIlqNyrd2q+VaxsIaCI+
	X5RnNt03cw4XL9px8cMhW76FLyTZ6Up84JhMP82Of92m4a4i039nm5MG5y/fy59wA3SdRrnvP4yjS
	VSglWMHvFCdpw+TzEnJGsrHnjdPbHiGaaCyVCrovWE8+b84UAQmz+C7Fo6lWt3qbqrU/XQZkjAEsF
	jGOVeJ5JY0ioaiVdfoL6zb/Lpp7eCvyyWQTV+zd98yZHKbze4zCVd/fRvIVwz2TDB5IJdOFPZUD1Y
	0XBhCK3CQwatZUtcihdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8pw8-000000007xF-1zbH;
	Wed, 15 Oct 2025 01:04:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8pw6-000000007wq-2kA9
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 01:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1CC1349233
	for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 01:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2025C19425
	for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 01:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760490253;
	bh=hsP+f9cKGhA88vButIz4+UBSyVEnqSK6E16OcnngsCg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uGWz4eAUXs/wgLNXsteXHzlWTfeidU6Wei43DHeSFI9tr+EiR9AyUzfAYOFFZQX/G
	 6Qwpaplj5pZd9SWHpDifcWg9vv68wUSuqgH9atd2KXncILChAha8357LQW3ltR47pB
	 vzwgLHzmU/7HLy4bXVPuR2eCsKftuBZxLv9lRhVu7A47DUeO+2adfJ3xxaAMPzqH6p
	 3OYnE8Ei6uINEyPVn4icxcdLyx/mSrnAHx1HdZCvmAZP1Qdk5rY14J3uUhsvs869d/
	 WlT1lf9bcUTE5BfTB9l/ShPkAREA0Lfnxr3FiSoZxLUinoT/m98stuCMV6P8Lj2AsU
	 kyfJmsam/Ep/A==
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso3630015e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 18:04:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQoqyPSlYK6yAbDZ1nI8fQXcSNlg/nD1pF8uEGwybmMLlKmi6mXReTKByei7ku+EvdSNsC0r2Sglj8SA==@lists.infradead.org
X-Gm-Message-State: AOJu0YydDFjxQLVkxQ77K7XHkxPonN+KHIB+3njBlSGnp0cQsjYfjiG2
	uUso4sUVZwnZUFGo07JyCF1pAE60s+qscTrRR/UK23Zr3H+H7pX6jI4ogjsd1WC0qqZBaCl1mNA
	xN1g9ed//adIDovvrgi1lN9SWf9I7syA=
X-Google-Smtp-Source: AGHT+IFSO4RoH0+0MmecaoWwkdhHUj1tFSX/MI8r9stNS3G36xBF5yBb2moTJwxkgO/lNRID4MrzmosTYGharRKmJds=
X-Received: by 2002:a7b:cc06:0:b0:46e:7dbf:6cc2 with SMTP id
 5b1f17b1804b1-46fa296e763mr154188005e9.8.1760490251277; Tue, 14 Oct 2025
 18:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251014131032.49616-1-ziyao@disroot.org> <20251014131032.49616-4-ziyao@disroot.org>
In-Reply-To: <20251014131032.49616-4-ziyao@disroot.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 15 Oct 2025 09:03:59 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTdY+dhCH1BVVDaeqZxotxeu6q4NrurBK6Ro4oc3LWwcw@mail.gmail.com>
X-Gm-Features: AS18NWDLo0_MxIYOl-8Amf-z1eZpjh4scWWAn9vzIu7fB631vLox-a9ZNXNTSA0
Message-ID: <CAJF2gTTdY+dhCH1BVVDaeqZxotxeu6q4NrurBK6Ro4oc3LWwcw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] reset: th1520: Prepare for supporting multiple controllers
To: Yao Zi <ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_180414_735550_19E5A7F2 
X-CRM114-Status: GOOD (  21.31  )
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
Cc: Drew Fustini <fustini@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Michal Wilczynski <m.wilczynski@samsung.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgWWFvLAoKT24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgOToxMuKAr1BNIFlhbyBaaSA8eml5YW9A
ZGlzcm9vdC5vcmc+IHdyb3RlOgo+Cj4gVEgxNTIwIFNvQyBpcyBkaXZpZGVkIGludG8gc2V2ZXJh
bCBzdWJzeXN0ZW1zLCBzaGlwcGluZyBkaXN0aW5jdCByZXNldAo+IGNvbnRyb2xsZXJzIHdpdGgg
c2ltaWxhciBjb250cm9sIGxvZ2ljLiBMZXQncyBtYWtlIHJlc2V0IHNpZ25hbCBtYXBwaW5nCj4g
YSBkYXRhIHN0cnVjdHVyZSBzcGVjaWZpYyB0byBvbmUgY29tcGF0aWJsZSB0byBwcmVwYXJlIGZv
ciBpbnRyb2R1Y3Rpb24KPiBvZiBtb3JlIHJlc2V0IGNvbnRyb2xsZXJzIGluIHRoZSBmdXR1cmUu
Ck1vdmUgdGgxNTIwX3Jlc2V0cyB0byAucHJpdiBkYXRhIG1ha2VzIHNlbnNlLCBMR1RNLgoKQWNr
ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IFlh
byBaaSA8eml5YW9AZGlzcm9vdC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvcmVzZXQvcmVzZXQtdGgx
NTIwLmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtdGgxNTIwLmMgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXRo
MTUyMC5jCj4gaW5kZXggMTRkOTY0YTljNmI2Li4yYjY1YTk1ZWQwMjEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9yZXNldC9yZXNldC10aDE1MjAuYwo+ICsrKyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQt
dGgxNTIwLmMKPiBAQCAtMjksMTQgKzI5LDIwIEBACj4gICNkZWZpbmUgVEgxNTIwX0hETUlfU1df
TUFJTl9SU1QgICAgICAgICAgICAgICAgQklUKDApCj4gICNkZWZpbmUgVEgxNTIwX0hETUlfU1df
UFJTVCAgICAgICAgICAgIEJJVCgxKQo+Cj4gK3N0cnVjdCB0aDE1MjBfcmVzZXRfbWFwIHsKPiAr
ICAgICAgIHUzMiBiaXQ7Cj4gKyAgICAgICB1MzIgcmVnOwo+ICt9Owo+ICsKPiAgc3RydWN0IHRo
MTUyMF9yZXNldF9wcml2IHsKPiAgICAgICAgIHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiBy
Y2RldjsKPiAgICAgICAgIHN0cnVjdCByZWdtYXAgKm1hcDsKPiArICAgICAgIGNvbnN0IHN0cnVj
dCB0aDE1MjBfcmVzZXRfbWFwICpyZXNldHM7Cj4gIH07Cj4KPiAtc3RydWN0IHRoMTUyMF9yZXNl
dF9tYXAgewo+IC0gICAgICAgdTMyIGJpdDsKPiAtICAgICAgIHUzMiByZWc7Cj4gK3N0cnVjdCB0
aDE1MjBfcmVzZXRfZGF0YSB7Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgdGgxNTIwX3Jlc2V0X21h
cCAqcmVzZXRzOwo+ICsgICAgICAgc2l6ZV90IG51bTsKPiAgfTsKPgo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IHRoMTUyMF9yZXNldF9tYXAgdGgxNTIwX3Jlc2V0c1tdID0gewo+IEBAIC05MCw3ICs5
Niw3IEBAIHN0YXRpYyBpbnQgdGgxNTIwX3Jlc2V0X2Fzc2VydChzdHJ1Y3QgcmVzZXRfY29udHJv
bGxlcl9kZXYgKnJjZGV2LAo+ICAgICAgICAgc3RydWN0IHRoMTUyMF9yZXNldF9wcml2ICpwcml2
ID0gdG9fdGgxNTIwX3Jlc2V0KHJjZGV2KTsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCB0aDE1MjBf
cmVzZXRfbWFwICpyZXNldDsKPgo+IC0gICAgICAgcmVzZXQgPSAmdGgxNTIwX3Jlc2V0c1tpZF07
Cj4gKyAgICAgICByZXNldCA9ICZwcml2LT5yZXNldHNbaWRdOwo+Cj4gICAgICAgICByZXR1cm4g
cmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPm1hcCwgcmVzZXQtPnJlZywgcmVzZXQtPmJpdCwgMCk7
Cj4gIH0KPiBAQCAtMTAxLDcgKzEwNyw3IEBAIHN0YXRpYyBpbnQgdGgxNTIwX3Jlc2V0X2RlYXNz
ZXJ0KHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsCj4gICAgICAgICBzdHJ1Y3Qg
dGgxNTIwX3Jlc2V0X3ByaXYgKnByaXYgPSB0b190aDE1MjBfcmVzZXQocmNkZXYpOwo+ICAgICAg
ICAgY29uc3Qgc3RydWN0IHRoMTUyMF9yZXNldF9tYXAgKnJlc2V0Owo+Cj4gLSAgICAgICByZXNl
dCA9ICZ0aDE1MjBfcmVzZXRzW2lkXTsKPiArICAgICAgIHJlc2V0ID0gJnByaXYtPnJlc2V0c1tp
ZF07Cj4KPiAgICAgICAgIHJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+bWFwLCByZXNl
dC0+cmVnLCByZXNldC0+Yml0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXNldC0+Yml0KTsKPiBAQCAtMTIwLDExICsxMjYsMTQgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBy
ZWdtYXBfY29uZmlnIHRoMTUyMF9yZXNldF9yZWdtYXBfY29uZmlnID0gewo+Cj4gIHN0YXRpYyBp
bnQgdGgxNTIwX3Jlc2V0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsK
PiArICAgICAgIGNvbnN0IHN0cnVjdCB0aDE1MjBfcmVzZXRfZGF0YSAqZGF0YTsKPiAgICAgICAg
IHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gICAgICAgICBzdHJ1Y3QgdGgxNTIw
X3Jlc2V0X3ByaXYgKnByaXY7Cj4gICAgICAgICB2b2lkIF9faW9tZW0gKmJhc2U7Cj4gICAgICAg
ICBpbnQgcmV0Owo+Cj4gKyAgICAgICBkYXRhID0gZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7
Cj4gKwo+ICAgICAgICAgcHJpdiA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqcHJpdiksIEdG
UF9LRVJORUwpOwo+ICAgICAgICAgaWYgKCFwcml2KQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT01FTTsKPiBAQCAtMTM4LDIyICsxNDcsMzEgQEAgc3RhdGljIGludCB0aDE1MjBfcmVzZXRf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgICAgICAgIGlmIChJU19FUlIo
cHJpdi0+bWFwKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocHJpdi0+bWFwKTsK
Pgo+IC0gICAgICAgLyogSW5pdGlhbGl6ZSBHUFUgcmVzZXRzIHRvIGFzc2VydGVkIHN0YXRlICov
Cj4gLSAgICAgICByZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+bWFwLCBUSDE1MjBfR1BV
X1JTVF9DRkcsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVEgxNTIwX0dQVV9S
U1RfQ0ZHX01BU0ssIDApOwo+IC0gICAgICAgaWYgKHJldCkKPiAtICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiArICAgICAgIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShkZXYtPm9mX25v
ZGUsICJ0aGVhZCx0aDE1MjAtcmVzZXQiKSkgewo+ICsgICAgICAgICAgICAgICAvKiBJbml0aWFs
aXplIEdQVSByZXNldHMgdG8gYXNzZXJ0ZWQgc3RhdGUgKi8KPiArICAgICAgICAgICAgICAgcmV0
ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPm1hcCwgVEgxNTIwX0dQVV9SU1RfQ0ZHLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVEgxNTIwX0dQVV9SU1RfQ0ZH
X01BU0ssIDApOwo+ICsgICAgICAgICAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICB9Cj4KPiAgICAgICAgIHByaXYtPnJjZGV2Lm93
bmVyID0gVEhJU19NT0RVTEU7Cj4gLSAgICAgICBwcml2LT5yY2Rldi5ucl9yZXNldHMgPSBBUlJB
WV9TSVpFKHRoMTUyMF9yZXNldHMpOwo+ICsgICAgICAgcHJpdi0+cmNkZXYubnJfcmVzZXRzID0g
ZGF0YS0+bnVtOwo+ICAgICAgICAgcHJpdi0+cmNkZXYub3BzID0gJnRoMTUyMF9yZXNldF9vcHM7
Cj4gICAgICAgICBwcml2LT5yY2Rldi5vZl9ub2RlID0gZGV2LT5vZl9ub2RlOwo+Cj4gKyAgICAg
ICBwcml2LT5yZXNldHMgPSBkYXRhLT5yZXNldHM7Cj4gKwo+ICAgICAgICAgcmV0dXJuIGRldm1f
cmVzZXRfY29udHJvbGxlcl9yZWdpc3RlcihkZXYsICZwcml2LT5yY2Rldik7Cj4gIH0KPgo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IHRoMTUyMF9yZXNldF9kYXRhIHRoMTUyMF9yZXNldF9kYXRhID0g
ewo+ICsgICAgICAgLnJlc2V0cyA9IHRoMTUyMF9yZXNldHMsCj4gKyAgICAgICAubnVtID0gQVJS
QVlfU0laRSh0aDE1MjBfcmVzZXRzKSwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIHRoMTUyMF9yZXNldF9tYXRjaFtdID0gewo+IC0gICAgICAgeyAuY29tcGF0
aWJsZSA9ICJ0aGVhZCx0aDE1MjAtcmVzZXQiIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0g
InRoZWFkLHRoMTUyMC1yZXNldCIsIC5kYXRhID0gJnRoMTUyMF9yZXNldF9kYXRhIH0sCj4gICAg
ICAgICB7IC8qIHNlbnRpbmVsICovIH0KPiAgfTsKPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
dGgxNTIwX3Jlc2V0X21hdGNoKTsKPiAtLQo+IDIuNTAuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
