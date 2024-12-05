Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8EABE7716D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 02:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N2pmZkSnYxKDvMfNeZL4TWc7+p8GD+Ux4b5Z5/6KbF8=; b=lzZv2snyQ3bZH4
	m3DZhw05CxgS0dCHufSdpIR8kIb4E0NMl+LgIQByqBQszEu3GOMTCRKDjiAivTnECG75TEIBAHTlE
	FGEKaz8AAcZnVR8u/xOQe0Jq3Zmr0wahlLc5NGYdfHNVsvezq9+EHBMIcyDhONIMG+TbssfD2O3BV
	1B+p9zT0AYa5FkDIBAxgcYH/xG2tnju9qHboS/zPFHzPjXgy/KouBEw1anI2dkmGBv5IFRSNZQj9D
	V8wBLJwvl3oAjclcU1CpEQRdSxeedhX00RJJP9o4YF4Ao24hc6Z+ej0daThcsTX5IR+EoeWqqkEPH
	7ddK58oJj70xhjOGYbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ1zq-0000000EbRF-3hsI;
	Thu, 05 Dec 2024 02:53:42 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ1zo-0000000EbQc-2GVD
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 02:53:42 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-215b0582aaeso2914665ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Dec 2024 18:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733367219; x=1733972019; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y5i2W/fX0uIIT+J5MfXCDS794yT/hd4XA/lGS5kDrh8=;
        b=RUWU8WSE72xn/e3Pav8Dk7t1ePtMXmTJzecoIIk030VhJZZY7G2d+6TxlatTsuPZFa
         geyKgy8nCxzb1tMJK605414PVrD6mZ8zw2MAMf9Cpmxiq30XQrZJ0v8b1ZBn6VqeCVA5
         dICM2dILtTl65cNXxxlth5cBEPgFTt7lsxORcjehioNewZqHWe7PrEj0+L9H+knpzrLA
         lQTy1aB9PxOpqSRvHP86KHG3X8xp92QeuiGSUibZBuTPMNu9RHVGUSX8uP/fWzOaVhBF
         nKMbp8ghp5WVrocMI/deYfvMrsJbeAHTJXR+dBSniiXHFgtIdJP3PMTFC2bkr9bj6vmd
         EdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733367219; x=1733972019;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5i2W/fX0uIIT+J5MfXCDS794yT/hd4XA/lGS5kDrh8=;
        b=ds7G7W0DWK2AJi+UbySiUdY/97SKkZQIdZoX9ktmOdQ5FeVnlVkiGMyojwqcBOIHDp
         CPcPWjpqqnEeXpGAJYIBnY/urE/nyNJQstc8u3Zmit0uMM1xNhHeYImU/m/AUdcnYdYo
         s7GSusn12M00sWnhvQBAQclvj8CTdwz1xgqiWksMfl3VlWUZNcCGclB99SwnIWnNw+rL
         arNLSpuF1H/U1vbOVZwYJZCMlyNcBuMC1Rdb57G1rpE2swRethq1HqaCz+aacIMqK00P
         DzWLl9HLhzds4FE5A/xbsI7Tj+zexszrsrrQ3MMmdRR/c36ccvqEToNpLZ46WkspPeZm
         Vekg==
X-Forwarded-Encrypted: i=1; AJvYcCUoz14oPVR8hAwlMZBO7qiJmBFMCDu5/il9WhTmqawHLyDIO35Jbs42P1noquX+Zo+4WSz/uveuOZrMgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaS4B/vc6nrQ9Kk3f0yzHbHclqb7nOV5yLygrhWRvj3gHeNecl
	RwkvatiFvRnsBaMSIVsryU6/ttjQSuD3LdaYRzzaNtsaXiaCE3i8b23I0tkj/OQ=
X-Gm-Gg: ASbGncvtD2V//9UjzS2sXQhHj39s537FTkok2eLskLbYHeWQeBKVRhpPpEmyRjj52gz
	Lm8SpX58oJvtPixhqWaUBcWgbVigSSBJAsff4WtmrGATaAAaS92zKdadUAJQr7YqNKwfM5psisC
	wwmhxFeM/rF2dznqEb+mmxPh1omGK66m9vb1PE6ZU9GtlizPwnTrRZN8L0Szrerfr61/Lg0HuL2
	6dO82dteAnJs53MPlRvC+W+9neV8jj3j/bghQlY7kxVWYo1/JhT/a2TBKlOFw1KKQ==
X-Google-Smtp-Source: AGHT+IF0E05Cz0CNGSRzqNmt+I+ohBvI+aYOdKpP0GLbqUbjAZpdOYjCbypomo4HQRAuwyG/o5iD3A==
X-Received: by 2002:a17:903:2442:b0:215:a98c:aabb with SMTP id d9443c01a7336-215bd0e66a5mr135859375ad.24.1733367219179;
        Wed, 04 Dec 2024 18:53:39 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e62c36sm2468565ad.65.2024.12.04.18.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 18:53:38 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 04 Dec 2024 18:53:28 -0800
Subject: [PATCH] riscv: selftests: Fix warnings pointer masking test
MIME-Version: 1.0
Message-Id: <20241204-fix_warnings_pointer_masking_tests-v1-1-ea1e9665ce7a@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAKcVUWcC/x2N0QrCMAxFf2Xk2ULXVVF/RaSULa1BzEZSVBj79
 4U9ngvnnhUUhVDh3q0g+CWlmQ36UwfjK3NFR5MxBB9iH3x0hf7pl4WJq6ZlJm4o6ZP1bUNqqE3
 dcL14jGU4x3ADO1oEzToij+e27SDGsaZ0AAAA
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2409; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=h5pkF7WFsF6QKVOZr0OZCA6MCXRJdUGJ2thXdNkkSus=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qg6MoFCz3CMjK6WW9+Xj7vzKoNdvv6WxY//7S91L3LQ
 fve+dW6HaUsDGIcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEyk3ozhf7klwyeXpJcfj+S0
 X121KjA9Lpf1y9ZW3ZyL5p3/Tj6bas7IcEDHblf3zqw9WfE7GXaWXpL7s/DgNf7JpQ5ejlbvv31
 7ywUA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_185340_842799_6A106E09 
X-CRM114-Status: UNSURE (   8.99  )
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

V2hlbiBjb21waWxpbmcgdGhlIHBvaW50ZXIgbWFza2luZyB0ZXN0cyB3aXRoIC1XYWxsIHRoaXMg
d2FybmluZwppcyBwcmVzZW50OgoKcG9pbnRlcl9tYXNraW5nLmM6IEluIGZ1bmN0aW9uIOKAmHRl
c3RfdGFnZ2VkX2FkZHJfYWJpX3N5c2N0bOKAmToKcG9pbnRlcl9tYXNraW5nLmM6MjAzOjk6IHdh
cm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3JpdGXigJkKZGVjbGFyZWQgd2l0
aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1yZXN1bHRdCiAg
MjAzIHwgICAgICAgICBwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7IHwKICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+IHBvaW50ZXJfbWFza2luZy5jOjIwODo5OiB3YXJuaW5nOgppZ25vcmlu
ZyByZXR1cm4gdmFsdWUgb2Yg4oCYcHdyaXRl4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlCuKA
mHdhcm5fdW51c2VkX3Jlc3VsdOKAmSBbLVd1bnVzZWQtcmVzdWx0XQogIDIwOCB8ICAgICAgICAg
cHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwoKSSBjYW1lIGFjcm9zcyB0aGlzIG9uIHJpc2N2NjQt
bGludXgtZ251LWdjYyAoVWJ1bnR1CjExLjQuMC0xdWJ1bnR1MX4yMi4wNCkuCgpGaXggdGhpcyBi
eSBjaGVja2luZyB0aGF0IHRoZSBudW1iZXIgb2YgYnl0ZXMgd3JpdHRlbiBlcXVhbCB0aGUgZXhw
ZWN0ZWQKbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4uCgpGaXhlczogNzQ3MGI1YWZkMTUwICgicmlz
Y3Y6IHNlbGZ0ZXN0czogQWRkIGEgcG9pbnRlciBtYXNraW5nIHRlc3QiKQpTaWduZWQtb2ZmLWJ5
OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgotLS0KIHRvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYyB8IDE5ICsrKysrKysrKysr
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVy
X21hc2tpbmcuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21h
c2tpbmcuYwppbmRleCBkZWU0MWI3ZWUzZTMuLjVhZTk0MWU5YWM3MyAxMDA2NDQKLS0tIGEvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5jCisrKyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYwpAQCAtMTg5
LDYgKzE4OSw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfdGFnZ2VkX2FkZHJfYWJpX3N5c2N0bCh2b2lk
KQogewogCWNoYXIgdmFsdWU7CiAJaW50IGZkOworCWludCByZXQ7CiAKIAlrc2Z0X3ByaW50X21z
ZygiVGVzdGluZyB0YWdnZWQgYWRkcmVzcyBBQkkgc3lzY3RsXG4iKTsKIApAQCAtMjAwLDE0ICsy
MDEsMjQgQEAgc3RhdGljIHZvaWQgdGVzdF90YWdnZWRfYWRkcl9hYmlfc3lzY3RsKHZvaWQpCiAJ
fQogCiAJdmFsdWUgPSAnMSc7Ci0JcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOworCXJldCA9IHB3
cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKKwlpZiAocmV0ICE9IDEpIHsKKwkJa3NmdF90ZXN0X3Jl
c3VsdF9mYWlsKCJXcml0ZSB0byAvcHJvYy9zeXMvYWJpL3RhZ2dlZF9hZGRyX2Rpc2FibGVkIGZh
aWxlZC5cbiIpOworCQlyZXR1cm47CisJfQorCiAJa3NmdF90ZXN0X3Jlc3VsdChzZXRfdGFnZ2Vk
X2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUpID09IC1FSU5WQUwsCiAJCQkgInN5c2N0bCBkaXNh
YmxlZFxuIik7CiAKIAl2YWx1ZSA9ICcwJzsKLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Ci0J
a3NmdF90ZXN0X3Jlc3VsdChzZXRfdGFnZ2VkX2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUpID09
IDAsCi0JCQkgInN5c2N0bCBlbmFibGVkXG4iKTsKKwlyZXQgPSBwd3JpdGUoZmQsICZ2YWx1ZSwg
MSwgMCk7CisJaWYgKHJldCAhPSAyKSB7CisJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbCgiV3JpdGUg
dG8gL3Byb2Mvc3lzL2FiaS90YWdnZWRfYWRkcl9kaXNhYmxlZCBmYWlsZWQuXG4iKTsKKwkJcmV0
dXJuOworCX0KKworCWtzZnRfdGVzdF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0cmwobWluX3Bt
bGVuLCB0cnVlKSA9PSAtRUlOVkFMLAorCQkJICJzeXNjdGwgZGlzYWJsZWRcbiIpOwogCiAJc2V0
X3RhZ2dlZF9hZGRyX2N0cmwoMCwgZmFsc2UpOwogCgotLS0KYmFzZS1jb21taXQ6IDQwMzg0Yzg0
MGVhMTk0NGQ3YzVhMzkyZTg5NzVlZDA4OGVjZjBiMzcKY2hhbmdlLWlkOiAyMDI0MTIwNC1maXhf
d2FybmluZ3NfcG9pbnRlcl9tYXNraW5nX3Rlc3RzLTM4NjBlNGYzNTQyOQotLSAKLSBDaGFybGll
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
