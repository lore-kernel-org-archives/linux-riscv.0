Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56953C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6NNmzAqK2UnLKRlSIiymg/wyOCS9YrSG8rindizlQg=; b=Z+bsF3ydXU/0LL
	cybqAeQfgnPQ5y7T73c2RYZmD6RDjn3MEiLEN09FpSy42yuJ3f9m8QBNae8+to8J4RfPEST5Hq4lW
	/7U9/UaXYP757eOxnxLXUeyFrLatOhS0ZiDIWxdCzXWt4mF0A8VgT4B0owNFXJ5t9A4o06RzrJLCu
	cgOO10ZL96d1kNFDiyZiBw41o4dvzOx1G2zcNxSpaJ2nFzNfVcxzYS9wv/bIfj0xR3w/uyGouQ2Hp
	HN9LGhRRWByNOCz8W1sb+ZgTdOmDcsrOa3CqJafcZPxahUCOR9ERX0hcReltps2CpFMvegO35i6F7
	yGR1DCIosYBSUX1f31rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAVMK-000000092Bu-3YOL;
	Fri, 24 May 2024 13:53:24 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAVMG-000000092AY-2fJD;
	Fri, 24 May 2024 13:53:22 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6f850ff30c0so1506300b3a.0;
        Fri, 24 May 2024 06:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716558799; x=1717163599; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=b0/TSFREZaBctG5vlYD0Hmuh0/DxJ4bPlmcsHcY/PdU=;
        b=WrTjnPcTiFcfoDZ2A4depBjAgu4bc5BiyJJvR7E5Vb2mcyRfSTWFYwKvwfQlYYwlCP
         wruO8v9NInxrY1Bk6qyGyIBpidYWRTY4GwRyFTC+yOAuhC4hpki5iKMwM3yhFXDB83RF
         nCbbj/Dbt8loOP1C5Cep76gPP4LSJ8r4rSBLV3JG+ndRVEFsLerdN/IKcsrh1V9nm4kz
         9gRvL811iPECOH4YIdPRo80RhfqadI6KMC+EofzUv/AVJG1TjjPR6fpt8lVwWs5HP3eg
         dG3nMC3k38++H3wAzAWlYxRFAne3rIVUDvTZkzQK7UQP6U2tcVW232A0Wimy0lB0wZ9j
         R/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716558799; x=1717163599;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0/TSFREZaBctG5vlYD0Hmuh0/DxJ4bPlmcsHcY/PdU=;
        b=OVQ/Ca6j800w+7Qxe7KlKWuqJEa2MDmEi8l7VuaRovGv6fo7dOTMOTbrqYhkp/K6jz
         JucucvxWv0h0999LrJ3dtybY6/nsu4bwFjQjzyWGp++I2rZb+gaBE+P4/ToiUFbEafNS
         uLZ0dv21Im7q6KrDtmWx6b+sCZgdcBS8NAG2P6pGLQBXBpLr8uhXiy5CKk+LJIl3+hrt
         pK+78n+M5RELCE4jD+XyWE81OeZ+25w+8NndOfzCDtIy5BJYclrXXqZMFHbBU49riPM/
         joClGX3TyCLOIkl2rE3VdBl2yz+74+RJC2M9jZJM7UGuvKFZjn6c8ySyLwdlS1elXl/k
         UHuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsh3t154720Wp9y+lPmE9mV2kkVsfwcw3LTApVeViKrt7qvo9DplCoX/brQN/T+K/3zYn+kyqrQDTamzuL58FYvsEaPIwuLYdTnW9oRTtZMTokEIsWi293yE7zdTtB/AjJXtuCLHARdokebbdAr/aUYOSZRh8=
X-Gm-Message-State: AOJu0YxqFArEAIGKVslwXSHhSsUOupGwWytX7qYmlYthJSjrWi/QqHrh
	dL+TIMJsS9tp5kZkUuYUTUF3X2GZuiQ5MVy4WKuuZuG7c3aGLqr8
X-Google-Smtp-Source: AGHT+IH3aQaFlbwWMDNIYwkEtj6N6w858o4MAHD4uUjiZfFfdXxaGquXuXeOwr68wYrmKImdEsesTw==
X-Received: by 2002:a05:6a21:99a4:b0:1a9:c4ca:dc74 with SMTP id adf61e73a8af0-1b212ce1f54mr3260189637.5.1716558799320;
        Fri, 24 May 2024 06:53:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fc057e52sm1127383b3a.57.2024.05.24.06.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 06:53:18 -0700 (PDT)
Message-ID: <91f8b384-9a6a-4435-9f9a-7a65a7c62bf2@roeck-us.net>
Date: Fri, 24 May 2024 06:53:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
From: Guenter Roeck <linux@roeck-us.net>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
 <eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net>
 <CADnq5_NmKyTBbE6=V+XdEKStnjcyYSHyHqdkgBen4UhPnVKimQ@mail.gmail.com>
 <CADnq5_Ndzw5Gre=yyPKyFNX5yFWjTCMg2xqrn6tEj6h8t-nAYg@mail.gmail.com>
 <1e088782-418d-41e2-843f-b3d6cd3ab4f7@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1e088782-418d-41e2-843f-b3d6cd3ab4f7@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_065320_696237_138B0349 
X-CRM114-Status: GOOD (  15.33  )
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

T24gNS8yNC8yNCAwNjo0MywgR3VlbnRlciBSb2VjayB3cm90ZToKPiBPbiA1LzI0LzI0IDA2OjE4
LCBBbGV4IERldWNoZXIgd3JvdGU6Cj4+IE9uIEZyaSwgTWF5IDI0LCAyMDI0IGF0IDk6MTfigK9B
TSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gT24g
RnJpLCBNYXkgMjQsIDIwMjQgYXQgNToxNuKAr0FNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNr
LXVzLm5ldD4gd3JvdGU6Cj4+Pj4KPj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIEZyaSwgTWFyIDI5LCAy
MDI0IGF0IDEyOjE4OjI4QU0gLTA3MDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+Pj4+PiBOb3cg
dGhhdCBhbGwgcHJldmlvdXNseS1zdXBwb3J0ZWQgYXJjaGl0ZWN0dXJlcyBzZWxlY3QKPj4+Pj4g
QVJDSF9IQVNfS0VSTkVMX0ZQVV9TVVBQT1JULCB0aGlzIGNvZGUgY2FuIGRlcGVuZCBvbiB0aGF0
IHN5bWJvbCBpbnN0ZWFkCj4+Pj4+IG9mIHRoZSBleGlzdGluZyBsaXN0IG9mIGFyY2hpdGVjdHVy
ZXMuIEl0IGNhbiBhbHNvIHRha2UgYWR2YW50YWdlIG9mIHRoZQo+Pj4+PiBjb21tb24ga2VybmVs
LW1vZGUgRlBVIEFQSSBhbmQgbWV0aG9kIG9mIGFkanVzdGluZyBDRkxBR1MuCj4+Pj4+Cj4+Pj4+
IEFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4+Pj4+
IFJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPj4+Pj4gU2lnbmVk
LW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4+Pj4K
Pj4+PiBXaXRoIHRoaXMgcGF0Y2ggaW4gdGhlIG1haW5saW5lIGtlcm5lbCwgSSBnZXQgdGhlIGZv
bGxvd2luZyBidWlsZCBlcnJvcgo+Pj4+IHdoZW4gdHJ5aW5nIHRvIGJ1aWxkIHBvd2VycGM6cHBj
MzJfYWxsbW9kY29uZmlnLgo+Pj4+Cj4+Pj4gcG93ZXJwYzY0LWxpbnV4LWxkOiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RtbC9kaXNwbGF5X21vZGVfbGliLm8gdXNl
cyBoYXJkIGZsb2F0LCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG1faGVscGVycy5vIHVzZXMgc29mdCBmbG9hdAo+Pj4+IHBvd2VycGM2NC1s
aW51eC1sZDogZmFpbGVkIHRvIG1lcmdlIHRhcmdldCBzcGVjaWZpYyBkYXRhIG9mIGZpbGUgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kbWwvZGlzcGxheV9tb2RlX2xp
Yi5vCj4+Pj4KPj4+PiBbIHJlcGVhdGVkIG1hbnkgdGltZXMgXQo+Pj4+Cj4+Pj4gVGhlIHByb2Js
ZW0gaXMgbm8gbG9uZ2VyIHNlZW4gYWZ0ZXIgcmV2ZXJ0aW5nIHRoaXMgcGF0Y2guCj4+Pgo+Pj4g
U2hvdWxkIGJlIGZpeGVkIHdpdGggdGhpcyBwYXRjaDoKPj4+IGh0dHBzOi8vZ2l0bGFiLmZyZWVk
ZXNrdG9wLm9yZy9hZ2Q1Zi9saW51eC8tL2NvbW1pdC81ZjU2YmUzM2YzM2RkMWQ1MGI5NDMzZjg0
MmM4NzlhMjBkYzAwZjViCj4+PiBXaWxsIHB1bGwgaXQgaW50byBteSAtZml4ZXMgYnJhbmNoLgo+
Pj4KPj4KPj4gTmV2ZXJtaW5kLCB0aGlzIGlzIHNvbWV0aGluZyBlbHNlLgo+Pgo+IAo+IFllcywg
Q09ORklHX0RSTV9BTURfRENfRlAgaXMgZW5hYmxlZCBpbiB0aGF0IGNvbmZpZ3VyYXRpb24uCj4g
CgpBbHNvLCB0aGUgYWJvdmUgcGF0Y2ggZG9lcyBub3QgYXBwbHkgdXBzdHJlYW07IHRoZSBlbmRp
ZiBpcyBhbHJlYWR5IGluCnRoZSBjb3JyZWN0IHBsYWNlIGluIHRoZSB1cHN0cmVhbSBrZXJuZWwg
KHRob3VnaCB0aGUgY29tbWl0IGludHJvZHVjaW5nCml0IGFkZHMgYSBibGFuayBsaW5lIGF0IHRo
ZSBlbmQgb2YgdGhlIGZpbGUpCgpHdWVudGVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
