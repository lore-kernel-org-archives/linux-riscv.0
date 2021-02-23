Return-Path: <SRS0=jBL8=HZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0572C433E9
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:58:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B51964DF3
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B51964DF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=WfwZm93UfhJ0TqAsTXl2bHUsRGERW/5+WpR9Ij7KMqc=; b=TDgU7IEgKlz2x0/Ulu8dl581l
	J6NOKPkhbYD58/xJGX3uQAYQYs+crF5nWv0Hn29hzHPiSS9L9MfDrvP84rCipdliYx1CbsAxk84Hr
	MRw2gjXQJo8jluxZuXzUrrPKfCTi8ziW3m7ztUuSAJOQm3Lz/KS5CULVCIFCkaTZ3dmRNrVsy/D4H
	ptnqwT4S22/IdEyDPnVggFsdiuA5cLQCcJdfpusm5CP6wBppRc/XZZL84lNTahf3PRviEt0wxbaeE
	g3p2pbrOVGxMAWj6hrPN1aIGisBWxOOtznfR8ACgjsU1NgdwE0AdAh7D3T5PiexVcMJ0TUGX3O+65
	r2A1WnYtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lENu8-0000Zk-Tg; Tue, 23 Feb 2021 02:58:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lENu5-0000Xy-83
 for linux-riscv@lists.infradead.org; Tue, 23 Feb 2021 02:58:26 +0000
Received: by mail-pl1-x635.google.com with SMTP id f8so8965827plg.5
 for <linux-riscv@lists.infradead.org>; Mon, 22 Feb 2021 18:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=69faGMiqKu3nPyYAESPRzQr/N8GaW/xblPmvz3UTUyk=;
 b=p3c4YUSBMWjuo9w902cfnr7CT3hEXcNms1mFbon5F1U4TssdL5MH7X50J1wGMCJ8li
 d28LUYz6P2KU/NyJUWsJaq5EUDpW8oEAk4JRuhj23pfWvYy7b5gdE6C0S82N7J525n9G
 HY2CJOy0xhfaYM5IfmcY2BKDU6zMO4eXE1kVn6Qttf6itw4RiG3W+ApjLUMmHy37eySm
 OaRGz37uppx7ZW4Y2ot6xYcaMrUZ4I/IhPVaI4O/nyokzhFHi9qMreSJKRILUKu+qIZH
 gqkOWDGG9YfD35F2+/gABqF7LBM4fyWefYQDvQXqgzUWv+jooLva/7Sq6WOlvR9xcNeU
 DTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=69faGMiqKu3nPyYAESPRzQr/N8GaW/xblPmvz3UTUyk=;
 b=gWJofplEMkIpEh/8irfDo4A4/ILByXX7HctZsuT9YjhbHwA9BsKzx2dK4XfU+lk2OC
 8OmZL4xmhTZtbl/6UGh/Y3vKymQJ8PZt0gmoI1GDKXlNv3iUfjsK+tpgI2CpcWUqGviu
 CpeAUoVOh0PwumEtmH7uSOxXUsvFp2+jaEbgQrzq5EGQbJ6bIGi3xj8F3ByEvc7oeF1G
 sAQu7WrgZ7w6S99Nr6VWRmv+mkT/0UlRNugYBpCszlXCYFfuRuSiHnZbRmydSpCnx5PK
 yhBNekSzF/dgH0Bzc907+5BmZ2e5k81r25iJ2sq9Tzj+lr1e7CkU+WbbwRZxIUQGklK1
 P/wA==
X-Gm-Message-State: AOAM532H3dOb73TBylJ6PQCfXYyKt1iim4kfcoXWKmATj1qYL+SGBdjb
 VzpP9rYqTFIZgTDmuKerereBOw==
X-Google-Smtp-Source: ABdhPJzmV8wZkxXCgdmngyaKJBYUFNgz01I8ZxSK+X8E0TEjxI4BBcoVuj8o0nNcOYFNN9Tp6UocWg==
X-Received: by 2002:a17:90a:1990:: with SMTP id
 16mr17662033pji.26.1614049103146; 
 Mon, 22 Feb 2021 18:58:23 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z28sm8702512pfr.38.2021.02.22.18.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 18:58:22 -0800 (PST)
Date: Mon, 22 Feb 2021 18:58:22 -0800 (PST)
X-Google-Original-Date: Mon, 22 Feb 2021 18:58:14 PST (-0800)
Subject: Re: [PATCH 0/4] Kasan improvements and fixes
In-Reply-To: <24d45989-4f4e-281c-3f58-d492f0b582e9@ghiti.fr>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-a99773ba-c614-46dc-820a-4119dbc32ff5@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_215825_346064_A034D267 
X-CRM114-Status: GOOD (  17.41  )
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
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 glider@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aryabinin@virtuozzo.com, linux-riscv@lists.infradead.org, dvyukov@google.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAyMSBGZWIgMjAyMSAwNTo0MjowOCBQU1QgKC0wODAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBIaSwKPgo+IExlIDIvOC8yMSDDoCAyOjMwIFBNLCBBbGV4YW5kcmUgR2hpdGkgYSDD
qWNyaXTCoDoKPj4gVGhpcyBzbWFsbCBzZXJpZXMgY29udGFpbnMgc29tZSBpbXByb3ZlbWVudHMg
Zm9yIHRoZSByaXNjdiBLQVNBTiBjb2RlOgo+Pgo+PiAtIGl0IGJyaW5ncyBhIGJldHRlciByZWFk
YWJpbGl0eSBvZiB0aGUgY29kZSAocGF0Y2ggMS8yKQo+PiAtIGl0IGZpeGVzIG92ZXJzaWdodCBy
ZWdhcmRpbmcgcGFnZSB0YWJsZSBwb3B1bGF0aW9uIHdoaWNoIEkgdW5jb3ZlcmVkCj4+ICAgIHdo
aWxlIHdvcmtpbmcgb24gbXkgc3Y0OCBwYXRjaHNldCAocGF0Y2ggMykKPj4gLSBpdCBoZWxwcyB0
byBoYXZlIGJldHRlciBwZXJmb3JtYW5jZSBieSB1c2luZyBodWdlcGFnZXMgd2hlbiBwb3NzaWJs
ZQo+PiAgICAocGF0Y2ggNCkKPj4KPj4gQWxleGFuZHJlIEdoaXRpICg0KToKPj4gICAgcmlzY3Y6
IEltcHJvdmUga2FzYW4gZGVmaW5pdGlvbnMKPj4gICAgcmlzY3Y6IFVzZSBLQVNBTl9TSEFET1df
SU5JVCBkZWZpbmUgZm9yIGthc2FuIG1lbW9yeSBpbml0aWFsaXphdGlvbgo+PiAgICByaXNjdjog
SW1wcm92ZSBrYXNhbiBwb3B1bGF0aW9uIGZ1bmN0aW9uCj4+ICAgIHJpc2N2OiBJbXByb3ZlIGth
c2FuIHBvcHVsYXRpb24gYnkgdXNpbmcgaHVnZXBhZ2VzIHdoZW4gcG9zc2libGUKPj4KPj4gICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2thc2FuLmggfCAgMjIgKysrKystCj4+ICAgYXJjaC9yaXNj
di9tbS9rYXNhbl9pbml0LmMgICAgIHwgMTE5ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9u
cygtKQo+Pgo+Cj4gSSdtIGNjLWluZyBsaW51eC1hcmNoIGFuZCBsaW51eC1tbSB0byBnZXQgbW9y
ZSBjaGFuY2UgdG8gaGF2ZSByZXZpZXdlcnMKPiBvbiB0aGlzIHNlcmllcy4KClNvcnJ5IGFib3V0
IHRoYXQsIEkgbXVzdCBoYXZlIG1pc3NlZCB0aGVzZS4gIEZvciBzb21lIHJlYXNvbiBJIHJlbWVt
YmVyIGhhdmluZwpyZWFkIHRoZSBiaWcgb25lLCBzbyBJJ20gbm90IHN1cmUgd2hhdCBoYXBwZW5l
ZC4gIFRoZXkncmUgb24gZm9yLW5leHQuCgpUaGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
