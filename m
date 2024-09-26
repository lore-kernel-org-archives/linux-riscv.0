Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E601FCCFA13
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 09:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YR75C1LYymqnciC/lgBX35f9R+weIXAd9a0NK3D8KMk=; b=znFIEwD59reOID
	+qMzTS064o32b+gs4givTGtww6meI1YFGGiVvXKwQyXB4LbSQiWhX1hzRY+BYiMiicqPwJjhoNpz+
	DmhAye9KsMzOvNIDqN6Z94rXHGoRbjNqE6kKHhu1yghkdl4L4YwkU2TqEm+LNp4ZtN2r9/SsuTrua
	zwL1HSUblG2Yy+1qI8z3oxUJ46w7qR3vHbQJ7/b4k+WlYhIqdLlypybUIxLqNn0l5fWo7xWDq209+
	XBSMm0bzDlABZHfT2nWNBXifE9Qg9f5G9XeG88lTXIw4NhsWJSNctAI0xWr/0mSzSJJto2B8YNSJ+
	ROdCsWTFjLtPwsNSOwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stl9h-00000007xci-3WwD;
	Thu, 26 Sep 2024 09:51:25 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stkzm-00000007vDx-3vRY
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 09:41:12 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3a1a90bd015so2892825ab.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 02:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1727343670; x=1727948470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FnhWXWhJY5yX0Pz22eGrT3yNZ4PY7RxqE/CT+upcRM=;
        b=Dw2jlu7V3KY5i4irbz0KsmIr2fgLbsPR/LUgBoRGLNK7r8Rg8wk8Ny/16w0srdjy+Y
         oUVLsdEY09kJRwvw5evkxmiMParX0O0BcznxUY6X996ZOg2k8QrxqB3kXrpJggNqRoU/
         Xmfl6KMFBjnTtzJV64I0Uoqm6/BlBlSFkuu9toRyGlymt2MYxYJDPfSDHbVOcajDBBUP
         PJfH8ZumygsJS5rbZnZ9Pge9+4skAg5DYHstrI0MvifYYP0w8LnKS79BnpL+I5YaxZkO
         8Ja0oDEJj6Nqq43R9HuQe3cIljMp1Dv6nICuIdlsNtkfPgwLx8c2Qq4jdSaX+Cnkmzz+
         SwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727343670; x=1727948470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FnhWXWhJY5yX0Pz22eGrT3yNZ4PY7RxqE/CT+upcRM=;
        b=VVQleXZXcG473iC0VqmxRj/8n/mR4/uZuesMqAPwAPW+ZEL/vjGhTZrvWQhx8lf4bT
         UuXvMD7H8NTQqhGQkMMbuH2J6bsyKo6vJhUVYKzF9j3L7nntxaRhR/hV2FysY7ex7xwE
         W3wrTnmJm/hqdnRrT6YU10XXgOBqYLJzaEV7Z76CCnxZ7d5yUguyjZqeh20vDf+gNAT2
         CLGtfQP0hYnbUbgmcxBMT4fUjYtGo18yao3vPC9WMc3K1GcYMTTAHjgQk0vkp66goLYJ
         lCeYBVgzckfsuYIZPPeN+VzpaeM4c4dcoMGpegF/YLaSO+RIgOdlbGy/r6aDsSgxmWMn
         MfsA==
X-Forwarded-Encrypted: i=1; AJvYcCVo7yJQ6OzRIXwK1SZ1ZI3Fpp2uKBqnNMkssMQh5hp/Li7hPm068B9uGnYxnNt5iy5JaDwmdx3IvWc38g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyugLeXFvQJnGCdV5mi5MebcrqJhSAUtZTBpI3MDbH6OfUq/+Ed
	03o/D45vfJaPt08IZddLKZ22uY8zogZXNmS8NjoCQaRrtV1o09j3Oz4e6B2+nv9q/mDoKgOdaca
	n+SGqrzSlwCvLfZKTeBB9OqyNDGlk07o4NZoLIQ==
X-Google-Smtp-Source: AGHT+IHqNUMKocHT7RIHy4uucpu7Fe6ujivpI7W/6ABihTZ2wyqDu266A5BST9H2zCCJnzEm7SRobEf7LeCchdTK+UA=
X-Received: by 2002:a05:6e02:1a24:b0:3a0:52f9:9170 with SMTP id
 e9e14a558f8ab-3a26d6f9e12mr58910685ab.1.1727343669759; Thu, 26 Sep 2024
 02:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240926065422.226518-1-nick.hu@sifive.com> <20240926065422.226518-4-nick.hu@sifive.com>
In-Reply-To: <20240926065422.226518-4-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Sep 2024 15:10:58 +0530
Message-ID: <CAAhSdy3iB++KRj_q5GS5qpri2A9OZii=p1itxiXQnoos3So3GA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clocksource/drivers/timer-riscv: Stop stimecmp
 when cpu hotplug
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_024111_127273_D79F293E 
X-CRM114-Status: GOOD (  14.68  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>, Mayuresh Chitale <mchitale@ventanamicro.com>, greentime.hu@sifive.com, Thomas Gleixner <tglx@linutronix.de>, Samuel Ortiz <sameo@rivosinc.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMjYsIDIwMjQgYXQgMTI6MjbigK9QTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gU3RvcCB0aGUgc3RpbWVjbXAgd2hlbiB0aGUgY3B1IGlzIGdvaW5n
IHRvIGJlIG9mZiBvdGhlcndpc2UgdGhlIHRpbWVyCj4gc3RpbWVjbXAgcmVnaXN0ZXIgd2hpbGUg
Y3B1IG5vbiByZXRlbnRpb24gc3VzcGVuZC4KPgo+IFN1Z2dlc3RlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
LzIwMjQwODI5MDMzOTA0LjQ3NzIwMC0zLW5pY2suaHVAc2lmaXZlLmNvbS9ULyN1Cj4gU2lnbmVk
LW9mZi1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0K
PiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIHwgNiArKysrKysKPiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItcmlzY3YuYyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+
IGluZGV4IDQ4Y2U1MGM1ZjVlNi4uMTY2ZGVlMTRlNDZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Y2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ICsrKyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGlt
ZXItcmlzY3YuYwo+IEBAIC0xMjcsNiArMTI3LDEyIEBAIHN0YXRpYyBpbnQgcmlzY3ZfdGltZXJf
c3RhcnRpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gIHN0YXRpYyBpbnQgcmlzY3ZfdGltZXJf
ZHlpbmdfY3B1KHVuc2lnbmVkIGludCBjcHUpCj4gIHsKPiAgICAgICAgIGRpc2FibGVfcGVyY3B1
X2lycShyaXNjdl9jbG9ja19ldmVudF9pcnEpOwo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFN0
b3AgdGhlIHRpbWVyIHdoZW4gdGhlIGNwdSBpcyBnb2luZyB0byBiZSBvZmZsaW5lIG90aGVyd2lz
ZQo+ICsgICAgICAgICogdGhlIHRpbWVyIGludGVycnVwdCBtYXkgYmUgcGVuZGluZyB3aGlsZSBw
ZXJmb3JtaW5nIHBvd2VyLWRvd24uCj4gKyAgICAgICAgKi8KPiArICAgICAgIHJpc2N2X2Nsb2Nr
X2V2ZW50X3N0b3AoKTsKPiArCj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+Cj4gLS0KPiAyLjM0
LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
