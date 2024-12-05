Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22109E7716E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 21:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6NjNj/CCafExLzJLFOSLGpIQdIPQKisyby0JBYmpGI8=; b=b9bKl+5Jeqc5se
	O7JRwnmQ7pgDut19xsGmaZGnkIZjuRNASVy0M5/g0oIxbeWyA6B4X/aC1G/ifSCjrvG1Gaz4VzKEf
	GqiL32hR6Pr5x3BoFUBbNxE0pVYbk9urqVwbcGpWT4XWaM06OZDpqVzOm6yoWPaYRNypm9WQpJbVI
	/drBJFLTnAgAcLiUFrEg44rzfgeaI5uBSODnH4AxjTfin7nqUNnR4RMRzYg3UUYWPPg7AM0HEYzKk
	sik/+jZ8K37XF3EPjVhcTtQlzL5+7rkGmN8q6Rg4kgIkxQGGQhostQfkr+OOX5YNVjbpA/x5x/xlj
	KBUbiH5oAuyur8RoSw8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJjD-0000000HQms-2Dbz;
	Thu, 05 Dec 2024 21:49:43 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJJjB-0000000HQmP-0Pfa
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 21:49:42 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-215b9a754fbso14148815ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 13:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733435380; x=1734040180; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ylsolAa24KJioSknE/TsKey3hUL/pRTv+tYnTAIOBOU=;
        b=TW7t++jN6hr9jC06Te9Ph3A/p3H4mhbkPOe1kzDST/bzAi+3oWlKG4MDbtsuV1rlk+
         Pkr+QRKd5x1Hc3QlVtxfWszAo31NpI5QGqWmAIOWBPOQYdp8v0IcubkZzV+qO/+wtuV0
         j+9FbAGPZkbGN0X9QxA3R9XzTlHRWmh3Qwg2n71HnRxb5FTSLTEy84JmQvvhVG10UdSH
         qitoVwZRlOLna0+65ylYItKkmCeHvyqedhDKdHazkAjq2NSlNdG7iaihJqiwqK07OZGo
         U0oAbqmHAUi7n5QIE6+TYyMcbaxhKYuP2bjsMW++n3jPcGapbxorELckKTj3fitnn2Rc
         CsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733435380; x=1734040180;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ylsolAa24KJioSknE/TsKey3hUL/pRTv+tYnTAIOBOU=;
        b=Qtfxccu/aFto1PbGRp2tt3DhSt6enQIPI8KaFtW1gR8mEc9pb34R8b8Tl9+sXJuVX5
         P+kXhq4MPcPz8yX7qTyiqQA+CgWmz4cztWKErF4TS60urG3hE9GLnFU4Lj0+YvZ5fOMt
         JERDYLFAjWoiw5GIMceif0W6O1onaBKz7zHeeOab/4BAWPpf4eh9K/7QpXfRHMbXC53X
         qiWrT5RcIE15yvPShkTuc0IcuJe6jx7Xd7ZCkcj/MA5wZEkH5CGjM0g/z/eneovVF3G2
         xwQjqYMPWFYS3abpsemAL1otNrd5V6/BNlMCs8j2Fa/cWPxr0Kzm9pubr3aZtBEn+qUo
         PEhw==
X-Forwarded-Encrypted: i=1; AJvYcCVck739jFZDLs8nguSG2PzCxM4wiS91UJv81xLkVGM76yqCQZ6FfYxAZAES/YYP++aocAXVK19dPKDWnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGcHm4shaEErcJYKSit2SlF/3VCxLhEshtIQQP7+eIVtRfRVnU
	oOEnISq0WATrMK3jj4unmiD/pDeuZBQ+4CcSwW9QBnpRFkJx9PJJb7LefkXKSelf9egszOlWDd3
	Q
X-Gm-Gg: ASbGncvekY1jKcfDocevE/K7sIkfs+zeuCrwXHA4RCONBMK81v6H36qrzb5uRNtj+6g
	PhDB24n5Uy8aYRjdHS1Yj49hDjhJH9xlV3IfqZm0HHEulLM7NdWiPPv0EtrFHdKO3nldLCbosRh
	0xjuUxvSF/zUSKYT63SP2fRF90XWnlyColzA0OtTsalGRehScUrlvdWC+LlytHITcGQDj+WWVB9
	tlw4vS8nTNGK/E/pTdN9rMhdkD2Zi10HpK1TCCtHCTgR2M/ax947WsViJhwkAhKIA==
X-Google-Smtp-Source: AGHT+IFTb2VVc0pKxcp/N8wkyZ083cyONyg4oc637ROCo07u90M4wR/yDH/PPfe8ZbpGqnrUUyfdNA==
X-Received: by 2002:a17:902:d4ca:b0:215:96bc:b670 with SMTP id d9443c01a7336-21614d3ac68mr5579825ad.18.1733435379862;
        Thu, 05 Dec 2024 13:49:39 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9dafsm16496085ad.120.2024.12.05.13.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 13:49:38 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 05 Dec 2024 13:49:31 -0800
Subject: [PATCH v4] riscv: selftests: Fix warnings pointer masking test
MIME-Version: 1.0
Message-Id: <20241205-fix_warnings_pointer_masking_tests-v4-1-0c77eb725486@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAOofUmcC/5XNQQrCMBQE0KtI1kaSNKmtK+8hUtL4ox8xKfklK
 qV3N7oScaHLGZg3EyNICMQ2i4klyEgYQwl6uWDuZMMROB5KZkooLZXQ3OOtu9oUMBypGyKGEVJ
 3sXQuRTcCjcSrphagfWW0almBhgRl9TrZ7Us+IY0x3V+fWT7bv/gsueRgJbR1bRys7TZhjoTBr
 Vy8sOdDVv+rqqiy98IZ0Rpvmi9q9a6an9SqqMapphe+rbU4fKjzPD8AG0LWz4MBAAA=
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3049; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=8FnRi21KlrzOAiYqaiv4ehq3t7YDIRIjKXA+qmcuaUE=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qQ/JtKlok/ngWsEnDPXCFRfe2C1zl5v6oHFxLMZS1EJ
 md/yEjsKGVhEONgkBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCL5RQx/xVd1fP3e1uLwcYuO
 oUAil+CKPN/D6+qKZ7NY3vhl4hSmzPBPT8vkr5TN5waVDWVTp9ZNZ5h/Z+ZCTuPjs+wUJnvabDz
 KDQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_134941_189281_56692060 
X-CRM114-Status: GOOD (  11.33  )
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
OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgotLS0KQ2hhbmdlcyBpbiB2
NDoKLSBTa2lwIHN5c2N0bF9lbmFibGVkIHRlc3QgaWYgZmlyc3QgcHdyaXRlIGZhaWxlZAotIExp
bmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDUtZml4X3dhcm5pbmdz
X3BvaW50ZXJfbWFza2luZ190ZXN0cy12My0xLTVjMjhiMGY5NjQwZEByaXZvc2luYy5jb20KCkNo
YW5nZXMgaW4gdjM6Ci0gRml4IHN5c2N0bCBlbmFibGVkIHRlc3QgY2FzZSAoRHJldy9BbGV4KQot
IE1vdmUgcHdyaXRlIGVyciBjb25kaXRpb24gaW50byBnb3RvIChEcmV3KQotIExpbmsgdG8gdjI6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJf
bWFza2luZ190ZXN0cy12Mi0xLTFiZjBjNTA5NWY1OEByaXZvc2luYy5jb20KCkNoYW5nZXMgaW4g
djI6Ci0gSSBoYWQgcmV0ICE9IDIgZm9yIHRlc3RpbmcsIEkgY2hhbmdlZCBpdCB0byBiZSByZXQg
IT0gMS4KLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQxMjA0LWZp
eF93YXJuaW5nc19wb2ludGVyX21hc2tpbmdfdGVzdHMtdjEtMS1lYTFlOTY2NWNlN2FAcml2b3Np
bmMuY29tCi0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFz
a2luZy5jIHwgMjAgKysrKysrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL3Jpc2N2L2FiaS9wb2ludGVyX21hc2tpbmcuYwppbmRleCBkZWU0MWI3ZWUzZTMuLjc1OTQ0
NWQ1ZjI2NSAxMDA2NDQKLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3Bv
aW50ZXJfbWFza2luZy5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9w
b2ludGVyX21hc2tpbmcuYwpAQCAtMTg5LDYgKzE4OSw4IEBAIHN0YXRpYyB2b2lkIHRlc3RfdGFn
Z2VkX2FkZHJfYWJpX3N5c2N0bCh2b2lkKQogewogCWNoYXIgdmFsdWU7CiAJaW50IGZkOworCWlu
dCByZXQ7CisJY2hhciAqZXJyX3B3cml0ZV9tc2cgPSAiZmFpbGVkIHRvIHdyaXRlIHRvIC9wcm9j
L3N5cy9hYmkvdGFnZ2VkX2FkZHJfZGlzYWJsZWRcbiI7CiAKIAlrc2Z0X3ByaW50X21zZygiVGVz
dGluZyB0YWdnZWQgYWRkcmVzcyBBQkkgc3lzY3RsXG4iKTsKIApAQCAtMjAwLDE4ICsyMDIsMzIg
QEAgc3RhdGljIHZvaWQgdGVzdF90YWdnZWRfYWRkcl9hYmlfc3lzY3RsKHZvaWQpCiAJfQogCiAJ
dmFsdWUgPSAnMSc7Ci0JcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOworCXJldCA9IHB3cml0ZShm
ZCwgJnZhbHVlLCAxLCAwKTsKKwlpZiAocmV0ICE9IDEpIHsKKwkJa3NmdF90ZXN0X3Jlc3VsdF9z
a2lwKGVycl9wd3JpdGVfbXNnKTsKKwkJZ290byBlcnJfcHdyaXRlOworCX0KKwogCWtzZnRfdGVz
dF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVlKSA9PSAtRUlOVkFM
LAogCQkJICJzeXNjdGwgZGlzYWJsZWRcbiIpOwogCiAJdmFsdWUgPSAnMCc7Ci0JcHdyaXRlKGZk
LCAmdmFsdWUsIDEsIDApOworCXJldCA9IHB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKKwlpZiAo
cmV0ICE9IDEpCisJCWdvdG8gZXJyX3B3cml0ZTsKKwogCWtzZnRfdGVzdF9yZXN1bHQoc2V0X3Rh
Z2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVlKSA9PSAwLAogCQkJICJzeXNjdGwgZW5hYmxl
ZFxuIik7CiAKIAlzZXRfdGFnZ2VkX2FkZHJfY3RybCgwLCBmYWxzZSk7CiAKIAljbG9zZShmZCk7
CisKKwlyZXR1cm47CisKK2Vycl9wd3JpdGU6CisJY2xvc2UoZmQpOworCWtzZnRfdGVzdF9yZXN1
bHRfZmFpbChlcnJfcHdyaXRlX21zZyk7CiB9CiAKIHN0YXRpYyB2b2lkIHRlc3RfdGFnZ2VkX2Fk
ZHJfYWJpX3BtbGVuKGludCBwbWxlbikKCi0tLQpiYXNlLWNvbW1pdDogNDAzODRjODQwZWExOTQ0
ZDdjNWEzOTJlODk3NWVkMDg4ZWNmMGIzNwpjaGFuZ2UtaWQ6IDIwMjQxMjA0LWZpeF93YXJuaW5n
c19wb2ludGVyX21hc2tpbmdfdGVzdHMtMzg2MGU0ZjM1NDI5Ci0tIAotIENoYXJsaWUKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
