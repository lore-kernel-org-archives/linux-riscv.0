Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE59C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 11:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GO4qhncopR9UhMCeGLwgort4N6MjOWPsDzT4AX9ZEHU=; b=YZJUjweDHTAxYA
	vLyj20OmVQM5/UsIsUsudhXo+F8cSZpDEWkbX0gjKU0YVuxtbwpbTpnrwMm84y6cz9et6RhRkQ/un
	kmsKR+G26r1ZjsBXNg1Qo2D1cmYPrKioXeC0bbma7+PFsDjobcLXx3YKN0bcvg2P98gzP66Ztte4w
	UcBHZA22yOB/nZj6jF08PIJBhAUDFgrO5pvhpQ7J4Ecc+GGgccm2U6M95BxcXci5NuyfqzahHBHbg
	SOHFNw6tWPc+v07DnpLomDldZ1jYpQG7JyqiWtUTTh9u/GNLla5rqQW7UxOJvC89Znkwy3V0z2Aqj
	/XRnbdSp6VBgD+N/Qzcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no1oD-00E9xr-My; Mon, 09 May 2022 11:44:13 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no1oB-00E9ws-KM
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 11:44:13 +0000
Received: by mail-wr1-x433.google.com with SMTP id d5so19056951wrb.6
 for <linux-riscv@lists.infradead.org>; Mon, 09 May 2022 04:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EtleC+nTX7D5i2/ZTNJy5jdg5LLdu4nTUmNHgMyAnh8=;
 b=rUxiG7Es1bfnB0Bdvs0RQIJf6UBghpuBTRwvVm9ge8zn8gIwrsycFZo0G36xYW2Vpe
 oHAWUoqgtIfnIVwTTslGxHZFmgBhYAxtFGUyrp/yBBdEXclV/HKQmXQ9ACOSiansJm1s
 mr94Qg+nGgej/FwclwjNBkUdU5nVqA5wANLrh+mQM+8OxshEn4+6mdnwLG2wR/LBwdkn
 r9ZeB9Zv8jdlpg/+LOQhY54klrmVghm6v53DUlbffsUSC2fIeeJzrpQ3rRJNI4MJBfE+
 jEHS8QyuLMn1ZPa+I1AugFrZ7kNOYSgTlWBIgrWiB+lI4faXeHv0eYdWPU1ceeyqV9ue
 +MtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EtleC+nTX7D5i2/ZTNJy5jdg5LLdu4nTUmNHgMyAnh8=;
 b=lN2QDm8fne32Pt+Hq1ravifItCZxqBMTM3mtRms0sJrU/M8UN9aFsSlX1RLae7o4Mw
 INLyg7oQJ+HV4MzysFKy0QHxy74Iv1tv/IaBnlndqFmtOBZ8pYZDUIR+WDyOFllW+fAi
 tT07oCWepPNHPrhsd4HIGzvTvqgzDo1c/u2MwPMsVp7jdI5zcOUESYiLdUNx89/Tjui0
 CkcZMnZi4zjd9s8Bh8tp712igBsRU0iwM1kUEuqVN4YEgx0ETxuTWT+mYzu7nzzdmMiX
 hke7jDCYLIp8mI71iSuRwCbODK51DzUyWivkDf1oWAmtE/g7OfUOSCfRLDHtakr6X/Nf
 N0mw==
X-Gm-Message-State: AOAM530QalZv41qJYrtbZFmHidq5RvPOTpq8eEk+YAyhLzLvcKm5MEjY
 9V5n4HmO5n1XFNXkAP+IpM9cOg==
X-Google-Smtp-Source: ABdhPJxM3VqJ9VyXlYRaqD4wz+LfzF6Us+nF6AOJU9wyLSe+j6MOjfuR8iN1sCnIx5Ppw7JWlD8RDQ==
X-Received: by 2002:a5d:6489:0:b0:20c:6c3b:d49e with SMTP id
 o9-20020a5d6489000000b0020c6c3bd49emr13773050wri.75.1652096647657; 
 Mon, 09 May 2022 04:44:07 -0700 (PDT)
Received: from [192.168.1.41] (176-182-171-101.abo.bbox.fr. [176.182.171.101])
 by smtp.googlemail.com with ESMTPSA id
 z11-20020a5d654b000000b0020c6b78eb5asm10934000wrv.68.2022.05.09.04.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 04:44:06 -0700 (PDT)
Message-ID: <32af96b3-5b87-6db1-ad23-8bc66d5530ff@linaro.org>
Date: Mon, 9 May 2022 13:44:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] clocksource/drivers/riscv: Events are stopped during CPU
 suspend
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220509012121.40031-1-samuel@sholland.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220509012121.40031-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_044411_726099_70A09044 
X-CRM114-Status: UNSURE (   9.19  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDkvMDUvMjAyMiAwMzoyMSwgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gU29tZSBpbXBsZW1l
bnRhdGlvbnMgb2YgdGhlIFNCSSB0aW1lIGV4dGVuc2lvbiBkZXBlbmQgb24gaGFydC1sb2NhbAo+
IHN0YXRlIChmb3IgZXhhbXBsZSwgQ1NScykgdGhhdCBhcmUgbG9zdCBvciBoYXJkd2FyZSB0aGF0
IGlzIHBvd2VyZWQKPiBkb3duIHdoZW4gYSBDUFUgaXMgc3VzcGVuZGVkLiBUbyBiZSBzYWZlLCB0
aGUgY2xvY2tldmVudHMgZHJpdmVyCj4gY2Fubm90IGFzc3VtZSB0aGF0IHRpbWVyIElSUXMgd2ls
bCBiZSByZWNlaXZlZCBkdXJpbmcgQ1BVIHN1c3BlbmQuCj4gCj4gRml4ZXM6IDYyYjAxOTQzNjgx
NCAoImNsb2Nrc291cmNlOiBuZXcgUklTQy1WIFNCSSB0aW1lciBkcml2ZXIiKQo+IFNpZ25lZC1v
ZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgo+IC0tLQoKQXBwbGll
ZCwgdGhhbmtzCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDov
L3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRl
ci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5h
cm8tYmxvZy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
