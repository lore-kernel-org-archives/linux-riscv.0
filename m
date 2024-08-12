Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008FBC52D7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 01:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0EaYGpYBenPXDKsozAtEBG6XpHeGjLsLTMkK9CHP2Q=; b=Qc6wuO92XnnSAt
	KQvaDl6GbarZL3Ygu3B9xGtwQ5HJdF1X1vpK2szn3n+2W0Yc3ux42aQE0I59EqWmfiSIJVmnvdhDV
	CNVCoWbUlyeAhdnhQMe0ljo7VoqEgh6oy49gUr7gMOkKKwH6jABtbnPVtm50JDIMOs1KwAPhWdtrq
	+zh7up44PQCPU+aEVrb4S93aaeH8rTTbDmL1UY4malecoSfrukRr5zXl03+gy800PWWCEAshYYSL8
	h6BtNPb0W9KQpK6u9CMimza40nCV2vKvV+vGnrDS8qiMXXgmEgyB82V5sAKsDDCfC1UwHTEIDMl3m
	TNSP3skNImaNjkvV6quQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJRR-0000000Gagc-3kPy;
	Mon, 12 Aug 2024 01:01:45 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdJPl-0000000GZvh-10Z7
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 01:00:02 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-70942ebcc29so2689470a34.0
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 18:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723424400; x=1724029200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH+4pIB9prP9kOEprexbBfphBFyJQXg0yq2xsmagq1s=;
        b=fsHg+BNGa4pU0EbwsuGDK9Dbd7Jx+VUmA6ZothC+3Ns3J5+fyjlsqN4N/KlGcUP1im
         NLKwLTaihUthRFk8rdYUuzguMJSfQxDKU4MQOWWX2UQNUZSwghBG7khNXD8RXNnPkstt
         rqzrLyRgvUkw2dr12YLe/S5ZOAXMPcSdVl05+R+vtGgsaB7KGPd2s2ZLir4IEPpVhdbu
         Z+q177XahcMYUV2SFYFfwi8O+9otEEQKHrXdsQNjDBlvkYKizw4E00wEJdPzMwsgxosm
         qqgB2VQ4EDa6scjfjez1bvq/I5fx9aq/W+gAPjq8RvQLjHuxysJ6/045Q7ec5gqDt47/
         aAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723424400; x=1724029200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kH+4pIB9prP9kOEprexbBfphBFyJQXg0yq2xsmagq1s=;
        b=siB3SGP1EKdbLhwE0kdvFcO2ZXtWOPG4lcbg3Z8T+VRL5XoFIQZoymGqzi9H7scqNg
         YToggrKL/gukvk6nTHWRejn7NxBxlXieyoM17vlnYuNaTBJ1Rj8VOmNMJnTGkQJNHlJQ
         ZD1WH07nn6tNeE0VPq9IAy9If8nS3sESbCqH/h7IVGqDzHdlzxCjiEheVir3hAk9EyZ2
         bF6i+hdJzLxle6z3AZNLuNzMlZmp8CSDoAl2QHltMcOvSCTSmZYIbJ7SoJz2UQzILq4X
         +ghfRzeVFCMTPDPCl1/Z//zGkABdaUb/0o44W6FBlOmCdkoM2F4++ENj0ka8QqvWnyZu
         CssQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlEAiYsThgyPvs08adNMHgGdHd18qMfvPZGu+8mHLxkhzyA/ylO4cAYSvvuR2SM40CQZvajoU2tipUbxY4Zx+r59jnakL9Gm73miLk4F2i
X-Gm-Message-State: AOJu0YxaoocbbmHCikoeBJk/tfS/RmtbkHgODIy8PtzzuggVUeGAq3hd
	cB+RyOCNEVlcbmQDcEPN8IVmNFb8Wo26Pn82w2/+qqQarfgLEl1JT6n9eiLcVfE=
X-Google-Smtp-Source: AGHT+IHrAlknP9L5C6h6kRrSytyVyD8ukh4CBeZCWs5vO7PGS1mxPUN26YUu6El93VBg0yE0hzkTrQ==
X-Received: by 2002:a05:6830:6c0f:b0:708:8c07:c646 with SMTP id 46e09a7af769-70b748745c5mr11624369a34.33.1723424400027;
        Sun, 11 Aug 2024 18:00:00 -0700 (PDT)
Received: from sunil-pc.tail07344b.ts.net ([106.51.198.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c3dbe8cbdcsm3074062a12.61.2024.08.11.17.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 17:59:59 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v8 03/17] ACPI: bus: Add acpi_riscv_init() function
Date: Mon, 12 Aug 2024 06:29:15 +0530
Message-ID: <20240812005929.113499-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812005929.113499-1-sunilvl@ventanamicro.com>
References: <20240812005929.113499-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_180001_316799_47428D16 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Robert Moore <robert.moore@intel.com>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Drew Fustini <dfustini@tenstorrent.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="cp1252"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

QWRkIGEgbmV3IGZ1bmN0aW9uIGZvciBSSVNDLVYgdG8gZG8gYXJjaGl0ZWN0dXJlIHNwZWNpZmlj
IGluaXRpYWxpemF0aW9uCnNpbWlsYXIgdG8gYWNwaV9hcm1faW5pdCgpLiBTb21lIG9mIHRoZSBB
Q1BJIHRhYmxlcyBhcmUgYXJjaGl0ZWN0dXJlCnNwZWNpZmljIGFuZCB0aGVyZSBpcyBubyByZWFz
b24gdHJ5aW5nIHRvIGZpbmQgdGhlbSBvbiBvdGhlcgphcmNoaXRlY3R1cmVzLiBTbywgYWRkIGFj
cGlfcmlzY3ZfaW5pdCgpIHNpbWlsYXIgdG8gYWNwaV9hcm1faW5pdCgpLgoKU2lnbmVkLW9mZi1i
eTogU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+ClRlc3RlZC1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgotLS0KIGRyaXZlcnMvYWNwaS9idXMuYyAgICAg
ICAgICB8ICAxICsKIGRyaXZlcnMvYWNwaS9yaXNjdi9NYWtlZmlsZSB8ICAyICstCiBkcml2ZXJz
L2FjcGkvcmlzY3YvaW5pdC5jICAgfCAxMSArKysrKysrKysrKwogaW5jbHVkZS9saW51eC9hY3Bp
LmggICAgICAgIHwgIDYgKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2FjcGkvcmlzY3YvaW5p
dC5jCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL2J1cy5jIGIvZHJpdmVycy9hY3BpL2J1cy5j
CmluZGV4IDI4NGJjMmUwMzU4MC4uNDhkMjc3NjU3MjAzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Fj
cGkvYnVzLmMKKysrIGIvZHJpdmVycy9hY3BpL2J1cy5jCkBAIC0xNDU5LDYgKzE0NTksNyBAQCBz
dGF0aWMgaW50IF9faW5pdCBhY3BpX2luaXQodm9pZCkKIAlhY3BpX2hlc3RfaW5pdCgpOwogCWFj
cGlfZ2hlc19pbml0KCk7CiAJYWNwaV9hcm1faW5pdCgpOworCWFjcGlfcmlzY3ZfaW5pdCgpOwog
CWFjcGlfc2Nhbl9pbml0KCk7CiAJYWNwaV9lY19pbml0KCk7CiAJYWNwaV9kZWJ1Z2ZzX2luaXQo
KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9yaXNjdi9NYWtlZmlsZSBiL2RyaXZlcnMvYWNw
aS9yaXNjdi9NYWtlZmlsZQppbmRleCA4NmIwOTI1ZjYxMmQuLjg3N2RlMDBkMWI1MCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9hY3BpL3Jpc2N2L01ha2VmaWxlCisrKyBiL2RyaXZlcnMvYWNwaS9yaXNj
di9NYWtlZmlsZQpAQCAtMSw0ICsxLDQgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seQotb2JqLXkJCQkJCSs9IHJoY3Qubworb2JqLXkJCQkJCSs9IHJoY3QubyBpbml0
Lm8KIG9iai0kKENPTkZJR19BQ1BJX1BST0NFU1NPUl9JRExFKQkrPSBjcHVpZGxlLm8KIG9iai0k
KENPTkZJR19BQ1BJX0NQUENfTElCKQkJKz0gY3BwYy5vCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Fj
cGkvcmlzY3YvaW5pdC5jIGIvZHJpdmVycy9hY3BpL3Jpc2N2L2luaXQuYwpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmE4NzVhNzZhYTQ0YwotLS0gL2Rldi9udWxsCisr
KyBiL2RyaXZlcnMvYWNwaS9yaXNjdi9pbml0LmMKQEAgLTAsMCArMSwxMSBAQAorLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQorLyoKKyAqIENvcHlyaWdodCAoQykgMjAy
My0yMDI0LCBWZW50YW5hIE1pY3JvIFN5c3RlbXMgSW5jCisgKglBdXRob3I6IFN1bmlsIFYgTCA8
c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPgorICovCisKKyNpbmNsdWRlIDxsaW51eC9hY3BpLmg+
CisKK3ZvaWQgX19pbml0IGFjcGlfcmlzY3ZfaW5pdCh2b2lkKQoreworfQpkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9hY3BpLmggYi9pbmNsdWRlL2xpbnV4L2FjcGkuaAppbmRleCAzZmZmODZm
OTVjMmYuLjg5MjAyNWQ4NzNmMCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9hY3BpLmgKKysr
IGIvaW5jbHVkZS9saW51eC9hY3BpLmgKQEAgLTE1MzEsNiArMTUzMSwxMiBAQCB2b2lkIGFjcGlf
YXJtX2luaXQodm9pZCk7CiBzdGF0aWMgaW5saW5lIHZvaWQgYWNwaV9hcm1faW5pdCh2b2lkKSB7
IH0KICNlbmRpZgogCisjaWZkZWYgQ09ORklHX1JJU0NWCit2b2lkIGFjcGlfcmlzY3ZfaW5pdCh2
b2lkKTsKKyNlbHNlCitzdGF0aWMgaW5saW5lIHZvaWQgYWNwaV9yaXNjdl9pbml0KHZvaWQpIHsg
fQorI2VuZGlmCisKICNpZmRlZiBDT05GSUdfQUNQSV9QQ0MKIHZvaWQgYWNwaV9pbml0X3BjYyh2
b2lkKTsKICNlbHNlCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
