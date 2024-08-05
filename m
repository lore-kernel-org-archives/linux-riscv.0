Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E09C3DA4A
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Aug 2024 08:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IYJR8xg7zEa57mzRtP4FLQUIyXZJtYd4kprMaFzhpIQ=; b=Le584V3ZWu4Vph
	SAsUIWjVgM7T/4TKSWs+gDx8tim4Mmq9p4s3Jfb90i2nk+Q68J2h39cl5BdQhEqtzf1V9iG97Qj6J
	CHU13zy0waWN5+R53HNe4kDUk1Tt7o/wqJs+hnaEF47CHogZJ4iBcy31kbAGaqnc+/xQ1VkKOEBfO
	2bgsEut6bqMZtkuAN+gXkb4rag0KUw1FGcvYnovBaDWHX33pnC/ZWZVrrkPkO55GPHvUzPSSrDVMJ
	8jjzyfVSpvV3c2+AZXstzUqIHW/pcwiuPYcP0qeEhYV6qSeCBVQgrVISnUkRuKEumOSuV60hnQoCa
	e0y2EUYSEIEeY2JimLrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sasiL-0000000F3Ky-1p7G;
	Mon, 05 Aug 2024 08:05:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sasiI-0000000F3KG-0KGq
	for linux-riscv@lists.infradead.org;
	Mon, 05 Aug 2024 08:05:07 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-530c2e5f4feso2442843e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Aug 2024 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722845104; x=1723449904; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vUo6X2UB32z9znfy1Y49G04XlyGtFJELqgfmxMvQuo=;
        b=B4RCwryoOe/h6vTVQQhIocMsEAqzMAxGI1J1QYqNeUHhz0Q6VCXJiVMSPMh2tLvDwR
         2YJ6r2AODJ0DpGDooI1pUQHh9Cot5QT9A3Fi2hnkBKKyvzzcGDTWcc2d1A6zbXcun1cs
         4/XZnp1CnE3ioN8IHEPbI3vbKEzFEOf+zyLHDl4mmNNzLQ+hiziI27aKrcYM2Te9KPH6
         ntEAyq6+8Ym/gO/poQM3jqItAk0NDsgJC71muAOJq0MHXKcbxo56bjDBnBYUF85BlkuL
         xEwbDYKv6j0Trdn3AEBfdqo/tB/iVc2BZL6bdY22xXKxSpmOBZ0DFFCySDdEBp30W220
         qtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722845104; x=1723449904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vUo6X2UB32z9znfy1Y49G04XlyGtFJELqgfmxMvQuo=;
        b=dizcmA6Dg4a9jj/WcOn+8WzaJdmYzqkHkIr5uMriQkmcT/4rwbNjd+nohOE6Sstt+6
         C5sz83ItLLAaqLXztyt5Wwq3Hg0iWr4cxEM2baVt2NUYM9d0Krl6joLG/9lnmQ61DT21
         NxXaJyXzCqlePEskq6xoBkRXDj7F/6OwZZGE/iFdeoyxuHDnKiHuSn+nzXoCgXVh5WTR
         wayOmY7B7QSeQsAh6zwclF9c0vs71LOIeC9N/iZb1fspq4j6N58cAP01m7Mby3irnIKD
         FtLcyMfmR46zageQbmiPjDuhWLprIzabNKKvnXWZzsA9xq3UNnmil3VUjAiyw9aa9hlU
         MQGg==
X-Forwarded-Encrypted: i=1; AJvYcCX+IQ3Qdxaq3ruxOU2Qg87lpFC7FbmKBjoM5F6gFxEXHQAmQ4IE50MaRJYPgY84ZY5HQB2g7CyYpqeUR6emu9WfdfhST5APQwBrR9Nnda16
X-Gm-Message-State: AOJu0Ywe4QNK4cElxNhU2K6Mkj45Km1C3n6swnw3qdynerx6C0AwVpU6
	N9sMRzUvEjqmiUFiPtH8zsOD/7/1Z7UbrwIt5VZXzAhlsbCwlkk2TDhlHE5OemcDQkdESVPzn3g
	TBBu/HrkgKPQIxRzsKh/bcAhZQw59A2wsIi/emA==
X-Google-Smtp-Source: AGHT+IFGNovjX087F1QurhU0HQ7nruW2cdo46FHweA0PGGBWHf1HSVejhpZypq7DgKQTcYz6PkOVXwzgpSu/BA7Ep7U=
X-Received: by 2002:a05:6512:ba7:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-530bb36640fmr7518778e87.7.1722845103835; Mon, 05 Aug 2024
 01:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240723-supervise-drown-d5d3b303e7fd@wendy> <20240723-underage-wheat-7dd65c2158e7@wendy>
In-Reply-To: <20240723-underage-wheat-7dd65c2158e7@wendy>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2024 10:04:53 +0200
Message-ID: <CACRpkdbRE695f-+do1HYpOZ6e4qxgUBWJzEPO2hTCuZ3xxYHQg@mail.gmail.com>
Subject: Re: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-kernel@vger.kernel.org, conor@kernel.org, 
	Marc Zyngier <maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Lewis Hanly <lewis.hanly@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_010506_298291_A9E09AA4 
X-CRM114-Status: GOOD (  12.26  )
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

T24gVHVlLCBKdWwgMjMsIDIwMjQgYXQgMToyOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgoKCj4gRnJvbTogTGV3aXMgSGFubHkgPGxld2lzLmhh
bmx5QG1pY3JvY2hpcC5jb20+Cj4KPiBBZGQgYSBkcml2ZXIgdG8gc3VwcG9ydCB0aGUgUG9sYXJm
aXJlIFNvQyBncGlvIGNvbnRyb2xsZXIKPgo+IFNpZ25lZC1vZmYtYnk6IExld2lzIEhhbmx5IDxs
ZXdpcy5oYW5seUBtaWNyb2NoaXAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpKdXN0IGEgY29tbWVudCBvbiBzZWNvbmQgdGhv
dWdodDoKCj4gK2NvbmZpZyBHUElPX1BPTEFSRklSRV9TT0MKPiArICAgICAgIGJvb2wgIk1pY3Jv
Y2hpcCBGUEdBIEdQSU8gc3VwcG9ydCIKPiArICAgICAgIGRlcGVuZHMgb24gT0ZfR1BJTwo+ICsg
ICAgICAgc2VsZWN0IEdQSU9MSUJfSVJRQ0hJUAoKc2VsZWN0IEdQSU9fR0VORVJJQz8KCj4gK3N0
YXRpYyBpbnQgbXBmc19ncGlvX2RpcmVjdGlvbl9pbnB1dChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywg
dW5zaWduZWQgaW50IGdwaW9faW5kZXgpCj4gK3sKPiArICAgICAgIHN0cnVjdCBtcGZzX2dwaW9f
Y2hpcCAqbXBmc19ncGlvID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2MpOwo+ICsgICAgICAgdTMyIGdw
aW9fY2ZnOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsKPiArCj4gKyAgICAgICByYXdf
c3Bpbl9sb2NrX2lycXNhdmUoJm1wZnNfZ3Bpby0+bG9jaywgZmxhZ3MpOwo+ICsKPiArICAgICAg
IGdwaW9fY2ZnID0gcmVhZGwobXBmc19ncGlvLT5iYXNlICsgTVBGU19HUElPX0NUUkwoZ3Bpb19p
bmRleCkpOwo+ICsgICAgICAgZ3Bpb19jZmcgfD0gTVBGU19HUElPX0VOX0lOOwo+ICsgICAgICAg
Z3Bpb19jZmcgJj0gfihNUEZTX0dQSU9fRU5fT1VUIHwgTVBGU19HUElPX0VOX09VVF9CVUYpOwoK
T0sgdGhpcyBwYXJ0IGlzIHVuaXF1ZS4uLgoKPiArc3RhdGljIGludCBtcGZzX2dwaW9fZGlyZWN0
aW9uX291dHB1dChzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IGdwaW9faW5kZXgs
IGludCB2YWx1ZSkKPiArewo+ICsgICAgICAgc3RydWN0IG1wZnNfZ3Bpb19jaGlwICptcGZzX2dw
aW8gPSBncGlvY2hpcF9nZXRfZGF0YShnYyk7Cj4gKyAgICAgICB1MzIgZ3Bpb19jZmc7Cj4gKyAg
ICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICsKPiArICAgICAgIHJhd19zcGluX2xvY2tfaXJx
c2F2ZSgmbXBmc19ncGlvLT5sb2NrLCBmbGFncyk7Cj4gKwo+ICsgICAgICAgZ3Bpb19jZmcgPSBy
ZWFkbChtcGZzX2dwaW8tPmJhc2UgKyBNUEZTX0dQSU9fQ1RSTChncGlvX2luZGV4KSk7Cj4gKyAg
ICAgICBncGlvX2NmZyB8PSBNUEZTX0dQSU9fRU5fT1VUIHwgTVBGU19HUElPX0VOX09VVF9CVUY7
CgpBbHNvIGhlcmUKCj4gK3N0YXRpYyBpbnQgbXBmc19ncGlvX2dldF9kaXJlY3Rpb24oc3RydWN0
IGdwaW9fY2hpcCAqZ2MsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgZ3Bpb19pbmRleCkKPiArc3RhdGljIGludCBtcGZzX2dwaW9fZ2V0KHN0cnVjdCBn
cGlvX2NoaXAgKmdjLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZ3Bp
b19pbmRleCkKPiArc3RhdGljIHZvaWQgbXBmc19ncGlvX3NldChzdHJ1Y3QgZ3Bpb19jaGlwICpn
YywgdW5zaWduZWQgaW50IGdwaW9faW5kZXgsIGludCB2YWx1ZSkKCkJ1dCB0aGVzZSBhcmUganVz
dCBNTUlPIGZ1bmN0aW9ucy4KCklzIGl0IHBvc3NpYmxlIHRvIHVzZSBhdWdtZW50ZWQgZ2VuZXJp
YyBNTUlPLCBpLmUganVzdCBvdmVycmlkZSB0aGVzZQp0d28gZnVuY3Rpb25zIHRoYXQKbmVlZCBz
cGVjaWFsIGhhbmRsaW5nPwoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
