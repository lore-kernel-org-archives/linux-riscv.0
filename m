Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37828C10F05
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 15:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6ZS89bwPDy+zWoavb2+xdKjlX1DkPHsIbrSbInBzDA=; b=GeWXbGdIANjHxB
	FOd3/V07HE4R2uTKpwateGBH76afq1z5hLkbeC9TNoDJVhOPCIJtHMGmcP6fxJebmqzpMFWixZi13
	4ds2w6n7dftK5xVSldwXgwESsQcktBeq1gV66Ga1uLBqvx8CdOFYgCmQvzpbYXp5FPOJ/yIbmices
	JSVkSIIdv4sjMbbxEP89h8smegHc8ySOmrMgE2itaJDnc34jTgFkfzR2BKWdxFibKmslCWkM+ay9V
	FWZRr2NVNIumULbdkzO3wOUyq+wz5cB5VTUnmVsH5W62N3f5w8VFwHe/5rkUwQzuAUtECoCa0Y+Ls
	85JnR58zutMZVyQSTjaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCi32-005NNo-25;
	Mon, 11 Dec 2023 15:18:20 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCi2t-005NKz-0J
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 15:18:18 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1f03d9ad89fso3150014fac.1
        for <linux-riscv@lists.infradead.org>; Mon, 11 Dec 2023 07:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702307889; x=1702912689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvXAIFU3cHSe8gZFgZZL313yZ6BsbgxanKxV0o2G4D8=;
        b=Vh2rd2zNN8H9fjWDRpn2boRBZxIsdnzVIaxV3MZZ20sihKAsZNPdnaVvI1ilPlozn7
         6uv+uDY2qZ27BGwrz8nJGu++Nm4Lka5FpEeJ7zrbYrEo/IZJJeIGYpvstWRFZAYHJKpT
         7ZZDFsiPn+fHSVU4tQYjawEcycJWSyKtnjC22Ika2gjUWHvILSoojpJZEfvgcrtbyhW0
         IOc+9dd5MDkwT5b1KOEFJ6Bzv1G34LbnZOriuLZLr8HRt+MziOPiVL/jBlX4LzhRHQ3Y
         BBCLX1CRDCQ73YhWFFPJMYabieP/0uYxN65iin9d1lUJqqVLiiHvtSvznImlRdqDfu1w
         JeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702307889; x=1702912689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvXAIFU3cHSe8gZFgZZL313yZ6BsbgxanKxV0o2G4D8=;
        b=wB53pCNzqD6TnscHU8D2A1PHyjSJLGFVNKwqIfop+Mddc06sFb07TsyxxFI2hXGs5q
         wPAgwWUJFuV6fL/MiumpJtLKd3wBPGQW52IL0et+yRIV7CX2rTZW1dZnbW5AxiHGaZ7/
         e1nLIZDvcoBRPtYgurgAyFpenVd+l6FXZ9QVbf4MogtuwTvdQlKz9bkKM0t0lRJhseHm
         KuRD32Y+G3G9LR/zvFvQLaDrTRDc6cBnlgtj4Khaifb/PumIVvugGTB7G6+ALHG4tV13
         TJff2JCoSjASTG6cZBKUAwwAD4+Cxbdd9PksNTGzQatZWnevb+fABa/0tnOKPZqipEJB
         ruyw==
X-Gm-Message-State: AOJu0Yy3rypmXkAP1q9M7AllJYTqvI0MOrRBCHxXfRUgkUTb2024KK3X
	7gRD6XfllXZdUKJVruUDV4Nkk/LvV7bVhW6Bsi4=
X-Google-Smtp-Source: AGHT+IE6Pdq+QZOPZcT87hzEwOyfLxxsaDNBp8XrIaNN3aLL6Q2E3qAZa+aCTM/ghgMcR5Uq8on+1btr2EnnabaqbsI=
X-Received: by 2002:a05:6870:b154:b0:1fb:78d7:91b8 with SMTP id
 a20-20020a056870b15400b001fb78d791b8mr5975573oal.34.1702307889216; Mon, 11
 Dec 2023 07:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com> <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X> <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
 <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com> <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
In-Reply-To: <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 11 Dec 2023 10:17:57 -0500
Message-ID: <CADnq5_O+ozkwQAEn3K_=-pB2L0+pbc+tbPU0CEwOTa+QysogAg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, llvm@lists.linux.dev, 
	Leo Li <sunpeng.li@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	linux-riscv@lists.infradead.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_071811_253315_C7EBFC26 
X-CRM114-Status: GOOD (  23.46  )
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

T24gU3VuLCBEZWMgMTAsIDIwMjMgYXQgNToxMOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFybmQsCj4KPiBPbiAyMDIzLTEyLTA5
IDI6MzggUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBPbiBGcmksIERlYyA4LCAyMDIzLCBh
dCAwNjowNCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gPj4gT24gMjAyMy0xMS0yOSA2OjQyIFBN
LCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+Pj4gT24gVGh1LCBOb3YgMjMsIDIwMjMgYXQg
MDI6MjM6MDFQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4+Pj4gT24gVHVlLCBOb3Yg
MjEsIDIwMjMgYXQgMDc6MDU6MTVQTSAtMDgwMCwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gPj4+
Pj4gUklTQy1WIHVzZXMga2VybmVsX2ZwdV9iZWdpbigpL2tlcm5lbF9mcHVfZW5kKCkgbGlrZSBz
ZXZlcmFsIG90aGVyCj4gPj4+Pj4gYXJjaGl0ZWN0dXJlcy4gRW5hYmxpbmcgaGFyZHdhcmUgRlAg
cmVxdWlyZXMgb3ZlcnJpZGluZyB0aGUgSVNBIHN0cmluZwo+ID4+Pj4+IGZvciB0aGUgcmVsZXZh
bnQgY29tcGlsYXRpb24gdW5pdHMuCj4gPj4+Pgo+ID4+Pj4gQWggeWVzLCBicmluZ2luZyB0aGUg
am95IG9mIGZyYW1lLWxhcmdlci10aGFuIHdhcm5pbmdzIHRvIFJJU0MtVjoKPiA+Pj4+IC4uL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZG1sL2RjbjMyL2Rpc3BsYXlf
bW9kZV92YmFfMzIuYzo1ODoxMzogd2FybmluZzogc3RhY2sgZnJhbWUgc2l6ZSAoMjQxNikgZXhj
ZWVkcyBsaW1pdCAoMjA0OCkgaW4gJ0RJU1BDTEtEUFBDTEtEQ0ZDTEtEZWVwU2xlZXBQcmVmZXRj
aFBhcmFtZXRlcnNXYXRlcm1hcmtzQW5kUGVyZm9ybWFuY2VDYWxjdWxhdGlvbicgWy1XZnJhbWUt
bGFyZ2VyLXRoYW5dCj4gPj4+Cj4gPj4+IDooCj4gPj4+Cj4gPj4+PiBOYXRoYW4sIGhhdmUgeW91
IGdpdmVuIHVwIG9uIHRoZXNlIGJlaW5nIHNvcnRlZCBvdXQ/Cj4gPj4+Cj4gPj4+IERvZXMgeW91
ciBjb25maWd1cmF0aW9uIGhhdmUgS0FTQU4gKEkgZG9uJ3QgdGhpbmsgUklTQy1WIHN1cHBvcnRz
Cj4gPj4+IEtDU0FOKT8gSXQgaXMgcG9zc2libGUgdGhhdCBkbWwvZGNuMzIgbmVlZHMgc29tZXRo
aW5nIHNpbWlsYXIgdG8gY29tbWl0Cj4gPj4+IDY3NDBlYzk3YmNkYiAoImRybS9hbWQvZGlzcGxh
eTogSW5jcmVhc2UgZnJhbWUgd2FybmluZyBsaW1pdCB3aXRoIEtBU0FOCj4gPj4+IG9yIEtDU0FO
IGluIGRtbDIiKT8KPiA+Pj4KPiA+Pj4gSSBhbSBub3QgcmVhbGx5IGludGVyZXN0ZWQgaW4gcGxh
eWluZyB3aGFjay1hLW1vbGUgd2l0aCB0aGVzZSB3YXJuaW5ncwo+ID4+PiBsaWtlIEkgaGF2ZSBk
b25lIGluIHRoZSBwYXN0IGZvciB0aGUgcmVhc29ucyBJIG91dGxpbmVkIGhlcmU6Cj4gPj4+Cj4g
Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnLzIwMjMxMDE5MjA1MTE3LkdBODM5OTAyQGRldi1h
cmNoLnRoZWxpby0zOTkwWC8KPiA+Pgo+ID4+IEkgYWxzbyBzZWUgb25lIG9mIHRoZXNlIHdpdGgg
Y2xhbmcgMTcgZXZlbiB3aXRoIEtBU0FOIGRpc2FibGVkOgo+ID4+Cj4gPj4gZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kbWwvZGNuMzIvZGlzcGxheV9tb2RlX3ZiYV8z
Mi5jOjM3OjY6Cj4gPj4gd2FybmluZzogc3RhY2sgZnJhbWUgc2l6ZSAoMjIwOCkgZXhjZWVkcyBs
aW1pdCAoMjA0OCkgaW4gJ2RtbDMyX3JlY2FsY3VsYXRlJwo+ID4+IFstV2ZyYW1lLWxhcmdlci10
aGFuXQo+ID4+IHZvaWQgZG1sMzJfcmVjYWxjdWxhdGUoc3RydWN0IGRpc3BsYXlfbW9kZV9saWIg
Km1vZGVfbGliKQo+ID4+Cj4gPj4gICAgICBeCj4gPj4gMTUzMi8yMjA4ICg2OS4zOCUpIHNwaWxs
cywgNjc2LzIyMDggKDMwLjYyJSkgdmFyaWFibGVzCj4gPj4KPiA+PiBTbyBJJ20gaW4gZmF2b3Ig
b2YganVzdCByYWlzaW5nIHRoZSBsaW1pdCBmb3IgdGhlc2UgZmlsZXMgZm9yIGNsYW5nLCBsaWtl
IHlvdQo+ID4+IHN1Z2dlc3RlZCBpbiB0aGUgbGlua2VkIHRocmVhZC4KPiA+Cj4gPiBIb3cgYWJv
dXQganVzdCBhZGRpbmcgYSBCVUdfT04oSVNfRU5BQkxFRChDT05GSUdfUklTQ1YpKQo+ID4gaW4g
dGhhdCBmdW5jdGlvbj8gVGhhdCBzaG91bGQgYWxzbyBhdm9pZCB0aGUgYnVpbGQgZmFpbHVyZQo+
ID4gYnV0IGdpdmUgYSBiZXR0ZXIgaW5kaWNhdGlvbiBvZiB3aGVyZSB0aGUgcHJvYmxlbSBpcwo+
ID4gaWYgc29tZW9uZSBhY3R1YWxseSBydW5zIGludG8gdGhhdCBmdW5jdGlvbiBhbmQgdHJpZ2dl
cnMKPiA+IGEgcnVudGltZSBzdGFjayBvdmVyZmxvdy4KPgo+IFdvbid0IHRoYXQgYnJlYWsgYWN0
dWFsIHVzZXJzIG9mIHRoZSBkcml2ZXIsIHRyYWRpbmcgYW4gdW5saWtlbHkgYnV0Cj4gdGhlb3Jl
dGljYWxseSBwb3NzaWJsZSBzdGFjayBvdmVyZmxvdyBmb3IgYSBndWFyYW50ZWVkIGNyYXNoPyBU
aGUgaW50ZW50IG9mIHRoaXMKPiBzZXJpZXMgaXMgdGhhdCBJIGhhdmUgb25lIG9mIHRoZXNlIEdQ
VXMgcGx1Z2dlZCBpbiB0byBhIFJJU0MtViBib2FyZCwgYW5kIEkgd2FudAo+IHRvIHVzZSBpdC4K
CkRvZXMgdGhpcyBwYXRjaCBhZGRyZXNzIHRoZSBpc3N1ZT8KaHR0cHM6Ly9naXRsYWIuZnJlZWRl
c2t0b3Aub3JnL2FnZDVmL2xpbnV4Ly0vY29tbWl0LzcyYWRhODYwM2UzNjI5MWFkOTFlNGY0MGYx
MGVmNzQyZWY3OWJjNGUKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
