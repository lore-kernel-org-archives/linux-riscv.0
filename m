Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006CBC982D9
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 10:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6npbjvkllV9YC4pCteZNB7mug61oaM/JdtwtJBNAukI=; b=xtiFEjVHq7WjWH
	NVykVGRygyXf69IhifKwuG/mIlaGTGs82aqzcJkLJbOFcjRwKH2rUzlvrA+sM+sWqvjMoIM9NEqS6
	brBfzrh/j0h9nia00f0lL71gU8VU+aYHVzcsHH6NjB1O3+q7yXvEP48kHYeouRg5c02lvqsEUFiuI
	JAAq51nERK9fIcRQ8QUOMe5+m46nEYjoJf/YIHSuILCJpln3weOVj45PtyPNrvWJFcxfwm3S0goN2
	85cxP7vkpKaL1hGKwi+mbgoJ9l1eytu7sK66tYhO3qMNur++8HLJopzOM2LCvpQj/gWjP9GdydKOn
	pq1fLaf8hCBALYFuUVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WE4-0000000E9kL-01dF;
	Fri, 18 Sep 2026 10:53:52 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WDy-0000000E9j4-12nH
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 10:53:48 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2caced6038eso4986795ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Sep 2026 03:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789728825; x=1790333625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TAR8zhCOEVqWXPt6vBsjOMeeQmFuBz9UsZFbgyML5lo=;
        b=NP/AXqZEBj4qh+4CQoloMtTZi3ddfXJFlqPMZ0oDBg7PkRd+q6vW4a50xIMU9kbhmX
         BNr9EX5qrPfvt0AeaeVCKF2xI+kog61j0KQy1ZSq9RtEbunjGBnfJpQ8zc6SoicDKZpj
         cjcDaez3qtzhqDD3cKBKerPbK6KbDqNXNoF8sN4R1Wq7L3A2GEuWD+QnYDAR4V+/5t3s
         m76eNR5thSI4VkiH22Ki2teykprAAAX5Fb/CsNNJLimbdgLgTNtB/giTaIg9GWan+ISr
         ua+RlZU6+F6gImvNbMEzI2JNWJY51dRLkTvq+VUJpgFGm1e9MSXZhVfm9+sMIWGaltOK
         K9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728825; x=1790333625;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAR8zhCOEVqWXPt6vBsjOMeeQmFuBz9UsZFbgyML5lo=;
        b=WD1PDWhL9NAq6T9RUwqV5X/2YnJ2SDQ2SG9V5wseX5fm9RKMqcSSb+WjucYeYfVhhl
         g9oWzjD8KM421TNjeSgzViW+FimV2kfjwVy9CMwkxI7H6nMdYCGIFij60HI2yDlU3x/K
         0aPoasXna+q6d3kYq3My/QfwNkVfxkbuHBA9mcvKmnK2r15o9e3zPU5Vr9Ij1jQWumdA
         U82/CVbpTvYBISHNDTzrjO0LjMju/9FM/AS+A5eHYkU7NQIiScBZ6CQ0gj4eMZBeWyfz
         iETCj52RZuPdxl4ZWs4IBl7d6R73/C7978x/HypI5DiTQPYPH5Ti+c8mx2o5qPLsgPQN
         glMw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ8wrw6ZLnZJEXUoht1YVpVRiwm30dVso/YeCHQjiBvJSB74hW2DkupsnZjcqbyUVyQIBIsjoWu9aZrg==@lists.infradead.org
X-Gm-Message-State: AFuF++mWileUuNpwzd/GrVCNkTgFxoOi07a9M3IdYRL8Q9fhBj/q5lYC
	Dno8iFDQZGpCtn263Pc6NgOW75wAp0rBu9RmtHz06LPwnJEjjtwp1sWU
X-Gm-Gg: AYBFou2fjQnfhWa4fqaSc296Gg0OY4oQlysZGTN4fjrXtMwUMYwVwhiPIAvumTHl8Ta
	c0YjWHBqvb0kN3zUu2VC990Gef6rC4ZK8mTVO/Tx7VqCnS8mPe/KRXLk2+eRMxaO0pDsgrVDDvs
	kRiUXB0DWAJ0qsE5EWE2SuClgwdzfihjFetfaPZq2X5mYPEnEl3j76BAVXfmnfXkiaqbrpqPyH/
	ifqrYZkmkKmfXHEzd5xUlWwevCMnsp1J1A7X6ghUajQqKRoUMGE0tRPtCi3VHpHuYuISCFqVyP0
	ZeSJfRqPnsMi54c2rWfNAO5EewApvYJd4H2D6+AUbuBjlVDhraDW90L+n/k8s4oEP9zUi8nBrqK
	EgS7e5ABzxNQW/V8wIJp1CWun8NGeLsj2h9Lx40d/XfkROy5ukQe1O739klks+roDqOufllGPnw
	pdbzDymcZ7W4asRfKCHrUO0b/7rPiT5k9Qe04FQJhEBkX8dnp8IpdZu4P6ZDedrx/wzuzRUqZqc
	qBG2g==
X-Received: by 2002:a17:902:cecc:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd9ca3f088mr93269015ad.21.1789728825328;
        Fri, 18 Sep 2026 03:53:45 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7525b2asm5835555ad.19.2026.09.18.03.53.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:53:44 -0700 (PDT)
Message-ID: <1a47d5de-fb68-4c10-a199-f0d274689cdc@gmail.com>
Date: Fri, 18 Sep 2026 18:53:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] kdump: reduce vmcore size and capture time
To: Baoquan He <baoquan.he@linux.dev>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <aqzznOgILX2pZg7b@fedora>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <aqzznOgILX2pZg7b@fedora>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_035346_296122_397EDD32 
X-CRM114-Status: GOOD (  12.09  )
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

CgpPbiA5LzE4LzI2IDE2OjE3LCBCYW9xdWFuIEhlIHdyb3RlOgo+IE9uIDA5LzAyLzI2IGF0IDAz
OjMxcG0sIFdhbmR1biBDaGVuIHdyb3RlOgo+PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1
bkBsaXhpYW5nLmNvbT4KPj4KPiAuLi5zbmlwLi4uIAo+PiBBQ1BJIHN5c3RlbXMgYWxyZWFkeSBm
aWx0ZXIgcmVzZXJ2ZWQgbWVtb3J5IG91dCBvZiB0aGUgdm1jb3JlIHRocm91Z2gKPj4gdGhlaXIg
ZXhpc3RpbmcgcGF0aDsgb25seSBEVC1iYXNlZCBzeXN0ZW1zIGN1cnJlbnRseSBmYWlsIHRvIGZp
bHRlciB0aGVzZQo+PiByZWdpb25zLCB3aGljaCBpcyB3aGF0IHRoaXMgc2VyaWVzIGFkZHJlc3Nl
cy4gVGhlIGZsYWcgbGl2ZXMgaW4gbWVtYmxvY2sKPj4gaXRzZWxmIHJhdGhlciB0aGFuIGluIGEg
RFQtb25seSBzdHJ1Y3R1cmUsIHNvIHRoZSBtZWNoYW5pc20gaXMgZ2VuZXJpYyBhbmQKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIH5+fgo+IFRoZSBwYXRjaHNldCBpdHNlbGYgbG9va3MgZ29vdCB0byBtZSwgd2hpbGUgSSBh
bSBjb25jZXJuZWQgaWYgaXQncwo+IHJlYWxseSBnZW5lcmljLiBJIHJhaXNlZCB0aGF0IGluIHN1
Yi10aHJlYWQgdGFsa2luZyB3aXRoIFdhbmR1bi4gSW1hZ2luZQo+IEkgdHJpZWQgdG8gZXhjbHVk
ZSBtYW55IGRyaXZlciByZWdpb25zIGFuZCBzcGxpdCBtZW1ibG9jayByZWdpb25zIGludG8KPiBo
dW5kcmVkcywgY21hIGNvdWxkIHllbGwgb3V0OiBjbWFfZGVjbGFyZV9jb250aWd1b3VzX211bHRp
KCk/CgpBcmUgeW91IGNvbmNlcm5lZCB0aGF0IHNldHRpbmcgdGhlIE1FTUJMT0NLX05PRFVNUCBm
bGFnIGNvdWxkIHNwbGl0IGEgbWVtYmxvY2sKcmVnaW9uIGludG8gbWFueSBzbWFsbGVyIHJlZ2lv
bnMsIHdoaWNoIG1pZ2h0IHRoZW4gcHJldmVudApjbWFfZGVjbGFyZV9jb250aWd1b3VzX211bHRp
KCkgZnJvbSBzYXRpc2Z5aW5nIGEgbXVsdGktcmFuZ2UgYWxsb2NhdGlvbj8KSWYgc28sIElJQ1Ug
SSBkb27igJl0IHRoaW5rIHRoYXQgYXBwbGllcyBoZXJlLgoKTUVNQkxPQ0tfTk9EVU1QIGlzIGN1
cnJlbnRseSBvbmx5IHNldCBvbiBtZW1vcnkgdGhhdCBoYXMgYWxyZWFkeSBiZWVuIHJlc2VydmVk
LgpUaGVzZSByZWdpb25zIGFyZSBleGNsdWRlZCB3aGVuIGl0ZXJhdGluZyBvdmVyIGZyZWUgbWVt
b3J5LCBzbyBtYXJraW5nIHRoZW0gTk9EVU1QCmRvZXMgbm90IGluY3JlYXNlIHRoZSBudW1iZXIg
b2YgZnJlZSByZWdpb25zIHNlZW4gYnkgQ01BLgoKCkJlZm9yZSBtYXJraW5nIE5PRFVNUDoKCiAg
bWVtYmxvY2subWVtb3J5OiAgICBbIGZyZWUgXSBbIHJlc2VydmVkIF0gWyBmcmVlIF0KICBtZW1i
bG9jay5yZXNlcnZlZDogICAgICAgICAgIFsgcmVzZXJ2ZWQgXQoKTm93LCBmb3IgbWVtYmxvY2su
bWVtb3J5LCBpdCBpcyBvbmUgcmVnaW9uIHRoYXQgY29udGFpbnMgZnJlZSBhbmQgcmVzZXJ2ZWQg
bWVtb3J5LgoKCkFmdGVyIG1hcmtpbmcgdGhlIHJlc2VydmVkIHJlZ2lvbiBOT0RVTVA6CgogIG1l
bWJsb2NrLm1lbW9yeTogICAgWyBmcmVlIF0gWyAgTk9EVU1QICBdIFsgZnJlZSBdCiAgbWVtYmxv
Y2sucmVzZXJ2ZWQ6ICAgICAgICAgICBbIHJlc2VydmVkIF0KCmZvciBtZW1ibG9jay5tZW1vcnks
IGl0IHNwbGl0cyBpbnRvIDMgcmVnaW9ucywgMiBmcmVlIHJlZ2lvbnMsIDEgbm9kdW1wIHJlZ2lv
bi4KCkFsdGhvdWdoIHRoZSBtZW1ibG9jay5tZW1vcnkgYXJyYXkgbWF5IGJlIHNwbGl0IGludGVy
bmFsbHksIGl0IGRvZXMgbm90IGNyZWF0ZSBhZGRpdGlvbmFsCmZyZWUgcmFuZ2VzIGZvciBjbWFf
ZGVjbGFyZV9jb250aWd1b3VzX211bHRpKCkgdG8gcHJvY2Vzcy4KCgo+IAo+IElNSE8sIHdpdGhk
cmF3aW5nIHRoZSBjbGFpbSBjYW4gZml4IHRoZSBuaXQgY29uY2Vybi4gSWYgSSBhbSB3cm9uZywK
PiBwbGVhc2UgaGVscCBwb2ludCBpdCBvdXQgdG8gbGV0IG1lIGxlYXJuIG1vcmUuCgpJIHdpbGwg
cmV2aXNlIHRoaXMgZGVzY3JpcHRpb24gdG8gYXZvaWQgYW55IG1pc3VuZGVyc3RhbmRpbmcuCgpC
ZXN0IHJlZ2FyZHMsCldhbmR1bgoKCj4gCj4gVGhhbmtzCj4gQmFvcXVhbgo+IAo+PiBib3RoIEFD
UEkgYW5kIERUIHN5c3RlbXMgY2FuIGJlbmVmaXQgZnJvbSBpdCAoc3VnZ2VzdGVkIGJ5IFJvYiwg
dGhhbmtzKSBbMV0uCj4+Cj4+IFNpbmNlIHRoZSByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBhcmUg
ZmlsdGVyZWQgb3V0LCB0aGUgdm1jb3JlIGlzCj4+IHNtYWxsZXIgaW4gc2l6ZSBhbmQgZmFzdGVy
IHRvIHByb2R1Y2UuIAo+Pgo+IC4uLnNuaXAuLi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
