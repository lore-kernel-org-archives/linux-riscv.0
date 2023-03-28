Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A707C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Mar 2023 12:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+gaNFE+/xxqfTOCEWX7OMRQaHIylAQRH/yEROGJlpX8=; b=N+k+sT8sR/0idi
	c8MsmcOm9+qoHRd56gW9LFxbsNR8EySEKVV42bwKghAxUnh034mtufAASE1Huj1x+pH8h13yJdTq3
	PDorTjeA1dxSh5lJZTFBdkFkbr/ElENNlinoI/TrOIl5bdGNYXpQbUm1o/9yXB2sDMET6yBPfUOYi
	j/xSvvlIZG4lbDkmwQHxRsurZr+c45KxaqUZsyUN0IguBntl1OYY9G4oDqtOQT0OdLm1eX7fOFfIf
	IMRj79WDpVDRTc3d/mBnsWrSDLWBxKsVMMVfPVhCcSl7h6dw1gTtu7fwSNHzlRF7txNGyjGot4p4a
	KZK5H77x60dp8TmEh7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph8sA-00ESk1-0T;
	Tue, 28 Mar 2023 12:56:22 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph8s7-00ESj4-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 28 Mar 2023 12:56:21 +0000
Received: by mail-lj1-x232.google.com with SMTP id a21so5263414ljq.10
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 05:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1680008177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY8KWhN7SgpHmmDG69ixmsCEWsblRlF4c4Kuf0LRZ4U=;
        b=STHNi84isxh9ZXSer5QGVBlpqodlAQv0aIEc4KQcUqTrufjvjQVc+2doCTXNCia7Ix
         e1tOqVdR5NrkSw4zTdv2ha6SFxiPDGLUJOVJAfqx4rZIOymKps7d13/mKDAm+mrtFOfg
         uVsZLQwNmGOKNDmr9A7KqKU67ictliVieIsf2s6xgwH0JtS0/zF2I7xz96K+cNFjeLRL
         EGyNuv+7dDZ86RVC6+QZ93T7c39pebwFXWCa+/1c+v/DOHvDjg8Q2YsIyZ3CFFY5gB/Q
         szyRDTuAxBiCWToyCrU+y+KiPkVibQ+vGGyPKGp1ZAF+z+UcHQZjYD91YlV03XtQgw/Z
         dsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680008177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pY8KWhN7SgpHmmDG69ixmsCEWsblRlF4c4Kuf0LRZ4U=;
        b=lb8rz+YbR5z5c3416jhlSvsloH1Q0HEdVgZuXTtT/H1HNu2yG4Jy+0rwmw/NoFDF43
         xM/joiQtQOq8yI2KXsbCuQLGkOJ4sALQ635iPpyNptJY54XPNvnaAdwPzsPcYrwaIMjp
         iAcQ7eNlOFPqOu0kSfTDfSomTRRXL9F5KavGiO/en0gGFzafIXQPKhCxyWfSjUWDtEWB
         YxFjksvte9oNri3qnVznGbtsnGH6P/l3qVl/EA0a4W89BdxpWv8cLwDxJyxHMv2Q7tHn
         44x+qnRsY+QseaQonFnDa/ROrQFOI0DotjULM6eCzSlQ4NOtxPmQiXfc+rjAmo9oG8L4
         HSBw==
X-Gm-Message-State: AAQBX9dL+NPbM3Y9tFNFjHTcVZBxlH9zSor72czRv8vCAJoSTHUtLVN0
	q+vAGJ5S5hxw9Q2Wh8sm69nN60kL6IcuGzZV0/QNwOkLugiAnMc8DBc=
X-Google-Smtp-Source: AKy350Y74Cl5niSL3xTzg6tRDS+C5dIVCvZ2/zCM7y3SdsWuQ+2kXtftzH5czZ368jHKUBzow/GXJOMb2pFvL1m9Gbo=
X-Received: by 2002:a2e:a175:0:b0:29c:8a14:74e6 with SMTP id
 u21-20020a2ea175000000b0029c8a1474e6mr4797617ljl.0.1680008177123; Tue, 28 Mar
 2023 05:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230323145924.4194-1-andy.chiu@sifive.com> <20230323145924.4194-20-andy.chiu@sifive.com>
 <04cc3420-26a7-4263-b120-677c758eabea@spud> <20230324145934.GB428955@dev-arch.thelio-3990X>
In-Reply-To: <20230324145934.GB428955@dev-arch.thelio-3990X>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 28 Mar 2023 20:55:00 +0800
Message-ID: <CABgGipWr8y-Of=brW2=_yiGb6EYu=b7FfXxF0sEkU=9xQ=11aA@mail.gmail.com>
Subject: Re: [PATCH -next v16 19/20] riscv: detect assembler support for
 .option arch
To: Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, vineetg@rivosinc.com, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_055619_788137_A7FE75A9 
X-CRM114-Status: GOOD (  32.28  )
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

T24gRnJpLCBNYXIgMjQsIDIwMjMgYXQgMTA6NTnigK9QTSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0
aGFuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBNYXIgMjMsIDIwMjMgYXQgMDM6MjY6
MTRQTSArMDAwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gT24gVGh1LCBNYXIgMjMsIDIwMjMg
YXQgMDI6NTk6MjNQTSArMDAwMCwgQW5keSBDaGl1IHdyb3RlOgo+ID4gPiBTb21lIGV4dGVuc2lv
bnMgdXNlIC5vcHRpb24gYXJjaCBkaXJlY3RpdmUgdG8gc2VsZWN0aXZlbHkgZW5hYmxlIGNlcnRh
aW4KPiA+ID4gZXh0ZW5zaW9ucyBpbiBwYXJ0cyBvZiBpdHMgYXNzZW1ibHkgY29kZS4gRm9yIGV4
YW1wbGUsIFpiYiB1c2VzIGl0IHRvCj4gPiA+IGluZm9ybSBhc3NtZWJsZXIgdG8gZW1pdCBiaXQg
bWFuaXB1bGF0aW9uIGluc3RydWN0aW9ucy4gSG93ZXZlciwKPiA+ID4gc3VwcG9ydGluZyBvZiB0
aGlzIGRpcmVjdGl2ZSBvbmx5IGV4aXN0IG9uIEdOVSBhc3NlbWJsZXIgYW5kIGhhcyBub3QKPiA+
ID4gbGFuZGVkIG9uIGNsYW5nIGF0IHRoZSBtb21lbnQsIG1ha2luZyBUT09MQ0hBSU5fSEFTX1pC
QiBkZXBlbmQgb24KPiA+ID4gQVNfSVNfR05VLgo+ID4gPgo+ID4gPiBXaGlsZSBpdCBpcyBzdGls
bCB1bmRlciByZXZpZXcgYXQgaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0QxMjM1MTUsIHRoZQo+
ID4gPiB1cGNvbWluZyBWZWN0b3IgcGF0Y2ggYWxzbyByZXF1aXJlcyB0aGlzIGZlYXR1cmUgaW4g
YXNzZW1ibGVyLiBUaHVzLAo+ID4gPiBwcm92aWRlIEtjb25maWcgQVNfSEFTX09QVElPTl9BUkNI
IHRvIGRldGVjdCBzdWNoIGZlYXR1cmUuIFRoZW4KPiA+ID4gVE9PTENIQUlOX0hBU19YWFggd2ls
bCBiZSB0dXJuZWQgb24gYXV0b21hdGljYWxseSB3aGVuIHRoZSBmZWF0dXJlIGxhbmQuCj4gPiA+
Cj4gPiA+IFN1Z2dlc3RlZC1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3Jn
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+
ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDggKysrKysrKy0KPiA+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4g
PiBpbmRleCAzNmE1YjZmZWQwZDMuLjRmOGZkNDAwMmYxZCAxMDA2NDQKPiA+ID4gLS0tIGEvYXJj
aC9yaXNjdi9LY29uZmlnCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gPiBAQCAt
MjQ0LDYgKzI0NCwxMiBAQCBjb25maWcgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gPiA+ICBjb25m
aWcgQVNfSEFTX0lOU04KPiA+ID4gICAgIGRlZl9ib29sICQoYXMtaW5zdHIsLmluc24gciA1MSQo
Y29tbWEpIDAkKGNvbW1hKSAwJChjb21tYSkgdDAkKGNvbW1hKSB0MCQoY29tbWEpIHplcm8pCj4g
PiA+Cj4gPiA+ICtjb25maWcgQVNfSEFTX09QVElPTl9BUkNICj4gPiA+ICsgICAjIGh0dHBzOi8v
cmV2aWV3cy5sbHZtLm9yZy9EMTIzNTE1Cj4gPiA+ICsgICBkZWZfYm9vbCB5Cj4gPiA+ICsgICBk
ZXBlbmRzIG9uICQoYXMtaW5zdHIsIC5vcHRpb24gYXJjaCQoY29tbWEpICttKQo+ID4gPiArICAg
ZGVwZW5kcyBvbiAhJChhcy1pbnN0ciwgLm9wdGlvbiBhcmNoJChjb21tYSkgLWkpCj4gPgo+ID4g
T2ggY29vbCwgSSBkaWRuJ3QgZXhwZWN0IHRoaXMgdG8gd29yayBnaXZlbiB3aGF0IE5hdGhhbiBz
YWlkIGluIGhpcwo+ID4gbWFpbCwgYnV0IEkgZ2F2ZSBpdCBhIHdoaXJsIGFuZCBpdCBkb2VzIHNl
ZW0gdG8uCj4KPiBUaGUgc2Vjb25kIGxpbmUgaXMgdGhlIGNsZXZlciBwYXJ0IG9mIHRoaXMgb3B0
aW9uIHRoYXQgSSBoYWQgbm90Cj4gY29uc2lkZXJlZCwgYXMgaXQgY2hlY2tzIGZvciBzb21ldGhp
bmcgdGhhdCBzaG91bGQgZXJyb3IgaW4gYWRkaXRpb24gdG8KPiBzb21ldGhpbmcgdGhhdCBzaG91
bGRuJ3Q6Ogo+Cj4gJCBlY2hvICcub3B0aW9uIGFyY2gsIC1pJyB8IHJpc2N2NjQtbGludXgtZ2Nj
IC1jIC1vIC9kZXYvbnVsbCAteCBhc3NlbWJsZXIgLQo+IHtzdGFuZGFyZCBpbnB1dH06IEFzc2Vt
YmxlciBtZXNzYWdlczoKPiB7c3RhbmRhcmQgaW5wdXR9OjE6IEVycm9yOiBjYW5ub3QgKyBvciAt
IGJhc2UgZXh0ZW5zaW9uIGBpJyBpbiAub3B0aW9uIGFyY2ggYC1pJwo+Cj4gTG9va2luZyBhdCBE
MTIzNTE1LCBJIHNlZSB0aGlzIHNhbWUgb3B0aW9uIHRlc3QgaXMgcHJlc2VudCBhbmQgYXBwZWFy
cwo+IHRvIGVycm9yIGluIHRoZSBzYW1lIG1hbm5lciBzbyB0aGlzIHNob3VsZCB3b3JrIHdoZW4g
dGhhdCBjaGFuZ2UgaXMKPiBtZXJnZWQuCgpUaGFua3MgZm9yIGNoZWNraW5nIEQxMjM1MTUgTmF0
aGFuLiBJdCB3YXMganVzdCBsdWNreSB0aGF0IEl0IGdldHMgdGhlCnNhbWUgdGVzdCBjb3ZlcmFn
ZSBpbiBDbGFuZy4gSSB3b3VsZCB0YWtlIGEgbG9vayBhdCB0aGF0IGFzcGVjdCBpbiB0aGUKZnV0
dXJlIGlmIHRoZSBzYW1lIGhhcHBlbnMuCgo+Cj4gUmV2aWV3ZWQtYnk6IE5hdGhhbiBDaGFuY2Vs
bG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4KPgo+ID4gSSBzdXBwb3NlOgo+ID4gUmV2aWV3ZWQtYnk6
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPgo+ID4gSSdkIHJh
dGhlciBpdCBiZSB0aGlzIHdheSBzbyB0aGF0IGl0IGlzICJoYW5kcyBvZmYiLCBhcyBvcHBvc2Vk
IHRvIHRoZQo+ID4gdmVyc2lvbiBjaGVjayB0aGF0IHdvdWxkIG5lZWQgdXBkYXRpbmcgaW4gdGhl
IGZ1dHVyZS4gQW5kIEkgZ3Vlc3MgaXQKPiA+IG1lYW5zIHRoYXQgc3VwcG9ydCBmb3IgViAmIElB
UyB3aWxsIGF1dG9tYXRpY2FsbHkgdHVybiBvbiBmb3Igc3RhYmxlCj4gPiBrZXJuZWxzIHRvbyBv
bmNlIHRoZSBMTFZNIGNoYW5nZSBsYW5kcywgd2hpY2ggaXMgbmljZSA7KQo+Cj4gVmVyeSBtdWNo
IGFncmVlZCEKPgo+ID4gVGhhbmtzIEFuZHkhCj4gPgo+ID4gPiArCj4gPiA+ICBzb3VyY2UgImFy
Y2gvcmlzY3YvS2NvbmZpZy5zb2NzIgo+ID4gPiAgc291cmNlICJhcmNoL3Jpc2N2L0tjb25maWcu
ZXJyYXRhIgo+ID4gPgo+ID4gPiBAQCAtNDQyLDcgKzQ0OCw3IEBAIGNvbmZpZyBUT09MQ0hBSU5f
SEFTX1pCQgo+ID4gPiAgICAgZGVwZW5kcyBvbiAhNjRCSVQgfHwgJChjYy1vcHRpb24sLW1hYmk9
bHA2NCAtbWFyY2g9cnY2NGltYV96YmIpCj4gPiA+ICAgICBkZXBlbmRzIG9uICEzMkJJVCB8fCAk
KGNjLW9wdGlvbiwtbWFiaT1pbHAzMiAtbWFyY2g9cnYzMmltYV96YmIpCj4gPiA+ICAgICBkZXBl
bmRzIG9uIExMRF9WRVJTSU9OID49IDE1MDAwMCB8fCBMRF9WRVJTSU9OID49IDIzOTAwCj4gPiA+
IC0gICBkZXBlbmRzIG9uIEFTX0lTX0dOVQo+ID4gPiArICAgZGVwZW5kcyBvbiBBU19IQVNfT1BU
SU9OX0FSQ0gKPiA+ID4KPiA+ID4gIGNvbmZpZyBSSVNDVl9JU0FfWkJCCj4gPiA+ICAgICBib29s
ICJaYmIgZXh0ZW5zaW9uIHN1cHBvcnQgZm9yIGJpdCBtYW5pcHVsYXRpb24gaW5zdHJ1Y3Rpb25z
Igo+ID4gPiAtLQo+ID4gPiAyLjE3LjEKPiA+ID4KPiA+ID4KPgo+CgpSZWdhcmRzLApBbmR5Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
