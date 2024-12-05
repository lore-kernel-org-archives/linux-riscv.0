Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FDBE7716D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 02:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vRPxK+TDbgd+WnjJz5FYIJPml/xFGCCVEYOQwqjjOv8=; b=jTVBsum2xjbPPG
	WHW7XF6sXP8bEp2DO85SAu4xsyOg8+MfzET8sseLyT8MLJfa82dxQWFOp5NZ8iUaB+jKLzy/BUvWz
	coghJjsQJkYkvf+trsdloVjlnhakHeR3FhbbKFfDPrOtMnH4XGKglQcifEWYp7wfuHfSojdX5DEam
	ZHp9C8M4kRJttINQmP/Kg7kdzPTT5jtciHIdSeW8Ly67RTGvp5YrNTw/sNNosAz9AJWDPx70W/YR/
	sRs/QJAZpUh0uSs7mt85kGVuFoifs9SOdEIDN6eZkebfMuo2eZ+BcovQgvqx1UHjutqY95xCpQKKE
	+5Q+sRxcZkUsFoaNpX6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ23J-0000000Ebqx-3FjE;
	Thu, 05 Dec 2024 02:57:17 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ23G-0000000EbqM-24qO
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 02:57:15 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5f203157278so249082eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Dec 2024 18:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733367433; x=1733972233; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipBWW2dnxGgAKU4Po5grW4q1klpnbh+IbcwsuY+B1d4=;
        b=ezOSpgFReD2d2dG/hf5kz9+UB9E2nVjzYHtzp90vPuVMIx/rP5SATm/0ePBmyGWn5K
         //mdQqxYH+o6zSDMGFbp+QcI50lUKBf17MguG0PBNbj1AUuqOWdivxo3lLnfRW3jmTo8
         xhH3stHhpYCMtApa6wc8Jyk65WsJGDZW4bgjM/qlevYsvrCMMTf179M9gvoSCqa1icjX
         K2zHHQWjwdwrvO+u67odtbCXq84bnCxheHkocP0cjXOCXa0sOOFpUBM1ESfd5SW0feqs
         IWWCwdaZB/jeT0Be/hm0IoQvF4D9RYmGA1U11mPs1vV7QnAqpnOslMsKhREDdQA1Ai3T
         1xeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733367433; x=1733972233;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipBWW2dnxGgAKU4Po5grW4q1klpnbh+IbcwsuY+B1d4=;
        b=Do9+kfc7qrFi5w8mQ4u975dGQXDNMUgFv3Ns68j0npRnEJ2Dx4hShYILsgxhCr7w/f
         x/Pha0jEJk8Bgs0VKKak0Ccg2GD3ACTkBfK/1cM9xHK++9iHdIjqwG04PLoJnVC0A5Jo
         25+EwKSo8StGNpbs0K2TXczUc/j6Gfg+L7RP2/3uRJfV1aZz5JVbfBivWoJUyT1KdEuo
         qtsNKewnX8X6ngHFCVjhATNFlWKYkE/tD3x0Nry/aMHzVs8YnyJSn2DAORa2qKQm/P6V
         xtfaMiRmjp6OsChTABx9Pa1s3BWSPH7hTDIKAGD/c8H/yuC/vnJxFq+onhvEIwfLm5tW
         ogSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOZnEP+e0hb2ACq7x772Z6isHs9IJ3it2eTRihfjZxyVbuRmMBrHOkh7ROjXwmGyUUirq+8VqloJVXVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGCyveRHi0B7VkRRStKRp0WY1JhkX/7elxhrA6mVWWfYvVp6xJ
	sLj7m5XgKby+9TP+bSYQACQ/b7s3iJMX9kBW8BWhbFDD4En7/W2DkjSfwIKRy8Q=
X-Gm-Gg: ASbGnctxUcdA1bQr8TnKvZ3GbHHLb+3s7/PlGhaglTewRRzKyzbQiPBr/LTbTg0jqWn
	+zUVBC8mMWhlWDjjxdMmToz22UqAovuSFITf/KdnkmW9aXPL6uoOk5h5xy6Xb1LpA6khkgjjJ/C
	ZjOzbewz/luvObapnLt30RbsEd0OO8k2btWGlAXsW1oLxStkOq5d8tQm50p+DReL93ip1TZtGJE
	xqi561PRK3h6670UvdBqe0AeswqFFpLfp2YLCoAJcqG9Pk2+hQgHiEZ5Otsa9q8kQ==
X-Google-Smtp-Source: AGHT+IFEHWkyCS6LHG+yi34gQLK5jMcjxCLqzFDhxH1oJQf1pgNGxOZbslnPeagR+v0TgGJ8kNbHbQ==
X-Received: by 2002:a05:6830:6016:b0:718:9d30:3c5a with SMTP id 46e09a7af769-71dad5edda4mr11520783a34.2.1733367432913;
        Wed, 04 Dec 2024 18:57:12 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd1568f26asm269581a12.9.2024.12.04.18.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 18:57:12 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 04 Dec 2024 18:57:10 -0800
Subject: [PATCH v2] riscv: selftests: Fix warnings pointer masking test
MIME-Version: 1.0
Message-Id: <20241204-fix_warnings_pointer_masking_tests-v2-1-1bf0c5095f58@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAIYWUWcC/5WNQQ6CMBBFr0K6toaWguLKexjSNHWAiaElM03VE
 O5u9QYu30v++5tgIAQWl2oTBBkZYyigD5XwswsTSLwXFrrWRunayBFf9ukoYJjYrhFDArKL40c
 RNgEnls25q8GMTWt0L0poJSir38ltKDwjp0jv32dWX/tXPiupJDgFfde1Hk7uSpgjY/BHHxcx7
 Pv+Afx+3AbXAAAA
To: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=0kdYtWwDnP1BFgEDmuauQ4kRcQgJT5fkZ+DZ/JMhTyA=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3qgWLsNj3bsWpZHUWmFDRf+m6jKrLVaPXf1Re3UfeFvX
 Bl0nzh0lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJGeckaGy5E31Z6ZyXT2rDnV
 soktz/XWx30OxXv/KUQ/5P53Y87MDIZ/Gv4nj0isVhPeJ/664rZD2799yYbFnE81f2c6z9NKvqb
 DBQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_185714_535991_CE57E903 
X-CRM114-Status: UNSURE (   9.98  )
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
OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgotLS0KQ2hhbmdlcyBpbiB2
MjoKLSBJIGhhZCByZXQgIT0gMiBmb3IgdGVzdGluZywgSSBjaGFuZ2VkIGl0IHRvIGJlIHJldCAh
PSAxLgotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEyMDQtZml4
X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy12MS0xLWVhMWU5NjY1Y2U3YUByaXZvc2lu
Yy5jb20KLS0tCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNr
aW5nLmMgfCAxOSArKysrKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMKaW5kZXggZGVlNDFiN2VlM2UzLi4yMjlkODVj
Y2ZmNTAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2FiaS9wb2lu
dGVyX21hc2tpbmcuYworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9p
bnRlcl9tYXNraW5nLmMKQEAgLTE4OSw2ICsxODksNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X3RhZ2dl
ZF9hZGRyX2FiaV9zeXNjdGwodm9pZCkKIHsKIAljaGFyIHZhbHVlOwogCWludCBmZDsKKwlpbnQg
cmV0OwogCiAJa3NmdF9wcmludF9tc2coIlRlc3RpbmcgdGFnZ2VkIGFkZHJlc3MgQUJJIHN5c2N0
bFxuIik7CiAKQEAgLTIwMCwxNCArMjAxLDI0IEBAIHN0YXRpYyB2b2lkIHRlc3RfdGFnZ2VkX2Fk
ZHJfYWJpX3N5c2N0bCh2b2lkKQogCX0KIAogCXZhbHVlID0gJzEnOwotCXB3cml0ZShmZCwgJnZh
bHVlLCAxLCAwKTsKKwlyZXQgPSBwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7CisJaWYgKHJldCAh
PSAxKSB7CisJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbCgiV3JpdGUgdG8gL3Byb2Mvc3lzL2FiaS90
YWdnZWRfYWRkcl9kaXNhYmxlZCBmYWlsZWQuXG4iKTsKKwkJcmV0dXJuOworCX0KKwogCWtzZnRf
dGVzdF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVlKSA9PSAtRUlO
VkFMLAogCQkJICJzeXNjdGwgZGlzYWJsZWRcbiIpOwogCiAJdmFsdWUgPSAnMCc7Ci0JcHdyaXRl
KGZkLCAmdmFsdWUsIDEsIDApOwotCWtzZnRfdGVzdF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0
cmwobWluX3BtbGVuLCB0cnVlKSA9PSAwLAotCQkJICJzeXNjdGwgZW5hYmxlZFxuIik7CisJcmV0
ID0gcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOworCWlmIChyZXQgIT0gMSkgeworCQlrc2Z0X3Rl
c3RfcmVzdWx0X2ZhaWwoIldyaXRlIHRvIC9wcm9jL3N5cy9hYmkvdGFnZ2VkX2FkZHJfZGlzYWJs
ZWQgZmFpbGVkLlxuIik7CisJCXJldHVybjsKKwl9CisKKwlrc2Z0X3Rlc3RfcmVzdWx0KHNldF90
YWdnZWRfYWRkcl9jdHJsKG1pbl9wbWxlbiwgdHJ1ZSkgPT0gLUVJTlZBTCwKKwkJCSAic3lzY3Rs
IGRpc2FibGVkXG4iKTsKIAogCXNldF90YWdnZWRfYWRkcl9jdHJsKDAsIGZhbHNlKTsKIAoKLS0t
CmJhc2UtY29tbWl0OiA0MDM4NGM4NDBlYTE5NDRkN2M1YTM5MmU4OTc1ZWQwODhlY2YwYjM3CmNo
YW5nZS1pZDogMjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy0zODYw
ZTRmMzU0MjkKLS0gCi0gQ2hhcmxpZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
