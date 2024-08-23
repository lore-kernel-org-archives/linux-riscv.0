Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984ABC531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 07:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cm+ioJpKTjnfs/w+OO4c+i5tf4+MA3a3DJ2AzPgnXlY=; b=I1QV9xWdxo/hH5
	tbol6keGOHctR32PxL5WOyo+UqUi0gn0LoNhS7ITKMK0szmd4f4MU3UCcXRSiUfh1C1bjynR5zczj
	98/W5CaAqmGsciIYFB3/CorC4lLQ0lykqsZM5BuLT0v87FqiGqduAYWOHQ9+y/lu/CASMyW8O+UXi
	CgfcuUidFmmACUiyG4rvzaszn3uyqU7gfSQz+5IGQ0zWaqlEsPWGrHcDWDHsEvYpY9xqmynYRN6TR
	nIYEdK1qbFmPi66QZ8jtiwlJ5cvlnDKRB0xLHnqKa9vT6mVgYp3X26yuKjf8N0HW0hyNa3ME3a/nW
	cvV+ZA+1suz7yqk+UzHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shOVg-0000000Fbtm-2wIE;
	Fri, 23 Aug 2024 07:15:00 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shOQH-0000000FaXv-0J4d
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 07:09:26 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-81f94ce2272so60432539f.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Aug 2024 00:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1724396963; x=1725001763; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+xtomViJRKkecljBjWQnaYi+v9/a71K9NKTwuwwlJ0=;
        b=SotyL7GYq0gyFjCumwl5gYg51WEhYBbOl8cAeAArbLlfbHbQIp0C9VKyxj3rpIDB2b
         fWZHpwZyg/e4CVr1s7X1N+5WwJ7brAHIBaVDKUKRNklZxPqwVsE8VjP8Fet6ea/bzhJ5
         9KPi53nCQ+weTQcSPuFb12dnT0Iaz3GDCiuDvsZi/vIMWrl6qffsbC3JftG+uywOnqOB
         ZW/9y8/AQ2FfwH8CWKwrkq9xwvVRusNAkEnYcD24lsx48aL96eahbMk56bYfi0HsX/8n
         mGKCvcN2avCWMPoPpM+eKko40ka2+dd6fxxc33JRzFpbon1s76360WslA/Iy99CowUH9
         OuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724396963; x=1725001763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+xtomViJRKkecljBjWQnaYi+v9/a71K9NKTwuwwlJ0=;
        b=j8yJyMd7LS8V3EpitOGdljRKawuQ8yd276IuK4XnU3VlD0GrrE32OxZhVqK/8x6bhk
         TdKPRUk4/AO2pGGobPv9ig4yOMiNtnKyoDA9O7XqlBaj+ThCM0hrL/Hjupzgl+LzZUYp
         NKDyS1rckA4L0bqofsTiS7TwCaTKWAFR8LAOYXipMUomazS/G8hAkqmMOP524ga64kiU
         sYnP3/ILSCZxAfkbBl67JVzjKpAvVmrAvIj1/Q4BeARgLCmgcE0thdNYvCqV9KsNraKv
         OXcDIy3ZFw2oFwwTNYMxIeIj4x86OjyjccxS1qjzG4V2DxbpSs9qrMXpx6oGArpP2H56
         O0EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN3nkLGPoNEO+a9lGpBURqfNGVqNJN6nuihgL6VKvI/eDAH6FHbwPTiU1wTKjs8Fho1Zg8dqE+yeyYiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXMfpvjGVYNVDYbB/JMOxoZKPhTUqLFGjiMaTVL9mTJX9MSAf5
	Z4zw1kD4bGDIfkDCbWbsNos7raVSftsAjmfEFt+TmoeUX5w26yvnHP8Sb+0YCcEW3gu5vJP2g0L
	mLxITmJuliIOaznz3Y84U7IxCVxlDi241ZVYnMQ==
X-Google-Smtp-Source: AGHT+IFvCf4E3AaZh8GOYF6qDZtM9rSpNnAk22CeUU8eVSdJtW5sQOCjzvPdcdppk0FFBC/EkZxVm+WiWqVpIISR9II=
X-Received: by 2002:a05:6602:14cd:b0:7fa:56f0:ad87 with SMTP id
 ca18e2360f4ac-8278732f754mr186317239f.10.1724396963618; Fri, 23 Aug 2024
 00:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240814054434.3563453-1-nick.hu@sifive.com> <20240814054434.3563453-2-nick.hu@sifive.com>
In-Reply-To: <20240814054434.3563453-2-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Aug 2024 12:39:12 +0530
Message-ID: <CAAhSdy2HkZrd6VmZ=L84soCJ0gcix2J+6MOMZ15OT8ri0=m1xQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] cpuidle: riscv-sbi: Move sbi_cpuidle_init to arch_initcall
To: Nick Hu <nick.hu@sifive.com>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, 
	Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_000925_329003_E5C46F0A 
X-CRM114-Status: GOOD (  13.72  )
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

T24gV2VkLCBBdWcgMTQsIDIwMjQgYXQgMTE6MTTigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gTW92ZSB0aGUgc2JpX2NwdWlkbGVfaW5pdCB0byB0aGUgYXJjaF9p
bml0Y2FsbCB0byBwcmV2ZW50IHRoZSBjb25zdW1lcgo+IGRldmljZXMgZnJvbSBiZWluZyBkZWZl
cnJlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBS2RkQWtBT1VKU25NPVB4LVlPPVU2
cGlzXzdtT0RIWmJtWXFjZ0V6WGlrcmlxWXZYUUBtYWlsLmdtYWlsLmNvbS8KPiBTdWdnZXN0ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4KClJldmlld2Vk
LWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAt
LS0KPiAgZHJpdmVycy9jcHVpZGxlL2NwdWlkbGUtcmlzY3Ytc2JpLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jIGIvZHJpdmVycy9jcHVpZGxlL2Nw
dWlkbGUtcmlzY3Ytc2JpLmMKPiBpbmRleCBhNmUxMjNkZmUzOTQuLjk4ZTc3NTFkYmZlOCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2NwdWlkbGUvY3B1aWRsZS1yaXNjdi1zYmkuYwo+ICsrKyBiL2Ry
aXZlcnMvY3B1aWRsZS9jcHVpZGxlLXJpc2N2LXNiaS5jCj4gQEAgLTU5Miw0ICs1OTIsNCBAQCBz
dGF0aWMgaW50IF9faW5pdCBzYmlfY3B1aWRsZV9pbml0KHZvaWQpCj4KPiAgICAgICAgIHJldHVy
biAwOwo+ICB9Cj4gLWRldmljZV9pbml0Y2FsbChzYmlfY3B1aWRsZV9pbml0KTsKPiArYXJjaF9p
bml0Y2FsbChzYmlfY3B1aWRsZV9pbml0KTsKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
