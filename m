Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43E5CD1297
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHWAHi8boI4zVEDOGlMoG/gwsNtHbrV17mUCfhYZu6E=; b=MeDx7BrU2XymrR
	sjCsCo+YLPH9VJwccz5S4vYmf2DuzdQF7w6a12NnyPlNp0DWRfC6XtT/Za1+U9/aLyzr/uRXrxWHj
	txZ63QwbuXInD4D1K6vWaDWFI95c976WXnr1aORCmooF+QTJkiny/qH4LHA0P18Zl0d53b0asyg3p
	He3FSNoxlUajIkMV6vdDg7JsjU64BL0b+Y7yqOoRIo0GeNRzdqIhbeKpEESTuu3/MOFj9q2x2TsPm
	Wn+8SrvQf8OV4YLNmR1azzcftBoti7VbvPikc8I3IX7fFY2R07LEQVDpvvP77gTMMshtynhZKzsyT
	7KuXsQmaKQkk8jG/9osA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzX-000000063OV-2VHO;
	Wed, 10 Apr 2024 09:11:39 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTzB-0000000634M-3YJ9
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 09:11:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-343c8d7064aso1125245f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 02:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740275; x=1713345075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Krk/y2eKZuups+NlFH1/XAt2KVWyJ/NRH9pac0EUcSA=;
        b=rOuUoRPMUcATcTBU93mx7DDK15NZ5xg5xGacddgVyujpEvPxyiqu6KUb3JEIAoex/L
         TdA059cQJ+5dVP9zuIqDCn9sFIabWaPhQxuUojwbp9RDP5HZpoygWv6mqw1Wjy8bGs2n
         9YgbtoaD4fOWddspMpd7jec8bNlT26HVmLs8eQMMS6an2dPEFaYlOzAECE8652JXmSH8
         7l0kHc9oIOK7SvawBKqAEq4QqUElmPBj/b8+KA+EcSg5Bl0WnTRvDFHFW3XQ5UmNCwBf
         BiqV2AOHn9qjvFYH/E5n3316ZPqV/sY1XBPginbRyaWmmp/2eqyh3DXe36odoJnJaHWu
         TSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740275; x=1713345075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Krk/y2eKZuups+NlFH1/XAt2KVWyJ/NRH9pac0EUcSA=;
        b=Hmr+4QL956wSVw0ttplNIT/3Q8h7nzwIuG4Fz2i5Rod7D+RsZsRAnO7ZrKP311WKge
         8a5yFpnlUpuqfLoChZyoBYlOgnvfRGF3hefey1pcLOgT0aG/IzvqaTLvXh4FlBuX9nds
         y5tY2W8cmx1VnSzfkgI8SMsPjoV7AvRvLtPon6qQ4Wc+bVzni6KUyv60nAvMk3dL2nFD
         RvO6L7A/4MjpO/EIwb4xFDuSeIrjTtEc1e4o8KrgRAAzim2JXF+LLkykOO3uWJzobnEL
         UddyEKd8TnEOSJLo8cq0+CqdBumIe5IaAgq347z5euvpFibdsdxegbP6lxYDTobTXP/y
         /MQg==
X-Forwarded-Encrypted: i=1; AJvYcCVhaF80dPVgnh5aBpUVAqT2BtDipphE5Ph7IHR6SNUxt0QTgPLp3X9EjzWag/aSjPtjOLZi2Jakl+Tu65hHyjOE9doK3hou7qECzduY0lE+
X-Gm-Message-State: AOJu0YxnEJLagey8yzIe8ZllNxioUGGpo6KU6mMCwlnzlrg4iqOa2Nu1
	aymNA0OgiZ5tEPgt0Wqa6vIkCyTkGWgllIGT+sjZZiIU78I18B2z/3ybT9t7Kjo=
X-Google-Smtp-Source: AGHT+IGyqbOgjtNkZZQIuk3rup0XlbTGJ4jWdEvRqfh1gL7k9yxCMhJp70f8uLGTtSc+Ou6jAVkYhg==
X-Received: by 2002:a5d:6da5:0:b0:346:6d9d:431a with SMTP id u5-20020a5d6da5000000b003466d9d431amr963245wrs.5.1712740275117;
        Wed, 10 Apr 2024 02:11:15 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:14 -0700 (PDT)
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
Subject: [PATCH 04/10] RISC-V: KVM: Allow Zca, Zcf, Zcd and Zcb extensions for Guest/VM
Date: Wed, 10 Apr 2024 11:10:57 +0200
Message-ID: <20240410091106.749233-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_021118_116405_85795A9E 
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

RXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBL
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaY2EsIFpjZiwgWmNkIGFuZCBaY2Ig
ZXh0ZW5zaW9ucyBmb3IgR3Vlc3QvVk0uCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oIHwgNCArKysrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAgICAgfCA4ICsrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20va3ZtLmgKaW5kZXggMzVhMTJhYTE5NTNlLi41N2RiM2ZlYTY3OWYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmgKQEAgLTE2OCw2ICsxNjgsMTAgQEAgZW51bSBLVk1fUklTQ1ZfSVNBX0VY
VF9JRCB7CiAJS1ZNX1JJU0NWX0lTQV9FWFRfWlRTTywKIAlLVk1fUklTQ1ZfSVNBX0VYVF9aQUNB
UywKIAlLVk1fUklTQ1ZfSVNBX0VYVF9aSU1PUCwKKwlLVk1fUklTQ1ZfSVNBX0VYVF9aQ0EsCisJ
S1ZNX1JJU0NWX0lTQV9FWFRfWkNCLAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDRCwKKwlLVk1fUklT
Q1ZfSVNBX0VYVF9aQ0YsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAogfTsKIApkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25l
cmVnLmMKaW5kZXggYzZlZTc2MzQyMmYyLi43ZDQ3ZmM5MTBiZDkgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcu
YwpAQCAtNDgsNiArNDgsMTAgQEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9l
eHRfYXJyW10gPSB7CiAJS1ZNX0lTQV9FWFRfQVJSKFpCS0MpLAogCUtWTV9JU0FfRVhUX0FSUiha
QktYKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkJTKSwKKwlLVk1fSVNBX0VYVF9BUlIoWkNBKSwKKwlL
Vk1fSVNBX0VYVF9BUlIoWkNCKSwKKwlLVk1fSVNBX0VYVF9BUlIoWkNEKSwKKwlLVk1fSVNBX0VY
VF9BUlIoWkNGKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZBKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZI
KSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZITUlOKSwKQEAgLTEyOCw2ICsxMzIsMTAgQEAgc3RhdGlj
IGJvb2wga3ZtX3Jpc2N2X3ZjcHVfaXNhX2Rpc2FibGVfYWxsb3dlZCh1bnNpZ25lZCBsb25nIGV4
dCkKIAljYXNlIEtWTV9SSVNDVl9JU0FfRVhUX1pCS0M6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VY
VF9aQktYOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkJTOgorCWNhc2UgS1ZNX1JJU0NWX0lT
QV9FWFRfWkNBOgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNCOgorCWNhc2UgS1ZNX1JJU0NW
X0lTQV9FWFRfWkNEOgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNGOgogCWNhc2UgS1ZNX1JJ
U0NWX0lTQV9FWFRfWkZBOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkZIOgogCWNhc2UgS1ZN
X1JJU0NWX0lTQV9FWFRfWkZITUlOOgotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
