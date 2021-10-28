Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2DAC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 13:20:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A36F060F56
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 13:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A36F060F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sr/+ny7GjJK+Cx32LiI861a8qHPFP4/01jY6053xgW4=; b=10vfZm8fNChGsZ
	jdTEFvkcDxNVmFQ2D380/sbqoI9wa5ryXZYIntyMA6z+ex7rHIg00Emmp/lDsr1lD5XqXqSrk3kV2
	dKpUpRfdHsJ9yjQ2+kC59w8/vh13Re5L0k5yPR4S+6zhgG6gObEijoXrxcgcslhAwcWUCDFwBIcGG
	Jqyj91xL5oo+iF+nQLVR9fj389jBe8gYQ1/4yf2SAZBuCA1GDfQ/Ep+bwm65RY5z/M0Ga/kUA2KwY
	YYHKPiuoumHVxENxRIqfWJaKM4aECsEPYYylGSVJiwNoDaU5pJvh97yAEO6+s/jet2H9TLE6Tsj5W
	3eCLeBrn00YprUG5RT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg5Kr-007uWJ-Hu; Thu, 28 Oct 2021 13:20:49 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg5Ko-007uUH-KQ
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 13:20:48 +0000
Received: by mail-lj1-f178.google.com with SMTP id l2so10670598lji.6
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 06:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tV3/PwR5VpxbTSpUyiluLuIWKfFd+0GUhLTj4B2BabA=;
 b=dUaRdfbzMYzQL17+sXizk3xMVhZ10/Mx9ltFINJOK910G6vnkhaHx0mv4oF6RPc5Q3
 nINiwOvaXNsWGzws9Rl6zNmHneTEppq6n5MWL+bSNtkPp4W/rhfwwIawN01cyw1yR6IB
 3IVN/PsibcSX/nvDcZzlS+JmhVjfWk8HaWfxm0a3w0KmDqtvNvTP4GidVw24fnMl5v48
 4h5t6Ahb/R2nEweIyxrXOix6jxgDgXQPSMvA8VwweReNqXu0MpKvOTuCqLTOxrUfEQFI
 aj8ms6i6uy8yLlj/3LvQj8f0vYBSwkrQhmd7nQR5kYQeEQ3s7oDXPoQFkjyUlfF3zSB5
 37QA==
X-Gm-Message-State: AOAM531d7mJV4J8jhKS9uYPD92Osj5vOIc6TqgZRILekd+EmyUm+VKlk
 YWbfuKiJzmHvLhaugHHkD6o=
X-Google-Smtp-Source: ABdhPJxYlGkAp5YfgykTL+OJPSVAqgl4GZXQLle35EobOrAUTuaWxVUdSIobaRXPItg1SLgSd2jolA==
X-Received: by 2002:a2e:82d5:: with SMTP id n21mr4673656ljh.6.1635427244950;
 Thu, 28 Oct 2021 06:20:44 -0700 (PDT)
Received: from kladdkakan.. ([185.213.154.234])
 by smtp.gmail.com with ESMTPSA id o9sm309616lfk.292.2021.10.28.06.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 06:20:44 -0700 (PDT)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH bpf-next 0/4] Various RISC-V BPF improvements
Date: Thu, 28 Oct 2021 15:20:37 +0200
Message-Id: <20211028132041.516820-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_062046_689108_1678BCB5 
X-CRM114-Status: UNSURE (   7.51  )
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

VW5mb3J0dW5hdGVseSBzZWxmdGVzdC9icGYgZG9lcyBub3QgYnVpbGQgZm9yIFJWNjQuIFRoaXMg
c2VyaWVzIGZpeGVzCnRoYXQuCgoqIEpJVCByZXF1aXJlcyBtb3JlIGl0ZXJhdGlvbnMgdG8gY29u
dmVyZ2UKKiBTb21lIE1ha2VmaWxlIGlzc3VlcwoqIGJwZl90cmFjaW5nLmggd2FzIG1pc3Npbmcg
UklTQy1WIG1hY3JvcyBmb3IgUFRfUkVHUwoKTW9yZSBkZXRhaWxzIGFyZSBpbiBlYWNoIGNvbW1p
dC4KClRoZXJlIGFyZSBzdGlsbCBtYW55IGZhaWxpbmcgdGVzdHMsIGJ1dCB0aGlzIGlzIGEgc3Rh
cnQuCgoKQ2hlZXJzLApCasO2cm4KCkJqw7ZybiBUw7ZwZWwgKDQpOgogIHJpc2N2LCBicGY6IElu
Y3JlYXNlIHRoZSBtYXhpbXVtIG51bWJlciBvZiBpdGVyYXRpb25zCiAgdG9vbHMgYnVpbGQ6IEFk
ZCBSSVNDLVYgdG8gSE9TVEFSQ0ggcGFyc2luZwogIHJpc2N2LCBsaWJicGY6IEFkZCBSSVNDLVYg
KFJWNjQpIHN1cHBvcnQgdG8gYnBmX3RyYWNpbmcuaAogIHNlbGZ0ZXN0cy9icGY6IEZpeCBicm9r
ZW4gcmlzY3YgYnVpbGQKCiBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYyAgICAgICAgfCAg
MiArLQogdG9vbHMvbGliL2JwZi9icGZfdHJhY2luZy5oICAgICAgICAgIHwgMzIgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwogdG9vbHMvc2NyaXB0cy9NYWtlZmlsZS5hcmNoICAgICAgICAg
IHwgIDMgKystCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUgfCAgMyArKy0K
IDQgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCgpiYXNl
LWNvbW1pdDogYjA2NmFiYmEzZWYxNmE0YTA4NWQyMzdlOTVkYTBkZTNmMGI4NzcxMwotLSAKMi4z
Mi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
