Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9C4CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qas29RWrhuqhtPGmPlBIcZN9cvX35v8bI+0DYAxnJg=; b=E+AelQsEm+MhVg
	08Ljdjo15yawoc5b/G/mWpkEaXke7BAxkQ9GOAi9vT9UNqF/ynEz8nmXhUjHf+258I8ubOa2Kh3bD
	4YSEcud5q/8vyPO/8Qxb96SDrM/A3omHmWmFMkEu0l1O8rIi08XCqZFQOsYjnjXxxjDiwYz/UHlqz
	pOXupBNqUdNSpa/cRBT1hadO8476a9ml8y8tQJSb/BDgO8Wq8FB8rfyaXwxPiPl6Xhyd2pKOL228C
	8ZVIycdilPdmevggNyqKUgULGCy2v7brzpFwJx8Nurujchw8wt5oQqWJyl3ngTozLaMYaGcbcn1L2
	plE6P0U9a645YU3mqWeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1Wh-0000000GSK0-3W7z;
	Wed, 03 Apr 2024 14:23:43 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1Wc-0000000GSGj-0X0q
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 14:23:41 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-60a434ea806so68365377b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712154216; x=1712759016; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwJNuwyQp3Yvzu+935Rba/rHkgr+XgKaeFBH6ggamVo=;
        b=rPgQMm0NVhXNUv2UAaygqrqEiJkGvhP9tRySfknxyTuNjHGRijamQgpSzE7L8PCUE0
         NshQHdskxVYgiGZFB4d9D+CvIVfSNFEF0LdShuGf3SJ+oYuKty4ztuyU1nZfu8kuQQkl
         tQWeBWNc1EkUfTnPeYuetqfhu6JMtGbuc4u87eAqxcec5Y3nj6QXtVuxpDiXWXkqJtTE
         uuahT1yhsGm76EgeArGI5FCjly6jyo2IkFH7xfmAPQuRP3BXUMIAeqm8RPTAxZ1Cjx0Z
         WIhSNXX3eMTptTbyxCKDu2X5/MJ4CTp6veV0dH4OpLtzNGgBXTvozy5wY+B2mzwmNnXz
         YZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712154216; x=1712759016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwJNuwyQp3Yvzu+935Rba/rHkgr+XgKaeFBH6ggamVo=;
        b=P0emikeD+uAKWZg7u/oGwY+ABfjbNkOOBQbMjaAOfiWlw7gq1YtN91Rg5azxlPN3NY
         yafBHFP8OOhwjFqdTIcHBXrdPUW5Vt7GUsbJpviEQ8wZyD2ndlMvR+u9y0BwR1jLZvEh
         KicdIueUOgKLJhoayE+h8zQ+eGx7kyuEdxT/fy3Pq1eIzNTV1yPXrLXaDGMlvhEvTACA
         ZUOzF2xIbWyPCg9dH8K4RuyWk8N7jkrMiGZlJz77MSTlp2UQXxsEsiTv60pDy5bZmmXo
         8rTOGH8DQUK1sZmY/lUvZJLhJ9Zzmi8P1+YzBR4B6daDmBBCazH8kZTS5GXC9y1F2GGF
         GP6g==
X-Forwarded-Encrypted: i=1; AJvYcCUmDh9xvMyIuLOvq2dRryblD0o9Qu2n6dSvEpZ8tGZ1roQ7rUdGh6R/dy9B91I+ophPkOi8tmRFqs3DHO1LuZqaJk4TLwPONbkx9xHfEYMv
X-Gm-Message-State: AOJu0Yw9jZ49W7ufsWOaa0Qf6gvfNUIpUhpQ61ZHZnU9qlP3LdbHtUyK
	Yn72r5IAQ+/u+32KszJCi1ZwpS+3IwQywdabyEjNEJW+ZdK9+WIfDIfHjDrug341YegKC90VrV0
	zCQTmCkq7f8eSVaXKbih9IWVl9YaAVAouhHe4
X-Google-Smtp-Source: AGHT+IHARpbXZVqsZEoa5xySsc3G5/CcR814bUWxWQ15mbjsPwETu+5wjQAHS1k9Hq1FLB9FQjXK6aME+vDVPH/zVfk=
X-Received: by 2002:a25:ab41:0:b0:dcf:a52d:6134 with SMTP id
 u59-20020a25ab41000000b00dcfa52d6134mr2682792ybi.26.1712154215477; Wed, 03
 Apr 2024 07:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com>
 <20240402075142.196265-8-wangkefeng.wang@huawei.com> <CAJuCfpFoxP78+P1+4WQcCqMzGv7jpC9V8pR_-R8t8zPUg-t+aA@mail.gmail.com>
 <d5177b0f-db4e-4c78-81f1-5761f08f076d@huawei.com>
In-Reply-To: <d5177b0f-db4e-4c78-81f1-5761f08f076d@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Apr 2024 07:23:23 -0700
Message-ID: <CAJuCfpEKg1wxNwhu9JOsvq9kZM9WUA2MNfH_jb6ZQ0jpGJzEdw@mail.gmail.com>
Subject: Re: [PATCH 7/7] x86: mm: accelerate pagefault when badaccess
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_072338_437671_29C990BF 
X-CRM114-Status: GOOD (  28.93  )
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

T24gV2VkLCBBcHIgMywgMjAyNCBhdCAxMjo1OOKAr0FNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5n
LndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjAyNC80LzMgMTM6NTksIFN1cmVu
IEJhZ2hkYXNhcnlhbiB3cm90ZToKPiA+IE9uIFR1ZSwgQXByIDIsIDIwMjQgYXQgMTI6NTPigK9B
TSBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+ID4+Cj4g
Pj4gVGhlIHZtX2ZsYWdzIG9mIHZtYSBhbHJlYWR5IGNoZWNrZWQgdW5kZXIgcGVyLVZNQSBsb2Nr
LCBpZiBpdCBpcyBhCj4gPj4gYmFkIGFjY2VzcywgZGlyZWN0bHkgaGFuZGxlIGVycm9yIGFuZCBy
ZXR1cm4sIHRoZXJlIGlzIG5vIG5lZWQgdG8KPiA+PiBsb2NrX21tX2FuZF9maW5kX3ZtYSgpIGFu
ZCBjaGVjayB2bV9mbGFncyBhZ2Fpbi4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBX
YW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPiA+Cj4gPiBMb29rcyBzYWZlIHRvIG1l
Lgo+ID4gVXNpbmcgKG1tICE9IE5VTEwpIHRvIGluZGljYXRlIHRoYXQgd2UgYXJlIGhvbGRpbmcg
bW1hcF9sb2NrIGlzIG5vdAo+ID4gaWRlYWwgYnV0IEkgZ3Vlc3MgdGhhdCB3b3Jrcy4KPiA+Cj4K
PiBZZXMsIEkgd2lsbCBhZGQgdGhpcyBwYXJ0IGl0IGludG8gY2hhbmdlIHRvbywKPgo+IFRoZSBh
Y2Nlc3NfZXJyb3IoKSBvZiB2bWEgYWxyZWFkeSBjaGVja2VkIHVuZGVyIHBlci1WTUEgbG9jaywg
aWYgaXQKPiBpcyBhIGJhZCBhY2Nlc3MsIGRpcmVjdGx5IGhhbmRsZSBlcnJvciwgbm8gbmVlZCB0
byByZXRyeSB3aXRoIG1tYXBfbG9jawo+IGFnYWluLiBJbiBvcmRlciB0byByZWxlYXNlIHRoZSBj
b3JyZWN0IGxvY2ssIHBhc3MgdGhlIG1tX3N0cnVjdCBpbnRvCj4gYmFkX2FyZWFfYWNjZXNzX2Vy
cm9yKCksIGlmIG1tIGlzIE5VTEwsIHJlbGVhc2Ugdm1hIGxvY2ssIG9yIHJlbGVhc2UKPiBtbWFw
X2xvY2suIFNpbmNlIHRoZSBwYWdlIGZhdXQgaXMgaGFuZGxlZCB1bmRlciBwZXItVk1BIGxvY2ss
IGNvdW50IGl0Cj4gYXMgYSB2bWEgbG9jayBldmVudCB3aXRoIFZNQV9MT0NLX1NVQ0NFU1MuCgpU
aGUgcGFydCBhYm91dCBwYXNzaW5nIG1tX3N0cnVjdCBpcyB1bm5lY2Vzc2FyeSBJTUhPLiBJdCBl
eHBsYWlucyAiaG93CnlvdSBkbyB0aGluZ3MiIGJ1dCBjaGFuZ2Vsb2cgc2hvdWxkIGRlc2NyaWJl
IG9ubHkgIndoYXQgeW91IGRvIiBhbmQKIndoeSB5b3UgZG8gdGhhdCIuIFRoZSByZXN0IHdlIGNh
biBzZWUgZnJvbSB0aGUgY29kZS4KCj4KPiBUaGFua3MuCj4KPgo+ID4gUmV2aWV3ZWQtYnk6IFN1
cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cj4gPgo+ID4+IC0tLQo+ID4+ICAg
YXJjaC94ODYvbW0vZmF1bHQuYyB8IDIzICsrKysrKysrKysrKysrLS0tLS0tLS0tCj4gPj4gICAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+
IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9mYXVsdC5jIGIvYXJjaC94ODYvbW0vZmF1bHQuYwo+
ID4+IGluZGV4IGE0Y2MyMGQwMDM2ZC4uNjdiMThhZGM3NWRkIDEwMDY0NAo+ID4+IC0tLSBhL2Fy
Y2gveDg2L21tL2ZhdWx0LmMKPiA+PiArKysgYi9hcmNoL3g4Ni9tbS9mYXVsdC5jCj4gPj4gQEAg
LTg2NiwxNCArODY2LDE3IEBAIGJhZF9hcmVhX25vc2VtYXBob3JlKHN0cnVjdCBwdF9yZWdzICpy
ZWdzLCB1bnNpZ25lZCBsb25nIGVycm9yX2NvZGUsCj4gPj4KPiA+PiAgIHN0YXRpYyB2b2lkCj4g
Pj4gICBfX2JhZF9hcmVhKHN0cnVjdCBwdF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGVycm9y
X2NvZGUsCj4gPj4gLSAgICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHJlc3MsIHUzMiBwa2V5LCBp
bnQgc2lfY29kZSkKPiA+PiArICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgc3RydWN0
IG1tX3N0cnVjdCAqbW0sCj4gPj4gKyAgICAgICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZt
YSwgdTMyIHBrZXksIGludCBzaV9jb2RlKQo+ID4+ICAgewo+ID4+IC0gICAgICAgc3RydWN0IG1t
X3N0cnVjdCAqbW0gPSBjdXJyZW50LT5tbTsKPiA+PiAgICAgICAgICAvKgo+ID4+ICAgICAgICAg
ICAqIFNvbWV0aGluZyB0cmllZCB0byBhY2Nlc3MgbWVtb3J5IHRoYXQgaXNuJ3QgaW4gb3VyIG1l
bW9yeSBtYXAuLgo+ID4+ICAgICAgICAgICAqIEZpeCBpdCwgYnV0IGNoZWNrIGlmIGl0J3Mga2Vy
bmVsIG9yIHVzZXIgZmlyc3QuLgo+ID4+ICAgICAgICAgICAqLwo+ID4+IC0gICAgICAgbW1hcF9y
ZWFkX3VubG9jayhtbSk7Cj4gPj4gKyAgICAgICBpZiAobW0pCj4gPj4gKyAgICAgICAgICAgICAg
IG1tYXBfcmVhZF91bmxvY2sobW0pOwo+ID4+ICsgICAgICAgZWxzZQo+ID4+ICsgICAgICAgICAg
ICAgICB2bWFfZW5kX3JlYWQodm1hKTsKPiA+Pgo+ID4+ICAgICAgICAgIF9fYmFkX2FyZWFfbm9z
ZW1hcGhvcmUocmVncywgZXJyb3JfY29kZSwgYWRkcmVzcywgcGtleSwgc2lfY29kZSk7Cj4gPj4g
ICB9Cj4gPj4gQEAgLTg5Nyw3ICs5MDAsOCBAQCBzdGF0aWMgaW5saW5lIGJvb2wgYmFkX2FyZWFf
YWNjZXNzX2Zyb21fcGtleXModW5zaWduZWQgbG9uZyBlcnJvcl9jb2RlLAo+ID4+Cj4gPj4gICBz
dGF0aWMgbm9pbmxpbmUgdm9pZAo+ID4+ICAgYmFkX2FyZWFfYWNjZXNzX2Vycm9yKHN0cnVjdCBw
dF9yZWdzICpyZWdzLCB1bnNpZ25lZCBsb25nIGVycm9yX2NvZGUsCj4gPj4gLSAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKQo+ID4+ICAgewo+ID4+ICAgICAgICAgIC8qCj4gPj4gICAgICAgICAg
ICogVGhpcyBPU1BLRSBjaGVjayBpcyBub3Qgc3RyaWN0bHkgbmVjZXNzYXJ5IGF0IHJ1bnRpbWUu
Cj4gPj4gQEAgLTkyNyw5ICs5MzEsOSBAQCBiYWRfYXJlYV9hY2Nlc3NfZXJyb3Ioc3RydWN0IHB0
X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgZXJyb3JfY29kZSwKPiA+PiAgICAgICAgICAgICAg
ICAgICAqLwo+ID4+ICAgICAgICAgICAgICAgICAgdTMyIHBrZXkgPSB2bWFfcGtleSh2bWEpOwo+
ID4+Cj4gPj4gLSAgICAgICAgICAgICAgIF9fYmFkX2FyZWEocmVncywgZXJyb3JfY29kZSwgYWRk
cmVzcywgcGtleSwgU0VHVl9QS1VFUlIpOwo+ID4+ICsgICAgICAgICAgICAgICBfX2JhZF9hcmVh
KHJlZ3MsIGVycm9yX2NvZGUsIGFkZHJlc3MsIG1tLCB2bWEsIHBrZXksIFNFR1ZfUEtVRVJSKTsK
PiA+PiAgICAgICAgICB9IGVsc2Ugewo+ID4+IC0gICAgICAgICAgICAgICBfX2JhZF9hcmVhKHJl
Z3MsIGVycm9yX2NvZGUsIGFkZHJlc3MsIDAsIFNFR1ZfQUNDRVJSKTsKPiA+PiArICAgICAgICAg
ICAgICAgX19iYWRfYXJlYShyZWdzLCBlcnJvcl9jb2RlLCBhZGRyZXNzLCBtbSwgdm1hLCAwLCBT
RUdWX0FDQ0VSUik7Cj4gPj4gICAgICAgICAgfQo+ID4+ICAgfQo+ID4+Cj4gPj4gQEAgLTEzNTcs
OCArMTM2MSw5IEBAIHZvaWQgZG9fdXNlcl9hZGRyX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdz
LAo+ID4+ICAgICAgICAgICAgICAgICAgZ290byBsb2NrX21tYXA7Cj4gPj4KPiA+PiAgICAgICAg
ICBpZiAodW5saWtlbHkoYWNjZXNzX2Vycm9yKGVycm9yX2NvZGUsIHZtYSkpKSB7Cj4gPj4gLSAg
ICAgICAgICAgICAgIHZtYV9lbmRfcmVhZCh2bWEpOwo+ID4+IC0gICAgICAgICAgICAgICBnb3Rv
IGxvY2tfbW1hcDsKPiA+PiArICAgICAgICAgICAgICAgYmFkX2FyZWFfYWNjZXNzX2Vycm9yKHJl
Z3MsIGVycm9yX2NvZGUsIGFkZHJlc3MsIE5VTEwsIHZtYSk7Cj4gPj4gKyAgICAgICAgICAgICAg
IGNvdW50X3ZtX3ZtYV9sb2NrX2V2ZW50KFZNQV9MT0NLX1NVQ0NFU1MpOwo+ID4+ICsgICAgICAg
ICAgICAgICByZXR1cm47Cj4gPj4gICAgICAgICAgfQo+ID4+ICAgICAgICAgIGZhdWx0ID0gaGFu
ZGxlX21tX2ZhdWx0KHZtYSwgYWRkcmVzcywgZmxhZ3MgfCBGQVVMVF9GTEFHX1ZNQV9MT0NLLCBy
ZWdzKTsKPiA+PiAgICAgICAgICBpZiAoIShmYXVsdCAmIChWTV9GQVVMVF9SRVRSWSB8IFZNX0ZB
VUxUX0NPTVBMRVRFRCkpKQo+ID4+IEBAIC0xMzk0LDcgKzEzOTksNyBAQCB2b2lkIGRvX3VzZXJf
YWRkcl9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncywKPiA+PiAgICAgICAgICAgKiB3ZSBjYW4g
aGFuZGxlIGl0Li4KPiA+PiAgICAgICAgICAgKi8KPiA+PiAgICAgICAgICBpZiAodW5saWtlbHko
YWNjZXNzX2Vycm9yKGVycm9yX2NvZGUsIHZtYSkpKSB7Cj4gPj4gLSAgICAgICAgICAgICAgIGJh
ZF9hcmVhX2FjY2Vzc19lcnJvcihyZWdzLCBlcnJvcl9jb2RlLCBhZGRyZXNzLCB2bWEpOwo+ID4+
ICsgICAgICAgICAgICAgICBiYWRfYXJlYV9hY2Nlc3NfZXJyb3IocmVncywgZXJyb3JfY29kZSwg
YWRkcmVzcywgbW0sIHZtYSk7Cj4gPj4gICAgICAgICAgICAgICAgICByZXR1cm47Cj4gPj4gICAg
ICAgICAgfQo+ID4+Cj4gPj4gLS0KPiA+PiAyLjI3LjAKPiA+PgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
