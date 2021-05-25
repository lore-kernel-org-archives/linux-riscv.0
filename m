Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AC8C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 08:53:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C62CE613AD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 08:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C62CE613AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjNs69QpG4Yu3H0S+Eiqnsc6HGjOKwMQMf8wfXoYt+Y=; b=NvxTP/wOIjVKnN
	an8P1kP+6FEEdbrwJN1sKUZEhnjBr2u1r++fyEtHvqlR713bDQ87FNI9rChEM6FA0ry3lIzk/7wu3
	RMdQPLlzhDDQKt9DwAXTLSIl1fEMaoXGR0ZluSVWuMSkSuckot52sN8QmP0jwpNhCrAsPNWf8im5A
	LFTxPX5EYNLiscTQbamBn8HHMz5unMY9uz9Uv8sY+eSMM9KXZWuApCRHJ8wokb8vFTi0JhEkUM+A4
	lVR7MNPTpznIzVyT0KUyiCjCJn1dmUf+fYsBGz/9JSu6VoId5xX4gVhgGBleRA4+c53ZrWDb2E4ai
	GWKrAldQlZXDXfJo8vpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llSnp-004Bka-SP; Tue, 25 May 2021 08:52:41 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llSnl-004Bi5-CE
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 08:52:39 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso27950852ote.1
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 01:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=S983RmEN+zCzGygvTomJowV0VqiLAFWLutr88hzTzxw=;
 b=DbQN+qgl1anJcSKUR0sYPQRpRiflWrFMnrR7kkeYJy0FQ5VD0ZE57trudkUUgESzSf
 ytqU5GoQ/xzctSsN4DItUI57KUC5v7TwHPali4oP10CnFzx+z3kWE2ynujI3t557WNhW
 8O5z8wKHIEpUUACm3x+3ToIuvY0pfSQFe4s/vgD4mXA+OUbuSLj89jzZTSB6a+jClPsE
 /2AHzsU05IImCxEYHZN8NWOtHc1e9U7aOekTUS6djnDJ8dSQWidxLq+R+E/flRMvz4bg
 y8eztIXisoRD9hfuhcwfqPk9eSLS/RvJ396xIg6zyPkrYFwNuemzZ36XMkEVjZ6Td94v
 fQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S983RmEN+zCzGygvTomJowV0VqiLAFWLutr88hzTzxw=;
 b=mN1d1x8T2ooADanc9P2wbe91W3e56ZKuN0eB2TLdM0pZsgqb4rgRq/CXvYKJHSoMsk
 9IUrbi8lgs29pA5Onv2z/7AMJNUPMXDyXfKNnhixwtNuiTleJ/JsqI3ABEhQrAAVrgaZ
 p2K50lc+zvTr4cu2pdS2bKct5EHVlBZy0w5c8HdBWHErsrVsABhx+63HHO4to3gN0ffZ
 huKMfa0gt+C8TOfElPFgqxTN5/9R9r18FcwmS1L9SBS5NmXXi21RNqyCtzl3abJC84j2
 N7+Wma5zsllKUaKunxLtRIhrS5GKd5RYnq71kHmBwDaRzYoeAJb0S3RoO5MtNOEDM6DJ
 wH4A==
X-Gm-Message-State: AOAM533GQRyA+CKAOYBLLuZGeXFSuWbyXkkBl6DwDymypmvjq9IWPKxM
 DVNObz6F93KZmIXk1fd/k5d82tmu7OtNA70t9bgzBg==
X-Google-Smtp-Source: ABdhPJxI8s2jTZ5Bz7kX5AUrHHR69TdApWCOpzJQDD2JTfJhGMoCahNrKr3EGl7b+eYguFtbLZxwQg9nWVtbAy5BeZQ=
X-Received: by 2002:a05:6830:349b:: with SMTP id
 c27mr23119899otu.251.1621932754928; 
 Tue, 25 May 2021 01:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-f2825fd1-15e0-403d-b972-d327494525e6@palmerdabbelt-glaptop>
 <0b584a85-79e2-fcdd-2adf-5b63f56cc591@huawei.com>
In-Reply-To: <0b584a85-79e2-fcdd-2adf-5b63f56cc591@huawei.com>
From: Marco Elver <elver@google.com>
Date: Tue, 25 May 2021 10:52:23 +0200
Message-ID: <CANpmjNPuhUVMdVYNMaQc1NARzp2w+A8A6F16L=WmzWpJOWz_sg@mail.gmail.com>
Subject: Re: [PATCH RFC v2] riscv: Enable KFENCE for riscv64
To: Liu Shixin <liushixin2@huawei.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_015237_463430_AB43F458 
X-CRM114-Status: GOOD (  30.48  )
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

T24gTW9uLCAyNCBNYXkgMjAyMSBhdCAwMzo1NiwgTGl1IFNoaXhpbiA8bGl1c2hpeGluMkBodWF3
ZWkuY29tPiB3cm90ZToKPiBPbiAyMDIxLzUvMjMgMTA6MzgsIFBhbG1lciBEYWJiZWx0IHdyb3Rl
Ogo+ID4gT24gRnJpLCAxNCBNYXkgMjAyMSAwODoyMDoxMCBQRFQgKC0wNzAwKSwgZWx2ZXJAZ29v
Z2xlLmNvbSB3cm90ZToKPiA+PiBPbiBGcmksIDE0IE1heSAyMDIxIGF0IDA1OjExLCBMaXUgU2hp
eGluIDxsaXVzaGl4aW4yQGh1YXdlaS5jb20+IHdyb3RlOgo+ID4+PiBBZGQgYXJjaGl0ZWN0dXJl
IHNwZWNpZmljIGltcGxlbWVudGF0aW9uIGRldGFpbHMgZm9yIEtGRU5DRSBhbmQgZW5hYmxlCj4g
Pj4+IEtGRU5DRSBmb3IgdGhlIHJpc2N2NjQgYXJjaGl0ZWN0dXJlLiBJbiBwYXJ0aWN1bGFyLCB0
aGlzIGltcGxlbWVudHMgdGhlCj4gPj4+IHJlcXVpcmVkIGludGVyZmFjZSBpbiA8YXNtL2tmZW5j
ZS5oPi4KPiA+Pj4KPiA+Pj4gS0ZFTkNFIHJlcXVpcmVzIHRoYXQgYXR0cmlidXRlcyBmb3IgcGFn
ZXMgZnJvbSBpdHMgbWVtb3J5IHBvb2wgY2FuCj4gPj4+IGluZGl2aWR1YWxseSBiZSBzZXQuIFRo
ZXJlZm9yZSwgZm9yY2UgdGhlIGtmZW5jZSBwb29sIHRvIGJlIG1hcHBlZCBhdAo+ID4+PiBwYWdl
IGdyYW51bGFyaXR5Lgo+ID4+Pgo+ID4+PiBJIHRlc3RlZCB0aGlzIHBhdGNoIHVzaW5nIHRoZSB0
ZXN0Y2FzZXMgaW4ga2ZlbmNlX3Rlc3QuYyBhbmQgYWxsIHBhc3NlZC4KPiA+Pj4KPiA+Pj4gU2ln
bmVkLW9mZi1ieTogTGl1IFNoaXhpbiA8bGl1c2hpeGluMkBodWF3ZWkuY29tPgo+ID4+Cj4gPj4g
QWNrZWQtYnk6IE1hcmNvIEVsdmVyIDxlbHZlckBnb29nbGUuY29tPgo+ID4+Cj4gPj4KPiA+Pj4g
LS0tCj4gPj4+IHYxLT52MjogQ2hhbmdlIGttYWxsb2MoKSB0byBwdGVfYWxsb2Nfb25lX2tlcm5l
bCgpIGZvciBhbGxvY2F0aW5nIHB0ZS4KPiA+Pj4KPiA+Pj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAg
ICAgICAgICAgICAgfCAgMSArCj4gPj4+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tmZW5jZS5o
IHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPj4+ICBhcmNoL3Jpc2N2
L21tL2ZhdWx0LmMgICAgICAgICAgIHwgMTEgKysrKysrLQo+ID4+PiAgMyBmaWxlcyBjaGFuZ2Vk
LCA2MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZmVuY2UuaAo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPj4+IGluZGV4IGM0
MjZlN2QyMDkwNy4uMDAwZDhhYmExMDMwIDEwMDY0NAo+ID4+PiAtLS0gYS9hcmNoL3Jpc2N2L0tj
b25maWcKPiA+Pj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPj4+IEBAIC02NCw2ICs2NCw3
IEBAIGNvbmZpZyBSSVNDVgo+ID4+PiAgICAgICAgIHNlbGVjdCBIQVZFX0FSQ0hfSlVNUF9MQUJF
TF9SRUxBVElWRQo+ID4+PiAgICAgICAgIHNlbGVjdCBIQVZFX0FSQ0hfS0FTQU4gaWYgTU1VICYm
IDY0QklUCj4gPj4+ICAgICAgICAgc2VsZWN0IEhBVkVfQVJDSF9LQVNBTl9WTUFMTE9DIGlmIE1N
VSAmJiA2NEJJVAo+ID4+PiArICAgICAgIHNlbGVjdCBIQVZFX0FSQ0hfS0ZFTkNFIGlmIE1NVSAm
JiA2NEJJVAo+ID4+PiAgICAgICAgIHNlbGVjdCBIQVZFX0FSQ0hfS0dEQgo+ID4+PiAgICAgICAg
IHNlbGVjdCBIQVZFX0FSQ0hfS0dEQl9RWEZFUl9QS1QKPiA+Pj4gICAgICAgICBzZWxlY3QgSEFW
RV9BUkNIX01NQVBfUk5EX0JJVFMgaWYgTU1VCj4gPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2tmZW5jZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rZmVuY2UuaAo+
ID4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmMyNWQ2
N2UwYjhiYQo+ID4+PiAtLS0gL2Rldi9udWxsCj4gPj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va2ZlbmNlLmgKPiA+Pj4gQEAgLTAsMCArMSw1MSBAQAo+ID4+PiArLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+Pj4gKwo+ID4+PiArI2lmbmRlZiBfQVNNX1JJ
U0NWX0tGRU5DRV9ICj4gPj4+ICsjZGVmaW5lIF9BU01fUklTQ1ZfS0ZFTkNFX0gKPiA+Pj4gKwo+
ID4+PiArI2luY2x1ZGUgPGxpbnV4L2tmZW5jZS5oPgo+ID4+PiArI2luY2x1ZGUgPGxpbnV4L3Bm
bi5oPgo+ID4+PiArI2luY2x1ZGUgPGFzbS1nZW5lcmljL3BnYWxsb2MuaD4KPiA+Pj4gKyNpbmNs
dWRlIDxhc20vcGd0YWJsZS5oPgo+ID4+PiArCj4gPj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgYXJj
aF9rZmVuY2VfaW5pdF9wb29sKHZvaWQpCj4gPj4+ICt7Cj4gPj4+ICsgICAgICAgaW50IGk7Cj4g
Pj4+ICsgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyOwo+ID4+PiArICAgICAgIHB0ZV90ICpwdGU7
Cj4gPj4+ICsgICAgICAgcG1kX3QgKnBtZDsKPiA+Pj4gKwo+ID4+PiArICAgICAgIGZvciAoYWRk
ciA9ICh1bnNpZ25lZCBsb25nKV9fa2ZlbmNlX3Bvb2w7IGlzX2tmZW5jZV9hZGRyZXNzKCh2b2lk
ICopYWRkcik7Cj4gPj4+ICsgICAgICAgICAgICBhZGRyICs9IFBBR0VfU0laRSkgewo+ID4+PiAr
ICAgICAgICAgICAgICAgcHRlID0gdmlydF90b19rcHRlKGFkZHIpOwo+ID4+PiArICAgICAgICAg
ICAgICAgcG1kID0gcG1kX29mZl9rKGFkZHIpOwo+ID4+PiArCj4gPj4+ICsgICAgICAgICAgICAg
ICBpZiAoIXBtZF9sZWFmKCpwbWQpICYmIHB0ZV9wcmVzZW50KCpwdGUpKQo+ID4+PiArICAgICAg
ICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+Pj4gKwo+ID4+PiArICAgICAgICAgICAgICAg
cHRlID0gcHRlX2FsbG9jX29uZV9rZXJuZWwoJmluaXRfbW0pOwo+ID4+PiArICAgICAgICAgICAg
ICAgZm9yIChpID0gMDsgaSA8IFBUUlNfUEVSX1BURTsgaSsrKQo+ID4+PiArICAgICAgICAgICAg
ICAgICAgICAgICBzZXRfcHRlKHB0ZSArIGksIHBmbl9wdGUoUEZOX0RPV04oX19wYSgoYWRkciAm
IFBNRF9NQVNLKSArIGkgKiBQQUdFX1NJWkUpKSwgUEFHRV9LRVJORUwpKTsKPiA+Pj4gKwo+ID4+
PiArICAgICAgICAgICAgICAgc2V0X3BtZChwbWQsIHBmbl9wbWQoUEZOX0RPV04oX19wYShwdGUp
KSwgUEFHRV9UQUJMRSkpOwo+ID4+PiArICAgICAgICAgICAgICAgZmx1c2hfdGxiX2tlcm5lbF9y
YW5nZShhZGRyLCBhZGRyICsgUE1EX1NJWkUpOwo+ID4+PiArICAgICAgIH0KPiA+Pj4gKwo+ID4+
PiArICAgICAgIHJldHVybiB0cnVlOwo+ID4+PiArfQo+ID4KPiA+IEknbSBub3QgZnVuZGFtZW50
YWxseSBvcHBvc2VkIHRvIHRoaXMsIGJ1dCB0aGUgYXJtNjQgYXBwcm9hY2ggd2hlcmUgcGFnZXMg
YXJlIHNwbGl0IGF0IHJ1bnRpbWUgd2hlbiB0aGV5IGhhdmUgbWlzLW1hdGNoZWQgcGVybWlzc2lv
bnMgc2VlbXMgY2xlYW5lciB0byBtZS4gIEknbSBub3Qgc3VyZSB3aHkgeDg2IGlzIGRvaW5nIGl0
IGR1cmluZyBpbml0LCB0aG91Z2gsIGFzIElJVUMgc2V0X21lbW9yeV80aygpIHdpbGwgd29yayBm
b3IgYm90aC4KPiA+Cj4gPiBVcGdyYWRpbmcgb3VyIF9fc2V0X21lbW9yeSgpIHdpdGggdGhlIGFi
aWxpdHkgdG8gc3BsaXQgcGFnZXMgKGxpa2UgYXJtNjQgaGFzKSBzZWVtcyBnZW5lcmFsbHkgdXNl
ZnVsLCBhbmQgd291bGQgbGV0IHVzIHRyaXZpYWxseSBpbXBsZW1lbnQgdGhlIGR5bmFtaWMgdmVy
c2lvbiBvZiB0aGlzLiAgV2UnbGwgcHJvYmFibHkgZW5kIHVwIHdpdGggdGhlIGFiaWxpdHkgdG8g
c3BsaXQgcGFnZXMgYW55d2F5LCBzbyB0aGF0IHdvdWxkIGJlIHRoZSBsZWFzdCBjb2RlIGluIHRo
ZSBsb25nIHJ1bi4KPiA+Cj4gPiBJZiB0aGVyZSdzIHNvbWUgcmVhc29uIHRvIHByZWZlciBzdGF0
aWNhbGx5IGFsbG9jYXRpbmcgdGhlIHBhZ2VzIEknbSBmaW5lIHdpdGggdGhpcywgdGhvdWdoLgo+
ID4KPiBBcyBJIHVuZGVyc3RhbmTvvIx0aGUgYXJtNjQgYXBwcm9hY2ggZG9lcyBub3QgaW1wbGVt
ZW50IGR5bmFtaWMgc3BsaXR0aW5nLgo+IElmIGtmZW5jZSBpcyBlbmFibGVkIGluIGFyY2ggYXJt
NjQsIHRoZSBsaW5lYXIgbWFwIG5lZWQgdG8gYmUgZm9yY2libHkgbWFwcGVkCj4gYXQgcGFnZSBn
cmFudWxhcml0eS4gQnV0IHg4NiBkb2VzIG5vdCBoYXZlIHN1Y2ggY29uc3RyYWludHMgYXMgaXQg
b25seSBzcGxpdCBwYWdlcwo+IGluIHRoZSBrZmVuY2UgcG9vbCwgc28gSSB0aGluayB0aGUgeDg2
IGFwcHJvYWNoIGlzIGJldHRlciBhcyBpdCBoYXMgbGVzcyBpbmZsdWVuY2UKPiBvbiB0aGUgd2hv
bGUuCgpDb3JyZWN0LgoKSSB0aGluayBlaXRoZXIgcmlzY3YgZ2FpbnMgc2V0X21lbW9yeV80aygp
LCBsaWtlIHg4Niwgb3Igd2UgZ28gd2l0aAp0aGUgYXBwcm9hY2ggaW4gdGhpcyBwYXRjaC4gVW5s
ZXNzIHlvdSBzZWUgdGhpcyBpcyB0cml2aWFsbHkKaW1wbGVtZW50YWJsZSwgSSB3b3VsZG4ndCB3
YW50IHRvIGJsb2NrIHRoaXMgcGF0Y2guIEl0J3MgYmV0dGVyIHRvCmhhdmUgc29tZXRoaW5nIHdv
cmtpbmcsIGFuZCB0aGVuIGluY3JlbWVudGFsbHkgaW1wcm92ZSBsYXRlciBpZiByaXNjdgpldmVy
IGdldHMgc2V0X21lbW9yeV80aygpLgoKVGhhbmtzLAotLSBNYXJjbwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
