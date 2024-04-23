Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA9AC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Apr 2024 12:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4sbVC5b2OfLezEntV47BYWWf8g1NXb13n9j5CToTFq8=; b=bay77BzWU3fz36
	X8ns1L1VVL0PbTpq6dYxvQVa9jaxgzUPj9OHOc7xxHtGN1vY6J90uoTUF7vupJRnIUkSotCArl28l
	3o07RY01aLopJgu8maGSqdtKcdcRk5LiqAvCkcKjCh9t6j+M5C8pmL6tgwtsdK6RH4jzKQdBIpLmT
	FWre/yG/F6lSB9Ng+QyRHGmfemTWQytPoGYgDeTgiYBIxW1QWeUQ68sZA0bTU4ElaVtGWL9sDEW1k
	tdqlpdjeNeUXP+/JD7pOViPpxT/w47hjZMC9meavl2ewvFeylYUwvYdZFz8ob3UpITKTDwS71X14P
	dXFP2BjlDtxjFjvxggfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFVs-0000000HTAy-3936;
	Tue, 23 Apr 2024 12:44:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFV5-0000000HSUz-3vTc
	for linux-riscv@lists.infradead.org;
	Tue, 23 Apr 2024 12:43:57 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-349fd1d3723so1073710f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 23 Apr 2024 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713876234; x=1714481034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=;
        b=1qwkBz2Opy99UpvQqqTqbq2cDNBkgsyrajcoFCKQypZ31LoLHZoRTINKeXF8hOTdxW
         8lv1Tq56obZm9n6VhucbQ691ttOcC5Qk2pxXUDfi0/Ui+gBrYG6TXWGp4Y8qqjxQgJzF
         1Yq6jXOJVL1TzaZL8NM5suJK/nvUHVV7s09D0tzu+YBLQOBYtO2KUQFpFTYTYMp7R0Lp
         p/1gXdleLtNzrFpPocxYQZ7Qmb/ypIV/VGNJD96dlskDVKGjtInQwo80vfziMsnVEP1J
         Nkmr5sSUoDxdCU0CX94AslPYTQN21hTM2m+kZYRs/9FJXGvFxcYrZ82VO18xxqPXXJsf
         qKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876234; x=1714481034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OClMR/8Jm3sCmLbe455uZIaBUTeeLegIVNx5rAADYDc=;
        b=RnvPfuEJZ5zAPf8mNp04WHC5K71mK/UfhdoWw82ufH9x7fFWgqCo/7b+BFh6aMJNxA
         iNIWAbsu3ugpj/yKj2Jfo1K3Mmal+18yDCI0Z5U9fgyr66vWs6LlM6KC1xRSV+St3e59
         t6VJ/3VOXEAhlLKuerLLksUjVgehjJljtwLG6vjuncjqAgP6+wOlAEDuFP3843R4KdeZ
         J6yFDC/Sv/HjTKEGk7/ZsPv4hLqgPihNRTMEIDrLSPzJY5qafC6V8hq3fnWEL2j7dmwy
         w796TWNI1grFb1XM6GHcOlIQ5JMOzUnVLyujp2Jqx1r+zShDTl4mPib4g/s+YicEB0Rq
         SQvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ00zG3k4H0VQh6Wy2sgLPEokGmI3eNkXTcJU2vn8+zGHopmC449rvygrQuUP1DQpfIDo7b2eqSTTVpT2DBQEbAX/U9HX8G232FHRp7sW+
X-Gm-Message-State: AOJu0Yxegaa3v1UPgdQgWS3tyHUK62B4pYkqktH7aQ5Yu3BZFGiHNOgx
	GU/ZBoi/5SNIGZtNC3HzwnH2ocKFsFaZNCq1FdN2NEoa5twhCMBs0MzK3Q7IhWg=
X-Google-Smtp-Source: AGHT+IGgrmGvVTGX++7wyp505WvQlZhf5R5sMKMBgP2fuHjYmGDsg8m8hdOu/tW6hNp+KAz9yWPf8g==
X-Received: by 2002:a05:600c:1c27:b0:41a:c4fe:b0a6 with SMTP id j39-20020a05600c1c2700b0041ac4feb0a6mr1112594wms.4.1713876233977;
        Tue, 23 Apr 2024 05:43:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:71cb:1f75:7053:849c])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c470a00b00418a386c059sm19975709wmo.42.2024.04.23.05.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:43:52 -0700 (PDT)
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
Subject: [PATCH v3 11/11] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Tue, 23 Apr 2024 14:43:25 +0200
Message-ID: <20240423124326.2532796-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423124326.2532796-1-cleger@rivosinc.com>
References: <20240423124326.2532796-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_054356_208123_AD44577F 
X-CRM114-Status: UNSURE (   9.07  )
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
