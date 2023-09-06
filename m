Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D746EB8FCD
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=z7SuCgI4y9YfBGHTYGvnIQkSPggu6jtWK7K5P7UniH8=; b=wuloBeFZUpsu4QfSb1ZYuSSccK
	e0mLdBq0CKzYMzC7Cgmpy4GEyal/cp5Lx3tYxjgh1PuXt27bBP/9rzAjALV9no53+h+VwWjuqLuCj
	goEKr0mVXu3eDHHhDKbfPT/va5IvdZYEZXyWX6IQkDLPyYTHBLklrwdxpXc2VBj+bQvS67VauLicm
	Fci9TQuQfDlTfoDn2PMvfn+9M7xTYLTuFOHyqV7vYVUAerap3SjK/Qkt4Z9609IEYkR3yFdPx9fH/
	abglHIBISxrKmicdYdAzemBlEXpMrOwMyfmb6Bz/NAAJqv/oV7aXuSwZmMB28ULW+5cztKwJeVlWI
	PH7bYbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdsOR-009x9G-18;
	Wed, 06 Sep 2023 13:16:27 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdsOL-009wxv-12
	for linux-riscv@lists.infradead.org;
	Wed, 06 Sep 2023 13:16:25 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-53482b44007so1920195a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Sep 2023 06:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1694006172; x=1694610972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uld++PB00AvttIUabIU7xcqVSkPz344JqFl8ppv134=;
        b=ErOUrHsvKkkPGKyTG44M+KuGDoWPkb4jlZ8FLz35OItQhCiZUNxoLYszAuEtqoSquW
         9Ozdz0UKYbJEhct+d3wg8mQIWUOXK2mPJStMUcqv8bREJH5rdG7vFy5U6VBxoBA1lrP0
         P7qG3vVtxWZEca+/h0R4uH9MKgcn06licp1bO3t+ZiPBH0vJyftkxgG8WvGPIhPD8VQB
         dDdvCJoOEQ1uAYXtNTE7ehnz3rucZpdqeHuEGW6Whs8/KY70k9nzZNm1Nkx/tzRTjlSd
         IWy4ysnuekgH5grYcD+Zd/g2al1FERSepYolI7BJ4XOQf8RvcSEAJ4HZyACCbykm02Su
         42Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694006172; x=1694610972;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uld++PB00AvttIUabIU7xcqVSkPz344JqFl8ppv134=;
        b=UNT0JXzVFqQyeFc9lLprbRTqwxQMj8IBCEc4vva+8dvymedMSZClMlgSPriKDI53eN
         +fG0DKgcK8P5XkwsgvE3Ef3asMrygTyRK9IIu+OZycSj2MNKnPJ3Wy+yABWv60b7WSrI
         xtLZ01rpM383hDoB00MwR9JXvDXtN5DtUN0md3rH8DrDiTmvT/zeIq0rYmJ6qTAJaVDY
         COIygBPfVrtPKFG1bGAhgEXMpXuIJIv3Nkqhgdsk1zhj6KA7vroeBXz1wIv0LQtfn8CT
         cgW4vBd5ZHhyDdwHxbA2NonOeWq6DMQC0rHZx3kR1xF987qsy1utNmmNSPdTEtfarkmz
         USDg==
X-Gm-Message-State: AOJu0YxoM57RhR98YKpSz2add3wHP45W7tHxI2uDTC0/+P25GB0QWSzV
	jxuPNvQSvVjROjeY5KuS1KBbFA==
X-Google-Smtp-Source: AGHT+IE490DJ0B8HsJUKc5YGg+iZZKcgEd0HmXU6tZkHPl3GceN2Bm3rAS+0TX+wSHA1qhJxq3bR3A==
X-Received: by 2002:a17:90b:4c50:b0:271:7a79:ecbb with SMTP id np16-20020a17090b4c5000b002717a79ecbbmr13634747pjb.28.1694006171898;
        Wed, 06 Sep 2023 06:16:11 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id gm15-20020a17090b100f00b002681bda127esm10986823pjb.35.2023.09.06.06.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 06:16:10 -0700 (PDT)
Date: Wed, 06 Sep 2023 06:16:10 -0700 (PDT)
X-Google-Original-Date: Wed, 06 Sep 2023 06:16:08 PDT (-0700)
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
In-Reply-To: <CAHVXubjgjAwMOi0J5zZJkuX8RKwgfKp-_=tVTLDvKN=tBBdxNQ@mail.gmail.com>
CC: prabhakar.csengg@gmail.com, geert+renesas@glider.be,
  Will Deacon <will@kernel.org>, aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, npiggin@gmail.com,
  peterz@infradead.org, mchitale@ventanamicro.com, vincent.chen@sifive.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-arch@vger.kernel.org, linux-mm@kvack.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, ajones@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-bed35427-44cd-4d85-9589-df2483346d32@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_061621_382978_01B0F739 
X-CRM114-Status: GOOD (  42.09  )
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

T24gV2VkLCAwNiBTZXAgMjAyMyAwNTo0Mzo0NiBQRFQgKC0wNzAwKSwgYWxleGdoaXRpQHJpdm9z
aW5jLmNvbSB3cm90ZToKPiBPbiBXZWQsIFNlcCA2LCAyMDIzIGF0IDI6MjTigK9QTSBMYWQsIFBy
YWJoYWthcgo+IDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIEFs
ZXhhbmRyZSwKPj4KPj4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAxOjE44oCvUE0gQWxleGFuZHJl
IEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPj4gPgo+PiA+IE9uIFdlZCwg
U2VwIDYsIDIwMjMgYXQgMjowOeKAr1BNIExhZCwgUHJhYmhha2FyCj4+ID4gPHByYWJoYWthci5j
c2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPj4gPiA+Cj4+ID4gPiBIaSBBbGV4YW5kcmUsCj4+ID4g
Pgo+PiA+ID4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCAxOjAx4oCvUE0gQWxleGFuZHJlIEdoaXRp
IDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPj4gPiA+ID4KPj4gPiA+ID4gSGkgUHJh
Ymhha2FyLAo+PiA+ID4gPgo+PiA+ID4gPiBPbiBXZWQsIFNlcCA2LCAyMDIzIGF0IDE6NDnigK9Q
TSBMYWQsIFByYWJoYWthcgo+PiA+ID4gPiA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdy
b3RlOgo+PiA+ID4gPiA+Cj4+ID4gPiA+ID4gSGkgQWxleGFuZHJlLAo+PiA+ID4gPiA+Cj4+ID4g
PiA+ID4gT24gVHVlLCBBdWcgMSwgMjAyMyBhdCA5OjU44oCvQU0gQWxleGFuZHJlIEdoaXRpIDxh
bGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPj4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiBU
aGlzIGZ1bmN0aW9uIHVzZWQgdG8gc2ltcGx5IGZsdXNoIHRoZSB3aG9sZSB0bGIgb2YgYWxsIGhh
cnRzLCBiZSBtb3JlCj4+ID4gPiA+ID4gPiBzdWJ0aWxlIGFuZCB0cnkgdG8gb25seSBmbHVzaCB0
aGUgcmFuZ2UuCj4+ID4gPiA+ID4gPgo+PiA+ID4gPiA+ID4gVGhlIHByb2JsZW0gaXMgdGhhdCB3
ZSBjYW4gb25seSB1c2UgUEFHRV9TSVpFIGFzIHN0cmlkZSBzaW5jZSB3ZSBkb24ndCBrbm93Cj4+
ID4gPiA+ID4gPiB0aGUgc2l6ZSBvZiB0aGUgdW5kZXJseWluZyBtYXBwaW5nIGFuZCB0aGVuIHRo
aXMgZnVuY3Rpb24gd2lsbCBiZSBpbXByb3ZlZAo+PiA+ID4gPiA+ID4gb25seSBpZiB0aGUgc2l6
ZSBvZiB0aGUgcmVnaW9uIHRvIGZsdXNoIGlzIDwgdGhyZXNob2xkICogUEFHRV9TSVpFLgo+PiA+
ID4gPiA+ID4KPj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxl
eGdoaXRpQHJpdm9zaW5jLmNvbT4KPj4gPiA+ID4gPiA+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+PiA+ID4gPiA+ID4gLS0tCj4+ID4gPiA+ID4g
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90bGJmbHVzaC5oIHwgMTEgKysrKystLS0tLQo+PiA+
ID4gPiA+ID4gIGFyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyAgICAgICAgICB8IDM0ICsrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0KPj4gPiA+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDMx
IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+PiA+ID4gPiA+ID4KPj4gPiA+ID4gPiBB
ZnRlciBhcHBseWluZyB0aGlzIHBhdGNoLCBJIGFtIHNlZWluZyBtb2R1bGUgbG9hZCBpc3N1ZXMg
b24gUlovRml2ZQo+PiA+ID4gPiA+IChjb21wbGV0ZSBsb2cgWzBdKS4gSSBhbSB0ZXN0aW5nIGRl
ZmNvbmZpZyArIFsxXSAocnovZml2ZSByZWxhdGVkCj4+ID4gPiA+ID4gY29uZmlncykuCj4+ID4g
PiA+ID4KPj4gPiA+ID4gPiBBbnkgcG9pbnRlcnMgb24gd2hhdCBjb3VsZCBiZSBhbiBpc3N1ZSBo
ZXJlPwo+PiA+ID4gPgo+PiA+ID4gPiBDYW4geW91IGdpdmUgbWUgdGhlIGV4YWN0IHZlcnNpb24g
b2YgdGhlIGtlcm5lbCB5b3UgdXNlPyBUaGUgdHJhcAo+PiA+ID4gPiBhZGRyZXNzZXMgYXJlIHZt
YWxsb2MgYWRkcmVzc2VzLCBhbmQgYSBmaXggZm9yIHRob3NlIGxhbmRlZCB2ZXJ5IGxhdGUKPj4g
PiA+ID4gaW4gdGhlIHJlbGVhc2UgY3ljbGUuCj4+ID4gPiA+Cj4+ID4gPiBJIGFtIHVzaW5nIG5l
eHQtMjAyMzA5MDYsIEl2ZSBwdXNoZWQgYSBicmFuY2ggWzFdIGZvciB5b3UgdG8gaGF2ZSBhIGxv
b2suCj4+ID4gPgo+PiA+ID4gWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9wcmFiaGFrYXJsYWQvbGlu
dXgvdHJlZS9yemZpdmUtZGVidWcKPj4gPgo+PiA+IEdyZWF0LCB0aGFua3MsIEkgaGFkIHRvIGdl
dCByaWQgb2YgdGhpcyBwb3NzaWJpbGl0eSA6KQo+PiA+Cj4+ID4gQXMtaXMsIEkgaGF2ZSBubyBp
ZGVhLCBjYW4geW91IHRyeSB0byAiYmlzZWN0IiB0aGUgcHJvYmxlbT8gSSBtZWFuCj4+ID4gd2hp
Y2ggcGF0Y2ggaW4gdGhlIHNlcmllcyBsZWFkcyB0byB0aG9zZSB0cmFwcz8KPj4gPgo+PiBPb3Bz
IHNvcnJ5IGZvciBub3QgbWVudGlvbmluZyBlYXJsaWVyLCB0aGlzIGlzIHRoZSBvZmZlbmRpbmcg
cGF0Y2gKPj4gd2hpY2ggbGVhZHMgdG8gdGhlIGlzc3VlcyBzZWVuIG9uIHJ6L2ZpdmUuCj4KPiBP
aywgc28gYXQgbGVhc3QgSSBmb3VuZCB0aGUgZm9sbG93aW5nIHByb2JsZW0sIGJ1dCBJIGRvbid0
IHNlZSBob3cKPiB0aGF0IGNvdWxkIGZpeCB5b3VyIGlzc3VlOiBjYW4geW91IGdpdmUgYSB0cnkg
YW55d2F5PyBJIGtlZXAgbG9va2luZwo+IGludG8gdGhpcywgdGhhbmtzCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4g
aW5kZXggZGYyYTA4MzhjM2ExLi5iNTY5MmJjNmM3NmEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9tbS90bGJmbHVzaC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS90bGJmbHVzaC5jCj4gQEAgLTIz
OSw3ICsyMzksNyBAQCB2b2lkIGZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwKPiB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+Cj4gIHZvaWQgZmx1c2hfdGxiX2tlcm5lbF9y
YW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCkKPiAgewo+IC0gICAg
ICAgX19mbHVzaF90bGJfcmFuZ2UoTlVMTCwgc3RhcnQsIGVuZCwgUEFHRV9TSVpFKTsKPiArICAg
ICAgIF9fZmx1c2hfdGxiX3JhbmdlKE5VTEwsIHN0YXJ0LCBlbmQgLSBzdGFydCwgUEFHRV9TSVpF
KTsKPiAgfQo+Cj4gICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKCkFsZXggYW5k
IEkgd2VyZSB0YWxraW5nIGEgYml0LiAgSSdtIE9LIGp1c3QgZHJvcHBpbmcgdGhlIFRMQiBmbHVz
aCAKc2VyaWVzIGZvciB0aGlzIHJlbGVhc2UsIHRoYXQgd2F5IHdlIGNhbiBnZXQgdG8gdGhlIGJv
dHRvbSBvZiB3aGF0J3MgCndyb25nLgoKPgo+Pgo+PiBDaGVlcnMsCj4+IFByYWJoYWthcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
