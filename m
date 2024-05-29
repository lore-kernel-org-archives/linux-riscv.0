Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E78C27C44
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 09:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xJAf4Oj1VD3Q00I6jHp+GjwxaDlIWrdNpimlHFwic8=; b=O4lnrJp2ho6W+E
	NDqq3ZbUyPuuk1m3hbY3fSXN6Sq1fpABtPAs11SvdrRK0gAQkGEtqtFJaacwJ7ZlKm88hCX06mVXk
	BhkorqIP1neY+rvC3pp34dymEifbHVa8/uLGZ022ICSYMj4vPlOssspmT23Lj7b33Xxk2D9/ZM/z+
	nTB54nXsaWQ8q4gWZkh5mpRK9BW0cTKAxn+UlNFpIvechUQvDS35juLzKoQypfB0qRhs3mSE5nSWE
	uGlVDk9gy6pzgwinU9itoJtawTs5grxdOUzfUf+729d/SMAX4wG1A/4utnhf7KFp5tvX523mozEd1
	nillav+7/S04DDhVviBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFh3-00000003dwY-1n0K;
	Wed, 29 May 2024 09:34:01 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFh0-00000003duy-1PZL
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 09:34:00 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5b97648b38eso977540eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 02:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716975236; x=1717580036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pa54c7QY45UehqcsWmO/45EGLoGqHOsodal/OABdWYY=;
        b=HPdLQA+t13baGfMyzpNGuk3PnrZ/kzGH7nuIDn4yP1+sqkIpe8UM64Rh2JQunCexZU
         bdoHqQ8QcHihJS5p5uLXaCjuaGF6q9NXmSTpQb2Xcb5YQuCQrttLWTCc52LEp3drD4BB
         WGGDe4oFNPiiJYzIb/qPliW4yNX0NPF48ZMOL9qdFvLlnWbIAOtOm8I+d4UD0oH4LlA3
         tR1r1d74kZ8g4gUlS379UxUw+mmzmbNwiM6fPkg+p1Zx5qkntW/igKfpxvRjDH8iKFsk
         QGrFEVMR1ldRzIkLD5lzbdfVlK1OL0NIkhm/hEDPPPXoDJYpprmJSFjCu8Zz/x+R9laH
         s7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716975236; x=1717580036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pa54c7QY45UehqcsWmO/45EGLoGqHOsodal/OABdWYY=;
        b=t2mLZxbsQgIMPxsXKMy5I9O7Hkm5j4dTH6+tl8utccegDf/f4EDthHCAvHL6YiUu6r
         ugP2Ud7m2aimR1hIGtjnWWRe2NVJ3niWiZaxLYpv7g4TYRNaUEqnlH9E2FZ/SgUA5vDu
         o+FX/X/Yabpg1YN1Fekhn7L+8fwZT5DunDC6wj/uA+rCHuCmLiB4n5Fyes8B6d3lQIWb
         I+5dnymuVjQNqzvXpFzURjGfOiqYAuf/0vDbo9T81NypdyHKrFyfglEILyty/V9zbBb3
         cKpm2swwz3/QBJMv1YHybgc5cNLpZLz2y29mDTxxv0KdCOA20ItpOllmlCKfpgvvw887
         Yaww==
X-Gm-Message-State: AOJu0YwzU7FWjjc2mD1bUPos+3O1f5vMXpIgHMpv+iAREphtZdgMQuEm
	gTAwd2A5gNN7NRgiNl3wL6J0o2NzBEj2yBUCelb8Z8e7hFBBPHb/1EaO8qFPfWSdA2BYfqNLP2Y
	Wb6+J3axJ6xqFVkAI19WsrYeu00Iwd2tHPgRmUw==
X-Google-Smtp-Source: AGHT+IEFckLl6SgF2ZIIsWM6r/IfyUxXDxJs1rCuhc04QaE6m5836ItC1YeowXBKeV4tdyQW4ZvMZo8zPmFUl/VM1Ec=
X-Received: by 2002:a4a:dcc4:0:b0:5b9:8dd6:3d62 with SMTP id
 006d021491bc7-5b98dd649e1mr8998720eaf.0.1716975236516; Wed, 29 May 2024
 02:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240524103307.2684-1-yongxuan.wang@sifive.com>
 <20240524103307.2684-3-yongxuan.wang@sifive.com> <20240527-widely-goatskin-bb5575541aed@spud>
In-Reply-To: <20240527-widely-goatskin-bb5575541aed@spud>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Wed, 29 May 2024 17:33:45 +0800
Message-ID: <CAMWQL2jHLVtGA3RzPG-Qp5k8qhzDttNQjkSp5X2EMYCyFWKwLA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/5] dt-bindings: riscv: Add Svadu Entry
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	cleger@rivosinc.com, alex@ghiti.fr, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_023358_579586_7CF7CB58 
X-CRM114-Status: GOOD (  21.03  )
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

SGkgQ29ub3IsCgpPbiBNb24sIE1heSAyNywgMjAyNCBhdCAxMTowOeKAr1BNIENvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAyNCwgMjAyNCBhdCAw
NjozMzowMlBNICswODAwLCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiA+IEFkZCBhbiBlbnRyeSBm
b3IgdGhlIFN2YWR1IGV4dGVuc2lvbiB0byB0aGUgcmlzY3YsaXNhLWV4dGVuc2lvbnMgcHJvcGVy
dHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdA
c2lmaXZlLmNvbT4KPiA+IEFja2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Cj4KPiBJJ20gZ29pbmcgdG8gdW4tYWNrIHRoaXMsIG5vdCBiZWNhdXNlIHlvdSBk
aWQgc29tZXRoaW5nIHdyb25nIHBlciBzZSwKPiBidXQgYmVjYXVzZSB0aGVyZSdzIHNvbWUgZGlz
Y3Vzc2lvbiBvbiB0aGUgT3BlblNCSSBsaXN0IGFib3V0IHdoYXQgaXMKPiBhbmQgd2hhdCBpcyBu
b3QgYmFja3dhcmRzIGNvbXBhdGlibGUgYW5kIGhvdyBhbiBPUyBzaG91bGQgaW50ZXJwcmV0Cj4g
c3ZhZGUgYW5kIHN2YWR1Ogo+IGh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwv
b3BlbnNiaS8yMDI0LU1heS8wMDY5NDkuaHRtbAo+Cj4gVGhhbmtzLAo+IENvbm9yLgo+Cgpvay4g
SSB3aWxsIHJlbW92ZSBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKUmVnYXJkcywKWW9uZy1YdWFu
Cgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbCB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gaW5kZXggNDY4YzY0NjI0N2FhLi41OThhNTg0
MTkyMGYgMTAwNjQ0Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBAQCAtMTUzLDYgKzE1MywxMiBAQCBw
cm9wZXJ0aWVzOgo+ID4gICAgICAgICAgICAgIHJhdGlmaWVkIGF0IGNvbW1pdCAzZjllZDM0ICgi
QWRkIGFiaWxpdHkgdG8gbWFudWFsbHkgdHJpZ2dlcgo+ID4gICAgICAgICAgICAgIHdvcmtmbG93
LiAoIzIpIikgb2YgcmlzY3YtdGltZS1jb21wYXJlLgo+ID4KPiA+ICsgICAgICAgIC0gY29uc3Q6
IHN2YWR1Cj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiArICAgICAgICAgICAgVGhl
IHN0YW5kYXJkIFN2YWR1IHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5zaW9uIGZvciBoYXJkd2FyZSB1
cGRhdGluZwo+ID4gKyAgICAgICAgICAgIG9mIFBURSBBL0QgYml0cyBhcyByYXRpZmllZCBhdCBj
b21taXQgYzFhYmNjZiAoIk1lcmdlIHB1bGwgcmVxdWVzdAo+ID4gKyAgICAgICAgICAgICMyNSBm
cm9tIHZlZC1yaXZvcy9yYXRpZmllZCIpIG9mIHJpc2N2LXN2YWR1Lgo+ID4gKwo+ID4gICAgICAg
ICAgLSBjb25zdDogc3ZpbnZhbAo+ID4gICAgICAgICAgICBkZXNjcmlwdGlvbjoKPiA+ICAgICAg
ICAgICAgICBUaGUgc3RhbmRhcmQgU3ZpbnZhbCBzdXBlcnZpc29yLWxldmVsIGV4dGVuc2lvbiBm
b3IgZmluZS1ncmFpbmVkCj4gPiAtLQo+ID4gMi4xNy4xCj4gPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
