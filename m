Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD6BC61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SP++eI75MOE5cyQeQ1W8xu48aLlrL7sB9X0rIeIHE08=; b=W1zLaZFDdu9qCR
	OCuvteb7ve6VLhk26Kzp+1Sj2tagGM/pClYIm0pTizS/X60qFrucoygZ2yI7HUooTw+PcOFyyB4Wa
	49YzjLSg3rF2obihh9/2OD3xGRZofrLnacXISrB1fVl708N4TyuW4zmwhWT61hVR3f0a4BN0CXzLa
	Hs1ZzfeR6UgXggCATtl+b8K6kPepRa3tPxL0PGuwLMc+dFAi5a26x81NnMkFX4DyLfg1n7xs1Hv9d
	JCXDgj5GYVDBlrSeArKHXlRAask+BtLlzpZG2iMUuswNCJPzy/k0sYDbJDYXbTeYWWOfh55QnCxns
	pkTHJkjal9geKigC4Iuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ2d8-0000000GBzN-2S8w;
	Fri, 13 Jun 2025 11:31:30 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ1qX-0000000G5le-1phm
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 10:41:19 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553b584ac96so21854e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749811275; x=1750416075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfKzLlzdg8/hxOQ/sfQWUfeF7cK8hBoGCPK1f9nwKuY=;
        b=TzrBcHfxl56qgsksx2gFgXWuKU8Ey0uVXk9cka6qWnsxE2em5JwPnQkuwAoOucJQ5i
         ItR+ew6HWSDn1cb9GTGFyj6qQP9fqb4Ho4sLXGEtwU2Tvxo5XEn4hzlbDzROkWbY5+gH
         KDaJLHKzveQyLlqlVk6A5NEmqVC9RgFsWzR3tYoI0g0Xn2Njf4TYwhGwMMIwkmapGj9d
         8w/1kAnkkn2QNCkO07LP/DmsYLd0HCz1xnqpgJGN6Oi/D2YN6ysjcXKAhMCmD1P3ZnoP
         CIKU2d6/Ofh7ABZa5FTl6m/WaHlyDvqh53g0fH6BipY5qs/Ss+R/AgictGcBnuX0hVns
         kbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749811275; x=1750416075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gfKzLlzdg8/hxOQ/sfQWUfeF7cK8hBoGCPK1f9nwKuY=;
        b=FwPrODXkhep7VrHj8Uux39IFJniH5I6A9bhIsc3B/VXw90tyadZyaZROVlcShqvobB
         306MsQHCLM7PZZco0N8O/VOoJTvzzYSej9KGug2iCg53Ag1XraJ1cDPbh5rzUXAt2lOQ
         +n+W4ifonjBCbrC8I9fX0rqlfN5X3jK/BO2ArD1opiBELzW9T/AfEZLTeLsPIRdGxanv
         b/rWNdoMBlOOiUe8wugA94wwSnGf2ZmpNUQ1ee58fZnRLZ0uJK19Uio/r++Ojya2CXMO
         JSbSO4pkZRXAkl3c9lDzqlLCyHx9PJ7SJUGvSxQnVUovX9k4YN2DRruP5G6OwnF7XaSn
         WY5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZzU5E1f45rM0FJNwd3/pcBlL9yR5oV96QhBcMdCudddnwlUhlSpFHGKq1qEL1HK4YHgohU+NvZJx+iw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0Zsvdvm/FBP2M4W+IPDSqFI/CJXXDicqt0oURqqcT4sRE0WKf
	DUnXOEskrfLz9cELQAJNpTQGKOSEObdYH/wsv7z080K/O5Ix4MDnggvYYcSkiBu2aSZmbQiiOf8
	mQwME/zMZgKGXSY7yYDxF8NoHNuqnBK4fM3yVv2cDWw==
X-Gm-Gg: ASbGncv+DLhq+3oXOl9eB0RMHa6EXyMWXFKA3iGZQOhfc9fbdJvJB/0bCYBhgkCCJbM
	Fz+snGMJwUWBXAX4dJUUa6DzAAnfTje+DKcVdt1Hb6WYktEo0Vp8JbomJRlHpPB2Hkk6Am3nT/k
	0OIw2MiIQfTL5DkesAuNSG+xPGOluXPyOsbz8KrC6EeHp6HoEGm9VrL30GJ4BuB2BesefaaaOPa
	ViYoA==
X-Google-Smtp-Source: AGHT+IEI5iVUc0DEPqOvU7NFkvOz7nMKRic8C5LUBBmjPtqE1B4qvCBRzNWQvX+CVfpF9MF2KnGVP2FIuyqsGVeSles=
X-Received: by 2002:a05:6512:2250:b0:553:23f9:bb37 with SMTP id
 2adb3069b0e04-553af9a5b4cmr656368e87.40.1749811275263; Fri, 13 Jun 2025
 03:41:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
 <CGME20250529222405eucas1p18ed1254bf1b2d78468734656fec537e1@eucas1p1.samsung.com>
 <20250530-apr_14_for_sending-v3-3-83d5744d997c@samsung.com>
 <20250603-whispering-jaybird-of-thunder-f87867@kuoka> <d42a8c49-7ad2-49ef-bd9c-1e3d9981b58e@samsung.com>
 <e5a0bee2-ff74-47cf-ad2c-0c78b57ae6cf@kernel.org> <a6a29e58-8613-47f0-9e5c-d125da7ddb49@samsung.com>
 <cc4dbf7c-e023-403c-88be-4691f97a0ff0@kernel.org> <c7774790-07c3-469d-a994-9e84108ad21d@samsung.com>
 <CAMRc=Mexq9ThfG6jZUbs3wYDA9UZN-+pHnX_Y-7WO4ubXvEuCw@mail.gmail.com>
 <ad6981eb-f53a-4a7b-90bd-2e2705bd0297@samsung.com> <59cc6827-1602-402a-9279-96ad6285cff4@kernel.org>
 <e5d3d3b3-7ada-476f-9558-328d3d316088@samsung.com>
In-Reply-To: <e5d3d3b3-7ada-476f-9558-328d3d316088@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 13 Jun 2025 12:41:02 +0200
X-Gm-Features: AX0GCFuR8VJK4btiZ7nnnlSFNivWr2LgUYbi6S3FuFypHNtbVFAa-18d5mDtat4
Message-ID: <CAMRc=MeVopfshe02MmYQQ5jS9oUKif4nR97WU68-nsVgCLG36A@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] drm/imagination: Use pwrseq for TH1520 GPU power management
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Matt Coster <matt.coster@imgtec.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_034117_580517_419E30AB 
X-CRM114-Status: GOOD (  25.97  )
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMTA6MjXigK9BTSBNaWNoYWwgV2lsY3p5bnNraQo8bS53
aWxjenluc2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+ID4gV2h5PyBZb3UgaGF2ZSBzcGVjaWZp
YyBjb21wYXRpYmxlIGZvciBleGVjdXRpbmcgc3VjaCBxdWlya3Mgb25seSBmb3IKPiA+IGdpdmVu
IHBsYXRmb3JtLgo+Cj4gVGhpcyBpcyBkdWUgdG8gaG93IHRoZSBwd3JzZXEgQVBJIHdvcmtzOyBp
dCBjb25zdHJ1Y3RzIGEgYnVzIG9uIHdoaWNoCj4gcHJvdmlkZXIgZGV2aWNlcyBtYXkgYXBwZWFy
IGF0IGFueSB0aW1lLiBXaXRoIHRoZSBjdXJyZW50IEFQSSwgdGhlcmUgaXMKPiBubyB3YXkgdG8g
ZXhwcmVzcyB0aGF0IGEgcHJvdmlkZXIgZm9yIGEgc3BlY2lmaWMgdGFyZ2V0IHdpbGwgbmV2ZXIK
PiBhcHBlYXIuICgnZ3B1LXBvd2VyJyBpcyB0aGUgZ2VuZXJpYyB0YXJnZXQgbmFtZSwgYW5kIG9m
IGNvdXJzZSwgbW9yZQo+IHNwZWNpZmljIGJpbmRpbmcgaXMgaGFuZGxlZCBpbiB0aGUgcHJvdmlk
ZXIncyAubWF0Y2ggY2FsbGJhY2sgLSBiYXNlZCBvbgo+IHRoZSBjb21wYXRpYmxlIGFuZCB0aGUg
bm9kZSBwaGFuZGxlIGxpa2UgZGlzY3Vzc2VkIHByZXZpb3VzbHkpLgo+CgpUaGlzIGlzIGJ5IGRl
c2lnbiBhbmQgYWxzbyB0aGUgcmVhc29uIHdoeSB3ZSBkb24ndCBleHBvc2UgYQpwd3JzZXFfZ2V0
X29wdGlvbmFsKCkuIElmIHRoZSBkcml2ZXIgY2FsbHMgcHdyc2VxX2dldCgpIGF0IGFsbCB0aGVu
IGl0CmV4cGVjdHMgdGhlIHByb3ZpZGVyIHRvIGV2ZW50dWFsbHkgYXBwZWFyIG9yIHdpbGwgZmFp
bCB0byBpbml0aWFsaXplLgoKVGhhdCBzdGlsbCBkb2Vzbid0IGFuc3dlciB0aGUgcXVlc3Rpb246
IHdoeSBjYW4ndCB5b3UgaGF2ZSBhIGNhbGxiYWNrCmluIHlvdXIgbWF0Y2ggZGF0YSB3aGljaCAt
IGZvciB0aGlzIG1vZGUgb25seSAtIHdvdWxkIGNhbGwKcHdyc2VxX2dldCgpL3Bvd2VyX29uKCkv
cG93ZXJfb2ZmKCk/Cgo+IEZvciBhbGwgb3RoZXIgc3VwcG9ydGVkIFNvQ3MsIG5vIHN1Y2ggcHJv
dmlkZXIgd2lsbCBldmVyIGFwcGVhciBvbiB0aGUKPiBidXMsIGFuZCB0aGUgY3VycmVudCBwd3Jz
ZXEgQVBJIGRvZXNuJ3QgYWxsb3cgYSBnZW5lcmljIGNvbnN1bWVyIHRvIGtub3cKPiB0aGlzLgo+
Cj4gSG93ZXZlciwgeW91ciBzdWdnZXN0aW9uIG9mIGhhbmRsaW5nIHRoaXMgd2l0aCBhIHBsYXRm
b3JtIHNwZWNpZmljCj4gZHJpdmVyIGlzIGEgZ29vZCBwYXRoIGZvcndhcmQuIEl0IHdvdWxkIHN0
aWxsIHJlcXVpcmUgYSBtaW5pbWFsIGFkZGl0aW9uCj4gdG8gdGhlIHB3cnNlcSBBUEkgdG8gd29y
ay4gRm9yIGV4YW1wbGUsIGEgbmV3IFNvQyBzcGVjaWZpYyBkcml2ZXIgZm9yCj4gInRoZWFkLHRo
MTUyMCIgY291bGQgY2FsbCBhIG5ldyBmdW5jdGlvbiBsaWtlCj4gcHdyc2VxX2VuYWJsZV9vcHRp
b25hbF90YXJnZXQoImdwdS1wb3dlciIpIGR1cmluZyBpdHMgcHJvYmUuIFRoaXMgd291bGQKPiBz
aWduYWwgdG8gdGhlIHB3cnNlcSBjb3JlIHRoYXQgdGhpcyB0YXJnZXQgaXMgZXhwZWN0ZWQgb24g
dGhlIHBsYXRmb3JtLgo+IFRoZXJlZm9yZSwgd2hlbiB0aGUgSW1hZ2luYXRpb24gZHJpdmVyIGxh
dGVyIGNhbGxzIHB3cnNlcV9nZXQoKSBvbiBhCj4gVEgxNTIwLCBpdCB3b3VsZCBjb3JyZWN0bHkg
cmVzdWx0IGluIGVpdGhlciBhIG1hdGNoIG9yIGEgZGVmZXJyYWwuCj4KCkkgZG9uJ3Qgd2FudCB0
byB1c2UgdGhlIHdvcmQgb3B0aW9uYWwuIEkgdGhpbmsgd2hhdCB5b3UncmUgdGhpbmtpbmcgb2YK
aXMgYSBraW5kIG9mICJkZWZlcnJlZCIgZ2V0IHdoZXJlIHlvdSBnZXQgYSB2YWxpZCBoYW5kbGUs
IHVzZSBpdCBhbmQKdGhlbiwgdGhlIHByb3ZpZGVyIGV2ZW50dWFsbHkgYXJyaXZlcyBpdCB3aWxs
IGdldCBhdHRhY2hlZCBhbmQgaXRzCnN0YXRlIGFsaWduZWQgd2l0aCB0aGUgY3VycmVudCBzdGF0
ZSBvZiBhbGwgdGhlIGV4aXN0aW5nIGhhbmRsZXMuIEknbQpub3QgYWdhaW5zdCBpdCwgaXQgc291
bmRzIHF1aXRlIGVsZWdhbnQgYnV0IHRoZXJlJ3MgYW4gaXNzdWUgb2YgZXJyb3IKcmVwb3J0aW5n
IGluIHRoaXMgY2FzZS4gV2UnZCBuZWVkIGEgbm90aWZpZXIgb2Ygc29tZSBraW5kIHNvIHRoYXQK
Y29uc3VtZXJzIGNvdWxkIHN1YnNjcmliZSBhbmQgYmUgbm90aWZpZWQgYWJvdXQgZXJyb3JzIGhh
cHBlbmluZwpiZWhpbmQgdGhlIHNjZW5lcy4KCkJhcnQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
