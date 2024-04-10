Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886CECD129C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FcydCKnI95qi4XTlWt3FCotUVu5EhO9XHhvsYfwA1yc=; b=UKaqdeR+MoBqlw
	fgavnzu15DMlEGUFoeKz6O2kfcbr6NvqRDH4c5TqzqmebLGZ/+xmnPdQRXEdAL68oZ12AtRmJ5uke
	IAn3ZienGr/zg4LXibeiRksM7FA0ESjZsczTdImcvUxsoOyppaWbnDi+ySySYq18R8Lc2FBq5MaGS
	5/zplWpOq44ikH75fejUGNnwhUEq6+iI3OwBx70XkyDD84DFHfdKS9na+btSG/0d9fOsoLomX0vrA
	6oJsuBJCI/j2nqgx7EJDMJ84V+GQVrcBDoH4gwDMUlymdnKGIcOmPVdDkGrLN1NDbJhnCA96udlDD
	1IpatcLOhSSFMrGqKyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzc-000000063Rr-1W1A;
	Wed, 10 Apr 2024 09:11:44 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzB-0000000635e-3B4J
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:20 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-343c8d7064aso1125255f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740276; x=1713345076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Bj6qFEBTQkW22oNb4zguAXGn3Gn0KYF9aSmL0IcZwU=;
        b=cqW1t2Hy+Bfc7UaoHPVHRs3XKWJD00Lbx/WWykxqWuT0UBv/egCgCV4m082sP7pr+F
         BUwVe5vIohDSP50iR6avbRRgghjgFglgkfUSY4Wg9IYBGIrBxMd5rhoJZTqI4JLMszu/
         3CTo9r6M6sKgjRGMrJpslwpiX59vW1fYaJfSOdp6CK0gxMWxtCVIQBM2BWWt8y9FQmif
         GTGbaJWA/OcmwAKwnV3OeGU6GmlPo/rbnAv1MsC1iSfYgqEMHKagHEsB1Rv+62oRGEGW
         FvKuPpGIBiWuUbxZqDeRbD6DaJtdupJSFa9DmMF+3PMUSvXcbNcG175EakOLxF2nbpDg
         dliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740276; x=1713345076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Bj6qFEBTQkW22oNb4zguAXGn3Gn0KYF9aSmL0IcZwU=;
        b=HWUzBmVpujLXW2cvrQiAvg6CbHuUb2PybM29yUVvvEsZjn/Ue0x66ShITpE3Q/aOXx
         EUBMlai46LqRr1xywor7CDB4/UnJXANMhY3fv+Hg3gswZTitdu++/5VrHAOh84BQI4bp
         Zkw3eWd9csMbH63wEytairqYFxmI/xUMFMCi5CPEtCYJADnVT9jzqmnWvBx+ZX/gMj15
         3f+XxFmjuJgSJH3YwbHXtAWEoRmsnxsWLQyubQRgK/nzozgp8IcK7lSeY2g9o/0Byfti
         V5nFz/xhTxW6UND12sjL/DvIDb/R+nCokbmSyikk9jTkx58pDMAxUgh+5vChSZGeeuZ8
         b2rA==
X-Forwarded-Encrypted: i=1; AJvYcCVMQXnBrCRrFi9M/L7gCM+3Ng+iimG4kCedF6TMav47E6RcUpbKX7/wH1AJVYJFHLTaiQTiTjcS0CyeiDRzsnrC0JxDmnIBOFHH6gm8VMX2
X-Gm-Message-State: AOJu0Yyc9L4SG+U7d/Cql7UpEV88/bWK5/mJJuJw46ERC6nzyaQqUdYl
	Xxlu/P/1/ngOIYUpVpyG2FOO+KKjld7vyOHTQhvHjjFyizKDWLzwL71MkEUqMiQ=
X-Google-Smtp-Source: AGHT+IFAB0sJwJ6MYsANct+Q6sx/TH9SG9iB1/Tv2iCf5OGRfMeMXNSvy6Zvyw0SeigYNf2ZXmUcCg==
X-Received: by 2002:a05:6000:1448:b0:346:65dd:55f5 with SMTP id v8-20020a056000144800b0034665dd55f5mr1201789wrx.2.1712740276476;
        Wed, 10 Apr 2024 02:11:16 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:15 -0700 (PDT)
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
Subject: [PATCH 05/10] KVM: riscv: selftests: Add some Zc* extensions to get-reg-list test
Date: Wed, 10 Apr 2024 11:10:58 +0200
Message-ID: <20240410091106.749233-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021118_008219_D43B90CD 
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFpjYSwgWmNmLCBaY2QgYW5kIFpjYiBleHRlbnNpb25zIGZv
ciBHdWVzdC9WTSBzbwphZGQgdGhlc2UgZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxpc3QgdGVzdC4K
ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0t
CiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCAxNiAr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwppbmRleCA0
MDEwN2JiNjE5NzUuLjYxY2FkNDUxNDE5NyAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwpAQCAtNTUsNiArNTUsMTAgQEAgYm9vbCBmaWx0
ZXJfcmVnKF9fdTY0IHJlZykKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdf
UklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCS0M6CiAJY2FzZSBLVk1fUkVH
X1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNB
X0VYVF9aQktYOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9J
U0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkJTOgorCWNhc2UgS1ZNX1JFR19SSVNDVl9J
U0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNB
OgorCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xF
IHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNCOgorCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwg
S1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNEOgorCWNhc2Ug
S1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkNGOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19S
SVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkZBOgogCWNhc2UgS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9F
WFRfWkZIOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0Ff
U0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkZITUlOOgpAQCAtNDIxLDYgKzQyNSwxMCBAQCBz
dGF0aWMgY29uc3QgY2hhciAqaXNhX2V4dF9zaW5nbGVfaWRfdG9fc3RyKF9fdTY0IHJlZ19vZmYp
CiAJCUtWTV9JU0FfRVhUX0FSUihaQktDKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpCS1gpLAogCQlL
Vk1fSVNBX0VYVF9BUlIoWkJTKSwKKwkJS1ZNX0lTQV9FWFRfQVJSKFpDQSksCisJCUtWTV9JU0Ff
RVhUX0FSUihaQ0IpLAorCQlLVk1fSVNBX0VYVF9BUlIoWkNEKSwKKwkJS1ZNX0lTQV9FWFRfQVJS
KFpDRiksCiAJCUtWTV9JU0FfRVhUX0FSUihaRkEpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkZIKSwK
IAkJS1ZNX0lTQV9FWFRfQVJSKFpGSE1JTiksCkBAIC05NDUsNiArOTUzLDEwIEBAIEtWTV9JU0Ff
RVhUX1NJTVBMRV9DT05GSUcoemJrYiwgWkJLQik7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklH
KHpia2MsIFpCS0MpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Ymt4LCBaQktYKTsKIEtW
TV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemJzLCBaQlMpOworS1ZNX0lTQV9FWFRfU0lNUExFX0NP
TkZJRyh6Y2EsIFpDQSksCitLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjYiwgWkNCKSwKK0tW
TV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemNkLCBaQ0QpLAorS1ZNX0lTQV9FWFRfU0lNUExFX0NP
TkZJRyh6Y2YsIFpDRiksCiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpmYSwgWkZBKTsKIEtW
TV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemZoLCBaRkgpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NP
TkZJRyh6ZmhtaW4sIFpGSE1JTik7CkBAIC0xMDAxLDYgKzEwMTMsMTAgQEAgc3RydWN0IHZjcHVf
cmVnX2xpc3QgKnZjcHVfY29uZmlnc1tdID0gewogCSZjb25maWdfemJrYywKIAkmY29uZmlnX3pi
a3gsCiAJJmNvbmZpZ196YnMsCisJJmNvbmZpZ196Y2EsCisJJmNvbmZpZ196Y2IsCisJJmNvbmZp
Z196Y2QsCisJJmNvbmZpZ196Y2YsCiAJJmNvbmZpZ196ZmEsCiAJJmNvbmZpZ196ZmgsCiAJJmNv
bmZpZ196ZmhtaW4sCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
