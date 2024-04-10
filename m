Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D045CD1296
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8Lmg5WwYDDTLAApY8lV6vyY6p6Pcb8c7uYWE+LJ/ZA=; b=NNtydRP5STufhV
	A1mF/7Ia++CWHd+QJm+QBv+QV7PYQHgUJVhuq2+T53k/ZYDNhtxrtiZgVv4o0/FOJvRpwRumPP5GM
	xHvgzScRsT7O1jQkfUA8MghONnNbYcSLwBoo/FhUJVHhl6Qsy7OonSYgkSjpw3DRmI/NgwxHoxndu
	mDxtdUYdcnZOMBd/6NnY8SyFQMD7wKAImqr6DpQrValgPTCw2MNR+EK5SshhUm4KpVe3XzJoOj2SJ
	hgIz7ak7CauzYm7KJRotAZOynf06cxHkM7hJNZlJQWdQAO3nSWeVUBpdr93xX7/+Ob6+g/s+FlLCp
	LDX2oKOJkT+nQu1mDdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzD-0000000639A-2WOb;
	Wed, 10 Apr 2024 09:11:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTz8-0000000632M-2sha
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-346407b8c9aso516529f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740272; x=1713345072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7nj0hrAb/ZTca31LKYsuyiwQEp4tEr8mY0ChFA9P/c=;
        b=sTem+4SXrKsjiy0WdyHNpMfx+EDb5vUOgQlGJu32t2KEorPEGzxwQAOz4vdL4tNsx2
         jzgfdzgIO3khw4V4nIP/d6UUio7g9h3FI5dKKkVn8mhq3PWqYw6VLkvvSh2Np1JWCk/d
         dFR/0pvOABtSIKdU9mlnHEgGzGRH+4mpALYW15ep/V3J/xfXjnM8qRq09F0hvBD2BZHP
         1TmjnO2pp2eUNioQUcTB6tlEzOi+klheFJEXhTVmBLjuudLyXjHse9DcVNhZySMK+zJO
         M3Eh0GDz0TP6TckjZrSVL/srjFZQxxC3fOyp6IanC0uwkle5/DPrkXHH8uKF/nuXrCMP
         UcTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740272; x=1713345072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7nj0hrAb/ZTca31LKYsuyiwQEp4tEr8mY0ChFA9P/c=;
        b=g1z4dEKFRsfZP8AP9WSBnaWb71LfZqxSHsCZl505Onu4K7fuiDYvD5ahN9P5T21JT3
         MGjnRAiWVkaziLHmg5gVv/lFXUen5zqSJ1xeFsTIY48gHf2s4bYwY7U4ge53Fc7Lyd6I
         Qd0pXxELO3EAlXPsZJLHcIC6+PGNSpDcofcCEtwBg7fublUhlUXNPLDc/s56SmQC3Kht
         8n6D0WSERce77pHT+jYdhLeD1AZtuDx3kBwzN8P7mz0cXonC+6a9bp4GzufvSNRibw5I
         VUX52TJ+t3/IWEzmR0JEFnEq2UrIzcJQwhaN0MN08eURF31C/RM7WtmjJME75C/crh/D
         sRUg==
X-Forwarded-Encrypted: i=1; AJvYcCWYM3UYoC0raVoIsSHh1KthSQUd5FLFPCnil95oCRhNzqOYu6QtAqdlFQ6O2i8QSS2yThB9ylNXQLTxfptUKxE8dkdAgxNDDbDEbu9bZ9tu
X-Gm-Message-State: AOJu0Yxl0ZjJbN1oG+iLi6Vs7erYu7j+Cv1DyNrBIerPjuTENdHijd4M
	Uhk2D32kvuLXdH9LiNWPU00qyLnAyXeeMNGh43crnI4yha4fkOOU2RGLBHFbaks=
X-Google-Smtp-Source: AGHT+IEC8u4594PjRvl4MC3WnGzfb1LV/AIXMlfgTp70rfcnNUzoxfb7eYEGhKXPjIrc4Pbt7pSXrA==
X-Received: by 2002:a5d:4a4e:0:b0:343:c3b0:ee39 with SMTP id v14-20020a5d4a4e000000b00343c3b0ee39mr1259238wrs.5.1712740272056;
        Wed, 10 Apr 2024 02:11:12 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:11 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 01/10] dt-bindings: riscv: add Zca, Zcf, Zcd and Zcb ISA extension description
Date: Wed, 10 Apr 2024 11:10:54 +0200
Message-ID: <20240410091106.749233-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021114_777838_D98171FA 
X-CRM114-Status: UNSURE (   9.79  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciBaY2EsIFpjZiwgWmNkIGFuZCBaY2IgZXh0ZW5zaW9ucyB3aGlj
aCBhcmUgcGFydCB0aGUKWmMqIHN0YW5kYXJkIGV4dGVuc2lvbnMgZm9yIGNvZGUgc2l6ZSByZWR1
Y3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5j
b20+Ci0tLQogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwg
MzIgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbAppbmRleCA2MTYzNzAzMThhNjYuLjUxNmY1N2JkZmVlYiAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFt
bAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9u
cy55YW1sCkBAIC0yMjAsNiArMjIwLDM4IEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBpbnN0
cnVjdGlvbnMgYXMgcmF0aWZpZWQgYXQgY29tbWl0IDZkMzM5MTkgKCJNZXJnZSBwdWxsIHJlcXVl
c3QgIzE1OAogICAgICAgICAgICAgZnJvbSBoaXJvb2loL2NsbXVsLWZpeC1sb29wLWVuZC1jb25k
aXRpb24iKSBvZiByaXNjdi1iaXRtYW5pcC4KIAorICAgICAgICAtIGNvbnN0OiB6Y2EKKyAgICAg
ICAgICBkZXNjcmlwdGlvbjogfAorICAgICAgICAgICAgVGhlIFpjYSBleHRlbnNpb24gcGFydCBv
ZiBaYyogc3RhbmRhcmQgZXh0ZW5zaW9ucyBmb3IgY29kZSBzaXplCisgICAgICAgICAgICByZWR1
Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNvbW1pdCA4YmUzNDE5YzFjMCAoIlpjZiBkb2Vzbid0IGV4
aXN0IG9uCisgICAgICAgICAgICBSVjY0IGFzIGl0IGNvbnRhaW5zIG5vIGluc3RydWN0aW9ucyIp
IG9mIHJpc2N2LWNvZGUtc2l6ZS1yZWR1Y3Rpb24sCisgICAgICAgICAgICBtZXJnZWQgaW4gdGhl
IHJpc2N2LWlzYS1tYW51YWwgYnkgY29tbWl0IGRiYzc5Y2YyOGEyICgiSW5pdGlhbCBzZWVkCisg
ICAgICAgICAgICBvZiB6Yy5hZG9jIHRvIHNyYyB0cmVlLiIpLgorCisgICAgICAgIC0gY29uc3Q6
IHpjYgorICAgICAgICAgIGRlc2NyaXB0aW9uOiB8CisgICAgICAgICAgICBUaGUgWmNiIGV4dGVu
c2lvbiBwYXJ0IG9mIFpjKiBzdGFuZGFyZCBleHRlbnNpb25zIGZvciBjb2RlIHNpemUKKyAgICAg
ICAgICAgIHJlZHVjdGlvbiwgYXMgcmF0aWZpZWQgaW4gY29tbWl0IDhiZTM0MTljMWMwICgiWmNm
IGRvZXNuJ3QgZXhpc3Qgb24KKyAgICAgICAgICAgIFJWNjQgYXMgaXQgY29udGFpbnMgbm8gaW5z
dHJ1Y3Rpb25zIikgb2YgcmlzY3YtY29kZS1zaXplLXJlZHVjdGlvbiwKKyAgICAgICAgICAgIG1l
cmdlZCBpbiB0aGUgcmlzY3YtaXNhLW1hbnVhbCBieSBjb21taXQgZGJjNzljZjI4YTIgKCJJbml0
aWFsIHNlZWQKKyAgICAgICAgICAgIG9mIHpjLmFkb2MgdG8gc3JjIHRyZWUuIikuCisKKyAgICAg
ICAgLSBjb25zdDogemNkCisgICAgICAgICAgZGVzY3JpcHRpb246IHwKKyAgICAgICAgICAgIFRo
ZSBaY2QgZXh0ZW5zaW9uIHBhcnQgb2YgWmMqIHN0YW5kYXJkIGV4dGVuc2lvbnMgZm9yIGNvZGUg
c2l6ZQorICAgICAgICAgICAgcmVkdWN0aW9uLCBhcyByYXRpZmllZCBpbiBjb21taXQgOGJlMzQx
OWMxYzAgKCJaY2YgZG9lc24ndCBleGlzdCBvbgorICAgICAgICAgICAgUlY2NCBhcyBpdCBjb250
YWlucyBubyBpbnN0cnVjdGlvbnMiKSBvZiByaXNjdi1jb2RlLXNpemUtcmVkdWN0aW9uLAorICAg
ICAgICAgICAgbWVyZ2VkIGluIHRoZSByaXNjdi1pc2EtbWFudWFsIGJ5IGNvbW1pdCBkYmM3OWNm
MjhhMiAoIkluaXRpYWwgc2VlZAorICAgICAgICAgICAgb2YgemMuYWRvYyB0byBzcmMgdHJlZS4i
KS4KKworICAgICAgICAtIGNvbnN0OiB6Y2YKKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAorICAg
ICAgICAgICAgVGhlIFpjZiBleHRlbnNpb24gcGFydCBvZiBaYyogc3RhbmRhcmQgZXh0ZW5zaW9u
cyBmb3IgY29kZSBzaXplCisgICAgICAgICAgICByZWR1Y3Rpb24sIGFzIHJhdGlmaWVkIGluIGNv
bW1pdCA4YmUzNDE5YzFjMCAoIlpjZiBkb2Vzbid0IGV4aXN0IG9uCisgICAgICAgICAgICBSVjY0
IGFzIGl0IGNvbnRhaW5zIG5vIGluc3RydWN0aW9ucyIpIG9mIHJpc2N2LWNvZGUtc2l6ZS1yZWR1
Y3Rpb24sCisgICAgICAgICAgICBtZXJnZWQgaW4gdGhlIHJpc2N2LWlzYS1tYW51YWwgYnkgY29t
bWl0IGRiYzc5Y2YyOGEyICgiSW5pdGlhbCBzZWVkCisgICAgICAgICAgICBvZiB6Yy5hZG9jIHRv
IHNyYyB0cmVlLiIpLgorCiAgICAgICAgIC0gY29uc3Q6IHpmYQogICAgICAgICAgIGRlc2NyaXB0
aW9uOgogICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpmYSBleHRlbnNpb24gZm9yIGFkZGl0aW9u
YWwgZmxvYXRpbmcgcG9pbnQKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
