Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D94CCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r7cvGJhlESectCyVXrh5GSV6MHcXrOOy12CVUCnTgk0=; b=h016E+ehbb4xK6
	l8xStiGQZaXEPoxk5xtKjCobY+m2G27jSz3N2sHZSONjz09mPq5y/XGh+G4VEVkOMCEFQzT+7RWaO
	R2a9AWAFObrtheR0iKanGJSZC5a9ajTQPiIK1AWENX/RLQdvud65ChS1436EkdiP8ZKSBMXlL82Wp
	w74W3m4ySwawASvj8Wi3LQP7NK3ACJu8Xoy2Sz1svrQ8qoflH8dewHEXZE7sZv1dEEVc/aMg6YZSW
	TQC/Hq4F6ZtnxHeyJo9JpDsLyGCkwDwDWAIFG9cPtYNmB1Mbo1obRQyTcJP4EtOmH313W7Wta8Wo2
	OZn6abNDD70xIahImVsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Dd9-00000008c3r-2dwh;
	Fri, 10 Oct 2025 13:57:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Dd5-00000008c3R-3yyz
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 13:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760104673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6CSXAn3HygFwbaOpzUgisVz0Zeld7FaMqhQ8KH6Xb10=;
	b=Je/Lf1mM5FZJsl6PnGKuQM0MwrYNo7PO7kPLl4UJR+Z2CYRHKE3mEbsXhjMv2/k1pWB0zC
	/MubusnUOYypDSlB2QaRGf1TcgLpg/XCsligrcnkCBmKfDrt8ZMHW1ogaC0O6of6p0EgqA
	XNXsxfRWBzCD3IzkZfAr38iPWuKaRd8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-_4fX6z0eOoOFCpFUpCeTWw-1; Fri, 10 Oct 2025 09:57:51 -0400
X-MC-Unique: _4fX6z0eOoOFCpFUpCeTWw-1
X-Mimecast-MFC-AGG-ID: _4fX6z0eOoOFCpFUpCeTWw_1760104670
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso10438025e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 06:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760104670; x=1760709470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CSXAn3HygFwbaOpzUgisVz0Zeld7FaMqhQ8KH6Xb10=;
        b=sBuUMSCTXdbu0Harf37ZmYxE65T5xK5XY2ZW4HFOlgL2RJ22xtLzIoaJBfoo454+Rn
         2OinwRPfDFZr07gsgc6ayXmDHMe5fAIApYuRWoEU9XBGNvo/R+snPzHu2+M+/+cQbeo7
         EsvdEBMy8ltODpx2/Imk0eeURPy6LWrla1JjQwcyuht30HjFOdQbYyOVuYGCj28VDXum
         67a12ndrSU5jaIXf4nml0JBNLrsROAdZhvZCpaL6iy1ZgqCFfQEZjrhl0ePTyozWpvq4
         eJ8uBeynBS3MEKRhbVSvA8eqiOrurIi2T1/Cs7dv9YqKw2dCBPimAC6nYh0dfoClUYz5
         QSrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9KDx4Zd3BbtrvgpYUQAg4UaIzKm99P6hNxJSG9sKJHX3CQtW9a8uZ2BbuApRuEW3o7DKs4jTPZZ3FdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnPPUXBL1ATgGVeXZnpqf/0jY9E91rJtnsVdZxLq7Fme5eKkTf
	YHwBaH7oxUv+XOzWtlyt43nwlO9XpFsMyJizZ2al5BppHZeuX2+45ZrvUeq/qv7q5/3eqLD+jNA
	kAZS+1pvLGGTjF/LH4mQuzqfhH1Hdg9cvKxSJunM6NBPhHDHff7ftbPWsYEwg2UHqd/h2pfX5s+
	E5EA9xu8DO694RyH33eYh8o0sikGnBTE0bhXvpoYQbTiU2
X-Gm-Gg: ASbGncsVqsW06ykwm8vCfKDK1NxwNvt94jCd78KFtPCFEd8veP/MwolsxT/avqhLDdK
	cEZbwPMrjluvRMrRFwujBFGphAMmSfjtKzd6Jf065m+ewbeQHBRgkmB8XT1EBCMyb+ypcBsXDsq
	Mc19Ej3t30zI8C7boerhKsmGLtBZotE4u+bVequM0LiDNBC1ku9BJs3UQ=
X-Received: by 2002:a05:600c:138a:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-46fa9b092aemr75146265e9.26.1760104670116;
        Fri, 10 Oct 2025 06:57:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0nYvzZV/UpgrZSIsve1rRA0msPcsLYg020u5V/WHCcwHFFt5xA47G7YOSbI1lFXf6FO5ZLsE+5y5nNR6t9tQ=
X-Received: by 2002:a05:600c:138a:b0:46e:506b:20c5 with SMTP id
 5b1f17b1804b1-46fa9b092aemr75146085e9.26.1760104669691; Fri, 10 Oct 2025
 06:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20251009082013.1331361-1-lzampier@redhat.com> <20251009082013.1331361-3-lzampier@redhat.com>
 <9ae53c6d-613b-4a25-b672-88ffabfef4fa@kernel.org>
In-Reply-To: <9ae53c6d-613b-4a25-b672-88ffabfef4fa@kernel.org>
From: Lucas Zampieri <lzampier@redhat.com>
Date: Fri, 10 Oct 2025 14:57:38 +0100
X-Gm-Features: AS18NWBKt45vJ_tgZM0w0Qd10JOQmvNvfOo1vp2NkKU9_HUvebFUX254BfYm_oE
Message-ID: <CAOOg__BTJw53uTK4h_o4GK6x2D0XutTSQMpb-BDXh22Ac0-q-A@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: interrupt-controller: add UltraRISC
 DP1000 PLIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Charles Mirabile <cmirabil@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NCCyYvcTkgUy2dR1Ib5saND1S27WqiNA6os7QtRf-JI_1760104670
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_065756_059921_2011BE94 
X-CRM114-Status: GOOD (  15.71  )
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

T24gVGh1LCBPY3QgOSwgMjAyNSBhdCA5OjM54oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDA5LzEwLzIwMjUgMTc6MjAsIEx1Y2FzIFphbXBp
ZXJpIHdyb3RlOgo+ID4gRnJvbTogQ2hhcmxlcyBNaXJhYmlsZSA8Y21pcmFiaWxAcmVkaGF0LmNv
bT4KPiA+Cj4gPiBBZGQgYSBuZXcgY29tcGF0aWJsZSBzdHJpbmcgZm9yIFVsdHJhUklTQyBEUDEw
MDAgUExJQy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGVzIE1pcmFiaWxlIDxjbWlyYWJp
bEByZWRoYXQuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgICAgICAgIHwgMiArKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4w
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ID4gaW5kZXggNWI4MjdiYzI0MzAxLi5hNDE5
ZGU1MGY1YTggMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+ID4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3Np
Zml2ZSxwbGljLTEuMC4wLnlhbWwKPiA+IEBAIC03NCw2ICs3NCw4IEBAIHByb3BlcnRpZXM6Cj4g
PiAgICAgICAgICAgICAgICAtIHNvcGhnbyxzZzIwNDQtcGxpYwo+ID4gICAgICAgICAgICAgICAg
LSB0aGVhZCx0aDE1MjAtcGxpYwo+ID4gICAgICAgICAgICAtIGNvbnN0OiB0aGVhZCxjOTAwLXBs
aWMKPiA+ICsgICAgICAtIGl0ZW1zOgo+Cj4KPiBNaXNzaW5nIFNvQyBzcGVjaWZpYyBmcm9udCBj
b21wYXRpYmxlLCBtZSB0aGlua3MuCgpSaWdodCwgaWYgSSdtIHVuZGVyc3RhbmRpbmcgdGhpcyBj
b3JyZWN0bHksIEkgd291bGQgbmVlZCB0byBhZGQgdGhlCnNpZml2ZSxwbGljLTEuMC4wIGZhbGxi
YWNrIGNvbXBhdGlibGUgdG8gaW5kaWNhdGUgcmVnaXN0ZXIgbGF5b3V0CmNvbXBhdGliaWxpdHku
IEhvd2V2ZXIsIHRoZSBEUDEwMDAgUExJQyBoYXMgYSBjbGFpbSByZWdpc3RlciBoYXJkd2FyZQpi
dWcgdGhhdCBicmVha3MgaW50ZXJydXB0IGhhbmRsaW5nIHdpdGhvdXQgdGhlIGRyaXZlciBxdWly
ay4gU2hvdWxkIHdlCnN0aWxsIGluY2x1ZGUgdGhlIGZhbGxiYWNrIGV2ZW4gdGhvdWdoIHRoZSBn
ZW5lcmljIGRyaXZlciBkb2Vzbid0Cndvcms/Cgo+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6
dG9mCj4KCkJlc3QsCkx1Y2FzIFphbXBpZXJpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
