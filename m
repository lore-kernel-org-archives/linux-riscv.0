Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37FAEB64D9
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Jul 2023 01:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1TPR5pm0OIQNoWp7BjNZ/7RczatPt7bckwBdEcnoDBk=; b=d4c1SP8SBBQHjy
	6GaPyfFXE7kRd9YyOw5qonRurW+OwKBztOEA63SVM6PXlFqnSD9RMi+aSVghSFfI9ScQebpGbDZ3D
	BCIbL9Sp7CCjvrQTwgUqy3IqY41vG8O7G722Bj1l0+ZsHvuI8nzJ73JlA1Le0xrBJkcjMPMgnOxcX
	Rf6Cbh8rys1ULOd6o2WbEL+b/eh9ibbLv2WEGBMGeV1kRepoBl86nHlPZE5TU8EP2YbgFwdK+YS6M
	XOUYlHyfm0YA+nlnycCOEX7fFQlzFTe8hCkbZthwBTwdD1kOXWIO/4hN3mFqf97ya4WrP+leGSu/j
	e6f4in73bogMg8ijtPRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHwUp-006Dkj-1q;
	Sat, 08 Jul 2023 01:12:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHwUm-006DhK-0L
	for linux-riscv@lists.infradead.org;
	Sat, 08 Jul 2023 01:12:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b9c5e07c1bso7707185ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Jul 2023 18:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688778739; x=1691370739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGYD7N8wGDu1tDg8VZbK81LUzFuUntAfMahEoaG4sqc=;
        b=HGN3ju79/NcRtAH1rWTzt1SF66qlIOEIPW+h8YCZSLaemLUac5sLeNcc06JOpcpXYS
         Cj+44tx2Z+rwnRiNelURAceDB/qdaKXjyGvhTuZuZecJIPAZ93DUuWf9RMS8856fmHx8
         Umn9pcJZq+zDFbW3kfivmOjwAuguRCJGOID7fJdAs9Nbn12i9eOGzLQ76DGuAdP1h2/F
         EC/pD0QZPhElZ7NCVIs4iLArjS3xtiJrVYm/2wZeUdSifvbekOHDtDtmS8cMIhwN9VIH
         81Hbh7TQSzo/OJgjK4nyg7wVpciIrnm85nU2hbGdj1OHDOVQwJk4nRSRz6OyiZoPcTy9
         ci6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688778739; x=1691370739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGYD7N8wGDu1tDg8VZbK81LUzFuUntAfMahEoaG4sqc=;
        b=SJiqzXMp4nwv017k0fVxZglKr9QiU/yg/PV0PQx8mibkiq2VG8oI/9BeFvOCJyVZut
         Ul+djqm3dF6ITFjwgQGi62Z1YQ4XRDfTOTF3cyrLPXDh/1nJn2l4a90K+tAXlVlCkppK
         7aeiQf3ctbMx2DZ1QSIgjug6Q4axeQaTlRYlaaWLkymDmSGdiHgjGUu+GQHapwsU3sR1
         wTCpQKikFQy9J1Jw/SmUHPuKHyYgKqfS7CL07n0mqUN+XacVFRt/LAmLGDux7izf+Xbf
         YCnItQG0ATHKfDtBDDKyOk2VocmvY4M53rKKMmb50KHP4WokbMqEjbC1f+j86lnv7Ell
         QNiQ==
X-Gm-Message-State: ABy/qLYkfPY2O/EqJpizWcwu28K6uXNA4EyOswU6usT7YJAJBjVW9ERZ
	Fmhhl64sV6gaP9bS97ZPAjEBeiTWDqf1JGcsXd8=
X-Google-Smtp-Source: APBJJlHkZ1VNL0aalCS0nI4K5MUssbBtfN29EiaKPdj3R58vKoRX7bIN9ly2ZZTe32HyTdXxVRe5ag==
X-Received: by 2002:a17:902:c951:b0:1b8:3e15:46a1 with SMTP id i17-20020a170902c95100b001b83e1546a1mr8516813pla.67.1688778738940;
        Fri, 07 Jul 2023 18:12:18 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id x24-20020a170902b41800b001b87d3e845bsm3830654plr.149.2023.07.07.18.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 18:12:18 -0700 (PDT)
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
	rdunlap@infradead.org
Subject: [PATCH v4 3/4] RISC-V: mm: Update pgtable comment documentation
Date: Fri,  7 Jul 2023 18:11:34 -0700
Message-ID: <20230708011156.2697409-4-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230708011156.2697409-1-charlie@rivosinc.com>
References: <20230708011156.2697409-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_181220_167266_C46E6203 
X-CRM114-Status: UNSURE (   9.73  )
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
dWRlL2FzbS9wZ3RhYmxlLmgKaW5kZXggYTgwOTBlYmVhNzA1Li5lNmJiZThjMGU1ODMgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCisrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcGd0YWJsZS5oCkBAIC04NDEsMTQgKzg0MSwxNiBAQCBzdGF0aWMgaW5saW5l
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
