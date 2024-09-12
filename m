Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F11BEED60A
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 14:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PYdXfY8c8aawqJfMS215gCW3dFm2HtwE8mda27MqSWk=; b=YVoM0Anh48VoWYIbUwLV7QKFpG
	5U8pw86AZoXEH8edytjD7LdDXFHPyUesGRqsRXZxzxyxMzdcHcE8GhsdJqjB6S0x4O99B2eanwU5L
	V7fC3RtBtM+pnfveQJWw+zMeYRt9ae6W0jJ2m1UXnaIU8XalvERNEOQROfwBSh9DF2qj3JhLZPg21
	oZeflRXmit/xnjp8UejEzUrT9+ELWN8aWCdaT0dqWYo+xD/+Sx4q+0d6lLXFUp/B/s2ecJjFh3UwB
	6Q8xFP+PKn+bh3+6kRURnhe7fAai2WbEpbRQNv4b6jk35urMHcPpqsJRizu/a8Pdb0u2VsIQ6bqc0
	TsA4pZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokxi-0000000DOEs-1iYz;
	Thu, 12 Sep 2024 14:38:22 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sokw3-0000000DNXE-06gz
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 14:36:41 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-205529c3402so13584605ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726151797; x=1726756597; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuWyNxzcGe6GM7Msd7pGsCR+v4gYGRud4L+CnasmxO4=;
        b=4zQpt4Ek+ZaZltK5az0cw5grcvemt78pfuz4evvXcMbm9T2/sdwtCgxbJcahLSAsdK
         x6bgRjtMvMZmNvKbZ8pht43VoWF1QoPgfv1Lo8yItL22r6Aqmv/LcjTBiPK+d40tfTML
         kRoMKKF5LOVUDGSKZnDQMypvJMpC/uIAYH5gE8uQl5gMZcokGjCEYFBnsRpO/Lo0EhVc
         Ru1xBCeDIc6abC7lADJcstKelBmjtN+TmO/bvicOL9gWwRdpmyeSONRp4QEwyXcH3mGV
         DG0gyifMfNchsg2Hn6phtubawtRiqGyaw5MhNbmAOUi4u95UfWFgMyyt3l1ga0ci+eX3
         5oYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726151797; x=1726756597;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IuWyNxzcGe6GM7Msd7pGsCR+v4gYGRud4L+CnasmxO4=;
        b=vxrw4BzP13vo0JKjkfonPGHNfQBBC4VoDgKnlJJtnKkaXYW/7bppdWqEKPFhzX6oCL
         FSMW5q6GWZ5Ttg+AUfG9Ql93i33hWG077eeWRGPmy5IIRYOXMre9mv8nm8qQgPPs9UUy
         dh8pD6IT1V9sZw2JUaH0d93STpHEn6vKyp7sDu4elwTNpKa730sVU+DNL7KzpbhIZT+l
         ms3Nni2yBvRPhgSkxVSjrq+FbPkbiev7wP7QSHXndkTSyK75kTtdH2mKFxYy8o5J/CsX
         DmsKTbdDZ4lhz9dcbZ301X7Hn/RGzHZJZCXZwE+7u7dxCb6n5Hkx93HHatFMytd1r4SA
         9yHg==
X-Forwarded-Encrypted: i=1; AJvYcCVtVmekL/jln7prS0vdsDb1jrlvxTpeC0X+xa2iI1YqM23aL5SGzaN4GA3Fs3XY2G8pQPXtTOXaMZhHjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSRf9mIlqKvR0qoh11lPW107mIkULztaACGdKkK+nM6uakdERI
	jDtCRIENAlBqOXKcrTip4zKVVLml1owbih1DMfn0ZdbcfOaiA0LwMyo+nFBOsQKEh3NrjrEsKJo
	SgQ==
X-Google-Smtp-Source: AGHT+IFuWC8JsJR3HsGyaRESNbHfLvQfpWc/wR0gpPN/S8O3DJQxAYIEFm0Vm/kFYnlxP670Kr6C2sD3R10=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:fa47:b0:205:71fb:2b27 with SMTP id
 d9443c01a7336-2076e3793dbmr630405ad.4.1726151796967; Thu, 12 Sep 2024
 07:36:36 -0700 (PDT)
Date: Thu, 12 Sep 2024 07:36:35 -0700
In-Reply-To: <CADrL8HW+hUNKPbaL7xYb0FEesB2t-AwAw07iOCDj8KHp0RwVpQ@mail.gmail.com>
Mime-Version: 1.0
References: <20240911204158.2034295-1-seanjc@google.com> <20240911204158.2034295-14-seanjc@google.com>
 <CADrL8HW+hUNKPbaL7xYb0FEesB2t-AwAw07iOCDj8KHp0RwVpQ@mail.gmail.com>
Message-ID: <ZuL8c7SCV0I16cma@google.com>
Subject: Re: [PATCH v2 13/13] KVM: selftests: Verify KVM correctly handles mprotect(PROT_READ)
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_073639_594172_B87AB32E 
X-CRM114-Status: GOOD (  24.63  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQsIEphbWVzIEhvdWdodG9uIHdyb3RlOgo+IE9uIFdlZCwgU2Vw
IDExLCAyMDI0IGF0IDE6NDLigK9QTSBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xl
LmNvbT4gd3JvdGU6Cj4gPiBAQCAtMzEsNiArMzMsNDIgQEAgc3RhdGljIHZvaWQgZ3Vlc3RfY29k
ZSh1aW50NjRfdCBzdGFydF9ncGEsIHVpbnQ2NF90IGVuZF9ncGEsIHVpbnQ2NF90IHN0cmlkZSkK
PiA+ICAgICAgICAgICAgICAgICAqKCh2b2xhdGlsZSB1aW50NjRfdCAqKWdwYSk7Cj4gPiAgICAg
ICAgIEdVRVNUX1NZTkMoMik7Cj4gPgo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBXcml0
ZSB0byB0aGUgcmVnaW9uIHdoaWxlIG1wcm90ZWN0KFBST1RfUkVBRCkgaXMgdW5kZXJ3YXkuICBL
ZWVwCj4gPiArICAgICAgICAqIGxvb3BpbmcgdW50aWwgdGhlIG1lbW9yeSBpcyBndWFyYW50ZWVk
IHRvIGJlIHJlYWQtb25seSwgb3RoZXJ3aXNlCj4gPiArICAgICAgICAqIHZDUFVzIG1heSBjb21w
bGV0ZSB0aGVpciB3cml0ZXMgYW5kIGFkdmFuY2UgdG8gdGhlIG5leHQgc3RhZ2UKPiA+ICsgICAg
ICAgICogcHJlbWF0dXJlbHkuCj4gPiArICAgICAgICAqCj4gPiArICAgICAgICAqIEZvciBhcmNo
aXRlY3R1cmVzIHRoYXQgc3VwcG9ydCBza2lwcGluZyB0aGUgZmF1bHRpbmcgaW5zdHJ1Y3Rpb24s
Cj4gPiArICAgICAgICAqIGdlbmVyYXRlIHRoZSBzdG9yZSB2aWEgaW5saW5lIGFzc2VtYmx5IHRv
IGVuc3VyZSB0aGUgZXhhY3QgbGVuZ3RoCj4gPiArICAgICAgICAqIG9mIHRoZSBpbnN0cnVjdGlv
biBpcyBrbm93biBhbmQgc3RhYmxlICh2Y3B1X2FyY2hfcHV0X2d1ZXN0KCkgb24KPiA+ICsgICAg
ICAgICogZml4ZWQtbGVuZ3RoIGFyY2hpdGVjdHVyZXMgc2hvdWxkIHdvcmssIGJ1dCB0aGUgY29z
dCBvZiBwYXJhbm9pYQo+ID4gKyAgICAgICAgKiBpcyBsb3cgaW4gdGhpcyBjYXNlKS4gIEZvciB4
ODYsIGhhbmQtY29kZSB0aGUgZXhhY3Qgb3Bjb2RlIHNvIHRoYXQKPiA+ICsgICAgICAgICogdGhl
cmUgaXMgbm8gcm9vbSBmb3IgdmFyaWFiaWxpdHkgaW4gdGhlIGdlbmVyYXRlZCBpbnN0cnVjdGlv
bi4KPiA+ICsgICAgICAgICovCj4gPiArICAgICAgIGRvIHsKPiA+ICsgICAgICAgICAgICAgICBm
b3IgKGdwYSA9IHN0YXJ0X2dwYTsgZ3BhIDwgZW5kX2dwYTsgZ3BhICs9IHN0cmlkZSkKPiA+ICsj
aWZkZWYgX194ODZfNjRfXwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYXNtIHZvbGF0aWxl
KCIuYnl0ZSAweDQ4LDB4ODksMHgwMCIgOjogImEiKGdwYSkgOiAibWVtb3J5Iik7IC8qIG1vdiAl
cmF4LCAoJXJheCkgKi8KPiAKPiBJJ20gY3VyaW91cyB3aGF0IHlvdSB0aGluayBhYm91dCB1c2lu
ZyBsYWJlbHMgKGluIGFzbSwgYnV0IHBlcmhhcHMKPiBhbHNvIGluIEMpIGFuZCAqc2V0dGluZyog
dGhlIFBDIGluc3RlYWQgb2YgaW5jcmVtZW50aW5nIHRoZSBQQy4gCgpJIGhhdmUgbm90aGluZyBh
Z2FpbnN0IGFzbSBsYWJlbHMsIGJ1dCBnZW5lcmFsbHkgc3BlYWtpbmcgSSBkb24ndCBsaWtlIHVz
aW5nCl9nbG9iYWxfIGxhYmVscyB0byBza2lwIGluc3RydWN0aW9ucy4gIEUuZy4gX19LVk1fQVNN
X1NBRkUoKSB1c2VzIGxhYmVscyB0byBjb21wdXRlCnRoZSBpbnN0cnVjdGlvbiBzaXplLCBidXQg
dGhvc2UgbGFiZWxzIGFyZSBsb2NhbCBhbmQgbmV2ZXIgZGlyZWN0bHkgdXNlZCBvdXRzaWRlCm9m
IHRoZSBtYWNyby4KClRoZSBiaWdnZXN0IHByb2JsZW0gd2l0aCBnbG9iYWwgbGFiZWxzIGlzIHRo
YXQgdGhleSBkb24ndCBzY2FsZS4gIEUuZy4gaWYgd2UKZXh0ZW5kIHRoaXMgdGVzdCBpbiB0aGUg
ZnV0dXJlIHdpdGggYW5vdGhlciB0ZXN0Y2FzZSB0aGF0IG5lZWRzIHRvIHNraXAgYSBncGEsCnRo
ZW4gd2UnbGwgZW5kIHVwIHdpdGggc2tpcF9wYWdlMSBhbmQgc2tpcF9wYWdlMiwgYW5kIHRoZSBj
b2RlIHN0YXJ0cyB0byBiZWNvbWUKZXZlbiBoYXJkZXIgdG8gZm9sbG93LgoKRG9uJ3QgZ2V0IG1l
IHdyb25nLCBza2lwcGluZyBhIGZpeGVkIGluc3RydWN0aW9uIHNpemUgaXMgYXdmdWwgdG9vLCBi
dXQgaW4gbXkKZXhwZXJpZW5jZSB0aGV5IGFyZSBsZXNzIHBhaW5mdWwgdG8gbWFpbnRhaW4gb3Zl
ciB0aGUgbG9uZyBoYXVsLgoKPiBEaWZmIGF0dGFjaGVkICh0ZXN0ZWQgb24geDg2KS4KCk5pdCwg
aW4gdGhlIGZ1dHVyZSwganVzdCBjb3B5K3Bhc2UgdGhlIGRpZmYgZm9yIHNtYWxsIHRoaW5ncyBs
aWtlIHRoaXMgKGFuZCBldmVuCmZvciBsYXJnZSBkaWZmcyBpbiBtYW55IGNhc2VzKSBzbyB0aGF0
IHJlYWRlcnMgZG9uJ3QgbmVlZCB0byBvcGVuIGFuIGF0dGFjaG1lbnQKKGRlcGVuZGluZyBvbiB0
aGVpciBtYWlsIGNsaWVudCksIGFuZCBzbyB0aGF0IGl0J3MgZWFzaWVyIHRvIGNvbW1lbnQgb24g
dGhlCnByb3Bvc2VkIGNoYW5nZWQuCgpgZ2l0IGFtIC0tc2Npc3NvcnNgIChhLmsuYS4gYGdpdCBh
bSAtY2ApIGNhbiBiZSB1c2VkIHRvIGVzc2VudGlhbGx5IGV4dHJhY3QgYW5kCmFwcGx5IHN1Y2gg
YSBkaWZmIGZyb20gdGhlIG1haWwuCgo+IEl0IG1pZ2h0IGV2ZW4gYmUgc2FmZS9va2F5IHRvIGFs
d2F5cyB1c2UgdmNwdV9hcmNoX3B1dF9ndWVzdCgpLCBqdXN0IHNldCB0aGUKPiBQQyB0byBhIGxh
YmVsIGltbWVkaWF0ZWx5IGZvbGxvd2luZyBpdC4KClRoYXQgd291bGQgbm90IGJlIHNhZmUvZmVh
c2libGUuICBMYWJlbHMgaW4gQyBjb2RlIGFyZSBzY29wZWQgdG8gdGhlIGZ1bmN0aW9uLgpBbmQg
QUZBSUssIGxhYmVscyBmb3IgdXNlIHdpdGggZ290byBhcmUgYWxzbyBub3QgdmlzaWJsZSBzeW1i
b2xzLCB0aGV5IGFyZQpzdGF0ZW1lbnRzLiAgVGhlICJzdGFuZGFyZCIgd2F5IHRvIGV4cG9zZSBh
IGxhYmVsIGZyb20gYSBmdW5jdGlvbiBpcyB0byB1c2UgaW5saW5lCmFzbSwgYXQgd2hpY2ggcG9p
bnQgdGhlcmUgYXJlIHplcm8gZ3VhcmFudGVlcyB0aGF0IG5vdGhpbmcgbmVjZXNzYXJ5IGlzIGdl
bmVyYXRlZApiZXR3ZWVuIHZjcHVfYXJjaF9wdXRfZ3Vlc3QoKSBhbmQgdGhlIG5leHQgYXNtKCkg
YmxvY2suCgpFLmcuIGlnbm9yaW5nIHRoZSBpbmxpbmUgYXNtIGZvciB0aGUgbW9tZW50LCB0aGUg
Y29tcGlsZXIgY291bGQgZ2VuZXJhdGUgbXVsdGlwbGUKcGF0aHMgZm9yIGEgbG9vcCwgZS5nLiBh
biB1bnJvbGxlZCB2ZXJzaW9uIGZvciBhIHNtYWxsIG51bWJlciBvZiBpdGVyYXRpb25zLCBhbmQK
YW4gYWN0dWFsIGxvb3AgZm9yIGEgbGFyZ2VyIG51bWJlciBvZiBpdGVyYXRpb25zLiAgVHJ5aW5n
IHRvIGRlZmluZSBhIGxhYmVsIGFzIGEKc2luZ3VsYXIgc3ltYm9sIGZvciB0aGF0IGlzIG5vbnNl
bnNpY2FsLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
