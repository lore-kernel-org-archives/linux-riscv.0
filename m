Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D85C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B7mz16FRi3NIf6PZAo0VyhqIxgQ9Mm7RQ4uNkvxUGK8=; b=pQGbEBlwEgNwJB
	X03IuDjQc1prRnN9g2xZkdrETsXsO5on9RdcrwWubDsY761bEOt2IWo3VuSpUAKgQzshGgPOvdLO6
	vUfcQZQ/wuwtJYPbDQl2egoLpSF+KMFv/e5f+Btr9CD2WAokd4Qnj3VKTnF/gZu1tDyNdT+Kd1vrG
	EF7QL7qPfI+LpylhrmcPF8aswhtRWRI0CaNtEOc4BDGkTt+INGIqy/ucLzQlogzUkGzQ5w9e5pLi5
	GF7aRNNs9sa0nO0mqB9FPtnSV2WHBH8w9YPaLtnHumvLmqQ4t+emoc/aMSdN9GcQM5++igQ3eBvKn
	xow2bj7dln8JLma3EqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLr-00000003Fu3-36Ex;
	Mon, 10 Mar 2025 15:47:35 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treoa-000000037VU-2SoX
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:13 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2232aead377so13780795ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619592; x=1742224392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8ehbEB4G2M6rMKgF63InF+3qW6jpnoI0lm2nt0Msdk=;
        b=WRJ0bn5o7dB8+ETWYOTd5YzUgD/f8JPkT3cgJeFguST1W5X6kPDFd0AqxTSz/SmbNF
         m1U/+TL1QPNM03w5Hgr6fkVJFGIEgdXwrKxVpmFGzcoGTb37E2hgEsy6QVrEoI+4rZxM
         l+TQKNTkBnhOS1SyPGDoc80tSC6gPqU4aJobl2rigCw/GHPfZXeuqg68XHgmfe+qrRfF
         0E3TrKSelBzkVoNNwjYKZsjr4W1psnIlAolzrLEODI2Yu7QEmE40g1iii71BifRdteKE
         Qsty3a7JCQt5uRNwd8YnyU5Yo2RVeRchnKILFhjapEVpcw96qSimJ0nZXYl0f+OMvcJo
         obTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619592; x=1742224392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8ehbEB4G2M6rMKgF63InF+3qW6jpnoI0lm2nt0Msdk=;
        b=B+KjwJxAVPRBenVVf6JHIWRdNB9V1R7usgxydCUED80VB6Gy8nndm+wMFQz5Of4c1j
         BA5/4snI0drK6ec5wbDYal9YUbpkTwvehkTfttLQPeZEtQL6CCgZsRHb50NVer4C6rIh
         Wdv4431C6k3CTNyOIE89hnIFqD5ZpOtL4LlM9Ro6S1NapBPgHo8p4QaHxV7PM1TATJPk
         u2EQFOFLfM2m+s2PgGHSm+/p85X37yNjDA+Lw+qGyRuqfeFlY6QOyWjEcPDi50GjgT36
         90CGxUgpcw9L1ibBeKOQXzndvTJVEoIVHhNPuE4l9Wxm/3vhDlldMhHGzvC691gzsaXx
         XFjw==
X-Forwarded-Encrypted: i=1; AJvYcCUEJ7y7OvYqzxTbuffJwkWRUnS/2cLOdPxKlKCenh5g/zgW2oUO7EAih2XdguoMJaWP5VFWeg06w2PJFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPXzRJ9o2I9uFQ+A4B9b/SAF+MYoqCq4ZcGdwrIrmrAo2jsp/u
	6FgYcZP3f4E+WWWQAUq3i1x+jNvrb0iYqM37TcD6ZnbYiXr/uCWMH5T0/GHOTEE=
X-Gm-Gg: ASbGncvKKK4bml9gc7ZYZfpxEezVPMLGRR3DIYf/3uXT/1H2T9nVpSdvK9qvLpH7P0l
	y1S7jyhxuOQT8EG05Jsiv065j7IypOvBf2OlIE9jZ85EHYlcsz9oFo0qT4P9U7PFAewSWLi/O+h
	G1v5z3cj/vzJJ1U/xaj6ae6mNiI5YGFDfrkQDdC2XbNkhivR6B9y4aAWC+EFWJbneAGK7RIj3rh
	Tva/uYzdQh7ojyCf2uTImRgogErLVTTZ4TO0cO1+01qkoY0vg8y7/CQQeVj7c5g0Q2vj2zCu7DH
	u5JTXB663MRAPXjTX7twokaYb8xM31Lgp+qOiSdZECC0SQ==
X-Google-Smtp-Source: AGHT+IHx06QKyqqktCp5VtJUo5IN0vcBDSsl9L3/ywFUKF9aCYPEgmbUbCQl4AVArEAbrJmDgZ6oCQ==
X-Received: by 2002:a17:903:2405:b0:224:24d5:f20a with SMTP id d9443c01a7336-22428bfdba7mr268684275ad.48.1741619592004;
        Mon, 10 Mar 2025 08:13:12 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:11 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 03/17] riscv: sbi: add SBI FWFT extension calls
Date: Mon, 10 Mar 2025 16:12:10 +0100
Message-ID: <20250310151229.2365992-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081312_627255_0F539532 
X-CRM114-Status: GOOD (  13.59  )
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
Z2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYyB8IDMwICsrKysr
KysrKysrKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCAyNTY5MTBkYjEzMDcuLmFmOGUyMTk5ZTMy
ZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvc2JpLmMKQEAgLTI5OSw5ICsyOTksMTkgQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2Vf
djAyKGludCBmaWQsIGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaywKIAlyZXR1cm4gMDsK
IH0KIAorc3RhdGljIGJvb2wgc2JpX2Z3ZnRfc3VwcG9ydGVkOworCiBpbnQgc2JpX2Z3ZnRfZ2V0
KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSkKIHsKLQlyZXR1cm4gLUVPUE5PVFNV
UFA7CisJc3RydWN0IHNiaXJldCByZXQ7CisKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKKwkJ
cmV0dXJuIC1FT1BOT1RTVVBQOworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJ
X0VYVF9GV0ZUX0dFVCwKKwkJCWZlYXR1cmUsIDAsIDAsIDAsIDAsIDApOworCisJcmV0dXJuIHNi
aV9lcnJfbWFwX2xpbnV4X2Vycm5vKHJldC5lcnJvcik7CiB9CiAKIC8qKgpAQCAtMzE0LDcgKzMy
NCwxNSBAQCBpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1
ZSkKICAqLwogaW50IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1
ZSwgdW5zaWduZWQgbG9uZyBmbGFncykKIHsKLQlyZXR1cm4gLUVPUE5PVFNVUFA7CisJc3RydWN0
IHNiaXJldCByZXQ7CisKKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKKwkJcmV0dXJuIC1FT1BO
T1RTVVBQOworCisJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUX1NF
VCwKKwkJCWZlYXR1cmUsIHZhbHVlLCBmbGFncywgMCwgMCwgMCk7CisKKwlyZXR1cm4gc2JpX2Vy
cl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKIH0KIAogc3RydWN0IGZ3ZnRfc2V0X3JlcSB7
CkBAIC0zODksNiArNDA3LDkgQEAgc3RhdGljIGludCBzYmlfZndmdF9mZWF0dXJlX2xvY2FsX3Nl
dCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwKIGludCBzYmlfZndmdF9hbGxfY3B1
c19zZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgdmFsdWUsIHVuc2lnbmVkIGxvbmcgZmxh
Z3MsCiAJCQkgIGJvb2wgcmV2ZXJ0X29uX2ZhaWwpCiB7CisJaWYgKCFzYmlfZndmdF9zdXBwb3J0
ZWQpCisJCXJldHVybiAtRU9QTk9UU1VQUDsKKwogCWlmIChmZWF0dXJlICYgU0JJX0ZXRlRfR0xP
QkFMX0ZFQVRVUkVfQklUKQogCQlyZXR1cm4gc2JpX2Z3ZnRfc2V0KGZlYXR1cmUsIHZhbHVlLCBm
bGFncyk7CiAKQEAgLTcxOSw2ICs3NDAsMTEgQEAgdm9pZCBfX2luaXQgc2JpX2luaXQodm9pZCkK
IAkJCXByX2luZm8oIlNCSSBEQkNOIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJCQlzYmlfZGVi
dWdfY29uc29sZV9hdmFpbGFibGUgPSB0cnVlOwogCQl9CisJCWlmICgoc2JpX3NwZWNfdmVyc2lv
biA+PSBzYmlfbWtfdmVyc2lvbigyLCAwKSkgJiYKKwkJICAgIChzYmlfcHJvYmVfZXh0ZW5zaW9u
KFNCSV9FWFRfRldGVCkgPiAwKSkgeworCQkJcHJfaW5mbygiU0JJIEZXRlQgZXh0ZW5zaW9uIGRl
dGVjdGVkXG4iKTsKKwkJCXNiaV9md2Z0X3N1cHBvcnRlZCA9IHRydWU7CisJCX0KIAl9IGVsc2Ug
ewogCQlfX3NiaV9zZXRfdGltZXIgPSBfX3NiaV9zZXRfdGltZXJfdjAxOwogCQlfX3NiaV9zZW5k
X2lwaQk9IF9fc2JpX3NlbmRfaXBpX3YwMTsKLS0gCjIuNDcuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
