Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7036C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 13:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPnt6nqjZpHBd5rCc2QBA6IKAxOswFmHwv0wx+pEkrA=; b=mTC2V8kFlnOtGn
	oqTVvo8ohBt/qs0xgM9D+GSabN0ZT48X39rRQMGpAey0Urck7nuePGnpLRRvYwwnWlMd0CxO6VIlP
	N5ASoM9oIkal/Tp9yjlt+XTopufLFGIrrjQe3vv7MYLm3XAfnSR/BBQvKANjQJC9vtttdCM1SfA/+
	pA/R/DB/ztXxJOWuTNWvdDDgc8gI+Mnx5segiR8I7xCR6FrBMgqnQ/uLQQ+yLxTAjYbrbHZvhT7Ao
	fyDueOhymXeIpvierGZatctqN/D9ObOzql+/mwORKPaTACWM00p34cHp7eN8LjbAAzeLCeoSdE39p
	FmLZ1qJJUpFoHa7AYjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAVCi-0000000910u-40Ef;
	Fri, 24 May 2024 13:43:28 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAVCe-000000090zX-3IdA;
	Fri, 24 May 2024 13:43:27 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2bdf446f3d1so1248352a91.3;
        Fri, 24 May 2024 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716558203; x=1717163003; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0yupO8dUYCF+0G9tTYKlxkVq1DaGE31KehgEMMUSJG4=;
        b=M2vNki77isKlBZ6P4+diqyA9Ks9wOgYQdLYHNi1zTv0ui6zJ6s1Lmdn5sRvB/XI1Jl
         Ys2Un/NAlROWzhg/La79VfHNShDuF3RnwefvRqdWy3oHCH7gPMLfdwCKO4K5ov2oQ8BY
         CaLQC5DUyy1qzBoqFD51ShCTl5ek048gSTisBGP2K5n4GFP0gRM7jU+w765+JnwwUW7o
         OZBJb+QaUFtUS+yn4ogEGtbeR+vbSxjeRet8n7OjXL1vkFb7ckhLY2vvq5UQDzhHh+Kc
         gw2Zj2nAGbHWgHftGpixtmCUCa/xhiZnK3Hgsy0EDPc7eyCnhmuxdYH78Pe7k4Dpp3Y4
         cYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716558203; x=1717163003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yupO8dUYCF+0G9tTYKlxkVq1DaGE31KehgEMMUSJG4=;
        b=YffrLwAzjMuZDFXWbRjOZp18AOqQAMOegCUel1nVKVDPgiIVXK3E2hGcqE2hgfEw8X
         btIeX76qVKiwq9ElQ+TuxpkI+frf8Lz3ZOi0zbyEILd0LwG80Khmx/iMSiXac4EP0dcT
         aLNzcEqc5egn2oLpSVeEzBAApwWUS2tHQMYVBYXdM20j993Ux0zyrRmE679f56SqR4IW
         TbnLgh53VaclVXwgDnEtPCdlBupWyl9oCVQ0iqMogDGV8s5BEz//2J4QDRIH5V7r8vDG
         4PaYs1TFmf0OQSqO6+LR4FUmgaQZWIJbcBN0mOlJRcpV61nyR9wVQrYnW+7bWS9RG9ab
         2InQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGwbdrw5Gefj1YD1KaPe/rZeTkGwozBgUoittAYn4BciZ49jJbJnas+sRbvKE01vvFf4K9WmGNrs/pBpPxoiMU/gylzEa/LjjmxoTOXeLirhZ8uaM7MK1HNKa9NKfeBacecX8m/nB1EC4OzqxZab6eyz6sSwI=
X-Gm-Message-State: AOJu0Yx24cDMEZn3agP1QTN7Y/YqRwo2eOy3OVqHyv6SymPzdnTh6nFh
	NtOA4ns+k9eT2AFE8EiYvNl4FbYY7y4GMeF8RT/EWk6qKXASWEkO
X-Google-Smtp-Source: AGHT+IFP+60RswKtT3v6VqYC0kcSrnoN8GHpqIEwAiQOpkJYbmvZ32zTc+S4LaqCEySlMq+zyLYErA==
X-Received: by 2002:a17:90a:43c5:b0:2be:b2:c7fa with SMTP id 98e67ed59e1d1-2bf5e94444cmr2298605a91.6.1716558203317;
        Fri, 24 May 2024 06:43:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bdd9ef08b5sm3278876a91.14.2024.05.24.06.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 06:43:22 -0700 (PDT)
Message-ID: <1e088782-418d-41e2-843f-b3d6cd3ab4f7@roeck-us.net>
Date: Fri, 24 May 2024 06:43:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADnq5_Ndzw5Gre=yyPKyFNX5yFWjTCMg2xqrn6tEj6h8t-nAYg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_064324_868417_276CFEEE 
X-CRM114-Status: GOOD (  13.42  )
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

T24gNS8yNC8yNCAwNjoxOCwgQWxleCBEZXVjaGVyIHdyb3RlOgo+IE9uIEZyaSwgTWF5IDI0LCAy
MDI0IGF0IDk6MTfigK9BTSBBbGV4IERldWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+Cj4+IE9uIEZyaSwgTWF5IDI0LCAyMDI0IGF0IDU6MTbigK9BTSBHdWVudGVyIFJvZWNr
IDxsaW51eEByb2Vjay11cy5uZXQ+IHdyb3RlOgo+Pj4KPj4+IEhpLAo+Pj4KPj4+IE9uIEZyaSwg
TWFyIDI5LCAyMDI0IGF0IDEyOjE4OjI4QU0gLTA3MDAsIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+
Pj4+IE5vdyB0aGF0IGFsbCBwcmV2aW91c2x5LXN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzIHNlbGVj
dAo+Pj4+IEFSQ0hfSEFTX0tFUk5FTF9GUFVfU1VQUE9SVCwgdGhpcyBjb2RlIGNhbiBkZXBlbmQg
b24gdGhhdCBzeW1ib2wgaW5zdGVhZAo+Pj4+IG9mIHRoZSBleGlzdGluZyBsaXN0IG9mIGFyY2hp
dGVjdHVyZXMuIEl0IGNhbiBhbHNvIHRha2UgYWR2YW50YWdlIG9mIHRoZQo+Pj4+IGNvbW1vbiBr
ZXJuZWwtbW9kZSBGUFUgQVBJIGFuZCBtZXRob2Qgb2YgYWRqdXN0aW5nIENGTEFHUy4KPj4+Pgo+
Pj4+IEFja2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4+
Pj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+Pj4K
Pj4+IFdpdGggdGhpcyBwYXRjaCBpbiB0aGUgbWFpbmxpbmUga2VybmVsLCBJIGdldCB0aGUgZm9s
bG93aW5nIGJ1aWxkIGVycm9yCj4+PiB3aGVuIHRyeWluZyB0byBidWlsZCBwb3dlcnBjOnBwYzMy
X2FsbG1vZGNvbmZpZy4KPj4+Cj4+PiBwb3dlcnBjNjQtbGludXgtbGQ6IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV9saWIubyB1c2VzIGhh
cmQgZmxvYXQsIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbV9oZWxwZXJzLm8gdXNlcyBzb2Z0IGZsb2F0Cj4+PiBwb3dlcnBjNjQtbGludXgt
bGQ6IGZhaWxlZCB0byBtZXJnZSB0YXJnZXQgc3BlY2lmaWMgZGF0YSBvZiBmaWxlIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV9saWIubwo+
Pj4KPj4+IFsgcmVwZWF0ZWQgbWFueSB0aW1lcyBdCj4+Pgo+Pj4gVGhlIHByb2JsZW0gaXMgbm8g
bG9uZ2VyIHNlZW4gYWZ0ZXIgcmV2ZXJ0aW5nIHRoaXMgcGF0Y2guCj4+Cj4+IFNob3VsZCBiZSBm
aXhlZCB3aXRoIHRoaXMgcGF0Y2g6Cj4+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9h
Z2Q1Zi9saW51eC8tL2NvbW1pdC81ZjU2YmUzM2YzM2RkMWQ1MGI5NDMzZjg0MmM4NzlhMjBkYzAw
ZjViCj4+IFdpbGwgcHVsbCBpdCBpbnRvIG15IC1maXhlcyBicmFuY2guCj4+Cj4gCj4gTmV2ZXJt
aW5kLCB0aGlzIGlzIHNvbWV0aGluZyBlbHNlLgo+IAoKWWVzLCBDT05GSUdfRFJNX0FNRF9EQ19G
UCBpcyBlbmFibGVkIGluIHRoYXQgY29uZmlndXJhdGlvbi4KCkd1ZW50ZXIKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
