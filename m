Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F15C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 13:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrZ65gcWbDmOz4LCG021BqdY2To150/DOBBv1UOr8jE=; b=RQ4Dx6yXFfgqwk
	xi7v34WzTnsV42G2QdVODkCi27EuETXivRKHeBM52NBRg0wNfboPv6LwTmhTfJGMKJ2Qsoag8htYW
	X4Po6yO6xVgiRWE4Ns1kSb/Eg8uyRHC0jt8+v3La07tLoOzHh/eREZIC5XQZ6xnEOIfx5xAoxRmPj
	wRoo/6ASes08XaRjc37Go5d/RBP+eF+N9bFN6+aJbo7pjUx3Vz21EWO2kQrdqS9nhVeWtBsIQT8MZ
	2l9+J8MvJT0xE+J3jB3wBAjphLMCAvNfk8i7kUY6WKMd8jG6pSe36iRwMSNQZIM0smLIEdKkHwFyA
	DrjCHLObb8f0MIxnldtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnvd-003qzl-HP; Tue, 19 Apr 2022 13:30:01 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmow-003QHe-JY
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 12:19:04 +0000
Received: by mail-lj1-x22c.google.com with SMTP id q22so2029106ljh.10
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 05:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nDrFtjiljqpCw2clA2M5Q4tAXBJlxJuWExBZE6ls7cE=;
 b=P01RsUocGzItJ2X501OWco/fT+uRAR+g65SjiSrgvpeADPdW+g493uazX7iSGAowan
 Nnf5rwEqvMlpwyvBd7g4GUn12AEA44LyB8b2gThooOn+q3JtBdH+o5vMsAECyMppHqAm
 q4Cjr6I6+KYOoWKIOXVzyekOkheFdw5q9Vz6c4Jhcc5faaxu25gRw6gpzIi/eOzpEHWm
 nmcwSpkLAJqTqnrmSNNdIug4ldD+K7BsYekT5qS9tQDJtW1MVKhYUvFJzrHA2afvwkzr
 1dH3A0fe8gmMefvR1wmdrYs1Y1+D4Y+dVbUtyozWQjV4gZsFTmrc40nwmtLTwZ9rp4N6
 Dx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nDrFtjiljqpCw2clA2M5Q4tAXBJlxJuWExBZE6ls7cE=;
 b=U1QyEFGStQroIyVcWw5Nl/RM9PsBxOwU1uG9mSgYqDF3z8jvy6mEWeNZAbAwzasdQq
 5Zwx7XLcfTZfwKGH3s0euGCxkMNeGI75D8W1GXF2wscx1Pj9O1YqRjP5BUtSQ5OtF40x
 q+Xy+jv9MTO1KywD63heJy9lHdZXa3ulMpY5DVLqli/F4xZR5wJtWlyszGE7ucNaItu7
 7E6reTwJH3FwP47jhCIduCYN//mOsZE+FRfZYylhVCIY9YA5vFFR2wcD/Gfuxd6TXB49
 O1CuS1ISpbZQwft2/jw1XFQ8UO8gaUMGytRfL48E2qFCXE1nHVW85TWsmv5YLG9kMck6
 EzPg==
X-Gm-Message-State: AOAM530F0yU1aCndL+U9oqCqw7RceamkyeroAZoLji1t7YegNc2L5M6l
 rwQ2f/+HppmKpYVeRHCLbpxKFj3iODpXI3ysNOc=
X-Google-Smtp-Source: ABdhPJz4Xtzx+VFMw5LihUTv1eNyt+O9C1i9E/JkHh8cB0K/2OpE96/2uAbv1KDSvg5bjnlDblfCvgeQwTwY3zYitqc=
X-Received: by 2002:a2e:302:0:b0:24d:9eb6:8ae8 with SMTP id
 2-20020a2e0302000000b0024d9eb68ae8mr10240086ljd.77.1650370739301; Tue, 19 Apr
 2022 05:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220318162044.169350-1-krzysztof.kozlowski@canonical.com>
 <20220318162044.169350-2-krzysztof.kozlowski@canonical.com>
 <a8c5d574-c050-bbc3-efa6-9b45f5f27524@linaro.org>
 <03e28a55-d3bd-f3e1-f418-557306d65505@microchip.com>
 <61923e45-6594-6dfc-5e2f-e808af99e7c1@linaro.org>
 <9f8faffa-0b0e-2fba-7f2c-56c82ec7936f@microchip.com>
 <20b63bd8-b527-43e0-884d-bf9fe3cacb19@linaro.org>
In-Reply-To: <20b63bd8-b527-43e0-884d-bf9fe3cacb19@linaro.org>
From: Zong Li <zongbox@gmail.com>
Date: Tue, 19 Apr 2022 20:18:47 +0800
Message-ID: <CA+ZOyaiWPZm6TQ0H7mvOS6UqBtCy7R1GSJrZg1AmC=4xwVWxfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sifive: fu540-c000: align dma node name
 with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor.Dooley@microchip.com, green.wan@sifive.com, vkoul@kernel.org, 
 robh+dt@kernel.org, krzk+dt@kernel.org, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org, 
 alexandre.ghiti@canonical.com, palmer@sifive.com, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_051902_695075_9645126E 
X-CRM114-Status: GOOD (  16.41  )
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

S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiDmlrwg
MjAyMuW5tDTmnIgxOeaXpSDpgLHkuowg5LiL5Y2INjo1OeWvq+mBk++8mgo+Cj4gT24gMTkvMDQv
MjAyMiAxMjo1NywgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gPj4+IE5vdCBz
dXJlIHRoYXQgdGhpcyBvbmUgaXMgYWN0dWFsbHkgbmVlZGVkIEtyenlzenRvZiwgWm9uZyBMaSBo
YXMgYSBmaXgKPiA+Pj4gZm9yIHRoaXMgaW4gaGlzIHNlcmllcyBvZiBmaXhlcyBmb3IgdGhlIHNp
Zml2ZSBwZG1hOgo+ID4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9lZGQ3
MmMwY2NhMWViY2VkZGMwMzJmZjZlYzIyODRlM2Y0OGM1YWQzLjE2NDg0NjEwOTYuZ2l0Lnpvbmcu
bGlAc2lmaXZlLmNvbS8KPiA+Pj4KPiA+Pj4gTWF5YmUgeW91IGNvdWxkIGFkZCB5b3VyIHJldmll
dyB0byBoaXMgdmVyc2lvbj8KPiA+Pgo+ID4+IFpvbmcncyBMaSBwYXRjaCB3YXMgc2VudCAxMCBk
YXlzIGFmdGVyIG15IHBhdGNoLi4uIFsxXSBXaHkgcmlzY3YgRFRTCj4gPj4gcGF0Y2hlcyB0YWtl
IHNvIG11Y2ggdGltZSB0byBwaWNrIHVwPwo+ID4+Cj4gPgo+ID4gT2gsIG15IGJhZC4gSSBpbmNv
cnJlY3RseSBhc3N1bWVkIHRoYXQgdGhhdCBwYXRjaCB3YXMgcHJlc2VudCBiZWZvcmUgdjgsCj4g
PiBJIHNob3VsZCd2ZSBjaGVja2VkIGZ1cnRoZXIgYmFjayAtIHNvcnJ5IQo+Cj4gTm8gcHJvYmxl
bSA6KQo+Cj4gSSBkb24ndCBtaW5kIFpvbmcncyBwYXRjaCB0byBiZSB0YWtlbiBhbHRob3VnaCBp
biBnZW5lcmFsIEkgYmVsaWV2ZSBtb3JlCj4gaW4gRklGTyAob3IgRklGIFNlcnZlZCkgc3R5bGUu
Cj4KCkhpIGFsbCwKVGhhbmtzIENvbm9yIGJyaW5ncyBtZSBoZXJlLiBUaGUgcGF0Y2ggMSBhbmQg
NCBpbiBteSBzZXJpZXMgaGFzIGJlZW4KYXBwbGllZCBpbnRvIGRtYWVuZ2luZS9uZXh0LCBidXQg
cGF0Y2ggMiBhbmQgMyBzaG91bGQgZ28gYnkgcmlzY3YKdHJlZSwgc28gSSBndWVzcyB0aGF0IEkg
Y291bGQgcmUtc2VuZCB0aGUgcGF0Y2ggMiBiYXNlZCBvbiB0b3Agb2YKS3J6eXN6dG9mJ3MgcGF0
Y2gsIHRoZW4gbGV0J3MgZHJvcCB0aGUgcGF0Y2ggMiAmIDMgb2YgYW5vdGhlcgpwYXRjaHNldC4g
SSB3aWxsIGtlZXAgZm9sbG93IHVwIGhlcmUuIFRoYW5rcyBhbGwuCgo+IEJlc3QgcmVnYXJkcywK
PiBLcnp5c3p0b2YKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
