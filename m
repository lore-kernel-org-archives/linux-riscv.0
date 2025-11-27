Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385A2D111A8
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 21:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYB3OR/8V05GohLtu6iqbwY6k9cMG1Dsg20WQtyn50s=; b=KrZw5LjtIKVet2
	qqIcM45X8fwxJ1irBx/PLic8VKgCuVjJggY2jHMMWKD8s9AV2Ie7NDtWK8P9hVQr4W4NEaaKNkHSl
	JJKFO09xe40Tz13IjA8x96sjthLXy0ly0IG1XhY2VPEUrS9x/Xj82mTFKcRo4QsajKPX3KyIMNWDO
	msR35otYeTKNPpQjFeXsalHY4hIKfwGeRc19tDX1OIxUmex/j5m8N4CMxQ+7Qb3NpxxHdju+0ogz0
	EQIK99W/q0kIgpchwnxB5NOlzzrnqYkn0yiO48G3501Sbp+F7FhriWwWVfJQnZr6cQx3TmPLLDTru
	1F+nMk7LZtY3iMlIS7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOjv6-0000000HFHh-1nJ3;
	Thu, 27 Nov 2025 21:52:56 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOjv3-0000000HFGy-4762
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 21:52:55 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8843ebf2facso15684616d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 13:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764280372; x=1764885172; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jttLJ8TWGePu+ngSo1n4o5hp2pzXFGAv2t0XowsTZMg=;
        b=f+yrPyopZP0fkW1LQIGWt4Fi8IH5AgO8OEwbVUPtCWKMOPKzLabNst01Q8FDwht9qm
         h0fQceivTh6onPumDYP/9TOlwHjTsgJCL3qP0lxPjG1x9/eL3lmm45m1oEo3gUbvPvHK
         X/trKisgZ8xyFTi1wLVrO7wfUGNu4DXDaBodxAz+s4WDEhw3oGgiSo9Arzx8r6E1jNLo
         rgwRr946rZwvVw8iF8hNkn7WpKVJp73ltZTHIyAz7rISDgX7M7iPVxqkpeaFx+qGDPWe
         fQQeU3LAkgLHkHa3gu8BXSastNqtfk2bZy+HpGClppaeLSKeTOmBkb4O1f+eUO7fv09H
         arAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764280372; x=1764885172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jttLJ8TWGePu+ngSo1n4o5hp2pzXFGAv2t0XowsTZMg=;
        b=t6C6mJ4NePp2d9w/s4H6MeyvKKXvSjv2LyxACln5JhAeENQwpLJTsRUF8n1dj4Tnqi
         sIyFUXWacVnteoTAWsNCZ+EwqxF5Opjvai88jIYCQpDpd/iZ7o5zoakiNYvAnqgi5ZsM
         seqFomN5+RRqdKHN6+4nfZYaU+BwbvLc1riX9lLbbVDjWON4VCcj7wC2+MvCGhTuIDbJ
         kNw8Y9a7pCM1oavRu/vUrkZE0cJ3ho5ARc2OhKP1GDMgiM/H40aNvf3dllcWLRMYW0CD
         37vHfceP71sW04mRhXGPHRvKE/PAj1TRKPqqFao4Ly0WupNbxPwG0xoFep5w6N76K1NM
         YqzA==
X-Forwarded-Encrypted: i=1; AJvYcCWXkaRKZgjQ04ZPf1hfOQ9UA0x+KxRhwlEREbyR7xTjkTC5oDneQ2mnWEyVvIdOzs4/SMp7PH86TAGG9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4zG4HEYlTUdRmm6uB6gKZCV6czYzHJENN0x8v9ME49wC+0n7T
	D/SMh8CVApOCc+uYoSx8M3XNvazOLhIvOSY8HD3EXh8rew1c3BQjVRc83v994jfv5Mae9+jplo2
	93cwohuNo6A0t/PLh1mjP6+T866FExC4=
X-Gm-Gg: ASbGncuwwFLtEMgHko34m3HZquRe75e+8QrT/4A5lMELdmQZO/Jcn+6fMwW2vGZJmmv
	77o2cBLGzka802ZOtgtIZknlb6ZTiCylzNLM9CQ8zJUxogNcx7tDqMKx521MwygF86WShT2u9JE
	m+R3DSanzM3gqEFDsPi1nxobfzJF1leaVvRRmO82/NIgcOH/7k2sC6nOBbn4a8KQen0b/Hv5H7X
	Ycipt8vfS28NZVBwF3NDmx0BdkwVdmfpBDfPHyO2kGhMAHxcfrC7ndO6ry75JiUdS9LuQ==
X-Google-Smtp-Source: AGHT+IGi53ssJfVFEVeCKpbOH4PM/Uba/gyP2VL/mpIj2xLrn6No0jDJl3wOawm61ht0VMTz1HcUV32B95MPtil1ISg=
X-Received: by 2002:a05:6214:19c9:b0:880:49bd:e217 with SMTP id
 6a1803df08f44-8847c486a0bmr364162506d6.10.1764280372486; Thu, 27 Nov 2025
 13:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20251127011438.6918-1-21cnbao@gmail.com> <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org> <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4zWGYiu1wv=D7bV5zd0h8TEHTCARhyu_9_gL36PiNvbHQ@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 28 Nov 2025 05:52:40 +0800
X-Gm-Features: AWmQ_blYpw-GPSWAvHSSwIXD1PKL1aIx4iCUo78DT2gXpdF1CZ018OhwLE5_XJY
Message-ID: <CAGsJ_4wvaieWtTrK+koM3SFu9rDExkVHX5eUwYiEotVqP-ndEQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_135254_025012_C7C01E56 
X-CRM114-Status: GOOD (  11.34  )
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

T24gRnJpLCBOb3YgMjgsIDIwMjUgYXQgNDoyOeKAr0FNIEJhcnJ5IFNvbmcgPDIxY25iYW9AZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDI4LCAyMDI1IGF0IDM6NDPigK9BTSBNYXR0
aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gW2Ryb3BwaW5n
IGluZGl2aWR1YWxzLCBsZWF2aW5nIG9ubHkgbWFpbGluZyBsaXN0cy4gIHBsZWFzZSBkb24ndCBz
ZW5kCj4gPiB0aGlzIGtpbmQgb2YgdGhpbmcgdG8gc28gbWFueSBwZW9wbGUgaW4gZnV0dXJlXQoK
QXBvbG9naWVzLCBJIG1pc3NlZCB0aGlzIG9uZS4KClRoZSBvdXRwdXQgY29tZXMgZnJvbSAuL3Nj
cmlwdHMvZ2V0X21haW50YWluZXIucGwuIElmIHlvdSB0aGluayB0aGUgZ3JvdXAgaXMKdG9vIGxh
cmdlLCBJIGd1ZXNzIHdlIHNob3VsZCBhdCBsZWFzdCBpbmNsdWRlIFN1cmVuLCBMb3JlbnpvLCBE
YXZpZCwgYW5kCmEgZmV3IG90aGVycyBpbiB0aGUgZGlzY3Vzc2lvbj8KClsuLi5dCgo+Cj4gPgo+
ID4gVGhpcyB1c2UgY2FzZSBhbHNvIG1hbmFnZXMgdG8gZ2V0IHV0dGVybHkgaHVuZy11cCB0cnlp
bmcgdG8gZG8gcmVjbGFpbQo+ID4gdG9kYXkgd2l0aCB0aGUgbW1hcF9sb2NrIGhlbGQuICBTTyBp
dCBtYW5pZmVzdHMgc29tZXdoYXQgc2ltaWxhcmx5IHRvCj4gPiB5b3VyIHByb2JsZW0gKGV2ZXJ5
Ym9keSBlbmRzIHVwIGJsb2NrZWQgb24gbW1hcF9sb2NrKSBidXQgaXQgaGFzIGEKPiA+IHJhdGhl
ciBkaWZmZXJlbnQgcm9vdCBjYXVzZS4KCklmIEkgdW5kZXJzdGFuZCB0aGUgdXNlIGNhc2UgY29y
cmVjdGx5LCBJIGJlbGlldmUgcmV0cnlpbmcgd2l0aCB0aGUgcGVyLVZNQQpsb2NrIHdvdWxkIGFs
c28gYmUgdmVyeSBoZWxwZnVsLiBQcmV2aW91c2x5LCB3ZSBhbHdheXMgcmV0cmllZCB1c2luZwpt
bWFwX2xvY2ssIHdoaWNoIGNhbiBiZSBkaWZmaWN1bHQgdG8gYWNxdWlyZSB1bmRlciBoZWF2eSBj
b250ZW50aW9uLCBsZWFkaW5nCnRvIGxvbmcgbGF0ZW5jeSB3aGlsZSB0aGUgcGFnZXMgbWlnaHQg
YmUgcmVjbGFpbWVkLiBXaXRoIHRoZSBwZXItVk1BIGxvY2ssIGl0CmlzIG11Y2ggZWFzaWVyIHRv
IGhvbGQgYW5kIHByb2NlZWQgd2l0aCB0aGUgd29yay4KClRoYW5rcwpCYXJyeQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
