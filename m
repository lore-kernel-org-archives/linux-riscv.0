Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17369CD4F25
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nc9N6DQnOIfUcs+oyt/zqCgmOqTLSaOybcJ9/5hdhYA=; b=H8iVL/Cnh85fJ3
	diLInOh59G9IC3kHp45cOTEKFSZrAXPvmqpBxvS5PCGzsS8n5AFtAo8iP5clIWGA+ZBR34655ld67
	nOZAB0w62I+SqQUvvaf4IgF3vleA7qSnh9na7hg2ZCdMBaGu4ijVAclyq3dN2oxt5W0cXAgdfCcmF
	+B87b+Z6MkyrQrReAhBxbkJug6r9Hmjm/2l3DneG+mAx5UiDfJk0TBI7ONDIvzBrYIa2L8oItnFFH
	+7AOwUOlvCxgDHnhXie2F6hhC6OajgRMyMG/+XGg0+b44INU9gEWDQkt2Q48NdHShZIrZ6qLKuBBm
	bNRXU4y6xxVvQcrEQbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtTm-00000008ZRA-0uj3;
	Fri, 15 May 2026 14:25:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtTj-00000008ZQU-3A4C
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 14:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778855126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
	b=K0PW0xV1+81YwAXVqpf7OmSNpZfrEHsssxl+bFB+jeaBufZ4eoVkDxGQdgijdLs8f35dpH
	yysLGsrlz1Y8iz5HNTDt8B4/46zxJ99Fehj5iB5s0K845kO5nKjOZNCFBCKvLFxbu2YLR7
	CxRsgbIjWVDwK9xg6EBPOeFeF/7Iqkg=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-kUMLFpB8PIOwmvjSkoJXjw-1; Fri, 15 May 2026 10:25:24 -0400
X-MC-Unique: kUMLFpB8PIOwmvjSkoJXjw-1
X-Mimecast-MFC-AGG-ID: kUMLFpB8PIOwmvjSkoJXjw_1778855124
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-65d7e8b971dso19647029d50.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 07:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778855124; x=1779459924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x7Embi/4WSTFlWQtHoiZCAOUQi9JugMiQF8nvMXYC0Y=;
        b=SAiu8QCLffGn0ieTgoAJkV8s51p1VSsVjHVqGawOdBqwpYPHh/jsxPHeWu9UV6TKAp
         C8QEQ9vyVGBHxYk38zrH8nvQht4+At/sx4vZ4qgbdpFylnGkL3KAXAwEwCt3x68sh7ql
         bwLJMahQ2tFTd5VVtrRGP02S0Vffj+v44r1byrXhINe3vHcQWlDpMOdHPcXnmgpgYTIL
         asKJEnwnZAN/0oXMfjAul/rAbLzXVK2YcuULgUO2jVniMns83pl/fP8mTEIXokXf5hyz
         cca/qtZ7QVBQKnv+mJj5yo/Hs6hC8NffXVtDX/BLBybIqCjczUb6yzRVcnzJ6Wuyc25i
         SODw==
X-Forwarded-Encrypted: i=1; AFNElJ834Gvkd/GEfmhT5YgAkoac7WoVnNSJdoc0tkrHfm/M5g/TsezRp24d4fTUAu1kK4uvKzNrVnzOIiqwBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu3P1FgBBopvzrmVYD6jvgMK/TG6+JB4CTlpKb7EAn7U5y7E4S
	ScnI96NCVqPtalznG/JDWNLPUJFBCLOvQZ2vap9vqyaiaj4pGIHyy/967Q2GkExC0RbgL2HYbGp
	lvM6Q+1xCKCJA7eg6F/Nzy438L+oVOAshKypHEsQdmNjQp/vIJHyJTAn98jDwHl8Rc41Z8uYSBi
	P++/E3S7O4Ube0Ifq9BzsSKhY1dY0gNLVptfij7cxdRvfC
X-Gm-Gg: Acq92OHypSsm1PI/Ap63MTaRAPBb6pT8txhQFMRQXyP0lF2UBLapTA0g3sdgraW7BHz
	HMPXX+CG+mwYbg45z/hwx3BwSRjvCasq5PiXYD3q6kk6zOGhaiA3XyPuY8b+m2DMbRzWD9CFyXZ
	443i5beN6mgQWV+EDuynkdlULt/4+JwFU80nhrcnUlNMQH+a0tjyv61xxvd3UHD4IVtknnRultt
	3vVwg==
X-Received: by 2002:a05:690c:921a:b0:7b2:136d:240a with SMTP id 00721157ae682-7c95a56fc91mr34927967b3.9.1778855123616;
        Fri, 15 May 2026 07:25:23 -0700 (PDT)
X-Received: by 2002:a05:690c:921a:b0:7b2:136d:240a with SMTP id
 00721157ae682-7c95a56fc91mr34927427b3.9.1778855122973; Fri, 15 May 2026
 07:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com> <7bcead90-7d96-4101-bd13-dde2c5ded1aa@roeck-us.net>
In-Reply-To: <7bcead90-7d96-4101-bd13-dde2c5ded1aa@roeck-us.net>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 15 May 2026 16:25:11 +0200
X-Gm-Features: AVHnY4II_A6w9jZTl5s671EZUUpKeCpv5nVKmn-MiUqfHzgEw_QM_N-JJo0K588
Message-ID: <CADSE00JVgP50vud_3uvvjg6HDeEwc1TsK0E=gSKV07jKtT+vMQ@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] kunit: Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -4HLunS3jmk7IVOWwIG52wbmahStahQi7mHEfnMaW3Y_1778855124
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_072527_865569_74B23C42 
X-CRM114-Status: GOOD (  14.41  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMzo1MeKAr1BNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJv
ZWNrLXVzLm5ldD4gd3JvdGU6Cj4KPiBIaSBBbGJlcnQsCj4KPiBPbiA1LzE1LzI2IDA1OjI5LCBB
bGJlcnQgRXN0ZXZlIHdyb3RlOgo+IC4uLgo+Cj4gPiBHdWVudGVyIFJvZWNrICgzKToKPiA+ICAg
ICAgICBrdW5pdDogQWRkIGJhY2t0cmFjZSBzdXBwcmVzc2lvbiBzZWxmLXRlc3RzCj4gPiAgICAg
ICAgZHJtOiBTdXBwcmVzcyBpbnRlbnRpb25hbCB3YXJuaW5nIGJhY2t0cmFjZXMgaW4gc2NhbGlu
ZyB1bml0IHRlc3RzCj4gPiAgICAgICAga3VuaXQ6IEFkZCBkb2N1bWVudGF0aW9uIGZvciB3YXJu
aW5nIGJhY2t0cmFjZSBzdXBwcmVzc2lvbiBBUEkKPiA+Cj4KPgo+IEhvdyBtdWNoIG9mIHRoYXQg
aXMgZnJvbSBtZSBhdCB0aGlzIHBvaW50ID8gV291bGRuJ3QgaXQgbWFrZSBzZW5zZSB0byBkcm9w
IG1lCj4gYXMgImF1dGhvciIgb2YgdGhvc2UgcGF0Y2hlcyA/CgpIaSBHdWVudGVyLAoKSSBkbyBu
b3QgbWluZCBhdXRob3JzaGlwIGVpdGhlci4gU2lnbmVkLW9mZi1ieSBsaW5lcyBhbHJlYWR5IGF0
dGVzdCB0bwpldmVyeW9uZSdzIGNvbnRyaWJ1dGlvbi4KCkluIHByaW5jaXBsZSBJIGFtIGRvbmUg
d2l0aCBTYXNoaWtvJ3MgcmV2aWV3cy4gSSBhZGRyZXNzZWQgYWxsCmNvbW1lbnRzIGluIHRoZWly
IHJlc3BlY3RpdmUgcGF0Y2hlcy4gU29tZSBsZWFkIHRvIHRoZSByYWJiaXQgaG9sZXMgSQpwdXQg
bXlzZWxmIGludG8gZm9yIHByZXZpb3VzIHZlcnNpb25zLgoKSSBkbyBub3QgcGxhbiB0byBzZW5k
IGEgbmV3IHZlcnNpb24gdW5sZXNzIGEgaHVtYW4gcmV2aWV3IHJlcXVpcmVzIGEgY2hhbmdlLgoK
SWYgdGhhdCBoYXBwZW5zLCBJIG1heSB1cGRhdGUgdGhlIGF1dGhvcnNoaXAuIE90aGVyd2lzZSwg
SSdkIGtlZXAgaXQKYXMgaXMsIHNpbmNlIHlvdSBzYWlkIHlvdSBkbyBub3QgbWluZCA6KQoKVGhh
bmtzIQoKQlIsCkFsYmVydC4KCj4KPiBJIHdvdWxkIG5vdCBtaW5kLiBJIGhhZCB0aGUgaWRlYSwg
YnV0IG90aGVycyBsaWtlIHlvdSBhcmUgZG9pbmcgdGhlIGhhcmQgd29yawo+IG9mIHB1c2hpbmcg
aXQgdGhyb3VnaC4KPgo+IFRoYW5rcywKPiBHdWVudGVyCj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
