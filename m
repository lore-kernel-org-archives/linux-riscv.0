Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C10C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 22:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=21UwhChnEqbUsS2r7pklngAj5ynz4YMPG+88omn6ul0=; b=lFvhNcxCdkSHx9
	c7gw0ZKojAXp2JjW7w2YB5qOZJakjQNJVot/+vF0A2yQjYGVPCcyO1AWadw+tT8Jk3e44kYJxNy/H
	ywqGlHc6RJQF2VruSzRc5kkItKsolRlOelytsxdJvbbJDcNo6cWiw9714b67LeySAItw4LIj1chW8
	aQfyGtnG+AMm/xmXsSbqKseX123Im5fX6ghDmjGQeKvdClZDv9mw2oBZOAN+KM2IC26EVIbS0s1B1
	wIFXUCdXH0AGlfYC7x/v8p0u+s2uaY8gg1zhHs98Q27wMJoFy3zQPaJY3tuWIwT8SwvTtTNEV08vp
	ZyGPfUg3MjNY8x0BRp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDXxt-00GAaq-2j;
	Wed, 13 Dec 2023 22:44:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDXxo-00GAXM-1y
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 22:44:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702507458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wJ/noKt4RR9yP36R44EoDN70UzFeuyznjnW/8U/CnAQ=;
	b=cpmQelrFh2kfK6YmAaEdPqt7RajsqRJSunkeJfJTASYW94TaRPxGBt+fOxSasRF2ErfZvi
	TW3qd5Yh3eisKlbeLrxWoYrpZKVqD2+KBIc+puJfCu6ZvF0wcEjBM3fzSsOikvm5CTq5NR
	g9mllIu7kG63mgYKm/fNqytDuVrI6BQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-PHbNj3BNM8-IzOoQqiMZPA-1; Wed, 13 Dec 2023 17:44:17 -0500
X-MC-Unique: PHbNj3BNM8-IzOoQqiMZPA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33342e25313so6240930f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 14:44:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702507456; x=1703112256;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wJ/noKt4RR9yP36R44EoDN70UzFeuyznjnW/8U/CnAQ=;
        b=kH9GdYHZNK7t+/erSZHCYzZIAYl8JqDiZhBNF7z3OeVH05dajSUi/8ul4loRFJGB2D
         QWgARAMNiEAbvg5TN+vN6fHACRtTvlIYNWbn8HR5c7mQBUok80kiX77FFLTBlbh2nune
         /tc4tp8s3+11eQN61N97eJSmpAo3F+dRcq68cs2qk6+JPIn6YR/AfPBx8v5EuuMl1F9m
         c9NEiPh5NbN3Hxc794JnC30VMONa4+Z1vY0cMU8BhACS12INkULENKrRnLRGst/M39YA
         EtT9i9RjeNVV3Po782cCoVicP6Cis8jPkfRw9Q/D19+dl29vIGYOYUKKszu31It+lVr8
         7yCw==
X-Gm-Message-State: AOJu0YyhJ20CCTBkC4zuB6utiMsC4G+XiMcY/KPrh1atsoajEUr5BeyK
	liReNzz5LciE64Us3OaCXQJCwSALuOB9IUP/wFucI86+lAwA/iImsaXQ9fXiN0GieEYF9OvpDPl
	kJYRkFjaJ2Ry8P2TZ04stabpayZ8m
X-Received: by 2002:a7b:cd91:0:b0:40c:3399:d5a0 with SMTP id y17-20020a7bcd91000000b0040c3399d5a0mr3902512wmj.100.1702507455967;
        Wed, 13 Dec 2023 14:44:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5EdNQIMrjofmVv1zrJdv8ykEuwHCs2ZxHKs/y4nPdIAePbusp9PWe8bHPWPpyIDEswd1Chw==
X-Received: by 2002:a7b:cd91:0:b0:40c:3399:d5a0 with SMTP id y17-20020a7bcd91000000b0040c3399d5a0mr3902490wmj.100.1702507455621;
        Wed, 13 Dec 2023 14:44:15 -0800 (PST)
Received: from starship ([77.137.131.62])
        by smtp.gmail.com with ESMTPSA id az23-20020a05600c601700b0040c0902dc22sm22569330wmb.31.2023.12.13.14.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:44:15 -0800 (PST)
Message-ID: <0c86e5ffb65f07cd3e444038d1f0ed39f0f4130a.camel@redhat.com>
Subject: Re: [PATCH v4 10/12] KVM: x86: never write to memory from
 kvm_vcpu_check_block()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Jim Mattson <jmattson@google.com>
Cc: Sean Christopherson <seanjc@google.com>, alexandru.elisei@arm.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	borntraeger@linux.ibm.com, chenhuacai@kernel.org, david@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, james.morse@arm.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, oliver.upton@linux.dev, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, pbonzini@redhat.com, 
	suzuki.poulose@arm.com
Date: Thu, 14 Dec 2023 00:44:12 +0200
In-Reply-To: <CALMp9eQ69dGSix-9pJdEtEw9T1Mqz9E1eaf1-yGP9k4_nMZogw@mail.gmail.com>
References: <20220921003201.1441511-11-seanjc@google.com>
	 <20231207010302.2240506-1-jmattson@google.com>
	 <ZXHw7tykubfG04Um@google.com>
	 <CALMp9eTT97oDmQT7pxeOMLQbt-371aMtC2Kev+-kWXVRDVrjeg@mail.gmail.com>
	 <ZXh8Nq_y_szj1WN0@google.com>
	 <5ca5592b21131f515e296afae006e5bb28b1fb87.camel@redhat.com>
	 <CALMp9eQ69dGSix-9pJdEtEw9T1Mqz9E1eaf1-yGP9k4_nMZogw@mail.gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_144424_729002_C2E51E96 
X-CRM114-Status: GOOD (  32.96  )
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

T24gV2VkLCAyMDIzLTEyLTEzIGF0IDE0OjMxIC0wODAwLCBKaW0gTWF0dHNvbiB3cm90ZToKPiBP
biBXZWQsIERlYyAxMywgMjAyMyBhdCAyOjI14oCvUE0gTWF4aW0gTGV2aXRza3kgPG1sZXZpdHNr
QHJlZGhhdC5jb20+IHdyb3RlOgo+ID4gT24gVHVlLCAyMDIzLTEyLTEyIGF0IDA3OjI4IC0wODAw
LCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+ID4gPiBPbiBTdW4sIERlYyAxMCwgMjAyMywg
SmltIE1hdHRzb24gd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBEZWMgNywgMjAyMyBhdCA4OjIx4oCv
QU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+ID4gPiA+
ID4gRG9oLiAgV2UgZ290IHRoZSBsZXNzIG9idmlvdXMgY2FzZXMgYW5kIG1pc3NlZCB0aGUgb2J2
aW91cyBvbmUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFVnaCwgYW5kIHdlIGFsc28gbWlzc2VkIGEg
cmVsYXRlZCBtZXNzIGluIGt2bV9ndWVzdF9hcGljX2hhc19pbnRlcnJ1cHQoKS4gIFRoYXQKPiA+
ID4gPiA+IHRoaW5nIHNob3VsZCByZWFsbHkgYmUgZm9sZGVkIGludG8gdm14X2hhc19uZXN0ZWRf
ZXZlbnRzKCkuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEdvb2QgZ3JhdnkuICBBbmQgdm14X2ludGVy
cnVwdF9ibG9ja2VkKCkgZG9lcyB0aGUgd3JvbmcgdGhpbmcgYmVjYXVzZSB0aGF0Cj4gPiA+ID4g
PiBzcGVjaWZpY2FsbHkgY2hlY2tzIGlmIEwxIGludGVycnVwdHMgYXJlIGJsb2NrZWQuCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IENvbXBpbGUgdGVzdGVkIG9ubHksIGFuZCBkZWZpbml0ZWx5IG5lZWRz
IHRvIGJlIGNodW5rZWQgaW50byBtdWx0aXBsZSBwYXRjaGVzLAo+ID4gPiA+ID4gYnV0IEkgdGhp
bmsgc29tZXRoaW5nIGxpa2UgdGhpcyBtZXNzPwo+ID4gPiA+IAo+ID4gPiA+IFRoZSBwcm9wb3Nl
ZCBwYXRjaCBkb2VzIG5vdCBmaXggdGhlIHByb2JsZW0uIEluIGZhY3QsIGl0IG1lc3NlcyB0aGlu
Z3MKPiA+ID4gPiB1cCBzbyBtdWNoIHRoYXQgSSBkb24ndCBnZXQgYW55IHRlc3QgcmVzdWx0cyBi
YWNrLgo+ID4gPiAKPiA+ID4gRHJhdC4KPiA+ID4gCj4gPiA+ID4gR29vZ2xlIGhhcyBhbiBpbnRl
cm5hbCBLLVUtVCB0ZXN0IHRoYXQgZGVtb25zdHJhdGVzIHRoZSBwcm9ibGVtLiBJCj4gPiA+ID4g
d2lsbCBwb3N0IGl0IHNvb24uCj4gPiA+IAo+ID4gPiBSZWNlaXZlZCwgSSdsbCBkaWcgaW4gc29v
bmlzaCwgdGhvdWdoICJzb29uaXNoIiBtaWdodCB1bmZvcnR1bmF0ZWx5IG1pZ2h0IG1lYW4KPiA+
ID4gMjAyNC4KPiA+ID4gCj4gPiAKPiA+IEhpLAo+ID4gCj4gPiBTbyB0aGlzIGlzIHdoYXQgSSB0
aGluazoKPiA+IAo+ID4gCj4gPiBLVk0gZG9lcyBoYXZlIGt2bV9ndWVzdF9hcGljX2hhc19pbnRl
cnJ1cHQoKSBmb3IgdGhpcyBleGFjdCBwdXJwb3NlLAo+ID4gdG8gY2hlY2sgaWYgbmVzdGVkIEFQ
SUN2IGhhcyBhIHBlbmRpbmcgaW50ZXJydXB0IGJlZm9yZSBoYWx0aW5nLgo+ID4gCj4gPiAKPiA+
IEhvd2V2ZXIgdGhlIHByb2JsZW0gaXMgYmlnZ2VyIC0gd2l0aCBBUElDdiB3ZSBoYXZlIGluIGVz
c2VuY2UgMiBwZW5kaW5nIGludGVycnVwdAo+ID4gYml0bWFwcyAtIHRoZSBQSVIgYW5kIHRoZSBJ
UlIsIGFuZCB0byBrbm93IGlmIHRoZSBndWVzdCBoYXMgYSBwZW5kaW5nIGludGVycnVwdAo+ID4g
b25lIGhhcyBpbiB0aGVvcnkgdG8gY29weSBQSVIgdG8gSVJSLCB0aGVuIHNlZSBpZiB0aGUgbWF4
IGlzIGxhcmdlciB0aGVuIHRoZSBjdXJyZW50IFBQUi4KPiA+IAo+ID4gU2luY2Ugd2UgZG9uJ3Qg
d2FudCB0byB3cml0ZSB0byBndWVzdCBtZW1vcnksIGFuZCB0aGUgSVJSIGhlcmUgcmVzaWRlcyBp
biB0aGUgZ3Vlc3QgbWVtb3J5LAo+ID4gSSBndWVzcyB3ZSBoYXZlIHRvIGRvIGEgJ2RyeS1ydW4n
IHZlcnNpb24gb2YgJ3ZteF9jb21wbGV0ZV9uZXN0ZWRfcG9zdGVkX2ludGVycnVwdCcgYW5kIGNh
bGwKPiA+IGl0IGZyb20gIGt2bV9ndWVzdF9hcGljX2hhc19pbnRlcnJ1cHQoKS4KPiA+IAo+ID4g
V2hhdCBkbyB5b3UgdGhpbms/IEkgY2FuIHByZXBhcmUgYSBwYXRjaCBmb3IgdGhpcy4KPiA+IAo+
ID4gQ2FuIHlvdSBzaGFyZSBhIHJlcHJvZHVjZXIgb3Igd3JpdGUgYSBuZXcgb25lIHRoYXQgY2Fu
IGJlIHNoYXJlZD8KPiAKPiBTZWUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcva3ZtLzIwMjMxMjEx
MTg1NTUyLjM4NTY4NjItMS1qbWF0dHNvbkBnb29nbGUuY29tLy4KClRoYW5rIHlvdSEKCkJlc3Qg
cmVnYXJkcywKCU1heGltIExldml0c2t5Cgo+IAo+ID4gQmVzdCByZWdhcmRzLAo+ID4gICAgICAg
ICBNYXhpbSBMZXZpdHNreQo+ID4gCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
