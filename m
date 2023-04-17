Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0FFC77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 05:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Odv0t5JExD1P3c97vj8UDFBKNC5nL+eNwsc1rpXXKZ0=; b=jMhriResW734al
	cGBmNtMQDDBWwCfsgHbHeED7xM6Gbk8fRm20RJpbfEgHWvalk+0I00UuP8FzxLmVG0ncMK9MK6+fQ
	ls/G6oLfdgIPAqfCB78g2hvL4Lc0e5ajINCoqMxuI8iyBzBOjr/zYfAxy6V2/0E0YwjKFzS1T1Llp
	27pq7NiYcH1ao6uIt+BWtRICBpztczGdsCJsgYxVSF5nSZIWeh/8o4Z08ftBgH2Tc6TXAq0Or7RKx
	taS7nlhZZG2oqHqlVFfY3+nAdAC2zfzbgrY7qAMJk5uW2XeQOSxhZ3IOasLct/8YLPZQIrgdPKz56
	1leHt29FvG/PFqr3EUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poHtV-00EyMb-1o;
	Mon, 17 Apr 2023 05:59:17 +0000
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poHtT-00EyLG-06
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 05:59:16 +0000
Received: by mail-ua1-x92a.google.com with SMTP id q10so2288652uas.2
        for <linux-riscv@lists.infradead.org>; Sun, 16 Apr 2023 22:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681711153; x=1684303153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eohybgdIgk7iXoWhNkI8sXthJEB+nE/TYK/tYi4O6gE=;
        b=a78QkWnVWvTVZd89TtCAH4sNL9+zfU7I7y4lPit0R7zK63uiT2gchXgM2e8JNDiUKQ
         6cIQR43ehb9XGv78doN4c2yomIJJoh5o/3KRNPw/CnnuXBTXhj3DBldz9tW6/m3pFWGz
         i5aiuvHaXpfCghIcE/OrSMjwFyI4FKXFp/Cb7P85PeD6mbQevClznuEEhi+dfHPo509l
         2m4T3/+VUqf4HN99/7P9YEyYX6CX6G21wXfGy1W67JiVC9GD7l7mbU/7DgNKcoVg/kUL
         /ssshj1a8WGCajXuikDRUnAUP1DZcjmNdBY8OvLil+PiIjgeEssnUD4E8gxAT6Qd9cKy
         SBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681711153; x=1684303153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eohybgdIgk7iXoWhNkI8sXthJEB+nE/TYK/tYi4O6gE=;
        b=lX231TRhLL/RibRDwdRD7ofZSYSVJJ2mZou36VJZrRE1c4O8rVYUgxgmAkkUgawrKJ
         JVogSu7Nqz1zVFjO9bYCrCPK9fHbyeiTsd5DzTExQT2mhd4OCp8DeGzEtX223sy/alMw
         HEUkGnQ/NM4mig5Tbd61V+EXOvQyVDCJoj7p8YqnJPXulCHlbAXtAIWdy1rmmJSx1vaV
         9L3xN0FaYhIK8tMU7YY5eQ/Fbfje4eKCwQT4zinVJTSF4afpGPHhb/nQO1zWhzFgbB/R
         93VouwlZL7qXzHygft1syjLzwtRY9YOVSQwvi3oMgnK8qI3efmiSMDqPAX5Z4OGOs0uD
         IusA==
X-Gm-Message-State: AAQBX9fLsH/hk8zoqEu7G/JgdQR7lfaUGPs6egMdbvNrq27mfnus1sfj
	XNakWsniYPzg+VqhK0A5WHc68bo/9Fykd+nz4QYbww==
X-Google-Smtp-Source: AKy350bJ3yTanjoLu+6CaKXSxY+GvKv0FHKU6Vjsch6zGV+4L48vA0bb12UWU7g1fFA63DbfBHYGX8cuehWpUIQdMdc=
X-Received: by 2002:a9f:3053:0:b0:771:dcb0:4938 with SMTP id
 i19-20020a9f3053000000b00771dcb04938mr7344511uab.1.1681711153483; Sun, 16 Apr
 2023 22:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230414081605.471375-1-vincent.chen@sifive.com> <p6zxwbthpyepr4tlheifd5s5rwqe2kpc7mmgjtz5ffzftc7bmt@ku57j4x7kcyr>
In-Reply-To: <p6zxwbthpyepr4tlheifd5s5rwqe2kpc7mmgjtz5ffzftc7bmt@ku57j4x7kcyr>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Mon, 17 Apr 2023 13:59:02 +0800
Message-ID: <CABvJ_xiS9YsWDSKeTR0fXj5ZDJUwLOzCKi+O6q2oqVTKJB+D4g@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: execute local TLB flush after populating vmemmap
To: Andrew Jones <ajones@ventanamicro.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_225915_077185_3C9B2D9D 
X-CRM114-Status: GOOD (  24.32  )
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

T24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgNToxNOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgMDQ6MTY6
MDVQTSArMDgwMCwgVmluY2VudCBDaGVuIHdyb3RlOgo+ID4gVGhlIHNwYXJlX2luaXQoKSBjYWxs
cyBtZW1tYXBfcG9wdWxhdGUoKSBtYW55IHRpbWVzIHRvIGNyZWF0ZSBWQSB0byBQQQo+ID4gbWFw
cGluZyBmb3IgdGhlIFZNRU1NQVAgYXJlYSwgd2hlcmUgYWxsICJzdHJjdXQgcGFnZSIgYXJlIGxv
Y2F0ZWQgb25jZQo+Cj4gc3RydWN0Cj4KPiA+IENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUCBpcyBk
ZWZpbmVkLiBUaGVzZSAic3RydWN0IHBhZ2UiIGFyZSBsYXRlcgo+ID4gaW5pdGlhbGl6ZWQgaW4g
dGhlIHpvbmVfc2l6ZXNfaW5pdCgpIGZ1bmN0aW9uLiBIb3dldmVyLCBkdXJpbmcgdGhpcwo+ID4g
cHJvY2Vzcywgbm8gc2ZlbmNlLnZtYSBpbnN0cnVjdGlvbiBpcyBleGVjdXRlZCBmb3IgdGhpcyBW
TUVNTUFQIGFyZWEuCj4gPiBUaGlzIG9taXNzaW9uIG1heSBjYXVzZSB0aGUgaGFydCB0byBmYWls
IHRvIHBlcmZvcm0gcGFnZSB0YWJsZSB3b3JrCj4KPiBzL3dvcmsvd2Fsay8gPwo+Cj4gPiBiZWNh
dXNlIHNvbWUgZGF0YSByZWxhdGVkIHRvIHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uIGlzIGludmlz
aWJsZSB0byB0aGUKPiA+IGhhcnQuIFRvIHNvbHZlIHRoaXMgaXNzdWUsIHRoZSBsb2NhbF9mbHVz
aF90bGJfa2VybmVsX3JhbmdlKCkgaXMgY2FsbGVkCj4gPiByaWdodCBhZnRlciB0aGUgc3BhcmVf
aW5pdCgpIHRvIGV4ZWN1dGUgYSBzZmVuY2Uudm1hIGluc3RydWN0aW9uIGZvciB0aGUKPiA+IFZN
RU1NQVAgYXJlYSwgZW5zdXJpbmcgdGhhdCBhbGwgZGF0YSByZWxhdGVkIHRvIHRoZSBhZGRyZXNz
IHRyYW5zbGF0aW9uCj4gPiBpcyB2aXNpYmxlIHRvIHRoZSBoYXJ0Lgo+ID4KPiA+IEZpeGVzOiBk
OTVmMWE1NDJjM2QgKCJSSVNDLVY6IEltcGxlbWVudCBzcGFyc2VtZW0iKQo+ID4gU2lnbmVkLW9m
Zi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiA+IFJldmlld2Vk
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gPiAtLS0KPiA+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggfCA3ICsrKysrKysKPiA+ICBhcmNo
L3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICAgfCA1ICsrKysrCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdGxiZmx1c2guaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+
ID4gaW5kZXggYTA5MTk2ZjhkZTY4Li5mOWQzNzEyYmQ5M2IgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vdGxiZmx1c2guaAo+ID4gQEAgLTYxLDQgKzYxLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9p
ZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiAgICAgICBm
bHVzaF90bGJfYWxsKCk7Cj4gPiAgfQo+ID4KPiA+ICsvKiBGbHVzaCBhIHJhbmdlIG9mIGtlcm5l
bCBwYWdlcyB3aXRob3V0IGJyb2FkY2FzdGluZyAqLwo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBs
b2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBl
bmQpCj4gPiArewo+ID4gKyAgICAgbG9jYWxfZmx1c2hfdGxiX2FsbCgpOwo+ID4gK30KPiA+ICsK
PiA+ICAjZW5kaWYgLyogX0FTTV9SSVNDVl9UTEJGTFVTSF9IICovCj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gaW5kZXggNDc4
ZDY3NjNhMDFhLi41YmQ5NmY2YzhmMTkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2lu
aXQuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+IEBAIC0xMjMxLDYgKzEyMzEs
MTAgQEAgdm9pZCBfX2luaXQgbWlzY19tZW1faW5pdCh2b2lkKQo+ID4gICAgICAgZWFybHlfbWVt
dGVzdChtaW5fbG93X3BmbiA8PCBQQUdFX1NISUZULCBtYXhfbG93X3BmbiA8PCBQQUdFX1NISUZU
KTsKPiA+ICAgICAgIGFyY2hfbnVtYV9pbml0KCk7Cj4gPiAgICAgICBzcGFyc2VfaW5pdCgpOwo+
ID4gKyNpZmRlZiBDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVAKPiA+ICsgICAgIC8qIFRoZSBlbnRp
cmUgVk1FTU1BUCByZWdpb24gaGFzIGJlZW4gcHJvcHVsYXRlZC4gRmx1c2ggVExCIGZvciB0aGlz
IHJlZ2lvbiAqLwo+Cj4gcG9wdWxhdGVkCj4KPiA+ICsgICAgIGxvY2FsX2ZsdXNoX3RsYl9rZXJu
ZWxfcmFuZ2UoVk1FTU1BUF9TVEFSVCwgVk1FTU1BUF9FTkQpOwo+ID4gKyNlbmRpZgo+ID4gICAg
ICAgem9uZV9zaXplc19pbml0KCk7Cj4gPiAgICAgICByZXNlcnZlX2NyYXNoa2VybmVsKCk7Cj4g
PiAgICAgICBtZW1ibG9ja19kdW1wX2FsbCgpOwo+ID4gQEAgLTEyNDAsNiArMTI0NCw3IEBAIHZv
aWQgX19pbml0IG1pc2NfbWVtX2luaXQodm9pZCkKPiA+ICBpbnQgX19tZW1pbml0IHZtZW1tYXBf
cG9wdWxhdGUodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsIGludCBub2Rl
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgdm1lbV9hbHRtYXAgKmFs
dG1hcCkKPiA+ICB7Cj4gPiArICAgICAvKiBEZWZlciB0aGUgcmVxdWlyZWQgVExCIGZsdXNoIHVu
dGlsIHRoZSBlbnRpcmUgVk1FTU1BUCByZWdpb24gaGFzIGJlZW4gcG9wdWxhdGVkICovCj4gPiAg
ICAgICByZXR1cm4gdm1lbW1hcF9wb3B1bGF0ZV9iYXNlcGFnZXMoc3RhcnQsIGVuZCwgbm9kZSwg
TlVMTCk7Cj4gPiAgfQo+ID4gICNlbmRpZgo+ID4gLS0KPiA+IDIuMjUuMQo+ID4KPgo+IEJlc2lk
ZXMgdGhlIHR5cG9zLAoKVGhhbmsgeW91IGZvciBmaW5kaW5nIHRoZXNlIHR5cG9zLiBJdCdzIHJl
YWxseSBlbWJhcnJhc3NpbmcuIEkgd2lsbApmaXggdGhlc2UgaXNzdWVzIGluIHRoZSBwYXRjaCBm
b3IgdjMuCgpUaGFua3MsClZpbmNlbnQKPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPgo+Cj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
