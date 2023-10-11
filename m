Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8E4CD6E5C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRdaYne/ki1GrkfgD3RCw9mq0h35IVt1rYtrTOsmfyg=; b=lEhGpFsMZbe/hA
	gj0uFYLJ5mNmJkAeBa+5zjFVq7n6gGnN7IQJ/wJMIDa2XoPDllyN5+CVxZyjW3HAdWMHBk+C37bb3
	tuaXqS2I41u75pWlJHPZ5oL1G7YqzZHyT0Dzswnq2zYhQ7bIZ/BKckMxxKNn+cqnjFcVUON42Bl+p
	41noL4a5YS2YA91ypW0cO/qCod9D/R6ve6Sov9LmrhPZXKEpsTmkDTzU6EfiQP3pteCNA2rlRHp0J
	iQJG35y9FwUIPC7DvtYnUHBfTVHU8/MG5KIS3tW0s5ls0FqwNFv6S6N8TN++mMSw7L9IAY/YJcLN1
	Xxac4LAHoI3TQH+FcuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFc-00FjXz-0O;
	Wed, 11 Oct 2023 11:19:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqXFU-00FjKd-2w
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 11:19:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-406553f6976so17190345e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 04:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697023165; x=1697627965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELrfmr7/+eL4h+O/hGMHN5n5h58B6vu8kUgBEeprKDM=;
        b=GJGqHml/QNRVt0K1ohvckEB97tX67hMi8kT9ytfVziyfJIJ81K1D9arebhPfr5SIHn
         32SLoRXNPf8vFdrSrdeiXcAd6WelZhrk+XWVDdIBbSos+LXv5jjOVI936F8KbcI2dywR
         8AG1Sc97h7YRR36medw/0GLZnbq9McOLzK9mRinczvaoFDynE7/OonyGVPLHShYKBycW
         5/7EH/KX4YXD3zTVVZO6zu1g4OT9v9lcS6Id3V4N5YHm7QEzw5k/G9NkJdKotSiDpxgO
         sgYngJyakwwPwrjZs0GxwZ9DErxOu1i6GWrbDGOxhr7leJPcc4VGQPwvzWzEG8aOFVXT
         IjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023165; x=1697627965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELrfmr7/+eL4h+O/hGMHN5n5h58B6vu8kUgBEeprKDM=;
        b=gKv7pg/KGsJunymS8SE4mtngzVDE695MbZq+jR1ygvRi8bRTlSMYOatcGnk4qBB/Ms
         +nKqiplK/LzCVJHVzL5RWWve4eUwO3SQjcaK9T3Pxeostrphr9oxnBlOpJljagPTrTiw
         4o4SAa2t/TTLS7N7TCcsdazPpI13WPlJ7tm7CWSuFd8zSTx4RnyWMoauczTd6GqjA3Ny
         VrxfuaBZuF7OxnyKFHHa85s+Y/xS5OeJtpRbBMitqGD2iqGRf/1ohsvSGDhDJ/r32T3t
         JLm6fKJ2Xi54KN4dlAS8tfeUTDCvzxPozb0ztLQty9NK2enbfWohA8ZLLvUp24kqW2nt
         mAHQ==
X-Gm-Message-State: AOJu0YwejEiBDPE23HzN/aoL9OPjOS70af62YDLL4r98RI/1qZHpNKpv
	fxosK3bVo2xKzGajaI1hYffjc5GELa291c73YJmPHw==
X-Google-Smtp-Source: AGHT+IE2y/iGfOk9x0FcfGmLs9von/gSyi9IxV8X3T9o1LjNrBHKENRhq76JY7LxinEZmPIgMRylzA==
X-Received: by 2002:a05:600c:5114:b0:405:4127:f471 with SMTP id o20-20020a05600c511400b004054127f471mr18363952wms.1.1697023165036;
        Wed, 11 Oct 2023 04:19:25 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:9134:b302:d8b:a200])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c224400b003fe2b081661sm18945715wmm.30.2023.10.11.04.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:24 -0700 (PDT)
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
	Conor Dooley <conor@kernel.org>
Subject: [PATCH v1 11/13] riscv: add ISA extension probing for Zvfh[min]
Date: Wed, 11 Oct 2023 13:14:36 +0200
Message-ID: <20231011111438.909552-12-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011111438.909552-1-cleger@rivosinc.com>
References: <20231011111438.909552-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_041932_950756_A3B83FAF 
X-CRM114-Status: UNSURE (   8.72  )
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

QWRkIHByb2JpbmcgZm9yIFp2ZmhbbWluXSBJU0EgZXh0ZW5zaW9uWzFdIHdoaWNoIHdlcmUgcmF0
aWZpZWQgaW4KanVuZSAyMDIzIGFyb3VuZCBjb21taXQgZTJjY2QwNTQ4ZDZjICgiUmVtb3ZlIGRy
YWZ0IHdhcm5pbmdzIGZyb20KWnZmaFttaW5dIikgaW4gcmlzY3Ytdi1zcGVjWzJdLgoKWzFdIGh0
dHBzOi8vZHJpdmUuZ29vZ2xlLmNvbS9maWxlL2QvMV9ZdDYwSEdBZjFyMWh4N0puc0lwdHcwc3Fr
QmQ5QlE4L3ZpZXcKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi12LXNwZWMvY29t
bWl0cy9lMmNjZDA1NDhkNmMKClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAyICsr
CiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdj
YXAuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAppbmRleCAxZjA5YjhiM2RhMmEu
LmVhMTQxY2ZiOGY5YyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5o
CisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaApAQCAtNzcsNiArNzcsOCBAQAog
I2RlZmluZSBSSVNDVl9JU0FfRVhUX1pGSAkJNTkKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aRkhN
SU4JCTYwCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWklISU5UTlRMCQk2MQorI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pWRkgJCTYyCisjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWlZGSE1JTgkJNjMKIAog
I2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWAkJNjQKIApkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCmluZGV4
IDEzNmU5MDI2M2JhMi4uZjE3YjlhY2E1ZmJhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2tlcm5l
bC9jcHVmZWF0dXJlLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCkBAIC0x
NzksNiArMTc5LDggQEAgY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSByaXNjdl9pc2Ff
ZXh0W10gPSB7CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemJzLCBSSVNDVl9JU0FfRVhUX1pCUyks
CiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZiYiwgUklTQ1ZfSVNBX0VYVF9aVkJCKSwKIAlfX1JJ
U0NWX0lTQV9FWFRfREFUQSh6dmJjLCBSSVNDVl9JU0FfRVhUX1pWQkMpLAorCV9fUklTQ1ZfSVNB
X0VYVF9EQVRBKHp2ZmgsIFJJU0NWX0lTQV9FWFRfWlZGSCksCisJX19SSVNDVl9JU0FfRVhUX0RB
VEEoenZmaG1pbiwgUklTQ1ZfSVNBX0VYVF9aVkZITUlOKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFU
QSh6dmtiLCBSSVNDVl9JU0FfRVhUX1pWS0IpLAogCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHp2a2cs
IFJJU0NWX0lTQV9FWFRfWlZLRyksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoenZrbiwgUklTQ1Zf
SVNBX0VYVF9aVktOKSwKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
