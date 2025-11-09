Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE04CCFA13
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Nov 2025 07:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=42UblhveU/C5ysfVM6VzpW0tewIjZ54a28U0xN+QiNQ=; b=uWJxCCu7DBt3Pp
	woPq1Ne6HwoSl2guD25zBZwz9pxEECMCyJBeRLE2sTV5twK+hb3IUFLChQCpoXvSNUKCSLAv7Jm+i
	lhr/92kfut8HwLCQRNYXQBlhhTAl8l7fD1F1f5ygcHGwXPjnDjc8eHjm6f0Mvx8iup+VPSaP/6N+p
	f8TycEBzyc6NT5JWSMw0PFvLSwcfXPps5ViyLMQSvzb2ar82o+V+KhvoV9WJt+8LV2ibBWwa3oVqA
	11r43s64CnXgJfE5KAhvSFFAcSDiHKzth3zA5j4C8j9NKYH1ULYRLC84nn0sEcqYOmRqeDD+7h1h+
	f0ZL0g5drjGgMBYpNQTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHzWR-00000003pb5-3Fhv;
	Sun, 09 Nov 2025 07:07:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHzWM-00000003paI-287p
	for linux-riscv@lists.infradead.org;
	Sun, 09 Nov 2025 07:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762672047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QHvKsjMe/AixpxnbJYjrVGK6zy8xknqlwpjxpwPDfNM=;
	b=HKq2wKoi2g/XqsaTocQTlAwuYWyu+9buFAeVd3EkTtUSZF1fKu5ay1leE6BHceKvZ4IM5h
	avy62bxp5rsuiIR9285jBaQzt4I1eDbV66CJ937oA7rsOp8xHYWfYRtlYUDE5dDmAjPa2e
	ctF3eYbK47vKdh41yQDqFBWZfkM9BIg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-270-De2eeutwO6CUsdBXyOD_mg-1; Sun, 09 Nov 2025 02:07:25 -0500
X-MC-Unique: De2eeutwO6CUsdBXyOD_mg-1
X-Mimecast-MFC-AGG-ID: De2eeutwO6CUsdBXyOD_mg_1762672045
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429c5da68e5so1202542f8f.1
        for <linux-riscv@lists.infradead.org>; Sat, 08 Nov 2025 23:07:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762672044; x=1763276844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QHvKsjMe/AixpxnbJYjrVGK6zy8xknqlwpjxpwPDfNM=;
        b=JD2qwZw6eTYgpLqsq32Cr2RII0iySH3nRqbHtUXhESqbF3n8vSF6AQYsQUtbkGj/Zf
         q58/imy9qXgYSrXq1SlxOgrB7ooQwRcr5nhXiC/3N05g6woi0pSVapx8oJ/X3ouiCIx/
         6hria0+cGpUIiLc5gQ0+LaDYlQVx/LG8DtNDKYnx6PNbeMxyhFLYsRMqNLnP0HZH2UgZ
         nzTCy2mlAxLe8Wh2p7pD4c9QMsYWSBiFJsuCj2iJ0+JGR6qu85go2a13XJmpdUt5Wepq
         U7rgQmJjYU18CKN2Brfe0x+MSeWCH9a7fAAzI7jzyMyPsFipbGfW2zU9YC33Wx0cTPUM
         Z7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWYBEez2WRgXvdlCMl48bx/NzZEhzEB0B+3LalZLM9wztGnINnFevTARZIb0F/00pKVQ8BKJfRiiZCElw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3VWcpIEv3zmgPNOB3eO+/DnHOBw5bnB6x4en6aFNApltqaXY5
	usAy8WuYfC/FHAL0i2QEPL68J4EEuHqf52+6bcYlK2bTaQjJ5a9wJ/Ocr81LRH967F7KiOmvtLb
	inp/hHGSmpuVXZgt9nUNBJin4aZ9EEuoee5mVHT2xjmWrFJsjY6NBO0yD8P9DNetVwP4sLlsQAy
	jxj0sqzsYLQw8gvafN5d6FIorH0IZF8FaQmVXbkzsNP60o
X-Gm-Gg: ASbGnct3sF3B4zBZQzY13cLVV1WrkjVom2Rg7rWlFcYXgGzwvH0B25FaGbMcNg1GAgc
	1Hli93vN9glCmPfdx349bWDTHM0reqsA8raufY2ggtFxPDTPBND9QnRN1LHrj8b2xHjzX/R0XL/
	sDwf3FKovyHO3gfMLubTz6iOVw6Wnw8fjnPpXNFrtyzoDqiAMgC1F0mFUlgo/TTTfnVe38kfsWf
	3pCb/zmYAUqUZ3C8WkuLk0cVKSf1cd79L4ycuWrnuIqIXIugoT/5DHtlKhE
X-Received: by 2002:a5d:5f51:0:b0:42b:2dc9:437d with SMTP id ffacd0b85a97d-42b2dc945bemr3340223f8f.8.1762672044537;
        Sat, 08 Nov 2025 23:07:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlgHVVqddTf0z9GBTwc7IKuQZJE4lbbt4jIACSUKr9tRwMh48mz2VQwkxk817nUPP85PYqX+H4iU6UOxhzr7A=
X-Received: by 2002:a5d:5f51:0:b0:42b:2dc9:437d with SMTP id
 ffacd0b85a97d-42b2dc945bemr3340209f8f.8.1762672044139; Sat, 08 Nov 2025
 23:07:24 -0800 (PST)
MIME-Version: 1.0
References: <CAAhSdy1jcXypH3yCUBaci2EbOy2cbr2qNtdYriKa-vcyFFeCzg@mail.gmail.com>
In-Reply-To: <CAAhSdy1jcXypH3yCUBaci2EbOy2cbr2qNtdYriKa-vcyFFeCzg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 9 Nov 2025 08:07:12 +0100
X-Gm-Features: AWmQ_bnx7mWPxNcnsLGyK7FcbtNdFOMyOYxt5lXfFl9U8cdhZMTbepfHl2tYedU
Message-ID: <CABgObfYYc1MTR6MFjVWfXKu6tOe0iVY-dh9OnGU_6RvF1fCMeg@mail.gmail.com>
Subject: Re: [GIT PULL v2] KVM/riscv fixes for 6.18 take #2
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YxDZDdkckJvQ-7g6ucZ-gjas2e7hBzLdugoIvAFgEds_1762672045
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_230730_980656_A9D51EBD 
X-CRM114-Status: GOOD (  14.78  )
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

T24gU2F0LCBPY3QgMjUsIDIwMjUgYXQgMTI6MTTigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSB0aHJlZSBmaXhlcyBm
b3IgdGhlIDYuMTgga2VybmVsLiBUd28gb2YgdGhlc2UKPiBhcmUgcmVsYXRlZCB0byBjaGVja2lu
ZyBwZW5kaW5nIGludGVycnVwdHMgd2hlcmVhcwo+IHRoZSB0aGlyZCBvbmUgcmVtb3ZlcyBhdXRv
bWF0aWMgSS9PIG1hcHBpbmcgZnJvbQo+IGt2bV9hcmNoX3ByZXBhcmVfbWVtb3J5X3JlZ2lvbigp
Lgo+Cj4gUGxlYXNlIHB1bGwuCgpQdWxsZWQsIHRoYW5rcy4KClBhb2xvCgo+Cj4gUmVnYXJkcywK
PiBBbnVwCj4KPiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDNhODY2MDg3ODgz
OWZhYWRiNGYxYTZkZDcyYzMxNzljMWRmNTY3ODc6Cj4KPiAgIExpbnV4IDYuMTgtcmMxICgyMDI1
LTEwLTEyIDEzOjQyOjM2IC0wNzAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9z
aXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlzY3YvbGludXguZ2l0IHRh
Z3Mva3ZtLXJpc2N2LWZpeGVzLTYuMTgtMgo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVw
IHRvIDhjNWZhMzc2NGZhY2FhZDZkMzgzMzZlOTBmNDA2YzJjMTFkNjk3MzM6Cj4KPiAgIFJJU0Mt
VjogS1ZNOiBSZW1vdmUgYXV0b21hdGljIEkvTyBtYXBwaW5nIGZvciBWTV9QRk5NQVAgKDIwMjUt
MTAtMjQKPiAyMToyNDozNiArMDUzMCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3YgZml4ZXMgZm9y
IDYuMTgsIHRha2UgIzIKPgo+IC0gRml4IGNoZWNrIGZvciBsb2NhbCBpbnRlcnJ1cHRzIG9uIHJp
c2N2MzIKPiAtIFJlYWQgSEdFSVAgQ1NSIG9uIHRoZSBjb3JyZWN0IGNwdSB3aGVuIGNoZWNraW5n
IGZvciBJTVNJQyBpbnRlcnJ1cHRzCj4gLSBSZW1vdmUgYXV0b21hdGljIEkvTyBtYXBwaW5nIGZy
b20ga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKCkKPgo+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBGYW5neXUg
WXUgKDIpOgo+ICAgICAgIFJJU0MtVjogS1ZNOiBSZWFkIEhHRUlQIENTUiBvbiB0aGUgY29ycmVj
dCBjcHUKPiAgICAgICBSSVNDLVY6IEtWTTogUmVtb3ZlIGF1dG9tYXRpYyBJL08gbWFwcGluZyBm
b3IgVk1fUEZOTUFQCj4KPiBTYW11ZWwgSG9sbGFuZCAoMSk6Cj4gICAgICAgUklTQy1WOiBLVk06
IEZpeCBjaGVjayBmb3IgbG9jYWwgaW50ZXJydXB0cyBvbiByaXNjdjMyCj4KPiAgYXJjaC9yaXNj
di9rdm0vYWlhX2ltc2ljLmMgfCAxNiArKysrKysrKysrKysrKy0tCj4gIGFyY2gvcmlzY3Yva3Zt
L21tdS5jICAgICAgIHwgMjUgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1LmMgICAgICB8ICAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgMjYgZGVsZXRpb25zKC0pCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
