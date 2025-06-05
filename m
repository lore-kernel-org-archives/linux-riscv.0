Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CB3C5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 19:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXybtDhHbKDXFeOOz79wGUoBHtXiNlTFmWBFKzXzy2Y=; b=0hjPElu/qZ2Jba
	7FmQhQeGfMZIHz9QtwzylVy7j8/wqnh85a3Xge0QLTFrzc0ufYr5KGDK96Kq5U3rGrRpHvKJbsoWT
	k1BTl6ckm8eUFgrLqGK0E23k4Z0WuPC0G5Y7Aw7dxB2ywTGFTshVLSpr7gDSGW96RYPugodzO8R3g
	cf5CPDDy1Vdnrw6Mh2sBc18RuJXrE1xlEM0yvdpMuvPPJ6CZsHYdY0kKScZmTWaWE99TaSxU1oIyl
	hRMJCYs7L8IohQokaqLVY7ZmagOROWpyjC+xT4TqsOd5GzuL8RnxHUyUOEFCTA3Xgb6d8LmLefSq9
	XqAlcgaroFDMEBAc/+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNG7r-0000000GSmU-1Emg;
	Thu, 05 Jun 2025 19:19:43 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNG7p-0000000GSm7-2bCf
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 19:19:42 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6024087086dso2663a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jun 2025 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749151179; x=1749755979; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbgPHeMZvQzL3m80JGIpPWf4bxoO1tcc6Q2HUvzFDuI=;
        b=LONSN4Zh9G3j7LPMuOlZTLX1KQvE87OFU/79QostJFaBgEgetawy5/39zAkKzNFd5B
         BBe3DWUOtFUbfTmu1eHkrhMPAnBtzxjuXbqQNg3rNtlxHiy+eJ3h28fXeBQIRvQKLZvX
         hGkiM3qopI4TwVW17TgE4exFLISAypC0ieJVj0ggk+iBFe8muQ5oHGRX9unhkOjeYYKy
         2pSYLb0v0UW5PPBq7dQY9ZxWR4KblvQ78uaf3x4LIQX1T6UfteKj4bjbecwdT3cd1wJ4
         79kXBPzOijRtTO5TpAt3tIBTaGBllhAmu6MfxcOPfhi0ECEv3T1saAYdF1pMvWjjRjhr
         KRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749151179; x=1749755979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbgPHeMZvQzL3m80JGIpPWf4bxoO1tcc6Q2HUvzFDuI=;
        b=a5IUKI+UrbX6GAWZePLeSzJ+E4F+Jo0vZl9zkJs/UV3o8i7F/uKCQrAvL5fxkTfq7F
         hC7T9pZJv4tx53qZAmLWR1SBvpjwy9XM0DIsj3wuhWdfTgQl/Zn7d6bvII5a4ULftDa/
         EV+yfWw9PPuL975ySGH0Lxzp2gTU6L/ESj0oj/3BiU4QRigXeyx2Kb2PnKxBq2IqUj0M
         0ekij0jRo6Okrt2tTAJcLVi5MNt4zSy+LWWCa6P3pkU2FrdwHguEj66KX/9ZL2kzVuE+
         z6dgrnfPA8xxCclh4CCdzETHSrK8sH4q4KweJ9NgtLtd00BjgOsqYVekIyMjX3v3msJq
         vXwA==
X-Forwarded-Encrypted: i=1; AJvYcCUVhG/w+MOj5hjZ5s5t/CzXZLkjvp4HyKMfftnrrJd+pXX3taL/W6GEY1z+9s96IiA3N3eEeKWwPM2ZZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEoAtbhCRpP0FP5iAZuaRdgPH2us4M4ejt2KY+WtKjUMb1N6Qt
	8xRnqWErS976qmF6NuDKQQPpoF0WRTGH+E3OfFpxq2O5gkwx2dAu1WZAj3YEJv+bfN6vp2nZ0j4
	hlj8yz0gGZ1JyMjjfo/RxJIy2ivkaZZL7Flt/7CG1
X-Gm-Gg: ASbGncuUQQGOAN0xXa/42d/a5Gqg1f9QfuZqYoqP0qrHN9Z954fcInXoPiicffmRyB6
	wYIhlJXe1+cY8uavi78wU6MEKlC+UNJ8r43u3i7Vs1KrDFI4LEmjDbHZb9xRgUXv3H6nLmsoa66
	lmlc4nZc+xkZUysUgeWf7x9MigrqVbjFgrNx1XH8rQt4Yko7eftJ5WToENwOFg7W2onpGWHeU=
X-Google-Smtp-Source: AGHT+IE6xDvvoQteJJ/eDt9iDCFywxEWUs1nTALJvRPrcfNFm/URqn6kru8JdI2hpKXp5O/+usizGPrxFzABOYx39mY=
X-Received: by 2002:a50:aa88:0:b0:607:bd2:4757 with SMTP id
 4fb4d7f45d1cf-60774f7ea9dmr10567a12.1.1749151178729; Thu, 05 Jun 2025
 12:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20250604141958.111300-1-lorenzo.stoakes@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 5 Jun 2025 21:19:02 +0200
X-Gm-Features: AX0GCFsuwLolzPDsrZ1E3v9TrRqv1LcU4kqKEWMPeICbN8OYkLkFBNdY22dpC_A
Message-ID: <CAG48ez3hvPbfc2dapQQu9TKrjdi5mhZ4tAWi+m0tNZeEtSZBrQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/pagewalk: split walk_page_range_novma() into
 kernel/user parts
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_121941_678262_77C45892 
X-CRM114-Status: GOOD (  17.41  )
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

T24gV2VkLCBKdW4gNCwgMjAyNSBhdCA0OjIx4oCvUE0gTG9yZW56byBTdG9ha2VzCjxsb3Jlbnpv
LnN0b2FrZXNAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gVGhlIHdhbGtfcGFnZV9yYW5nZV9ub3ZtYSgp
IGZ1bmN0aW9uIGlzIHJhdGhlciBjb25mdXNpbmcgLSBpdCBzdXBwb3J0cyB0d28KPiBtb2Rlcywg
b25lIHVzZWQgb2Z0ZW4sIHRoZSBvdGhlciB1c2VkIG9ubHkgZm9yIGRlYnVnZ2luZy4KPgo+IFRo
ZSBmaXJzdCBtb2RlIGlzIHRoZSBjb21tb24gY2FzZSBvZiB0cmF2ZXJzYWwgb2Yga2VybmVsIHBh
Z2UgdGFibGVzLCB3aGljaAo+IGlzIHdoYXQgbmVhcmx5IGFsbCBjYWxsZXJzIHVzZSB0aGlzIGZv
ci4KPgo+IFNlY29uZGx5IGl0IHByb3ZpZGVzIGFuIHVudXN1YWwgZGVidWdnaW5nIGludGVyZmFj
ZSB0aGF0IGFsbG93cyBmb3IgdGhlCj4gdHJhdmVyc2FsIG9mIHBhZ2UgdGFibGVzIGluIGEgdXNl
cmxhbmQgcmFuZ2Ugb2YgbWVtb3J5IGV2ZW4gZm9yIHRoYXQgbWVtb3J5Cj4gd2hpY2ggaXMgbm90
IGRlc2NyaWJlZCBieSBhIFZNQS4KPgo+IEl0IGlzIGZhciBmcm9tIGNlcnRhaW4gdGhhdCBzdWNo
IHBhZ2UgdGFibGVzIHNob3VsZCBldmVuIGV4aXN0LCBidXQgcGVyaGFwcwo+IHRoaXMgaXMgcHJl
Y2lzZWx5IHdoeSBpdCBpcyB1c2VmdWwgYXMgYSBkZWJ1Z2dpbmcgbWVjaGFuaXNtLgo+Cj4gQXMg
YSByZXN1bHQsIHRoaXMgaXMgdXRpbGlzZWQgYnkgcHRkdW1wIG9ubHkuIEhpc3RvcmljYWxseSwg
dGhpbmdzIHdlcmUKPiByZXZlcnNlZCAtIHB0ZHVtcCB3YXMgdGhlIG9ubHkgdXNlciwgYW5kIG90
aGVyIHBhcnRzIG9mIHRoZSBrZXJuZWwgZXZvbHZlZAo+IHRvIHVzZSB0aGUga2VybmVsIHBhZ2Ug
dGFibGUgd2Fsa2luZyBoZXJlLgoKSnVzdCBmb3IgdGhlIHJlY29yZCwgY29weS1wYXN0aW5nIG15
IGNvbW1lbnQgb24gdjEgdGhhdCB3YXMKYWNjaWRlbnRhbGx5IHNlbnQgb2ZmLWxpc3Q6CmBgYApT
b3J0IG9mIGEgdGFuZ2VudGlhbCBjb21tZW50OiBJIHdvbmRlciBpZiBpdCB3b3VsZCBtYWtlIHNl
bnNlIHRvIGdpdmUKcHRkdW1wIGEgZGlmZmVyZW50IHBhZ2UgdGFibGUgd2Fsa2VyIHRoYXQgdXNl
cyByb3VnaGx5IHRoZSBzYW1lIHNhZmV0eQpjb250cmFjdCBhcyBndXBfZmFzdCgpIC0gdHVybiBv
ZmYgSVJRcyBhbmQgdGhlbiB3YWxrIHRoZSBwYWdlIHRhYmxlcwpsb2NrbGVzc2x5LiBXZSdkIG5l
ZWQgYmFzaWNhbGx5IG5vIGxvY2tpbmcgYW5kIG5vIHNwZWNpYWwgY2FzZXMKKHJlZ2FyZGluZyB1
c2Vyc3BhY2UgbWFwcGluZ3MgYXQgbGVhc3QpLCBhdCB0aGUgY29zdCBvZiBoYXZpbmcgdG8Kd3Jp
dGUgdGhlIHdhbGtlciBjb2RlIHN1Y2ggdGhhdCB3ZSBwZXJpb2RpY2FsbHkgcmVzdGFydCB0aGUg
d2FsayBmcm9tCnNjcmF0Y2ggYW5kIG5vdCBiZWluZyBhYmxlIHRvIGluc3BlY3QgcmVmZXJlbmNl
ZCBwYWdlcy4gKFRoYXQgbWlnaHQKYWxzbyBiZSBuaWNlciBmb3IgZGVidWdnaW5nLCBzaW5jZSBp
dCB3b3VsZG4ndCBibG9jayBvbiBsb2Nrcy4uLikKYGBgCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
