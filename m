Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E60C4C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PK5U9E9wW96HptyeTjt5C9Vv3kdj2i0Sf1DxYGDcGJI=; b=lNjLz7FGvMul5iuiYfNyaK1ppo
	5mGq/ukuayCyhaZFh0He79O7pWC5SVDrAbTb8HoC7qSrfGKtPIdvZA99KP7bX8ELti9rmO5PrBb7u
	zA1PPBB49VHMmYSb6HD0/9tDUJ/x3KnOFP2k2ah4bFOTTdmXfzm5CEHIREP04xacUgp8gh9M5ncNs
	FGsPIhbqh74TUyoMAnWYTvA1j+1HboOvjGWMLwwPcbv00LLOFuMQKqbJfi8yXRS5R3Ysiwrng30Gc
	1VkjRgPd0kqGtsCBS3U9xRxcbKWilxMgi7cKTld+vAOo/ly59tfvQ0DqtxgM39XCtIpGoW8ClIi9+
	jecDctRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppuiT-00BW40-10;
	Fri, 21 Apr 2023 17:38:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppuiR-00BW2d-1V
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Apr 2023 17:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aDUI7xCr7dWf/FkK1CK1yXAqGXh9n1NZNFj54qb+KHU=; b=mrqz3BuEA8tWjSYdJf5xdDz3Yx
	wqsMAecT8wMECpGd5m+luAxBa413frPXTxDJENiNANcWRFmv3I4dlZ3Ew2wMMvsYtAI7GNXSEd6hq
	VDAAbll3EPNxZJXDiRoipvu3eK7J/Dr5wkhEs8gh3wJKjpzn4oCOq+JcuZFMDHEtW8jqOhLIDsH1O
	kt56OvWsini4TfH/Pw7mrUuzKe1AV06GMKqWF69MWXuWKsUX2qTNPcg152H+xUhQYVh0O2CePnHF2
	UUmzXNuhlcS8I3sl8YeYjexUn87rUhUy9SKPwXQn8HYljoicOerT1/6Mpj6Pu2URvPKBBEcDVVeUc
	K8rZkdKQ==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppu0h-005NC2-0s
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 16:53:27 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-63b656aacc6so2758012b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 09:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682095999; x=1684687999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aDUI7xCr7dWf/FkK1CK1yXAqGXh9n1NZNFj54qb+KHU=;
        b=xTDct9zxZ9N8ALbPUp/viW7lM9BRRuwGhBUMNIpBcky3DENAIpUsYaKC4hxy6ElANa
         XJM0ALn9fzQGXWa5TwxvUayRtY+2kF+0hSFrS4Z13rLNDvpjdJ1bTkvnlg/aszqM3kw6
         JwtYRMMCwqvts/H9WPbPOWtINNCHPcx52iHlR+Mni7gOLO5npE1/M3beOvxeJdJAoVtK
         oYpcB0E2UWuNNPfDE3N6K7L1PsDilnRRB45iG1BH2Hs9bkLyvvb6zqJnC7OL6glGnKD+
         tqNazVeTkEV+I2VUzEqOogcJ5o+xCg88TmCeF1jcEtkdTpDT5v8zElAEZqy2mA1rdmJ4
         ZLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095999; x=1684687999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aDUI7xCr7dWf/FkK1CK1yXAqGXh9n1NZNFj54qb+KHU=;
        b=TrNWQSWVBVkZnvMrvToyH0q3+LbKn9HU/aHsSmaz75DyLlizdGR0P6LdF48qHGe4w+
         OYXTPjrey2a5Gdvp1XkL9a9SMR+NufWH1pXJx/vKLzAUugbwRHvdAjl8L+G429njEJjL
         tcn3NHnIXm5entsSra+iMpmypO5J9zmiyvpcUAu90w1VlK8wsOlDW6th287yaLyeu1/Z
         EPgDwzJ+kiV3SvIPf0pLZX/YaoA1G3wzd+RW589IH/OnXuG6sOjgOpab6WEB5rAaQgDL
         7V4QA4VyItiLIygVactJoEe2EFcp08WL4E7vKer/HbH+eK+crHrJqRe3UfjGToNK6Gkp
         phqg==
X-Gm-Message-State: AAQBX9eoGHylXcxKz7KjdhoKeF4IpJGqDOhh+YW2tZtvnV8+QEuoudPa
	8Fr9NXaTCAnlBiXljC3VHFA0husyzA5T
X-Google-Smtp-Source: AKy350Y++Ixj3yZzgu1Tm9pviEO/066Z0jMSz5NI0cEsiZPMFyAUWWqVudz+4dZEwY3ZReh5ODp8Q4bxx5mF
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a05:6a00:134b:b0:63d:5dcd:bc06 with SMTP
 id k11-20020a056a00134b00b0063d5dcdbc06mr2146455pfu.5.1682095999596; Fri, 21
 Apr 2023 09:53:19 -0700 (PDT)
Date: Fri, 21 Apr 2023 09:53:02 -0700
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230421165305.804301-1-vipinsh@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421165305.804301-7-vipinsh@google.com>
Subject: [PATCH 6/9] KVM: arm64: Correct the kvm_pgtable_stage2_flush() documentation
From: Vipin Sharma <vipinsh@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_175323_433720_B0962074 
X-CRM114-Status: UNSURE (   8.67  )
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

Remove _range suffix from kvm_pgtable_stage2_flush_range which is used
in documentation of kvm_pgtable_stage2_flush(). There is no function
named kvm_pgtable_stage2_flush_range().

Fixes: 93c66b40d728 ("KVM: arm64: Add support for stage-2 cache flushing in generic page-table")
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 4cd6762bda80..4cd62506c198 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -605,9 +605,8 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 bool kvm_pgtable_stage2_is_young(struct kvm_pgtable *pgt, u64 addr);
 
 /**
- * kvm_pgtable_stage2_flush_range() - Clean and invalidate data cache to Point
- * 				      of Coherency for guest stage-2 address
- *				      range.
+ * kvm_pgtable_stage2_flush() - Clean and invalidate data cache to Point of
+ *				Coherency for guest stage-2 address range.
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address from which to flush.
  * @size:	Size of the range.
-- 
2.40.0.634.g4ca3ef3211-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
