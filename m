Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988F4C3DA6D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/mMTjrD4MxSwZoBpddAqxH0WQy8oAlH4oYaDYijlHs=; b=iKdLl9jc84pFs0
	eDtTwNU6GsSnJnSQEdSGxtKWj2lqpzrDqNI2C7gI4dEuxl31O7b4vmyvcM/q+V6I4aDNoPhItKgwu
	9NpDM8UVkYE+kNmvtJsx3cLD3iL+k2F2pHQkyzvcuKFP+otFfJT3ZcokVSFgsXr4jocwK7b+xNS5k
	MhxviSdvLK8JdLOjBglq16m6woxUgx0Y5lhWi+sLi437cvXZ72KGVsoI4lPLp6UMzGNdmtyTIihem
	/wNM5HrmGlZyCE8MZsyNRXvb3eSzLePMpiGlAsky+eVGgJD6P8ZLNcwUEueud/OWSpl0tNV5l2jXF
	7Q0J85hNAMKodZ+T50GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPX5-00000003ZYt-34Ow;
	Fri, 23 May 2025 10:21:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPX4-00000003ZXJ-0REV
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 May 2025 10:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=; b=JGW9gHle+y+TQ0Pi87Cb1qX0VI
	/bfzovosQXaLh1+tFJSjtqZRlF0MAci2BWpCeH5wgJHgC4K5DxFAUdoZd5FCtmBgtSMpcOhkcEcz4
	MnurOBs/e4iQHG7O4D+738cWO1pI5Nd3GVS1iVg/nl5JtJsaeWqaquOXCcWXpPf77PLQOYfD1mRGT
	JVimHCkFq7db/+tAc5c+HAf2c9QrpuFSpSDiltF6fUYQThzHS2E4R0bj5ThRzKxGegbztMaPtYOd4
	6oK6L4lYpeJFL1NqISrtMXr1fW9/ht9PQn7XZ+gIWkZWhVi1aDyIAjdMSnf8ckfxCur0xFpHv6qmM
	Ym5rnfaQ==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIPX0-00000001FxC-3AId
	for linux-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:21:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7399838db7fso691904b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 May 2025 03:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995696; x=1748600496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=RHZ/oSdHOc/56+cTWaMp1d72nw8cguuWg56g21AyKZLw/+q9WZVQpKeljee9x3N6nI
         S5XDqFRH12+vJq0eA688awxOuSo5SgeeDlj7L68lwdvE9jWI+rCkFjnJtcAAADTYjrKA
         QEX+AVtvXbpZNBGcAa2va5eWyHnsuUI5zou/IJNpJutw4CFPzYky8ke/nD5eKdgjZbPa
         nhnN5aJwFaesyv+CPTXoa2PUkppWRLmc5ORPEQBwjFJlUeT0ExWfPfR668HEOtBJD/ou
         Eos8ne3D/GTStGmAuG6ZtLDHBzP7EWLWKLf6q8sTx7Ai0TYL2eqYxOnXpO6TwHMOv0qm
         +jXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995696; x=1748600496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKzeirrOKR4aa1/jaJ0+BQzqdgTSTiQsfjIovf/XYis=;
        b=nYtu+yAXv7vmn3GtLyfQYhIY4+NtVXhmJ7MJYmdvGzXc9gQzTsXzC3H8Gz+7rA6S/o
         7167sTC6mvcK1WLZwVo9pO5XeHKjbsZe5bDNvYTfB5jBk9TIszvlB4UZatrOyHhZXvl8
         7vOLgtIx8pNvF9rKvQp5DxafZX1OaAx+sfsJ/5QyfJxwUkIa5M3PxxL55MNU0yBZJoFp
         d1nhVMpkKHjFLMwBr0lnp0lBBLqrDngUwnn8PZIsDRM06MZWMiiL47CRQvxIdEHwKHKK
         W/UuWNPmBRKLQle9O0AP6kgNVlPvytrkSxRl/L5jFwn5TDDleUWqW9s6llsWNmkNRzl1
         mnnA==
X-Forwarded-Encrypted: i=1; AJvYcCXq48gCNE/zeriXpiLjThtg9eZteHBhZIYKC8qlnHNP/5gzRM63U39xvgX1R4wsV2XKF4/27i6JVzYYVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNhw3kWJpWeEr9c4fde5AWKUYtH+T55VvraaTHrEnhQo9EnG/K
	2D3aJgrV+vPEPGDIXctyM0Ivez868uXRLVz1UrvvyiO60QwgZ632LDdtH0VUBFFoFRE=
X-Gm-Gg: ASbGncspsNfoKdEy25jptmlvcUSwzcjalGGGXigpd+17SrtVRfAdhqRbZGnsgFFRttT
	WPb5lp2vYKC/U9ZQiU9WoW67BcPHhP4HW07ZeD42GTs2tbfdTwYU5rx7NAKm+RLBEkhKDqjJ5Sf
	u6NN2/V0EXjMfpRhi+zDG6M8H5U5Eu4qxm2D+OkwCYoABzYpe2iVrrP2H1+VPGyZlfyJIjPkXLJ
	dTjtv+alCoJeebz9daUbXrvyTxd6VM1v5reaIBv76CgreoFo7s/cU8IMMtdSfPjNV5kEXIt24aP
	alPAfuoX5uTQGFO0gXNRXY1gxx0mHOh0JswBTiprVzXZ+wr8aU1f
X-Google-Smtp-Source: AGHT+IFz+/NIX8RZ4CpGdqDvwRIYbmRrE9EGaVbHiy5c0a/czfZB0pteCG9ARelWxW3OVz8OgvVZvw==
X-Received: by 2002:a05:6a00:39a2:b0:736:b400:b58f with SMTP id d2e1a72fcca58-745eccdec15mr4787201b3a.0.1747995696348;
        Fri, 23 May 2025 03:21:36 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:21:35 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v8 05/14] riscv: sbi: add SBI FWFT extension calls
Date: Fri, 23 May 2025 12:19:22 +0200
Message-ID: <20250523101932.1594077-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_112138_865995_C193ADD9 
X-CRM114-Status: GOOD (  13.47  )
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

QWRkIEZXRlQgZXh0ZW5zaW9uIGNhbGxzLiBUaGlzIHdpbGwgYmUgcmF0aWZpZWQgaW4gU0JJIFYz
LjAgaGVuY2UsIGl0IGlzCnByb3ZpZGVkIGFzIGEgc2VwYXJhdGUgY29tbWl0IHRoYXQgY2FuIGJl
IGxlZnQgb3V0IGlmIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xl
Z2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRh
bmFtaWNyby5jb20+ClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNv
bT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDIwICsrKysrKysrKysrKysrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMK
aW5kZXggODE4ZWZhZmRjOGU5Li41MzgzNmE5MjM1ZTMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NiaS5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCkBAIC0yOTksNiArMjk5
LDggQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQsIGNvbnN0IHN0cnVjdCBj
cHVtYXNrICpjcHVfbWFzaywKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGJvb2wgc2JpX2Z3ZnRf
c3VwcG9ydGVkOworCiBzdHJ1Y3QgZndmdF9zZXRfcmVxIHsKIAl1MzIgZmVhdHVyZTsKIAl1bnNp
Z25lZCBsb25nIHZhbHVlOwpAQCAtMzI2LDcgKzMyOCwxNSBAQCBzdGF0aWMgdm9pZCBjcHVfc2Jp
X2Z3ZnRfc2V0KHZvaWQgKmFyZykKICAqLwogaW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwg
dW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKIHsKLQlyZXR1cm4gLUVP
UE5PVFNVUFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRl
ZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldG
VCwgU0JJX0VYVF9GV0ZUX1NFVCwKKwkJCWZlYXR1cmUsIHZhbHVlLCBmbGFncywgMCwgMCwgMCk7
CisKKwlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKIH0KIAogLyoq
CkBAIC0zNDgsNiArMzU4LDkgQEAgaW50IHNiaV9md2Z0X3NldF9jcHVtYXNrKGNvbnN0IGNwdW1h
c2tfdCAqbWFzaywgdTMyIGZlYXR1cmUsCiAJCS5lcnJvciA9IEFUT01JQ19JTklUKDApLAogCX07
CiAKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BOT1RTVVBQOworCiAJ
aWYgKGZlYXR1cmUgJiBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCiAJCXJldHVybiAtRUlO
VkFMOwogCkBAIC02NzksNiArNjkyLDExIEBAIHZvaWQgX19pbml0IHNiaV9pbml0KHZvaWQpCiAJ
CQlwcl9pbmZvKCJTQkkgREJDTiBleHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwogCQkJc2JpX2RlYnVn
X2NvbnNvbGVfYXZhaWxhYmxlID0gdHJ1ZTsKIAkJfQorCQlpZiAoc2JpX3NwZWNfdmVyc2lvbiA+
PSBzYmlfbWtfdmVyc2lvbigzLCAwKSAmJgorCQkgICAgc2JpX3Byb2JlX2V4dGVuc2lvbihTQklf
RVhUX0ZXRlQpKSB7CisJCQlwcl9pbmZvKCJTQkkgRldGVCBleHRlbnNpb24gZGV0ZWN0ZWRcbiIp
OworCQkJc2JpX2Z3ZnRfc3VwcG9ydGVkID0gdHJ1ZTsKKwkJfQogCX0gZWxzZSB7CiAJCV9fc2Jp
X3NldF90aW1lciA9IF9fc2JpX3NldF90aW1lcl92MDE7CiAJCV9fc2JpX3NlbmRfaXBpCT0gX19z
Ymlfc2VuZF9pcGlfdjAxOwotLSAKMi40OS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
