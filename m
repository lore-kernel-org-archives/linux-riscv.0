Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50879C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 11:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oyd/vPzUHsGXbVt6PdtmFFlb+o/XuxdfPsmxEYt7Bq4=; b=Hg8TVyyqxJ1ZEp
	SrzEew+cY2/6CmxfhrtWbOJWy2uxPv1rm3aMjBhEUj/WvSo6MMf71AWxJ3fkHWxA7uUzyOK2WulJs
	avCIUY7Wpcvo6ItiEokF37mGyuKxSz85Td8BFCT6H1QJUHs805ahfhU9f7KhnwZuew+z9q9ncpKU0
	OZIy/CnfQaXAVJ6uAnILSz0BcTOKY4OrRcljneJEODaWWsrOUs1KDwIkBsqDjKJbTmQqD7XvHpomO
	vPRvmGGDgAIk3dFtOykizdK7+tB9sc9wjdZ+J9g66PaDAPH0VmvkUyh4KPgBKzAClvGfJjuvGbc4u
	P1HReqKxfGaDJIELDvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLyW-00DoNr-20;
	Thu, 04 Jan 2024 11:33:24 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLLyU-00DoLL-0y
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 11:33:23 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-36068b66f2aso684235ab.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1704368001; x=1704972801; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Dt7uLNKLulzrg/dNC959xAVcdyKjB2fv5qTZvClME8=;
        b=po+0ts9NFf4st8UnX4CwKGWEtKN3yNz+pMFXsS7fV/RNzGVR4oEDmq9nYTjNJgdlHZ
         cLK/W5DPU1ymSTU8F822I7Ey8gINMYSI8uWXWausYlG8zetoUMNDCD6N5vgmFEXLlmCl
         BoqRlY4M56cIJadar0UxsXLkM9A+JlCmbZQfCiI8y5527dN1exigflurDFYIGkc3knjy
         1PPYaMCHIqGKWaM78XT21Nfo+eN0KdsTVnzFSjn3NOhEg8avKWyDjLf0h4Sc0CVAOkzW
         sqtzJ5qp60z93vdc8XkmtMYjoFY/JNZpIGZnDOrbpI/M4AnM0JXvbQ7kYWKiu9uvdziA
         0d8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704368001; x=1704972801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Dt7uLNKLulzrg/dNC959xAVcdyKjB2fv5qTZvClME8=;
        b=hReJ7tlHXO8Baz5w6BfpclQEzYn3MHlhkMXafpJ60PhwK+QbTe2iz5zSevxdRqp2d9
         VIZmfneVHtfoza7fixqLyoquzE1GcKplq34ftA/6ZWDaS5z3OFLKhe4aJvXbUlVDISaB
         /vnzv1ppP+L7wWoSSC1c4CWTaq6bjl9BptPE73tqKBoy23OFi4yprK4nsbFOhywz9wds
         /esdnmvGemTR4X/fywb4FWxD4w7eZKuocTn73U9dxmrphgB/Y2tCXC4fsZ/E6UeFvYRD
         QKVXr2To4J2y8lb0xKjDHIWWT/E5qBGTU8hoiM3ZdaNHAMx0OoJIy0ELjFMYPHaLtvJD
         A3ww==
X-Gm-Message-State: AOJu0YyMha4zO64cQcY3b0eWw6smSaTgmSIAic/CE1JksqT9bV8CLdxy
	KIXdUrDyhevrOZ4mD6qqttFJA5cJEFDWbRhv/1Xxd7Q1fxBltQ==
X-Google-Smtp-Source: AGHT+IEiLv7qiits4vk8xdWF1s4r4OiPqhbNMM2mLBiLLO2wGlETEHoIcyBn6dRE3jspd9+Bb4GSzadf5GgKpkLl1DU=
X-Received: by 2002:a05:6e02:17c9:b0:360:16c7:2d6a with SMTP id
 z9-20020a056e0217c900b0036016c72d6amr482112ilu.48.1704368001050; Thu, 04 Jan
 2024 03:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20240104104307.16019-2-ajones@ventanamicro.com>
 <20240104-d5ebb072b91a6f7abbb2ac76@orel> <752c11ea-7172-40ff-a821-c78aeb6c5518@ghiti.fr>
 <20240104-6a5a59dde14adcaf3ac22a35@orel>
In-Reply-To: <20240104-6a5a59dde14adcaf3ac22a35@orel>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jan 2024 17:03:10 +0530
Message-ID: <CAAhSdy0uVZXsP1_3zZiwXXEXBZGkmWX5ujptirojD8S4nuzQpQ@mail.gmail.com>
Subject: Re: Re: [PATCH] RISC-V: KVM: Require HAVE_KVM
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, atishp@atishpatra.org, rdunlap@infradead.org, 
	sfr@canb.auug.org.au, mpe@ellerman.id.au, npiggin@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, pbonzini@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_033322_342610_69F8EDAB 
X-CRM114-Status: GOOD (  13.18  )
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

T24gVGh1LCBKYW4gNCwgMjAyNCBhdCA0OjUx4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEphbiAwNCwgMjAyNCBhdCAxMjowNzo1
MVBNICswMTAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBPbiAwNC8wMS8yMDI0IDExOjUy
LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiA+IFRoaXMgYXBwbGllcyB0byBsaW51eC1uZXh0LCBi
dXQgSSBmb3Jnb3QgdG8gYXBwZW5kIC1uZXh0IHRvIHRoZSBQQVRDSAo+ID4gPiBwcmVmaXguCj4g
Pgo+ID4KPiA+IFNob3Vkbid0IHRoaXMgZ28gdG8gLWZpeGVzIGluc3RlYWQ/IFdpdGggYSBGaXhl
cyB0YWc/Cj4KPiBJJ20gbm90IHN1cmUgaG93IHVyZ2VudCBpdCBpcyBzaW5jZSBpdCdzIGEgcmFu
ZGNvbmZpZyB0aGluZywgYnV0IGlmIHdlCj4gdGhpbmsgaXQgZGVzZXJ2ZXMgdGhlIC1maXhlcyB0
cmFjayB0aGVuIEkgY2FuIGRvIHRoYXQuIFRoZSBGaXhlcyB0YWcgaXNuJ3QKPiBzdXBlciBlYXN5
IHRvIHNlbGVjdCBzaW5jZSwgd2hpbGUgaXQgc2VlbXMgbGlrZSBpdCBzaG91bGQgYmUgODEzMmQ4
ODdhNzAyCj4gKCJLVk06IHJlbW92ZSBDT05GSUdfSEFWRV9LVk1fRVZFTlRGRCIpLCBpdCBjb3Vs
ZCBhbHNvIGJlIDk5Y2RjNmMxOGMyZAo+ICgiUklTQy1WOiBBZGQgaW5pdGlhbCBza2VsZXRhbCBL
Vk0gc3VwcG9ydCIpLgo+Cj4gSSdsbCBsZWF2ZSBib3RoIHRoZSB1cmdlbmN5IGRlY2lzaW9uIGFu
ZCB0aGUgRml4ZXMgdGFnIHNlbGVjdGlvbiB1cCB0bwo+IHRoZSBtYWludGFpbmVycy4gQW51cD8g
UGFvbG8/CgpMZXRzIGFkZAoKRml4ZXM6IDk5Y2RjNmMxOGMyZCAoIlJJU0MtVjogQWRkIGluaXRp
YWwgc2tlbGV0YWwgS1ZNIHN1cHBvcnQiKQoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
