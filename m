Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A43C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aThpb5/xr/GiJbTIENMviKv3rD67tQxhwKsEvdm7mMc=; b=tnTDEEGXQgtat8
	79uZwOMxL5ltQtbZaDijUxxzp8oo8gOkhEEY6Y6v8ZWXX+arsweJSL2YZHKp75aGxeCLUM60Cxgcp
	G9lpf+d9nwv//z/RSW6goJVLin+Qx8UbWqh2dTEd+GQUttBX6lYoOFBloVn37r1k2ELvgmd1bZLsM
	Rj9Z/FLeeDdHG7SWnbtjLPsVkavewfcoltocTuM5QEu165zLqBxjL5OPeanZwJaU8zMkoFZPW1VLj
	6QvhklQZO9EcWFO25h004Xc/NvqD+DcRwDgrO2OFPXsgrF1ZJND9bpvaBYNgi4tjgbwKp5CeDS3kB
	G7xtlKcUyVbUddXMp1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olmuN-0068Xj-Je; Fri, 21 Oct 2022 07:57:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olmuJ-0068UE-Sw
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 07:57:33 +0000
Received: by mail-lf1-x12a.google.com with SMTP id f37so3701304lfv.8
        for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KpsylIcJcyYDvq7kbh4L6nLN082ExQpNZ7EI3rLx/bI=;
        b=xNNq7cdCHlc8fDgPKqg6rA8FUz2PQ0AhqXn4dcxRAnd1EaiR9sGPwdLjyfUvAjuSSM
         0LYK1a0ddo8UUn50BXeBlCejjSopQc9BckEValTc6w8YpHt228c8oOeIw3l8YHOItYbw
         dujypay23HQMCz+L9LC1F8SSNN0KNSdIRZVMuDQkfe6Sjl9b015hn2QKGEY551S3OWA+
         EjzfcHn2Jc66I/EZswpnw46Ji4c3su5IdtgrNNvb+VIIN07aTJHb4En04C5EbfvM4wnk
         uSzgEuTzaQTsjyqKrVvOjb1Qe9BzFH3iRmNZPQGkCQQbSVrN7vCcXm1+oQ9OnHPN2v1A
         aagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KpsylIcJcyYDvq7kbh4L6nLN082ExQpNZ7EI3rLx/bI=;
        b=7pjryV11Pajdm/IppaAdQHyvJ2da18B2cmU/swKZVIM2gTc/vyTXaSkLOhKB9SAXlc
         oc3ReM1RmRSASg5qQeOkV9B9+QLtNhfyKtA50/dM+qxSKMxgIeQ3HLNOkMe+wZUq/tWn
         YBE11tDwt8AnzdiICrGSjoBVmE3winQrHSH559qdyIL7kJyXcXfraGU4NEiC+WjyvK0/
         l2DPkEv23hG9iBRQ+PqeTkY7KJ+mrAKqR3riNFec4xsZSYt9hG8+hSQRi1sZCyhMh4ap
         iy0+b38yW40vpvz7Q+6SBQGRry9R1MLs3wwiDh7PxfZrSp2FfzAPtoGh9OBN3G9JoYoA
         HSBw==
X-Gm-Message-State: ACrzQf1pKujwkYyZDmIkaBOIY7nyM7bQEFEO3g3bqm9I5+LvfecS3sdr
	psaEWrQliqEMW7/qTvkpp6jrMxxGNbQMUg7lfeQlhA==
X-Google-Smtp-Source: AMsMyM7MPtXymXgi91qUU68WgZmUxp+2pwD7cQPNMpeJf1I+PZIaJdim8yTKye5v4pLc/WZK/kyDVihrfiQE1xUdpvY=
X-Received: by 2002:a05:6512:1599:b0:4a2:70a9:fe79 with SMTP id
 bp25-20020a056512159900b004a270a9fe79mr6525962lfb.298.1666339046248; Fri, 21
 Oct 2022 00:57:26 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Fri, 21 Oct 2022 13:26:49 +0530
Message-ID: <CAAhSdy30JYf3SjDaAm6LHTU-yD36Nb8=FYaPpECm68O8XFdBDg@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 6.1, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
	KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_005732_199698_51A80459 
X-CRM114-Status: UNSURE (   6.70  )
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

We have two fixes for 6.1:
1) Fix for compile error seen when RISCV_ISA_ZICBOM
    is disabled. This fix touches code outside KVM RISC-V
    but I am including this here since it was affecting KVM
    compilation.
2) Fix for checking pending timer interrupt when RISC-V
    Sstc extension is available.

Please pull.

Regards,
Anup

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-6.1-1

for you to fetch changes up to cea8896bd936135559253e9b23340cfa1cdf0caf:

  RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc (2022-10-21
11:52:45 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 6.1, take #1

- Fix compilation without RISCV_ISA_ZICBOM
- Fix kvm_riscv_vcpu_timer_pending() for Sstc

----------------------------------------------------------------
Andrew Jones (1):
      RISC-V: Fix compilation without RISCV_ISA_ZICBOM

Anup Patel (1):
      RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc

 arch/riscv/include/asm/cacheflush.h     |  8 -------
 arch/riscv/include/asm/kvm_vcpu_timer.h |  1 +
 arch/riscv/kvm/vcpu.c                   |  3 +++
 arch/riscv/kvm/vcpu_timer.c             | 17 ++++++++++++--
 arch/riscv/mm/cacheflush.c              | 38 ++++++++++++++++++++++++++++++
 arch/riscv/mm/dma-noncoherent.c         | 41 ---------------------------------
 6 files changed, 57 insertions(+), 51 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
