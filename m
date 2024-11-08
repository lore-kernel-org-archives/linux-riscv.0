Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85CED64098
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 22:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKViWDxw6QoWDlVsnPHfVGAFQZ1hW6jpmIG8EoT2Nps=; b=PmqK5ff+uurSof
	uq3vko8jbVZQ5tF4WJOfMjmKyRBJSdNzeof9ExNf0ApCcO8R6psP2Dkpshz2oAM5KO7IJWkMo3fUo
	S1uSoDUEmV3rhBwYUMtq6BSmBcYhFpXQHyuVvyzChAzYwBTU90GgThbesS8SI35qm4q3PwR8Jd+Mi
	jM3Pm9dP1jDD5Tz8XrO+pPsHrC8gflsGxFhYCrFV6sRq4+WnwrDmzEAiBhrKbkKnVoInxdR0WkRbX
	fDX57Lpk75hB1xxbcrez5zVENTnqcyGa+9rECZ+x/O6V+tPn6dMiILLoZb9KvnfHUTsNiBbWnSKKF
	jVFLyiqzxLsPGcYGtbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9XDi-0000000C6AX-1oos;
	Fri, 08 Nov 2024 22:12:46 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9XDf-0000000C6A8-127L
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 22:12:44 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so1955845a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 14:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731103962; x=1731708762; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Y8a1AHAlhuTlLNcLfqXjrOEzx68EYY+QPX1C03VNss=;
        b=W+wFYyNbYDoum4Jhw/62rokl3LheWUnKmEmIK7Kl5Yp7PWXyGIVpeRyYzWLqhEdoMt
         WH7I+e3fWtrxSvHwePGPugfsj2ChR+4hJZGfl6hqS7WiZDqVNf0yIpW8jJMXqKhqlvof
         DGCp5VEiG0U2hQ/9L8o9TIJ2g9SOV8a8BVl4G9E8SlBJucn6GF9FG7m0v+8B5Z9Ic0Xd
         4k7zViKmfgnv0iEO2Lr0+13OOk7WT3Ujx08od67YSm4T+9/gSFlHjHg46ih4WX8Xf4tT
         ORKj+YnFDgPZZwZ5u9W6mRzHuShqTwMXt6cNv+gos+ciiULpyXqXL4SvFQxb7jnt/JSY
         t/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731103962; x=1731708762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Y8a1AHAlhuTlLNcLfqXjrOEzx68EYY+QPX1C03VNss=;
        b=rMF5jKokq48sg1AwGHfEFZJn1tZK6HFUZAmQtVgUFiZsleJ9E5I497MOVWU+4T0DFg
         wK3ww4Cowl/b5Q+ai3jw514lZAOQ+nKjEzEPo78ADaFuLD5vc1e4GB6FBOyQQB9sgevS
         8Exk52j2izOZfWlg7R2keObqmTrkOvIY2Ks1Cexn6ZLkY2qx5WGJmNUGVhYEcV3aWjiX
         CumspcPP/rI6yOmo6QcWqptM5kFsSdEdURV03B2yX74+VAIOPAEzbvQrWbQ6Fxloj9fn
         lVXSAEyRB6IfgwLPjVGpR2hJuJlS8F5/Ba2eZ3SY4dVBuO6BeFZ7LCaDjYL61M+oSekB
         PRrw==
X-Forwarded-Encrypted: i=1; AJvYcCW1bE2K5IrON7XagT0Bp47FpzaT3HkXhNyzTuv8JeN30KMWzpeWNLwKRgFmqbenKnAWDR2sa7b6Ua0cSg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEBou8ZA2os1J0oJfgQ8tkRQhYc9JgG4LvEvRnrES2BdS4kxfp
	yvoMJEAxLvfck9SBgVs59T9tQUDSLw4bzL4i4PN+M+dJG3Xa29tap/OWkEtlWFPB6vA6Bcm62VA
	fSYoZ6ZmHcar5t0sTUhQFIVu1A9Y=
X-Google-Smtp-Source: AGHT+IHtIoOOc0qNZA15HBrRt6plvL2XTAgiaEwHRJvo/oRBU8GZjS12ieRf2Ck9tGR17spq7vZX3+InpD0NN+fqUVI=
X-Received: by 2002:a17:90b:3d09:b0:2da:8e9b:f37b with SMTP id
 98e67ed59e1d1-2e9b172af1fmr5648708a91.24.1731103961909; Fri, 08 Nov 2024
 14:12:41 -0800 (PST)
MIME-Version: 1.0
References: <20241107-fix_handle_misaligned_load-v1-1-07d7852c9991@rivosinc.com>
 <CAJFTR8RBcoqYmWNmNe_ZixO3bv2aP-wGCbX7ieorXYxxMAa7BA@mail.gmail.com>
In-Reply-To: <CAJFTR8RBcoqYmWNmNe_ZixO3bv2aP-wGCbX7ieorXYxxMAa7BA@mail.gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Fri, 8 Nov 2024 17:12:04 -0500
Message-ID: <CAJFTR8Sas83NkRPSuSdbb3qtDNra=cbinPoBmpyt4_ic8R5LQg@mail.gmail.com>
Subject: Re: [PATCH for-next] riscv: Fix default misaligned access trap
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_141243_306499_921991C4 
X-CRM114-Status: GOOD (  16.89  )
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

T24gRnJpLCBOb3YgOCwgMjAyNCBhdCA1OjA54oCvUE0gSmVzc2UgVCA8bXIuYm9zc21hbjA3NUBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBOb3YgNywgMjAyNCBhdCA1OjM44oCvUE0gQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ29tbWl0
IGQxNzAzZGM3YmM4ZSAoIlJJU0MtVjogRGV0ZWN0IHVuYWxpZ25lZCB2ZWN0b3IgYWNjZXNzZXMK
PiA+IHN1cHBvcnRlZCIpIHJlbW92ZWQgdGhlIGRlZmF1bHQgaGFuZGxlcnMgZm9yIGhhbmRsZV9t
aXNhbGlnbmVkX2xvYWQoKQo+ID4gYW5kIGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKCkuIFdoZW4g
dGhlIGtlcm5lbCBpcyBjb21waWxlZCB3aXRob3V0Cj4gPiBSSVNDVl9TQ0FMQVJfTUlTQUxJR05F
RAo+IFRlY2huaWNhbGx5IENPTkZJR19SSVNDVl9NSVNBTElHTkVELgo+IEkgYXBwYXJlbnRseSBj
aGFuZ2VkIGArb2JqLXkgKz0gdHJhcHNfbWlzYWxpZ25lZC5vYCB0bwo+IGArb2JqLSQoQ09ORklH
X1JJU0NWX01JU0FMSUdORUQpICs9IHRyYXBzX21pc2FsaWduZWQub2AKPiBpbiBWMiBhbmQgZGlk
bid0IGNoYW5nZSB0aGF0IGNoZWNrIGJhY2sgb29wcyBzb3JyeS4KPgo+ID4gLCB0aGVzZSBoYW5k
bGVycyBhcmUgbmV2ZXIgZGVmaW5lZCwgY2F1c2luZwo+ID4gY29tcGlsYXRpb24gZXJyb3JzLgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUgPG1yLmJvc3NtYW4wNzVAZ21haWwuY29t
Pgo+Cj4gPiBGaXhlczogZDE3MDNkYzdiYzhlICgiUklTQy1WOiBEZXRlY3QgdW5hbGlnbmVkIHZl
Y3RvciBhY2Nlc3NlcyBzdXBwb3J0ZWQiKQo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9lbnRyeS1jb21tb24uaCB8IDEyICsrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZW50cnktY29tbW9uLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1v
bi5oCj4gPiBpbmRleCA3YjMyZDJiMDhiYjYuLmMyODA4NTYxZGY4MSAxMDA2NDQKPiA+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmgKPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmgKPiA+IEBAIC0yNSw3ICsyNSwxOSBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgYXJjaF9leGl0X3RvX3VzZXJfbW9kZV9wcmVwYXJlKHN0cnVjdCBwdF9y
ZWdzICpyZWdzLAo+ID4gIHZvaWQgaGFuZGxlX3BhZ2VfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpOwo+ID4gIHZvaWQgaGFuZGxlX2JyZWFrKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPiA+Cj4g
PiArI2lmZGVmIENPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRAoKTWVhbnQgdG8gc2F5IHRv
IGNoYW5nZSB0aGlzIHRvIENPTkZJR19SSVNDVl9NSVNBTElHTkVELgpBcyB0aGV5IGFyZSBkZWZp
bmVkIHdoZW4gQ09ORklHX1JJU0NWX1NDQUxBUl9NSVNBTElHTkVEIGlzIGZhbHNlCmFuZCBDT05G
SUdfUklTQ1ZfVkVDVE9FX01JU0FMSUdORUQgaXMgdHJ1ZS4gdGhleSBhcmUgb25seSBub3QgZGVm
aW5lZCB3aGVuCkNPTkZJR19SSVNDVl9TQ0FMQVJfTUlTQUxJR05FRCBpcyBmYWxzZS4KCj4gPiAg
aW50IGhhbmRsZV9taXNhbGlnbmVkX2xvYWQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpOwo+ID4gIGlu
dCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gPiArI2Vs
c2UKPiA+ICtzdGF0aWMgaW5saW5lIGludCBoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBw
dF9yZWdzICpyZWdzKQo+ID4gK3sKPiA+ICsgICAgICAgcmV0dXJuIC0xOwo+ID4gK30KPiA+ICsK
PiA+ICtzdGF0aWMgaW5saW5lIGludCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1Y3QgcHRf
cmVncyAqcmVncykKPiA+ICt7Cj4gPiArICAgICAgIHJldHVybiAtMTsKPiA+ICt9Cj4gPiArI2Vu
ZGlmCj4gPgo+ID4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX0VOVFJZX0NPTU1PTl9IICovCj4gPgo+
ID4gLS0tCj4gPiBiYXNlLWNvbW1pdDogNzQ3NDFhMDUwYjc5ZDMxZDhkMmVlZWUxMmM3NzczNjU5
NmQwYTZiMgo+ID4gY2hhbmdlLWlkOiAyMDI0MTEwNy1maXhfaGFuZGxlX21pc2FsaWduZWRfbG9h
ZC04YmU4NmNiMDgwNmUKPiA+IC0tCj4gPiAtIENoYXJsaWUKPiA+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
