Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578B5C48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 18:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VEae/ty4sVBRyniSohzhii4CdzZNAKrCAaO4JidmHGg=; b=f25KmQlOwZxykI
	luFRJX2Yhqa7wlS+4KbP5AWb/TLcJzDgNAqxAXhyCrUb3hd5HCRj9SuPAEc9vkIg0FEsvFrBbD1zR
	2KDCoLhBSYsf9+OWFIG1rZ7bauMxnyP1wpwDSPsnBhwjBHW6iwRq1yaCq+PnhlOkZ3vN7vnEETi4g
	GdKFuoIb0gJjIyfauKNliVqiSdgEoADW9vH/ASD/aLN0ROj0wLRupZZox/OF4nqP5uWTbXukLjaaD
	T0XZ4wyYcfBdjKUfRDh/wqJc587aKuTlFnezgdy5CHTzUwgxw8LnMsIaDSMQME/QrTi1sEqxuEpIV
	nyBQZSJ5MVhjCE+ywdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxwZ-0000000CmK9-2CLp;
	Fri, 02 Feb 2024 18:07:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVxwW-0000000CmIn-05pw
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 18:07:13 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ddc268ce2bso1531064b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 10:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706897231; x=1707502031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uVRplVyrc9nYcvh+2WwM6XgSY33Nf8X5Ft1+PR+SGLM=;
        b=axzfbajDZDb/bolJx6yWNWH/Y/dGSBNf6DtuXrVmZCdbwrby81prytoQE1fwZILnLy
         pM9AxK9s9k8P6vBYScS3YBUsF85efWyhcSApSsv29NNGKJQtZ9mmQSOtcp0hpAjm0r3J
         1w+ga3Xsc9n/xVeTd7Fj1oi1RlyvsBeStgIIC+pkjdCIe/dVBKu1u+AC/l5Q3rRmAuS9
         5OSs1ryoF7Zgd5ZVJb5GK5hy7Xr3aVOCqbcDGAJmWscN0OkB70JNfli5sPLUXFux8WiO
         nEgfBNzwDSssYn3X+0i0j1FFfHKSWoJ6gvlr5lrJkKnk3Gbfg24DnW+/9QqdU9qiCMh+
         vRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706897231; x=1707502031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uVRplVyrc9nYcvh+2WwM6XgSY33Nf8X5Ft1+PR+SGLM=;
        b=OwZpNlFFKEdgxb3wA1GyYhxn7B211iCgFi+CtTbeU4Z3HdMCOV+dkrbxInmSAbnHLX
         gErM5MBxcqUR0tDePKjPCOjgcMqc+St2P2h1RltoxelB+CfWdpM0D3UF8ol4rp0pBvk8
         N6kMgKFflzwgcBqaSbgbj9AU9Phpt4iw2ne+efZk6aHs9dOw6cwDwbsQbeTkmD1VjW54
         t434ZzRnAI5Qb23TdmB20wKkn0ULUlnqtwbgPekiR+S8IQNEd+4H4iiwev2pM3Tv4v/6
         TVkJ+aB9+ASG7xFl0uh96gWSg+5eRdRa2q2aJwxjKW+GIW5apDmsL5JPB9EF1Fi/jF60
         HebQ==
X-Gm-Message-State: AOJu0YwLUcrzmZAHqPNJ5u6z8otjmbah3rujA4vkwo3kUqlWrtFGOlrm
	m274IjrvplpThCNfOiAKnmnEh5LbFvAvrCPV4lXcexhT6LxiAL30bQkydcZDfoQ=
X-Google-Smtp-Source: AGHT+IE+O4aRjNZAkR4CFJssXFXmF1HqZuyzjr1MfJIhR3KvlZdvvP0MmdCf6x/znHNOwFk7h6HKPw==
X-Received: by 2002:aa7:8895:0:b0:6dd:8891:c4 with SMTP id z21-20020aa78895000000b006dd889100c4mr10813749pfe.25.1706897230894;
        Fri, 02 Feb 2024 10:07:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV5IZ51+bmx0aGfXOAVxSYK/DIV7nwJoXATKClGG9L55mbhsg0f2xhaPbM5gDVgWuvaSDmKn0b8kOFbrtm4RnU2XbBlR8L/qiFduUki1lgDESJzNlNH57tXCv0N0ylOqjMvYeakFqb9CRxWqDhSXbbu7ZT5W38mJVsH5UZAmZfUY/IF7uwD0n7aPGNH6cmaj5qsfLMYix37h8yGxZUtRW/zg+Z0ykChA6kFdHB6au4p8DQiEzPsZg5BtsDXHcuHCd8KpNFzQlgpL7pN
Received: from abrestic.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b006ddd31a701esm1989267pfe.19.2024.02.02.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:07:10 -0800 (PST)
From: Andrew Bresticker <abrestic@rivosinc.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: [PATCH v2 0/2] efi: Fixes for EFI_MEMORY_SP memory on RISC-V and ARM64
Date: Fri,  2 Feb 2024 10:07:02 -0800
Message-Id: <20240202180704.808766-1-abrestic@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_100712_088579_A3AFD744 
X-CRM114-Status: UNSURE (   9.18  )
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

Two small fixes to enable the use soft-reserved/special-purpose memory
(EFI_MEMORY_SP) with dax_kmem on RISC-V (and ARM64, I think, though I
don't have a platform to test it on).

Patch 1 fixes a trivial integer narrowing bug. Patch 2 prevents adding
memblocks for soft-reserved memory so that it can later be hotplugged by
dax_kmem.

Tested on a RISC-V platform that presents a range of EFI_MEMORY_SP with
Bjorn's MEMORY_HOTPLUG series[0] applied.

[0]: https://lore.kernel.org/lkml/20230512145737.985671-1-bjorn@kernel.org/

v1->v2: address comments from Ard

Andrew Bresticker (2):
  efi: runtime: Fix potential overflow of soft-reserved region size
  efi: Don't add memblocks for soft-reserved memory

 drivers/firmware/efi/arm-runtime.c   |  2 +-
 drivers/firmware/efi/efi-init.c      | 19 ++++++++++---------
 drivers/firmware/efi/riscv-runtime.c |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
