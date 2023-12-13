Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F56BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 22:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lg3tJ01gjCWhZaFEU4+GMOH9IBEvhAAvJvKT4uwGmAo=; b=yYNzGZtnjv9xyS
	O0rlcZ+sLKG7+et2Mpf8n1k4Aq0ItLAERQ/zYM1aPV22f8d2chP3azgzxNLvsDe7bqFFEU141YY4E
	C79hkgQqbViZtwUwq3EV6or46Ao+ea0dBoCxX/jClXbJ4CFDcq/5KfuqGVkdJUCZCnnD7Eax3+96q
	exgt5MIo6WjPbfWsTmON1rItTCCuSaSYNLG+RrCfKJNj90lZCnZze3tTM3XpPtEgSdtdbaGm4/4PK
	tbNI46vBSBUz44+wkrIaDRkbuWUxtLAPtsIcSyoBcC6bEl9g13F8E/P+u10NP1q4yAQ23jMi3Sctz
	rjDIO4AudRBN1TDaQXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDXg1-00G7Or-2O;
	Wed, 13 Dec 2023 22:26:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDXfy-00G7NZ-2b
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 22:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702506356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GtHNIqYNLvneVefWnBC6zOfsKWdZrXaTN0MEXSsNlm4=;
	b=YL+HWKixxRZDtjayL4IGhuxJaNn+EhTwhRVwbLqYBYbdxAMg10OSspGWG0GJDPQi+MBHNK
	6t87v77FBfU0RTR12wa5IWNpzWSDupxmbmCDSsR4qbL1kZRP/fKLrPu7kuftg+0bKGJjKr
	4Gh5Mr51BVsyrE8Ydqoto5lDEOdHDoE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-YUXMjsb2MA64gpa-R9OO8A-1; Wed, 13 Dec 2023 17:25:55 -0500
X-MC-Unique: YUXMjsb2MA64gpa-R9OO8A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-336447277fcso7801f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 14:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702506354; x=1703111154;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GtHNIqYNLvneVefWnBC6zOfsKWdZrXaTN0MEXSsNlm4=;
        b=VBSgfd68d64mTqhexewCgq6+wF+l+ynGeT34/chIi8jvi3P0Xoh3AuD1Vi2VENVe93
         LZtTekQOvOAt906ZjnOQVWZPKhF0OOXpXS2jMLOiCFxGqNLC+qQV+nu79nhXuoxxkKx1
         htTttFzJa/W33Vld0lgvzQSrJKi7oJ3HiOMWRssm6hGWb1mGAyEFdR/cuCVscxFCsVuS
         OBeB3EjmN4wKjnQmntkstm72OZBUePiXAMfy0miZe+VbOGXp+Ck06FHjI/K3BUfEtkDb
         0TqSXPVA6H/r8tPnLGkqIXaDnlByBQQRqStrdixGmSvi8racIwwD4bmBYtrNleOjNZTR
         2E9A==
X-Gm-Message-State: AOJu0Yy/GkHbgydlFiXAjr4BseA4UnElmrluOm7IX5VnqPxSZHI8RpFW
	RIpmv5Gu4W+YsUF8mKG+szBKEHBuA8ZB6k9ckt/y4SVn7nncV6QRRTl68zzgk8HCuy3fX7MZijj
	wJJ5b5+IydALVhaeMe9YF+z2npB0E
X-Received: by 2002:a05:600c:518a:b0:40b:5e4a:2354 with SMTP id fa10-20020a05600c518a00b0040b5e4a2354mr4800777wmb.86.1702506354408;
        Wed, 13 Dec 2023 14:25:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGq5vSBS9iWIl4hhY+47LaF7O2e11U2yVs0UmGQ3dWeLwMn5yVhoe2ukGq+e6/HNoX4k1QrCw==
X-Received: by 2002:a05:600c:518a:b0:40b:5e4a:2354 with SMTP id fa10-20020a05600c518a00b0040b5e4a2354mr4800760wmb.86.1702506354019;
        Wed, 13 Dec 2023 14:25:54 -0800 (PST)
Received: from starship ([77.137.131.62])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm24509354wms.30.2023.12.13.14.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:25:53 -0800 (PST)
Message-ID: <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from
 kvm_vcpu_check_block()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Jim Mattson
 <jmattson@google.com>
Cc: alexandru.elisei@arm.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	atishp@atishpatra.org, borntraeger@linux.ibm.com, chenhuacai@kernel.org, 
	david@redhat.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	james.morse@arm.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, oliver.upton@linux.dev, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, pbonzini@redhat.com, 
	suzuki.poulose@arm.com
Date: Thu, 14 Dec 2023 00:25:50 +0200
In-Reply-To: <ZXh8Nq_y_szj1WN0@google.com>
References: <20220921003201.1441511-11-seanjc@google.com>
	 <20231207010302.2240506-1-jmattson@google.com>
	 <ZXHw7tykubfG04Um@google.com>
	 <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
	 <ZXh8Nq_y_szj1WN0@google.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_142558_928672_5E7C2469 
X-CRM114-Status: GOOD (  22.60  )
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

T24gVHVlLCAyMDIzLTEyLTEyIGF0IDA3OjI4IC0wODAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOgo+IE9uIFN1biwgRGVjIDEwLCAyMDIzLCBKaW0gTWF0dHNvbiB3cm90ZToKPiA+IE9uIFRo
dSwgRGVjIDcsIDIwMjMgYXQgODoyMeKAr0FNIFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bn
b29nbGUuY29tPiB3cm90ZToKPiA+ID4gRG9oLiAgV2UgZ290IHRoZSBsZXNzIG9idmlvdXMgY2Fz
ZXMgYW5kIG1pc3NlZCB0aGUgb2J2aW91cyBvbmUuCj4gPiA+IAo+ID4gPiBVZ2gsIGFuZCB3ZSBh
bHNvIG1pc3NlZCBhIHJlbGF0ZWQgbWVzcyBpbiBrdm1fZ3Vlc3RfYXBpY19oYXNfaW50ZXJydXB0
KCkuICBUaGF0Cj4gPiA+IHRoaW5nIHNob3VsZCByZWFsbHkgYmUgZm9sZGVkIGludG8gdm14X2hh
c19uZXN0ZWRfZXZlbnRzKCkuCj4gPiA+IAo+ID4gPiBHb29kIGdyYXZ5LiAgQW5kIHZteF9pbnRl
cnJ1cHRfYmxvY2tlZCgpIGRvZXMgdGhlIHdyb25nIHRoaW5nIGJlY2F1c2UgdGhhdAo+ID4gPiBz
cGVjaWZpY2FsbHkgY2hlY2tzIGlmIEwxIGludGVycnVwdHMgYXJlIGJsb2NrZWQuCj4gPiA+IAo+
ID4gPiBDb21waWxlIHRlc3RlZCBvbmx5LCBhbmQgZGVmaW5pdGVseSBuZWVkcyB0byBiZSBjaHVu
a2VkIGludG8gbXVsdGlwbGUgcGF0Y2hlcywKPiA+ID4gYnV0IEkgdGhpbmsgc29tZXRoaW5nIGxp
a2UgdGhpcyBtZXNzPwo+ID4gCj4gPiBUaGUgcHJvcG9zZWQgcGF0Y2ggZG9lcyBub3QgZml4IHRo
ZSBwcm9ibGVtLiBJbiBmYWN0LCBpdCBtZXNzZXMgdGhpbmdzCj4gPiB1cCBzbyBtdWNoIHRoYXQg
SSBkb24ndCBnZXQgYW55IHRlc3QgcmVzdWx0cyBiYWNrLgo+IAo+IERyYXQuCj4gCj4gPiBHb29n
bGUgaGFzIGFuIGludGVybmFsIEstVS1UIHRlc3QgdGhhdCBkZW1vbnN0cmF0ZXMgdGhlIHByb2Js
ZW0uIEkKPiA+IHdpbGwgcG9zdCBpdCBzb29uLgo+IAo+IFJlY2VpdmVkLCBJJ2xsIGRpZyBpbiBz
b29uaXNoLCB0aG91Z2ggInNvb25pc2giIG1pZ2h0IHVuZm9ydHVuYXRlbHkgbWlnaHQgbWVhbgo+
IDIwMjQuCj4gCgpIaSwKClNvIHRoaXMgaXMgd2hhdCBJIHRoaW5rOgoKCktWTSBkb2VzIGhhdmUg
a3ZtX2d1ZXN0X2FwaWNfaGFzX2ludGVycnVwdCgpIGZvciB0aGlzIGV4YWN0IHB1cnBvc2UsCnRv
IGNoZWNrIGlmIG5lc3RlZCBBUElDdiBoYXMgYSBwZW5kaW5nIGludGVycnVwdCBiZWZvcmUgaGFs
dGluZy4KCgpIb3dldmVyIHRoZSBwcm9ibGVtIGlzIGJpZ2dlciAtIHdpdGggQVBJQ3Ygd2UgaGF2
ZSBpbiBlc3NlbmNlIDIgcGVuZGluZyBpbnRlcnJ1cHQKYml0bWFwcyAtIHRoZSBQSVIgYW5kIHRo
ZSBJUlIsIGFuZCB0byBrbm93IGlmIHRoZSBndWVzdCBoYXMgYSBwZW5kaW5nIGludGVycnVwdApv
bmUgaGFzIGluIHRoZW9yeSB0byBjb3B5IFBJUiB0byBJUlIsIHRoZW4gc2VlIGlmIHRoZSBtYXgg
aXMgbGFyZ2VyIHRoZW4gdGhlIGN1cnJlbnQgUFBSLgoKU2luY2Ugd2UgZG9uJ3Qgd2FudCB0byB3
cml0ZSB0byBndWVzdCBtZW1vcnksIGFuZCB0aGUgSVJSIGhlcmUgcmVzaWRlcyBpbiB0aGUgZ3Vl
c3QgbWVtb3J5LApJIGd1ZXNzIHdlIGhhdmUgdG8gZG8gYSAnZHJ5LXJ1bicgdmVyc2lvbiBvZiAn
dm14X2NvbXBsZXRlX25lc3RlZF9wb3N0ZWRfaW50ZXJydXB0JyBhbmQgY2FsbAppdCBmcm9tICBr
dm1fZ3Vlc3RfYXBpY19oYXNfaW50ZXJydXB0KCkuCgpXaGF0IGRvIHlvdSB0aGluaz8gSSBjYW4g
cHJlcGFyZSBhIHBhdGNoIGZvciB0aGlzLgoKQ2FuIHlvdSBzaGFyZSBhIHJlcHJvZHVjZXIgb3Ig
d3JpdGUgYSBuZXcgb25lIHRoYXQgY2FuIGJlIHNoYXJlZD8KCkJlc3QgcmVnYXJkcywKCU1heGlt
IExldml0c2t5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
