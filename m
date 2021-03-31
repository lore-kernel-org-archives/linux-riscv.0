Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873FDC433C1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 08:11:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03034619D3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 08:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03034619D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=94/dYaEcHbxvHvjxzQLBTirjc9NcR6S+zh9vqOjtMuk=; b=a7qtqAq1bncav7K8TxT+Iz97v
	UXqMlAU1/l1QK5P85wsuC7JcNdr3iKe7jc9Zg1oVOtN9DPj/V15CGiezDSgItIMHXIgzMpFJSJEl5
	zAfKr3Hfkx6Je1DHgpBdl3JXavLpoqyyoQpOPuT64HpCD4udB/5urRCssAI10pYiI5IoMdGyH02vu
	WMlvxN+1R9CXOLVIbtuEwEVNCB9+56xxzRaqhX2Td7myh+3ZbyvsaHXFnbgQr1fr2EADblR0L6X8m
	TEzklDxc7UdzA1YwcLQX63XiVn+Cp1LkM9c3bdC4tSwaUjOyZuAYiE9SID75ZXNkvBIb9u5rpKgOI
	4Sap/3ktg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRVwv-005u9t-ES; Wed, 31 Mar 2021 08:11:37 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRVwq-005u8p-Uf
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 08:11:34 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so18154478oty.12
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 01:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dB0gWAEfZHKWfkYzrwK4EeStUrUWxM9Hj/xXv+mALOI=;
 b=NfAdeXgL3iBuXyT9lp5nzsqiQkroT5annb1uZOmXLpNXmjk+hpy6F0F+FRveH5r1/1
 XUzWiLPwYLgMQpX7ndNKM/1Qb31qLumbWtNZQusMYrgg8eMH1glsHsq/VJKJN5v2OYR8
 qlBQFWstfKVN2XnQPUDzNgkhphm66qbGOBTBFija6FUExwqS3l/h9zS9h/dnZ35ZwNPY
 xKL9YsEOPaF9+P7hWg1B/adoSFuYlqcuzoKUqDELe9HIeVvQKUk279LunGX4e4WH6Z0g
 6bohdzIgiulsiOxgbI7yia63Elb8jGWDWKhOgYMlcQwDermLHfQijNchYgbhutEiOEjD
 /VVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dB0gWAEfZHKWfkYzrwK4EeStUrUWxM9Hj/xXv+mALOI=;
 b=Hi6LJOtE5IxL83O9QiNqfMf5x++7c43bmRUzxLF29OhMDzAYoUadnFwnU5dioXqbz7
 V6/woAfj3b/N6f0Dgh16DVc6jgYJxRR4FwqeUG3RkrXP87vWdYXWiWWRgyNBwIYezMp9
 gxXyAKiF/P/0pv12Ovq8smgScdRAiAoff5OI6jwUbN3d2h3ESw/heIZZxpzkE2kAvqTs
 MO98VoiCkpw7EswlI3cjSGbr6v7xpFeWJq8yNPWdD3/WIUmati65/VkNHmaq3iqEyPbr
 Cgm6rdw6Tsl9ngstW0LWrc29UlMPTfYFc6kWxV2OsINZTAJMBVpOWd9yd8LcVeCwtSQY
 gPZg==
X-Gm-Message-State: AOAM531EcvUQjvz/nKAZz4LCv/PDGT6ekwf8lEhUWZjq/GOgY2aucsB3
 aXVHVM/Da68qQCsZP97C9aPRA7C76DEaZQNOp6V+kw==
X-Google-Smtp-Source: ABdhPJwncnEGkqPa53glb2cwgGqHNjR8JoKY4ey9u94NBOGSLTlyqhNGXBFQt2Q3v3VffMEnW3Ti9RMoqF56AIEeisY=
X-Received: by 2002:a9d:6249:: with SMTP id i9mr1781965otk.166.1617178290874; 
 Wed, 31 Mar 2021 01:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
 <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home>
 <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
 <874kgyfetu.fsf@igel.home>
 <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
 <87h7kukzy4.fsf@igel.home>
In-Reply-To: <87h7kukzy4.fsf@igel.home>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 31 Mar 2021 16:11:20 +0800
Message-ID: <CANXhq0r5_xhFu3W9mUFkp_7BYUVBzvHZE1A6jpBDcL_KwTc1cA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pragnesh Patel <pragnesh.patel@openfive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_091133_191214_5A716262 
X-CRM114-Status: GOOD (  17.67  )
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

T24gTW9uLCBNYXIgMjksIDIwMjEgYXQgNjozNyBQTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQGxp
bnV4LW02OGsub3JnPiB3cm90ZToKPgo+IE9uIE3DpHIgMjkgMjAyMSwgWm9uZyBMaSB3cm90ZToK
Pgo+ID4gWWVzLCBJIGNvdWxkIGdldCB0aGUgbmV0d29yayBwcm9ibGVtIGJ5IHVzaW5nIHRoZSBk
ZWZjb25maWcgeW91Cj4gPiBwcm92aWRlZCwgdGhlIHN5c3RlbSBodW5nIHVwIHdoZW4gZXhlY3V0
aW5nICdpZmNvbmZpZycgaW1tZWRpYXRlbHkKPiA+IGFmdGVyIGluc3RhbGxpbmcgbWFjYiBkcml2
ZXIgbW9kdWxlLCB0aGUgbmV0d29yayBjYW4gd29yayBieSBvbmx5Cj4gPiByZXZlcnRpbmcgdGhl
IGNvbW1pdCA3MzIzNzRhMGI0NDBkOWE3OWM4NDEyZjMxOGEyNWNkMzdiYTZmNGUyLiBCdXQgdGhl
Cj4gPiBuZXR3b3JrIGlzIGZpbmUgYnkgdXNpbmcgdGhlIG1haW5saW5lJ3MgZGVmY29uZmlnLCB0
aGlzIGlzIGEgbGl0dGxlCj4gPiBiaXQgd2VpcmQsIEkgd2lsbCBjaGVjayB0aGF0IGFuZCB0cnkg
dG8gZmluZCB0aGUgZGlmZmVyZW5jZS4KPgo+IE15IGd1ZXNzIHdvdWxkIGJlIHRoYXQgaXQgaXMg
YW4gaW5pdCBkZXBlbmRlbmN5IHByb2JsZW0gYmV0d2VlbiB0aGUgcGh5Cj4gZHJpdmVyIGFuZCB0
aGUgY2xvY2sgZHJpdmVyLCB3aGljaCBjYXVzZXMgdGhlIGNsb2NrIHRvIGJlIGVuYWJsZWQgdG9v
Cj4gbGF0ZS4KPgoKSSBmb3VuZCB0aGF0IHRoZSBnZW1neGxwbGwgd2FzIGRpc2FibGVkIGltbWVk
aWF0ZWx5IGJ5IHBvd2VyCm1hbmFnZW1lbnQgYWZ0ZXIgbWFjYiBkcml2ZXIgaW5zdGFsbC4gVGhl
IG1haW5saW5lJ3MgZGVmY29uZmlnIGRvZXNuJ3QKZW5hYmxlIENPTkZJR19QTSwgc28gdGhlIG5l
dHdvcmsgaXMgZmluZSBvbiBpdC4gVGhlIG9wZW5zdXNlIGRlZmNvbmZpZwplbmFibGVzIENPTkZJ
R19QTSwgYW5kIHRoZSBwYXRjaAo3MzIzNzRhMGI0NDBkOWE3OWM4NDEyZjMxOGEyNWNkMzdiYTZm
NGUyIGFkZGVkIHRoZSBlbmFibGUvZGlzYWJsZQpjYWxsYmFjayBmdW5jdGlvbnMsIHNvIHRoZSBn
ZW1neGxwbGwgUExMLCBJIGhhdmUgbm8gaWRlYSB3aHkgcG93ZXIKbWFuYWdlbWVudCBkaXNhYmxl
IGl0LCBJIHdvdWxkIGtlZXAgdHJhY2UgaXQuCgpCeSB0aGUgd2F5LCBJIHRyaWVkIHRvIGRpc2Fi
bGUgQ09ORklHX1BNIG9uIG9lbnBzdXNlIGRlZmNvbmZpZywgdGhlCnN5c3RlbSBkaWRuJ3QgaGFu
ZyBhbnltb3JlLCBvbiB0aGUgY29udHJhcnksIEkgZW5hYmxlIENPTkZJR19QTSBvbgptYWlubGlu
ZSdzIGRlZmNvbmZpZywgSSBleHBlY3QgdGhhdCB0aGUgc3lzdGVtIHdvdWxkIGhhbmcgdXAgYXMg
d2VsbCwKdW5mb3J0dW5hdGVseSwgSSBjYW5ub3QgYm9vdCBzdWNjZXNzZnVsbHkgYnkganVzdCBl
bmFibGluZyBDT05GSUdfUE0KZWFzaWx5LgoKCj4gQW5kcmVhcy4KPgo+IC0tCj4gQW5kcmVhcyBT
Y2h3YWIsIHNjaHdhYkBsaW51eC1tNjhrLm9yZwo+IEdQRyBLZXkgZmluZ2VycHJpbnQgPSA3NTc4
IEVCNDcgRDRFNSA0RDY5IDI1MTAgIDI1NTIgREY3MyBFNzgwIEE5REEgQUVDMQo+ICJBbmQgbm93
IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQuIgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
