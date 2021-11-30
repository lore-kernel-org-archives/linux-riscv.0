Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C82C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k7XSc6yaC2YBh3Nkylo6IIBCI35uaibNGyABz7WwFSk=; b=oQhaNxJierma6l
	fnZtB2l5d2mjq/RTtXT3qOXWI8KbZbewxB5eZnVW8CGiCmVjaod5UTsVxUtl1t8cepJlhQ7i4Fytb
	AQnqM1H017n/dmriaVHtS78j+Ec+ZxGmUfyNo4Oy2rdOxMIF3ZOZLMQTMlffQQxMY0acObYhO6unN
	iRuMJb8Evd+qtCk3EzvZX5N41sA2zkpZQkhCu9SBnpyBMWpdWi6jPZNNn48y/P1V/tpV0DxuX4sJt
	dXhuhxmId3R/nwmy47HHaCfOK5m+T46oiMmfx+b8JskPBuM5voAz3HIx0EE7BezyClwUjU76W4WBu
	BUFd7WM2GgLCNlxP4dUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms5fs-0065Zx-N1; Tue, 30 Nov 2021 16:08:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms5fZ-0065Un-S4; Tue, 30 Nov 2021 16:07:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso19954110wms.2; 
 Tue, 30 Nov 2021 08:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3a/iKsjufsiAbrGQuBxVCPIZkwax7Upszpd7LsuYfCk=;
 b=ZI1KOydZ+qECl1hqlo+ZNsiRXNRPZ13T8K4/YJ6MoYcN5dN+LuRV3/IQ1KEUDcU0Vw
 Vjwuujw+ZbUsGVxN5Eebh9Z/n26MQhlQ8ehFqn4X/Hvewkjsw0COQl31001ZyKeNY6Mz
 nuTJWwgKAs8576y3o//cH27vL1awmnJNNBybZbxu9KQow1/gfFg/9iui3rvWtw7fesoJ
 uB58hek4VV+WXZz0jg3T4XAAPkiLiwUG82CWXZnawo+wiwrKp8M/XU1sqUquvCA81ibB
 cUgcgGRDa/rJerB9C4tYdPDW2u0xS9fOOZeboK+o+lFF3SNVDw/1NfjIHFtj7/tD9ggY
 AZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3a/iKsjufsiAbrGQuBxVCPIZkwax7Upszpd7LsuYfCk=;
 b=UfuQpegUAJZqE+cud3YYQ/olZhj9ErM6RvFTIiQcNEIn80OrwYCv20UUQ+QQHk2+cs
 ZvL7TzffeRhzyHoXxGQlnNU1Y+PBYJ3R1wV9E3JGRVEvqQHpMTeK2WfALN/BolD0oTb8
 1HUT8jkBTYuVa1Se2tW4wUIHTia3b2SAbJaI3FhIx2mes6CRfQoitbZ6AaZ/4qPJArpy
 /nn1N2Vv91XcqlMh8Hv6JYMMrUNDoC5r2sduuG8B4pHXi5BqZ84NA+YWQPEHyj4n6cCu
 KJMqDKm9ze8ZXUbKWWrJwwFA3BnCJWujbFxL36b4DT+g726xg11p0RO/omr/OPzovMXY
 b9bg==
X-Gm-Message-State: AOAM533u2VybR7PpRsA7917heMcuIH84Gm1RftEHw31bOCHKQytKf2X7
 eWd3YD0b8ozz3GAVQK5QFSs=
X-Google-Smtp-Source: ABdhPJx5Dhy4cMIe37LwwIVlRqxg9qfG8bQ1tYjpplU8k4zyM3CqmxKNVQMvmem1SJ3HAhFFd8xyTQ==
X-Received: by 2002:a05:600c:3489:: with SMTP id
 a9mr411960wmq.120.1638288467956; 
 Tue, 30 Nov 2021 08:07:47 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id m36sm3269698wms.25.2021.11.30.08.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 08:07:47 -0800 (PST)
Message-ID: <3f5adff7-f321-0688-c817-84975ebd3d14@redhat.com>
Date: Tue, 30 Nov 2021 17:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 10/43] KVM: arm64: Move vGIC v4 handling for WFI out
 arch callback hook
Content-Language: en-US
To: Marc Zyngier <maz@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Anup Patel <anup.patel@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra
 <atish.patra@wdc.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Claudio Imbrenda
 <imbrenda@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Matlack <dmatlack@google.com>, Oliver Upton <oupton@google.com>,
 Jing Zhang <jingzhangos@google.com>
References: <20211009021236.4122790-1-seanjc@google.com>
 <20211009021236.4122790-11-seanjc@google.com>
 <9236e715-c471-e1c8-6117-6f37b908a6bd@redhat.com>
 <875ytjbxpq.wl-maz@kernel.org>
 <be1cf8c7-ed87-b8eb-1bca-0a6c7505d7f8@redhat.com>
 <3490c50e-50d2-f906-3383-b87e14b14fab@redhat.com>
 <4826a7e2dbecc5d57323d18d725d6d69@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <4826a7e2dbecc5d57323d18d725d6d69@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_080749_958275_22422098 
X-CRM114-Status: GOOD (  18.80  )
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

T24gMTEvMzAvMjEgMTM6MDQsIE1hcmMgWnluZ2llciB3cm90ZToKPj4+Cj4+PiBJIGhhdmUgInF1
ZXVlZCIgaXQsIGJ1dCB0aGF0J3MganVzdCBteSBxdWV1ZSAtIGl0J3Mgbm90IG9uIGtlcm5lbC5v
cmcgCj4+PiBhbmQgaXQncyBub3QgZ29pbmcgdG8gYmUgaW4gNS4xNiwgYXQgbGVhc3Qgbm90IGlu
IHRoZSBmaXJzdCBiYXRjaC4KPj4+Cj4+PiBUaGVyZSdzIHBsZW50eSBvZiB0aW1lIGZvciBtZSB0
byByZWJhc2Ugb24gdG9wIG9mIGEgZml4LCBpZiB5b3Ugd2FudCAKPj4+IHRvIHNlbmQgdGhlIGZp
eCB0aHJvdWdoIHlvdXIga3ZtLWFybSBwdWxsIHJlcXVlc3QuwqAgSnVzdCBDYyBtZSBzbyAKPj4+
IHRoYXQgSSB1bmRlcnN0YW5kIHdoYXQncyBnb2luZyBvbi4KPj4KPj4gU2luY2UgYSBtb250aCBo
YXMgcGFzc2VkIGFuZCBJIGRpZG4ndCBzZWUgYW55dGhpbmcgcmVsYXRlZCBpbiB0aGUKPj4gS1ZN
LUFSTSBwdWxsIHJlcXVlc3RzLCBJIGFtIGdvaW5nIHRvIHF1ZXVlIHRoaXMgcGF0Y2guwqAgQW55
IGNvbmZsaWN0cwo+PiBjYW4gYmUgcmVzb2x2ZWQgdGhyb3VnaCBhIGt2bWFybS0+a3ZtIG1lcmdl
IG9mIGVpdGhlciBhIHRvcGljIGJyYW5jaAo+PiBvciBhIHRhZyB0aGF0IGlzIGRlc3RpbmVkIHRv
IDUuMTYuCj4gCj4gQ2FuIHlvdSBhdCBsZWFzdCBzcGVsbCBvdXQgKndoZW4qIHRoaXMgd2lsbCBs
YW5kPwoKSXQgd2lsbCBiZSBpbiBrdm0vbmV4dCBhcyBzb29uIGFzIEkgZmluaXNoIHJ1bm5pbmcg
dGVzdHMgb24gaXQsIHdoaWNoIAptYXkgdGFrZSBhIGNvdXBsZSBtb3JlIGRheXMgYmVjYXVzZSBJ
J20gdXBkYXRpbmcgbXkgbWFjaGluZXMgdG8gbmV3ZXIgCm9wZXJhdGluZyBzeXN0ZW1zLgoKPiBU
aGVyZSBpcywgaW4gZ2VuZXJhbCwgYSBjZXJ0YWluIGxhY2sgb2YgY2xhcml0eSBhYm91dCB3aGF0
IHlvdSBhcmUgcXVldWluZywKPiB3aGVyZSB5b3UgYXJlIHF1ZXVpbmcgaXQsIGFuZCB3aGF0IHJl
bGVhc2UgaXQgdGFyZ2V0cy4KCk9rLCB0aGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLiAgR2VuZXJh
bGx5IHNwZWFraW5nOgoKLSBrdm0vbWFzdGVyIGlzIHN0dWZmIHRoYXQgaXMgbWVyZ2VkIGFuZCB3
aWxsIGJlIGluIHRoZSBuZXh0IC1yYywgcmlnaHQgCm5vdyA1LjE2LXJjNC4gIEl0IHNob3VsZG4n
dCBldmVyIHJld2luZCAodGhvdWdoIGl0IG1heSBoYXBwZW4sIGl0IGlzIHJhcmUpCgotIGt2bS9u
ZXh0IGlzIHN0dWZmIHRoYXQgaXMgbWVyZ2VkIGFuZCB3aWxsIGJlIGluIHRoZSBuZXh0IG1lcmdl
IHdpbmRvdywgCnJpZ2h0IG5vdyA1LjE3LiAgSXQgYWxzbyBzaG91bGRuJ3QgcmV3aW5kLgoKLSBr
dm0vcXVldWUgaXMgc3R1ZmYgdGhhdCB0aGUgc3VibWl0dGVyIHNob3VsZG4ndCBjYXJlIGFib3V0
LCBhbmQgdGhhdCAKb3RoZXIgcGVvcGxlIHNob3VsZCBvbmx5IGNhcmUgYWJvdXQgdG8gY2hlY2sg
Zm9yIGNvbmZsaWN0cy4gIFdoZW4gSSBzYXkgCkkgInF1ZXVlZCIgYSBwYXRjaCBpdCBnb2VzIGlu
IGt2bS9xdWV1ZSwgYW5kIHRoZXJlJ3MgdGltZSB0byByZW1vdmUgaXQgCmlmIHNvbWV0aGluZyBi
cmVha3MuCgpSZWdhcmRpbmcgdGhpcyBzZXJpZXM6CgotIEkgYW0gcXVldWluZyBpdCB1cCB0byB0
aGlzIHBhdGNoCgotIEkgYW0gcXVldWluZyBpdCB0byBrdm0vbmV4dCwgbWVhbmluZyBpdCB0YXJn
ZXRzIDUuMTcKCi0gaXQgbG9va3MgbGlrZSB0aGUgbmV4dCBvbmUgKDExLzQzKSB0cmlnZ2VycyBh
IGtub3duIEFNRCBlcnJhdGEsIHNvIEknbSAKaG9sZGluZyBvbiB0aGUgcmVzdCB1bnRpbCB3ZSB1
bmRlcnN0YW5kIGlmIGl0IGFjdHVhbGx5IGRvZXMsIGFuZCBpZiBzbyAKaWYgQU1EIEFWSUMgaXMg
ZG9vbWVkLiAgRm9yIHRoZSB0aW1lIGJlaW5nLCBpdCB3aWxsIHN0YXkgaW4ga3ZtL3F1ZXVlLgoK
UGFvbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
