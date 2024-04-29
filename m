Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FDAC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sbVC5b2OfLezEntV47BYWWf8g1NXb13n9j5CToTFq8=; b=Y3p0JI4t8NyYnA
	Bba8Y45rvIN+X/B2OugXPdIG65Ce+bSsVPDW86LhqA/6DhgreU2Ue8HyDgo3mOA7MWz45eUHz9Hp+
	7x1gx6tQMJT21c26yL6zzwUXkGkQTT1TMcXIeV04vMj/6srLB2MwSXZsHQjJ77UNQyRn4qxvcQGwx
	ePNEwi0wAWcqeb85tbpMGx7dBHxLRsUNAOF5rd4qqpvA35tYiMMTYTJP3plu3VAWIIimHz0lZBAFi
	qEELn+DNVdmATuTQxcFwIoCpmWd2uvmT3ZzRq/RHjw7qCLJK88kpPFv4GyXtIkTwMZt9aarA+DEIE
	Wk/OgD7GGppme2a8HYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sds-00000003IkK-1Doc;
	Mon, 29 Apr 2024 15:10:08 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sag-00000003GY0-0V0u
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 15:06:53 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2d874b89081so11368521fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 08:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403208; x=1715008008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=;
        b=ZP95paKz2EvFYLeCl6+/3hf6MZUdauJM4IYpFc7cYCEcWTvmiu/Bbyzo16J6JHt+of
         aGHRateJZDf8BQ+pxSxaODZC6SGmC5N4Hxm43eSK6BDic40VLlKEcZJSfgbudQvllM39
         5UeWjpWSNfRTgc0mXNPTyOV/rx44UYAgpdqUGwDwwdQhKPzPPTFkAoO6fM69/t5feH2H
         tJBSUznHEZrYA+4E05lz8IpxzfuRFwrVu35he+Mx8zX2oEWPP1e+M4oC2eT/+j4xIqHu
         1z7SdXLcW5u6ElhhltC62cJsBCsus0dC48LGTeHgpfYvJtAqalVzBbGIu/+VZSLkOdx+
         4oAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403208; x=1715008008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=;
        b=m38giGkpAT2q168LUQMzA8TsukMK0cX3MNSPw+6xt/cao7oyOzylUcJaVJvcgoA64p
         rcbHUi7lRHeGY7Fgw2wE92uiQk4wNY5jeaKNQk0TgyOpqSyy21XU/N5prp6MWQerOXZz
         MhngmsjTQR38GPWe4MyGKPpFDp2S3svAL3D7Wvc9ORUft/mKufGWRwo9XKArQtceNz0E
         q0n0BIIDNdgfq12+fFwF/puFoXZjiUA8pXgIptz9pmOxId4I7vhY6zckJWG+kemIvEFf
         ow1LBu+HeK5L92RqEtFjN4DwMqBDJAeqycg9DB1nA1Me+JHHizJ1Im/3mm9ZkIQpN4Ow
         I0nA==
X-Forwarded-Encrypted: i=1; AJvYcCXassbbDIvKfXNR0B7gwxUIUkJmkvF4lDiMx3KvDCJ38H0rmJwj29EYJE+9PU+rIkScqJCNNTdk0BmLr3po4sHu8KD1+1XILBIbTMiQz/PY
X-Gm-Message-State: AOJu0YwaTmKquJcoDEd17YCrV5z/H2cYkVDL0TbRzKLYycALqc2HmbNo
	NRDl9RBXDAwdnGAsx0RbcaI1lhGSJIm+F9r2AWPCyABZtBzEmc7yKv4sAGlA2k6e6kkB7XhVxw3
	nkJg=
X-Google-Smtp-Source: AGHT+IFUPbNj9asOLzqFLPgus0GUY/Odrs/fM5IrKod7ciE1XYceryhw7TEo0KRJRFoqh4qbjQ5JMQ==
X-Received: by 2002:a2e:9586:0:b0:2dd:c6c8:dff1 with SMTP id w6-20020a2e9586000000b002ddc6c8dff1mr6069010ljh.4.1714403207977;
        Mon, 29 Apr 2024 08:06:47 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:47 -0700 (PDT)
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
Subject: [PATCH v4 11/11] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Mon, 29 Apr 2024 17:05:04 +0200
Message-ID: <20240429150553.625165-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429150553.625165-1-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080650_306962_32E128C2 
X-CRM114-Status: UNSURE (   9.29  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFpjbW9wIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0gc28gYWRk
IHRoaXMKZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWct
bGlzdC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDYx
Y2FkNDUxNDE5Ny4uOTYwNGM4ZWNlNzg3IDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCkBAIC01OSw2ICs1OSw3IEBAIGJvb2wgZmlsdGVy
X3JlZyhfX3U2NCByZWcpCiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0I6CiAJY2FzZSBLVk1fUkVHX1JJ
U0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VY
VF9aQ0Q6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9T
SU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ0Y6CisJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9F
WFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQ01PUDoK
IAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8
IEtWTV9SSVNDVl9JU0FfRVhUX1pGQToKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtW
TV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pGSDoKIAljYXNlIEtW
TV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVND
Vl9JU0FfRVhUX1pGSE1JTjoKQEAgLTQyOSw2ICs0MzAsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAq
aXNhX2V4dF9zaW5nbGVfaWRfdG9fc3RyKF9fdTY0IHJlZ19vZmYpCiAJCUtWTV9JU0FfRVhUX0FS
UihaQ0IpLAogCQlLVk1fSVNBX0VYVF9BUlIoWkNEKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpDRiks
CisJCUtWTV9JU0FfRVhUX0FSUihaQ01PUCksCiAJCUtWTV9JU0FfRVhUX0FSUihaRkEpLAogCQlL
Vk1fSVNBX0VYVF9BUlIoWkZIKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpGSE1JTiksCkBAIC05NTcs
NiArOTU5LDcgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2EsIFpDQSksCiBLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHpjYiwgWkNCKSwKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUco
emNkLCBaQ0QpLAogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2YsIFpDRiksCitLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHpjbW9wLCBaQ01PUCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09O
RklHKHpmYSwgWkZBKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemZoLCBaRkgpOwogS1ZN
X0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6ZmhtaW4sIFpGSE1JTik7CkBAIC0xMDE3LDYgKzEwMjAs
NyBAQCBzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7CiAJJmNvbmZpZ196
Y2IsCiAJJmNvbmZpZ196Y2QsCiAJJmNvbmZpZ196Y2YsCisJJmNvbmZpZ196Y21vcCwKIAkmY29u
ZmlnX3pmYSwKIAkmY29uZmlnX3pmaCwKIAkmY29uZmlnX3pmaG1pbiwKLS0gCjIuNDMuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
