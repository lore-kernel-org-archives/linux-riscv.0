Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE7FC00528
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 22:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bJsj15rBfmFaBvk47vZ0MAyhKAJPT/9uuUx2H7V6jBY=; b=3VmFLQpI2llhpZ
	bdaiFzvRzg0QcY5B0M9rSKfElViO+5PWa0xeD43f0amueCidgY63+RHz4Iwf7yHwO8FFqAEZDtq7r
	qrjCMwuMiParsbwP927ty2KjkxHOslFFx7VrSKL3buNjXWo+IGxeC3QxCPpNf2NG1+AcVyDwN8bLp
	S6slMuLEfiS38W1sLI7334zBGgNg5veKGQa+cLztugVPTtKXuJbD9BiQRTOgniueplMBqWYoQAG3d
	EaPtDZ3EB1yVax+149oRTjZITqs2jLY70RE5M0qv66H/9dKSgqwN12NcSY2G3HIbSUFqS6DVnW/wj
	ZUXtuK71hOJtR2EZzw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxp9-003QmN-0O;
	Tue, 01 Aug 2023 22:26:39 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxp6-003Qlf-2r
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 22:26:38 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6bca7d82d54so1901241a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 15:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690928795; x=1691533595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLZCqoRQcOktEsLifQk+vjPW/U/cqKGOg9FG7whue7A=;
        b=PxPmoTcCHw88abd1Yceck0AHNGjXgPVAhecUPv8Y8c8TM3VhwZNxfIKcx2KDlNWAkl
         /2V6X/4VqccEMmtzyEKyW7B5nwbLoMLiacX8H3qtK3FMi7aHz92wwHX2cg215mvLa79U
         6IOD2tE2h1pTk0M0oJM9o12Hd+3CHZlVFZqaxX/gdfuCvsY9hs7SdRRuuubOlktwMbj6
         zeAMVWw+G3gAmRWzuCGd7ullnbVJDxmRodxJUJjmDR0+0KhCeCYABDGDveuqZGAFVUe1
         HyHCkpdZwpIibmxyiL0CA3iz9+E7GryimZRztQlF5Qzbq1ItNUG/62kuyw8L4dR3qFso
         tRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928795; x=1691533595;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLZCqoRQcOktEsLifQk+vjPW/U/cqKGOg9FG7whue7A=;
        b=N7m0P66qVpgDlFzkAmaTx3nJaxSDt+RF5m2NL7qvm7BPwvNz3MzR2Rh8sa0cWUbvYK
         5RpOUGf+rUU3+jnKwn6vBoCJ5kOJfXZRTKvhkT1s5cPe/LCjs0CeXNXGxBOE3oegH837
         BDVBfcZ4nnkHvx523m4dVyuasX1caFl2AzUHcMxPBhAAA/jvnszQaI7ftNRIABOh6LVV
         0GJyQYQ7DnuB3hiPA+ZotyXwwkzgEL9T6ui51gQi2m3EOlqm5+zM0Av1KrXSLsE2GyWs
         RnoTQvmSTn9bsGSTV4hQajQgG/q/YkfCslNmqbj/4CLH7Yz81sAeBa1Gkda+AoDOouoB
         irfQ==
X-Gm-Message-State: ABy/qLZAdS3QAPTkTDJMpJAwVeL3urzKaQdwUSieVy0ynl0miZgn4vIk
	ZbM0QbOvA766Uwf0rb9Yv75hGHF3DqU3CZpWXXpVZg==
X-Google-Smtp-Source: APBJJlHT8CdaBi3LBcyMTRdJqroBd6BY6285JRx0YFJlO7dcIHPSMS7xrAPH/GEFLSAMLKP80G7AmQ==
X-Received: by 2002:a05:6871:a5:b0:1bb:4bad:ebce with SMTP id u37-20020a05687100a500b001bb4badebcemr18624551oaa.27.1690928795375;
        Tue, 01 Aug 2023 15:26:35 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e15-20020a9d6e0f000000b006b94904baf5sm5422429otr.74.2023.08.01.15.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 15:26:35 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/9] RISC-V: KVM: change get_reg/set_reg error codes
Date: Tue,  1 Aug 2023 19:26:20 -0300
Message-ID: <20230801222629.210929-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_152636_935358_F8DF7566 
X-CRM114-Status: GOOD (  12.81  )
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

In this new version 3 new patches (6, 7, 8) were added by Andrew's
request during the v1 review.

We're now avoiding throwing an -EBUSY error if a reg write is done after
the vcpu started spinning if the value being written is the same as KVM
already uses. This follows the design choice made in patch 3, allowing
for userspace 'lazy write' of registers.

I decided to add 3 patches instead of one because the no-op check made
in patches 6 and 8 aren't just a matter of doing reg_val = host_val.
They can be squashed in a single patch if required.

Please check the version 1 cover-letter [1] for the motivation behind
this work. Patches were based on top of riscv_kvm_queue.

Changes from v1:
- patches 6,7, 8 (new):
  - make reg writes a no-op, regardless of vcpu->arch.ran_atleast_once
    state, if the value being written is the same as the host
- v1 link: https://lore.kernel.org/kvm/20230731120420.91007-1-dbarboza@ventanamicro.com/

[1] https://lore.kernel.org/kvm/20230731120420.91007-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (9):
  RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
  RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
  RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
  RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
  RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
  RISC-V: KVM: avoid EBUSY when writing same ISA val
  RISC-V: KVM: avoid EBUSY when writing the same machine ID val
  RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
  docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG

 Documentation/virt/kvm/api.rst |  2 +
 arch/riscv/kvm/aia.c           |  4 +-
 arch/riscv/kvm/vcpu_fp.c       | 12 +++---
 arch/riscv/kvm/vcpu_onereg.c   | 68 +++++++++++++++++++++++-----------
 arch/riscv/kvm/vcpu_sbi.c      | 16 ++++----
 arch/riscv/kvm/vcpu_timer.c    | 11 +++---
 6 files changed, 71 insertions(+), 42 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
