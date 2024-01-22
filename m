Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9C7C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 18:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEJ1yzyNmTOGge+acExKKw5UinFMaVRR1TLGhgDXvc0=; b=qxZ2l8K4EFXir9
	MGKZenedox8+xE4bWy+LbMKV84hj/b3xLsodhC1N6BKI/mc+/aVP6AChz1VZc/1ydAblg3hLkZJ0c
	dHyZmehaz+6LeX6NRT7wWZeR3pvDufWV0Dc5DMz2+jFntQgr9apdxCQvNKwb2519oqhxK34RVBsIh
	+8LAnxRnkpVSIRhAJz5hdDxXZPgPcJOmYos2VmTpoU1KKGVi5fHnBS8E4HKU7K+VMFldoyTYtQ/0s
	lRxp5YLqwIa+Rg0X0iGMo8h4piaLRmIRKu044l6f7Dr5YBAzHZruErtkmx7jyIjjwmHYJXUfkeAgZ
	Kr4OSjJE3SiRT3u4i5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyeL-00DPS2-1z;
	Mon, 22 Jan 2024 18:03:57 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRyeH-00DPQG-2j;
	Mon, 22 Jan 2024 18:03:55 +0000
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78370566ae3so76871285a.1;
        Mon, 22 Jan 2024 10:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705946631; x=1706551431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s26G0NnkppbXguh7peNPWPJ5jelauHZoMn0Xk4NSQUw=;
        b=HhnkDChwi3bGElyeb8vBOuVKgeI1CHJxsZb2AZs/xIgRdXDwQ5jjjejsujGAj7jRn4
         nx3UWLAQKbFjeejNwqwYqhTE6XaxmRsDtVqA5kVTGjPKzGvkAUaDuSW8gu3wUQvkaPzK
         L9k/ek0K1EVzos/1sGDklNzDiBHAlnEzJC9mxcgHs/vkl0Orh71fY1id/idR2J5zx3C4
         udOmTF6Yy8H0rtxZULYfQFehmjRGzr7elURkMyc9KAMsu1G36j/grlhusN/NZXlqt/vN
         dz89xLd+UahVda6Rbq2N95recpyDobAVlwDvDeWrlqaquwT3OPiJVFO6OWG4/ZPFwaCV
         Zb9w==
X-Gm-Message-State: AOJu0YxxOuVc/IH0dV2QWZiFyr7qOYMbK8FZ2cwGgxkgHEUkLnY9fkep
	nuZnxDQPNthHKa3l9Hw313gC1yH9qHYm4/hNR6Xy6geq1rcc1DqbP4D4bmKUD0SOQgG4tFvL+Wz
	CIJu3zEXsMMEWDfrL/1opZYxG6cdGGRvNGSk=
X-Google-Smtp-Source: AGHT+IHydxkoIcTGgPnithAm3ZZ3Lbs6GLo4uCDeUNHWYMYJDcQ7kkQEBWJsEM9NkDfdwTNwYrCyeGF8yf+5uFu9gbc=
X-Received: by 2002:a4a:cb87:0:b0:599:9e03:68da with SMTP id
 y7-20020a4acb87000000b005999e0368damr789760ooq.0.1705946610762; Mon, 22 Jan
 2024 10:03:30 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOg7-00Dvjq-VZ@rmk-PC.armlinux.org.uk>
 <CAJZ5v0je=-oVnSumZs=dzcyVuVUeVeTgO7yOnjGg1igyrS7EHQ@mail.gmail.com> <20240122174449.00002f78@Huawei.com>
In-Reply-To: <20240122174449.00002f78@Huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 22 Jan 2024 19:03:19 +0100
Message-ID: <CAJZ5v0gePAsbRecOXDZ+q-Ds+nsoSBq6VU89ikuQoxds7TeQ3g@mail.gmail.com>
Subject: Re: [PATCH RFC v3 04/21] ACPI: processor: Register all CPUs from acpi_processor_get_info()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, 
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_100353_882596_521FC4F7 
X-CRM114-Status: GOOD (  26.18  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgNjo0NOKAr1BNIEpvbmF0aGFuIENhbWVyb24KPEpvbmF0
aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIDE4IERlYyAyMDIzIDIx
OjMwOjUwICswMTAwCj4gIlJhZmFlbCBKLiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Cj4gPiBPbiBXZWQsIERlYyAxMywgMjAyMyBhdCAxOjQ54oCvUE0gUnVzc2VsbCBLaW5n
IDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZyb206IEph
bWVzIE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+ID4gPgo+ID4gPiBUbyBhbGxvdyBBQ1BJ
IHRvIHNraXAgdGhlIGNhbGwgdG8gYXJjaF9yZWdpc3Rlcl9jcHUoKSB3aGVuIHRoZSBfU1RBCj4g
PiA+IHZhbHVlIGluZGljYXRlcyB0aGUgQ1BVIGNhbid0IGJlIGJyb3VnaHQgb25saW5lIHJpZ2h0
IG5vdywgbW92ZSB0aGUKPiA+ID4gYXJjaF9yZWdpc3Rlcl9jcHUoKSBjYWxsIGludG8gYWNwaV9w
cm9jZXNzb3JfZ2V0X2luZm8oKS4KPiA+Cj4gPiBUaGlzIGtpbmQgb2YgbG9va3MgYmFja3dhcmRz
IHRvIG1lIGFuZCBoYXMgYSBwb3RlbnRpYWwgdG8gYmVjb21lCj4gPiBzdXBlci1jb25mdXNpbmcu
Cj4gPgo+ID4gSSB3b3VsZCBpbnN0ZWFkIGFkZCBhIHdheSBmb3IgdGhlIGdlbmVyaWMgY29kZSB0
byBhc2sgdGhlIHBsYXRmb3JtCj4gPiBmaXJtd2FyZSB3aGV0aGVyIG9yIG5vdCB0aGUgZ2l2ZW4g
Q1BVIGlzIGVuYWJsZWQgYW5kIHNvIGl0IGNhbiBiZQo+ID4gcmVnaXN0ZXJlZC4KPgo+IEhpIFJh
ZmFlbCwKPgo+IFRoZSBBQ1BJIGludGVycHJldGVyIGlzbid0IHVwIGF0IHRoaXMgc3RhZ2Ugc28g
d2UnZCBuZWVkIHRvIHB1bGwgdGhhdAo+IGZvcndhcmRzLiBJJ20gbm90IHN1cmUgaWYgd2UgY2Fu
IHB1bGwgdGhlIGludGVycHJldGVyIGluaXQgZWFybHkgZW5vdWdoLgoKV2VsbCwgdGhpcyBwYXRj
aCBlZmZlY3RpdmVseSBkZWZlcnMgdGhlIEFQIHJlZ2lzdHJhdGlvbiB0byB0aGUgdGltZQp3aGVu
IGFjcGlfcHJvY2Vzc29yX2dldF9pbmZvKCkgcnVucyBhbmQgdGhlIGludGVycHJldGVyIGlzIHVw
IGFuZApydW5uaW5nIHRoZW4uCgpGb3IgY29uc2lzdGVuY3ksIGl0IHdvdWxkIGJlIGJldHRlciB0
byBkZWZlciB0aGUgQVAgcmVnaXN0cmF0aW9uIGluCmdlbmVyYWwgdG8gdGhhdCBwb2ludC4KCj4g
UGVyaGFwcyBwdXNoaW5nIHRoZSByZWdpc3RyYXRpb24gYmFjayBpbiBhbGwgY2FzZXMgaXMgdGhl
IHdheSB0byBnbz8KPiBHaXZlbiB0aGUgYWNwaSBpbnRlcnByZXR0ZXIgaXMgaW5pdGlhbGl6ZWQg
dmlhIHN1YnN5c19pbml0Y2FsbCgpIGl0IHdvdWxkCj4gbmVlZCB0byBiZSBhZnRlciB0aGF0IC0g
SSB0cmllZCBwdXNoaW5nIGNwdV9kZXZfcmVnaXN0ZXJfZ2VuZXJpYygpCj4gaW1tZWRpYXRlbHkg
YWZ0ZXIgYWNwaV9idXNfaW5pdCgpIGFuZCB0aGF0IHNlZW1zIGZpbmUuCgpTb3VuZHMgcHJvbWlz
aW5nLgoKPiBXZSBjYW4ndCBsZWF2ZSB0aGUgcmVzdCBvZiBjcHVfZGV2X2luaXQoKSB0aGF0IGxh
dGUgYmVjYXVzZSBhIGJ1bmNoCj4gb2Ygb3RoZXIgc3R1ZmYgcmVsaWVzIG9uIGl0IChDUFUgZnJl
cSBibG93cyB1cCBmaXJzdCBhcyBhIGNvcmVfaW5pdCgpCj4gb24gbXkgc2V0dXApLgoKSSBzZWUu
Cgo+IFNvIHRvIG1ha2UgdGhpcyB3b3JrIHdlIG5lZWQgaXQgdG8gYWx3YXlzIG1vdmUgdGhlIHJl
Z2lzdHJhdGlvbiBsYXRlcgo+IHRoYW4gdGhlIG5lY2Vzc2FyeSBpbmZyYXN0cnVjdHVyZSwgcGVy
aGFwcyB0byBzdWJzeXNfaW5pdGNhbGxfc3luYygpCj4gYXMgaXMgZG9uZSBmb3IgbWlzc2luZyBD
UFVzICh3ZSdkIG5lZWQgdG8gY29tYmluZSB0aGUgdHdvIGdpdmVuIHRoYXQKPiBuZWVkcyB0byBy
dW4gYWZ0ZXIgdGhpcywgb3IgcG90ZW50aWFsbHkganVzdCBzdG9wIGNoZWNraW5nIGZvciBhY3Bp
X2Rpc2FibGVkCj4gYW5kIGRvbid0IHRhaW50IHRoZSBrZXJuZWwhKS4gIEkgdGhpbmsgdGhpcyBp
cyBwcm9iYWJseSB0aGUgbW9zdCBjb25zaXN0ZW50Cj4gb3B0aW9uIG9uIGJhc2lzIGl0IGF0IGxl
YXN0IG1vdmVzIHRoZSByZWdpc3RyYXRpb24gdG8gdGhlIHNhbWUgcG9pbnQKPiB3aGF0ZXZlciBp
cyBnb2luZyBvbiBhbmQgY2FuIGVhc2lseSB1c2UgdGhlIGFyY2ggY2FsbGJhY2sgeW91IHN1Z2dl
c3QKPiB0byBoaWRlIGF3YXkgdGhlIGxvZ2ljIG9uIGRlY2lkaW5nIGlmIGEgQ1BVIGlzIHRoZXJl
IG9yIG5vdC4KCkkgYWdyZWUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
