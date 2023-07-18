Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6661C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxtXlwTXd82r7UG1D1ZjC3tSg1erjss4l3M9cdNAHhw=; b=WR7hRPu4wBD1Pc
	w1xjRjM+0tKTr9z0R3NrLgQlV/bpqQstKyd3Ybq+PG6BdVYgQRlHekKW8BX5bzeaKaNKI3tjBuzB3
	gvFgnplLtiZnNxurFzebg2QgCjH9GByBh08HobjnAQsvg3n/cd53IcKBT6DMjOx/oH8jCKFpEoeOG
	HCG/RVzZ9PdLwkNhUqJjzL3Cjj0sq05T57zRVsDDm5xMtwkYjpUI4aJvMoAEKgvskTb1M1SWQJeeS
	v7N4toepJAKJ2KJns7XAeQoVdGYcmvrr2kF6cZ+F7rUrNFR4OpdRPGAxDWTF/l0qGxynX2ADBrRe/
	VjLugcQ4EeStY8jnFxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0o2-005oJA-1j;
	Wed, 19 Jul 2023 06:37:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0o1-005oIQ-1c
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=H+45ZyWb2HqRyHH2F0pUkKRaEVhoBXUcXoMtMWwioBo=; b=jUz2XFmWtxiuXsCJKquMipGUZ3
	FyULj5VPO+YV4Yiib1HON+h+lRq6mZhUc4NsVy67VOzlU61Cpno6EMEScX9nUtKH17OCsOilTBudN
	aJJQgYYLcm3+gxFgk4SHHhXDMyfufofCdhkuzVGK9j2pt/kGJESOE7ZjVFI2Ipt6iC86j2Ubymb6t
	3FyRRpY2LPX3YrKapE5hUGgdL5qswPhVYtWaNFBCeWau45vVNITa2GkLU437h3w7ENzfFCwsQHPrw
	hGy8glEG4PlI88syZ8epc5q0pDVM37f+nAC4PpAigRmT+azZlrqoSgm8cO8Y/pfKvDTmwn0rVwWvY
	OMc1xVvQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLaoY-009bga-00
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 02:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689648579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+45ZyWb2HqRyHH2F0pUkKRaEVhoBXUcXoMtMWwioBo=;
	b=doKH9vSbGzzdgFCgHfmglfl+vOwPLiva3BWnIUBPzYoYL/S5Z+iHo1y2HhBUOL815I+R9M
	l+ds4354UFZNzydant1yX+FmxCGFWZ729Hj7CyCr/Vewk/PGVqc/qAiJsv4HFvbWXthE5s
	bGyyEKvYEtOK5QFx9dBACkUfvM7Ng3I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689648707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+45ZyWb2HqRyHH2F0pUkKRaEVhoBXUcXoMtMWwioBo=;
	b=Tf6k2TZNL/tU9hYPIgkpR5KXY5SPexV39Xx9pGYsfeNMAo+rcqebFHcXXFZ2l/NyWlY1r2
	Jyk2Ftgm3QHNlopeGVPF1arTuhdoweRAfjo5dULfYGzRNaFAyhPOGwmg+OHPjD1w4YtjgI
	Nhsie8vKLoVfjEPdhLfC3ID/5XGT+DU=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-Z76iPXPzPJWjh4Sn66Qs-w-1; Mon, 17 Jul 2023 22:49:38 -0400
X-MC-Unique: Z76iPXPzPJWjh4Sn66Qs-w-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-26359a348ccso573163a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 19:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689648577; x=1690253377;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+45ZyWb2HqRyHH2F0pUkKRaEVhoBXUcXoMtMWwioBo=;
        b=NLmzSZi18cobQ4OZ29sSbtsFisPp3Ay6B1lX8ZmCZB/KmyKyKnXkMk+drd5idYG2He
         L8M0cwoiGB0B/xs/8h5E1qAYaTCGn6l0LO9bIRUEldVDypk5fvK9RXhcz3lktBEAMSAb
         mqAcrc4oY0XdDtYM4nwUKd7+Z7ZGugEYEMjHOHN5gApzgNn+kd3XuX0D/E8ikWzlpwMF
         4/iFJyVbR/4R1kLEHwiR63qUdadgQoLJYGmIBH5fpwpK5oZJg9+rvTgMPSvQH6ojKxRB
         TgkBELGbZa9ilBLIrvQGHc98TgvefYMw6ARHvgXbvLfb2jZots6si3BCc7C34iHAqb8E
         13CA==
X-Gm-Message-State: ABy/qLYaQbLrlWjh/BkWwm7+jsXNlJm8icd3eoNDtKGNvNQje42xdm+h
	hIb43mbcDLTigP8Oslq1EZlXRqE/9EaXVtwXzVonNKc6jvMPCBuUu5dtpbwxNZS4fyiDfqDUzRW
	6cyueAsNO8bI+gXUUofW+JavWX94R
X-Received: by 2002:a17:90b:4f85:b0:264:942:ad27 with SMTP id qe5-20020a17090b4f8500b002640942ad27mr8520254pjb.4.1689648577407;
        Mon, 17 Jul 2023 19:49:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHmr1Z6fxgwh3ey9UYla3ldbhFZ9vRtd8xFl4FGgQch6ukr6hDJ/c8wi7DljinMiAbNuTzhgA==
X-Received: by 2002:a17:90b:4f85:b0:264:942:ad27 with SMTP id qe5-20020a17090b4f8500b002640942ad27mr8520243pjb.4.1689648577079;
        Mon, 17 Jul 2023 19:49:37 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id cm10-20020a17090afa0a00b0025dc5749b4csm5693845pjb.21.2023.07.17.19.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 19:49:36 -0700 (PDT)
Message-ID: <fb52139b-5854-6370-7de3-bd87b31e3148@redhat.com>
Date: Tue, 18 Jul 2023 10:49:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 03/11] KVM: Allow range-based TLB invalidation from
 common code
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
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Gavin Shan <gshan@redhat.com>
References: <20230715005405.3689586-1-rananta@google.com>
 <20230715005405.3689586-4-rananta@google.com>
 <199d18de-1214-7683-b87a-03cc7e49719a@redhat.com>
 <CAJHc60zhVco3uTq97vDHMk8cgg1psPtwHT6MN1eKP1Yr18d9cw@mail.gmail.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <CAJHc60zhVco3uTq97vDHMk8cgg1psPtwHT6MN1eKP1Yr18d9cw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_035150_716390_8D0CB4BD 
X-CRM114-Status: GOOD (  16.83  )
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

CgpPbiA3LzE4LzIzIDAwOjM3LCBSYWdoYXZlbmRyYSBSYW8gQW5hbnRhIHdyb3RlOgo+IE9uIE1v
biwgSnVsIDE3LCAyMDIzIGF0IDQ6NDDigK9BTSBTaGFvcWluIEh1YW5nIDxzaGFodWFuZ0ByZWRo
YXQuY29tPiB3cm90ZToKPj4KPj4KPj4KPj4gT24gNy8xNS8yMyAwODo1MywgUmFnaGF2ZW5kcmEg
UmFvIEFuYW50YSB3cm90ZToKPj4+IEZyb206IERhdmlkIE1hdGxhY2sgPGRtYXRsYWNrQGdvb2ds
ZS5jb20+Cj4+Pgo+Pj4gTWFrZSBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2UoKSB2aXNpYmxl
IGluIGNvbW1vbiBjb2RlIGFuZCBjcmVhdGUgYQo+Pj4gZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiB0
aGF0IGp1c3QgaW52YWxpZGF0ZXMgdGhlIHdob2xlIFRMQi4KPj4+Cj4+PiBUaGlzIHBhdmVzIHRo
ZSB3YXkgZm9yIHNldmVyYWwgZnV0dXJlIGZlYXR1cmVzL2NsZWFudXBzOgo+Pj4KPj4+ICAgIC0g
SW50cm9kdWN0aW9uIG9mIHJhbmdlLWJhc2VkIFRMQkkgb24gQVJNLgo+Pj4gICAgLSBFbGltaW5h
dGluZyBrdm1fYXJjaF9mbHVzaF9yZW1vdGVfdGxic19tZW1zbG90KCkKPj4+ICAgIC0gTW92aW5n
IHRoZSBLVk0veDg2IFREUCBNTVUgdG8gY29tbW9uIGNvZGUuCj4+Pgo+Pj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UgaW50ZW5kZWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGF2aWQgTWF0bGFjayA8
ZG1hdGxhY2tAZ29vZ2xlLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IFJhZ2hhdmVuZHJhIFJhbyBB
bmFudGEgPHJhbmFudGFAZ29vZ2xlLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBHYXZpbiBTaGFuIDxn
c2hhbkByZWRoYXQuY29tPgo+Pj4gLS0tCj4+PiAgICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oIHwgIDMgKysrCj4+PiAgICBhcmNoL3g4Ni9rdm0vbW11L21tdS5jICAgICAgICAgIHwg
IDkgKysrKy0tLS0tCj4+PiAgICBhcmNoL3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oIHwgIDMg
LS0tCj4+PiAgICBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggICAgICAgIHwgIDkgKysrKysrKysr
Cj4+PiAgICB2aXJ0L2t2bS9rdm1fbWFpbi5jICAgICAgICAgICAgIHwgMTMgKysrKysrKysrKysr
Kwo+Pj4gICAgNSBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+Pj4gaW5kZXggYTJkM2NmYzJlYjc1Li4w
ODkwMGFmYmYyYWQgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oCj4+PiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCj4+PiBAQCAtMTgw
NCw2ICsxODA0LDkgQEAgc3RhdGljIGlubGluZSBpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3Rs
YnMoc3RydWN0IGt2bSAqa3ZtKQo+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9UU1VQUDsK
Pj4+ICAgIH0KPj4+Cj4+PiArI2RlZmluZSBfX0tWTV9IQVZFX0FSQ0hfRkxVU0hfUkVNT1RFX1RM
QlNfUkFOR0UKPj4+ICtpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoc3RydWN0
IGt2bSAqa3ZtLCBnZm5fdCBzdGFydF9nZm4sIHU2NCBwYWdlcyk7Cj4+PiArCj4+PiAgICAjZGVm
aW5lIGt2bV9hcmNoX3BtaV9pbl9ndWVzdCh2Y3B1KSBcCj4+PiAgICAgICAgKCh2Y3B1KSAmJiAo
dmNwdSktPmFyY2guaGFuZGxpbmdfaW50cl9mcm9tX2d1ZXN0KQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9rdm0vbW11L21tdS5jIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwo+Pj4gaW5k
ZXggZWMxNjlmNWM3ZGNlLi5hYWE1ZTMzNjcwM2EgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3g4Ni9r
dm0vbW11L21tdS5jCj4+PiArKysgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCj4+PiBAQCAtMjc4
LDE2ICsyNzgsMTUgQEAgc3RhdGljIGlubGluZSBib29sIGt2bV9hdmFpbGFibGVfZmx1c2hfcmVt
b3RlX3RsYnNfcmFuZ2Uodm9pZCkKPj4+ICAgICAgICByZXR1cm4ga3ZtX3g4Nl9vcHMuZmx1c2hf
cmVtb3RlX3RsYnNfcmFuZ2U7Cj4+PiAgICB9Cj4+Pgo+Pj4gLXZvaWQga3ZtX2ZsdXNoX3JlbW90
ZV90bGJzX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3Qgc3RhcnRfZ2ZuLAo+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IG5yX3BhZ2VzKQo+Pj4gK2ludCBrdm1fYXJj
aF9mbHVzaF9yZW1vdGVfdGxic19yYW5nZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IHN0YXJ0X2dm
biwgdTY0IHBhZ2VzKQo+Pj4gICAgewo+Pj4gICAgICAgIGludCByZXQgPSAtRU9QTk9UU1VQUDsK
Pj4+Cj4+PiAgICAgICAgaWYgKGt2bV94ODZfb3BzLmZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKQo+
Pj4gICAgICAgICAgICAgICAgcmV0ID0gc3RhdGljX2NhbGwoa3ZtX3g4Nl9mbHVzaF9yZW1vdGVf
dGxic19yYW5nZSkoa3ZtLCBzdGFydF9nZm4sCj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yX3BhZ2VzKTsKPj4+IC0g
ICAgIGlmIChyZXQpCj4+PiAtICAgICAgICAgICAgIGt2bV9mbHVzaF9yZW1vdGVfdGxicyhrdm0p
Owo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhZ2VzKTsKPj4gVGhpcyB3aWxsIGJlIGdvb2QgaWYgcGFyYW1l
dGVyIHBhZ2VzIGFsaWduZWQgd2l0aCBwYXJhbWV0ZXIga3ZtLgo+Pgo+IEFncmVlZCwgYnV0IHB1
bGxpbmcgJ3BhZ2VzJyBhYm92ZSBicmluZ3MgdGhlIGNoYXIgY291bnQgdG8gODMuIElmCj4gdGhh
dCdzIGFjY2VwdGFibGUsIEknbSBoYXBweSB0byBkbyBpdCBpbiB2Ny4KPiBIaSBSYWdoYXZlbmRy
YSwKCm5vIG5lZWQgdG8gcHVsbGluZyAncGFnZXMnIGFib3ZlLCBqdXN0IGRlbGV0ZSBvbmUgdGFi
LCBhbmQgYWRkIHNvbWUgCnNwYWNlIGJlZm9yZSB0aGUgcGFnZXMsIGp1c3QgbGlrZSB0aGUgb3Jp
Z2luYWwgYG5yX3BhZ2VzYCBwb3NpdGlvbi4KClRoYW5rcywKU2hhb3Fpbgo+IFRoYW5rIHlvdS4K
PiBSYWdoYXZlbmRyYQo+PiBSZXZpZXdlZC1ieTogU2hhb3FpbiBIdWFuZyA8c2hhaHVhbmdAcmVk
aGF0LmNvbT4KPj4+ICsKPj4+ICsgICAgIHJldHVybiByZXQ7Cj4+PiAgICB9Cj4+Pgo+Pj4gICAg
c3RhdGljIGdmbl90IGt2bV9tbXVfcGFnZV9nZXRfZ2ZuKHN0cnVjdCBrdm1fbW11X3BhZ2UgKnNw
LCBpbnQgaW5kZXgpOwo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9tbXUvbW11X2ludGVy
bmFsLmggYi9hcmNoL3g4Ni9rdm0vbW11L21tdV9pbnRlcm5hbC5oCj4+PiBpbmRleCBkMzlhZjU2
MzljZTkuLjg2Y2I4M2JiMzQ4MCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11
X2ludGVybmFsLmgKPj4+ICsrKyBiL2FyY2gveDg2L2t2bS9tbXUvbW11X2ludGVybmFsLmgKPj4+
IEBAIC0xNzAsOSArMTcwLDYgQEAgYm9vbCBrdm1fbW11X3Nsb3RfZ2ZuX3dyaXRlX3Byb3RlY3Qo
c3RydWN0IGt2bSAqa3ZtLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LCB1NjQgZ2ZuLAo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpbnQgbWluX2xldmVsKTsKPj4+Cj4+PiAtdm9pZCBrdm1fZmx1
c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBzdGFydF9nZm4sCj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZuX3QgbnJfcGFnZXMpOwo+Pj4gLQo+
Pj4gICAgLyogRmx1c2ggdGhlIGdpdmVuIHBhZ2UgKGh1Z2Ugb3Igbm90KSBvZiBndWVzdCBtZW1v
cnkuICovCj4+PiAgICBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX2ZsdXNoX3JlbW90ZV90bGJzX2dm
bihzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwgaW50IGxldmVsKQo+Pj4gICAgewo+Pj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaCBiL2luY2x1ZGUvbGludXgva3ZtX2hv
c3QuaAo+Pj4gaW5kZXggZTNmOTY4YjM4YWU5Li5hNzMxOTY3YjI0ZmYgMTAwNjQ0Cj4+PiAtLS0g
YS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKPj4+ICsrKyBiL2luY2x1ZGUvbGludXgva3ZtX2hv
c3QuaAo+Pj4gQEAgLTEzNTksNiArMTM1OSw3IEBAIGludCBrdm1fdmNwdV95aWVsZF90byhzdHJ1
Y3Qga3ZtX3ZjcHUgKnRhcmdldCk7Cj4+PiAgICB2b2lkIGt2bV92Y3B1X29uX3NwaW4oc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCBib29sIHlpZWxkX3RvX2tlcm5lbF9tb2RlKTsKPj4+Cj4+PiAgICB2
b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxicyhzdHJ1Y3Qga3ZtICprdm0pOwo+Pj4gK3ZvaWQga3Zt
X2ZsdXNoX3JlbW90ZV90bGJzX3JhbmdlKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuLCB1NjQg
cGFnZXMpOwo+Pj4KPj4+ICAgICNpZmRlZiBLVk1fQVJDSF9OUl9PQkpTX1BFUl9NRU1PUllfQ0FD
SEUKPj4+ICAgIGludCBrdm1fbW11X3RvcHVwX21lbW9yeV9jYWNoZShzdHJ1Y3Qga3ZtX21tdV9t
ZW1vcnlfY2FjaGUgKm1jLCBpbnQgbWluKTsKPj4+IEBAIC0xNDg2LDYgKzE0ODcsMTQgQEAgc3Rh
dGljIGlubGluZSBpbnQga3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnMoc3RydWN0IGt2bSAqa3Zt
KQo+Pj4gICAgfQo+Pj4gICAgI2VuZGlmCj4+Pgo+Pj4gKyNpZm5kZWYgX19LVk1fSEFWRV9BUkNI
X0ZMVVNIX1JFTU9URV9UTEJTX1JBTkdFCj4+PiArc3RhdGljIGlubGluZSBpbnQga3ZtX2FyY2hf
Zmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoc3RydWN0IGt2bSAqa3ZtLAo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwgdTY0IHBhZ2Vz
KQo+Pj4gK3sKPj4+ICsgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4+ICt9Cj4+PiArI2VuZGlm
Cj4+PiArCj4+PiAgICAjaWZkZWYgX19LVk1fSEFWRV9BUkNIX05PTkNPSEVSRU5UX0RNQQo+Pj4g
ICAgdm9pZCBrdm1fYXJjaF9yZWdpc3Rlcl9ub25jb2hlcmVudF9kbWEoc3RydWN0IGt2bSAqa3Zt
KTsKPj4+ICAgIHZvaWQga3ZtX2FyY2hfdW5yZWdpc3Rlcl9ub25jb2hlcmVudF9kbWEoc3RydWN0
IGt2bSAqa3ZtKTsKPj4+IGRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9r
dm0va3ZtX21haW4uYwo+Pj4gaW5kZXggZDZiMDUwNzg2MTU1Li44MDQ0NzBmY2NhYzcgMTAwNjQ0
Cj4+PiAtLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCj4+PiArKysgYi92aXJ0L2t2bS9rdm1fbWFp
bi5jCj4+PiBAQCAtMzY2LDYgKzM2NiwxOSBAQCB2b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxicyhz
dHJ1Y3Qga3ZtICprdm0pCj4+PiAgICB9Cj4+PiAgICBFWFBPUlRfU1lNQk9MX0dQTChrdm1fZmx1
c2hfcmVtb3RlX3RsYnMpOwo+Pj4KPj4+ICt2b2lkIGt2bV9mbHVzaF9yZW1vdGVfdGxic19yYW5n
ZShzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwgdTY0IHBhZ2VzKQo+Pj4gK3sKPj4+ICsgICAg
IGlmICgha3ZtX2FyY2hfZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uoa3ZtLCBnZm4sIHBhZ2VzKSkK
Pj4+ICsgICAgICAgICAgICAgcmV0dXJuOwo+Pj4gKwo+Pj4gKyAgICAgLyoKPj4+ICsgICAgICAq
IEZhbGwgYmFjayB0byBhIGZsdXNoaW5nIGVudGlyZSBUTEJzIGlmIHRoZSBhcmNoaXRlY3R1cmUg
cmFuZ2UtYmFzZWQKPj4+ICsgICAgICAqIFRMQiBpbnZhbGlkYXRpb24gaXMgdW5zdXBwb3J0ZWQg
b3IgY2FuJ3QgYmUgcGVyZm9ybWVkIGZvciB3aGF0ZXZlcgo+Pj4gKyAgICAgICogcmVhc29uLgo+
Pj4gKyAgICAgICovCj4+PiArICAgICBrdm1fZmx1c2hfcmVtb3RlX3RsYnMoa3ZtKTsKPj4+ICt9
Cj4+PiArCj4+PiAgICBzdGF0aWMgdm9pZCBrdm1fZmx1c2hfc2hhZG93X2FsbChzdHJ1Y3Qga3Zt
ICprdm0pCj4+PiAgICB7Cj4+PiAgICAgICAga3ZtX2FyY2hfZmx1c2hfc2hhZG93X2FsbChrdm0p
Owo+Pgo+PiAtLQo+PiBTaGFvcWluCj4+Cj4gCgotLSAKU2hhb3FpbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
