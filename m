Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1717C43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NJzYjnewLylS6Dni9kc+RGBW2HVivazWLLOIzRBD1Ns=; b=Y/+N9RSLjFLCNL
	irJepMhxeePJuMW3dNVn/BwN7M3fss2/1RW3VBmmqvcW/D1ObHTUIGOjq8Z0pwRcz9oqSac38tI7v
	+8fV6ul2wNjM3xEarEosJahVhbjnp1pkEspqMs6cSrwVhtWwXq05rCizbVQS9HuJHKK3crAAxbSmo
	zGUf0zR+MrSOS43S/RcQBXjj7idQ9/LWveTXXB/xdPbrAwxkAIIvqZOt1Z8W6SzUAFtaRo70A37Oh
	VELanZVCWj++DrNPXzszHGSsYYUVAfsy71h63NXeXlfLYBKn3dVlXg3RvDaQ5LU/xBOErxyQbOlXE
	unqTGLcVLGkEwesA9KcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp4-0000000BMZ2-0uFN;
	Mon, 06 Jul 2026 02:12:38 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp1-0000000BMXN-0HV2
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:12:36 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c88973b6965so2315834a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783303954; x=1783908754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dIh1n7XhPeXmjid24h9f0o5uRyG24o7+K7i4gn1uk1Y=;
        b=kza8c26yIbPpMkzGO10TgWsV5Vny5S2BVKnogeoNoQbbWBjy7z3kF3Q2NY9Q4uqfIS
         cKc+KIiZR3WmlEejrONwW4rt370S00DlMAaTMISYhRzimc5X9yNj4dkE5IRgy+Mtwsbh
         15iWaWSRVdDynMXT+58N/ObgoYeizQuEYmikLcMfSKpFr5LIP7PDKg9dbIq1t4xJixzb
         +mGwRUUgwXNQ9e9srIvuEmJN2/9MghqSSSjcRqFfUvCb0w+aw8rQhqnBnoLIOuVN8NSc
         inZzoi3DUUN7LzeiV/mYXApCIyTlXzLpsThF8FIQRUYQm2VQzLAXxOkq3C7IAGDCtH4g
         3y2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783303954; x=1783908754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIh1n7XhPeXmjid24h9f0o5uRyG24o7+K7i4gn1uk1Y=;
        b=eEfwv2T5v+vVAXqdyl7dK8F2Vm8AHSILlavNVN4lDlW2Wdi7d/6bxOVt4KOwHNdkPq
         sZAMfFoWyC+FlYsiW3n3lBDIUXN6yxo2+u8BUKADHFLaw0NSjRnzhDueAHlrqYDr9sto
         HbhiiI9hIMZJxwltZXKlDtXqbaozH+LnOYtYLA32jrVjV70PonYXrgOdRir59U6ESJe2
         BGlV2dHUgUo0uyOR1Nma1Xik/trgbmgksDLxA9vLbTt3MdVjaDCbS+qNLT/UefBJwjHb
         ORtsYuNOKfCixMbCriuaxDnh1/SWxwRzGp5USuSrNF53riqWeQM284iRgMZMhTtXgLOY
         fsAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYRu/jjM0Z+uf8E2qOPu7GUPAj5Dpo1uFgzluCCdOwAFs31r9axUEKV0PLvPL/ZLhcCtXrVNLkLWygAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHBgDuSVNe52lUt71MeYUTMp6G6JxAaVio0V7wuv3nEycWUCvr
	U0mT8xCUGhqhlf86vikm5v2DPpKOwYtEEtoElL/rGQL+MRt/CacQTgq37GraCnRN
X-Gm-Gg: AfdE7clk6vhaVSRBtCyvQ0SVzXT9b5hXfK+SpnZkxiBfCb52FaYv2BJACn4aKDRx5S1
	1xrm5QhKH1EE/NKXJSohEBa0+zYA5mEze0FMc2d5txux3a7FMBHIU4sYvbLQhFRzfSsRrM8Ah7H
	5PuzbDdNOotVI0ynf+vhgXchTrBDR4QzjqyvQ+FGCZ11cp6kaHZ98gkqcGxgBRuh6B4+M+KZF85
	TFRjrwjIqhkEpx+Ws4SEGuhQkgTwG+wmgjYJjxO6XyNGNTIt9epUKZomVy0gLr52Aa08DoKrpt+
	f215tXBrnK8YHppFtXkRcHY0rSOvaXup15TFIVcpN1q60T6RTTyXJ+4tOSudNw0vmNbXReij4LC
	bvnV0yIU5zvNMwZgwISLyNhGitUulB9fqUK+AsDWUq2CR30esHa8REy2XHxVhVtFA
X-Received: by 2002:a05:6a20:3949:b0:3b4:a0c0:6cb7 with SMTP id adf61e73a8af0-3c03f789afdmr7377836637.11.1783303953788;
        Sun, 05 Jul 2026 19:12:33 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e921d28d9sm5091574a12.24.2026.07.05.19.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:12:33 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 0/3] RISC-V: KVM: Cleanup SBI extension status when disable
Date: Mon,  6 Jul 2026 10:11:49 +0800
Message-ID: <20260706021154.210289-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_191235_107157_DEED1A2F 
X-CRM114-Status: UNSURE (   7.15  )
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

KVM SBI FWFT extension has multiple internal state can be programmed
by the userspace. However, when the FWFT feature or the FWFT extension
is disabled, the internal state will be kept as it is, which may cause
some side effect for the vCPU, cleanup these state when a SBI extension
or FWFT feature is disabled.

Change from v1:
- https://lore.kernel.org/kvm/20260701094731.1022163-1-inochiama@gmail.com
patch 2:
1. Check support callback existed before using it.

Inochi Amaoto (3):
  RISC-V: KVM: Add SBI extension validate callback
  RISC-V: KVM: Add SBI FWFT validation support
  RISC-V: KVM: Reset the SBI extension when disable it

 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++++
 arch/riscv/kvm/vcpu_config.c          |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 33 +++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_fwft.c        | 25 ++++++++++++++++++++
 4 files changed, 64 insertions(+)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
