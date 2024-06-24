Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4103C2BD05
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0tC06j7ianvdDwbDTVQeqV5u27vo5KlOi5n8WED6nc=; b=Q1RgOKaLYas9tM
	7pHj1Ins+8D0MFdEovx24M07U80SEfR5ntPxJrqJozjxzvEIKgIU8/zeaHWH6bA/8ghhnvcon4hVJ
	hEyXDF85h5IOdgW/W8Az0w3EvhWJG8t9AxZxQTUZxeBG3gqLqUjtETTRAT8pjqYg0icqg5VzTVfc/
	UGtMnddZSMd46mJpDjJOYsi9dqIPxvz9Eg6TNcABFOoDhnpZDJulkftOeVlQYMt7OE2F7hwbdNHYj
	IKgIXtSHEwKTi9skUu+/mKA3whiabj5AAPr8Qg2nYcFhCab3a2pWZ2funJblv68uxXPstSPt/8nIx
	UAaoP9ZdY9D/VDt/iCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLg4L-0000000GGxk-0BHw;
	Mon, 24 Jun 2024 09:33:01 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLg4I-0000000GGwn-3KYA
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 09:33:00 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-57d07464aa9so3761953a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 02:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719221577; x=1719826377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSDzT24BI2p7JqoVBNan8p02CfsKp3kht22xLj1zjCQ=;
        b=PgXX7Cw1fa7O0Llo+/JO6amwovyyRccVR9jzylqFOF/ih0U5sxgzGxVsyUyOGIFC8E
         YtmsYkeiY1pJnW2iVfultvbQlsAjLINvI1Td/IM7roTCH6mbr2xHWentG1GSmzBX/4A8
         Cs6AweYlTdQQ5/j7C/zm2je1lV7pHCGTSbMhb01Pg4AhK3XhOQp4d3JSD/ACOCS94Cav
         LU3uGpI/Y7ivd1oJexMmC4i/CnKtbodffcj5669c1tAvE5PBAMaCRORCqDgosP4lpRn9
         +Os8mWsBJyreYnpZHDOglDHLDywQz9v5IerEOvpJZN+3QjKWaewLBBG1vihDNCmEk6NL
         a5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719221577; x=1719826377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSDzT24BI2p7JqoVBNan8p02CfsKp3kht22xLj1zjCQ=;
        b=teaf6/FBRIzkzW1GzLz78duy9diq2iAKI4dELzss7TXEbbd2KBCd70E60Rc3zL35kE
         uZAbLxwaVB8Kw8n/V36mnUveVAFwlH8zHLbKiZHVKWFnEeVAn9Kj8QMJ3akzugdkqPho
         kxcquTzvLyvkfdU5RWctiIvOG0DMFgoGvEuuBf7+Py0UwTcq4H9OVCUBw+vsNRnhZ1Be
         yzqiUAAJyt8ryEVn3vjPMEC7t+NJFfk0Mn4GNRQ1UQGPbB4qkqG/OeVLJyPbX0UX2sC5
         bODqRGB01Z9d0xw3M4V2kyqnRBTZ2rdGmmFmk7t3Goj1DvjVxluQ0u+6md9YklO4fyFz
         uAYA==
X-Forwarded-Encrypted: i=1; AJvYcCWpbixRCaxCCDm94GnxqJI2vJ2kHiliBT2bDie5gIBzCZb2Z+k1wC07OxCaeOlzrlfGiMZQhWWPCj2yQEspotsgTH9nM0Ek+BosWPn20GS5
X-Gm-Message-State: AOJu0YyR6AkCLNIL/zxCgswcEA2oyBBWVdUlIUWpEgMJclTarvP1Tnbh
	oSXcivdsgARXP4UxcMl/hfb2yuJdqDzO0B6w1PlSVqmrMZrTjjy41UziCtZlf7QsEtqqrhKID1T
	+YJLMx4R04cZaYep+rXeA8J5YuxCTdC18ugRcXw==
X-Google-Smtp-Source: AGHT+IHXOtFoZ5Ms1VnEXer+u/bYL40w+BzdSznB1Ran7dPtsex2PEoJ5U03ch/VSdRA5dnKWSL056SniQ6koP4dx3Y=
X-Received: by 2002:a05:6402:40c5:b0:57d:543d:e35e with SMTP id
 4fb4d7f45d1cf-57d543de513mr1968208a12.5.1719221577025; Mon, 24 Jun 2024
 02:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240605114100.315918-1-bjorn@kernel.org> <20240605114100.315918-12-bjorn@kernel.org>
In-Reply-To: <20240605114100.315918-12-bjorn@kernel.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 24 Jun 2024 11:32:46 +0200
Message-ID: <CAHVXubgBKxOh0UjbSw2J_76MvZuiwSLL7d5=wAfiRZvgiUD=Ag@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] riscv: Enable DAX VMEMMAP optimization
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_023258_858033_B0474B43 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gNSwgMjAyNCBhdCAxOjQy4oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5j
b20+Cj4KPiBOb3cgdGhhdCBEQVggaXMgdXNhYmxlLCBlbmFibGUgdGhlIERBWCBWTUVNTUFQIG9w
dGltaXphdGlvbiBhcyB3ZWxsLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgfCAxICsKPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9L
Y29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggOGE0OWI1ZjRjMDE3Li4xNjMxYmY1
NjgxNTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNj
di9LY29uZmlnCj4gQEAgLTczLDYgKzczLDcgQEAgY29uZmlnIFJJU0NWCj4gICAgICAgICBzZWxl
Y3QgQVJDSF9XQU5UX0dFTkVSQUxfSFVHRVRMQiBpZiAhUklTQ1ZfSVNBX1NWTkFQT1QKPiAgICAg
ICAgIHNlbGVjdCBBUkNIX1dBTlRfSFVHRV9QTURfU0hBUkUgaWYgNjRCSVQKPiAgICAgICAgIHNl
bGVjdCBBUkNIX1dBTlRfTERfT1JQSEFOX1dBUk4gaWYgIVhJUF9LRVJORUwKPiArICAgICAgIHNl
bGVjdCBBUkNIX1dBTlRfT1BUSU1JWkVfREFYX1ZNRU1NQVAKPiAgICAgICAgIHNlbGVjdCBBUkNI
X1dBTlRfT1BUSU1JWkVfSFVHRVRMQl9WTUVNTUFQCj4gICAgICAgICBzZWxlY3QgQVJDSF9XQU5U
U19OT19JTlNUUgo+ICAgICAgICAgc2VsZWN0IEFSQ0hfV0FOVFNfVEhQX1NXQVAgaWYgSEFWRV9B
UkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFCj4gLS0KPiAyLjQzLjAKPgoKUmV2aWV3ZWQtYnk6IEFs
ZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
