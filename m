Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB1BC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 12:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gu0sTYhtpkY3SM5v3jnUDFqBaYDueOJakMFCaQw4Aeo=; b=AcwX6Ulj7pYfI1
	8JG1oQuiKfiqoujYWOAdU2PD//uujK7pkwuDXCqD0LXWNZyfySX3GMEtrDMpZfuhRv1QV57RnO/Di
	eUsvgFKt6kqLEDPltE6QeqaMmKykikBcEduspySUjzg4mECVhfevVcqf0ZcwkD7/IxnQ56MhVdO1T
	2328TrYDz2MAtM7ljEmwvsHxn3+4Y2dwrQ0kKgxu/JDQj+dd4LtaM2T7xpE4aIEDqDqKwB/N7GvrU
	sy4O+xNIt6u92+ZNer4HD2BNMesVw/FfmsARypJpPOBG/cApPSZCiUSXFDkQeUwhSFQev8W+y9FpL
	ZrwLrGL5Td8Jc8fMhruQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMd9-00DwKJ-2F;
	Thu, 04 Jan 2024 12:15:23 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLMd7-00DwIK-0D
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 12:15:22 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a2888d65f1fso52678166b.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 04:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704370518; x=1704975318; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cr+6JCj5wYflPgWTMV3PjMKTTuzLUTwn0VcjXquQfIU=;
        b=0J/E17mZDC1jXi070ZSbn1BQ31EioXiqsjK7QvhK5UlsGcpt6w+A6ipqqYrTvlVPyx
         swLk6QnogaKuo1An2TYWQgfGUNLkeJk5TZ4J3btoIKYwkiNOkjwn5BSfITc9Ogj3NNRi
         m2n8ENd0u6HeaZ9ne6q5i2i0lw9OfSZwO6XvSi6Anhs/XdqVUKZb93XVgKXMq2NCgUtj
         LRAQfSYuZwbPJz7miY+GgWKN7/TmFiZw9sTPWa27nVh39y8fghxWOnFAjuD6UjppVlgO
         9iVKbzfpahye56VaW2XFira1G0shcDqgSMg1RNG81WJVRLCqfS9CXDHAgVxfEdy274ie
         DG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704370518; x=1704975318;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cr+6JCj5wYflPgWTMV3PjMKTTuzLUTwn0VcjXquQfIU=;
        b=JHftU1IhJDKQRekrjNsn/EE69f9Ekwc9YNkn6OjU4lhICCssRvDTNggDWclCXzIgMY
         Y59Tjr/78aYptCAhbgbDXuOVjyylFr0jecE8jmSdfP/1Mxxe04YTJU/wGfJlEZHITz9Q
         Me8Xqvxs9CCUYqZ/Oc10BvAqjPOAG53ia4KZyAmLmeG67hVITfbtdiPm1UJTG3Vj/BVE
         ExOGMU+wlQUgFhL8zOgqd3t8CEyG/q+7UvDxt6Wr5R5XRGHL854H5ezbVGCyGyWg8rHq
         k5kexLiFVYnyVYvyKcx3o8UQ5V79cA50Itz4PKEzG1yZWEExyW9zfSXwLJiW7HGCPbk5
         B2vw==
X-Gm-Message-State: AOJu0YxyfUd+ZnzP2+mqG5AWgKGweuOVtidf+a0/1ORaUbiJaRF/M30p
	KWvQzduZ44akIgA6ffqdInK7inTWPdQ1/emIdVEGnwHBxtPm/g==
X-Google-Smtp-Source: AGHT+IF9Amr8wIXPEypRo0GIvsDglsBnqIGOchyL8FhWSlxQUjRa7UeZ2A4lWZZ/ocajCTpC9tPfEgqs7RAQB3z4QPc=
X-Received: by 2002:a17:906:f807:b0:a23:7332:9258 with SMTP id
 kh7-20020a170906f80700b00a2373329258mr273790ejb.119.1704370517784; Thu, 04
 Jan 2024 04:15:17 -0800 (PST)
MIME-Version: 1.0
References: <20240102220134.3229156-1-samuel.holland@sifive.com> <20240102220134.3229156-4-samuel.holland@sifive.com>
In-Reply-To: <20240102220134.3229156-4-samuel.holland@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 4 Jan 2024 13:15:06 +0100
Message-ID: <CAHVXubjv58osbweO8AtyubLq=Zd7GW5aaeO6qFdb-QLTKrzT4g@mail.gmail.com>
Subject: Re: [PATCH v4 03/12] riscv: mm: Broadcast kernel TLB flushes only
 when needed
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_041521_105665_15576E5E 
X-CRM114-Status: GOOD (  20.39  )
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

T24gVHVlLCBKYW4gMiwgMjAyNCBhdCAxMTowMeKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IF9fZmx1c2hfdGxiX3JhbmdlKCkgYXZvaWRz
IGJyb2FkY2FzdGluZyBUTEIgZmx1c2hlcyB3aGVuIGFuIG1tIGNvbnRleHQKPiBpcyBvbmx5IGFj
dGl2ZSBvbiB0aGUgbG9jYWwgQ1BVLiBBcHBseSB0aGlzIHNhbWUgb3B0aW1pemF0aW9uIHRvIFRM
Qgo+IGZsdXNoZXMgb2Yga2VybmVsIG1lbW9yeSB3aGVuIG9ubHkgb25lIENQVSBpcyBvbmxpbmUu
IFRoaXMgY2hlY2sgY2FuIGJlCj4gY29uc3RhbnQtZm9sZGVkIHdoZW4gU01QIGlzIGRpc2FibGVk
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2
ZS5jb20+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHY0Ogo+ICAtIE5ldyBwYXRjaCBmb3IgdjQKPgo+
ICBhcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgfCAxNyArKysrKystLS0tLS0tLS0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMK
PiBpbmRleCAwOWIwM2JmNzFlNmEuLjJmMThmZTZmYzRmMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L21tL3RsYmZsdXNoLmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL3RsYmZsdXNoLmMKPiBAQCAt
OTgsMjcgKzk4LDIzIEBAIHN0YXRpYyB2b2lkIF9fZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICB7Cj4gICAgICAgICBjb25zdCBzdHJ1
Y3QgY3B1bWFzayAqY21hc2s7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIGFzaWQgPSBGTFVTSF9U
TEJfTk9fQVNJRDsKPiAtICAgICAgIGJvb2wgYnJvYWRjYXN0Owo+ICsgICAgICAgdW5zaWduZWQg
aW50IGNwdTsKPgo+ICAgICAgICAgaWYgKG1tKSB7Cj4gLSAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBjcHVpZDsKPiAtCj4gICAgICAgICAgICAgICAgIGNtYXNrID0gbW1fY3B1bWFzayhtbSk7
Cj4gICAgICAgICAgICAgICAgIGlmIChjcHVtYXNrX2VtcHR5KGNtYXNrKSkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm47Cj4KPiAtICAgICAgICAgICAgICAgY3B1aWQgPSBnZXRfY3B1
KCk7Cj4gLSAgICAgICAgICAgICAgIC8qIGNoZWNrIGlmIHRoZSB0bGJmbHVzaCBuZWVkcyB0byBi
ZSBzZW50IHRvIG90aGVyIENQVXMgKi8KPiAtICAgICAgICAgICAgICAgYnJvYWRjYXN0ID0gY3B1
bWFza19hbnlfYnV0KGNtYXNrLCBjcHVpZCkgPCBucl9jcHVfaWRzOwo+IC0KPiAgICAgICAgICAg
ICAgICAgaWYgKHN0YXRpY19icmFuY2hfdW5saWtlbHkoJnVzZV9hc2lkX2FsbG9jYXRvcikpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgYXNpZCA9IGF0b21pY19sb25nX3JlYWQoJm1tLT5jb250
ZXh0LmlkKSAmIGFzaWRfbWFzazsKPiAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgICAgICAg
IGNtYXNrID0gY3B1X29ubGluZV9tYXNrOwo+IC0gICAgICAgICAgICAgICBicm9hZGNhc3QgPSB0
cnVlOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBpZiAoIWJyb2FkY2FzdCkgewo+ICsgICAgICAg
Y3B1ID0gZ2V0X2NwdSgpOwo+ICsKPiArICAgICAgIC8qIENoZWNrIGlmIHRoZSBUTEIgZmx1c2gg
bmVlZHMgdG8gYmUgc2VudCB0byBvdGhlciBDUFVzLiAqLwo+ICsgICAgICAgaWYgKGNwdW1hc2tf
YW55X2J1dChjbWFzaywgY3B1KSA+PSBucl9jcHVfaWRzKSB7Cj4gICAgICAgICAgICAgICAgIGxv
Y2FsX2ZsdXNoX3RsYl9yYW5nZV9hc2lkKHN0YXJ0LCBzaXplLCBzdHJpZGUsIGFzaWQpOwo+ICAg
ICAgICAgfSBlbHNlIGlmIChyaXNjdl91c2Vfc2JpX2Zvcl9yZmVuY2UoKSkgewo+ICAgICAgICAg
ICAgICAgICBzYmlfcmVtb3RlX3NmZW5jZV92bWFfYXNpZChjbWFzaywgc3RhcnQsIHNpemUsIGFz
aWQpOwo+IEBAIC0xMzIsOCArMTI4LDcgQEAgc3RhdGljIHZvaWQgX19mbHVzaF90bGJfcmFuZ2Uo
c3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gICAgICAgICAgICAg
ICAgIG9uX2VhY2hfY3B1X21hc2soY21hc2ssIF9faXBpX2ZsdXNoX3RsYl9yYW5nZV9hc2lkLCAm
ZnRkLCAxKTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgaWYgKG1tKQo+IC0gICAgICAgICAgICAg
ICBwdXRfY3B1KCk7Cj4gKyAgICAgICBwdXRfY3B1KCk7Cj4gIH0KPgo+ICB2b2lkIGZsdXNoX3Rs
Yl9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKPiAtLQo+IDIuNDIuMAo+CgpZb3UgY2FuIGFkZDoK
ClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpU
aGFua3MsCgpBbGV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
