Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DE7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 11:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KW8LJa6na11HAfnNkhQotcvZQ+KmdOMaaCOAL/2Sfuc=; b=GBsToEZorfGi4r
	Gozjqv0PzjZa34ZRcIaHAALWVlG7vqJt2IktUOJJ5Ith289oI6sIRWCUBVKDqcbUdLOi40pb1G/Km
	lNrNs0XjKw0n16fKUfV6u6filPA430PBqPU2XMOTPaFiaJ7xclqclEUC38SCe5D0CGxWKsa02Ao4E
	4eDSfwxzIaJXTzciT/lBKXAhjUvYbFUC40V2/TowVvpGY7Y0B0uhHjJBVx5h6O9C/RskUc7iEQGZ2
	Ls0DTpdLqMnCtiXO8mimM1SOJIWiKkBXQXr2+UG2MHNzcYJn9//cB3ZCnKmWHaugx121XZmbCENY8
	k+PRCaHDMxT/U5P36kpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUX-00ETCQ-2O;
	Wed, 13 Dec 2023 11:33:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDNUQ-00ET4x-12
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 11:33:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40c495ab68cso5701985e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467200; x=1703072000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSyk12PGgNh6ZiEbOULW7RPQKbPPPMGsxhdUj3Rl3fw=;
        b=Oav1Nqiafy6gtc1DNb5MZe6fvlo4ZJcruFAB2A59LRCbKvdOTF7aCEO6pDfipRNpyz
         2WmHmECkeFOAmFfn3Xf6Sf1K0N8oXwXK+3pRPnhcLBkKox4E+4xpBZ8+gND645BjdmqZ
         IOtKVh+uL05WOH0JFpfnG8eQDKGyPZLHk2k1iUfiYe3Q68xI33YHTnfGyoDTveo7SqFf
         dcl7v0xG69/j0JZB34MPz+YW2vSIm5xcTshbfXf2/4LCziETFfNnqD3GjFgIZfuyUIHK
         e81DrIreJOzVRhdPcLwWhxitr4DXD1cHXylmhFFyALGtImsisOpoEk24N0Q3PAepO58k
         PgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467200; x=1703072000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSyk12PGgNh6ZiEbOULW7RPQKbPPPMGsxhdUj3Rl3fw=;
        b=rXE5HlsRLyc1J+pqLm9duc25a0mzxppVo5NevuLc/kbstmEp6p/Vk8S7zbq+FL2et9
         LqgsFuqLMe35pnJV/7zNAp9OAvBioULvAstU1d1E5rE7lDLca+uxggvoHhsNMTjdp1RX
         kjF52iYh/8nRsbboNXVZd0Xq46A/BKriGpDBnrZdXJIICOX/dyzqApuhn2s7eIVLPL8d
         iRwlXrNVjqpbPtj19XMrq4mBTrQfgBUuL5ndDd2wHbaNUpWyEfJv+82CcZU0kLK31hab
         blO1d+xsuYXAk8/nojXDyiyTVheqwqTo/PGirki03FmkmhEaKLm7SXtAFsr8/LT3uQg8
         0nOw==
X-Gm-Message-State: AOJu0Ywsf/TVGMIRSawV8pZMODIxxTTUOKydRTLMNmXfGA0wcrmNyND7
	RbQR28uJF5HuChzKqw17ahLSxg==
X-Google-Smtp-Source: AGHT+IGpaCx+D5ojXDBVQxpZqQUYiYfjlRdA9ehLOCWbM5XAh+lwFxnI5yxd/Hyl3z3Rfp/Vdi/pXA==
X-Received: by 2002:a05:600c:3b23:b0:40c:2631:7c3d with SMTP id m35-20020a05600c3b2300b0040c26317c3dmr9593738wms.2.1702467199960;
        Wed, 13 Dec 2023 03:33:19 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:19 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 7/9] riscv: add ISA extension parsing for Zacas
Date: Wed, 13 Dec 2023 12:33:03 +0100
Message-ID: <20231213113308.133176-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_033322_413984_B392FFA6 
X-CRM114-Status: UNSURE (   8.97  )
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

QWRkIHBhcnNpbmcgZm9yIFphY2FzIElTQSBleHRlbnNpb24gd2hpY2ggd2FzIHJhdGlmaWVkIHJl
Y2VudGx5IGluIHRoZQpyaXNjdi16YWNhcyBtYW51YWwuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxICsKIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCmluZGV4
IDAxNmZhYTA4YzhiYS4uOGFlZTAzMmYwOTJmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2h3Y2FwLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCkBAIC04
Niw2ICs4Niw3IEBACiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkZBCQk3MQogI2RlZmluZSBSSVND
Vl9JU0FfRVhUX1pUU08JCTcyCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfWkFNCQk3MworI2RlZmlu
ZSBSSVNDVl9JU0FfRVhUX1pBQ0FTCQk3NAogCiAjZGVmaW5lIFJJU0NWX0lTQV9FWFRfTUFYCQkx
MjgKICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9JTlZBTElECQlVMzJfTUFYCmRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKaW5kZXggZTk5OTMyMDM5OGI3Li42MjQ0M2NkNjMyYjggMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMKQEAgLTI1OSw2ICsyNTksNyBAQCBjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRh
IHJpc2N2X2lzYV9leHRbXSA9IHsKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhpbnRudGwsIFJJ
U0NWX0lTQV9FWFRfWklISU5UTlRMKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6aWhpbnRwYXVz
ZSwgUklTQ1ZfSVNBX0VYVF9aSUhJTlRQQVVTRSksCiAJX19SSVNDVl9JU0FfRVhUX0RBVEEoemlo
cG0sIFJJU0NWX0lTQV9FWFRfWklIUE0pLAorCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHphY2FzLCBS
SVNDVl9JU0FfRVhUX1pBQ0FTKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6YW0sIFJJU0NWX0lT
QV9FWFRfWkFNKSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmEsIFJJU0NWX0lTQV9FWFRfWkZB
KSwKIAlfX1JJU0NWX0lTQV9FWFRfREFUQSh6ZmgsIFJJU0NWX0lTQV9FWFRfWkZIKSwKLS0gCjIu
NDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
