Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14890E7E648
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 15:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHFyMDqIFfMpEhX0jRdhThq+/KF5BFM/fywmQQQrIHY=; b=Rb1iXdV/SKCVts
	dL6XuBNHgwO0Vcg+KEohkAAtRmQoHRbJ7BTFFHuf/rILL1uPQPBrJU4wOVczMXKVr9cL0eSBrNLC8
	T7EyZO2wICBQWTA8ixrprpcqzaKpt5ECQqKYNLhHmEdBQXyrxqG6r4ElY4/RUrh5Ez9bW9uuNIjGC
	ZWugqlTL6Q9wDNUcEIPr9P6MKZ7MEiPndDtSaPNrdYrgoxQUjDxSA9xKeP4NZ9Rz9Lf1yJ59J8ltK
	I2jvo71eFk9nBDHC98hQf3/YE185CmSXseM02h3sQZIyYu29aFiNytOeqDOErS22FI2nzgbBtXVbc
	ED26Fg0kFVA38GU+jiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bX-00GbNs-0S;
	Tue, 26 Sep 2023 15:04:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql9bQ-00GbJZ-1P
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 15:03:59 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3232bb059d3so775976f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 08:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1695740632; x=1696345432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQDAxN5g1vMcAJWLoIEgGtbs3vH3NsC3JS3eiLLd1tc=;
        b=v1J9p0rcq9E76GiPKCMTNdaKvf6uyz68OXT1bGFzV6jon8MaBUaXw57Liq5TUx7enA
         YBLNMzlARFJrw1mla5uUs4cJ8P8G7Vbnit55IuMXgp67EC6C8gGgjWa5Kn29yiOwh0O+
         N0PAggsxQhSYv258LX5945zxjoqpID+4LpXfXS99PLe4+ejnhlq9c83vhl7xfFxYQevp
         m5NaxIm9EIP/Y9WoqtXSYYPNdwVzkzqGRhh/Ufy9JAHrxKNoF6pxulKVTvLEHhTzTNRT
         /+x3fY2CNsDp/sbpxBWFNWOefRSYPm1EPKy1/vMe+xVq08PhqS0wyx342upuEdAnZ9qo
         6EcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740632; x=1696345432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQDAxN5g1vMcAJWLoIEgGtbs3vH3NsC3JS3eiLLd1tc=;
        b=uc8+c/dV7dG9N7iAeWUxeDVhASZtpXBdIrfoY5n4zLl8+ms3t72VvQWHtcoovyl8aD
         akeHGdOnsy5GmoGjh0z7HH7o/xvjqMlYX2ab+HUS4NGUXQ7UNli0VkmvQx3UK15Hd2w3
         +c6sBRXH0vrjO2Pwoak2uoNSiCt9WTwXSJ2LHP/eElDvqNUcERwSyLjwDdj8Vyrchn7h
         V5d0OcCcEonYJghDDhYU9L62i/bnA96SQURjPm5etN9hEgDw3FT0gQeast3auk8oYrOx
         thbnGwy9I8yGZLKi0wkXC1vFyKfhAfyV8yfEWLWXJ840Diye+bmoObwgUAf0eHV73R1W
         PavA==
X-Gm-Message-State: AOJu0YxRC46zpkVddvePO/CtVTd+nXktYlg2D9VzfxuCmkGAc2T1SY5C
	mKCpg90y1UpJqDLuusgsEdTyIA==
X-Google-Smtp-Source: AGHT+IH9PRCXtJEPxMLZQ5j5Z5+cpNGCxbKpqseY8qd18eONWrD2LaNnzT+g47bz5kOVc9HeGDcZ5g==
X-Received: by 2002:adf:a456:0:b0:323:2df9:618f with SMTP id e22-20020adfa456000000b003232df9618fmr3634053wra.0.1695740632703;
        Tue, 26 Sep 2023 08:03:52 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2b3d:6c70:9dbf:5ede])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d650b000000b00318147fd2d3sm14926060wru.41.2023.09.26.08.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 08:03:52 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Topel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ron Minnich <rminnich@gmail.com>,
	Daniel Maslowski <cyrevolt@googlemail.com>
Subject: [PATCH 1/7] riscv: remove unused functions in traps_misaligned.c
Date: Tue, 26 Sep 2023 17:03:10 +0200
Message-Id: <20230926150316.1129648-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230926150316.1129648-1-cleger@rivosinc.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_080356_494405_294A1CF8 
X-CRM114-Status: UNSURE (   9.40  )
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

UmVwbGFjZSBtYWNyb3MgYnkgdGhlIG9ubHkgdHdvIGZ1bmN0aW9uIGNhbGxzIHRoYXQgYXJlIGRv
bmUgZnJvbSB0aGlzCmZpbGUsIHN0b3JlX3U4KCkgYW5kIGxvYWRfdTgoKS4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCA0NiArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzOSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKaW5kZXggMzc4ZjViMTUxNDQzLi5lN2JmYjMz
MDg5YzEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwor
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTE1MSw1MSArMTUx
LDE5IEBACiAjZGVmaW5lIFBSRUNJU0lPTl9TIDAKICNkZWZpbmUgUFJFQ0lTSU9OX0QgMQogCi0j
ZGVmaW5lIERFQ0xBUkVfVU5QUklWSUxFR0VEX0xPQURfRlVOQ1RJT04odHlwZSwgaW5zbikJCQlc
Ci1zdGF0aWMgaW5saW5lIHR5cGUgbG9hZF8jI3R5cGUoY29uc3QgdHlwZSAqYWRkcikJCQlcCi17
CQkJCQkJCQkJXAotCXR5cGUgdmFsOwkJCQkJCQlcCi0JYXNtICgjaW5zbiAiICUwLCAlMSIJCQkJ
CQlcCi0JOiAiPSZyIiAodmFsKSA6ICJtIiAoKmFkZHIpKTsJCQkJCVwKLQlyZXR1cm4gdmFsOwkJ
CQkJCQlcCi19CitzdGF0aWMgaW5saW5lIHU4IGxvYWRfdTgoY29uc3QgdTggKmFkZHIpCit7CisJ
dTggdmFsOwogCi0jZGVmaW5lIERFQ0xBUkVfVU5QUklWSUxFR0VEX1NUT1JFX0ZVTkNUSU9OKHR5
cGUsIGluc24pCQkJXAotc3RhdGljIGlubGluZSB2b2lkIHN0b3JlXyMjdHlwZSh0eXBlICphZGRy
LCB0eXBlIHZhbCkJCQlcCi17CQkJCQkJCQkJXAotCWFzbSB2b2xhdGlsZSAoI2luc24gIiAlMCwg
JTFcbiIJCQkJCVwKLQk6IDogInIiICh2YWwpLCAibSIgKCphZGRyKSk7CQkJCQlcCi19CisJYXNt
IHZvbGF0aWxlKCJsYnUgJTAsICUxIiA6ICI9JnIiICh2YWwpIDogIm0iICgqYWRkcikpOwogCi1E
RUNMQVJFX1VOUFJJVklMRUdFRF9MT0FEX0ZVTkNUSU9OKHU4LCBsYnUpCi1ERUNMQVJFX1VOUFJJ
VklMRUdFRF9MT0FEX0ZVTkNUSU9OKHUxNiwgbGh1KQotREVDTEFSRV9VTlBSSVZJTEVHRURfTE9B
RF9GVU5DVElPTihzOCwgbGIpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9MT0FEX0ZVTkNUSU9OKHMx
NiwgbGgpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9MT0FEX0ZVTkNUSU9OKHMzMiwgbHcpCi1ERUNM
QVJFX1VOUFJJVklMRUdFRF9TVE9SRV9GVU5DVElPTih1OCwgc2IpCi1ERUNMQVJFX1VOUFJJVklM
RUdFRF9TVE9SRV9GVU5DVElPTih1MTYsIHNoKQotREVDTEFSRV9VTlBSSVZJTEVHRURfU1RPUkVf
RlVOQ1RJT04odTMyLCBzdykKLSNpZiBkZWZpbmVkKENPTkZJR182NEJJVCkKLURFQ0xBUkVfVU5Q
UklWSUxFR0VEX0xPQURfRlVOQ1RJT04odTMyLCBsd3UpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9M
T0FEX0ZVTkNUSU9OKHU2NCwgbGQpCi1ERUNMQVJFX1VOUFJJVklMRUdFRF9TVE9SRV9GVU5DVElP
Tih1NjQsIHNkKQotREVDTEFSRV9VTlBSSVZJTEVHRURfTE9BRF9GVU5DVElPTih1bG9uZywgbGQp
Ci0jZWxzZQotREVDTEFSRV9VTlBSSVZJTEVHRURfTE9BRF9GVU5DVElPTih1MzIsIGx3KQotREVD
TEFSRV9VTlBSSVZJTEVHRURfTE9BRF9GVU5DVElPTih1bG9uZywgbHcpCi0KLXN0YXRpYyBpbmxp
bmUgdTY0IGxvYWRfdTY0KGNvbnN0IHU2NCAqYWRkcikKLXsKLQlyZXR1cm4gbG9hZF91MzIoKHUz
MiAqKWFkZHIpCi0JCSsgKCh1NjQpbG9hZF91MzIoKHUzMiAqKWFkZHIgKyAxKSA8PCAzMik7CisJ
cmV0dXJuIHZhbDsKIH0KIAotc3RhdGljIGlubGluZSB2b2lkIHN0b3JlX3U2NCh1NjQgKmFkZHIs
IHU2NCB2YWwpCitzdGF0aWMgaW5saW5lIHZvaWQgc3RvcmVfdTgodTggKmFkZHIsIHU4IHZhbCkK
IHsKLQlzdG9yZV91MzIoKHUzMiAqKWFkZHIsIHZhbCk7Ci0Jc3RvcmVfdTMyKCh1MzIgKilhZGRy
ICsgMSwgdmFsID4+IDMyKTsKKwlhc20gdm9sYXRpbGUgKCJzYiAlMCwgJTFcbiIgOiA6ICJyIiAo
dmFsKSwgIm0iICgqYWRkcikpOwogfQotI2VuZGlmCiAKIHN0YXRpYyBpbmxpbmUgdWxvbmcgZ2V0
X2luc24odWxvbmcgbWVwYykKIHsKLS0gCjIuNDAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
