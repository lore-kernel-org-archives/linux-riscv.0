Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFC1EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 21:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0kSC0vxj3KCU2OuUQ+XBNRaHNWlwCX4cz/dH0sVPhE=; b=u0WBihW0RYNNHV
	Na7iC4YlBDh9napJfIjSZ+JGle2n3KCFromsa5llcJZ2P3s/VmtMyv1GIiDvboCb+WTi059A+YI2F
	sD7DVze9PEepIOK3zqXfegFHOqcAiT00W2uQQQ1RUUoPeZCGDI1kISKuZcpQfQqFRvWJ8z2CVZWYh
	Rdanx4pXcEMaUSsNIymtB1DusLz1VL0IrGoZW3379mksl+8KKdV8mHvUSxOHTELMI8w7Xi/NwKg/7
	Sgpv/ij4puqBg0W52P7q+cD+QKZyipCMge8NCXdPRFnGX2UOUxaDuWVQEW62BVl2El5Kyf6Q/3+Sq
	NxRc1bCYRUiHs6if+uVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWE9-002gRo-1d;
	Thu, 06 Jul 2023 21:09:25 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWE7-002gR2-0V
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 21:09:24 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb7b2e3dacso1799499e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688677758; x=1691269758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exHyMG/2/1kKC28Ybg6ScTLzo0giggAORojrlxybewA=;
        b=kF5Y63MhmJB8mZlZ/HqjRfBnqgfCMscqtLojzJmHuuOf8gzukAij0qpog+kOgu+QJA
         lHxzm50w2ETmE3Lm46H4qT2fd4lCxfJD0+4UVumzI2eM1E7hbnnics2tgvT+POevYODJ
         yVb4XiIsHfd3gRzQWnVL3Tg23LmFl9c1i32Y1mrM6Qo93rK7Zm/b8+bt2463pBCTyQU5
         AkWUGb2dG5rX0gJfZ4QhrzFJSRWFepBHBdheVGjn6Ty6FO+brd2gVVvD4M3WqS+LEoZ+
         V9Md47ULyKa6AkCwW08Dv9+5fShysec7Vmb4Ffh1Z440jN8WDM9TN3lmYr2OYyXrpLGH
         jLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688677758; x=1691269758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exHyMG/2/1kKC28Ybg6ScTLzo0giggAORojrlxybewA=;
        b=lcHZrKWSAlwinlXcrbQBEGtmDU5klWP7L6KwU19J/v0WS98yZ1rjSGTIxosMgxo6kD
         oZSm8vmGF05PAPZgjfEFGzFI/UhS8/IYeArfZswMvmIiNQ4f6A7bXA6X/Lv1TDP+u0RE
         /JhGOpcbOPsaRkd4n7FmPYReznj5KFW/XruSE3kkUxJsPEHE+4sL23x7/TmsmehsWmUD
         3fX1ULOxVm6jl29xfcPYN7/LAljzBqtyNmmTBrsxb9hq6gQFc4Q7KuzhEna46zvs6m5B
         VaTvAzSJuAowkNN8Oca+7WShhVJp4koj67Brq8KWzJ06LOF69uC8X+diKktYHEeBZuX8
         5GQw==
X-Gm-Message-State: ABy/qLY38fcQMOHv/LOV7UpO5NTj6meyAEqFW2FHX87H7qG730AttF7+
	S/GwlQIVKaBdo/YbeaNxuzEmlgO+SBSHueRbotovQQ==
X-Google-Smtp-Source: APBJJlHN6ED9syl3kYb4BjqhjlPPjJ9Q/LFb+RIhZbT9cv4aGzNlq2nrtlMLrUdHOVizjADFCJf6RD8XGrGC6qRdc+I=
X-Received: by 2002:a19:790f:0:b0:4f9:b31b:db6 with SMTP id
 u15-20020a19790f000000b004f9b31b0db6mr2099061lfc.9.1688677758243; Thu, 06 Jul
 2023 14:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <CALs-Hssc6Uxf-6FKbye2n-CD0FWWE4xDmUWvN1NoKNFpn88SKg@mail.gmail.com>
 <mhng-ebe222a1-57eb-41cf-a541-38b4b5595ac0@palmer-ri-x1c9a>
In-Reply-To: <mhng-ebe222a1-57eb-41cf-a541-38b4b5595ac0@palmer-ri-x1c9a>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 6 Jul 2023 14:08:42 -0700
Message-ID: <CALs-HstZRd1KMBkrn5D6jRs2CsaXXhk-OON=z-2YgnY8Ny60XA@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_140923_212231_2FC2A0FD 
X-CRM114-Status: GOOD (  34.22  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, heiko.stuebner@vrull.eu, ajones@ventanamicro.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgNiwgMjAyMyBhdCAxMjo0NeKAr1BNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAwNiBKdWwgMjAyMyAxMjozNDozMCBQRFQg
KC0wNzAwKSwgRXZhbiBHcmVlbiB3cm90ZToKPiA+IE9uIFRodSwgSnVsIDYsIDIwMjMgYXQgMzo1
M+KAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+
ID4+Cj4gPj4gT24gVGh1LCBKdWwgMDYsIDIwMjMgYXQgMTA6MDE6MzFBTSArMDIwMCwgQW5kcmV3
IEpvbmVzIHdyb3RlOgo+ID4+ID4gT24gV2VkLCBKdWwgMDUsIDIwMjMgYXQgMTA6Mjk6MzFBTSAt
MDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+PiA+ID4gSW4gL3Byb2MvY3B1aW5mbywgbW9zdCBv
ZiB0aGUgaW5mb3JtYXRpb24gd2Ugc2hvdyBmb3IgZWFjaCBwcm9jZXNzb3IgaXMKPiA+PiA+ID4g
c3BlY2lmaWMgdG8gdGhhdCBoYXJ0OiBtYXJjaGlkLCBtdmVuZG9yaWQsIG1pbXBpZCwgcHJvY2Vz
c29yLCBoYXJ0LAo+ID4+ID4gPiBjb21wYXRpYmxlLCBhbmQgdGhlIG1tdSBzaXplLiBCdXQgdGhl
IElTQSBzdHJpbmcgZ2V0cyBmaWx0ZXJlZCB0aHJvdWdoIGEKPiA+PiA+ID4gbG93ZXN0IGNvbW1v
biBkZW5vbWluYXRvciBtYXNrLCBzbyB0aGF0IGlmIG9uZSBDUFUgaXMgbWlzc2luZyBhbiBJU0EK
PiA+PiA+ID4gZXh0ZW5zaW9uLCBubyBDUFVzIHdpbGwgc2hvdyBpdC4KPiA+PiA+ID4KPiA+PiA+
ID4gTm93IHRoYXQgd2UgdHJhY2sgdGhlIElTQSBleHRlbnNpb25zIGZvciBlYWNoIGhhcnQsIGxl
dCdzIHJlcG9ydCBJU0EKPiA+PiA+ID4gZXh0ZW5zaW9uIGluZm8gYWNjdXJhdGVseSBwZXItaGFy
dCBpbiAvcHJvYy9jcHVpbmZvLiBXZSBjYW5ub3QgY2hhbmdlCj4gPj4gPiA+IHRoZSAiaXNhOiIg
bGluZSwgYXMgdXNlcm1vZGUgbWF5IGJlIHJlbHlpbmcgb24gdGhhdCBsaW5lIHRvIHNob3cgb25s
eQo+ID4+ID4gPiB0aGUgY29tbW9uIHNldCBvZiBleHRlbnNpb25zIHN1cHBvcnRlZCBhY3Jvc3Mg
YWxsIGhhcnRzLiBBZGQgYSBuZXcgImhhcnQKPiA+PiA+ID4gaXNhIiBsaW5lIGluc3RlYWQsIHdo
aWNoIHJlcG9ydHMgdGhlIHRydWUgc2V0IG9mIGV4dGVuc2lvbnMgZm9yIHRoYXQKPiA+PiA+ID4g
aGFydC4gVGhpcyBtYXRjaGVzIHdoYXQgaXMgcmV0dXJuZWQgaW4gcmlzY3ZfaHdwcm9iZSgpIHdo
ZW4gcXVlcnlpbmcgYQo+ID4+ID4gPiBnaXZlbiBoYXJ0Lgo+ID4+ID4gPgo+ID4+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPiA+PiA+ID4KPiA+PiA+
ID4gLS0tCj4gPj4gPiA+Cj4gPj4gPiA+IENoYW5nZXMgaW4gdjI6Cj4gPj4gPiA+ICAtIEFkZGVk
IG5ldyAiaGFydCBpc2EiIGxpbmUgcmF0aGVyIHRoYW4gYWx0ZXJpbmcgYmVoYXZpb3Igb2YgZXhp
c3RpbmcKPiA+PiA+ID4gICAgImlzYSIgbGluZSAoQ29ub3IsIFBhbG1lcikKPiA+PiA+ID4KPiA+
PiA+ID4KPiA+PiA+ID4gSSBiYXNlZCB0aGlzIHNlcmllcyBvbiB0b3Agb2YgQ29ub3IncyByaXNj
di1leHRlbnNpb25zLXN0cmluZ3MgYnJhbmNoCj4gPj4gPiA+IGZyb20gSnVseSAzcmQsIHNpbmNl
IG90aGVyd2lzZSB0aGlzIGNoYW5nZSBnZXRzIGhvcGVsZXNzbHkgZW50YW5nbGVkCj4gPj4gPiA+
IHdpdGggdGhhdCBzZXJpZXMuCj4gPj4gPiA+Cj4gPj4gPiA+IEkgd2FzIHVuc3VyZSBpZiBJIGNv
dWxkIHNudWdnbGUgdGhlIG5ldyAiaGFydCBpc2EiIGxpbmUgaW4ganVzdCBiZWxvdwo+ID4+ID4g
PiAiaXNhIi4gQWVzdGhldGljYWxseSBpdCB3b3VsZCBiZSBxdWl0ZSBwbGVhc2luZywgYnV0IGl0
IHJ1bnMgdGhlIHJpc2sgb2YKPiA+PiA+ID4gYnJlYWtpbmcgYnJpdHRsZSB1c2VybW9kZSBwYXJz
ZXJzIHRoYXQgYXJlIGFzc3VtaW5nIGEgc3BlY2lmaWMgbGluZQo+ID4+ID4gPiBvcmRlci4gU28g
SSBwdXQgaXQgYXQgdGhlIGVuZC4KPiA+PiA+Cj4gPj4gPiBBY3R1YWxseSwgdGhleSdyZSBwcm9i
YWJseSBvbmx5IGFlc3RoZXRpY2FsbHkgcGxlYXNpbmcgd2hlbiB0aGV5IG1hdGNoLiBJZgo+ID4+
ID4gdGhlcmUgYXJlIGRpZmZlcmVuY2VzLCB0aGVuIEknZCBndWVzcyBoYXZpbmcgdGhlbSBzaWRl
IGJ5IHNpZGUsIGFsbW9zdCB0aGUKPiA+PiA+IHNhbWUsIGJ1dCBkaWZmZXJlbnQsIHdvdWxkIG1h
a2UgdGhlbSBldmVuIGhhcmRlciB0byBsb29rIGF0IHRoZW4gdGhleQo+ID4+ID4gYWxyZWFkeSBh
cmUuIFNvIEkgdGhpbmsgSSdsbCBiZSBoYXBwaWVyIHdpdGggdGhlbSBzZXBhcmF0ZWQgYnkgYSBm
ZXcgbGluZXMKPiA+PiA+IGFueXdheS4KPiA+Pgo+ID4+IFRoaXMgbGlzdCBpcyBldmVudHVhbGx5
IGdvaW5nIHRvIGJlIHNvIGJpZyB0aGF0IEkgZG9uJ3QgdGhpbmsgZG9pbmcKPiA+PiBieS1leWUg
YW55dGhpbmcgaXMgZ29pbmcgdG8gYmUgdXNlZnVsLCBzbyBhZXN0aGV0aWNzIGJlIGRhbW5lZC4K
PiA+PiBUaGF0IHNhaWQsIGEgcGFyc2VyIHRoYXQgcmVsaWVzIG9uIHRoZSBvcmRlciBvZiBpbmRp
dmlkdWFsIGxpbmVzIGxpa2UKPiA+PiB0aGF0IG1pZ2h0IGRlc2VydmUgdG8gYmUgYnJva2VuIDsp
Cj4gPj4KPiA+PiBBbnl3YXksIGNoYW5nZSBsb29rcyBnb29kIHRvIG1lOgo+ID4+IFJldmlld2Vk
LWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4+Cj4gPj4g
SSB3YXMgdGhpbmtpbmcgdGhlIHVhYmkgZG9jIG1pZ2h0IG5lZWQgYW4gdXBkYXRlIC0gc2hvdWxk
IHdlIGFkZCB0byBpdAo+ID4+IHRoYXQgImlzYSIgbWVhbnMgdGhlIGNvbW1vbiBzZXQgJiAiaGFy
dCBpc2EiPwo+ID4KPiA+IEkgZGlkIGRvIGEgbGl0dGxlIHNlYXJjaCBmb3IgZG9jdW1lbnRhdGlv
biB0byB1cGRhdGUsIGJ1dCBmYWlsZWQgdG8KPiA+IGNvbWUgdXAgd2l0aCBhbnkuIFdoaWNoIGRv
YyBhcmUgeW91IHRoaW5raW5nIG9mPwo+Cj4gU2hvdWxkIGJlIHNvbWV3aGVyZSBsaWtlIERvY3Vt
ZW50YXRpb24vYXJjaC9yaXNjdi91YWJpLnJzdAoKVGhhbmtzLCBJJ2xsIHNwaW4gdGhpcyBwYXRj
aCBhbmQgYWRkIHNvbWV0aGluZyBoZXJlLgotRXZhbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
