Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B5EC35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 20:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i23qt/hapS7exz8COiWCStFXhkuZiZZ/Rcp/BOrADI8=; b=t8X1A7mD8++Nfh
	Q03Wcc4B79I+AswADioOZrHJoh0ZPTddkmXGW6mcprS4dB1HHLdUr4sdiJFcBFlItIk7kr81owiMY
	ZAUFInY9nvZYrGJqEsBo/cIPn1KzbFP4VFKUU+58rVxcG4aRsS0h7rmVKPVRUxiUQ6psrLQV6GUvj
	Kqu3dMFkQX2D0xxBnegjdpe93oioviRN6IkvvRA+xD3HOIObhAwrQ4k5NdudI2R9CoLdpCg7z2cyJ
	5qtvS+gAu4yVcT8AjhQOTOl5XW0z6IWtwseoYJCKEl7D/ElKh4lTPjQ9TzBJ9xTPUFLo4Yzmq1dyG
	GA8C8ojpvYzD+NmmRGbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFK86-00C06M-1E;
	Mon, 18 Dec 2023 20:22:22 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFK82-00C05G-2r;
	Mon, 18 Dec 2023 20:22:20 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6da682dcf66so513812a34.1;
        Mon, 18 Dec 2023 12:22:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702930934; x=1703535734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGmAXhjX5Y4s1RFRjJ9B0I+ERw19f5OL+MbL6CYALRM=;
        b=MWEJgI71FzZGaTrdpvu1uQxohS5u+Z0tj2OHi+PNAsbV0rbDxY/3xgrCuiCeFGAJW3
         CdpvXod1FL/2XO0R3m6sBXqvPNPQfSHes70ulFyUbVX5P05VKYnRaqDH8UDc3MIO2lK8
         JJMOyvPAfzDM+MRP0T1JkuPF6tx3vEn5T6BXVYUAP27rHuK0EUIPrS9wiA0YdADngcCz
         MK1c9E2bKDytREbf53MrceCBeahFUgd74F9tmY2vKAoi+3yeRPKkYtvU7PFzM31Ugjc5
         KH7fUYjRpOKx+5I5COyegSOKvTwG4ydEobt92577NlVkMoR1F4+F/sv7VKdNb7ISqHH9
         kolA==
X-Gm-Message-State: AOJu0YwUD/2SpYB/jU9aNcq0CVwqFMPWn0v9CuWJzrq8KzMPLutI+3he
	bPbLNOv5KNcBh9QsjhrPxNqEFzu6s43GaBErGSY=
X-Google-Smtp-Source: AGHT+IFFmOzyX7COzVhRLC4hkeEXc2MIlTmVhC4D34QheVfbqsxG755bG+zIachM1eZIx9UOshFO0sQ+BYaFyFhhPA4=
X-Received: by 2002:a4a:a581:0:b0:591:cdc0:f28d with SMTP id
 d1-20020a4aa581000000b00591cdc0f28dmr5277719oom.0.1702930934339; Mon, 18 Dec
 2023 12:22:14 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 18 Dec 2023 21:22:03 +0100
Message-ID: <CAJZ5v0ju1JHgpjuFLHZVs4NZiARG6iBZN_wza6c2e0kDhZjK0w@mail.gmail.com>
Subject: Re: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are
 online, but not described in the DSDT
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_122218_920908_EC35C5FA 
X-CRM114-Status: GOOD (  25.38  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5l
bEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1v
cnNlQGFybS5jb20+Cj4KPiBBQ1BJIGhhcyB0d28gZGVzY3JpcHRpb25zIG9mIENQVXMsIG9uZSBp
biB0aGUgTUFEVC9BUElDIHRhYmxlLCB0aGUgb3RoZXIKPiBpbiB0aGUgRFNEVC4gQm90aCBhcmUg
cmVxdWlyZWQuIChBQ1BJIDYuNSdzIDguNCAiRGVjbGFyaW5nIFByb2Nlc3NvcnMiCj4gc2F5cyAi
RWFjaCBwcm9jZXNzb3IgaW4gdGhlIHN5c3RlbSBtdXN0IGJlIGRlY2xhcmVkIGluIHRoZSBBQ1BJ
Cj4gbmFtZXNwYWNlIikuIEhhdmluZyB0d28gZGVzY3JpcHRpb25zIGFsbG93cyBmaXJtd2FyZSBh
dXRob3JzIHRvIGdldAo+IHRoaXMgd3JvbmcuCj4KPiBJZiBDUFVzIGFyZSBkZXNjcmliZWQgaW4g
dGhlIE1BRFQvQVBJQywgdGhleSB3aWxsIGJlIGJyb3VnaHQgb25saW5lCj4gZWFybHkgZHVyaW5n
IGJvb3QuIE9uY2UgdGhlIHJlZ2lzdGVyX2NwdSgpIGNhbGxzIGFyZSBtb3ZlZCB0byBBQ1BJLAo+
IHRoZXkgd2lsbCBiZSBiYXNlZCBvbiB0aGUgRFNEVCBkZXNjcmlwdGlvbiBvZiB0aGUgQ1BVcy4g
V2hlbiBDUFVzIGFyZQo+IG1pc3NpbmcgZnJvbSB0aGUgRFNEVCBkZXNjcmlwdGlvbiwgdGhleSB3
aWxsIGVuZCB1cCBvbmxpbmUsIGJ1dCBub3QKPiByZWdpc3RlcmVkLgo+Cj4gQWRkIGEgaGVscGVy
IHRoYXQgcnVucyBhZnRlciBhY3BpX2luaXQoKSBoYXMgY29tcGxldGVkIHRvIHJlZ2lzdGVyCj4g
Q1BVcyB0aGF0IGFyZSBvbmxpbmUsIGJ1dCB3ZXJlbid0IGZvdW5kIGluIHRoZSBEU0RULiBBbnkg
Q1BVIHRoYXQKPiBpcyByZWdpc3RlcmVkIGJ5IHRoaXMgY29kZSB0cmlnZ2VycyBhIGZpcm13YXJl
LWJ1ZyB3YXJuaW5nIGFuZCBrZXJuZWwKPiB0YWludC4KPgo+IFFlbXUgVENHIG9ubHkgZGVzY3Jp
YmVzIHRoZSBmaXJzdCBDUFUgaW4gdGhlIERTRFQsIHVubGVzcyBjcHUtaG90cGx1Zwo+IGlzIGNv
bmZpZ3VyZWQuCgpTbyB3aHkgaXMgdGhpcyBhIGtlcm5lbCBwcm9ibGVtPwoKPiBTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogSm9u
YXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPgo+IFJldmlld2VkLWJ5
OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgo+IFRlc3RlZC1ieTogTWlndWVsIEx1aXMg
PG1pZ3VlbC5sdWlzQG9yYWNsZS5jb20+Cj4gVGVzdGVkLWJ5OiBWaXNobnUgUGFqanVyaSA8dmlz
aG51QG9zLmFtcGVyZWNvbXB1dGluZy5jb20+Cj4gVGVzdGVkLWJ5OiBKaWFueW9uZyBXdSA8amlh
bnlvbmcud3VAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9yYWNsZSkg
PHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvYWNwaV9w
cm9jZXNzb3IuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE5
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNz
b3IuYyBiL2RyaXZlcnMvYWNwaS9hY3BpX3Byb2Nlc3Nvci5jCj4gaW5kZXggNmE1NDJlMGNlMzk2
Li4wNTExZjJiYzEwYmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29y
LmMKPiArKysgYi9kcml2ZXJzL2FjcGkvYWNwaV9wcm9jZXNzb3IuYwo+IEBAIC03OTEsNiArNzkx
LDI1IEBAIHZvaWQgX19pbml0IGFjcGlfcHJvY2Vzc29yX2luaXQodm9pZCkKPiAgICAgICAgIGFj
cGlfcGNjX2NwdWZyZXFfaW5pdCgpOwo+ICB9Cj4KPiArc3RhdGljIGludCBfX2luaXQgYWNwaV9w
cm9jZXNzb3JfcmVnaXN0ZXJfbWlzc2luZ19jcHVzKHZvaWQpCj4gK3sKPiArICAgICAgIGludCBj
cHU7Cj4gKwo+ICsgICAgICAgaWYgKGFjcGlfZGlzYWJsZWQpCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+ICsKPiArICAgICAgIGZvcl9lYWNoX29ubGluZV9jcHUoY3B1KSB7Cj4gKyAgICAg
ICAgICAgICAgIGlmICghZ2V0X2NwdV9kZXZpY2UoY3B1KSkgewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHByX2Vycl9vbmNlKEZXX0JVRyAiQ1BVICV1IGhhcyBubyBBQ1BJIG5hbWVzcGFjZSBk
ZXNjcmlwdGlvbiFcbiIsIGNwdSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYWRkX3RhaW50
KFRBSU5UX0ZJUk1XQVJFX1dPUktBUk9VTkQsIExPQ0tERVBfU1RJTExfT0spOwo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGFyY2hfcmVnaXN0ZXJfY3B1KGNwdSk7CgpXaGljaCBwYXJ0IG9mIHRo
aXMgY29kZSBpcyByZWxhdGVkIHRvIEFDUEk/Cgo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAg
ICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArc3Vic3lzX2luaXRjYWxsX3N5bmMo
YWNwaV9wcm9jZXNzb3JfcmVnaXN0ZXJfbWlzc2luZ19jcHVzKTsKPiArCj4gICNpZmRlZiBDT05G
SUdfQUNQSV9QUk9DRVNTT1JfQ1NUQVRFCj4gIC8qKgo+ICAgKiBhY3BpX3Byb2Nlc3Nvcl9jbGFp
bV9jc3RfY29udHJvbCAtIFJlcXVlc3QgX0NTVCBjb250cm9sIGZyb20gdGhlIHBsYXRmb3JtLgo+
IC0tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
