Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D103C433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 04:07:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E92E23B3E
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 04:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E92E23B3E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=iuNeGk0xALD3DSN3sBgWmG9kdue0MKEQqhqyfcQoTvU=; b=yX8/CpVn65s54XXnwqdN84+4X
	sCJ1Rs6aojzfBH496u+RasfzTrTOlUxlxotgDpq9XE+8rBkcqHodDOZZjutB/QyGwAxHtKDPSw6Rf
	IwxIEfUsTWH2M3LZfcAZT86Y0W0oL6PPTMboX3S99F5ZYOZYxHIgbx3/exfuucC225sDNCtxo1SiQ
	InJbZo/JX2BwLwPfQUIMUGS0dt2b5izGZsm9TaTaYI6g3GcJ0OMZ3oyqKzyuGTX8NXNeBTb/Cw16S
	TAmHcGU9y7A4qTzeu5zbfPUfmhH4lePK5ZIAgQKOTuFaSDpTMlRpol52xSYtMoidwontwOi2wEcH+
	VcscSV9YQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3ACz-00045R-Ew; Sat, 23 Jan 2021 04:07:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3ACw-000450-2h
 for linux-riscv@lists.infradead.org; Sat, 23 Jan 2021 04:07:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id s15so4394544plr.9
 for <linux-riscv@lists.infradead.org>; Fri, 22 Jan 2021 20:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dON7QD8aFGzRpIqb+Tlf1r6Mkw2jNplPmioEKOGnv+w=;
 b=Rw1ZI0eE5M9j6Wu2p+jalzplqBljeDlYPfVBwOahxpaBB5wYkXEttwVWD9vhrBv99/
 yIwC3T35XncJDrunRwdl2HwHrw2WjRKcqo7SsDrCXKZBPYSAaxaCzzWS91f/ActX0NtT
 skJecV3FGXmtOxXncyqeuKExn3/EfZpDU7GC6pHh159DhbPwp+5InkgmPAE89rjALTpk
 lftXpde6VUuwUoL19aHw7iiS2LBXCPn9XQ6jluQo6IxUI8YFNySfMjoKxszZnZe/3/JV
 7X77NyslJ/STxNQQMPGox6P3jTUtBePV+38/id0UMd95BhNZeE10omUt2qzogdS6WIHd
 7VSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dON7QD8aFGzRpIqb+Tlf1r6Mkw2jNplPmioEKOGnv+w=;
 b=n3N1HPfrk4s0dFtPHHNueApc1BVKakDp+RHw1YTF84qPpoulZmg/d2KciU5UQucitJ
 uZBmvbkdPjcD94jL7C6rOuII8UWdgq/K7jVDZaOk19Z0CoWcI+G5FvjP/os5Pi/7yJ96
 xNpv8wX6H+mQwLUv7k9K5A9fDH6JVwtuJVyKgYewxOVAaTwGOaQq64Cic9BgoxyHTc/5
 2Rq8x+KYUzDDID09H5fuonRJuyBOlP85E3ks0H/ufBGOxo9OABEhWGSlzg/teOq/Yk7/
 UoH1fbh+ur+htUymoedxyjJ+b827CGzdZHIH1/a50elzza2SDKwQfK55ZNHP6Zt1ZTxq
 eThQ==
X-Gm-Message-State: AOAM53087haeQjQ6NQBS+gJYhOGjLtPqWmdjaAyk9567IzabAnmUhPru
 PEV+z+Ypo+yYJ71Ul3AhbJkf1w==
X-Google-Smtp-Source: ABdhPJzoaq2GQ8/QrNb0hZ0MH2zHECgO2n9hmVITWznWNeyg/UbEI/YhJ4oBApmjOOBA0QcOzAk6LA==
X-Received: by 2002:a17:902:e84e:b029:de:45bf:1296 with SMTP id
 t14-20020a170902e84eb02900de45bf1296mr2260599plg.49.1611374844612; 
 Fri, 22 Jan 2021 20:07:24 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 101sm10640260pjo.38.2021.01.22.20.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 20:07:23 -0800 (PST)
Date: Fri, 22 Jan 2021 20:07:23 -0800 (PST)
X-Google-Original-Date: Fri, 22 Jan 2021 19:58:36 PST (-0800)
Subject: Re: [PATCH 06/20] clk: sifive: fu540-prci: Declare static const
 variable 'prci_clk_fu540' where it's used
In-Reply-To: <20210120093040.1719407-7-lee.jones@linaro.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: lee.jones@linaro.org
Message-ID: <mhng-d13d3ca6-2ec1-4c56-a4a8-56faafe5569c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_230730_202041_2F97BA40 
X-CRM114-Status: GOOD (  19.23  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, lee.jones@linaro.org,
 linux-clk@vger.kernel.org, Pragnesh.patel@sifive.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMCBKYW4gMjAyMSAwMTozMDoyNiBQU1QgKC0wODAwKSwgbGVlLmpvbmVzQGxpbmFy
by5vcmcgd3JvdGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5p
bmcocyk6Cj4KPiAgZHJpdmVycy9jbGsvc2lmaXZlL2Z1NTQwLXByY2kuaDoxNjozNTogd2Fybmlu
Zzog4oCYcHJjaV9jbGtfZnU1NDDigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWNv
bnN0LXZhcmlhYmxlPV0KPiAgZHJpdmVycy9jbGsvc2lmaXZlL2Z1NTQwLXByY2kuaDoxNjozNTog
d2FybmluZzog4oCYcHJjaV9jbGtfZnU1NDDigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWNvbnN0LXZhcmlhYmxlPV0KPgo+IENjOiBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0
ZUBiYXlsaWJyZS5jb20+Cj4gQ2M6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KPiBD
YzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgo+IENjOiBQYWxtZXIg
RGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgo+IENjOiBQcmFnbmVzaCBQYXRlbCA8UHJhZ25l
c2gucGF0ZWxAc2lmaXZlLmNvbT4KPiBDYzogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+
IENjOiBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8u
b3JnPgo+IC0tLQo+ICBkcml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJjaS5oICB8IDUgLS0tLS0K
PiAgZHJpdmVycy9jbGsvc2lmaXZlL3NpZml2ZS1wcmNpLmMgfCA1ICsrKysrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY2xrL3NpZml2ZS9mdTU0MC1wcmNpLmggYi9kcml2ZXJzL2Nsay9zaWZpdmUvZnU1
NDAtcHJjaS5oCj4gaW5kZXggYzgyNzFlZmE3YmRjNy4uYzIyMDY3N2RjMDEwOCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2Nsay9zaWZpdmUvZnU1NDAtcHJjaS5oCj4gKysrIGIvZHJpdmVycy9jbGsv
c2lmaXZlL2Z1NTQwLXByY2kuaAo+IEBAIC0xMyw5ICsxMyw0IEBACj4KPiAgZXh0ZXJuIHN0cnVj
dCBfX3ByY2lfY2xvY2sgX19wcmNpX2luaXRfY2xvY2tzX2Z1NTQwW05VTV9DTE9DS19GVTU0MF07
Cj4KPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBwcmNpX2Nsa19kZXNjIHByY2lfY2xrX2Z1NTQwID0g
ewo+IC0JLmNsa3MgPSBfX3ByY2lfaW5pdF9jbG9ja3NfZnU1NDAsCj4gLQkubnVtX2Nsa3MgPSBB
UlJBWV9TSVpFKF9fcHJjaV9pbml0X2Nsb2Nrc19mdTU0MCksCj4gLX07Cj4gLQo+ICAjZW5kaWYg
LyogX19TSUZJVkVfQ0xLX0ZVNTQwX1BSQ0lfSCAqLwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9zaWZpdmUvc2lmaXZlLXByY2kuYyBiL2RyaXZlcnMvY2xrL3NpZml2ZS9zaWZpdmUtcHJjaS5j
Cj4gaW5kZXggYzc4YjA0Mjc1MGUyMS4uMTQ5MGIwMWNlNjI5MCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2Nsay9zaWZpdmUvc2lmaXZlLXByY2kuYwo+ICsrKyBiL2RyaXZlcnMvY2xrL3NpZml2ZS9z
aWZpdmUtcHJjaS5jCj4gQEAgLTEyLDYgKzEyLDExIEBACj4gICNpbmNsdWRlICJmdTU0MC1wcmNp
LmgiCj4gICNpbmNsdWRlICJmdTc0MC1wcmNpLmgiCj4KPiArc3RhdGljIGNvbnN0IHN0cnVjdCBw
cmNpX2Nsa19kZXNjIHByY2lfY2xrX2Z1NTQwID0gewo+ICsJLmNsa3MgPSBfX3ByY2lfaW5pdF9j
bG9ja3NfZnU1NDAsCj4gKwkubnVtX2Nsa3MgPSBBUlJBWV9TSVpFKF9fcHJjaV9pbml0X2Nsb2Nr
c19mdTU0MCksCj4gK307Cj4gKwo+ICAvKgo+ICAgKiBQcml2YXRlIGZ1bmN0aW9ucwo+ICAgKi8K
ClRoaXMgZG9lc24ndCBsb29rIGxpa2UgbXkgc2lmaXZlLXByY2kuYywgc28gSSdtIGFzc3VtaW5n
IGl0J3MgYWdhaW5zdCBvbmUgb2YKdGhlIGNsb2NrIHRyZWVzIGFuZCB0aGVyZWZvciBzaG91bGQg
Z28gaW4gb3ZlciB0aGVyZS4KCkFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVs
dEBnb29nbGUuY29tPgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
