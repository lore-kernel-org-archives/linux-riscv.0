Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEEBC7618E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Apr 2023 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMw8LlkTcDuMZaIApySD/G1fYrpx48p9A4e21kSl9XU=; b=SpsSiupAaD4Zz3
	A8VpWDeiwv+eTafozuZzOX0MsryEEERP8JkLM3l+4gqel4HzTJmQC7D5WCts2Vb/zOwL6f9s/1Ip2
	sFA5qEtsTwIFQlfTKPLgNRONg2wPA84aWtuSrQqBQrPs1cJs9V3RoBe3R01kFnIyU5YlHXBiJUmMe
	Kjwx0UEptOBUk7OYLUab86nTBhVLg8rFutJILJAWwR7tyPIG2NxSo/FlGXvMgqfRt2011sP2JALom
	ExhULxDIm4TD5tgwtL5STbC2CnG40qxu42dpoaGXnt478cVqnm6XdsktlsdKGHoOCXz6w9u3t71Sm
	qdy62HEBLLn0O0/lSVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqqus-00Fc7n-0t;
	Mon, 24 Apr 2023 07:47:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqquo-00Fc6r-2D
	for linux-riscv@lists.infradead.org;
	Mon, 24 Apr 2023 07:47:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f178da21b2so42369035e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Apr 2023 00:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682322428; x=1684914428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFc9V6ChrklJHgrfyw7Iu80wOWV8HBfJGpTj61yU1FY=;
        b=nXXNhuqcy8wNeIM18uPs0B0j3nMkFTs6j0ITLW3/DrngLFRKPseDY9aB/wIt7KCfCG
         Bq61pvwHWmsVIP10vl4c++zxZTiL75+qke/NfYGg0dQ8nYeLT7OAUQp0BOOhDYH4UyKi
         o2uNt2GhWTOHKfzl8emrWg+KsMo8sGYOxRC8gY8zyGN1GXOqGEf9ARZ/b3U6JOBrZ9S7
         mdDEUj3sW90qKWy1np+JaxTkeEFK5zrSKLF+MeofG8DhT4Pc8TJxHC5h6w/o96YmlQDX
         9mcTJGRvJP++gWB091DpJOJYE3Hd2MBe9x+/JD8KDjJR7Hrpdyo02i8knQvh/zN47GRS
         6LFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682322428; x=1684914428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFc9V6ChrklJHgrfyw7Iu80wOWV8HBfJGpTj61yU1FY=;
        b=LKQYVWX2/HvKWYiwHGIJcfigTOcA4C8K+qer+agW8iHE0eVRR14snwJeQqOxqyMagN
         sEJpfMsrOFRG0bElOsyGEyaWbIfmI1i7wBVfleHLCWfWLhxRq33B6l2lHgRmd847PUcA
         0qGq0BBZHhQVTHaf+q+2XVQJVYIDD1KEknUROGE0Vq/oQUKff1UU0Wg1r1C9HJADnFrw
         1f7t5oSXzaptIiwIs1gjoiSkoAaUsfNDku37Yir/MaZKvW6QLD52yqCcLWQMwk34wszw
         0IQeFHu+jNvRugrfmadXMYh0QcHJ7iTDHdeA9LkTiuYdITHYaLrSmweO28pCC26bGxFn
         /9YA==
X-Gm-Message-State: AAQBX9e951+GSL4XfR0zfAomnBRjWZV+D7hqk07yh1XjCkldd99odLfq
	rdm0rkmbkNhe8fzoMQY9x9GinYACiWJ3hB7IhcylPw==
X-Google-Smtp-Source: AKy350aqLi2DNcNqSKzDP7Khh2JHIXHfZ+sCVeCLhmPn82am4Znl9RTPkz+v7qvV8oQ3ya4JNwcZpl3tihJWv4fgc+8=
X-Received: by 2002:adf:db4e:0:b0:2f2:3dbf:6922 with SMTP id
 f14-20020adfdb4e000000b002f23dbf6922mr7791264wrj.22.1682322428617; Mon, 24
 Apr 2023 00:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230421075111.1391952-1-woodrow.shen@sifive.com>
In-Reply-To: <20230421075111.1391952-1-woodrow.shen@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 24 Apr 2023 09:46:57 +0200
Message-ID: <CAHVXubhW2=TQKYgaBFWeLKPcG4mgk08zk3kceK-53BdobE=Eeg@mail.gmail.com>
Subject: Re: [RFC PATCH] riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must
 be readable
To: Woodrow Shen <woodrow.shen@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, 
	linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, 
	greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_004714_961699_E9F9294F 
X-CRM114-Status: GOOD (  17.24  )
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

SGkgV29vZHJvdywKCk9uIEZyaSwgQXByIDIxLCAyMDIzIGF0IDk6NTHigK9BTSBXb29kcm93IFNo
ZW4gPHdvb2Ryb3cuc2hlbkBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEZyb206IEhzaWVoLVRzZW5n
IFNoZW4gPHdvb2Ryb3cuc2hlbkBzaWZpdmUuY29tPgo+Cj4gVGhlIGNvbW1pdCA4YWViN2IxN2Yw
NGUgKCJSSVNDLVY6IE1ha2UgbW1hcCgpIHdpdGggUFJPVF9XUklURSBpbXBseSBQUk9UX1JFQUQi
KQo+IGFsbG93cyByaXNjdiB0byB1c2UgbW1hcCB3aXRoIFBST1RfV1JJVEUgb25seSwgYW5kIG1l
YW53aGlsZSBtbWFwIHdpdGggdyt4IGlzCj4gYWxzbyBwZXJtaXR0ZWQuIEhvd2V2ZXIsIHdoZW4g
dXNlcnNwYWNlIHRyaWVzIHRvIGFjY2VzcyB0aGlzIHBhZ2Ugd2l0aAo+IFBST1RfV1JJVEV8UFJP
VF9FWEVDLCB3aGljaCBjYXVzZXMgaW5maW5pdGUgbG9vcCBhdCBsb2FkIHBhZ2UgZmF1bHQgYXMg
d2VsbCBhcwo+IGl0IHRyaWdnZXJzIHNvZnQgbG9ja3VwLiBBY2NvcmRpbmcgdG8gcmlzY3YgcHJp
dmlsZWdlZCBzcGVjLAo+ICJXcml0YWJsZSBwYWdlcyBtdXN0IGFsc28gYmUgbWFya2VkIHJlYWRh
YmxlIi4gVGhlIGZpeCB0byBkcm9wIHRoZQo+IGBQQUdFX0NPUFlfRVhFQ2AgYW5kIHRoZW4gYFBB
R0VfQ09QWV9SRUFEX0VYRUNgIHNob3VsZCBiZSBqdXN0IHVzZWQgaW5zdGVhZC4KPiBUaGlzIGFs
aWducyB0aGUgb3RoZXIgYXJjaGVzIChpLmUgYXJtNjQpIGZvciBwcm90ZWN0aW9uX21hcC4KPgo+
IEZpeGVzOiA4YWViN2IxN2YwNGUgKCJSSVNDLVY6IE1ha2UgbW1hcCgpIHdpdGggUFJPVF9XUklU
RSBpbXBseSBQUk9UX1JFQUQiKQo+IFNpZ25lZC1vZmYtYnk6IEhzaWVoLVRzZW5nIFNoZW4gPHdv
b2Ryb3cuc2hlbkBzaWZpdmUuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Bn
dGFibGUuaCB8IDEgLQo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyAgICAgICAgICAgICB8IDIgKy0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggZjY0MTgzN2NjZjMxLi5iYjFlMDUzNjc3Mzkg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+IEBAIC0xNjUsNyArMTY1LDYgQEAgZXh0
ZXJuIHN0cnVjdCBwdF9hbGxvY19vcHMgcHRfb3BzIF9faW5pdGRhdGE7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfUEFHRV9FWEVDIHwgX1BBR0VfV1JJVEUpCj4K
PiAgI2RlZmluZSBQQUdFX0NPUFkgICAgICAgICAgICAgIFBBR0VfUkVBRAo+IC0jZGVmaW5lIFBB
R0VfQ09QWV9FWEVDICAgICAgICAgUEFHRV9FWEVDCj4gICNkZWZpbmUgUEFHRV9DT1BZX1JFQURf
RVhFQyAgICBQQUdFX1JFQURfRVhFQwo+ICAjZGVmaW5lIFBBR0VfU0hBUkVEICAgICAgICAgICAg
UEFHRV9XUklURQo+ICAjZGVmaW5lIFBBR0VfU0hBUkVEX0VYRUMgICAgICAgUEFHRV9XUklURV9F
WEVDCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9p
bml0LmMKPiBpbmRleCAwZjE0ZjRhOGQxNzkuLjhiOGM2YWQ4NWZkYiAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L21tL2luaXQuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTI4
NSw3ICsyODUsNyBAQCBzdGF0aWMgY29uc3QgcGdwcm90X3QgcHJvdGVjdGlvbl9tYXBbMTZdID0g
ewo+ICAgICAgICAgW1ZNX1dSSVRFIHwgVk1fUkVBRF0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPSBQQUdFX0NPUFksCj4gICAgICAgICBbVk1fRVhFQ10gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICA9IFBBR0VfRVhFQywKPiAgICAgICAgIFtWTV9FWEVDIHwgVk1fUkVB
RF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgID0gUEFHRV9SRUFEX0VYRUMsCj4gLSAgICAg
ICBbVk1fRVhFQyB8IFZNX1dSSVRFXSAgICAgICAgICAgICAgICAgICAgICAgICAgICA9IFBBR0Vf
Q09QWV9FWEVDLAo+ICsgICAgICAgW1ZNX0VYRUMgfCBWTV9XUklURV0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPSBQQUdFX0NPUFlfUkVBRF9FWEVDLAo+ICAgICAgICAgW1ZNX0VYRUMgfCBW
TV9XUklURSB8IFZNX1JFQURdICAgICAgICAgICAgICAgICAgPSBQQUdFX0NPUFlfUkVBRF9FWEVD
LAo+ICAgICAgICAgW1ZNX1NIQVJFRF0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgPSBQQUdFX05PTkUsCj4gICAgICAgICBbVk1fU0hBUkVEIHwgVk1fUkVBRF0gICAgICAgICAg
ICAgICAgICAgICAgICAgICA9IFBBR0VfUkVBRCwKPiAtLQo+IDIuMzQuMQo+CgpUaGlzIGxvb2tz
IHNhbmUsIGFuZCBpdCBhbGlnbnMgdGhlIGJlaGF2aW91ciB3aXRoIFZNX1NIQVJFRCB8IFZNX0VY
RUMKfCBWTV9XUklURSB3aGljaCBpbXBsaWVzIHJlYWQuIE9uZSBuaXQgdGhvdWdoOiBzaW5jZSBQ
QUdFX0NPUFlfRVhFQyBpcwpub3QgdXNlZCBhbnltb3JlLCBJIHdvdWxkIHJlbmFtZSBQQUdFX0NP
UFlfUkVBRF9FWEVDIGludG8KUEFHRV9DT1BZX0VYRUMgYW5kIHJlbW92ZSBQQUdFX0NPUFlfUkVB
RF9FWEVDIChzbyB0aGF0IFBBR0VfQ09QWV9FWEVDCmlzIHRoZSBlcXVpdmFsZW50IG9mIFBBR0Vf
U0hBUkVEX0VYRUMpLgoKU28geW91IGNhbiBhZGQgaW4geW91ciBuZXh0IHZlcnNpb246CgpSZXZp
ZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtz
IQoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
