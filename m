Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D213C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 18:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpHcaY6FIo++0w3vkIYQk0b/AwOrMqVC96h0dqQMs7o=; b=AN5sD7+Prc2d/G
	NPPzl/70tO2LRvK+e/qdtpVHViX9Q6fPmDC2WPxVi+Fm8SMkquyrUSwmwp1EqGOR2737G7LCk36ve
	5/+JBxemN/92mH1KhNj5v2JXUkZbt/wrooVpjPzdiXxZwirKOnK2e1ftvfC4bubWtPkqFXdhhimEU
	9w8ao366Eo10fT4+K7oZ40sEyNnS7Fn7E76OeWyCghWTHEvuAe/iFUi8uC4OpWnypy0oXjnB53nHf
	EhMrENxraWziRH11aCYA5cZeQdbNYhsESsf+qfvgMOplX7UJes2W74E8ZOFin2naQDbG7cgFha2Sn
	yDTiMBkB77wrw0OMTT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ULx-00000000mtj-1jWK;
	Tue, 21 May 2024 18:36:49 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ULt-00000000mrX-3hDL
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 18:36:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a59e4136010so941789666b.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716316602; x=1716921402; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLyU2aNbp4OgiW+TMwuCji93HtnrvdXX6qL+T9597uE=;
        b=WKPgo+LrqrKXz49uPiPHc1NxGS02wyiEXWWkHaOzQxV9fhaj8Zj+v2H88QTjsOCmMz
         SlZKTVHMEeipMQjW0/0xKO7tqproD6sqeRtHAzyWevJDGzzQUxjCaYvdFK8zsvARqGSf
         44F7o2o5u5Ty5v3O2G1glfcLlDk5nVKnzSJ42XRZ0/xhqbxK6ugLQFUBEpk9lo6J26lx
         5uR2uLv9hl38RqT/NespYEIgRsTwSyfeR85gi8KxrPPlYNpjqo8YrQxMNjJRTGf/of8/
         FuozhCx5IqZx9YrpiLEgLIAxC3TXo3E20bhlI4AuTDmWChQ+FvL3tB2MCpOeFNfapR3S
         8mtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716316602; x=1716921402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLyU2aNbp4OgiW+TMwuCji93HtnrvdXX6qL+T9597uE=;
        b=uM3R4o01aFiJ8RVRe+7uyvsaKuTplKaT2XOH7lmEdb60aIrtMVCj04YPpj/3YEEmEy
         xJn1mGM6aVd90oL++uTnuf0HxU+qusJZbvg4rUidaTDTtikmye9ffTOK3K8EdI5dHfr9
         lPW+GnmRB49hjnONRcqhvKawMeY0rPqz3zJgDU0mVFnvyAbW1VJwI7Mvyv3jgIk1bzn7
         LgoN/OZsflCYpARd1NgxBpvBsX3J4GyhWtVIJcf0ig6MW+alL6NCJHkhDVDq77boLRME
         xS12LMpFcGzEGcv0ElihhbAyySl9va3g0NYii7KPC86uiCpxOmj1Jps7WJNMmFpCEM/t
         45CA==
X-Gm-Message-State: AOJu0YxWtKuJdP/PyyajZ1BZFSWPPvzCIwAMNMndZJ/lwXTHUh59tIvf
	APE7kdsjh5k9W+1PiB1WK7b7MZAeOG2iuUVCM9nVpD5ry7Rj7PzEBsq0Ig0I/SqnjpTNI8nDETi
	e8gV5B6kNDX4W65Jrjln+6N6MEg9fFVTB759PqQ==
X-Google-Smtp-Source: AGHT+IH0TkrWekL947oxL52MJFhjwXzyz7BwC25c5dh4y5BPrRiD/+EoDq6AAoPxQg5Y2/xKIgyzXSkv/EJ86BIyTYc=
X-Received: by 2002:a17:906:97c8:b0:a5a:a2b6:ba8b with SMTP id
 a640c23a62f3a-a5aa2b6bf6fmr1215235666b.0.1716316602491; Tue, 21 May 2024
 11:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_9D721BDDF88C04DBB5151D57711D62524209@qq.com> <tencent_338DF690631BAE788C4CC858233E9FBAE006@qq.com>
In-Reply-To: <tencent_338DF690631BAE788C4CC858233E9FBAE006@qq.com>
From: Evan Green <evan@rivosinc.com>
Date: Tue, 21 May 2024 11:36:06 -0700
Message-ID: <CALs-HssGcNso6vTfbcsiWX1h_46jgDDRcEWcfZCTpxXYnubcng@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: riscv: hwprobe: Clarify misaligned keys are
 values not bitmasks
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Elliott Hughes <enh@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_113646_138588_F9F31961 
X-CRM114-Status: GOOD (  23.51  )
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

T24gU2F0LCBNYXkgMTgsIDIwMjQgYXQgOTowMOKAr0FNIFlhbmd5dSBDaGVuIDxjeXlAY3l5c2Vs
Zi5uYW1lPiB3cm90ZToKPgo+IFRoZSBvcmlnaW5hbCBkb2N1bWVudGF0aW9uIHNheXMgaHdwcm9i
ZSBrZXlzIGFyZSBiaXRtYXNrcywgYnV0IGFjdHVhbGx5LAo+IHRoZXkgYXJlIHZhbHVlcy4gVGhp
cyBwYXRjaCBjbGFyaWZpZXMgdGhpcyB0byBhdm9pZCBjb25mdXNpb24uCj4KPiBTaWduZWQtb2Zm
LWJ5OiBZYW5neXUgQ2hlbiA8Y3l5QGN5eXNlbGYubmFtZT4KCkhtLCB3ZSBhbHNvIGhhdmUgdGhp
cyBwcm9ibGVtIGluIHRoZSBjb2RlLCBzaW5jZQpod3Byb2JlX2tleV9pc19iaXRtYXNrKCkgcmV0
dXJucyB0cnVlIGZvciBLRVlfQ1BVUEVSRl8wLiBUaGlzIHJlc3VsdHMKaW4gd3JvbmcgaW5mb3Jt
YXRpb24gYmVpbmcgcmV0dXJuZWQgZm9yIHF1ZXJpZXMgdXNpbmcgdGhlIFdISUNIX0NQVQpmbGFn
LiBJZiB1c2VybW9kZSBhc2tlZCBmb3IgdGhlIHNldCBvZiBDUFVzIHRoYXQgd2FzIHNwZWNpZmlj
YWxseSBTTE9XCm9yIEVNVUxBVEVELCB0aGUgcmV0dXJuZWQgY3B1c2V0IHdvdWxkIGFsc28gaW5j
bHVkZSBjcHVzIHRoYXQgd2VyZQpGQVNULiBJIGJlbGlldmUgYWxsIG90aGVyIHF1ZXJpZXMgYXJl
IG9rYXkuCgpUaGUgb25lLWxpbmVyIGZpeCBpcyB0byBqdXN0IG5vdCByZXR1cm4gdHJ1ZSBmb3Ig
dGhhdCBrZXkgaW4KaHdwcm9iZV9rZXlfaXNfYml0bWFzaygpLiBCdXQgdGhhdCdzIHRlY2huaWNh
bGx5IHVzZXItdmlzaWJsZTogaWYgc29tZQpzb2Z0d2FyZSByZWxpZWQgb24gdGhlIGJ1Z2d5IGJl
aGF2aW9yIG9mIEZBU1QgY3B1cyBiZWluZyBzd2VwdCB1cCBpbgp0aGUgcXVlcnkgZm9yIFNMT1cg
b3IgRU1VTEFURUQgY3B1cywgdGhpcyBjaGFuZ2Ugd291bGQgZXhwb3NlIHRoYXQuClRoZSBncm93
bnVwcy1lYXQtdGhlaXItdmVnZXRhYmxlcyB0aGluZyB0byBkbyB3b3VsZCBiZSB0byBkZWZpbmUg
YSBuZXcKa2V5IHRoYXQgcmV0dXJucyB0aGlzIHNhbWUgdmFsdWUsIGJ1dCBkb2Vzbid0IHJldHVy
biB0cnVlIGluCmh3cHJvYmVfa2V5X2lzX2JpdG1hc2soKS4gV2hhdCBkbyBwZW9wbGUgdGhpbms/
CgotRXZhbgoKPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IHwg
MzEgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5z
ZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0IGIvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJv
YmUucnN0Cj4gaW5kZXggMjM5YmU2M2Y1MDg5Li40YWJmYTNmOWZlNDQgMTAwNjQ0Cj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0Cj4gQEAgLTE4OCwyNSArMTg4LDMwIEBAIFRoZSBmb2xs
b3dpbmcga2V5cyBhcmUgZGVmaW5lZDoKPiAgICAgICAgIG1hbnVhbCBzdGFydGluZyBmcm9tIGNv
bW1pdCA5NWNmMWY5ICgiQWRkIGNoYW5nZXMgcmVxdWVzdGVkIGJ5IFZlZAo+ICAgICAgICAgZHVy
aW5nIHNpZ25vZmYiKQo+Cj4gLSogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZf
MGA6IEEgYml0bWFzayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCj4gKyogOmM6bWFjcm86YFJJ
U0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgdmFsdWUgdGhhdCBjb250YWlucyBwZXJmb3Jt
YW5jZQo+ICAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQgb2YgcHJvY2Vzc29y
cy4KPgo+IC0gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktOT1dOYDog
VGhlIHBlcmZvcm1hbmNlIG9mIG1pc2FsaWduZWQKPiAtICAgIHNjYWxhciBhY2Nlc3NlcyBpcyB1
bmtub3duLgo+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9NQVNLYDog
VGhlIGJpdG1hc2sgb2YgdGhlIG1pc2FsaWduZWQKPiArICAgIGFjY2VzcyBwZXJmb3JtYW5jZSBm
aWVsZCBpbiB0aGUgdmFsdWUgb2Yga2V5IGBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgLgo+
Cj4gLSAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEYDogTWlz
YWxpZ25lZCBzY2FsYXIgYWNjZXNzZXMgYXJlCj4gLSAgICBlbXVsYXRlZCB2aWEgc29mdHdhcmUs
IGVpdGhlciBpbiBvciBiZWxvdyB0aGUga2VybmVsLiAgVGhlc2UgYWNjZXNzZXMgYXJlCj4gLSAg
ICBhbHdheXMgZXh0cmVtZWx5IHNsb3cuCj4gKyAgICBUaGUgZm9sbG93aW5nIHZhbHVlcyAobm90
IGJpdG1hc2tzKSBpbiB0aGlzIGZpZWxkIGFyZSBkZWZpbmVkOgo+Cj4gLSAgKiA6YzptYWNybzpg
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1NMT1dgOiBNaXNhbGlnbmVkIHNjYWxhciBhY2Nlc3Nl
cyBhcmUKPiAtICAgIHNsb3dlciB0aGFuIGVxdWl2YWxlbnQgYnl0ZSBhY2Nlc3Nlcy4gIE1pc2Fs
aWduZWQgYWNjZXNzZXMgbWF5IGJlIHN1cHBvcnRlZAo+IC0gICAgZGlyZWN0bHkgaW4gaGFyZHdh
cmUsIG9yIHRyYXBwZWQgYW5kIGVtdWxhdGVkIGJ5IHNvZnR3YXJlLgo+ICsgICAgKiA6YzptYWNy
bzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV05gOiBUaGUgcGVyZm9ybWFuY2Ugb2Yg
bWlzYWxpZ25lZAo+ICsgICAgICBzY2FsYXIgYWNjZXNzZXMgaXMgdW5rbm93bi4KPgo+IC0gICog
OmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9GQVNUYDogTWlzYWxpZ25lZCBzY2Fs
YXIgYWNjZXNzZXMgYXJlCj4gLSAgICBmYXN0ZXIgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNz
ZXMuCj4gKyAgICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURURg
OiBNaXNhbGlnbmVkIHNjYWxhciBhY2Nlc3NlcyBhcmUKPiArICAgICAgZW11bGF0ZWQgdmlhIHNv
ZnR3YXJlLCBlaXRoZXIgaW4gb3IgYmVsb3cgdGhlIGtlcm5lbC4gIFRoZXNlIGFjY2Vzc2VzIGFy
ZQo+ICsgICAgICBhbHdheXMgZXh0cmVtZWx5IHNsb3cuCj4KPiAtICAqIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX01JU0FMSUdORURfVU5TVVBQT1JURURgOiBNaXNhbGlnbmVkIHNjYWxhciBhY2Nl
c3Nlcwo+IC0gICAgYXJlIG5vdCBzdXBwb3J0ZWQgYXQgYWxsIGFuZCB3aWxsIGdlbmVyYXRlIGEg
bWlzYWxpZ25lZCBhZGRyZXNzIGZhdWx0Lgo+ICsgICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9C
RV9NSVNBTElHTkVEX1NMT1dgOiBNaXNhbGlnbmVkIHNjYWxhciBhY2Nlc3NlcyBhcmUKPiArICAg
ICAgc2xvd2VyIHRoYW4gZXF1aXZhbGVudCBieXRlIGFjY2Vzc2VzLiAgTWlzYWxpZ25lZCBhY2Nl
c3NlcyBtYXkgYmUgc3VwcG9ydGVkCj4gKyAgICAgIGRpcmVjdGx5IGluIGhhcmR3YXJlLCBvciB0
cmFwcGVkIGFuZCBlbXVsYXRlZCBieSBzb2Z0d2FyZS4KPiArCj4gKyAgICAqIDpjOm1hY3JvOmBS
SVNDVl9IV1BST0JFX01JU0FMSUdORURfRkFTVGA6IE1pc2FsaWduZWQgc2NhbGFyIGFjY2Vzc2Vz
IGFyZQo+ICsgICAgICBmYXN0ZXIgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMuCj4gKwo+
ICsgICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOU1VQUE9SVEVEYDog
TWlzYWxpZ25lZCBzY2FsYXIgYWNjZXNzZXMKPiArICAgICAgYXJlIG5vdCBzdXBwb3J0ZWQgYXQg
YWxsIGFuZCB3aWxsIGdlbmVyYXRlIGEgbWlzYWxpZ25lZCBhZGRyZXNzIGZhdWx0Lgo+Cj4gICog
OmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1pJQ0JPWl9CTE9DS19TSVpFYDogQW4gdW5zaWdu
ZWQgaW50IHdoaWNoCj4gICAgcmVwcmVzZW50cyB0aGUgc2l6ZSBvZiB0aGUgWmljYm96IGJsb2Nr
IGluIGJ5dGVzLgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
