Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F4CC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 15:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrXGf4V+SUfS526+G6EVworOfyPCtDnpxG9VwyCk+a4=; b=n9+Wg4VTWwOeaT
	lakvO2W7fQ02+lBKwze8030ESak78bjdCfMgS4DD+LXyFktmZPSQCaLuVWm7PoMSeOZhlt2oCKjvP
	0fkIYtLFJB/UF91ojlpco8c42+BjnnwgINtsGY236ntxp6YexYZQTJZ4pHPcNfoFb9rs0GnbxrQFN
	uLBodXMnzbXPyVtGkf9EEg7EpImXF4aMEFBl9WYiUklqiNU9jhDWQnW6YsYLkaB5/uFrL4/x5DOgC
	1WqtTS7LgvfS6OTVexT4OYOgFxTOX9xMlchq/ZFhlT9woSszfOO0YoMI0LEMTpTAkRTBs53qNIE0Q
	OYvouFiHJT2WjqgoY1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sdm-00000003Ier-0wfd;
	Mon, 29 Apr 2024 15:10:02 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Sae-00000003GWZ-1DB8
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 15:06:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-516ced2f94cso1093249e87.1
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 08:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714403206; x=1715008006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCiDEygHIpDe3Ww8uIgQjb2MclVWFXcZkaD66mBe1pc=;
        b=DZPxIOVIVo6yCtl8UYEA8SqEDOt3gDRYiY65PHLlz02o7lLAi8MqhbTOrFwL6VaVO9
         n+f+IrD/iOQSPYyJEQVzz0mNxEXhny40CW00Acr+HwUaGFu/Uj2H/yja1pnpdzpUKhhi
         Y6j7U2dzOag1HIxpg3SkVvTF111zka1lps8n65dNUjrY+XQOaEVGp/M64q+aqoMLBoS3
         zntFZ+pBxZXELtN2sg8XsFgjj/mwHdmlzsTRmMjxcKfwIUrEcQ2w68plOeItuhol9cmW
         vOvZwqv9MUYTNeTVzohozB3goJ/4pwLvWlqXwNCKzltzutqlXq5L/LxlcfBZYrMCxyes
         jOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403206; x=1715008006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GCiDEygHIpDe3Ww8uIgQjb2MclVWFXcZkaD66mBe1pc=;
        b=jChD7pfUNP/tM0Ax7Vm0N+X/DVw6hkd3uAu6uDHUNcodBqNza8tYtuDGvNMVW0Cpn2
         wpAv6M6b6ApCol1OzIA3t8JgkRUj9WgmL9kEW4B9nnm5vvd/eCD4mz9KtqnRyEHWI2fe
         blkOMp0LPpuVkW5rXVRzIr+MMJM70mRroBEMm8j7Tnm6zq7oklY9+gPVbZx61NXEcyKY
         oYYBP85qDcuf+WOI4+Eo86RfTwEy1Zl0WYEIUGws+54Sq8WFepCesJ4tCDynCiFcK/0h
         VGN5VhTNkqEXinyhRsTW9FDiOoy045+hGz1Lu0gJnMO1fveb4URZVsW4PO1PwSWfRoG6
         VaFg==
X-Forwarded-Encrypted: i=1; AJvYcCU1JmovtSwrMvET/HgeapyvnnhBFIsc3fGIRN6F4Cw+EIinynmE0DxqYyNYYNu6sauSQAjn7fPcFCf3kUpTmMYc8QczGzoYtxmX3xXBJlvT
X-Gm-Message-State: AOJu0YxVYqJO/K6hQTkP8p6OwPF6Ivd4oVA7jd4F23PPe98ki0aaQ65V
	zR/f4GwTu63w3cN15l8ikfuD2F4vcu9CcuXGWGKvJYclxllbfrrTfz4Fzjhxojs=
X-Google-Smtp-Source: AGHT+IE3E1CESZ85tdfusGzp3Gx4J5COz1kqa8ttEMMgAMGJS6GXIwfFlC+IltwgNMfPv/k+OM7atQ==
X-Received: by 2002:ac2:4d8a:0:b0:51b:abbf:7585 with SMTP id g10-20020ac24d8a000000b0051babbf7585mr6945804lfe.5.1714403206709;
        Mon, 29 Apr 2024 08:06:46 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:2fec:d20:2b60:e334])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b00418f99170f2sm39646638wms.32.2024.04.29.08.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:06:46 -0700 (PDT)
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
Subject: [PATCH v4 10/11] RISC-V: KVM: Allow Zcmop extension for Guest/VM
Date: Mon, 29 Apr 2024 17:05:03 +0200
Message-ID: <20240429150553.625165-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429150553.625165-1-cleger@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080648_461172_302B8F8C 
X-CRM114-Status: UNSURE (   9.50  )
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
Vk0gdXNlciBzcGFjZQp0byBkZXRlY3QgYW5kIGVuYWJsZSBaY21vcCBleHRlbnNpb24gZm9yIEd1
ZXN0L1ZNLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMu
Y29tPgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KQWNrZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ci0tLQogYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oIHwgMSArCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jICAg
ICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9rdm0uaAppbmRleCA1N2RiM2ZlYTY3OWYuLjAzNjYzODlhMGJhZSAxMDA2NDQKLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS9rdm0uaApAQCAtMTcyLDYgKzE3Miw3IEBAIGVudW0gS1ZNX1JJU0NWX0lT
QV9FWFRfSUQgewogCUtWTV9SSVNDVl9JU0FfRVhUX1pDQiwKIAlLVk1fUklTQ1ZfSVNBX0VYVF9a
Q0QsCiAJS1ZNX1JJU0NWX0lTQV9FWFRfWkNGLAorCUtWTV9SSVNDVl9JU0FfRVhUX1pDTU9QLAog
CUtWTV9SSVNDVl9JU0FfRVhUX01BWCwKIH07CiAKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCmluZGV4IGEyNzQ3
YTZkYmRiNi4uNzdhMGQzMzdmYWViIDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29u
ZXJlZy5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKQEAgLTUyLDYgKzUyLDcg
QEAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGxvbmcga3ZtX2lzYV9leHRfYXJyW10gPSB7CiAJS1ZN
X0lTQV9FWFRfQVJSKFpDQiksCiAJS1ZNX0lTQV9FWFRfQVJSKFpDRCksCiAJS1ZNX0lTQV9FWFRf
QVJSKFpDRiksCisJS1ZNX0lTQV9FWFRfQVJSKFpDTU9QKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZB
KSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZIKSwKIAlLVk1fSVNBX0VYVF9BUlIoWkZITUlOKSwKQEAg
LTEzNiw2ICsxMzcsNyBAQCBzdGF0aWMgYm9vbCBrdm1fcmlzY3ZfdmNwdV9pc2FfZGlzYWJsZV9h
bGxvd2VkKHVuc2lnbmVkIGxvbmcgZXh0KQogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNCOgog
CWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNEOgogCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNG
OgorCWNhc2UgS1ZNX1JJU0NWX0lTQV9FWFRfWkNNT1A6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VY
VF9aRkE6CiAJY2FzZSBLVk1fUklTQ1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUklTQ1ZfSVNB
X0VYVF9aRkhNSU46Ci0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
