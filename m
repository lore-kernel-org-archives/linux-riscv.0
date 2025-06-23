Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355D7C7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 12:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LK9HsMZ27uErClSvlesNDQKIot7R8RHQK2MosXhpjpg=; b=BqLbXDxznPa6Zm
	sR0V20XrKDQTb2M4CrdYv7b4NIeFIi0Y+bcOWlqWoqfXQsfmppceElpL1rh88P+Yr8s6PxhfqzZWg
	iTZodM0od19cehlW9NS5gUuhbGqUglPHAKQE6ezS61r/Lm4uFi0CuNVBU7QJYj3JDcL9eBcNay/1Q
	fnwjDye3NgaNun7Ly+UH+jBVt/X8GDBDk0cb+HMPtxiJ0mYfe/y8wc3EX2sF3wtM7CuOCS78WGA6u
	lYTuN02Zq/KtaF9CIf6DQ9PZxS0sqplNCbLgEVRZLn+w/5Fo2hq3dorb6JstbEukHi+80Yg1vnLVG
	a7IZqHn5ZKHHAAAdDFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgfl-00000002mML-093g;
	Mon, 23 Jun 2025 12:53:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeRR-00000002Lxi-44Au
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 10:30:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=S2Xh6Dpoc9NJla9DLdZ/WLUd9H1GHAIOhYhI+2Em4eg=; b=K0ad/PmWjhnZpUiwdNGFvu91Xz
	eYdrKMepCOHXV0TUckiyOnFOcqtAMo7q7pabMAGjsuww22w6IdLDYy8r3SYUgnDr7IoDTDCFElAgo
	MfX38HPNi+X7vUyvJ3QN9q5jrF/eANGqeFhuShR+rY1fxzziHVLDwhyZo3oyM+BgQQIsWqwLqQegv
	KCOKAZIwzOy8zoeCmemvc7KSDEZqPL+tzLGdg1gOTEHBTD/mJBCAi5kjkj1UQc4CekxY5p7bUECFk
	1ul84TTffYy9aILWoh8uWTYB1j5s1VBOKgDNQHWT80tntujB4UIUxkawTVUYDJhRKA2H9qyMPfedf
	DDQJWJSg==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeRO-00000005BUb-2yLh
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 10:30:21 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so2903828a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750674611; x=1751279411; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2Xh6Dpoc9NJla9DLdZ/WLUd9H1GHAIOhYhI+2Em4eg=;
        b=LBbs4lel64pKHYREkfqlDz43ES8VmvaxTZ0yUNwK6Dg6ixG7hJIo/PerOTqKhdrZnp
         Zo9uisn9TypWGP00hUZkm3XRU5/4/Pai/tQ1jtdYJwDbjlLnY4SViOiYPlQh0oAzda0I
         xxdwun+8+9DLvZklmaJ57cZrRjiJrAP50yjaF8VCo64Gh4KcNUulid8uCNqoZD9QZjqN
         wQFfmHeG4HOvMqbkbKG+1O0hW95mrzibqU7f8rWLv1vldmjd+m5y2Iza3136euK1Vbni
         1x1N9eWKXDAtyD5IgHREKX95eOV+NNyC5Bhfs3pGgfNAQimR7Q/fwUCr0Bor/GhZLEBo
         88tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750674611; x=1751279411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2Xh6Dpoc9NJla9DLdZ/WLUd9H1GHAIOhYhI+2Em4eg=;
        b=ZRLqUUV65gk8qGP8BaRHUa1aAHscoxnM7IIDHRs2ow4JPac/Ct89OCSx13Kfl95QgX
         gzp65aFKV5RTFXG3vnaD3E6ji8ro3di1/ZBZLRLrGZke0QtM22GqCeNtU2O0hpGa129c
         EQNsj2pWpglVb9vNw7TEAjW7Q7BYIJm1UpUNTcSGo2LWKFqMvNDEuJkSgBBFE5/eQHJe
         Bzr4dFCHSsrIXvghLtwqjFg7e3qKNRkcS+Zr9JGrfJa61Jrv8+cp0yJbP/ZlT05u9b3g
         nsQfI3wa9dSl2B721oG6kuXr27mJPF/M/2Ou4ff7r5Pcg04anWRXTBn0+Lu3J4Gso1GM
         qaSw==
X-Forwarded-Encrypted: i=1; AJvYcCX6KzVKdXBzR+3QHmMc0+YRK++o2yWDq8+hJhccpAONLv8SumEgR8QIIGo23fP5PGBMtC59r4b5nwPC1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpldB7GqjOplVqb8ft65O46G29I9/4vrACtTgSMi6bqwoQ57N/
	g0+nceA0LwYDLvILYpto4UJY10EBavwyt7jAyCLEFrAaXCFmdhJtvJvJevwkSr8SmpjKjAU6WWp
	vieHdBPHRrbkPVjbDXKp2gEw4ENYOFOlyITWMrKQcvg==
X-Gm-Gg: ASbGncubqO5Jo8v/l7sHs6CiF9LtOLwd5QuHTBqj/TWZyDmREoIXhDEqjlBGHUs0Dva
	B0xXLrVl/8kI4GC3PhJ1uGyYSB9MjgLzLgMK/K++vRHAf6gilyHPyLRsJcy7eRka0Rs1AEdBVS/
	QahZr7q8BOLeVWCB1GEZOpViJmx63yFfBul3s9uaO/fY/bPOe8J2qtwd+B
X-Google-Smtp-Source: AGHT+IHUUgFd5CAVoui8WeB8d4VDjaMayhZu3ZI45zZpLWDJx7B3fRr4MhP36Fw+gyvFSnnTysBzyBVcg3Vlfp8B2jA=
X-Received: by 2002:a17:90b:5690:b0:312:f0d0:bc4 with SMTP id
 98e67ed59e1d1-3159d626112mr16340875a91.5.1750674610724; Mon, 23 Jun 2025
 03:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com> <CAPYmKFvcnDJWXAUEX8oY6seQrgwKiZjDqrJ_R2rJ4kWq7RQUSg@mail.gmail.com>
 <DATTT5U64J4L.3UTDRVT2YP7GT@ventanamicro.com>
In-Reply-To: <DATTT5U64J4L.3UTDRVT2YP7GT@ventanamicro.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 23 Jun 2025 18:29:59 +0800
X-Gm-Features: AX0GCFtfoIOnfs7J2STs_OR-jY-38t6kH55fmz7DcsUlJBJ7-TA3sUK7F3GCaB8
Message-ID: <CAPYmKFtyJ-6N8ArP04QJNMFC3ScRnvp_9rijufQEnJRz4UrBQQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_113019_249631_6519BF93 
X-CRM114-Status: GOOD (  27.71  )
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

SGkgUmFkaW0sCgpPbiBNb24sIEp1biAyMywgMjAyNSBhdCA2OjA04oCvUE0gUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gMjAyNS0wNi0yMlQxODox
MTo0OSswODowMCwgWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVkYW5jZS5jb20+Ogo+ID4gSGkgUmFk
aW0sCj4gPgo+ID4gT24gRnJpLCBKdW4gMjAsIDIwMjUgYXQgODowNOKAr1BNIFJhZGltIEtyxI1t
w6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Pgo+ID4+IDIwMjUtMDYt
MjBUMTc6MTc6MjArMDg6MDAsIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPjoKPiA+
PiA+IERlbGVnYXRlIGlsbGVnYWwgaW5zdHJ1Y3Rpb24gZmF1bHQgdG8gVlMgbW9kZSBpbiBkZWZh
dWx0IHRvIGF2b2lkIHN1Y2gKPiA+PiA+IGV4Y2VwdGlvbnMgYmVpbmcgdHJhcHBlZCB0byBIUyBh
bmQgcmVkaXJlY3RlZCBiYWNrIHRvIFZTLgo+ID4+ID4KPiA+PiA+IFNpZ25lZC1vZmYtYnk6IFh1
IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+ID4+ID4gLS0tCj4gPj4gPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oCj4gPj4gPiBAQCAtNDgsNiArNDgsNyBAQAo+ID4+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKEVYQ19JTlNUX0lMTEVHQUwpICAg
IHwgXAo+ID4+Cj4gPj4gWW91IHNob3VsZCBhbHNvIHJlbW92ZSB0aGUgZGVhZCBjb2RlIGluIGt2
bV9yaXNjdl92Y3B1X2V4aXQuCj4gPgo+ID4gSSBvbmx5IHdhbnQgdG8gZGVsZWdhdGUgaXQgYnkg
ZGVmYXVsdC4gQW5kIEtWTSBtYXkgc3RpbGwgd2FudCB0bwo+ID4gZGVsZWdhdGUgZGlmZmVyZW50
IGV4Y2VwdGlvbnMgZm9yIGRpZmZlcmVudCBWTXMgbGlrZSB3aGF0IGl0IGRvZXMgZm9yCj4gPiBF
WENfQlJFQUtQT0lOVC4KPgo+IChJIHRoaW5rIHdlIGNvdWxkIGVhc2lseSByZWludHJvZHVjZSB0
aGUgY29kZSBpZiBLVk0gd2FudHMgdG8gZG8gdGhhdCBpbgo+ICB0aGUgZnV0dXJlLiAgSSBhbHNv
IHRoaW5rIHRoYXQgaXQncyBiYWQgdGhhdCB0aGlzIHBhdGNoIGlzIGRvaW5nIGFuCj4gIG9ic2Vy
dmFibGUgY2hhbmdlIHdpdGhvdXQgdXNlcnNwYWNlIGludm9sdmVtZW50IC0tIHRoZSBjb3VudGlu
ZyBvZiBLVk0KPiAgU0JJIFBNVSBldmVudHMsIGJ1dCBvdGhlcnMgd2lsbCBwcm9iYWJseSBkaXNh
Z3JlZSB3aXRoIG1lIG9uIHRoaXMuKQo+Cj4gPiAgICAgICAgICAgICAgICAgU28gbWF5YmUgaXQg
aXMgYmV0dGVyIHRvIHJlc2VydmUgdGhlc2UgY29kZXM/Cj4KPiBQb3NzaWJseSwgdGhlIGN1cnJl
bnQgaXMgYWNjZXB0YWJsZSBpZiB5b3UgaGF2ZSBjb25zaWRlcmVkIHRoZQo+IGltcGxpY2F0aW9u
cyBvbiBQTVUgZXZlbnRzLgoKU28gbWF5YmUgaXQgY29tZXMgYmFjayB0byBvdXIgZGlzY3Vzc2lv
biBvbiB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHZzCmluc24gZmF1bHQgYW5kIGlsbGVnYWwgaW5z
biBmYXVsdCBhZ2Fpbn4gSW4gbXkgcGVyc29uYWwgb3BpbmlvbiwgaXQKc2VlbXMgdG8gYmUgYSB3
YXN0ZSBvZiBDUFUgcmVzb3VyY2VzIHRvIHRyYXAgaWxsZWdhbCBpbnN0cnVjdGlvbiB0bwpIUy1t
b2RlIGh5cGVydmlzb3IsIHdoaWNoIGRvZXMgbm90aGluZyBidXQgcmVkaXJlY3QgaXQgYmFjayB0
byBWUy1tb2RlCmd1ZXN0IGtlcm5lbC4gSSB0aGluayBpdCBpcyBPSyAoYW5kIG1heWJlIGl0IHNo
b3VsZCkgdG8gcmVjb3JkIDAKaWxsZWdhbCBpbnN0cnVjdGlvbiBleGl0cyBpbiBLVk0gUE1VLiBJ
ZiBzb21lb25lIHdhbnRzIGlsbGVnYWwgaW5zbiB0bwp0cmlnZ2VyIGFuIHZjcHUgZXhpdCwgdGhl
biBhbiBpb2N0bCBjYW4gYmUgcHJvdmlkZWQgdG8gcmVtb3ZlIHRoZQpkZWxlZ2F0aW9uIGxpa2Ug
d2hhdCBLVk1fU0VUX0dVRVNUX0RFQlVHIGRvZXMuCgo+Cj4gPj4gQW5kIHdoeSBub3QgZGVsZWdh
dGUgdGhlIG90aGVycyBhcyB3ZWxsPwo+ID4+IChFWENfTE9BRF9NSVNBTElHTkVELCBFWENfU1RP
UkVfTUlTQUxJR05FRCwgRVhDX0xPQURfQUNDRVNTLAo+ID4+ICBFWENfU1RPUkVfQUNDRVNTLCBh
bmQgRVhDX0lOU1RfQUNDRVNTLikKPiA+Cj4gPiBUaGFua3MgZm9yIHRoZSByZW1pbmRlci4gSSB3
aWxsIGhhdmUgYSB0ZXN0IGFuZCByZXNlbmQgdGhlIHBhdGNoIGlmIGl0IHdvcmtzLgo+Cj4gVGhl
IG1pc2FsaWduZWQgZXhjZXB0aW9ucyBhcmUgYWxyZWFkeSBiZWluZyB3b3JrZWQgb24sIHNvIGRv
bid0IHdhc3RlCj4geW91ciB0aW1lIG9uIHRoZW0sIHNvcnJ5LgoKVGhhbmtzIGZvciB0aGUgcmVt
aW5kZXIgdG9vLiBJIGRpZCBub3QgY29uc2lkZXIgdGhpcyBiZWZvcmUuIEkgd2lsbApsZWF2ZSB0
aGUgTUlTQUxJR05FRCBmYXVsdHMgYWxvbmUuCgpCZXN0IFJlZ2FyZHMsCgpYdSBMdQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
