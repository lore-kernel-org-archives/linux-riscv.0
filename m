Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D32C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 17:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NiCo7Ya6+HSKIt0gubIeZ1kcPsrGA51YbFcI/qVoTA=; b=KxOxVWOQshK4aY
	HzfnWSJVNqZRd7146/bYhiO6SrhyjiEAVCF2DjOt+e62Z6z7GNlT+NFDxlmRpFruie7AaByNKKVMX
	MKkRNc+OnkBXAqwXC4iahJyGOfMTDYCxZXvo/pMbMuk40rIzJTq7fP6QhchC8+2Hi5gtHseasCo2P
	vrWC3GSqfAAAraOcn8/GbnGWeQR4SYbeoYBKb0Ije8wHspgMWII3B7pKxuyoeEhM+wpHgTMvOB4CQ
	7MlBOHQfqByTSXzGOfVZ0l0/IDFObkhAHnSbs71vEP78Wf0QzrmQuxiPehkXhcyrPVFtlJUjoArUS
	2tJKTOUoLbjKM9QSa5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpIk-000tjV-2q;
	Thu, 14 Dec 2023 17:15:10 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDpIi-000tiC-1U;
	Thu, 14 Dec 2023 17:15:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so41119645e9.3;
        Thu, 14 Dec 2023 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702574104; x=1703178904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZcWwYsWqgvb8N253CfVL+G75y7l04rNTgihuYv69v8=;
        b=mKbRFi19Gy2bB5R6naLdrVx7Fm3fFtUbbkC9DuJ69ySEI3gv/BoV/an6lSrNcQWLe4
         TPRanSWu3sGmr7OjBoytDNzw8rYtRd9niSQpuZyefqIiB/+6xsQuKhkMzRe9FXEHQG+8
         RHrMyme3aub2JEtcUpMU2lIXQzoHHCGx+M01uMRNBb8so4nfUtBeY7nfUHLvs+txlotE
         wJJtK6uJzWVIX++ZlSPKOgqGQ5XzeWUIIYCpop3QKMBnS1Addr3aumN8EujqS6oJ6IjV
         qKW3ah0kIiITeBj/qbgKRcKSYQlTmbr9GEzjOhdYog9aPVyKjhR8dcnXZVxPOrhjY7ef
         jTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702574104; x=1703178904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZcWwYsWqgvb8N253CfVL+G75y7l04rNTgihuYv69v8=;
        b=aCVzmvoMtyvmX+jAXwkwhR+NA8WWEh0CdXS7mY50j2LCO13ugSg4ZJ8Qws7dYCTWtc
         EgDFEAVhy2laClH2FOlQLzbK64iAV+Q6eGl87wOgkMtDpDmWzo+8i5X/1NyOGLepA6ae
         6tRA21Se0pnojw88jnQSwDIQ6IYFwuWC35xMReh+B9VYe9kJZC9Y1Htj5XDh43e9oGKW
         7YrDCAVyMIPtAVOeys7AmmnsMqKDAD6Dadlef8tGIGFgro9FB32uv2VLnhPGQpi2vigo
         lwUFLdPCzwFEAVhAA7tXg4GGQKS0kQPYuHmS1Bg25NuPYCtPUPaDYKuHoO8ZbLBsSIdv
         7XQw==
X-Gm-Message-State: AOJu0YxX2F4DOZROdowILGrRIrCjcSuM6sut8otIYfSXEmspcE15QS6G
	qjPrrD4veaohYCq5w2N6xkM=
X-Google-Smtp-Source: AGHT+IH88hDNA4eO5+FpLzOmaFi9NlwWnrCx5E2RHnwKHW5L3a+1Er8kbAdZJfkQVoeIulog2uiXMg==
X-Received: by 2002:a05:600c:4d98:b0:40c:2715:b10f with SMTP id v24-20020a05600c4d9800b0040c2715b10fmr5890947wmp.119.1702574103545;
        Thu, 14 Dec 2023 09:15:03 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id bh15-20020a05600c3d0f00b0040b4ccdcffbsm26013151wmb.2.2023.12.14.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:15:02 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/5] cpufreq: sun50i: Add D1 support
Date: Thu, 14 Dec 2023 18:15:01 +0100
Message-ID: <1921146.taCxCBeP46@archlinux>
In-Reply-To: <20231214164010.0be50a89@donnerap.manchester.arm.com>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
 <8351928.NyiUUSuA9g@archlinux>
 <20231214164010.0be50a89@donnerap.manchester.arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_091508_498883_3F52C9B2 
X-CRM114-Status: GOOD (  21.28  )
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

T24gVGh1cnNkYXksIERlY2VtYmVyIDE0LCAyMDIzIDU6NDA6MTAgUE0gQ0VUIEFuZHJlIFByenl3
YXJhIHdyb3RlOgo+IE9uIFRodSwgMTQgRGVjIDIwMjMgMTc6Mjk6MzAgKzAxMDAKPiBKZXJuZWog
xaBrcmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gSGksCj4gCj4g
PiBPbiBUaHVyc2RheSwgRGVjZW1iZXIgMTQsIDIwMjMgMTE6MzM6MzkgQU0gQ0VUIEJyYW5kb24g
Q2hlbyBGdXNpIHdyb3RlOgo+ID4gPiBBZGQgc3VwcG9ydCBmb3IgRDEgYmFzZWQgZGV2aWNlcyB0
byB0aGUgQWxsd2lubmVyIEg2IGNwdWZyZXEKPiA+ID4gZHJpdmVyCj4gPiA+IAo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBCcmFuZG9uIENoZW8gRnVzaSA8ZnVzaWJyYW5kb24xM0BnbWFpbC5jb20+Cj4g
PiA+IC0tLQo+ID4gPiAgZHJpdmVycy9jcHVmcmVxL3N1bjUwaS1jcHVmcmVxLW52bWVtLmMgfCAx
ICsKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gPiAKPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvY3B1ZnJlcS9zdW41MGktY3B1ZnJlcS1udm1lbS5jIGIvZHJpdmVy
cy9jcHVmcmVxL3N1bjUwaS1jcHVmcmVxLW52bWVtLmMKPiA+ID4gaW5kZXggMzJhOWM4OGY4Li5j
Y2Y4Mzc4MGYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvY3B1ZnJlcS9zdW41MGktY3B1ZnJl
cS1udm1lbS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvY3B1ZnJlcS9zdW41MGktY3B1ZnJlcS1udm1l
bS5jCj4gPiA+IEBAIC0xNjAsNiArMTYwLDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2
ZXIgc3VuNTBpX2NwdWZyZXFfZHJpdmVyID0gewo+ID4gPiAgCj4gPiA+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBzdW41MGlfY3B1ZnJlcV9tYXRjaF9saXN0W10gPSB7Cj4gPiA+
ICAJeyAuY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBpLWg2IiB9LAo+ID4gPiArCXsgLmNv
bXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjIwaS1kMSIgfSwgIAo+ID4gCj4gPiBUaGlzIGlzIG5v
dCBuZWVkZWQsIGFzIHRoZXJlIGlzIG5vIGZ1bmN0aW9uYWxpdHkgY2hhbmdlLgo+IAo+IFRoYXQg
d2FzIG15IGZpcnN0IHJlZmxleCwgdG9vLCBidXQgdGhpcyBpcyB0aGUgKmJvYXJkKiAoZmFsbGJh
Y2spCj4gY29tcGF0aWJsZSwgbGlzdGVkIGluIHRoZSByb290IG5vZGUsIHNvIHlvdSBoYXZlIHRv
IGxpc3QgaXQgaGVyZSBmb3IgZWFjaAo+IFNvQywgdG9nZXRoZXIgd2l0aCB0aGUgcmVzcGVjdGl2
ZSBibG9ja2xpc3QgaW4gdGhlIG5leHQgcGF0Y2guCj4gV2UgYXJlIGRvaW5nIHRoZSBzYW1lIGZv
ciB0aGUgSDYxNiwgYW5kIGFjdHVhbGx5IGFsc28gbmVlZCB0aGF0IGZvciB0aGUKPiBINjE4LiBX
ZWlyZCwgSSBrbm93LCBidXQgbGFzdCB0aW1lIEkgY2hlY2sgbm90IGVhc3kgdG8gZml4LgoKT2gs
IHRoYXQncyBiYWQuIFdoYXQncyB0aGUgcmF0aW9uYWxlIHRvIGhhdmUgc28gY29tcGxpY2F0ZWQg
cHJvYmUgbWV0aG9kPwpXaHkgbm90IHVzaW5nIHN0YW5kYXJkLCBjb21wYXRpYmxlIGJhc2VkIG9u
ZT8KCkJlc3QgcmVnYXJkcywKSmVybmVqCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
