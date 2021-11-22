Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121E2C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Nov 2021 05:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WXArhDFezmRJeb1yF1uRfUPRcdyZVAVHU07PTmKxadc=; b=IOiAJ6uJZwbeg9
	s+dpQCJJO2WjglE7w57o1sKlaRsR8QZwCIgD2gRVTtmPPEY9yMeDP1Db+mdN3urN35YrhqJNIBdku
	Q4e3zmge1fT3Z/WAFBOvkLdmxFRti9pAQc2vkSXHIgl5oZ9azehzM63KcxSHEdLiNb6dnpkeKZdB0
	2ZqDe+Gi/kHqfKkA1lBk5pyuJRHNmqazWLf9pA2hggFlQLjNns+Iw0FeFs8xhNanG8q6TebHfpbLe
	sO9N9MB9iovUwteABmOEKmdzsspBlNaHTOs8OUDGlGjMoZ2Dm7h8B1LmtabjXFvHUfXTB0b9W/cwJ
	fsgV8CnbsEczActjrhTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp1tL-00Er5y-Hc; Mon, 22 Nov 2021 05:29:23 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp1tH-00Er54-OM
 for linux-riscv@lists.infradead.org; Mon, 22 Nov 2021 05:29:21 +0000
Received: by mail-wr1-x433.google.com with SMTP id r8so30335443wra.7
 for <linux-riscv@lists.infradead.org>; Sun, 21 Nov 2021 21:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=IzITWkNY6G4KqlmKbWmvBujRViOrviBlPuMw4qeNio4=;
 b=IePkvHCFaamUXzPrIPWncNAEKNolntHYpueJ9bkOM7xzw6PizQj+kojfc866YBYzfi
 44HVdxziixR5wdCAaDellKDb0XKWUwZVDqFnyQzfPw55vyGBt1gWwxh4W7FAUPz69lem
 zUTsA8te8KeqUmeCvVHbOIuF757Pgps9bBJs8f9PPx4gkW1lpym4zHJTo3sEnEFFZcFA
 LGnVX5+VSIGhFZOzm35e5t+PtdX1nbXSkQZFgrKyQb2corvpbab+VMGJ3cYm68Hw6ial
 jj5voWFaMVYBsu/ZCN2Duk98l15Ez2Wx/korO8c5dgSk1m0chXn/jfyn0maeoYaggzSa
 xn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=IzITWkNY6G4KqlmKbWmvBujRViOrviBlPuMw4qeNio4=;
 b=e2ax8tyzAUURT/gLTAn7ygFSzjPmA8QybYkziHgErWtWwmd+6x0Ftb220KcCXG57ET
 Zxm7PJgd5E/JUamm4UHs48TFAX/HzNJjVlT0bi7cOFUzlXjXVrqRmz4l+3L9w5N9TnEw
 ZFtKAjzR2GMD68MJE8yA62OLCR0YRAq/ioxzxFlea5gMMM/jPAHjsGdL9dOps8733JuQ
 zBkLI3Rikm0nsrhWXzb+YaKL1cugERjXhVUye8g3OLUkDLJkjdKjN6UWd9hWolGP8wOz
 oEvBF7XVGFEVHmeaqHSk07n4Xns89qU2C/ymmqeTT3dT3K8ZV47SOHakXthdY2SBcCNy
 s61Q==
X-Gm-Message-State: AOAM533Wj27m/yH5hmG0A67lYbbem+1XJJ01+crxK2LHh3pcFHAfENH5
 70Mq3sWqOWdKhSkN6tE/co91ArkAxZRx+1sXpdijWA==
X-Google-Smtp-Source: ABdhPJxqv6ThmF9ny5S/xJBGs1tYPB4GdadcxtNS23BFcgLQvVUPnmA1FmQTsI8O1vLV2aXsZoQhDChnI6Pq4Qvw8Kc=
X-Received: by 2002:a5d:4846:: with SMTP id n6mr33306950wrs.249.1637558956298; 
 Sun, 21 Nov 2021 21:29:16 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Nov 2021 10:59:05 +0530
Message-ID: <CAAhSdy0CZiBSdGaVrDWEeWe7PUXKpE4RLiYeCaEO2QTN3mT83g@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 5.16, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_212919_828400_140AD707 
X-CRM114-Status: UNSURE (   5.63  )
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

Hi Paolo,

This is the first set of fixes for 5.16. We only have two fixes
where first one adds missing kvm_arch_flush_shadow_memslot()
implementation whereas the second one fixes KVM_MAX_VCPUS
value.

Please pull.

Regards,
Anup

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.16-1

for you to fetch changes up to 74c2e97b01846eb237b7819a3e2944455cfdb26a:

  RISC-V: KVM: Fix incorrect KVM_MAX_VCPUS value (2021-11-22 10:36:19 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 5.16, take #1

- Fix incorrect KVM_MAX_VCPUS value

- Unmap stage2 mapping when deleting/moving a memslot
  (This was due to empty kvm_arch_flush_shadow_memslot())

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: KVM: Fix incorrect KVM_MAX_VCPUS value

Sean Christopherson (1):
      KVM: RISC-V: Unmap stage2 mapping when deleting/moving a memslot

 arch/riscv/include/asm/kvm_host.h | 8 +++-----
 arch/riscv/kvm/mmu.c              | 6 ++++++
 2 files changed, 9 insertions(+), 5 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
