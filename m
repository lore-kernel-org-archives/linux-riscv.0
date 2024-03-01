Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F01C54798
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 02:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAdq1tWSVpBzteb5hS2xjYmTFkD2RocI0AzpMFxMZ4Q=; b=mQTKml6JnWQsat
	rzz2Dft5qxX3fpWw12beIpAGqxtRDiyWCjzmaK9vYRWdXjzegcSCay2EdRg4Hth9byQHkt8i+/pjL
	seTwkY8Kq1/2tBVU/U5qbf4utoNGug1JqbojKbDyELasbpJIeEYPtg1mtsorek5iuzlaxKh0pWLfX
	4YxIs6hZHZir2Y7kDUPk2D5kendpavs5vVf5UAuOmL1Z4KroFJwQp1MM4k6t4jtlZTopzjtcRptCl
	AaHFwLqjkUOp/xrKZEBi/sG9JNkgT9e1sMMC9cSc58CkzG90pUrXQxxrh7L/kpY6Njo/NOPCr8hno
	fCSLlqaHoGyje1mPZC5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfsxI-0000000G3oU-3sS6;
	Fri, 01 Mar 2024 02:49:00 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfsxF-0000000G3nu-2gP8
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 02:48:58 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-220461b7597so904172fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Feb 2024 18:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709261337; x=1709866137; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4wL4sVLm0d8inTQGwPB9JktEU1zAMD8FxX2kgSYWC8=;
        b=KsSEgfJ0zkGNOq76O36XiVtsNJGo5P0N1XmADHs6sCihJhksrH4bVUJayPiweNQant
         oebHBpi92+t9ISbV+yg4erGGqbVfpg1JDjbxjz4/iQ+YPhg6peWufCfx3rcCQnvsBCA7
         frYdA5IAC83FnY0jGQ1qr9VOXyzBtroxOpxGLZCbHIDvuOQ7SExULVDAQ8yXPHBsItj0
         m6KovMIKDPTt/PHWQzuLsxoZ7/4JHIgSXiKRob5nqZYLHqOKR23DDvsAfrawpEirPZRc
         Bury7FNHDDBPa5BXcAIUvUsiotfTbCUbYd66it/7OJNxg3oH4P4NZghDSq+EMYPPKfwZ
         z64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709261337; x=1709866137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4wL4sVLm0d8inTQGwPB9JktEU1zAMD8FxX2kgSYWC8=;
        b=GDxRGrx+cDljf2902sjQy/7DepiPF1omVpDcck5eiFRkvvQWleJP4oUgxHaeCb08CW
         iRhkGo3Fq5+DPHIaxcp9i5sN7Ccy7r9iBTs8IFA/yDdozKjQm5lqDmrVB2h+h4rnxSpz
         y4u0hdLF9cOflbL6hUhw8opznsniLBJ6fG/VbAAgCyBlLYl+G+dqjTyipeZhF+TtdEcn
         WStQSvi+wM4K6F8LYcvlGa7n2zVVTUy1xKKT1LwHdFKKV33GKnJi4dvp+evEI3yKiuaq
         sjo3+Tg78JMuP+CBMEVFVIB4IyZDyqMpzCrNbFDm/eNlsPuoPt26ZVr6M7qwal1ghDhk
         KEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJum6cz56rkuQV0ek9u9v0/5DYq2B8ejq03oHT4AJCpJ1twYFAkhuLMIlmcPQ5fu6Bcz73I1ZfSmfMfAa/E7EOZz3tB7Oueb/wwm88Ji3R
X-Gm-Message-State: AOJu0Yyed+2plZ+btxzCtmZykVDuMkxo9hxR7T0pn1aMM6XniNVISblq
	UhHjMhe7p4qZDZRm/nwZzYBgKkSSylgi/9+xvL9IMbWUew4LGY+MRgO3+7kpD5BU9hpcB7T6RZH
	4EGF4KRlm1PiaiSgqItNbPqhEq5kI8zx1Bl3KFg==
X-Google-Smtp-Source: AGHT+IEiTQS7oF0FArmnvNFhGVJ1tsGZOo1OMbhw60aKsqUYfW1SLdjZuDJW0kKZW//xD4oLw7aEds9MmsaU+EbtO1A=
X-Received: by 2002:a05:6871:8e82:b0:220:bd1c:6c21 with SMTP id
 zq2-20020a0568718e8200b00220bd1c6c21mr98677oab.39.1709261336948; Thu, 29 Feb
 2024 18:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20240229232211.161961-1-samuel.holland@sifive.com> <20240229232211.161961-9-samuel.holland@sifive.com>
In-Reply-To: <20240229232211.161961-9-samuel.holland@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 1 Mar 2024 10:48:46 +0800
Message-ID: <CAEEQ3w=8dVxO=qtW6_-SChLJ5No+7nGgf+1fXz0wSeBhb0Kk0A@mail.gmail.com>
Subject: Re: [External] [PATCH v5 08/13] riscv: Avoid TLB flush loops when
 affected by SiFive CIP-1200
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_184857_711595_550C71E6 
X-CRM114-Status: GOOD (  21.92  )
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

SGkgU2FtdWVsLAoKT24gRnJpLCBNYXIgMSwgMjAyNCBhdCA3OjIy4oCvQU0gU2FtdWVsIEhvbGxh
bmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gU2luY2UgaW1wbGVtZW50
YXRpb25zIGFmZmVjdGVkIGJ5IFNpRml2ZSBlcnJhdGEgQ0lQLTEyMDAgYWx3YXlzIHVzZSB0aGUK
PiBnbG9iYWwgdmFyaWFudCBvZiB0aGUgc2ZlbmNlLnZtYSBpbnN0cnVjdGlvbiwgdGhleSBvbmx5
IG5lZWQgdG8gZXhlY3V0ZQo+IHRoZSBpbnN0cnVjdGlvbiBvbmNlLiBUaGUgcmFuZ2UtYmFzZWQg
bG9vcCBvbmx5IGh1cnRzIHBlcmZvcm1hbmNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhv
bGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4KPiAobm8gY2hhbmdlcyBz
aW5jZSB2NCkKPgo+IENoYW5nZXMgaW4gdjQ6Cj4gIC0gT25seSBzZXQgdGxiX2ZsdXNoX2FsbF90
aHJlc2hvbGQgd2hlbiBDT05GSUdfTU1VPXkuCj4KPiBDaGFuZ2VzIGluIHYzOgo+ICAtIE5ldyBw
YXRjaCBmb3IgdjMKPgo+ICBhcmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhLmMgfCA1ICsr
KysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDIgKysKPiAgYXJjaC9y
aXNjdi9tbS90bGJmbHVzaC5jICAgICAgICAgIHwgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
ZXJyYXRhL3NpZml2ZS9lcnJhdGEuYyBiL2FyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEu
Ywo+IGluZGV4IDNkOWEzMmQ3OTFmNy4uNzE2Y2ZlZGFkM2EyIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEuYwo+ICsrKyBiL2FyY2gvcmlzY3YvZXJyYXRhL3Np
Zml2ZS9lcnJhdGEuYwo+IEBAIC00Miw2ICs0MiwxMSBAQCBzdGF0aWMgYm9vbCBlcnJhdGFfY2lw
XzEyMDBfY2hlY2tfZnVuYyh1bnNpZ25lZCBsb25nICBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGlt
cAo+ICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gICAgICAgICBpZiAoKGltcGlkICYg
MHhmZmZmZmYpID4gMHgyMDA2MzAgfHwgaW1waWQgPT0gMHgxMjAwNjI2KQo+ICAgICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsjaWZkZWYgQ09ORklHX01NVQo+ICsgICAgICAgdGxi
X2ZsdXNoX2FsbF90aHJlc2hvbGQgPSAwOwo+ICsjZW5kaWYKPiArCj4gICAgICAgICByZXR1cm4g
dHJ1ZTsKPiAgfQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1
c2guaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+IGluZGV4IDQ2M2I2MTVk
NzcyOC4uOGUzMjk3MjEzNzViIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dGxiZmx1c2guaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+IEBA
IC02Niw2ICs2Niw4IEBAIHZvaWQgYXJjaF90bGJiYXRjaF9hZGRfcGVuZGluZyhzdHJ1Y3QgYXJj
aF90bGJmbHVzaF91bm1hcF9iYXRjaCAqYmF0Y2gsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgdWFkZHIpOwo+ICB2b2lkIGFyY2hfZmx1c2hfdGxiX2JhdGNo
ZWRfcGVuZGluZyhzdHJ1Y3QgbW1fc3RydWN0ICptbSk7Cj4gIHZvaWQgYXJjaF90bGJiYXRjaF9m
bHVzaChzdHJ1Y3QgYXJjaF90bGJmbHVzaF91bm1hcF9iYXRjaCAqYmF0Y2gpOwo+ICsKPiArZXh0
ZXJuIHVuc2lnbmVkIGxvbmcgdGxiX2ZsdXNoX2FsbF90aHJlc2hvbGQ7Cj4gICNlbHNlIC8qIENP
TkZJR19NTVUgKi8KPiAgI2RlZmluZSBsb2NhbF9mbHVzaF90bGJfYWxsKCkgICAgICAgICAgICAg
ICAgICBkbyB7IH0gd2hpbGUgKDApCj4gICNlbmRpZiAvKiBDT05GSUdfTU1VICovCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2gu
Ywo+IGluZGV4IDM2NWUwYTBlNDcyNS4uMjI4NzBmMjEzMTg4IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvbW0vdGxiZmx1c2guYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IEBA
IC0xMSw3ICsxMSw3IEBACj4gICAqIEZsdXNoIGVudGlyZSBUTEIgaWYgbnVtYmVyIG9mIGVudHJp
ZXMgdG8gYmUgZmx1c2hlZCBpcyBncmVhdGVyCj4gICAqIHRoYW4gdGhlIHRocmVzaG9sZCBiZWxv
dy4KPiAgICovCj4gLXN0YXRpYyB1bnNpZ25lZCBsb25nIHRsYl9mbHVzaF9hbGxfdGhyZXNob2xk
IF9fcmVhZF9tb3N0bHkgPSA2NDsKPiArdW5zaWduZWQgbG9uZyB0bGJfZmx1c2hfYWxsX3RocmVz
aG9sZCBfX3JlYWRfbW9zdGx5ID0gNjQ7Cj4KPiAgc3RhdGljIHZvaWQgbG9jYWxfZmx1c2hfdGxi
X3JhbmdlX3RocmVzaG9sZF9hc2lkKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSwK
PiAtLQo+IDIuNDMuMQo+CgpJZiBsb2NhbF9mbHVzaF90bGJfYWxsX2FzaWQoKSBpcyB1c2VkIGV2
ZXJ5IHRpbWUsIG1vcmUgUFRXcyB3aWxsIGJlCmdlbmVyYXRlZC4gV2lsbCBzdWNoIG1vZGlmaWNh
dGlvbnMgZGVmaW5pdGVseSBpbXByb3ZlIHRoZSBvdmVyYWxsCnBlcmZvcm1hbmNlPwoKSGkgQWxl
eCwgU2FtdWVsLApUaGUgcmVsYXRpb25zaGlwIGJldHdlZW4gZmx1c2hfeHhfcmFuZ2VfYXNpZCgp
IGFuZCBucl9wdGVzIGlzCmJhc2ljYWxseSBsaW5lYXIgZ3Jvd3RoICh5PWt4ICtiKSwgd2hpbGUg
Zmx1c2hfYWxsX2FzaWQoKSBoYXMgbm90aGluZwp0byBkbyB3aXRoIG5yX3B0ZXMgKHk9YykuClNv
bWUgVExCcyBtYXkgZG8gc29tZSBvcHRpbWl6YXRpb24uIFRoZSBvcGVyYXRpb24gb2YgZmx1c2gg
YWxsIGl0c2VsZgpyZXF1aXJlcyB2ZXJ5IGZldyBjeWNsZXMsIGJ1dCB0aGVyZSBpcyBhIGNlcnRh
aW4gZGVsYXkgYmV0d2Vlbgpjb25zZWN1dGl2ZSBmbHVzaCBhbGwuClRoZSBpbnRlcnNlY3Rpb24g
b2YgdGhlIHR3byBzdHJhaWdodCBsaW5lcyBpcyB0aGUgb3B0aW1hbCBzb2x1dGlvbiBvZgp0bGJf
Zmx1c2hfYWxsX3RocmVzaG9sZC4gSW4gYWN0dWFsIHNpdHVhdGlvbnMsIGNvbnRpbnVvdXMKZmx1
c2hfYWxsX2FzaWQgd2lsbCBub3Qgb2NjdXIuIE9uZSBwcm9ibGVtIGNhdXNlZCBieSBmbHVzaF9h
bGxfYXNpZCgpCmlzIHRoYXQgbXVsdGlwbGUgZmx1c2ggZW50cmllcyByZXF1aXJlIFBUVywgd2hp
Y2ggY2F1c2VzIGdyZWF0ZXIKbGF0ZW5jeS4KVGhlcmVmb3JlLCB0aGUgdmFsdWUgb2YgdGxiX2Zs
dXNoX2FsbF90aHJlc2hvbGQgbmVlZHMgdG8gYmUgY29uc2lkZXJlZApvciBxdWFudGlmaWVkLiBN
YXliZSBkb2luZyBsb2NhbF9mbHVzaF90bGJfcGFnZV9hc2lkKCkgYmFzZWQgb24gdGhlCmFjdHVh
bCBucl9wdGVzX2luX3JhbmdlIHdvdWxkIGdpdmUgYmV0dGVyIG92ZXJhbGwgcGVyZm9ybWFuY2Uu
CldoYXQgZG8geW91IHRoaW5rPwoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
