Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A97C7EE32
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jun 2025 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+AIK6ClOPHpZwo2KvuTn6zXAWB65fcnE9x6esIkycI=; b=ijKdEiyw0g1HYD
	PtvFSsFj/LAFNQ39/ofM1saihXc0uIHh38IBggcQGiyBRDfAXjjKxbS9wO3XiLJTH5Bv+XLu7CihJ
	Z2jXsWwVSlGOGs+EIjFjieyquIDnvYlnFNrqHFjfskzCZwfQbYDwVtKVhb+qaycR6pRDjz125VrcD
	sPuIGfKutFioqhW1Gy1XmUeXPaV/YnxUVXQ2peM5sE94jHWRcDNvkbq97Z2e+0zPN8XdzgYeMo0Ho
	KNevpf/VlsDgCJuT/QP002M81zm2dnhW19XHz8kl4DDLY4Lr466++QXMRhIHLK4ZzkoIHp58qUFI9
	UsXM8e3GKJbXSHk0Yi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVTF2-0000000Ghoj-47MZ;
	Sat, 28 Jun 2025 10:57:04 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVTEz-0000000GhnU-3EHm;
	Sat, 28 Jun 2025 10:57:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-453643020bdso26032495e9.1;
        Sat, 28 Jun 2025 03:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751108219; x=1751713019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WW5Xm1iyi3UCGUGi1nrA70AfDCSuOC/overmp2OZ2oI=;
        b=D3L/+lknpaeeenqGwyJpshsQ8s7osMdbK6MB6jcAqHGVJty8XEuOzq8ds65be36ke9
         G/zqB1ztm/PGWgd524RAm3UXkbSvi5Z9xLNWDm7ii4+64JyCuY5cxS42oEaRwVMWPlI6
         WV3VBA6Bj0P674DZQe09CLsM6doquQBZ2gUxSXjcW+yQtT8wft0JrjLXl8glvP685Rei
         kyVkcBJJdbvrzOx+dFHCB1uqxnuoi7oZyd9MjyHeerb8wpfnLFmzdSr6fLXm9k3LLnJM
         JnmFoVBmytduoqXaKKuINS0NpWi3r1l6AbR+DFO6gF84ld3bEWVQf3oshVxo+jOhRaep
         zLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751108219; x=1751713019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WW5Xm1iyi3UCGUGi1nrA70AfDCSuOC/overmp2OZ2oI=;
        b=AedaF0xyW3JAJiH2RWZIUuyco9VQzHgGw2I1yYp1hcBxuO0g5H2cS5idrGa0WurgO6
         d7TE60IGn4IdX+TsO5aNS5RopBHO2Rpvx0AGHB0h4aUNdT64Dm1XM5TJSLd3ddymW/9n
         ZOjSzoMXNfLFuxRSc+Mhh1PWwvKGpMubADynJhaQGvWY6cu1bOZvw2hEU2cAGUqABZiu
         sU6vqsG+KEA4hu5MtPqYEXaF2fjHDoOglxyeD4dwK+m2h0Yg7YJCBKCUFibM+ELnjrVD
         nRrajJo9T+fO/FJV5Tue7whzmtg1LG6bDcHwUX+hhzf4Hvh6fEpbH89nE6329A5OFIYJ
         I7zw==
X-Forwarded-Encrypted: i=1; AJvYcCVN/R80CvkPxmSxyy0K2N8bTXd+KNZ5+VCD7TnlHE5MJtnYZPoMxyw4zZNT5rXCpt94cb7s+6KG5FnHQXm4lnmK@lists.infradead.org, AJvYcCVSY06vNJtJrHPr85Avc4EO6His7ICr2KiMVxj13xGNRMtBapjyL8FoirmRpM4V7+9ffqQxnA1rLhA=@lists.infradead.org, AJvYcCWtNN5yr9cFo2mATS67ez8Y3060jbWhbUP2M2hfR1e3JpIEnUkRAULipaQZF7IMfmbfrWapgZVv/ndc/sE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnEFVEMbhH09LlddbhqoglFAByspLSBqXnvHwHnDgMyjCL2WPO
	/tdxrns/9EFzHOsuefwP1bD2zt6wRG7Akreo8Zada6E0JLqqHnk9ewbr54NX5ICCyeK5PPzz5De
	xnSX8pXFkcrvzpT4aRWsh37/LbcCIYAg=
X-Gm-Gg: ASbGnctvLrlcCkhwvyBuAXOv8M111DvzTPxV3+KC2tpOsfOHBj71r3yV5yQ1B9XNu/Z
	YZEUaVmNB3gfwDJU6FIET5+eGC/yVHZ8SzZGVFlHjHVny42flW9t1m2VmxPhfCKObcWYm0tu+qH
	0UEPAamHp0+AHpS/UtMEuu/cl66i765K46C+IenXT3yQ8chapMTtjE1ONj
X-Google-Smtp-Source: AGHT+IGAGkRhQdbRpH6HhS1J+gxMpfj97HGV7cZaVPURx7gE9Aj/9LEPZdgznOP2vFFz/ZEWLwEewnTNwxfxlbsYcE0=
X-Received: by 2002:adf:a1cb:0:b0:3a5:3b14:1ba3 with SMTP id
 ffacd0b85a97d-3a90b8c99bdmr4338216f8f.49.1751108219175; Sat, 28 Jun 2025
 03:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250626153147.145312-1-snovitoll@gmail.com>
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 28 Jun 2025 12:56:46 +0200
X-Gm-Features: Ac12FXzas27xdNkixqmlGojlaGpK_Gh1QoVs4xiB8K_jsjOjMmn0UG8i3tUlU1Q
Message-ID: <CA+fCnZfAtKWx=+to=XQBREhou=Snb0Yms4D8GNGaxE+BQUYm4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with kasan_enabled
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, dvyukov@google.com, 
	vincenzo.frascino@arm.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com, 
	akpm@linux-foundation.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, arnd@arndb.de, rppt@kernel.org, 
	geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com, 
	tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com, 
	kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_035701_811773_3349B252 
X-CRM114-Status: GOOD (  19.81  )
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

T24gVGh1LCBKdW4gMjYsIDIwMjUgYXQgNTozMuKAr1BNIFNhYnlyemhhbiBUYXNib2xhdG92Cjxz
bm92aXRvbGxAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIHVuaWZpZXMg
dGhlIGthc2FuX2FyY2hfaXNfcmVhZHkoKSBhbmQga2FzYW5fZW5hYmxlZCgpCj4gaW50ZXJmYWNl
cyBieSBleHRlbmRpbmcgdGhlIGV4aXN0aW5nIGthc2FuX2VuYWJsZWQoKSBpbmZyYXN0cnVjdHVy
ZSB0bwo+IHdvcmsgY29uc2lzdGVudGx5IGFjcm9zcyBhbGwgS0FTQU4gbW9kZXMgKEdlbmVyaWMs
IFNXX1RBR1MsIEhXX1RBR1MpLgo+Cj4gQ3VycmVudGx5LCBrYXNhbl9lbmFibGVkKCkgb25seSB3
b3JrcyBmb3IgSFdfVEFHUyBtb2RlIHVzaW5nIGEgc3RhdGljIGtleSwKPiB3aGlsZSBvdGhlciBt
b2RlcyBlaXRoZXIgcmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX0tBU0FOKSAoY29tcGlsZS10aW1l
Cj4gY29uc3RhbnQpIG9yIHJlbHkgb24gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGthc2FuX2FyY2hf
aXNfcmVhZHkoKQo+IGltcGxlbWVudGF0aW9ucyB3aXRoIGN1c3RvbSBzdGF0aWMga2V5cyBhbmQg
Z2xvYmFsIHZhcmlhYmxlcy4KPgo+IFRoaXMgbGVhZHMgdG86Cj4gLSBDb2RlIGR1cGxpY2F0aW9u
IGFjcm9zcyBhcmNoaXRlY3R1cmVzCj4gLSBJbmNvbnNpc3RlbnQgcnVudGltZSBiZWhhdmlvciBi
ZXR3ZWVuIEtBU0FOIG1vZGVzCj4gLSBBcmNoaXRlY3R1cmUtc3BlY2lmaWMgcmVhZGluZXNzIHRy
YWNraW5nCj4KPiBBZnRlciB0aGlzIHNlcmllczoKPiAtIEFsbCBLQVNBTiBtb2RlcyB1c2UgdGhl
IHNhbWUga2FzYW5fZmxhZ19lbmFibGVkIHN0YXRpYyBrZXkKPiAtIENvbnNpc3RlbnQgcnVudGlt
ZSBlbmFibGUvZGlzYWJsZSBiZWhhdmlvciBhY3Jvc3MgbW9kZXMKPiAtIFNpbXBsaWZpZWQgYXJj
aGl0ZWN0dXJlIGNvZGUgd2l0aCB1bmlmaWVkIGthc2FuX2luaXRfZ2VuZXJpYygpIGNhbGxzCj4g
LSBFbGltaW5hdGlvbiBvZiBhcmNoIHNwZWNpZmljIGthc2FuX2FyY2hfaXNfcmVhZHkoKSBpbXBs
ZW1lbnRhdGlvbnMKPiAtIFVuaWZpZWQgdm1hbGxvYyBpbnRlZ3JhdGlvbiB1c2luZyBrYXNhbl9l
bmFibGVkKCkgY2hlY2tzCj4KPiBUaGlzIGFkZHJlc3NlcyB0aGUgYnVnemlsbGEgaXNzdWUgWzFd
IGFib3V0IG1ha2luZwo+IGthc2FuX2ZsYWdfZW5hYmxlZCBhbmQga2FzYW5fZW5hYmxlZCgpIHdv
cmsgZm9yIEdlbmVyaWMgbW9kZSwKPiBhbmQgZXh0ZW5kcyBpdCB0byBwcm92aWRlIHRydWUgdW5p
ZmljYXRpb24gYWNyb3NzIGFsbCBtb2Rlcy4KPgo+IFsxXSBodHRwczovL2J1Z3ppbGxhLmtlcm5l
bC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNzA0OQoKSGkgU2FieXJ6aGFuLAoKVGhhbmsgeW91IGZv
ciB3b3JraW5nIG9uIHRoaXMhCgpPbmUgYXNwZWN0IHRoYXQgaXMgbWlzc2luZyBmcm9tIHRoZSBw
YXRjaGVzIGlzIG1vdmluZyB0aGUKa2FzYW5fYXJjaF9pc19yZWFkeSgpIGNhbGxzIGludG8gdGhl
IGluY2x1ZGUvbGludXgva2FzYW4uaCAodGhpcyBpcwpub3QgZXhwbGljaXRseSBtZW50aW9uZWQg
aW4gdGhlIGlzc3VlLCBidXQgdGhpcyBpcyB3aGF0IHRoZSAiYWRkaW5nCl9fd3JhcHBlcnMiIHBh
cnQgaXMgYWJvdXQpLgoKQW5vdGhlciB0aGluZyB0aGF0IG5lZWRzIGNhcmVmdWwgY29uc2lkZXJh
dGlvbiBpcyB3aGV0aGVyIGl0J3MKcG9zc2libGUgdG8gY29tYmluZSBrYXNhbl9hcmNoX2lzX3Jl
YWR5KCkgYW5kIGthc2FuX2VuYWJsZWQoKSBpbnRvIHRoZQpzYW1lIGNoZWNrIGxvZ2ljYWxseSBh
dCBhbGwuIFRoZXJlJ3Mgb25lIGlzc3VlIG1lbnRpb25lZCBpbiBbMV06Cgo+IEluIGthc2FuX2Nh
Y2hlX2NyZWF0ZSgpIHdlIHVuY29uZGl0aW9uYWxseSBhbGxvY2F0ZSBhIG1ldGFkYXRhIGJ1ZmZl
ciwKPiBidXQgdGhlIGthc2FuX2luaXRfc2xhYl9vYmooKSBjYWxsIHRvIGluaXRpYWxpc2UgaXQg
aXMgZ3VhcmRlZCBieQo+IGthc2FuX2VuYWJsZWQoKS4gQnV0IGxhdGVyIHBhcnRzIG9mIHRoZSBj
b2RlIG9ubHkgY2hlY2sgdGhlIHByZXNlbmNlIG9mCj4gdGhlIGJ1ZmZlciBiZWZvcmUgdXNpbmcg
aXQsIHNvIGJhZCB0aGluZ3MgaGFwcGVuIGlmIGthc2FuX2VuYWJsZWQoKQo+IGxhdGVyIHR1cm5z
IG9uIChJIHdhcyBnZXR0aW5nIHNvbWUgZXJyb3IgYWJvdXQgaW52YWxpZCBsb2NrIHN0YXRlKS4K
CkFuZCB0aGVyZSBtaWdodCBiZSBvdGhlciBjYWxsYmFja3MgdGhhdCBzaG91bGQgYmUgZXhlY3V0
ZWQgZXZlbiBiZWZvcmUKa2FzYW5faW5pdF8uLi4oKSBjb21wbGV0ZXMuIEJ1dCB0aGVuIGZvciB0
aGUgSFdfVEFHUyBtb2RlLCBpZgprYXNhbl9lbmFibGVkKCkgaXMgb2ZmLCB0aGVuIHdlIGRvbid0
IHdhbnQgdG8gZXhlY3V0ZSBhbnkgY2FsbGJhY2tzLgoKU28gbWF5YmUgd2UgZG8gYWN0dWFsbHkg
bmVlZCBhIHNlcGFyYXRlIHN0YXRpYyBrZXkgZm9yCmthc2FuX2FyY2hfaXNfcmVhZHkoKS4gQnV0
IGV2ZW4gaWYgc28sIGl0IHN0aWxsIG1ha2VzIHNlbnNlIHRvIG1vdmUKa2FzYW5fYXJjaF9pc19y
ZWFkeSgpIGludG8gdGhlIF9fd3JhcHBlcnMgZm9yIHRoZSBhZmZlY3RlZCBjYWxsYmFja3MuCgpU
aGFua3MhCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vQ0ErZkNuWmY3SnFU
SDQ2QzdvRzJXazlObkxVN2hnaVZERUswRUE4UkF0eXItS2drSGRnQG1haWwuZ21haWwuY29tLwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
