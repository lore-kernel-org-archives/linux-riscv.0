Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65501C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6sKCoisgl8ifCFIZBxFW8RELiEQVfL47H//yJuY5DY=; b=tahaSlH9S1D7VC
	FOOVcb0MnmMlgNBXwUJHX38gzrf6MHyGFWNEGXFuRGnslY4OoXt4rufclhAPb6xPodW533XhJxWo9
	5th4tFBcpdBnIdTlp8ouATb5UbWTY+NJzx6Bi8W+gfVHrV0sluIyIqN+MQSbKMwANI7C9u28pmxQj
	rsrz/i6VMbP2H233iET4xSTuxBe3l5ltTKVkuJNj2XO8px2oLPlNatTKspNonmlPus73LhDUzY1Ja
	XP9Q5gZhBzaLyjWC08t1xMl/3GKPCKK4WZfMf8dXCzfJYhil3mZtbiAxi2hynqMcK5YRdq17WIcYi
	7GYtI8NrxCDq0MVsZPYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETZ7-00000002LcJ-1Q3f;
	Tue, 04 Jun 2024 12:47:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETZ3-00000002LZM-3iIv
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 12:46:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f4c043d2f6so1770395ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 05:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505216; x=1718110016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mFZhmlMUdGr00o3b1f1nxWnxsIbMQJnxaGpqqSRdZE=;
        b=mw/kqOjzbTddqqdThDOoP5T3tUyfBFs3mLmiyYDS7Rbbg/3DPUW6CucH9sQG0q4Hf4
         P7B3wZn1BIJb7to6g8D/qy0Oz95FBGi8DFfBhrJKLlufiesD7Lgjjjkzq1FJx9m5VmxF
         cizBCG2fZaHVROowGP+3pNMh5W+do4tqQVpkqyj3v17eFiFP/AUWgHw89052nArNwMjZ
         Qy8EPi+SZLgq5UQPvD0qbK3xR1RHPH5UL2z6yY3ljMqTQfRNvBrNtkxKfP04tGFtafro
         SkLUvwO1i0C/MFXOscwvvfBsr6NWVGm7D5DqSoHk4IWwoyV0fWJUPr1Md3co6p+GwDx9
         FHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505216; x=1718110016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mFZhmlMUdGr00o3b1f1nxWnxsIbMQJnxaGpqqSRdZE=;
        b=n4dk/ufyTSkTLDqMffgn1PzkS03frrA/SofqwoCHmcSeOrfMwWG8r2lmf8ClqdAUnY
         adZlr8aPdqW1jkDEpr+NijOF45IHBO4zvcsAHzTJhvT1h10UFJpI/FfL1y9nT5h+jo7j
         a/P2ySJz9aBFjIE08jRSK1M3XfGLhBWo0Ap2XC+amJldu9xrg76hVXz0yBf+9dGEAMuL
         4DqZ0xOJbVjWE0ruGSvBcHfoNFM2u9nszhqBZqoQOl2pfvnW/AhXA9oXNnwFcNsmlwdo
         KpniXl6BEBI2N9OoP74yL7tqIZW8jAWY/Q2AavP0qlamabkLElOoCNkY6Lmhj6nF0UaV
         jXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzPhkawUTXoh8jZcBAk+F2tdi8RabRgFljWldqrl0eQHnAQK7ynhZXO8SHNyaieJV0+Y2HHziWyZzHPKdkz0cBaIu3W9pdYn4oXCex3aVp
X-Gm-Message-State: AOJu0YyFb0FRT3RaTCmOzsNMTW7T9w1tI/QT+VJwkhk5zMmA6y+aPCH5
	ejBdhSbWkS8+qC1nE990V/S22hR/zMwxWI6Tq4tu2ID/9+iRY00Ks29FNpnYgkU=
X-Google-Smtp-Source: AGHT+IFM41pQHUuJV2gzPwT4wOW9apDVDvAoHL8KWfUvAyFLfhBEBPDzezVMzHLJE7/SomhB0oFg6Q==
X-Received: by 2002:a17:902:ceca:b0:1f5:e635:21e9 with SMTP id d9443c01a7336-1f636ff9877mr138756065ad.2.1717505216018;
        Tue, 04 Jun 2024 05:46:56 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:46:55 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 04/16] RISC-V: KVM: Allow Zimop extension for Guest/VM
Date: Tue,  4 Jun 2024 14:45:36 +0200
Message-ID: <20240604124550.3214710-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054657_968265_04DE329F 
X-CRM114-Status: UNSURE (   9.87  )
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

RXh0ZW5kIHRoZSBLVk0gSVNBIGV4dGVuc2lvbiBPTkVfUkVHIGludGVyZmFjZSB0byBhbGxvdyBL
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaaW1vcCBleHRlbnNpb24gZm9yIEd1
ZXN0L1ZNLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oIHwgMSArCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAg
ICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9rdm0uaAppbmRleCBlODc4ZTdjYzM5NzguLmRiNDgyZWYwYWUxZSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMTY4LDYgKzE2OCw3IEBAIGVudW0gS1ZNX1JJU0NWX0lT
QV9FWFRfSUQgewogCUtWTV9SSVNDVl9JU0FfRVhUX1pUU08sCiAJS1ZNX1JJU0NWX0lTQV9FWFRf
WkFDQVMsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfU1NDT0ZQTUYsCisJS1ZNX1JJU0NWX0lTQV9FWFRf
WklNT1AsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfTUFYLAogfTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rdm0vdmNwdV9vbmVyZWcuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKaW5k
ZXggYzY3NjI3NWVhMGEwLi4wOWYwYWE5MmE0ZGEgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwpAQCAtNjEs
NiArNjEsNyBAQCBzdGF0aWMgY29uc3QgdW5zaWduZWQgbG9uZyBrdm1faXNhX2V4dF9hcnJbXSA9
IHsKIAlLVk1fSVNBX0VYVF9BUlIoWklISU5UTlRMKSwKIAlLVk1fSVNBX0VYVF9BUlIoWklISU5U
UEFVU0UpLAogCUtWTV9JU0FfRVhUX0FSUihaSUhQTSksCisJS1ZNX0lTQV9FWFRfQVJSKFpJTU9Q
KSwKIAlLVk1fSVNBX0VYVF9BUlIoWktORCksCiAJS1ZNX0lTQV9FWFRfQVJSKFpLTkUpLAogCUtW
TV9JU0FfRVhUX0FSUihaS05IKSwKQEAgLTE0Myw2ICsxNDQsNyBAQCBzdGF0aWMgYm9vbCBrdm1f
cmlzY3ZfdmNwdV9pc2FfZGlzYWJsZV9hbGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQogCWNhc2Ug
S1ZNX1JJU0NWX0lTQV9FWFRfWklISU5UTlRMOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWklI
SU5UUEFVU0U6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aSUhQTToKKwljYXNlIEtWTV9SSVND
Vl9JU0FfRVhUX1pJTU9QOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWktORDoKIAljYXNlIEtW
TV9SSVNDVl9JU0FfRVhUX1pLTkU6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aS05IOgotLSAK
Mi40NS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
