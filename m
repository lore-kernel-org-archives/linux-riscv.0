Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4431DC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvsrGeRfUBNCtbHrD6ZfCUc5VfCyYIAx5TdQmDk0/6A=; b=CnAs/3Ca8PgrwO
	9+c7H8hs+ky3pF51ycbVDFXeIkPKtmo8UNeYzoVFqKDDsDjyEVgDzZIDJEGZfJ7B0CiL8n5t2j3pY
	uKuPRVHPxoy+3HlL/96wKQl9/Vw23yVOOdT9/Z8ff3TDI/rlma44Z6bk71IJwwLqeLFnh5FXGdIoi
	OblhmwXwxPLvzToEuB4+PWjTnuYk9BiE107VNgW4FJ40Zt/k0UO8Y+3ylNiYmEKlbRCYn+larv7Gc
	31nzxCTuG+/OEIAuJSDY4yDWz7RvmTAiZkRNvLaJwYMlKTVC5xxn7cGFX+RukiCvRvv+rsqt55FJF
	lPAUteV4G0FIiJTG622w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cM-000000022Mr-1vHx;
	Thu, 09 May 2024 16:27:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s56cJ-000000022J9-0GK4
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 16:27:36 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ec92e355bfso9178165ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715272054; x=1715876854; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrVtT3wUj2Ro2LlZ8rt/5kKYI6Cl/lb7mj3BLkp83qk=;
        b=kXz+eQPcLnSFfCnK43ZvlXw7jDlxPgrabsF2CrusLEhAxYzZSer1sVTQepEoX9/68M
         +VpZ6bhCdPIlZW+tyGxsR7aqVwLgm769uUdj1Kq2ZKoUw2nEnEqUBEtSgci9nTEVJIUl
         7N4Sp0dZXPtI2eNeRDLY0yR2dzrvsP4OI8IMLY8mh8AyZu13gd4pFzNN3WZTmSGCKDeG
         tCKe3bLbb5SNsw7MJwSMdhfZI4BYcs1BxVc4H7FjwCZWTM5qUWPtir4HK1q6m6zIuUJ3
         1Yax1KJY6SNfCHi+sm9J6NpCKLgclXZFKe0Q+fhT9ne/WbiAK6HLp0UnIclE0whmCU0H
         0StA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715272054; x=1715876854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrVtT3wUj2Ro2LlZ8rt/5kKYI6Cl/lb7mj3BLkp83qk=;
        b=YM6PK3aRJzkEJ71UBVLqp55utB7gN6QoaudhcPwBmWswMpGWNiIq1NXsC72VW6muC/
         KGt2zR3IN1r8f9GsEsSfgpCvjPc6Y37nRETXJxxXFVQHigwoD2ev2BBkxMP2/iyE442x
         fgLQXhIV/yEZj7Ko1o96UxBcYrAld5ulAtY5aqpDLu8C5VVvSsb3rE69+d1/OnXW11T8
         AjKCp9OoLoJFih0eBjrVfOLhLywGpp2o41tLAw814oyUxWdW15bA5he4SUTe4A6ycrnp
         5ssr4CU/fX+05Opi8up7abhyZ/8nOnA0Fl9IbPPxZLeieaMKxkKZyxbIncV8BlkS+EGi
         wR8Q==
X-Gm-Message-State: AOJu0YyFmjZi5hHyHLTnVE4iKkrYrUpIl5F37QBmv1/sm/lHwOkCgRrm
	RjP1R26EPsQEUAdNzFwecfcst1eIei4Q0qrZNIrcdJOztv0jUeAM1sr0BfRPtEw=
X-Google-Smtp-Source: AGHT+IF8PgRVZZ0FHnW63FE7rtPOWp30TN+TCPvlMDVR+j+74ajw2NLtOZVqw2pXCxjO30nvabMrkw==
X-Received: by 2002:a17:902:c3c5:b0:1ec:e3c2:790e with SMTP id d9443c01a7336-1ef43d2967cmr1810595ad.19.1715272053741;
        Thu, 09 May 2024 09:27:33 -0700 (PDT)
Received: from [127.0.1.1] (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c13805asm16210285ad.264.2024.05.09.09.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 09:27:33 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 10 May 2024 00:26:53 +0800
Subject: [PATCH v5 3/8] riscv: cpufeature: call match_isa_ext() for
 single-letter extensions
MIME-Version: 1.0
Message-Id: <20240510-zve-detection-v5-3-0711bdd26c12@sifive.com>
References: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
In-Reply-To: <20240510-zve-detection-v5-0-0711bdd26c12@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Heiko Stuebner <heiko@sntech.de>, 
 Andy Chiu <andy.chiu@sifive.com>, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, 
 Vincent Chen <vincent.chen@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_092735_147507_A1BFD5CA 
X-CRM114-Status: GOOD (  11.74  )
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

U2luZ2xlLWxldHRlciBleHRlbnNpb25zIG1heSBhbHNvIGltcGx5IG11bHRpcGxlIHN1YmV4dGVu
c2lvbnMuIEZvcgpleGFtcGxlLCBWZWN0b3IgZXh0ZW5zaW9uIGltcGxpZXMgenZlNjRkLCBhbmQg
enZlNjRkIGltcGxpZXMgenZlNjRmLgoKRXh0ZW5zaW9uIHBhcnNpbmcgZm9yICJyaXNjdixpc2Et
ZXh0ZW5zaW9ucyIgaGFzIHRoZSBhYmlsaXR5IHRvIHJlc29sdmUKdGhlIGRlcGVuZGVuY3kgYnkg
Y2FsbGluZyBtYXRjaF9pc2FfZXh0KCkuIFRoaXMgcGF0Y2ggbWFrZXMgZGVwcmVjYXRlZApwYXJz
ZXIgY2FsbCB0aGUgc2FtZSBmdW5jdGlvbiBmb3Igc2luZ2xlIGxldHRlciBleHRlbnNpb25zLgoK
U2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KUmV2aWV3ZWQt
Ynk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Ci0tLQpDaGFuZ2Vs
b2cgdjM6Ci0gUmVtb3ZlIHNldF9iaXQgZm9yIHNpbmdsZS1sZXR0ZXIgZXh0ZW5zaW9ucyBhcyB0
aGV5IGFyZSBhbGwgY2hlY2tlZCBpbgptYXRjaF9pc2FfZXh0LiAoQ2zDqW1lbnQpCi0tLQogYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMTEgKysrKystLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
CmluZGV4IDE1ZmZkYTE5NjhkOC4uNGJmYzEzMjA5OTM4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5j
CkBAIC00NjgsMTYgKzQ2OCwxNSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcmlzY3ZfcGFyc2VfaXNh
X3N0cmluZyh1bnNpZ25lZCBsb25nICp0aGlzX2h3Y2FwLCBzdHJ1Y3QgcmlzYwogCiAJCWlmICh1
bmxpa2VseShleHRfZXJyKSkKIAkJCWNvbnRpbnVlOworCisJCWZvciAoaW50IGkgPSAwOyBpIDwg
cmlzY3ZfaXNhX2V4dF9jb3VudDsgaSsrKQorCQkJbWF0Y2hfaXNhX2V4dCgmcmlzY3ZfaXNhX2V4
dFtpXSwgZXh0LCBleHRfZW5kLCBpc2FpbmZvKTsKKwogCQlpZiAoIWV4dF9sb25nKSB7CiAJCQlp
bnQgbnIgPSB0b2xvd2VyKCpleHQpIC0gJ2EnOwogCi0JCQlpZiAocmlzY3ZfaXNhX2V4dGVuc2lv
bl9jaGVjayhucikpIHsKKwkJCWlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2NoZWNrKG5yKSkKIAkJ
CQkqdGhpc19od2NhcCB8PSBpc2EyaHdjYXBbbnJdOwotCQkJCXNldF9iaXQobnIsIGlzYWluZm8t
PmlzYSk7Ci0JCQl9Ci0JCX0gZWxzZSB7Ci0JCQlmb3IgKGludCBpID0gMDsgaSA8IHJpc2N2X2lz
YV9leHRfY291bnQ7IGkrKykKLQkJCQltYXRjaF9pc2FfZXh0KCZyaXNjdl9pc2FfZXh0W2ldLCBl
eHQsIGV4dF9lbmQsIGlzYWluZm8pOwogCQl9CiAJfQogfQoKLS0gCjIuNDQuMC5yYzIKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
