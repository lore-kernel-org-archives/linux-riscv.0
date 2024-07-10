Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4326C3DA45
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jul 2024 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgNKNx/gmJKhjJIucdVUz+bd9W6HiLyo+970m1osLsw=; b=ShVJOzX9KEqXOk
	NZr2O2WZ7WcdaK8Wow6q74MqZv5xPxKXQNgtagwKiuQe9yT4Kz88T/6ssIq8EVZzFQzg0INhdVV5N
	ugaPfGodqUfe3b5+s5c+TDaujxSSHlEX0AhF4OwZBdAGLryvgnMOQOE3baR0y/lu9LM8EfFTO65lJ
	4gGdplvZlk4HKb/mlCkBLjh1ELtvBvJCp7VjnpQdTNr5ZKJ2WN1iXkuOy5xn++p9zSQOWSgwh6PLB
	cOpsgjfPgP4gTpa/LXO8CSoGe4zWYugJSO1sMMSsUxWgP7xNXOjCt8U3pdpWeBOAUY+mCBWiwvucf
	tp9pdOp94gNFBQ55Gn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRcFs-0000000BRfv-12wA;
	Wed, 10 Jul 2024 18:41:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRcFp-0000000BRf3-3xfL
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jul 2024 18:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720636884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eIVX3Nh3vYBEeF7J3Cswb85HDhmhS0B4NjP2O37xgE=;
	b=SQTvqH1VXrn9Aeo9m4R4YTmFmJBf4WEoW2fqcuCBo5NG6yeuiXKftDZYA1CgjrXS7BENA5
	1oX7SZXS216FmWepvlxj0YLTuHUwr8hOv+UBxn6k4gkfB7VfeYz8Txv51tiVtFaJIxiYfP
	4lkkkN2Omj56okHVNTOoi1jCxsb938s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-MFVn1HD5M0WFD0cbt8Alog-1; Wed, 10 Jul 2024 14:41:22 -0400
X-MC-Unique: MFVn1HD5M0WFD0cbt8Alog-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7a140b002b2so1971885a.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jul 2024 11:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720636882; x=1721241682;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+eIVX3Nh3vYBEeF7J3Cswb85HDhmhS0B4NjP2O37xgE=;
        b=CRRo5QZlOQkrLn8FLyWjOobIiP8VN+rH8NJLAh+UY70lJLkEg8BkBTarhmATe2EDtB
         Mm2wXdus487X1+rw+DiYJwmHNcqAZnQsqZHQjn/zzLKv97Wq0uCWZ+OyLO3KQAg3IemP
         yrktN/ExKhglqlKs/8+/AqsVIYUcNCHUG8NwxtFcEoyiuGe8DS2hlk1CZWi+logF3hF0
         xM/v39DIh6/e3rULSCJInqnNU0dHgsxM6vw2vNBJtS3gRi6tiulWDnwKHr61CTreawbx
         N7DpoSxb3sxRKyfSpnhrawKyk5yH+NOHTuMlhgyWvDADeB7LIBI4eq6v55+IyyylRuk0
         HoYg==
X-Forwarded-Encrypted: i=1; AJvYcCX8XeYP07ZDYTCFsep+fgei6hoSJKtxQAMgHLrQCBfCCL8xQcAQau3ACC+UjOGOm1wM79Cud2XCMrFxVYVx825z4VZIP0zdwReSDWXfKaiX
X-Gm-Message-State: AOJu0YyWgI/yub3ct6UTNMXT5kVb8VxQluXSvJkr6IQ0gQTYb7ykbeCM
	59XrUGkYXXhcJqTaQG0yO2gW9FPzbjjOvTGxz+Nw13pRb4l+OCzvjY1JQcSPW5xLUss2vnjYOL+
	ZQMMGIWXWcRCBfx92Tfs3ogCGZoZe3vZ4QtS9Ldx7hKBxD4OLAuSeHFxH9G7aeGN97A==
X-Received: by 2002:ac8:4c82:0:b0:447:f0c4:8298 with SMTP id d75a77b69052e-44cfc3fa56amr3702511cf.2.1720636882419;
        Wed, 10 Jul 2024 11:41:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETdUfrXNqDgbDS7Z1BhFJRvI4WQSOwSqIDdD+5+bC0SwiVZqBADzNnXqHzy4Zdi40FUQ/PVQ==
X-Received: by 2002:ac8:4c82:0:b0:447:f0c4:8298 with SMTP id d75a77b69052e-44cfc3fa56amr3702401cf.2.1720636882087;
        Wed, 10 Jul 2024 11:41:22 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-447f9b26c83sm22681111cf.2.2024.07.10.11.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 11:41:21 -0700 (PDT)
Date: Wed, 10 Jul 2024 14:41:19 -0400
From: Peter Xu <peterx@redhat.com>
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 3/3] mm: Add p{g/4}d_leaf() in
 asm-generic/pgtable-nop{4/u}d.h
Message-ID: <Zo7Vz_LGUgaf9BGN@x1n>
References: <bcd6ab8246348f18fdc77694e321ee6458f05781.1720597744.git.christophe.leroy@csgroup.eu>
 <f69941b076bf8fec89b6bec5573fdb79483c2a75.1720597744.git.christophe.leroy@csgroup.eu>
 <Zo6e1ILgDn6nuhGC@x1n>
 <b37a0bb5-ba6f-4db3-af8f-83e06eec086d@cs-soprasteria.com>
MIME-Version: 1.0
In-Reply-To: <b37a0bb5-ba6f-4db3-af8f-83e06eec086d@cs-soprasteria.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_114126_073500_6DF641B5 
X-CRM114-Status: GOOD (  16.42  )
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

T24gV2VkLCBKdWwgMTAsIDIwMjQgYXQgMDI6NTQ6MzZQTSArMDAwMCwgTEVST1kgQ2hyaXN0b3Bo
ZSB3cm90ZToKPiAKPiAKPiBMZSAxMC8wNy8yMDI0IMOgIDE2OjQ2LCBQZXRlciBYdSBhIMOpY3Jp
dMKgOgo+ID4gT24gV2VkLCBKdWwgMTAsIDIwMjQgYXQgMDk6NTE6MjJBTSArMDIwMCwgQ2hyaXN0
b3BoZSBMZXJveSB3cm90ZToKPiA+PiBDb21taXQgMmM4YTgxZGMwY2M1ICgicmlzY3YvbW06IGZp
eCB0d28gcGFnZSB0YWJsZSBjaGVjayByZWxhdGVkCj4gPj4gaXNzdWVzIikgYWRkZWQgcHVkX2xl
YWYoKSBpbiBpbmNsdWRlL2FzbS1nZW5lcmljL3BndGFibGUtbm9wbWQuaAo+ID4+Cj4gPj4gRG8g
dGhlIHNhbWUgZm9yIHA0ZF9sZWFmKCkgYW5kIHBnZF9sZWFmKCkgdG8gYXZvaWQgZ2V0dGluZyB0
aGVtCj4gPj4gZXJyb25lb3VzbHkgZGVmaW5lZCBieSBhcmNoaXRlY3R1cmVzIHRoYXQgZG8gbm90
IGltcGxlbWVudCB0aGUKPiA+PiByZWxhdGVkIHBhZ2UgbGV2ZWwuCj4gPj4KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+Cj4g
Pj4gLS0tCj4gPj4gdjI6IEFkZGVkIHBYZF9sZWFmIG1hY3JvIGFzIHdlbGwgaW4gYXNtLWdlbmVy
aWMvcGd0YWJsZS1ub3BYZC5oIHRvIGNvaGFiaXQgd2l0aCB0aGUgZmFsbGJhY2sKPiA+PiAtLS0K
PiA+IAo+ID4gVGhhbmtzLiAgSSdkIGRyb3AgdGhlIGlubGluZSBmdW5jdGlvbnMsIGJ1dCBubyBz
dHJvbmcgb3BpbmlvbnMuCj4gCj4gSW5saW5lIGZ1bmN0aW9ucyBlbmFibGUgdHlwZSBjaGVja2lu
Zy4KPiAKPiBXaXRoIGEgbWFjcm8geW91IHdvdWxkIGJlIGFibGUgdG8gd3JpdGUgcHVkX2xlYWYo
cGdkKSB3aXRob3V0IHRoZSAKPiBjb21waWxlciBub3RpY2luZyB0aGUgbWlzdGFrZS4KPiAKPiBB
bGwgb3RoZXIgaGVscGVycyBpbiBhc20tZ2VuZXJpYy9wZ3RhYmxlLW5vcFhkLmggYXJlIGZ1bmN0
aW9ucyBzbyBmcm9tIAo+IG15IHBvaW50IG9mIHZpZXcgaXQgbWFrZXMgc2Vuc2UgdG8ga2VlcCB0
aGVtIGFzIGZ1bmN0aW9ucyBub3QgbWFjcm9zLgoKV2hvZXZlciBmYWxsYmFja3MgdG8gdGhlIHBn
dGFibGUuaCBweHhfbGVhZigpIHdpbGwgc3RpbGwgdXNlIG1hY3JvcyBhbmQKbG9zZSB0aGUgdHlw
ZSBjaGVjayBhZ2Fpbi4gIEknZCByYXRoZXIgcmVseSBvbiBjcm9zcy1hcmNoIGJ1aWxkcyBhbmQg
bW9zdApvZiByZWFsICpfbGVhZigpIHVzZXJzIHdpbGwgYWx3YXlzIGRldGVjdCBhIHR5cGUgbWlz
bWF0Y2guCgpUb3RhbGx5IG5vIGJpZyBkZWFsLCBhbmQgSSBhZ3JlZSBrZWVwaW5nIHRoZW0gbWF0
Y2ggbm9weGQuaCBydWxlcyBtYWtlcwpzZW5zZS4KClRoYW5rcywKCi0tIApQZXRlciBYdQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
