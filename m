Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF62C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yv8UUFxNA/LD0FCOiagbwn48XfNW4wM/dDT6LvQkItc=; b=ah9PDrBWPlrZne
	upM7qU737WJBanHi7+H6cV4U5Xuq8PdXPbN9eiVRQjbPja1iB5l6HhcMifbu75K3LpMjjainELVSs
	XjLZWGeFrl36oiWfhnNaRfRtlqcMSGYYMBkt2eO6ehfPgIWn5w7c0pGtMPgAB33Iz07mC0+0TAaeT
	CqGBKLUueBwg2Nt/I9uJ5+liFLMMqFbSALjR5gZ93LX/W6gSIHPmBm9keEi33nTlx+qBr3Lxt3mRB
	RSPvmnV1HXgmowunGDOAP8sfAx9zhMrZ09N8br2WAnNFpPHsSxgpUPWlKgOZFsjw3TQb6yptAbhe6
	LVId4sPlMPSdmHp2aN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETYw-00000002LV4-0Fdh;
	Tue, 04 Jun 2024 12:46:50 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETYs-00000002LRt-0aAm
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:46:47 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-6c8b6e40ea6so337535a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505204; x=1718110004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=degCLXX+XHlviO1qHS0Zal5T+84ciDG6Q4Lb35fjmT4=;
        b=2SIyN8cDwSgKbHu1EGeLx6mZJTD54RkymDahJi0jIfSZsNqLpeQ5txX3srZbSzPj4Z
         fvq/XEFL4O5mZJ/kcnAOXJA/iChYCGbbVlpCYeqoMAGTQtf1eyZKnYdw0ePVz7SXNG70
         oEc3Kza1yASeOqXDRzYB3sKsiIjoOui83i9XAs7A5Cj60uglr7F6FknOVyJGTdQDtSGn
         6WFz5RJk1zgZBUs8gHLr1hTP1S8aUmaGyDu4vUgaFKLHLaxions0YIiwTavUMeg5xZsg
         YrVxAHrufCi8kk58H7Jif+c2dD6X+3DtvztNkzHM1NPz0GFQNo8DZe7Ibc6+rQOUKkOQ
         hS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505204; x=1718110004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=degCLXX+XHlviO1qHS0Zal5T+84ciDG6Q4Lb35fjmT4=;
        b=Fwgdd9kko82/dGm4ybHEqQOf1xGjzhdUJ4jrm42tCk2lyr5eZ4PXfliEj2XsuYeX4a
         whpO9Cstzn9uZS1iOGrUTUBrQjwojUL++lAFJr0YeVe0PIKCKmXC3wvl5a0JDSn8UbWe
         l8Rdt72SgbYrzudKy8ZpjQJD4Wu3xtMXr+Ug6a1x7gVW/7/5/K/BruPFjZ2hgBepMHh4
         Kqr143+BMP9/aV/nza5XYx6yMpvcnS/6w1stxZ6vkMd7iBfvGNEs2CV6MtoAkNNZC1SB
         UM2GOiZhkARVJMA7MyukIUoaGnHEcY7/eejF/O1/jFBdOE19XqQW6/H8U/9RYDENi0zP
         pinw==
X-Forwarded-Encrypted: i=1; AJvYcCWF8MUQwFrj/FPC1lPCMY5CCZqPtSiyUbRK+SaBaPUxu9kKFaQ/YKhowRNv3SlRSCREdM6mivxvDLDTNzsUcOTZdiadf0jERHQkE1sQZib8
X-Gm-Message-State: AOJu0YwxMD2IsOjS1EP0kPuIaWWhkI4RWI8/fNxl0xq91Y2tCn40Qxyx
	CJZgcwdogVun3BmHx29h7Uktfv5HVz+IWpBNLjD90/pXaLepuwhaEef+nWhRxns=
X-Google-Smtp-Source: AGHT+IE7zjnoMPDLUunpx6Exg1+SZFG8SqiUAnSVY1fKx+9xoXFT3WVdqzkHkbK298PA0agj34W4eA==
X-Received: by 2002:a05:6a21:339e:b0:1af:d9a3:f3a3 with SMTP id adf61e73a8af0-1b26f327d1amr13632883637.4.1717505204132;
        Tue, 04 Jun 2024 05:46:44 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:46:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 03/16] riscv: hwprobe: export Zimop ISA extension
Date: Tue,  4 Jun 2024 14:45:35 +0200
Message-ID: <20240604124550.3214710-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054646_264196_521C4E41 
X-CRM114-Status: GOOD (  10.64  )
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

RXhwb3J0IFppbW9wIElTQSBleHRlbnNpb24gdGhyb3VnaCBod3Byb2JlLgoKU2lnbmVkLW9mZi1i
eTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpSZXZpZXdlZC1ieTogQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2Fy
Y2gvcmlzY3YvaHdwcm9iZS5yc3QgIHwgNCArKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oIHwgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAg
IHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdCBiL0RvY3VtZW50YXRpb24vYXJjaC9y
aXNjdi9od3Byb2JlLnJzdAppbmRleCAyMDRjZDQ0MzNhZjUuLjQ4YmUzOGUwYjc4OCAxMDA2NDQK
LS0tIGEvRG9jdW1lbnRhdGlvbi9hcmNoL3Jpc2N2L2h3cHJvYmUucnN0CisrKyBiL0RvY3VtZW50
YXRpb24vYXJjaC9yaXNjdi9od3Byb2JlLnJzdApAQCAtMTkyLDYgKzE5MiwxMCBAQCBUaGUgZm9s
bG93aW5nIGtleXMgYXJlIGRlZmluZWQ6CiAgICAgICAgc3VwcG9ydGVkIGFzIGRlZmluZWQgaW4g
dGhlIFJJU0MtViBJU0EgbWFudWFsIHN0YXJ0aW5nIGZyb20gY29tbWl0CiAgICAgICAgZDhhYjVj
NzhjMjA3ICgiWmloaW50cGF1c2UgaXMgcmF0aWZpZWQiKS4KIAorICAqIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX0VYVF9aSU1PUGA6IFRoZSBaaW1vcCBNYXktQmUtT3BlcmF0aW9ucyBleHRlbnNp
b24gaXMKKyAgICAgICBzdXBwb3J0ZWQgYXMgZGVmaW5lZCBpbiB0aGUgUklTQy1WIElTQSBtYW51
YWwgc3RhcnRpbmcgZnJvbSBjb21taXQKKyAgICAgICA1ODIyMDYxNGE1ZiAoIlppbW9wIGlzIHJh
dGlmaWVkLzEuMCIpLgorCiAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9DUFVQRVJGXzBg
OiBBIGJpdG1hc2sgdGhhdCBjb250YWlucyBwZXJmb3JtYW5jZQogICBpbmZvcm1hdGlvbiBhYm91
dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oCmluZGV4IGRkYTc2YTA1NDIwYi4uNTc1Yjk1NzQ0ODQzIDEwMDY0NAotLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCisrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKQEAgLTYwLDYgKzYwLDcgQEAgc3RydWN0IHJpc2N2
X2h3cHJvYmUgewogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkFDQVMJCSgxVUxMIDw8IDM0
KQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklDT05ECSgxVUxMIDw8IDM1KQogI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWklISU5UUEFVU0UJKDFVTEwgPDwgMzYpCisjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aSU1PUAkJKDFVTEwgPDwgMzcpCiAjZGVmaW5lIFJJU0NWX0hXUFJP
QkVfS0VZX0NQVVBFUkZfMAk1CiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX01JU0FMSUdORURfVU5L
Tk9XTgkoMCA8PCAwKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVE
CSgxIDw8IDApCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYwppbmRleCA5NjllZjNkNTlkYmUuLmZjNmY0
MjM4ZjBiMyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3cHJvYmUuYworKysg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCkBAIC0xMTIsNiArMTEyLDcgQEAgc3Rh
dGljIHZvaWQgaHdwcm9iZV9pc2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKIAkJ
RVhUX0tFWShaQUNBUyk7CiAJCUVYVF9LRVkoWklDT05EKTsKIAkJRVhUX0tFWShaSUhJTlRQQVVT
RSk7CisJCUVYVF9LRVkoWklNT1ApOwogCiAJCWlmIChoYXNfdmVjdG9yKCkpIHsKIAkJCUVYVF9L
RVkoWlZCQik7Ci0tIAoyLjQ1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
