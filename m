Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD8C35FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdPCn5BGJeXwtmam3+NjzFRwB1Jz/e3h3SN+O8a/x+E=; b=qtZJbO+m2yo9p/
	htJDmyYzf0zVGxnhG4OoX2DQ+B2S54iiZXUKwqBg+lmyntCNIaE0XUnnUZuEEb0SYkvk/bq6hudz4
	rNPMktbCdPuyU/PvgnEZ5LR58GIN6p9xW/WNqAUihdOz2w+H0sJx9hwZYMyDF8JBodd1Had0B5oEA
	KqLIwBs1W1EFjaFNIouc8v27MlJXEQG+M7l3/8UCaVy0iB06nvziGtWpOxBlOtcfXm7LbR+7G8Knl
	3VJIS9+ACzVZOYcAJQhn55Vb9IN6y3nK4T1vqY5hiuGu/0hNhTSspDz/gWi9baQ+W8W9wUtw5tyg5
	Tw/RVTWZMo26l/5jVgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLq-00000003Ft5-2dIh;
	Mon, 10 Mar 2025 15:47:34 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treoS-000000037RX-1nJc
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:05 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso7661267a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619583; x=1742224383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL3KrdqQvlwv1xQYem17t7QUv6GmMan/yx9/ashDvsw=;
        b=UteZiBC0+idb3DP8Mg/PQVTFFHKHuoxWHTPMJgRlbzdpFJ8EaUebbl+mXoiaLk1564
         Hv0pin9Jz5ghPvn5JYiqY9kBKBDoDfXPa58CM0/57FRvN4BlSNOMOlZ2MlqB6S9U3Oqh
         EReJCDQK6x/NMEimiTdV+gUVDkoICG1Oy9ymvFdtxMjuz/gHdjiWtBbxknMzFCq0/Elz
         J5U2XiGQeRROf4MGR6wwwpSnEnnuiLR8Us8i2QM+WTgb+wUIwVi6TyA88IkSQw8H2t8G
         CdMKpAaxBg5865xDFdHWunLyU+jTQ6N9fmBgqCGDFH7E6C+unrn2/tXiMW0lnCeD1X+O
         3JuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619583; x=1742224383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AL3KrdqQvlwv1xQYem17t7QUv6GmMan/yx9/ashDvsw=;
        b=eEQHWXTwsoHKFFVsEa1VnjAOVwhPW1NguoKekGAKZxVPW9/Fxzm97LO7DmGX1E205P
         1Zz/4kfn8OpTnldWpzhB5XWkxAZmeVcZwK7xl0Li+26YyZ72lLdd9GZLNm2JxgXh5j6b
         azORwHuKp+4mr/VKiwVCJC2Pp4Ntz8w9DhKtIAPhmz7XCNLNlsupdRgsG00rlZUXwzn0
         J9mA2JNTWbvTBtjg6c5puaFYqdwUWGbogzLiUh7Nto3Z7+m4ovU1kAF0y+4yAZeMzKF6
         9xCsVwMwAZhTyn2DCgc8jGe4H0NbzsTB/ui1LLaiuo2CGFGHxhi3WjS+0Dbz6/N1ZObA
         L/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv+OffwjuslI4az/T9IsUGwuIAbNfYRGV6i6N9Ko53cM5Oncg4V2ZsRXvhXwrIQCJHXNAWw888VIbpGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk31gjahDpi4UZUPCKDwqj5NDyAUr680FsHCJ9djhd4HglVmEI
	3Q6xENeEsn93LrGscKy8gfkTeBgF8o7GPOGKwrqouQuy5DbmNWQ9fjOxcjjPMgo=
X-Gm-Gg: ASbGnctGBNR5ZScJ5DtbfzlLp6XBa3HXJk+onKEuILCPFs1EO2L7Spgd9hzkge7P1YO
	bFNeyQiFwETtQf1JeiEeRBaLZRATPr2OlSMuacPPdA1n3Ie218iV7IYg9mHgdK5XuGR28ga5qR2
	ypngLEut88sQr8g3AcoCngcCc2jYev/OiTqxBqv2WhBdxH2TX9Hu3WEyTcIkRnv5QQzifFDxtio
	UqtnszaztEH7zmnmKap+wIgMwA0a7oqfJw+jsngVXC+49UnSsWdAG5dJeAEgzh40pz7puNCMAHW
	XKT05UKsn+fuBCMcVrU9HBP7J1+0hnofSGlyycV0V4FthOtgLRcIlCr+
X-Google-Smtp-Source: AGHT+IFqOyaVREaO+MohFgN6MHhlVeTDEW+52HPkp4Dqon7PwKBjXGmUdU6fJQIinAVq3owNZZQiOQ==
X-Received: by 2002:a17:90b:3810:b0:2fa:3b6b:3370 with SMTP id 98e67ed59e1d1-2ffbc1f57cemr15412229a91.16.1741619583563;
        Mon, 10 Mar 2025 08:13:03 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:03 -0700 (PDT)
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
Subject: [PATCH v3 02/17] riscv: sbi: add FWFT extension interface
Date: Mon, 10 Mar 2025 16:12:09 +0100
Message-ID: <20250310151229.2365992-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081304_473337_E6338926 
X-CRM114-Status: GOOD (  15.46  )
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

VGhpcyBTQkkgZXh0ZW5zaW9ucyBlbmFibGVzIHN1cGVydmlzb3IgbW9kZSB0byBjb250cm9sIGZl
YXR1cmUgdGhhdCBhcmUKdW5kZXIgTS1tb2RlIGNvbnRyb2wgKEZvciBpbnN0YW5jZSwgU3ZhZHUg
bWVudmNmZyBBRFVFIGJpdCwgU3NkYmx0cnAKRFRFLCBldGMpLgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmggfCAgNSArKwogYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgICAgICB8IDk3ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMDIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCmluZGV4IGJiMDc3ZDBjOTEyZi4uZmM4N2M2
MDljMTFhIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCisrKyBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKQEAgLTUwMyw2ICs1MDMsMTEgQEAgaW50IHNiaV9y
ZW1vdGVfaGZlbmNlX3Z2bWFfYXNpZChjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCiAJ
CQkJdW5zaWduZWQgbG9uZyBhc2lkKTsKIGxvbmcgc2JpX3Byb2JlX2V4dGVuc2lvbihpbnQgZXh0
KTsKIAoraW50IHNiaV9md2Z0X2FsbF9jcHVzX3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9u
ZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBmbGFncywKKwkJCSAgYm9vbCByZXZlcnRfb25fZmFpbHVy
ZSk7CitpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSk7
CitpbnQgc2JpX2Z3ZnRfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNp
Z25lZCBsb25nIGZsYWdzKTsKKwogLyogQ2hlY2sgaWYgY3VycmVudCBTQkkgc3BlY2lmaWNhdGlv
biB2ZXJzaW9uIGlzIDAuMSBvciBub3QgKi8KIHN0YXRpYyBpbmxpbmUgaW50IHNiaV9zcGVjX2lz
XzBfMSh2b2lkKQogewpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9zYmkuYwppbmRleCAxOTg5YjhjYWRlMWIuLjI1NjkxMGRiMTMwNyAxMDA2
NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
c2JpLmMKQEAgLTI5OSw2ICsyOTksMTAzIEBAIHN0YXRpYyBpbnQgX19zYmlfcmZlbmNlX3YwMihp
bnQgZmlkLCBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X21hc2ssCiAJcmV0dXJuIDA7CiB9CiAK
K2ludCBzYmlfZndmdF9nZXQodTMyIGZlYXR1cmUsIHVuc2lnbmVkIGxvbmcgKnZhbHVlKQorewor
CXJldHVybiAtRU9QTk9UU1VQUDsKK30KKworLyoqCisgKiBzYmlfZndmdF9zZXQoKSAtIFNldCBh
IGZlYXR1cmUgb24gYWxsIG9ubGluZSBjcHVzCisgKiBAZmVhdHVyZTogVGhlIGZlYXR1cmUgdG8g
YmUgc2V0CisgKiBAdmFsdWU6IFRoZSBmZWF0dXJlIHZhbHVlIHRvIGJlIHNldAorICogQGZsYWdz
OiBGV0ZUIGZlYXR1cmUgc2V0IGZsYWdzCisgKgorICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFw
cHJvcHJpYXRlIGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgorICovCitpbnQgc2JpX2Z3ZnRf
c2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdz
KQoreworCXJldHVybiAtRU9QTk9UU1VQUDsKK30KKworc3RydWN0IGZ3ZnRfc2V0X3JlcSB7CisJ
dTMyIGZlYXR1cmU7CisJdW5zaWduZWQgbG9uZyB2YWx1ZTsKKwl1bnNpZ25lZCBsb25nIGZsYWdz
OworCWNwdW1hc2tfdCBtYXNrOworfTsKKworc3RhdGljIHZvaWQgY3B1X3NiaV9md2Z0X3NldCh2
b2lkICphcmcpCit7CisJc3RydWN0IGZ3ZnRfc2V0X3JlcSAqcmVxID0gYXJnOworCisJaWYgKHNi
aV9md2Z0X3NldChyZXEtPmZlYXR1cmUsIHJlcS0+dmFsdWUsIHJlcS0+ZmxhZ3MpKQorCQljcHVt
YXNrX2NsZWFyX2NwdShzbXBfcHJvY2Vzc29yX2lkKCksICZyZXEtPm1hc2spOworfQorCitzdGF0
aWMgaW50IHNiaV9md2Z0X2ZlYXR1cmVfbG9jYWxfc2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBs
b25nIHZhbHVlLAorCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsCisJCQkJICAgICAgYm9v
bCByZXZlcnRfb25fZmFpbCkKK3sKKwlpbnQgcmV0OworCXVuc2lnbmVkIGxvbmcgcHJldl92YWx1
ZTsKKwljcHVtYXNrX3QgdG1wOworCXN0cnVjdCBmd2Z0X3NldF9yZXEgcmVxID0geworCQkuZmVh
dHVyZSA9IGZlYXR1cmUsCisJCS52YWx1ZSA9IHZhbHVlLAorCQkuZmxhZ3MgPSBmbGFncywKKwl9
OworCisJY3B1bWFza19jb3B5KCZyZXEubWFzaywgY3B1X29ubGluZV9tYXNrKTsKKworCS8qIFdl
IGNhbiBub3QgcmV2ZXJ0IGlmIGZlYXR1cmVzIGFyZSBsb2NrZWQgKi8KKwlpZiAocmV2ZXJ0X29u
X2ZhaWwgJiYgZmxhZ3MgJiBTQklfRldGVF9TRVRfRkxBR19MT0NLKQorCQlyZXR1cm4gLUVJTlZB
TDsKKworCS8qIFJlc2V0IHZhbHVlIGlzIHRoZSBzYW1lIGZvciBhbGwgY3B1cywgcmVhZCBpdCBv
bmNlLiAqLworCXJldCA9IHNiaV9md2Z0X2dldChmZWF0dXJlLCAmcHJldl92YWx1ZSk7CisJaWYg
KHJldCkKKwkJcmV0dXJuIHJldDsKKworCS8qIEZlYXR1cmUgbWlnaHQgYWxyZWFkeSBiZSBzZXQg
dG8gdGhlIHZhbHVlIHdlIHdhbnQgKi8KKwlpZiAocHJldl92YWx1ZSA9PSB2YWx1ZSkKKwkJcmV0
dXJuIDA7CisKKwlvbl9lYWNoX2NwdV9tYXNrKCZyZXEubWFzaywgY3B1X3NiaV9md2Z0X3NldCwg
JnJlcSwgMSk7CisJaWYgKGNwdW1hc2tfZXF1YWwoJnJlcS5tYXNrLCBjcHVfb25saW5lX21hc2sp
KQorCQlyZXR1cm4gMDsKKworCXByX2VycigiRmFpbGVkIHRvIHNldCBmZWF0dXJlICV4IGZvciBh
bGwgb25saW5lIGNwdXMsIHJldmVydGluZ1xuIiwKKwkgICAgICAgZmVhdHVyZSk7CisKKwlyZXEu
dmFsdWUgPSBwcmV2X3ZhbHVlOworCWNwdW1hc2tfY29weSgmdG1wLCAmcmVxLm1hc2spOworCW9u
X2VhY2hfY3B1X21hc2soJnJlcS5tYXNrLCBjcHVfc2JpX2Z3ZnRfc2V0LCAmcmVxLCAxKTsKKwlp
ZiAoY3B1bWFza19lcXVhbCgmcmVxLm1hc2ssICZ0bXApKQorCQlyZXR1cm4gMDsKKworCXJldHVy
biAtRUlOVkFMOworfQorCisvKioKKyAqIHNiaV9md2Z0X2FsbF9jcHVzX3NldCgpIC0gU2V0IGEg
ZmVhdHVyZSBvbiBhbGwgb25saW5lIGNwdXMKKyAqIEBmZWF0dXJlOiBUaGUgZmVhdHVyZSB0byBi
ZSBzZXQKKyAqIEB2YWx1ZTogVGhlIGZlYXR1cmUgdmFsdWUgdG8gYmUgc2V0CisgKiBAZmxhZ3M6
IEZXRlQgZmVhdHVyZSBzZXQgZmxhZ3MKKyAqIEByZXZlcnRfb25fZmFpbDogdHJ1ZSBpZiBmZWF0
dXJlIHZhbHVlIHNob3VsZCBiZSByZXN0b3JlZCB0byBpdCdzIG9yaWduYWwKKyAqIAkJICAgIHZh
bHVlIG9uIGZhaWx1cmUuCisgKgorICogUmV0dXJuOiAwIG9uIHN1Y2Nlc3MsIGFwcHJvcHJpYXRl
IGxpbnV4IGVycm9yIGNvZGUgb3RoZXJ3aXNlLgorICovCitpbnQgc2JpX2Z3ZnRfYWxsX2NwdXNf
c2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLCB1bnNpZ25lZCBsb25nIGZsYWdz
LAorCQkJICBib29sIHJldmVydF9vbl9mYWlsKQoreworCWlmIChmZWF0dXJlICYgU0JJX0ZXRlRf
R0xPQkFMX0ZFQVRVUkVfQklUKQorCQlyZXR1cm4gc2JpX2Z3ZnRfc2V0KGZlYXR1cmUsIHZhbHVl
LCBmbGFncyk7CisKKwlyZXR1cm4gc2JpX2Z3ZnRfZmVhdHVyZV9sb2NhbF9zZXQoZmVhdHVyZSwg
dmFsdWUsIGZsYWdzLAorCQkJCQkgIHJldmVydF9vbl9mYWlsKTsKK30KKwogLyoqCiAgKiBzYmlf
c2V0X3RpbWVyKCkgLSBQcm9ncmFtIHRoZSB0aW1lciBmb3IgbmV4dCB0aW1lciBldmVudC4KICAq
IEBzdGltZV92YWx1ZTogVGhlIHZhbHVlIGFmdGVyIHdoaWNoIG5leHQgdGltZXIgZXZlbnQgc2hv
dWxkIGZpcmUuCi0tIAoyLjQ3LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
