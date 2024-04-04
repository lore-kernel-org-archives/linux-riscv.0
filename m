Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33104CD1297
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwG2IotkXiZft4NXQW9dczSLgsp8UMF51MkliWRSNxU=; b=XZzZoslHC7u34E
	hDat21VSW7mVm5Dg5f1BxXiZSkqnHKAK1ERXXkHei1BJ2bMhcEmVckjTMCHEYIOA7vH45y3VnVFPU
	EfHWJTh9lUPfDiM1pVcmvnScSgQXcr8ZR83Mk6qOPdzT9LGMFsMDCfkB637KIIPGzkJp6adFq22J7
	ZrcLVvGw2bxElUQ1y6R2kKUjpRHAIvuHoCJUDr+bO67OKiLsWLtUjcF0WCQ/CqtDmY/b1TW8QMbPh
	dFae9sQ2fhxqwyJ8zelvMe2/U/kNJwx4ALeqTIA0klKk2IKX0XAEH88OM7jjmZfBVYZVv1oYFFJzi
	pUnWVhzvUP/Lw5rgiAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKQT-00000002Bxh-0OUd;
	Thu, 04 Apr 2024 10:34:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsKQM-00000002BsC-2djS
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 10:34:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-33e9115d501so358952f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 03:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712226864; x=1712831664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPiFpAJVCXedUpD6zmcxIwwzHItSuIZnjTos+8U6SVo=;
        b=pKOC3Ahk1eV9k55n33UU4jWMyHzUQOJm/loONl3+dplMpIBbtp/LUrynXG6j0bZvAQ
         QoElQrMSOk0ka2BU4e+fJQqiUlMS+DLeGxzyWbuTaazmHBa/gSYMwc51/p8tJxODGDo5
         2S2j6468uetxSCFMyz0b1t2YdXLZIW6bMKiAd26GgGqDAonk13AeQt6IGwQJwkvogafI
         2suLoGEZpWqviXTwKYwbVtKKiqgU5T8topBwAGI0saaQJN28q72QtBC3JiwbjYqZcOEe
         bje0BC9nMcMKm1f0C9lSxtaihY3XzG3CHuqKqsjbwzXyFB9Xc3m/lX9wEbq0eUDFqFdi
         BasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712226864; x=1712831664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPiFpAJVCXedUpD6zmcxIwwzHItSuIZnjTos+8U6SVo=;
        b=T0Lf0sYVPu1Z41GYhuH449OsNstIKrhuFr/HLZXWtN/MSv46Q+5bUVkMmByA/xE05I
         C5shM0PkPGGXntc/wkRyZU0fYvt0D5uuqhE+4dgMK49YIphKbEHT7Hvtjpx+trlHHBsF
         0/lfKWyF4zBLhU3zzOR0Uhiv0Yyuh5y2ySzeJSUA3stoCaBojnB8e9K4jkD+7aErBjFZ
         dTxNmLfbh5TAhgil6taaY6CVEsUwB+i9ewreUI4QWxyzp+8/5oWFFI6CqO2uhUQ8B5JV
         3mmWtUZqm20v3fk9dUGYYc2j1rwmPVSnQulhxoGDFMueK409o3snBn0eH71kaBbQ7m9f
         zzjg==
X-Forwarded-Encrypted: i=1; AJvYcCXmOxsD2Ik0O7/k6QDnO4GTTms+GHZpCqMqZdmogvkhhZ8k+ZOY6CfUhwlGSpbwNV2Lgs9Bgjp3UFBooeFiyX4bfdDDxPGfE9nqRbQoWXC1
X-Gm-Message-State: AOJu0Yztv8JI38IkEIG8iQL3Ec8374jmbXytiSUALe7FXzyF5J6HhZe+
	CyWZ3TO7NAwYTkUN8TTRPGc5TO27RLGRmHf+R1sS3lQAoCdNV69cMyGybtUCyJkjOJLR4ijwY3U
	8ZKg=
X-Google-Smtp-Source: AGHT+IHEYXaDR5DHH4zoY4KhwUJQmkXXvB18af+Ebcotdmut1GqJvAgC8qaCJXy0+ZACV7Kq2Mh0hg==
X-Received: by 2002:a05:600c:3b0a:b0:416:2b72:1f5b with SMTP id m10-20020a05600c3b0a00b004162b721f5bmr650188wms.2.1712226863709;
        Thu, 04 Apr 2024 03:34:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:555b:1d2e:132d:dd32])
        by smtp.gmail.com with ESMTPSA id ju8-20020a05600c56c800b00416253a0dbdsm2171340wmb.36.2024.04.04.03.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 03:34:23 -0700 (PDT)
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
Subject: [PATCH 1/5] dt-bindings: riscv: add Zimop ISA extension description
Date: Thu,  4 Apr 2024 12:32:47 +0200
Message-ID: <20240404103254.1752834-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240404103254.1752834-1-cleger@rivosinc.com>
References: <20240404103254.1752834-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_033426_749359_0B8BF773 
X-CRM114-Status: UNSURE (   9.14  )
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

QWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgWmltb3AgKE1heS1CZS1PcGVyYXRpb25zKSBJU0EgZXh0
ZW5zaW9uIHdoaWNoCndhcyByYXRpZmllZCBpbiBjb21taXQgNTgyMjA2MTRhNWYgb2YgdGhlIHJp
c2N2LWlzYS1tYW51YWwuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbCB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2V4dGVuc2lvbnMueWFtbAppbmRleCA0NjhjNjQ2MjQ3YWEuLjYxNjM3MDMxOGE2NiAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCkBAIC0zNjMsNiArMzYzLDExIEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICBy
YXRpZmllZCBpbiB0aGUgMjAxOTEyMTMgdmVyc2lvbiBvZiB0aGUgdW5wcml2aWxlZ2VkIElTQQog
ICAgICAgICAgICAgc3BlY2lmaWNhdGlvbi4KIAorICAgICAgICAtIGNvbnN0OiB6aW1vcAorICAg
ICAgICAgIGRlc2NyaXB0aW9uOgorICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFppbW9wIGV4dGVu
c2lvbiB2ZXJzaW9uIDEuMCwgYXMgcmF0aWZpZWQgaW4gY29tbWl0CisgICAgICAgICAgICA1ODIy
MDYxNGE1ZiAoIlppbW9wIGlzIHJhdGlmaWVkLzEuMCIpIG9mIHRoZSByaXNjdi1pc2EtbWFudWFs
LgorCiAgICAgICAgIC0gY29uc3Q6IHp0c28KICAgICAgICAgICBkZXNjcmlwdGlvbjoKICAgICAg
ICAgICAgIFRoZSBzdGFuZGFyZCBadHNvIGV4dGVuc2lvbiBmb3IgdG90YWwgc3RvcmUgb3JkZXJp
bmcsIGFzIHJhdGlmaWVkCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
