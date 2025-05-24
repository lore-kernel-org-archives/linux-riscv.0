Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34349C54F32
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xcHls86dAaxeif1GWQuMJHyAdzEKi149NZvAnjo1J0U=; b=cmhFsLh21ES+WN
	VYzTvjTB57JalzmXKc0pyD99o01UdxroozpX1JRYMR2uwXHBrz2GIvS7ddKzqtsIhulH9EAVN1e6L
	MDz7SOyKlgH2jXDuubxkXiGGxLom7fwnol6mgrZspUP0q8E2X0G+8vgDLbqzy56Kv8mdNjJD0V7V1
	CSbP0rID+f9SZKKuhI87AFOyZ28McjorE4RbHrkPa1r+6rPX3FDh1BgrqAID0Cr/6afvzrql1IXvC
	HZGpueBrxKoo/KlML4YwdrghcUs2SbJ9ehBpiff9GDUKW0BvvoreEeb9T8nZlVfjbFemGmOUcO6PE
	iWreSmpP3q6p5PKdjmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIlfK-00000005hUT-0J5l;
	Sat, 24 May 2025 09:59:42 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIlfH-00000005hTe-3Shy
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 09:59:40 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30db1bc464dso5911451fa.0
        for <linux-riscv@lists.infradead.org>; Sat, 24 May 2025 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748080777; x=1748685577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwk0CPkVmc1YZ0kia1s+sTbANdHsNTOd/9lbjHB/VFE=;
        b=olG8hu9eg+0S1ZWll8+nKZ6DE1VzIT2YC9Ercc+10uG+GjohrY9igU7N5SeJvt4Vtx
         q7iN/CoOiI1LiZ75WIwNoU8kZZAkWk1UndS9wAKnqaQZ3r1Ifjm7a44IhrSF7CHhuNW8
         eyKwVv/VaAiXr8GcdJoIcA6ZpmvzzCPJkviFdWj8m6E81qfxq3wrZ6Eo6/x+/vvP5beY
         ARcRitNLXcd2gCQkFVNL5l4xH+l/myKQ9HSX9St7RalGMYxBKNNQwCjQWUdO5pu3A6aH
         UW1hgeY/vQnSlGvw34xglKLYPWAobOZbosQ+zUeShPau0XqsMXnIMqPvZogIheOr+ZkZ
         +7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748080777; x=1748685577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwk0CPkVmc1YZ0kia1s+sTbANdHsNTOd/9lbjHB/VFE=;
        b=Ds8EYdJDIhfTT8K8Rify32sGDLmYql7LMckk7raxcVcUVYjPM49oKhnQw3+kfG8fnQ
         4Hrh5oRdicxV75nYNtrU+H7DIlBHrsc0MUbIikC/aSY2+ZbTVLlY9tneu2gpoPMFBA1o
         CPHR0JdxRvLJ9wo4+WK1bWUG8Dvec0r2JyMZqVHP/fwiD2rL7MdTZ138XqQz8a0DfAwY
         kfCduv1ns2Z615xQc0iVH+uy/qIouxerKCYR70Xd0xjKJJuVjz5IX/WTWrKnPqPo7ZlS
         BszeQsAepgcFFVVx3/hoVzmhxlmQkaoRkp7qJf5NiHSHzGiBcAdXJEKg437iI/x0Jsng
         Lo4w==
X-Forwarded-Encrypted: i=1; AJvYcCWzXX2S3Y5JZNijKPW6TRN7jelMaptquJiXhr7xpUkZgMtDVJcAM6liUQPF7YOBu0wg4yl4P4ajFORhSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywj148ckowPs/WLHc01dj4Dk7xXN9U+WXKoQrEvkocRgrkCirVV
	Y0520fZdlxz3sxFT5QiV6i/EjQUZ1gLi4AAGHS+YyiyFrX8RzF2OmgKtBATmuInAcYfQXJPAa8Z
	xUnMfHV2YR+Z72/0duUCvG1HB7dbleVsUZ45hhlfqRQ==
X-Gm-Gg: ASbGnctWXPYfU774c2MNC8qTsTakBh3HGOl2b51NtCXC3NvCl5eWX2JdqcAOvMVsMyN
	H8NMJRtPNlspcV0+MxJtigw0CMFKXvJobjM2SD+HNkGwDJdpF4WbzJh/hVu06fTuItC01xgUh3K
	rPIFb+JrZH9MiOhDxNWK/Oxcf67gwZZEk0
X-Google-Smtp-Source: AGHT+IHjgrohb9C7yK1DIb8LPLEOKiD2vUkC6Rdz0ITXvpl70EQUPs/0DeMIVSzjubHDmyPSRoXujAeKMH9X0LsH5zI=
X-Received: by 2002:a05:651c:1508:b0:329:23c5:6408 with SMTP id
 38308e7fff4ca-3295b9c6db5mr5687001fa.16.1748080777039; Sat, 24 May 2025
 02:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250515143723.2450630-4-rkrcmar@ventanamicro.com>
 <1a7a81fd-cf15-4b54-a805-32d66ced4517@linux.dev> <DA3CUGMQXZNW.2BF5WWE4ANFS0@ventanamicro.com>
 <CAK9=C2Xi3=9JL5f=0as2nEYKuRVTtJoL6Vdt_y2E06ta6G_07A@mail.gmail.com> <DA3FGGI5PEZG.3T26KJXT2QO8M@ventanamicro.com>
In-Reply-To: <DA3FGGI5PEZG.3T26KJXT2QO8M@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 24 May 2025 15:29:24 +0530
X-Gm-Features: AX0GCFvjN4tLJf931vhSTBQcQ-Oi7hhKwuha27TH5Ttck32Fq0uFOwLQ8zCE2Zw
Message-ID: <CAK9=C2Xbx-bHUwXXUM4oVvOhnzhK80ygvTzfMNu0-DkcLx_8Og@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] RISC-V: KVM: VCPU reset fixes
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_025939_868662_83A30281 
X-CRM114-Status: GOOD (  38.57  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMjo1MOKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDUtMjNUMTM6Mzg6MjYrMDU6MzAs
IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPjoKPiA+IE9uIEZyaSwgTWF5IDIz
LCAyMDI1IGF0IDEyOjQ34oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNy
by5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gMjAyNS0wNS0yMlQxNDo0Mzo0MC0wNzowMCwgQXRpc2gg
UGF0cmEgPGF0aXNoLnBhdHJhQGxpbnV4LmRldj46Cj4gPj4gPiBPbiA1LzE1LzI1IDc6MzcgQU0s
IFJhZGltIEtyw4Rtw4PCocOFIHdyb3RlOgo+ID4+ID4+IEhlbGxvLAo+ID4+ID4+Cj4gPj4gPj4g
dGhlIGRlc2lnbiBzdGlsbCByZXF1aXJlcyBhIGRpc2N1c3Npb24uCj4gPj4gPj4KPiA+PiA+PiBb
djMgMS8yXSByZW1vdmVzIG1vc3Qgb2YgdGhlIGFkZGl0aW9uYWwgY2hhbmdlcyB0aGF0IHRoZSBL
Vk0gY2FwYWJpbGl0eQo+ID4+ID4+IHdhcyBkb2luZyBpbiB2Mi4gIFt2MyAyLzJdIGlzIG5ldyBh
bmQgcHJldmlld3MgYSBnZW5lcmFsIHNvbHV0aW9uIHRvIHRoZQo+ID4+ID4+IGxhY2sgb2YgdXNl
cnNwYWNlIGNvbnRyb2wgb3ZlciBLVk0gU0JJLgo+ID4+ID4+Cj4gPj4gPgo+ID4+ID4gSSBhbSBz
dGlsbCBtaXNzaW5nIHRoZSBtb3RpdmF0aW9uIGJlaGluZCBpdC4gSWYgdGhlIG1vdGl2YXRpb24g
aXMgU0JJCj4gPj4gPiBIU00gc3VzcGVuZCwgdGhlIFBBVENIMiBkb2Vzbid0IGFjaGlldmUgdGhh
dCBhcyBpdCBmb3J3YXJkcyBldmVyeSBjYWxsCj4gPj4gPiB0byB0aGUgdXNlciBzcGFjZS4gV2h5
IGRvIHlvdSB3YW50IHRvIGNvbnRyb2wgaHNtIHN0YXJ0L3N0b3AgZnJvbSB0aGUKPiA+PiA+IHVz
ZXIgc3BhY2UgPwo+ID4+Cj4gPj4gSFNNIG5lZWRzIGZpeGluZywgYmVjYXVzZSBLVk0gZG9lc24n
dCBrbm93IHdoYXQgdGhlIHN0YXRlIGFmdGVyCj4gPj4gc2JpX2hhcnRfc3RhcnQgc2hvdWxkIGJl
Lgo+ID4+IEZvciBleGFtcGxlLCB3ZSBoYWQgYSBkaXNjdXNzaW9uIGFib3V0IHNjb3VudGVyZW4g
YW5kIHJlZ2FyZGxlc3Mgb2Ygd2hhdAo+ID4+IGRlZmF1bHQgd2UgY2hvb3NlIGluIEtWTSwgdGhl
IHVzZXJzcGFjZSBtaWdodCB3YW50IGEgZGlmZmVyZW50IHZhbHVlLgo+ID4+IEkgZG9uJ3QgdGhp
bmsgdGhhdCBIU00gc3RhcnQvc3RvcCBpcyBhIGhvdCBwYXRoLCBzbyB0cmFwcGluZyB0bwo+ID4+
IHVzZXJzcGFjZSBzZWVtcyBiZXR0ZXIgdGhhbiBhZGRpbmcgbW9yZSBrZXJuZWwgY29kZS4KPiA+
Cj4gPiBUaGVyZSBhcmUgbm8gaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgUy1tb2RlIENTUiByZXNl
dCB2YWx1ZXMKPiA+IHJlcXVpcmVkIGF0IHRoZSBtb21lbnQuCj4KPiBKZXNzaWNhIG1lbnRpb25l
ZCB0aGF0IEJTRCByZXF1aXJlcyBzY291bnRlcmVuIHRvIGJlIG5vbi16ZXJvLCBzbwo+IHVzZXJz
cGFjZSBzaG91bGQgYmUgYWJsZSB0byBwcm92aWRlIHRoYXQgdmFsdWUuCj4KPiBJIHdvdWxkIHBy
ZWZlciBpZiBLVk0gY291bGQgYXZvaWQgZ2V0dGluZyBpbnRvIHRob3NlIGRpc2N1c3Npb25zLgo+
IFdlIGNhbiBqdXN0IGp1c3QgbGV0IHVzZXJzcGFjZSBiZSBhcyBjcmF6eSBhcyBpdCB3YW50cy4K
ClRoZSBzdXBlcnZpc29yIE9TIG11c3Qgbm90IGV4cGVjdCBhIHBhcnRpY3VsYXIgc3RhdGUgb2Yg
Uy1tb2RlCkNTUnMgb3RoZXIgdGhhbiB3aGF0IGlzIGRlZmluZWQgaW4gdGhlIGJvb3QgcHJvdG9j
b2wgb3IgdGhlIFNCSQpzcGVjaWZpY2F0aW9uLgoKTGlrZSBtZW50aW9uZWQgYmVmb3JlLCBzY291
bnRlcmVuIHNldHVwIGluIEtWTSBSSVNDLVYgYW5kCk9wZW5TQkkgaXMgYSBIQUNLIGZvciBidWdn
eSBPU2VzIHdoaWNoIGRvbid0IHNldCB1cCBzY291bnRlcmVuCkNTUiBjb3JyZWN0bHkgd2hlbiBh
IEhBUlQgY29tZXMtdXAuIEV2ZW4gS1ZNIHVzZXIgc3BhY2UKc2hvdWxkIG5vdCBlbnRlcnRhaW4g
c3VjaCBIQUNLcy4KCj4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIFdoZW5ldmVyIHRoZSBu
ZWVkIGFyaXNlcywgd2Ugd2lsbCBleHRlbmQKPiA+IHRoZSBPTkVfUkVHIGludGVyZmFjZSBzbyB0
aGF0IHVzZXIgc3BhY2UgY2FuIHNwZWNpZnkgY3VzdG9tCj4gPiBDU1IgcmVzZXQgdmFsdWVzIGF0
IEd1ZXN0L1ZNIGNyZWF0aW9uIHRpbWUuIFdlIGRvbid0IG5lZWQgdG8KPiA+IGZvcndhcmQgU0JJ
IEhTTSBjYWxscyB0byB1c2VyIHNwYWNlIGZvciBjdXN0b20gUy1tb2RlIENTUgo+ID4gcmVzZXQg
dmFsdWVzLgo+Cj4gVGhlIGJlbmVmaXRzIG9mIGFkZGluZyBhIG5ldyBPTkVfUkVHIGludGVyZmFj
ZSBzZWVtIHZlcnkgc21hbGwgY29tcGFyZWQKPiB0byB0aGUgZHJhd2JhY2tzIG9mIGhhdmluZyBl
eHRyYSBrZXJuZWwgY29kZS4KCkZvcndhcmRpbmcgSFNNIHN0b3AgdG8gdXNlcnNwYWNlIHdpbGwg
c2xvdyBkb3duIENQVSBob3RwbHVnCm9uIEd1ZXN0IHNpZGUuIEZ1cnRoZXIsIHRoaXMgZGlyZWN0
bHkgaW1wYWN0cyBTQkkgc3lzdGVtIHN1c3BlbmQKcGVyZm9ybWFuY2UgZm9yIEd1ZXN0IGJlY2F1
c2UgR3Vlc3QgaXMgc3VwcG9zZWQgdG8gdHVybi1vZmYgYWxsClZDUFVzIGV4Y2VwdCBvbmUgYmVm
b3JlIGVudGVyaW5nIHRoZSBTQkkgc3lzdGVtIHN1c3BlbmQgc3RhdGUuCgo+Cj4gSWYgdXNlcnNw
YWNlIHdvdWxkIHdhbnQgdG8gcmVzZXQgb3Igc2V0dXAgbmV3IG11bHRpLVZDUFVzIFZNcyBvZnRl
biwgd2UKPiBjb3VsZCBhZGQgYW4gaW50ZXJmYWNlIHRoYXQgbG9hZHMgdGhlIHdob2xlIHJlZ2lz
dGVyIHN0YXRlIGZyb20KPiB1c2Vyc3BhY2UgaW4gYSBzaW5nbGUgSU9DVEwsIGJlY2F1c2UgT05F
X1JFRyBpcyBub3QgdGhlIGJlc3QgaW50ZXJmYWNlCj4gZm9yIGJ1bGsgZGF0YSB0cmFuc2ZlciBl
aXRoZXIuCgpJbnN0ZWFkIG9mIGludmVudGluZyBhIG5ldyBpbnRlcmZhY2UsIHdlIGNhbiBzaW1w
bHkgaW1wcm92ZSB0aGUKT05FX1JFRyBpbnRlcmZhY2UgdG8gYWxsb3cgYnVsayByZWFkL3dyaXRl
IG9mIG11bHRpcGxlIE9ORV9SRUcKcmVnaXN0ZXJzIHdoaWNoIHdpbGwgYmVuZWZpdCBvdGhlciBh
cmNoaXRlY3R1cmVzIGFzIHdlbGwuCgpJZiByZXF1aXJlZCBpbiB0aGUgZnV0dXJlLCB0aGlzIGJ1
bGsgT05FX1JFRyByZWFkL3dyaXRlIGludGVyZmFjZQpjYW4gYWxzbyBiZSB1c2VkIHRvIGxvYWQg
cmVzZXQgc3RhdGUgb2YgVkNQVSBDU1JzLgoKPgo+ID4+IEZvcndhcmRpbmcgYWxsIHRoZSB1bmlt
cGxlbWVudGVkIFNCSSBlY2FsbHMgc2hvdWxkbid0IGJlIGEgcGVyZm9ybWFuY2UKPiA+PiBpc3N1
ZSwgYmVjYXVzZSBTLW1vZGUgc29mdHdhcmUgd291bGQgaG9wZWZ1bGx5IGxlYXJuIGFmdGVyIHRo
ZSBmaXJzdAo+ID4+IGVycm9yIGFuZCBzdG9wIHRyeWluZyBhZ2Fpbi4KPiA+Pgo+ID4+IEFsbG93
aW5nIHVzZXJzcGFjZSB0byBmdWxseSBpbXBsZW1lbnQgdGhlIGVjYWxsIGluc3RydWN0aW9uIG9u
ZSBvZiB0aGUKPiA+PiBtb3RpdmF0aW9ucyBhcyB3ZWxsIC0tIFNCSSBpcyBub3QgYSBwYXJ0IG9m
IFJJU0MtViBJU0EsIHNvIHNvbWVvbmUgbWlnaHQKPiA+PiBiZSBpbnRlcmVzdGVkIGluIGFjY2Vs
ZXJhdGluZyBhIGRpZmZlcmVudCBNLW1vZGUgc29mdHdhcmUgd2l0aCBLVk0uCj4gPj4KPiA+PiBJ
J2xsIHNlbmQgdjQgbGF0ZXIgdG9kYXkgLS0gdGhlcmUgaXMgYSBtaXNzaW5nIHBhcnQgaW4gWzIv
Ml0sIGJlY2F1c2UKPiA+PiB1c2Vyc3BhY2UgYWxzbyBuZWVkcyB0byBiZSBhYmxlIHRvIGVtdWxh
dGUgdGhlIGJhc2UgU0JJIGV4dGVuc2lvbi4KPiA+Pgo+ID4KPiA+IFsuLi5dICAgICAgICAgIFRo
ZSBiZXN0IGFwcHJvYWNoIGlzIHRvIHNlbGVjdGl2ZWx5IGZvcndhcmQgU0JJCj4gPiBjYWxscyB0
byB1c2VyIHNwYWNlIHdoZXJlIG5lZWRlZCAoZS5nLiBTQkkgc3lzdGVtIHJlc2V0LAo+ID4gU0JJ
IHN5c3RlbSBzdXNwZW5kLCBTQkkgZGVidWcgY29uc29sZSwgZXRjLikuCj4KPiBUaGF0IGlzIGV4
YWN0bHkgd2hhdCBteSBwcm9wb3NhbCBkb2VzLCBpdCdzIGp1c3QgdGhhdCB0aGUgdXNlcnNwYWNl
IHNheXMKPiB3aGF0IGlzICJuZWVkZWQiLgoKTm9wZSwgdGhlIGFwcHJvYWNoIHRha2VuIGJ5IHlv
dXIgcGF0Y2ggaXMgcHJvYmxlbWF0aWMgYmVjYXVzZQpmb3IgZXhhbXBsZSB1c2Vyc3BhY2UgbWln
aHQgZGlzYWJsZSBTQkkgUkZFTkNFIG9yIFNCSSBQTVUKd2l0aCBubyBtZWFucyB0byBpbXBsZW1l
bnQgdGhlc2UgU0JJIGV4dGVuc2lvbnMgaW4gdXNlciBzcGFjZS4KCldlIGNhbid0IGJsaW5kbHkg
Zm9yd2FyZCBhbiBTQkkgZXh0ZW5zaW9uIHRvIHVzZXJzcGFjZSB3aGVuCnVzZXJzcGFjZSBsYWNr
cyB0aGUgY2FwYWJpbGl0eSB0byBpbXBsZW1lbnQgdGhpcyBleHRlbnNpb24uCgo+Cj4gSWYgd2Ug
c3RhcnRlZCB3aXRoIHRoaXMgbWVjaGFuaXNtLCBLVk0gd291bGQgbm90IGhhdmUgbmVlZGVkIHRv
IGFkZAo+IFNSU1QvU1VTUC9EQkNOIFNCSSBlbXVsYXRpb24gYXQgYWxsIC0tIHRoZXkgd291bGQg
YmUgZm9yd2FyZGVkIGFzIGFueQo+IG90aGVyIHVuaGFuZGxlZCBlY2FsbC4KClNCSSBTUlNUIGV4
dGVuc2lvbiBpcyBpbXBsZW1lbnRlZCBpbiBrZXJuZWwgc3BhY2UgYmVjYXVzZQp3ZSBhcmUgcmUt
dXNpbmcgdGhlIGV4aXN0aW5nIEtWTV9FWElUX1NZU1RFTV9FVkVOVCBzbwp0aGF0IHdlIGNhbiBh
bHNvIHJlLXVzZSBleGlzdGluZyBLVk1fRVhJVF9TWVNURU1fRVZFTlQKcmVsYXRlZCBjb2RlIG9u
IHVzZXJzcGFjZSBzaWRlLgoKU0JJIFNVU1AgYW5kIERCQ04gYXJlIGFscmVhZHkgZm9yd2FyZCB0
byB1c2VyIHNwYWNlIGFuZAp3ZSBvbmx5IGhhdmUgYSBtaW5pbWFsIGNvZGUgaW4ga2VybmVsIHNw
YWNlIHRvIGVuc3VyZSB0aGF0OgoxKSBJbi1rZXJuZWwgU0JJIEJBU0UgZXh0ZW5zaW9uIGlzIGF3
YXJlIG9mIHRoZXNlIGV4dGVuc2lvbnMKMikgVGhlc2UgYXJlIGZvcndhcmRlZCB0byB1c2Vyc3Bh
Y2Ugb25seSB3aGVuIHVzZXJzcGFjZQogICAgZW5hYmxlcyB0aGVzZSBleHRlbnNpb25zLgoKSW4g
YWRkaXRpb24gdG8gdGhlIGFib3ZlLCB3ZSBhcmUgYmxpbmRseSBmb3J3YXJkaW5nIFNCSQpleHBl
cmltZW50YWwgYW5kIHZlbmRvciBleHRlbnNpb25zIHRvIHVzZXIgc3BhY2Ugc28KdXNlciBzcGFj
ZSBjYW4gZG8gaXRzIG93biB0aGluZyBieSBpbXBsZW1lbnRpbmcgdGhlc2UKZXh0ZW5zaW9ucy4K
ClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
