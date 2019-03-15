Return-Path: <SRS0=KlHB=RS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DEFC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2019 11:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B1B21872
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2019 11:50:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SUo5eVJM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YfUpW3qF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07B1B21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alaJWHw8PfXRw1D9e8rBD5s25o+PSDNuISs015S0Dmk=; b=SUo5eVJMmKmCI0
	5B/uIbeSFzTYXHvNsSFzUP/rUwaHZnKbX+we9ltI5v3dz1wPJY+58AGzlicxI/H3RhTKNh4u7uZbm
	57dnoIS1YGoj3/OV5bF3I9RsS0nPaOUeqcf1SXQCyGO586wibusj3oAWYpxo7oi05flq8eOPWgGJQ
	68HDRv8Oh1btUyYZ6wH4rvL6DNMScNRFsuCm7cTeBOhO1HQTwRAUhVAi+jfzoZ4qoMy8zOVL69/sQ
	0XFiUlioKw0r5rxOa5dMs9/Z4yzT8BbL18OxmvzK4WENFq+2HiyjbGg4xZRWG1fZwRRvq8d6O40sm
	yF/ZOoZ/20XsemY2f+Ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4lMH-0001xs-29; Fri, 15 Mar 2019 11:50:41 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4lMF-0001xW-5D
 for linux-riscv@lists.infradead.org; Fri, 15 Mar 2019 11:50:39 +0000
Received: by mail-lf1-x144.google.com with SMTP id a6so4270580lfl.5
 for <linux-riscv@lists.infradead.org>; Fri, 15 Mar 2019 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1skTJj6HHHRWua0cE5sPm6z+McI8wT6PEJwIOHW+cdU=;
 b=YfUpW3qFaKDdwr6mDAJHFkULkW4dFhOnvNwl02zrPZaTkgVRw+lLZfgbsSv21wjrfs
 BzgtCPnUGKITg+jvw3XSJoXs763tYZACPeFPMiyz39zzaDOjYi8PzLD3Z65eCq35foj0
 sM/Qol/vg1lbFl4MDuR7y53WcukMuBODeRkJOX2a3Q+d5jWShzS6msXMqxR25Xe1UpW7
 J/WuowkIPFeHF1+DLLLKr3eTHPd8jaSE0d95eVWoNjbtk8bxSMzlt54tABF+eLhzR4tU
 1nXcdJyFStj22RfErLPL3qP3y8o6Cd8s4qkCUK2Srr7q6OzftKq+0ihpNa24yeFKEhFu
 WXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1skTJj6HHHRWua0cE5sPm6z+McI8wT6PEJwIOHW+cdU=;
 b=Tp6hr76DL+1Ink7lMbC5XOtbP3zjEXJLHGFIUL3m7Ghzro7UxDkJw6zgekWYZSq8IE
 hKlu+YojUFgvKDOJeI4t/8oWYDBWG6W7smxNFRVJRw/wiW/Ui/kMUhZLb0yEd95edEnM
 DyrntwsfJ07Ora4ccBL/bQ+pz/Wha4RH5C6ZNNTkj/DXN0FlvGlWJ9FRHkpA8L3k5hde
 dNUpq0ggxXY/3aPVylF1VlJyacQFPpPQUhjuz6QEHmkBH3BGyNo+GEne4bG59e5zfIen
 e0UpKYqTdF3FxCrza0PVdl2/5hEflnEk/lh5MV1DjatRv1KcCiXZr9rjvL2MTgOIPrdx
 cWRA==
X-Gm-Message-State: APjAAAUwoQv9LqDEEOTpff6ESnZOL91non+ui4igIAsacADs7/KIw6h1
 ytPrccvVkKFvmD0KjA71krruWf6ICA+FT0Jf42rMug==
X-Google-Smtp-Source: APXvYqx6PRctHDhf23YqBLIrUC0/mwToO1OVrYPngkl6cFQ3VChbtn8wJ/QcdddC2rFUq03Ysx4LHYZ5JK1WXDAo1K4=
X-Received: by 2002:a19:4948:: with SMTP id l8mr2115436lfj.156.1552650636613; 
 Fri, 15 Mar 2019 04:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
 <mvmimwotn60.fsf@suse.de>
In-Reply-To: <mvmimwotn60.fsf@suse.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Fri, 15 Mar 2019 17:19:59 +0530
Message-ID: <CAJ2_jOE3RH9FyFg_NATcLEpHv5y89zdh06Ji2x8n3C_gp-wn6A@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] PWM support for HiFive Unleashed
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_045039_225949_33D7CB7A 
X-CRM114-Status: GOOD (  10.17  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgMzo0NCBQTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQHN1
c2UuZGU+IHdyb3RlOgo+Cj4gT24gTcOkciAxMiAyMDE5LCBZYXNoIFNoYWggPHlhc2guc2hhaEBz
aWZpdmUuY29tPiB3cm90ZToKPgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBhIFBXTSBkcml2
ZXIgYW5kIERUIGRvY3VtZW50YXRpb24KPiA+IGZvciBIaUZpdmUgVW5sZWFzaGVkIGJvYXJkLiBU
aGUgcGF0Y2hlcyBhcmUgbW9zdGx5IGJhc2VkIG9uCj4gPiBXZXNsZXkncyBwYXRjaC4KPgo+IEhl
YXJ0YmVhdCB0cmlnZ2VyIHN0aWxsIGRvZXNuJ3Qgd29yayBmb3IgbWUuCgpZb3UgbmVlZCB0byBt
YWtlIHN1cmUgdGhlIHBlcmlvZCBzZXR0aW5nIGlzIHBhc3NlZCB2aWEgdGhlCmNvbnZlbnRpb25h
bCB3YXkgaW4gRFQgZmlsZS4KRXhhbXBsZToKcHdtbGVkcyB7CiAgICBjb21wYXRpYmxlID0gInB3
bS1sZWRzIjsKICAgIGhlYXJ0YmVhdCB7CiAgICAgICAgcHdtcyA9IDwmTDQ1IDAgMTAwMDAwMDAg
MD47CiAgICAgICAgbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKICAgICAgICBsaW51eCxkZWZhdWx0
LXRyaWdnZXIgPSAiaGVhcnRiZWF0IjsKICAgIH07Cn07CgpJIGhhdmUgdGVzdGVkIG9uIEhpRml2
ZSB1bmxlYXNoZWQgYm9hcmQuIFRvIG1vZGlmeSBEVCBmaWxlIEkgcGVyZm9ybWVkCnRoZSBmb2xs
b3dpbmcgc3RlcHM6CgpVc2UgdGhlIG9wZW4tc291cmNlIEZTQkwgZnJvbToKaHR0cHM6Ly9naXRo
dWIuY29tL3NpZml2ZS9mcmVlZG9tLXU1NDAtYzAwMC1ib290bG9hZGVyCgpNb2RpZnkgdGhlIGZz
YmwvdXgwMF9mc2JsLmR0cyBmaWxlIGFuZCByZS1idWlsZCB0aGUgZnNibC5iaW4KClN0ZXBzIGZv
ciB1c2luZyBmc2JsLmJpbiBpbiBIaUZpdmUgVW5sZWFzaGVkIGJvYXJkOgpodHRwczovL2dpdGh1
Yi5jb20vc2lmaXZlL2ZyZWVkb20tdTU0MC1jMDAwLWJvb3Rsb2FkZXIvaXNzdWVzLzkKCj4KPiBB
bmRyZWFzLgo+Cj4gLS0KPiBBbmRyZWFzIFNjaHdhYiwgU1VTRSBMYWJzLCBzY2h3YWJAc3VzZS5k
ZQo+IEdQRyBLZXkgZmluZ2VycHJpbnQgPSAwMTk2IEJBRDggMUNFOSAxOTcwIEY0QkUgIDE3NDgg
RTRENCA4OEUzIDBFRUEgQjlENwo+ICJBbmQgbm93IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBk
aWZmZXJlbnQuIgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
