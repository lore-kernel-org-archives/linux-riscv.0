Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A94CC25B6C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 13:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ia+kAZJZAm07Xi5ea8aXUOUwekHQu8pfydeEsjDpLw0=; b=B5YYOx572eboUv
	3vOnAZWX/bpQgRcmm+tmFW8Ux1kk/jGj5J3kkWzxrBwU1vsmBh3ia0yzJ7R4ofZAgo62jH+n5gUzu
	WkO2g+xgN30cGx0FpjDT1stDwJEJDQTg9Fu1DzF9OtJ1l2mhk0PDt18360r84XPk5nY6nTPe2Iy2C
	RSawFqpB3y1jjvU2Nf7YDIfB8Yer6Eep/y3uOXt7voSdbbf4Jd/Fy/U3Z+S/42PdIrX9liu+IyuIf
	wtU13C+GMYEuwcijDZRprzIAxy/rPGF4iIM/4wsXLnY+L0e/06rEZHBTwOPhzaNPp0Q4qoMDBJWSu
	7LzeWHjTeP0ZTOTlDgnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHRz-009wqi-0T;
	Tue, 24 Oct 2023 13:28:03 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvHRs-009wlT-2z
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 13:27:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-407acb21f27so4911465e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 06:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698154075; x=1698758875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AX7Kg3pLTr22HxmtrSzH05kFw/tkq3Ew+3ARfiqVrfA=;
        b=qWoaVCVJe04pOTJqbYEOs3k7adZE23kGX0MOgaE2j7LOtHTMUn+y7nqw16Sc/TKkXI
         0aMGx5JQetq4cYFpwJiqzAh4PYUmw14d8CmHPaaq5QnwKnbUlcodTEgRtigVyGiC6M7T
         nQQw5CW8N7p0j2uGEh6+IT58jd9bzsmsxNb9gumUy94+PSbbPXpnOHPZNdn3irImAYUE
         gLclfVMPF2a4V/bdGdhCvWUqlen2nPntWhTCNpMQDlQeyL8hkkay/8tfAvD+Uhms0e0I
         hnHY91Z5xtvJX7tCQ7kOMecPMlM9cip4BuNZxJatETTd1Ss9ojJb64/clmDSkZk9INLN
         XiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698154075; x=1698758875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX7Kg3pLTr22HxmtrSzH05kFw/tkq3Ew+3ARfiqVrfA=;
        b=hzQymFY4Y6Yze4siAZCby4X0xCmVWFotpCMsAIEVQ+Ipe9B38AHI7/amW6EzAeNLwI
         pQkpyYiFwMbbeFOM8TssXFFiSM0DyS4zshWYQSekJBF/ev5FA7PnyAJynnKMBcxXg54e
         hEUdUYV6Lfn7ruTwTZOSQW9KeJ/XyV/yKBim8toTDOhX4Pnh51zZtpBh9e83qQdD401q
         4UCrXi+MpMiVkmEOQtqHKdI/rYL669H2MciZZEnqYI0R1mepEnVwP2NZxPOuUnOxA0u4
         fq+LxmKwgzHw/96EWt93MhGO1GrFwJpISNR55F63AqbWRoKSUcSDyYbIrqxHszsLMH77
         HpWA==
X-Gm-Message-State: AOJu0YyUmh3HZG+Sp4wLC5Nw9hirhn1cVpB+VqpZsX7EE7FcS79wI1Ie
	vAGpC+n+6lmRL3e6P48gJhCQVw==
X-Google-Smtp-Source: AGHT+IHA25WZkPnpG7hkj0epNRPJqd27SODY+lc7O8SDNKvya8GFTiFglhkKPL8RIhS/CoJQXkOmIg==
X-Received: by 2002:a05:600c:35cc:b0:401:7d3b:cc84 with SMTP id r12-20020a05600c35cc00b004017d3bcc84mr9290453wmq.0.1698154075695;
        Tue, 24 Oct 2023 06:27:55 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:597d:e2c5:6741:bac9])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d4151000000b0032d87b13240sm10034964wrq.73.2023.10.24.06.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 06:27:54 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 4/5] riscv: kvm: Use SYM_*() assembly macros instead of deprecated ones
Date: Tue, 24 Oct 2023 15:26:54 +0200
Message-ID: <20231024132655.730417-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024132655.730417-1-cleger@rivosinc.com>
References: <20231024132655.730417-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_062757_015761_2BD1E541 
X-CRM114-Status: UNSURE (   9.80  )
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

RU5UUlkoKS9FTkQoKS9XRUFLKCkgbWFjcm9zIGFyZSBkZXByZWNhdGVkIGFuZCB3ZSBzaG91bGQg
bWFrZSB1c2Ugb2YgdGhlCm5ldyBTWU1fKigpIG1hY3JvcyBbMV0gZm9yIGJldHRlciBhbm5vdGF0
aW9uIG9mIHN5bWJvbHMuIFJlcGxhY2UgdGhlCmRlcHJlY2F0ZWQgb25lcyB3aXRoIHRoZSBuZXcg
b25lcyBhbmQgZml4IHdyb25nIHVzYWdlIG9mIEVORCgpL0VORFBST0MoKQp0byBjb3JyZWN0bHkg
ZGVzY3JpYmUgdGhlIHN5bWJvbHMuCgpbMV0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvY29yZS1h
cGkvYXNtLWFubm90YXRpb25zLmh0bWwKClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8
Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUyB8IDI4ICsr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3N3
aXRjaC5TIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUwppbmRleCBkNzRkZjhlYjRkNzEu
LjhiMTg0NzM3ODBhYyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zd2l0Y2guUwor
KysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3N3aXRjaC5TCkBAIC0xNSw3ICsxNSw3IEBACiAJLmFs
dG1hY3JvCiAJLm9wdGlvbiBub3JlbGF4CiAKLUVOVFJZKF9fa3ZtX3Jpc2N2X3N3aXRjaF90bykK
K1NZTV9GVU5DX1NUQVJUKF9fa3ZtX3Jpc2N2X3N3aXRjaF90bykKIAkvKiBTYXZlIEhvc3QgR1BS
cyAoZXhjZXB0IEEwIGFuZCBUMC1UNikgKi8KIAlSRUdfUwlyYSwgKEtWTV9BUkNIX0hPU1RfUkEp
KGEwKQogCVJFR19TCXNwLCAoS1ZNX0FSQ0hfSE9TVF9TUCkoYTApCkBAIC0yMDgsOSArMjA4LDkg
QEAgX19rdm1fc3dpdGNoX3JldHVybjoKIAogCS8qIFJldHVybiB0byBDIGNvZGUgKi8KIAlyZXQK
LUVORFBST0MoX19rdm1fcmlzY3Zfc3dpdGNoX3RvKQorU1lNX0ZVTkNfRU5EKF9fa3ZtX3Jpc2N2
X3N3aXRjaF90bykKIAotRU5UUlkoX19rdm1fcmlzY3ZfdW5wcml2X3RyYXApCitTWU1fQ09ERV9T
VEFSVChfX2t2bV9yaXNjdl91bnByaXZfdHJhcCkKIAkvKgogCSAqIFdlIGFzc3VtZSB0aGF0IGZh
dWx0aW5nIHVucHJpdiBsb2FkL3N0b3JlIGluc3RydWN0aW9uIGlzCiAJICogNC1ieXRlIGxvbmcg
YW5kIGJsaW5kbHkgaW5jcmVtZW50IFNFUEMgYnkgNC4KQEAgLTIzMSwxMiArMjMxLDEwIEBAIEVO
VFJZKF9fa3ZtX3Jpc2N2X3VucHJpdl90cmFwKQogCWNzcnIJYTEsIENTUl9IVElOU1QKIAlSRUdf
UwlhMSwgKEtWTV9BUkNIX1RSQVBfSFRJTlNUKShhMCkKIAlzcmV0Ci1FTkRQUk9DKF9fa3ZtX3Jp
c2N2X3VucHJpdl90cmFwKQorU1lNX0NPREVfRU5EKF9fa3ZtX3Jpc2N2X3VucHJpdl90cmFwKQog
CiAjaWZkZWYJQ09ORklHX0ZQVQotCS5hbGlnbiAzCi0JLmdsb2JhbCBfX2t2bV9yaXNjdl9mcF9m
X3NhdmUKLV9fa3ZtX3Jpc2N2X2ZwX2Zfc2F2ZToKK1NZTV9GVU5DX1NUQVJUKF9fa3ZtX3Jpc2N2
X2ZwX2Zfc2F2ZSkKIAljc3JyIHQyLCBDU1JfU1NUQVRVUwogCWxpIHQxLCBTUl9GUwogCWNzcnMg
Q1NSX1NTVEFUVVMsIHQxCkBAIC0yNzYsMTAgKzI3NCw5IEBAIF9fa3ZtX3Jpc2N2X2ZwX2Zfc2F2
ZToKIAlzdyB0MCwgS1ZNX0FSQ0hfRlBfRl9GQ1NSKGEwKQogCWNzcncgQ1NSX1NTVEFUVVMsIHQy
CiAJcmV0CitTWU1fRlVOQ19FTkQoX19rdm1fcmlzY3ZfZnBfZl9zYXZlKQogCi0JLmFsaWduIDMK
LQkuZ2xvYmFsIF9fa3ZtX3Jpc2N2X2ZwX2Rfc2F2ZQotX19rdm1fcmlzY3ZfZnBfZF9zYXZlOgor
U1lNX0ZVTkNfU1RBUlQoX19rdm1fcmlzY3ZfZnBfZF9zYXZlKQogCWNzcnIgdDIsIENTUl9TU1RB
VFVTCiAJbGkgdDEsIFNSX0ZTCiAJY3NycyBDU1JfU1NUQVRVUywgdDEKQEAgLTMxOSwxMCArMzE2
LDkgQEAgX19rdm1fcmlzY3ZfZnBfZF9zYXZlOgogCXN3IHQwLCBLVk1fQVJDSF9GUF9EX0ZDU1Io
YTApCiAJY3NydyBDU1JfU1NUQVRVUywgdDIKIAlyZXQKK1NZTV9GVU5DX0VORChfX2t2bV9yaXNj
dl9mcF9kX3NhdmUpCiAKLQkuYWxpZ24gMwotCS5nbG9iYWwgX19rdm1fcmlzY3ZfZnBfZl9yZXN0
b3JlCi1fX2t2bV9yaXNjdl9mcF9mX3Jlc3RvcmU6CitTWU1fRlVOQ19TVEFSVChfX2t2bV9yaXNj
dl9mcF9mX3Jlc3RvcmUpCiAJY3NyciB0MiwgQ1NSX1NTVEFUVVMKIAlsaSB0MSwgU1JfRlMKIAls
dyB0MCwgS1ZNX0FSQ0hfRlBfRl9GQ1NSKGEwKQpAQCAtMzYyLDEwICszNTgsOSBAQCBfX2t2bV9y
aXNjdl9mcF9mX3Jlc3RvcmU6CiAJZnNjc3IgdDAKIAljc3J3IENTUl9TU1RBVFVTLCB0MgogCXJl
dAorU1lNX0ZVTkNfRU5EKF9fa3ZtX3Jpc2N2X2ZwX2ZfcmVzdG9yZSkKIAotCS5hbGlnbiAzCi0J
Lmdsb2JhbCBfX2t2bV9yaXNjdl9mcF9kX3Jlc3RvcmUKLV9fa3ZtX3Jpc2N2X2ZwX2RfcmVzdG9y
ZToKK1NZTV9GVU5DX1NUQVJUKF9fa3ZtX3Jpc2N2X2ZwX2RfcmVzdG9yZSkKIAljc3JyIHQyLCBD
U1JfU1NUQVRVUwogCWxpIHQxLCBTUl9GUwogCWx3IHQwLCBLVk1fQVJDSF9GUF9EX0ZDU1IoYTAp
CkBAIC00MDUsNCArNDAwLDUgQEAgX19rdm1fcmlzY3ZfZnBfZF9yZXN0b3JlOgogCWZzY3NyIHQw
CiAJY3NydyBDU1JfU1NUQVRVUywgdDIKIAlyZXQKK1NZTV9GVU5DX0VORChfX2t2bV9yaXNjdl9m
cF9kX3Jlc3RvcmUpCiAjZW5kaWYKLS0gCjIuNDIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
