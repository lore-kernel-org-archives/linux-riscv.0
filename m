Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34E7C47073
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 14:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIXdEc8nvnKsWk4lwhOcCXRTVaW6L/KcrcTfc1sKydo=; b=f8YA4vimoo49Eh
	MfXA8LJuhJWPh0YzTi2Krowxum4K3o4yw4S2LQ61Y/qqlXknN92i3moJgQst05M/y01ZX1m+y3/KP
	/A2BewT/YkJmD5Evh8alitr7GPIlRu/nsGyVL68qIUVVGo2gTpc+C1MdyPYrP3FruHmG+IXpdQIAc
	4KUxuY7kOGBStLtuwVgZ83yGXQpF0tLQGBg4Z0Mz56keyPBrTKxfe1/uLM+PIx2SlKR9YjQGN7dsN
	NvAmAg1L1i7Zqcu5wxiWf766b6vKKpPyuBNVz/uzINDdIdKGiyo8LeXJ+FQJ+yLNwdkV3Uag+Gj6m
	V2Ps1ilGQZyEt0cvCzjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2E4-00B6CX-0q;
	Wed, 03 Jan 2024 14:28:08 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2E0-00B6Ar-0E;
	Wed, 03 Jan 2024 14:28:06 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2055f5ad1f2so563233fac.0;
        Wed, 03 Jan 2024 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704292078; x=1704896878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a349tfFo0Tz6+yladu1vGz3cOOaSViS9QyeDAzXiKtI=;
        b=BqezL4603Wonqv46y8EZ7HxYGoq2K4BEYc6AEjIZNoM952G7SL+R3iPC/blxLPYDPr
         fnZmz+fPu5WzdmhM8w6BM84Mxh4DNGqIOmghs+lp3SW+trekDXMweIeVuWKpmjPGQbv5
         3xOpSo+8ukuPBztCJkAuGB077wriwB8QvEUo9MX2/tVr/dgLVieBwCb1vRGLXvd0K7Gz
         genSQe/S7bKi/Gxu6rMC5Sn4x+gNeE4RZJ4w4GEBtAZRByucApBvRObFOZvbrfa92TdE
         zga4eTrVS+uArGqZjPPU+elUn9n5gnu+frjajcser/figB9Kvyf7iWDJZ1j2E1g7kAtO
         rboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704292078; x=1704896878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a349tfFo0Tz6+yladu1vGz3cOOaSViS9QyeDAzXiKtI=;
        b=iX/bAQUUR8gFpf1GS0l4l2kGqZ+yb03+F6xViIw0zZhsl18AGC5+AS3IlfmbyhRLFl
         zMcJpxe9NtuEFSyFydTadDlYe+pxvxyLAQfETTwLPDVtd8pyXPTLtJ2ibCuq1+r4mVWb
         05J6wARGjkrQ7hr052cZ2JKAV3GR0x77jDYQ0FYQcntc6H1zGywVZLaSWasdXjZFcWY1
         gijKT8jq0VX60gI+CEmn43xBqce6UAi0EI1ccTwhz7DQSUkmJtjf5dkPaOWEt8y6LxLT
         F1GwhKjV/haj2H1ff4vm6xdy+yVYc7uALYj89My+rT1JlaWzhc82jar4sfQmoV/urLTj
         OrqQ==
X-Gm-Message-State: AOJu0YxkAEyWal/vsMvA0Tr1QSwgmFwBF0J+34dg5H/TgjpQliAOs04A
	3qiuSgXVjAu9GkIkZNvxA00Vt84tsAYweIfbuzVkCcD9
X-Google-Smtp-Source: AGHT+IHjuxm+WsGold4msvLzUcwvASXsLbNWaImZQEtNmF+UM28LD4T6ctfH3u7LonFz90aecPkvdKH3c/Z8VWiEa/Q=
X-Received: by 2002:a05:6871:2b02:b0:204:32f7:6668 with SMTP id
 dr2-20020a0568712b0200b0020432f76668mr8870200oac.34.1704292078704; Wed, 03
 Jan 2024 06:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Jan 2024 09:27:47 -0500
Message-ID: <CADnq5_Pub0UULb6UqO2g+Eo6RCy=gqtWLN9txjEyp2Gmw9idww@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Unified cross-architecture kernel-mode FPU API
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_062804_137196_EB90F287 
X-CRM114-Status: GOOD (  22.35  )
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

T24gVGh1LCBEZWMgMjgsIDIwMjMgYXQgNToxMeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIHVuaWZpZXMgdGhlIGtl
cm5lbC1tb2RlIEZQVSBBUEkgYWNyb3NzIHNldmVyYWwgYXJjaGl0ZWN0dXJlcwo+IGJ5IHdyYXBw
aW5nIHRoZSBleGlzdGluZyBmdW5jdGlvbnMgKHdoZXJlIG5lZWRlZCkgaW4gY29uc2lzdGVudGx5
LW5hbWVkCj4gZnVuY3Rpb25zIHBsYWNlZCBpbiBhIGNvbnNpc3RlbnQgaGVhZGVyIGxvY2F0aW9u
LCB3aXRoIG1vc3RseSB0aGUgc2FtZQo+IHNlbWFudGljczogdGhleSBjYW4gYmUgY2FsbGVkIGZy
b20gcHJlZW1wdGlibGUgb3Igbm9uLXByZWVtcHRpYmxlIHRhc2sKPiBjb250ZXh0LCBhbmQgYXJl
IG5vdCBhc3N1bWVkIHRvIGJlIHJlZW50cmFudC4gQXJjaGl0ZWN0dXJlcyBhcmUgYWxzbwo+IGV4
cGVjdGVkIHRvIHByb3ZpZGUgQ0ZMQUdTIGFkanVzdG1lbnRzIGZvciBjb21waWxpbmcgRlBVLWRl
cGVuZGVudCBjb2RlLgo+IEZvciB0aGUgbW9tZW50LCBTSU1EL3ZlY3RvciB1bml0cyBhcmUgb3V0
IG9mIHNjb3BlIGZvciB0aGlzIGNvbW1vbiBBUEkuCj4KPiBUaGlzIGFsbG93cyB1cyB0byByZW1v
dmUgdGhlIGlmZGVmZmVyeSBhbmQgZHVwbGljYXRlZCBNYWtlZmlsZSBsb2dpYyBhdAo+IGVhY2gg
RlBVIHVzZXIuIEl0IHRoZW4gaW1wbGVtZW50cyB0aGUgY29tbW9uIEFQSSBvbiBSSVNDLVYsIGFu
ZCBjb252ZXJ0cwo+IGEgY291cGxlIG9mIHVzZXJzIHRvIHRoZSBuZXcgQVBJOiB0aGUgQU1ER1BV
IERSTSBkcml2ZXIsIGFuZCB0aGUgRlBVCj4gc2VsZiB0ZXN0Lgo+Cj4gVGhlIHVuZGVybHlpbmcg
Z29hbCBvZiB0aGlzIHNlcmllcyBpcyB0byBhbGxvdyB1c2luZyBuZXdlciBBTUQgR1BVcwo+IChl
LmcuIE5hdmkpIG9uIFJJU0MtViBib2FyZHMgc3VjaCBhcyBTaUZpdmUncyBIaUZpdmUgVW5tYXRj
aGVkLiBUaG9zZQo+IEdQVXMgbmVlZCBDT05GSUdfRFJNX0FNRF9EQ19GUCB0byBpbml0aWFsaXpl
LCB3aGljaCByZXF1aXJlcyBrZXJuZWwtbW9kZQo+IEZQVSBzdXBwb3J0LgoKU2VyaWVzIGlzOgpB
Y2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKPgo+IFBy
ZXZpb3VzIHZlcnNpb25zOgo+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1rZXJu
ZWwvMjAyMzEyMDgwNTU1MDEuMjkxNjIwMi0xLXNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20vCj4g
djA6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWtlcm5lbC8yMDIzMTEyMjAzMDYyMS4z
NzU5MzEzLTEtc2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbS8KPgo+IENoYW5nZXMgaW4gdjI6Cj4g
IC0gQWRkIGRvY3VtZW50YXRpb24gZXhwbGFpbmluZyB0aGUgYnVpbHQtdGltZSBhbmQgcnVudGlt
ZSBBUElzCj4gIC0gQWRkIGEgbGludXgvZnB1LmggaGVhZGVyIGZvciBnZW5lcmljIGlzb2xhdGlv
biBlbmZvcmNlbWVudAo+ICAtIFJlbW92ZSBmaWxlIG5hbWUgZnJvbSBoZWFkZXIgY29tbWVudAo+
ICAtIENsZWFuIHVwIGFyY2gvYXJtNjQvbGliL01ha2VmaWxlLCBsaWtlIGZvciBhcmNoL2FybQo+
ICAtIFJlbW92ZSBSSVNDLVYgYXJjaGl0ZWN0dXJlLXNwZWNpZmljIHByZXByb2Nlc3NvciBjaGVj
awo+ICAtIFNwbGl0IGFsdGl2ZWMgcmVtb3ZhbCB0byBhIHNlcGFyYXRlIHBhdGNoCj4gIC0gVXNl
IGxpbnV4L2ZwdS5oIGluc3RlYWQgb2YgYXNtL2ZwdS5oIGluIGNvbnN1bWVycwo+ICAtIERlY2xh
cmUgdGVzdF9mcHUoKSBpbiBhIGhlYWRlcgo+Cj4gTWljaGFlbCBFbGxlcm1hbiAoMSk6Cj4gICBk
cm0vYW1kL2Rpc3BsYXk6IE9ubHkgdXNlIGhhcmQtZmxvYXQsIG5vdCBhbHRpdmVjIG9uIHBvd2Vy
cGMKPgo+IFNhbXVlbCBIb2xsYW5kICgxMyk6Cj4gICBhcmNoOiBBZGQgQVJDSF9IQVNfS0VSTkVM
X0ZQVV9TVVBQT1JUCj4gICBBUk06IEltcGxlbWVudCBBUkNIX0hBU19LRVJORUxfRlBVX1NVUFBP
UlQKPiAgIEFSTTogY3J5cHRvOiBVc2UgQ0NfRkxBR1NfRlBVIGZvciBORU9OIENGTEFHUwo+ICAg
YXJtNjQ6IEltcGxlbWVudCBBUkNIX0hBU19LRVJORUxfRlBVX1NVUFBPUlQKPiAgIGFybTY0OiBj
cnlwdG86IFVzZSBDQ19GTEFHU19GUFUgZm9yIE5FT04gQ0ZMQUdTCj4gICBsaWIvcmFpZDY6IFVz
ZSBDQ19GTEFHU19GUFUgZm9yIE5FT04gQ0ZMQUdTCj4gICBMb29uZ0FyY2g6IEltcGxlbWVudCBB
UkNIX0hBU19LRVJORUxfRlBVX1NVUFBPUlQKPiAgIHBvd2VycGM6IEltcGxlbWVudCBBUkNIX0hB
U19LRVJORUxfRlBVX1NVUFBPUlQKPiAgIHg4NjogSW1wbGVtZW50IEFSQ0hfSEFTX0tFUk5FTF9G
UFVfU1VQUE9SVAo+ICAgcmlzY3Y6IEFkZCBzdXBwb3J0IGZvciBrZXJuZWwtbW9kZSBGUFUKPiAg
IGRybS9hbWQvZGlzcGxheTogVXNlIEFSQ0hfSEFTX0tFUk5FTF9GUFVfU1VQUE9SVAo+ICAgc2Vs
ZnRlc3RzL2ZwdTogTW92ZSBGUCBjb2RlIHRvIGEgc2VwYXJhdGUgdHJhbnNsYXRpb24gdW5pdAo+
ICAgc2VsZnRlc3RzL2ZwdTogQWxsb3cgYnVpbGRpbmcgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcwo+
Cj4gIERvY3VtZW50YXRpb24vY29yZS1hcGkvZmxvYXRpbmctcG9pbnQucnN0ICAgICB8IDc4ICsr
KysrKysrKysrKysrKysrKysKPiAgRG9jdW1lbnRhdGlvbi9jb3JlLWFwaS9pbmRleC5yc3QgICAg
ICAgICAgICAgIHwgIDEgKwo+ICBNYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNSArKwo+ICBhcmNoL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNiArKwo+ICBhcmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMSArCj4gIGFyY2gvYXJtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA3ICsrCj4gIGFyY2gvYXJtL2luY2x1ZGUvYXNtL2ZwdS5oICAgICAgICAgICAg
ICAgICAgICB8IDE1ICsrKysKPiAgYXJjaC9hcm0vbGliL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDMgKy0KPiAgYXJjaC9hcm02NC9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL2FybTY0L01ha2VmaWxlICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgOSArKy0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9mcHUuaCAgICAgICAg
ICAgICAgICAgIHwgMTUgKysrKwo+ICBhcmNoL2FybTY0L2xpYi9NYWtlZmlsZSAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNiArLQo+ICBhcmNoL2xvb25nYXJjaC9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvbG9vbmdhcmNoL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgICB8ICA1ICstCj4gIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL2ZwdS5oICAg
ICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDEgKwo+ICBhcmNoL3Bvd2VycGMvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNSArLQo+ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZnB1LmggICAgICAg
ICAgICAgICAgfCAyOCArKysrKysrCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDMgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ZwdS5oICAgICAg
ICAgICAgICAgICAgfCAxNiArKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwva2VybmVsX21vZGVfZnB1
LmMgICAgICAgICAgIHwgMjggKysrKysrKwo+ICBhcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gveDg2L01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDIwICsrKysrCj4gIGFyY2gveDg2L2luY2x1ZGUvYXNtL2ZwdS5o
ICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L0tjb25maWcgICAgICAgICAgIHwgIDIgKy0KPiAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2RjX2ZwdS5jICAgIHwgMzUgKy0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kbWwvTWFrZWZpbGUgICB8IDM2ICstLS0tLS0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sMi9NYWtlZmlsZSAgfCAzNiArLS0tLS0tLS0KPiAgaW5j
bHVkZS9saW51eC9mcHUuaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrCj4gIGxp
Yi9LY29uZmlnLmRlYnVnICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCj4gIGxp
Yi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI2ICstLS0tLS0K
PiAgbGliL3JhaWQ2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzEgKyst
LS0tLS0KPiAgbGliL3Rlc3RfZnB1LmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDggKysKPiAgbGliL3t0ZXN0X2ZwdS5jID0+IHRlc3RfZnB1X2dsdWUuY30gICAgICAgICAgIHwg
MzcgKystLS0tLS0tCj4gIGxpYi90ZXN0X2ZwdV9pbXBsLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8IDM3ICsrKysrKysrKwo+ICAzNyBmaWxlcyBjaGFuZ2VkLCAzNDMgaW5zZXJ0aW9ucygr
KSwgMTkwIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9j
b3JlLWFwaS9mbG9hdGluZy1wb2ludC5yc3QKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJt
L2luY2x1ZGUvYXNtL2ZwdS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2luY2x1
ZGUvYXNtL2ZwdS5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Bvd2VycGMvaW5jbHVkZS9h
c20vZnB1LmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnB1
LmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2tlcm5lbF9tb2RlX2Zw
dS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9mcHUuaAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9mcHUuaAo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgbGliL3Rlc3RfZnB1LmgKPiAgcmVuYW1lIGxpYi97dGVzdF9mcHUuYyA9PiB0ZXN0X2ZwdV9n
bHVlLmN9ICg3MSUpCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdGVzdF9mcHVfaW1wbC5jCj4K
PiAtLQo+IDIuNDIuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
