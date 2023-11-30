Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5885C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UbOhJ+WcqLcQ3l1/C51dL5u941I/cDbNsVcyKks3DUY=; b=C+YGOnz4Q2oakg
	gdxm4feLjlPfklz+zJ1Hp7V+EDqHxQnBizIDvVW3R2SHlmn7WNGa4t5oOcYHarBrYdQVMwAFRsWWu
	KZ41bYY4t3PIHpDtRgZk22u2CunM1UKEo5YNBh4SXwOffomZUor1oqvwSSTN/HsHfsf+fVZ4gHhYO
	DR/L+xJH2JioA6PdZ0qhZ2ANQeRkiAK8OagG0eRo0w/d6gANTCcW/8ZnJSZEXtsXoAjkYXC5yvVVa
	RHEajMlNepp8MFd//wNjfw/WmXVYWUnirogiPvZRKGiWYHDSx4GOPGUFCYQ/rnFIdKhN0U/T9qOgA
	3gExmaf7wtiOi+w8Cxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8f5P-00AYGe-24;
	Thu, 30 Nov 2023 11:20:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8f5L-00AYFl-1n
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 11:20:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b4ff0f254so847765e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 03:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701343195; x=1701947995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xkg3D7dfeo+mWJRReRlSNv0FZynZ0tPFmMr3Kpg4FI=;
        b=nPtSpg1WMZCbX0MjUfo+D2laWr7InXd9DrH+W2GaIZDjd/Z8z2YHdNjfroa6bfCiAZ
         N8DPz8x+EImuALDLFi81OIJbyLxYNmHDTe+lNyU8XwwYj/nIVi6KwwvEGZ8kuDDV+AKh
         +ZiV+N5mGMd5SiJRtVkSz2XoE6Dwg5h/rvDme4N82x260K1qStq6Gl76nEIyb9B8H+Yh
         ViqHJfltsdavOnY72/CuCm1RiD2rHSkqVMVCTmEgKGVHMkp0n87m6GUHx7TG3F6PQoDv
         fl5MCsKRkkvtUildIGJae8wrgDdj+G0+s8fKqdNbJLqrXdbn2fwa6/e58xNdVGDZRAIO
         WcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701343195; x=1701947995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2xkg3D7dfeo+mWJRReRlSNv0FZynZ0tPFmMr3Kpg4FI=;
        b=rB35eIevivtpDixY/Izkktfoh4Qq31gX/zycBdrMWLtV+dbiPVP23L+Gt5QnF12K0L
         rZff347yzL1YIDiq+Grf7LfseaBcVejEu30qplfpfyQPl9C7XoNRjBBZN1VYloVkdXub
         4d2rM31LVP37ipv6CXApfy/DkeQIR2O+32q0W9X9MSgOkQvzwFnNKCbb9DD4ZRCFRqL1
         7NryGvruDb6crQq1fhJqoH4fDP/eBLyvsOta0Fl97P+4oDVNtPaa6l6WM/j07VSQm9FS
         pgu7qXiffV27C4GaByyUec2fm7FW8sc08KIbc+Jgw5RiheYRFJJKSrrN0QmDPw5vXkLV
         O3lQ==
X-Gm-Message-State: AOJu0Yz8tkTXpTTtnyHTkhb+yrU7IFOlsQNRwpm3O2CUGepKlUEf/aDf
	G1nlqNI3zNbpEIEsCnXgh+moXw==
X-Google-Smtp-Source: AGHT+IFfRRNQEO2XT8TyLZKIAq0sDnYFn0kJ8Z/ibitwXQYGOwIrgK+qTbFcYzc1pO4WH0/im53AAw==
X-Received: by 2002:a05:600c:4f43:b0:40b:3d6d:e46b with SMTP id m3-20020a05600c4f4300b0040b3d6de46bmr1021907wmq.4.1701343195571;
        Thu, 30 Nov 2023 03:19:55 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:1e3e:ecf4:f8d8:c45e])
        by smtp.gmail.com with ESMTPSA id fs20-20020a05600c3f9400b0040b5517ae31sm4537310wmb.6.2023.11.30.03.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 03:19:55 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Samuel Ortiz <sameo@rivosinc.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v2] RISC-V: Implement archrandom when Zkr is available
Date: Thu, 30 Nov 2023 12:17:02 +0100
Message-ID: <20231130111704.1319081-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_031959_815589_BC913D31 
X-CRM114-Status: GOOD (  19.30  )
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

RnJvbTogU2FtdWVsIE9ydGl6IDxzYW1lb0ByaXZvc2luYy5jb20+CgpUaGUgWmtyIGV4dGVuc2lv
biBpcyByYXRpZmllZCBhbmQgcHJvdmlkZXMgMTYgYml0cyBvZiBlbnRyb3B5IHNlZWQgd2hlbgpy
ZWFkaW5nIHRoZSBTRUVEIENTUi4KCldlIGNhbiBpbXBsZW1lbnQgYXJjaF9nZXRfcmFuZG9tX3Nl
ZWRfbG9uZ3MoKSBieSBkb2luZyBtdWx0aXBsZSBjc3JydyB0bwp0aGF0IENTUiBhbmQgZmlsbGlu
ZyBhbiB1bnNpZ25lZCBsb25nIHdpdGggdmFsaWQgZW50cm9weSBiaXRzLgoKQWNrZWQtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+ClNpZ25lZC1vZmYtYnk6IFNh
bXVlbCBPcnRpeiA8c2FtZW9Acml2b3NpbmMuY29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBM
w6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgotLS0KClRoaXMgc2VyaWVzIGRlcGVuZHMgb24g
InJpc2N2OiByZXBvcnQgbW9yZSBJU0EgZXh0ZW5zaW9ucyB0aHJvdWdoCmh3cHJvYmUiIHNlcmll
cyBbMV0uCgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMxMTE0MTQxMjU2
LjEyNjc0OS0xLWNsZWdlckByaXZvc2luYy5jb20vIFsxXQoKQ2hhbmdlcyBpbiBWMjoKIC0gQWRk
IGNwdV9yZWxheCgpIGluIEJJU1QvV0FJVC9kZWZhdWx0IGNhc2VzLgogLSBSZW1vdmUgRnJvbTog
ZnJvbSBjb21taXQgZGVzY3JpcHRpb24KIC0gUmVtb3ZlICJieSIgZnJvbSBjb3B5cmlnaHQgbWVu
dGlvbgotLS0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vYXJjaHJhbmRvbS5oIHwgNzIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggICAg
ICAgIHwgIDkgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9hcmNocmFuZG9tLmgKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2FyY2hyYW5kb20uaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vYXJjaHJhbmRvbS5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAw
MDAwMC4uNTM0NTM2MGFkZmI5Ci0tLSAvZGV2L251bGwKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9hcmNocmFuZG9tLmgKQEAgLTAsMCArMSw3MiBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAgKi8KKy8qCisgKiBLZXJuZWwgaW50ZXJmYWNlIGZvciB0aGUgUklTQ1Yg
YXJjaF9yYW5kb21fKiBmdW5jdGlvbnMKKyAqCisgKiBDb3B5cmlnaHQgKGMpIDIwMjMgUml2b3Mg
SW5jLgorICoKKyAqLworCisjaWZuZGVmIEFTTV9SSVNDVl9BUkNIUkFORE9NX0gKKyNkZWZpbmUg
QVNNX1JJU0NWX0FSQ0hSQU5ET01fSAorCisjaW5jbHVkZSA8YXNtL2Nzci5oPgorI2luY2x1ZGUg
PGFzbS9wcm9jZXNzb3IuaD4KKworI2RlZmluZSBTRUVEX1JFVFJZX0xPT1BTIDEwMAorCitzdGF0
aWMgaW5saW5lIGJvb2wgX19tdXN0X2NoZWNrIGNzcl9zZWVkX2xvbmcodW5zaWduZWQgbG9uZyAq
dikKK3sKKwl1bnNpZ25lZCBpbnQgcmV0cnkgPSBTRUVEX1JFVFJZX0xPT1BTLCB2YWxpZF9zZWVk
cyA9IDA7CisJY29uc3QgaW50IG5lZWRlZF9zZWVkcyA9IHNpemVvZihsb25nKSAvIHNpemVvZih1
MTYpOworCXUxNiAqZW50cm9weSA9ICh1MTYgKil2OworCisJZG8geworCQkvKgorCQkgKiBUaGUg
U0VFRCBDU1IgbXVzdCBiZSBhY2Nlc3NlZCB3aXRoIGEgcmVhZC13cml0ZSBpbnN0cnVjdGlvbi4K
KwkJICovCisJCXVuc2lnbmVkIGxvbmcgY3NyX3NlZWQgPSBjc3Jfc3dhcChDU1JfU0VFRCwgMCk7
CisJCXVuc2lnbmVkIGxvbmcgb3BzdCA9IGNzcl9zZWVkICYgU0VFRF9PUFNUX01BU0s7CisKKwkJ
c3dpdGNoIChvcHN0KSB7CisJCWNhc2UgU0VFRF9PUFNUX0VTMTY6CisJCQllbnRyb3B5W3ZhbGlk
X3NlZWRzKytdID0gY3NyX3NlZWQgJiBTRUVEX0VOVFJPUFlfTUFTSzsKKwkJCWlmICh2YWxpZF9z
ZWVkcyA9PSBuZWVkZWRfc2VlZHMpCisJCQkJcmV0dXJuIHRydWU7CisJCQlicmVhazsKKworCQlj
YXNlIFNFRURfT1BTVF9ERUFEOgorCQkJcHJfZXJyX29uY2UoImFyY2hyYW5kb206IFVucmVjb3Zl
cmFibGUgZXJyb3JcbiIpOworCQkJcmV0dXJuIGZhbHNlOworCisJCWNhc2UgU0VFRF9PUFNUX0JJ
U1Q6CisJCWNhc2UgU0VFRF9PUFNUX1dBSVQ6CisJCWRlZmF1bHQ6CisJCQljcHVfcmVsYXgoKTsK
KwkJCWNvbnRpbnVlOworCQl9CisJfSB3aGlsZSAoLS1yZXRyeSk7CisKKwlyZXR1cm4gZmFsc2U7
Cit9CisKK3N0YXRpYyBpbmxpbmUgc2l6ZV90IF9fbXVzdF9jaGVjayBhcmNoX2dldF9yYW5kb21f
bG9uZ3ModW5zaWduZWQgbG9uZyAqdiwgc2l6ZV90IG1heF9sb25ncykKK3sKKwlyZXR1cm4gMDsK
K30KKworc3RhdGljIGlubGluZSBzaXplX3QgX19tdXN0X2NoZWNrIGFyY2hfZ2V0X3JhbmRvbV9z
ZWVkX2xvbmdzKHVuc2lnbmVkIGxvbmcgKnYsIHNpemVfdCBtYXhfbG9uZ3MpCit7CisJaWYgKCFt
YXhfbG9uZ3MpCisJCXJldHVybiAwOworCisJLyoKKwkgKiBJZiBaa3IgaXMgc3VwcG9ydGVkIGFu
ZCBjc3Jfc2VlZF9sb25nIHN1Y2NlZWRzLCB3ZSByZXR1cm4gb25lIGxvbmcKKwkgKiB3b3J0aCBv
ZiBlbnRyb3B5LgorCSAqLworCWlmIChyaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseShSSVNDVl9J
U0FfRVhUX1pLUikgJiYgY3NyX3NlZWRfbG9uZyh2KSkKKwkJcmV0dXJuIDE7CisKKwlyZXR1cm4g
MDsKK30KKworI2VuZGlmIC8qIEFTTV9SSVNDVl9BUkNIUkFORE9NX0ggKi8KZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nz
ci5oCmluZGV4IDMwNmExOWE1NTA5Yy4uNTEwMDE0MDUxZjVkIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2Nzci5oCisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgK
QEAgLTQxMSw2ICs0MTEsMTUgQEAKICNkZWZpbmUgQ1NSX1ZUWVBFCQkweGMyMQogI2RlZmluZSBD
U1JfVkxFTkIJCTB4YzIyCiAKKy8qIFNjYWxhciBDcnlwdG8gRXh0ZW5zaW9uIC0gRW50cm9weSAq
LworI2RlZmluZSBDU1JfU0VFRAkJMHgwMTUKKyNkZWZpbmUgU0VFRF9PUFNUX01BU0sJCV9BQygw
eEMwMDAwMDAwLCBVTCkKKyNkZWZpbmUgU0VFRF9PUFNUX0JJU1QJCV9BQygweDAwMDAwMDAwLCBV
TCkKKyNkZWZpbmUgU0VFRF9PUFNUX1dBSVQJCV9BQygweDQwMDAwMDAwLCBVTCkKKyNkZWZpbmUg
U0VFRF9PUFNUX0VTMTYJCV9BQygweDgwMDAwMDAwLCBVTCkKKyNkZWZpbmUgU0VFRF9PUFNUX0RF
QUQJCV9BQygweEMwMDAwMDAwLCBVTCkKKyNkZWZpbmUgU0VFRF9FTlRST1BZX01BU0sJX0FDKDB4
RkZGRiwgVUwpCisKICNpZmRlZiBDT05GSUdfUklTQ1ZfTV9NT0RFCiAjIGRlZmluZSBDU1JfU1RB
VFVTCUNTUl9NU1RBVFVTCiAjIGRlZmluZSBDU1JfSUUJCUNTUl9NSUUKLS0gCjIuNDMuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
