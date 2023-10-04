Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B03E7C4D2
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bPhqY/+ZGIkARXXz0u+lEvgJuC38A+41FKy5UPyxyJA=; b=TI8ajh/hxpvm7z
	7uvqs5MhDsMQR6HMIWy9KG/kfmxWMVhjBjX1kSLWTWM1tgG6SQMARFmD4AbHk6Nkv5hRHRoeCmc1R
	3SOKdojt/dQrPPR50v2cvN8Adal9KWendN8Xctq6Vq3aMP09/SqWw8ZxWvev8+Xv+G/1P7sn8Uzi3
	FweNSSFmcxAGc0WZWERFJdyUl4MkNX5xY9HKpk/JlsLImWjJyRa+leImGfTVLvL5Z7qO/L8NcpcQN
	xjDDiU6OiQKAHwMXPvcZ0bTZz1NjQF7eIH2efTU3ReGNmsbq3Ls3/dgeOrK1uSdxWliIXZQV52BjN
	4UNt9SqfI0LgWsSstHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a3-000JbI-1J;
	Wed, 04 Oct 2023 15:14:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo3a0-000JYL-1E
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 15:14:29 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-405e48d8e72so4850635e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 08:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696432466; x=1697037266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A29BZTVXLOLIyIz1ohc6hcIwjz2FYyV3nDH2JWKPVDg=;
        b=shr6Fo7PzrsowB1iaQkUhb21eGpe5xei7onMDYX5oOGMsGIL+axAOY6KcshFVlCXG7
         sICDWDc8ZcOXq9k2EkMdekS0UY3wqOwpxYV0er24rO3A9+Vh5iBPNNKa8+YrJVig+Miv
         82OH/iYAmntsHwjc+iRZuGIYajrfhjj4bPKPGXVLOb3YppbhQDO3Wxz4lzA8FDoGe+J9
         HR9emg3pNw7QxfHtkb09xc2hs0ZsQVREkOKph9qcZRRhhfi7ZYGbJ6jlBNZr+2rfNdJI
         TaVl5IIAVICMNKa+QvZCUus38l1tGB5kR+K74cF6OfPVn9gMJ+P7po4VcrYCBh03kmSV
         X7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696432466; x=1697037266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A29BZTVXLOLIyIz1ohc6hcIwjz2FYyV3nDH2JWKPVDg=;
        b=ghKZfHvDV6QmHFe6ajn4FSff91OaqzgDReCW6GVcPZddLqimRJVDjKwkOS7vvUKzaP
         EBl7knisX3RqD6B+Wr+rB0WK+Z6jyShZ3L0ZKiKhckwsAOF7ua2J0QJ9xWAWgLVpuz1n
         a/hCaHYZzN2nXik1l9C7VnBGMlFTlbunBocC8pgp/cjFc3u9DgZWYbdGZvO9hZYeGnqi
         WwmlYgj52nrUihgGgfMJBH0PZdfm2oRUHfXG0/txDaELienqBhc2FaouGrUr820m6CXV
         BrpmWaPgo2yNZSpcfYLUL8dBzhX9fdD5N8Zkza8rpk/9VuqnO4Q5nJqBFAL+JELXKtJc
         OwQQ==
X-Gm-Message-State: AOJu0Yxh67uODkW2k0btSjKw2pSYAJbd6ITcqtuqKtUEINw4aKzzVgZq
	traVGgRI1XbDXGI5/oCYjHzBxA==
X-Google-Smtp-Source: AGHT+IFAs4QCRFIPXdPu9HEhZ6Wlf941rotRjfMZx0FFxD9JoHwVNXpveZ0GmS/Rdy6s4UjHyzja0A==
X-Received: by 2002:a05:600c:3c96:b0:403:334:fb0d with SMTP id bg22-20020a05600c3c9600b004030334fb0dmr2534922wmb.4.1696432466012;
        Wed, 04 Oct 2023 08:14:26 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id i2-20020a05600c290200b00402f7b50517sm1768764wmd.40.2023.10.04.08.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 08:14:25 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Topel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>,
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v2 3/8] riscv: report perf event for misaligned fault
Date: Wed,  4 Oct 2023 17:14:00 +0200
Message-ID: <20231004151405.521596-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004151405.521596-1-cleger@rivosinc.com>
References: <20231004151405.521596-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_081428_420005_B4F6F17D 
X-CRM114-Status: UNSURE (   9.45  )
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

QWRkIG1pc3NpbmcgY2FsbHMgdG8gYWNjb3VudCBmb3IgbWlzYWxpZ25lZCBmYXVsdCBldmVudCB1
c2luZwpwZXJmX3N3X2V2ZW50KCkuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25l
ZC5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCA5ZGFlZDdkNzU2YWUuLjgwNGY2YzVlMGU0NCAx
MDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNiw2ICs2LDcgQEAKICNpbmNs
dWRlIDxsaW51eC9pbml0Lmg+CiAjaW5jbHVkZSA8bGludXgvbW0uaD4KICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51eC9wZXJmX2V2ZW50Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvaXJxLmg+CiAjaW5jbHVkZSA8bGludXgvc3RyaW5naWZ5Lmg+CiAKQEAgLTI5NCw2ICsyOTUs
OCBAQCBpbnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKIAl1
bnNpZ25lZCBsb25nIGFkZHIgPSByZWdzLT5iYWRhZGRyOwogCWludCBpLCBmcCA9IDAsIHNoaWZ0
ID0gMCwgbGVuID0gMDsKIAorCXBlcmZfc3dfZXZlbnQoUEVSRl9DT1VOVF9TV19BTElHTk1FTlRf
RkFVTFRTLCAxLCByZWdzLCBhZGRyKTsKKwogCWlmIChnZXRfaW5zbihyZWdzLCBlcGMsICZpbnNu
KSkKIAkJcmV0dXJuIC0xOwogCkBAIC0zODIsNiArMzg1LDggQEAgaW50IGhhbmRsZV9taXNhbGln
bmVkX3N0b3JlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCXVuc2lnbmVkIGxvbmcgYWRkciA9IHJl
Z3MtPmJhZGFkZHI7CiAJaW50IGksIGxlbiA9IDA7CiAKKwlwZXJmX3N3X2V2ZW50KFBFUkZfQ09V
TlRfU1dfQUxJR05NRU5UX0ZBVUxUUywgMSwgcmVncywgYWRkcik7CisKIAlpZiAoZ2V0X2luc24o
cmVncywgZXBjLCAmaW5zbikpCiAJCXJldHVybiAtMTsKIAotLSAKMi40Mi4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
