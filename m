Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A4CC77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1johGzqwbt+Ig/UvWfQ5rfuW/akAmBD3czB4XOmvrBU=; b=cFY3a21zOIj+xC
	5CUu4ohP8Xcv0phzSj+1+WO7aO2xToMDrwT4xjAar4Xm9CcpixSWeXhgYoaJ2p/GLQ7idhkN5T6BP
	n+F8KP8deTcxV6XxEv+ZtGEhNsYMUYZUZAcPYUawuOTac2G+g2tzpWPbOYMOhUE2LM7QdRbG5FXI0
	q9My4eZuU8F7RL5wrdsiLBptUv1XLkZ4RP4PvJu8wl/hgaqdzt9n+WxgzedHTVILmPU4cNHHt9A2u
	gvKIs/JtRIm6b6Gwfh/biO+bxOwCNdcorUtbNGCS8LRN3066jcKQfrX81noXZK1x8IXhCfeqiFZG8
	R6/viX8ZmaMmCgMWkRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psohB-00CxvL-2h;
	Sat, 29 Apr 2023 17:49:17 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psoh9-00Cxuc-0k
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 17:49:16 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ab25e8a4a7so8879431fa.3
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 10:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682790553; x=1685382553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PojX7n9y1aOGyHyL1VmBDz4x0J1ICc3U37mnhGQzRqw=;
        b=AwozKjrJpvKPO20JkTdZKpX7tX9aSjJb+RjAdf9DpdhiejGiMjOtxO4g2VVLucmke/
         imbfKbMa3zOgsL8SMg5k8bhbuiNJlCzh8i/Y/1V3Gosasoz81oK5F3LGlMfZouoMcVx3
         kEeHH9dYfsW+kes2zyZImeZ/HU6ECCeRricaa3qoJExbX31DuuXOwZTCQQVnkIvRbWrw
         RMIOy/kaztJxJ50Ky3zYcXCN0BCZxhsyULr8DVBTpoJh1Jt3xYEDEfbHgaz9U2+lIzPx
         MSJv+jG1Ej2uQUhNsyXtE99ZgKiDwU/nvWvwhWXtFqBhHz6W22B9ayL+5fD8Ptk6xqHA
         6F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682790553; x=1685382553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PojX7n9y1aOGyHyL1VmBDz4x0J1ICc3U37mnhGQzRqw=;
        b=cP0sAs+v284iejD338TuNVng3fuB+AnqTFZEwovW045akVDSzW/ZPOdnpLxlxm03tx
         N1xYWyuZvESCMKfd6xrTQQL1FgDnPt05DWOhvr68TxdOsht/InAxHWy/WQb8ogS2x+3b
         ktDNw1sUo3BH67XE0WEcpUjB4O+LwQfZhuQiPWbYvEego7OWdpMc2c/FUWWdqF5MrbkH
         fUDaEIAibiaybqVU0UH7FnIuc2Asu4/NmjzdaL7s3xAF9UIcs2S90bk0WY5qn8oahb7O
         ZN3DngNag5T785G86M+mvDor79f7uu24ZznddwaO3ujR4SF77znktcJw5UuOcXe/citH
         LPBA==
X-Gm-Message-State: AC+VfDxkfKc3hf1l6rScyCv8EKRKClUcDVsjyQepCe8wRiD/H/1leOhn
	5HQmOnE+ShPLWD6U25ixRRGdsOcTHVbbqIHg5PEHiw==
X-Google-Smtp-Source: ACHHUZ6lrMlBks2CRDNnvyjN4qwXhBuTJUOiifSCIb9PA3+jMjw2vMD7tZeVz7LwgYa3vAcLAAUMpsmDCcs6DFU2rmg=
X-Received: by 2002:a2e:9d13:0:b0:2a8:c45f:9fd8 with SMTP id
 t19-20020a2e9d13000000b002a8c45f9fd8mr2078374lji.44.1682790553046; Sat, 29
 Apr 2023 10:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230429155247.12131-1-rdunlap@infradead.org> <CALs-HsuG3EFBs60sgiMcPHoE1dF7mhi3GKt=AWvRPaUHAfA88Q@mail.gmail.com>
 <20230429-outboard-hypocrite-983e977103d2@spud>
In-Reply-To: <20230429-outboard-hypocrite-983e977103d2@spud>
From: Evan Green <evan@rivosinc.com>
Date: Sat, 29 Apr 2023 10:48:37 -0700
Message-ID: <CALs-HstrR3Cm3jQKt6dmfYiRRVkAVibAZDtFo0wmXz4LEvRf_A@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: fix sifive and thead section mismatches in errata
To: Conor Dooley <conor@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_104915_268353_6B25BC60 
X-CRM114-Status: GOOD (  15.41  )
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

T24gU2F0LCBBcHIgMjksIDIwMjMgYXQgMTA6MjTigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgMjksIDIwMjMgYXQgMTA6MjE6MzlBTSAt
MDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IE9uIFNhdCwgQXByIDI5LCAyMDIzIGF0IDg6NTLi
gK9BTSBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPiA+Cj4g
PiA+IFdoZW4gQ09ORklHX01PRFVMRVMgaXMgc2V0LCBfX2luaXRfb3JfbW9kdWxlIGJlY29tZXMg
PGVtcHR5PiwgYnV0IHdoZW4KPiA+ID4gQ09ORklHX01PRFVMRVMgaXMgbm90IHNldCwgX19pbml0
X29yX21vZHVsZSBiZWNvbWVzIF9faW5pdC4KPiA+ID4gSW4gdGhlIGxhdHRlciBjYXNlLCBpdCBj
YXVzZXMgc2VjdGlvbiBtaXNtYXRjaCB3YXJuaW5nczoKPiA+ID4KPiA+ID4gV0FSTklORzogbW9k
cG9zdDogdm1saW51eC5vOiBzZWN0aW9uIG1pc21hdGNoIGluIHJlZmVyZW5jZTogcmlzY3ZfZmls
bF9jcHVfbWZyX2luZm8gKHNlY3Rpb246IC50ZXh0KSAtPiBzaWZpdmVfZXJyYXRhX3BhdGNoX2Z1
bmMgKHNlY3Rpb246IC5pbml0LnRleHQpCj4gPiA+IFdBUk5JTkc6IG1vZHBvc3Q6IHZtbGludXgu
bzogc2VjdGlvbiBtaXNtYXRjaCBpbiByZWZlcmVuY2U6IHJpc2N2X2ZpbGxfY3B1X21mcl9pbmZv
IChzZWN0aW9uOiAudGV4dCkgLT4gdGhlYWRfZXJyYXRhX3BhdGNoX2Z1bmMgKHNlY3Rpb246IC5p
bml0LnRleHQpCj4gPiA+Cj4gPiA+IEZpeGVzOiBiYjNmODk0ODdmZDkgKCJSSVNDLVY6IGh3cHJv
YmU6IFJlbW92ZSBfX2luaXQgb24gcHJvYmVfdmVuZG9yX2ZlYXR1cmVzKCkiKQo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPiA+ID4gQ2M6
IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gPiA+IENjOiBQYXVsIFdhbG1zbGV5
IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+Cj4gPiA+IENjOiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQGRhYmJlbHQuY29tPgo+ID4gPiBDYzogQWxiZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5l
ZHU+Cj4gPiA+IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IENjOiBD
b25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+Cj4gPiA+IENjOiBFdmFuIEdyZWVuIDxldmFu
QHJpdm9zaW5jLmNvbT4KPiA+ID4gLS0tCj4gPgo+ID4gVGhhbmtzLCBSYW5keS4gSSdtIGNvbmZ1
c2VkIGF0IGhvdyBJIGRpZG4ndCBzZWUgdGhhdCB3aGVuIEkgbWFkZSB0aGUKPiA+IG9yaWdpbmFs
IGZpeC4gSSBmZWVsIGxpa2UgcmVwcm8gb2YgdGhlc2Ugc2VjdGlvbiBtaXNtYXRjaCBlcnJvcnMK
PiA+IGRlcGVuZCBvbiBzb21lIG90aGVyIGZhY3RvciBJJ20gbm90IHVuZGVyc3RhbmRpbmcuIElu
IGFueSBjYXNlOgo+Cj4gUGVyaGFwcyB5b3UgaGFkIGEgY3V0LWRvd24gY29uZmlnIHRoYXQgZGlk
IG5vdCBlbmFibGUgZWl0aGVyIG9mIHRoZQo+IHJlbGV2YW50IEFSQ0hfIG9wdGlvbnMgdG8gZ2V0
IHRob3NlIGVycmF0YSBjb21waWxlZD8KCkl0IHdhcyB3ZWlyZCwgbXkgb3JpZ2luYWwgImZpeCIg
KHRoZSBvbmUgbGlzdGVkIGluIHRoaXMgRml4ZXMgdGFnKSB3YXMKbmVlZGVkIGJlY2F1c2Ugd2hp
bGUgdGhlIGh3cHJvYmUgc2VyaWVzIHdhcyBjbGVhbiBvbiBQYWxtZXIncyBicmFuY2gsCml0IGdl
bmVyYXRlZCBhICJzZWN0aW9uIG1pc21hdGNoIiBvbiBsaW51eC1uZXh0LiBBcyBub3RlZCBoZXJl
LCBpdCB3YXMKb25seSB3aXRoICFDT05GSUdfTU9EVUxFUywgc28gSSBleHBsaWNpdGx5IHJlbWVt
YmVyIGdlbmVyYXRpbmcgdGhhdApjb25maWcgYW5kIGNoZWNraW5nIGl0IG9uIGxpbnV4LW5leHQg
dG8gZ2VuZXJhdGUgdGhpcyAiZml4IiwgYW5kIGl0CmNhbWUgb3V0IGNsZWFuLiBJdCdzIGxpa2Ug
dGhlIHJvYm90cyBhcmUgZ2V0dGluZyBzbWFydGVyLgotRXZhbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
