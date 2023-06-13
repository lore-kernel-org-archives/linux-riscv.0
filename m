Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C95EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 21:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b7miWGZOiv5G9M+K+Whju8Ch9uDnJ8ZCVjfNgbxyPHA=; b=mZ3j5S9bF+mNQE
	dEh4sukttl8fm/p/zvuGQnzV5v+/TuA2kontFxk1zKkh1ZhmSuRpkXqOQgNJ53ZA9sjraiT+drAfU
	MhVYGLoMROYp+ogE8hs0Ws6oCBztkXGN2x7yK2NwIN6JbVGqO2Er3/BohX95THWY8tkR/6EuyfnMg
	StnYp90o/hy/5ymJajy29PJJXSaqhVmUNQ4unY7Dv1JoxbbbPgPmVXPWQuynozaeaGzG47A9T4bFT
	/3BXNk7J3mU+6XujM7ZLqKW0bRtwS/a8DlrkkbwZphupPGesIsFsRdOeY2KL5IR5JUitf31lMaLEW
	+vAeTYroYbmx3AlAnz0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Bw1-009GhM-32;
	Tue, 13 Jun 2023 21:52:17 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Bvv-009Gff-0i
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 21:52:16 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-3f9a81da5d7so92421cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 14:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686693127; x=1689285127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JArSp3KOZfDk0T3BlWpL2SI3E0Iekw9ms5ihIkc+nFM=;
        b=31VfF2rFtQfd+eGV2VUbMAsXwWlGzpXbb7LC2L2mALkilUk8ewlPBJrGoguowu4ix/
         BlS9gmQVXqEP/dbFDpGlJcfrB2TodNldcnVoeakyZZzEpd9WVV9fIS16ruNS99ulYoBU
         ++KADeo8f7ECZJUuIl3gou/Zg3oO2oS2pb+kkT1ICbqfqsVqKXrVNNMaYcXFWMJI5glB
         ZJeNgqxqrk8bwgn7G4/7vMh3rSIzrfDuW7oXPdDNW953RaQit1xEqQybSjl+qdR+IbLm
         G2IzonA25YTzuA2PXkiMjCeHUdBIZfZlfOOIzG0RA7Tcox76V/5zUrmjB34wI9FlC985
         hjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686693127; x=1689285127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JArSp3KOZfDk0T3BlWpL2SI3E0Iekw9ms5ihIkc+nFM=;
        b=GpLQXuAh3DhbHunlRUiXkecEkL64HxzML+Ot6+m0/Ws7A+TAwg9G7YP76UJIvYHXO8
         j45c9+LbQj8tjfxjFe+c5pScc1K5WTqCzL9Ve3WeX+/4fqzhdJgumCfQS2uOvKenOwhe
         oTqFzGzrjx9WyMlA+sn9gCUYqUsMheI3JY5Mb7+1fhG40q/20+B59b6hypVIv8O750ib
         Hs3V3vM6dv4jvTD/GE3gHcYkQ01HKTWKdVNaGhYE9ipWRmSmI2YsBb1BgzHcs8iO4I0F
         P6YxnmTZqBdlbkIbgaAH6gXqJYFeTNv9xKfEZ8CXTE0GIgJ/w1LfRoLApClUd/+JedmY
         bdlA==
X-Gm-Message-State: AC+VfDxqByuDtsQwN4bO4cnEm6sjUKfYe36dnMOqcmp/xbTtBEuORAb+
	mmRaGSD4H5J4k0HUd59RU/gMhAMOqLVuncSaxoNG7A==
X-Google-Smtp-Source: ACHHUZ6eqyrWpd9ZQfes1o6bBidPoYDZBxY9968p6UI796rpR/4U/pX8S0FmE+Y1UVdWq+F9ajxp87Cz5qH9ngxFpkc=
X-Received: by 2002:a05:622a:315:b0:3f9:a770:7279 with SMTP id
 q21-20020a05622a031500b003f9a7707279mr9489qtw.9.1686693127027; Tue, 13 Jun
 2023 14:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230423223210.126948-1-maskray@google.com> <CAFP8O3LksO-4JAoRnx9ND0E9rRyqb6xsUsGtBVQXOsaYxLmhBQ@mail.gmail.com>
In-Reply-To: <CAFP8O3LksO-4JAoRnx9ND0E9rRyqb6xsUsGtBVQXOsaYxLmhBQ@mail.gmail.com>
From: Fangrui Song <maskray@google.com>
Date: Tue, 13 Jun 2023 14:51:56 -0700
Message-ID: <CAFP8O3JSaZ6D=nGoVu+-_t2HZBLX7M8wggALWKNWH=PnubY8yA@mail.gmail.com>
Subject: Re: [PATCH] riscv: replace deprecated scall with ecall
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_145211_282942_FF6CF3C5 
X-CRM114-Status: GOOD (  16.47  )
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

T24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgMzo0MeKAr1BNIEZhbmdydWkgU29uZyA8bWFza3JheUBn
b29nbGUuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgQXByIDIzLCAyMDIzIGF0IDM6MzLigK9QTSBG
YW5ncnVpIFNvbmcgPG1hc2tyYXlAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gc2NhbGwgaXMg
YSBkZXByZWNhdGVkIGFsaWFzIGZvciBlY2FsbC4gZWNhbGwgaXMgdXNlZCBpbiBzZXZlcmFsIHBs
YWNlcywKPiA+IHNvIHRoZXJlIGlzIG5vIGFzc2VtYmxlciBjb21wYXRpYmlsaXR5IGNvbmNlcm4u
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmFuZ3J1aSBTb25nIDxtYXNrcmF5QGdvb2dsZS5jb20+
Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TICAgICAgICAgICAgIHwgNCAr
Ky0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9ydF9zaWdyZXR1cm4uUyB8IDIgKy0KPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2VudHJ5LlMKPiA+IGluZGV4IDk5ZDM4ZmRmOGIxOC4uMmY1MTkzNTYxMmQxIDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwo+ID4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvZW50cnkuUwo+ID4gQEAgLTE5MSw3ICsxOTEsNyBAQCBoYW5kbGVfc3lzY2FsbDoKPiA+
ICAgICAgICAgUkVHX1MgYTAsIFBUX09SSUdfQTAoc3ApCj4gPiAgICAgICAgIC8qCj4gPiAgICAg
ICAgICAqIEFkdmFuY2UgU0VQQyB0byBhdm9pZCBleGVjdXRpbmcgdGhlIG9yaWdpbmFsCj4gPiAt
ICAgICAgICAqIHNjYWxsIGluc3RydWN0aW9uIG9uIHNyZXQKPiA+ICsgICAgICAgICogZWNhbGwg
aW5zdHJ1Y3Rpb24gb24gc3JldAo+ID4gICAgICAgICAgKi8KPiA+ICAgICAgICAgYWRkaSBzMiwg
czIsIDB4NAo+ID4gICAgICAgICBSRUdfUyBzMiwgUFRfRVBDKHNwKQo+ID4gQEAgLTYwMyw2ICs2
MDMsNiBAQCBFTkQoZXhjcF92ZWN0X3RhYmxlKQo+ID4gICNpZm5kZWYgQ09ORklHX01NVQo+ID4g
IEVOVFJZKF9fdXNlcl9ydF9zaWdyZXR1cm4pCj4gPiAgICAgICAgIGxpIGE3LCBfX05SX3J0X3Np
Z3JldHVybgo+ID4gLSAgICAgICBzY2FsbAo+ID4gKyAgICAgICBlY2FsbAo+ID4gIEVORChfX3Vz
ZXJfcnRfc2lncmV0dXJuKQo+ID4gICNlbmRpZgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3Zkc28vcnRfc2lncmV0dXJuLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3J0X3Np
Z3JldHVybi5TCj4gPiBpbmRleCAwNTczNzA1ZWFjNzYuLjEwNDM4YzdjNjI2YSAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vcnRfc2lncmV0dXJuLlMKPiA+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3Zkc28vcnRfc2lncmV0dXJuLlMKPiA+IEBAIC0xMSw2ICsxMSw2IEBA
IEVOVFJZKF9fdmRzb19ydF9zaWdyZXR1cm4pCj4gPiAgICAgICAgIC5jZmlfc3RhcnRwcm9jCj4g
PiAgICAgICAgIC5jZmlfc2lnbmFsX2ZyYW1lCj4gPiAgICAgICAgIGxpIGE3LCBfX05SX3J0X3Np
Z3JldHVybgo+ID4gLSAgICAgICBzY2FsbAo+ID4gKyAgICAgICBlY2FsbAo+ID4gICAgICAgICAu
Y2ZpX2VuZHByb2MKPiA+ICBFTkRQUk9DKF9fdmRzb19ydF9zaWdyZXR1cm4pCj4gPiAtLQo+ID4g
Mi40MC4wLjYzNC5nNGNhM2VmMzIxMS1nb29nCj4gPgo+Cj4gUGluZzopCj4KPgo+IC0tCj4g5a6L
5pa5552/CgpQaW5nXjIgOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
