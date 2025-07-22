Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58D4C83F1A
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 16:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMxbduFuxD66K0aecyLmehBDxBPR1RqlhNVekT5WGMY=; b=x37CzJujaO2xvS
	xP0s0nbv5j5kJdWaMvpOFbcoWIFA6OJHe92Q9jkUNwQATQjiyedJLW/Ac1XlfChyhZ2aJItnoZeDM
	0l2ZdaNPDJA7Os7qvsXUxRzGLQsw6tDqN9N92oB4hBTrHKhx9SY+2yP1rescFFAwMOttqw/KG79Pr
	qXQEeUI6z2KGc5dQnL+rHoEEYwGBKtGFEcKz8C3vls+/DCKkDy6RPmNWyvbsFmqLjDmzYcqsEEVWI
	AJ2IXb338JSNJ7d9CbOq3T1uEKQKqDYjddlAAxBLk3IyEIdOomgZY1f3OrVTso/xzbU4Cyc63hRNZ
	oXu+oJSFpdvS4PMVTctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFuL-000000031wj-1RZx;
	Tue, 22 Jul 2025 16:32:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFZ3-00000002yml-0I9n
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Jul 2025 16:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gUIN734c8F9Q1V9KdFeOGIQnf08UJxOJxruFh9+meKQ=; b=EeYTWV5Cgj/5AyE024OHynegFq
	jErytSwSKJ3c27LRLs8rGLE6dlnuuqKDJjxj69sUdP9barJOfLg7sdwZnaEoA3abghiJNDz86V38r
	f8ZYgOGX8GoFtxL0YShyIGWC1iYVLYa2EsIHitm3U2PQRTgHI2tmiMAEh1RAmWUzVk3ElQSrfw9lF
	bhlkOrfYT35ake9RcpT401OiEYFjfn722BEPrUCW0WrtTrufexiQXk9rhJXIjc/yaJAvwsR4bpZ0R
	TQcOHb/u9bzf7N7iYCSXartBNIh70ov3b9XrfV4n8b4AeWmea+G1HZNSufgTIg1rrMnP0021YrNb+
	CfPCFRBw==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueFZ0-0000000BJ8U-16WY
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 16:09:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-456127b9958so7416325e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Jul 2025 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753200596; x=1753805396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUIN734c8F9Q1V9KdFeOGIQnf08UJxOJxruFh9+meKQ=;
        b=btrq8TqFbZjXEvLfue5TPVXIDsIYOB5AA3fjP43p8JRYssdfLfCqgq1asaR/fRZcB7
         xVVuVg/TrF3TADBat6Ew8o79NNkkTfYPM8oe3qqRRRCJobY6ssShXhgfOxS7sGe7vckl
         yVCFLgsPx//pjREDdQHd+Xc+XW6s+19eovTiyhWjrEXFXFX1Cdrf1wcBzUWlf3r2fMRW
         hm0lnMaaOYtRSSgfL3/FL2RisrnFs6P+4ffJKfFtAox1x20dFNe217bNeOkjwFuzG0w8
         oylh8YwfH23hspdSEmN7XsYZBOyv0gXlGgZw/tjn1waTenl19Wy3sqkR08oGWaWAxRQj
         sPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753200596; x=1753805396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUIN734c8F9Q1V9KdFeOGIQnf08UJxOJxruFh9+meKQ=;
        b=NP94I+uxSO+DuFHp++Q0OaDJwbIPw7Krr3bCtMdsYMtpYRbcFoFJvn0UQ12PvFY7/S
         hSG269OUzH9xSOfROWoILIfbWISp3xERqHn3BNIruE9o2fjZPbOKvV+qGeixBYaR5ucl
         lPePfpIds7rZowYZgYTzMggKo+fuMLurXnGkLstMRWSMyoffLfpQ3Hli4+tFd0pMRM69
         D/RxAKZpDgz1Pw49IrddPBG/UoI6OJLwq6N4tv7F6/lQ2Pwg6BjekL3e4Mq1Vz6rKPU2
         2C8lx1gzh234bwjotq05weoBknilJiEhUnVNAAGTcX+7moF0DpCykPFk5VBsnhaizOto
         1RSQ==
X-Gm-Message-State: AOJu0YxFGol8jfu1Y+LL6WbbZg1K/zndPjFelhwrL16dDfQLBDdf+yRr
	qGYuCMS3bNQkovrMJEp3wSY7di1fREyC9mT0EafgAs5PBuXk1KxTqTDUu5OspPrbQ2V2YPJMqjg
	WRMKB
X-Gm-Gg: ASbGncs/YEFgiF8kHbMcNE7vvFtuOtk8lYBkleqzsC5Ra2k/yNH4O/q8aeqjFGjNVfq
	su/d/MT/QIr2APSAGvb2F86dU/ocILQmFaCSnmu208TJcIWfSURWITzN6VOvwX9zTvTGyCQzq+y
	x2kEdN0tIEz30q1ZU3y625BMLcob2ARTORmr98ts92lEQtwCQxcRzSSvNtdXw/VS98zhKPTt+Fb
	72Tt1y3tbWcL8w3qmWVJibu7wT0TzQxoFHN4aY6ihZqcJX1S5BVMOJlPmz81reAPB9nSCkBn3Gq
	kLxq5FBr9MJ/oryttIpnY/BV5QZUj3EV/qkcJevNIibQBsgBxjh26DcxRllckY2WXsW4wN042F3
	ipAJwlRfM5LCcS4UBhn4EMSbnrkJV3w==
X-Google-Smtp-Source: AGHT+IGyGnUn7vJdarGNb0EVJqGL251dIgBLpKbjL2CJ9wo77hAS7BHWXW7JVTY6NvJ4447wrID6KQ==
X-Received: by 2002:a05:600c:c097:b0:442:e0e0:24d with SMTP id 5b1f17b1804b1-4562f706949mr80974655e9.7.1753200596089;
        Tue, 22 Jul 2025 09:09:56 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:30d6:4986:8040:bb0a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458639ffca5sm19058775e9.1.2025.07.22.09.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 09:09:55 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH 3/3] riscv: pack rv64 thread_info better
Date: Tue, 22 Jul 2025 18:05:57 +0200
Message-ID: <20250722160556.2216925-5-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250722160556.2216925-2-rkrcmar@ventanamicro.com>
References: <20250722160556.2216925-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_170958_442549_00C69D7C 
X-CRM114-Status: GOOD (  12.18  )
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

T24gcnY2NCwgcHJlZW1wdF9jb3VudCBhbmQgY3B1IHdlcmUgYm90aCAzMi1iaXQgZm9sbG93ZWQg
YnkgNjQtYml0LCBzbwpwbGFjaW5nIG9uZSBpbiB0aGUgaG9sZSBzYXZlcyA4IGJ5dGVzIGluIHRo
ZSBzdHJ1Y3QuCgpTaWduZWQtb2ZmLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFu
YW1pY3JvLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKaW5kZXggZjU5MTZhNzA4NzlhLi5jMjY3ZDZiZDgz
OGUgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaAorKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3RocmVhZF9pbmZvLmgKQEAgLTUzLDYgKzUzLDcgQEAK
IHN0cnVjdCB0aHJlYWRfaW5mbyB7CiAJdW5zaWduZWQgbG9uZwkJZmxhZ3M7CQkvKiBsb3cgbGV2
ZWwgZmxhZ3MgKi8KIAlpbnQgICAgICAgICAgICAgICAgICAgICBwcmVlbXB0X2NvdW50OyAgLyog
MD0+cHJlZW1wdGlibGUsIDwwPT5CVUcgKi8KKwlpbnQJCQljcHU7CiAJLyoKIAkgKiBUaGVzZSBz
dGFjayBwb2ludGVycyBhcmUgb3ZlcndyaXR0ZW4gb24gZXZlcnkgc3lzdGVtIGNhbGwgb3IKIAkg
KiBleGNlcHRpb24uICBTUCBpcyBhbHNvIHNhdmVkIHRvIHRoZSBzdGFjayBpdCBjYW4gYmUgcmVj
b3ZlcmVkIHdoZW4KQEAgLTYwLDcgKzYxLDYgQEAgc3RydWN0IHRocmVhZF9pbmZvIHsKIAkgKi8K
IAlsb25nCQkJa2VybmVsX3NwOwkvKiBLZXJuZWwgc3RhY2sgcG9pbnRlciAqLwogCWxvbmcJCQl1
c2VyX3NwOwkvKiBVc2VyIHN0YWNrIHBvaW50ZXIgKi8KLQlpbnQJCQljcHU7CiAJdW5zaWduZWQg
bG9uZwkJc3lzY2FsbF93b3JrOwkvKiBTWVNDQUxMX1dPUktfIGZsYWdzICovCiAjaWZkZWYgQ09O
RklHX1NIQURPV19DQUxMX1NUQUNLCiAJdm9pZAkJCSpzY3NfYmFzZTsKLS0gCjIuNTAuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
