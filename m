Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F10CE95A8E
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 13:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=14YLCdzS280YLDJL30scDev9Cwb4bKrCia4uOlQHtfI=; b=s0sXU4KhhIkjE5
	S2glA220YHdZkwBqfZSvi4JvL7oGpoBk9nKIY7qLmBgUmsfgkZkhc18QhjGFAkH+czNcNjQn3Vjjb
	PBDccGkYYZFuj4SIZ/+Cv25jlvdH4kbqvGQsmATspc4XozR6NBD2eBMYyu304TLaZcf1WHqGNZRsh
	rfrw/HkDatatMtvFAO/vVmyTUL+m4eJYw8jpgImM80v6t0lstpvG4ryEA2ihitnjSL+k6Q3CB+T7I
	vbWmuwZyOcP73qcYEV3seOpvXFe6rcSEtga7TG0KWmgE/oVTkK+n/fBEz00H/59kF4DpxUcHvCxqm
	IP+KzMAXca8kq9FVeGIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppuQ-00AkN6-2e;
	Mon, 09 Oct 2023 13:02:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppuM-00AkLF-17
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 13:02:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3231e138f44so367608f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696856568; x=1697461368; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EwpVnrmSx861JVksI7Zb0upCp3LT7vnk8jsCfHBhWt4=;
        b=gJAI7f6wst/2rbb56Haez4pX0wWzU+VM8LUMdzr4visT5jtdDfsqK4Bdm5zWYeIhX5
         i52EC3AGh5jFhNBc/iBrRfL21pG1R2Vo3qC28CnSHs7FgzMlG01oYuAvj6h0KfJNyP2l
         9x2IyhG/jBCZNngrWwSpY6bo1/Cy4qz6YXZF7o3IVI+ZBwoAl0UZ7LPnBazaj76Tc8td
         WeZKPsPFxzvyzigT/JACGTVtph4CmQxnpYWzkKN0dNoVqbNaOclsEnzz+WV0ufub1xZI
         jLoW83+3AsDFT2KMh1SfUFo/mS2NwipYeQwfsaTUFt3+s2m5N1tyEiKeUzFKFMXD/RAo
         nHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696856568; x=1697461368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EwpVnrmSx861JVksI7Zb0upCp3LT7vnk8jsCfHBhWt4=;
        b=AxdbGANjSX73nu6cd9JIYiqaarFWjvxF9dJOCN2aB9/eQkTgaRwWrpcmwHeqSN2I2j
         i/BzmjBnIy6HWLKUAzbJLfbUSI4YwKZvM19ZbKoGb1AnXoBXB7qTF7ZCgRLDPe8Iw5nw
         Dn6EOeKLhLdjWCSix+b3OkeQuYKk2a5uUHKmmN7NAMIiT0reEQ/55IfZBmIU9zQxFAnT
         cX0/At8Vc9Rqt3tb9eO3iD/dHmau90CAUkp9A1gnnyM7IHCfRQ+dplRicUIh5iogWh/d
         iJnnDOz3ooDMOK3kKQAnqjilewhCR1n0sypfUb3FJ1MS1GYDgQj69gWJmEu0a8rgpIEY
         7u1w==
X-Gm-Message-State: AOJu0YwsrErRjcWbEqMm2/SYN8m5vgwMjAquBOoYZj9iqyhLIoh4N+h+
	7tHumpM+WcbCUdd1/9f6fdFzkQ==
X-Google-Smtp-Source: AGHT+IEASGONYRFXA4cHgywDI+XLP2c22ckZQT+Jgx1u14KJOj6gK1tCwswzdOHqIUN7HrTNMBuWMw==
X-Received: by 2002:a5d:58c2:0:b0:324:87d3:873d with SMTP id o2-20020a5d58c2000000b0032487d3873dmr12967469wrf.3.1696856566689;
        Mon, 09 Oct 2023 06:02:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:b2f5:bf53:6bd1:414e? ([2a01:e0a:999:a3a0:b2f5:bf53:6bd1:414e])
        by smtp.gmail.com with ESMTPSA id v15-20020a5d4b0f000000b00325aca09ad1sm9678417wrq.24.2023.10.09.06.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 06:02:46 -0700 (PDT)
Message-ID: <114052a2-6e2f-46cb-acb0-8d85c3b584bb@rivosinc.com>
Date: Mon, 9 Oct 2023 15:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] riscv: remove unused functions in
 traps_misaligned.c
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atishp@rivosinc.com>, Andrew Jones
 <ajones@ventanamicro.com>, Evan Green <evan@rivosinc.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Topel?= <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ron Minnich <rminnich@gmail.com>, Daniel Maslowski
 <cyrevolt@googlemail.com>, Conor Dooley <conor@kernel.org>
References: <20231004151405.521596-1-cleger@rivosinc.com>
 <20231004151405.521596-2-cleger@rivosinc.com>
 <877co2gwkb.fsf@all.your.base.are.belong.to.us>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <877co2gwkb.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_060250_582881_1206E5D5 
X-CRM114-Status: GOOD (  13.32  )
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

CgpPbiAwNC8xMC8yMDIzIDE4OjUxLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IENsw6ltZW50IEzD
qWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgo+IAo+PiBSZXBsYWNlIG1hY3JvcyBi
eSB0aGUgb25seSB0d28gZnVuY3Rpb24gY2FsbHMgdGhhdCBhcmUgZG9uZSBmcm9tIHRoaXMKPj4g
ZmlsZSwgc3RvcmVfdTgoKSBhbmQgbG9hZF91OCgpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOp
bWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgNDYgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+PiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPj4gaW5kZXggMzc4ZjViMTUxNDQz
Li5lN2JmYjMzMDg5YzEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21p
c2FsaWduZWQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMK
Pj4gQEAgLTE1MSw1MSArMTUxLDE5IEBACj4+ICAjZGVmaW5lIFBSRUNJU0lPTl9TIDAKPj4gICNk
ZWZpbmUgUFJFQ0lTSU9OX0QgMQo+PiAgCj4+IC0jZGVmaW5lIERFQ0xBUkVfVU5QUklWSUxFR0VE
X0xPQURfRlVOQ1RJT04odHlwZSwgaW5zbikJCQlcCj4+IC1zdGF0aWMgaW5saW5lIHR5cGUgbG9h
ZF8jI3R5cGUoY29uc3QgdHlwZSAqYWRkcikJCQlcCj4+IC17CQkJCQkJCQkJXAo+PiAtCXR5cGUg
dmFsOwkJCQkJCQlcCj4+IC0JYXNtICgjaW5zbiAiICUwLCAlMSIJCQkJCQlcCj4+IC0JOiAiPSZy
IiAodmFsKSA6ICJtIiAoKmFkZHIpKTsJCQkJCVwKPj4gLQlyZXR1cm4gdmFsOwkJCQkJCQlcCj4+
IC19Cj4+ICtzdGF0aWMgaW5saW5lIHU4IGxvYWRfdTgoY29uc3QgdTggKmFkZHIpCj4gCj4gUmVh
bGx5IGEgbml0LCBhbmQgYXBwbGllcyB0byB0aGUgd2hvbGUgZmlsZTogInN0YXRpYyBpbmxpbmUi
IGluIGEgLmMKPiBmaWxlIGlzIGp1c3QgdXNlbGVzcy4KCk9oIHllcyBjbGVhcmx5LCBJIHNob3Vs
ZCBoYXZlIGZpeGVkIHRoYXQgd2hpbGUgZmFjdG9yaXppbmcsIEkgc2ltcGx5CmtlcHQgdGhlbSBm
cm9tIHRoZSBwcmV2aW91cyBjb2RlLgoKPiAKPj4gK3sKPj4gKwl1OCB2YWw7Cj4+ICAKPj4gLSNk
ZWZpbmUgREVDTEFSRV9VTlBSSVZJTEVHRURfU1RPUkVfRlVOQ1RJT04odHlwZSwgaW5zbikJCQlc
Cj4+IC1zdGF0aWMgaW5saW5lIHZvaWQgc3RvcmVfIyN0eXBlKHR5cGUgKmFkZHIsIHR5cGUgdmFs
KQkJCVwKPj4gLXsJCQkJCQkJCQlcCj4+IC0JYXNtIHZvbGF0aWxlICgjaW5zbiAiICUwLCAlMVxu
IgkJCQkJXAo+PiAtCTogOiAiciIgKHZhbCksICJtIiAoKmFkZHIpKTsJCQkJCVwKPj4gLX0KPj4g
Kwlhc20gdm9sYXRpbGUoImxidSAlMCwgJTEiIDogIj0mciIgKHZhbCkgOiAibSIgKCphZGRyKSk7
Cj4gCj4gV2h5IGRvIHlvdSBuZWVkIGVhcmx5IGNsb2JiZXIgaGVyZT8KCkRpdHRvLCBjb3B5IHBh
c3RlZCBmcm9tIGV4aXN0aW5nIGNvZGUgYnV0IEkgZG9uJ3QgdGhpbmsgdGhlcmUgaXMgYSBuZWVk
CmZvciBlYXJseSBjbG9iYmVyIGhlcmUuCgpDbMOpbWVudAoKPiAKPiAKPiBCasO2cm4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
