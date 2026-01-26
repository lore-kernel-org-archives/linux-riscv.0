Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223D0C88E7C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 09:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9F34pw1GkZiRZjzOozYJZ3HmibfrhgR0FlMB/jsakJU=; b=4gedDZ/VeUVcI6
	hYgJl+IkKvOGFX+8RdhhxTVa2X4tC4zFuXsTmuKnJRqV8BZoQ8zrwHqTWQdvKd1h8LjQDx+9YRT9Y
	Yy6zr3EI4Xaj01n8yy4Iih5SwSy1PblNCTtyBehYDXEE2odTj9iWb7EQVIvbFvzlj5yan7vdxmJFE
	nW79vOUvRcq2ewsRG2ji8FY3iVBE4V58nQnOr1mUzBVsqkYszyiWDy69wD+VQ2xfPYVpQHX+WFMU0
	alm2PIKSrdOTsDjEGW+R+E6L5IpoVGtqOmMc5pGKh9f+3GLTgV9PcXCB86Eh9ByIM9TW/+nxH2LdG
	G0XeEYZ/HOqq74tV+G7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIuX-0000000CCwk-3RED;
	Mon, 26 Jan 2026 09:29:29 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIuV-0000000CCw4-37Y4
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 09:29:28 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so6863649a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 01:29:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769419765; cv=none;
        d=google.com; s=arc-20240605;
        b=Azd5fVnu5orTtmA1bwU0iiiNTbvANzf4YcbgDjvu7H0s0ZkXqfpBylJdilzzcSYuSg
         r1Hgq2k0PX9uVwCwASaswuBHNBkAOhC6WTFET1X9ADlPISN8eAqFA+jJLRW+GCvxEEi2
         9PkADLkI2Ezd8gDasnY9yqM+4d3UTr5wqNzfWjuZv40IpNEdg2A3qTg2hJwUO5MhMlIV
         TNylBNkLUNRT7+NK577lWyeColai791BaJSr743t670ReRCyCrPXcie7sAlsUdEpeKBu
         5uDVBkSyCTZXTXaZ2y6VIUUxvh8L0ncAGkinskM00FbdWtFxdaqhvZMW8aTFgh45t279
         cbmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o/rbdOtgxtjX3LqxxdCWOOuHLMHWGXHyGw+40grPbZA=;
        fh=cfsJ6LDFqube8CoTaAT+Yhh4HlOsKUNg+SALLY6APFM=;
        b=eCq7uW+XIbkyfeQoFD6uM9f1xA2pizCeU3dztmj7EnE2uHAMX5NvTCCCFWf7JWjAdr
         AGvR/Nr36LRVdEl5rYyBzOiKW0HY0gunRx9DjJsDMRtNb1tIithVpyk0VFBlF4rrgDor
         wAEu+pLs7lhmFlqP3yHfBqXx50JhTJ1p9qZKEc2hNldFKRsbZqJ+9ObgoQsIW7ogsaAG
         ZOKxPbUK8ynIniJVlrHyN1N1EUHUSwVn/R9HbCvVd1g0vSIvLyKA7mZ6/ndF41zaCwTY
         oDM8X2GVDyjJLuDEGoRMNqhh3vpfALWkjbNmcRjoeteYQ84bbsZ2vrjPlRKmFXjXn+2b
         BJyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769419765; x=1770024565; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/rbdOtgxtjX3LqxxdCWOOuHLMHWGXHyGw+40grPbZA=;
        b=VORK08qNCufeZmDagFpCTiHGpVk4jRd+o45Y+epnmWA0y4aHZKEQ13UJ7WWtRvOIiS
         pqYW51SxdLB4BaL/WLIBjtILBw7YaEEpUoom5iSaDKxjKESGXtd6FgS6LzofxLGcM2QO
         t60lMfQcRs2f2OiiODzFxOApmvwdxChtfpuazWwBD1JRp/3WCEKlKH4X83eUm/fOd8D3
         NyWotMACPW8fsl5JuwvTIlZhz5DiWWS9wvMq2DGITqEYGk7A5jxgqLuOZtFrw30HKDBh
         v27UUZU63fuwZiSzVIUXOVdYcwbbOXhSdMghBxknQv9k0gciGB9elSIn9gnXTy8izEix
         r8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419765; x=1770024565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o/rbdOtgxtjX3LqxxdCWOOuHLMHWGXHyGw+40grPbZA=;
        b=Er/hbF0P5l5L487YYc7pCJkojSQwaLqth7RNzfPTSS1WNVYXusk5t5jLe23K8H2/1+
         ntSP2K4m3ZUrtg5q7kP9ETC/sUGZ3Si+f/TZUZQul0MQKejIRdWe1ap7LpQYAyixtTed
         7v7JmV9BSMT4k/zr9PBwmFZDApGMxA1t6D8oIhLQMg/B57CnQM7KTdNz622i5k5wguwU
         mAGvpOXoPCUMM7bOunsX2Un5mnvokj6yRsVWY6lC7q9M+9blJljEiH4v5MufACiY3aPu
         2yZokp94ftdnJJgunkguZcRl7ns9VwVys+1JNC0uciBgTOWjhEo9P1G24yYdM/JG7k5U
         fJaA==
X-Forwarded-Encrypted: i=1; AJvYcCUu3Vtl5Rz/KMI+SJ/0psj9Cw/c76WkxwXWwNTY+1yRxownoToU+GrbTuJgsNzVKtDxXbExvn5Dw03ppw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZCCAppx66/wMEiCcSHqCVNLLUszjmLxgE4B/QAnPitdJTwDPj
	+aEM9BXU0pXQA5nvDFEa2F33bFr/kwrBh/uN7BXD4t2mte6x0cZkkN/EdM0U/Z9fRQD48tl439C
	zY4T9EAke2RahvGBvZWZmAfe+WI9H6co=
X-Gm-Gg: AZuq6aI7PxAse214vCZKHmwJ0TDIcj6951a7G6gNysImDRGPOHIXydZIHGp+JvzJYix
	UXleVxv0neu+G0Icj+dJzs77W8VVvYHjvGq9p/JjpCSVw57E67OpNtBGe4bbniPGjW+w1y/UsKf
	9nl2Rm+GMCR0Nak0a4nvSuxQ0eaxu6cTMTV2ai3fXe16xuyea7nAMABP38CmQUFrhTIWulzxhJi
	e8yS2yiNhJ2uV1MVWWn4yHTD9bwjHziMXvt5aY4jsbf6crWDFxA9K2im95cETkYmFqLnClx0jrY
	ITYXTYc8g7VWI7nDF+6l9qxLz6PksMq/F0Xf4Z8905h6gleFMXXhAd1jbW1axhAsNDbK1zk=
X-Received: by 2002:a17:907:9484:b0:b87:c13:f334 with SMTP id
 a640c23a62f3a-b8d2e6f25bcmr276729466b.53.1769419764840; Mon, 26 Jan 2026
 01:29:24 -0800 (PST)
MIME-Version: 1.0
References: <20260123085841.212468-1-jiangfeng@kylinos.cn> <20260123085841.212468-5-jiangfeng@kylinos.cn>
 <aXNVL318XTTQ3tsU@smile.fi.intel.com> <b637ecfb-e852-4864-a80e-fdcd34d93cbd@kylinos.cn>
In-Reply-To: <b637ecfb-e852-4864-a80e-fdcd34d93cbd@kylinos.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 26 Jan 2026 11:28:47 +0200
X-Gm-Features: AZwV_Qhx6wRZPCb1Klqjlj9JkvGS4ujtYHhVZw9cTAQek8bSSg_qHZMEWwb3vDY
Message-ID: <CAHp75Vd0w0P6xFH1KvGon=cTzNVPJXex33=Tv+vpmNKJXKG2sQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] lib/string_kunit: add performance benchmark for strlen()
To: Feng Jiang <jiangfeng@kylinos.cn>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, akpm@linux-foundation.org, 
	kees@kernel.org, andy@kernel.org, ebiggers@kernel.org, 
	martin.petersen@oracle.com, mingo@kernel.org, charlie@rivosinc.com, 
	conor.dooley@microchip.com, samuel.holland@sifive.com, 
	linus.walleij@linaro.org, nathan@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_012927_830641_1304D757 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBKYW4gMjYsIDIwMjYgYXQgODoxNOKAr0FNIEZlbmcgSmlhbmcgPGppYW5nZmVuZ0Br
eWxpbm9zLmNuPiB3cm90ZToKPiBPbiAyMDI2LzEvMjMgMTk6MDIsIEFuZHkgU2hldmNoZW5rbyB3
cm90ZToKPiA+IE9uIEZyaSwgSmFuIDIzLCAyMDI2IGF0IDA0OjU4OjM3UE0gKzA4MDAsIEZlbmcg
Smlhbmcgd3JvdGU6CgouLi4KCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgX2JuX21icHMgPSAo
dTY0KShidWZfc2l6ZSkgKiBfYm5faXRlcnMgKiAxMDAwOyAgXAo+ID4KPiA+ICJLSUxPIj8gT3Ig
IihNRUdBL0tJTE8pIj8gSSdtIHB1enpsZWQgd2l0aCB0aGlzIDEwMDAgbXVsdGlwbGllci4KPgo+
IFRoZSAxMDAwIGZhY3RvciBjb252ZXJ0cyBieXRlcy9ucyB0byBNQi9z77yaCj4gICAoYnl0ZXMv
bnMpICogKDEwXjkgbnMvcykgLyAoMTBeNiBieXRlcy9NQikKPiBJbiB2NSwgSSB3aWxsIHJlcGxh
Y2UgaXQgd2l0aCAoTlNFQ19QRVJfU0VDIC8gTUVHQSkgdG8gbWFrZSB0aGUgdW5pdAo+IGNvbnZl
cnNpb24gZXhwbGljaXQgYW5kIGF2b2lkIGNvbmZ1c2lvbi4KCk9yIE5TRUNfUEVSX1VTRUMuIFdo
YXRldmVyLCBjaG9vc2UgdGhlIG9uZSB5b3UgdGhpbmsgZml0cyBiZXN0LgoKLS0gCldpdGggQmVz
dCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
