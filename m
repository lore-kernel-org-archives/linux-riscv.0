Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DA9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rjoqhoBAwQOWTzaxBAQTxurrctdldfH+SpAyyKSrSlE=; b=VOCzqZyCA53KxU
	nakFHgBxZ/xWRhxEXSd2Zei2QnDNCYcTNqN8kl6USxVL071tYx6ZqE5M3HBQGuGqTBzPTUCckKVO6
	6rSVI45aUaPqR+hUvICQL1f35U4HWkuluxuxfS32a347ZQIgh0nlOP8a5lO8sLr/ZbIV3ZNmW01z+
	F3dsfgj5wwllMYXAR6CbvM9qSrQ9jyltIErIqd2Uw+dPvSDt6trDfc31OVDsYvMBonzhhgkWzb2oF
	SeXsfsj9uN9GsS+IALqqofOSNetdTAFAueVI2Co28m7pyc44pjnHqZrQPT76FmF4j0F6epF+iCuCS
	7ivcoW46uF70z5+30OWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhYnf-00E26x-ED; Thu, 21 Apr 2022 15:32:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhYna-00E24K-NM
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 15:32:53 +0000
Received: by mail-wr1-x436.google.com with SMTP id x18so7263346wrc.0
 for <linux-riscv@lists.infradead.org>; Thu, 21 Apr 2022 08:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7saXZ0wD/Eiz7Q0Lij9LYsBuK9XeQWJt4sfDjnXCwG4=;
 b=kWjl4CCPwIixJSgXB9ws/rkGP08rPz7GqBRiC/x5Zq28CKoLC2pNNSTAOU7uifTtiT
 MHADrMrPWSik9D+shnVD8R3BuqQLEI/06tU42iUWv11J0l8P8vCZYn2gGq/llzZuv4w2
 JnADsQMCNMyWwKSRQR/fjDXs8ADSVTz2jbrlnkh59111TLWEZdXEsXJhTg1m0g+bzfFn
 8Q69XpA9bqxqx7qAkEZA2uiotTgspyE340Bo7prGw0O1QURv7OnLBswXP/AV0+AF94gi
 hEJNNNI+xsWsLiY9mxWwvCb8m/b1+T7i4lgvkWsncOeNd5ICYKde5b0FfXNzAFzE85ko
 l2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7saXZ0wD/Eiz7Q0Lij9LYsBuK9XeQWJt4sfDjnXCwG4=;
 b=uE7w8UgLNkQtbJ3/iX5Q9YCHtYgzI74R71g4E3tGWLXgsGEZFH0cCNtlYFDmD9nmA5
 cPL+BPB+Z8xnKjuyO2sKCFXEDBL1M0Kg7CBPVAXJuuofu0PILD0nwCBMgq9mph8rfSdn
 kZq90Q3YK5EtaSBV8NVt0kR8UnYqhiBKcISb31SohUEe7XPSOnWQBfCpadX/80A3rObY
 y2VeBniQVFw7L9MDY/HG+TDbr0m8ipbySAYDlU2d1ByQE1ZhRDvF529KluO6st7dq5pq
 u5usEBA/dTZXBcXhXDrz2lTzYFkCdUNj/gOqa3EprvCrdDsMNK2Tv+ulwvjIVnq3CGt/
 pjhQ==
X-Gm-Message-State: AOAM533Z2BEmNPAoWqkVMR1CrCX3HmXE0QnHZj5sQImIE9pnQCtL6ngR
 CFyuT4zUkd2xug+ikuJoPH6RrU13rI69Tjm01n0mfcihD9TX/4un
X-Google-Smtp-Source: ABdhPJxTYUyl/g+eiiAqhsKTukCWfkqpWCDJv5k8bbK0tXT6TfssjfdJoR7ALTaKcKSn4TNsP/Gg7e10uIM9LsHO7OE=
X-Received: by 2002:a05:6000:1e0a:b0:20a:be21:a20 with SMTP id
 bj10-20020a0560001e0a00b0020abe210a20mr251438wrb.214.1650555166230; Thu, 21
 Apr 2022 08:32:46 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Thu, 21 Apr 2022 21:02:03 +0530
Message-ID: <CAAhSdy3io3CdxTDGRVCijO-R2V=GBOukOEs+BH6wYnkT2_iPMw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 5.18, take #2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_083251_002735_6CF2CBAF 
X-CRM114-Status: UNSURE (   5.92  )
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

This is the second set of fixes for 5.18. We only have two fixes related to
extensions that can be enabled/disabled in the isa ONE_REG register.

Please pull.

Regards,
Anup

The following changes since commit b2d229d4ddb17db541098b83524d901257e93845:

  Linux 5.18-rc3 (2022-04-17 13:57:31 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.18-2

for you to fetch changes up to 38d9a4ac65f204f264b33b966f0af4366f5518a8:

  RISC-V: KVM: Restrict the extensions that can be disabled
(2022-04-20 14:24:32 +0530)

----------------------------------------------------------------
 KVM/riscv fixes for 5.18, take #2

 - Remove 's' & 'u' as valid ISA extension

 - Restrict the extensions that can be disabled

----------------------------------------------------------------
Atish Patra (2):
      RISC-V: KVM: Remove 's' & 'u' as valid ISA extension
      RISC-V: KVM: Restrict the extensions that can be disabled

 arch/riscv/kvm/vcpu.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
