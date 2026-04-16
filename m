Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44AEF8A141
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 08:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/R3mQKWrlRgUiKOTlOZWnDFWfROGowvMoCLVd10sylk=; b=ogJ+KWO1FcrVn1
	ADIYe4a/8F35SbVA4BKpdIjNTNs+iuR0HbGdlzHgn4aOfVUFPyGMuKZjC+XCZnAs6i/NXn9cQ8FIN
	lDj70D03Bcd3xV2WA03IJ9eNm83SlFAloCdNMUPmS00dqVNx06dKSvniWmlMAgLI8+s46d0PYJA7b
	mBNZqSG/hdHgcnag30mYC6AtYSdGIERBdIYhwF5Q2vVDxtlBXeIB0+Bq6JdlA68V2Fg2YZf6/SSUE
	oEzB/tGAtz9Zfuk9KIcTItqMYn7PkAFfGG+gt1nT3jHom2dbN1DZnIykWPhKvdY7L3rkvVM5kBT2s
	alOE5XC4yUdmVbu2fe6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHwS-00000002ASI-11lF;
	Thu, 16 Apr 2026 08:19:16 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDHwQ-00000002ARs-0FiG
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 08:19:15 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-651d692e833so3736652d50.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Apr 2026 01:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776327552; cv=none;
        d=google.com; s=arc-20240605;
        b=X+gd12Nc2Lx0Y4tooTmm34yIAVfkMCDDFKDDXd7AfUJ86bDZYyhC0uic1Oecs2zGpU
         cLqDcV99YrEuRD+MnjWPdaE6bwgLhSRU0iEHvE8LcAqaTq/Kq7wktJzWIYZ/Wc49DDKE
         u3tzDLW/F+RQIoGpmL29DDn0Q1AJwqdvbSu5ro85bJSh4AYEjTtFZuE7zws7WUX8bXHN
         /kxNcUM4tqW9Y7kXMnRHHV8mBS3FXqQznkuTwwzoFpBey9ROwgSlTD1xYnm9zhzqZvs3
         E1vj0FGyPn1Sb/ZBfR4gOz4H2+EunagFJwqSbctzzHubzWJafLVQr4FKFH+ULMNd1s3p
         c7oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UYfM78rx5R3ZVmMPKEfuM0RYI+r7ma+Zgwh+UTlTNLE=;
        fh=A4uxF/1HKYntHAvk12zACXjndwQtvQLiroeiD5xGa9s=;
        b=lQVnFsqZIcj4GpZXnNSVBgRmVItJB+HUkK8bw/pVZOJbxGBeEsj7RkDGk2oaqnNEif
         EENNw8F8uAJkmJXwdxWwI0ZXxpGXS0GuQwjVEQX/+bQKMrJI3zM2QrJvgiP7MZVxNagd
         tmRVEcPmjH7bpDs49uoUgPFjBsL5i0x+iQcWQ+kENI6en7yvONEPbWy9JZLN3yDh+Ntn
         ZUCLHP/u9N3ZSXcyBHoL7EjuV8GDpU71FrrE9jx923hDJc/Igx/B0GEKyrdCgWmQb7Aq
         5p6eyF7og9uRwuSNd/Ktk+3w7jg7DS/cdNWybHBhzRzMt64QeqO+0lrzPcFLfF8UD88+
         vZyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776327552; x=1776932352; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYfM78rx5R3ZVmMPKEfuM0RYI+r7ma+Zgwh+UTlTNLE=;
        b=kB0+AxTBPIHItK69PcDwtcRR4UcAEABA6bcPtQMymgeT2m8qQd8ZAWufS+F2FFoS4M
         DmC+csGMOUH7tP1wN9ojW1NF+/SlygEdV6nlyQ8T/U2V60dY3xo9yMOkN52IJrPOKB1B
         JxICQdvL5cDlWcfsMtFJCKiYoFZ0uAk+Bgkr3S/2dGJt6cpfAmw9+dxnKJnjm/6/mMKH
         zGXo2bZbIiEBRiEe/HnWPMDh1uIdfwHaqt3Z348e/F065h6LCELHvZWXjK4Qfc0CGLe4
         zggurlZ07d96WDGcLnqepuACnkxdqVGLJJYqsbJCPDkzYqQr8mlDYUKPdTBXL2nKS11c
         n16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327552; x=1776932352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UYfM78rx5R3ZVmMPKEfuM0RYI+r7ma+Zgwh+UTlTNLE=;
        b=ELRUUx/rcq9Wx4lirBDzax2ENmbx0nS003MQUCyH6bzHyXNLYjHCBwKCPv2wYSTL45
         ko+Dxfjn1GxUYj1N9nZHYQk8c2j+J8p0LDM+ORCdL7Fm5syu0L2SfgzlAluEG6QcEPsh
         ReOb/qF+n4XMX3IY/WClOH/LZnzov5xhhy4C6pWT8BCA0SlsrJ+PRAO5kViN1p/3NHyc
         2AgjxW/PU7cJwcaKqlyCd+WOsAMD+oo5/t/PmL3C7KpKYnp1pbSFgjrnu/vRS/qSPvpP
         fISGQ4IT4J5YnZsmUdG8giG3V4ng5RR+T4/h6eWxCopimjhe+eXXMIApmD+8gjq53U0P
         IzwQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZxBLQalGeViz+P64UkZWtFYwuT3ExcOMUVqNsA0WmwrFTtyNAZDxtL4O+xc0o5K/O7BicygvMNg5eyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEKGyjER/iYaLcmiuWLe/NoUQ5L2yuZXLDSnY2402d/iRN+cp8
	kTqljtw9jSkj3s852zmaeyhYGsgTISjMmJk0ODpy58WxHRThOSM2XO2R5d7lQnIB0GKMSBLiZ+F
	weO4cW4gfUx+dkm/qYdOWPyZEbfN0sSM=
X-Gm-Gg: AeBDiesA44EBvRgJ9VcdAf8Atm2CVndp/ytAgw+jgFTG8NqRfIAifSZj2azScx8BQKm
	FH7CQb4obHQUGFuTacBgX568awjFGbXo3zs8LuUqpiH7rJTfu8rFiC64Ta0TRDgCM6C9n5gFP04
	Jqg/xrUU8wFs6Z/GbyKv6PakUZrlOEvPI6RWYFUwARCkiBAude2WDffBxy+/amOjBo09PF+BaXt
	ym221IooVfOXOBoJvYPEL2bvj90k3XLuiiRAtRfnLvTeKAMX0CVLw3JBHw5aY0fvuBgb0x1hgES
	Ek6wp9l6LdLHl+wr9V0=
X-Received: by 2002:a05:690e:bc3:b0:651:becf:4523 with SMTP id
 956f58d0204a3-651becf5113mr15959082d50.62.1776327551592; Thu, 16 Apr 2026
 01:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
 <f58ec12c-3957-4d44-b823-6a1ae1a1dd94@kernel.org> <CABdCQ=NhTkGJUh_fKnZoQMzdpyO-UbV5zrSfiNVUC7bkSBifTA@mail.gmail.com>
 <DHSQ6VG82QYX.1EVAYV9JTBCL7@linux.dev>
In-Reply-To: <DHSQ6VG82QYX.1EVAYV9JTBCL7@linux.dev>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 16 Apr 2026 10:18:59 +0200
X-Gm-Features: AQROBzCXo6p3fgZAxRfHTUW7b152HxWrs_jxAbTxvFG6AIyn1RGKEh6tq-Z2nFo
Message-ID: <CABdCQ=Oata1oXds6pV-RipwZjcztM0xk_J=Rk8Of2w2RqegbHA@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] riscv: spacemit: enable SD card support with UHS
 modes for OrangePi RV2
To: Troy Mitchell <troy.mitchell@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_011914_131550_F310211A 
X-CRM114-Status: GOOD (  25.95  )
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Vincent Legoll <legoll@online.fr>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Yixun Lan <dlan@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RWwgbWFyLCAxNCBhYnIgMjAyNiBhIGxhcyAxMDoxNiwgVHJveSBNaXRjaGVsbAooPHRyb3kubWl0
Y2hlbGxAbGludXguZGV2PikgZXNjcmliacOzOgo+Cj4gT24gVHVlIEFwciAxNCwgMjAyNiBhdCAz
OjEyIFBNIENTVCwgSWtlciBQZWRyb3NhIHdyb3RlOgo+ID4gRWwgbHVuLCAxMyBhYnIgMjAyNiBh
IGxhcyAxMDowNywgS3J6eXN6dG9mIEtvemxvd3NraQo+ID4gKDxrcnprQGtlcm5lbC5vcmc+KSBl
c2NyaWJpw7M6Cj4gPj4KPiA+PiBPbiAxMy8wNC8yMDI2IDEwOjAyLCBJa2VyIFBlZHJvc2Egd3Jv
dGU6Cj4gPj4gPiBUaGlzIHNlcmllcyBlbmFibGVzIGNvbXBsZXRlIFNEIGNhcmQgc3VwcG9ydCBm
b3IgdGhlIFNwYWNlbWl0IEsxLWJhc2VkCj4gPj4gPiBPcmFuZ2VQaSBSVjIgYm9hcmQsIGluY2x1
ZGluZyBVSFMgKFVsdHJhIEhpZ2ggU3BlZWQpIG1vZGVzIGZvcgo+ID4+ID4gaGlnaC1wZXJmb3Jt
YW5jZSBTRCBjYXJkIG9wZXJhdGlvbi4KPiA+PiA+Cj4gPj4gPiBCYWNrZ3JvdW5kCj4gPj4gPgo+
ID4+ID4gVGhlIFNwYWNlbWl0IEsxIFNvQyBpbmNsdWRlcyBhbiBTREhDSSBjb250cm9sbGVyIGNh
cGFibGUgb2Ygc3VwcG9ydGluZwo+ID4+ID4gU0QgY2FyZHMgdXAgdG8gVUhTLUkgc3BlZWRzIChT
RFIxMDQgYXQgMjA4TUh6KS4gSG93ZXZlciwgbWFpbmxpbmUKPiA+PiA+IGN1cnJlbnRseSBsYWNr
cyBiYXNpYyBTRCBjb250cm9sbGVyIGNvbmZpZ3VyYXRpb24sIFNESENJIGRyaXZlcgo+ID4+ID4g
ZW5oYW5jZW1lbnRzIGZvciB2b2x0YWdlIHN3aXRjaGluZyBhbmQgdHVuaW5nLCBhbmQgcG93ZXIg
bWFuYWdlbWVudAo+ID4+ID4gaW5mcmFzdHJ1Y3R1cmUuCj4gPj4gPgo+ID4+ID4gSW1wbGVtZW50
YXRpb24KPiA+PiA+Cj4gPj4gPiBUaGUgc2VyaWVzIGVuYWJsZXMgU0QgY2FyZCBzdXBwb3J0IHRo
cm91Z2ggY29vcmRpbmF0ZWQgbGF5ZXJzOgo+ID4+ID4KPiA+PiA+IC0gSGFyZHdhcmUgaW5mcmFz
dHJ1Y3R1cmUgKHBhdGNoZXMgMS0yKTogRGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHZvbHRhZ2UK
PiA+PiA+IHN3aXRjaGluZyBoYXJkd2FyZSBhbmQgZXNzZW50aWFsIGNsb2NrIGluZnJhc3RydWN0
dXJlLgo+ID4+ID4gLSBTREhDSSBkcml2ZXIgZW5oYW5jZW1lbnRzIChwYXRjaGVzIDMtNyk6IFJl
Z3VsYXRvciBmcmFtZXdvcmsKPiA+PiA+IGludGVncmF0aW9uLCBwaW5jdHJsIHN0YXRlIHN3aXRj
aGluZyBmb3Igdm9sdGFnZSBkb21haW5zLCBBSUIgcmVnaXN0ZXIKPiA+PiA+IHByb2dyYW1taW5n
LCBhbmQgY29tcHJlaGVuc2l2ZSBTRFIgdHVuaW5nIHN1cHBvcnQgZm9yIHJlbGlhYmxlIFVIUwo+
ID4+ID4gb3BlcmF0aW9uLgo+ID4+ID4gLSBTb0MgYW5kIGJvYXJkIGludGVncmF0aW9uIChwYXRj
aGVzIDgtMTApOiBDb21wbGV0ZSBLMSBTb0MgY29udHJvbGxlcgo+ID4+ID4gZGVmaW5pdGlvbnMs
IFBNSUMgcG93ZXIgaW5mcmFzdHJ1Y3R1cmUsIGFuZCBPcmFuZ2VQaSBSVjIgYm9hcmQgZW5hYmxl
bWVudAo+ID4+ID4gd2l0aCBmdWxsIFVIUyBzdXBwb3J0Lgo+ID4+ID4KPiA+PiA+IFRoaXMgdHJh
bnNmb3JtcyB0aGUgT3JhbmdlUGkgUlYyIGZyb20gaGF2aW5nIG5vIFNEIGNhcmQgc3VwcG9ydCB0
byBmdWxsCj4gPj4gPiBVSFMtSSBjYXBhYmlsaXR5LCBlbmFibGluZyBoaWdoLXBlcmZvcm1hbmNl
IHN0b3JhZ2UgdXAgdG8gMjA4TUh6Lgo+ID4+ID4KPiA+PiA+IFRlc3RlZC1ieTogTWljaGFlbCBP
cGRlbmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAcm9vdGNvbW1pdC5jb20+Cj4gPj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBJa2VyIFBlZHJvc2EgPGlrZXJwZWRyb3NhbUBnbWFpbC5jb20+Cj4gPj4gPiAt
LS0KPiA+PiA+IENoYW5nZXMgaW4gdjg6Cj4gPj4gPiAtIFJlc2VuZGluZyB0aGUgc2VyaWVzIGFz
IHY4LiBUaGUgdjcgc3VibWlzc2lvbiBmYWlsZWQgZHVlIHRvIGFuIFNNVFAKPiA+PiA+ICAgZXJy
b3IgZHVyaW5nIHRyYW5zaXQsIHdoaWNoIHJlc3VsdGVkIGluIGEgYnJva2VuIHRocmVhZCBvbiB0
aGUgbWFpbGluZwo+ID4+ID4gICBsaXN0Lgo+ID4+Cj4gPj4gSG0/IEV2ZXJ5dGhpbmcgaXMgaGVy
ZToKPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA0MTMtb3JhbmdlcGktc2Qt
Y2FyZC11aHMtdjctMS0xNjY1MGY0OWMwMjJAZ21haWwuY29tLwo+ID4+Cj4gPj4gWW91IGNhbiBz
ZW5kIGluZGl2aWR1YWwgcGF0Y2hlcyB0byBmaXggdXAgdGhyZWFkaW5nLCB1c2UgLS1pbi1yZXBs
eS10by4KPiA+Cj4gPiBNeSBhcG9sb2dpZXMgZm9yIHRoZSBub2lzZSBhbmQgdGhlIHJhcGlkIHJl
c2VuZC4KPiA+Cj4gPiBUaGUgcmVhc29uIGZvciB2OCB3YXMgdGhhdCB0aGUgdjcgY292ZXIgbGV0
dGVyICgwLzkpIGZhaWxlZCB0byByZWFjaAo+ID4gdGhlIG1haWxpbmcgbGlzdCBkdWUgdG8gYW4g
U01UUCBlcnJvciBvbiBteSBlbmQuIFRoaXMgbGVmdCB0aGUgdjcKPiA+IHRocmVhZCAiaGVhZGxl
c3MiIGluIHRoZSBhcmNoaXZlcyB3aXRob3V0IHRoZSBjaGFuZ2Vsb2cgb3IgdGhlIGZ1bGwKPiA+
IGNvbnRleHQgb2YgdGhlIHNlcmllcy4gSSB3YXMgYXR0ZW1wdGluZyB0byBmaXggdGhlIHRocmVh
ZGluZwo+ID4gaW1tZWRpYXRlbHkgc28gdGhhdCByZXZpZXdlcnMgd291bGQgaGF2ZSBhIGNvbXBs
ZXRlIHNldCBvZiBwYXRjaGVzIHRvCj4gPiBsb29rIGF0LCBidXQgSSByZWFsaXplIG5vdyB0aGF0
IHJlc2VuZGluZyB0aGUgZW50aXJlIHNlcmllcyBvbiB0aGUKPiA+IHNhbWUgZGF5IHdhcyBwcmVt
YXR1cmUuCj4gU28gdGhhdCdzIHdoeSBLcnp5c3p0b2Ygc2FpZCB5b3Ugc2hvdWxkIHNlbmQgaW5k
aXZpZHVhbCBwYXRjaCB3aXRoIC0taW4tcmVwbHktdG8uCgpJIHNlZSwgdGhhbmtzIGZvciB0aGUg
Y2xhcmlmaWNhdGlvbi4gSnVzdCB0byBjbGFyaWZ5IGZvciBteSBmdXR1cmUKd29ya2Zsb3c6IGlz
IGl0IGFjY2VwdGFibGUgZm9yIGEgc2VyaWVzIHRvIGJlICdoZWFkbGVzcycgKHN0YXJ0aW5nCndp
dGggUGF0Y2ggMSkgaWYgdGhlIGNvdmVyIGxldHRlciBpcyBsb3N0LCBvciBpcyB0aGUgY292ZXIg
bGV0dGVyCihQYXRjaCAwKSBzdHJpY3RseSByZXF1aXJlZCBhcyB0aGUgdGhyZWFkIHJvb3Q/CgpJ
biBzdWNoIGNhc2VzLCB3b3VsZCBpdCBiZSBiZXR0ZXIgdG8ganVzdCBzZW5kIHRoZSBtaXNzaW5n
IGNvdmVyCmxldHRlciBhcyBhIHJlcGx5IHRvIFBhdGNoIDEgYWZ0ZXJ3YXJkIHRvIGNvbXBsZXRl
IHRoZSB0aHJlYWQgd2l0aG91dApyZXNlbmRpbmcgdGhlIHdob2xlIHNlcmllcz8KCj4KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gVHJveQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
