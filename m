Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D43C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 07:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UEUUsunIngfMxAoXmGhyXAYRWu4LCvBxHbQxsyiA07E=; b=40dzKl0G5enpET
	Kto2/UpG512n49RiaPPeb8nweAY1a1HI31f0Qp8hllukJf49ME5dnppYpnqALf++DegoV9DrvOjL+
	0Pbly+gJd2XnOMu84MRp3SkqNl0/hVU2m/loAID3D5N1eshaN/OhQotaT4kXI1F5w4lgiq2cFeMZs
	vVlWWkUEiGvuNHDjFZgLG6lH7lKhwKWSl0PMGUT8PWbGFXqplDWwI2PQnhCJgnPaWlV1B5KXrjbcy
	DDEt9ikruYIXKnmm5bW88cxZBEflnJN+a2WPP8cqMlghHUxaVx/SESR/xkFWMmpHPESwbinZsF0eo
	3yZAcz2/y5Jw3sTS7iZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLdjX-0000000FoJQ-1rgY;
	Mon, 24 Jun 2024 07:03:23 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLdjU-0000000FoID-1wBf
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 07:03:22 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7008acebf3fso1752032a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 00:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719212593; x=1719817393; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hus/Z8kWfB3zHpzLYZI2dy5Pgo4m4TR8rM+wRIiJmBY=;
        b=P7mFnDjnxtAdmPznCMEmDw6V0dwxtLuF5ugjJ8VC84+Kh3sg5tbTXX2GxJKHZMN8aq
         E/8TQZR8IIXrpNSbuSxVc5bSx+xjtrsGAQAiSF4Nz1kR4/va+5XGeBkQR3+itxIZ1oKz
         w8U7gp8oiXHk8FCYSd4bC7VY7Z6ycdxlgiO4v28ECrEWGOaV3sffzP21vLGbIxYI2vO4
         8N2SYEJY1IUGR0vBoOuoJZEgxgDhy57jj36OdZ9QdHiuOAHh4ZNwaWJhil/FgIrjMu4b
         cXkgF45f2Iw5lCit7td3yAFW5juCmI2FXnUhWqSkAZg+F/l2BS93vyPBpvF60NFdu0ol
         65vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719212593; x=1719817393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hus/Z8kWfB3zHpzLYZI2dy5Pgo4m4TR8rM+wRIiJmBY=;
        b=QYZNePd8rHivSHZYTV8gpYo3O6q8Jv78ldcttoGo+0crFr5cIW5gbSnQM6+UHsdIrg
         HwZA/iqc4kV/o1Pj76RvGzMjOKBqicsB/wsIW5urOe+AQiUFs+uHCeORi0ScAzUdimQL
         zA3VG/lv8aKM+PJJJE5US/HMd9eONKkfuP077Zmn+OnmGVj9glwBcAolMpXJs4gqBDZr
         3gmNoYVBggOQXsBRPrtgranZPa+DtbOWMGWmMFSQL2omohP7a+zeZQygRafZuwco+liq
         AMvxDsDKJlSOBRN5hXZJsypVCSpZj9+kVXjv4bjpD08GHKkdXoRbNfjmoaB2FKaMwxH9
         0Dog==
X-Forwarded-Encrypted: i=1; AJvYcCWTFC9mpqCu75lgn5L1okzCnz+j2rJe5glu+4AS5WLH9UUt0hYZJLJKNcf6lQX/dqJ/bl3YoksQYhkQSOM+ynBQaoTGmT9wgRsqck9hLTzU
X-Gm-Message-State: AOJu0YwNEZqKS6exkfmjnHROfvW3Sh2c8Cg0uVTeU7llHdllJPrctSyx
	zNRT5yVlzCxHZ3CTZc4jVQfRt4WiaPCpf1PdqowLWpHEbiL+RUd0KI+3JmIpM4yY3EyTzHdJKM/
	8kiXl9awNTvX7HlPFi6IqNFwKOyMhkk/aUKVgZw==
X-Google-Smtp-Source: AGHT+IE1ORNwhEJz9xcQatVNoa2I81qe/opkAq14DSskHVsG4ALLMZ8WWonbxzoRgSdJ/Sj4jh6h/2w3Ymhhfh56Nec=
X-Received: by 2002:a05:6870:7b4c:b0:258:42be:ce5e with SMTP id
 586e51a60fabf-25d016c196emr4851607fac.16.1719212593253; Mon, 24 Jun 2024
 00:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240618120842.15159-1-cuiyunhui@bytedance.com>
 <ZnTRbptoowL+1GOP@ghost> <CAEEQ3wnNZJviirqWCAG7mXsbynC+=Gq5q4jh6b4yamm8cnzMAw@mail.gmail.com>
 <ZnTvArAQpfCm10tc@ghost> <CAEEQ3w=6EZMFsH2y7efZsX00CzytyMu+Be_RT8CicejMB6qAJA@mail.gmail.com>
 <ZnUgLZow2ODPH7vp@ghost> <Znfl8NDWmL1NFANn@kernel.org>
In-Reply-To: <Znfl8NDWmL1NFANn@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 24 Jun 2024 15:03:02 +0800
Message-ID: <CAEEQ3w=YYyUdR3CRMv6+nURv3_kMf+dC3UGqv-UNsmxpVzmoWw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: cmdline: Add support for 'memmap' parameter
To: Mike Rapoport <rppt@kernel.org>
Cc: Charlie Jenkins <charlie@rivosinc.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alexghiti@rivosinc.com, akpm@linux-foundation.org, 
	bhe@redhat.com, dawei.li@shingroup.cn, jszhang@kernel.org, 
	namcao@linutronix.de, bjorn@rivosinc.com, vishal.moola@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_000320_855247_1F561B88 
X-CRM114-Status: GOOD (  54.87  )
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

SGkgTWlrZSwKCk9uIFN1biwgSnVuIDIzLCAyMDI0IGF0IDU6MTDigK9QTSBNaWtlIFJhcG9wb3J0
IDxycHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMTE6
Mzk6NDFQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMjEs
IDIwMjQgYXQgMDI6MDI6MThQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90ZToKPiA+ID4gSGkgQ2hh
cmxpZe+8jAo+ID4gPgo+ID4gPiBPbiBGcmksIEp1biAyMSwgMjAyNCBhdCAxMToxMOKAr0FNIENo
YXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+
ID4gT24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMTA6MDg6MzlBTSArMDgwMCwgeXVuaHVpIGN1aSB3
cm90ZToKPiA+ID4gPiA+IEhpIENoYXJsaWUsCj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gRnJpLCBK
dW4gMjEsIDIwMjQgYXQgOTowM+KAr0FNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2lu
Yy5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiBUdWUsIEp1biAxOCwgMjAy
NCBhdCAwODowODo0MlBNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4gPiA+ID4gPiA+IElt
cGxlbWVudCBzdXBwb3J0IGZvciBwYXJzaW5nICdtZW1tYXAnIGtlcm5lbCBjb21tYW5kIGxpbmUg
cGFyYW1ldGVyLgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBjb3ZlcnMg
cGFyc2luZyBvZiB0aGUgZm9sbG93aW5nIHR3byBmb3JtYXRzIGZvciAnbWVtbWFwJwo+ID4gPiA+
ID4gPiA+IHBhcmFtZXRlciB2YWx1ZXM6Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiAtIG5u
W0tNR11Ac3NbS01HXQo+ID4gPiA+ID4gPiA+IC0gbm5bS01HXSRzc1tLTUddCj4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiAoW0tNR10gPSBLIE0gb3IgRyAoa2lsbywgbWVnYSwgZ2lnYSkpCj4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBUaGVzZSB0d28gYWxsb3dlZCBmb3JtYXRzIGZvciBw
YXJhbWV0ZXIgdmFsdWUgYXJlIGFscmVhZHkgZG9jdW1lbnRlZAo+ID4gPiA+ID4gPiA+IGluIGZp
bGUga2VybmVsLXBhcmFtZXRlcnMudHh0IGluIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUgZm9s
ZGVyLgo+ID4gPiA+ID4gPiA+IFNvbWUgYXJjaGl0ZWN0dXJlcyBhbHJlYWR5IHN1cHBvcnQgdGhl
bSwgYnV0IE1pcHMgZGlkIG5vdCBwcmlvciB0bwo+Cj4gSSBiZWxpZXZlIHlvdSBzaG91bGQgYWRk
IFJJU0NWIHRvIHRoZSBsaXN0IG9mIHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzIGZvcgo+IHRoZXNl
IG9wdGlvbnMuCgpPa2F5LCBJIHdpbGwgdXBkYXRlIGl0IG9uIHYyLgoKPgo+ID4gPiA+ID4gPiBD
b3B5LXBhc3RlIGZyb20gYSBNaXBzIHBhdGNoPyBTaG91bGQgc2F5IHJpc2N2IDopCj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IEl0IGxvb2tzIGxpa2UgdGhpcyBjb2RlIGlzIGR1cGxpY2F0ZWQgZnJv
bSB4dGVuc2EgYW5kIGlzIGVmZmVjdGl2ZWx5IHRoZQo+ID4gPiA+ID4gPiBzYW1lIGFzIG1pcHMu
IENhbiB0aGlzIGNvZGUgYmUgcGxhY2VkIGluIGEgZ2VuZXJpYyBmaWxlIHNvIHRoYXQgdGhlIGNv
ZGUKPiA+ID4gPiA+ID4gY2FuIGJlIHNoYXJlZCBiZXR3ZWVuIG1pcHMsIHJpc2N2LCBhbmQgeHRl
bnNhIC0tIG1heWJlIGEgbmV3IGNvbmZpZyB0aGF0Cj4gPiA+ID4gPiA+IGdldHMgc2VsZWN0ZWQg
YnkgbWlwcy9yaXNjdi94dGVuc2E/Cj4gPiA+ID4gPgo+ID4gPiA+ID4gWWVhaCwgdGhhdCdzIGFj
dHVhbGx5IHdoYXQgSSB3YXMgdGhpbmtpbmcuIFdoaWNoIGdlbmVyYWwgZmlsZSBkbyB5b3UKPiA+
ID4gPiA+IHRoaW5rIHdvdWxkIGJlIG1vcmUgc3VpdGFibGUgdG8gcHV0IGl0IGluPwo+ID4gPiA+
Cj4gPiA+ID4gSSBhbSBub3Qgc3VyZSB0aGUgYmVzdCBwbGFjZSB0byBwdXQgaXQuIFdoYXQgZG8g
eW91IHRoaW5rIGFib3V0Cj4gPiA+ID4gbW0vbWVtYmxvY2suYyBuZXh0IHRvIHRoZSAibWVtYmxv
Y2siIGVhcmx5IHBhcmFtPwo+ID4gPgo+ID4gPiBJcyBpdCBpbmFwcHJvcHJpYXRlIHRvIHB1dCBp
dCBpbiBtZW1ibG9jaz8gVGhlIGltcGxlbWVudGF0aW9uIG9mIG1pcHMKPiA+ID4gaXMgZGlmZmVy
ZW50IGZyb20gdGhhdCBvZiB4dGVuc2EsIGFuZCBlYXJseV9tZW0gaXMgYWxzbyBkaXN0cmlidXRl
ZCBpbgo+ID4gPiB2YXJpb3VzIGFyY2hzLCBzbyB3ZSBzdGlsbCBwdXQgbWVtbWFwIGluIHJpc2N2
LywgYW5kIHRoZW4gSSB3aWxsCj4gPiA+IG1vZGlmeSB0aGUgY29tbWl0IGxvZy4KPiA+ID4gV2hh
dCBkbyB5b3UgdGhpbms/Cj4gPgo+ID4gVGhlIG1pcHMgaW1wbGVtZW50YXRpb24gaXMgdmVyeSBj
bG9zZSB0byBiZWluZyB0aGUgc2FtZSwgYnV0IEkgYW0gbm90Cj4gPiBzdXJlIGlmIHRoZSBkaWZm
ZXJlbmNlcyB3b3VsZCBwcmV2ZW50IHN0YW5kYXJkaXphdGlvbi4geHRlbnNhIGFuZCBub3cKPiA+
IHJpc2N2IHdvdWxkIGhhdmUgaWRlbnRpY2FsIGltcGxlbWVudGF0aW9ucyB0aG91Z2ggc28gYSBn
ZW5lcmljIG1lbW1hcAo+ID4gaW1wbGVtZW50YXRpb24gY291bGQgYmUgb25seSBhcHBsaWVkIHRv
IHRob3NlIHR3byBhcmNocy4KPgo+IFRoZSBtZW1tYXA9IGlzIGdlbmVyYWxseSBhIGhhY2sgdG8g
d29ya2Fyb3VuZCBpc3N1ZXMgd2l0aCBob3cgZmlybXdhcmUKPiBkZXNjcmliZXMgbWVtb3J5IHRv
IHRoZSBrZXJuZWwgc28gaW4gYSB3YXkgaXQgYmVsb25ncyB0byBhcmNoLyBjb2RlLgo+Cj4gbWlw
cyBhbmQgeHRlbnNhIGFscmVhZHkgaGF2ZSBkaWZmZXJlbnQgdmlld3Mgb24gaG93IHRoaXMgc2hv
dWxkIGJlIHRyZWF0ZWQsCj4gbm90IG1lbnRpb25pbmcgeDg2IHRoYXQgaGFuZGxlcyBtZW1tYXA9
IG9uIGU4MjAgbGV2ZWwgcmF0aGVyIHRoYW4gd2l0aAo+IG1lbWJsb2NrLgoKT0ssIGxldCdzIGNv
bnRpbnVlIHRvIHB1dCBpdCBpbiBhcmNoLy4KCj4KPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gPiA+ID4gPiA+
IGluZGV4IGUzNDA1ZTRiOTlhZi4uN2JlN2VjMzA5MmFkIDEwMDY0NAo+ID4gPiA+ID4gPiA+IC0t
LSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiA+ID4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9t
bS9pbml0LmMKPiA+ID4gPiA+ID4gPiBAQCAtMjA4LDYgKzIwOCw1NiBAQCBzdGF0aWMgaW50IF9f
aW5pdCBlYXJseV9tZW0oY2hhciAqcCkKPiA+ID4gPiA+ID4gPiAgfQo+ID4gPiA+ID4gPiA+ICBl
YXJseV9wYXJhbSgibWVtIiwgZWFybHlfbWVtKTsKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ICtzdGF0aWMgdm9pZCBfX2luaXQgcGFyc2VfbWVtbWFwX29uZShjaGFyICpwKQo+ID4gPiA+ID4g
PiA+ICt7Cj4gPiA+ID4gPiA+ID4gKyAgICAgY2hhciAqb2xkcDsKPiA+ID4gPiA+ID4gPiArICAg
ICB1bnNpZ25lZCBsb25nIHN0YXJ0X2F0LCBtZW1fc2l6ZTsKPiA+ID4gPiA+ID4gPiArCj4gPiA+
ID4gPiA+ID4gKyAgICAgaWYgKCFwKQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJu
Owo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArICAgICBvbGRwID0gcDsKPiA+ID4gPiA+
ID4gPiArICAgICBtZW1fc2l6ZSA9IG1lbXBhcnNlKHAsICZwKTsKPiA+ID4gPiA+ID4gPiArICAg
ICBpZiAocCA9PSBvbGRwKQo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4g
PiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArICAgICBzd2l0Y2ggKCpwKSB7Cj4gPiA+ID4gPiA+
ID4gKyAgICAgY2FzZSAnQCc6Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICBzdGFydF9hdCA9
IG1lbXBhcnNlKHAgKyAxLCAmcCk7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICBtZW1ibG9j
a19hZGQoc3RhcnRfYXQsIG1lbV9zaXplKTsKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgIGJy
ZWFrOwo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArICAgICBjYXNlICckJzoKPiA+ID4g
PiA+ID4gPiArICAgICAgICAgICAgIHN0YXJ0X2F0ID0gbWVtcGFyc2UocCArIDEsICZwKTsKPiA+
ID4gPiA+ID4gPiArICAgICAgICAgICAgIG1lbWJsb2NrX3Jlc2VydmUoc3RhcnRfYXQsIG1lbV9z
aXplKTsKPgo+IFRoaXMgd2lsbCBhZGQgYSByZWdpb24gdG8gbWVtYmxvY2sucmVzZXJ2ZWQsIGJ1
dCBpZiB0aGVyZSBpcyBubyBtZW1vcnkKPiB0aGVyZSB0aGlzIGluZm9ybWF0aW9uIHdvbid0IGJl
IGF2YWlsYWJsZSBhZnRlciBib290LCBlLmcuIHRoZXJlIHdvbid0IGJlCj4gc3RydWN0IHBhZ2Vz
IHdpdGggUEdfUmVzZXJ2ZWQgZm9yIHRoaXMgcmVnaW9uLgo+IElzIHRoaXMgeW91ciBpbnRlbnRp
b24/CgpZZWFoLCB3ZSBzaG91bGQgdXNlIG1lbW1hcCB0byByZXNlcnZlIGluIHRoZSBrbm93biBt
ZW1vcnkgcmFuZ2UuCgo+Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICBicmVhazsKPiA+ID4g
PiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgY2FzZSAwOgo+ID4gPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgbWVtYmxvY2tfcmVzZXJ2ZShtZW1fc2l6ZSwgLW1lbV9zaXplKTsKPgo+IFRoaXMg
Y29ycmVzcG9uZHMgdG8gdGhlIGNhc2UgbWVtbWFwPW5uW0tNR10gYW5kIGl0IGlzIG5vdCBkb2N1
bWVudGVkIGluCj4ga2VybmVsLXBhcmFtZXRlcnMudHh0Lgo+Cj4gTm90IHN1cmUgaXQncyBuZWVk
ZWQgYXQgYWxsIGFzIHRoZSBzYW1lIHJlc3VsdCBjYW4gYmUgYWNoaWV2ZWQgd2l0aAo+IG1lbW1h
cD1ubltLTUddJDAuCgpPSywganVzdCB1c2UgY2FzZSAnJCcsIGJlY2F1c2UgbWVtYmxvY2tfcmVz
ZXJ2ZSgpIGNvbnZlcnRzIHNpemUgdG8gdW5zaWduZWQuCgo+Cj4gPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgICBicmVhazsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgZGVmYXVs
dDoKPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAgIHByX3dhcm4oIlVucmVjb2duaXplZCBtZW1t
YXAgc3ludGF4OiAlc1xuIiwgcCk7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICBicmVhazsK
PiA+ID4gPiA+ID4gPiArICAgICB9Cj4gPiA+ID4gPiA+ID4gK30KPiA+ID4gPiA+ID4gPiArCj4g
PiA+ID4gPiA+ID4gK3N0YXRpYyBpbnQgX19pbml0IHBhcnNlX21lbW1hcF9vcHQoY2hhciAqc3Ry
KQo+ID4gPiA+ID4gPiA+ICt7Cj4gPiA+ID4gPiA+ID4gKyAgICAgd2hpbGUgKHN0cikgewo+ID4g
PiA+ID4gPiA+ICsgICAgICAgICAgICAgY2hhciAqayA9IHN0cmNocihzdHIsICcsJyk7Cj4gPiA+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgaWYgKGspCj4gPiA+ID4gPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICprKysgPSAwOwo+ID4gPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ID4gPiArICAgICAgICAgICAgIHBhcnNlX21lbW1hcF9vbmUoc3RyKTsKPiA+ID4gPiA+ID4g
PiArICAgICAgICAgICAgIHN0ciA9IGs7Cj4gPiA+ID4gPiA+ID4gKyAgICAgfQo+ID4gPiA+ID4g
PiA+ICsKPiA+ID4gPiA+ID4gPiArICAgICByZXR1cm4gMDsKPiA+ID4gPiA+ID4gPiArfQo+ID4g
PiA+ID4gPiA+ICtlYXJseV9wYXJhbSgibWVtbWFwIiwgcGFyc2VfbWVtbWFwX29wdCk7Cj4gPiA+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+ICBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfYm9vdG1l
bSh2b2lkKQo+ID4gPiA+ID4gPiA+ICB7Cj4gPiA+ID4gPiA+ID4gICAgICAgcGh5c19hZGRyX3Qg
dm1saW51eF9lbmQgPSBfX3BhX3N5bWJvbCgmX2VuZCk7Cj4gPiA+ID4gPiA+ID4gLS0KPiA+ID4g
PiA+ID4gPiAyLjIwLjEKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiA+
ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gPiA+ID4gPiBsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+ID4gPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYW5r
cywKPiA+ID4gPiA+IFl1bmh1aQo+ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+IFl1bmh1aQo+Cj4g
LS0KPiBTaW5jZXJlbHkgeW91cnMsCj4gTWlrZS4KClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
