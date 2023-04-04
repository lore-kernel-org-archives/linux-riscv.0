Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2525C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7bvJBP9DLRH8Drqx3UfYThqiPeiU8elRoUn3quH7M0=; b=TkKT+ScsYvPYh5
	zRvvmeByBcVVdGCHnbs5d51yiQ9goBeoRIMgfE0BFmAzzlSYuzKkghWZFm1hxBcZmmpG5gx02S8Cx
	tGsr7FyWa0eK8rKuhtuqLGDmyUdfv++lRiu1vhhIkMp1Z37Y2qTLacJUYXHthIHy13kBN+gRj+Drg
	lSOUZzk4BTMN11pVfdWIrDe3zybjKQ7XjpFNS7IXo17kkTxtODpmCqXrBfArYOvYh1ZuQm+Zk4t1k
	ThJjvKzr34mXkC/cWFbGWJiY1d/A6ivwiwsE1JlIGftQuSL/j7olFcCwUWJh8110GMRFwWs7Tn+uM
	dntQhcWqdbG8s8ySCAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlJV-002Urx-0p;
	Tue, 04 Apr 2023 18:23:25 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlJS-002Uft-0i
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:23:23 +0000
Received: by mail-pj1-x1033.google.com with SMTP id ml21so9536496pjb.4
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQY7IsXlYzYdPvbtAuGQhW+vz7kmikxb6Hsl9qnqiJo=;
        b=SIAlskABjXHJXgba+lu7R2T7GFAtUq29s7yTNteHrnjrRREnu/xfZzyK9AUbLub4UK
         OLevFJEkggs/7Las41GW3kOI9I0FbvaO/b1X4vW1T9Nqb/5dgHdvbBlCt4kJaRuyzOJP
         5DO5UZ4mgBvY0/bjKpTLrHD2ZT/64XlWo9QjLPheIFMQeFiXMeVDHb2T8Gj12+6ixTqi
         JCpYKfxf/H/dO6Iehr15B5nWCst6ZMA+J12yAIa9JygFJJNFZ22V/Fvf8sJbgyIZa92u
         3vXDVcm+fZTnZDGc6Osgee5Mxo83Hf/3/hhAazhj7e3hI24w4Z944ntBwybmg0bZtph9
         w1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQY7IsXlYzYdPvbtAuGQhW+vz7kmikxb6Hsl9qnqiJo=;
        b=N+CMimPgKqE6kQuioVPRfCKoLbvOfm6Hu0ld/Bx9NIFfMfnDvrvy+7pNyXSNgRJwlN
         9YODGbB17k3srbkwWLo8jaM79GHW+9VEulH9AKS/9zmUbCzn4UyGKaIp9KLUJCFFlMlK
         rNHjaJ+Eusy9mNbIuaHuLMmz88NF32feyJrKTQlSStfyUNbWyJAMjAzYp9QJkaSrHcMb
         bxarJFLy4X0TasLaS+cOYG244wYnYiEAMnymaZUrzr6OmAmt4r81k1ix1KHLXLBoCTJI
         9V8ffUWezZ/MmcsfLCIQAkVuLs7D98btjpi8w7XH1XaLy41ostsxuGGrfd37aMunSFWz
         vVHw==
X-Gm-Message-State: AAQBX9eRd85zTNTrGF9ts6zFJcjwOzxWNu6/BD/FMmtnnXUQZ3CH9XYv
	svYvnQ0YxbXQ+4s+1vcQn6R5mw==
X-Google-Smtp-Source: AKy350Z5wfhTkRydKKc5Ikh4OLcEW6DwobyPTf5WBp8sjWB/EwsebviKxYM7sCDYl+M9vs/GyS0S0w==
X-Received: by 2002:a05:6a20:4659:b0:db:9726:8e46 with SMTP id eb25-20020a056a20465900b000db97268e46mr2674124pzb.54.1680632601831;
        Tue, 04 Apr 2023 11:23:21 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:23:21 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 22/23] platform/surface: Disable for RISC-V
Date: Tue,  4 Apr 2023 23:50:36 +0530
Message-Id: <20230404182037.863533-23-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112322_265403_2B7EBD65 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Weili Qian <qianweili@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>, Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Nick Desaulniers <ndesaulniers@google.com>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="cp1252"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

V2l0aCBDT05GSUdfQUNQSSBlbmFibGVkIGZvciBSSVNDLVYsIHRoaXMgZHJpdmVyIGdldHMgZW5h
YmxlZAppbiBhbGxtb2Rjb25maWcgYnVpbGQuIEhvd2V2ZXIsIFJJU0MtViBkb2Vzbid0IHN1cHBv
cnQgc3ViLXdvcmQKYXRvbWljcyB3aGljaCBpcyB1c2VkIGJ5IHRoaXMgZHJpdmVyLiBEdWUgdG8g
dGhpcywgdGhlIGJ1aWxkIGZhaWxzCndpdGggYmVsb3cgZXJyb3IuCgpJbiBmdW5jdGlvbiDigJhz
c2hfc2VxX25leHTigJksCiAgICBpbmxpbmVkIGZyb20g4oCYc3NhbV9yZXF1ZXN0X3dyaXRlX2Rh
dGHigJkgYXQgZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvY29udHJvbGxlci5j
OjE0ODM6ODoKLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozOTk6NDU6IGVycm9y
OiBjYWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0XzMzNeKAmSBkZWNsYXJlZCB3aXRoIGF0
dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHIGZhaWxlZAogIDM5OSB8ICAgICAgICAgX2NvbXBpbGV0
aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5U
RVJfXykKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF4KLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6Nzg6NDU6IG5vdGU6IGluIGRlZmluaXRpb24g
b2YgbWFjcm8g4oCYdW5saWtlbHnigJkKICAgNzggfCAjIGRlZmluZSB1bmxpa2VseSh4KSAgICBf
X2J1aWx0aW5fZXhwZWN0KCEhKHgpLCAwKQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXgouLy4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5o
OjM4Nzo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX19jb21waWxldGltZV9hc3Nl
cnTigJkKICAzODcgfCAgICAgICAgIF9fY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNn
LCBwcmVmaXgsIHN1ZmZpeCkKICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+Ci4v
Li9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6Mzk5Ojk6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyDigJhfY29tcGlsZXRpbWVfYXNzZXJ04oCZCiAgMzk5IHwgICAgICAgICBfY29t
cGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9f
Q09VTlRFUl9fKQogICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUv
bGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhj
b21waWxldGltZV9hc3NlcnTigJkKICAgMzkgfCAjZGVmaW5lIEJVSUxEX0JVR19PTl9NU0coY29u
ZCwgbXNnKSBjb21waWxldGltZV9hc3NlcnQoIShjb25kKSwgbXNnKQogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUv
bGludXgvYnVpbGRfYnVnLmg6NTk6MjE6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhC
VUlMRF9CVUdfT05fTVNH4oCZCiAgIDU5IHwgI2RlZmluZSBCVUlMRF9CVUcoKSBCVUlMRF9CVUdf
T05fTVNHKDEsICJCVUlMRF9CVUcgZmFpbGVkIikKICAgICAgfCAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn4KLi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaDozMzU6
MTc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhCVUlMRF9CVUfigJkKICAzMzUgfCAg
ICAgICAgICAgICAgICAgQlVJTERfQlVHKCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCiAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgouL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oOjM0NDozMDogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvIOKAmF9fY21weGNoZ+KAmQogIDM0NCB8ICAgICAgICAgKF9fdHlwZW9mX18oKihwdHIp
KSkgX19jbXB4Y2hnKChwdHIpLCAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgvYXRv
bWljL2F0b21pYy1pbnN0cnVtZW50ZWQuaDoxOTE2Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDigJhhcmNoX2NtcHhjaGfigJkKIDE5MTYgfCAgICAgICAgIGFyY2hfY21weGNoZyhfX2Fp
X3B0ciwgX19WQV9BUkdTX18pOyBcCiAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn4KZHJpdmVy
cy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvY29udHJvbGxlci5jOjYxOjMyOiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8g4oCYY21weGNoZ+KAmQogICA2MSB8ICAgICAgICAgd2hpbGUg
KHVubGlrZWx5KChyZXQgPSBjbXB4Y2hnKCZjLT52YWx1ZSwgb2xkLCBuZXcpKSAhPSBvbGQpKSB7
CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KClNvLCBkaXNh
YmxlIHRoaXMgZHJpdmVyIGZvciBSSVNDLVYgZXZlbiB3aGVuIEFDUEkgaXMgZW5hYmxlZCBmb3Ig
bm93LgoKU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+
Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2NvbmZpZyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9yL0tjb25maWcgYi9kcml2ZXJz
L3BsYXRmb3JtL3N1cmZhY2UvYWdncmVnYXRvci9LY29uZmlnCmluZGV4IGMxMTRmOWRkNWZlMS4u
ODhhZmMzOGZmZGM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2UvYWdncmVn
YXRvci9LY29uZmlnCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9yL0tj
b25maWcKQEAgLTQsNyArNCw3IEBACiBtZW51Y29uZmlnIFNVUkZBQ0VfQUdHUkVHQVRPUgogCXRy
aXN0YXRlICJNaWNyb3NvZnQgU3VyZmFjZSBTeXN0ZW0gQWdncmVnYXRvciBNb2R1bGUgU3Vic3lz
dGVtIGFuZCBEcml2ZXJzIgogCWRlcGVuZHMgb24gU0VSSUFMX0RFVl9CVVMKLQlkZXBlbmRzIG9u
IEFDUEkKKwlkZXBlbmRzIG9uIEFDUEkgJiYgIVJJU0NWCiAJc2VsZWN0IENSQ19DQ0lUVAogCWhl
bHAKIAkgIFRoZSBTdXJmYWNlIFN5c3RlbSBBZ2dyZWdhdG9yIE1vZHVsZSAoU3VyZmFjZSBTQU0g
b3IgU1NBTSkgaXMgYW4KLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
