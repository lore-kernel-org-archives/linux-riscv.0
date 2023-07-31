Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EB4C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 12:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9eg5HBJj3HiAUUYe5hl/lwzPNa3yObDHjPzl8IjsTCw=; b=uth7WrPvOBhMGr
	TAlibhs0iVnU62XoEmTJRMvd6R+l1QPGgAWyLQF0KF31FOnSNAYAcLd1TYh7OeukDj5yCL3aOrAR1
	HZbFAG2Ce3tp7dYU7ZmrtKVcivGDkgtc7iJukYF/fk0onWPs/XBuvxTeS7RiY5uNxNl509LleaUBL
	Ld2yhPLPmQsT54a94nvmAXzyGNrBxhKlTw1yaescq1SdzqJEUM3kN1O9DAOPok5GKh+jeI5Ig381u
	mqHRu6X7uWhtbGBo6b7OgOoelwRsAUMiCjC5tMp7E/p5CDT7mnmtNy/y9/u2UXhrzKpuUbceeZAqI
	gE6TDQu10Ludg2R287dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdZ-00FUb8-0o;
	Mon, 31 Jul 2023 12:04:33 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdW-00FUZY-0y
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 12:04:31 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a5ac8717c6so3319448b6e.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690805068; x=1691409868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hDob3MHXXNcaLiqNKvSqoQT9DoNULCJTTniscL7mVbU=;
        b=DHJC6BqFq3PMjUazpN0Ywc4O1nr3GirvZZfsldgIrST31HRI3mIKcXzmiAuejNlzc/
         +nIbGTW9ARdC7geBq7cs4o7If87luUrpIVQaboK6Tjwc2wJbLcmcQAybRmLwqESRDfM4
         WyfGFaOsQmMqwZYU2imyZqkLDVY3dcvroZEI3Z2SPJrZ9SiHRqCwbQtd17FxpFK8Y6hn
         96oYlp0JgwPofsFFdca3/dz26W8+0YRlBU71r8PFz9gWL6BO5O/hxlk5EdznxKglTTh5
         vhX9SQ3NE4CtpwQ/mqYhz5KFiLUYcT6eAmeFo6wicvL/WZyaW4rPFwPYMUIw1qnJfzDQ
         anPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805068; x=1691409868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDob3MHXXNcaLiqNKvSqoQT9DoNULCJTTniscL7mVbU=;
        b=Zp5WebsWokJSuugPugQe+wSBzJg0kUvckqEdYtkGRTUsWG5AlwrTZeCa8Ud9Kk/CUP
         isfb/YLBQtZFjVrKL8XmNyyTC7JNIkcVZ0mLa+Nx5vwGLC3ROg7zCwikPkHcgu86zUaR
         7Rtht9RYgBKxXNe+ZAgK6W77CTdvd3bP5Iy7YYmW7k2/drYVHNnBwKsYS3qs9XAgB/Ai
         Q4lNZod+vKwhHD+D1UXuAeLmgLzZ0KUpVTqGEqmpgG9N4CjAKlzf5zwFvFJWgvUPZPYS
         9EjihCnLntzQH2RzfASoyOkQCG+YBN6dX6zPEZSNR+Kl8D0p9t2DxycMW3F4ZLXRYfsv
         kghQ==
X-Gm-Message-State: ABy/qLZrZzvfvX2FgMknJ0ek4hTdbFm6vFsh214wVcDiRdvahnyCMvz5
	CpSecsF+rMLVzegm1C1XrQzmjghrkYxuH8bFHxpIyA==
X-Google-Smtp-Source: APBJJlFMe5jG80omf6JvGauFmZqkxjhs7/FamgLTrJ9bv7s36827emxke9CVSdmEXkYPLRXM77u2AA==
X-Received: by 2002:a05:6808:2029:b0:3a4:38fa:2e08 with SMTP id q41-20020a056808202900b003a438fa2e08mr9660300oiw.7.1690805067774;
        Mon, 31 Jul 2023 05:04:27 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
        by smtp.gmail.com with ESMTPSA id a12-20020aca1a0c000000b003a41484b23dsm3959316oia.46.2023.07.31.05.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:04:27 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/6] RISC-V: KVM: change get_reg/set_reg error codes
Date: Mon, 31 Jul 2023 09:04:14 -0300
Message-ID: <20230731120420.91007-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_050430_340293_19F3DDDA 
X-CRM114-Status: GOOD (  16.77  )
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

This work was motivated by the changes made in QEMU in commit df817297d7
("target/riscv: update multi-letter extension KVM properties") where it
was required to use EINVAL to try to assess whether a given extension is
available in the host.

It turns out that the RISC-V KVM module makes regular use of the EIVAL
error code in all kvm_get_one_reg() and kvm_set_one_reg() callbacks,
which is not ideal. For example, ENOENT is a better error code for the
case where a given register does not exist. While at it I decided to
take a look at other error codes from these callbacks, comparing them
with how other archs (ARM) handles the same error types, and changed
some of the EOPNOTSUPP instances to either ENOENT or EBUSY.

I am aware that changing error codes can be problematic to existing
userspaces. I took a look and no other major userspace (checked crosvm,
rust-vmm, QEMU, kvmtool), aside from QEMU now checking for EIVAL (and we
can't change that because of backwards compat for that particular case
we're covering), will be impacted by this kind of change since they're
all checking for "return < 0 then ..." instead of doing specific error
handling based on the error value. This means that we're still in good
time to make this kind of change while we're still in the initial steps
of the RISC-V KVM ecossystem support.

Patch 3 happens to also change the behavior of the set_reg() for
zicbom/zicboz block sizes. Instead of always erroring out we'll check if
userspace is writing the same value that the host uses. In this case,
allow the write to succeed (i.e. do nothing). This avoids the situation
in which userspace reads cbom_block_size, find out that it's set to X,
and then can't write the same value back to the register. It's a QOL
improvement to allow userspace to be lazier when reading/writing regs. A
similar change was also made in patch 4.

Patches are based on top of riscv_kvm_queue.

Daniel Henrique Barboza (6):
  RISC-V: KVM: return ENOENT in *_one_reg() when reg is unknown
  RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
  RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
  RISC-V: KVM: do not EOPNOTSUPP in set KVM_REG_RISCV_TIMER_REG
  RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
  docs: kvm: riscv: document EBUSY in KVM_SET_ONE_REG

 Documentation/virt/kvm/api.rst |  2 ++
 arch/riscv/kvm/aia.c           |  4 +--
 arch/riscv/kvm/vcpu_fp.c       | 12 ++++----
 arch/riscv/kvm/vcpu_onereg.c   | 52 ++++++++++++++++++++--------------
 arch/riscv/kvm/vcpu_sbi.c      | 16 ++++++-----
 arch/riscv/kvm/vcpu_timer.c    | 11 +++----
 6 files changed, 55 insertions(+), 42 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
