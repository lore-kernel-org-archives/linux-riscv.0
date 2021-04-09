Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA52C433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 14:10:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6043060FF1
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 14:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6043060FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id:Date:Subject
	:Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ytmUNUYd++o8ijbfsGoJKZLIImOLHCs6kfWLK0gAbRU=; b=AS9T4XhQ4kpwzdSp7d9ftfhvk
	AoCDkimomL1ZLYxsR9zIP5n3x7Xzgx7/l37In7Jb816+/RccGywuegx+JsAX1kqqygSxIdLr84VdG
	xlwIwGr7mIhP8z9+928vQz+83TFHKz510zj7C6wZ5pIcCmXXlaqpXYLA8WYdOXywNa4+7Fk4f3dOW
	Gtq96jFJhSu/A8QKuLclc5wjjvEYhgfFC3Ah/YsmoCKj9/fobJf6dlKfT7JPOCGCwyxqqwY5ahThy
	uVycRBSG7LpaOgMBAz9DFoq/m7QgOhXObv0Pj8Z6QWNzL1U8k1MkwQSgX9o1gWj+SpZ+HPzP/VuEW
	Vt+4pcNtA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUrq7-000svb-MG; Fri, 09 Apr 2021 14:10:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUrq4-000suq-TX
 for linux-riscv@desiato.infradead.org; Fri, 09 Apr 2021 14:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:To:In-Reply-To:Cc:References:Message-Id:Date:Subject:
 Mime-Version:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=proPil0jUhRoc2kcDPVO/0GyIRKmtQoV0j0AhOkxvnU=; b=DVPTIth2DY5XNxHhwbIEc8tRBe
 GSX0ippAYQ4MjygkCyrqecWH5XSlI6cdhw0fUj+qFT5BLHsvhfubFd2UP1AfhqckTKM79ntvC3ZVg
 5ezKNuaWtrxAKiWNrmwZ56/FQ2mMVUjDZe58WPf+HGu3k94HR/SKoGy7wg6TrpZc+zMepBqfTQs9Y
 9q+V1o2uXmdPbk4Ae9WzHqGh5Q9bntPokIfpiEfeSjoqnBglLXzvYdI+NpRSgp7c/FQxZS7nDRQag
 gDtDqqyigGmYoiOz0WFZ193Xt4JzGOFiLcols+Jd4U9UuvbIukZHZdqHcuISKnyANO0qBSAS814wW
 RWwYTW1g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUrq2-004Zdj-D1
 for linux-riscv@lists.infradead.org; Fri, 09 Apr 2021 14:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617977421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=proPil0jUhRoc2kcDPVO/0GyIRKmtQoV0j0AhOkxvnU=;
 b=Rxn50jtl5zLcjLmywKhGJB6BIQ7tCEpHL2Pv5gx/RC76fAzjUqbmzCFtkeOacbOaSVoFjk
 wMAnV1Iizsz1UULHyisyV1c+Xey8hn9bvBAmt3Q40hPdgWKGGWGTSlvaqm596B5vF0yvCr
 KSrKcYikNPOINF/x/YtaXZ47UJbAfeA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-a6Q6uAIeMYeD-MDJpYpomg-1; Fri, 09 Apr 2021 10:10:19 -0400
X-MC-Unique: a6Q6uAIeMYeD-MDJpYpomg-1
Received: by mail-wm1-f70.google.com with SMTP id
 p11-20020a05600c358bb029011630279b61so850958wmq.7
 for <linux-riscv@lists.infradead.org>; Fri, 09 Apr 2021 07:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=EWNREvrOtHiS/gdxlthAoSyaX95CLmAUl3lJOVpNYCw=;
 b=qtr5+24DPheEuvv5PptsjCY1TFgK1S/f4EtD1rXMA9X5YjlNRoMDZhowLJqX5ZtT7v
 +0DAHd9xXt3acUmHxEjH94FQqjsjHPCz9kXGh227yUUq23aD4WaH65zhMaYpIW096Wlz
 cul5nMk2FsztFEwOnBmTgTED31xGp9LzrAkEl3hvlbvOf4/m8iEMurlCyEOEgX4JEG6O
 lYw13oJAqALbJ6CN7q2odn3x68DHwzzIi97mLGX/uzpeKLYjA5dtrktVJ03+TES6MORd
 6N7vuQxPQcMLNYQdT90FZwBHyScfuJydUz5+Owsu87hIYbR/SN+WDHBK27+CFJbnqeeH
 TKhQ==
X-Gm-Message-State: AOAM530daN6hKysuHpz55dSTeZ9MKPft7cabdUDSID/kSXk4MjfQJvH+
 EWh1gBFIZzmAzdU/QK5PSRz5ZHDhsDMonjFObiIA75iEUMNx2lRI4n/8sveY4jU9pyzm4D1J1BQ
 W4hNdCzIkZf+6TVQiSWfUPvWN2Sjg
X-Received: by 2002:a1c:49d5:: with SMTP id w204mr14121445wma.51.1617977417374; 
 Fri, 09 Apr 2021 07:10:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK2eQJebQQhfMGzxEK9Jzyvz7ElE085TfiU8H50Wp6kUuTBF1Ga0ilIdJhVRoRW8OfQyc2eA==
X-Received: by 2002:a1c:49d5:: with SMTP id w204mr14121423wma.51.1617977417130; 
 Fri, 09 Apr 2021 07:10:17 -0700 (PDT)
Received: from [192.168.3.108] (p5b0c6302.dip0.t-ipconnect.de. [91.12.99.2])
 by smtp.gmail.com with ESMTPSA id u8sm4960453wrr.42.2021.04.09.07.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 07:10:16 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v7] RISC-V: enable XIP
Date: Fri, 9 Apr 2021 16:10:15 +0200
Message-Id: <F096121C-8F7A-4E9A-B319-2C5F656610EA@redhat.com>
References: <YHBdzPsHantT9r8t@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>, Alex Ghiti <alex@ghiti.fr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 Vitaly Wool <vitaly.wool@konsulko.com>
In-Reply-To: <YHBdzPsHantT9r8t@linux.ibm.com>
To: Mike Rapoport <rppt@linux.ibm.com>
X-Mailer: iPhone Mail (18D70)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_071022_534154_72245023 
X-CRM114-Status: GOOD (  17.09  )
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

Cj4gQW0gMDkuMDQuMjAyMSB1bSAxNTo1OSBzY2hyaWViIE1pa2UgUmFwb3BvcnQgPHJwcHRAbGlu
dXguaWJtLmNvbT46Cj4gCj4g77u/T24gRnJpLCBBcHIgMDksIDIwMjEgYXQgMDI6NDY6MTdQTSAr
MDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+IEFsc28sIHdpbGwgdGhhdCBtZW1v
cnkgcHJvcGVybHkgYmUgZXhwb3NlZCBpbiB0aGUgcmVzb3VyY2UgdHJlZSBhcwo+Pj4+PiBTeXN0
ZW0gUkFNIChlLmcuLCAvcHJvYy9pb21lbSkgPyBPdGhlcndpc2Ugc29tZSB0aGluZ3MgKC9wcm9j
L2tjb3JlKQo+Pj4+PiB3b24ndCB3b3JrIGFzIGV4cGVjdGVkIC0gdGhlIGtlcm5lbCB3b24ndCBi
ZSBpbmNsdWRlZCBpbiBhIGR1bXAuCj4+PiBEbyB3ZSByZWFsbHkgbmVlZCBhIFhJUCBrZXJuZWwg
dG8gaW5jbHVkZWQgaW4ga2R1bXA/Cj4+PiBBbmQgZG9lcyBub3QgaXQgc291bmQgd2VpcmQgdG8g
ZXhwb3NlIGZsYXNoIGFzIFN5c3RlbSBSQU0gaW4gL3Byb2MvaW9tZW0/IDstKQo+PiAKPj4gU2Vl
IG15IG90aGVyIG1haWwsIG1heWJlIHdlIGFjdHVhbGx5IHdhbnQgc29tZXRoaW5nIGRpZmZlcmVu
dC4KPj4gCj4+PiAKPj4+PiBJIGhhdmUganVzdCBjaGVja2VkIGFuZCBpdCBkb2VzIG5vdCBhcHBl
YXIgaW4gL3Byb2MvaW9tZW0uCj4+Pj4gCj4+Pj4gT2sgeW91ciBjb25jbHVzaW9uIHdvdWxkIGJl
IHRvIGhhdmUgc3RydWN0IHBhZ2UsIEknbSBnb2luZyB0byBpbXBsZW1lbnQgdGhpcwo+Pj4+IHZl
cnNpb24gdGhlbiB1c2luZyBtZW1ibG9jayBhcyB5b3UgZGVzY3JpYmVkLgo+Pj4gCj4+PiBJJ20g
bm90IHN1cmUgdGhpcyBpcyByZXF1aXJlZC4gV2l0aCBYSVAga2VybmVsIHRleHQgbmV2ZXIgZ2V0
cyBpbnRvIFJBTSwgc28KPj4+IGl0IGRvZXMgbm90IHNlZW0gdG8gcmVxdWlyZSBzdHJ1Y3QgcGFn
ZS4KPj4+IAo+Pj4gWElQIGJ5IGRlZmluaXRpb24gaGFzIHNvbWUgbGltaXRhdGlvbnMgcmVsYXRp
dmVseSB0byAibm9ybWFsIiBvcGVyYXRpb24sCj4+PiBzbyBsYWNrIG9mIGtkdW1wIGNvdWxkIGJl
IG9uZSBvZiB0aGVtLgo+PiAKPj4gSSBhZ3JlZS4KPj4gCj4+PiAKPj4+IEkgbWlnaHQgYmUgd3Jv
bmcsIGJ1dCBJTUhPLCBhcnRpZmljaWFsbHkgY3JlYXRpbmcgYSBtZW1vcnkgbWFwIGZvciBwYXJ0
IG9mCj4+PiBmbGFzaCB3b3VsZCBjYXVzZSBtb3JlIHByb2JsZW1zIGluIHRoZSBsb25nIHJ1bi4K
Pj4gCj4+IENhbiB5b3UgZWxhYm9yYXRlPwo+IAo+IE5vdGhpbmcgcGFydGljdWxhciwganVzdCBh
IGd1dCBmZWVsaW5nLiBVc3VhbGx5LCB3aGVuIHlvdSBmb3JjZSBzb21ldGhpbmcKPiBpdCBjb21l
cyBvdXQgdGhlIHdyb25nIHdheSBsYXRlci4KPiAKPj4+IAo+Pj4gQlRXLCBob3cgZG9lcyBYSVAg
YWNjb3VudCB0aGUga2VybmVsIHRleHQgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcyB0aGF0Cj4+PiBp
bXBsZW1lbnQgaXQ/Cj4+IAo+PiBJbnRlcmVzdGluZyBwb2ludCwgSSB0aG91Z2h0IFhJUCB3b3Vs
ZCBiZSBzb21ldGhpbmcgbmV3IG9uIFJJU0MtViAod2VsbCwgYXQKPj4gbGVhc3QgdG8gbWUgOikg
KS4gSWYgdGhhdCBjb25jZXB0IGV4aXN0cyBhbHJlYWR5LCB3ZSBiZXR0ZXIgbWltaWMgd2hhdAo+
PiBleGlzdGluZyBpbXBsZW1lbnRhdGlvbnMgZG8uCj4gCj4gSSBoYWQgcXVpY2sgZ2xhbmNlIGF0
IEFSTSwgaXQgc2VlbXMgdGhhdCBrZXJuZWwgdGV4dCBkb2VzIG5vdCBoYXZlIG1lbW9yeQo+IG1h
cCBhbmQgZG9lcyBub3Qgc2hvdyB1cCBpbiBTeXN0ZW0gUkFNLgo+IAoKRG9lcyBpdCBzaG93IHVw
IGluIGEgZGlmZmVyZW50IHdheSBvciBub3QgYXQgYWxsPwoKPiAtLSAKPiBTaW5jZXJlbHkgeW91
cnMsCj4gTWlrZS4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
