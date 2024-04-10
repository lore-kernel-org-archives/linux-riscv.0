Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D743DCD1296
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8DPQTJ9I3jZBDPwr2IK6SJhiJXDEATrFX6C7Ib9c0cM=; b=qyDAzd11OGRz20
	SnQuibaE4qitNr1CJBp6BQb2fam+N0buJwSc+I5+FEcPhKqwR5irPZyHGlDzfA15j6PM4mScRNXul
	baAZObimUb/yXrlBbaQysSNF5CLCvp2a11NQdNVkC2wD7cJpUaqNOlLrbMTRY4Kd8na2kAnfX1swH
	CHdV8LulQa5vep4aE90wrWwfl2Gu99RLkn1+YeXXqQ0wr7v6t9kzh4CRmRmt9QPW9kkuYOm36zqC9
	h4nN52CjsxoVtGDHIlsSYid6UhxVI6HDoEzAJ3GijUemYOBKofr10W1Y23Gd2+hjmGU6rJcyyfjpO
	iyaktCg8Lozy7+wzvnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzI-000000063DP-3jK0;
	Wed, 10 Apr 2024 09:11:27 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTz9-0000000633E-3Hqq
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-346407b8c9aso516551f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740273; x=1713345073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAM+PbC/Wqgx6Q9RB0x39wuP2KdW0QgVrrLDnXaQ5i0=;
        b=ubQwOxNGKKAItCKdWmXF12Y7VfgsnpoY0pJLNMFjp77gMiAEs+mZPFGNaW31fdnPcp
         cDKJY1rnWAFBjlp1pfDNhwt4chbuF9+H9NKhTjv2vwLmCNCfilHGEy8GAIcKlsLz45nX
         qTj+g3s+k28zot6zuyNtRt67CoB+uVkh8fGlOl0LB4E49JErJvbUmys2x58uXe6tQ5U5
         0S5HSAOQxWRpJz/kcHqI/YJL0XwUNzWQU/ElMu0AShBzCOq+LxJv8UOqBk3gvsoN1URx
         NBri7qBBZtyEignYbIGgZvfWBtwVbtoqDu9QV+JrG8CG61lnycFfE9yioPTB5KB4hqWY
         hIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740273; x=1713345073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAM+PbC/Wqgx6Q9RB0x39wuP2KdW0QgVrrLDnXaQ5i0=;
        b=DybqhPco9Yi5xS7PIRBnRyi21Ph5KlXoY6U06AG5wEPA8Z+ZVxJxZIZS/OfxNaKLDf
         SSM1Mfm4bEvswsJ7/emPsKOnJwHdONlcPCdfQlKpuy6yKDYzmMt7kuz3NijkQRLGhu94
         JY1WQ/g/uRtIDROtRyk6pV8Fk2xb02uNxvhEaVgrZXfMdgliSQNrGrKUvvw1LSi7lD78
         zqb6+a/YyTxz4P561HFrsqVAZDgekck0GtujaHXyD7J0dQaw+bqtFg2JyGmxy2U/QQ8T
         S4T8hxcUJpegrwMhlx6odYwodKripd2FeuyQVrmc2Ev4oQpE1zSJD2ZC62G8XsABAWip
         NpPw==
X-Forwarded-Encrypted: i=1; AJvYcCXk2I5aOgipeW4gpD0J1F5YQjkSp8AAbREwdly99fEzF2zkwiaziWhrR5GcGXTj0vs3jLyG/xFqVaeaCT4XvqZ7kC96QwgQ9vQOdzeMA3Fq
X-Gm-Message-State: AOJu0YzBzyYZRlNZaA1Mt960rMomshMVdg+hpSjJusjWoS8MubIp8p7I
	Re0DgSfC5N+ij7faYnIh0KLzjt6x3I4i0IJLZy/j1vuyo1uQCHefLks+QrQUmtk=
X-Google-Smtp-Source: AGHT+IE31xyXAQiWXlldG2UNnWUTBPkwaZr0QcS45UwtURwADr+zzFGrAFhVxk0eW5d0FTe+jo+2rQ==
X-Received: by 2002:a5d:4a4e:0:b0:343:c3b0:ee39 with SMTP id v14-20020a5d4a4e000000b00343c3b0ee39mr1259281wrs.5.1712740273042;
        Wed, 10 Apr 2024 02:11:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:12 -0700 (PDT)
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
Subject: [PATCH 02/10] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Date: Wed, 10 Apr 2024 11:10:55 +0200
Message-ID: <20240410091106.749233-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021116_913312_2984B982 
X-CRM114-Status: GOOD (  10.10  )
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

VGhlIFpjKiBzdGFuZGFyZCBleHRlbnNpb24gZm9yIGNvZGUgcmVkdWN0aW9uIGludHJvZHVjZXMg
bmV3IGV4dGVuc2lvbnMuClRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBaY2EsIFpjZiwgWmNk
IGFuZCBaY2IuIFpjZSwgWmNtdCBhbmQgWmNtcAphcmUgbGVmdCBvdXQgb2YgdGhpcyBwYXRjaCBz
aW5jZSB0aGV5IGFyZSB0YXJnZXRpbmcgbWljcm9jb250cm9sbGVycy8KZW1iZWRkZWQgQ1BVcyBp
bnN0ZWFkIG9mIGFwcGxpY2F0aW9uIHByb2Nlc3NvcnMuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oIHwgNCArKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCA0ICsr
KysKIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
CmluZGV4IDU0M2UzZWEyZGEwZS4uYjc1NTFiYWQzNDFiIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
CkBAIC04Miw2ICs4MiwxMCBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pBQ0FTCQk3MwogI2Rl
ZmluZSBSSVNDVl9JU0FfRVhUX1hBTkRFU1BNVQkJNzQKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9a
SU1PUAkJNzUKKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0EJCTc2CisjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfWkNCCQk3NworI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDRAkJNzgKKyNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9aQ0YJCTc5CiAKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9YTElOVVhFTlZDRkcJ
MTI3CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCAxMTViYTAwMWYxYmMuLjA5ZGVlMDcxMjc0
ZCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMjYxLDYgKzI2MSwxMCBAQCBjb25zdCBzdHJ1
Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6ZmEsIFJJU0NWX0lTQV9FWFRfWkZBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
ZmgsIFJJU0NWX0lTQV9FWFRfWkZIKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmhtaW4sIFJJ
U0NWX0lTQV9FWFRfWkZITUlOKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2EsIFJJU0NWX0lT
QV9FWFRfWkNBKSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2IsIFJJU0NWX0lTQV9FWFRfWkNC
KSwKKwlfX1JJU0NWX0lTQV9FWFRfREFUQSh6Y2QsIFJJU0NWX0lTQV9FWFRfWkNEKSwKKwlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6Y2YsIFJJU0NWX0lTQV9FWFRfWkNGKSwKIAlfX1JJU0NWX0lTQV9F
WFRfREFUQSh6YmEsIFJJU0NWX0lTQV9FWFRfWkJBKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
YmIsIFJJU0NWX0lTQV9FWFRfWkJCKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmMsIFJJU0NW
X0lTQV9FWFRfWkJDKSwKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
