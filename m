Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF28CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 15:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Py/oLyCsifAjHMuTYcTD9x4618LQMMHL2sGBU+q0ldg=; b=V3c3mcnIrN/kmP
	TUEAXgt7J4+awHc353qB8CWNKbErNcuO1S8aHo5SwTSQq4A/PVwoK9mW56alNT+jY4wgHZk5dPH1X
	ojfUGSLcBguWkKHofi4kbNF4GAAo0074gLdBYedrbPlT1Kv9r3vNEiz3aE7QPgWdZ0dM3YN4inW6m
	jKNTyRLnkKByB1faAZIo/yf1IntxtujkC8/hkfu3coDomFpluBabO0MaT20qGJstuPliMtcc3c+Ue
	FLUao7FRoyoIL16wJtjxhHW0JukjCkWrKYclOVc8IfaHHNIZQng3+AqJcz04LAhfkvhfy25wad3+2
	IMtGCLeVC3H15AUIzRCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMog0-0000000H9dY-1clC;
	Tue, 12 May 2026 15:05:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMofx-0000000H9cg-02p0
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 15:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778598334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2eX0USmLShQsb/8DMQ63vXaSE/VT5r1TpahlVnwh5Y=;
	b=bNcXOg7dgBlMSJaL1cbnPz2pmfiDmi0Ux/Rbpm1Ylaa/7uRcKDQmcv77cEY6nrAobEcAzP
	gH0eJlywHWPdSeNyCojL2r63E2JekoTd2rTRiRXZ72CfdfbTI8wdkA3Vc7vS6JFDq28BjG
	Ik0JuirZJnfQ/TwIhnV6J14RwnRzbHw=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-E8JWxAW5MG-5HpKGEQoCxA-1; Tue, 12 May 2026 11:05:33 -0400
X-MC-Unique: E8JWxAW5MG-5HpKGEQoCxA-1
X-Mimecast-MFC-AGG-ID: E8JWxAW5MG-5HpKGEQoCxA_1778598331
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd66ec877aso120837827b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 08:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598331; x=1779203131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2eX0USmLShQsb/8DMQ63vXaSE/VT5r1TpahlVnwh5Y=;
        b=iTuGC62GuABHOoW89SoV8ZEgniJKm7iI0YTG0ixpMyyzVAeMZ+Hq9v//b0d8d02XJ4
         YMaHjNYd9gAD6RFsT3Czo4a5sOGb2z5HazBDmY+kawjX7loQ10Umms7fiRE0uQ60ymlk
         CjDZYFNsZLoseB6MrWzEnsX4qTtZmpTKpTBwCjspyiefvXYnB3K9XhsswOUagFkc04Hf
         m1wyfIXzjVRu1uX2xBiKYHulUrPy4k+HqhcpzXRZan0rHMOcoWGPareZmg7j4HvFV76b
         6NphzgLwcCkSIJwKMn/nRTQOUsAqhONeyS9340XcjgEBv+wArlxHVrmTANKqozK3oSfH
         cPSg==
X-Forwarded-Encrypted: i=1; AFNElJ9jBUw2RzQjYfo9Bn0gShyoR7Dy59mOmd652woen5L38iTT8TrbIX9JLzHq5VFdCCUNetqstVL+93DsMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJx6FiG79khfWiTUp/G2K7uFz+jJu/PL4OwfI80OGMbilTeQVu
	al6OG0Vjd+0jTalesxROkfQspQAP90wXPRE4hzcCdkL1mxSbeDmQHVFO98ZbSmiGZKPk/xvGkgI
	YPomt9CkCWnZlUVNdGoLzdryIM+b2ByoqtcPyleHZZ1kIxbbgXM9aOHND4gJLJZFQgsxL11aUiy
	swAd5v6N2T2MVpss0gwmOmjm0qg9GXvyjTn8PoGrvnLa2S
X-Gm-Gg: Acq92OG8brQQHjf8/ZdcNvkH6CjeHQt79/znKUMgG9+b/lCC7WTQJXNTmJ1ciy5axxe
	F6kRx7lr8XxZRO2LUOOgwZDQlPAr+9DkmO7JBY/YTinUzhbHdR5B78TAqotvvYSbUAECLQEqBZY
	AYmcPQsxaGJIViUmwHf8+YL9yl0te9Get+I5cxsQY5jFs91esyCLf/8BcdTDDur0M6oDIYj3Scn
	gDZxA==
X-Received: by 2002:a05:690c:34c9:b0:7bd:6a98:58d3 with SMTP id 00721157ae682-7c50f7cdf32mr36554807b3.18.1778598331055;
        Tue, 12 May 2026 08:05:31 -0700 (PDT)
X-Received: by 2002:a05:690c:34c9:b0:7bd:6a98:58d3 with SMTP id
 00721157ae682-7c50f7cdf32mr36553547b3.18.1778598330230; Tue, 12 May 2026
 08:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com> <20260508165203.1cd1b27e664754d18dbea899@linux-foundation.org>
In-Reply-To: <20260508165203.1cd1b27e664754d18dbea899@linux-foundation.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 12 May 2026 17:05:18 +0200
X-Gm-Features: AVHnY4IjDWzPTwv7Lf1EJ-4smElfrpc1pe5LEGC8untQsvEPzH-woMO9H8PAPck
Message-ID: <CADSE00LNoc8KgVWR=7Va-Phb2U9sDzS9wntWckDFm66Uz89bnQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] kunit: Add support for suppressing warning backtraces
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eqjVR5fOA2Fr1MLFyfTwjQKBo_sB0Fh1-qOpDFSdjSU_1778598331
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_080537_117414_67E542DC 
X-CRM114-Status: GOOD (  13.62  )
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

T24gU2F0LCBNYXkgOSwgMjAyNiBhdCAxOjUy4oCvQU0gQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIDA4IE1heSAyMDI2IDE3OjAyOjQ0
ICswMjAwIEFsYmVydCBFc3RldmUgPGFlc3RldmVAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiA+IFNv
bWUgdW5pdCB0ZXN0cyBpbnRlbnRpb25hbGx5IHRyaWdnZXIgd2FybmluZyBiYWNrdHJhY2VzIGJ5
IHBhc3NpbmcgYmFkCj4gPiBwYXJhbWV0ZXJzIHRvIGtlcm5lbCBBUEkgZnVuY3Rpb25zLiBTdWNo
IHVuaXQgdGVzdHMgdHlwaWNhbGx5IGNoZWNrIHRoZQo+ID4gcmV0dXJuIHZhbHVlIGZyb20gc3Vj
aCBjYWxscywgbm90IHRoZSBleGlzdGVuY2Ugb2YgdGhlIHdhcm5pbmcgYmFja3RyYWNlLgo+ID4K
PiA+IC4uLgo+ID4KPiA+IFNvbHZlIHRoZSBwcm9ibGVtIGJ5IHByb3ZpZGluZyBhIG1lYW5zIHRv
IHN1cHByZXNzIHdhcm5pbmcgYmFja3RyYWNlcwo+ID4gb3JpZ2luYXRpbmcgZnJvbSB0aGUgY3Vy
cmVudCBrdGhyZWFkIHdoaWxlIGV4ZWN1dGluZyB0ZXN0IGNvZGUuCj4gPiBTaW5jZSBlYWNoIEtV
bml0IHRlc3QgcnVucyBpbiBpdHMgb3duIGt0aHJlYWQsIHRoaXMgZWZmZWN0aXZlbHkgc2NvcGVz
Cj4gPiBzdXBwcmVzc2lvbiB0byB0aGUgdGVzdCB0aGF0IGVuYWJsZWQgaXQsIHdpdGhvdXQgcmVx
dWlyaW5nIGFueQo+ID4gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGNvZGUuCj4KPiBUaGFua3MuICBB
SSByZXZpZXcgaGFzIGEgYnVuY2ggb2YgcXVlc3Rpb25zOgo+ICAgICAgICAgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNTA4LWt1bml0X2FkZF9zdXBwb3J0LXY5LTAtOTlkZjdh
YTg4MGY2QHJlZGhhdC5jb20KPgoKSGkhIE1vc3QgbG9vayBsaWtlIHZhbGlkIGNvbmNlcm5zL2lz
c3Vlcy4gSSB3aWxsIHNlbmQgYSBuZXcgdmVyc2lvbgphZGRyZXNzaW5nIHRoZW0gdGhlbiwgYW5k
IG1vbml0b3Igc2FzaGlrbyB0byBlbnN1cmUgSSBjbGVhcgpldmVyeXRoaW5nLgoKVGhhbmtzIGZv
ciB0aGUgbGluay4KCkJSLApBbGJlcnQuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
