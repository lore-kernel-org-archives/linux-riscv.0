Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB4A2C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:11:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9084C6058D
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 16:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9084C6058D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+CSIH4WpKNfjCwol9IuIC5zNaMvvNmeBafiMnrlfZM8=; b=16SX6zxTQbB9R1
	KehrOL27NIO7A3UdveWG9on0QQ6y5LNtf8iED2HiP9LmeJC6G5d1pzClCQ7USY4Bg0HnEKQg6hLS9
	J1xJZyDSbHogaevaM8M0bpfXK8ObWJ/jJpfFnUUXKOj05e41h60f1C3SKZqFlI/cgtxGmiMZxGp2q
	4wKGjm6WnTp2sIsT/nu9H4ZXAWcJ4FdEYI28h7TfPLqWi9vCawTgI1YuwtfmoIvNLuZxO62aCYvC5
	7Ozp50dQ1sJS/eFjZrkKfaPM/YUhfhoGbGVyrU+ITBf1gVTMNLS70gtrFjCdHWtKpudQUG3I8ABPt
	GdpXk+3lhRZ0O4sN7yaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg7zo-008Wr2-Im; Thu, 28 Oct 2021 16:11:16 +0000
Received: from mail-lf1-f45.google.com ([209.85.167.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg7zj-008WmT-9z
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 16:11:12 +0000
Received: by mail-lf1-f45.google.com with SMTP id l13so14683990lfg.6
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 09:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DH8yGhC3Nvprfn3hCny0Vjdm/oIXFS546cCDILMHRkQ=;
 b=EprIL9/DhFLEJhLoXXasUmtN7X0jChhRCO7uiID9n5kRgs9SZtm51sJBXE4kJT+8s4
 II2VplEj1TAnLhKwXjnUK4+2wtpd2sl8cNLU5xTYidlmGj1AWrAqVGn+eQ0IPBvqJ1Zm
 JJ2dO/fdpf3Biwc5p9mFAMVLe15Xg5AdwF8zYqxoVWJ3iTQcXaoJxAHuNtrrCSEa4cOw
 a+xNhnMQea5I6tjGwseTQCkxjAM59Lxnaq7MR1dc2R+LQ45zoGsOFluiz2fFFZhwfZpL
 nrXl5bbuqvPh2xV4dcP7NPrQHS00dVGQf5SwDuZasiOWWRE4AQHBjI1bMpwXn3r7Ytgj
 ltBA==
X-Gm-Message-State: AOAM53205SILxiRToOdBGMDUZHAEUZDDx+KGwvtkKLtk04BjiGWaOCx1
 nAesUViwCIWFlwWtSoBgdDX0mTP61bQ=
X-Google-Smtp-Source: ABdhPJzGcFsQsLLh2iM+XXTTQAAvk5Ijtz1Ynp38QBMLPr3KG5zxCbxkrQLRhXQ1kOc3f2/PH3tnWQ==
X-Received: by 2002:a05:6512:230b:: with SMTP id
 o11mr5589603lfu.490.1635437469642; 
 Thu, 28 Oct 2021 09:11:09 -0700 (PDT)
Received: from kladdkakan.. ([193.138.218.162])
 by smtp.gmail.com with ESMTPSA id o17sm49680lfo.176.2021.10.28.09.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 09:11:08 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 luke.r.nels@gmail.com, xi.wang@gmail.com, linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next v2 3/4] riscv,
 libbpf: Add RISC-V (RV64) support to bpf_tracing.h
Date: Thu, 28 Oct 2021 18:10:56 +0200
Message-Id: <20211028161057.520552-4-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028161057.520552-1-bjorn@kernel.org>
References: <20211028161057.520552-1-bjorn@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_091111_375903_1771D957 
X-CRM114-Status: UNSURE (   8.58  )
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

QWRkIG1hY3JvcyBmb3IgNjQtYml0IFJJU0MtViBQVF9SRUdTIHRvIGJwZl90cmFjaW5nLmguCgpT
aWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgotLS0KIHRvb2xz
L2xpYi9icGYvYnBmX3RyYWNpbmcuaCB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYi9icGYvYnBmX3RyYWNpbmcuaCBiL3Rvb2xzL2xpYi9icGYvYnBmX3RyYWNpbmcuaAppbmRl
eCBkNmJmYmUwMDkyOTYuLmRiMDVhNTkzNzEwNSAxMDA2NDQKLS0tIGEvdG9vbHMvbGliL2JwZi9i
cGZfdHJhY2luZy5oCisrKyBiL3Rvb2xzL2xpYi9icGYvYnBmX3RyYWNpbmcuaApAQCAtMjQsNiAr
MjQsOSBAQAogI2VsaWYgZGVmaW5lZChfX1RBUkdFVF9BUkNIX3NwYXJjKQogCSNkZWZpbmUgYnBm
X3RhcmdldF9zcGFyYwogCSNkZWZpbmUgYnBmX3RhcmdldF9kZWZpbmVkCisjZWxpZiBkZWZpbmVk
KF9fVEFSR0VUX0FSQ0hfcmlzY3YpCisJI2RlZmluZSBicGZfdGFyZ2V0X3Jpc2N2CisJI2RlZmlu
ZSBicGZfdGFyZ2V0X2RlZmluZWQKICNlbHNlCiAKIC8qIEZhbGwgYmFjayB0byB3aGF0IHRoZSBj
b21waWxlciBzYXlzICovCkBAIC00OCw2ICs1MSw5IEBACiAjZWxpZiBkZWZpbmVkKF9fc3BhcmNf
XykKIAkjZGVmaW5lIGJwZl90YXJnZXRfc3BhcmMKIAkjZGVmaW5lIGJwZl90YXJnZXRfZGVmaW5l
ZAorI2VsaWYgZGVmaW5lZChfX3Jpc2N2KSAmJiBfX3Jpc2N2X3hsZW4gPT0gNjQKKwkjZGVmaW5l
IGJwZl90YXJnZXRfcmlzY3YKKwkjZGVmaW5lIGJwZl90YXJnZXRfZGVmaW5lZAogI2VuZGlmIC8q
IG5vIGNvbXBpbGVyIHRhcmdldCAqLwogCiAjZW5kaWYKQEAgLTI4OCw2ICsyOTQsMzIgQEAgc3Ry
dWN0IHB0X3JlZ3M7CiAjZGVmaW5lIFBUX1JFR1NfSVBfQ09SRSh4KSBCUEZfQ09SRV9SRUFEKCh4
KSwgcGMpCiAjZW5kaWYKIAorI2VsaWYgZGVmaW5lZChicGZfdGFyZ2V0X3Jpc2N2KQorCitzdHJ1
Y3QgcHRfcmVnczsKKyNkZWZpbmUgUFRfUkVHU19SViBjb25zdCB2b2xhdGlsZSBzdHJ1Y3QgdXNl
cl9yZWdzX3N0cnVjdAorI2RlZmluZSBQVF9SRUdTX1BBUk0xKHgpICgoKFBUX1JFR1NfUlYgKiko
eCkpLT5hMCkKKyNkZWZpbmUgUFRfUkVHU19QQVJNMih4KSAoKChQVF9SRUdTX1JWICopKHgpKS0+
YTEpCisjZGVmaW5lIFBUX1JFR1NfUEFSTTMoeCkgKCgoUFRfUkVHU19SViAqKSh4KSktPmEyKQor
I2RlZmluZSBQVF9SRUdTX1BBUk00KHgpICgoKFBUX1JFR1NfUlYgKikoeCkpLT5hMykKKyNkZWZp
bmUgUFRfUkVHU19QQVJNNSh4KSAoKChQVF9SRUdTX1JWICopKHgpKS0+YTQpCisjZGVmaW5lIFBU
X1JFR1NfUkVUKHgpICgoKFBUX1JFR1NfUlYgKikoeCkpLT5yYSkKKyNkZWZpbmUgUFRfUkVHU19G
UCh4KSAoKChQVF9SRUdTX1JWICopKHgpKS0+czUpCisjZGVmaW5lIFBUX1JFR1NfUkMoeCkgKCgo
UFRfUkVHU19SViAqKSh4KSktPmE1KQorI2RlZmluZSBQVF9SRUdTX1NQKHgpICgoKFBUX1JFR1Nf
UlYgKikoeCkpLT5zcCkKKyNkZWZpbmUgUFRfUkVHU19JUCh4KSAoKChQVF9SRUdTX1JWICopKHgp
KS0+ZXBjKQorCisjZGVmaW5lIFBUX1JFR1NfUEFSTTFfQ09SRSh4KSBCUEZfQ09SRV9SRUFEKChQ
VF9SRUdTX1JWICopKHgpLCBhMCkKKyNkZWZpbmUgUFRfUkVHU19QQVJNMl9DT1JFKHgpIEJQRl9D
T1JFX1JFQUQoKFBUX1JFR1NfUlYgKikoeCksIGExKQorI2RlZmluZSBQVF9SRUdTX1BBUk0zX0NP
UkUoeCkgQlBGX0NPUkVfUkVBRCgoUFRfUkVHU19SViAqKSh4KSwgYTIpCisjZGVmaW5lIFBUX1JF
R1NfUEFSTTRfQ09SRSh4KSBCUEZfQ09SRV9SRUFEKChQVF9SRUdTX1JWICopKHgpLCBhMykKKyNk
ZWZpbmUgUFRfUkVHU19QQVJNNV9DT1JFKHgpIEJQRl9DT1JFX1JFQUQoKFBUX1JFR1NfUlYgKiko
eCksIGE0KQorI2RlZmluZSBQVF9SRUdTX1JFVF9DT1JFKHgpIEJQRl9DT1JFX1JFQUQoKFBUX1JF
R1NfUlYgKikoeCksIHJhKQorI2RlZmluZSBQVF9SRUdTX0ZQX0NPUkUoeCkgQlBGX0NPUkVfUkVB
RCgoUFRfUkVHU19SViAqKSh4KSwgZnApCisjZGVmaW5lIFBUX1JFR1NfUkNfQ09SRSh4KSBCUEZf
Q09SRV9SRUFEKChQVF9SRUdTX1JWICopKHgpLCBhNSkKKyNkZWZpbmUgUFRfUkVHU19TUF9DT1JF
KHgpIEJQRl9DT1JFX1JFQUQoKFBUX1JFR1NfUlYgKikoeCksIHNwKQorI2RlZmluZSBQVF9SRUdT
X0lQX0NPUkUoeCkgQlBGX0NPUkVfUkVBRCgoUFRfUkVHU19SViAqKSh4KSwgZXBjKQorCiAjZW5k
aWYKIAogI2lmIGRlZmluZWQoYnBmX3RhcmdldF9wb3dlcnBjKQotLSAKMi4zMi4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
