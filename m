Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93FCC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 01:35:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FA67613DB
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 01:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FA67613DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=U6O6hbO3PIForPV+GEpLnVSaMLJCqNBOtFRXPM6iG5Y=; b=ha/weE02EtvRcm8+mnDzU1MUV
	2laSMJOAsYX46RbU9bpQLF7LU5wLqhUqtRDQ5sjGrjqft/ZrHnZcWjd3iz9/oM2lY96QWGbZoA4Bm
	28gaEpn32KZJNFy5uA1DvbfWQsAHU1B5KdmzU0aS6CoFkzIoE7p/Fy0GH7POsysmvtiYNENtUes6d
	rHJtasFLIuPdxXaLVdvJ1vBXMhMEIZ6mgxWm8rFZkTnq9ravlfcDDALMp/ZRv9Du+mq6iRKtt9vDl
	9bFGq4dakUcR3PqwN4vPbh5JuxNPSG3zUyaCjUnBiKThRqq13BvlBPGtlnSTf1yyyh7d98oDvbH9r
	FWtDR1smw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZkim-000Hgf-1R; Fri, 23 Apr 2021 01:35:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZkie-000HfI-Il
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 01:34:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=2u9IVBbrQtK5nxCkY5Ql7e2S1s+pJgrMEaI8rlOVi1A=; b=dPBYpkfw91SgZviiwmN/S4jrM9
 XhdKZWAiglzDK2SCJ1aak3yCB6kSgE33CcRuo3RveyUlcJyeFcAr/L37tURkhoBjggkC/sEgQdJg5
 vGPqae8xRPLMSlYxoY14k14up3ChV797BwaTISigiOMoGflCqpT3O2fF7wDdIkSMj4IeJmRzWLv+T
 Eqq9TDJOnlkuWJ8VToW5y3IvHaweF5mwqXang3mrPAg60clOACNIWdofnbvzSA5H52a5CgjbBqYIJ
 oKuJSIVYpc8tGjuSTKNPVKg/tpkM//jOEwZsrzsOZUjraWP+4NOw6MQFtGOfDiqSNNnpTguO70i89
 QGzGIHug==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZkib-00E5Ig-HT
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 01:34:55 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so3646086pjb.1
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 18:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2u9IVBbrQtK5nxCkY5Ql7e2S1s+pJgrMEaI8rlOVi1A=;
 b=kTIabuH9XG8EpGNkxN0ttB2TSmNE1UXivJVL/O3iBhAmQtRpUGW6mdNngm3gaVyfHk
 mZd9igv/ZBylu7j0rFkbzyVbfgP+ZKtnZIFUq1iqZQmxygpodGL8feHFwTGP6bxSDycC
 aS/dcIescNWiXHRyi86Y8JX+grwyam5ml+aVSu0fu1iKHlX2FNXST0o08A+dKXWyewrs
 Kh2wSpw3Z38NA32RLIlAhlUrXsT3V8u9XqihnCW3TDKfRab7JiRIMyde0fJAEMOA6t0x
 dHExxcIpGTZcYxxvXbTeDJKIXOlCaRLkaiKneXlRbAMT21PyRBSE/QeEK7EInSAU7Ulk
 lR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=2u9IVBbrQtK5nxCkY5Ql7e2S1s+pJgrMEaI8rlOVi1A=;
 b=Y2V9/EO16ImLegBf/kZS7M0DMy4s96pZw2kOirMX44FkjBRpg3C2VQh9ONRMPksl6L
 Gp9cKjCuEQbL3lDsLJ2HGqfCEcTHEuGkY7A0+poawjdQHwgirnYHoNdb29NxMjt/s6Eb
 jLv5VvAguGR3ZTMr9dNh1dFNq96FL7ogQsqv3bR54fpcA6xAfWxsNZIT6fpj/2hnRE1A
 zes60TKDJ/5zDMP+KkfVPO7bmLry92WkJlddvUGO3VA+upCDGlFxW9b0h9cXEZVXycKl
 AfApsDyE/ETLaoUrU3FM92n+aDQedyXaty0YHEnWN/4sWu8j9darBx9KIJQyOfUdjcZ4
 DDAQ==
X-Gm-Message-State: AOAM533zyPwvYtMoDPf/vUwkZyGKs0DuWEPw4m+oxjrsYaG1/lSdpuar
 DzgxwyU3BtrB+ISsAa1ARp5+Ag==
X-Google-Smtp-Source: ABdhPJyPGTWn9ZwTGF0D0ZB3bx8F9D7skQtSMEe+BuiaPPW01VWIa1OOFmwPEC3wIJMBb5FDn5+xdg==
X-Received: by 2002:a17:90b:950:: with SMTP id
 dw16mr3058402pjb.68.1619141690659; 
 Thu, 22 Apr 2021 18:34:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w140sm3106903pfc.176.2021.04.22.18.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 18:34:50 -0700 (PDT)
Date: Thu, 22 Apr 2021 18:34:50 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 18:34:48 PDT (-0700)
Subject: Re: [PATCH] riscv: Protect kernel linear mapping only if
 CONFIG_STRICT_KERNEL_RWX is set
In-Reply-To: <72130961-0419-9b1f-e88e-aa1e933f2942@ghiti.fr>
CC: anup@brainfault.org, corbet@lwn.net,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, aryabinin@virtuozzo.com,
 glider@google.com, 
 dvyukov@google.com, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-45fde203-6fd8-408c-b911-3efbb83d9cf3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_183453_601217_27FE0F48 
X-CRM114-Status: GOOD (  22.96  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAxNyBBcHIgMjAyMSAxMDoyNjozNiBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBMZSA0LzE2LzIxIMOgIDEyOjMzIFBNLCBQYWxtZXIgRGFiYmVsdCBhIMOpY3JpdMKg
Ogo+PiBPbiBGcmksIDE2IEFwciAyMDIxIDAzOjQ3OjE5IFBEVCAoLTA3MDApLCBhbGV4QGdoaXRp
LmZyIHdyb3RlOgo+Pj4gSGkgQW51cCwKPj4+Cj4+PiBMZSA0LzE2LzIxIMOgIDY6NDEgQU0sIEFu
dXAgUGF0ZWwgYSDDqWNyaXTCoDoKPj4+PiBPbiBUaHUsIEFwciAxNSwgMjAyMSBhdCA0OjM0IFBN
IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6Cj4+Pj4+Cj4+Pj4+IElmIENP
TkZJR19TVFJJQ1RfS0VSTkVMX1JXWCBpcyBub3Qgc2V0LCB3ZSBjYW5ub3Qgc2V0IGRpZmZlcmVu
dAo+Pj4+PiBwZXJtaXNzaW9ucwo+Pj4+PiB0byB0aGUga2VybmVsIGRhdGEgYW5kIHRleHQgc2Vj
dGlvbnMsIHNvIG1ha2Ugc3VyZSBpdCBpcyBkZWZpbmVkIGJlZm9yZQo+Pj4+PiB0cnlpbmcgdG8g
cHJvdGVjdCB0aGUga2VybmVsIGxpbmVhciBtYXBwaW5nLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+Cj4+Pj4KPj4+PiBNYXliZSB5b3Ug
c2hvdWxkIGFkZCAiRml4ZXM6IiB0YWcgaW4gY29tbWl0IHRhZyA/Cj4+Pgo+Pj4gWWVzIHlvdSdy
ZSByaWdodCBJIHNob3VsZCBoYXZlIGRvbmUgdGhhdC4gTWF5YmUgUGFsbWVyIHdpbGwgc3F1YXNo
IGl0IGFzCj4+PiBpdCBqdXN0IGVudGVyZWQgZm9yLW5leHQ/Cj4+Cj4+IFlhLCBJJ2xsIGRvIGl0
LsKgIE15IHRlc3RpbmcgYm94IHdhcyBqdXN0IHRpZWQgdXAgbGFzdCBuaWdodCBmb3IgdGhlIHJj
OAo+PiBQUiwgc28gSSB0aHJldyB0aGlzIG9uIGZvci1uZXh0IHRvIGdldCB0aGUgYnVpbGRib3Rz
IHRvIHRha2UgYSBsb29rLgo+PiBJdCdzIGEgYml0IHRvbyBsYXRlIHRvIHRha2Ugc29tZXRoaW5n
IGZvciB0aGlzIHdlZWssIGFzIEkgdHJ5IHRvIGJlCj4+IHByZXR0eSBjb25zZXJ2YXRpdmUgdGhp
cyBsYXRlIGluIHRoZSBjeWNsZS7CoCBUaGVyZSdzIGFub3RoZXIga3Byb2JlcyBmaXgKPj4gb24g
dGhlIGxpc3Qgc28gaWYgd2UgZW5kIHVwIHdpdGggYW4gcmM4IEkgbWlnaHQgc2VuZCB0aGlzIGFs
b25nIHdpdGgKPj4gdGhhdCwgb3RoZXJ3aXNlIHRoaXMnbGwganVzdCBnbyBvbnRvIGZvci1uZXh0
IGJlZm9yZSB0aGUgbGluZWFyIG1hcAo+PiBjaGFuZ2VzIHRoYXQgZXhlcmNpc2UgdGhlIGJ1Zy4K
Pj4KPj4gWW91J3JlIG1vcmUgdGhhbiB3ZWxjb21lIHRvIGp1c3QgZGlnIHVwIHRoZSBmaXhlcyB0
YWcgYW5kIHJlcGx5LCBteQo+PiBzY3JpcHRzIHB1bGwgYWxsIHRhZ3MgZnJvbSByZXBsaWVzIChq
dXN0IGxpa2UgUmV2aWV3ZWItYnkpLsKgIE90aGVyd2lzZQo+PiBJJ2xsIGRvIGl0IG15c2VsZiwg
bW9zdCBwZW9wbGUgZG9uJ3QgcmVhbGx5IHBvc3QgRml4ZXMgdGFncyB0aGF0Cj4+IGFjY3VyYXRl
bHkgc28gSSBnbyB0aHJvdWdoIGl0IGZvciBwcmV0dHkgbXVjaCBldmVyeXRoaW5nIGFueXdheS4K
Pgo+IEhlcmUgaXQgaXM6Cj4KPiBGaXhlczogNGI2N2Y0OGRhNzA3ICgicmlzY3Y6IE1vdmUga2Vy
bmVsIG1hcHBpbmcgb3V0c2lkZSBvZiBsaW5lYXIgbWFwcGluZyIpCgpUaGFua3MuICBJIGp1c3Qg
c3F1YXNoZWQgaXQsIHRob3VnaCwgYXMgSSBoYWQgdG8gcmV3cml0ZSB0aGlzIGFueXdheS4KCj4K
PiBUaGFua3MsCj4KPj4KPj4gVGhhbmtzIGZvciBzb3J0aW5nIHRoaXMgb3V0IHNvIHF1aWNrbHkh
Cj4+Cj4+Pgo+Pj4+Cj4+Pj4gT3RoZXJ3aXNlIGl0IGxvb2tzIGdvb2QuCj4+Pj4KPj4+PiBSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPj4+Cj4+PiBUaGFuayB5
b3UhCj4+Pgo+Pj4gQWxleAo+Pj4KPj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gQW51cAo+Pj4+Cj4+
Pj4+IC0tLQo+Pj4+PiDCoCBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIHwgOCArKysrLS0tLQo+
Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+
Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3NldHVwLmMKPj4+Pj4gaW5kZXggNjI2MDAzYmI1ZmNhLi5hYjM5NGQxNzNj
ZDQgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPj4+Pj4gKysr
IGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+Pj4+PiBAQCAtMjY0LDEyICsyNjQsMTIgQEAg
dm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGluZV9wKQo+Pj4+Pgo+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgIHNiaV9pbml0KCk7Cj4+Pj4+Cj4+Pj4+IC3CoMKgwqDCoMKgwqAgaWYgKElT
X0VOQUJMRUQoQ09ORklHX1NUUklDVF9LRVJORUxfUldYKSkKPj4+Pj4gK8KgwqDCoMKgwqDCoCBp
ZiAoSVNfRU5BQkxFRChDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1gpKSB7Cj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByb3RlY3Rfa2VybmVsX3RleHRfZGF0YSgpOwo+Pj4+
PiAtCj4+Pj4+IC0jaWYgZGVmaW5lZChDT05GSUdfNjRCSVQpICYmIGRlZmluZWQoQ09ORklHX01N
VSkKPj4+Pj4gLcKgwqDCoMKgwqDCoCBwcm90ZWN0X2tlcm5lbF9saW5lYXJfbWFwcGluZ190ZXh0
X3JvZGF0YSgpOwo+Pj4+PiArI2lmZGVmIENPTkZJR182NEJJVAo+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwcm90ZWN0X2tlcm5lbF9saW5lYXJfbWFwcGluZ190ZXh0X3JvZGF0
YSgpOwo+Pj4+PiDCoCAjZW5kaWYKPj4+Pj4gK8KgwqDCoMKgwqDCoCB9Cj4+Pj4+Cj4+Pj4+IMKg
ICNpZmRlZiBDT05GSUdfU1dJT1RMQgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHN3aW90bGJfaW5p
dCgxKTsKPj4+Pj4gLS0KPj4+Pj4gMi4yMC4xCj4+Pj4+Cj4+Pj4KPj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+Pj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4+PiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+Pj4KPj4K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
