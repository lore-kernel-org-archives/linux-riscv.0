Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64386C02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/ZBGC0kCCKJoNjrGcSEF9x0QYLsTqC2E+38De506bI=; b=HImM9WkK8of/oF
	cTpANhaVBSBQzjORtOlP33g1JnchepotmVoTXZ/FHJBBd2TAxkdtb3oEtL+KaIVbq9Nl0bmXPxdNR
	/RPpUNijRW5rvpZPsok1pifbJWEcEINnoq8eER8yloqTGFObEjT4hWwnw8w+7r52Vxt+3skgQeMFA
	7YYq5i+6wHI8jQHPa2lUPkNPtjz/yPQmUy1GQ7UQxzBMvZKwSJMGdYrUSaNBITtCj1JGgX+ry0WRK
	aIHBWxiBVQPXMSRof12r+/qa/46TRaB5oOgwQnPpQRmQ5mvGl3Qm9+5F62lLmhok9j4ozuijrmARB
	bhkHNo3owXaau4U5x5Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9lR-00000007HWv-2jaA;
	Tue, 21 Jan 2025 08:37:37 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9lQ-00000007HWP-01Ky
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 08:37:37 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3ce915a8a25so18886295ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jan 2025 00:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1737448654; x=1738053454; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EErsvLFUMtwyIbJnbfERrawyL1tVSt57dS6Who8TTyY=;
        b=Ewq3APTjmTZD5KMq2D9fwuaEpm3nfokdSvrXqkC0xsn6n2piJzcxe0SCMREh5XNkCt
         8gJaEzUOs78jedBDgXIXezFpV32i8Z/IvVnAtH3NTANeIlvKtGRgni5MaUK5MNXEAsZ9
         Uo5/UwzuGrmzsGZu1cPGzxtYOYbjvWfFj0lmDmCNoZ44c1C5ss9bB8bP6Ghcl42YJWDI
         LWapleEkDpTAPZe7zzvaJo9vDKC+yX9BHdaW9LZW6A1MqUUVD19sAm1Cn8ElwyM5Vgjf
         8sY7ZNnFfOD4xsZE7GcUvJ/dj2KtG0bxqZ39NGciWYhVmWMrTo0QPUhSOmRPdHvRkWEX
         shtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737448654; x=1738053454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EErsvLFUMtwyIbJnbfERrawyL1tVSt57dS6Who8TTyY=;
        b=Vs50dnV3QEMcVRDAnJBxYuNhBNHUgdXxBDyJlNdXUpGm5Cse3L/5GtI+XrzQlBmENY
         8ngF/yjZfPAipEaKNjvdusfU1MDa/bZAKHrpwoa9CxAL3/GCYJ89HaOV4YZ9wViuiDMM
         mZhQ97t2ZUW5K8PyjZh9OGB/W9H0YHv3Kuj1XdTXJtLUlGjdsU/GTUwxrm+J/Wh9wTLO
         UCzns1T81THR/KuUZUTSw02MGuONzGvOKyxhwKcgKXcFtPljTZWTTAVqjlKRlh3S/Lvp
         4GLAcQKJPQY4PAME5WyqxckmjNVZ44Kwi4VjQK+9mZ9DgkXMX6f3gNRi3ls2QIdI3NCI
         ZySw==
X-Forwarded-Encrypted: i=1; AJvYcCUPyhAC9hJhNW8wUybS8lVtZu3PR3h2IhT4mMJsPoXYvGOPu8Y4iGT47+knLNhdLAbXQGzcfis9Sh0KaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWXjsvUCfHUNna/hwJi9biTu8sUPVYaIw+ssXxic9ck3OUxmYN
	oYP5w2NQhtwoflNPEINlffnd1vn7Rodebg1LgvSnDliBAmFRhMFld70eKHPu/Le6MtQjT+xkifW
	cELfFlCEdgge8e7kxRcAx/5MR7V+BphY27dDIqw==
X-Gm-Gg: ASbGnctUYo4ZSvTwe6ozv6lif+v9FxUYEEFCG3u07Cg422fYbHIeUy7++9gL3SNLOiL
	Xyax1gjShofJDGWZ4SvJV3OUwtEPrmxrLToQD/Wn1PceqZ/J4ji86wg==
X-Google-Smtp-Source: AGHT+IEC2oPzCFfgCD9zHXuJFglchxr8YhWRFH5WN/dbnSoPI76AiG7cPO+FnSUDX0oL8rjqJZtBboWg3N3DPymAVwM=
X-Received: by 2002:a05:6e02:1aa8:b0:3cf:6d33:d40d with SMTP id
 e9e14a558f8ab-3cf742812e4mr123041605ab.0.1737448654288; Tue, 21 Jan 2025
 00:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20250115030306.29735-1-zong.li@sifive.com> <20250115030306.29735-3-zong.li@sifive.com>
 <6301d20b-d51d-4f96-94ea-134e065d398e@arm.com> <CANXhq0oDv0b_S=6EmETAUkjQxo3Zz5fZ-yeP-9hHSMW9Ak5=sg@mail.gmail.com>
 <b0dadc40-638e-4f14-8a5c-70c306bc4650@arm.com>
In-Reply-To: <b0dadc40-638e-4f14-8a5c-70c306bc4650@arm.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 21 Jan 2025 16:37:23 +0800
X-Gm-Features: AbW1kvZ71HK_s4sWjLIFCatGdv6WaJXav0vR9gPNHa6MZdgG5R3zyOGc7TZo4Rc
Message-ID: <CANXhq0oqeTJfSsDy0VKhfdeOssO7JVtz=XjZcFiLCbgkxK4zqw@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/riscv: support HPM and interrupt handling
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, will@kernel.org, tjeznach@rivosinc.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	luxu.kernel@bytedance.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_003736_100387_F5F469D6 
X-CRM114-Status: GOOD (  37.29  )
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

T24gRnJpLCBKYW4gMTcsIDIwMjUgYXQgODo0NeKAr1BNIFJvYmluIE11cnBoeSA8cm9iaW4ubXVy
cGh5QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gMjAyNS0wMS0xNyAyOjQ2IGFtLCBab25nIExpIHdy
b3RlOgo+ID4gT24gVGh1LCBKYW4gMTYsIDIwMjUgYXQgNTo1NuKAr0FNIFJvYmluIE11cnBoeSA8
cm9iaW4ubXVycGh5QGFybS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMjAyNS0wMS0xNSAzOjAz
IGFtLCBab25nIExpIHdyb3RlOgo+ID4+PiBJbml0aWFsaXplIHRoZSBQTVUgYW5kIHVuaW5pdGlh
bGl6ZSBpdCB3aGVuIGRyaXZlciBpcyByZW1vdmVkLgo+ID4+PiBJbnRlcnJ1cHQgaGFuZGxpbmcg
aXMgYWxzbyBpbXBsZW1lbnRlZCwgYW5kIHRoZSBoYW5kbGVyIG5lZWRzCj4gPj4+IHRvIGJlIGEg
cHJpbWFyeSBoYW5kbGVyIGluc3RlYWQgb2YgYSB0aHJlYWRlZCBmdW5jdGlvbiBiZWNhdXNlCj4g
Pj4+IHB0X3JlZ3MgaXMgZW1wdHkgd2hlbiB0aHJlYWRpbmcgdGhlIElSUS4gSG93ZXZlciwgcHRf
cmVncyBpcwo+ID4+PiByZXF1aXJlZCBieSBwZXJmX2V2ZW50X292ZXJmbG93Lgo+ID4+Pgo+ID4+
PiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPj4+IFRlc3Rl
ZC1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Cj4gPj4+IC0tLQo+ID4+PiAg
ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgfCA2NSArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA2NSBpbnNlcnRpb25zKCsp
Cj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgYi9k
cml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiA+Pj4gaW5kZXggOGEwNWRlZjc3NGJkLi4yMGFl
OTA0NzE0ODQgMTAwNjQ0Cj4gPj4+IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+
ID4+PiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiA+Pj4gQEAgLTU1Miw2ICs1
NTIsNjIgQEAgc3RhdGljIGlycXJldHVybl90IHJpc2N2X2lvbW11X2ZsdHFfcHJvY2VzcyhpbnQg
aXJxLCB2b2lkICpkYXRhKQo+ID4+PiAgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+ID4+PiAg
ICB9Cj4gPj4+Cj4gPj4+ICsvKgo+ID4+PiArICogSU9NTVUgSGFyZHdhcmUgcGVyZm9ybWFuY2Ug
bW9uaXRvcgo+ID4+PiArICovCj4gPj4+ICsKPiA+Pj4gKy8qIEhQTSBpbnRlcnJ1cHQgcHJpbWFy
eSBoYW5kbGVyICovCj4gPj4+ICtzdGF0aWMgaXJxcmV0dXJuX3QgcmlzY3ZfaW9tbXVfaHBtX2ly
cV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiA+Pj4gK3sKPiA+Pj4gKyAgICAgc3Ry
dWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUgPSAoc3RydWN0IHJpc2N2X2lvbW11X2Rldmlj
ZSAqKWRldl9pZDsKPiA+Pj4gKwo+ID4+PiArICAgICAvKiBDbGVhciBwZXJmb3JtYW5jZSBtb25p
dG9yaW5nIGludGVycnVwdCBwZW5kaW5nICovCj4gPj4+ICsgICAgIHJpc2N2X2lvbW11X3dyaXRl
bChpb21tdSwgUklTQ1ZfSU9NTVVfUkVHX0lQU1IsIFJJU0NWX0lPTU1VX0lQU1JfUE1JUCk7Cj4g
Pj4+ICsKPiA+Pj4gKyAgICAgLyogUHJvY2VzcyBwbXUgaXJxICovCj4gPj4+ICsgICAgIHJpc2N2
X2lvbW11X3BtdV9oYW5kbGVfaXJxKCZpb21tdS0+cG11KTsKPiA+Pj4gKwo+ID4+PiArICAgICBy
ZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPj4+ICt9Cj4gPj4+ICsKPiA+Pj4gKy8qIEhQTSBpbml0aWFs
aXphdGlvbiAqLwo+ID4+PiArc3RhdGljIGludCByaXNjdl9pb21tdV9ocG1fZW5hYmxlKHN0cnVj
dCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+ID4+PiArewo+ID4+PiArICAgICBpbnQgcmM7
Cj4gPj4+ICsKPiA+Pj4gKyAgICAgaWYgKCEoaW9tbXUtPmNhcHMgJiBSSVNDVl9JT01NVV9DQVBB
QklMSVRJRVNfSFBNKSkKPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4gKwo+ID4+
PiArICAgICAvKgo+ID4+PiArICAgICAgKiBwdF9yZWdzIGlzIGVtcHR5IHdoZW4gdGhyZWFkaW5n
IHRoZSBJUlEsIGJ1dCBwdF9yZWdzIGlzIG5lY2Vzc2FyeQo+ID4+PiArICAgICAgKiBieSBwZXJm
X2V2ZW50X292ZXJmbG93LiBVc2UgcHJpbWFyeSBoYW5kbGVyIGluc3RlYWQgb2YgdGhyZWFkCj4g
Pj4+ICsgICAgICAqIGZ1bmN0aW9uIGZvciBQTSBJUlEuCj4gPj4+ICsgICAgICAqCj4gPj4+ICsg
ICAgICAqIFNldCB0aGUgSVJRRl9PTkVTSE9UIGZsYWcgYmVjYXVzZSB0aGlzIElSUSBtaWdodCBi
ZSBzaGFyZWQgd2l0aAo+ID4+PiArICAgICAgKiBvdGhlciB0aHJlYWRlZCBJUlFzIGJ5IG90aGVy
IHF1ZXVlcy4KPiA+Pj4gKyAgICAgICovCj4gPj4+ICsgICAgIHJjID0gZGV2bV9yZXF1ZXN0X2ly
cShpb21tdS0+ZGV2LAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgaW9tbXUtPmly
cXNbcmlzY3ZfaW9tbXVfcXVldWVfdmVjKGlvbW11LCBSSVNDVl9JT01NVV9JUFNSX1BNSVApXSwK
PiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2X2lvbW11X2hwbV9pcnFfaGFu
ZGxlciwgSVJRRl9PTkVTSE9UIHwgSVJRRl9TSEFSRUQsIE5VTEwsIGlvbW11KTsKPiA+Pgo+ID4+
IEhtbSwgc2hhcmVkIGludGVycnVwdHMgYXJlIHRyaWNreSBmb3IgUE1Vcywgc2luY2UgcGVyZiBy
ZXF1aXJlcyBhbnkgSVJRCj4gPj4gaGFuZGxlciB0b3VjaGluZyBhIFBNVSBpcyBydW5uaW5nIG9u
IHBtdS0+Y3B1LCBzbyB5b3UgaGF2ZSB0byBiZSB2ZXJ5Cj4gPj4gY2FyZWZ1bCBhYm91dCBtYWlu
dGFpbmluZyBhZmZpbml0eSBhbmQgbm90IGxldHRpbmcgYW55b25lIGVsc2UgY2hhbmdlIGl0Cj4g
Pj4gYmVoaW5kIHlvdXIgYmFjay4KPiA+Pgo+ID4+IFRoZSBvdGhlciB0aGluZyBpcyB0aGF0IGlm
IGl0IHJlYWxseSBpcyBzaGFyZWQsIGF0IHRoaXMgcG9pbnQgeW91IGNvdWxkCj4gPj4gbm93IGJl
IGluIHJpc2N2X2lvbW11X3BtdV9oYW5kbGVfaXJxKCkgZGVyZWZlcmVuY2luZyBOVUxMLgo+ID4K
PiA+IFllcywgdGhlIFBNVSBJUlEgbGluZSBjb3VsZCBiZSBzaGFyZWQgd2l0aCB0aGUgY29tbWFu
ZCBxdWV1ZSwgZmF1bHQKPiA+IHF1ZXVlLCBhbmQgcGFnZS1yZXF1ZXN0IHF1ZXVlLgo+ID4gQ291
bGQgeW91IHBsZWFzZSBwcm92aWRlIG1vcmUgdGlwcyBvbiB3aGF0IGlzIG1lYW50IGJ5ICJkZXJl
ZmVyZW5jaW5nCj4gPiBOVUxMIGluIHJpc2N2X2lvbW11X3BtdV9oYW5kbGVfaXJxKCkiPwo+ID4g
SSBkb24ndCBjb21wbGV0ZSB1bmRlcnN0YW5kIHdoYXQgbmVlZHMgdG8gYmUgZG9uZSB0aGVyZS4K
PiA+IFRoYW5rcwo+Cj4gSW4gZ2VuZXJhbCBpdCdzIG5vdCBhIGdyZWF0IGlkZWEgdG8gcmVnaXN0
ZXIgYW4gSVJRIGhhbmRsZXIgYmVmb3JlIHRoZQo+IGRhdGEgcGFzc2VkIHRvIHRoYXQgaGFuZGxl
ciBpcyBpbml0aWFsaXNlZC4gV2hhdCBpcyBwb2ludGVkIHRvIGJ5Cj4gKCZpb21tdS0+cG11KS0+
cmVnICsgUklTQ1ZfSU9NTVVfUkVHX0lPQ09VTlRPVkYgaWYgdGhlIElSUSBmaXJlcyByaWdodAo+
IG5vdyAoYW5kL29yIGlmIENPTkZJR19ERUJVR19TSElSUSBldmVyIGdldHMgZml4ZWQpPyA7KQoK
U29ycnkgZm9yIHRoZSBtaXN1bmRlcnN0YW5kaW5nIGVhcmxpZXI7IEkgdW5kZXJzdGFuZCBub3cu
IEkgdGhpbmsgSQptaWdodCBuZWVkIHRvIGV4Y2hhbmdlIHRoZSBJUlEgcmVxdWVzdCBhbmQgUE1V
IGluaXRpYWxpemF0aW9uLAplbnN1cmluZyB0aGF0IHRoZSBQTVUgaW5zdGFuY2UgaXMgaW5pdGlh
bGl6ZWQgYmVmb3JlIGEgUE1VIGludGVycnVwdAphcnJpdmVzLiBUaGFua3MhCgo+Cj4gKE9LLCBp
dCdzIG5vdCAqbGl0ZXJhbGx5KiBOVUxMLCBidXQgaGV5Li4uKQo+Cj4gVGhhbmtzLAo+IFJvYmlu
Lgo+Cj4gPj4KPiA+Pj4gKyAgICAgaWYgKHJjKQo+ID4+PiArICAgICAgICAgICAgIHJldHVybiBy
YzsKPiA+Pj4gKwo+ID4+PiArICAgICByZXR1cm4gcmlzY3ZfaW9tbXVfcG11X2luaXQoJmlvbW11
LT5wbXUsIGlvbW11LT5yZWcsIGRldl9uYW1lKGlvbW11LT5kZXYpKTsKPiA+Pj4gK30KPiA+Pj4g
Kwo+ID4+PiArLyogSFBNIHVuaW5pdGlhbGl6YXRpb24gKi8KPiA+Pj4gK3N0YXRpYyB2b2lkIHJp
c2N2X2lvbW11X2hwbV9kaXNhYmxlKHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+
ID4+PiArewo+ID4+PiArICAgICBpZiAoIShpb21tdS0+Y2FwcyAmIFJJU0NWX0lPTU1VX0NBUEFC
SUxJVElFU19IUE0pKQo+ID4+PiArICAgICAgICAgICAgIHJldHVybjsKPiA+Pj4gKwo+ID4+PiAr
ICAgICBkZXZtX2ZyZWVfaXJxKGlvbW11LT5kZXYsCj4gPj4+ICsgICAgICAgICAgICAgICAgICAg
aW9tbXUtPmlycXNbcmlzY3ZfaW9tbXVfcXVldWVfdmVjKGlvbW11LCBSSVNDVl9JT01NVV9JUFNS
X1BNSVApXSwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICBpb21tdSk7Cj4gPj4+ICsKPiA+Pj4g
KyAgICAgcmlzY3ZfaW9tbXVfcG11X3VuaW5pdCgmaW9tbXUtPnBtdSk7Cj4gPj4+ICt9Cj4gPj4+
ICsKPiA+Pj4gICAgLyogTG9va3VwIGFuZCBpbml0aWFsaXplIGRldmljZSBjb250ZXh0IGluZm8g
c3RydWN0dXJlLiAqLwo+ID4+PiAgICBzdGF0aWMgc3RydWN0IHJpc2N2X2lvbW11X2RjICpyaXNj
dl9pb21tdV9nZXRfZGMoc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUsCj4gPj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBkZXZpZCkKPiA+Pj4gQEAgLTE1OTYsNiArMTY1Miw5IEBAIHZvaWQgcmlzY3ZfaW9tbXVfcmVt
b3ZlKHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11KQo+ID4+PiAgICAgICAgcmlzY3Zf
aW9tbXVfaW9kaXJfc2V0X21vZGUoaW9tbXUsIFJJU0NWX0lPTU1VX0REVFBfSU9NTVVfTU9ERV9P
RkYpOwo+ID4+PiAgICAgICAgcmlzY3ZfaW9tbXVfcXVldWVfZGlzYWJsZSgmaW9tbXUtPmNtZHEp
Owo+ID4+PiAgICAgICAgcmlzY3ZfaW9tbXVfcXVldWVfZGlzYWJsZSgmaW9tbXUtPmZsdHEpOwo+
ID4+PiArCj4gPj4+ICsgICAgIGlmIChpb21tdS0+Y2FwcyAmIFJJU0NWX0lPTU1VX0NBUEFCSUxJ
VElFU19IUE0pCj4gPj4+ICsgICAgICAgICAgICAgcmlzY3ZfaW9tbXVfcG11X3VuaW5pdCgmaW9t
bXUtPnBtdSk7Cj4gPj4+ICAgIH0KPiA+Pj4KPiA+Pj4gICAgaW50IHJpc2N2X2lvbW11X2luaXQo
c3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUpCj4gPj4+IEBAIC0xNjM1LDYgKzE2OTQs
MTAgQEAgaW50IHJpc2N2X2lvbW11X2luaXQoc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9t
bXUpCj4gPj4+ICAgICAgICBpZiAocmMpCj4gPj4+ICAgICAgICAgICAgICAgIGdvdG8gZXJyX3F1
ZXVlX2Rpc2FibGU7Cj4gPj4+Cj4gPj4+ICsgICAgIHJjID0gcmlzY3ZfaW9tbXVfaHBtX2VuYWJs
ZShpb21tdSk7Cj4gPj4+ICsgICAgIGlmIChyYykKPiA+Pj4gKyAgICAgICAgICAgICBnb3RvIGVy
cl9ocG1fZGlzYWJsZTsKPiA+Pj4gKwo+ID4+Cj4gPj4gSSB3b3VsZCBsZWF2ZSB0aGlzIHVudGls
IGFmdGVyIHRoZSB3aG9sZSBJT01NVSBzZXR1cCBoYXMgc3VjY2VlZGVkLiBUaGUKPiA+PiBQTVUg
aXMgbm90IGNyaXRpY2FsIHRvIElPTU1VIG9wZXJhdGlvbiwgc28gYXQgdGhhdCBwb2ludCBhbiBl
cnJvciBpcyBub3QKPiA+PiBmYXRhbCwgaXQganVzdCBtZWFucyB5b3UgZG9uJ3QgZ2V0IGEgUE1V
LCB0aHVzIHRoZXJlIHNob3VsZG4ndCBuZWVkIHRvCj4gPj4gYmUgYW55IGNsZWFudXAgb3V0c2lk
ZSByaXNjdl9pb21tdV9ocG1fZW5hYmxlKCkgaXRzZWxmLgo+ID4KPiA+IFRoYW5rcyBmb3IgcG9p
bnRpbmcgdGhpcyBvdXQuIFBNVSBmYWlsdXJlIHNob3VsZG4ndCBjYXVzZSB0aGUgZW50aXJlCj4g
PiBJT01NVSB0byBmYWlsLCBsZXQgbWUgbW9kaWZ5IGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCj4g
Pgo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+IFJvYmluLgo+ID4+Cj4gPj4+ICAgICAgICByYyA9IGlv
bW11X2RldmljZV9zeXNmc19hZGQoJmlvbW11LT5pb21tdSwgTlVMTCwgTlVMTCwgInJpc2N2LWlv
bW11QCVzIiwKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfbmFt
ZShpb21tdS0+ZGV2KSk7Cj4gPj4+ICAgICAgICBpZiAocmMpIHsKPiA+Pj4gQEAgLTE2NTMsNiAr
MTcxNiw4IEBAIGludCByaXNjdl9pb21tdV9pbml0KHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2Ug
KmlvbW11KQo+ID4+PiAgICBlcnJfcmVtb3ZlX3N5c2ZzOgo+ID4+PiAgICAgICAgaW9tbXVfZGV2
aWNlX3N5c2ZzX3JlbW92ZSgmaW9tbXUtPmlvbW11KTsKPiA+Pj4gICAgZXJyX2lvZGlyX29mZjoK
PiA+Pj4gKyAgICAgcmlzY3ZfaW9tbXVfaHBtX2Rpc2FibGUoaW9tbXUpOwo+ID4+PiArZXJyX2hw
bV9kaXNhYmxlOgo+ID4+PiAgICAgICAgcmlzY3ZfaW9tbXVfaW9kaXJfc2V0X21vZGUoaW9tbXUs
IFJJU0NWX0lPTU1VX0REVFBfSU9NTVVfTU9ERV9PRkYpOwo+ID4+PiAgICBlcnJfcXVldWVfZGlz
YWJsZToKPiA+Pj4gICAgICAgIHJpc2N2X2lvbW11X3F1ZXVlX2Rpc2FibGUoJmlvbW11LT5mbHRx
KTsKPiA+Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
