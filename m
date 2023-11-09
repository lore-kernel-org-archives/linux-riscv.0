Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083EBC4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 08:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUdX14HQhMUH+9EHgFad94w6oZE8NeGalMqfV5gDSaY=; b=G878L2WLkSf3gM
	+4AndKV8BrLqqTLunl41XQ7M5qm8cIhVqmK0lEIJtJkzIV8zUxO4us5ZVysWylUfTYfwo/ZIwuo8H
	MB5FZz2l9i3LXLA/lLnCYS/GP/uLCUo4iCiC9SFG0T8WQV5mV6mFsIC63G7GzQAuLaL/TRxy1RDgZ
	MEvjuw/axD+z+2E5l0XOnV6YaykEmbjGTgtc+MxvDNi8ZuXPxzC2Jw67sGkY3qyLcPWQfSOc8Y9rq
	KPihcxH5Sk9IRPF9WDItFbHBGIyiVQE34VgejA0vF/RDg9pj9br7gZe4r6mW/S3o/kO4LwwhvFdnY
	23InEZanoc2N6p3t5CIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r10MN-005cGZ-06;
	Thu, 09 Nov 2023 08:25:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r10MK-005cF7-0L
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 08:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699518351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=odt/5xMXbjMgZlXR9oRA3wdW/adm1/gNuEpMj2VBGmk=;
	b=h6t51aDVckO6LpUI1GyE8omZ2pq8opmnPtP2GMv57EiXcIahPVLSN15JVFOPOVkCpR3Ss3
	rFV/DLAy6vcaljqiOZa0XGN/TCL/k3w1zXePZOySOftvU6rHKDk9afaL/fDX69dkZheYbj
	qQ1lEOoB9HLmb1kdNx1muWA2JckEyiY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-wFdmDkQyOXCY_LU7K4vfFw-1; Thu, 09 Nov 2023 03:25:47 -0500
X-MC-Unique: wFdmDkQyOXCY_LU7K4vfFw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-543f1c6dcaeso416672a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 00:25:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699518347; x=1700123147;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=odt/5xMXbjMgZlXR9oRA3wdW/adm1/gNuEpMj2VBGmk=;
        b=U0mLPON/N1unRdBSiBEdcFW/OhPcMioJ0ABo+QD+Bk2GovtZAo5x2PsQQZBV151qSW
         LHauDpe9L/qdKvqe/isMb0d2q4qeh0v56j4lwRnOpX7dgnCb530MXV3QobYuJefi3bNw
         CxAj3nlz0wJNF4oMqlmmQFyEA+SY5ep00l38XBzj+lNJybMkeeVpYYunZgpTtPGOCztg
         B0kI+ewyFLIzWHRyGyyp3O0nOJyWrHT6qsGvieYIKI8PvYZR8GmR+/X+ZqqW6dbLXBuV
         Z8tiPZMRez/yE0MEnDu+6ZFF0w7wv9sTgXTjC7b+6Lr4l5mNzP/ET+2Qb3A6F7DSvuAA
         b40g==
X-Gm-Message-State: AOJu0YwmxtDozAbfwUa9Xg25mNW8uGIVy67TE7UH3mZnhLAqK4kdn4ZP
	eHX/xK2/RPe2074doqrYAQE71JWmBUOgBn4mL3md7+DH9W2lFhfewZLb0z03VfX6A5fV1cPQcsW
	53lqwwusrss2xCxWaQTGYoejwcrw4
X-Received: by 2002:a50:9f4e:0:b0:540:ccde:5 with SMTP id b72-20020a509f4e000000b00540ccde0005mr3348766edf.37.1699518346872;
        Thu, 09 Nov 2023 00:25:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGc/8h7txNeYrJdeIJbeZLdKa5Ej0cD8Q6TYT5qVu8zzxOyeTh4hQuHi7CupWqz8J3PkKtaWg==
X-Received: by 2002:a50:9f4e:0:b0:540:ccde:5 with SMTP id b72-20020a509f4e000000b00540ccde0005mr3348751edf.37.1699518346536;
        Thu, 09 Nov 2023 00:25:46 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id j28-20020a508a9c000000b0053e3839fc79sm8007819edj.96.2023.11.09.00.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 00:25:45 -0800 (PST)
Message-ID: <143f5411-9fc0-4e88-9e35-6f3679b6f930@redhat.com>
Date: Thu, 9 Nov 2023 09:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/34] KVM: selftests: Introduce VM "shape" to allow tests
 to specify the VM type
To: Anish Moorthy <amoorthy@google.com>
Cc: ackerleytng@google.com, akpm@linux-foundation.org, anup@brainfault.org,
 aou@eecs.berkeley.edu, brauner@kernel.org, chao.p.peng@linux.intel.com,
 chenhuacai@kernel.org, david@redhat.com, dmatlack@google.com,
 isaku.yamahata@gmail.com, isaku.yamahata@intel.com, jarkko@kernel.org,
 kirill.shutemov@linux.intel.com, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, kvmarm@lists.linux.dev, liam.merwick@oracle.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, mail@maciej.szmigiero.name, maz@kernel.org,
 mic@digikod.net, michael.roth@amd.com, mpe@ellerman.id.au,
 oliver.upton@linux.dev, palmer@dabbelt.com, paul.walmsley@sifive.com,
 qperret@google.com, seanjc@google.com, tabba@google.com,
 vannapurve@google.com, vbabka@suse.cz, viro@zeniv.linux.org.uk,
 wei.w.wang@intel.com, willy@infradead.org, xiaoyao.li@intel.com,
 yilun.xu@intel.com, yu.c.zhang@linux.intel.com
References: <CAF7b7mrGYuyjyEPAesYzZ6+KDuNAmvRxEonT7JC8NDPsSP+qDA@mail.gmail.com>
 <20231108233723.3380042-1-amoorthy@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231108233723.3380042-1-amoorthy@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_002552_212322_84D9241D 
X-CRM114-Status: GOOD (  11.66  )
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

T24gMTEvOS8yMyAwMDozNywgQW5pc2ggTW9vcnRoeSB3cm90ZToKPiBPbiBXZWQsIE5vdiA4LCAy
MDIzIGF0IDk6MDDigK9BTSBBbmlzaCBNb29ydGh5IDxhbW9vcnRoeUBnb29nbGUuY29tPiB3cm90
ZToKPj4KPj4gVGhpcyBjb21taXQgYnJlYWtzIHRoZSBhcm02NCBzZWxmdGVzdHMgYnVpbGQgYnR3
OiBsb29rcyBsaWtlIGEgc2ltcGxlIG92ZXJzaWdodD8KPiAKPiBZdXAsIGZpeCBpcyBhIG9uZS1s
aW5lci4gUG9zdGVkIGJlbG93Lgo+IAo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vYWFyY2g2NC9wYWdlX2ZhdWx0X3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9hYXJjaDY0L3BhZ2VfZmF1bHRfdGVzdC5jCj4gaW5kZXggZWI0MjE3YjdjNzY4Li4w
OGE1Y2E1YmVkNTYgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2Fh
cmNoNjQvcGFnZV9mYXVsdF90ZXN0LmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9r
dm0vYWFyY2g2NC9wYWdlX2ZhdWx0X3Rlc3QuYwo+IEBAIC03MDUsNyArNzA1LDcgQEAgc3RhdGlj
IHZvaWQgcnVuX3Rlc3QoZW51bSB2bV9ndWVzdF9tb2RlIG1vZGUsIHZvaWQgKmFyZykKPiAgIAo+
ICAgCXByaW50X3Rlc3RfYmFubmVyKG1vZGUsIHApOwo+ICAgCj4gLQl2bSA9IF9fX192bV9jcmVh
dGUobW9kZSk7Cj4gKwl2bSA9IF9fX192bV9jcmVhdGUoVk1fU0hBUEUobW9kZSkpOwoKWWVzLCB0
aGlzIGlzIHNpbWlsYXIgdG8gdGhlIHMzOTAgcGF0Y2ggSSBzZW50IHllc3RlcmRheSAKKGh0dHBz
Oi8vcGF0Y2hldy5vcmcvbGludXgvMjAyMzExMDgwOTQwNTUuMjIxMjM0LTEtcGJvbnppbmlAcmVk
aGF0LmNvbS8pLgoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
