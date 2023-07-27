Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B6CC001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 21:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brEcgb8ewc8fC15DQeceXLImdYtsnSvcggm+iRn8JSE=; b=pvQ9DW1MT95C+o
	bukb3EShVsyEa+pdvAeruRGPMQd1RB9hxyePlc83C6zo5xA1ZbzCrviTXG1H2IQlfk88YU+rTwwCJ
	rE80J1huOih0fTWpZL1Jza3na8THM1epOV2/rPiRbr2rsMseJufv69LDYai0AmU9ooz2D6HJcmTVV
	FhEoJPX88eA0TLIApT10eNu87vaHHTlN0ByMvp3lrbj0Z7IP2pUWQTXKRVCnBLLLeHA9z5Vwmk6f/
	lFmhyksvKLBT+UlZZ3gGhHbh6b0R5f5q/Zg7ar00sy+zOk12WXpqbeZlwlHubPEwImyJsdfI8bDKl
	oSgR6wKguxLeOSi0L5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP8Vk-000c42-1p;
	Thu, 27 Jul 2023 21:27:04 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP8Ve-000bxx-1P
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 21:27:01 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-686f1240a22so1205124b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 14:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690493215; x=1691098015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxIryN+/nGnN7q5/mJrC1dQ+rinWckKL0IS2jYwlkeI=;
        b=HH7TEI0FKqELKzYIXsjAzNMOv7EmEk19k49xsmg5JJ2iJpQjJBUsJBektepS7kbqjA
         Vt/YOabaV+5seRyrTS+nQFfXRu/Rmc0qF/Cmuzi6vbvzfQQ7hYiZSyJOGxFRzI1tA3px
         fkP0ufFuAla153rOmkqGNp0bHyeGAvpUM3evTA9mfbdGVkW+96ufuS/f54M74SC3GCRo
         WqzWIVc8ARWe8/mWjw/9xYezMnJhgSJlmpSTw5U4/6ICvlMwjc3VVGpkITduwPQnE0vT
         zFsh4Tq4pcASeCN6YVhHilpdFEEvWGuxwZ4SH0AQAfZfQIb9FQNxijHErK3RcGa3TLoV
         6PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690493215; x=1691098015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxIryN+/nGnN7q5/mJrC1dQ+rinWckKL0IS2jYwlkeI=;
        b=QgE0SuM9sgKTyXpI9A8PJROMjVtW5tC/xjd8P+HZFO9lznIFmoJJyV/jvEWr/Cv1Vm
         3gJ5i22vjN8nVBoDRiziigAp/ROyW8PjsGZ8ay5SfvC0CSmgcdWXw5R2AKH3C5coVp7u
         El/L1mTyQVJJtv3Q9d6HKYxUzuWXhlOanVBB+98vN34k/qPD2gcV6v0dwZ8+L8Em/8jb
         MydAHcAsiO0JoyqK7JwX2gz8BSK2G+NNGdx1HtMJ7LE46ywuzjhqrAoK4Socxsvl1lNh
         RVr8fKu83xfJAYG6/Y/ZaDYhjiNcT3hnNpLoq/V7xpIZNotdNatxEOUgCpZJzxMCO3/S
         OGdA==
X-Gm-Message-State: ABy/qLb7molz4M1xbCHGs/LWWt5LGznPtXLyw1U/gtTes9Y3icwn7fW2
	qILJ95jZsv4rr7MDxI0AvYbZBZDorsOuak7gx4U=
X-Google-Smtp-Source: APBJJlH69UlfwIWPYbCOxQtQ76ua+pdw1/ixsjQRFRBQgUh0yQ7pLCSXX0UzINbZgQLjLL4GlXZWZw==
X-Received: by 2002:a05:6a00:2316:b0:668:82fe:16f1 with SMTP id h22-20020a056a00231600b0066882fe16f1mr369674pfh.1.1690493215262;
        Thu, 27 Jul 2023 14:26:55 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c5-20020aa78c05000000b00682562b1549sm1912312pfd.24.2023.07.27.14.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 14:26:54 -0700 (PDT)
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
Subject: [PATCH v8 3/4] RISC-V: mm: Update pgtable comment documentation
Date: Thu, 27 Jul 2023 14:26:28 -0700
Message-ID: <20230727212647.4182407-4-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727212647.4182407-1-charlie@rivosinc.com>
References: <20230727212647.4182407-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_142658_473257_B4622800 
X-CRM114-Status: UNSURE (   9.26  )
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
L2FzbS9wZ3RhYmxlLmgKaW5kZXggYzc2YTFlZjA5NGE0Li5iNTUxNDY3YTFkZDggMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCkBAIC04NDgsMTQgKzg0OCwxNiBAQCBzdGF0aWMgaW5saW5lIHB0
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
R0QgLyAyKQotLSAKMi40MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
