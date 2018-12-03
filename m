Return-Path: <SRS0=qdQm=OM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2BFC04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 14:53:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA5320672
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  3 Dec 2018 14:53:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TBP/mZTt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="iyXAAA+B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DA5320672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KpnkMR5nWTqaNRFbC56OWw5hiY6S8sd/7dLNnLb87k=; b=TBP/mZTtS11np5
	u22TZgcLMakeerYsCNUd6qXSjO1SD+1h7HsrZbwCUfHwu3SISxYDtxJynSJ51b2zdkra+t7jjcQP9
	H+mOMIgdhOhKC1WcGxm/RiwaLak72iwTSFlqVS3YQePSVG4dQ4+pXQeQ2s7gNZ9YcZlnvA3YxOcdo
	zo10nbbmlZLr326h6DZ+aaFQNfhxW2W/7CQWDJXyACXqGRNrvLDM/REBkg9LWP4Ws6uyu2eeJpHSN
	+mlmnf+WLkE5KOx621lE+fVcYU3jXN8JU0chxuHZXfjnjbFl/vFX2AHy66onRCXYajh5VJTt7L32P
	WuPwZuZz1JW0XFbQUTMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTpbF-0003S3-KC; Mon, 03 Dec 2018 14:53:29 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTpbB-0003PA-Gd
 for linux-riscv@lists.infradead.org; Mon, 03 Dec 2018 14:53:27 +0000
Received: by mail-wr1-x443.google.com with SMTP id l9so12473915wrt.13
 for <linux-riscv@lists.infradead.org>; Mon, 03 Dec 2018 06:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gHkXpmuMJdjOAjc4qNljfTYLICAT4rbpxB36srapNC8=;
 b=iyXAAA+Byee5bNK1snzxlkbZ94zqB17eWM6OZCp09f0eUZdVe1PwczKyfIHUuhGWJI
 tUlIraO/Fj4vr84XwOPC3VJK1TX5+yhRdrf2nXRHXDGxDaG123+IqZFp2TXgbpFGsWWr
 KhOlQFUwqNXB3PjuV4F04ENN0nuS7/L2srwzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gHkXpmuMJdjOAjc4qNljfTYLICAT4rbpxB36srapNC8=;
 b=fp/PSyEr8eapUE2QSMmbvf45MJqE2mfNzezZNiN5imyFFJ5Ts4N512P7BzfVzMQ7eT
 nON8OLH2Cn2b9NBUjV48rgi1rPhu01gkrC05BAJfM1nuBuKJlOi6hhGDS9ZYjn/nqFZg
 WzdC5zeFkaXFJy7f5FyWdMADU9HAyRB3XJ41oQWWCA38/8CrQMQm3BpcVjcK3ojsZGAJ
 GApGtQDhj6Osg82bLi90dwhd/KPul2rhnheknoqJoendpSfHIRIXsY7RHqA54QQkjyV3
 xM6fIuxeitgNh8wnhqfKFcc8X/qQQyzMhIq4UJJxNQchAQNoBqGfNgOMxTnbKfzql/dI
 Zvhw==
X-Gm-Message-State: AA+aEWbW0xuknDx6wWKmL4SGt52da46IGnxXb2CZTBd8FXRI/Wj5wUC5
 iJQC8w5CDGSP6s+D0FhN5y3rhIB6S2s=
X-Google-Smtp-Source: AFSGD/WFGUhI1F3USVNxeona54w3FOkwB0WN3N669EgtrtqBLAGr3u9f7wD80ChsPf1ylYuzibmoug==
X-Received: by 2002:adf:90e5:: with SMTP id i92mr13647338wri.210.1543848793596; 
 Mon, 03 Dec 2018 06:53:13 -0800 (PST)
Received: from [192.168.0.40] (sju31-1-78-210-255-2.fbx.proxad.net.
 [78.210.255.2])
 by smtp.googlemail.com with ESMTPSA id w8sm17442803wrv.7.2018.12.03.06.53.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Dec 2018 06:53:12 -0800 (PST)
Subject: Re: [PATCH] clocksource: riscv_timer: Provide sched_clock
To: Anup Patel <anup@brainfault.org>
References: <20181203123524.11778-1-anup@brainfault.org>
 <c970d873-9dbc-9f21-3380-89635d6f574a@linaro.org>
 <CAAhSdy2rw=4Uw8=MZtfHi_ML9ZBqeiJ2iv+tRmDnjQDh7yuUHg@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <63f67f2b-9e17-78e6-beb5-65d32ff2f85c@linaro.org>
Date: Mon, 3 Dec 2018 15:53:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAAhSdy2rw=4Uw8=MZtfHi_ML9ZBqeiJ2iv+tRmDnjQDh7yuUHg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_065325_548845_13BAF613 
X-CRM114-Status: GOOD (  13.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDMvMTIvMjAxOCAxNTo1MCwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBNb24sIERlYyAzLCAy
MDE4IGF0IDY6MjkgUE0gRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc+
IHdyb3RlOgo+Pgo+PiBPbiAwMy8xMi8yMDE4IDEzOjM1LCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4g
Q3VycmVudGx5LCB3ZSBkb24ndCBoYXZlIGEgc2NoZWRfY2xvY2sgcmVnaXN0ZXJlZCBmb3IgUklT
Qy1WIHN5c3RlbXMuCj4+PiBUaGlzIG1lYW5zIExpbnV4IHRpbWUga2VlcGluZyB3aWxsIHVzZSBq
aWZmaWVzIChydW5uaW5nIGF0IEhaKSBhcyB0aGUKPj4+IGRlZmF1bHQgc2NoZWRfY2xvY2suCj4+
Pgo+Pj4gVG8gYXZvaWQgdGhpcywgd2UgZXhwbGljaXR5IHByb3ZpZGUgc2NoZWRfY2xvY2sgdXNp
bmcgUklTQy1WIHJkdGltZQo+Pj4gaW5zdHJ1Y3Rpb24gKHNpbWlsYXIgdG8gcmlzY3ZfdGltZXIg
Y2xvY2tzb3VyY2UpLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+Cj4+Cj4+IEhpIEFudXAsCj4+Cj4+IHRoZSBHRU5FUklDX1NDSEVEX0NMT0NL
IGRlcGVuZGVuY3kgaW4gdGhlIEtjb25maWcgaXMgbWlzc2luZy4KPiAKPiBTdXJlLCB3aWxsIGRv
Lgo+IAo+IEkgYWxzbyBoYXZlIGFub3RoZXIgcGF0Y2ggdG8gc2VsZWN0IEdFTkVSSUNfU0NIRURf
Q0xPQ0sKPiBmb3IgQ09ORklHX1JJU0NWLiBTaG91bGQgSSBzcXVhc2ggdGhhdCBwYXRjaCB3aXRo
IHRoaXMgcGF0Y2g/PwoKSSBwcmVmZXIgdGhlIHJpc2N2IGNvbmZpZyBvcHRpb24gdG8gYmUgbWVy
Z2VkIHZpYSB0aGUgcmlzY3YgdHJlZS4KCgotLSAKIDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBM
aW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8
CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
