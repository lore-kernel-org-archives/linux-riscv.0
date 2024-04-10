Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D6FCD1296
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSEbjcsdMk7wjlnOXhArkT3nv6XunSGXnHSgkJ9Bu0o=; b=0M4pBfpJvsen8u
	VatL7MXrHxL0xniYNMnFNRAwp94OLqVmoJvQAxyMzflbmb/Ef74BtV7ONDriypgJ3Pt5jIyot2PB+
	jd0U6QZx7fVDypZl8hmd9+7pBOG7VaNIgixtQrPfkkxPBRQ9D0jOTy82jj2AGKen1492ji14I9Miy
	7PBptne3vEMLxqhEsgH6gf1bFW75BWWGS6XJnVj1m/rZKHKdBDbYpkYOcuRWYP2gLviVuVPvDYoiO
	d/LZP5NIfhg1ZXTwhQQCY6x3rUfBKgp5lVtprgPzuLO90L9DEld+w3rIWp4d79SMeJaMFIxN6m556
	eKLQHKK3CE7R7Zx5loaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruU04-000000063pb-3Y9F;
	Wed, 10 Apr 2024 09:12:12 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzR-000000063Cx-1PZv
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-516d23d3bceso1854844e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740283; x=1713345083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKIlCd7jL5ol5qvLgWGPfJLjgIu96MFC3958FRvJI8w=;
        b=ShOxTb4AlPdEcOwnboRges5pmCyK3tfPD5lVKG8dwKv/YiFNlWwdIak7SoByF3+F4Y
         wRnXEXwAtr4CskEIk/08aem2k/VO+rHF3073RAdS+PnAkF2y+p0XdF10lDQTczbrGE/1
         gjnyNtCm0YPEct5703fep2Unb100GVpxdxqXIj8X5LdSu/KEYeDXoJQK8Ms5Gmvj0ZHk
         ekGoMTFKZVaTsMb8mjwGDFj9LkSCQXcYKAKdlkEWUDJShQTxp0pM+Q0tPPAJN1r4T13Z
         lsxeGDfTjZ2mowG8GYwhRVdjae7Oog8P+I4y3W34TCuzZnUnaQkqiN7RgargyWB6E5RY
         5/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740283; x=1713345083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKIlCd7jL5ol5qvLgWGPfJLjgIu96MFC3958FRvJI8w=;
        b=h3+3jvwY+euSJ9iw9sSO/S+XFXnOQILZACXuJvbu9OAvnCLuxFKFhb/wcgKauY3wkz
         M+cFzAgY/cHqa+jjvYAKYD2/tmApiEHwcflt/MlqtC274ddYrWyISsxjg6K+YshFK9Bl
         RFuz9jiBle0p3FdKBDN3A90VOC/t6x+TT2/LaqLsXJHUCjow+pWACxFN7hq0VRQP4ArK
         yyhoqUOabVsa0+U1ydBRc0JTkrjih/9oMPvoSp1LRr/ozwV1lEyV7ZvOkOyGyWTMicUb
         6J94Yhk2EV3v8HcQfZ5lLuMgIr3RtUtPbXbLT2e/UlfB8XzTvHI2to6XBQvATxtOUF0m
         RTzw==
X-Forwarded-Encrypted: i=1; AJvYcCXcZNquZke3RZRnam87ojcVFJQXYFMgrFB8iumuYn/CuE2BHXqsqFh571TVRTbdOJAVvWddYEkZhd0ecgM98y9ZtmQptu0WD4uii29XfWHc
X-Gm-Message-State: AOJu0YwfQ2LYCSxbmqxDJ6SoY6bJ83Q7c1MOcmfUbxAF2bOW2+6ppRR3
	FGjz3ZCs8iXD81gnfWld2pXgeZFjZ27IzSMzR/RqWWO0vwdD82n3au4FbwF7Z3U=
X-Google-Smtp-Source: AGHT+IGArQ/ya3SIwEsTsgk2V3XdyzaxCK6c7Q9P5Y6CwIgF+pnuGurqpRxGE7Q7fP5In4aquwsCLQ==
X-Received: by 2002:ac2:484a:0:b0:513:c1b0:dcb2 with SMTP id 10-20020ac2484a000000b00513c1b0dcb2mr1173103lfy.3.1712740283581;
        Wed, 10 Apr 2024 02:11:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:22 -0700 (PDT)
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
Subject: [PATCH 10/10] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Wed, 10 Apr 2024 11:11:03 +0200
Message-ID: <20240410091106.749233-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021133_657929_A2559FF5 
X-CRM114-Status: UNSURE (   9.13  )
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
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNj
di9nZXQtcmVnLWxpc3QuYwppbmRleCA2MWNhZDQ1MTQxOTcuLjk2MDRjOGVjZTc4NyAxMDA2NDQK
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwpAQCAt
NTksNiArNTksNyBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQogCWNhc2UgS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9F
WFRfWkNCOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0Ff
U0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNEOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0Ff
RVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNGOgor
CWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwg
S1ZNX1JJU0NWX0lTQV9FWFRfWkNNT1A6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBL
Vk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aRkE6CiAJY2FzZSBL
Vk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklT
Q1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aRkhNSU46CkBAIC00MjksNiArNDMw
LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmlzYV9leHRfc2luZ2xlX2lkX3RvX3N0cihfX3U2NCBy
ZWdfb2ZmKQogCQlLVk1fSVNBX0VYVF9BUlIoWkNCKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpDRCks
CiAJCUtWTV9JU0FfRVhUX0FSUihaQ0YpLAorCQlLVk1fSVNBX0VYVF9BUlIoWkNNT1ApLAogCQlL
Vk1fSVNBX0VYVF9BUlIoWkZBKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpGSCksCiAJCUtWTV9JU0Ff
RVhUX0FSUihaRkhNSU4pLApAQCAtOTU3LDYgKzk1OSw3IEBAIEtWTV9JU0FfRVhUX1NJTVBMRV9D
T05GSUcoemNhLCBaQ0EpLAogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2IsIFpDQiksCiBL
Vk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZCwgWkNEKSwKIEtWTV9JU0FfRVhUX1NJTVBMRV9D
T05GSUcoemNmLCBaQ0YpLAorS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y21vcCwgWkNNT1Ap
OwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6ZmEsIFpGQSk7CiBLVk1fSVNBX0VYVF9TSU1Q
TEVfQ09ORklHKHpmaCwgWkZIKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemZobWluLCBa
RkhNSU4pOwpAQCAtMTAxNyw2ICsxMDIwLDcgQEAgc3RydWN0IHZjcHVfcmVnX2xpc3QgKnZjcHVf
Y29uZmlnc1tdID0gewogCSZjb25maWdfemNiLAogCSZjb25maWdfemNkLAogCSZjb25maWdfemNm
LAorCSZjb25maWdfemNtb3AsCiAJJmNvbmZpZ196ZmEsCiAJJmNvbmZpZ196ZmgsCiAJJmNvbmZp
Z196ZmhtaW4sCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
