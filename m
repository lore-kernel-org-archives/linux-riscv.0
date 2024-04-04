Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079E7CD1292
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ibpzU2SKtPWDKePrALXHqKUMD+rVlSZ4BeeoDIyS4r4=; b=JgLUzhVkApV7Nt
	pvocUY2buCctigInPRLDAo0xiiUPHElTDap+xPON1YkDBZEvNFucxqKCuZT6J2OXXFABn3wanyuxY
	ZQStwblYHI1IT6O57yA4653TlrgOC7uJHvW/Kvs+AlQcZIMwIWvEKVHkupctGncByNwWiEqq0p1iB
	o9/1znduxx7htTczWHoAGeGdf3Jr9rfxU5UYSUcPQXk17w3FXTl1RIc/f9nyvtdl7VuUpB18DJ0Nx
	Gv8lmisl2PzbahUKGYnVMD7BkHx69tZv2myqMcI+Ajo5dYxys+41oeFSuUK9RY77hFJaugiExOPMi
	8TsTDkIIeEMzbVw5bo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKQP-00000002Bv7-3w78;
	Thu, 04 Apr 2024 10:34:29 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKQM-00000002BsB-0xrP
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 10:34:27 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d82422d202so1477251fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712226863; x=1712831663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0yWpEBMuRREaN4Rfpr4/p3Cbe2kX6z7SdkYvYffV00=;
        b=gMY7Xod2oXqEnEL2/GNpA+OtfV7GToCjDPO+tBrrT0DcsYPgMvG5H9Os6+ErbD25gD
         aMPx9YVZDnKvOfWveINfh5pdQMoDTidVsCEM6ZNR373j+09KWsW4/3/iZrsFnEkPje4z
         ZIs9xpSWMB3y9ECgOIGmFiRykbyolvZcVmp5k4KjjqpYsEE37hXr+x11x1P+1GiLMLFs
         C+8UxRFcOG6DSZGpmf0TBprLtvcSdvcEt3VgeIoA8OggG3iqoDxSaV9yRIQDOkV7YAUB
         2sJmXA8Z9nW66qmOQcDfl1HtdPQMCn/uKLoxOyvCVN9Do8MNoM7w6ujvvEo26CIkJiZ6
         DrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712226863; x=1712831663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0yWpEBMuRREaN4Rfpr4/p3Cbe2kX6z7SdkYvYffV00=;
        b=JQ3o+lTUt+pJAje6Lz/3YSp0B7YyguRcrxSHorvgwyI4OXb1lMwjIktCh4d3zhDXIC
         1ItWxpO+JocRO79/Bqu3xC80+bB9byic+b/rFC2RrW2tGDh81Fn5qpWmWWNZfkfwwnpq
         7VW28Q4VznUicow1GIzWgsyAfvQLJRDUfq5/vnmSaPzc/ZLFK+3A4fPAec+iPM6yZgFq
         q1krrQCUTnIoDnRKoBbmnjV/YfpOzGm2t9/BApRHl/gBS0aMKFhO3t6Ohs26kIEIm3/T
         u5JD/SGLEuGcrSsTkgCCfZy/O3iWm5AuKhRu9govLKuXIgq/5s6giFPBXuWNKMU2wZ/S
         FKZw==
X-Forwarded-Encrypted: i=1; AJvYcCWPPQUJuBEmk4wkZIAsC5sAxJwVDVtTTsOVGD188VzBgsSoFs3UWsO3tx80gQpLjg7cWk138vjVxj6FwD/vRwJcE8tLwwXJyJKDhftNH/Ir
X-Gm-Message-State: AOJu0YxK+Ban1s6VhLXsz6iM0Xpo29rOzY26hw/XQjeY1DOet+kTeFLF
	b5d1c2tQfD70kyAC5sG87N9cypR6tgVkA5SG0+ZGqcGxgfUBASoeVSP5iv+ZZkw=
X-Google-Smtp-Source: AGHT+IGgwXcPXNss81WaNWWIVnkPiMwtrKqgSEy7SDtHw2OIS4sQFnmrJ6LWngbeMCuWYCY0SDTSXA==
X-Received: by 2002:a2e:99cf:0:b0:2d6:c59e:37bd with SMTP id l15-20020a2e99cf000000b002d6c59e37bdmr1469136ljj.3.1712226862690;
        Thu, 04 Apr 2024 03:34:22 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:555b:1d2e:132d:dd32])
        by smtp.gmail.com with ESMTPSA id ju8-20020a05600c56c800b00416253a0dbdsm2171340wmb.36.2024.04.04.03.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:34:22 -0700 (PDT)
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
Subject: [PATCH 0/5] Add parsing for Zimop ISA extension
Date: Thu,  4 Apr 2024 12:32:46 +0200
Message-ID: <20240404103254.1752834-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_033426_414326_FFE5E737 
X-CRM114-Status: UNSURE (   8.77  )
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

VGhlIFppbW9wIElTQSBleHRlbnNpb24gd2FzIHJhdGlmaWVkIHJlY2VudGx5LiBUaGlzIHNlcmll
cyBhZGRzIHN1cHBvcnQKZm9yIHBhcnNpbmcgaXQgZnJvbSByaXNjdixpc2EsIGh3cHJvYmUgZXhw
b3J0IGFuZCBrdm0gc3VwcG9ydCBmb3IKR3Vlc3QvVk0uCgpDbMOpbWVudCBMw6lnZXIgKDUpOgog
IGR0LWJpbmRpbmdzOiByaXNjdjogYWRkIFppbW9wIElTQSBleHRlbnNpb24gZGVzY3JpcHRpb24K
ICByaXNjdjogYWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWmltb3AKICByaXNjdjogaHdw
cm9iZTogZXhwb3J0IFppbW9wIElTQSBleHRlbnNpb24KICBSSVNDLVY6IEtWTTogQWxsb3cgWmlt
b3AgZXh0ZW5zaW9uIGZvciBHdWVzdC9WTQogIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIFpp
bW9wIGV4dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QgdGVzdAoKIERvY3VtZW50YXRpb24vYXJjaC9y
aXNjdi9od3Byb2JlLnJzdCAgICAgICAgICAgICAgICAgICAgfCA0ICsrKysKIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA1ICsrKysrCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oICAgICAgICAgICAgICAg
ICAgIHwgMSArCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggICAgICAgICAgICAg
ICAgICAgICAgIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgMSArCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5j
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArKwogdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jICAgICAgICB8IDQgKysrKwogOSBmaWxlcyBjaGFu
Z2VkLCAyMCBpbnNlcnRpb25zKCspCgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
