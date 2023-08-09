Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9595BC41513
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 01:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nc779pxzADgQduHNdJz6wa8HKTqvyhKp/ItAq3S7bis=; b=TmOwmxBdV9DSNu
	5erHSBhUl5esvvI8d377YMrK+raKmX7+/IyFvSONjLwrjkyKqOhkiJbi+l01H+gft95m6e8qWyvBh
	vi7ywkiSEX9D1dHesIVlYLXCC6amQp2CDggBhTBJ2RrbzpGydyqzRkpMOxja1IOb8JyIsHUqLKJin
	Ofy6S+NURvnFQupvzjXkbEWT9D8xZTvpRgdl08jE7PCgECgAxjncsuAymr7UlIIBLSs9v1RYSEdjz
	PJAGonahZhQbP1Kk0+gVLq0sfBZRuXjJqJUyEY1VfnGehydFfVRxWZ90oBvFOMf5Q9kGMws6AFLJ7
	GptI3FdWtX7obFQiasEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYNx-003q6n-1K;
	Wed, 09 Aug 2023 01:53:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTYNs-003q2M-09
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 01:53:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bc83a96067so8323555ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 18:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691545991; x=1692150791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q2lf0ErqSwJrn3JbgeuhvaoxCnqdWFIkpf1V4h3asg=;
        b=KQfNpvZbwPfJw4InJH3Gop3jL8C3JwJPDbX7mWsYj121ubZsb8RGRA2aI9F/PwCRVF
         VythodBAkVElVzcYFFbi1lDli1YK6i88YBAyJ4izWsKPC7TciTmEvVoHSJFMyct3/A1C
         QCjr27vWn57/CGMNexhGRhDrj7RKrU+Fm1uLuqZAWixGoxJgCb59LKtThbuUpPvCKADL
         SV/MKjcJ/vt528cSHhB3ZDKQVmxe2Pl4qLNnNm+Usxd5J+XvPi8hxQoSr+RdZwvLVwxq
         XkZe4sqD/xdLk4MoYZctFEDxxFdlv5Rih9i/apAmP5jgpZqpVJTVwvCWYM3sPWvQD09+
         Qnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691545991; x=1692150791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5q2lf0ErqSwJrn3JbgeuhvaoxCnqdWFIkpf1V4h3asg=;
        b=K3g6PRPWqDZPPjcfXkf67M9ug4WfEZKABMUNtbIQ8sIvPbrux3jvCvs1In3hOzh+sv
         C4wxM6/ZF6r7HFTZk5LVau7mUWcayKAgRelX9fQ3Z2fUXmH7QgcnRo9VbpNKbmQkYwuE
         LqV05qnRJ374B500AglrSuJ4rIYP0mEDIZ87Tul/fbN8DifBvIs5WQNgpi0jw6/87lN1
         yK0YZ5A+UiNkrWLKCewAg5kpjlHXRJs2FQGa6Ua+37VhLVAoNR+3oIC7dx2nWhcXASrl
         PoU4R+ciK+SskirA1YafqArzt/o/KPIFv8RxT+n4X8blKqMFJqJIKoisIl2aEqOfqKRW
         3V0A==
X-Gm-Message-State: AOJu0Yx2JB0kCDoR0SitrkHURlzH7yTcP/uGxD07GNBmR6R/NnMPIuRo
	n1RFE0o9vifLIKipGD94nYkmh+Z/it9DrsebJDE=
X-Google-Smtp-Source: AGHT+IGg+v5KFzlU+jQrk/Y4IPjZqAfK6IzCZuHeB5tm9d5fjhnx1QdE7SY5R0FlUS9hkHWQ+fZbQA==
X-Received: by 2002:a17:902:d2cf:b0:1bc:3f9b:d96 with SMTP id n15-20020a170902d2cf00b001bc3f9b0d96mr1444563plc.49.1691545990966;
        Tue, 08 Aug 2023 18:53:10 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id bj7-20020a170902850700b001b87bedcc6fsm9657591plb.93.2023.08.08.18.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 18:53:10 -0700 (PDT)
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
Subject: [PATCH v9 3/4] RISC-V: mm: Update pgtable comment documentation
Date: Tue,  8 Aug 2023 18:51:09 -0700
Message-Id: <20230809015110.3290774-4-charlie@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809015110.3290774-1-charlie@rivosinc.com>
References: <20230809015110.3290774-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_185312_097490_5DE7C440 
X-CRM114-Status: UNSURE (   9.68  )
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
L2FzbS9wZ3RhYmxlLmgKaW5kZXggMjYxMWMxMzI0YTdjLi43NjkwN2I5NTEwOWEgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCkBAIC04NDksMTQgKzg0OSwxNiBAQCBzdGF0aWMgaW5saW5lIHB0
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
