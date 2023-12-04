Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0F8C10DC3
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lZRUu/xZK6/U89KKQJp1/pe7C4QXnHwLbUPTIa/mwzQ=; b=NfUm6jtqGk8wVg
	6F0EPfL0R37RX8rSC9tFqV7abUSl+RVUlj4Ee7O79fgXKa05ZLNi5x3C0yHyPYtXMqNi965BeyavL
	aljE7uuUNYzCXQ0d3ifK/9tX40wNUW36prI6YFtu4LjJNtEcq9RQc3RVRBF7/ef7ioUtfN/SdR/JV
	fizeOXrxqcbrZ+i5vU574X2Nd9vkIZ6+12VdtZoPF5xBmzSUHpjaWeLSF0RtACFj+dA1B/h5YuwPS
	kXX/prSMNctVnAUTP/oQSDK9Ujia46ljLhvn0ffgdbBLQFwFH4IxXd7WsOyB9ymhRv4LiSqMiQ+qB
	L7A2rdS1EJS9EgkOXQQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rADgz-005JMZ-0B;
	Mon, 04 Dec 2023 18:29:17 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rADgv-005JLL-17
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 18:29:15 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5bdb0be3591so2661965a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 10:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701714551; x=1702319351; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HRGQ4jVpktID0BGp61Hzxxr59ElZZNf4bjZk+jO72BI=;
        b=OiU8GhLs9YD26+yYNwRrIAiXpZbK1w2jZhfBUlBzz0QsDYY8eYAEZL9jcTWkOqL3Xl
         flUA0TxSL1I1Je6p6g2sKHlQVEBUWyZZf54xjIMMYeeNGYvMaOSiamWL7XlOgPQKqDKR
         ZB69sUHrW7/s9LWfwrF6EGZO1y6Qz0rA1SXcRCJXBI9M1CEy4BtoeCqxLVrm50pQlB4J
         VRE/oMnxaOjIjlPZsSRAi+D5JReF8VPGF1UIqxGtqyXKHzJh0N3Y23JMpd88BtaH2Ezx
         ZyUK0lCJRtpdgTTINlchQk+MfjyX1S+DZwlOWJsA9wOj7A+PqeZApt1c+HEnLaTIXGW7
         RT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701714551; x=1702319351;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRGQ4jVpktID0BGp61Hzxxr59ElZZNf4bjZk+jO72BI=;
        b=p1b4MCVvOY/Q0cpoyQDcRF3vO5wQIZqG6dL3ViUhH1VrQxPR1Dx4lo5GiPFLhbjYja
         78bqRI+OtMonfF7Iox+DgGcRSpeMcLIXzrP66kPUmPNUqwEt8MlNedPyRrCMk8KGPmvU
         enC1FHq/nKo5RViysOK6/JGjG3bnjB6SYyULEVBeOY+IavdVx2gHY8bNVcpjygThSEJM
         2OSVqEWgFsq6ptjgNcA2d4JYhFNQrzzkxOzxY1WQyadMhTMHbmHgvD1tVhS2Dys9L13M
         e3z0Ia4mLHb4hsNIuvjD3R0JNsibsYw99jHVcRI5a2IgvaM0WVexeJXQdT4Yv708c1rj
         o+fQ==
X-Gm-Message-State: AOJu0YzHQmlyhk9wGONl8z+fnWwmU3jSaOecR9xTTK7x+EIzn0OhZ9FL
	ly7LSrIarztLhelVneFIT2Q4gA==
X-Google-Smtp-Source: AGHT+IFdjEbMZ4SAIgiXAHGarJ2zK+RGLw1nD4/QZyl9nTQOxkoQxpDwatU9eTBPhuxrPLxRaNdHlA==
X-Received: by 2002:a05:6a20:1610:b0:18b:9053:d865 with SMTP id l16-20020a056a20161000b0018b9053d865mr4810361pzj.42.1701714550706;
        Mon, 04 Dec 2023 10:29:10 -0800 (PST)
Received: from grind.. (200-206-229-234.dsl.telesp.net.br. [200.206.229.234])
        by smtp.gmail.com with ESMTPSA id it19-20020a056a00459300b006cdce7c69d9sm1806224pfb.91.2023.12.04.10.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:29:10 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/3] RISC-V, KVM: add 'vlenb' and vector CSRs to get-reg-list
Date: Mon,  4 Dec 2023 15:29:01 -0300
Message-ID: <20231204182905.2163676-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_102914_416930_FE691682 
X-CRM114-Status: UNSURE (   7.81  )
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

Hi,

At this moment we have the following problems in our Vector KVM support:

- we need a way to deliver 'vlenb' to userspace. Otherwise it's not
  possible to determine the right vector regs IDs (since they vary with
  vlenb). In fact, KVM will error out if 'vlenb' has the wrong size,
  even for vector reg 0;

- an appropriate way of delivering 'vlenb' is via get-reg-list, which
  ATM doesn't have any vector CSRs;

- even if we do all that, we're not initializing 'vlenb' at any point.
  Userspace will read vlenb = 0 and won't be able to do much with it.


This series aims to attempts to fix all these problems.


Daniel Henrique Barboza (3):
  RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
  RISC-V: KVM: add 'vlenb' Vector CSR
  RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST

 arch/riscv/kvm/vcpu_onereg.c | 37 ++++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_vector.c | 16 ++++++++++++++++
 2 files changed, 53 insertions(+)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
