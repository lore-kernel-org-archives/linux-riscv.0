Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CD8C4706C
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WaaGBmTHu5Yd4KnWkl51rlAekVzsyPyUtuuwlTTNPxw=; b=T7OWZuM2B/18LX
	hsB6r5+pi7K1FYh8pIFU+aaTZ1RrdnY4q5Q4Og6m0lYQsq1/5GQdpZjw99Boew9Dc2ifAbp0OmikN
	uWCfJseQ1ejP2nH7qV9THlC5gUxFhD/Py/6nFtC0uStutopEXwix4/7/2c9BjpyvNEnfLA35nD0VK
	QOirCKziLA3RGPWxbe34lN1H7lJSEbJnDu7v9g52b8hFDZFxIa05QRY5sPUl5vEZ3LAXeB8uRiYWz
	gIghyZR4U7DNmC+oxP+JG1YtS/xMrKXZYCiP337HePp7toJ7d/XY2/NIBf9F6twNIpF8AAtO2+Bpd
	k4Wnz7JxQr3P0c3Lr/jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyxJ-000KQg-1L;
	Wed, 20 Dec 2023 15:57:57 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyxC-000KKh-32
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 15:57:52 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3367f8757d0so45869f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087867; x=1703692667; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXiIygoI2xfoAtWyxNJaEZbhAX2C42esk/G1o5mFVH8=;
        b=U20dxp/QVH+052naua0PIKsU8Eto5QVztx1eawNQQdRDfYfyV6D2RKeKKhXuy1+BPe
         zFjQFA2C24W0UqzJYMMRDmgOHGM0MWGNr38GRCXekHTWF8KWhRlHdPa9Ka0FLWrz9pgG
         UkTbxjGkBDe32nCfRi106Z12ey5Xfx4/EwvoHg4oTUIH3npfG+d7uD3KTvXSx+oyNzbp
         ghSfjbVEvMtQcaBIFcjPEU1rnp91WuOgndNAuntdJgdUpj0Yw0E8lCvgWgkWUqws+7jM
         2WpNobagwY/NcAucs/M1mRlGt7mWU6MvPjs/fwbUE4QqMzzqJool+pvCFeSUdKnN7/Nk
         EcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087867; x=1703692667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXiIygoI2xfoAtWyxNJaEZbhAX2C42esk/G1o5mFVH8=;
        b=R3eTMCvExNCHCchC9x1CwAoSIU9wExt8IoF8u4o2xhRbbFHZ2bkKYv6MBZvcYpWmJP
         lnor/sAnOLAUjfD4Fo0TrayLnU8AbXckM72HRzIgWKDTeSjCqLatCPaNsVTg2sAubp+o
         gJvfjHzvdSP60OJxvxT29bYo0wi4Ue7xHqqq4WuZ+dVOtvDUb1SdYu1hOM18xn1c5MvE
         aRtdPQZn1X9R9NcK7gsklMv2CJTUTgvHVBJ0Pm5r9aHYtC3NSX1HfNwL7BpN5KdDH7Vp
         k8l4lah11o/bh4e3P++l47L01Zzfsf0E7FKaxADEob98gli1vvrB1qsWn1oz2soCq8gZ
         UMEw==
X-Gm-Message-State: AOJu0YwuSIXC0djog3JuiBI6pbawIzNTcdBx5NQKeSicxXdYlEjyU7M1
	xvuQ2Bp9og0EuNEZvO2TPQHE/Q==
X-Google-Smtp-Source: AGHT+IEpr+96oxZFiK4cxomHHqE/jg1PvdGozQiMvvlQ4NTHaFlfmPa9ipv0kbSLSizkLF3AkktCuw==
X-Received: by 2002:adf:e2c4:0:b0:336:4a0e:4284 with SMTP id d4-20020adfe2c4000000b003364a0e4284mr12246378wrj.6.1703087867017;
        Wed, 20 Dec 2023 07:57:47 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:46 -0800 (PST)
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
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v2 6/6] riscv: hwprobe: export Zicond extension
Date: Wed, 20 Dec 2023 16:57:22 +0100
Message-ID: <20231220155723.684081-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220155723.684081-1-cleger@rivosinc.com>
References: <20231220155723.684081-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_075750_981030_BE54D50D 
X-CRM114-Status: GOOD (  11.02  )
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

RXhwb3J0IHRoZSB6aWNvbmQgZXh0ZW5zaW9uIHRvIHVzZXJzcGFjZSB1c2luZyBod3Byb2JlLgoK
U2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0K
IERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCAgfCA1ICsrKysrCiBhcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9z
eXNfcmlzY3YuYyAgICAgICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdAppbmRleCBiZmY2ODAwNGFkNDMuLmVl
MzIwZmU3NTgxYiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUu
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTY5LDYg
KzE2OSwxMSBAQCBUaGUgZm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAgICAgICAgZGVmaW5l
ZCBpbiB0aGUgQXRvbWljIENvbXBhcmUtYW5kLVN3YXAgKENBUykgaW5zdHJ1Y3Rpb25zIG1hbnVh
bCBzdGFydGluZwogICAgICAgIGZyb20gY29tbWl0IDUwNTllMGNhNjQxYyAoInVwZGF0ZSB0byBy
YXRpZmllZCIpLgogCisgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfRVhUX1pJQ09ORGA6IFRo
ZSBaaWNvbmQgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCBhcworICAgICAgIGRlZmluZWQgaW4gdGhl
IFJJU0MtViBJbnRlZ2VyIENvbmRpdGlvbmFsIChaaWNvbmQpIG9wZXJhdGlvbnMgZXh0ZW5zaW9u
CisgICAgICAgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0IDk1Y2YxZjkgKCJBZGQgY2hhbmdl
cyByZXF1ZXN0ZWQgYnkgVmVkCisgICAgICAgZHVyaW5nIHNpZ25vZmYiKQorCiAqIDpjOm1hY3Jv
OmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBgOiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBw
ZXJmb3JtYW5jZQogICBpbmZvcm1hdGlvbiBhYm91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nl
c3NvcnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2Jl
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCmluZGV4IGFjNjViYjQz
YzhlNy4uZmQ3YWYwZGRkYjEyIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgK
QEAgLTU4LDYgKzU4LDcgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9FWFRfWkZBCQkoMVVMTCA8PCAzMikKICNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhU
X1pUU08JCSgxVUxMIDw8IDMzKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkFDQVMJCSgx
VUxMIDw8IDM0KQorI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklDT05ECSgxVUxMIDw8IDM1
KQogI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzAJNQogI2RlZmluZQkJUklTQ1Zf
SFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04JKDAgPDwgMCkKICNkZWZpbmUJCVJJU0NWX0hXUFJP
QkVfTUlTQUxJR05FRF9FTVVMQVRFRAkoMSA8PCAwKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX3Jpc2N2LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwppbmRleCA2
YzY4MGM3NWFjMGQuLmNjYTliMWUzNTY0NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwv
c3lzX3Jpc2N2LmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKQEAgLTE3Niw2
ICsxNzYsNyBAQCBzdGF0aWMgdm9pZCBod3Byb2JlX2lzYV9leHQwKHN0cnVjdCByaXNjdl9od3By
b2JlICpwYWlyLAogCQlFWFRfS0VZKFpJSElOVE5UTCk7CiAJCUVYVF9LRVkoWlRTTyk7CiAJCUVY
VF9LRVkoWkFDQVMpOworCQlFWFRfS0VZKFpJQ09ORCk7CiAKIAkJaWYgKGhhc192ZWN0b3IoKSkg
ewogCQkJRVhUX0tFWShaVkJCKTsKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
