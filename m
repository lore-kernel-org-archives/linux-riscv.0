Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3CEC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 20:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0yskI4FrVdtLiJ88r/mwx4CGKzhvlg/BdWLw+uLNZUI=; b=oW2Ue0ihKo+FY0H+1M28G4tAZy
	UpUAgWOU+4GzPaXOP37f6DiX+0kK6vOCciviHD303S6qMKtMMi7sZPHFc5usxGiy0Nvpz3x881rck
	Zr+eQZSS2S+igq7Ur8/fzjJ2rekPfU3YfaT3zgeBbGoxbG6i2hgLzDezhKJbfUtPNt2MM316QuAMH
	g3QTPu5olDW0ELhXqiyI6prst75AYXOK3MJfOodYSZ4xfge8p8/50yk61Mn25GhCuVHerfYLR2dTV
	V+5qZShOEH5ljtytNJFLe4OP4wBt6ZEAdwW1ilErWWWzFietDcH6K2qpi543DKZJHgMi4LCiFZ90k
	AwFBzVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6yw0-0000000H6tm-291N;
	Tue, 14 May 2024 20:39:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6yvx-0000000H6sZ-3jKB
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 20:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715719175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ITMhM4TN9IG8BffABJDJLkO9uSK3vlKikLrGNKRSMoc=;
	b=HmAsc7Cth7Yr3ID2n6GHr1c3dMAd7bf3cslPgjFFN0RVdLyKauNArgAfEoyiWw6RdUlk5n
	tXkh/JRRh0AqCoPFGi9oegYhXyDW5TPfa0/Ta7Yl+GXZrHYjiQPbtw79EuJELPWn+w400i
	2rkU9xPUpCUqDi7W6peHZG9AB7tO6ZY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-qXW_9GHZN8Sw97L4gpQMhg-1; Tue, 14 May 2024 16:39:34 -0400
X-MC-Unique: qXW_9GHZN8Sw97L4gpQMhg-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-635f5006685so4177875a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 13:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715719173; x=1716323973;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ITMhM4TN9IG8BffABJDJLkO9uSK3vlKikLrGNKRSMoc=;
        b=H7jaynszDzc9wiO1fkoibSYCxk1xopo+niTwMazdoTfwd6u+ck76EbULfivqk8K/qV
         HrKj6j5QqV73iyfOTuOZW/HmQnDSb/S7r3iJ+FWMqksemEyDmrFOtnDDCyvjXTV3qFl1
         r1+XQoJP5jZ8aE/ntQZlniKPxLL+c7nHLO5ZE6CSo3Jm8OYhE7auw9sQYGiIQlxYP2Jg
         Rxvslrs1wjr3xnoJcpDkzBPpLimzIHqOf14B4uZ9gxXxbyJ4g8sW5ZO138dRwJs9O0gu
         Dt4x0m0SqnS8Op3tYZL/tkQbR8SyaTgB43L3zACvvX/lQOuGJY36G8jeOXcQRWA71UyE
         pvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV27nY2pw2/EIc+Fv4mPSfknCtpk/uuyfebsxedNEqOXHlVFkAQhXw44xT434Mug/U4vxfPryRFIzMpI4Sw9kA/DEEgsEtRmYz/Iuytqmc+
X-Gm-Message-State: AOJu0Yztiw4LVdCYGQN/5oljWEPt2Blsgx+5zJm3tW7nxFJEdJqNnj9A
	/VQwdJ/BsN2UJwncKeY4kYDmBjtApi50lgshaZzo9403Zd22zYAnjtzmj5GEZmigzOZ7Jmj+GQg
	1VfdlPrOJ0DDte7y4lIG3kSKZMK4BUeUq66RMv/BrqreZnlzptvsFcuFYR8eUET/Q1A==
X-Received: by 2002:a17:902:f54d:b0:1e2:aa62:2fbf with SMTP id d9443c01a7336-1ef4404a379mr183346895ad.45.1715719172843;
        Tue, 14 May 2024 13:39:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZIK2cFpjPQfSL+bLZI1/OS2KM8wi7MbrbKIssFODspkwohw7SVfmm+SN9dNhpzxuT3OOpIA==
X-Received: by 2002:a17:902:f54d:b0:1e2:aa62:2fbf with SMTP id d9443c01a7336-1ef4404a379mr183346485ad.45.1715719172282;
        Tue, 14 May 2024 13:39:32 -0700 (PDT)
Received: from [172.21.1.2] ([50.204.89.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d176fsm101887075ad.58.2024.05.14.13.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 13:39:31 -0700 (PDT)
Message-ID: <eb750e53-4b22-47a4-9306-d931628d12c3@redhat.com>
Date: Tue, 14 May 2024 22:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] riscv: mm: Take memory hotplug read-lock during
 kernel page table dump
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-6-bjorn@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240514140446.538622-6-bjorn@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_133938_044410_F2C2F366 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQuMDUuMjQgMTY6MDQsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gRnJvbTogQmrDtnJuIFTD
tnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IAo+IER1cmluZyBtZW1vcnkgaG90IHJlbW92ZSwg
dGhlIHB0ZHVtcCBmdW5jdGlvbmFsaXR5IGNhbiBlbmQgdXAgdG91Y2hpbmcKPiBzdGFsZSBkYXRh
LiBBdm9pZCBhbnkgcG90ZW50aWFsIGNyYXNoZXMgKG9yIHdvcnNlKSwgYnkgaG9sZGluZyB0aGUK
PiBtZW1vcnkgaG90cGx1ZyByZWFkLWxvY2sgd2hpbGUgdHJhdmVyc2luZyB0aGUgcGFnZSB0YWJs
ZS4KPiAKPiBUaGlzIGNoYW5nZSBpcyBhbmFsb2dvdXMgdG8gYXJtNjQncyBjb21taXQgYmYyYjU5
ZjYwZWUxICgiYXJtNjQvbW06Cj4gSG9sZCBtZW1vcnkgaG90cGx1ZyBsb2NrIHdoaWxlIHdhbGtp
bmcgZm9yIGtlcm5lbCBwYWdlIHRhYmxlIGR1bXAiKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCasO2
cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L21tL3B0
ZHVtcC5jIHwgMyArKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYyBiL2FyY2gvcmlzY3YvbW0vcHRkdW1w
LmMKPiBpbmRleCAxMjg5Y2M2ZDM3MDAuLjlkNWY2NTdhMjUxYiAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L21tL3B0ZHVtcC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9wdGR1bXAuYwo+IEBAIC02
LDYgKzYsNyBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L2VmaS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4
L2luaXQuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9tZW1vcnlfaG90cGx1Zy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+Cj4gICAj
aW5jbHVkZSA8bGludXgvcHRkdW1wLmg+Cj4gICAKPiBAQCAtMzcwLDcgKzM3MSw5IEBAIGJvb2wg
cHRkdW1wX2NoZWNrX3d4KHZvaWQpCj4gICAKPiAgIHN0YXRpYyBpbnQgcHRkdW1wX3Nob3coc3Ry
dWN0IHNlcV9maWxlICptLCB2b2lkICp2KQo+ICAgewo+ICsJZ2V0X29ubGluZV9tZW1zKCk7Cj4g
ICAJcHRkdW1wX3dhbGsobSwgbS0+cHJpdmF0ZSk7Cj4gKwlwdXRfb25saW5lX21lbXMoKTsKPiAg
IAo+ICAgCXJldHVybiAwOwo+ICAgfQoKUmV2aWV3ZWQtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxk
YXZpZEByZWRoYXQuY29tPgoKLS0gCkNoZWVycywKCkRhdmlkIC8gZGhpbGRlbmIKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
