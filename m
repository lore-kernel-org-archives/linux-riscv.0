Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD75C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8smYV6ra1HxRjI+0UI7H1NNNI8jYPhH3Ca/O4iYO1MA=; b=LST0ARx8g1k+sq
	wpdSbWO8IiOu0FD4ZKgSzVSp+BlrxakaKOWXYFSFuAjfcOhAIf5C1Ce1aUU4lqtf5vD03u1YhLaoi
	JV/siT6WFsLlWG9MxISFUG1BWG75YPY5DR284+e1nwAAPADc6ogtyN2oCHBap2Ti7ZYtIu+KBWrMD
	VO02P5yNa9whHUZWwsA3CBxYVEaiHigA3zW9iT/exTEM5qQiivFqsYJjTBr/kPOkibbcrIusWs1r3
	/RnxQ7wigMCigp4fRJ7olsOo+4r/jBxdzfipvYA2X4z0AwBcAgVRtdUrbuwoF635cRDhVGJC2UV1g
	xON7xfvR4yqzBkzsqr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jl1-0019Ys-1q;
	Tue, 07 Nov 2023 10:56:31 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jks-0019Kr-32
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:26 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c504a51a18so11222541fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354580; x=1699959380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpHOk3VsdqfpPenBw33m97LFdLmT8/1+lQVgF+3Qq2k=;
        b=wPwCXXyUaSbE8p3LLbCxWaZabVYenT2tI7DAQzPTGyx8dVet1YZ9EB/JpI0X5pzs7C
         aL+PgLCyL0gBBjH2c6N89WaMXW3bkdfOEJeWPL7Ad3sdKqj4hhhm9hahntSEGswWkBQR
         B0lciMKuZgNrcES3sG2EX881ppH9YZhfZwmh+LM2c80uARV+jxj7kdGxaxXVjp7DgPR+
         MDW2tMTMJg6mPg94DEvQxLi3hrLq1kbW25wTF8rj6c9mK7vp31UePk7lPCtxvZ/hojKY
         1eY8R+jDDE+tuFKbvp4pC//iEFuswWPn+cXH2vECmxAqFcZgV2wCHFlJh5nBs5ODw8MD
         apKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354580; x=1699959380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VpHOk3VsdqfpPenBw33m97LFdLmT8/1+lQVgF+3Qq2k=;
        b=Kj+833ZbCsg6lJeNhxwGveW2P17gTcLUiG6UxJV030mVmiRwrQMX+XsscaOAf1xMlq
         wJB43llTYwi1phmf5ZaELOXkSsqaDz7KIjhbu/0/NDpDUlPs76gmWKKwKlr/fUTWcszT
         uty0QW8VP1twijBjaJ81pnE3jZILXi42UxiATg0weOneq4EzB12eIpWH8NtOgnU+4UV8
         gSHQS4vf9WSA94YtPgoLr5DRWf53Jo5Br4W5AP/f4aoW/kOFQrbEQEzCZlHkDUq+2YsH
         C7QaSjiy5VXyhmZ2xDIBVJ3INLFrniNgdd6QQJOVYLfkW2rUtY2MyzHDxmZJ7mEhEM/P
         fOVQ==
X-Gm-Message-State: AOJu0YxARuLs4TmjTvBPtUwMCJHAA6P/Q5ye6VOK+z9zo/PYHuoYjBLC
	NOphskBIC/MddN/OR4Z0mjwW4dQHVmTqKPO8HRUuVQ==
X-Google-Smtp-Source: AGHT+IE+q2UlEWc6Qe9yztVIb0UfK9b3Z8SW8kIF2An9w1ZlDSwjmA5V2PrJhbGY+LL9yCEavwTs1A==
X-Received: by 2002:a2e:980e:0:b0:2bc:d505:2bf3 with SMTP id a14-20020a2e980e000000b002bcd5052bf3mr22410080ljj.1.1699354579680;
        Tue, 07 Nov 2023 02:56:19 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:18 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v3 15/20] riscv: add ISA extension parsing for Zvfh[min]
Date: Tue,  7 Nov 2023 11:55:51 +0100
Message-ID: <20231107105556.517187-16-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025623_019703_9315B419 
X-CRM114-Status: UNSURE (   9.14  )
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

QWRkIHBhcnNpbmcgZm9yIFp2ZmhbbWluXSBJU0EgZXh0ZW5zaW9uWzFdIHdoaWNoIHdlcmUgcmF0
aWZpZWQgaW4KanVuZSAyMDIzIGFyb3VuZCBjb21taXQgZTJjY2QwNTQ4ZDZjICgiUmVtb3ZlIGRy
YWZ0IHdhcm5pbmdzIGZyb20KWnZmaFttaW5dIikgaW4gcmlzY3Ytdi1zcGVjWzJdLgoKTGluazog
aHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xX1l0NjBIR0FmMXIxaHg3Sm5zSXB0dzBz
cWtCZDlCUTgvdmlldyBbMV0KTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXYt
c3BlYy9jb21taXRzL2UyY2NkMDU0OGQ2YyBbMl0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkBy
aXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgMiArKwog
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggNWI1N2IyNGRiNjBjLi43
NTJiZTkxMGU3YzMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAor
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTg0LDYgKzg0LDggQEAKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkgJCTY2CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZITUlO
CQk2NwogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJSElOVE5UTAkJNjgKKyNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aVkZICQk2OQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRkhNSU4JCTcwCiAKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9NQVgJCTEyOAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX0lOVkFM
SUQJCVUzMl9NQVgKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCBiYWE4ZWRmYjBlNmEuLjBiOWQx
NmVhNzFmMSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMjgyLDYgKzI4Miw4IEBAIGNvbnN0
IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHprc2gsIFJJU0NWX0lTQV9FWFRfWktTSCksCiAJX19SSVNDVl9JU0FfRVhU
X1NVUEVSU0VUKHp2YmIsIFJJU0NWX0lTQV9FWFRfWlZCQiwgcmlzY3ZfenZiYl9leHRzKSwKIAlf
X1JJU0NWX0lTQV9FWFRfREFUQSh6dmJjLCBSSVNDVl9JU0FfRVhUX1pWQkMpLAorCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHp2ZmgsIFJJU0NWX0lTQV9FWFRfWlZGSCksCisJX19SSVNDVl9JU0FfRVhU
X0RBVEEoenZmaG1pbiwgUklTQ1ZfSVNBX0VYVF9aVkZITUlOKSwKIAlfX1JJU0NWX0lTQV9FWFRf
REFUQSh6dmtiLCBSSVNDVl9JU0FfRVhUX1pWS0IpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2
a2csIFJJU0NWX0lTQV9FWFRfWlZLRyksCiAJX19SSVNDVl9JU0FfRVhUX0JVTkRMRSh6dmtuLCBy
aXNjdl96dmtuX2J1bmRsZWRfZXh0cyksCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
