Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173F1C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lRdbpfiGrquYLoM1kw8JZOuKjy3JNF0up4sW1c1lJGk=; b=3/mQz+QlTpvlfC
	5ffW0gf3aL/4V7sf+u4H4R7ME7ActgSJ6wPW37P7FvxBLd/1KUyYypokJAAQT+grM8xPLvaQyvtGo
	2JFW9oAhA/ohLCXh2GPZKqhT27pY0cOglFs9A6liD172XEqMKoNbmQotIdNt2QtGDUYoYm223GNzp
	BdOIswtAJiM3YL26C8cz83w4/l+Btkndz/I1iVRh1fXcO2JWNCMuDuikUXlWZHt/k2ELnVThwVFqP
	C/7Q5VP0YZTT3uEzXgs/faHTGaNKJAIIgQAeJhWLTTKuHzVFaZIJVqSawcxY66fRuOjvcDJqdGdRR
	roZ4O7ozpjJ1wnEKBsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOChM-00000002IPF-3DE0;
	Mon, 01 Jul 2024 08:47:44 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOChA-00000002IJS-3qJk
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 08:47:35 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3d55ed47cc6so1869524b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 01:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719823651; x=1720428451; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT4FjvsO28ftxFn/D0RiQIRX4ThKgWSSkQhgt2BnXRM=;
        b=TFqbZ4M8gi3chqOTeCwxYAYy79NQcmx6wiw6HGSg3sHahnib2yqdYh4pPoZxxvvwxk
         eUolerGsOB8cuwbUEtcBrBcTct2I2axZeReO0aI8y6RvUlgwgKhZ1QQ50bWeK11Lz6jC
         isO8N+/4Mm1lG6evtzARQugi12GbwKjx8ZBRo+VlmH+4tHamwp4TzY81AG3+/gOekspv
         S30phdMzu0trXRDx6Xe8DFKbC2gXx2youjJ98rSqQbEWtaDDR/r4h0V/5zDOsfceDIk2
         tIOrVehaM7Ynm2YtoPFbPirRlAZodfra/SO1pO5P9gTVg3fdO0xSqaLOiNY4wfqV+opC
         LNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719823651; x=1720428451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT4FjvsO28ftxFn/D0RiQIRX4ThKgWSSkQhgt2BnXRM=;
        b=IACd2zzIszviQgeLlsfT5QJ6sAOFEfuRGon4dnDJ/wO5KlwMA0bHK5c/WHteXunO5d
         QSKNgKkgY7NCXN/Jm6pgnCK7IF9Kq8hl5Jbucj2G++JP/RwgLlmbOfTSszRsqqKXC19T
         WT0ZlPx+lAXZr9tKUY5GgASdE3TBNYJz36290s53geKlPXrXes1tzpgCA+STwFHs/2ej
         pax8isalilOm6wdBY+wPMtfJ0/JoI/jG3ZlIxKmTSuK45A34c7rQWUnybTKXT51nV1tq
         sAN5Rm68l1fhvG9l2JuEq5JaeUxFb9+aW6xnCR1yj36Oi/PD2xipF/ocG/zFikfhEv32
         0Wqw==
X-Forwarded-Encrypted: i=1; AJvYcCX8rkLuvuOwBKGX6fy3+a9xoNPJHBseIDIkRtaObyWhYNVjBnxW5iS4BxS0fkfVYJMQgyjaz0XECR2oj91eZMh9ThTfZQ3+mfTK3fthZ1FD
X-Gm-Message-State: AOJu0YxSSG1ZOt2gdcoQAcOjOOgXoYD4YTrMh/4m/HvU2VSfSNGJQ6dt
	lDcDueWkerqspdR4oTxtyzMgWvjlT7Em30s1aSmaE69p6CIHc+qCtmaxTyOgYZsQRNNt++cOucr
	MHUe/0OKamrBylr6hDzsuE40njJEoodmiOThXUw==
X-Google-Smtp-Source: AGHT+IEo9sl2VFAmozT72Mcd/Sum+ljFVLZGY4TYZg/jdAg5+RMJL9U3ru88WJ7pMksr0TPVKgSFdnKEZYRME4FZgyE=
X-Received: by 2002:a05:6808:2288:b0:3d6:331d:b52d with SMTP id
 5614622812f47-3d6b2f07e53mr7562751b6e.4.1719823651207; Mon, 01 Jul 2024
 01:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240701072908.25503-1-luxu.kernel@bytedance.com> <20240701072908.25503-2-luxu.kernel@bytedance.com>
In-Reply-To: <20240701072908.25503-2-luxu.kernel@bytedance.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Mon, 1 Jul 2024 10:47:18 +0200
Message-ID: <CAH2o1u7j6pXhWHL2rBZak6LeXxn_KUbQHjygRGQKuEfS_vmtkQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] iommu/riscv: Support sharing irq lines between iommu queues
To: Xu Lu <luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_014733_541187_E210C14D 
X-CRM114-Status: GOOD (  20.16  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux@rivosinc.com, will@kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org, xieyongji@bytedance.com, iommu@lists.linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, robin.murphy@arm.com, lihangjing@bytedance.com, baolu.lu@linux.intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMSwgMjAyNCBhdCA5OjI54oCvQU0gJ1h1IEx1JyB2aWEgbGludXggPGxpbnV4
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIHRoZSBudW1iZXIgb2Ygd2lyZWQgaW50ZXJy
dXB0IGxpbmVzIGlzIGxlc3MgdGhhbiB0aGUgbnVtYmVyIG9mCj4gaW9tbXUgcXVldWVzLCB3ZSBz
aG91bGQgYXNzaWduIG9uZSBpcnEgbGluZSBmb3Igc2V2ZXJhbCBxdWV1ZXMgYW5kCj4gY29uZmln
dXJlIGNzciBpY3ZlYyBhY2NvcmRpbmdseS4KPgoKSXMgdGhpcyBjYXNlIG5vdCBhbHJlYWR5IGNv
dmVyZWQgYnkgdGhlIGNvZGUgaW4gZnVuY3Rpb24KcmlzY3ZfaW9tbXVfaW5pdF9jaGVjaygpLCBh
c3NpZ25pbmcgY2F1c2UgdG8gdmVjdG9yIHJlZ2lzdGVyIChJQ1ZFQykKYmFzZWQgb24gYXZhaWxh
YmxlIGludGVycnVwdCB2ZWN0b3JzPyBJbnRlcnJ1cHQgdmVjdG9yIHNlbGVjdGlvbiBpcwpiYXNl
ZCBvbiBhY2NlcHRlZCBJQ1ZFQyBjb25maWd1cmF0aW9uIChzZWUgcmlzY3ZfaW9tbXVfcXVldWVf
dmVjKCkpLgoKUmVsZXZhbnQgY29kZSAocGF0Y2ggJ0NvbW1hbmQgYW5kIGZhdWx0IHF1ZXVlIHN1
cHBvcnQnKToKaW9tbXUtPmljdmVjID0gRklFTERfUFJFUChSSVNDVl9JT01NVV9JQ1ZFQ19GSVYs
IDEgJSBpb21tdS0+aXJxc19jb3VudCkgfAogICAgICAgRklFTERfUFJFUChSSVNDVl9JT01NVV9J
Q1ZFQ19QSVYsIDIgJSBpb21tdS0+aXJxc19jb3VudCkgfAogICAgICAgRklFTERfUFJFUChSSVND
Vl9JT01NVV9JQ1ZFQ19QTUlWLCAzICUgaW9tbXUtPmlycXNfY291bnQpOwoKVmFsdWVzIGluIGlv
bW11LT5pcnFzW10gc2hvdWxkIHJlcHJlc2VudCBhY3R1YWwgaW50ZXJydXB0cyBhbGxvY2F0ZWQK
Zm9yIHRoZSBkZXZpY2UuCgpCZXN0LAotIFRvbWFzegoKPiBTaWduZWQtb2ZmLWJ5OiBYdSBMdSA8
bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS1wbGF0Zm9ybS5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRmb3JtLmMg
Yi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRmb3JtLmMKPiBpbmRleCBkYTMzNjg2M2Yx
NTIuLjFkMGFmMTI2MGQ1YiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LXBsYXRmb3JtLmMKPiArKysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBsYXRmb3JtLmMK
PiBAQCAtNjAsNiArNjAsMTAgQEAgc3RhdGljIGludCByaXNjdl9pb21tdV9wbGF0Zm9ybV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgZm9yICh2ZWMgPSAwOyB2
ZWMgPCBpb21tdS0+aXJxc19jb3VudDsgdmVjKyspCj4gICAgICAgICAgICAgICAgIGlvbW11LT5p
cnFzW3ZlY10gPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIHZlYyk7Cj4KPiArICAgICAgIGZvciAo
dmVjID0gaW9tbXUtPmlycXNfY291bnQ7IHZlYyA8IFJJU0NWX0lPTU1VX0lOVFJfQ09VTlQ7IHZl
YysrKQo+ICsgICAgICAgICAgICAgICBpb21tdS0+aXJxc1t2ZWNdID0gcGxhdGZvcm1fZ2V0X2ly
cShwZGV2LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAodmVjICUgaW9tbXUtPmlycXNfY291bnQpKTsKPiArCj4gICAgICAgICAvKiBFbmFibGUg
d2lyZS1zaWduYWxlZCBpbnRlcnJ1cHRzLCBmY3RsLldTSSAqLwo+ICAgICAgICAgaWYgKCEoaW9t
bXUtPmZjdGwgJiBSSVNDVl9JT01NVV9GQ1RMX1dTSSkpIHsKPiAgICAgICAgICAgICAgICAgaW9t
bXUtPmZjdGwgfD0gUklTQ1ZfSU9NTVVfRkNUTF9XU0k7Cj4gLS0KPiAyLjIwLjEKPgo+IC0tCj4g
WW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2NyaWJlZCB0byB0
aGUgR29vZ2xlIEdyb3VwcyAibGludXgiIGdyb3VwLgo+IFRvIHVuc3Vic2NyaWJlIGZyb20gdGhp
cyBncm91cCBhbmQgc3RvcCByZWNlaXZpbmcgZW1haWxzIGZyb20gaXQsIHNlbmQgYW4gZW1haWwg
dG8gbGludXgrdW5zdWJzY3JpYmVAcml2b3NpbmMuY29tLgo+IFRvIHZpZXcgdGhpcyBkaXNjdXNz
aW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9ncm91cHMuZ29vZ2xlLmNvbS9hL3Jpdm9zaW5j
LmNvbS9kL21zZ2lkL2xpbnV4LzIwMjQwNzAxMDcyOTA4LjI1NTAzLTItbHV4dS5rZXJuZWwlNDBi
eXRlZGFuY2UuY29tLgo+IEZvciBtb3JlIG9wdGlvbnMsIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdv
b2dsZS5jb20vYS9yaXZvc2luYy5jb20vZC9vcHRvdXQuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
