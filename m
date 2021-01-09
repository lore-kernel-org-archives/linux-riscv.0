Return-Path: <SRS0=RTcI=GM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314C7C433DB
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 23:14:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB0E223975
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 23:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB0E223975
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=U3QBLUUmjw8cnCHJGzXGkHOCQ5GDzxP1IJ0XxLV8W3c=; b=rGk4aG3nLoF/1+01n/gmZU9Ze
	mGQmgYeuTzOY5W4DP//A1U3mjgjVxBmV/ZBNHImsMNTXI7tTbmsMGMN5rjtquZXs0ZYnWCgsl0Jul
	FLY9iz7/L1p9mf/ofA7R/1vguJLdh99SsjzhPE61Om9tHW7wxFhL1c543OyVhhA+SJ3Sl61lfRS2q
	42uvDIcJUTqUXnrPjs9K0irvcMeCDGlm2ua54MiQQTMFXFsyEIYD4esrqmDCaKTawOl/3ZGTmhnBb
	zpwUCCi4jDKdGZqdjdyTqJ8Pw3ZDcXO9EK5cim1ZA6887a+PvuG8zO5nkgiOpRqnT2E56usUOPOF+
	+iyodmCDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyNQe-00074E-9B; Sat, 09 Jan 2021 23:13:52 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyMa9-0002z6-7F
 for linux-riscv@lists.infradead.org; Sat, 09 Jan 2021 22:19:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id c79so8592896pfc.2
 for <linux-riscv@lists.infradead.org>; Sat, 09 Jan 2021 14:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Capgbp/dt7U3VaDyo30/Tlsjp4h3DMjt7mEakkeJC+4=;
 b=q8jKBBGZ6iQjzWaxKZPWm2+3w98kZPLtkaDOjC1Sy6p7bN6UV/Z+yPJiwALX8BNacC
 hzmqgXx+YOlzicIdASvGK227gswmHtLcrAWCZaTZjisiTZo9tf95T7dXguiYtf6pTKVT
 3Qf/J0bXXhaBLDBiWLRBtD3zwFmgnrNAuI/Z/gZ0Vpk5ijviBBj/pkDBJQkPAsGzSIGy
 98D4+kd79jrckguA0yonXEsoL36XXoiQyBHDjD8o45rsjEWfY7x0tUjzfBy4RhkKgr3O
 Nh5wQY/7ikWoCV01i1fZm03+MhzSdbdAw2MQWn0KwnbdXzUfhyx4WTy8EZ4AukC5KK5D
 1T3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Capgbp/dt7U3VaDyo30/Tlsjp4h3DMjt7mEakkeJC+4=;
 b=bDipogggeS/LlySznuWCKWgKEZdgn+XNKWU+UNvwnWBk5yTR6nsk5yQiNaa+FhLwFk
 GFp4xmh2xDnlb0uVF/uMGJjUtVxlCTWkPl0WiLNrNv2emxwP/7Z534omEwEcbMmzGUpj
 PB23aI2EaslFeHwrsI8dKYfOt6eqrfhTqn1uX4YgXL970FDqXI640R10QvHl/56e6KcR
 5SXNaau3V5Lp70FaxgRj4ijRM36h7AO1xuxEGSeKKYP8+T7zUDqN8O08DM9OuVyleNnW
 Gn4ZL3SwUGgKlj7msE5UDEAbWxxa/8WlE4kfHBHlaLxEiEW9jXGu1bzMWGK6Q/zi2bfc
 rtyw==
X-Gm-Message-State: AOAM533Xt7F62BHWjfQDc9deVAcErUU35V2q83WH1B8bmGOTlRioTItD
 2j2ejo0Twx3UmKThXASiSS67vA==
X-Google-Smtp-Source: ABdhPJzo11lICRCe9K63jD8J69VP+6l3vb3RXIWEVKOOVMbVPZ2lVw2cRSxhQ1xXpQaA0U+Qi7Wu2w==
X-Received: by 2002:a63:e5e:: with SMTP id 30mr13407413pgo.181.1610230774690; 
 Sat, 09 Jan 2021 14:19:34 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u189sm12829586pfb.51.2021.01.09.14.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jan 2021 14:19:33 -0800 (PST)
Date: Sat, 09 Jan 2021 14:19:33 -0800 (PST)
X-Google-Original-Date: Sat, 09 Jan 2021 14:19:27 PST (-0800)
Subject: Re: [PATCH] riscv: Drop a duplicated PAGE_KERNEL_EXEC
In-Reply-To: <60ad2faf-87d1-4db9-00f3-c1a380706b5f@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-414f7ec8-c4b3-4405-8bba-eeb5cfef16b3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_171937_422437_223058E0 
X-CRM114-Status: GOOD (  13.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxNCBEZWMgMjAyMCAwMzozMDoxOSBQU1QgKC0wODAwKSwgd2FuZ2tlZmVuZy53YW5n
QGh1YXdlaS5jb20gd3JvdGU6Cj4gSGkgUGFsbWVyLMKgIGtpbmRseSBwaW5nLi4KPgo+IE9uIDIw
MjAvMTEvMTEgMTk6NTIsIEtlZmVuZyBXYW5nIHdyb3RlOgo+PiBjb21taXQgYjkxNTQwZDUyYTA4
ICgiUklTQy1WOiBBZGQgRUZJIHJ1bnRpbWUgc2VydmljZXMiKSBhZGQKPj4gYSBkdXBsaWNhdGVk
IFBBR0VfS0VSTkVMX0VYRUMsIGtpbGwgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBX
YW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmggfCAxIC0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+PiBpbmRleCAxODNmMWY0YjJhZTYu
LjczZThiNWU1YmI2NSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmgKPj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4gQEAgLTk5
LDcgKzk5LDYgQEAKPj4gICAJCQkJfCBfUEFHRV9ESVJUWSkKPj4KPj4gICAjZGVmaW5lIFBBR0Vf
S0VSTkVMCQlfX3BncHJvdChfUEFHRV9LRVJORUwpCj4+IC0jZGVmaW5lIFBBR0VfS0VSTkVMX0VY
RUMJX19wZ3Byb3QoX1BBR0VfS0VSTkVMIHwgX1BBR0VfRVhFQykKPj4gICAjZGVmaW5lIFBBR0Vf
S0VSTkVMX1JFQUQJX19wZ3Byb3QoX1BBR0VfS0VSTkVMICYgfl9QQUdFX1dSSVRFKQo+PiAgICNk
ZWZpbmUgUEFHRV9LRVJORUxfRVhFQwlfX3BncHJvdChfUEFHRV9LRVJORUwgfCBfUEFHRV9FWEVD
KQo+PiAgICNkZWZpbmUgUEFHRV9LRVJORUxfUkVBRF9FWEVDCV9fcGdwcm90KChfUEFHRV9LRVJO
RUwgJiB+X1BBR0VfV1JJVEUpIFwKClRoYW5rcywgdGhpcyBpcyBvbiBmaXhlcy4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
