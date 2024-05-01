Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DF0C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 17:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yln3wAsNf3moW7+cVLoC3SZfC6iX4VYTpENCzQ/UAqs=; b=FhkErFY0cWIiAq
	m9ZCh3Eb399BeQ6cm9Wyfwr4JucZBJ4p//Whv2qlJFZTF2n0dJhMQlTTUvf6MQ4GdZE2p4i873Lzs
	POyMdp+LtdXeERz8A+E8elT09aT3Xq8RrORg/UUay/W4+qU9KTO+8GCvrr1IyQh9QJdrBF/8Gd0uC
	zGDk/I2Wnp4MAvY5tLPgpCyQtbmyM6/W5r6CPyvFvGOoqYnxUcTDfIPwI2QtA3q/9JjxO0zkrui/j
	MtabUIb64azKXvCcSWUL/Xnzpo+/pGnodzgEh7eyFoXkIQ0HNkRrbJZkPM9SqcEXJPuIl7ybwst2i
	p0rdjNjDxsFwPGfKEAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2EDn-0000000AMxk-0lsV;
	Wed, 01 May 2024 17:58:23 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2EDi-0000000AMvD-2Xbf
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 17:58:20 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ed9fc77bbfso5610884b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 May 2024 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714586296; x=1715191096; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ewiZxKEDhipFv9WpDKT1OvAInIM8Qy/YnJeIqtYAQ20=;
        b=WfTVo1GFFZ4NG4lcM2jAJFZB0xidL8g1vq6QJFlrTtCdY8s/zzuHghEVA3ACf7h/rz
         Ft2RBiGI1y2jVQjuLCYnSHTjBHr13kQfOPaWFdutvUjnylAnnBATqmvMF/4RXDTX6mkU
         bk+52Cul0ZfTUHixdvqsELjorw5bebIPecU4/s9Pe3UElzHeEyFvzSWP0L33Z3XNZjjt
         zVBX6n+ASGvmGJvu/Y+gEeAdTU0IV8h4vSEPd2/iKl8h0YRxry0/9qyWzTyoWBhWn0nS
         pp+Rdf+Yz6MqF8ufo2p7a+gpF5gMajWEYG7C+ouTzqyuZ/o3piLGK2+Hgv1QXh8VWIBH
         8WZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714586296; x=1715191096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ewiZxKEDhipFv9WpDKT1OvAInIM8Qy/YnJeIqtYAQ20=;
        b=RqG5BEItK5q8M+qMlrAmGKvB/G+4guVkUjRtxEbKDyMK8ibaiaXGp+XZ+JUlJ6LpIY
         XPWOqAQXv0A2sGdlafvtrd0LGzxFTIldoyX/xac/EHXBb9xyNA/J5vIYOPmbWKNKZaKU
         y6kNCQlLn7ZsIwXh5R6Mo4A1S5WVw6Te7asBEdNC6aaLygcLp7yDoY5jBkYCPVyeEbOT
         t1IgiSMQwwGQ6WXCbtYwnYcWdP+Z42MVlqX8pTlD/dRJ0nmj4y9ZvbYNH2T4j1vBvdq2
         gI6w6kQINB4Srr7WmPgZSllflo3rB9jKtGXrIxCTv6UuUH8TUz5HRtXef+RPnDwirtlw
         eTRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQDlH0jJF9Qy4L7fcdViyEnZ3p/EJV4+yNHoxi23skPgJofthKH0sHJqpjxEwC4gCMC5BQ9otGA6NV+MTyETL/UUMmfR7RWyo4VFURb3Gf
X-Gm-Message-State: AOJu0YxbjBDsrDl01OxD/iootuPNJm85Hg2mZpHu1rmSQ4A8crm/l4lL
	T8qWX0mO4qn8RLMa+LiWQA8zQbTmdgmXoFYBWtfnPZosHg9kwQL1PiOtyq0B28s=
X-Google-Smtp-Source: AGHT+IHowJBwbgP8/Vm7zaF9odAFfRxagmDXAI/fLRPFmpGJdmGG+eEAuwcNKsDXaL6jhqUEVkKVOQ==
X-Received: by 2002:a05:6a00:1305:b0:6e8:f57d:f1ec with SMTP id j5-20020a056a00130500b006e8f57df1ecmr4107317pfu.17.1714586296277;
        Wed, 01 May 2024 10:58:16 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:1dcc:e03e:dc61:895d])
        by smtp.gmail.com with ESMTPSA id o7-20020a056a001b4700b006edcbbff2b0sm22940382pfv.199.2024.05.01.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 10:58:15 -0700 (PDT)
Date: Wed, 1 May 2024 10:58:12 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Cc: Evan Green <evan@rivosinc.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v4 05/16] riscv: Extend cpufeature.c to detect vendor
 extensions
Message-ID: <ZjKCtJWqoiLM3xZv@ghost>
References: <20240426-dev-charlie-support_thead_vector_6_9-v4-0-b692f3c516ec@rivosinc.com>
 <20240426-dev-charlie-support_thead_vector_6_9-v4-5-b692f3c516ec@rivosinc.com>
 <CALs-HstM64Hy_=XVz=0sWQt=8j1u+bq6RhthUuD3P0E4=HyvcA@mail.gmail.com>
 <20240501-flagstone-zealous-2fc722bfad39@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240501-flagstone-zealous-2fc722bfad39@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_105818_668379_2EB61427 
X-CRM114-Status: GOOD (  18.86  )
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

T24gV2VkLCBNYXkgMDEsIDIwMjQgYXQgMDY6MTk6MzRQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFdlZCwgTWF5IDAxLCAyMDI0IGF0IDA5OjQ0OjE1QU0gLTA3MDAsIEV2YW4gR3Jl
ZW4gd3JvdGU6Cj4gPiBPbiBGcmksIEFwciAyNiwgMjAyNCBhdCAyOjI54oCvUE0gQ2hhcmxpZSBK
ZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gCj4gPiA+ICtzdHJ1Y3Qgcmlz
Y3ZfaXNhX3ZlbmRvcl9leHRfZGF0YV9saXN0IHsKPiA+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3Qg
cmlzY3ZfaXNhX2V4dF9kYXRhICpleHRfZGF0YTsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgcmlzY3Zf
aXNhaW5mbyAqcGVyX2hhcnRfdmVuZG9yX2JpdG1hcDsKPiA+ID4gKyAgICAgICB1bnNpZ25lZCBs
b25nICp2ZW5kb3JfYml0bWFwOwo+ID4gCj4gPiBJdCB0b29rIGEgbG90IG9mIGRpZ2dpbmcgZm9y
IG1lIHRvIHVuZGVyc3RhbmQgdGhpcyB3YXMgdGhlIHNldCBvZgo+ID4gdmVuZG9yIGV4dGVuc2lv
bnMgc3VwcG9ydGVkIG9uIGFsbCBoYXJ0cy4gQ2FuIHdlIGFkZCB0aGF0IHRvIHRoZSBuYW1lLAo+
ID4gbWF5YmUgc29tZXRoaW5nIGxpa2UgaXNhX2JpdG1hcF9hbGxfaGFydHM/IChJIHdvbmRlciBp
ZiB3ZSBjb3VsZCBkcm9wCj4gPiB0aGUgdmVuZG9yIHBhcnQgb2YgdGhlIG5hbWUgc2luY2Ugd2Ug
YWxyZWFkeSBrbm93IHdlJ3JlIGluIGEKPiA+IHZlbmRvcl9leHRfZGF0YV9saXN0IHN0cnVjdHVy
ZSkuCj4gCj4gUmVhZGluZyB0aGlzIG1hZGUgbWUgd29uZGVyLCB3aHkgaXMgdGhlIGFsbC1oYXJ0
IGJpdG1hcCBhbiB1bnNpZ25lZCBsb25nCj4gd2hlbiB0aGUgcGVyIGhhcnQgb25lIGlzIGEgcmlz
Y3ZfaXNhaW5mbyBzdHJ1Y3Q/CgpIbW0gSSBkb24ndCB0aGluayB0aGVyZSBpcyBhIGdvb2QgcmVh
c29uIGZvciB0aGF0LiBJIGJlbGlldmUgdGhpcyBjYW4KYmVjb21lIHN0cnVjdCByaXNjdl9pc2Fp
bmZvICogd2l0aCBubyBpc3N1ZXMuCgotIENoYXJsaWUKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
