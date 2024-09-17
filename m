Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F4DC3ABCB
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 00:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yKQoy4iNqAhheuhd7UjNyLZZC8rhcNiq4smUOfDUPb8=; b=RTAdNLJ/tTQzbD
	diy0l7UsefMSfszA4BdVbZzyoPL4blLcTC/cZq0ITVPNwiOcx41dAR1muZwk9naOjuiyKSoP0gNst
	98nS4/VJwcmMIUuG5ShqEbLLpsykRW8vuJGs336QMhtvXKGPRuwiqMgCBvCl0AmOVf2iUBwlfnR1i
	yAXq2tU2MXXHpku2EpMq9HoED5kGKsmyFIWQvAEvbTFpD+7nX5vqfy5FKE4e7N7A+y78GHqWemzf/
	mi4g4EXPrDNlv9iTfN+b/rxSdbJXPUgkfxOpubbpm9LRSqAxRMonF9DeKQJt7XzEGQn1indYepe2i
	P+CDBX3vJIdQvXAm9TmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqLq7-0000000588m-0lBD;
	Tue, 17 Sep 2024 00:13:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqLq2-0000000587r-46um
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 00:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726531981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Tmm8QBHX9hBz4OCA1JEiQcNTP6WIrwV8Na168B9eMdQ=;
	b=QUQi6mQARitzueaRiYUfYYkzR9C4YrKNVsHWE5nCZ5yQhad57BToeTrsw8bUyZ068d6ygv
	5APmIOKVOb5H/LBImmtBPDWj9FXvnRUcvdx9lJbPlHw5gZFP7yzDq+25Hnwc2n1M9Z5oe9
	cDN2X8l/8Njn0Mdk6imha2Mr3HH5TI0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-OfS7JZjzNMSMz883jHp9-Q-1; Mon, 16 Sep 2024 20:11:02 -0400
X-MC-Unique: OfS7JZjzNMSMz883jHp9-Q-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-45856a29545so98554091cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Sep 2024 17:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726531862; x=1727136662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tmm8QBHX9hBz4OCA1JEiQcNTP6WIrwV8Na168B9eMdQ=;
        b=KA66w1V6JM2Jjos1vwpRqN2K+gFtfeJZYFPx3pdjbkP8YFW5MgcrOV0KSeInYGHOWm
         1M7bACm7R+gRvYutPGnF4qQGwWw+YgU5KrOhfvhB0N3MQsWzkGxd0pV146v+PBZEtnK2
         HnC59lAeihhzQFWI0vSbFvxEd8eRA7vDy+HDQA7nJ/e8BW5yj46ycT0RaL8oZQ6OUsw5
         dBWLt8h45aMpFwvqFlJ7Boden/jM9Uu45rOpV5uT6k4rWS+85hyh+GhOjDz9qS66v3G2
         WG2wiNliE/g/AuEhSpNkm7qpBiRyayX/X67mmfivE+WTFXjW/FyK2wN7f3bJZUcKeJ0X
         8/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWv0xdHPpKuySBAdog5ZLf4sob8wiCPSgxvtzVQyEUhSsqFBWWFJAf3J8RwgMwswB9zjhXhyhIBBbwqAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8ygZDsS7lwa3GgqEW/QkgX+oy65hnRo+ECBWPHf+bV+GV4i1c
	Sr/F5gDyo2CO7aLzEtZTcID+H64tEIztKgb/7T9FGyAH60vm8PmQZoxw9QZJMJ2lqqUkX4aCIdD
	8/B6vUYZXy6HQB6bgYIJ47wAbljrg08WVxgh8UI5hHxruE033JowAp44hIasFnbhOcQ==
X-Received: by 2002:a05:622a:53cf:b0:458:42aa:9853 with SMTP id d75a77b69052e-4599d2393f1mr205215131cf.23.1726531862053;
        Mon, 16 Sep 2024 17:11:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPpDTLWSZw+zeRZnpq/bYJ/50ETGEyIM5xiGEn5/ULUALhOfBRgLa1LxUZ/Zwgxif9zNnwBA==
X-Received: by 2002:a05:622a:53cf:b0:458:42aa:9853 with SMTP id d75a77b69052e-4599d2393f1mr205214611cf.23.1726531861627;
        Mon, 16 Sep 2024 17:11:01 -0700 (PDT)
Received: from towerofpower.montleon.net (syn-066-026-073-226.res.spectrum.com. [66.26.73.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c62633bsm29221956d6.25.2024.09.16.17.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 17:11:01 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	Jason Montleon <jmontleo@redhat.com>
Subject: [PATCH 0/1] RISC-V: Fix building rust when using GCC toolchain
Date: Mon, 16 Sep 2024 20:08:47 -0400
Message-ID: <20240917000848.720765-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_171303_101053_87692A5F 
X-CRM114-Status: UNSURE (   5.92  )
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

The following patch resolves errors encountered while building on RISC-V
using the gcc toolchain with RUST_CONFIG=y

Jason Montleon (1):
  RISC-V: Fix building rust when using GCC toolchain

 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)


base-commit: ad060dbbcfcfcba624ef1a75e1d71365a98b86d8
-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
