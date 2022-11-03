Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95AAC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BenfIAbA4XZ4TQIKx5ZaneSjUGCeGpHaXQCSWInUnJU=; b=N52LHcXER+XO6k
	9yb1IsIHX8tLCEGeNRquzwT+9+VeFdcYmFnBURj3RwFgzL3q3K/PtlKMKluhtQyY7ZPzU6qNjM/AD
	xYdNS25GsrWpAuvwkEyqWRdwHdQ6xv3wu6CX+jRgE3nOpqa4rl6xHYHfDcyXTvhiNZ1n4q8m1jyp0
	tJWdbLK4gA6CPJCGp0YzbzDEuBxtWr2Or+Fa/rt8xZJ4D6y4Rk43PTmdB+02Qd5SZE3Su46oWKW1I
	drocT2iswEtBLhOkzzI4V/sNkP7cEro3sC16Qw9pJzF8jr/dRCsD8aGiRo36pT/vxl4w93OLbhn0M
	J+SCSf0EArv7jnIm8sXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqcN2-000TTz-7t; Thu, 03 Nov 2022 15:43:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqc8I-000N3a-JX
	for linux-riscv@lists.infradead.org; Thu, 03 Nov 2022 15:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667489273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xCSLioTknXwq+ek9x4fiuIn1LdVr/LliQOq4IIs2CLE=;
	b=UlUeIPFghiiYsdAzdI7QI8/Es18nEexMjJc8+7ol0CpkKuFPaj2Js5ERkKmDlrN/j1uD9+
	rVW7cDqusq3FABPutxi70/v6hNPNT4fxABLh0BKyzhhyhlP0Ct1Su+AFqMQA8HcmaIrZzC
	IPwN0Oq5I3Q6xS6svsiMUtUvV90ZQN4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-zYvFkMROMJiSbyVo-DlDIQ-1; Thu, 03 Nov 2022 11:27:52 -0400
X-MC-Unique: zYvFkMROMJiSbyVo-DlDIQ-1
Received: by mail-ej1-f69.google.com with SMTP id hs34-20020a1709073ea200b007ad86f91d39so1481591ejc.10
        for <linux-riscv@lists.infradead.org>; Thu, 03 Nov 2022 08:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCSLioTknXwq+ek9x4fiuIn1LdVr/LliQOq4IIs2CLE=;
        b=0JDhYfA3LuduGn/pbPbE45vuHEMD9KCIYB4zwslpqj3TihOTXlEWTSmXOwqk/4eOMt
         Yd/C+Cm/tiLLi+R3/Ed+HSoVaYuwHJR09o3Ivei7Fp/Gq3F1VsQfo0bKcJ57lxsOK1Ba
         JF0a9aToKXCAc9QnrX0km9NuU6nM5fnX0rh9bG+ofO5XfZJ2DXXKTbIbx4h5Xce4zMGx
         UGIH11CpUjxiAh/kmEXNwXCK1nFM8MCbNFSj52mQuSWz+OyCE0VPoxzxwctcpAue94t5
         ivfHiLfxXWAH2C+OII+t6+NASCGyllaQm99cKHVYjjxN6i/Mahc8HR1KHaC/vHB94RC2
         4GYA==
X-Gm-Message-State: ACrzQf27i8h06LMtgJC0xuaJxVIHmDFiFRoK6gIAXyQcKvGMAQEL/aqb
	6varZjzfmOCxUA0GLaRu5f4ZX1WAETQ+fQzmoMxBrmEXljyaJXpgRwQ/TOHe6M+IX7vpeehCkQf
	DxlL7GLvTsY+my+3iDL9iLxCm/xVy
X-Received: by 2002:a17:907:2dab:b0:78d:fc4b:7e31 with SMTP id gt43-20020a1709072dab00b0078dfc4b7e31mr28147780ejc.531.1667489270834;
        Thu, 03 Nov 2022 08:27:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7u9a9PiI+1WXKEKW1T9dxImTSTFhIKArq6MPRri6hHxMVLdP9Ji+9iwit/AYCn6duMyFkDdg==
X-Received: by 2002:a17:907:2dab:b0:78d:fc4b:7e31 with SMTP id gt43-20020a1709072dab00b0078dfc4b7e31mr28147732ejc.531.1667489270591;
        Thu, 03 Nov 2022 08:27:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c? ([2001:b07:6468:f312:1c09:f536:3de6:228c])
        by smtp.googlemail.com with ESMTPSA id 15-20020a508e4f000000b00463bc1ddc76sm657729edx.28.2022.11.03.08.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 08:27:49 -0700 (PDT)
Message-ID: <82df23f2-b049-8bee-8bb8-608645b918d8@redhat.com>
Date: Thu, 3 Nov 2022 16:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 00/44] KVM: Rework kvm_init() and hardware enabling
To: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Atish Patra <atishp@atishpatra.org>,
 David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Chao Gao <chao.gao@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
References: <20221102231911.3107438-1-seanjc@google.com>
 <b37267a9-c0b4-9841-71af-d8eab9baeb60@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <b37267a9-c0b4-9841-71af-d8eab9baeb60@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_082754_996985_7022E7F9 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

T24gMTEvMy8yMiAxMzowOCwgQ2hyaXN0aWFuIEJvcm50cmFlZ2VyIHdyb3RlOgo+PiBUaGVyZSBh
cmUgYnVnIGZpeGVzIHRocm91Z2hvdXQgdGhpcyBzZXJpZXMuwqAgVGhleSBhcmUgbW9yZSBzY2F0
dGVyZWQgdGhhbgo+PiBJIHdvdWxkIHVzdWFsbHkgcHJlZmVyLCBidXQgZ2V0dGluZyB0aGUgc2Vx
dWVuY2luZyBjb3JyZWN0IHdhcyBhIGdpZ2FudGljCj4+IHBhaW4gZm9yIG1hbnkgb2YgdGhlIHg4
NiBmaXhlcyBkdWUgdG8gbmVlZGluZyB0byBmaXggY29tbW9uIGNvZGUgaW4gb3JkZXIKPj4gZm9y
IHRoZSB4ODYgZml4IHRvIGhhdmUgYW55IG1lYW5pbmcuwqAgQW5kIHdoaWxlIHRoZSBidWdzIGFy
ZSBvZnRlbiBmYXRhbCwKPj4gdGhleSBhcmVuJ3QgYWxsIHRoYXQgaW50ZXJlc3RpbmcgZm9yIG1v
c3QgdXNlcnMgYXMgdGhleSBlaXRoZXIgcmVxdWlyZSBhCj4+IG1hbGljaW91cyBhZG1pbiBvciBi
cm9rZW4gaGFyZHdhcmUsIGkuZS4gYXJlbid0IGxpa2VseSB0byBiZSBlbmNvdW50ZXJlZAo+PiBi
eSB0aGUgdmFzdCBtYWpvcml0eSBvZiBLVk0gdXNlcnMuwqAgU28gdW5sZXNzIHNvbWVvbmUgX3Jl
YWxseV8gd2FudHMgYQo+PiBwYXJ0aWN1bGFyIGZpeCBpc29sYXRlZCBmb3IgYmFja3BvcnRpbmcs
IEknbSBub3QgcGxhbm5pbmcgb24gc2h1ZmZsaW5nCj4+IHBhdGNoZXMuCj4+Cj4+IFRlc3RlZCBv
biB4ODYuwqAgTGlnaHRseSB0ZXN0ZWQgb24gYXJtNjQuwqAgQ29tcGlsZSB0ZXN0ZWQgb25seSBv
biBhbGwgCj4+IG90aGVyIGFyY2hpdGVjdHVyZXMuCj4gCj4gU29tZSBzbmlmZiB0ZXN0cyBzZWVt
IHRvIHdvcmsgb2sgb24gczM5MC4KClRoYW5rcy4gIFRoZXJlIGFyZSBqdXN0IGEgY291cGxlIG5p
dHMsIGFuZCBNSVBTL1BQQy9SSVNDLVYgaGF2ZSB2ZXJ5IApzbWFsbCBjaGFuZ2VzLiAgRmVlbCBm
cmVlIHRvIHNlbmQgbWUgYSBwdWxsIHJlcXVlc3Qgb25jZSBNYXJjIGFja3MuCgpQYW9sbwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
