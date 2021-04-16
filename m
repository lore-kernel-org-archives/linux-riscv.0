Return-Path: <SRS0=iBqs=JN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CBEC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 16:34:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C73B6115B
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Apr 2021 16:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C73B6115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=bTo8q6QGDm1dVi6iRVowu2xtXf3tAos00iVX4WI8ees=; b=ctP7Utie35oeQIp8DbhUgkjxA
	GALaLj8Phy1JpiWNwcA87j6rxwoDqyeZtpKAKwyOdHN8/LMS5HuW8H2Ah2ohnkhfi66M80M0Sck7V
	nbp2LeMgw4F0KKPtSYtndEeRdv88ogVuV3x3axlBHRohRf7tYn2mF36hX+nuAvYDdyGYx9C8aUOJm
	jVTtxNQ5BZiYhB0CUMq5yAugV4anmxXyG8ny2uDfTmi0szwzlUu4oeJuq9ha01Gpx8KryfMPUfNUm
	70iaRLyc36wCNFLhQ/MHQiQD+HsDd+7HHReW97Etkr61UW3zL0UuYAnu1cNSFXHQ3qRUQ7QX7u+0+
	E5W+HUu2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRPz-002nLs-Ag; Fri, 16 Apr 2021 16:34:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRPx-002nLG-9H
 for linux-riscv@desiato.infradead.org; Fri, 16 Apr 2021 16:34:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=z2OC1cEMuhrClU6NrKEbwSpdwK0Wyx5ycssXYh5zYaY=; b=e5WXIl8CjbCTU1+YvaajNTzO4h
 UE/9quO7c2fv80vG4FvJPdJA+I8iHRGe/DFhCFtr36bzTyGsWPUdiXMXlH2muC64B7Tfv8t8ksNV7
 8g5+gV/bgT7dLqN63WiGLUrLOZi+7XgGTvon+bdJyTf1xoWjv61Y7EzKzDHkAFeM3SqtEdRaiiArp
 uACwN7jwv1DGQuDejfh+lZ/bw3z8ALB/s9oU0zZzmeBTNpMXm5Pnf4axbOG4KoOJLW8mkOdAtRzr7
 nnygo7ReMRqsJ5dfsG+KTAcCDda2kwmkcJTbCnvlFIW6pjhTSX90ZotWoZSCrwcKGpJ1No/Gafu4x
 RpYhhgAg==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRPt-009Yh3-OG
 for linux-riscv@lists.infradead.org; Fri, 16 Apr 2021 16:34:04 +0000
Received: by mail-pf1-x42e.google.com with SMTP id a12so18676269pfc.7
 for <linux-riscv@lists.infradead.org>; Fri, 16 Apr 2021 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=z2OC1cEMuhrClU6NrKEbwSpdwK0Wyx5ycssXYh5zYaY=;
 b=maRGpOFYp6s48tNdoBVkOiMrziCDdLhM4rOR4KgB9GJvXiT8JjXZsphgurWw2bPWv7
 T5PmtSkO23D/cTi94/mAgEq4NUhHpgQtZl19zHHCiq5UAZ0xovLHauhJ8RBh5WBs/Bcn
 3Oe01YPXH7SHcAyhK4SJQicy/x5bRnFEmUsJGjT5Suly3fBl+LJ6ZF1wLUy5qI/r0bPK
 N63cln/k0URTbRZY6VJSuHOl6icLs8DZYwyIyqXF9BwDODSg5nSZq9fHAu4+SGL/jyO/
 JwceGbPavk6Y5mwG5AwJRUe3/DV0/1d402Q0hzRBACqRXaMGQgsQARzbY8IkYSIuaNZp
 bZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=z2OC1cEMuhrClU6NrKEbwSpdwK0Wyx5ycssXYh5zYaY=;
 b=PQe+2h7VQ3smS7IFi5hzzgeutlmrR/zEFltknTClQi2aM2udFeVrhXavGMfE6peNGE
 gPC8l2SyntWFF3sGOof3sanyTRjeptnLnrxpFCjWWscbxNMoHf/yikImJ388g9XINL3Z
 u+KYkk7F7Ygv7ZpmdVXYrBN7fB6XU97tV0Cna0wcOaPjNVra8d+oXWHkQmyLnGIyZt1j
 +hlsLBGLu3SpYNCwKHv2tBmMnuVwSOsqI1RklYfEJ81T+C1NKPDjSFiqGP8GNBonTCvU
 hwVBHhL652xyb4Yr3yj3kRRo+3kgwIzdf2SOz+wCEIzlIWq9IuZCjtad0cxEguw9Ea0c
 MB+Q==
X-Gm-Message-State: AOAM532lllbLEgnYR2+nPDWnxp32ofzI0Ewmr8F+uKwvEQ+nCBK9UCWF
 nX2pQFShx6tT43nxzfl2i53roQ==
X-Google-Smtp-Source: ABdhPJzdY9tt29/kSdPIjvZ8m8hDMZjPk11Or4POyQbLXVYX/vFpzeXAjr2YcYHuaICJvA4Pcb3ljw==
X-Received: by 2002:a63:570e:: with SMTP id l14mr8746668pgb.159.1618590839027; 
 Fri, 16 Apr 2021 09:33:59 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b7sm5760468pgs.62.2021.04.16.09.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 09:33:58 -0700 (PDT)
Date: Fri, 16 Apr 2021 09:33:58 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Apr 2021 09:33:56 PDT (-0700)
Subject: Re: [PATCH] riscv: Protect kernel linear mapping only if
 CONFIG_STRICT_KERNEL_RWX is set
In-Reply-To: <f659c498-a273-f249-a81b-cab1ed1ba2bb@ghiti.fr>
CC: anup@brainfault.org, corbet@lwn.net,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, aryabinin@virtuozzo.com,
 glider@google.com, 
 dvyukov@google.com, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-9ab3280b-4523-4892-9f9a-338f55df8108@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_093401_856965_CC8E7ADA 
X-CRM114-Status: GOOD (  22.90  )
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

T24gRnJpLCAxNiBBcHIgMjAyMSAwMzo0NzoxOSBQRFQgKC0wNzAwKSwgYWxleEBnaGl0aS5mciB3
cm90ZToKPiBIaSBBbnVwLAo+Cj4gTGUgNC8xNi8yMSDDoCA2OjQxIEFNLCBBbnVwIFBhdGVsIGEg
w6ljcml0wqA6Cj4+IE9uIFRodSwgQXByIDE1LCAyMDIxIGF0IDQ6MzQgUE0gQWxleGFuZHJlIEdo
aXRpIDxhbGV4QGdoaXRpLmZyPiB3cm90ZToKPj4+Cj4+PiBJZiBDT05GSUdfU1RSSUNUX0tFUk5F
TF9SV1ggaXMgbm90IHNldCwgd2UgY2Fubm90IHNldCBkaWZmZXJlbnQgcGVybWlzc2lvbnMKPj4+
IHRvIHRoZSBrZXJuZWwgZGF0YSBhbmQgdGV4dCBzZWN0aW9ucywgc28gbWFrZSBzdXJlIGl0IGlz
IGRlZmluZWQgYmVmb3JlCj4+PiB0cnlpbmcgdG8gcHJvdGVjdCB0aGUga2VybmVsIGxpbmVhciBt
YXBwaW5nLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0
aS5mcj4KPj4KPj4gTWF5YmUgeW91IHNob3VsZCBhZGQgIkZpeGVzOiIgdGFnIGluIGNvbW1pdCB0
YWcgPwo+Cj4gWWVzIHlvdSdyZSByaWdodCBJIHNob3VsZCBoYXZlIGRvbmUgdGhhdC4gTWF5YmUg
UGFsbWVyIHdpbGwgc3F1YXNoIGl0IGFzCj4gaXQganVzdCBlbnRlcmVkIGZvci1uZXh0PwoKWWEs
IEknbGwgZG8gaXQuICBNeSB0ZXN0aW5nIGJveCB3YXMganVzdCB0aWVkIHVwIGxhc3QgbmlnaHQg
Zm9yIHRoZSByYzggClBSLCBzbyBJIHRocmV3IHRoaXMgb24gZm9yLW5leHQgdG8gZ2V0IHRoZSBi
dWlsZGJvdHMgdG8gdGFrZSBhIGxvb2suICAKSXQncyBhIGJpdCB0b28gbGF0ZSB0byB0YWtlIHNv
bWV0aGluZyBmb3IgdGhpcyB3ZWVrLCBhcyBJIHRyeSB0byBiZSAKcHJldHR5IGNvbnNlcnZhdGl2
ZSB0aGlzIGxhdGUgaW4gdGhlIGN5Y2xlLiAgVGhlcmUncyBhbm90aGVyIGtwcm9iZXMgZml4IApv
biB0aGUgbGlzdCBzbyBpZiB3ZSBlbmQgdXAgd2l0aCBhbiByYzggSSBtaWdodCBzZW5kIHRoaXMg
YWxvbmcgd2l0aCAKdGhhdCwgb3RoZXJ3aXNlIHRoaXMnbGwganVzdCBnbyBvbnRvIGZvci1uZXh0
IGJlZm9yZSB0aGUgbGluZWFyIG1hcCAKY2hhbmdlcyB0aGF0IGV4ZXJjaXNlIHRoZSBidWcuCgpZ
b3UncmUgbW9yZSB0aGFuIHdlbGNvbWUgdG8ganVzdCBkaWcgdXAgdGhlIGZpeGVzIHRhZyBhbmQg
cmVwbHksIG15IApzY3JpcHRzIHB1bGwgYWxsIHRhZ3MgZnJvbSByZXBsaWVzIChqdXN0IGxpa2Ug
UmV2aWV3ZWItYnkpLiAgT3RoZXJ3aXNlIApJJ2xsIGRvIGl0IG15c2VsZiwgbW9zdCBwZW9wbGUg
ZG9uJ3QgcmVhbGx5IHBvc3QgRml4ZXMgdGFncyB0aGF0IAphY2N1cmF0ZWx5IHNvIEkgZ28gdGhy
b3VnaCBpdCBmb3IgcHJldHR5IG11Y2ggZXZlcnl0aGluZyBhbnl3YXkuCgpUaGFua3MgZm9yIHNv
cnRpbmcgdGhpcyBvdXQgc28gcXVpY2tseSEKCj4KPj4KPj4gT3RoZXJ3aXNlIGl0IGxvb2tzIGdv
b2QuCj4+Cj4+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+
Cj4gVGhhbmsgeW91IQo+Cj4gQWxleAo+Cj4+Cj4+IFJlZ2FyZHMsCj4+IEFudXAKPj4KPj4+IC0t
LQo+Pj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIHwgOCArKysrLS0tLQo+Pj4gICAxIGZp
bGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0
dXAuYwo+Pj4gaW5kZXggNjI2MDAzYmI1ZmNhLi5hYjM5NGQxNzNjZDQgMTAwNjQ0Cj4+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
ZXR1cC5jCj4+PiBAQCAtMjY0LDEyICsyNjQsMTIgQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChj
aGFyICoqY21kbGluZV9wKQo+Pj4KPj4+ICAgICAgICAgIHNiaV9pbml0KCk7Cj4+Pgo+Pj4gLSAg
ICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1gpKQo+Pj4gKyAgICAg
ICBpZiAoSVNfRU5BQkxFRChDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1gpKSB7Cj4+PiAgICAgICAg
ICAgICAgICAgIHByb3RlY3Rfa2VybmVsX3RleHRfZGF0YSgpOwo+Pj4gLQo+Pj4gLSNpZiBkZWZp
bmVkKENPTkZJR182NEJJVCkgJiYgZGVmaW5lZChDT05GSUdfTU1VKQo+Pj4gLSAgICAgICBwcm90
ZWN0X2tlcm5lbF9saW5lYXJfbWFwcGluZ190ZXh0X3JvZGF0YSgpOwo+Pj4gKyNpZmRlZiBDT05G
SUdfNjRCSVQKPj4+ICsgICAgICAgICAgICAgICBwcm90ZWN0X2tlcm5lbF9saW5lYXJfbWFwcGlu
Z190ZXh0X3JvZGF0YSgpOwo+Pj4gICAjZW5kaWYKPj4+ICsgICAgICAgfQo+Pj4KPj4+ICAgI2lm
ZGVmIENPTkZJR19TV0lPVExCCj4+PiAgICAgICAgICBzd2lvdGxiX2luaXQoMSk7Cj4+PiAtLQo+
Pj4gMi4yMC4xCj4+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
