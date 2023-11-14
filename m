Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A506C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 15:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DclTkluSV2/m5719ocUav3LomujOYCuvryYAghUCi4k=; b=CC30Wt/BzppGkQ
	17WPJzG4D4+N8lSLX0ejMNNCOpqb6WJ+KRfQ43sv5nDOys2b1oTXGHRonGKF0kMdKmX6fhNjU89gE
	vRm/BAjbWdQPjA4GpUxJRfoBwqPl+cMnfjQhfVdvSn5ZFPMyG/up65FRyb57r+Bsi1vtpheFy17NL
	9MsDcCrBRXtjdUJNK9TYE7NFM5CS7tVA0/gbW7TSC/TGOTjvZmCLybORZc9kn14MpVf4iG7OMO0ax
	bU0dJu114frZx9WU3lk3kKd/uOdNKTEpB7E82jEtF2cxPgPcgBZ6FmgG70gN6ylCPbJCsH9ul622w
	8uBlG3JfoPTLbGM1hpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2v8W-00GHY1-2N;
	Tue, 14 Nov 2023 15:15:32 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAm-00G8xD-18
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:53 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3b2e08526b9so642660b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971225; x=1700576025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEYEszCfp8f2sFaBAy4eKryQQU+hp7kZpXxy9sdi/dQ=;
        b=nQb4Juoh+nZL4mLiMnIXOr6coreOILrftSJR51Hw8y6cU5zoBhX/sgB0zGI6F9JFWz
         lYcMrgUhfw5lclzbuHdCJO+6AqaIeGTgRRWra6QFRIQm9W/fg+A1oTIY6Qqh45zKBJhl
         NPuFwlX/oT/4/wzR3QRPlN7d001n5WuugYqkq7Z2VWfNFLjdmhD5nHcpKQM7RzcOEzOZ
         G02WHXi5bOUhAJKs6hlTGo70EZbwxmpcQglhn9/rK8TwnEwAk+ToB7goq1YDXbn2X9vi
         Mlk0h1vjfm7BTzq/8PNFYtgGQfSSipaEem3gz1SsXx2015lyAfZXoixP6ghhEgta8pek
         udew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971225; x=1700576025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEYEszCfp8f2sFaBAy4eKryQQU+hp7kZpXxy9sdi/dQ=;
        b=UWX2nn1K7dZxfj3mFTJFuqs3rebPO0ijvp0m9j3Hl/S3CR6sD0e0IKGI/x9hakxU4a
         oGGvLS1dx7CzyeQBxXc/1gm/Ra+rEDITPYAfsQGCzhVF+4T3Jif9YBl3TU0goIkbVvzP
         eBGqUnWo/9dGinGPeLpqwheMQyHweJy7kYIAzJLz7THtsIZkMVFpR6JFF1ot+NpHCGlx
         1aNhaWT4K3xQ2hxf4xoeH3fiJGz5Z7azG5c7J4GHyAMvSnnBQAJ9ySBOQiRbLWouQFIe
         dgYNRboe1Aib+45g1H+y1PcF6CNhwQbP5jhdGEJdd4pL4Ym0TNlnKXjbbneshGmPhTgx
         ynKg==
X-Gm-Message-State: AOJu0YxqaChHhBju4hxyfiDZdAKBXBt3Q/xGGtVIiKy5Lj7UcAWrgjv3
	Wnbqkn7Nq7dynEhJWOJoFbnbOzWCAVIeW5sJ4Fa8rg==
X-Google-Smtp-Source: AGHT+IGZDXgDf7Oyda/sT4+/a1oolhnnDFVdqByG3o5P/z09X4SwtY07cxiO09aQ9LMMrzbgtkqFGw==
X-Received: by 2002:a54:4688:0:b0:3b2:ef4e:23e1 with SMTP id k8-20020a544688000000b003b2ef4e23e1mr2189020oic.1.1699971225384;
        Tue, 14 Nov 2023 06:13:45 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:44 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 10/20] riscv: hwprobe: export Zfh[min] ISA extensions
Date: Tue, 14 Nov 2023 09:12:46 -0500
Message-ID: <20231114141256.126749-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061348_391608_31555443 
X-CRM114-Status: GOOD (  11.15  )
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

RXhwb3J0IFpmaFttaW5dIElTQSBleHRlbnNpb25zWzFdIHRocm91Z2ggaHdwcm9iZSBvbmx5IGlm
IEZQVSBzdXBwb3J0CmlzIGF2YWlsYWJsZS4KCkxpbms6IGh0dHBzOi8vZHJpdmUuZ29vZ2xlLmNv
bS9maWxlL2QvMXozdFFRTG01QUxzQUQ3N1BNMGwwQ0huYXB4V0NlVnpQL3ZpZXcgWzFdClNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQt
Ynk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgotLS0KIERvY3VtZW50YXRpb24vYXJj
aC9yaXNjdi9od3Byb2JlLnJzdCAgfCA2ICsrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkv
YXNtL2h3cHJvYmUuaCB8IDIgKysKIGFyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jICAgICAg
ICAgfCA1ICsrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKaW5kZXggYTA4ZmNkODk5YjZkLi4zOTdkNTMxOTVmNDkg
MTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAorKysgYi9E
b2N1bWVudGF0aW9uL2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QKQEAgLTE0MCw2ICsxNDAsMTIgQEAg
VGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgogICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BS
T0JFX0VYVF9aVktUYDogVGhlIFp2a3QgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcwogICAgICAg
IGRlZmluZWQgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIFJJU0MtViBDcnlwdG9ncmFwaHkgRXh0ZW5z
aW9ucyBWb2x1bWUgSUkuCiAKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9FWFRfWkZIYDog
VGhlIFpmaCBleHRlbnNpb24gdmVyc2lvbiAxLjAgaXMgc3VwcG9ydGVkCisgICAgICAgYXMgZGVm
aW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwuCisKKyAgKiA6YzptYWNybzpgUklTQ1ZfSFdQ
Uk9CRV9FWFRfWkZITUlOYDogVGhlIFpmaG1pbiBleHRlbnNpb24gdmVyc2lvbiAxLjAgaXMKKyAg
ICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51YWwuCisKICog
OmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFzayB0aGF0IGNv
bnRhaW5zIHBlcmZvcm1hbmNlCiAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBzZWxlY3RlZCBzZXQg
b2YgcHJvY2Vzc29ycy4KIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXgg
ODk2MjhhNzZjYTA0Li4yZDk2MDc3N2VhNDMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3
cHJvYmUuaApAQCAtNTAsNiArNTAsOCBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5l
CQlSSVNDVl9IV1BST0JFX0VYVF9aVktTRUQJKDEgPDwgMjQpCiAjZGVmaW5lCQlSSVNDVl9IV1BS
T0JFX0VYVF9aVktTSAkJKDEgPDwgMjUpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVktU
CQkoMSA8PCAyNikKKyNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pGSAkJKDEgPDwgMjcpCisj
ZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aRkhNSU4JKDEgPDwgMjgpCiAjZGVmaW5lIFJJU0NW
X0hXUFJPQkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdO
RURfVU5LTk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VN
VUxBVEVECSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3Yu
YyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCmluZGV4IDliYmNkNzMzNGQ5Ni4uZDc3
NmM2YzM5ZmNkIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwpAQCAtMTg2LDYgKzE4NiwxMSBAQCBzdGF0
aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAogCQkJ
RVhUX0tFWShaVktTSCk7CiAJCQlFWFRfS0VZKFpWS1QpOwogCQl9CisKKwkJaWYgKGhhc19mcHUo
KSkgeworCQkJRVhUX0tFWShaRkgpOworCQkJRVhUX0tFWShaRkhNSU4pOworCQl9CiAjdW5kZWYg
RVhUX0tFWQogCX0KIAotLSAKMi40Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
