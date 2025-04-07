Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9DBC36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 18:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Y517yalD9pQBGYuvKrJ3RIwAbaxrP7pmYi/3Q4XyNk=; b=UMHz0KicLsnGQ4
	hLVE5HY7rB93TtUW9RjxOAc4kHTCLXaFUecMFH09X/Fjs1hWucix8TEsnbUO5JRfggVv+Z0JNNXQq
	UJBoSjaciluEhHc0Terh6/2OSM1I4nIazmTdM8q2PK70D+ikHY8b4+n2Awzy2HMioTLh39RQYSFEo
	0i2uOaCTThuZF9xDuF0uVpeeST3SKLLc6n3Y2tOPqyBRCB5CpWEMKYiXE/HuUvwe1VCxqrzhjsQKy
	xTe3Uwc/9cm36ioT1sBbJP3KF5mzNm23XJhuVzyL38EsUSOJMI+RocmZLqxGuM5u9KgotN9joZsK9
	Glnsu9/cRItkPTb2Ek2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1ra6-00000001g6T-3ZoF;
	Mon, 07 Apr 2025 18:52:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1qtx-00000001TQL-3I2x
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:08:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22548a28d0cso64539845ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744049332; x=1744654132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OGgUcQY3LpMQzwnxjPDiN9+XewxjYA0t31wP+uhnCCY=;
        b=P9omRbyhXCGuwNL+LVQDZscn2y8iFQ4z+MHrERx/goIKU7U53xqO2/TjMd3vluvmv4
         H68H1ehwDGM/WPI2k+SQ5ryinypiHkHe8m+PONP95HFIBclODakpdftpKntOoRKTGMSf
         hwVdSaNfmGAzW0GQEDHEjdE3Ci7lbZZ27+NSh046msjg7E4dbLLcSi2uyzLjhdW6TrxS
         8qpganVBypkOUrxOz5HZuafwrwXn/IOLpC5/Okup70zE1IEcqnbZwSB1A04VS+wdK2oq
         /C8/UwBI6QZytakG0mDxBDb2ho3eMnOb794VZokyTtpQnRZZXCB/TQtlY+wCRwh0Zg0u
         3pIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744049332; x=1744654132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OGgUcQY3LpMQzwnxjPDiN9+XewxjYA0t31wP+uhnCCY=;
        b=WxdGe3yY2eEQaohYFqYhMPj74q+WHedFW7LBttMjIDszMhWFzq453d4X3641uk7lyC
         6hrwabqubPpGI9y0QNV/hIOAmSAcVqu0FDinKMASs831RJ0wce55vf7tIloPXbFSagzB
         iwlb6oM6Pn0tT+9e7a6EfScBqUd4VP3ZIY8eHlSrEv0IrQQ8gelTUR0TRFxU7OWwH7Io
         C4NFV4KX1lmu00Hzzoc5XwQUwhZeYHFRDoYxrWCqdGIQWWyk6W6/80bp40i0VQ6/ZMOD
         8AxuHXW/pYhSD9A0RuGPMQxtgIOd83ivGQA3wuq1gg7e7BB0PlkRVh0EK8pV/Yv3WV6y
         SL8g==
X-Gm-Message-State: AOJu0YwWOxRLGbzEMibQvoQrXvI8GIG4KsrpUOVC3Klp9S4imAIF6Iva
	SfvEnhOmIhBX5tSRspHBOKljqSSximEvZoqAjFN45N8o3wm7njfEIUBiVYzj
X-Gm-Gg: ASbGncuQcM8N15qFR/owppFzovdoQ1I2CJueKj/gR12DYhT6XmBR6U8UgV0pymlnK1V
	I/p22UIznwskarJTJs82XOdJKyw5POHwDuDPbE8H50cOwcfXWaGsaqNg8rkcMnLhkkfwhT6ERsa
	xGf4ojoX1SQgzZGnqmJeblZKgFvtpY9196iYOHeVPekU3a74n+RC9tdfJY1HJ0OjUVkfnzUrpJ+
	cZIZNmZTPifj4Lm1BbvlZCgoeDeqO6GYZP2EeB/o9vNjEB2/6FHXIsDo0xLpy72ioiOtVnHNnIX
	89P0OiKrpMk4pN7E+lG7pXhxQzPkD+BnVkVmuGzMD5tut03fc2EqYmv+MmRKEjG/J5/yvtCFYZ0
	ftZkauP7t2bYSU4ckXhWLrY7+BftlMrf3fg==
X-Google-Smtp-Source: AGHT+IF9o01fgdgPFq84Ese3rGK1eK3K1lWa1HP0jF4cDQEDcmyxsE30VYjB8V+k5xLVlJftQJwEiw==
X-Received: by 2002:a17:902:ecd2:b0:223:52fc:a15a with SMTP id d9443c01a7336-22a8a8b80f8mr161642065ad.33.1744049332400;
        Mon, 07 Apr 2025 11:08:52 -0700 (PDT)
Received: from localhost.localdomain (118-160-134-247.dynamic-ip.hinet.net. [118.160.134.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e03esm84282455ad.146.2025.04.07.11.08.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Apr 2025 11:08:51 -0700 (PDT)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	alexghiti@rivosinc.com,
	palmer@dabbelt.com
Cc: Andy Chiu <andy.chiu@sifive.com>,
	Evgenii Shatokhin <e.shatokhin@yadro.com>,
	Nathan Chancellor <nathan@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	puranjay12@gmail.com,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vicent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com,
	olivia.chu@sifive.com,
	c2232430@gmail.com
Subject: [PATCH v4 01/12] riscv: ftrace: support fastcc in Clang for WITH_ARGS
Date: Tue,  8 Apr 2025 02:08:25 +0800
Message-Id: <20250407180838.42877-1-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_110853_835042_10715371 
X-CRM114-Status: GOOD (  11.08  )
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

RnJvbTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4KClNvbWUgY2FsbGVyLXNhdmVk
IHJlZ2lzdGVycyB3aGljaCBhcmUgbm90IGRlZmluZWQgYXMgZnVuY3Rpb24gYXJndW1lbnRzCmlu
IHRoZSBBQkkgY2FuIHN0aWxsIGJlIHBhc3NlZCBhcyBhcmd1bWVudHMgd2hlbiB0aGUga2VybmVs
IGlzIGNvbXBpbGVkCndpdGggQ2xhbmcuIEFzIGEgcmVzdWx0LCB3ZSBtdXN0IHNhdmUgYW5kIHJl
c3RvcmUgdGhvc2UgcmVnaXN0ZXJzIHRvCnByZXZlbnQgZnRyYWNlIGZyb20gY2xvYmJlcmluZyB0
aGVtLgoKLSBbMV06IGh0dHBzOi8vcmV2aWV3cy5sbHZtLm9yZy9ENjg1NTkKClJlcG9ydGVkLWJ5
OiBFdmdlbmlpIFNoYXRva2hpbiA8ZS5zaGF0b2toaW5AeWFkcm8uY29tPgpDbG9zZXM6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzdlN2M3OTE0LTQ0NWQtNDI2ZC04OWEwLTU5
YTkxOTljNDViMUB5YWRyby5jb20vCkZpeGVzOiA3Y2FhOTc2NTQ2NWYgKCJmdHJhY2U6IHJpc2N2
OiBtb3ZlIGZyb20gUkVHUyB0byBBUkdTIikKQWNrZWQtYnk6IE5hdGhhbiBDaGFuY2VsbG9yIDxu
YXRoYW5Aa2VybmVsLm9yZz4KUmV2aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9z
aW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4K
Ci0tLQpDaGFuZ2Vsb2dzIHY0OgogLSBBZGQgYSBmaXggdGFnIChCasO2cm4sIEV2Z2VuaWkpCi0t
LQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9mdHJhY2UuaCB8ICA3ICsrKysrKysKIGFyY2gvcmlz
Y3Yva2VybmVsL2FzbS1vZmZzZXRzLmMgfCAgNyArKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9t
Y291bnQtZHluLlMgIHwgMTYgKysrKysrKysrKysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCAyOCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vZnRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCmluZGV4
IGQ2MjdmNjNlZTI4OS4uZDhiMjEzOGJkOWM2IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Z0cmFjZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKQEAg
LTE0Niw2ICsxNDYsMTMgQEAgc3RydWN0IF9fYXJjaF9mdHJhY2VfcmVncyB7CiAJCQl1bnNpZ25l
ZCBsb25nIGE1OwogCQkJdW5zaWduZWQgbG9uZyBhNjsKIAkJCXVuc2lnbmVkIGxvbmcgYTc7Cisj
aWZkZWYgQ09ORklHX0NDX0lTX0NMQU5HCisJCQl1bnNpZ25lZCBsb25nIHQyOworCQkJdW5zaWdu
ZWQgbG9uZyB0MzsKKwkJCXVuc2lnbmVkIGxvbmcgdDQ7CisJCQl1bnNpZ25lZCBsb25nIHQ1Owor
CQkJdW5zaWduZWQgbG9uZyB0NjsKKyNlbmRpZgogCQl9OwogCX07CiB9OwpkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvYXNtLW9mZnNldHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2FzbS1v
ZmZzZXRzLmMKaW5kZXggMTY0OTA3NTUzMDRlLi43YzQzYzhlMjZhZTcgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL2FzbS1vZmZzZXRzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvYXNt
LW9mZnNldHMuYwpAQCAtNTAxLDYgKzUwMSwxMyBAQCB2b2lkIGFzbV9vZmZzZXRzKHZvaWQpCiAJ
REVGSU5FKEZSRUdTX1NQLAkgICAgb2Zmc2V0b2Yoc3RydWN0IF9fYXJjaF9mdHJhY2VfcmVncywg
c3ApKTsKIAlERUZJTkUoRlJFR1NfUzAsCSAgICBvZmZzZXRvZihzdHJ1Y3QgX19hcmNoX2Z0cmFj
ZV9yZWdzLCBzMCkpOwogCURFRklORShGUkVHU19UMSwJICAgIG9mZnNldG9mKHN0cnVjdCBfX2Fy
Y2hfZnRyYWNlX3JlZ3MsIHQxKSk7CisjaWZkZWYgQ09ORklHX0NDX0lTX0NMQU5HCisJREVGSU5F
KEZSRUdTX1QyLAkgICAgb2Zmc2V0b2Yoc3RydWN0IF9fYXJjaF9mdHJhY2VfcmVncywgdDIpKTsK
KwlERUZJTkUoRlJFR1NfVDMsCSAgICBvZmZzZXRvZihzdHJ1Y3QgX19hcmNoX2Z0cmFjZV9yZWdz
LCB0MykpOworCURFRklORShGUkVHU19UNCwJICAgIG9mZnNldG9mKHN0cnVjdCBfX2FyY2hfZnRy
YWNlX3JlZ3MsIHQ0KSk7CisJREVGSU5FKEZSRUdTX1Q1LAkgICAgb2Zmc2V0b2Yoc3RydWN0IF9f
YXJjaF9mdHJhY2VfcmVncywgdDUpKTsKKwlERUZJTkUoRlJFR1NfVDYsCSAgICBvZmZzZXRvZihz
dHJ1Y3QgX19hcmNoX2Z0cmFjZV9yZWdzLCB0NikpOworI2VuZGlmCiAJREVGSU5FKEZSRUdTX0Ew
LAkgICAgb2Zmc2V0b2Yoc3RydWN0IF9fYXJjaF9mdHJhY2VfcmVncywgYTApKTsKIAlERUZJTkUo
RlJFR1NfQTEsCSAgICBvZmZzZXRvZihzdHJ1Y3QgX19hcmNoX2Z0cmFjZV9yZWdzLCBhMSkpOwog
CURFRklORShGUkVHU19BMiwJICAgIG9mZnNldG9mKHN0cnVjdCBfX2FyY2hfZnRyYWNlX3JlZ3Ms
IGEyKSk7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMKaW5kZXggNzQ1ZGQ0YzRhNjljLi5lOTg4YmQyNmIy
OGIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL21jb3VudC1keW4uUworKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9tY291bnQtZHluLlMKQEAgLTk2LDcgKzk2LDEzIEBACiAJUkVHX1MJeDgs
ICBGUkVHU19TMChzcCkKICNlbmRpZgogCVJFR19TCXg2LCAgRlJFR1NfVDEoc3ApCi0KKyNpZmRl
ZiBDT05GSUdfQ0NfSVNfQ0xBTkcKKwlSRUdfUwl4NywgIEZSRUdTX1QyKHNwKQorCVJFR19TCXgy
OCwgRlJFR1NfVDMoc3ApCisJUkVHX1MJeDI5LCBGUkVHU19UNChzcCkKKwlSRUdfUwl4MzAsIEZS
RUdTX1Q1KHNwKQorCVJFR19TCXgzMSwgRlJFR1NfVDYoc3ApCisjZW5kaWYKIAkvLyBzYXZlIHRo
ZSBhcmd1bWVudHMKIAlSRUdfUwl4MTAsIEZSRUdTX0EwKHNwKQogCVJFR19TCXgxMSwgRlJFR1Nf
QTEoc3ApCkBAIC0xMTUsNyArMTIxLDEzIEBACiAJUkVHX0wJeDgsIEZSRUdTX1MwKHNwKQogI2Vu
ZGlmCiAJUkVHX0wJeDYsICBGUkVHU19UMShzcCkKLQorI2lmZGVmIENPTkZJR19DQ19JU19DTEFO
RworCVJFR19MCXg3LCAgRlJFR1NfVDIoc3ApCisJUkVHX0wJeDI4LCBGUkVHU19UMyhzcCkKKwlS
RUdfTAl4MjksIEZSRUdTX1Q0KHNwKQorCVJFR19MCXgzMCwgRlJFR1NfVDUoc3ApCisJUkVHX0wJ
eDMxLCBGUkVHU19UNihzcCkKKyNlbmRpZgogCS8vIHJlc3RvcmUgdGhlIGFyZ3VtZW50cwogCVJF
R19MCXgxMCwgRlJFR1NfQTAoc3ApCiAJUkVHX0wJeDExLCBGUkVHU19BMShzcCkKLS0gCjIuMzku
MyAoQXBwbGUgR2l0LTE0NSkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
