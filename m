Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C45C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 06:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMx1EBsRnalm8pL0uPTmPjEAMjrDU8E3V+wA4W75o/s=; b=wHiNHudqF3yRrZ
	otohiPgqVK+yURDGnSVEyMJeo7rOLgMjseNoX9Z4oOnyqfMuI603A1Nc+BepYtMT2OwHG59MfMGg4
	o6SivSlW7kizkqnmpkjDIxVagQboZ1wTECVwqQO7MPebntK1EF0MR73k0whkGmBGYNSpS+zp+xbq1
	3K2xWvtT+7hycbUMyVxQiq6AI9gnUr/YhAKyl7J7F15kke9lzWXKK1OG8sOuJxRrMExusglOnkSMm
	z+sNbtDRmbWNa/Ords+TYr/CufpxfDYe9lWrqzHub4X4WPcTADoSyYOvYVzvlSHxS4DCDoXO7sy1B
	abBwPE1U8wpWAXgvrynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRRZJ-006kOv-0B;
	Thu, 03 Aug 2023 06:12:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRRZG-006kON-0T
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 06:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691043130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PclpYqCH63o/7EbB151IjCBiyPLFzNdla2ERVVKFqV8=;
	b=VmYvrmc8FA8y1x8sdMpaDQINMLDTXjLP6fDzF/PVrafDcv65hc9IqU0n2gHrD/5q/PQ1nq
	g1FioeNud4EHP9LUjmwkBW0T7A8DTbtmwsISm2014FUApEXAlYiZbkhrZ8zzZyomIMrlua
	YAJpsRJo2+pEXRkmtmyZkzsFhG7M8Fo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-OTNeMCaKOuie9AHLqnyrqQ-1; Thu, 03 Aug 2023 02:12:08 -0400
X-MC-Unique: OTNeMCaKOuie9AHLqnyrqQ-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6bc9d79cbf6so970940a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 23:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691043128; x=1691647928;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PclpYqCH63o/7EbB151IjCBiyPLFzNdla2ERVVKFqV8=;
        b=VD1nOB+sFAUboVVFoWbq8hQG+oA52jreFeQqmzb1bBXWDoly0p4z3S8DpunhrenCzA
         fZxI47rCfqlCuCxliglOF8TxApS85vbVEIkMmRxrsFMD/zJP03rE2V3TA75PlEytr9aJ
         idMjLoEixar+aSe0lRcfHVqRhxI2Nj54LfNPt/Q6mjwR9RL+cmIXztftXuMEg6BRuYJi
         38KdGFya+xuzAzxzfmQrte2mrSnKVa/CV0Lx1Gm9VwsE24CHOjyVnirhDioawhRQN7tr
         frAgp9I7h6ptOYwrmnSaHb2vZ8nbjngpXe2vrmqMuV0nNmiOT5/nsc0a4aHF/9rbdYb7
         r5ig==
X-Gm-Message-State: ABy/qLbl+3p+tUbO3FV1+r6Mu0lfhxJ8DZ89bANJVggol0uXctwJD4WX
	o0QTnIbtOjEO0yUjmopsn49eRiCBtcaT3KrsSb/BaESewp97fFKvEPoV3NbesbrBDym70Ye+WVh
	pUsjueTbMlrhBVniUdVi2ZPVy+gsJDoUa/tRS
X-Received: by 2002:a05:6871:612:b0:1ad:e92:62e1 with SMTP id w18-20020a056871061200b001ad0e9262e1mr23687269oan.54.1691043127865;
        Wed, 02 Aug 2023 23:12:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHS2DsU4Eh8oiwpO8PbZCofaG7KV4HOa4kFX9NdmO3QgQN6/y2JXtScFIx0Z/yy0aTGdZ761g==
X-Received: by 2002:a05:6871:612:b0:1ad:e92:62e1 with SMTP id w18-20020a056871061200b001ad0e9262e1mr23687260oan.54.1691043127621;
        Wed, 02 Aug 2023 23:12:07 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a801:d380:694f:4f52:764c:4b7f? ([2804:1b3:a801:d380:694f:4f52:764c:4b7f])
        by smtp.gmail.com with ESMTPSA id a18-20020a05687103d200b001b047298a44sm7211716oag.52.2023.08.02.23.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 23:12:07 -0700 (PDT)
Message-ID: <e7bbf95cb0b79dc4f508f554675af4d1138fdfe8.camel@redhat.com>
Subject: Re: [RFC PATCH v1 0/2] Deduplicating RISCV cmpxchg.h macros
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer
 Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 03 Aug 2023 03:12:03 -0300
In-Reply-To: <ZMsboVmlrWhjfNJd@andrea>
References: <20230406082018.70367-1-leobras@redhat.com>
	 <ZC7/LzV53KsZ/cSn@andrea>
	 <2f301cd6c4009248c5eb6af00f12f36f3127ca10.camel@redhat.com>
	 <ZMsboVmlrWhjfNJd@andrea>
User-Agent: Evolution 3.48.4
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_231214_277296_9E0800A8 
X-CRM114-Status: GOOD (  11.95  )
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

T24gVGh1LCAyMDIzLTA4LTAzIGF0IDA1OjE0ICswMjAwLCBBbmRyZWEgUGFycmkgd3JvdGU6Cj4g
PiA+IExHVE0uICBBRkFJQ1QsIHRoaXMgd291bGQgbmVlZCB0byBiZSByZWJhc2VkLCBjZi4gZS5n
Lgo+ID4gPiAKPiA+ID4gwqDCoGE4NTk2ZGRhMWZiZjdlICgiYXJjaDogcmVuYW1lIGFsbCBpbnRl
cm5hbCBuYW1lcyBfX3hjaGcgdG8gX19hcmNoX3hjaGciKQo+ID4gPiAKPiA+ID4gZnJvbSB0aGUg
dGlwIHRyZWUuCj4gPiA+IAo+ID4gPiDCoMKgQW5kcmVhCj4gPiAKPiA+IFRoYW5rcyBmb3IgdGhl
IGhlYWRzIHVwIQo+ID4gSSB3aWxsIHVwZGF0ZSB0aGlzIGFuZCByZS1zZW5kIQo+ID4gCj4gPiAK
PiA+IEFuZCBzb3JyeSBhYm91dCB0aGUgZGVsYXkgOigKPiA+IEZvciBzb21lIHdlaXJkIHJlYXNv
biBuZWl0aGVyIHRoZSBjb3ZlciBsZXR0ZXIsIG5vciB5b3VyIG1lc3NhZ2UgcmVhY2hlZCBteQo+
ID4gZ21haWwsIGFuZCBqdXN0IG5vdyBsb29raW5nIGF0IGxvcmUgSSBjb3VsZCBmaW5kIHlvdXIg
bWVzc2FnZS4gCj4gCj4gQWxsJ3Mgd2VsbCB0aGF0IGVuZHMgd2VsbC4gIDstKSAgVGhhbmtzLAo+
IAo+IMKgwqBBbmRyZWEKPiAKClN1cGVyc2VkZWQgYnkgdjI6Cmh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9saXN0Lz9zZXJpZXM9NzcyNDIyJnN0YXRlPSUy
QSZhcmNoaXZlPWJvdGgKCkxlbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
