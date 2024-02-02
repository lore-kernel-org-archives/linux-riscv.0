Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7D2C4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 15:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8Z9glZYW3VaVYYBCpmnLn2OdA21LJrm0c6j0LA369g=; b=1NspBj6jrjogTw
	kyZLeWxSiU69KQwsIo0ypgutCWVjyMWPwpsoVPHRQKubnnwwBxyOErXux/YiK+AsU5m9kJSXJMALI
	fcSXTqCwQnNxPRGACEkhNNl093Cb0Df+VkXIyxcUWK4UUEj/WzJ4EiAmLxy8pZN0sSM/pmO7YrZNI
	86/w38nhwER3XfDbEHuTziO3Iw5COzbgXy1kfSurYU0ljopYmOuA6DzphRW6BM/2DengjrcmmeKsi
	x9EZyTh+3o32/NrBVZet3m94DFWC6yeLdC61mxUFovZDxQgkzwW0XtPF9zvZLmwTeZqp6TXFzlgDX
	zayAWjbl6MesdU/ZsuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVvv5-0000000C8ms-0cX9;
	Fri, 02 Feb 2024 15:57:35 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVvv1-0000000C8jU-1556
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 15:57:33 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso2133848a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 07:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1706889448; x=1707494248; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlIoe5LzAxAXObzO7M0VagiApb4EW4Oo6kvC1FaV+E4=;
        b=WqWQF24vo+dat1hShv+O2b7pk5if1To46E90tvzyjcLivs+6HyOpeBau5MiNVPQXCW
         nB7ajb/ejuH/m8Ll3T9YmOXQaKiAubb9INToczxv9lK6zLWW7MW0BuzDUhNVXUL+qZJZ
         JrGILPTAQpoOFY2cx78jdUFdxK8MhmSwJnzuWI5q0zW4p9ZZJd9aeLnBv9u3oKJHNLyo
         +cfyKbl4CgwEJmWBk0f3vDrqZC0mUNY2GxwuwGeHLykMz716G+Rplh5iHE4YrrDFG4GC
         hqintJsj+JrF4cUytNSEJefR4LKu28Gq3wAQfHZginq479yhzcxd585AYBZES9/D8Pz2
         ykdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706889448; x=1707494248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlIoe5LzAxAXObzO7M0VagiApb4EW4Oo6kvC1FaV+E4=;
        b=H7qTrQd7Y4T5ReUTF6uPVxsosej5k2nkgXGAFKXX9+hhhBDoZ186Q8oh0I4+u5LG8y
         mp4fjN7WHNlg2KtD/ZZbJp9NR28DgS78r/06C1VMsyc1kr7EmceA6tIuC/7jakeieBWA
         WkqKxfUDQHy6AFljOmM37Pfs+eyAO/JEiw27/A48Rn7r1elHPBeCxJJ8Vku3xQmR4bh5
         eRCjvRvYWCkVEsVjeDr6G5SREbWBVyghuGO+d0E9okYW2x0FnKzf37Xx96hrdqdn3dgh
         kd2wesFV8hp7t5wyDioEK3bu4TgKooYIuEIMg/h/VwIFKZM8glzmPCLrbvIq0tbuxLYA
         l8hw==
X-Gm-Message-State: AOJu0YwGNj8cSTxstLVXsDHSDQc5Zzm2r/PQOq9Ws6cnfIY5wXz7xYgn
	PlBjJfuAIAEfwEdyKCtIt59WUJzinlOJMO+HML0eEV4/z2XdfBbb0PmQGOFH5iWN3cUoZp0yn9j
	C13DMkJz3TD4BhhX16i5FBxzxgbBJ+6Csl7oZOQ==
X-Google-Smtp-Source: AGHT+IGm4VZQs5z3255VLaQL80zuGrvlbVQOEOb456jECue/RPR6/iqDw1Dm1aMqvEmRwwi7rhjBisflSzv61RCS0w0=
X-Received: by 2002:a05:6a20:109f:b0:19e:3025:1f5a with SMTP id
 w31-20020a056a20109f00b0019e30251f5amr7468431pze.6.1706889448130; Fri, 02 Feb
 2024 07:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20240131120511.200338-5-ajones@ventanamicro.com>
In-Reply-To: <20240131120511.200338-5-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Feb 2024 21:27:15 +0530
Message-ID: <CAAhSdy3FNoE8Rog_fq4sVqf090GSMMuU3+nxHEK3O02YPY0E0Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] RISC-V: Fix sparse warnings
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_075731_573702_8BCA8A9C 
X-CRM114-Status: GOOD (  11.40  )
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

T24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgNTozNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQWZ0ZXIgdGhlIHN0ZWFsLXRpbWUgc2VyaWVzIHdh
cyBtZXJnZWQsIExLUCBzZW50IG1lIG1haWwgd2l0aCBzcGFyc2UKPiB3YXJuaW5ncyBmb3IgdGhl
IGxhY2sgb2YgdXNpbmcgYXBwcm9wcmlhdGUgcmVzdHJpY3RlZCB0eXBlcyBhbmQgYQo+IGxvY2Fs
IHZhcmlhYmxlIG5vdCBiZWluZyBzdGF0aWMuIFRoaXMgc2VyaWVzIG1ha2VzIHRoZSBmaXh1cHMK
PiBuZWNlc3NhcnkgdG8gYXBwZWFzZSBzcGFyc2UgZm9yIDY0LWJpdCBjb21waWxlcy4gQ2hhbmdl
cyB0bwo+IF9fZ2V0X3VzZXJfOCgpIGFuZCBfX3B1dF91c2VyXzgoKSBhcmUgbmVlZGVkIHRvIGNv
bXBsZXRlbHkgcXVpZXQKPiBzcGFyc2UgZm9yIDMyLWJpdCBjb21waWxlcy4gSSdsbCBhZGRyZXNz
IHRob3NlIDMyLWJpdCBzcGFyc2Ugd2FybmluZ3MKPiBzZXBhcmF0ZWx5LCBzaW5jZSBpdCdzIG5v
dCAxMDAlIGNsZWFyIGhvdyBiZXN0IHRvIGFwcHJvYWNoIGEgY291cGxlIG9mCj4gdGhlbS4KPgo+
IFRoYW5rcywKPiBkcmV3Cj4KPgo+IEFuZHJldyBKb25lcyAoMyk6Cj4gICBSSVNDLVY6IHBhcmF2
aXJ0OiBzdGVhbF90aW1lIHNob3VsZCBiZSBzdGF0aWMKPiAgIFJJU0MtVjogcGFyYXZpcnQ6IFVz
ZSBjb3JyZWN0IHJlc3RyaWN0ZWQgdHlwZXMKPiAgIFJJU0MtVjogS1ZNOiBVc2UgY29ycmVjdCBy
ZXN0cmljdGVkIHR5cGVzCgpRdWV1ZWQgdGhpcyBzZXJpZXMgYXMgZml4ZXMgZm9yIExpbnV4LTYu
OAoKVGhhbmtzLApBbnVwCgo+Cj4gIGFyY2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0LmMgIHwgIDYg
KysrLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jIHwgMjAgKysrKysrKysrKysr
LS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlv
bnMoLSkKPgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
