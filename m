Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B4DC7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 14:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FSCuM/5EVoDVTxt2IPeNxuc0wtOYiKyaVY6cdL2AYBU=; b=zyfb/446XGxUzK
	f+j96JB+MHoBRaWfq+2xaqrWhZyqwD3OOmvGBrJWsOxRYHbbrTkFXpGPKjIWa0kXAgP80JTUXFV0F
	Xts5vf/0AuouZ1639uFDDonnLwviHcQWSqRTsEwHMThngfKZ+us71h8Dk6+hcQDxZKOUv454+/hoZ
	Jo220lwZPmwaQWgIlIMujZPpnk2Qpjsy1RDSyxvNH7nGu5z6ISIJaMHSE7AiJUJz1Dl+0JdXO6TJ3
	+HzGyjHGv00LPRW6YnD2o1k/9hBoPcg2Li95eZTgaOo/65oNYpFseiShVTwwE+7+hPN3JpXEbENS5
	LXQVj/kZ3wUFj0BEQZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dMZ-00DJRc-0p;
	Fri, 09 Jun 2023 14:45:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7dMU-00DJOZ-0l
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jun 2023 14:45:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-652a6bf4e6aso1525656b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jun 2023 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1686321907; x=1688913907;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slFfiATLS6KbBGeLkwlt6rux1fUkrlOTmgnn5cG9CUU=;
        b=NBQfYFvKoeRVP9NiYWPQiuQIo9tTte0YRhBCFqqBsXYgbxXDjqjGELgNcsRAEuxg6p
         s9ljX5t/VBwWQP+l3rtZ2ilmf1fBZikRPYr6+p+5gbQ5et0D7pz5SRCfp2wHLhI0HpIZ
         iOS+5vp/GGUUmH81geer8O6pIl0MCjEP8HDqqv5uXe75zkDDZgpAbz/Sb5ZckgBzxiij
         9IfZdRfL7FkZzW4EqjaKOgnXn3PAkCMj6qqPhPY2IPr9+aqSR5nN+4ebkEgi8M/9Vkxi
         R/QUfWaaNR9AzMU2EwA7gi1VuNalSRZDtQYlSLV2Ns28S9MITFIABQ2ZTx9dQzQGEqTt
         xY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686321907; x=1688913907;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slFfiATLS6KbBGeLkwlt6rux1fUkrlOTmgnn5cG9CUU=;
        b=f234w5je3PC5rJOOmFZKPBe4jPXRAB9q79rvHZH7Zu5z13TiD3wozRJKzRRTH/xXmV
         NivIP8k01cDxcDtwPDys3Cv46Nw8gRz7jTcEmcx5CPGDrZCytMjtfhlmeHsFHy2gVl4B
         aNzRRYKeOfTVbcD/NpmoLeLuNsBNDXBq/ltbMdwEnOVS7m3c8yEcoipX2z2vOyjKiZiK
         mkIXOMIdVVxyykOMLXiSlIgOc/LQjmKwpzm6RZv+gCj75SBp5bWi2/bR50mHogjQWUx1
         C1dnqlMU6Hyfu0DrSMfYY9qO9bka7TyPZe/Vr2ChkS1xh6NF7jJ9vEQYeP7cc0QzDgyq
         4TQw==
X-Gm-Message-State: AC+VfDwmMPD92LlL/j0NXpgRVUH7JdunZg6mGBu5/9Xf2cb7N7Eq3egn
	4aOeKduqSDd26/Biy9yXoD2ENkmt5qhPablTCTE=
X-Google-Smtp-Source: ACHHUZ6EhjBUnoZdMxi0gY/CYXsdhcsyJVfrTEIeo4192q9SlJICqoj//ZSLF38CXNFBwpvKpjlEvQ==
X-Received: by 2002:a05:6a00:21c9:b0:654:4989:f2b with SMTP id t9-20020a056a0021c900b0065449890f2bmr1335985pfj.1.1686321907024;
        Fri, 09 Jun 2023 07:45:07 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id v3-20020aa78503000000b00639fc7124c2sm2845387pfn.148.2023.06.09.07.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:45:06 -0700 (PDT)
Date: Fri, 09 Jun 2023 07:45:06 -0700 (PDT)
X-Google-Original-Date: Fri, 09 Jun 2023 07:44:23 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.4-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-bf5e8144-98a0-441d-b6df-63978648c75a@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_074510_277644_ABCCC551 
X-CRM114-Status: UNSURE (   6.40  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 6966d7988c4fb6af3e395868e9800c07f9e98a30:

  riscv: Implement missing huge_ptep_get (2023-06-01 18:15:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-rc6

for you to fetch changes up to 99a670b2069c725a7b50318aa681d9cae8f89325:

  riscv: fix kprobe __user string arg print fault issue (2023-06-08 10:23:19 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.4-rc6

* A fix to avoid ISA-disallowed privilege mappings that can result from
  WRITE+EXEC mmap requests from userspace.
* A fix for kfence to handle the huge pages.
* A fix to avoid converting misaligned VAs to huge pages.
* ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE has been selected so kprobe can
  understand user pointers.

----------------------------------------------------------------
Alexandre Ghiti (2):
      riscv: Fix kfence now that the linear mapping can be backed by PUD/P4D/PGD
      riscv: Check the virtual alignment before choosing a map size

Hsieh-Tseng Shen (1):
      riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must be readable

Ruan Jinjie (1):
      riscv: fix kprobe __user string arg print fault issue

 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/kfence.h  | 33 ---------------------------
 arch/riscv/include/asm/pgtable.h |  3 +--
 arch/riscv/mm/init.c             | 48 +++++++++++++++++++++++++++++++---------
 4 files changed, 39 insertions(+), 46 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
