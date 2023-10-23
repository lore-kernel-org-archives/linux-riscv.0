Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66E7C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lE5jjWbA+kBHJmnkajQZYgjRQISpPEXsYteJhDNbIj4=; b=0xKQD0zx1P2zeL
	pEilhEMUP5G5zwRse9iiJJnN9sA2ptr1wF8LC09tIb5LRwyW+vtWFlKwFUz0P2Ik5T7e1zH0JPrOA
	vva+KyFH/eizs10UXB6p0jGKMrqW7wHskmxNXW7uSrcV5Oy5TPE1X/jYglwSAp+pcBIA8Un04uqRn
	ebRAYAZxjC3jOvAzSn3vIMWrfv7u+M0YZee435pba7KGRMYXXQyShmLZPGKrtIW7tATwcpLrriKGC
	GzpSJE5M1DfmHPzr5I8v/HVaQ0HYrjGCDs2H9/L7ia2w0z9npXAdfw190SUpRH6UKflg3JlvaUpMB
	ui5lgrz1lb+UG4MFjw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqKX-006lOl-1J;
	Mon, 23 Oct 2023 08:30:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqKV-006lMo-1H
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:30:32 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6b87c1edfd5so2169689b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049829; x=1698654629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwqRYcNnh3bL2bnUHbsBXwm7mmQqzZo0pVLQzAgbeF0=;
        b=Qu2p3HQSi7SIzmTcWU49W2O6uPKqT3+OmWOzzQrK6f79s7heXjBgYp35v7elqlldGR
         Ay/uSh96T5mpK5MGhYLGKQvln0tc/twnag18mpGI6w8P5C9HQNJ/vl1eSiZ557Sbzhll
         YACXL5BEFSFYlnvYnOLDquicEceB3ikflneGK2m1rLGJeDT5Li3HP7rT4iV9PfPbz5az
         Bza1bvNTapGU2v8Ec/71wWzc7Y2Q+WNM3Z8niP8aqDYEqRAVVNKWUcbzV4HH9LgkgrNM
         aSDU4x8c5o01WYua8la28p5hTSqUau2w2G0rRy8PKRQjTmtqYPY4ZDeGWMhIdj6+fdmV
         B3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049829; x=1698654629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qwqRYcNnh3bL2bnUHbsBXwm7mmQqzZo0pVLQzAgbeF0=;
        b=UCB91yC1AeE6+pwx8813oeXraoY/3p0lLi23NLc8AQV0+xJrbQP58aDBn032zYKF9M
         KG7avVmdwRh/quoevdvo+W5Tx8Li4Ewyy19tzI5PFfz1MDQcefl5qD9rs8u20s+uzetP
         FUQsNXyt+19PHXVdUBwHA/ljEC1RwsodgfMQJryd0Iv0Pkl8aBsYeXTyB3RsZ8BuiLZC
         PLBoJ5lRdn/aYPtoGTzUKwiGqLyBctOjc+h1vj0QWhIgtd+tbqudtSFnSA/eO/DBgrBt
         39zaPVdZfGlPoZHlNP4XeKGtfJZuc3NaDfXkw3xXxiB/pep6z5GPIBxS0LBJqGmxnbe7
         P1pQ==
X-Gm-Message-State: AOJu0YzW8NNY5Evk6HsVQupJ30ywBzbhvIVFHdNJ3zQyaR77SJiiuubA
	qI8or2+JyRFC0M3n6yqdMpBUJQ==
X-Google-Smtp-Source: AGHT+IGyFbUXBRXdZQh2eZcjKZcfVc6v/Ld3/FBhlNzBXs9NtpZ6v0cDf/3miDn1ZPth5cbBQ//TYA==
X-Received: by 2002:a05:6a21:498b:b0:17b:d39c:1d6 with SMTP id ax11-20020a056a21498b00b0017bd39c01d6mr5328684pzc.30.1698049829431;
        Mon, 23 Oct 2023 01:30:29 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.30.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:30:28 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	maz@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	liyu.yukiteru@bytedance.com,
	sunjiadong.lff@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	chaiwen.cc@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 12/12] riscv: Enable CONFIG_RISCV_PSEUDO_NMI in default
Date: Mon, 23 Oct 2023 16:29:11 +0800
Message-Id: <20231023082911.23242-13-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_013031_436360_73706B75 
X-CRM114-Status: UNSURE (   8.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This commit enables CONFIG_RISCV_PSEUDO_NMI in default. Now pseudo NMI
feature is defaultly enabled on RISC-V.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 487e4293f31e..ecccdc91563f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -672,7 +672,7 @@ config RISCV_BOOT_SPINWAIT
 config RISCV_PSEUDO_NMI
 	bool "Support for NMI-like interrupts"
 	depends on !RISCV_M_MODE
-	default n
+	default y
 	help
 	  Adds support for mimicking Non-Maskable Interrupts through the use of
 	  CSR_IE register.
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
