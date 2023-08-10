Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB4CC001B0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8D6vab5m0vweALhf79O3K9xy2m8QlTArawfamTDsTAo=; b=YE3d7xdXqbpqzO
	8ODFb2Zl7+idlFog5h9QOzZjmnD2qfSzEg83/+PJ1LsMHO9W2IndJk0Gpbe4xj/3z5Npu71lSS1W+
	NQLocDBqpFFSOinju6wPBpYbF27odk0erdc1YJ8T0S8QwtNB1UGciR3l5vCsJsFcDBIpXVZ+xOAnA
	dy29C2fnVaSA4mBkp/hQAhpiXz9wIyScmequmLPkAES6Jukk2puYVvHUh3vPkviwdzErsOCWURXi1
	gA94LCm2ylNLeQ1wpzcraRGiffTwIPw+mOSV3Ha+XLlAqXb8H815rJHlvLwAnq4VNdu854etWbJf/
	2MLfnOjGnmKYIhnL+dnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU9O3-008HuX-2d;
	Thu, 10 Aug 2023 17:23:51 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU9O0-008Hts-2j
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 17:23:50 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe27849e6aso1785284e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 10:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691688226; x=1692293026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFpZL/3eilu1u9uFTaffok5Lp1a2n41gMaTDjQGUS0Y=;
        b=Z39LG0YvrggY4w+uDeo+HRWAVB8gUVRBqGA3T0sqVMIpQFzrikFhY00kAqkkyY6UmQ
         +8bT4lyYiir9XQIsR40967mnQqeUB2iNHK6oDeeu2Tndilmgz9u+ZiWzAOjwP3OStqit
         brDAS4OHwEAScJslAwzQrznSzZaKFCQbFG4dnrHOZG1nstV3Ggbemajg01rr8nYpn76Q
         3+qQ+sbWYyNCKSUxwhCFr8DoVHxb24/h7raMGg/TsUJVUU+DcEDmmNWLyRhTQ5yYrQfQ
         2N12pPj7OWFwV4ZF5oWbYJLgY9q17xbegILOvMb4fVvEyqhr5Y979vlLgC4/kDDTdw2h
         blww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691688226; x=1692293026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFpZL/3eilu1u9uFTaffok5Lp1a2n41gMaTDjQGUS0Y=;
        b=ZfrPLX+qzWtf9xdxxbyUytFhthX9C6riqYO/a+nqExRJJnfVmBJ6whamnIejIffW8C
         4eGMMzenqkjkbhndUorpdcKLhrtxLr+x0O4m/jQU/W+J+Rv8dxiSZp5Vd6kOZ8g++QbS
         L5o11LQrlL0fSJpllF1VwEIWc1/NmPbdpQOHlmKrGkbX0t3FxXHuv9BajxYiXtJeouOe
         jpwCoj2acufZ9tVpAoBi/xqE5z82MA2id8RQRWsyPp+Cx1X0U4UhkgvXCzrPx8cLOVqY
         YO9fe1liajXT1D7TD1dinvtWF+zxP/kmPFkSMEOIEq4Y+6Tfxe07pfLX20/WFFM/iVBj
         Lcig==
X-Gm-Message-State: AOJu0Yyg+6Qwf1Dz1EsMrnwhErZbscJL1TR+82zf/I+FLUaNPSTR5olf
	dxaSwyRQhEcqoLrAU5M9ezXF8ZOlPJX/wQXQ2vzjXA==
X-Google-Smtp-Source: AGHT+IEXWGUPPaLyDt3apt2NNXmeQIsimShn+Pmdh9/q+nOb39YlJ5R8dIS0nQ7448blRDwcpVp74rQ0kawtt5VS4jw=
X-Received: by 2002:ac2:4a62:0:b0:4fe:c98:789a with SMTP id
 q2-20020ac24a62000000b004fe0c98789amr2249633lfp.37.1691688226402; Thu, 10 Aug
 2023 10:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230803230110.904724-1-greg.savin@sifive.com>
 <alpine.DEB.2.21.2308091008500.25915@angie.orcam.me.uk> <CADdv1FqjLPZ-eWOKPv0uZxF-u-SYjn0WJGr3KWW9H06-O0L35w@mail.gmail.com>
 <alpine.DEB.2.21.2308092247280.25915@angie.orcam.me.uk> <20230810103510.GA2509@hsinchu26>
 <alpine.DEB.2.21.2308101231560.25915@angie.orcam.me.uk> <alpine.DEB.2.21.2308101436450.8596@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2308101436450.8596@angie.orcam.me.uk>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 11 Aug 2023 01:23:34 +0800
Message-ID: <CABgGipUXWK3XSQNnY66z1EaOeLDrqJnW0bSCmSCv11xMiVppAg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: support for vector register accesses via ptrace()
 in RISC-V Linux native
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Savin <greg.savin@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Oleg Nesterov <oleg@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, gdb-patches@sourceware.org, 
	Andrew Burgess <andrew.burgess@embecosm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_102348_880485_4B727EC3 
X-CRM114-Status: GOOD (  25.20  )
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

T24gVGh1LCBBdWcgMTAsIDIwMjMgYXQgOTo1NeKAr1BNIE1hY2llaiBXLiBSb3p5Y2tpIDxtYWNy
b0BvcmNhbS5tZS51az4gd3JvdGU6Cj4KPiBPbiBUaHUsIDEwIEF1ZyAyMDIzLCBNYWNpZWogVy4g
Um96eWNraSB3cm90ZToKPgo+ID4gPiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8geW91IGlmIHdlIGVu
Y2Fwc3VsYXRlIHRoaXMgd2l0aCBhIGh3cHJvYmUgc3lzY2FsbD8KPiA+ID4gZS5nIHByb3ZpZGUg
YSBod3Byb2JlIGVudHJ5IHRvIGdldCBzeXN0ZW0ncyBWTEVOQi4gV2Ugd2lsbCBoYXZlIHRvCj4g
PiA+IGluY3JlYXNlIGFuZCByZWFycmFuZ2UgdGhlIGJ1ZmZlciBmb3IgTlRfUklTQ1ZfVkVDVE9S
IGlmIHdlIHdhbnQgdG8gdXNlCj4gPiA+IHB0cmFjZSBhcyB0aGUgZW50cnkgcG9pbnQgZm9yIHRo
aXMgcHVycG9zZS4gSSBhbSBub3QgdmVyeSBzdXJlIGlmIGl0J2QgYmUKPiA+ID4gdG9vIGxhdGUg
dG8gZG8gdGhvdWdoLgo+ID4KPiA+ICBObywgaG93IGRvIHlvdSBleHBlY3QgaXQgdG8gd29yayB3
aXRoIGEgY29yZSBkdW1wICh0aGF0IGNhbiBiZSBleGFtaW5lZAo+ID4gb24gYSBkaWZmZXJlbnQg
c3lzdGVtLCBvciB3aXRoIGEgY3Jvc3MtZGVidWdnZXIpPyAgWW91IG5lZWQgdG8gY2hhbmdlIHRo
ZQo+ID4gQVBJIEknbSBhZnJhaWQ7IGl0J3MgdW51c2FibGUgYW55d2F5LiAgSXQncyBhIHBpdHkg
dGhlIHRvb2xjaGFpbiBjb21tdW5pdHkKPiA+IHdhc24ndCBjb25zdWx0ZWQgaWYgeW91IHdlcmVu
J3Qgc3VyZSBob3cgdG8gZGVzaWduIHRoZSBpbnRlcmZhY2UuICBCZXR0ZXIKPiA+IHlldCBpdCB3
b3VsZCBoYXZlIGJlZW4gdG8gaW1wbGVtZW50IHRoZSBHREIgc2lkZSBiZWZvcmUgdGhlIGtlcm5l
bCBwYXJ0Cj4gPiBoYXMgYmVlbiBjb21taXR0ZWQuCgpJIGp1c3QgdG9vayBzb21lIGxvb2sgaW50
byB0aGUgY29kZSBhbmQgaGVyZSBpcyB3aGF0IEkgY2FtZSB1cCB3aXRoLgpBY3R1YWxseSwgeW91
IGtub3cgVkxFTkIgaW4gYSBjb3JlIGR1bXAgZmlsZS4gVGhlIHNpemUgb2YKTlRfUklTQ1ZfVkVD
VE9SIGluIGEgY29yZSBkdW1wIGZpbGUganVzdCBlcXVhbHMgc2l6ZW9mKHN0cnVjdApfX3Jpc2N2
X3ZfZXh0X3N0YXRlKSwgd2hpY2ggaXMgNDBCLCBwbHVzIFZMRU5CICogMzIuIFNvLCB0aGUgZGVi
dWdnZXIKY2FuIGFjdHVhbGx5IGNhbGN1bGF0ZSBWTEVOQiBhbmQgcmVzb2x2ZSBwbGFjZW1lbnQg
b2YgViByZWdpc3RlcnMgYnkKc3VidHJhY3RpbmcgNDAgZnJvbSB0aGUgc2l6ZSBvZiBOVF9SSVND
Vl9WRUNUT1IgaW4gYSBjb3JlIGR1bXAgZmlsZS4KCk9uIHRoZSBvdGhlciBoYW5kLCBwdHJhY2Ug
aXMgbm90IHNvIGx1Y2t5LiBUaGUga2VybmVsIHdpbGwgcmV0dXJuIHRoZQptaW4gb2YgZWl0aGVy
IHVzZXIgc3BlY2lmaWVkIHNpemUgb3IgdGhlIG1heGltdW0gVmVjdG9yIHNpemUuIEl0IGlzCnN0
aWxsIHNhZmUgaWYgd2UgY29uc2lkZXIgU01QIHdpdGggdGhlIHNhbWUgVkxFTkIgYWNyb3NzIGNv
cmVzIHRob3VnaCwKd2hpY2ggaXMgYW4gYXNzdW1wdGlvbiBtYWRlIG9uIExpbnV4LiBXZSBqdXN0
IG5lZWQgYSB3YXkgdG8gZ2V0IFZMRU5CCm9uIHRoZSBzeXN0ZW0uCgo+Cj4gIE5CIHNpbmNlIHRo
aXMgc3R1ZmYgd2VudCBpbiB3aXRoIHY2LjUtcmMxIGFuZCB2Ni41IGhhc24ndCBiZWVuIHJlbGVh
c2VkCj4geW91IGNhbiBzdGlsbCBiYWNrIG91dCB0aGUgcHJvYmxlbWF0aWMgY2hhbmdlIGFzIG5v
IG9uZSBpcyBleHBlY3RlZCB0byB1c2UKPiBSQyBzdHVmZiBpbiBwcm9kdWN0aW9uLiAgQWx0ZXJu
YXRpdmVseSB5b3UgY2FuIHJlZGVmaW5lIE5UX1JJU0NWX1ZFQ1RPUgo+IGZvciBhIGNvcnJlY3Rl
ZCBBQkksIGJ1dCBJIHRoaW5rIGl0IHNob3VsZG4ndCBiZSBuZWNlc3NhcnkuICBZb3UganVzdCBu
ZWVkCj4gdG8gYWN0IHF1aWNrbHkgYXMgSSBndWVzcyB0aGVyZSBtYXkgYmUgMS0yIGZ1cnRoZXIg
djYuNSBSQ3Mgb25seSBhbmQgeW91Cj4gaGF2ZSB0byBnZXQgd2l0aCB0aGF0IHRvIExpbnVzIHJp
Z2h0IGF3YXkuICBXZSBjYW4gaGF2ZSBhIHJlbGVhc2Ugb3IgdHdvCj4gd2l0aG91dCBOVF9SSVND
Vl9WRUNUT1Igc3VwcG9ydCBmb3IgdGhlIG90aGVyd2lzZSBpbmNsdWRlZCB2ZWN0b3Igc3R1ZmYs
Cj4gaXQgc2hvdWxkbid0IGJlIGEgYmlnIGRlYWwuICBUaGVyZSBqdXN0IHdvbid0IGJlIHN1cHBv
cnQgZm9yIHRoZSBkZWJ1Zwo+IEFQSS4KPgo+ICBDQy1pbmcgTGludXggcHRyYWNlL1JJU0MtViBt
YWludGFpbmVycyBub3cgdG8gYnJpbmcgdGhlaXIgYXR0ZW50aW9uLgo+Cj4gICBNYWNpZWoKClRo
YW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
