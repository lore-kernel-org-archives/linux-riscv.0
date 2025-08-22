Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B95CCA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qo2bPq2jhAWSFaevfLD6PwCzdN+Hu9Qs1dcWgzLV1c=; b=ZvLQ95wefgPQ5b
	QCri3gDLoYIR6R0fVqCQHmFi+J85NI1nObAMq+PUfrh02O6ZK8iWREeAuJyllx9Gdf59uq2WlUexU
	CkruXM31YTjsM2EAnSzJn2J3p0eOChniK19iHELxn7m244A3I+4ZO16u/8cF+QQupg63tfbS7AFD7
	1myM/TMQbxf1OneGjHFu12GqJrsuPM138rXj83EACajhnqXegOd120GkCRs6glVWQKOCeUl8SOCSj
	7nIp8IG7fuUa0rqUOhEsvrbzgxoJDjaoZ9Zj6jurL1I2KKHUlsnkJqMuUQjZ/1hbieTdHUHNuhro/
	vz+Vz6tm/xSFMQPhIvEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphjf-00000003w0G-07Fg;
	Sat, 23 Aug 2025 06:28:19 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPxC-00000002LGx-1Lak
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 11:29:07 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3e584a51a3fso10244585ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Aug 2025 04:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1755862145; x=1756466945; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAj4MTsX9crtFaSUyO+PrnGMFjFfbBShLF1OedjML3o=;
        b=BZs1YSkBc0IdmeNqST6yEuBOfSmXlaZ1kYusP/DW7j+ve2DWHzrQldLBkNBlGKLkaf
         dvtBMVbj15sCFrCIKEpRoc/ei+6FsHLR9umcMm/86ebJb3SkQmjhHoXz4/rpC9DBZQk2
         BLO6lMkM/b4e0T+7pf8oG2nEV7T2AxYsnZQFB3examjwsz8QLpLKGdFG0+0c+NtysasS
         CYKCTAh2w9uJKuHayw+WzYLw9h3hm/qkQmGGIj+DQPrqwKm4F/VPGPsAbf7hRqhIGCGw
         a/E+wYqzLKdDK7UuXBh1BojmBZ4BoNI2capTBUcZBVJnNnhjSSbfRTCpaA+3kxa72HK6
         /ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862145; x=1756466945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAj4MTsX9crtFaSUyO+PrnGMFjFfbBShLF1OedjML3o=;
        b=o9vSFJEAYM3Ywtq7ju3Afy+hUDXwS2YAU1j7HWjr3V4dJFWaMrSEpxeTge7d4rhGSn
         CAJbPHOqCCw61WgnBM+LMNzx1T0GjJPngQcHJCc9sX8892JbBrX+hA3mtMo0eC7R3H25
         ZqNO9tg+sAwEFQgCVQIDFIxzJ+ZvMfsWYQUxAyP1f7+wtsozhypNHQZ60fdLZyXgEbKX
         0WHWkO5m4W/mWhMFx7BIKvKZLXotdScynXN/h0q7iTTRj1oQRoDLtahj0162piBmPpVO
         lgEf8dNrHjKf7s94sWFSRcj8KEwIPCktsJq/5oooiJIQ8bslc3EkqFnH3bAoxs31DpG6
         jfVg==
X-Forwarded-Encrypted: i=1; AJvYcCXuGzOMQxerIvO8RsS0gmdot+/QL++iDX46/Dd/n8xrXoJH7bSV651l0lthI0/njJwdspTyPoyw1HJosw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5RSRi/CQjdyZ0jRoGrt7hD9DK94PYelLnNkUGVTPzP/XLC0z9
	osDmuu3CQ99LVyME5px0mmqyZjx4iYNbKDR5G1L5YMwABhWU8Yb+IGj8i/4O6ekERK6bK0z0Bem
	WWaz1STUsQHBBj0d1HLdVcwLLOK0tbRKqMSv+3m5ZQQ==
X-Gm-Gg: ASbGncsBz2MXDoWSZp1bvttZGzKAnEMvsWGxpZYOVHPo8oD6py/fVsdfavEKEqKmkx/
	I9cGB9uLXzd+E3LlvyJrhp/TN+iT5Wm6RUEErIZMRoWeKIj/+MHh6+5EeBfGp+WRnQTJpiuB9II
	QPYvV9GlmUGYlryMDbIofQSAkitYwK8A27ctHFVVWvg7HWsVipoHKMQ+dUIU8UIQBB122NHIwOt
	rKnhhlV
X-Google-Smtp-Source: AGHT+IFotCEaG3Imylyjy2m0DQxnH2th5L/KRoKnw2C+LytW2vVJKqgXGAwa/u5DAm0MxjMWmuNiRe1PyZgcFc/tw+c=
X-Received: by 2002:a05:6e02:2284:b0:3e9:e4ca:8f0a with SMTP id
 e9e14a558f8ab-3e9e4ca9b34mr9579755ab.25.1755862145223; Fri, 22 Aug 2025
 04:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
In-Reply-To: <20250805104418.196023-4-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 22 Aug 2025 16:58:52 +0530
X-Gm-Features: Ac12FXzA7OqPPvuSEUi3YmGf4O7XQNOfsrf-wXEXFi1rcASEvUu6djRNFKE82bo
Message-ID: <CAAhSdy1OcQBgV6T5z0K5mMv9pr23_oVVEJpimdzDjgAN3BhYeg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: fix stack overrun when loading vlenb
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_042906_358166_A0C61A4E 
X-CRM114-Status: GOOD (  13.50  )
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

T24gVHVlLCBBdWcgNSwgMjAyNSBhdCA0OjI04oCvUE0gUmFkaW0gS3LEjW3DocWZIDxya3JjbWFy
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIHVzZXJzcGFjZSBsb2FkIGNhbiBwdXQg
dXAgdG8gMjA0OCBiaXRzIGludG8gYW4geGxlbiBiaXQgc3RhY2sKPiBidWZmZXIuICBXZSB3YW50
IG9ubHkgeGxlbiBiaXRzLCBzbyBjaGVjayB0aGUgc2l6ZSBiZWZvcmVoYW5kLgo+Cj4gRml4ZXM6
IDJmYTI5MDM3MmRmZSAoIlJJU0MtVjogS1ZNOiBhZGQgJ3ZsZW5iJyBWZWN0b3IgQ1NSIikKPiBD
YzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3D
ocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+CgpRdWV1ZWQgdGhpcyBhcyBhIGZpeCBmb3Ig
TGludXgtNi4xNwoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Zl
Y3Rvci5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV92ZWN0b3IuYyBiL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfdmVjdG9yLmMKPiBpbmRleCBhNWY4OGNiNzE3ZjMuLjA1ZjNjYzJkOGUzMSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3ZlY3Rvci5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0v
dmNwdV92ZWN0b3IuYwo+IEBAIC0xODIsNiArMTgyLDggQEAgaW50IGt2bV9yaXNjdl92Y3B1X3Nl
dF9yZWdfdmVjdG9yKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAgICAgICAgICAgICAgc3Ry
dWN0IGt2bV9jcHVfY29udGV4dCAqY250eCA9ICZ2Y3B1LT5hcmNoLmd1ZXN0X2NvbnRleHQ7Cj4g
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcmVnX3ZhbDsKPgo+ICsgICAgICAgICAgICAg
ICBpZiAocmVnX3NpemUgIT0gc2l6ZW9mKHJlZ192YWwpKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAgICAgICAgICBpZiAoY29weV9mcm9tX3VzZXIo
JnJlZ192YWwsIHVhZGRyLCByZWdfc2l6ZSkpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FRkFVTFQ7Cj4gICAgICAgICAgICAgICAgIGlmIChyZWdfdmFsICE9IGNudHgtPnZlY3Rv
ci52bGVuYikKPiAtLQo+IDIuNTAuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
