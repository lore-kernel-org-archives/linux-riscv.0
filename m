Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5162C369CF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SkDgcK6EEJyxvPg4gAbJD7CTpf6/BrPt4+43F8+CbL0=; b=XsndnWNwvJihvD
	+BMy2wygW6P9fIif5f15JhQEcxxHShQGn3k4Vv5DlDAN6dtPNWEoSZyJsbZoGZdsnv6bkUzWHut8V
	vYRmJXjQy4B8Zis7H+R8sqUT7OuybL3fGK79mhA7yzmuRL0QQRvu4E2Qp95K/npH/AbA/TRW1UUEM
	JjcetIb8hrEsdu6DM3vZIdbHe8fPcjNidrKzClJqNUqdO2pJ0XCN5VsU6/JaKFFFAD2L1dgmhjOUU
	MwKAk+0D9z36pZ9Uo1WXu0FoUz3b58jjBETIf8L098qKSd9CNBDaNkZpikx4+VUfsQGdJHILBb6qj
	xS4I6SuWirrJMRuTEjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTV-0000000CzAI-3668;
	Thu, 17 Apr 2025 12:36:13 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OIo-0000000Cvle-1yMS
	for linux-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:25:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2240b4de12bso10099615ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892710; x=1745497510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPTklWUDdxW6D5Ost9jmiUOVbTQmyFTBQdSARUhAxLU=;
        b=vkyC4GpEovjoZx8wJ3GceT/kRvk13Sy3jlbvm3J8vMUBrxn2X4KnfC2731CsRCYh7C
         xc6ZAgnwYqYlaFeCI6mnpITAQQyiTma0WLypiF5zBUN+4k+tzVImPh/D043AxH2qc5PS
         l3bsip5kXTnh/221581DznZTElhhRQrcW/bPr6rVWACjSwhkXelET8yJVQYqX9YsIdIQ
         C5y+cbzRG4BO38R3MsgkT3FSu3wbk3RxzyMpIb3hV7HrNOdayYm9Cijxf/k+fdN4JBZE
         iU6/GTzR00KNYUzwSb3SCcp1BFuyVbw3tPhZxsv4yCyBhZ1u26Ypc35aG/tGd4aiW7Hv
         MdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892710; x=1745497510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPTklWUDdxW6D5Ost9jmiUOVbTQmyFTBQdSARUhAxLU=;
        b=sjh5+cYZZcr3lDdIzqWs9ropudEK1eDB6Qt4tSnmIGa705RyiJYfrMRJHq3k6XRnvr
         tPByUx2hbMqWNOlplWq1ZgfLj8vKRVxJu+iOnfmSZkKrSS2pG9pzG5S+ss+ouKq2EyHu
         EJC0hnWLMclc+fE0nOkkP0weF5WuvitBmg+O3JGkmLpQL/NhjiQ5C8BSLGUnvdcc4AOZ
         NojnJvtNGEKDd5Cpi87sVWBXH9RjIx1IwB7E7HwFCO6QcGqh/FHJGAPSk5x3vp+Ud38g
         PvF6lSaHgOnmX1BwxWI3+qB0zrQNRins2OaCsKu3DAC4/9+uhhW7KCmoEtEDbnNUKNKP
         TULQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu2Vshv8L/VAtHwRc/DFoLorXGkyx8gwVGiUZZCZKt4hUA/u4/ZIItqZB+KTA+cZTX2EAxdhMqItko7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVB8iLqakz70cXfbdC9rgcBgt6v3NhJRVoVXqCFTvIWeL3sT1y
	UYkz+jhRfgjEGT0yYhz5sldAlLu24YCG/r0erSVlQn9xfpvJGna9YlDpJ+N7jxs=
X-Gm-Gg: ASbGncvMalbnAkgPs4pvsJJuT041yMoB0rkQLFyQYOoO8CU0RBCfJCbGZnVpMWbQDQJ
	Tp8Co31GJNhuKx8/tJq3SCh20fH1VuwzU5EdAbFQT1FElM0Me6lpx6Su3GwCs6aop4/uA0EhAuG
	UrSIHqXTHL1Y47XO5DouTHr0qn+fEYu7MAaw4oVoq6pdkjZqTz7Slv9/2vg1+SG6fzuN7XMHyZi
	KZ3KXZUJqpBcv5OqL1anoAp/IPMHjRZEfcdwGchYKNtfoQndTmWuMhL1VAH6VxGBXvhETqZ92Ya
	s0fA4ixna0n4hyEdRI190hE8+UGAZe1559N+FV0sVw==
X-Google-Smtp-Source: AGHT+IFHVZ6ZCfLmCo/4Wa4FBs9EaC8NbnVck/zV+hCmYDXn9aie+ex4Lrhj5kJpm3i3DZVuvfUSqQ==
X-Received: by 2002:a17:903:2a85:b0:229:1717:8812 with SMTP id d9443c01a7336-22c357b1125mr88299155ad.0.1744892709956;
        Thu, 17 Apr 2025 05:25:09 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:09 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 08/13] riscv: misaligned: move emulated access uniformity check in a function
Date: Thu, 17 Apr 2025 14:19:55 +0200
Message-ID: <20250417122337.547969-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052510_506472_BCB36BE7 
X-CRM114-Status: GOOD (  11.12  )
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

U3BsaXQgdGhlIGNvZGUgdGhhdCBjaGVjayBmb3IgdGhlIHVuaWZvcm1pdHkgb2YgbWlzYWxpZ25l
ZCBhY2Nlc3NlcwpwZXJmb3JtYW5jZSBvbiBhbGwgY3B1cyBmcm9tIGNoZWNrX3VuYWxpZ25lZF9h
Y2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMoKQp0byBpdHMgb3duIGZ1bmN0aW9uIHdoaWNoIHdpbGwg
YmUgdXNlZCBmb3IgZGVsZWdhdGlvbiBjaGVjay4gTm8KZnVuY3Rpb25hbCBjaGFuZ2VzIGludGVu
ZGVkLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29t
PgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0t
CiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAxOCArKysrKysrKysrKysr
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwppbmRleCBjOTlkM2MwNWYzNTYuLmEwMDA3
NTUyZTdhNSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5j
CisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYwpAQCAtNjY2LDEwICs2
NjYsMjAgQEAgc3RhdGljIGludCBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11
bGF0ZWQodW5zaWduZWQgaW50IGNwdSkKIAlyZXR1cm4gMDsKIH0KIAotYm9vbCBfX2luaXQgY2hl
Y2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZF9hbGxfY3B1cyh2b2lkKQorc3RhdGljIGJvb2wg
YWxsX2NwdXNfdW5hbGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQodm9pZCkKIHsKIAlpbnQg
Y3B1OwogCisJZm9yX2VhY2hfb25saW5lX2NwdShjcHUpCisJCWlmIChwZXJfY3B1KG1pc2FsaWdu
ZWRfYWNjZXNzX3NwZWVkLCBjcHUpICE9CisJCSAgICBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
U0NBTEFSX0VNVUxBVEVEKQorCQkJcmV0dXJuIGZhbHNlOworCisJcmV0dXJuIHRydWU7Cit9CisK
K2Jvb2wgX19pbml0IGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXModm9p
ZCkKK3sKIAkvKgogCSAqIFdlIGNhbiBvbmx5IHN1cHBvcnQgUFJfVU5BTElHTiBjb250cm9scyBp
ZiBhbGwgQ1BVcyBoYXZlIG1pc2FsaWduZWQKIAkgKiBhY2Nlc3NlcyBlbXVsYXRlZCBzaW5jZSB0
YXNrcyByZXF1ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQpAQCAtNjc3LDEwICs2
ODcsOCBAQCBib29sIF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9j
cHVzKHZvaWQpCiAJICovCiAJb25fZWFjaF9jcHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVs
YXRlZCwgTlVMTCwgMSk7CiAKLQlmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkKLQkJaWYgKHBlcl9j
cHUobWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSkKLQkJICAgICE9IFJJU0NWX0hXUFJPQkVf
TUlTQUxJR05FRF9TQ0FMQVJfRU1VTEFURUQpCi0JCQlyZXR1cm4gZmFsc2U7CisJaWYgKCFhbGxf
Y3B1c191bmFsaWduZWRfc2NhbGFyX2FjY2Vzc19lbXVsYXRlZCgpKQorCQlyZXR1cm4gZmFsc2U7
CiAKIAl1bmFsaWduZWRfY3RsID0gdHJ1ZTsKIAlyZXR1cm4gdHJ1ZTsKLS0gCjIuNDkuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
