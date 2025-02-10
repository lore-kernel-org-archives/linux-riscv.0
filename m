Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870F5C0219E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 00:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xiVpS1UW8E0H1ZjdVQ4S7NN5YMwSv88ePu0cw8LIBg=; b=1q9AgdSK9Zu2Ta
	aoexYsk7jl5OlQ8fxsuMdsUrLESZM+1yzuCcxusNArq4nwwyg2nY4gjtBGYGxf/GCyN4Xerr8oeOo
	AF42ZfLoKHniJxp047w3KT5YVJFz5lzGQvTnBm/4cjWKoB02yUMYi+ZA3hG+U7R/Cj4u25FrU8di5
	VwffO+V4iqFD/C20l4zP6yTxLbYuAZEoAnK49jwKsjlCKn4gjaw8qQb4DiBCxAOO6axu4PkOjDkqS
	G+Uq3xuyn4KZSCOqGP9KZyCnOT6qiH3G0c7h0Tc01wsRNDouORhGO5USyeiH9NV1rRONIhb1wTu+J
	T2ungW1OcDlYmnqOA36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdrX-00000001w0t-32PI;
	Tue, 11 Feb 2025 00:10:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS9-00000001VWR-05TB
	for linux-riscv@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:36:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=19zTUPAue8uF+l31WbsHm7jesitbh6CalqtCN/NDhL4=; b=I3dHZYzX2Ii2iyjSG/xNI89Esr
	SK1fPb7QV9ETwI1oc8/Pmi0e4/3bS3y528yy8/gXxXTeyo4Covi0y+7Fgm62Ka9zXO7+3hnANE34k
	bcpwVjym+iJ9ZngNu5IXV83UWL7rR9L+dgSwwHXuJ0YRydJysBzKyR9X5xS5RDzuBY8q/R7g3kXrB
	GgAEDuEGCVAwsXfWCNj87vAhlCyOI2QSQjIwwXySwMrlQiNWFz3we+ty5luvGvqnh2alTnZMbD5f2
	geMeZ1cZTTWzfzow40Fdh4tAJ55nY11xfQ+pdbTvQokMcf+euTaaXBc/8ZSIwdKsukE5rYmsq0ysH
	YKzHc0Gg==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbS0-00000000IAf-1ckA
	for linux-riscv@lists.infradead.org;
	Mon, 10 Feb 2025 21:36:24 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso1442428f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 13:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223375; x=1739828175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19zTUPAue8uF+l31WbsHm7jesitbh6CalqtCN/NDhL4=;
        b=HNk8DocKMuw/W0xB8dDKanuI3claiKI4wT8fJ2GoPzZ4+vs+NDY4+BPxN9tMD2LarW
         cWTW9j71YKPJjDRA1ENoIrvboPex5Mnu1znPUyL/NZNox/5aZoxoysiKowhmc2gBp7O3
         ZFxFqWoOhtPU9HZyBMDmgyeA8829Mv/0469iSdxsunkAiVCVwzematUXtewMrmUoh3kK
         fmtkusKS50WoaTnO6Dyzwz4T4WLlhow4zAcIboALRVGUCVflzYroDkuSSUBMaDjYtVdH
         5lvyKVELw9h8KYXg3sq3/VENqG/9CEH4rBN3H5A6ClYPY1ZrVEdhEKa5iEcCZZnWWEbj
         RzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223375; x=1739828175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19zTUPAue8uF+l31WbsHm7jesitbh6CalqtCN/NDhL4=;
        b=r8DNK14cBMIaAbQkfv16Orb3fjr9cyr19ZOn9FZLK6pba+1E46t0daIjdxYddUoIiE
         QWWv30cHK5drUDZzBEzdILpxllTDdxCxzux9tS/r/4ejTrQ2cWvSA4vvzeq+riG2A1kV
         9EPHBe15WxXn4Lg7yoXG7wyLxeNOPCEpeFX36WPW7yP6WoSkvRNXKOAIWf0300EPmFW0
         eM932al4B4Zbmmy4ItnFB8uVbz+CfWEA0/WREXVKLKHk79A2vrW8tYUwM9+Ue9bmn6bi
         O+ovLlZn1aDQi3/Q0ANkifs2v7nwj0D6MtQ/bcKKLTMxfDpdqyxSlJ6sJn/h+tQTuTxt
         eISg==
X-Forwarded-Encrypted: i=1; AJvYcCXbD+GTlbyIPd2n/n+R9xejwQcU8dlToAIiTOI5I9571SE+hSwXHILp8mESuFTbEHi6A1weskRrB+bcsw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWcOCA3jASGCB5ITjvqPtrfbMFRwJarNmzWY7kcD8nBWIFU6s6
	PO+e2oy1Vm3zAr0TVMknuJJFhbuyD47RZqjc9E/8Gpm5pqyTtcbyOVS8EXBPzy8=
X-Gm-Gg: ASbGncsNTyVBQugAkTHLz9QOG6OLqOm+lsZNg4vbYVHitFSGb0tDq7n3QfyiStHYtkM
	tJZaUd7g8Az9TNk3w2C6pBQ9hlhs3f4VXgGgAxatSPjQPzTtlES/Yyb1Kmz8fQXDcNUcJAC9ukJ
	79Q2L+oikTYb2rTd5ITZbx73bihXKfsy0ahohn1WtxiKPQW1MgYy3pCbS3nZC7UA5DabIh1NEY1
	P+4RET58GdJIzOtL/oSSkMutj04PGVMTDYmrMlz/acmdf9UdPe08tuMGSLFk+hJjjRjjLcgPe0N
	5aogJpl6RiBiRxLO
X-Google-Smtp-Source: AGHT+IH8mk3UTikqJq637e5ac58oAB2cwKutxDJwkgs3YdoxbObjCQef1GMenNM8qJokTGgudOE/eQ==
X-Received: by 2002:a5d:648d:0:b0:38d:d969:39b0 with SMTP id ffacd0b85a97d-38dd9693afbmr6558028f8f.2.1739223375424;
        Mon, 10 Feb 2025 13:36:15 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:14 -0800 (PST)
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
Subject: [PATCH v2 09/15] riscv: misaligned: use get_user() instead of __get_user()
Date: Mon, 10 Feb 2025 22:35:42 +0100
Message-ID: <20250210213549.1867704-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_213622_511213_36A90607 
X-CRM114-Status: GOOD (  12.38  )
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

Tm93IHRoYXQgd2UgY2FuIHNhZmVseSBoYW5kbGUgdXNlciBtZW1vcnkgYWNjZXNzZXMgd2hpbGUg
aW4gdGhlCm1pc2FsaWduZWQgYWNjZXNzIGhhbmRsZXJzLCB1c2UgZ2V0X3VzZXIoKSBpbnN0ZWFk
IG9mIF9fZ2V0X3VzZXIoKSB0bwpoYXZlIHVzZXIgbWVtb3J5IGFjY2VzcyBjaGVja3MuCgpTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJj
aC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jCmluZGV4IDFkNTIzY2Y5NmZmMC4uZTY2ODVkYjU4YmQxIDEwMDY0NAotLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
dHJhcHNfbWlzYWxpZ25lZC5jCkBAIC0yNjksNyArMjY5LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxv
bmcgZ2V0X2YzMl9ycyh1bnNpZ25lZCBsb25nIGluc24sIHU4IGZwX3JlZ19vZmZzZXQsCiAJaW50
IF9fcmV0OwkJCQkJXAogCQkJCQkJCVwKIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7CQkJCVwKLQkJ
X19yZXQgPSBfX2dldF91c2VyKGluc24sICh0eXBlIF9fdXNlciAqKSBpbnNuX2FkZHIpOyBcCisJ
CV9fcmV0ID0gZ2V0X3VzZXIoaW5zbiwgKHR5cGUgX191c2VyICopIGluc25fYWRkcik7IFwKIAl9
IGVsc2UgewkJCQkJXAogCQlpbnNuID0gKih0eXBlICopaW5zbl9hZGRyOwkJXAogCQlfX3JldCA9
IDA7CQkJCVwKLS0gCjIuNDcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
