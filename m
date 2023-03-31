Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27490C761AF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZlPIitfBwKSdvh/5iv2FLOy9ZEaQqzsiZTgUQUMyehY=; b=Xisg7ET4bHTT4J
	g7DqR6XblGeAff/+l6MszTXWc9j32x/R89CHoYju1hdtE5JbC0Xe/7zR9F9kHTSs+R/S0AUNqZWuS
	EnzwDlHYKBLpXRJCEdIdW4GAQKLm4OQSHJWR5fLNZYvPCxd7kDW/0TPHeU7B9h/8FvC6VMl3GDy23
	rtBwkHx3oyp6Fr2RiB0Uo/HhMkoGIMp2o57xvg2QQdpwzHtOrLlyT7hRK0HsbTU8ohmWHRZPUoJv0
	dBXvs9PmENhAmO957LsMrm88C+vhnc3Wvoht8SOTY1xBT6QtcHbh0U5993ggz7HzXBjAkD+gzt7ke
	EafZNEQwKrZHDhK0p/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piFu7-007lEo-1j;
	Fri, 31 Mar 2023 14:38:59 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piFu4-007lBY-0g
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 14:38:57 +0000
Received: by mail-lf1-x131.google.com with SMTP id q16so29152115lfe.10
        for <linux-riscv@lists.infradead.org>; Fri, 31 Mar 2023 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1680273531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSw02QdSNYs5iQZe8kVdqUeP5gxl8yJEkHqDoZqEb90=;
        b=UdGoddf5bXxD5gSKKZq5xbNf3lX6c0scs+3DExuWR1IkKuRV2OpGycyCufuzcrA7c0
         6KGfJpJXc3FkeuZKrWcDoA/rHcdS5f/pxrQn64xP+LpQrgRVRap1cMy+/FLEgoP92oCc
         4mdDYlp5aMhMgFuVrRpVUTbXZx4+irIvIZDVGYwtm/JnvIEn44OIrWP9z0SOvz426gZ0
         44wbNjL4qnBL/2sGfBruXGltCiPoyo/pTzgOCcu2Ejcqqo1KgU+A2fHE0hP5VzPExB6g
         wcElCE7LQasGv+7/bysxor0oo+O42M7d3JwI3YQJdQOtS1pvB6IFZ9qjkdFEDAqC4SCi
         QfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680273531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSw02QdSNYs5iQZe8kVdqUeP5gxl8yJEkHqDoZqEb90=;
        b=qE+/HU091PHdHUabwhEy49bxwbpdkFpvHjc+uW5CpeAUg44CohJVMuHaSs8Pi4+Kjl
         6Olx98i4lT0KGai5TzEOlRtu9o5UYdrhpwoPaoqvjIakZ6oV1NKCYDkcSylpnU11Fm1s
         docL5wUiRFEG9M9SUr6q3jht70hbWxCfeOibeSXBPmGQF/tKxpElvojldTvQaBDpQbZP
         eb3YPwGrkF/0bbL0cu31TPyfiwc7lwYZIgpv93XPGv66xq+wgTSfaGgKA6bV0+rD3oyt
         ZkYqdBwWljT46r7PFtJjRMbtqMVbeKRUUq9Y2WqodBQcJ2t8QaI7JlxpG8K2Wo+h9Dhy
         Kh4w==
X-Gm-Message-State: AAQBX9fUYJWB6A/4XwklTputDL//okdm8T7IlwmxYE19eTCClcPZG28J
	IFAI5ja1H2RBRkafEs6e8ySjFXp8QLAyw+dNgSp5qw==
X-Google-Smtp-Source: AKy350aQ7Ed8xOev3qhnK3Z1+w6VORlZZ7zAZIucuWwPUVNpKjgScrPlpHU6JNq5KIJ0AE2M12TI3RWGPDoDx3fLtVI=
X-Received: by 2002:a05:6512:2182:b0:4dd:9931:c555 with SMTP id
 b2-20020a056512218200b004dd9931c555mr3121265lft.0.1680273531309; Fri, 31 Mar
 2023 07:38:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230327164941.20491-1-andy.chiu@sifive.com> <20230327164941.20491-11-andy.chiu@sifive.com>
 <3435e5c9-5969-4abc-b929-5a73806e3506@spud>
In-Reply-To: <3435e5c9-5969-4abc-b929-5a73806e3506@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 31 Mar 2023 22:38:40 +0800
Message-ID: <CABgGipWEyhct3fQMjZ4+OL7WU-L_TZCDJsJq=GhsH0bn9Az_mA@mail.gmail.com>
Subject: Re: [PATCH -next v17 10/20] riscv: Allocate user's vector context in
 the first-use trap
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Liao Chang <liaochang1@huawei.com>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>, Mattias Nissler <mnissler@rivosinc.com>, 
	Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_073856_372243_A78228F9 
X-CRM114-Status: GOOD (  14.31  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgMToyMuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAyNywgMjAyMyBhdCAwNDo0OTozMFBNICsw
MDAwLCBBbmR5IENoaXUgd3JvdGU6Cj4gPiBWZWN0b3IgdW5pdCBpcyBkaXNhYmxlZCBieSBkZWZh
dWx0IGZvciBhbGwgdXNlciBwcm9jZXNzZXMuIFRodXMsIGEKPiA+IHByb2Nlc3Mgd2lsbCB0YWtl
IGEgdHJhcCAoaWxsZWdhbCBpbnN0cnVjdGlvbikgaW50byBrZXJuZWwgYXQgdGhlIGZpcnN0Cj4g
PiB0aW1lIHdoZW4gaXQgdXNlcyBWZWN0b3IuIE9ubHkgYWZ0ZXIgdGhlbiwgdGhlIGtlcm5lbCBh
bGxvY2F0ZXMgVgo+ID4gY29udGV4dCBhbmQgc3RhcnRzIHRha2UgY2FyZSBvZiB0aGUgY29udGV4
dCBmb3IgdGhhdCB1c2VyIHByb2Nlc3MuCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBSaWNoYXJkIEhl
bmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4KPiA+IExpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMzkyM2VlZWUtZTRkYy0wOTExLTQwYmYtODRjMzRhZWU5NjJkQGxp
bmFyby5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5j
b20+Cj4KPiBJIHNlZSB5b3UgZHJvcHBlZCB0d28gUi1iIGZyb20gdGhpcyBwYXRjaCwgd2hhdCBh
Y3R1YWxseSBjaGFuZ2VkIGhlcmU/Cj4gSXQncyBub3QgaW1tZWRpYXRlbHkgb2J2aW91cyB0byBt
ZSAoc29ycnkhKSBhbmQgdGhlIGNvdmVyIGRvZXNuJ3QgbWVudGlvbgo+IHdoeSB0aGV5IHdlcmUg
ZHJvcHBlZC4KCkhpLCB0aGUgcmVhc29uIHdoeSBJIGRyb3BwZWQgUi1iIGhlcmUgaXMgdGhhdCB0
aGVyZSBpcyBhIGNvbmZsaWN0IGluCnRyYXAuYyBiZWNhdXNlIHRoZSBBUEkgaGFzIGNoYW5nZWQg
YWZ0ZXIgY29udmVydGluZyB0byBnZW5lcmljIGVudHJ5LgpBbmQgdGhhdCBjaGFuZ2UgZG9lcyBu
b3QgbWFrZSB2MTYncyB3YXkgd29yayBvdXQgb2YgdGhlIGJveCwgc28gaXQKKHRyYXAuYyBAIHYx
NykgcmVxdWlyZXMgc29tZSBtb3JlIHJldmlld2luZyBJIHN1cHBvc2UuCgpUaGFua3MgZm9yIGFz
a2luZyEgSSBzaG91bGQgZ2V0IGJldHRlciBhdCBkZXNjcmliaW5nIHRoZXNlIGluIHRoZSBjb3Zl
ciBsZXR0ZXIuCgpBbmR5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
