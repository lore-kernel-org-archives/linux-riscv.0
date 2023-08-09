Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450D5C001DE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 23:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HEWyUGQaxEkBLkatv63qBe4kbQSlNhfMvF1kUcw9kM=; b=ZCeB8+frc1EDqd
	HJ8xwOmGgKwo0QHjOTeVfw6SB30eqOZpPbxVW4mc87KyIZuOO6rtfWSWwg2+petKIvGUqjvKAfTce
	eDvWpSFb3duW+VvkeGHzA6KoC5eUmDp1QbdEbtAnEkw0g6iLSXeTfVtA/F/QQ4aA6ZRsldrUX4OGK
	a9TZP2051jENZUWaXDuU/U/JwkvA+plyqpMVwvsZWrynNJnAjNcXJz0ZxKMUs3azKdj3O1XFvY12g
	5hwZ9AL+uL0oprDXcdokLQO/FJb3WZlXrZ4LRUOknIc+BhBIMIkK1eiLtFUWr33ZVmYos38oomBrz
	Cde63xS5ph2T9FfIHdMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTsXV-0063ZB-2G;
	Wed, 09 Aug 2023 23:24:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTsXS-0063WW-1F
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 23:24:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bbc64f9a91so3769915ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 16:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691623465; x=1692228265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZ0IVnzj5yL9SoUKLkLsC9JEkQ8y1OJuZ3kbIa3etj8=;
        b=DPqz69bvmOi0drz5sANCyS+ejDOE4tK2aPT6CgqMeO23pKOSYzYTRtQqX2sUrjiJmC
         RrSZUkbRkQCVs7wzIENC1wePmX11ZnFj1kEpsCllQfjH8OdDSh+ynaBkruLDhKbxi/y7
         hNKWT+H9FuM6BoaCv58BuAIhRmwJFzvP7uVm9tr4dtvvEe/YDApQvNm32rOzdMYd7vlm
         L6nJ3tcaqJbaF9pxp0H0xccKqzMXdCN5FaL8hF9CFS4XTf6Avl0vGc+i3JB23oEo+UYb
         B70BdpKfpKDQSAPKlmFJOXdwGmfAe0rv+GpuSvzqq6Fu2b/L19mwtUPiLUPiPFcaAgxf
         UibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691623465; x=1692228265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZ0IVnzj5yL9SoUKLkLsC9JEkQ8y1OJuZ3kbIa3etj8=;
        b=RJfyitMTs57dF3ZdFpowH9g8NakAMlAggTRi0QQwbdf6KBhtygUikzMSOl1YBqHKTw
         lc4xxkEFQM2l8vWHoVI+pMhWHkslz/2XPHMajzIXQpEKXaLg8xpq8lM3InE7Q9TTRWKB
         MbYWqbBKw+zhC+qDybsqHeYVqaadDEYDGgxk1OxI9JKerStSW4nOozdIcJj9PtRy4pC+
         Xaeq+VLFYV6A1LRRsBkstWLNqDy1h3J28szPS6IPooV1GA/WrPl5Gl83xD+B3Sf99XLN
         aNGw8jkWgHpDOysHs4FWsdDJBvSfhYZPrqCI6KWCIosyEkrms+EHth1RnYvGyiKKtQDc
         FByA==
X-Gm-Message-State: AOJu0YyP5thhBHM5vf85MiIehPykwEQAo84IbJ90wNPTe8O+dfBrGen4
	WrIuhrZ//m6tkw2syW/rxi0HMwYV9hRCLJUfI4Q=
X-Google-Smtp-Source: AGHT+IGNqJdWSYMcQx8TPRNJ4iYLWH440g3FftcqWpJUU1qXCbGZJ1xpxGkgBJ1xgrmbxMZywlEjtw==
X-Received: by 2002:a17:903:110f:b0:1b8:b5f8:c485 with SMTP id n15-20020a170903110f00b001b8b5f8c485mr741164plh.50.1691623465574;
        Wed, 09 Aug 2023 16:24:25 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902d35200b001b54d064a4bsm82765plk.259.2023.08.09.16.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 16:24:25 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: charlie@rivosinc.com,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@rivosinc.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	konstantin@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mick@ics.forth.gr,
	jrtc27@jrtc27.com,
	rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: [PATCH v10 3/4] RISC-V: mm: Update pgtable comment documentation
Date: Wed,  9 Aug 2023 16:22:03 -0700
Message-ID: <20230809232218.849726-4-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809232218.849726-1-charlie@rivosinc.com>
References: <20230809232218.849726-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_162426_474310_99FC57BA 
X-CRM114-Status: UNSURE (   9.58  )
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

c3Y1NyBpcyBzdXBwb3J0ZWQgaW4gdGhlIGtlcm5lbCBzbyBwZ3RhYmxlLmggc2hvdWxkIHJlZmxl
Y3QgdGhhdC4KClNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2lu
Yy5jb20+ClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5j
b20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCA4ICsrKysrLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmgKaW5kZXggYmIwYjlhYzdiNTgxLi4yYzVmNmM4ZWRjOGEgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCkBAIC04NTEsMTQgKzg1MSwxNiBAQCBzdGF0aWMgaW5saW5lIHB0
ZV90IHB0ZV9zd3BfY2xlYXJfZXhjbHVzaXZlKHB0ZV90IHB0ZSkKICAqIFRhc2sgc2l6ZSBpcyAw
eDQwMDAwMDAwMDAgZm9yIFJWNjQgb3IgMHg5ZmMwMDAwMCBmb3IgUlYzMi4KICAqIE5vdGUgdGhh
dCBQR0RJUl9TSVpFIG11c3QgZXZlbmx5IGRpdmlkZSBUQVNLX1NJWkUuCiAgKiBUYXNrIHNpemUg
aXM6Ci0gKiAtICAgICAweDlmYzAwMDAwICh+Mi41R0IpIGZvciBSVjMyLgotICogLSAgIDB4NDAw
MDAwMDAwMCAoIDI1NkdCKSBmb3IgUlY2NCB1c2luZyBTVjM5IG1tdQotICogLSAweDgwMDAwMDAw
MDAwMCAoIDEyOFRCKSBmb3IgUlY2NCB1c2luZyBTVjQ4IG1tdQorICogLSAgICAgICAgMHg5ZmMw
MDAwMAkofjIuNUdCKSBmb3IgUlYzMi4KKyAqIC0gICAgICAweDQwMDAwMDAwMDAJKCAyNTZHQikg
Zm9yIFJWNjQgdXNpbmcgU1YzOSBtbXUKKyAqIC0gICAgMHg4MDAwMDAwMDAwMDAJKCAxMjhUQikg
Zm9yIFJWNjQgdXNpbmcgU1Y0OCBtbXUKKyAqIC0gMHgxMDAwMDAwMDAwMDAwMDAJKCAgNjRQQikg
Zm9yIFJWNjQgdXNpbmcgU1Y1NyBtbXUKICAqCiAgKiBOb3RlIHRoYXQgUEdESVJfU0laRSBtdXN0
IGV2ZW5seSBkaXZpZGUgVEFTS19TSVpFIHNpbmNlICJSSVNDLVYKICAqIEluc3RydWN0aW9uIFNl
dCBNYW51YWwgVm9sdW1lIElJOiBQcml2aWxlZ2VkIEFyY2hpdGVjdHVyZSIgc3RhdGVzIHRoYXQK
ICAqICJsb2FkIGFuZCBzdG9yZSBlZmZlY3RpdmUgYWRkcmVzc2VzLCB3aGljaCBhcmUgNjRiaXRz
LCBtdXN0IGhhdmUgYml0cwogICogNjPigJM0OCBhbGwgZXF1YWwgdG8gYml0IDQ3LCBvciBlbHNl
IGEgcGFnZS1mYXVsdCBleGNlcHRpb24gd2lsbCBvY2N1ci4iCisgKiBTaW1pbGFybHkgZm9yIFNW
NTcsIGJpdHMgNjPigJM1NyBtdXN0IGJlIGVxdWFsIHRvIGJpdCA1Ni4KICAqLwogI2lmZGVmIENP
TkZJR182NEJJVAogI2RlZmluZSBUQVNLX1NJWkVfNjQJKFBHRElSX1NJWkUgKiBQVFJTX1BFUl9Q
R0QgLyAyKQotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
