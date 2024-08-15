Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E348BC52D7C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Aug 2024 15:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xn2YM4oSCEC9mdSJ1zECf1SptBqd69+ntm0NBZSvuK0=; b=g8eUCl424C/IAp
	elZsgsBRqeXAcsBdbDjbYCdvhWadC6Y8Nozt5EU63Dew/SBoTSk07OPlozF92sPLastQRLgt/dsbQ
	nsellkUibYFBqKFMAT6rwJ25NzGVQs7b6XTrqI3RTJunJlklWs8AXz8I2uMrpUukOSjrvNtFXjuL9
	ZGh+LhGN5h6ZYV7uERwOkqUk29TDxAaRY1ptSDF8iqvsFOAyiUw0VQn7nMRNZQLiJ7NjciinUEuCl
	0jhcQzF7M341OUfuqAHRyLZKtDiZPuzAqTJ9hl32CbZvWG4eN4BPkiqGqDci1TCL8E92bQImOImjG
	0E2Jn3eXDT4nDj3xSUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sec0a-0000000AJ2L-0E0H;
	Thu, 15 Aug 2024 15:03:24 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sec0Q-0000000AIyp-10Yu
	for linux-riscv@lists.infradead.org;
	Thu, 15 Aug 2024 15:03:22 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-81f95052c2cso66032839f.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Aug 2024 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723734193; x=1724338993; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mPSwAWscf8tHZseb+W+n2ONsrgl0K3y6yaW/7nWS8k=;
        b=WEKyROR+qQUbCiZ+doU+oAduNwm+VWcRUvfs6NDLia3tRqvtcwsVaTio6nl85zPqhG
         wMV+A/ej/M6GV1FfJslDylfNvbzJKi722HCAy++DllI9ru2i/1b2VUwyzAG1YVHr1m/D
         gu6m/g4sDdGw0OQ6k0akxTmTevq1GjtD3sAxnhvb7VAG40dMU8rHHTqKJsknEGW3xR8S
         22v/mitFXCnhIB8eDONXTMzvrlUy2tOgCrK4YB9Xuv+15nvdkxdsZSn8WmAc530u5yo3
         Rm96EPpSqp7U5sP35NkQQjAyxlanYrXBJ7Wv1KrVoPi5R5bPRyODJPhXXXurmNO/mvLZ
         MPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723734193; x=1724338993;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5mPSwAWscf8tHZseb+W+n2ONsrgl0K3y6yaW/7nWS8k=;
        b=FqszcHS/4qHSEq0jzvBb7pJjkvzxqQgmD0p+sYyIiTq+gerI3YTbIuJ6RrdX6Kaon1
         i4QAC3ChESbyETZRUp18YOoewPHk004PmiaxzDiC9thCjvcvH9lOyL2kSOfF8DnEEKVv
         Ccf6bGteE1ebAJEsgSSb3Zu2l5KitdcK0YLVhcvhDeHMrPyDd+gqEIJlIhT3xNBOzvlk
         eC7E7+q2u6TtdxS/rfFKaRxAUxB3dC8HtJovOnyZlE0oxBZ1FE3/SBhoZO438yx8vAF/
         EvrnroxDJF5QHrYW1l4Th0jNSGeFNNEx8p4AA1BkoH/23EmSo/AHOaUt9CdqR/xnfgg2
         sONg==
X-Forwarded-Encrypted: i=1; AJvYcCVXK5SpQZk9l43RH83vNdWIuqvoBf2+6t1Wv48QXQu8cBjh6uhfDMStYTvYNw3RoRmANiYRsrCKMl0W7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrwGBoZrwZx6IBBvdjTnoTtlP9v3847dTFl2v91tVJDb2BD4Hw
	Y/YI6GbMgJsO/CIVOsGDQYlp/SLTnigW8r/72DAk9dzZMiB56i4BAaICcTq6sfGzsMv1DL9kPnI
	L
X-Google-Smtp-Source: AGHT+IF2Y36Z2WJheMtc9w/yNlpCQH/p4fRlXJ1oZRTUH/ip1MnrhF7mpnTwcuaMC5DPS0f5LA3azg==
X-Received: by 2002:a05:6602:2b8b:b0:81f:69c4:e026 with SMTP id ca18e2360f4ac-824f271eb1amr5205639f.16.1723734192531;
        Thu, 15 Aug 2024 08:03:12 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ccd6eb7291sm534290173.82.2024.08.15.08.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 08:03:12 -0700 (PDT)
Message-ID: <7902c26a-d719-45ad-85d5-61ce6bbc9459@sifive.com>
Date: Thu, 15 Aug 2024 10:03:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
To: Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
 <87jzgjnh9z.ffs@tglx>
 <CAJM55Z8WERQgs=QMyFGWvAHOpwcnOAudBqovaEuDudPSXCvL5Q@mail.gmail.com>
 <87ttfmm2ns.ffs@tglx>
 <CAJM55Z88H635Crc-Aeq+K0qcAk7NC89WVTAFdXDd2aQKQ7QmEg@mail.gmail.com>
 <CAJM55Z_qQX7n8tAeOFqrAH1BFjA9vaWA8rtsPG2BcKmiO88m=Q@mail.gmail.com>
 <87plqalyd4.ffs@tglx> <686d61c4-e7ac-4dca-a7fd-decdd72e84d9@sifive.com>
 <CAK9=C2VHfPnYx8gMjodJNLu9+yR4KvuPXeQZiyZcbu1Mvze-0Q@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <CAK9=C2VHfPnYx8gMjodJNLu9+yR4KvuPXeQZiyZcbu1Mvze-0Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_080316_218427_21916105 
X-CRM114-Status: GOOD (  13.22  )
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

SGkgQW51cCwKCk9uIDIwMjQtMDgtMTUgOTozMCBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBU
aHUsIEF1ZyAxNSwgMjAyNCBhdCA3OjAy4oCvUE0gU2FtdWVsIEhvbGxhbmQKPiA8c2FtdWVsLmhv
bGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+PiBZZXMuIFNvIHRoZSByaXNjdiB0aW1lciBpcyBu
b3Qgd29ya2luZyBvbiB0aGlzIHRoaW5nIG9yIGl0IHN0b3BzCj4+PiBzb21laG93Lgo+Pgo+PiBU
aGF0J3MgY29ycmVjdC4gV2l0aCB0aGUgKGZpcm13YXJlKSBkZXZpY2V0cmVlIHRoYXQgRW1pbCBp
cyB1c2luZywgdGhlIE9wZW5TQkkKPj4gZmlybXdhcmUgZG9lcyBub3QgaGF2ZSBhIHRpbWVyIGRl
dmljZSwgc28gaXQgZG9lcyBub3QgZXhwb3NlIHRoZSAob3B0aW9uYWxbMV0pCj4+IFNCSSB0aW1l
IGV4dGVuc2lvbiwgYW5kIHNiaV9zZXRfdGltZXIoKSBkb2VzIG5vdGhpbmcuCj4gCj4gT3BlblNC
SSB1c2VzIHBsYXRmb3JtIHNwZWNpZmljIE0tbW9kZSB0aW1lciAobXRpbWUgYW5kIG10aW1lY21w
KSB0bwo+IHByb3ZpZGUgU0JJIHRpbWUgZXh0ZW5zaW9uIHRvIExpbnV4Lgo+IAo+IFRoZSBSSVND
LVYgcHJpdmlsZWdlZCBzcGVjaWZpY2F0aW9uICh2MS4xMCBvciBoaWdoZXIpIHJlcXVpcmVzIHBs
YXRmb3JtIHRvCj4gcHJvdmlkZSBhIE0tbW9kZSB0aW1lciAobXRpbWUgYW5kIG10aW1lY21wKS4K
PiAKPiBUaGlzIHBsYXRmb3JtIG5vdCBoYXZpbmcgYW55IE0tbW9kZSB0aW1lciBpcyB5ZXQgYW5v
dGhlciBSSVNDLVYgc3BlYwo+IHZpb2xhdGlvbiBieSB0aGlzIHBsYXRmb3JtLgoKWW91J3ZlIG1p
c3VuZGVyc3Rvb2QgaGVyZS4gQWxsd2lubmVyIEQxIChULUhFQUQgQzkwNikgX2RvZXNfIGhhdmUg
YW4gTS1tb2RlCnRpbWVyIChhIENMSU5UKS4gSXQgaXMganVzdCBvbWl0dGVkIGZyb20gZGV2aWNl
dHJlZSB0aGF0IEVtaWwgaGFwcGVucyB0byBiZQp1c2luZywgc28gT3BlblNCSSBpc24ndCB1c2lu
ZyBpdC4KCkN1cnJlbnRseSBPcGVuU0JJIGFsbG93cyB0aGUgc3lzdGVtIHRvIGJvb3Qgd2l0aG91
dCBhIHRpbWVyIGRldmljZSwgYW5kIHRoZSBTQkkKc3BlY2lmaWNhdGlvbiBkb2VzIG5vdCBtYW5k
YXRlIHRoZSB0aW1lIGV4dGVuc2lvbi4gSWYgY29uc2Vuc3VzIGlzIHRoYXQgZWl0aGVyCm9mIHRo
ZXNlIHNob3VsZCBjaGFuZ2UsIHRoYXQncyBmaW5lLCBidXQgY3VycmVudGx5IEkgc2VlIG5vdGhp
bmcgaW4gZWl0aGVyIHRoZQpwcml2aWxlZ2VkIHNwZWMgbm9yIHRoZSBTQkkgc3BlYyB0aGF0IGd1
YXJhbnRlZXMgdGhlIGF2YWlsYWJpbGl0eSBvZiBzb21lIHRpbWVyCnRvIHRoZSBrZXJuZWwgaW4g
Uy1tb2RlLgoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
