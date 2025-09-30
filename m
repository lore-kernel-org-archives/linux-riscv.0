Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58030CCA470
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9D2dLNjcBbY4ghAhzdcoaXQ+fnSaWNEYEvgstk3yr+I=; b=cLi6z4CUwaKLik
	lt9772oB1HY1t256br9yZMTHy4p61iT07hIKOP/H405TXFvHFGCjlx+n3Bx7PE7jpQmdkwnZdd5Vz
	5Ui3+kMeo2zhh1fbBw7FjxVNpcKIekm+u94TjhgkLvJSEEOqlmgePxligfHHUHLFhvd5HXFPz6+PE
	rOBU5wEqXRXGeVUOkz6NbhnLDw/eQkQ7oXBC9jO+dPPLkVkml/MUq2nIUiI8Onz08KceWYoi4Exfh
	hVTeLcbIUz5pJRvN9RJe9fTavJ5TRjIQhLd8vRSY/z6pMYiw487BkiU9AgPBKgzmcbGXLd/Wq4eMG
	AINqkDjoiyQmIDjVI+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cpr-00000005ixZ-1JlR;
	Tue, 30 Sep 2025 16:04:15 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3cpo-00000005iwi-2rRa
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:04:13 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-424da17e309so65435335ab.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Sep 2025 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1759248251; x=1759853051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36Wuxh3KpxC8Lkh1UJGiIRJzDlJEtmWKRckmgw+qPKU=;
        b=ZQdvOuKBLayiPxg4MCifh8OK/v8gCm3glL56RLZZy7wc4Xn6H8eCrx20l2ftTlWMeM
         YqZ1wj0MZkJRUvNIiMNFiFbrk3pl9e251QBHa1O6H1BKpg15yWuTR0ZwmXGP1w+bG8JH
         wEyLLEIGs4OFkCYVzTwYK1zSzsWQ1xWg8Q2M5hPJw6a1uvzJKq73NEasDGTLpjgn/wcq
         0uS3V6hQvxaIfmGce/Mi3SMkE0wCC9WdNWWeZ05u6xFOXFnpNKn0P0fgaJC5G20t2o0W
         aORhTmGyAYATvWwona9zhXTscNysqT17PW+pTj14TpSw3AdwVMJCztDMZYC61zJNkP/D
         TUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759248251; x=1759853051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36Wuxh3KpxC8Lkh1UJGiIRJzDlJEtmWKRckmgw+qPKU=;
        b=kwZNxIDIeXAIAFzQmMvZxGBKSwhJ+xEd6vlna4kDpGcAfDhjZIwSQjLGuCinBmpb19
         gWyrM0QSNpz18EpncsEf0jmU8HbYj8+yVGfzLSWMGgLcyK2xQbZWlHYqf5xyO87gujbq
         dmilBnp3b5fdovCbbA1rV9CPonhB4CkHUtqyXE6Vc3A6wvoAKlblFE+gCvrXFzAKg18r
         eE0fW5XA2x5CS6+vWWhzZK0DPOJt/X4LCiBplGABuH/PCAPRFMzPmdi7N5CUG/s11mdk
         /stqNXvaWnZe+AAo1NgFiACZ5xwPMlyWhi2q+Ymt3SGJGmcX4kX7PCOs4KPpUjgKstVD
         kwVw==
X-Forwarded-Encrypted: i=1; AJvYcCWW1z5dFM7FIg1EOd2wA27IloaAe5IKfO5wVsZ72fQucyomG9EYJAgm0asNWfELxDRL8yUKenpw+PzGSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy616UBwr2VOnieDd+Jd5sNEE4zW5Um9efABZBWvEsSWtybo8f4
	4H2OTKz2eV5k/Vc2gJ8Ojrpcf81BXzRI0MtbfAkZFZZK2VMxQ+o2CnzeUtfP/MHRf7bMuriTurE
	dU+LOTGWDS07gmSWgLU26FdbKzUY1IontuU1VgTKOrw==
X-Gm-Gg: ASbGncsxq2vTbYWm1uwih0ZhVzkNuRG2BTw1T8/lyYEEQghkUX/UGV5LSUpxiub2KbK
	l6EJ2grQdoeIx8O7dmL66ORe3YE6oY3UtwonxZZLaLxIzSyFruzPVmqq9rfEItsY5o64KYeXqGf
	MmTlWmr4McpkHU24Y+yOPKzqd0H5FtrWugALx6DFaE6i/ep+E6excD8NOQ8a4mnT/QWbZYIRsv+
	TCZvPg2rKGQ8NOAKzi+I4jh6pk776PsKpgndemej3jBa858sFoWnVg6zTfPgFY53sDajSYA25k=
X-Google-Smtp-Source: AGHT+IHa0Q/M3yEjUHR+I8sb1jd3MrfyzrVb1oMdomRNhwVu8KBID5BV1CuaUDQJKIUd0NqlUv9NqYEerL6M83q9mWQ=
X-Received: by 2002:a05:6e02:258e:b0:427:9523:2e98 with SMTP id
 e9e14a558f8ab-42d8165ea08mr7065745ab.29.1759248251332; Tue, 30 Sep 2025
 09:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <c458915ba9a4d1ba3413232206c88fcffbf832cb.1759243480.git.geert+renesas@glider.be>
In-Reply-To: <c458915ba9a4d1ba3413232206c88fcffbf832cb.1759243480.git.geert+renesas@glider.be>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Sep 2025 21:33:59 +0530
X-Gm-Features: AS18NWBu2ojz4bam210cXxlz1KhmK5JyYJRCTGEigLxMZntZt2MCQYiJKNfSU9I
Message-ID: <CAAhSdy0-PYjmLeMDquDhvTF52zB1qFjBk18eaFdidbR=y2iNyw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: RISCV_SBI_MPXY_MBOX should be disabled by default
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rahul Pathak <rpathak@ventanamicro.com>, 
	Anup Patel <apatel@ventanamicro.com>, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_090412_742315_715C778F 
X-CRM114-Status: GOOD (  17.76  )
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

T24gVHVlLCBTZXAgMzAsIDIwMjUgYXQgODoxOeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+Cj4gVGhlIGhlbHAgdGV4dCBmb3IgUklTQy1W
IFNCSSBNZXNzYWdlIFByb3h5IChNUFhZKSBNYWlsYm94IHN1cHBvcnQgc3RhdGVzCj4gIklmIHVu
c3VyZSBzYXkgTiIsIHNvIHRoZSBkcml2ZXIgc2hvdWxkIG5vdCBkZWZhdWx0IHRvIGVuYWJsZWQu
CgpUaGlzIGlzIGEgdmVyeSBjcml0aWNhbCBSSVNDLVYgZHJpdmVyIHByb3ZpZGluZyBtYWlsYm94
IGNoYW5uZWxzIHRvCm90aGVyIGRyaXZlcnMgc3VjaCBhcyBjbG9jaywgc3lzdGVtIE1TSXMsIGV0
Yy4KCkkgc3VnZ2VzdCBjaGFuZ2luZyB0aGUgY29uZmlnIGRlc2NyaXB0aW9uIGluc3RlYWQgb2Yg
Y2hhbmdpbmcgdG8Kbm90IGVuYWJsZWQgYnkgZGVmYXVsdC4KClJlZ2FyZHMsCkFudXAKCj4KPiBG
aXhlczogYmYzMDIyYTRlYjExOWM2YiAoIm1haWxib3g6IEFkZCBSSVNDLVYgU0JJIG1lc3NhZ2Ug
cHJveHkgKE1QWFkpIGJhc2VkIG1haWxib3ggZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+IC0tLQo+ICBkcml2ZXJz
L21haWxib3gvS2NvbmZpZyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWFpbGJveC9LY29uZmlnIGIvZHJpdmVycy9tYWlsYm94
L0tjb25maWcKPiBpbmRleCBjNDg4NzI1YWEyYTVkNGIwLi5hY2M0YmQ5MzEzNmNiNzIwIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvbWFpbGJveC9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9tYWlsYm94
L0tjb25maWcKPiBAQCAtMzcyLDcgKzM3Miw2IEBAIGNvbmZpZyBCQ003NDExMF9NQUlMQk9YCj4g
IGNvbmZpZyBSSVNDVl9TQklfTVBYWV9NQk9YCj4gICAgICAgICB0cmlzdGF0ZSAiUklTQy1WIFNC
SSBNZXNzYWdlIFByb3h5IChNUFhZKSBNYWlsYm94Igo+ICAgICAgICAgZGVwZW5kcyBvbiBSSVND
Vl9TQkkKPiAtICAgICAgIGRlZmF1bHQgUklTQ1YKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAg
TWFpbGJveCBkcml2ZXIgaW1wbGVtZW50YXRpb24gZm9yIFJJU0MtViBTQkkgTWVzc2FnZSBQcm94
eSAoTVBYWSkKPiAgICAgICAgICAgZXh0ZW5zaW9uLiBUaGlzIG1haWxib3ggZHJpdmVyIGlzIHVz
ZWQgdG8gc2VuZCBtZXNzYWdlcyB0byB0aGUKPiAtLQo+IDIuNDMuMAo+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
