Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD39C5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 07:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmyGLHHawAGtlnyobB6IdOBSaToX1QqmGrSPR7Nge9Y=; b=LLxYYJEOnaP05u
	MK0beJxd4D7tXPsCWH4NyUo77l9WpJUemsKPt6gbgeQSfCVfMTYCy5c9nQgkTlveJsZ5W1VjlUD8W
	8QDHsNwXzIIh9/QyWB456BRVngI39svLRYc3JleMQTTig8uiA7iWeyZ2JXRdN5MRgSKXl2vBuGTFd
	x8C1aUtUfq/u30UjIU4+puDygyRSsZOHfHUQkvT8V9FwB9ylPDkaLAOx5fNUH2EHWBoLw2f43orKX
	9AxAJsIGaMZWE1n/ennXUvKunEZeGrDiF/uX5p6aJLMUb4RU9UeP4vU2ckWu/sFzdpFMH3Cvun0Ej
	xqjQtnZq5GG/PhzLagYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkfyb-0000000DTcM-3nq6;
	Thu, 14 Mar 2024 07:58:09 +0000
Received: from mail-yw1-f170.google.com ([209.85.128.170])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkfyX-0000000DTab-2Pe9;
	Thu, 14 Mar 2024 07:58:06 +0000
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-609ed7ca444so7382597b3.1;
        Thu, 14 Mar 2024 00:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710403080; x=1711007880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kd7vHFr5fszcwgfp701zhW6bd0WPIDQKlsKOb1KQCg=;
        b=L2NMdX6hH9xhwlOo2phOywHqoU5Hd/x2upqy+oHiKbc7awSuRC/SkWT07yEKQGJc0d
         fGD8QmkaQnFO4TDWeRiMyNWL7gHFQyTd+Ee14GO0YjF5PWr8ZVWx6xpi5IpLxT7mI5nN
         M0kEMbcMGqfFoH2PNTdnh2nPoaQiPAxkfmpz0eLMNdkSXdk5tIWh1CQG0XUhixUCPl/C
         YAX9xDZ60SWixwd9Qwv8pf22+ODbyY5A8J/8V4OQYejkP4+iYn7j1F0W0tNpZ8D0Ku6f
         hilvzUVTQIPZYZcuT9jnA92vkj+Grjq5bVQ1ni/ZNX4eubcVXKFp3zhN6vePcAR0mVOq
         531w==
X-Forwarded-Encrypted: i=1; AJvYcCXvNVnpV7ou8uYM0SFHwc2ZioNeAIJ43knheLOVwx+hVSh1OvBrqqG1lMRe9asCNmzzhQo7dWrVpx/ra0+I5EhWFH/yQ/nb9WTFonI2UVtxPHHKISdngzeOVXn7VBwUOcZMIN293BoCaRZWFzUTrYtKnp8jkrg=
X-Gm-Message-State: AOJu0YwBRDVsToIkMJueNV6b5wgpa27O97VrVccyzibH4pyOuflUBwx3
	8BgmsKuQv5Ns6Zw+34d3sKdZKfUrIoY0k8hLjPnj+rzPq6V8/r2WK8PK+a16bY8=
X-Google-Smtp-Source: AGHT+IGV3VIN6hDtZdq2mZf3s/rwUzHGgJifoao2MzhHoFY+JyNGXIcgXOQ8mJnNaOPRVikgLUVUhw==
X-Received: by 2002:a0d:f146:0:b0:60c:c4fd:7649 with SMTP id a67-20020a0df146000000b0060cc4fd7649mr890594ywf.16.1710403079762;
        Thu, 14 Mar 2024 00:57:59 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id n28-20020a81af1c000000b00608a5d25dc1sm175207ywh.77.2024.03.14.00.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 00:57:58 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-609ed7ca444so7382087b3.1;
        Thu, 14 Mar 2024 00:57:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqLUxHJ0ZvXymfxjwamweypQpmPzhzpK9iqyGrnc03adJvJIxSjpH1ycthCuYZ6VATxa4uwmlFExX6WqOsuoWV3K19KlQNG/H9IkNClULO+hrnzj+xAQ9mPS6W+oXbwveb1YWC8NL2HMwpoicU7igs5E4JRjU=
X-Received: by 2002:a0d:ea4c:0:b0:609:239a:d0fc with SMTP id
 t73-20020a0dea4c000000b00609239ad0fcmr990474ywe.38.1710403077141; Thu, 14 Mar
 2024 00:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net> <20240312170309.2546362-12-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-12-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Mar 2024 08:57:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHKfd8agPGx+MjvC4cjW5F6DEeVec3Moe-=LLkrT3CXQ@mail.gmail.com>
Message-ID: <CAMuHMdXHKfd8agPGx+MjvC4cjW5F6DEeVec3Moe-=LLkrT3CXQ@mail.gmail.com>
Subject: Re: [PATCH 11/14] s390: Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, netdev@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_005805_639217_E01A7A38 
X-CRM114-Status: GOOD (  20.70  )
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

SGkgR8O8bnRlciwKCk9uIFR1ZSwgTWFyIDEyLCAyMDI0IGF0IDY6MDbigK9QTSBHdWVudGVyIFJv
ZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+IEFkZCBuYW1lIG9mIGZ1bmN0aW9ucyB0
cmlnZ2VyaW5nIHdhcm5pbmcgYmFja3RyYWNlcyB0byB0aGUgX19idWdfdGFibGUKPiBvYmplY3Qg
c2VjdGlvbiB0byBlbmFibGUgc3VwcG9ydCBmb3Igc3VwcHJlc3NpbmcgV0FSTklORyBiYWNrdHJh
Y2VzLgo+Cj4gVG8gbGltaXQgaW1hZ2Ugc2l6ZSBpbXBhY3QsIHRoZSBwb2ludGVyIHRvIHRoZSBm
dW5jdGlvbiBuYW1lIGlzIG9ubHkgYWRkZWQKPiB0byB0aGUgX19idWdfdGFibGUgc2VjdGlvbiBp
ZiBib3RoIENPTkZJR19LVU5JVCBhbmQgQ09ORklHX0RFQlVHX0JVR1ZFUkJPU0UKPiBhcmUgZW5h
YmxlZC4gT3RoZXJ3aXNlLCB0aGUgX19mdW5jX18gYXNzZW1ibHkgcGFyYW1ldGVyIGlzIHJlcGxh
Y2VkIHdpdGggYQo+IChkdW1teSkgTlVMTCBwYXJhbWV0ZXIgdG8gYXZvaWQgYW4gaW1hZ2Ugc2l6
ZSBpbmNyZWFzZSBkdWUgdG8gdW51c2VkCj4gX19mdW5jX18gZW50cmllcyAodGhpcyBpcyBuZWNl
c3NhcnkgYmVjYXVzZSBfX2Z1bmNfXyBpcyBub3QgYSBkZWZpbmUgYnV0IGEKPiB2aXJ0dWFsIHZh
cmlhYmxlKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVz
Lm5ldD4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCj4gLS0tIGEvYXJjaC9zMzkwL2luY2x1ZGUv
YXNtL2J1Zy5oCj4gKysrIGIvYXJjaC9zMzkwL2luY2x1ZGUvYXNtL2J1Zy5oCj4gQEAgLTgsMTkg
KzgsMzAgQEAKPgo+ICAjaWZkZWYgQ09ORklHX0RFQlVHX0JVR1ZFUkJPU0UKPgo+ICsjaWYgSVNf
RU5BQkxFRChDT05GSUdfS1VOSVQpCj4gKyMgZGVmaW5lIEhBVkVfQlVHX0ZVTkNUSU9OCj4gKyMg
ZGVmaW5lIF9fQlVHX0ZVTkNfUFRSICAgICAgICAiICAgICAgIC5sb25nICAgJTAtLlxuIgo+ICsj
IGRlZmluZSBfX0JVR19GVU5DICAgIF9fZnVuY19fCj4gKyNlbHNlCj4gKyMgZGVmaW5lIF9fQlVH
X0ZVTkNfUFRSCj4gKyMgZGVmaW5lIF9fQlVHX0ZVTkMgICAgTlVMTAo+ICsjZW5kaWYgLyogSVNf
RU5BQkxFRChDT05GSUdfS1VOSVQpICovCj4gKwo+ICAjZGVmaW5lIF9fRU1JVF9CVUcoeCkgZG8g
eyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICAgICBhc21faW5s
aW5lIHZvbGF0aWxlKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAg
ICAgICAgICAgICAgIjA6ICAgICBtYyAgICAgIDAsMFxuIiAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ICAgICAgICAgICAgICAgICAiLnNlY3Rpb24gLnJvZGF0YS5zdHIsXCJhTVNcIixAcHJv
Z2JpdHMsMVxuIiAgICBcCj4gICAgICAgICAgICAgICAgICIxOiAgICAgLmFzY2l6ICBcIiJfX0ZJ
TEVfXyJcIlxuIiAgICAgICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgIi5wcmV2aW91c1xu
IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IC0gICAgICAgICAgICAgICAi
LnNlY3Rpb24gX19idWdfdGFibGUsXCJhd01cIixAcHJvZ2JpdHMsJTJcbiIgICBcCj4gKyAgICAg
ICAgICAgICAgICIuc2VjdGlvbiBfX2J1Z190YWJsZSxcImF3TVwiLEBwcm9nYml0cywlM1xuIiAg
IFwKClRoaXMgY2hhbmdlIGNvbmZsaWN0cyB3aXRoIGNvbW1pdCAzOTM4NDkwZTc4ZjQ0M2ZiICgi
czM5MC9idWc6CnJlbW92ZSBlbnRyeSBzaXplIGZyb20gX19idWdfdGFibGUgc2VjdGlvbiIpIGlu
IGxpbnVzL21hc3Rlci4KSSBndWVzcyBpdCBzaG91bGQganVzdCBiZSBkcm9wcGVkPwoKPiAgICAg
ICAgICAgICAgICAgIjI6ICAgICAubG9uZyAgIDBiLS5cbiIgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ICAgICAgICAgICAgICAgICAiICAgICAgIC5sb25nICAgMWItLlxuIiAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gLSAgICAgICAgICAgICAgICIgICAgICAgLnNob3J0ICAlMCwlMVxu
IiAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgICAgICAgICAgIiAgICAgICAub3Jn
ICAgIDJiKyUyXG4iICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICBf
X0JVR19GVU5DX1BUUiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAg
ICAgICAgICAgICIgICAgICAgLnNob3J0ICAlMSwlMlxuIiAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiArICAgICAgICAgICAgICAgIiAgICAgICAub3JnICAgIDJiKyUzXG4iICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICAiLnByZXZpb3VzXG4iICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gLSAgICAgICAgICAgICAgIDogOiAiaSIgKF9fTElO
RV9fKSwgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgOiA6
ICJpIiAoX19CVUdfRlVOQyksICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAg
ICAgICAgICAgICAgImkiIChfX0xJTkVfXyksICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gICAgICAgICAgICAgICAgICAgICAiaSIgKHgpLCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiAgICAgICAgICAgICAgICAgICAgICJpIiAoc2l6ZW9mKHN0cnVjdCBidWdf
ZW50cnkpKSk7ICAgICAgICAgICAgXAo+ICB9IHdoaWxlICgwKQoKR3J7b2V0amUsZWV0aW5nfXMs
CgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJ
IGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
