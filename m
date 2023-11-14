Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC3DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 15:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGfyeLv4JKrgfa+Hue0p/SA5Kkznz4NajgP/HyJOtsA=; b=AzNdbP+vnsUxNW
	2XRHWU4xUZMSlocRebuwJE5aLc2DZk+24AfY+lblABJsEHQ7/HaRTh04JX8BbYOFIqF2sg9j5mRV1
	qTKM/ClrgCHWuQYrf8a5F/qtOu3aFjmuwBeVNQKRL+PYfaZeqciUrNAza6hsBtn/06KsFZozgV6tV
	QDtjDh1y44zz7EDvWvyPvn4exDfJ6qzTj50qXE2X6Xw/LJaiyiiRoewqhIsrXuu7uHp+pzknO0AgM
	Rwv2zNYV0GupfRoN2ZaBPFYNRh1gWBDsWataU2pEKveknICHSHudS68piLdS51nB1TpzDCFcSk8Nx
	FKnJ72eCa6mNJM90pVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2v8X-00GHYA-1g;
	Tue, 14 Nov 2023 15:15:33 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2uAr-00G94V-1t
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:13:56 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-77891670417so55613185a.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 06:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971232; x=1700576032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kebr+ZAQxQeA9gxwXsENChkHynJvuQ8x6phPFJllrto=;
        b=WXn8cjfYXOHx3W8BlIoMBf68ajBe2U6dpALWD7Os6trvsQLKOhVTQelLWcmCofUQF+
         8YWPhaLSz+nV3Yh+/gp7k6dsTvneNSbaAOqn6UGopX/JxxUFAoBAVaopKIqG+RQRVKgq
         GEKj9CzYpsw6Qve6jDNylyE8yHnPEDoZ+4ZGSoXsvn2IusoqimNqX7ePxf6/uuHpga34
         DybPi1CpdLadv//mP83mkbj5rwte3jzwwVvGwsta8pTsd+uv03XiJ2dgCFwBugT+2a9k
         ICz8t6ShEtkjqIP3ULbXrg+t5cv84Jo/MnN/xR9GyZ+sSaMbFpqnGfRqMNVxIWPBk4m1
         /DAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971232; x=1700576032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kebr+ZAQxQeA9gxwXsENChkHynJvuQ8x6phPFJllrto=;
        b=GL5UtLBtiGM873h6t9IcxvkG/CT1wkmegdJZHRmJxACxIid7dhlqdqJTE1smBe8wRQ
         a9eNIZBR2PEyahPYGB3DxAvNTsBUHHpjPwlEFbX5dcAVKQoqcTmI+Dp6w9e7PmLXyx2S
         3RrRQFd2FtjyELa83KaRIJWMTXRVrMxL4qwgAN+es8pMe/Y2PqwTLBAauJ11oARdFMFZ
         7ySX8z2/hV9yYOU4gsGvDMJlg67/S2dH2X+e+tGj4PQ/lKTYRuH33ubcACTWgUnArNdE
         6KZOLpuB1yZjJlo7gPOsbrs+IqBDWW5TmdvUznY083wseGv5og3CNP4rr40Oze8y/VVU
         MHTw==
X-Gm-Message-State: AOJu0Yy8F948QBwhpyW5FTEGBEiuO4WNeDi0PWvu2zuVv2cnmUyklAO4
	r6ebvlZulZIV90gvILwaZoplvL7ZxM1/a+cRKaDIjQ==
X-Google-Smtp-Source: AGHT+IGUNDzsVyRn1cI8Qi+AL4zww1R/UAkdwGtV1FRdekOhhWQiL5gaf+3isCeURHwpf2kxBnYCXw==
X-Received: by 2002:a05:620a:461f:b0:774:17d6:31f1 with SMTP id br31-20020a05620a461f00b0077417d631f1mr2492322qkb.4.1699971232036;
        Tue, 14 Nov 2023 06:13:52 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:50 -0800 (PST)
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
Subject: [PATCH v4 15/20] riscv: add ISA extension parsing for Zvfh[min]
Date: Tue, 14 Nov 2023 09:12:51 -0500
Message-ID: <20231114141256.126749-16-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_061353_658467_0AD66285 
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

QWRkIHBhcnNpbmcgZm9yIFp2ZmhbbWluXSBJU0EgZXh0ZW5zaW9uWzFdIHdoaWNoIHdlcmUgcmF0
aWZpZWQgaW4KanVuZSAyMDIzIGFyb3VuZCBjb21taXQgZTJjY2QwNTQ4ZDZjICgiUmVtb3ZlIGRy
YWZ0IHdhcm5pbmdzIGZyb20KWnZmaFttaW5dIikgaW4gcmlzY3Ytdi1zcGVjWzJdLgoKTGluazog
aHR0cHM6Ly9kcml2ZS5nb29nbGUuY29tL2ZpbGUvZC8xX1l0NjBIR0FmMXIxaHg3Sm5zSXB0dzBz
cWtCZDlCUTgvdmlldyBbMV0KTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LXYt
c3BlYy9jb21taXRzL2UyY2NkMDU0OGQ2YyBbMl0KU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkBy
aXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgMiArKwog
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKaW5kZXggOTdkMTA2ZmEwZjU0Li4x
MDNkNGYwYWFmMTUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAor
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKQEAgLTgxLDYgKzgxLDggQEAKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkgJCTY2CiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZITUlO
CQk2NwogI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pJSElOVE5UTAkJNjgKKyNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aVkZICQk2OQorI2RlZmluZSBSSVNDVl9JU0FfRVhUX1pWRkhNSU4JCTcwCiAKICNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9NQVgJCTEyOAogI2RlZmluZSBSSVNDVl9JU0FfRVhUX0lOVkFM
SUQJCVUzMl9NQVgKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwppbmRleCBlNzNlZTRjZmQ4NGEuLjYyM2E1
ZmE0OGNmNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCisrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwpAQCAtMjgwLDYgKzI4MCw4IEBAIGNvbnN0
IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewogCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHprc2gsIFJJU0NWX0lTQV9FWFRfWktTSCksCiAJX19SSVNDVl9JU0FfRVhU
X1NVUEVSU0VUKHp2YmIsIFJJU0NWX0lTQV9FWFRfWlZCQiwgcmlzY3ZfenZiYl9leHRzKSwKIAlf
X1JJU0NWX0lTQV9FWFRfREFUQSh6dmJjLCBSSVNDVl9JU0FfRVhUX1pWQkMpLAorCV9fUklTQ1Zf
SVNBX0VYVF9EQVRBKHp2ZmgsIFJJU0NWX0lTQV9FWFRfWlZGSCksCisJX19SSVNDVl9JU0FfRVhU
X0RBVEEoenZmaG1pbiwgUklTQ1ZfSVNBX0VYVF9aVkZITUlOKSwKIAlfX1JJU0NWX0lTQV9FWFRf
REFUQSh6dmtiLCBSSVNDVl9JU0FfRVhUX1pWS0IpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2
a2csIFJJU0NWX0lTQV9FWFRfWlZLRyksCiAJX19SSVNDVl9JU0FfRVhUX0JVTkRMRSh6dmtuLCBy
aXNjdl96dmtuX2J1bmRsZWRfZXh0cyksCi0tIAoyLjQyLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
