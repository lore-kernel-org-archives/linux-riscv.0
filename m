Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51D2C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 10:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0e+dXDkKNJoBJNWHS9paXjSTV01Zbkic7kR0Rjv4ew=; b=GEEdfmTnB6ztot
	/4zI2zNZXctn3CXFLAmjH1AbNv77P7Hr854pIaEO3mWcdx2SmB8JL7m4SYl58Ul1a0/nsSS6Cpq+n
	MDjF0bAU3ISSoN77iKh+Sd56JXKe0tpDnhzanvg7GMTr2SPNoZqp8qP/eZ7M2SSgRXmd2AXvFsa36
	/9gPa+nKDCBgQetrn8IQuoCXQMyr6oYCuqc0HYipgqNYuIjR1IbS7wLQlTiTlCh96PbDyTB3kdake
	rsQpJ0ehq50esr/JIpMcWcULa24XrpJdqrAK0AavPteR1LcX0ClgChKTBHEosJ7Ebo9nzo8fgQ3AU
	Yahrn6eo/pHa6kAV/9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jl4-0019cv-1v;
	Tue, 07 Nov 2023 10:56:34 +0000
Received: from mail-lf1-f51.google.com ([209.85.167.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Jkw-0019Qx-36
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 10:56:29 +0000
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-509469f552aso1185599e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 02:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354583; x=1699959383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hPj7UJhNk4bEKBTXmbiQszNoP65XhPNjIiphPr/bFIg=;
        b=A3Uk1L1btQ+k25SqptMY6r+0Rw6rZq3W2GmNwXsLve0F2gBX4s6Cuv8oyirDtnu3hv
         XXJcIUWkFR+DPLxBbtRLSDsbGPVK3Xf097CLYj4Uc+3njFxgqpIKLM7stfDKfqtxYZeG
         VY4TL/1NCLZCBkcrxpUADKotMpjDRjxJapMLSZNZxYdS9uXqIahn401yOLOFTaVQOPkc
         /3c5N/FwRVaD7ZzbqoDSHSDM8WA6ihkZKjUlec9jD8wLNxMNrvT44paocOTYobECh6M1
         Ah5w791g2avUCk6rN55Oh4kYJoQxamnk5NuodQZcF0getCuB0aQZwrV1Ci10KPpe8m82
         FrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354583; x=1699959383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPj7UJhNk4bEKBTXmbiQszNoP65XhPNjIiphPr/bFIg=;
        b=vs4apdqN+wvXqg7J3jjIkvYlyEdkLiStpe8z6sbCqV8XOtdnIIOjllQ45ogTuSUJa4
         Uxw1ic/23Ikia7tc2EbB/PFWcF9D48itqRFP7R6KETAR4SicTwo3znusZGT4B/Isq8b7
         yIEPSiqTuWG6UBJ0dZbsWpK3aJq973BM9wXkCcbPKSshrgZaPsxgdzj99I8rf5GSTyS7
         OdOavpgJD8Sgu+fP0iLChMDV8tDiYnR6vl6JdoiCjuRaj/hgvpBVToI8MZUJcP2AQect
         zw7iCbuXRAKazrgwFn24LcywbVrI5WDuMgU44f3EfWEykBm+agEA7NneyatNYwJ3vWPo
         4PPA==
X-Gm-Message-State: AOJu0YxULiSpHf2tDvd8DvwOfnaN7mqPp9VJqm9m/NDQ0L2vlYrsf7L1
	6Rn8kQXwDcunyBa/06dE3NLKZf0bo8amEjWkul7PzQ==
X-Google-Smtp-Source: AGHT+IGRA2Jq7n60JiFQFoG9YMwZlINwiDybS35zq6fryGJBSKL1K+FHC6LMZd0w5ZY6D/nx95IeyA==
X-Received: by 2002:a05:6512:3196:b0:502:af44:21c2 with SMTP id i22-20020a056512319600b00502af4421c2mr23556282lfe.5.1699354583017;
        Tue, 07 Nov 2023 02:56:23 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:22 -0800 (PST)
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
Subject: [PATCH v3 18/20] riscv: add ISA extension parsing for Zfa
Date: Tue,  7 Nov 2023 11:55:54 +0100
Message-ID: <20231107105556.517187-19-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_025627_028619_28F69E8F 
X-CRM114-Status: UNSURE (   9.87  )
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

QWRkIHBhcnNpbmcgZm9yIFpmYSBJU0EgZXh0ZW5zaW9uIFsxXSB3aGljaCB3ZXJlIHJhdGlmaWVk
IGluIGNvbW1pdAowNTZiNmZmNDY3YzcgKCJaZmEgaXMgcmF0aWZpZWQiKSBvZiByaXNjdi1pc2Et
bWFudWFsWzJdLgoKTGluazogaHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xVlQ2UUln
Z3BiNTktOFFSVjI2NmRFRTRUOEZaVHhHcTQvdmlldyBbMV0KTGluazogaHR0cHM6Ly9naXRodWIu
Y29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvY29tbWl0cy8wNTZiNmZmNDY3YzcgWzJdClNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQt
Ynk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vaHdjYXAuaCB8IDEgKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMSAr
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApp
bmRleCA3NTJiZTkxMGU3YzMuLjNmY2VhZTYwY2EzOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od2NhcC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApA
QCAtODYsNiArODYsNyBAQAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJSElOVE5UTAkJNjgKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aVkZICQk2OQogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRkhN
SU4JCTcwCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZBCQk3MQogCiAjZGVmaW5lIFJJU0NWX0lT
QV9FWFRfTUFYCQkxMjgKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9JTlZBTElECQlVMzJfTUFYCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMKaW5kZXggMGI5ZDE2ZWE3MWYxLi5kNThjOGU5Y2ViMDUgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC9jcHVmZWF0dXJlLmMKQEAgLTI2MSw2ICsyNjEsNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3Zf
aXNhX2V4dF9kYXRhIHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6
aWhpbnRudGwsIFJJU0NWX0lTQV9FWFRfWklISU5UTlRMKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFU
QSh6aWhpbnRwYXVzZSwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSksCiAJX19SSVNDVl9JU0Ff
RVhUX0RBVEEoemlocG0sIFJJU0NWX0lTQV9FWFRfWklIUE0pLAorCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHpmYSwgUklTQ1ZfSVNBX0VYVF9aRkEpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaCwg
UklTQ1ZfSVNBX0VYVF9aRkgpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpmaG1pbiwgUklTQ1Zf
SVNBX0VYVF9aRkhNSU4pLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYSwgUklTQ1ZfSVNBX0VY
VF9aQkEpLAotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
