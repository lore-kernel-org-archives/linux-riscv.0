Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA60C001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 16:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nGPTogqZqHhYWR1hJmqDT/KxLXEQp4bH607Rg2p3kME=; b=Qceb/qdjx8v3ui
	0ImcUyfdFd4OiC3l68BwopPVbApvAdGwgtsAk4+uXNJr/6/3l6cqUut3FnRcb5zn58lN9B26QzXKE
	j5Y31Jsdufurk4I5MTaTxhKNZivuhzkqqGL1cezVADkCvbSf+Twsjpuji6VmBYfzjRRuD/qxnueeg
	zIyky25anNCgXeksulzANNESRKvQ7sy9J3eZQWshuum+y2JuEcGitRY0Jspbvy4qeNX0FKDEWEpTq
	qO8Rk31MZSlHS/wBOCzTP47q6JFXYBWqS6+/u4s/UrpgJ6YAQ+wQeMRZBc2r49yazjnCfv3jEM7JK
	j4yFukMoG2d3B4KBlZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhew-00B3HM-0s;
	Wed, 26 Jul 2023 16:46:46 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOhem-00B39M-2J
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 16:46:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bbd2761f1bso4629115ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jul 2023 09:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690389993; x=1690994793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxXmOdIWe/bZgFmovuliVgy5AL4XQqsEakBY4VilH/8=;
        b=uGj1t6oL4u1fl4y0bUjyIo+gEG6FvyX76N3UvGsKUanjjrHB6wnIUkhEejMij86pkP
         EVcq1qYhmhAsWKH/bTv86zK02/LQZMQq7g4GucihnDv97RSd4YvXnrbgbDWPGh57Gm43
         otyrPfQG7tSPmnn1LK0ZKv6nS+RjBkhyBwtgizouPL3Kq5x8fU1JxqHm8ESNdJya0Equ
         u60fTChXgviIE+TR2UEeszDN/H3aPv73hS0hvyNcKuH0qJi9wFqWw0PjC0ks4SU85S2Z
         5glfdqvmMevya7khD8CyeEfxUGRd305Yi1lCbXYzBjv2vJ/zFMEBiJB9hvll+QMy0/cX
         T8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690389993; x=1690994793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxXmOdIWe/bZgFmovuliVgy5AL4XQqsEakBY4VilH/8=;
        b=NhQcfYdjCzfrZqWZdSooBerprXCAPGb7Mi/bLSb57f1A6zEh9mqduMhGruwke/E9na
         whnp2DeEeRTn20FQKVJsU6EdTAWOoPrqDvFWiP8nJHh8x4mKjRPpY0cwA4C/K6AXeixm
         D0hOmVjEnLVW4hq0vfDLU0QOgq9xo1RabMu2GF21I39uoajkvHGwPPBqYaIaEPv3Uf1S
         be3xOCKf93mNLwuEmJwxtygDPszPUpwJFKjjzv3MALrVSVfO1Aqjt+32zNXO7iCdFYq7
         9XXHLtrAnY26l+NjyPSkjStrwUS6Vh0qi2gFYbOrR/w5RWV4DlEtOvfDsCtzJz8jlmNh
         camw==
X-Gm-Message-State: ABy/qLa2hWu89lmH9eyPW07miGEA1edMiDlZilPM6LPR/NuyYbl9t2+X
	hLhM+vqvsvwXvzCpbyhHr0XgoecZPSzwOwiGguY=
X-Google-Smtp-Source: APBJJlHd8ZanXubRsLvs8LnpqdeDXtlGfjvqC1HSJQRHauQPQgT6PVzi7mdT5yfnVwFo9B2eoHwlEA==
X-Received: by 2002:a17:902:c205:b0:1b5:219a:cbbd with SMTP id 5-20020a170902c20500b001b5219acbbdmr2429756pll.3.1690389993609;
        Wed, 26 Jul 2023 09:46:33 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id h5-20020a170902f54500b001bb6c5ff4edsm11628870plf.173.2023.07.26.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:46:33 -0700 (PDT)
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
Subject: [PATCH v7 3/4] RISC-V: mm: Update pgtable comment documentation
Date: Wed, 26 Jul 2023 09:45:57 -0700
Message-ID: <20230726164620.717288-4-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726164620.717288-1-charlie@rivosinc.com>
References: <20230726164620.717288-1-charlie@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_094636_789141_5EF2270C 
X-CRM114-Status: UNSURE (   9.72  )
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
L2FzbS9wZ3RhYmxlLmgKaW5kZXggNTMwZjZhMTcxYTJiLi5jZDA5Y2NkODc2YjkgMTAwNjQ0Ci0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCisrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5oCkBAIC04NDEsMTQgKzg0MSwxNiBAQCBzdGF0aWMgaW5saW5lIHB0
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
