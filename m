Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313E3C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 20:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w+F231bJAus07xs5YmZSkT4sDeXGF/F5xKqu5QvCiLE=; b=ELkPDjSH+AuVoC
	+RKE8twjSHdwRehG29GHqkyst4usJ1mIlb+Le8/ScDaKGT4dnivdE3r343H+xV9p0EBrxe++QlvFw
	73+w2dTgr4bcX4K0sjmgZN08jIsjn1ZdU1DdWG/mFY9Jv6yyfuJHDUBOfdP7MJPPBCq4rGk6sI8gq
	tEZLy6fFZpGGke/bvT0gbqVP2HvWXkUoDoCmodSzH/meNBBI45GKTM/x+56C1Mk1L3oAShl+WLuQm
	/HJAGjbx7gqN1qVms9goOP4md0zWt7/hFa+ZdtDBG1YOER6Gn3Y/Hzfe7fwVD0iAq9698590rLVCq
	wkGGCYIkwgFtgrx09DHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQZXO-00HHNm-0N;
	Mon, 31 Jul 2023 20:30:42 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQZXL-00HHIv-0g
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 20:30:40 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2683548c37cso3597218a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 13:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690835429; x=1691440229;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HESCPn2yqkRQlomTDEJ9KEelTSIJogLeTLwuEF5EyM=;
        b=bIOTcPBKQpMsQ2T038vAoGELSwehmJJHLXxm0vf7EKuC0vlU7oM5xb+0JHY8DMrTa6
         vjiCtfDi4kTL5EtobGmC5eLwYHbbPwoALsuGqqELp5A7ErCquVX5RBodMXTmxdcTgoIT
         8kq/f6qU3bnUXYaTjESLcAXCoJvZQITEk4SpczPfkH8r3ILgy3m6n3RJ/v2yt6dXQ5Tq
         yN8F33WdnVS7aXG/I3E80Chr/bnZInSl3kaP12QzmDAm0HT/ApcbtFahnvurMVvg3cfr
         DwCh3X+vO2C96IswGqZFhexHyjKLpwTvqH5fXuFj7Xr5L+1/Z2YMfjRHJ0BN3KDE8yVp
         APBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690835429; x=1691440229;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HESCPn2yqkRQlomTDEJ9KEelTSIJogLeTLwuEF5EyM=;
        b=RQZ8ZdjUeF0AWNrV7hCEj54ejRFyCyWBp7lQYO+zsJHUWjmn2E5bODUFPYprj112B7
         /Wms5PvgvsvgDVEHlRRaAQC2LwNM63yLENGRBUoA+N3YQT9x31x8IPtSgeO9SO8GCWwa
         3gmtuYJb/Yt7uLcK2Y0bLglr2qn43tX7/ry1wiP7gviqdUc2O+dNrvPfHXLYQFaIQ/Yn
         LpvrToQdethje8R7xvyG79sqiAu9g3Ivh4TVNco6WlCFV2h81bIYyYvh5yhN0+y5/kgr
         mtKCNd678NfbAgEwJLohtFIuMRPu4vYc0Cm9YQfDAj98fZ8fdPHIuJTgobAMC85ZRPFy
         anuw==
X-Gm-Message-State: ABy/qLZKoFzgQlrbYhdjOJeFw38lW1zmHBxmhC5nuEMaK95yCqLePxOS
	FU7oA6FENu5JzioNtvoY1AF2xOqGmdc=
X-Google-Smtp-Source: APBJJlHgxXlg8+gvx8zA8kKWT9TTiDRE1TpIeTm8T+Air3m+lXVJ5gOGOil9KVUs5jELG98CZaMGEync9vo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d4c8:b0:1ba:ff36:e0d7 with SMTP id
 o8-20020a170902d4c800b001baff36e0d7mr46611plg.12.1690835429354; Mon, 31 Jul
 2023 13:30:29 -0700 (PDT)
Date: Mon, 31 Jul 2023 13:30:23 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230731203026.1192091-1-seanjc@google.com>
Subject: [PATCH v4.1 0/3] KVM: selftests: Guest printf extra prep patches
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Aaron Lewis <aaronlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_133039_254936_F0A012E0 
X-CRM114-Status: UNSURE (   9.45  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Delta patches for v4 of the guest printf series to enable guest_printf_test
for all architectures.  Sending all 36 patches seemed counter-productive,
and I want to get input on adding ucall.h asap.

v4.1:
 - Add ucall.h and have each arch UCALL_EXIT_REASON so that generic code
   can query whether or not a ucall exit actually occurred. [Drew]
 - Use UCALL_EXIT_REASON in guest_printf_test.c and enable the test for
   all architectures. [Drew]

v4: https://lore.kernel.org/all/20230729003643.1053367-1-seanjc@google.com

Aaron Lewis (1):
  KVM: selftests: Add a selftest for guest prints and formatted asserts

Sean Christopherson (2):
  KVM: selftests: Add arch ucall.h and inline simple arch hooks
  KVM: selftests: Add #define of expected KVM exit reason for ucall

 tools/testing/selftests/kvm/Makefile          |   4 +
 .../testing/selftests/kvm/guest_print_test.c  | 221 ++++++++++++++++++
 .../selftests/kvm/include/aarch64/ucall.h     |  20 ++
 .../selftests/kvm/include/riscv/ucall.h       |  20 ++
 .../selftests/kvm/include/s390x/ucall.h       |  19 ++
 .../selftests/kvm/include/ucall_common.h      |   1 +
 .../selftests/kvm/include/x86_64/ucall.h      |  13 ++
 .../testing/selftests/kvm/lib/aarch64/ucall.c |  11 +-
 tools/testing/selftests/kvm/lib/riscv/ucall.c |  11 -
 tools/testing/selftests/kvm/lib/s390x/ucall.c |  10 -
 .../testing/selftests/kvm/lib/x86_64/ucall.c  |   4 -
 11 files changed, 299 insertions(+), 35 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/guest_print_test.c
 create mode 100644 tools/testing/selftests/kvm/include/aarch64/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/riscv/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/s390x/ucall.h
 create mode 100644 tools/testing/selftests/kvm/include/x86_64/ucall.h


base-commit: 12dcd9e1fe9264d306837622952b8f79d1181fab
-- 
2.41.0.585.gd2178a4bd4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
