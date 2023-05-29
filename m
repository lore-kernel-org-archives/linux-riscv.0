Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E881C77B7E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 12:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=izeTcqn8hn1IRuoGbnZ55kggH1xbkLtwEzIuTDuIf3M=; b=aSbMwXiNtXwFcu
	R70pkaQG7OnfJ9kki7lwVGNIaESgj4UnS3teUCJwe0rN93xiSHYb/b+KZYHexBHK0dNn4dXxB2ygX
	cBRwqdr799UbwFbwi4RuwQ/ngUrrTzdF58Gr4282+AXcEPAoVyy8DcyiHWTE7T1Dlzq6Xy203If+r
	fttOywHTWKBW66JgIWE6Rsch3eGJvD3OiM1Qq6iVWWQoIuWoToqHRlax8wNQCEF8mSEyPlxnzvNKk
	HA9W02Hh7HsiE+NLkNBHn4bSVZH3ktpUKOHM8URQAEqAArxa5YSvRJ18qDD35T/8NVDQmbaXezePR
	oY6PuAq12AKv1aCIKngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3bsB-00APYg-1G;
	Mon, 29 May 2023 12:21:15 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3bs7-00APX5-2e;
	Mon, 29 May 2023 12:21:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b01d3bb571so16467345ad.2;
        Mon, 29 May 2023 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685362870; x=1687954870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1Xvm17u+rCjsDQtsTRP4IW4hFNIZBwFcy3OF7utEfQ=;
        b=Iztf9BjgqoBy2nQa3hkO+Tngf5xL010erKXp2+fhMwz3aX9O/8sSXatTJ3RNWPKclo
         g2l+VY5BGH9IhFLnqtVx86UQ73tyBQSH9LS5AvJDga5jLPu3osDLC/hgypHvEYpHJSAs
         hQivyn1v/BqgEftAJZygsVyp9VbYp1ODqY+9qjs7zM8XiFp83jqB0CATWAzDoEC1+sxC
         QKr/Bfh3+hjkXgFSx0wr57sFBwgsOOltT3nqi8RjRAMiS3KN0hlaGn+104yyCuexGKSn
         4IBQLshG/UjbrGgRrJGUbvnm66TINLet3rtQUncCJXsvkeug+HzRBpXvwAjx/02XD5G3
         6Z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685362870; x=1687954870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1Xvm17u+rCjsDQtsTRP4IW4hFNIZBwFcy3OF7utEfQ=;
        b=f35JTStvvHwpmO2wc7g8UfWIEgNDmgBGPsUTEL9AvU/WBr//4psYSl2hdpfS6Z0NKY
         N4sqkmjHFZefPZG2u5O7FAc4UJzXnnyx28gsh+0Fq3cj9QKCH+73+PwVQfcwp3kdVj3g
         CXURH0t/dNjPMxBxke7TR+nXhXHCuKOY9Ht88r49JUILhBJO30wQuva6nL/hOUgws0Lw
         eLAgBi+PxrEoecNDzUUg82Aw2V/NtuXB2QPs3sUIXXgGCcQdK/Q2fWzTg/SBcYyytQ/+
         sGu5tS2XBkb8S0QpeSzWGWBsaZPd11xmSCcQBG05MI2vkBmJp9ALbbWDrDQCnqYk+4Yl
         zAPA==
X-Gm-Message-State: AC+VfDyAw/a3aIgkMCCDY45pJivEWp5f9kL9jAT+ocEyxZBE0R0KlkIH
	y4G354HeKKdy2Q5UwRoyRYcH/tvBKf/3YIDaA7Q=
X-Google-Smtp-Source: ACHHUZ6OkV3SZbwpjCqJa57IyIdEql6pFjbanDcFk7ZJ7Rj1kSsJag0dj6+D0yo7FilJN1xbZcoFIMZn3k8nj6DrI08=
X-Received: by 2002:a17:902:8218:b0:1af:bcf7:2bd8 with SMTP id
 x24-20020a170902821800b001afbcf72bd8mr8700574pln.52.1685362869847; Mon, 29
 May 2023 05:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1684999824.git.haibo1.xu@intel.com> <da390e6200e838fce320a2a43b2f87951b4e0bbb.1684999824.git.haibo1.xu@intel.com>
 <20230525-2bab5376987792eab73507ac@orel> <CAJve8o=5ji5D-S8k+GaGd7sH7KXNWxDaWhD3jyxtHizKSMtjbA@mail.gmail.com>
 <20230529-7b3e41e6aca55f9e90dd6cd3@orel>
In-Reply-To: <20230529-7b3e41e6aca55f9e90dd6cd3@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Mon, 29 May 2023 20:20:58 +0800
Message-ID: <CAJve8o=wX+Lb84YeGBa9anp+eZnrgvTW6AOVgoeUnHZu7eWswA@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] KVM: riscv: selftests: Add get-reg-list test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_052111_859382_0B3F8880 
X-CRM114-Status: GOOD (  21.21  )
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

T24gTW9uLCBNYXkgMjksIDIwMjMgYXQgMzowOOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBNYXkgMjcsIDIwMjMgYXQgMTI6Mzk6
NTdQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBPbiBGcmksIE1heSAyNiwgMjAyMyBhdCAx
OjE44oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4g
PiA+Cj4gPiA+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDAzOjM4OjM1UE0gKzA4MDAsIEhhaWJv
IFh1IHdyb3RlOgo+IC4uLgo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJ
WkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DT1JFIHwgS1ZNX1JFR19SSVNDVl9DT1JFX1JFRyhyZWdz
LmE2KSwKPiA+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtW
TV9SRUdfUklTQ1ZfQ09SRSB8IEtWTV9SRUdfUklTQ1ZfQ09SRV9SRUcocmVncy5hNyksCj4gPiA+
ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NW
X0NPUkUgfCBLVk1fUkVHX1JJU0NWX0NPUkVfUkVHKHJlZ3MuczIpLAo+ID4gPiA+ICsgICAgIEtW
TV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DT1JFIHwgS1ZN
X1JFR19SSVNDVl9DT1JFX1JFRyhyZWdzLnMzKSwKPiA+ID4gPiArICAgICBLVk1fUkVHX1JJU0NW
IHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ09SRSB8IEtWTV9SRUdfUklTQ1Zf
Q09SRV9SRUcocmVncy5zNCksCj4gPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdf
U0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NPUkUgfCBLVk1fUkVHX1JJU0NWX0NPUkVfUkVHKHJl
Z3MuczUpLAo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwg
S1ZNX1JFR19SSVNDVl9DT1JFIHwgS1ZNX1JFR19SSVNDVl9DT1JFX1JFRyhyZWdzLnM2KSwKPiA+
ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklT
Q1ZfQ09SRSB8IEtWTV9SRUdfUklTQ1ZfQ09SRV9SRUcocmVncy5zNyksCj4gPiA+ID4gKyAgICAg
S1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NPUkUgfCBL
Vk1fUkVHX1JJU0NWX0NPUkVfUkVHKHJlZ3MuczgpLAo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklT
Q1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DT1JFIHwgS1ZNX1JFR19SSVND
Vl9DT1JFX1JFRyhyZWdzLnM5KSwKPiA+ID4gPiArICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JF
R19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ09SRSB8IEtWTV9SRUdfUklTQ1ZfQ09SRV9SRUco
cmVncy5zMTApLAo+ID4gPiA+ICsgICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0
IHwgS1ZNX1JFR19SSVNDVl9DT1JFIHwgS1ZNX1JFR19SSVNDVl9DT1JFX1JFRyhyZWdzLnMxMSks
Cj4gPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9VNjQgfCBLVk1fUkVH
X1JJU0NWX0NPUkUgfCBLVk1fUkVHX1JJU0NWX0NPUkVfUkVHKHJlZ3MudDMpLAo+ID4gPiA+ICsg
ICAgIEtWTV9SRUdfUklTQ1YgfCBLVk1fUkVHX1NJWkVfVTY0IHwgS1ZNX1JFR19SSVNDVl9DT1JF
IHwgS1ZNX1JFR19SSVNDVl9DT1JFX1JFRyhyZWdzLnQ0KSwKPiA+ID4gPiArICAgICBLVk1fUkVH
X1JJU0NWIHwgS1ZNX1JFR19TSVpFX1U2NCB8IEtWTV9SRUdfUklTQ1ZfQ09SRSB8IEtWTV9SRUdf
UklTQ1ZfQ09SRV9SRUcocmVncy50NSksCj4gPiA+ID4gKyAgICAgS1ZNX1JFR19SSVNDViB8IEtW
TV9SRUdfU0laRV9VNjQgfCBLVk1fUkVHX1JJU0NWX0NPUkUgfCBLVk1fUkVHX1JJU0NWX0NPUkVf
UkVHKHJlZ3MudDYpLAo+ID4gPgo+ID4gPiAuLi5hbGwgdGhlIGFib3ZlIHdvdWxkIGp1c3QgYmUg
aW5kaWNlcyByYXRoZXIgdGhhbiBuYW1lZCByZWdpc3RlcnMuIEkKPiA+ID4gZ3Vlc3MgdGhhdCdz
IGJldHRlciBmb3IgdGhlc2UgcmVnaXN0ZXJzLgo+ID4gPgo+ID4KPiA+IFlvdSBtZWFuIHRvIHNo
b3cgaXQgYXMgS1ZNX1JFR19SSVNDVl9DT1JFX1JFRyhyZWdzLnJlZ3NbMF0pIC4uLgo+ID4gS1ZN
X1JFR19SSVNDVl9DT1JFX1JFRyhyZWdzLnJlZ3NbMzFdKT8KPiA+Cj4KPiBJJ20gT0sgd2l0aCB0
aGVzZSByZWdpc3RlcnMgdXNpbmcgdGhlaXIgbmFtZXMgaW4gdGhpcyBsaXN0LCBpdCBkb2VzIGxv
b2sKPiBiZXR0ZXIuIEhvd2V2ZXIgdGhlIG9yaWdpbmFsIGlkZWEgZm9yIHRoZXNlIGxpc3RzIHdh
cyB0aGF0IHRoZXkgd291bGQgYmUKPiBnZW5lcmF0ZWQgZnJvbSBwcmludF9yZWcoKS4gSW4gdGhp
cyBjYXNlLCBwcmludF9yZWcoKSBpcyBnZW5lcmF0aW5nIHRoZW0KPiB3aXRoIHRoZWlyIG51bWJl
ciBpbnN0ZWFkIG9mIG5hbWUuIEVpdGhlciBwcmludF9yZWcoKSBjb3VsZCBsZWFybiBob3cgdG8K
PiBnZW5lcmF0ZSB0aGVpciBuYW1lcyBieSBoYW5kbGluZyB0aGUgb2Zmc2V0IHJhbmdlcyBvZiBl
YWNoIHJlZ2lzdGVyIHR5cGUsCj4gZS5nLgo+Cj4gc3dpdGNoIChyZWdfb2ZmKSB7Cj4gY2FzZSAx
MCAuLi4gMTc6Cj4gICAgc3RyZHVwX3ByaW50ZigiLi4uIEtWTV9SRUdfUklTQ1ZfQ09SRV9SRUco
cmVncy5hJWQpLCIsIHJlZ19vZmYgLSAxMCk7Cj4KPiBvciB3ZSBjYW4gdXNlIHRoZSBudW1iZXJz
IGhlcmUgaW4gdGhpcyBsaXN0LCBvciB3ZSBjYW4gbGVhdmUgaXQgYXMgeW91Cj4gaGF2ZSBpdCAo
aS5lLiBkb25lIG1hbnVhbGx5KS4KPgoKSSBhZ3JlZSB0aGF0IHRoZSBwcmludF9yZWcoKSBzaG91
bGQgcHJpbnQgdGhlIHJlZ2lzdGVyIG5hbWUgaW5zdGVhZCBvZgp0aGUgcmVnaXN0ZXIgb2Zmc2V0
LgpJdCBtYXkgYmUgYmV0dGVyIHRvIG1hbnVhbGx5IGVuY29kZS9kZWNvZGUgdGhlIHJlZ2lzdGVy
IG9mZnNldCB0byBuYW1lCmNhc2UgYnkgY2FzZQppbiB0aGUgcHJpbnRfcmVnKCkgc2luY2Ugd2Ug
anVzdCBuZWVkIHRvIGhhbmRsZSBpdCBvbmNlLiBXaWxsIHVwZGF0ZSBpdCBpbiB2My4KClRoYW5r
cywKSGFpYm8KCj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
