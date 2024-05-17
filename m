Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2F3C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyI0p7hvEejSMGyWe3vKNPXN0522uUpzjPUA8/2O6HY=; b=rf9TdHGXdBS79r
	L/Kpd/XLYK92P4vdXuGgp0v74VfvLiAoW9uMk5HRlDRIkOLOjTpnVHuyBfF0calzV5Ej7I6hQ5U4A
	JbPNq6eOa1nDZoS4Y3dMwKqJyI/xXLF1iLlnuI+V1Ht0mjuTGDupkKiXqCJmxSDQFFR3wpI4BOPCG
	jVWFdnWGNuOEmXmZ5x/nibjHLMUSwFc1fX5gomeyqepl2COh9L3M//j5N/zTmJPYMrda4Wnaw8NT4
	42EVr6qCPao2OWDOhQtR1t9Rg+K4cM79u5myLsyVO3Z4iuNe6qL92OPlucjZq2O9cY99ML+ZZyueU
	23ts4Lx+b9CCcr4xBnNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yyg-000000089BT-2GFm;
	Fri, 17 May 2024 14:54:34 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxk-000000088EM-44z2
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:44 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2e2554b8cdfso717231fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957613; x=1716562413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKs6nP2IvbAkKOrGa5+RoTJoO1OEnrEjZ7TnjWCI1Y4=;
        b=h976FLe6pDg3T5K5ibeXW9zwoZDD6l5X7H9/0J7ix1Hjsj3uRJ8O2/ENFJOD/4RPpK
         YnNaWflSMr4ECKx0M89AU5fJjR6cvrWeLl99Be7qd0UPam92i4JnbbmRGV4K6i22xFs8
         RqYgQhfjNICr4hKRnZjxgYxgByaIqoDUcRL9mCzEzRzlDoDY0UX2MzuzrLhmkFYdMpAB
         MDXLmnzip+5m4gNhjccXYedbO6pBe75dnbFekHTTy0iDqBSb1YTPMSmH1t6VfmZnruTt
         ldzVbFTDOU/BBrQk9lbtJAdVluHZTCWV776D9kL5WSkx2YS/BIHpBeOel6qyPbQJ52dR
         fkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957613; x=1716562413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKs6nP2IvbAkKOrGa5+RoTJoO1OEnrEjZ7TnjWCI1Y4=;
        b=oiDBHmQ6M9aJxb8HeN4sbUqXurnSJ6m7LWTc1dFPR5BBjYU6v3/YIEUdUkHjwfD3CQ
         MWLFqzmLpuzYDvSGrilb6AeDrZ9rP26ZWWJTS7NxfZI7BD8t+L3IkmSwXR2cKvcdARlj
         4bfwegu4SCcB2/p+rkUuOSTr3kGuhnDcMg9nn+5Nkiz9bGiSHbEDg1EBzuFBuF9ashJE
         Qx8jYovdRKv3oS2c4CdCMCcwFoelX0d0mu710J8srtsRPCiabHcDGLJHuQcXhuEabWzu
         P37EWdXyWNncqqh3ty5tYMVJaGU8bq50j91PbGHDkqNmgE0A5iwnS6DtKOSSyg17Hu7Q
         yMOw==
X-Forwarded-Encrypted: i=1; AJvYcCVziH/cOdOQxfTFetRHCt9TC0XrapsnsYxOnOnL4p0fgI5cF4TMeaHTox7iRvz31owvBbElNn6BEVh7Mx8f97vDhkcC03l7HaTZcAV19f0j
X-Gm-Message-State: AOJu0YzR+U9UYf6FpLH8+4q0ld1ynltdx6cSQC3EFjmXYqU2Kp3iFe/x
	Ig2qrNk8H3iGZuJjK571CDopWgBblI/Yk+vmQLuO8AfwV8QQsZoZuA73OqiCqZ4=
X-Google-Smtp-Source: AGHT+IHR6zTwRG0jWxIyCMSq5u4kvH12lVHrxENgcXG9CeU/DaflTem7ntPab7y54mPzIbQdgLeTIw==
X-Received: by 2002:a2e:a4d9:0:b0:2e7:14a4:1f75 with SMTP id 38308e7fff4ca-2e714a42f3dmr2240021fa.3.1715957612950;
        Fri, 17 May 2024 07:53:32 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:32 -0700 (PDT)
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
Subject: [PATCH v5 13/16] riscv: add ISA extension parsing for Zcmop
Date: Fri, 17 May 2024 16:52:53 +0200
Message-ID: <20240517145302.971019-14-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_075337_296797_E01A586E 
X-CRM114-Status: UNSURE (   9.19  )
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

QWRkIHBhcnNpbmcgZm9yIFpjbW9wIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIGlu
IGNvbW1pdApiODU0YTcwOWMwMCAoIlpjbW9wIGlzIHJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNj
di1pc2EtbWFudWFsLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDEgKwogYXJj
aC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCBhNTgzNmZhNmI5OTguLmFhYWYy
M2YyMDRhYyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCisrKyBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtODUsNiArODUsNyBAQAogI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1pDQgkJNzYKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQ0QJCTc3CiAj
ZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkNGCQk3OAorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pDTU9Q
CQk3OQogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWExJTlVYRU5WQ0ZHCTEyNwogCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKaW5kZXggM2JiMmVmNTJhMzhiLi4wYTQwZmExZmFhMDQgMTAwNjQ0Ci0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9j
cHVmZWF0dXJlLmMKQEAgLTI5MCw2ICsyOTAsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4
dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQV9WQUxJREFU
RSh6Y2IsIFJJU0NWX0lTQV9FWFRfWkNCLCByaXNjdl9leHRfemNhX2RlcGVuZHMpLAogCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpjZCwgUklTQ1ZfSVNBX0VYVF9aQ0QsIHJpc2N2X2V4
dF96Y2RfdmFsaWRhdGUpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKHpjZiwgUklT
Q1ZfSVNBX0VYVF9aQ0YsIHJpc2N2X2V4dF96Y2ZfdmFsaWRhdGUpLAorCV9fUklTQ1ZfSVNBX0VY
VF9EQVRBX1ZBTElEQVRFKHpjbW9wLCBSSVNDVl9JU0FfRVhUX1pDTU9QLCByaXNjdl9leHRfemNh
X2RlcGVuZHMpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYSwgUklTQ1ZfSVNBX0VYVF9aQkEp
LAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYiwgUklTQ1ZfSVNBX0VYVF9aQkIpLAogCV9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHpiYywgUklTQ1ZfSVNBX0VYVF9aQkMpLAotLSAKMi40My4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
