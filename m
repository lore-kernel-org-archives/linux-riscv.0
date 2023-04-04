Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DB2C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Ltk98/VpxyJ+oW0cjO3u7dNmHgSq5iJcFK4YzrP4eE=; b=y+Sfzhv4OGhCdx
	Dm+VXC9E3yjWErsg0xWWKm1NuacZDiKig7wkwXy/63o0r2eSUWGwKf926mrIqk5tGM7G3aXPifz7R
	W8eyJAggx8+uQnU860OUUEWS3S1r4GBWjy2WfFa1DkBqxUNUS5MdUg5qvNw38lPWTMEaLsRGG3VMQ
	i0cXOAJS3lwMIrzr+5SL+urWzPk2im0lF8lv2G7xGyF13VvzFhde6MsoE8kQxA03DsLH/szF36qT6
	S8akjtY1M9IIc97t+N8OOLEUzEt7LYiAi9/1iWyNrSrrpL+GPmsFXe6G1OQhwZu2x7u6tEuFg4+7m
	/8imExVr2x6qdQxVAucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfDW-001928-0s;
	Tue, 04 Apr 2023 11:52:50 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjfDT-00190O-2A
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 11:52:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id h17so32482476wrt.8
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 04:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680609165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OLv0LN8lAk3QfnUhhhnsk24mDFgoCCiKw5kM+c/FrNk=;
        b=PIlIYQqvjr/V8cmB877Rcy8JB6XO7vQw6kz3u5ewvPi/aNCK9zVxMGitBDmI+6p/7D
         QT79PNqb8XggeQ6ggP6RpTGCLaREBQ/fM0+tB1ZF3J9IZvdpirQg+vl9Ge/YvJxBEVM8
         Sh7iDicitGN00XAVMZAqG5rsejGo/Wx5E6rWtsYlyqOsxIAdKBC8vIpUmNrZ1J5tJx7k
         Ofrj8QaOZc9IWERMqUwAbI+Zemye5wxZcdNzaXrb78dbgqoMHpybLvBZq8Oar6aZrOXm
         lPgCqlZEy3jB8t5/wdP3gtix8wLReCQtMnhSxZFXJ/M0rKVtoXWDpHquRNOney/B37us
         z9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680609165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLv0LN8lAk3QfnUhhhnsk24mDFgoCCiKw5kM+c/FrNk=;
        b=K3T+8T+i0TJDHRWhuO25QZ5LtZREQGgp0PYzvEckcE8BA8loz7xmOE5JkHpNcJX55D
         Ep/bfulgDtx5NLnFdtg/QMXnfAOmJp43cd/UiPDplesG2eM/aDjLJe3i7Iv6bW+R01km
         3BjUDueHYygK+Ev65N24FGAC5gZV7civwop8hS7AOhYHOkbi/g/O9Vd+z8P7jxb9HroI
         yLJa2INVSK30i8vUvPr02lz8rJ5F/16E3ekvx0RCWStWuG5FZzQLbA7I6R5yMocNbDaQ
         8yY5sXoVZ4ntkluB83IaB1OrqHrnv82pM/fKuswYP8tGrJ77PqaudqETOSOehGX2Fxex
         jeWQ==
X-Gm-Message-State: AAQBX9clku4G6KAMjZmuWw1HY6itbTku4/13o5ySxa1X4PT5hiw0JOvV
	PJ+qvhLTN9EnZnF+yhFZLn4ODg==
X-Google-Smtp-Source: AKy350Yya7ma4256kplKnJKWPZOqQ3wKmsQ11nyME/nhGt+TWoTPHYoPW3R82d3hK3Fcm80POIwx0w==
X-Received: by 2002:a5d:4904:0:b0:2cf:e868:f781 with SMTP id x4-20020a5d4904000000b002cfe868f781mr1470835wrq.42.1680609164757;
        Tue, 04 Apr 2023 04:52:44 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id d16-20020a5d4f90000000b002d51d10a3fasm12192160wru.55.2023.04.04.04.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 04:52:44 -0700 (PDT)
Date: Tue, 4 Apr 2023 13:52:43 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
Message-ID: <uogikq56rf7jytuufhsutdedb73b3rh67biwpzsz6ngg5rudco@qcwt7plumwpb>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
 <osrpjiywxtkgxb5i6mfvxzfrzrnjv75uqzvlu3fouo4mqsktgj@blcmyjt3twqg>
 <CAAhSdy1JEQBiO55iCy97arO63VjGc+NicUvvwzTpK97W97LmJg@mail.gmail.com>
 <ejt3x4p7xhxfvwiafnogfwdn5dzd4qyowlht22utnbvzefsbyh@7dch4mebwckm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ejt3x4p7xhxfvwiafnogfwdn5dzd4qyowlht22utnbvzefsbyh@7dch4mebwckm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_045247_711920_0E2DA86E 
X-CRM114-Status: GOOD (  23.72  )
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

T24gTW9uLCBBcHIgMDMsIDIwMjMgYXQgMDI6MjM6MDFQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdy
b3RlOgo+IE9uIE1vbiwgQXByIDAzLCAyMDIzIGF0IDA1OjM0OjU3UE0gKzA1MzAsIEFudXAgUGF0
ZWwgd3JvdGU6Cj4gPiBPbiBNb24sIEFwciAzLCAyMDIzIGF0IDU6MDHigK9QTSBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBB
cHIgMDMsIDIwMjMgYXQgMDM6MDM6MDhQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4g
PiBXZSBpbXBsZW1lbnQgT05FX1JFRyBpbnRlcmZhY2UgZm9yIEFJQSBDU1JzIGFzIGEgc2VwYXJh
dGUgc3VidHlwZQo+ID4gPiA+IHVuZGVyIHRoZSBDU1IgT05FX1JFRyBpbnRlcmZhY2UuCj4gPiA+
ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3Jv
LmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oIHwgOCArKysrKysrKwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAg
ICAgfCA4ICsrKysrKysrCj4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygr
KQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ID4gPiA+IGluZGV4
IDE4MjAyM2RjOWE1MS4uY2JjM2U3NGZhNjcwIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9rdm0uaAo+ID4gPiA+IEBAIC03OSw2ICs3OSwxMCBAQCBzdHJ1Y3Qga3ZtX3Jp
c2N2X2NzciB7Cj4gPiA+ID4gICAgICAgdW5zaWduZWQgbG9uZyBzY291bnRlcmVuOwo+ID4gPiA+
ICB9Owo+ID4gPiA+Cj4gPiA+ID4gKy8qIEFJQSBDU1IgcmVnaXN0ZXJzIGZvciBLVk1fR0VUX09O
RV9SRUcgYW5kIEtWTV9TRVRfT05FX1JFRyAqLwo+ID4gPiA+ICtzdHJ1Y3Qga3ZtX3Jpc2N2X2Fp
YV9jc3Igewo+ID4gPiA+ICt9Owo+ID4gPiA+ICsKPiA+ID4gPiAgLyogVElNRVIgcmVnaXN0ZXJz
IGZvciBLVk1fR0VUX09ORV9SRUcgYW5kIEtWTV9TRVRfT05FX1JFRyAqLwo+ID4gPiA+ICBzdHJ1
Y3Qga3ZtX3Jpc2N2X3RpbWVyIHsKPiA+ID4gPiAgICAgICBfX3U2NCBmcmVxdWVuY3k7Cj4gPiA+
ID4gQEAgLTEwNyw2ICsxMTEsNyBAQCBlbnVtIEtWTV9SSVNDVl9JU0FfRVhUX0lEIHsKPiA+ID4g
PiAgICAgICBLVk1fUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSwKPiA+ID4gPiAgICAgICBLVk1f
UklTQ1ZfSVNBX0VYVF9aSUNCT00sCj4gPiA+ID4gICAgICAgS1ZNX1JJU0NWX0lTQV9FWFRfWkJC
LAo+ID4gPgo+ID4gPiBMb29rcyBsaWtlIHRoaXMgcGF0Y2ggaXMgYWxzbyBiYXNlZCBvbiAiW1BB
VENIXSBSSVNDLVY6IEtWTTogQWxsb3cgWmJiCj4gPiA+IGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0i
Cj4gPiAKPiA+IFllcywgZG8geW91IHdhbnQgbWUgdG8gY2hhbmdlIHRoZSBvcmRlciBvZiBkZXBl
bmRlbmN5Pwo+IAo+IEl0J3MgcHJvYmFibHkgYmVzdCBpZiBuZWl0aGVyIGRlcGVuZCBvbiBlYWNo
IG90aGVyLCBzaW5jZSB0aGV5J3JlCj4gaW5kZXBlbmRlbnQsIGJ1dCBvdGhlcndpc2UgdGhlIG9y
ZGVyIGRvZXNuJ3QgbWF0dGVyLiBJdCdkIGJlIG5pY2UgdG8gY2FsbAo+IHRoZSBvcmRlciBvdXQg
aW4gdGhlIGNvdmVyIGxldHRlciB0byBnaXZlIHBhdGNod29yayBhIGNoYW5jZSBhdCBhdXRvbWF0
aWMKPiBidWlsZCB0ZXN0aW5nLCB0aG91Z2guIFRvIGNhbGwgaXQgb3V0LCBJIGJlbGlldmUgYWRk
aW5nCj4gCj4gQmFzZWQtb246IDIwMjMwNDAxMTEyNzMwLjIxMDUyNDAtMS1hcGF0ZWxAdmVudGFu
YW1pY3JvLmNvbQo+IAo+IHRvIHRoZSBjb3ZlciBsZXR0ZXIgc2hvdWxkIHdvcmsuCgpJIGFsc28g
anVzdCBub3RpY2VkIHRoYXQgdGhpcyBiYXNlZCBvbiAiUklTQy1WOiBLVk06IEFkZCBPTkVfUkVH
CmludGVyZmFjZSB0byBlbmFibGUvZGlzYWJsZSBTQkkgZXh0ZW5zaW9ucyJbMV0gYW5kIGl0IG5l
ZWRzIHRvIGJlCmluIG9yZGVyIHRvIHBpY2sgdXAgdGhlIEtWTV9SRUdfUklTQ1ZfU1VCVFlQRV9N
QVNLIGFuZApLVk1fUkVHX1JJU0NWX1NVQlRZUEVfU0hJRlQgZGVmaW5lcy4gSXQnZCBiZSBnb29k
IHRvIGNhbGwgdGhhdApwYXRjaCBvdXQgd2l0aCBCYXNlZC1vbi4KClsxXTogMjAyMzAzMzExNzQ1
NDIuMjA2NzU2MC0yLWFwYXRlbEB2ZW50YW5hbWljcm8uY29tCgpUaGFua3MsCmRyZXcKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
