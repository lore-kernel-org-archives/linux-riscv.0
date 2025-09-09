Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2F1CAC583
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3eCNxVVbPWKTcosd9AtoRNEsa0TWqsmG51bEygS78Ko=; b=bOQ0P62dA0PwCh
	F//MUzOxIqhL6KbWalyakvhZc/XlDJ2VZhmqtogKnXxEciBgcHwlXweH04cW0CJ3z56LQ0WNW+DBv
	3yBW6ATMUv8slpKKz4OtchZhR/pryXcNuSiscRWll9TY15V2NWAIyQ4UOQHya69MrQeeGE50iG4jA
	WHBcwmL+Stucbb9EzGfwCOPFvR7x3Cir8x0Y0Xgbddygh8N/iMiKmjBuBW7Zrf5RLAbjkHNfF9OWZ
	VwNDAKWo0Mo7WbQnMkGAIyVzgbCtmYWwWQ8yfGbH95OcE6UbggapUD2ZZe+6K7vpHNiISYvo6Pjij
	EJGbhK9YEf8FiXelnCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw21L-00000008wdX-0wO5;
	Tue, 09 Sep 2025 17:20:44 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyyo-00000007cCO-3luQ
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 14:05:57 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-55f6507bd53so6094710e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757426753; x=1758031553; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=fOrHRiSUspGy9QjTldyAq1tt7jzEeEjMcduRuS3czL3ujn0QL5UZdrCISBBdzGu5a3
         X2rNw7bTQJ6ri+ybopFOs7nayUC0srAT20Q8La7wKVfuFYRCuhgyL9zYjIKW/beo32xO
         lvTkOm/iaCyMBL2NiIu68+OQF2uSekVmJrL8iW2Hc2FBh9FhaZdM7D4B5FQvwdSPQGJ4
         JnZ7XPijkwft2Zj5Zl3ZccLHDRVttz62LcGI5ThhN65NrnuvDi5PQWTatqkBMSOjkxdj
         NsiERdZvKNS2FNxfxeWY6t9lpjXAhksLY+8qsFKbNgQbgPOk8YCc2q+yFgL5rZhizB7q
         FqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426753; x=1758031553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwHR1FgOXXSSp2VsIjgAXKNRhzqoSYPvwttSy5YEpHg=;
        b=bO/28YRIbhhRW5A7H1zRLvuRTEzgV4pxYrJD73lPE0UsUc9G0KuZJcO6DexIF4eXjO
         i17yxaBrZImryYl3jxcn5WW3kmyS6jktpsQotw+HdNKZ/NvkK/622TSmfwvdZrrSSALA
         0BWo8UiLp5a+OE/3XjyGroH0GZpUTJpxJzV9ahqQ7RAxcmyJ8WQj6Yoq2ZO3cqeHENoc
         /z5+W8eVOq59LwrK30An83JPjfMs12eJetNKGzE7/i6JpoOUALDg7xCNuXUYzsYPjM8h
         ermu70cjZx1qbgAsSSMa69LwBbSZmdRkUUG5oiDsi7MMIIdGUAmNeZcPV+Hs+nBOuBbL
         ACcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtI7Irzj7GiM8xaWg1ohZ0TQ+w8XM8YN0KM7rUHjb0NTBw1ww30xz3DSACUHFkOVnSStfvSEfcKArtwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1yiMMqDiDFNzkwdE6/pkUv7UJISmK6CMXx5k/QwymaKw8iRrg
	PLEDVdnwDYfWaZkQmrXjWz/bUKqcesM5bBOqPmXj94EJ4nuJemskQsLMMjI/RECDqsSiHTPR7HF
	u4AZvnMF19noW/BeARCQJyM/KmZNRoo7y3OqBdwNKwg==
X-Gm-Gg: ASbGnctIl3NyCMSkyVNfxPrgolrSPzxVETWl2a3oxNCluVh8geWrlzSJyS37YTP0Ny+
	vuieP7SI7uvn3XMCMnJQeO+bQRX4/bcl9hxBgVp7vCCnLpNpWHsidyTId40tQD4o876XZFWfx/u
	WsmPCxVFLH9hhWolqud9XsiIaQdB1Lu78RFk+ZV0Apaa4EfAD+8tWBeAdWP/e5wnDRW2U2PW0s/
	VkIGTAO8V5EwhaBEBHqySIfpMH0n/JpHTnHWe0=
X-Google-Smtp-Source: AGHT+IHxbtPyFzNpPyeaiiBaisDmRYDyXY5HX06QQvzN7rQqg4ycDBS5H9rZi94hP+dpGNYd7MLd29QcT4mULfuZ6+0=
X-Received: by 2002:a05:6512:108a:b0:55f:4db1:e450 with SMTP id
 2adb3069b0e04-56260e3b836mr3230997e87.22.1757426753065; Tue, 09 Sep 2025
 07:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com> <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
In-Reply-To: <aMAzZAbNwrRTgFi-@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Sep 2025 16:05:41 +0200
X-Gm-Features: Ac12FXw1RLq4MdeG1hkRFaIkCvacYp3h7kbqz23NMJgO5kiwlT10dViDUNZvzbs
Message-ID: <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_070555_054925_288AA5A2 
X-CRM114-Status: GOOD (  15.89  )
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

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCA0OjAy4oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMDksIDIwMjUgYXQg
MDM6NTY6NDFQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+IE9uIFR1ZSwg
U2VwIDksIDIwMjUgYXQgMzo0N+KAr1BNIEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHJpeS5zaGV2
Y2hlbmtvQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFRCSCwgSSB0aGluayB0aG9zZSA2
IGFsbCBtYWRlIHRoZSBzYW1lIG1pc3Rha2UsIGkuZS4gdGhpbmtpbmcgb2YgdGhlIGNvbXBvdW5k
Cj4gPiA+IGxpdGVyYWwgYXMgYSBjYXN0LiBXaGljaCBpcyBub3QhCj4gPgo+ID4gV2hhdCBkbyB5
b3Ugc3VnZ2VzdD8KPgo+IFdyaXRlIGl0IGluIGxlc3Mgb2RkIHdheSA6LSkKPgo+IGZvbyA9IChz
dHJ1Y3QgYmFyKSB7IC4uLiB9OwoKSSBkb24ndCBnZXQgeW91ciByZWFzb25pbmcuIHR5cGVvZigp
IGl0c2VsZiBpcyB3ZWxsIGVzdGFibGlzaGVkIGluIHRoZQprZXJuZWwgYW5kIGRvZXNuJ3QKCmZv
byA9IChzdHJ1Y3QgYmFyKXsgLi4uIH07CgpldmFsdWF0ZSB0byB0aGUgc2FtZSB0aGluZyBhcwoK
Zm9vID0gKHR5cGVvZihmb28pKXsgLi4uIH07Cgo/IElzbid0IGl0IHN0aWxsIHRoZSBzYW1lIGNv
bXBvdW5kIGxpdGVyYWw/CgpCYXJ0b3N6Cgo+Cj4gPiBBbmQgYXJlIHdlIG5vdCBhbGxvd2VkIHRv
IHVzZSBDOTkgZmVhdHVyZXMgbm93IGFueXdheT8KPgo+IEl0J3MgZmluZSwgaXQncyBub3QgYWJv
dXQgdGhlIEMgc3RhbmRhcmQgbnVtYmVyLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
