Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424DFFF4931
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 02:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xw9EhS2WIL5ARiKGud3/SjcTx5wtnrdU7DiRHZ2ZsOI=; b=nyRhmNbdAkA8K6
	Gxr0/lx7/IUvW1A6Hxp+++s/t6hkFEB72/ySjNxPiqb1dT5SytSneVUu6XjQVNeYkllHavqGHoPCj
	iKG+RuOKU17m3lj+g40boQn7vRW7lk2+zj7aXMWVIh05BG5id+BtC+bFJHXdbprgSTFbdCOUXRv7W
	DQ4PAn7hwLh7zb5PnuhDXXSdvYyJ1T8aLcSZ9dqiCMtZs/eNnjqzrSSc79p/7qY/p6G/G2lqb3I33
	OAEz2Arco4aJF43BLr9ozFdLAzo7uWD7OBMz1ycl3tlCgaXu+pBe5+FI75L2jc5Kw4K0uh08dpcQt
	vv/mOD2//DuLe+D7vIyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w72bj-0000000AW51-0FJk;
	Mon, 30 Mar 2026 02:44:03 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w72bg-0000000AW4a-1ph6
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 02:44:02 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7d7e565c877so2003932a34.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 Mar 2026 19:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774838638; x=1775443438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/cr7tnW+FiBkdySYz3yiFy4S6DKlBZtj6rBewovXxhs=;
        b=gVGTDuYZpN6whxe4lprdiutDq2PY/y4ujiv2lxEHr9NDjQNNR3iEPdrA6FN5KYcp0U
         Yyl5F2Rc0bMxMH6dxes6qMDlpgSjxAd4eseYBqV/PpV9MZDQifc8SWS9lWJCmovYmHk8
         9C6MlsxsaSL2LK74t+bHVmCbcuhfCbQoUJWde9CzZQONv4OxzQbyPsxKJZ76dqio1iyi
         WdDRNLzWvf/qzB+U0S5Bb08YjDZgpsht4QJoHtV9HqpZXFt7bZyiV5XU1ptm8Aqz2FNc
         5RMYY1GTijwP6y21qq/f05giFxfoCgn0D7hkz3d/lZrctoBfdjHimrK0CAoBR+oVnyOB
         IWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774838638; x=1775443438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cr7tnW+FiBkdySYz3yiFy4S6DKlBZtj6rBewovXxhs=;
        b=R2eHVHKXeHlB4VNYeZzDaHl4Md3WiwXmDesTYXdAeD7ryM0ytCYcLcn1qaTOssE90B
         DgUFWuD7otvVXqlQL0LHGcI+UizxIMHEIjKZHxZB8iN4FrgWJNv/kvlpkXb14WRM1/zu
         HwL86suyeNBaiB2a5Nd3YzfyBkHRE8s6ND2XVru57d0YvHJ2IbGJyTPi/14rqD+F4RWu
         YyOwyV1n/KolLVPWwiXfMX7TLbB8bUgLOnx0etUPLqTo1Gf7awB2icxiLNr3JMQKKMXz
         ijN+/xi+QVD7rmqp2t3P9XOctO2cKA69MRVs69+xcBqKAHp8X69mgtI6H7uW+LDt60Xs
         gtfw==
X-Forwarded-Encrypted: i=1; AJvYcCXsttSWjoM+ACffRF8KTg9geuAUZU1tvba+kNAGJr9/19uqKKUOjInUiqmcY0++GcF/tsMMUJIcoVnILw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjR8Zx6cl9atL03xWlds8ff43euOCWY/BWiVzC7U1hlRZ9jZ1N
	Ld8lH4z7d2J7It/wWMESnK510qv6NY9pih5hJyN9cFoHx4JTFKW8zh/I
X-Gm-Gg: ATEYQzyzooRBxPTILfUh3wimC77L3YBe/kmRraMRY2kuDunr0aePEQ4PKKq1RX8s4sq
	HLRSkoc3ftAon06fDGuov62cwYX3C9Lg1VlnDJiROhM9MnuVEkAfMWO+D8pS3B2zXw4ILRG0zW2
	jKqFe1S4GsQSHIPcUy5x7frJ1FpOw2w3KknERw32Oil6QmiSyMZO1yHSHYXN1GzHqLqLy8ZVhd8
	oFZWD0nUTTak4gAM/xr77w7iuo3k4KiJZCn8Wnl0wfnGCgoGPe7vaVDuap4DKwRwUkLikmcbl8B
	Gf6zx3c0DKLbbkNw7JLgIDlrkIbcJmFsrQ7mfRnT3Th3jZtTOuhukJEWoJfyCIHW6sfKAuHE/Si
	AcRPBAz/pynKT/GJMPEpWOsMMgyspXkLSxy8zIpRM3IcAGtT84ZwG7eGB7M3U1CcE1/+6yIJI4m
	tiv0ruE49V9MFx6fVP+e3Dvqkh23c675vokA==
X-Received: by 2002:a05:6870:b908:b0:40e:e3f6:bc9e with SMTP id 586e51a60fabf-41cec08e1e5mr6206985fac.7.1774838638245;
        Sun, 29 Mar 2026 19:43:58 -0700 (PDT)
Received: from ird-aus2.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d04d6bf89sm3855350fac.16.2026.03.29.19.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 19:43:57 -0700 (PDT)
From: Michael Neuling <mikey@neuling.org>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	debug@rivosinc.com,
	thecharlesjenkins@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mikey@neuling.org
Subject: [PATCH] riscv: ptrace: avoid BIT() in UAPI header
Date: Mon, 30 Mar 2026 02:42:48 +0000
Message-ID: <20260330024248.449292-1-mikey@neuling.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_194400_504040_442A4D4E 
X-CRM114-Status: UNSURE (   8.76  )
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

QklUKCkgaXMgbm90IGF2YWlsYWJsZSBpbiBVQVBJIGhlYWRlcnMg4oCUIHRoZSBpbnN0YWxsZWQg
bGludXgvYml0cy5oCihVQVBJIHZlcnNpb24pIGRvZXMgbm90IGRlZmluZSBpdC4gUmVwbGFjZSBC
SVQoKSB3aXRoIG9wZW4tY29kZWQKKDFVTCA8PCB4KSB3aGljaCBpcyB0aGUgc3RhbmRhcmQgcHJh
Y3RpY2UgZm9yIFVBUEkgaGVhZGVycywgYW5kIGRyb3AKdGhlIGxpbnV4L2JpdHMuaCBpbmNsdWRl
IHRoYXQgd2FzIGFkZGVkIGJ5IGNvbW1pdCA5ODU0NTYyMGIwICgicmlzY3Y6CnB0cmFjZTogRml4
IEJJVCgpIGNvbXBpbGF0aW9uIGlzc3VlcyIpLgoKRml4ZXM6IDk4NTQ1NjIwYjAgKCJyaXNjdjog
cHRyYWNlOiBGaXggQklUKCkgY29tcGlsYXRpb24gaXNzdWVzIikKU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBOZXVsaW5nIDxtaWtleUBuZXVsaW5nLm9yZz4KQXNzaXN0ZWQtYnk6IENsYXVkZSBPcHVz
IDQuNiAoMU0gY29udGV4dCkgPG5vcmVwbHlAYW50aHJvcGljLmNvbT4KLS0tCiBhcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmggfCAxMyArKysrKystLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9wdHJhY2UuaAppbmRleCA1YjUzY2VhMTQzLi43Y2JkNTU4YjliIDEwMDY0NAotLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL3B0cmFjZS5oCkBAIC04LDcgKzgsNiBAQAogCiAjaWZuZGVmIF9fQVNTRU1C
TEVSX18KIAotI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KICNpbmNsdWRlIDxsaW51eC90eXBlcy5o
PgogCiAjZGVmaW5lIFBUUkFDRV9HRVRGRFBJQwkJMzMKQEAgLTEzOSwxMiArMTM4LDEyIEBAIHN0
cnVjdCBfX3NjX3Jpc2N2X2NmaV9zdGF0ZSB7CiAjZGVmaW5lIFBUUkFDRV9DRklfU1NfTE9DS19C
SVQJNAogI2RlZmluZSBQVFJBQ0VfQ0ZJX1NTX1BUUl9CSVQJNQogCi0jZGVmaW5lIFBUUkFDRV9D
RklfTFBfRU5fU1RBVEUJCUJJVChQVFJBQ0VfQ0ZJX0xQX0VOX0JJVCkKLSNkZWZpbmUgUFRSQUNF
X0NGSV9MUF9MT0NLX1NUQVRFCUJJVChQVFJBQ0VfQ0ZJX0xQX0xPQ0tfQklUKQotI2RlZmluZSBQ
VFJBQ0VfQ0ZJX0VMUF9TVEFURQkJQklUKFBUUkFDRV9DRklfRUxQX0JJVCkKLSNkZWZpbmUgUFRS
QUNFX0NGSV9TU19FTl9TVEFURQkJQklUKFBUUkFDRV9DRklfU1NfRU5fQklUKQotI2RlZmluZSBQ
VFJBQ0VfQ0ZJX1NTX0xPQ0tfU1RBVEUJQklUKFBUUkFDRV9DRklfU1NfTE9DS19CSVQpCi0jZGVm
aW5lIFBUUkFDRV9DRklfU1NfUFRSX1NUQVRFCQlCSVQoUFRSQUNFX0NGSV9TU19QVFJfQklUKQor
I2RlZmluZSBQVFJBQ0VfQ0ZJX0xQX0VOX1NUQVRFCQkoMVVMIDw8IFBUUkFDRV9DRklfTFBfRU5f
QklUKQorI2RlZmluZSBQVFJBQ0VfQ0ZJX0xQX0xPQ0tfU1RBVEUJKDFVTCA8PCBQVFJBQ0VfQ0ZJ
X0xQX0xPQ0tfQklUKQorI2RlZmluZSBQVFJBQ0VfQ0ZJX0VMUF9TVEFURQkJKDFVTCA8PCBQVFJB
Q0VfQ0ZJX0VMUF9CSVQpCisjZGVmaW5lIFBUUkFDRV9DRklfU1NfRU5fU1RBVEUJCSgxVUwgPDwg
UFRSQUNFX0NGSV9TU19FTl9CSVQpCisjZGVmaW5lIFBUUkFDRV9DRklfU1NfTE9DS19TVEFURQko
MVVMIDw8IFBUUkFDRV9DRklfU1NfTE9DS19CSVQpCisjZGVmaW5lIFBUUkFDRV9DRklfU1NfUFRS
X1NUQVRFCQkoMVVMIDw8IFBUUkFDRV9DRklfU1NfUFRSX0JJVCkKIAogI2RlZmluZSBQUkFDRV9D
RklfU1RBVEVfSU5WQUxJRF9NQVNLCX4oUFRSQUNFX0NGSV9MUF9FTl9TVEFURSB8IFwKIAkJCQkJ
ICBQVFJBQ0VfQ0ZJX0xQX0xPQ0tfU1RBVEUgfCBcCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
