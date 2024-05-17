Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D3FC04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sbVC5b2OfLezEntV47BYWWf8g1NXb13n9j5CToTFq8=; b=Hj5agSzYyhB/u3
	lq1aFQK3m89ip/8PUbW/hfmEWFpoeC8p/bthQNIR2abpf7LbX2LO5MFShMvl9qb3E71U4QLRO8PJi
	mRMfuCqhocW1vQ1EUVKjHe3H5VeQDM/bK6cmNJLeZ15xdQMzPlKpI3Z7FdAFVWwERb7hAFikirAoh
	/JQAC5p721QpRbs82Yk+EoADi/MqVh4jS2swnPE083/TbsAn22lScAu3FpIdi5TuGDnCeEum6pPWn
	+keecFCmLPGlC8xfHChNIYK3c/WVF5dVrwSlN1Us2Om4Llm8do44j0UNWIcUdB4PD8vAtTS33Axkc
	j4pmauTmembH1r5vfhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yys-000000089NZ-2bLW;
	Fri, 17 May 2024 14:54:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yy3-000000088Ym-1h56
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 May 2024 14:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=; b=rbe+rgUluf+s0e/l0V5X/s8nWW
	DFfzLN3rEH8Df1ChElBKvuArjeNU+HdukMEuO5ugQfwFySWSYQa5u3Z7/SxIBe7VJNbQ95I+FT23u
	l2oMx8gVD6inIjz9wvK/+mtiC9fa2Ks8kbNRaPsDVjOxP/aGbaIdMY4ZRcw/32mpLh8ZjYvMYftxR
	ZIg09lW0Tn8J4Btu3/KyicXMJXmQXKSVaTwlWPSfHUN2VB2tf+0m7fc+DvtoYLk1ESElit8zs9WK1
	mZP2l5DFtjwchX+kM/QdUbbOmLhdkxm1gnFuD/EyGHlQlXR6wTVrm0cgKRSAjUTH0uLABRci/y9cS
	gZGrEfnw==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7yxz-00000005itF-0DQN
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 14:53:53 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-351d86910deso29097f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 17 May 2024 07:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715957617; x=1716562417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=;
        b=NCSgGXKy22VAjFgNx/qI9aoKAIeL7ScpYTFS2tgpJ/taJk41wjdOQuCKVXuBVU+5f0
         CBOjpRdlE2oYYps1w61whAStVoiSn6eS5cmumKhAH2pJ7I1SacqLLcTM3fcHVfyJb0UK
         CWF9swsbZt1Al7b23cD1WrhezUW8H7GnXSR9a2lv3KbQiuwn/2z/sHijTyU8H//8KiG8
         /IJdwK5thZPclRZKwUCSftCLZZhPONCbImvHhb+x7dk/xJb+q1yUiPpDAO2y1pvJrqM3
         A51O8CdBfxD7c4AlYoHnXsVCmnZ5HEHiZ+XtehSFHl9dFcXVidoVyFOJdo0OOaS7VJvb
         LyBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715957617; x=1716562417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=;
        b=VpHw95KbveEzOeBEaMQzfRk698YQo2YVSUSvxXqWL8eLceXcCvCgPAoF9nAXCDAbLT
         UaDFDG3xE5KW2+qgzbYrExmFK0PASgrfdJz3rCMqNB4uv7MPyMs+i9y+jaGmAQ2Tphg/
         psrcNBv+2BU8b2IkOij/gsQimJUVWANYtjq2SOUsL8/q/qIBGEi22tBOIIUDh/FspFyI
         eA/C0DYBv8qFmsK9thaepPzfNDwESX2rKTOMENo9+hhFleZXT1isJgBhK9BHOS3FMdai
         TZ4ed8qDUXc3P3stsvZxuwwtjKNV7rA5FTjj/Ct4q0AV+YdUOWcvPlSBCXIVzB/cZfpm
         bfWg==
X-Forwarded-Encrypted: i=1; AJvYcCXWD4drPeobaJ3PemUrcJDa8sdcrdifsUAxLRCZpT8qCgSAal69tTDW+mp6XGLv9pMqNE20vtqen4ykLKV3+MnLu6+BzF1Dm3Gye/FiGBUH
X-Gm-Message-State: AOJu0Yx25fMXQ7/OqREnaeW1eiCm42Ge+2FohqCs8XDZ9JL49DR/+yJw
	SpTZ9pDrK3swkBbiN4pfR5e7xMWCut+97XjhpkVnJ0e7B1/1QzKraKe/fHrv36E=
X-Google-Smtp-Source: AGHT+IFOQbqpkXAFZ+YravAaGBjZr48UyjitjGy6UF5iu6XOF0ZSxSlCzpVIUM9l+O9Eld2jghPS1w==
X-Received: by 2002:a05:600c:3b86:b0:418:f770:ba0 with SMTP id 5b1f17b1804b1-41fea52ef14mr167166955e9.0.1715957617104;
        Fri, 17 May 2024 07:53:37 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:46f0:3724:aa77:c1f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccce9431sm301723695e9.28.2024.05.17.07.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:53:36 -0700 (PDT)
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
Subject: [PATCH v5 16/16] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Fri, 17 May 2024 16:52:56 +0200
Message-ID: <20240517145302.971019-17-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240517145302.971019-1-cleger@rivosinc.com>
References: <20240517145302.971019-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_155351_533610_BF42A7B1 
X-CRM114-Status: UNSURE (   8.98  )
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
