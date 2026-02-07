Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99263EE0AF1
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 22:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghpE+Hr9ZVCwV1FKF/t91IcT5wUPgyJuo1sYMXqfjtM=; b=u6DFMkdkEwfEs7
	3kTGXvwFCyIzXPL685lt3Ify3XlT1t06xF2zaOktIy3RtgvHjePdu5KpZqWSPtRiN7gKpkdFNmeEe
	noykGnNk38tz5GkfnPMa2TQWgmgE3AjIOsgfEpc+498yn1+dQE4bTMzPFwV0Q37Fv+9tZ9NNuTPm3
	QRZYxH2KwACZQcFCeyn+Zla7NHVzgqUPWaGXdOORqj9ZQRy8ypLnI863Jczf4fzst/gcsOXbFLdQA
	Pl/efZoVBA4+kQC1cs9o599o8/WxBzS3J+cX8BQjf/bMoOtzd720qB3oOi+nZm5E44RrydBaLNrUs
	CdyF3M/jYR5p2P542odQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vor8h-0000000CpNA-0hpm;
	Sat, 07 Feb 2026 22:50:55 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vor8e-0000000CpMn-3Fln
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 22:50:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so33768695e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 14:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770504651; x=1771109451; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guTUZAnKzmLJTo83FGB09sw8SSRh07aMEfZkMVMbC+c=;
        b=b7MqenIFDgxxZVgnesA7lZzKVkJhQVkp6aBvd+RzU0g1X8CsDUkud5dpIOyN3nc4dX
         cTUfgTuP0dKSpxPsk5JbnDDbSSOYTSrHqQsMbCibYpNFkb/y5r8sv8ISk5rvnOMe1CPe
         rBTC5q6i87YG+GAL2MijedfSmkjhOpb0PL2on9ebAKOmg5JraRnyimASv+2nrZBiBDM5
         MRhO3xOrUhFDj1Nvb5tKbkQ60XL7vRO5s3AcCOZqYz/Etvs2TAY4dL/TgePdqpYWymc3
         6GwEuI6ZYhwnouYsXJQrmIGx2dZxbs9i6V5iKxYd9UwYVPErc7Mzje00cwDholl87/7G
         8MCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770504651; x=1771109451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guTUZAnKzmLJTo83FGB09sw8SSRh07aMEfZkMVMbC+c=;
        b=lAyPl77uHZe9Bimd25zVLDzbufkj9u1gQkStleeIoPp+6FunrgiXxpMiQ71BVugLne
         mukjDWAwhopoDc/9EmcILRpB62iGb6u+8qftzbI9uLAmHrb932qKg/HKqhV/QJ+jauwZ
         pucDXWAWiDPBbvYoCc0t2bPPNthZF9FutGM6pbO2n1Fenw5cXPv7hJ5zBII3N7woe8t+
         Mx6rMY/TD/5mpDjwgg/W8gD5LVVY71JLm1MV26qMl0qssDDhXGup9wmNg3OcifTqzOLS
         X4PHiOFbX4pVDjmpJ4j22mDwlD7F03kjCbi8w8L2ph1IINnScvfzs1VeBYeOSeaxNGfw
         pidg==
X-Forwarded-Encrypted: i=1; AJvYcCVceOM/FJXWXT3oMxWoAP8HHDLUCGQ4mAk8lqkYt+lXfEx5gTv6xCtbnSHgnyJ6X/OJe5Dl/lXBVp/XEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIAp9u5/+/ocq1SP/UpZsHLiDMUE3pXra88/1PbXXJf05nNEvy
	qqAvamV52q0eUFaAmkmzpEiGlD+skmeUx265kbbSJdNMC9IuJK6efoIa
X-Gm-Gg: AZuq6aIKdCzDqds9f153br8UtRyHitsLQ+ZI6cL7GWhnMn9Kq9OVLsJWQH4VX4Eotdm
	yiltdMViXPNVdkco2FNLBTIU4K6eiR6Y0JsPB1MDYJ7IQptkU97hCT3Fgv1WZPzdAgjDhS3KL9Q
	4IYkzI8y5jTi6GRqdUd5DIIjlOCDxEJK3RguamRyCWbRcr+hQFpsfJEZl7KiZW/xHsOdbs6v0iM
	njOIlKrlTu7P48hjq+7FgOLBd9KePzGQXQpS9fHhFWRAB8qTJ93iKcAiEFZsluCISeFRmMVKEkf
	EsSi/Ahw7a2CyyKOjNEM/zX/5GVZLJAGllwiSNKkDK+KpB71Xz+88q/yr20kg/I2g9Ch3srhY86
	bCcOBGL+B8jMtB6CTe5g9HtwqoSvRxyl5f7hNuksIOLhapoBZINdz8n4HNUbFNEg1MqRcRk8uOE
	inHZSqsDHddSFT4o3PhGlVopLIXnSRGHRXm75nZPkx1WIifAofd0TaRhtDiK+MYIE1l6Gv46o9C
	Wfv7oZgoFEI7gk=
X-Received: by 2002:a05:600c:3f08:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-483201dcfc4mr103983235e9.2.1770504650500;
        Sat, 07 Feb 2026 14:50:50 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm16866971f8f.28.2026.02.07.14.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 14:50:48 -0800 (PST)
Message-ID: <110aedf7-9f31-4552-b772-395433d7bdb3@gmail.com>
Date: Sat, 7 Feb 2026 22:50:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 11/17] mm/hugetlb: Remove fake head pages
Content-Language: en-GB
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Kiryl Shutsemau <kas@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-12-kas@kernel.org>
 <907ff793-9b02-4a22-a85e-2873246f6402@gmail.com>
 <412359f2-ecfb-498a-9717-f0a442abd3f7@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <412359f2-ecfb-498a-9717-f0a442abd3f7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_145052_833656_A07E049D 
X-CRM114-Status: UNSURE (   8.52  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAwNy8wMi8yMDI2IDIxOjI1LCBEYXZpZCBIaWxkZW5icmFuZCAoQXJtKSB3cm90ZToKPiBP
biAyLzcvMjYgMjE6MTYsIFVzYW1hIEFyaWYgd3JvdGU6Cj4+Cj4+PiArCj4+PiDCoCBpbnQgX19t
ZW1pbml0IHZtZW1tYXBfcG9wdWxhdGVfaHZvKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQg
bG9uZyBlbmQsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaW50IG5vZGUsIHVuc2lnbmVkIGxvbmcgaGVhZHNpemUpCj4+PiDCoCB7Cj4+PiArwqDC
oMKgIHVuc2lnbmVkIGxvbmcgbWFkZHIsIGxlbiwgdGFpbF9wZm47Cj4+PiArwqDCoMKgIHVuc2ln
bmVkIGludCBvcmRlcjsKPj4+IMKgwqDCoMKgwqAgcHRlX3QgKnB0ZTsKPj4+IC3CoMKgwqAgdW5z
aWduZWQgbG9uZyBtYWRkcjsKPj4+ICsKPj4+ICvCoMKgwqAgbGVuID0gZW5kIC0gYWRkcjsKPj4+
ICvCoMKgwqAgb3JkZXIgPSBpbG9nMihsZW4gKiBzaXplb2Yoc3RydWN0IHBhZ2UpIC8gUEFHRV9T
SVpFKTsKPj4KPj4KPj4gVGhpcyBkb2VzbnQgd29yayBmb3IgQVJNLiBGb3IgbGVuID0gMzIgKDJN
QiBjb250aWd1b3VzLVBURSBodWdldGxiIG9uIGFybTY0KToKPj4gaWxvZzIoMzIgKiA2NCAvIDY1
NTM2KSA9IGlsb2cyKDIwNDggLyA2NTUzNikgPSBpbG9nMigwKSB3aGljaCBpcyB1bmRlZmluZWQu
Cj4gCj4gSFZPIHNob3VsZCBub3QgYmUgcG9zc2libGUgZm9yIHRoYXQgc2l6ZSwgYW5kIHdlIHNo
b3VsZCBuZXZlciByZWFjaCB0aGF0IHBvaW50LCBubz8KPiAKPiBSZW1lbWJlciB0aGF0IGZvciBI
Vk8sIHRoZSBtZXRhZGF0YSBtdXN0IHNwYW4gYXQgbGVhc3QgdHdvIHBhZ2VzLgo+IAoKQWggeWVh
aCB0aGF0cyByaWdodCwgaWdub3JlIG1lLiBJdHMgYWxzbyBjaGVja2VkIGluIGh1Z2V0bGJfdm1l
bW1hcF9vcHRpbWl6YWJsZV9zaXplLApzbyBpdHMgYWxsIGdvb2QuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
