Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AE3C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 00:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9DGfU2LAYi9xUmWGZBVnkyQNplSZ1iMF81G6Jng2Fs=; b=HGPIDwq7JnJOYU
	i0coSgnd+Li//So9yI75u/Uc65vJKSYsKmv24S5AXei24rpM8oIMHw821Z8+ZBDOFdgGXtNKWAXHl
	Qeq6jGwsBJaCp5eIWIaFMlK6M36RmC7qmKuFDoDSy36XVrx2ksdXrDuS9vfT0+qDcG1qRQF5bX1cE
	ztaxzTE7kMeiqZRBvC2mT2B/r5XEt0iC5jUlLGM7xu3ybIJNWZaOgEz1gIBCSfIE73PEN8oO1mLFw
	cz5quP2JbLv5vEOg0V4365/8zPBueiVGdCBupxBgHdgd9iFixpsjYDFTsbcVPteXHasbw+kh3g4xL
	cZtRb/3tS/qn6MmxYvdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK6Se-004cVH-2a;
	Fri, 14 Jul 2023 00:15:04 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK6Sb-004cSe-0r
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 00:15:02 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-668704a5b5bso1339710b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 17:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689293700; x=1689898500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WogNqZmM5qIDEUwvyRv9RC9FRo2r68Wx4DIsyw3FtoM=;
        b=scmvmusinfT3X+K4TbCSiNrHD6GpfF3g/xu+9lahYYjU4ktFpp9PuohAB7wYjo2/7I
         /Mw7Dgl25dGudOqR4ayvcdQwHPhIOUDVymcob+uLiwh7kXLYl9glDGllZn9xoAMoP1is
         JCHFj5AIY7Nq6ca/fp7M1KmHBu5NUIQcKKnZx+xUDj2awa23VFRB8c4lTb/leJGEhfER
         4S0RS8ULwsXWaVxCTPqOQTgpYI4hHeBp8dZ5ZB4/0RGM+X4cJLHMcheFvejUGBiL9t9M
         gCwPO8pH+w5DPvkfsvoLXokFvSLh0QIFcQB6sb4P+NguJuj4IrWxEgEI6vt33bo0OBbj
         FTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689293700; x=1689898500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WogNqZmM5qIDEUwvyRv9RC9FRo2r68Wx4DIsyw3FtoM=;
        b=bZPf0ZQ3gNr2F1Y97xqlRgjdfNvV+UjmmWoKa3wgCHYnIUt5RaWNV4YDsePWYyH55E
         uPK8Cp+uCy60/YOIoww+K832uXwhMETQi90AW+T1UshtpmiSaxT5l3gnwxShiebsujyo
         I1T7khoZD6hKKaMuhFfrt6pqb+QCuUp34qobM+qjngufaRJh8gDkruTiGjmvP3Pp5BxT
         nIJwOZ+1lGQIypH7flg8pEnh+lFPz3y3c+W5SfgNx2bfGJfRdSM/Rco/5v80tRPXW+9y
         Gm7DDtxwosH4gDBsBQgaK0u+aSEtC2IerhllfLDTrGATbzJ52CYf1bBlHEqK8TYohnrS
         G4Kg==
X-Gm-Message-State: ABy/qLYHAn03RUIepVoDxGuPdlPwb0fZcywdyBiti2ovLRhiu/mA2FfI
	ldwopGQKcA1XbCNFFdly03E9JQ==
X-Google-Smtp-Source: APBJJlF99rw3p+D/V7h80wItL1ogt7q2SWOZln6YuZpHDidkN54eC97ZWfBnsDKm67js+3dBZPQKGw==
X-Received: by 2002:a05:6a20:1445:b0:130:52c5:5123 with SMTP id a5-20020a056a20144500b0013052c55123mr3737553pzi.3.1689293699862;
        Thu, 13 Jul 2023 17:14:59 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x25-20020aa793b9000000b00673e652985esm5938107pff.44.2023.07.13.17.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 17:14:59 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
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
Subject: [PATCH v5 3/4] RISC-V: mm: Update pgtable comment documentation
Date: Thu, 13 Jul 2023 17:14:02 -0700
Message-ID: <20230714001430.75798-4-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714001430.75798-1-charlie@rivosinc.com>
References: <20230714001430.75798-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_171501_305519_A1090665 
X-CRM114-Status: UNSURE (   9.21  )
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
Yy5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggfCA4ICsrKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmgKaW5kZXggZTEzZjU4NzJiZmU5Li4yODY2MGJhYjc1NGMgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCisrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCkBAIC04NDAsMTQgKzg0MCwxNiBAQCBzdGF0aWMgaW5saW5l
IHB0ZV90IHB0ZV9zd3BfY2xlYXJfZXhjbHVzaXZlKHB0ZV90IHB0ZSkKICAqIFRhc2sgc2l6ZSBp
cyAweDQwMDAwMDAwMDAgZm9yIFJWNjQgb3IgMHg5ZmMwMDAwMCBmb3IgUlYzMi4KICAqIE5vdGUg
dGhhdCBQR0RJUl9TSVpFIG11c3QgZXZlbmx5IGRpdmlkZSBUQVNLX1NJWkUuCiAgKiBUYXNrIHNp
emUgaXM6Ci0gKiAtICAgICAweDlmYzAwMDAwICh+Mi41R0IpIGZvciBSVjMyLgotICogLSAgIDB4
NDAwMDAwMDAwMCAoIDI1NkdCKSBmb3IgUlY2NCB1c2luZyBTVjM5IG1tdQotICogLSAweDgwMDAw
MDAwMDAwMCAoIDEyOFRCKSBmb3IgUlY2NCB1c2luZyBTVjQ4IG1tdQorICogLSAgICAgICAgMHg5
ZmMwMDAwMAkofjIuNUdCKSBmb3IgUlYzMi4KKyAqIC0gICAgICAweDQwMDAwMDAwMDAJKCAyNTZH
QikgZm9yIFJWNjQgdXNpbmcgU1YzOSBtbXUKKyAqIC0gICAgMHg4MDAwMDAwMDAwMDAJKCAxMjhU
QikgZm9yIFJWNjQgdXNpbmcgU1Y0OCBtbXUKKyAqIC0gMHgxMDAwMDAwMDAwMDAwMDAJKCAgNjRQ
QikgZm9yIFJWNjQgdXNpbmcgU1Y1NyBtbXUKICAqCiAgKiBOb3RlIHRoYXQgUEdESVJfU0laRSBt
dXN0IGV2ZW5seSBkaXZpZGUgVEFTS19TSVpFIHNpbmNlICJSSVNDLVYKICAqIEluc3RydWN0aW9u
IFNldCBNYW51YWwgVm9sdW1lIElJOiBQcml2aWxlZ2VkIEFyY2hpdGVjdHVyZSIgc3RhdGVzIHRo
YXQKICAqICJsb2FkIGFuZCBzdG9yZSBlZmZlY3RpdmUgYWRkcmVzc2VzLCB3aGljaCBhcmUgNjRi
aXRzLCBtdXN0IGhhdmUgYml0cwogICogNjPigJM0OCBhbGwgZXF1YWwgdG8gYml0IDQ3LCBvciBl
bHNlIGEgcGFnZS1mYXVsdCBleGNlcHRpb24gd2lsbCBvY2N1ci4iCisgKiBTaW1pbGFybHkgZm9y
IFNWNTcsIGJpdHMgNjPigJM1NyBtdXN0IGJlIGVxdWFsIHRvIGJpdCA1Ni4KICAqLwogI2lmZGVm
IENPTkZJR182NEJJVAogI2RlZmluZSBUQVNLX1NJWkVfNjQJKFBHRElSX1NJWkUgKiBQVFJTX1BF
Ul9QR0QgLyAyKQotLSAKMi40MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
