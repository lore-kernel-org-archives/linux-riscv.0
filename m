Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F214E7C4C9
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=186v9gPxrkWQnUsXTLx3QK8k6GeJgZ81mQ5E4B4B6bI=; b=gNduwtOi3RgUYY
	B1iW28f9p+3dUcLUcvn3CNtA1St142OcJKSrtowDWmc+/BjYAWB8bxsY4xZUbE1g8JoidigVnSA8W
	uFd4KoPf/wRBDBBiKBErZ6fvhF/PQrli70RUNkXkpm/mPQcNJ9P4L2bX7w+HiysqhMYKdKXc9JOvk
	3qjexYmQMbK0KiMRwHHIAyZkJMYVpBUqcgDc7kkV10B06h47RzFcdhLYclyu8M0lj/S9XbiKFA5NT
	Yd5PQfVQJ63AHQbvbpJogi5r6P/2bvLM2S9F9U8G0QYopdMR5vip5QJFxtJdE/KRPI9n6xmOpe1/o
	zOkbq0TtArnVxcHENTxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2xk-000EQY-2x;
	Wed, 04 Oct 2023 14:34:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2xf-000EKD-13
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:34:54 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-406553f6976so4961025e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696430087; x=1697034887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bnst9RFi2qMRMZzxH/03e6Z8hZKzXbR6dhcQes3Pvo=;
        b=b+T07JMbZWIJ2QV5VqSmemWGFEace3FGVgypiH7zkgrVAUc1OW5l1gHM119uHJmpxg
         HUmbS6LzsqutzE9lTlfjHoKszE9s7+4OjhooiF+B/hjjQKFM6i61BDJQrx404rsdnIGr
         HJU7b5Mr/Qw6R5ZG72os0Dlmwtz8BGxwVa2P+gzdIuUIeaBiOSUpMZE4iYvcZ5eVjfi7
         mpc8+3gUcCGTuIArkPcvW7t1+gauLfXp24XgdpjJB2tVXpXUr5XhJImycgfBvHt+ygw2
         lYqhPvabDfOKfvKsALKnrTdy7B0XqshbSyAVD8AlV3TbNgjZ9qO6KPg5l6Fskj30Kabk
         tC2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696430087; x=1697034887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bnst9RFi2qMRMZzxH/03e6Z8hZKzXbR6dhcQes3Pvo=;
        b=RyHaNZwfb1is3z4N8Msn1l8HiUClx9H41VzCfJwj1EheFz6+lux0qTkv6PTglhAS9/
         xL/+zw4Gle548r6dLKfqjqW+i9hRVkBvwc0/Q1k4/lxz7alO5WAXAliHKShu88Q4IBvD
         8Y5leZ+W5SqcuaNyCJKcztW8aE1G9EsopHrexPtaQAqVtVf1PPHm3XvEukptBvzY5ZOj
         GwyGz7ckocn2Rnat5Mn4mh/CGENmTcQp88OLMEzRVL8N5qN/9OljUMltTZZnUsxSjkKs
         lcLQub75e/wpEgH0sFkGTX/2VHOx2ikgKg/RsASrkB9NRORLvc0xAgGrDPbol/uCS8GV
         AlYw==
X-Gm-Message-State: AOJu0YzXX5RXbNGdM52Mp/pcxGSwSWcTMk3eudAf8lEonTloRjNzSBnJ
	X+uYUHLDkHQbzZm/J9bMiq4hKg==
X-Google-Smtp-Source: AGHT+IGv2rOkd9IY0oWDOdOvSePKsvDtHrwfyqoPkkf3uEq1UxzbLBZlJ1jVnRYu2m9ZWsFcjceIRg==
X-Received: by 2002:a05:600c:1d03:b0:404:7606:a871 with SMTP id l3-20020a05600c1d0300b004047606a871mr2511608wms.2.1696430086851;
        Wed, 04 Oct 2023 07:34:46 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id t20-20020a1c7714000000b00401e32b25adsm1686205wmi.4.2023.10.04.07.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 07:34:46 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH 3/5] riscv: kernel: Use correct SYM_DATA_*() macro for data
Date: Wed,  4 Oct 2023 16:30:52 +0200
Message-ID: <20231004143054.482091-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004143054.482091-1-cleger@rivosinc.com>
References: <20231004143054.482091-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_073451_386625_4B83791F 
X-CRM114-Status: UNSURE (   8.83  )
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

U29tZSBkYXRhIHdlcmUgaW5jb3JyZWN0bHkgYW5ub3RhdGVkIHdpdGggU1lNX0ZVTkNfKigpIGlu
c3RlYWQgb2YKU1lNX0RBVEFfKigpIG9uZXMuIFVzZSB0aGUgY29ycmVjdCBvbmVzLgoKU2lnbmVk
LW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gv
cmlzY3Yva2VybmVsL2VudHJ5LlMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5l
bC9lbnRyeS5TIGIvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUwppbmRleCA2NGFjMGRkNjE3NmIu
LmE3YWEyZmQ1OTlkNiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZW50cnkuUworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9lbnRyeS5TCkBAIC0zMjQsNyArMzI0LDcgQEAgU1lNX0ZVTkNf
RU5EKF9fc3dpdGNoX3RvKQogCS5zZWN0aW9uICIucm9kYXRhIgogCS5hbGlnbiBMR1JFRwogCS8q
IEV4Y2VwdGlvbiB2ZWN0b3IgdGFibGUgKi8KLVNZTV9DT0RFX1NUQVJUKGV4Y3BfdmVjdF90YWJs
ZSkKK1NZTV9EQVRBX1NUQVJUX0xPQ0FMKGV4Y3BfdmVjdF90YWJsZSkKIAlSSVNDVl9QVFIgZG9f
dHJhcF9pbnNuX21pc2FsaWduZWQKIAlBTFRfSU5TTl9GQVVMVChSSVNDVl9QVFIgZG9fdHJhcF9p
bnNuX2ZhdWx0KQogCVJJU0NWX1BUUiBkb190cmFwX2luc25faWxsZWdhbApAQCAtMzQyLDEyICsz
NDIsMTEgQEAgU1lNX0NPREVfU1RBUlQoZXhjcF92ZWN0X3RhYmxlKQogCVJJU0NWX1BUUiBkb19w
YWdlX2ZhdWx0ICAgLyogbG9hZCBwYWdlIGZhdWx0ICovCiAJUklTQ1ZfUFRSIGRvX3RyYXBfdW5r
bm93bgogCVJJU0NWX1BUUiBkb19wYWdlX2ZhdWx0ICAgLyogc3RvcmUgcGFnZSBmYXVsdCAqLwot
ZXhjcF92ZWN0X3RhYmxlX2VuZDoKLVNZTV9DT0RFX0VORChleGNwX3ZlY3RfdGFibGUpCitTWU1f
REFUQV9FTkRfTEFCRUwoZXhjcF92ZWN0X3RhYmxlLCBTWU1fTF9MT0NBTCwgZXhjcF92ZWN0X3Rh
YmxlX2VuZCkKIAogI2lmbmRlZiBDT05GSUdfTU1VCi1TWU1fQ09ERV9TVEFSVChfX3VzZXJfcnRf
c2lncmV0dXJuKQorU1lNX0RBVEFfU1RBUlQoX191c2VyX3J0X3NpZ3JldHVybikKIAlsaSBhNywg
X19OUl9ydF9zaWdyZXR1cm4KIAllY2FsbAotU1lNX0NPREVfRU5EKF9fdXNlcl9ydF9zaWdyZXR1
cm4pCitTWU1fREFUQV9FTkQoX191c2VyX3J0X3NpZ3JldHVybikKICNlbmRpZgotLSAKMi40Mi4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
