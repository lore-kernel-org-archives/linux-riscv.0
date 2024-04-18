Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9493DC04FF8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 15:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fknYDcSHZFw+964Sq+ow+exQlWaTW7e+pptNA5fgid0=; b=xsveh4pFe8Uqho
	j0Mak96EmxBYavhcP8H913SrYyPxXvtnGOxHURhtL3Qo8RkBWoXSxMQX+1zkx/0T0hQBC9JJPLaiP
	/CAuc+KFqILsabFz4wJ/FufJZceJRpyxO+BaZ4Or7wAhmxDVU+x51nMbVTvOoQeWD2EpTj9s6mGot
	ySKJpVF816/+utcfFOfrrcw/aNYHUASwZ3RwptxBq4ZWwSLaX2URYy4vM0cnBd0yMdaLd2Lpw2je4
	h5JeAnjr2lYZui5r7Y2QZqCOXedk5WoF1ufhCrTFgqXWX+fdhMIUmb2iZT7+aVyrZrAvpB101Y6S3
	C/XxaevYs1i+g5OAN/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTjl-00000002nun-0cQM;
	Thu, 18 Apr 2024 15:31:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSjL-00000002cVh-09Qf
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 14:27:17 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-346407b8c9aso257186f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713450433; x=1714055233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hh6e2GF78oUYrxH7UeTADA8qs5jCuVhRAdsmr48k94=;
        b=oZYLE9zHIWJJo9jBN0XS0b5MXA84NO43k6hseAS2sV99vDG0unecJ+ou04YD67DdnT
         ydKPXsW6Cy3st8HiqjgdszZ30xOKO7Wxlz0B3nV8J3cUZzuSrnlsa9ClL5U4v52SJmfO
         PaNbQy3X5hxM6OP5u5yxot1MHp5rwvaRfxpOe7aRsqWBFdYQpdvfn/6lsaQo2nGXBq1T
         LqgFqCV7T0ee3O6t5wUY43Rv/zjaqEFZgpo4aV6xUXZGFQZOt4zdKyPyp1fC74nGKMVV
         gFhRxtnecguWCuX2nnCTKyXyEO0TVEVocrFymvEo9doKHWXpBrDfWTgV6BpuWgNvIyIB
         1zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713450433; x=1714055233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hh6e2GF78oUYrxH7UeTADA8qs5jCuVhRAdsmr48k94=;
        b=QLZwnnTuQAVZjUjYglwTCdQFCsqIxi7d0QdLEemzfA9ItTVgiQGol465cfIdpNL3cw
         arIxNSqJfQYkNQPquqM4d6Qy4r+/1lg2P/uTxZgEEj838OyDiWk7A0PAHdxGbpkqmbsx
         tO7ErGCugblc3urKGYjKl/y7c5//cm6sF6rIisJblPQH2lsheHo96zLfvGcsZfLfm2tl
         /fFJfJ2TdxfSZk6NDFB4tPLiw9oc9gbavNgWSf40OYdjG5nwMP+StwgucjCFrz1acoWa
         JBKu34WpBkgGccCrw2geP5jSH6NPWJHG9KxZgYc8Flg7r53+Fe+Sylrc2ymIJSrE5/72
         xfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLLtTbn1d7euHjJt7fF0heEII36JjwXIIszxP7rM1aFln5ELsEK72Rgyw0k3XQHkO0mI5Cz21wbhhZCNI7F+bcM7VatJWJtjUj6DtHU6I8
X-Gm-Message-State: AOJu0YyQCqzDOszjaeSJbLjKJKAfxuL0MTZ+B+3yQvjxbrnhOvyukwxQ
	IR/CpCJBsQFjulCGH/fTiLwI2ep94E+QZi+PlbFWCU/ZJsTesPMyTWGPw+pqqK4=
X-Google-Smtp-Source: AGHT+IHtDtcO4AoiryjW0Pig9lF2J1fPpYbAE7uetQUD4j2yMmH3o1hOU+m/bZxddoy6PQKmq3VrHg==
X-Received: by 2002:a05:600c:55d7:b0:418:ef65:4b5f with SMTP id jq23-20020a05600c55d700b00418ef654b5fmr1037961wmb.3.1713450433361;
        Thu, 18 Apr 2024 07:27:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm2873645wmo.42.2024.04.18.07.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:27:12 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Ved Shanbhogue <ved@rivosinc.com>
Subject: [RFC PATCH 3/7] riscv: add Ssdbltrp ISA extension parsing
Date: Thu, 18 Apr 2024 16:26:42 +0200
Message-ID: <20240418142701.1493091-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418142701.1493091-1-cleger@rivosinc.com>
References: <20240418142701.1493091-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_072715_117601_D30F52FB 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

SGFuZGxlIFNzZGJsdHJwIGV4dGVuc2lvbiBhdCBpc2EgcGFyc2luZyBsZXZlbC4KClNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2Nzci5oICAgfCAxICsKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAzIGZpbGVz
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCmluZGV4IDUxMDAxNDA1
MWY1ZC4uNTUyODE1OWIzZDVkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nz
ci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKQEAgLTEwMiw2ICsxMDIsNyBA
QAogI2RlZmluZSBFWENfSU5TVF9QQUdFX0ZBVUxUCTEyCiAjZGVmaW5lIEVYQ19MT0FEX1BBR0Vf
RkFVTFQJMTMKICNkZWZpbmUgRVhDX1NUT1JFX1BBR0VfRkFVTFQJMTUKKyNkZWZpbmUgRVhDX0RP
VUJMRV9UUkFQCQkxNgogI2RlZmluZSBFWENfSU5TVF9HVUVTVF9QQUdFX0ZBVUxUCTIwCiAjZGVm
aW5lIEVYQ19MT0FEX0dVRVNUX1BBR0VfRkFVTFQJMjEKICNkZWZpbmUgRVhDX1ZJUlRVQUxfSU5T
VF9GQVVMVAkJMjIKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCA1MzQwZjgxODc0NmIuLjE2ZDJh
ZDdjYTliMiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtODAsNiArODAsNyBAQAogI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1pGQQkJNzEKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVFNPCQk3Mgog
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pBQ0FTCQk3MworI2RlZmluZSBSSVNDVl9JU0FfRVhUX1NT
REJMVFJQCQk3NAogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYCQkxMjgKICNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9JTlZBTElECQlVMzJfTUFYCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggODk5
MjBmODRkMGEzLi41Y2ZmMjFhZGYyYzQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2Nw
dWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKQEAgLTMwMyw2
ICszMDMsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRb
XSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzbXN0YXRlZW4sIFJJU0NWX0lTQV9FWFRfU01T
VEFURUVOKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc2FpYSwgUklTQ1ZfSVNBX0VYVF9TU0FJ
QSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoc3Njb2ZwbWYsIFJJU0NWX0lTQV9FWFRfU1NDT0ZQ
TUYpLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzZGJsdHJwLCBSSVNDVl9JU0FfRVhUX1NTREJM
VFJQKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQShzc3RjLCBSSVNDVl9JU0FfRVhUX1NTVEMpLAog
CV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHN2aW52YWwsIFJJU0NWX0lTQV9FWFRfU1ZJTlZBTCksCiAJ
X19SSVNDVl9JU0FfRVhUX0RBVEEoc3ZuYXBvdCwgUklTQ1ZfSVNBX0VYVF9TVk5BUE9UKSwKLS0g
CjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
