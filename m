Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC94CA5FFF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7LrNFUwNawa25562DtETetQWF37ENgVLr88ztItAHuE=; b=v1Dgvq8LfUKD27
	cuJL93e8BvPDNSn0T0ktQ3s8iUEQGc/wIoKcf6YidxIKWmIaQo21JaAFYcEx2gAwTXfxUt22JHGej
	APeKhO9Q7aerpX1bXq1PqZf9CZA1eRn/OEQiwF2xN931FV/UyqCnyBXMtNJeVTP3w+nn+cjFsXYeZ
	8QLu5GKY7w7T6SyF60lNXfDMoM1jH2vCb2jGfF2v8J71vG5YglSn8kEC1dlu0dB0pVdW4Jbu6VSns
	az5bLy4A51ZEiLqGeFwHkogujH//MpfHBMDg2rA7B5H6hNFehoEnwccDoQPJguT1LpC3stgqE6WZr
	5j5sa5cZFKRT9tp/lVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN7-00000001zN1-0m4T;
	Wed, 07 Oct 2026 08:51:33 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENN3-00000001zKP-1rNi
	for linux-riscv@lists.infradead.org;
	Wed, 07 Oct 2026 08:51:32 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-15dd124bbe7so932583c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Oct 2026 01:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791363088; x=1791967888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCMbjJ3X9YJK0WmXEdBRTsj/mM68fTtj3FZOapjyhk0=;
        b=BkCvaROCh57/nfdi2q57nEA7ShQXzr/EHMLt4UkjFvJnruk4kOXb0IXERd6//B6tof
         OnFbGaOZZl5R0UMerzAqCl+F4iyQmI9HEWxY/f+Ypq7/+PPWruG/IoZGsve9Yl4Bjr6l
         C53pLh82cKwkS42+loKiVDT+dXXoeheArIPCMpBD3fuOPYQRUiTyVcFYxt9VavTxFHua
         gC3+dUAds6fD+Z5qYLw8YPprqxO8g2qqlNV/nULizRrg0nOFyrFDr0Mr+cVWvLchNkTu
         XufAgm14BUWJwK9FAQ8O1q5BPGYBPUSabSMebh0pzAOIlS+hnaXWzAIaMxY4zHTCILOO
         HRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363088; x=1791967888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCMbjJ3X9YJK0WmXEdBRTsj/mM68fTtj3FZOapjyhk0=;
        b=L2K5vz4Qe8+rOhU6gjtipc8iLA2ahKtUxBKamK1zO6k5AAwqZHvTSs4M1HSKu0aWf+
         ubbJUe0iyLxtINmJM8wczjlppBp/3R3TqR6TeFq5V6ArZiTE+3hrH/MD3/OJKwAWgTF2
         mblrZ9pW6WXE0qpQJqufGDCVbCXmfRYwfr9/b6ARUggwubd9zZx28Ikzr21MBuKzN69W
         qvnr6oUaUpjwYx1xorlNVkiVt+r0bZrWeKe4CmMHx8qp8FhH537EAirMMQxUmvcVZ5eX
         i3YY4uoBO2wOFIDXDwKBRQ3n8eBcMmD0Jf8c/aIhiokY0oXiWGt7CHu9+hGOD9JA9WTB
         IrGA==
X-Forwarded-Encrypted: i=1; AKwUvBwu3euNFtKzBcGNi4gBWLZq8/kDAp1k/LXK3nAfMF3do7LLDPY1YK6aoZpR9ZRgfyOm7qGzqgjABgN22g==@lists.infradead.org
X-Gm-Message-State: AFuF++leawv8OnErI0eWjKnqsrz3MVDIbdzXs3RU7CMrLEEYPp14NYcp
	yh25RQf3UMNdNl/56uOghbIXUawakZBJHBnzZ9TxY8XdV6PGemF7RPezr/GUo57lW5M=
X-Gm-Gg: AYBFou187/HlvEWAhLpg0LwlZi/2ZSycIdyWTi9/oeXZ+jb9bzSgV1TffPb5IAohy+H
	2CzcABSeGY1u+9xBzfG+s60UzIkNfXoUFnM0WJupb1d2ybp4MTjYajB2SzrnxHBTEvYookG2zx6
	cp2omSnbgP+8A/x1T2FsdyLbp/UzZw6G7EkUtOuIAfrXCcqL2hZQfMukyjKNItG3+SeTHJeBytA
	pHFKO6wPOxjsXcv8BwC7t+YJhGWlkyjMr0mBsBhZ292CHhSHnQW5fXP6vTt7HlVCOlZDURY3pbG
	mikta0RXJ/xWSAU4MPqt2uL7N1MkWLsnfbAvKClbWxuR3pg+XFvdCeJp2I6/kwXlN0y4WE48RdT
	fHI8xdxHNFtUNxUn1LkNWzUZVEVfYwvUjNesqbktF8G7gz+7+J0djbF9oHWL4yOLgxXb6iXhWUy
	CvFUqk/Dqi1L84dwrQKUqJ6w1tMIp20U5+kHWpL/pYP69d1Cq2uPFnSX60PPtcd3rQhF4TBBhCe
	tC1PcNyCUbhsrCjhiCz
X-Received: by 2002:a05:701b:2314:b0:151:d6e5:596b with SMTP id a92af1059eb24-162057f2d5dmr1554267c88.9.1791363088227;
        Wed, 07 Oct 2026 01:51:28 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-163e3c5bed6sm396251c88.7.2026.10.07.01.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:51:27 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 0/3] riscv: Deprecate userspace vector control interfaces
Date: Wed,  7 Oct 2026 01:51:15 -0700
Message-ID: <20261007085126.222688-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015129_484461_9730F013 
X-CRM114-Status: UNSURE (   8.82  )
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

After several discussions within RISE and at Linux Plumbers 2026,
consensus is that these controls create more trouble than benefits, and
should not be used. glibc will not support using them[1], and we don't
know of other users. There is also no plan to add similar controls for
future extensions that add register state (e.g. matrix).

Let's deprecate them now, hiding them behind a default-disabled Kconfig
option so distributions can avoid exposing them. Hopefully they will not
pick up any new users, and we can remove them in the future.

[1]: https://inbox.sourceware.org/libc-alpha/20261006134856.42295-1-palmer@dabbelt.com/


Samuel Holland (3):
  riscv: Drop CONFIG_RISCV_ISA_V_DEFAULT_ENABLE
  riscv: Deprecate vector state prctl/sysctl
  RISC-V: KVM: Decouple vector prctl state from VM ISA

 arch/riscv/Kconfig                 | 13 ++++++-------
 arch/riscv/include/asm/processor.h |  4 +++-
 arch/riscv/include/asm/vector.h    | 16 ++++++++++++----
 arch/riscv/kernel/vector.c         | 12 +++++++++++-
 arch/riscv/kvm/isa.c               |  3 ---
 5 files changed, 32 insertions(+), 16 deletions(-)

-- 
2.52.0

base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
branch: up/deprecate-prctl

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
