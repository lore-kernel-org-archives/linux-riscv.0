Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6BBCD98F2
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 13:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8r4FYnR5hEhF6AAhn9fbFbqf4WvNNMQHukB9lVb7f0k=; b=a2H0mp5GIh24Mp
	4j6VKH5m8YkBlPkQZH0GqZ03PstvFcIW9QcBFN1SUYRCfewN/BFXh/3HFVEFrmZ+trYO0LJh4QmbS
	THI+l+nEvRPt5OlMT/5ZPsoed0+zS8RhX6EQSc1Q7Ug8zcwjwQZmCqUydjiFkd+5ZqBBFJl9MOIr7
	d0IGSNdSPfbg2+F6pOejd0/QRVnwNztcc24addT4IlgES9Q3aYmYGohIh5Neyj67FKZQKnIpxji/0
	2UtfC6S4Ub1L6SgUt1DS5/bvP1bsCtszvcFVUANGuUSPaTxemQER4SlGQWd7o1zyLwql/XPY1Hy6U
	kv3qtZWh2798xP8fUX9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc19N-00000006LGO-0ztE;
	Tue, 23 Jun 2026 13:26:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc19M-00000006LGG-2AEz
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 13:26:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7FEF40736
	for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 13:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC99A1F00A3D
	for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782221207;
	bh=3AnIX67gwpDXgs2xfF71Q85BjqAjzJUjZy1Ec4RJuKQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hE9korR8A+W6z0ToBhbljhuQyd3RiH/hkr0E+F0bP5aioqF/S11Cc1CvsuXC0oNpN
	 wg2fVFMD+oyXxlrH93Sdy2Velcfk1Ev5oBLpGdMeoP7u3wI7Fp+V1MWh7EMzg5xc1u
	 GBX06HhbSf0DT1hxnkceoYyvseptWX/+ZFeMsS17XuhfZ2DRQal+tz5NkxxRSRYmoA
	 72Y+t6qvcz5aTQDXr3qXxbqnkNuhKiPUZVzU3FODKtBxnS0pexJiJW7bCbBtXG/9vC
	 57EME8hnrF9iAiZLvNu1L44J3L+kTo5/J0ex+NadoEmpsa0QkCxQq57FhM2E84dQb7
	 Hjl89gEXE8qJg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa61e3d3f3so5645507e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Jun 2026 06:26:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/js4Lkw2Utwy5atjfDpXjecGvYwzTsOutCNnLXdpZC1SK8KdxvTKXMLW5R1/hKObpYvC3xvitoZEGi4w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3+qQG1FICUsGhVVeDWrMvi0RHPahqMQfG+a0ZQIsQpeM2Ch1B
	41UjdY4wJfw6YR2ytGKST8yK1a7OTDNUvw6BSXEHpvW5G4p/UUpW9+UFc7OfjmuTYSvi/NJbjCV
	kcWl+Y8rWAPXnPH0vdPeuZIb6GiYKnsE=
X-Received: by 2002:a05:6512:405a:b0:5aa:6128:dfc4 with SMTP id
 2adb3069b0e04-5ade4743759mr763886e87.24.1782221206215; Tue, 23 Jun 2026
 06:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260616072617.2272-1-lirongqing@baidu.com>
In-Reply-To: <20260616072617.2272-1-lirongqing@baidu.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 23 Jun 2026 15:26:33 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j3Wnn3exbji-6PzwjCnOCJDe_pUJU9R25Bhvh1ZE3E5A@mail.gmail.com>
X-Gm-Features: AVVi8CfUFJ5lTgNtBPM1lrdpB9DxQD6gZtS_qaKI2d26_aigyG6oBHGkBNUnWFs
Message-ID: <CAJZ5v0j3Wnn3exbji-6PzwjCnOCJDe_pUJU9R25Bhvh1ZE3E5A@mail.gmail.com>
Subject: Re: [PATCH][v2] ACPI: processor_idle: Mark LPI enter functions as __cpuidle
To: Li RongQing <lirongqing@baidu.com>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Huisong Li <lihuisong@huawei.com>, Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMTYsIDIwMjYgYXQgOToyNuKAr0FNIGxpcm9uZ3FpbmcgPGxpcm9uZ3FpbmdA
YmFpZHUuY29tPiB3cm90ZToKPgo+IEZyb206IExpIFJvbmdRaW5nIDxsaXJvbmdxaW5nQGJhaWR1
LmNvbT4KPgo+IFdoZW4gZnVuY3Rpb24gdHJhY2luZyBvciBLcHJvYmVzIGlzIGVuYWJsZWQsIGVu
dGVyaW5nIGFuIEFDUEkgTG93Cj4gUG93ZXIgSWRsZSAoTFBJKSBzdGF0ZSB0cmlnZ2VycyB0aGUg
Zm9sbG93aW5nIFJDVSBzcGxhdDoKPgo+ICAgUkNVIG5vdCBvbiBmb3I6IGFjcGlfaWRsZV9scGlf
ZW50ZXIrMHg0LzB4ZDgKPiAgIFdBUk5JTkc6IENQVTogOCBQSUQ6IDAgYXQgaW5jbHVkZS9saW51
eC90cmFjZV9yZWN1cnNpb24uaDoxNjIgZnVuY3Rpb25fdHJhY2VfY2FsbCsweDFlOC8weDIyOAo+
Cj4gVGhlIGFjcGlfaWRsZV9scGlfZW50ZXIoKSBmdW5jdGlvbiBpcyBpbnZva2VkIHdpdGhpbiB0
aGUgY3B1aWRsZQo+IHBhdGggYWZ0ZXIgUkNVIGhhcyBhbHJlYWR5IGJlZW4gZGlzYWJsZWQgZm9y
IHRoZSBjdXJyZW50IGxvY2FsIENQVS4KPiBDb25zZXF1ZW50bHksIGZ0cmFjZSdzIGZ1bmN0aW9u
X3RyYWNlX2NhbGwoKSBleHBlY3RzIFJDVSB0byBiZQo+IGFjdGl2ZWx5IHdhdGNoaW5nIGJlZm9y
ZSByZWNvcmRpbmcgdHJhY2UgZGF0YSwgZW1pdHRpbmcgYSB3YXJuaW5nCj4gaWYgaXQgaXMgbm90
Lgo+Cj4gRml4IHRoaXMgYnkgYW5ub3RhdGluZyBhY3BpX2lkbGVfbHBpX2VudGVyKCksIHRoZSBn
ZW5lcmljIF9fd2Vhawo+IHN0dWIsIGFuZCB0aGUgUklTQy1WIGltcGxlbWVudGF0aW9uIG9mIGFj
cGlfcHJvY2Vzc29yX2ZmaF9scGlfZW50ZXIoKQo+IHdpdGggX19jcHVpZGxlLiBUaGlzIG1vdmVz
IHRoZXNlIGZ1bmN0aW9ucyBpbnRvIHRoZSAnLmNwdWlkbGUudGV4dCcKPiBzZWN0aW9uLCBpbXBs
aWNpdGx5IGRpc2FibGluZyBmdHJhY2UgaW5zdHJ1bWVudGF0aW9uIChub3RyYWNlKSBhbG9uZwo+
IHRoaXMgc2Vuc2l0aXZlIHBhdGggYW5kIHByZXZlbnRpbmcgdHJhY2UtaW5kdWNlZCBSQ1Ugd2Fy
bmluZ3MgZHVyaW5nCj4gaWRsZSBlbnRyeS4KPgo+IEZpeGVzOiBhMzZhN2ZlY2ZlNjAgKCJBQ1BJ
IC8gcHJvY2Vzc29yX2lkbGU6IEFkZCBzdXBwb3J0IGZvciBMb3cgUG93ZXIgSWRsZShMUEkpIHN0
YXRlcyIpCj4gU2lnbmVkLW9mZi1ieTogTGkgUm9uZ1FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29t
Pgo+IC0tLQo+IERpZmYgd2l0aCB2MTogYWRkIF9fY3B1aWRsZSB0byBhY3BpX3Byb2Nlc3Nvcl9m
ZmhfbHBpX2VudGVyCj4KPiAgZHJpdmVycy9hY3BpL3Byb2Nlc3Nvcl9pZGxlLmMgfCA0ICsrLS0K
PiAgZHJpdmVycy9hY3BpL3Jpc2N2L2NwdWlkbGUuYyAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvYWNwaS9wcm9jZXNzb3JfaWRsZS5jIGIvZHJpdmVycy9hY3BpL3Byb2Nlc3Nvcl9pZGxlLmMK
PiBpbmRleCAzOTBhYjVmLi40NDgyY2YyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9wcm9j
ZXNzb3JfaWRsZS5jCj4gKysrIGIvZHJpdmVycy9hY3BpL3Byb2Nlc3Nvcl9pZGxlLmMKPiBAQCAt
MTE0Myw3ICsxMTQzLDcgQEAgc3RhdGljIGludCBhY3BpX3Byb2Nlc3Nvcl9nZXRfbHBpX2luZm8o
c3RydWN0IGFjcGlfcHJvY2Vzc29yICpwcikKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAt
aW50IF9fd2VhayBhY3BpX3Byb2Nlc3Nvcl9mZmhfbHBpX2VudGVyKHN0cnVjdCBhY3BpX2xwaV9z
dGF0ZSAqbHBpKQo+ICtpbnQgX193ZWFrIF9fY3B1aWRsZSBhY3BpX3Byb2Nlc3Nvcl9mZmhfbHBp
X2VudGVyKHN0cnVjdCBhY3BpX2xwaV9zdGF0ZSAqbHBpKQo+ICB7Cj4gICAgICAgICByZXR1cm4g
LUVOT0RFVjsKPiAgfQo+IEBAIC0xMTU2LDcgKzExNTYsNyBAQCBpbnQgX193ZWFrIGFjcGlfcHJv
Y2Vzc29yX2ZmaF9scGlfZW50ZXIoc3RydWN0IGFjcGlfbHBpX3N0YXRlICpscGkpCj4gICAqCj4g
ICAqIFJldHVybjogMCBmb3Igc3VjY2VzcyBvciBuZWdhdGl2ZSB2YWx1ZSBmb3IgZXJyb3IKPiAg
ICovCj4gLXN0YXRpYyBpbnQgYWNwaV9pZGxlX2xwaV9lbnRlcihzdHJ1Y3QgY3B1aWRsZV9kZXZp
Y2UgKmRldiwKPiArc3RhdGljIGludCBfX2NwdWlkbGUgYWNwaV9pZGxlX2xwaV9lbnRlcihzdHJ1
Y3QgY3B1aWRsZV9kZXZpY2UgKmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IGNwdWlkbGVfZHJpdmVyICpkcnYsIGludCBpbmRleCkKPiAgewo+ICAgICAgICAgc3Ry
dWN0IGFjcGlfcHJvY2Vzc29yICpwcjsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL3Jpc2N2
L2NwdWlkbGUuYyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHVpZGxlLmMKPiBpbmRleCA2MjRmOWJi
Li5jNzZkYmFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYWNwaS9yaXNjdi9jcHVpZGxlLmMKPiAr
KysgYi9kcml2ZXJzL2FjcGkvcmlzY3YvY3B1aWRsZS5jCj4gQEAgLTY2LDcgKzY2LDcgQEAgaW50
IGFjcGlfcHJvY2Vzc29yX2ZmaF9scGlfcHJvYmUodW5zaWduZWQgaW50IGNwdSkKPiAgICAgICAg
IHJldHVybiBhY3BpX2NwdV9pbml0X2lkbGUoY3B1KTsKPiAgfQo+Cj4gLWludCBhY3BpX3Byb2Nl
c3Nvcl9mZmhfbHBpX2VudGVyKHN0cnVjdCBhY3BpX2xwaV9zdGF0ZSAqbHBpKQo+ICtpbnQgX19j
cHVpZGxlIGFjcGlfcHJvY2Vzc29yX2ZmaF9scGlfZW50ZXIoc3RydWN0IGFjcGlfbHBpX3N0YXRl
ICpscGkpCj4gIHsKPiAgICAgICAgIHUzMiBzdGF0ZSA9IGxwaS0+YWRkcmVzczsKPgo+IC0tCgpT
YXNoaWtvIHNheXMgdGhhdCB0aGlzIGNoYW5nZSBtYXkgbm90IGJlIHN1ZmZpY2llbnQgdG8gZnVs
bHkgYWRkcmVzcyB0aGUgaXNzdWUKCmh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2
MDYxNjA3MjYxNy4yMjcyLTEtbGlyb25ncWluZyU0MGJhaWR1LmNvbQoKYW5kIHRoYXQgYXBwZWFy
cyB0byBiZSBhIHZhbGlkIGNvbmNlcm4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
