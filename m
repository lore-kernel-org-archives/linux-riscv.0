Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831D8C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 04:43:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D6861450
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 04:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9D6861450
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=jrtWv/b7INPSVudZNjnJyJhlqUCd7xtbWVlEANvYQ9A=; b=hQw+yCFf9pxp+8eWh81WMV6nt
	QETMH06OLoU1/j8Xnzhw8mi+TFl32BNmtiqnH8A1wtwmbyBtsDpYeKkrYE/G7niwX9M6ZLLq2u1zw
	K+uagSgpHGuSP+wiamedZwNNcAM35aRPOtks1fQ4bLWkajQBn74ObGJx7Wvz0Zq7SD1sgW2TrZnpS
	BS+yQg2tTvugHVam8DEG4pWa02v950V/BvReoUBvPc56bJ5+tEqQDFBIS31iAp1D1LICJ9sZa8eA0
	wX+wCxW+ARthMMnuOS17U7/wsmhRzj04yeK9E3Mgk24GXSxQESsl4mffSW+vFjfAw1pFIBIMc0Nt7
	vlwyoxoqw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbyWR-004uTx-4h; Thu, 29 Apr 2021 04:43:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbyWK-004uT2-Qn
 for linux-riscv@desiato.infradead.org; Thu, 29 Apr 2021 04:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=sE2savxAfPxu0P92GN6OpAhX0O3eNjGvHwyPPUWKYXM=; b=kZeSerbNQoMl+L8bJapeQRmMkx
 9AOgViAAVbddQTsAmYUsw/dIkIjUyAmAp3R3AaMEabJEojtmThAAFMuV1EWJ/YZ2ur2trt5U8i8T8
 A10Mlyl5PCycHLGDZcqIptG8zB0ZKCVVC6yfpDc2hHSwHR1sc39IXHSUt2dNeKva7tOzWrujs3/cZ
 wayIuZksgsdA4aKDdCwl6iKLsv2GmtL4XQCD47WpfUr6qdqOXs90kGvjGhZtkYgpNQpmfsyu+nEi1
 /o7xyKZQBalaHi6htbtxinoJyynsELDH7qZlQ6erIMNGtYUpkOr88ozkzzYqQHTGCHkdrtFwdrMEE
 BF8C6/ew==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbyWH-000MyT-ON
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 04:43:23 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso10325694pjn.0
 for <linux-riscv@lists.infradead.org>; Wed, 28 Apr 2021 21:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sE2savxAfPxu0P92GN6OpAhX0O3eNjGvHwyPPUWKYXM=;
 b=BbKFsrcgMKJaZOVLDg+9Z0CXvzo42Bs4YtCgco8RWK06gIpsXcpSRcHtnm21RXdPag
 4AOSJCwn0TOJbK0rk5+7Leh4jED6MQpJRhgh4FX/gc286imJNECfydO1JA6qe5bWYh2C
 wIvXkDFCJg+QlmNxoYUmO7+0+Wv/38VQ7r8ofok18unzJkIODkz0IL3shy8pg2vHamPY
 dEqTLKKs7LELc70nV46Ds+h1PFT2uHN0+KSRkUHZ0NYtgBAkGFikYjAOJW1JmMD6DhdW
 YYqrJg5FH5yXQEpg+PDLKPHfD0KH9qOUP1/w7tli4LY1LN9mVWjGPsdjpsmJIS+MwAAj
 g5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sE2savxAfPxu0P92GN6OpAhX0O3eNjGvHwyPPUWKYXM=;
 b=oc6rZUkcgkIEEROxBG2p1VwRvuKKESVlXPXR8RxxRpgDD4/9nUAzTqTtky3f47in1D
 mtriqlpZh7vfw0Xpnfp6JkYGUAQOnvDNyPoNna1ZE6NiW4FYd3CC0bGkqq02kz9PKgzI
 GMiUWYgj8ASpsGkLFIoc2RnsNe4evgSPOGkHqmWRHcGxKxSm3sRBR9aqMypMXerSn97u
 ZZVYBAZcmge0z857zilzAOkuntTbTjLh8VD7BAoGfzYSOcBuiM4FFKh/DO3s7O8t+2hl
 iWqRuICxgc9HAn2gj82ZbR1yoeF4TlfyAq7RtOWHlzKEA45NWjW3nDeb0QKbVE36poeP
 BGjg==
X-Gm-Message-State: AOAM531E8bY0Ygq0VfGa2kVR7a/W/rd59LiJ72UTuYHLg/FHoTwN5szD
 JZnRKcyjS7Q7nDDluiD5p6cOREfOTSkQjg==
X-Google-Smtp-Source: ABdhPJzIZ4MO/M2q7pEFyxcjdg+AMdv6kInIrBs1Dge1k1V8H0zvz80UNnzL5Hf6btnS/YDAvJKmjg==
X-Received: by 2002:a17:90a:e643:: with SMTP id
 ep3mr7555235pjb.194.1619671400173; 
 Wed, 28 Apr 2021 21:43:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a16sm1134447pgl.12.2021.04.28.21.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 21:43:19 -0700 (PDT)
Date: Wed, 28 Apr 2021 21:43:19 -0700 (PDT)
X-Google-Original-Date: Wed, 28 Apr 2021 21:43:11 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Always define XIP_FIXUP
In-Reply-To: <b674bc91-8228-9236-f3ec-8f65bb5620c8@ghiti.fr>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 Atish Patra <Atish.Patra@wdc.com>, 
 Anup Patel <Anup.Patel@wdc.com>, wangkefeng.wang@huawei.com, rppt@kernel.org,
 vitaly.wool@konsulko.com, 
 greentime.hu@sifive.com, 0x7f454c46@gmail.com, chenhuang5@huawei.com,
 linux-kernel@vger.kernel.org, kernel-team@android.com, linux@roeck-us.net
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-2e1a7543-84bc-4954-843a-b577fc132157@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_214321_890684_B2E94844 
X-CRM114-Status: GOOD (  20.64  )
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

T24gV2VkLCAyOCBBcHIgMjAyMSAwMToyNTo1NSBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBMZSA0LzI3LzIxIMOgIDExOjM0IFBNLCBQYWxtZXIgRGFiYmVsdCBhIMOpY3JpdMKg
Ogo+PiBGcm9tOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+Pgo+
PiBYSVAgZGVwZW5kcyBvbiBNTVUsIGJ1dCBYSVBfRklYVVAgaXMgZGVmaW5lZCB0aHJvdWdob3V0
IHRoZSBrZXJuZWwgaW4KPj4gb3JkZXIgdG8gYXZvaWQgZXhjZXNzaXZlIGlmZGVmcy4gIFRoaXMg
anVzdCBtYWtlcyBzdXJlIHRvIGFsd2F5cyBkZWZpbmUKPj4gWElQX0ZJWElQLCB3aGljaCB3aWxs
IGZpeCBNTVU9biBidWlsZHMuCj4KPiBBIHNtYWxsIHR5cG8gaGVyZS4KCkFjdHVhbGx5IHR3bzog
ImRlZmluZWQiIHNob3VsZCBoYXZlIGJlZW4gInVzZWQiLiAgQm90aCBhcmUgZml4ZWQuCgo+Cj4+
Cj4+IEZpeGVzOiA0NGM5MjI1NzI5NTIgKCJSSVNDLVY6IGVuYWJsZSBYSVAiKQo+PiBSZXBvcnRl
ZC1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPgo+PiAtLS0KPj4gICBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDI0ICsrKysrKysrKysrKy0tLS0tLS0t
LS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4gaW5kZXggMmYxMzg0ZTE0ZTMxLi5m
ZDc0OTM1MWY0MzIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+IEBAIC03Mywx
OCArNzMsNiBAQAo+PiAgICNlbmRpZgo+PiAgICNkZWZpbmUgRklYQUREUl9TVEFSVCAgICAoRklY
QUREUl9UT1AgLSBGSVhBRERSX1NJWkUpCj4+Cj4+IC0jaWZkZWYgQ09ORklHX1hJUF9LRVJORUwK
Pj4gLSNkZWZpbmUgWElQX09GRlNFVAkJU1pfOE0KPj4gLSNkZWZpbmUgWElQX0ZJWFVQKGFkZHIp
ICh7CQkJCQkJCVwKPj4gLQl1aW50cHRyX3QgX19hID0gKHVpbnRwdHJfdCkoYWRkcik7CQkJCQlc
Cj4+IC0JKF9fYSA+PSBDT05GSUdfWElQX1BIWVNfQUREUiAmJiBfX2EgPCBDT05GSUdfWElQX1BI
WVNfQUREUiArIFNaXzE2TSkgPwlcCj4+IC0JCV9fYSAtIENPTkZJR19YSVBfUEhZU19BRERSICsg
Q09ORklHX1BIWVNfUkFNX0JBU0UgLSBYSVBfT0ZGU0VUIDpcCj4+IC0JCV9fYTsJCQkJCQkJCVwK
Pj4gLQl9KQo+PiAtI2Vsc2UKPj4gLSNkZWZpbmUgWElQX0ZJWFVQKGFkZHIpCQkoYWRkcikKPj4g
LSNlbmRpZiAvKiBDT05GSUdfWElQX0tFUk5FTCAqLwo+PiAtCj4+ICAgI2VuZGlmCj4+Cj4+ICAg
I2lmbmRlZiBfX0FTU0VNQkxZX18KPj4gQEAgLTEwMSw2ICs4OSwxOCBAQAo+PiAgICNpbmNsdWRl
IDxhc20vcGd0YWJsZS0zMi5oPgo+PiAgICNlbmRpZiAvKiBDT05GSUdfNjRCSVQgKi8KPj4KPj4g
KyNpZmRlZiBDT05GSUdfWElQX0tFUk5FTAo+PiArI2RlZmluZSBYSVBfT0ZGU0VUCQlTWl84TQo+
Cj4KPiBYSVBfT0ZGU0VUIGlzIHVzZWQgaW4gaGVhZC5TIGFuZCB0aGVuIHRoaXMgYnJlYWtzIFhJ
UF9LRVJORUwuIFhJUF9PRkZTRVQKPiBtdXN0IGxpdmUgb3V0c2lkZSB0aGUgaWZuZGVmIF9fQVNT
RU1CTFlfXy4KClRoYW5rcywgSSBoYWRuJ3QgZXZlbiBzZWVuIFhJUF9PRkZTRVQuICBUaGlzIGlz
IGZpeGVkIGluIHRoZSB2Mi4KCkRvIHlvdSBoYXZlIGFuIFhJUCBjb25maWcgdGhhdCB3aWxsIHJ1
biBvbiBRRU1VLCBhbmQgYSB3YXkgdG8gcnVuIGl0PyAgCklmIHNvLCBjYW4geW91IHBvc3QgYSBk
ZWZjb25maWcgYW5kIHNvbWUgaW5zdHJ1Y3Rpb25zPyAgVGhhdCdsbCBtYWtlIGl0IAplYXNpZXIg
dG8gdGVzdCBvbiBteSBlbmQuCgo+PiArI2RlZmluZSBYSVBfRklYVVAoYWRkcikgKHsJCQkJCQkJ
XAo+PiArCXVpbnRwdHJfdCBfX2EgPSAodWludHB0cl90KShhZGRyKTsJCQkJCVwKPj4gKwkoX19h
ID49IENPTkZJR19YSVBfUEhZU19BRERSICYmIF9fYSA8IENPTkZJR19YSVBfUEhZU19BRERSICsg
U1pfMTZNKSA/CVwKPj4gKwkJX19hIC0gQ09ORklHX1hJUF9QSFlTX0FERFIgKyBDT05GSUdfUEhZ
U19SQU1fQkFTRSAtIFhJUF9PRkZTRVQgOlwKPj4gKwkJX19hOwkJCQkJCQkJXAo+PiArCX0pCj4+
ICsjZWxzZQo+PiArI2RlZmluZSBYSVBfRklYVVAoYWRkcikJCShhZGRyKQo+PiArI2VuZGlmIC8q
IENPTkZJR19YSVBfS0VSTkVMICovCj4+ICsKPj4gICAjaWZkZWYgQ09ORklHX01NVQo+PiAgIC8q
IE51bWJlciBvZiBlbnRyaWVzIGluIHRoZSBwYWdlIGdsb2JhbCBkaXJlY3RvcnkgKi8KPj4gICAj
ZGVmaW5lIFBUUlNfUEVSX1BHRCAgICAoUEFHRV9TSVpFIC8gc2l6ZW9mKHBnZF90KSkKPj4KPgo+
IFRoYW5rIHlvdSBmb3IgZG9pbmcgdGhhdCEKPgo+IEFsZXgKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
