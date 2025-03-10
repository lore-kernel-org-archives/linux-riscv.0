Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C511C282EC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvHI0Xsq8V4lH0iYdntivJhibhPUogzsdbm0bI8CDoE=; b=4MEhrY144rtPZG
	/nutETQ4xdyPNdMMeCv7iGdFd7izyjJLA+0rqmwbTmeTHryFh5uqo/y2BRWxZgxOt4/BmJwwdmLxr
	wU1MgAgWU3DOw00EB8TpwTY3djX/EQ/wCUrG4Y/S+GQB6KQLLGAW0KKNANdJ2evZ5gGNBPDqcKEQc
	apYe16/oWC07hpPdTQAg4UZrLuVVrXBZftAN4eM/OfmYsE+AYdh0Ah4MWJ+PhYptoY29ToVqk3WA1
	gnNrA3ZJE1PuY+VK5UlR11M2h/UsamzB+NdE59JPwk33dn49yXIydN+UK77PCTkBIK4HpGxoDIIYw
	6ETQEDbpJZKxsCppH/lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfM8-00000003GIo-04DT;
	Mon, 10 Mar 2025 15:47:52 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treq5-0000000386h-2nFt
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:14:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22580c9ee0aso13297765ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619685; x=1742224485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO198dOv/JV7u6RiN4qQUqM3nesMDxD5mvDVMd+k3NU=;
        b=oW3wvlfTa18cAbhHPv3vFnuw6Own1lv1iwH8S9iIe+1f52e161sGYXV+AoAlF6fC0b
         6TiKVDt2MX/+K+2ZqzWfGVOSMOFvlcHgY5H/RarH5TLEj0j2b6eG37rLYaaCsCtnodDV
         zus9WGCUqpZWmtrojFNtRDA+P7MFyc0CAok0ySye3eAEIPMSs2T6XsZe4IDe8e5EBUm/
         weemXkOgdjD+B1NiyFzyefreTFoghFTEp3BMxqLnTBcdqQRaLGQinzmUYnyYeVlekZMa
         MB3Aq4kduCPxbuk6nQOgJAk6mXJZ1bO2nBnZyp33b+DlS1bszMfwJc1yly7IXcNzbARt
         fNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619685; x=1742224485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO198dOv/JV7u6RiN4qQUqM3nesMDxD5mvDVMd+k3NU=;
        b=w34LgHgBFUFN4OG4AaB7meviAHv4do8Vi9f88r/WBydTLmlNSiuiMxj/9FwmP61BaD
         Rg6nvTwkumO/t5/oQJP5sCYoEJml7b41N3vIR/885I0X3luqu058n2854n7ccLkA2z8B
         ILdaKlqYyJV9a41pnHkBwUVPi9a1rVBHMG6bn3+3FtyDG8beXd6Z4kagrOBXlhFSF4Y1
         hunetxFU2zrcN5l1E0KFVdKeIcAddbgZHgxs0Kgh+Nkcs+EkghumYh9+us5UWW8ECROf
         EgUcaMcs26qNesI53KJyY5Kh8Zof/Lx3ddrZ8jyIsbP8OMBApqmrhyTukAfnQTdnXmzq
         G0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCW01qZWgh4XxCGIUlNthlEWOljA6oMNUsZxeMY/snF6WXJb1evu1td3Sr3A3E7FZ++oNvZrsv7KSvhjkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YworANcWT0pyJbKVDYCPXhUTk1eaKAmqNuiqjMWT/CErN86oeSS
	syxFSXlaJn8+ckY8m+ubXc/DCUd7jFtkUF3g7lXtHJeWc4ndGBSG6G+XVdNo8VQ=
X-Gm-Gg: ASbGnctrU+0bP+9TbMsNzxWRlCl2j1C2EAu83AavjOGgw//QgDKdBaQdpNXvI4Xw49s
	Iz6u3YjIfElBjLSrBTG181L0cTXlzbGpXZIgm8aF+MV+h5ncuaRCb7kjZQyxNGqwAecF7Wywv48
	cAaHB5FpVy2cnxWeqCnrvjhPhA3GSbhYd/XfBmO8Pm6NsACiVCFvY6lGbEsswXxnwGsgpKQRy1b
	6QRUWEqQbyxJMI7VRpFesa9MoG9y60WZqdkJnSoSzZZHQkshZlDi+VozTNt5Tc29AaXzBdi7RL3
	Y2FUrENfzxrBSY7lU5bnHT0hMOr1er7krZjNVCIPktg+cg==
X-Google-Smtp-Source: AGHT+IGIS2XxIf4TQa/glKSShb2DPMKV2nM+32P/jFh4qY9T5snUhs8ena+pzkKO/eEMPCMRH58+YA==
X-Received: by 2002:a17:902:eb81:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-22428bd592amr282084395ad.40.1741619685003;
        Mon, 10 Mar 2025 08:14:45 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:14:44 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 14/17] RISC-V: KVM: add SBI extension init()/deinit() functions
Date: Mon, 10 Mar 2025 16:12:21 +0100
Message-ID: <20250310151229.2365992-15-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081445_738902_AB25309E 
X-CRM114-Status: GOOD (  14.60  )
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

VGhlIEZXRlQgU0JJIGV4dGVuc2lvbiB3aWxsIG5lZWQgdG8gZHluYW1pY2FsbHkgYWxsb2NhdGUg
bWVtb3J5IGFuZCBkbwppbml0IHRpbWUgc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24uIEFkZCBhbiBp
bml0L2RlaW5pdCBjYWxsYmFja3MgdGhhdAphbGxvd3MgdG8gZG8gc28uCgpTaWduZWQtb2ZmLWJ5
OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Ci0tLQogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCB8ICA5ICsrKysrKysrKwogYXJjaC9yaXNjdi9rdm0v
dmNwdS5jICAgICAgICAgICAgICAgICB8ICAyICsrCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5j
ICAgICAgICAgICAgIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAzIGZpbGVzIGNo
YW5nZWQsIDQwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2t2bV92Y3B1X3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmku
aAppbmRleCA0ZWQ2MjAzY2RkMzAuLmJjYjkwNzU3YjE0OSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV92Y3B1X3NiaS5oCkBAIC00OSw2ICs0OSwxNCBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4
dGVuc2lvbiB7CiAKIAkvKiBFeHRlbnNpb24gc3BlY2lmaWMgcHJvYmUgZnVuY3Rpb24gKi8KIAl1
bnNpZ25lZCBsb25nICgqcHJvYmUpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CisKKwkvKgorCSAq
IEluaXQvZGVpbml0IGZ1bmN0aW9uIGNhbGxlZCBvbmNlIGR1cmluZyBWQ1BVIGluaXQvZGVzdHJv
eS4gVGhlc2UKKwkgKiBtaWdodCBiZSB1c2UgaWYgdGhlIFNCSSBleHRlbnNpb25zIG5lZWQgdG8g
YWxsb2NhdGUgb3IgZG8gc3BlY2lmaWMKKwkgKiBpbml0IHRpbWUgb25seSBjb25maWd1cmF0aW9u
LgorCSAqLworCWludCAoKmluaXQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CisJdm9pZCAoKmRl
aW5pdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIH07CiAKIHZvaWQga3ZtX3Jpc2N2X3ZjcHVf
c2JpX2ZvcndhcmQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKTsK
QEAgLTY5LDYgKzc3LDcgQEAgY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gKmt2
bV92Y3B1X3NiaV9maW5kX2V4dCgKIGJvb2wgcmlzY3ZfdmNwdV9zdXBwb3J0c19zYmlfZXh0KHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IGlkeCk7CiBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2Vj
YWxsKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1bik7CiB2b2lkIGt2
bV9yaXNjdl92Y3B1X3NiaV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cit2b2lkIGt2bV9y
aXNjdl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAogaW50IGt2bV9y
aXNjdl92Y3B1X2dldF9yZWdfc2JpX3N0YShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVk
IGxvbmcgcmVnX251bSwKIAkJCQkgICB1bnNpZ25lZCBsb25nICpyZWdfdmFsKTsKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwppbmRleCA2
MGQ2ODRjNzZjNTguLjg3N2JjYzg1YzA2NyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dS5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwpAQCAtMTg1LDYgKzE4NSw4IEBAIHZvaWQg
a3ZtX2FyY2hfdmNwdV9wb3N0Y3JlYXRlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAogdm9pZCBr
dm1fYXJjaF92Y3B1X2Rlc3Ryb3koc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogeworCWt2bV9yaXNj
dl92Y3B1X3NiaV9kZWluaXQodmNwdSk7CisKIAkvKiBDbGVhbnVwIFZDUFUgQUlBIGNvbnRleHQg
Ki8KIAlrdm1fcmlzY3ZfdmNwdV9haWFfZGVpbml0KHZjcHUpOwogCmRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwppbmRleCBk
MWM4M2E3NzczNWUuLjg1OGRkZWZkN2U3ZiAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNw
dV9zYmkuYworKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCkBAIC01MDUsOCArNTA1LDM3
IEBAIHZvaWQga3ZtX3Jpc2N2X3ZjcHVfc2JpX2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQog
CQkJY29udGludWU7CiAJCX0KIAorCQlpZiAoIWV4dC0+ZGVmYXVsdF9kaXNhYmxlZCAmJiBleHQt
PmluaXQgJiYKKwkJICAgIGV4dC0+aW5pdCh2Y3B1KSAhPSAwKSB7CisJCQlzY29udGV4dC0+ZXh0
X3N0YXR1c1tpZHhdID0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX1VOQVZBSUxBQkxFOworCQkJ
Y29udGludWU7CisJCX0KKwogCQlzY29udGV4dC0+ZXh0X3N0YXR1c1tpZHhdID0gZXh0LT5kZWZh
dWx0X2Rpc2FibGVkID8KIAkJCQkJS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0RJU0FCTEVEIDoK
IAkJCQkJS1ZNX1JJU0NWX1NCSV9FWFRfU1RBVFVTX0VOQUJMRUQ7CiAJfQogfQorCit2b2lkIGt2
bV9yaXNjdl92Y3B1X3NiaV9kZWluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVj
dCBrdm1fdmNwdV9zYmlfY29udGV4dCAqc2NvbnRleHQgPSAmdmNwdS0+YXJjaC5zYmlfY29udGV4
dDsKKwljb25zdCBzdHJ1Y3Qga3ZtX3Jpc2N2X3NiaV9leHRlbnNpb25fZW50cnkgKmVudHJ5Owor
CWNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uICpleHQ7CisJaW50IGlkeCwgaTsK
KworCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHNiaV9leHQpOyBpKyspIHsKKwkJZW50cnkg
PSAmc2JpX2V4dFtpXTsKKwkJZXh0ID0gZW50cnktPmV4dF9wdHI7CisJCWlkeCA9IGVudHJ5LT5l
eHRfaWR4OworCisJCWlmIChpZHggPCAwIHx8IGlkeCA+PSBBUlJBWV9TSVpFKHNjb250ZXh0LT5l
eHRfc3RhdHVzKSkKKwkJCWNvbnRpbnVlOworCisJCWlmIChzY29udGV4dC0+ZXh0X3N0YXR1c1tp
ZHhdID09IEtWTV9SSVNDVl9TQklfRVhUX1NUQVRVU19VTkFWQUlMQUJMRSB8fAorCQkgICAgIWV4
dC0+ZGVpbml0KQorCQkJY29udGludWU7CisKKwkJZXh0LT5kZWluaXQodmNwdSk7CisJfQorfQot
LSAKMi40Ny4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
