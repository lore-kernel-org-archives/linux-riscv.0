Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00D2C61DBD
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 15:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/A0AzeuwqP1Y3cKXjz6rPIBX5yNJI3O2934ZAjgQaA=; b=RQNxb5ItPPJt3A
	RT0HDMir5JMz58KQKz3Eek8MdDLfqzi7mnmXkvns1aT3DVPwM2M4XK2TlpErnDX1AE7sJBmqOnMGL
	F7hTahEc5c3EBLD2aShNcrOQURb2Jul2nWqlzmWTonSYrAt2YLGkn6CE+0jod9K4cL76453pYdDKb
	EE3LHCoJWXTRCsWPPWLJTAFIe+oCJoqgQi+Bi6xt2DQdCXH9BOG6Sdajz2ZOVdbUDmeaRp6Qif98R
	jfCbLlSLMo49lpB/9MG4GRVTOrmf8f1jJhxsN8soVCQzkSyTiWSXbubc/ozcgWjqwgrzjBL3buS+4
	6CDVpGx789qBJJVHg2zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFuK-00000002h7S-3CFA;
	Wed, 26 Aug 2026 15:51:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzFuG-00000002h6A-2IC4
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 15:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787759475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4W3DLTZd9rSFQPqEL+RVc7IFyecD07CUDj7e4Cb4R2Q=;
	b=c1HzbwdlVUnyoBgYYWaHct/R1wSaIPuflyn//71N59LOP3A9U42cgq4RNJ7nO+OmKdOGKc
	cDpjvLsm5nfsjgdgS9bEAdCXTX7Dj8jis/piy1HpQgV9M0CFR2OIN2uTAOpXnHhwrI1H4U
	rkDlxUPHrYF/DsleTQcydeKR0nz9hTw=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-dTl50DHtP7SnK4MVPVMQqw-1; Wed, 26 Aug 2026 11:51:12 -0400
X-MC-Unique: dTl50DHtP7SnK4MVPVMQqw-1
X-Mimecast-MFC-AGG-ID: dTl50DHtP7SnK4MVPVMQqw_1787759471
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso22400655ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 08:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787759471; x=1788364271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4W3DLTZd9rSFQPqEL+RVc7IFyecD07CUDj7e4Cb4R2Q=;
        b=oF0Z87uLGMGKhbpR8FvxTZ0gyHK1l1BWRN/mTP/BRCv/kUorXQbVxdAXjCeEr8srTC
         XCFhe9CHYUJjelw4YW8/ASCDCqV9ahKxRm7R6yRrb40QF0n0dakkgD05u0oDs5eO0fov
         LWAaJ5nfIZpInDK4hrXnrsxGn+J+0fGdt946SWj9Ck56vyAfUbRPjCk7lJLxf0PCcCH+
         5wpCOD5J2VH3H8EvmFr32cVPWpw1jpVyAdbrI11x0ztwcTiCutZfOrIpNF2wIv+Yj/ss
         lbZEtm6fFXfthKFOe5x+AsjlKsKf6ftZwn10FwrgVrWn6dbkSQcPwevrG8XRoKl5Qdd/
         l8dg==
X-Forwarded-Encrypted: i=1; AHgh+RrD+qcOlE52UAqJvVuUTyygTmMmFn88PBEoC1nEltxfBZlicrZFnn8FmJ9wGG66GpajFCleN5p2Un14uQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kYQGYxR1qxOuHyz2nQfenODl40UrttdvAjMT+Q+tRrxsSujQKl
	kgvS4/KIJpKwKQSE+oxPLzAiLfJWpGX4Mu/0OwxGHkGmKpbaoYs4w6ttU5zWFGjIbRaP7O0AqG/
	KoFjR0W2RGhNcWsmOVBw+LpDSRbdi6vHObISVS6m1s6bUQXLFveacg2IfCXFT4IcnPYEggQ==
X-Gm-Gg: AR+sD13QexUXn215+kbIy7NEfi91x6/gY2EIPRVIDPyeL4xi8HBGyh7jN6/41I81ASn
	F+nL5/PViDj24VkodOIFATshIIg3p4lhWX4BmmqeO7meeWzGLFbP8jQDhF/49Wspici26RGJS1b
	o2EGqGz4mgKw2yQnbsykPjTg27qbMwyGFjaWYgTg3oN/91hQdBHmA4kLrGUVBpfrzZocjs02ru4
	JR4dNRTMTembFE4+GGvq3OD9A52CkC3TCjSUJ4NlncGdn6aPwp+ail9lbIi5Ck9ynQ09bFLm6LZ
	FuoabJATEZ+H/QqIzT54D41fm7NkFE9UTQvPiexfJi0BJ3Jcg/XXMB/XwAi8Bh3bGDNFnS99SlM
	8fCAr7HNl+V9HUXUc
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr155457365ad.2.1787759470985;
        Wed, 26 Aug 2026 08:51:10 -0700 (PDT)
X-Received: by 2002:a17:902:fc4d:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2d7079ffd98mr155456345ad.2.1787759470546;
        Wed, 26 Aug 2026 08:51:10 -0700 (PDT)
Received: from [192.168.1.2] ([122.171.16.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704bf8978sm9118965ad.57.2026.08.26.08.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 08:51:09 -0700 (PDT)
Message-ID: <ac453410-67c6-47b4-ae79-fa682780fe49@redhat.com>
Date: Wed, 26 Aug 2026 21:21:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] kexec: return -ENOEXEC from image probe functions
 on mismatch
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>,
 Philipp Rudo <prudo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Bradley Morgan <include@grrlz.net>
References: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
 <20260821-mpilaniy-v3-1-76b355399d2e@redhat.com>
 <aoxQFxuzZ1AHmM8d@willie-the-truck>
 <06a45c67-2642-4efa-994a-ee50cd40a697@redhat.com>
 <ao2xc027TNYTwBA1@willie-the-truck>
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <ao2xc027TNYTwBA1@willie-the-truck>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rOHpr8tSqbs36rBeAwEsYSQPtXLgvqQWGUMszuljqjY_1787759471
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_085116_651781_8BA78050 
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

SGkgV2lsbCwKCk9uIDI1LzA4LzI2IDg6NDQgcG0sIFdpbGwgRGVhY29uIHdyb3RlOgo+IE9uIFR1
ZSwgQXVnIDI1LCAyMDI2IGF0IDEwOjQzOjQ4QU0gKzA1MzAsIE11a2VzaCBQaWxhbml5YSB3cm90
ZToKPj4gT24gMjQvMDgvMjYgNzozNyBwbSwgV2lsbCBEZWFjb24gd3JvdGU6Cj4+PiBPbiBGcmks
IEF1ZyAyMSwgMjAyNiBhdCAwNzoxOTo1N1BNICswNTMwLCBNdWtlc2ggUGlsYW5peWEgd3JvdGU6
Cj4+Pj4gU2V2ZXJhbCBrZXhlY19maWxlX2xvYWQoKSBpbWFnZSBwcm9iZSBmdW5jdGlvbnMgcmV0
dXJuIC1FSU5WQUwgd2hlbgo+Pj4+IHRoZXkgZG8gbm90IHJlY29nbml6ZSB0aGUgaW1hZ2UgZm9y
bWF0LiAgQSBwcm9iZSBmdW5jdGlvbiB0aGF0IHJlamVjdHMKPj4+PiBhbiBpbWFnZSBzaG91bGQg
cmV0dXJuIC1FTk9FWEVDIHRvIGluZGljYXRlIHRoYXQgdGhlIGltYWdlIGlzIG5vdCBhCj4+Pj4g
cmVjb2duaXplZCBleGVjdXRhYmxlIGZvcm1hdC4gIC1FSU5WQUwgaW1wbGllcyBhIHByb2JsZW0g
d2l0aCB0aGUKPj4+PiBzeXNjYWxsIHBhcmFtZXRlcnMsIG5vdCB3aXRoIGltYWdlIHJlY29nbml0
aW9uLgo+Pj4+Cj4+Pj4ga2V4ZWNfaW1hZ2VfcHJvYmVfZGVmYXVsdCgpIGl0ZXJhdGVzIHRocm91
Z2ggcmVnaXN0ZXJlZCBsb2FkZXJzIGFuZAo+Pj4+IHJldHVybnMgdGhlIGxhc3QgcHJvYmUncyBl
cnJvciBjb2RlIHRvIHRoZSBjYWxsZXIuICBUaGF0IGVycm9yCj4+Pj4gcHJvcGFnYXRlcyBhcyB0
aGUga2V4ZWNfZmlsZV9sb2FkKCkgcmV0dXJuIHZhbHVlIHRvIHVzZXJzcGFjZS4KPj4+PiBSZXR1
cm5pbmcgLUVJTlZBTCBmcm9tIGEgcHJvYmUgd2hlbiBubyBsb2FkZXIgbWF0Y2hlcyBpcyBzZW1h
bnRpY2FsbHkKPj4+PiBpbmNvcnJlY3QgYW5kIG1pc2xlYWRzIHVzZXJzcGFjZSBhYm91dCB0aGUg
bmF0dXJlIG9mIHRoZSBmYWlsdXJlLgo+Pj4+Cj4+Pj4gUmV0dXJuIC1FTk9FWEVDIGZyb20gYWxs
IHByb2JlIGZ1bmN0aW9ucyBhbmQgdGhlaXIgaGVscGVycyB3aGVuIHRoZQo+Pj4+IGltYWdlIGZv
cm1hdCBpcyBub3QgcmVjb2duaXplZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IE11a2VzaCBQ
aWxhbml5YSA8bXBpbGFuaXlAcmVkaGF0LmNvbT4KPj4+PiBSZXZpZXdlZC1ieTogUGhpbGlwcCBS
dWRvIDxwcnVkb0ByZWRoYXQuY29tPgo+Pj4+IFJldmlld2VkLWJ5OiBQcmF0eXVzaCBZYWRhdiA8
cHJhdHl1c2hAa2VybmVsLm9yZz4KPj4+PiBSZXZpZXdlZC1ieTogQnJhZGxleSBNb3JnYW4gPGlu
Y2x1ZGVAZ3JybHoubmV0Pgo+Pj4+IC0tLQo+Pj4+ICBhcmNoL2FybTY0L2tlcm5lbC9rZXhlY19p
bWFnZS5jICAgfCA0ICsrLS0KPj4+PiAgYXJjaC9sb29uZ2FyY2gva2VybmVsL2tleGVjX2VmaS5j
IHwgNCArKy0tCj4+Pj4gIGFyY2gvcmlzY3Yva2VybmVsL2tleGVjX2ltYWdlLmMgICB8IDQgKyst
LQo+Pj4+ICBrZXJuZWwva2V4ZWNfZWxmLmMgICAgICAgICAgICAgICAgfCA0ICsrLS0KPj4+PiAg
NCBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Pgo+Pj4g
SG1tLCBzbyBhZnRlciB0aGlzIHBhdGNoLCBhcmUgdGhlcmUgYWN0dWFsbHkgYW55IGltcGxlbWVu
dGF0aW9ucyBvZiAucHJvYmUoKQo+Pj4gdGhhdCByZXR1cm4gYW55dGhpbmcgb3RoZXIgdGhhbiAw
IG9yIC1FTk9FWEVDPyBJIGNvdWxkbid0IHNwb3QgYW55IGFmdGVyCj4+PiBhIHF1aWNrIGxvb2su
Cj4+Pgo+Pj4gV2lsbGtleGVjX2VsZl9wcm9iZSgpIGNhbiByZXR1cm4gLUVOT01FTSBpZiBtZW1v
cnkgYWxsb2NhdGlvbiAoa3phbGxvYygpKQo+PiBmYWlscyBpbnNpZGUgZWxmX3JlYWRfcGhkcnMo
KS4gVGhpcyBiZWhhdmlvciB3YXMgcHJldmlvdXNseSBkaXNjdXNzZWQgaW4KPj4gdGhlIGZpcnN0
IHBhdGNoIG9mIHRoaXMgc2VyaWVzIFsxXS4KPiAKPiBGYWlyIGVub3VnaCwgYnV0IEknZCBoYXZl
IHRob3VnaHQgaXQgd291bGQgYmUgZWFzaWVyIHRvIHNwZWNpYWwtY2FzZSB0aGUKPiBvbmUgLUVO
T01FTSBwYXRoIGluc3RlYWQgb2YgY2hhbmdpbmcgYWxsIHRoZSBiYWNrZW5kcyB0byByZXR1cm4K
PiAtRU5PRVhFQyBhbGwgb3ZlciB0aGUgcGxhY2UgKGFuZCBob3BpbmcgcGVvcGxlIGRvbid0IHN0
YXJ0IHJldHVybmluZwo+IC1FSU5WQUwgYWdhaW4gaW4gZnV0dXJlKS4KPiAKPiBXaWxsCgpSZXR1
cm5pbmcgLUVJTlZBTCBmcm9tIGEgcHJvYmUgb24gZm9ybWF0IG1pc21hdGNoIGlzIHNlbWFudGlj
YWxseSB3cm9uZwpvbiBpdHMgb3duIOKAlCBpbmRlcGVuZGVudCBvZiBob3cga2V4ZWNfaW1hZ2Vf
cHJvYmVfZGVmYXVsdCgpIGhhbmRsZXMKdGhlIHJldHVybiB2YWx1ZS4gIHg4NiBiekltYWdlNjRf
cHJvYmUoKSBhbmQgczM5MCBzMzkwX2VsZl9wcm9iZSgpCmFscmVhZHkgcmV0dXJuIC1FTk9FWEVD
IGNvcnJlY3RseTsgdGhpcyBwYXRjaCBqdXN0IGJyaW5ncyB0aGUgcmVtYWluaW5nCmJhY2tlbmRz
IGluIGxpbmUuCgpBbHNvIElNSE8sIGNoZWNraW5nIGZvciBlcnIgIT0gLUVOT0VYRUMgaW4ga2V4
ZWNfaW1hZ2VfcHJvYmVfZGVmYXVsdCgpCmlzIG1vcmUgcm9idXN0IHRoYW4gc3BlY2lhbC1jYXNp
bmcgZXJyID09IC1FTk9NRU0uCgotLSAKUmVnYXJkcywKTXVrZXNoIFBpbGFuaXlhCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
