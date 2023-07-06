Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF223C001DB
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 00:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nuJJCGak66L1UULekO9KqHhS2N3mxNZnZmqSYOp/Fjg=; b=0MBp22IBLGByS9
	7D1uaSZw/HwIkXOdJkYBpCGGLHyW5phNbisKbv47dddDS3d2iBQ5wLr3/ZaON7h5/NfR1iEqxuflX
	Ds07S+2ujnd7qnHu698Z6UBfaOiixeZQrvl1SgxaHIu/wXNOQ1Ldk0XO5V0FrZamwWULD1Ut8uefk
	xEihwMgZJMEqNnwxMvriWaPhqHBk+exQTDRewideFJ58Dt7EUY6SO+GRorMkt2O7TpZWTszVGVUPe
	yyJKpfjn8muVQBsN0DWglKaoCKIwgmmJxEGiDTyNNzyGAk6gaMiSshQtNY5YZzuUTI7r13bdrgALl
	MBQdjhq2K99FcJMGgN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCUU-00HQHo-25;
	Thu, 06 Jul 2023 00:04:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHCUR-00HQFP-0Y
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 00:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688601891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kTd/qr4bksrZcC6BdjL1ZLMm9nyCEwUKcpATLihwv5k=;
	b=Px8P2cXmL4kAzwaBh3u1WZKnO0xzSM24m5iqzHheVM8t7KfHajn7LGctxK5ht/b0vsjLtu
	Vur9gkrThWgP8pSpzobwjSYRh36i00HK5bN0utbsBKjzagsAVFUcQsPsckEYMm+D8PWavp
	/on0x3Tkiz3Uw/hxBCTuj8SMYwT8GgA=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-MEBb98edNp2lfMfof2vEfg-1; Wed, 05 Jul 2023 20:04:50 -0400
X-MC-Unique: MEBb98edNp2lfMfof2vEfg-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3a359611a98so164482b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 17:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688601890; x=1691193890;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kTd/qr4bksrZcC6BdjL1ZLMm9nyCEwUKcpATLihwv5k=;
        b=TbEabOE0ok4navh1jhmdumfRg98DnJeQVd7tLO8Pp/W7lgXsIHZpItnmy9IFZ5YPH9
         psCK2E9G39m3OoOGrTjTYGi5t3UYYcdm3pdSP4Zt1BvvuBD6Mhwfcz0GtLnztyQdNesv
         +Yt5NjVKlshZV8IyybS0FVd9yCfg8f7C2U5q9/VBgzzgoymWwSgH9CeqvzjeGDx17f6a
         mON6K6utZ2+1BxSYzlfyAJs0PoxhJLYnzOSAMAcLn7hhyCGxeuezMJNHmGrDCQPClf/J
         yvP52JbzgTqGhs742PLPizDTHw3Cvn6HE7ZJC86KJPyj2s+gmT5GnYuu9LVX/FIqhiTT
         1POg==
X-Gm-Message-State: ABy/qLbVmmIdwZm55UF/njf0lVqKqvBpPNLNYyd2GSt5OMZN9pv27qXD
	rvgiOcaJGRIzts7HQ80gwopd3CRJvSO+yfxjr5GYGoVHZTMGBWzkJCO6HKghLzN5WkrDZDkqHqf
	TPN+u6A23lmqmUf7kubo25xuhAjez
X-Received: by 2002:aca:210c:0:b0:3a3:b98a:d7b3 with SMTP id 12-20020aca210c000000b003a3b98ad7b3mr156740oiz.15.1688601890054;
        Wed, 05 Jul 2023 17:04:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFcAOyD86qn/Ko0yes6t7MQ6QP/I4BxYakSMNNUvAJ9TO78ZpYETGSsp9SSZO8tfA3KeC1o4g==
X-Received: by 2002:aca:210c:0:b0:3a3:b98a:d7b3 with SMTP id 12-20020aca210c000000b003a3b98ad7b3mr156713oiz.15.1688601889815;
        Wed, 05 Jul 2023 17:04:49 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id x11-20020a056a00270b00b00662610cf7a8sm83655pfv.172.2023.07.05.17.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 17:04:48 -0700 (PDT)
Message-ID: <60ba5bb4-6fad-0e51-2cd5-845610e6631d@redhat.com>
Date: Thu, 6 Jul 2023 10:04:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RESEND PATCH v5 07/11] KVM: arm64: Define
 kvm_tlb_flush_vmid_range()
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Huacai Chen
 <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>,
 David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-mips@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org
References: <20230621175002.2832640-1-rananta@google.com>
 <20230621175002.2832640-8-rananta@google.com>
 <1fe280a7-0f10-e124-00aa-b137df722c33@redhat.com>
 <CAJHc60xQtjvVsWRE=w-pAioNJW6uh-qKuZz2wp6bkT=X4oCm5A@mail.gmail.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <CAJHc60xQtjvVsWRE=w-pAioNJW6uh-qKuZz2wp6bkT=X4oCm5A@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_170455_299197_AE9FD954 
X-CRM114-Status: GOOD (  14.85  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy82LzIzIDA0OjI4LCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+IE9uIFR1ZSwg
SnVsIDQsIDIwMjMgYXQgNTozMeKAr1BNIEdhdmluIFNoYW4gPGdzaGFuQHJlZGhhdC5jb20+IHdy
b3RlOgo+PiBPbiA2LzIyLzIzIDAzOjQ5LCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+
Pj4gSW1wbGVtZW50IHRoZSBoZWxwZXIga3ZtX3RsYl9mbHVzaF92bWlkX3JhbmdlKCkgdGhhdCBh
Y3RzCj4+PiBhcyBhIHdyYXBwZXIgZm9yIHJhbmdlLWJhc2VkIFRMQiBpbnZhbGlkYXRpb25zLiBG
b3IgdGhlCj4+PiBnaXZlbiBWTUlELCB1c2UgdGhlIHJhbmdlLWJhc2VkIFRMQkkgaW5zdHJ1Y3Rp
b25zIHRvIGRvCj4+PiB0aGUgam9iIG9yIGZhbGxiYWNrIHRvIGludmFsaWRhdGluZyBhbGwgdGhl
IFRMQiBlbnRyaWVzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFJhZ2hhdmVuZHJhIFJhbyBBbmFu
dGEgPHJhbmFudGFAZ29vZ2xlLmNvbT4KPj4+IC0tLQo+Pj4gICAgYXJjaC9hcm02NC9pbmNsdWRl
L2FzbS9rdm1fcGd0YWJsZS5oIHwgMTAgKysrKysrKysrKwo+Pj4gICAgYXJjaC9hcm02NC9rdm0v
aHlwL3BndGFibGUuYyAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKysrKysKPj4+ICAgIDIg
ZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQo+Pj4KPj4KPj4gSXQgbWF5IGJlIHJlYXNv
bmFibGUgdG8gZm9sZCB0aGlzIHRvIFBBVENIWzA4LzExXSBzaW5jZSBrdm1fdGxiX2ZsdXNoX3Zt
aWRfcmFuZ2UoKSBpcwo+PiBvbmx5IGNhbGxlZCBieSBBUk02NCdzIGt2bV9hcmNoX2ZsdXNoX3Jl
bW90ZV90bGJzX3JhbmdlKCksIHdoaWNoIGlzIGFkZGVkIGJ5IFBBVENIWzA4LzExXS4KPj4gSW4g
ZWl0aGVyIHdheSwgdGhlIGNoYW5nZXMgbG9vayBnb29kIHRvIG1lOgo+Pgo+IEFoLCB0aGUgcGF0
Y2hlcyAxMCBhbmQgMTEgYWxzbyBjYWxsIGt2bV90bGJfZmx1c2hfdm1pZF9yYW5nZSgpLCBzbwo+
IHByb2JhYmx5IGl0J3MgYmV0dGVyIHRvIGtlZXAgdGhlIGRlZmluaXRpb24gaXNvbGF0ZWQ/Cj4g
CgpUaGFua3MgZm9yIHlvdXIgZXhwbGFuYXRpb24uIEl0J3MgZmluZSB0byBoYXZlIHR3byBzZXBh
cmF0ZSBwYXRjaGVzIGluIHRoaXMKY2FzZS4gSSBzdGlsbCBuZWVkIHRvIHNwZW5kIHNvbWUgdGlt
ZSB0byBsb29rIGF0IFBBVENIWzExLzExXSB3aG9zZSBzdWJqZWN0CmluY2x1ZGVzIHR5cG8gKGlu
dHJ1Y3Rpb25zIC0+IGluc3RydWN0aW9ucykKClRoYW5rcywKR2F2aW4KCj4+IFJldmlld2VkLWJ5
OiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgo+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvaW5jbHVkZS9hc20va3ZtX3BndGFibGUuaCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
a3ZtX3BndGFibGUuaAo+Pj4gaW5kZXggNGNkNjc2MmJkYTgwNS4uMWIxMjI5NWE4MzU5NSAxMDA2
NDQKPj4+IC0tLSBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20va3ZtX3BndGFibGUuaAo+Pj4gKysr
IGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9rdm1fcGd0YWJsZS5oCj4+PiBAQCAtNjgyLDQgKzY4
MiwxNCBAQCBlbnVtIGt2bV9wZ3RhYmxlX3Byb3Qga3ZtX3BndGFibGVfc3RhZ2UyX3B0ZV9wcm90
KGt2bV9wdGVfdCBwdGUpOwo+Pj4gICAgICogICAgIGt2bV9wZ3RhYmxlX3Byb3QgZm9ybWF0Lgo+
Pj4gICAgICovCj4+PiAgICBlbnVtIGt2bV9wZ3RhYmxlX3Byb3Qga3ZtX3BndGFibGVfaHlwX3B0
ZV9wcm90KGt2bV9wdGVfdCBwdGUpOwo+Pj4gKwo+Pj4gKy8qKgo+Pj4gKyAqIGt2bV90bGJfZmx1
c2hfdm1pZF9yYW5nZSgpIC0gSW52YWxpZGF0ZS9mbHVzaCBhIHJhbmdlIG9mIFRMQiBlbnRyaWVz
Cj4+PiArICoKPj4+ICsgKiBAbW11OiAgICAgU3RhZ2UtMiBLVk0gTU1VIHN0cnVjdAo+Pj4gKyAq
IEBhZGRyOiAgICBUaGUgYmFzZSBJbnRlcm1lZGlhdGUgcGh5c2ljYWwgYWRkcmVzcyBmcm9tIHdo
aWNoIHRvIGludmFsaWRhdGUKPj4+ICsgKiBAc2l6ZTogICAgU2l6ZSBvZiB0aGUgcmFuZ2UgZnJv
bSB0aGUgYmFzZSB0byBpbnZhbGlkYXRlCj4+PiArICovCj4+PiArdm9pZCBrdm1fdGxiX2ZsdXNo
X3ZtaWRfcmFuZ2Uoc3RydWN0IGt2bV9zMl9tbXUgKm1tdSwKPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBoeXNfYWRkcl90IGFkZHIsIHNpemVfdCBzaXplKTsKPj4+ICAgICNlbmRp
ZiAgICAgIC8qIF9fQVJNNjRfS1ZNX1BHVEFCTEVfSF9fICovCj4+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm02NC9rdm0vaHlwL3BndGFibGUuYyBiL2FyY2gvYXJtNjQva3ZtL2h5cC9wZ3RhYmxlLmMK
Pj4+IGluZGV4IDNkNjFiZDNlNTkxZDIuLmRmOGFjMTRkOWQzZDQgMTAwNjQ0Cj4+PiAtLS0gYS9h
cmNoL2FybTY0L2t2bS9oeXAvcGd0YWJsZS5jCj4+PiArKysgYi9hcmNoL2FybTY0L2t2bS9oeXAv
cGd0YWJsZS5jCj4+PiBAQCAtNjMxLDYgKzYzMSwyNiBAQCBzdGF0aWMgYm9vbCBzdGFnZTJfaGFz
X2Z3YihzdHJ1Y3Qga3ZtX3BndGFibGUgKnBndCkKPj4+ICAgICAgICByZXR1cm4gIShwZ3QtPmZs
YWdzICYgS1ZNX1BHVEFCTEVfUzJfTk9GV0IpOwo+Pj4gICAgfQo+Pj4KPj4+ICt2b2lkIGt2bV90
bGJfZmx1c2hfdm1pZF9yYW5nZShzdHJ1Y3Qga3ZtX3MyX21tdSAqbW11LAo+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGh5c19hZGRyX3QgYWRkciwgc2l6ZV90IHNpemUpCj4+PiAr
ewo+Pj4gKyAgICAgdW5zaWduZWQgbG9uZyBwYWdlcywgaW52YWxfcGFnZXM7Cj4+PiArCj4+PiAr
ICAgICBpZiAoIXN5c3RlbV9zdXBwb3J0c190bGJfcmFuZ2UoKSkgewo+Pj4gKyAgICAgICAgICAg
ICBrdm1fY2FsbF9oeXAoX19rdm1fdGxiX2ZsdXNoX3ZtaWQsIG1tdSk7Cj4+PiArICAgICAgICAg
ICAgIHJldHVybjsKPj4+ICsgICAgIH0KPj4+ICsKPj4+ICsgICAgIHBhZ2VzID0gc2l6ZSA+PiBQ
QUdFX1NISUZUOwo+Pj4gKyAgICAgd2hpbGUgKHBhZ2VzID4gMCkgewo+Pj4gKyAgICAgICAgICAg
ICBpbnZhbF9wYWdlcyA9IG1pbihwYWdlcywgTUFYX1RMQklfUkFOR0VfUEFHRVMpOwo+Pj4gKyAg
ICAgICAgICAgICBrdm1fY2FsbF9oeXAoX19rdm1fdGxiX2ZsdXNoX3ZtaWRfcmFuZ2UsIG1tdSwg
YWRkciwgaW52YWxfcGFnZXMpOwo+Pj4gKwo+Pj4gKyAgICAgICAgICAgICBhZGRyICs9IGludmFs
X3BhZ2VzIDw8IFBBR0VfU0hJRlQ7Cj4+PiArICAgICAgICAgICAgIHBhZ2VzIC09IGludmFsX3Bh
Z2VzOwo+Pj4gKyAgICAgfQo+Pj4gK30KPj4+ICsKPj4+ICAgICNkZWZpbmUgS1ZNX1MyX01FTUFU
VFIocGd0LCBhdHRyKSBQQUdFX1MyX01FTUFUVFIoYXR0ciwgc3RhZ2UyX2hhc19md2IocGd0KSkK
Pj4+Cj4+PiAgICBzdGF0aWMgaW50IHN0YWdlMl9zZXRfcHJvdF9hdHRyKHN0cnVjdCBrdm1fcGd0
YWJsZSAqcGd0LCBlbnVtIGt2bV9wZ3RhYmxlX3Byb3QgcHJvdCwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
