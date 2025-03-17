Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE45EC35FF8
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 17:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0YdBAikJlLuNjOBJCs64LTAnlBok1FysDkGs/r+HW8=; b=jtcnrKQVHbIOA9
	JuYkS1seVkrhQASrsT7B2daMKLGtnm3BL5o63EgIZIxhViqW0e1yADURuB2jz7rm/wb8EFjCDSho1
	jodZyOYuFhXXP437/CGLUNxRr9uwRmsFxaYoAgOD50QSUOQeiHDoPyxIS74iqn+5IO72uYWXLpdsy
	vEnk8I/jmpFhBNnAf7azB+ZwjvUhyqh6B882FnkiWLO2Ii/PvVJ4/ZFv32ZPT7r0fmpApREH2K+L0
	oDsgOHjiqitSS1JDYC9qYABx9hFnAgKHsKiThRpgjLSGzrIic3yrzAdaAdRUT6RAEo+XhmDKwR1Ey
	dsuL4wBFAJs6lyYdGzAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuE1k-00000003VWA-1w8O;
	Mon, 17 Mar 2025 17:13:24 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDwx-00000003TbB-0nmZ
	for linux-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 17:08:28 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so16001345e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742231305; x=1742836105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBnjzkDoAHCYES1tTH1RlHgMSmamC+5QlhVYnXgdQEI=;
        b=BDycjAvIJEsPdkZ5pQmwEsGzZ+j10sFKTsl3+AHdR3LCuRvHAueWss9YMqRH4LEgGp
         cmtL0EcxwGSvr7gV+5AJdC8uSrvQz9yMGE3LehYRmWknAwKeytZR/gMjAx/ZG84+5zrF
         C240q0su9ykygnMjopwX9dt0IML3/99N0zqxpkcvVBrxRCKZaea7102aUV7KvrcdQMWc
         TDPbnUjxSQXj92ptNUcnzG5oMYIIeP0qQzbO0kf1WizHmP0xACWRZRgaz/HK5rWIe26p
         EqyA8knXXA4wg+NAmyV4ssOAsRoB/xPad6jM2T9o/7VISqMN7+v0TZslobYjKddgTCuB
         tqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742231305; x=1742836105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBnjzkDoAHCYES1tTH1RlHgMSmamC+5QlhVYnXgdQEI=;
        b=f65S97ZmRXgVI1riD+KYcnW9r9XVQwdxZ4YIhifZOdPsBejiek5EzOHaBIzaD6kmmR
         cKk6yPBIlrQ2cZ1WbgHDVMmKDY/cF4kY4VJqpHm/mz259TKKgR/objtVjiv3EW3TnclT
         H2mhLr/0bzUvX4xqTV6qpDEfY2x3cp2JSSwtTXyM6Tp8y2k/ZoCEU6tfNXPxu26fwng/
         iXV3aIbX2TSbFjHH7Iihoj5JCEIoMsu/1ZTWuBwiIRS3upUESyb0saiMLS/pkdKj2SMO
         RPlWE42Mzefzge47o2Nr0rmA8BkykkyJdoiugBXZFjYREkGvSPyv36xic/pCanWwG56Y
         GR2g==
X-Forwarded-Encrypted: i=1; AJvYcCUXT13PFBAxJDK5Gyh/xHur+zynuinDEGjzh6Pqo+00m6bgaX0F6YDLAMQiQ54RTCKEMbtTslXNosWrzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys+Chi/QzUNJ0ZeGEEX2OsR3/qrM614wyBU5rtNEyaVjGHpr0K
	pYoeR1PmmharyOjtcdVvW0j8hHOoY3x1KHMLrVAwVLwT/614rMpiIanSNdUyaN0=
X-Gm-Gg: ASbGncu9ThJaHMJC0Z4bYH7p9HkE5Nna60F00BA6iY/KlbNkoiaWZRslRPDygRPuVrP
	z6idzkvelkgOz/Hu52SZYMi2JeOIl3Xl0Zbi7h6GxS3Z+IoJrJFm54oJ+wn6TRnKMX+5mGd3BuT
	/RzVHiWTqk0bnrjF2ZJFTpQVAdaVwyrTXV2AGx4Pmkzh7joxYOVNoG/zfiXX2Psoide3VpDTquW
	RlxPFZ8YRI1jBF9vP+vtNFXJZ4ILpwgI5uTKWk4K845QZLoKZipvJvXTCSVakvcxDwtk9ox8tcH
	bXU6aCRDNjLJdMtU/8+y8APcTSA2ikHZQcz6tZlweCzqZnTJIXoCjpE2
X-Google-Smtp-Source: AGHT+IEqhdp5dcBzbvbBuH3dLSPFcvLdqKUwlLK3z0GBcZnv77CKTJXWVzz2XGRU3Xp4MOn6/tiCWA==
X-Received: by 2002:a05:600c:4ed0:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-43d2a2eca5bmr70294645e9.10.1742231305531;
        Mon, 17 Mar 2025 10:08:25 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d23cddb2asm96014505e9.39.2025.03.17.10.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:08:24 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v4 16/18] RISC-V: KVM: add SBI extension reset callback
Date: Mon, 17 Mar 2025 18:06:22 +0100
Message-ID: <20250317170625.1142870-17-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317170625.1142870-1-cleger@rivosinc.com>
References: <20250317170625.1142870-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_100827_230321_AEBC8BC7 
X-CRM114-Status: GOOD (  17.27  )
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

Q3VycmVudGx5LCBvbmx5IHRoZSBTVEEgZXh0ZW5zaW9uIG5lZWRlZCBhIHJlc2V0IGZ1bmN0aW9u
IGJ1dCB0aGF0J3MKZ29pbmcgdG8gYmUgdGhlIGNhc2UgZm9yIEZXRlQgYXMgd2VsbC4gQWRkIGEg
cmVzZXQgY2FsbGJhY2sgdGhhdCBjYW4gYmUKaW1wbGVtZW50ZWQgYnkgU0JJIGV4dGVuc2lvbnMu
CgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+ClJl
dmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgotLS0KIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgfCAgMSAtCiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgIDIgKysKIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAg
ICAgICAgICAgICAgICAgfCAgMiArLQogYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAg
ICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogYXJjaC9yaXNjdi9rdm0vdmNwdV9z
Ymlfc3RhLmMgICAgICAgICB8ICAzICsrLQogNSBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCBjYzMz
ZTM1Y2Q2MjguLmJiOTNkMjk5NWVhMiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAt
NDA5LDcgKzQwOSw2IEBAIHZvaWQgX19rdm1fcmlzY3ZfdmNwdV9wb3dlcl9vbihzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fcmlzY3ZfdmNwdV9wb3dlcl9vbihzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpOwogYm9vbCBrdm1fcmlzY3ZfdmNwdV9zdG9wcGVkKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSk7CiAKLXZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N0YV9yZXNldChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpOwogdm9pZCBrdm1fcmlzY3ZfdmNwdV9yZWNvcmRfc3RlYWxfdGltZShzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwogCiAjZW5kaWYgLyogX19SSVNDVl9LVk1fSE9TVF9IX18gKi8KZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCmluZGV4IGJjYjkwNzU3YjE0OS4uY2I2OGIz
YTU3YzhmIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5o
CisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKQEAgLTU3LDYgKzU3
LDcgQEAgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gewogCSAqLwogCWludCAoKmluaXQp
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiAJdm9pZCAoKmRlaW5pdCkoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsKKwl2b2lkICgqcmVzZXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiB9OwogCiB2
b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9mb3J3YXJkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3Ry
dWN0IGt2bV9ydW4gKnJ1bik7CkBAIC03OCw2ICs3OSw3IEBAIGJvb2wgcmlzY3ZfdmNwdV9zdXBw
b3J0c19zYmlfZXh0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGlkeCk7CiBpbnQga3ZtX3Jp
c2N2X3ZjcHVfc2JpX2VjYWxsKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4g
KnJ1bik7CiB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7CiB2b2lkIGt2bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KTsKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
CiAKIGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX3NiaV9zdGEoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCB1bnNpZ25lZCBsb25nIHJlZ19udW0sCiAJCQkJICAgdW5zaWduZWQgbG9uZyAqcmVnX3Zh
bCk7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMgYi9hcmNoL3Jpc2N2L2t2bS92
Y3B1LmMKaW5kZXggODc3YmNjODVjMDY3Li41NDI3NDdlMmM3ZjUgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHUuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1LmMKQEAgLTk0LDcgKzk0
LDcgQEAgc3RhdGljIHZvaWQga3ZtX3Jpc2N2X3Jlc2V0X3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQogCXZjcHUtPmFyY2guaGZlbmNlX3RhaWwgPSAwOwogCW1lbXNldCh2Y3B1LT5hcmNoLmhm
ZW5jZV9xdWV1ZSwgMCwgc2l6ZW9mKHZjcHUtPmFyY2guaGZlbmNlX3F1ZXVlKSk7CiAKLQlrdm1f
cmlzY3ZfdmNwdV9zYmlfc3RhX3Jlc2V0KHZjcHUpOworCWt2bV9yaXNjdl92Y3B1X3NiaV9yZXNl
dCh2Y3B1KTsKIAogCS8qIFJlc2V0IHRoZSBndWVzdCBDU1JzIGZvciBob3RwbHVnIHVzZWNhc2Ug
Ki8KIAlpZiAobG9hZGVkKQpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKaW5kZXggMzEzOWYxNzFjMjBmLi41MGJlMDc5YjU1
MjggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKKysrIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmkuYwpAQCAtNTM2LDMgKzUzNiwyNyBAQCB2b2lkIGt2bV9yaXNjdl92Y3B1
X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQlleHQtPmRlaW5pdCh2Y3B1KTsK
IAl9CiB9CisKK3ZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2NvbnRleHQgKnNjb250ZXh0ID0gJnZjcHUt
PmFyY2guc2JpX2NvbnRleHQ7CisJY29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9u
X2VudHJ5ICplbnRyeTsKKwljb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiAqZXh0
OworCWludCBpZHgsIGk7CisKKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShzYmlfZXh0KTsg
aSsrKSB7CisJCWVudHJ5ID0gJnNiaV9leHRbaV07CisJCWV4dCA9IGVudHJ5LT5leHRfcHRyOwor
CQlpZHggPSBlbnRyeS0+ZXh0X2lkeDsKKworCQlpZiAoaWR4IDwgMCB8fCBpZHggPj0gQVJSQVlf
U0laRShzY29udGV4dC0+ZXh0X3N0YXR1cykpCisJCQljb250aW51ZTsKKworCQlpZiAoc2NvbnRl
eHQtPmV4dF9zdGF0dXNbaWR4XSAhPSBLVk1fUklTQ1ZfU0JJX0VYVF9TVEFUVVNfRU5BQkxFRCB8
fAorCQkgICAgIWV4dC0+cmVzZXQpCisJCQljb250aW51ZTsKKworCQlleHQtPnJlc2V0KHZjcHUp
OworCX0KK30KKwpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMgYi9h
cmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYwppbmRleCA1ZjM1NDI3MTE0YzEuLmNjNmNiN2M4
ZjBlNCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKKysrIGIvYXJj
aC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKQEAgLTE2LDcgKzE2LDcgQEAKICNpbmNsdWRlIDxh
c20vc2JpLmg+CiAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KIAotdm9pZCBrdm1fcmlzY3ZfdmNw
dV9zYmlfc3RhX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3N0YXRpYyB2b2lkIGt2bV9y
aXNjdl92Y3B1X3NiaV9zdGFfcmVzZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogewogCXZjcHUt
PmFyY2guc3RhLnNobWVtID0gSU5WQUxJRF9HUEE7CiAJdmNwdS0+YXJjaC5zdGEubGFzdF9zdGVh
bCA9IDA7CkBAIC0xNTYsNiArMTU2LDcgQEAgY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRl
bnNpb24gdmNwdV9zYmlfZXh0X3N0YSA9IHsKIAkuZXh0aWRfZW5kID0gU0JJX0VYVF9TVEEsCiAJ
LmhhbmRsZXIgPSBrdm1fc2JpX2V4dF9zdGFfaGFuZGxlciwKIAkucHJvYmUgPSBrdm1fc2JpX2V4
dF9zdGFfcHJvYmUsCisJLnJlc2V0ID0ga3ZtX3Jpc2N2X3ZjcHVfc2JpX3N0YV9yZXNldCwKIH07
CiAKIGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX3NiaV9zdGEoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LAotLSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
