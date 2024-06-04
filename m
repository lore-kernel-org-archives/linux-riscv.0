Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5760CC25B7E
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9OPrPW0BivpSAteL5v2T4RQl65hZfNnpWmnrM4TOL4=; b=ikz7UyvFodAYFo
	8akjoFdpGxREeCkDTCPjHGSAq0y2vHZS74EKkLdg5JzIZybKKBG1zlK1aPh/2x1XuV1eYViwMzfbl
	Ax1As/vSdgbFPaZoR8I/df22sIfj/hfSg5L2Oj/yvCmcFB7+NQJFg9gnaA7q8orU7U8h7+WKpXBrq
	H0B/iR1J/F1Y4ajBpl8BTcS6xCzKb12JSb2iBX9CN3EJoBlU90YPgheTZyQAip3yoIMSMD3cWR1Ni
	0E3+5n0pH1ceJ21wGlmlDEUdD3xYNz1Nq1SZuQdpvodNTC5mL6AbvuKjDMaOrjYarafnGQpCLtwmR
	PuNFBC6gy0dYhNnJ2Jrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETZG-00000002Li1-26hM;
	Tue, 04 Jun 2024 12:47:10 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETZD-00000002Lfn-280X
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:47:08 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-6c5c1838040so214568a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505227; x=1718110027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Thrzhyhf4n6WJYCWxQDF3hgG8fVFwwW9ccIOLsViJdE=;
        b=KnQjcjAQevZ34mh2LggXvvElBCSTPFEOQKiIpwdQ3jkVPZzjIkhxCtLu4d+MTNqtVB
         5wCdjSYY0ZISSlwCfFomfkd68jF1oFgXeOopSUufadA/7A2SW7ADMG50U4p34jlcNra+
         Ga2R59lXktd7ej6+LbbDw6lL1mNV9TGYp7m1kQ4Bcrkxp3sB6bvLPlJUDwbzDiJvtm50
         QyzZ47cXlcxQtz79rKwz6sNtHpmTLAMgt+KzJ9n6fOMrGXUISa/eTgX1kD9UO6KLgOSG
         VKAWY7wyqrkuc8QShrca6aUbK2kBYwFqhI+ItsWkipNNskv+kdQH/wCWo50I8Cnj5euU
         k0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505227; x=1718110027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Thrzhyhf4n6WJYCWxQDF3hgG8fVFwwW9ccIOLsViJdE=;
        b=s7r64JUcnVb/KGl62B4br05vAwunu1mWlMN0C9q6N7Wht7hwhuHXo2pce6vaoYOcTP
         o1GE4gmrkI5oGUu29W8a3EZwYDse7Gmv2cFstkscQWaSGimKI0gFdVitxmHvbNzmLqQL
         gyyQ/tVpdosoL0Fz1IJgiB+c8OGCupcGqX9IwLpAJyVMTNpuYuxbF3ej4EN1yqCfihwC
         keADhWMaRIX5y8GPpqYfYLwdEdcBKSfxMfW2gbrqUwQhS0NU4xMw+n5ja0GNsR4BHnJK
         +yHq/xoX7UJ3oxazkfch1DWvq6mizGbZoMD8Us1LWEBHilfPYdH+QNYCNl2Vlz69YXB2
         DE+A==
X-Forwarded-Encrypted: i=1; AJvYcCV+OJb9SIaivEqjwgK9qNvV+zfNheqCzJunAU6+PKJEWZLk7ob3AKEks9zgSgzqj6KMqJzR8zaMZPC2bvynQA0Ml93y1WI29jmKOpm+G2Ug
X-Gm-Message-State: AOJu0Yy/BgIolslZRPE1ToRs+00FlKQ48ZukmubC4dRp7bzvdSDFItfY
	aShXWEXJRPCsMmCKRN6TAU29+wACAp1E/GCAaduv4AgGmxNKqiYXUc3snLOfiF0=
X-Google-Smtp-Source: AGHT+IEm3zrqTkaD1e80nTXtvyaFcCt9SvKc4tEHifCVXXNN3kdXJvNYmPz0ey9WWV7TKhbEhWGmJA==
X-Received: by 2002:a05:6a21:789e:b0:1a7:91b0:9ba3 with SMTP id adf61e73a8af0-1b26f30dbb1mr14554711637.4.1717505226907;
        Tue, 04 Jun 2024 05:47:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:47:06 -0700 (PDT)
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
Subject: [PATCH v6 05/16] KVM: riscv: selftests: Add Zimop extension to get-reg-list test
Date: Tue,  4 Jun 2024 14:45:37 +0200
Message-ID: <20240604124550.3214710-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054707_655663_02FBF6E1 
X-CRM114-Status: UNSURE (   9.65  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFppbW9wIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0gc28gYWRk
IHRoaXMKZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQW51cCBQYXRl
bCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+Ci0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWct
bGlzdC5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCmluZGV4IDIy
MjE5OGRkNmQwNC4uOGM4YjEwOWNlM2NhIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCkBAIC02OCw2ICs2OCw3IEBAIGJvb2wgZmlsdGVy
X3JlZyhfX3U2NCByZWcpCiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aSUhJTlROVEw6CiAJY2FzZSBLVk1f
UkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1Zf
SVNBX0VYVF9aSUhJTlRQQVVTRToKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9S
RUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJSFBNOgorCWNhc2UgS1ZN
X1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NW
X0lTQV9FWFRfWklNT1A6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aS05EOgogCWNhc2UgS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9F
WFRfWktORToKIAljYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNB
X1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pLTkg6CkBAIC00MzQsNiArNDM1LDcgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKmlzYV9leHRfc2luZ2xlX2lkX3RvX3N0cihfX3U2NCByZWdfb2ZmKQog
CQlLVk1fSVNBX0VYVF9BUlIoWklISU5UTlRMKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpJSElOVFBB
VVNFKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpJSFBNKSwKKwkJS1ZNX0lTQV9FWFRfQVJSKFpJTU9Q
KSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpLTkQpLAogCQlLVk1fSVNBX0VYVF9BUlIoWktORSksCiAJ
CUtWTV9JU0FfRVhUX0FSUihaS05IKSwKQEAgLTk1OCw2ICs5NjAsNyBAQCBLVk1fSVNBX0VYVF9T
SU1QTEVfQ09ORklHKHppZmVuY2VpLCBaSUZFTkNFSSk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09O
RklHKHppaGludG50bCwgWklISU5UTlRMKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemlo
aW50cGF1c2UsIFpJSElOVFBBVVNFKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemlocG0s
IFpJSFBNKTsKK0tWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemltb3AsIFpJTU9QKTsKIEtWTV9J
U0FfRVhUX1NJTVBMRV9DT05GSUcoemtuZCwgWktORCk7CiBLVk1fSVNBX0VYVF9TSU1QTEVfQ09O
RklHKHprbmUsIFpLTkUpOwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6a25oLCBaS05IKTsK
QEAgLTEwMTQsNiArMTAxNyw3IEBAIHN0cnVjdCB2Y3B1X3JlZ19saXN0ICp2Y3B1X2NvbmZpZ3Nb
XSA9IHsKIAkmY29uZmlnX3ppaGludG50bCwKIAkmY29uZmlnX3ppaGludHBhdXNlLAogCSZjb25m
aWdfemlocG0sCisJJmNvbmZpZ196aW1vcCwKIAkmY29uZmlnX3prbmQsCiAJJmNvbmZpZ196a25l
LAogCSZjb25maWdfemtuaCwKLS0gCjIuNDUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
