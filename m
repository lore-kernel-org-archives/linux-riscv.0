Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9818ECD1284
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0+fnS8kc15wvLpUeiCgusaE4IGfaiCedS6uEZqqsVc=; b=BatMs4U35SA6SF
	gnluAIXIirm67Y9qKAT6SwwhjDZi586Mk35gEV+/Wcak1Z5fHOEimi+BN/Guc9q9vMV0Jv9ZhcJuu
	yy2lWa7H8IdkRkHio1Tz2Z8seg3d/ywowHyoyj1fmwzupcaZHo79s7xCfznbb3IdAeOczmpIxbQWx
	EVMUtj6HA6Pxo78uNtitEvAiESzEoyjbpySRmYb3p00g+iy4P4ckbi//TbyfDFhGXkVdmAgJQCBcm
	VjaJWFPSguDFsuCkFGWKERMt7TmsApasBOlQqHQhpFzHv2TDIK/dWNsv0Rm1sTPZLq8jXhyrPfEj2
	Xp6JWsarkmcXeHB6zlVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqUN-0000000BGjj-2YLk;
	Thu, 11 Apr 2024 09:12:59 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqUL-0000000BGhi-0GjR
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 09:12:58 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d874b89081so8387411fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 02:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712826770; x=1713431570; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oGLZ4Bj9Hdxr3MjSAXtF+JGNelZvm/tPlncMYTe7qhA=;
        b=oz502xh3biyomOK/EasK16LgcxKSLaftVqJSvIEhm1OJSruntksRHjaUf/vLom+tOA
         LG7rXTcwaShgLA5aCX3KVdo66CAyZK42MJSszONW6PIMl0dUNd/8GbGwUqJHUG9NbBII
         svU4Y+knDyJMsyu/qJyxAxUK66jPM/OKbsZbuiqcsLEJTScE/sikiIMD2C8S9NswLvhF
         XfG/HIR1977AzNNYBF/qT1Jkf8xmiYLZkUpF3S8VPiqUmuY3q3zgqhRcuVSBlkhm/rXt
         ZRB++eG+sZf7VIYse/9dB1snbixUbYEXy65EMHIOEr+PeTRlnUWz+4LEIlzUrQRvhp9I
         CjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712826770; x=1713431570;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGLZ4Bj9Hdxr3MjSAXtF+JGNelZvm/tPlncMYTe7qhA=;
        b=v+diXNFs5NroSwZMP/KKyWtBzGYamnYqlNUlzX3qIUMFMa+M8NhnoCd88WWJ1FrqKI
         rbEJvG27ql8Se5sWXATPH6qmwVHqY19WHyDC1X46aU8uv6FABuWSShR4Y8kCiMRbKKgw
         eY3QGpamDwfZGzzs0oczdVZcdgQSySKrIGN3w1OEGy2TYBMHu2L6hSKBC19cGZA9AbaR
         7uehMkKqp9dnmvMDWVo4H2lZPls4SHuh6fhzE8Gm9VZJIVI+hgGkUGYnAfP9RxbUxBFS
         w6qWVyrigGcDDlWKEat+kcwaWH/0nUvPw6FpQIq5QQo7Uoo9GV5hrOKHvZZ13ZunaW1a
         vCfw==
X-Gm-Message-State: AOJu0YzqgG34zct8664KzCXxZ8QXkR64HN+lisqdGIq3Hp9NXH4o/GsI
	ZBnOk7Zlyl4dNlkUxWzjMbH31z2dOCs3qA3kdN8Iy6Y5RaKNd8xrqiLEbXSA1p8=
X-Google-Smtp-Source: AGHT+IEejUVVKUSclkIJJf38XaVm57OwSwAqaAT/Myu/iR8Juzns6W5PNf9Zq1VKdarRzOgAiPzh5w==
X-Received: by 2002:a05:651c:2121:b0:2d8:d41f:931c with SMTP id a33-20020a05651c212100b002d8d41f931cmr2981577ljq.0.1712826770072;
        Thu, 11 Apr 2024 02:12:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:3624:d9b3:4998:d76b? ([2a01:e0a:999:a3a0:3624:d9b3:4998:d76b])
        by smtp.gmail.com with ESMTPSA id jg25-20020a05600ca01900b004169836bf9asm4821377wmb.23.2024.04.11.02.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 02:12:49 -0700 (PDT)
Message-ID: <5a285147-4bf8-4634-8f9e-fe78c033b7cb@rivosinc.com>
Date: Thu, 11 Apr 2024 11:12:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] riscv: nommu: remove PAGE_OFFSET hardcoding
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240410142347.964-1-jszhang@kernel.org>
 <20240410142347.964-2-jszhang@kernel.org>
 <ce7b7413-31ac-4c93-8970-e7cf0d6902cc@rivosinc.com>
Content-Language: en-US
In-Reply-To: <ce7b7413-31ac-4c93-8970-e7cf0d6902cc@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_021257_203507_7D5FA65F 
X-CRM114-Status: GOOD (  16.88  )
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

CgpPbiAxMC8wNC8yMDI0IDE3OjMwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gCj4gCj4gT24g
MTAvMDQvMjAyNCAxNjoyMywgSmlzaGVuZyBaaGFuZyB3cm90ZToKPj4gQ3VycmVudGx5LCBQQUdF
X09GRlNFVCBpcyBoYXJkY29kZWQgYXMgMHg4MDAwXzAwMDAsIGl0IHdvcmtzIGZpbmUgc2luY2UK
Pj4gdGhlcmUncyBvbmx5IG9uZSBub21tdSBwbGF0Zm9ybSBpbiB0aGUgbWFpbmxpbmUuIEhvd2V2
ZXIsIHRoZXJlIGFyZQo+PiBtYW55IGNhc2VzIHdoZXJlIHRoZSAoUylEUkFNIGJhc2UgYWRkcmVz
cyBpc24ndCAweDgwMDBfMDAwMCwgc28gcmVtb3ZlCj4+IHRoZSBoYXJkY29kaW5nIHZhbHVlLCBh
bmQgaW50cm9kdWNlIERSQU1fQkFTRSB3aGljaCB3aWxsIGJlIHNldCBieQo+IAo+IEhpIEppc2hl
bmcsCj4gCj4gVHlwbzogcy9oYXJjb2RpbmcvaGFyZGNvZGVkCj4gCj4+IHVzZXJzIGR1cmluZyBj
b25maWd1cmluZy4gRFJBTV9CQVNFIGlzIDB4ODAwMF8wMDAwIGJ5IGRlZmF1bHQuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4gLS0tCj4+
ICBhcmNoL3Jpc2N2L0tjb25maWcgfCA4ICsrKysrKystCj4+ICAxIGZpbGUgY2hhbmdlZCwgNyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPj4gaW5kZXggNzg5NWM3NzU0NWYxLi5iNGFm
MWRmODYzNTIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+PiArKysgYi9hcmNo
L3Jpc2N2L0tjb25maWcKPj4gQEAgLTI0NywxMCArMjQ3LDE2IEBAIGNvbmZpZyBNTVUKPj4gIAkg
IFNlbGVjdCBpZiB5b3Ugd2FudCBNTVUtYmFzZWQgdmlydHVhbGlzZWQgYWRkcmVzc2luZyBzcGFj
ZQo+PiAgCSAgc3VwcG9ydCBieSBwYWdlZCBtZW1vcnkgbWFuYWdlbWVudC4gSWYgdW5zdXJlLCBz
YXkgJ1knLgo+PiAgCj4+ICtpZiAhTU1VCj4+ICtjb25maWcgRFJBTV9CQVNFCj4+ICsJaGV4ICco
UylEUkFNIEJhc2UgQWRkcmVzcycKPj4gKwlkZWZhdWx0IDB4ODAwMDAwMDAKPj4gK2VuZGlmCj4g
Cj4gSSdtIG5vdCBzdXJlIGJ1dCBpdCBmZWVscyBvZGQgdG8gaGF2ZSB0aGlzIGF0IHRvcCBsZXZl
bCBjb25maWcgbWVudS4KPiBNYXliZSBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgZm9yIHRoaXMg
dG8gYmUgbG9jYXRlZCB1bmRlciB0aGUKPiAiUGxhdGZvcm0gVHlwZSIgc2VjdGlvbiA/Cj4gCj4g
VGhhbmtzLAo+IAo+IENsw6ltZW50Cj4gCj4+ICsKPj4gIGNvbmZpZyBQQUdFX09GRlNFVAo+PiAg
CWhleAo+PiAgCWRlZmF1bHQgMHhDMDAwMDAwMCBpZiAzMkJJVCAmJiBNTVUKPj4gLQlkZWZhdWx0
IDB4ODAwMDAwMDAgaWYgIU1NVQo+PiArCWRlZmF1bHQgRFJBTV9CQVNFIGlmICFNTVUKPj4gIAlk
ZWZhdWx0IDB4ZmY2MDAwMDAwMDAwMDAwMCBpZiA2NEJJVAoKQnkgdGhlIHdheSwgeW91IHNob3Vs
ZCBwcm9iYWJseSByZWJhc2UgdGhhdCBvbiB0b3Agb2YgU2FtdWVsJ3Mgd29yayBbMV0KaW4gb3Jk
ZXIgdG8gc3VwcG9ydCAhTU1VIGlzIFMtbW9kZS4KClRoYW5rcywKCkNsw6ltZW50CgpMaW5rOgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjQwMjI3MDAzNjMwLjM2MzQ1MzMtNS1zYW11
ZWwuaG9sbGFuZEBzaWZpdmUuY29tLwpbMV0KCj4+ICAKPj4gIGNvbmZpZyBLQVNBTl9TSEFET1df
T0ZGU0VUCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
