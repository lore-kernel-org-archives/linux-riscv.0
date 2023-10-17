Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A8FCDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 13:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YMzGweLlqmkw7Cbidjtj3Ph2+yvLceI4CGtOoblMVYc=; b=wXcDgNCl7O9trV
	gNNIs6i2+2EvK9eaN2TnTJXnT2cR7AFxNGaboDM7SzCpFCNdtfOB1/7Hd5Civ70oHxGAX35YM57Ps
	S4jmVAOH+hRk24ERdaMABBb0OWGmNdz5RCHY98rB5cqjf0Hy3n0yuGwYHRKe5WoSoJ98fmbOgMdqU
	gb0G7i2Twux1PfocgRPCFc72e/pDHoPh/XR+8kcCcFNnwVWfRuE7G/ukvaGUHLtfO3LGR6Y/52irW
	cjYGzSR/mVyDDqg8QxqD7dGARCVX1iSNLSppYHkOx5cjFyhD4pPIRNhiGyGYsAQZat++9AYK0VpbD
	I/M5WDZM3+r7I4ZvnOHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjv3-00CN1g-0z;
	Tue, 17 Oct 2023 13:15:33 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsjuz-00CN0K-2P
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 13:15:31 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bbbe81185dso14807961fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697548526; x=1698153326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJAHN6fXys4+chbQTYaGErBWbio2Bi7IHGHKbLKG294=;
        b=CHjpzYwNV4RMRx+u4kdd782Mt8qhXrw1S7TuNUIVxR+8DZnaaBXGEm6D03Nyk5mSGX
         fvhT3VaoZX39CzvWouHf/z8Xy5IsrcZfifSizVJvxdfOPuL005+6aOnXWkUkbmI7aQYw
         L7gE6aVkW5nbH3xc5MH7FmvIHP/FBnoWFKWbRwbb4VF+JCZ6+GBFArGwixYKbKqpHQP7
         bKoYJkLopai5sh9G7RtoJCtCPrbObTktwz9hx+P/A8/KpuouBNgucsYcSjNXn7L8suDC
         Z3JqWOYOYlMBCrfZc6sHKYwXk6Ux0kQvyxBaayzAjEpn6PkvK7e8HKudTOVETMUilBkE
         DvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548526; x=1698153326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJAHN6fXys4+chbQTYaGErBWbio2Bi7IHGHKbLKG294=;
        b=LAc7HjhqB989ZfThzKFyhH4tPK5qy1F/u7kCRCLfcVvE0W8mSclfGQolgqkUGbcdnX
         mDaO97ddgFcs8PkcT2EPK33cG4S1yTOs6Xjw5/XMCqx/MnKS2cxlCNbacWWSzXDQYUSL
         vHH9CNXiwqINPMP4FyJ7b1e6Yz4iYMf0h20HxXSwNRyxIkKboStFd4+jHUwZxj1EKiXz
         S74dLOcUtk4wdLcasqImbIEaPFzPQTQdC2M0c2ltjEqKWr3tr3+XrbKwsHi1x3YbYXY2
         Kji8H6coo4vcs1FfCj1ozWGIZVaTKkqqJEows4/vrAixpFk79VUVmTZJomBNpy8zry9M
         ZENw==
X-Gm-Message-State: AOJu0Yxl61IpJeldFErCxGWCzqc9iXRZMwgWceCCgpWVxmXhH6Zb5OSr
	7JNtPKxIlmtw7/LGDaAjKxWW42vyKWCwz5rlu/KD0Q==
X-Google-Smtp-Source: AGHT+IFmJd0Jv9jaCEa9LrAcAAx0Uv4PFE1Q1v9qEK4kiLK109S5gB4b1spDwnBQbpEQP4T9Ww4c5g==
X-Received: by 2002:a05:651c:119b:b0:2c5:36e:31ef with SMTP id w27-20020a05651c119b00b002c5036e31efmr1527955ljo.5.1697548526439;
        Tue, 17 Oct 2023 06:15:26 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:96:820c:ecf7:a817])
        by smtp.gmail.com with ESMTPSA id fj7-20020a05600c0c8700b0040772138bb7sm9873393wmb.2.2023.10.17.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:15:25 -0700 (PDT)
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
Subject: [PATCH v2 00/19] riscv: report more ISA extensions through hwprobe
Date: Tue, 17 Oct 2023 15:14:37 +0200
Message-ID: <20231017131456.2053396-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_061530_025353_BB6CC9C4 
X-CRM114-Status: GOOD (  10.79  )
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

SW4gb3JkZXIgdG8gYmUgYWJsZSB0byBnYXRoZXIgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
c3VwcG9ydGVkIElTQQpleHRlbnNpb25zIGZyb20gdXNlcnNwYWNlIHVzaW5nIHRoZSBod3Byb2Jl
IHN5c2NhbGwsIGFkZCBtb3JlIElTQSBleHRlbnNpb25zCnJlcG9ydC4gVGhpcyBzZXJpZXMgYWRk
cyB0aGUgZm9sbG93aW5nIElTQSBleHRlbnNpb25zIHBhcnNpbmcgc3VwcG9ydDoKCi0gWmZoW21p
bl0KLSBadmZoW21pbl0KLSBaaWhpbnRudGwKLSBaYmMKLSBadmJiCi0gWnZiYwotIFp2a2IKLSBa
dmtnCi0gWnZrbmVkCi0gWnZrbmhbYWJdCi0gWnZrc2VkCi0gWnZrc2gKLSBadmtuCi0gWnZrbmMK
LSBadmtuZwotIFp2a3MKLSBadmtzYwotIFp2a3NnCi0gWnZrdAotIFpmYQotIFpia2IKLSBaYmtj
Ci0gWmJreAotIFprbmQKLSBaa25lCi0gWmtuaAotIFprcgotIFprc2VkCi0gWmtzaAotIFprdAoK
U29tZSBvZiB0aGVzZSBleHRlbnNpb25zIGFyZSBhY3R1YWxseSBzaG9ydGhhbmRzIGZvciBvdGhl
ciAic3ViIgpleHRlbnNpb25zLiBUaGlzIHNlcmllcyBpbmNsdWRlcyBhIHBhdGNoIGZyb20gQ29u
b3IvRXZhbiB0aGF0IGFkZHMgYSB3YXkKdG8gc3BlY2lmeSBzdWNoICJidW5kbGVkIiBleHRlbnNp
b25zLiBXaGVuIGV4cG9zaW5nIHRoZXNlIGJ1bmRsZWQKZXh0ZW5zaW9ucyB0byB1c2Vyc3BhY2Ug
dGhyb3VnaCBod3Byb2JlLCBvbmx5IHRoZSAic3ViIiBleHRlbnNpb25zIGFyZQpleHBvc2VkLgoK
SW4gb3JkZXIgdG8gdGVzdCBpdCwgb25lIGNhbiB1c2UgcWVtdSBhbmQgdGhlIHNtYWxsIGh3cHJv
YmUgdXRpbGl0eQpwcm92aWRlZFsxXS4gUnVuIHFlbXUgYnkgc3BlY2lmeWluZyBhZGRpdGlvbmFs
IElTQSBleHRlbnNpb25zLCBmb3IKaW5zdGFuY2U6CgokIHFlbXUtc3lzdGVtLXJpc2N2NjQgLWNw
dSBydjY0LHY9dHJ1ZSx6az10cnVlLHp2a3NoPXRydWUsenZrbmVkPXRydWUKICA8d2hhdGV2ZXIg
b3B0aW9ucyB5b3Ugd2FudD4KClRoZW4sIHJ1biBod3Byb2JlX2R1bXA6CgokIC4vaHdwcm9iZV9k
dW1wCkJhc2Ugc3lzdGVtIElTQToKIC0gSU1BX0ZECiAtIEMKIC0gVgpTdXBwb3J0ZWQgZXh0ZW5z
aW9uczoKIC0gWmJhCiAtIFpiYgogLSBaYnMKIC0gWmJjCiAtIFpia2IKIC0gWmJrYwogLSBaYmt4
CiAtIFprbmQKIC0gWmtuZQogLSBaa25oCiAtIFprdAogLSBadmtuZWQKIC0gWnZrc2gKIC0gWmlo
aW50bnRsCiAtIFpmYQoKTGluazogaHR0cHM6Ly9naXRodWIuY29tL2NsZW1lbnRsZWdlci9od3By
b2JlX2R1bXAgWzFdCgotLS0KCkNoYW5nZXMgaW4gVjI6CiAtIEZpeCB0eXBvIGluIGZpcnN0IGNv
bW1pdCB0aXRsZSAoZmF0b3JpemUtPmZhY3Rvcml6ZSkKIC0gQWRkIFpmYSBzdXBwb3J0CiAtIEZp
eCBtaXNzaW5nIHVwcGVyY2FzZSBmb3IgWnZrdCBuYW1pbmcgaW4gZHQtYmluZGluZ3MKIC0gQWRk
IENvbm9yIEFja2VkLWJ5IG9uIGR0LWJpbmRpbmdzIGNvbW1pdHMKIC0gQWRkIHNjYWxhciBjcnlw
dG8gc3VwcG9ydCBmcm9tIENvbm9yL0V2YW4uCiAtIFVzZSByZXBvcnRpbmcgb2YgYnVuYmxlZCBl
eHRlbnNpb25zIGZvciB2ZWN0b3IgY3J5cHRvCgpDbMOpbWVudCBMw6lnZXIgKDE4KToKICByaXNj
djogaHdwcm9iZTogZmFjdG9yaXplIGh3cHJvYmUgSVNBIGV4dGVuc2lvbiByZXBvcnRpbmcKICBy
aXNjdjogaHdwcm9iZTogYWRkIHN1cHBvcnQgZm9yIHNjYWxhciBjcnlwdG8gSVNBIGV4dGVuc2lv
bnMKICBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBzY2FsYXIgY3J5cHRvIElTQSBleHRlbnNpb25z
IGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNpbmcgZm9yIHZlY3Rv
ciBjcnlwdG8gZXh0ZW5zaW9ucwogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgdmVjdG9yIGNyeXB0
byBJU0EgZXh0ZW5zaW9ucwogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIHZlY3RvciBjcnlwdG8g
SVNBIGV4dGVuc2lvbnMgZGVzY3JpcHRpb24KICByaXNjdjogYWRkIElTQSBleHRlbnNpb24gcGFy
c2luZyBmb3IgWmZoL1pmaG1pbgogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmZoL1pmaG1pbiBJ
U0EgZXh0ZW5zaW9ucwogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFpmaFttaW5dIElTQSBleHRl
bnNpb25zIGRlc2NyaXB0aW9uCiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNpbmcgZm9y
IFppaGludG50bAogIHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWmhpbnRudGwgSVNBIGV4dGVuc2lv
bgogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFppaGludG50bCBJU0EgZXh0ZW5zaW9uIGRlc2Ny
aXB0aW9uCiAgcmlzY3Y6IGFkZCBJU0EgZXh0ZW5zaW9uIHBhcnNpbmcgZm9yIFp2ZmhbbWluXQog
IHJpc2N2OiBod3Byb2JlOiBleHBvcnQgWnZmaFttaW5dIElTQSBleHRlbnNpb25zCiAgZHQtYmlu
ZGluZ3M6IHJpc2N2OiBhZGQgWnZmaFttaW5dIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24KICBy
aXNjdjogYWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWmZhCiAgcmlzY3Y6IGh3cHJvYmU6
IGV4cG9ydCBaZmEgSVNBIGV4dGVuc2lvbgogIGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFpmYSBJ
U0EgZXh0ZW5zaW9uIGRlc2NyaXB0aW9uCgpFdmFuIEdyZWVuICgxKToKICByaXNjdjogYWRkIElT
QSBleHRlbnNpb24gcGFyc2luZyBmb3Igc2NhbGFyIGNyeXB0bwoKIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDIxMCArKysrKysrKysrKysrKysrKysKIERv
Y3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgICAgICAgICB8ICA4MSArKysrKysr
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAgfCAgMzMgKyst
CiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oICAgICAgICAgfCAgMjYgKysr
CiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAgICAgICAgfCAxNjUgKysr
KysrKysrKysrLS0KIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jICAgICAgICAgICAgICAg
ICB8ICA2NCArKysrLS0KIDYgZmlsZXMgY2hhbmdlZCwgNTQzIGluc2VydGlvbnMoKyksIDM2IGRl
bGV0aW9ucygtKQoKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
