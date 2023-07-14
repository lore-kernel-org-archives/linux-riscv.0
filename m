Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C672EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9DGfU2LAYi9xUmWGZBVnkyQNplSZ1iMF81G6Jng2Fs=; b=NeWNcknd82oLaO
	m0wcyHlyFooRXrvndLnjo5UTW7uj2sI0dzCKe6niLsRdrfIzkKFfUxxjqeLsbejkdmND3bVvkqy67
	TIImLNVekg28d7KoXg6FzIAyYj66e/a65Msbk1CEC10zgvlg/mGqV/VObLx0Cr3cSFptp9iE0Fp3z
	qpwN6HTf4tGLPduzUIXJZkSRFp2PPxhBkisWB51vCIWaIqOb4XbO39lM8fKBbUW/7fHL+0BLsIGub
	uB7MVQSqBQMGaE5SLsXACLhftees/V3FF93ujgqC6omz9NMG4ch/b5hBVL7GG1S4KDVhd81y3y418
	vaJ+DQf1ZthgRitZW8+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKM5Q-006hcF-27;
	Fri, 14 Jul 2023 16:56:08 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKM5L-006hU6-1D
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 16:56:06 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-66c729f5618so2060113b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689353759; x=1689958559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WogNqZmM5qIDEUwvyRv9RC9FRo2r68Wx4DIsyw3FtoM=;
        b=0OBaa8eGB7H0rgB6atdvkGk65g6hngFNmUyQKFx3pt0cyXW/YlErSR1NFqPJjQVIBn
         Qbx2cPxubOqOi6CSq5mhghxg0+jKeUjUth4gkGEcm1phj0JCTkUT4Z0lC3uJHMPft2S9
         cPfIhhdmeOpgAr3dJxiUolv0aIchuoAsBArXrM1/wxA34E4mOly1ZMEShAAkToUUbVKM
         T+UDmYWmaiy+RMU7RefKaOVjxXWMIriJy9dkCKzFl17rP0lW4tlkFRkQ312UxNQYk2ZT
         R+0aW+ORT+YA+DbgWTkxGEBc255W3YFG1qbu5NQulHcux6fpsOtYFyHkWoDqKBUEUQsz
         f9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689353759; x=1689958559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WogNqZmM5qIDEUwvyRv9RC9FRo2r68Wx4DIsyw3FtoM=;
        b=SXdsOXlFfvrOoytWhO7FpuHuwz0HVGzXgMUCe3z7O3lQgpA+MQJQ6rqpuTRPafoPHN
         jySThnHReBvMwLCy0/+euqyuiznMIfL3r+0RxeqGrvIN6JcbEeksF/KvqdZ3feNu9n6C
         4IGUAk3rUNOiJnKtgfOb7DExIC8FNNqaLfQLFjJ2m0OZ25YQhEo5BH1NG6F4xWleVRRE
         0P/gASmwfzNovT6pNzsMp86YARlcwn4nA54Y8Ddwz/tP8ek0zdzdPJ/IUrUiLYE18/fs
         8iCymGE5lIeY2+eC42I79zEiv4H9s9O+EQbAFAPOccXVfctYpKYFsip+ExKhGyi6CmAw
         kFVg==
X-Gm-Message-State: ABy/qLYCORVBy0zAIGHTovG9BaSFnqRfyEOFgNLtVXx9DvC/pkEvhUrl
	PxURTL4Jrqd9whAGZQJT8rvbAlHu4oqbGeJLuKI=
X-Google-Smtp-Source: APBJJlFI//JCJ/vZz+Q9PwxyNeL/qKz+QPWaKPFke/aicziyFeQBMzZv9VLqcfrN88UuwdEdg68umg==
X-Received: by 2002:a05:6a20:639e:b0:133:ee16:5677 with SMTP id m30-20020a056a20639e00b00133ee165677mr1028643pzg.59.1689353759643;
        Fri, 14 Jul 2023 09:55:59 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902b18800b001b694140d96sm8008081plr.170.2023.07.14.09.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 09:55:59 -0700 (PDT)
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
Subject: [PATCH v6 3/4] RISC-V: mm: Update pgtable comment documentation
Date: Fri, 14 Jul 2023 09:54:51 -0700
Message-ID: <20230714165508.94561-4-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714165508.94561-1-charlie@rivosinc.com>
References: <20230714165508.94561-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_095603_429498_E78F55B5 
X-CRM114-Status: UNSURE (   9.41  )
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
