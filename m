Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5F3CD3432
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 03:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqc0zoNNWFx+aDpu2nSUwuWhamDGMVs2KmwP55+Izm4=; b=qkSCcLoD/AgqM6
	85hRJ2zBk0FUd108mMwUDy+BZoFR6A6GbB37/aHW16Rpyer7tGxFgknY275iX9VHgR/GW7F/tnCcW
	tDOSfeGeJHkC3IocALPOFCI9ug4qGZsgnqj6Aqu0gSqAETMkFrJDEe4uM877fsStfk4XsV0Czbx5p
	srNEr8H1VeM7zqjdeYV+houPzu+cj+7u/EPjj5TsWoKsdDi4AjRWcWBw4ACySOFU3JBF8R7tKdEan
	cCkqPg3rI/NzN+GWAFMwK/GmESOLnk7wxre3sKNOpn1TyEUJlgrseCweLlhRPxHsA2D+NQ+2Pi9Ec
	z5dHz9Ujuuay5Jhxkpog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRmD-00GqP3-2X;
	Tue, 19 Sep 2023 03:51:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiRmB-00GqNw-18
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 03:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695095510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y8rJDvUqOXwqZuoo1W57hjmHySlMvZ2epmiMYH9qiJQ=;
	b=NmzpZrK5wIILVlH18kA8K24j25xv3HXGXCX1DfEJ3V2xWKyswG+56S7oux2b+GhwAM+TvN
	7QPOAH26j9ylWL0lKmurWuDyxgcxPtFasTgofmdZM223R6x01toBkP2FjYaK2UogYwYbIH
	x6t8G7k+jSyFClk0izFOWv3Fk17p81U=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-WZZ0ebxdNLyEhgZIL083pw-1; Mon, 18 Sep 2023 23:51:46 -0400
X-MC-Unique: WZZ0ebxdNLyEhgZIL083pw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2748327f37dso3149921a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 20:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695095506; x=1695700306;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8rJDvUqOXwqZuoo1W57hjmHySlMvZ2epmiMYH9qiJQ=;
        b=w7qtIMx4JlC3XR7TbcFGJVb2cyVk8wKmKZ+odLEmURevt/dtdSP8DboxfApxbIkujP
         97M00YNKhOLx9VjfzaiqkDI77QBDW/BrZC05t05DiR3oSNgqouL1T1dtnYJSa8d8yGRZ
         zM+HWuzSBCM5xtQY7pymJNAnaywF+vVnUPk0xAnsNsu0KZw7z4xMO5o7KdIlFzNcC2JJ
         NTqRNlb4eDopHiMsbdr8gmZu7FWzdX6z95LDIuDgfVWJyIkNlok9ZsQkZqBPaeQI4zzG
         ZTiG+tlwxra3tcWAiGsVVJoqzWIEVn0SHS7b7otY8HFkI2aQb9VTaiqROElGDSeA18uI
         qEGw==
X-Gm-Message-State: AOJu0YzQE3VjQtBh4MgNQq+He2FhFND4lykscCW85uNTOvJVsO4pZMGY
	dp7sfs70AknuRVqLz3dzk2CQrX0uco2D5BR7kIX3TA8xhzSEC2wDIqQ/mOZy2iCKc1y5ddBnm7k
	XwmHIoAU9h8MDwjj66Qw8Ur0NL/K+
X-Received: by 2002:a17:90b:393:b0:274:655f:123a with SMTP id ga19-20020a17090b039300b00274655f123amr8825721pjb.17.1695095505871;
        Mon, 18 Sep 2023 20:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg0kbAirHQhF0f0R4Sjz7foDaanW0mDe+I8wg3s4HDKIw22zzaFMTZTEDJCKk2e/bcWdSB1Q==
X-Received: by 2002:a17:90b:393:b0:274:655f:123a with SMTP id ga19-20020a17090b039300b00274655f123amr8825704pjb.17.1695095505561;
        Mon, 18 Sep 2023 20:51:45 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id x34-20020a17090a6c2500b002684b837d88sm8566963pjj.14.2023.09.18.20.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 20:51:44 -0700 (PDT)
Message-ID: <0743752e-fd7a-c0b6-a193-196aef12b2a3@redhat.com>
Date: Tue, 19 Sep 2023 13:51:37 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH v2 29/35] irqchip/gic-v3: Don't return errors from
 gic_acpi_match_gicc()
From: Gavin Shan <gshan@redhat.com>
To: James Morse <james.morse@arm.com>, linux-pm@vger.kernel.org,
 loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 Russell King <linux@armlinux.org.uk>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com
References: <20230913163823.7880-1-james.morse@arm.com>
 <20230913163823.7880-30-james.morse@arm.com>
 <31fa3aa7-c12c-3eb7-e9d2-5967a735ac78@redhat.com>
In-Reply-To: <31fa3aa7-c12c-3eb7-e9d2-5967a735ac78@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_205151_460359_A7E3AD51 
X-CRM114-Status: GOOD (  22.88  )
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

T24gOS8xOS8yMyAxMzozOSwgR2F2aW4gU2hhbiB3cm90ZToKPiAKPiBPbiA5LzE0LzIzIDAyOjM4
LCBKYW1lcyBNb3JzZSB3cm90ZToKPj4gZ2ljX2FjcGlfbWF0Y2hfZ2ljYygpIGlzIG9ubHkgY2Fs
bGVkIHZpYSBnaWNfYWNwaV9jb3VudF9naWNyX3JlZ2lvbnMoKS4KPj4gSXQgc2hvdWxkIG9ubHkg
Y291bnQgdGhlIG51bWJlciBvZiBlbmFibGVkIHJlZGlzdHJpYnV0b3JzLCBidXQgaXQKPj4gYWxz
byB0cmllcyB0byBzYW5pdHkgY2hlY2sgdGhlIEdJQ0MgZW50cnksIGN1cnJlbnRseSByZXR1cm5p
bmcgYW4KPj4gZXJyb3IgaWYgdGhlIEVuYWJsZWQgYml0IGlzIHNldCwgYnV0IHRoZSBnaWNyX2Jh
c2VfYWRkcmVzcyBpcyB6ZXJvLgo+Pgo+PiBBZGRpbmcgc3VwcG9ydCBmb3IgdGhlIG9ubGluZS1j
YXBhYmxlIGJpdCB0byB0aGUgc2FuaXR5IGNoZWNrCj4+IGNvbXBsaWNhdGVzIGl0LCBmb3Igbm8g
YmVuZWZpdC4gVGhlIGV4aXN0aW5nIGNoZWNrIGltcGxpY2l0bHkKPj4gZGVwZW5kcyBvbiBnaWNf
YWNwaV9jb3VudF9naWNyX3JlZ2lvbnMoKSBwcmV2aW91cyBmYWlsaW5nIHRvIGZpbmQKPj4gYW55
IEdJQ1IgcmVnaW9ucyAoYXMgaXQgaXMgdmFsaWQgdG8gaGF2ZSBnaWNyX2Jhc2VfYWRkcmVzcyBv
ZiB6ZXJvIGlmCj4+IHRoZSByZWRpc3RyaWJ1dG9ycyBhcmUgZGVzY3JpYmVkIHZpYSBhIEdJQ1Ig
ZW50cnkpLgo+Pgo+PiBJbnN0ZWFkIG9mIGNvbXBsaWNhdGluZyB0aGUgY2hlY2ssIHJlbW92ZSBp
dC4gRmFpbHVyZXMgdGhhdCBoYXBwZW4KPj4gYXQgdGhpcyBwb2ludCBjYXVzZSB0aGUgaXJxY2hp
cCBub3QgdG8gcmVnaXN0ZXIsIG1lYW5pbmcgbm8gaXJxcwo+PiBjYW4gYmUgcmVxdWVzdGVkLiBU
aGUga2VybmVsIGdyaW5kcyB0byBhIHBhbmljKCkgcHJldHR5IHF1aWNrbHkuCj4+Cj4+IFdpdGhv
dXQgdGhlIGNoZWNrLCBNQURUIHRhYmxlcyB0aGF0IGV4aGliaXQgdGhpcyBwcm9ibGVtIGFyZSBz
dGlsbAo+PiBjYXVnaHQgYnkgZ2ljX3BvcHVsYXRlX3JkaXN0KCksIHdoaWNoIGhlbHBmdWxseSBh
bHNvIHByaW50cyB3aGF0Cj4+IHdlbnQgd3Jvbmc6Cj4+IHwgQ1BVNDogbXBpZHIgMTAwIGhhcyBu
byByZS1kaXN0cmlidXRvciEKPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgTW9yc2UgPGphbWVz
Lm1vcnNlQGFybS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My5j
IHwgMTggKysrKysrLS0tLS0tLS0tLS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlv
bnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Pgo+IAo+IFdpdGggYmVsb3cgbml0cyByZXNvbHZlZDoK
PiAKPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5AcmVkaGF0LmNvbT4KPiAKPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLmMgYi9kcml2ZXJzL2lycWNoaXAv
aXJxLWdpYy12My5jCj4+IGluZGV4IDcyZDNjZGViZGFkMS4uMGY1NDgxMTI2MmViIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My5jCj4+ICsrKyBiL2RyaXZlcnMvaXJx
Y2hpcC9pcnEtZ2ljLXYzLmMKPj4gQEAgLTI0MTUsMjEgKzI0MTUsMTUgQEAgc3RhdGljIGludCBf
X2luaXQgZ2ljX2FjcGlfbWF0Y2hfZ2ljYyh1bmlvbiBhY3BpX3N1YnRhYmxlX2hlYWRlcnMgKmhl
YWRlciwKPj4gwqDCoMKgwqDCoCAvKgo+PiDCoMKgwqDCoMKgwqAgKiBJZiBHSUNDIGlzIGVuYWJs
ZWQgYW5kIGhhcyB2YWxpZCBnaWNyIGJhc2UgYWRkcmVzcywgdGhlbiBpdCBtZWFucwo+PiAtwqDC
oMKgwqAgKiBHSUNSIGJhc2UgaXMgcHJlc2VudGVkIHZpYSBHSUNDCj4+ICvCoMKgwqDCoCAqIEdJ
Q1IgYmFzZSBpcyBwcmVzZW50ZWQgdmlhIEdJQ0MuIFRoZSByZWRpc3RyaWJ1dG9yIGlzIG9ubHkg
a25vd24gdG8KPj4gK8KgwqDCoMKgICogYmUgYWNjZXNzaWJsZSBpZiB0aGUgR0lDQyBpcyBtYXJr
ZWQgYXMgZW5hYmxlZC4gSWYgdGhpcyBiaXQgaXMgbm90Cj4+ICvCoMKgwqDCoCAqIHNldCwgd2Un
ZCBuZWVkIHRvIGFkZCB0aGUgcmVkaXN0cmlidXRvciBhdCBydW50aW1lLCB3aGljaCBpc24ndAo+
PiArwqDCoMKgwqAgKiBzdXBwb3J0ZWQuCj4+IMKgwqDCoMKgwqDCoCAqLwo+PiAtwqDCoMKgIGlm
IChhY3BpX2dpY2NfaXNfdXNhYmxlKGdpY2MpICYmIGdpY2MtPmdpY3JfYmFzZV9hZGRyZXNzKSB7
Cj4+ICvCoMKgwqAgaWYgKGdpY2MtPmZsYWdzICYgQUNQSV9NQURUX0VOQUJMRUQgJiYgZ2ljYy0+
Z2ljcl9iYXNlX2FkZHJlc3MpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBhY3BpX2RhdGEuZW5hYmxl
ZF9yZGlzdHMrKzsKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiAtwqDCoMKgIH0KPiAK
PiAgwqDCoMKgwqBpZiAoYWNwaV9naWNjX2lzX3VzYWJsZShnaWNjKSAmJiBnaWNjLT5naWNyX2Jh
c2VfYWRkcmVzcykgewo+IAoKUGxlYXNlIGlnbm9yZSB0aGlzIHNpbmNlIGFjcGlfZ2ljY19pc191
c2FibGUoKSBpcyBjaGFuZ2VkIHRvIGNvdmVyCnRoZSBiaXQgQUNQSV9NQURUX0dJQ0NfQ1BVX0NB
UEFCTEUgaW4gbmV4dCBwYXRjaCwgd2hpY2ggbWVhbnMKIihnaWNjLT5mbGFncyAmIEFDUElfTUFE
VF9FTkFCTEVEKSIgaXMgbmVlZGVkIGhlcmUuCgo+IAo+PiAtwqDCoMKgIC8qCj4+IC3CoMKgwqDC
oCAqIEl0J3MgcGVyZmVjdGx5IHZhbGlkIGZpcm13YXJlIGNhbiBwYXNzIGRpc2FibGVkIEdJQ0Mg
ZW50cnksIGRyaXZlcgo+PiAtwqDCoMKgwqAgKiBzaG91bGQgbm90IHRyZWF0IGFzIGVycm9ycywg
c2tpcCB0aGUgZW50cnkgaW5zdGVhZCBvZiBwcm9iZSBmYWlsLgo+PiAtwqDCoMKgwqAgKi8KPj4g
LcKgwqDCoCBpZiAoIWFjcGlfZ2ljY19pc191c2FibGUoZ2ljYykpCj4+IC3CoMKgwqDCoMKgwqDC
oCByZXR1cm4gMDsKPj4gLQo+PiAtwqDCoMKgIHJldHVybiAtRU5PREVWOwo+PiArwqDCoMKgIHJl
dHVybiAwOwo+PiDCoCB9Cj4+IMKgIHN0YXRpYyBpbnQgX19pbml0IGdpY19hY3BpX2NvdW50X2dp
Y3JfcmVnaW9ucyh2b2lkKQoKVGhhbmtzLApHYXZpbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
