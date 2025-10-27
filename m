Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC729CCF9E0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 17:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wV3LoV/jgaPyz1L5cIceCPLRYWaX4lHfItLGmioYh4=; b=rMooIKP0B5/ByF
	u2UP2biG9XaS8Abk+NRNX1cK5uSYdbtzHhYJhRZ0OPh8pYAszuM6DesoyUskZZ025t/1Cdqca+rxF
	CisMUYjfWggx41R6Q87+fDIt5qgIFfGdFqGnbC/1D0XAkGCMGKRwxvtm0Zo9g2Xph+zH1n9w1V+Dt
	mmRd8s9Erk/sQ9cu+lFs3gcyQwSDplxa9RiNabXOG3RZ7kP2WtOVTI7zgzQUS0Y7tYnhjCaJCDRtM
	9sdKcZ5XZEqlKOmZJCpjibLJpk1Y75yrDsWoTd7L4f890hjMK++shQOE6SZKavRA+aWI0K0CxAdG2
	JjR0zM2pKGdFJq1/Q+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQjm-0000000EOz0-1zbB;
	Mon, 27 Oct 2025 17:10:30 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQjk-0000000EOyY-07Wv
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 17:10:29 +0000
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-934e0a174d2so265969241.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 10:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761585026; x=1762189826; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yg0rbfawIn1Arrvn5hPRBZqSEKlTBCbiXBwOFnHB3c=;
        b=V1MdijpewkoPyPloIU4yprawKndFWiU422it1bveTyswGcaRAaiiR0h8iKG9RPzLB5
         fZk2hK2HjVxabeOFdwEeT6pP/uQb8Kd36lzZ44D7iXh3a9hZxyIP/9Obyf4E0FnoLUeT
         ok3gTb7NqLN9403gbrvIdTOuulBRQgNDJvVO+h1EYg7XMJ4qmcGCqOvmZ1Gx+dW/q5hW
         khxj4tHw13SgPjjwUJ47tsCJpTNwaFDD1pep4ibQbxARdB1w1lhPgsGZKE1IZyWkgodt
         6hTymtJqMEvM/D3FI0gbElnvmVO6wEoN1dZLjFPDXekwqEP/uffDLMyqVY0hSlxAZzh6
         b6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761585026; x=1762189826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yg0rbfawIn1Arrvn5hPRBZqSEKlTBCbiXBwOFnHB3c=;
        b=F3Y+UYN1/jV8cD7Re4xo1p9f+JJc3OgSmb7MFMpmY/fASgHgfSMKlhOQh83jRyzjl8
         Ah7Fguk874Jbfg0aMzc4j5zHEmIh/davI6hwEoxc2EgSPr22eu4g8weP4x9D+qCV5sQh
         Ku0jnln+giSWZePAl7xSgn6/Kh+s9OV/tHiXnlsELf/jwupZ1ahzapW+X6EWTMyze3Dj
         71/25edNk7t86iOTdXlWAikLWcrzfjnmktSZdl75lqtxGI/Zkggc7mPVTtGsrPv2JRlt
         wkrH18HN+pH9u3ChHQVt/Jnaxitf6fEwXTK7mv2wUKNDYgVJ/HsVQjYbNDrqHRUmpKZU
         uQUw==
X-Forwarded-Encrypted: i=1; AJvYcCWy/OvKJCIuB5wNNakPjDWe3KT3YK+j2C/d/n/swpgoad5HkDBaV0qPAiJBXBq25i1ccK1NOsFgzRgs0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl8InTwxxRYGkQ+AedINMXT6RFc9Z4J+uqC5jc98uMG26PazzP
	DwIX9NsCCoP/dqcn7BQJyg19zhHkKJWMVf844mP0wFsaAzJ1BtSIwJmyh8wsbI1ZoI16EiWy31/
	ep9w5+l6V3e7etJamEyQtM1Wa4ce8jx0=
X-Gm-Gg: ASbGncs+uu7o8Qlyfg6oFrAq62UN93pRHmphuKfFrmSL5FL50SBjzdOnLrypDgNcvro
	tjZSAvoPcM1Gn9qqSLRmognPaJ4ezTLo9W9vjY2c+xtULQGx72Z95g1dzHKA1Ks/m75BT8sXE+k
	JdhMCmwxh+5BgMIDrwcSLHGRzhAeStQm8PLYjs5L20susxBQCq20nnRim8hTDtgaPdOdHUV1LZH
	Fl2TZcN//TzXJva3cKKLfvSYTiht7ushziV4NKSeBTZSnfyBtKR+tvP+P9iDA==
X-Google-Smtp-Source: AGHT+IHUkYAmfqsL4pfrAr2m2hdDN3o6uRLRGRxPeQNNakdfKiLHAcYIg1YSxmUZUhNXfkuM7ZRz3ojoiDUBwfP84Ao=
X-Received: by 2002:a05:6102:50a5:b0:5db:3d11:c8da with SMTP id
 ada2fe7eead31-5db7cc1d762mr254232137.41.1761585026033; Mon, 27 Oct 2025
 10:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20251020053523.731353-1-uwu@icenowy.me> <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
In-Reply-To: <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
From: Han Gao <rabenda.cn@gmail.com>
Date: Tue, 28 Oct 2025 01:10:14 +0800
X-Gm-Features: AWmQ_bm6-SMkjAfWg6AAWYb_OA35WvrpXbak9x2LihJWZchEZTCd_NTCuMVV1sc
Message-ID: <CAAT7Ki9NGDhVo1dq3R5X-Mo1g0-+MZWcQ2TfWG7CAL27Y6BvcQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/ttm: add pgprot handling for RISC-V
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_101028_074558_316B2737 
X-CRM114-Status: GOOD (  18.96  )
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
Cc: Matthew Brost <matthew.brost@intel.com>, Simona Vetter <simona@ffwll.ch>, Yao Zi <ziyao@disroot.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, dri-devel@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Huang Rui <ray.huang@amd.com>, Palmer Dabbelt <palmer@dabbelt.com>, Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Inochi Amaoto <inochiama@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGVzdGVkIG9uIHNvcGhnbyBzZzIwNDIvc29waGdvIHNnMjA0NC91bHRyYXJpc2MgZHAxMDAwLgoK
T24gTW9uLCBPY3QgMjcsIDIwMjUgYXQgMzo1N+KAr1BNIENocmlzdGlhbiBLw7ZuaWcKPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMTAvMjAvMjUgMDc6MzUsIElj
ZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiBUaGUgUklTQy1WIFN2cGJtdCBwcml2aWxlZ2VkIGV4dGVu
c2lvbiBwcm92aWRlcyBzdXBwb3J0IGZvciBvdmVycmlkaW5nCj4gPiBwYWdlIG1lbW9yeSBjb2hl
cmVuY3kgYXR0cmlidXRlcywgYW5kLCBhbG9uZyB3aXRoIHZlbmRvciBleHRlbnNpb25zIGxpa2UK
PiA+IFh0aGVhZG1hZSwgc3VwcG9ydHMgcGdwcm90X3t3cml0ZWNvbWJpbmUsbm9uY2FjaGVkfSBv
biBSSVNDLVYuCj4gPgo+ID4gQWRhcHQgdGhlIGNvZGVwYXRoIHRoYXQgbWFwcyB0dG1fd3JpdGVf
Y29tYmluZWQgdG8gcGdwcm90X3dyaXRlY29tYmluZQo+ID4gYW5kIHR0bV9ub25jYWNoZWQgdG8g
cGdwcm90X25vbmNhY2hlZCB0byBSSVNDLVYsIHRvIGFsbG93IHByb3BlciBwYWdlCj4gPiBhY2Nl
c3MgYXR0cmlidXRlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VA
aWNlbm93eS5tZT4KPiA+IFRlc3RlZC1ieTogSGFuIEdhbyA8cmFiZW5kYS5jbkBnbWFpbC5jb20+
Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAtIEFkZGVkIEhhbiBHYW8ncyB0ZXN0IHRh
Zy4KPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbW9kdWxlLmMgfCAzICsrLQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fbW9kdWxlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9tb2R1bGUuYwo+ID4gaW5kZXggYjNmZmZlN2I1MDYyYS4uYWExMzdlYWQ1
Y2M1OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX21vZHVsZS5jCj4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tb2R1bGUuYwo+ID4gQEAgLTc0LDcgKzc0
LDggQEAgcGdwcm90X3QgdHRtX3Byb3RfZnJvbV9jYWNoaW5nKGVudW0gdHRtX2NhY2hpbmcgY2Fj
aGluZywgcGdwcm90X3QgdG1wKQo+ID4gICNlbmRpZiAvKiBDT05GSUdfVU1MICovCj4gPiAgI2Vu
ZGlmIC8qIF9faTM4Nl9fIHx8IF9feDg2XzY0X18gKi8KPiA+ICAjaWYgZGVmaW5lZChfX2lhNjRf
XykgfHwgZGVmaW5lZChfX2FybV9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKSB8fCBcCj4gPiAt
ICAgICBkZWZpbmVkKF9fcG93ZXJwY19fKSB8fCBkZWZpbmVkKF9fbWlwc19fKSB8fCBkZWZpbmVk
KF9fbG9vbmdhcmNoX18pCj4gPiArICAgICBkZWZpbmVkKF9fcG93ZXJwY19fKSB8fCBkZWZpbmVk
KF9fbWlwc19fKSB8fCBkZWZpbmVkKF9fbG9vbmdhcmNoX18pIHx8IFwKPiA+ICsgICAgIGRlZmlu
ZWQoX19yaXNjdikKPgo+IExvb2tzIHJlYXNvbmFibGUsIGJ1dCBkb2VzIHRoYXQgd29yayBvbiBh
bGwgUklTQy1WIHZhcmlhbnRzPwo+Cj4gQW5kIHdoaWxlIGF0IGl0IG1heWJlIHBsZWFzZSBmaXgg
dGhlIGluZGVudGF0aW9uLCB1c2luZyBhIHRhYiBoZXJlIGlzIHByb2JhYmx5IG5vdCB2ZXJ5IGFk
ZXF1YXRlLiBJbiBvdGhlciB3b3JkcyBtYWtlIHRoZSBkZWZpbmVkKCkgbWF0Y2ggdGhlIG9uZSBv
biB0aGUgZmlyc3QgbGluZS4KPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4gPiAgICAgICBp
ZiAoY2FjaGluZyA9PSB0dG1fd3JpdGVfY29tYmluZWQpCj4gPiAgICAgICAgICAgICAgIHRtcCA9
IHBncHJvdF93cml0ZWNvbWJpbmUodG1wKTsKPiA+ICAgICAgIGVsc2UKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
