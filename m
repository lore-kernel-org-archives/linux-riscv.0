Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F05ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+YPYfiIZd91lLw/aLs1SsBWx5aNrvBCmyK8kuWgx+vc=; b=OpkbxZDKbAbsxe
	VWKLY5KspUpl1+3WYpLrwvU5wDv6Y5W9+tYwGQ09Awj8Nm6npTvO18Ls1xcNYWiS+aPZ0vx7MvqdR
	nP3DrY8CqDdnzP9A48xJaaLglVr4w+rq0pDAl2ouHxlkrV0tVzuqewkILQlnqnA0vD012Pdh8ubb2
	eTTxRSNZXtlEo78iSdB3KVBwbal/tdP8QJa8+gsXOuagsjcDvaOgLElYn4ZbXpF/ldRCGz8p5de1o
	sjdbMLsFMflPuM809q5oxRR6akrrNOval9VKvjM1ATV4eIuulbwo7yiFW0P0VMlbU1mTJr0jWXGiu
	76Pst+/yV+jxd0eXk2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU4F-00BJRx-57; Tue, 06 Sep 2022 08:36:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU3q-00BJF6-8H
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 08:36:00 +0000
Received: by mail-ej1-x636.google.com with SMTP id u9so21518575ejy.5
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 01:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=FAHlHNyJKVFw99QaoWRjho03GG47PA+i5IVujPtDAlU=;
        b=ngtJX/4wjQcIwDM8yaJ782LwaQfGVkwOXFoI6XcrAKYncZezV63SugSYeT2XJvjvbJ
         cOP/huRjtVtMxoOKCYM9QtEqgEPGp1BnMR4z7Oq1meH1lVTrui3lrZ9lAuvgqDE8q+9R
         sVx41jiADc31yDvJceatVCGIy56uCENPS69C/Dlz01IUTcrK5dhbdIFO/+VSUc3TOvdO
         88ZSBihD4snTa8Pu2T/AgEnyHnhR+dribuBdij/58druvHPZdnHmpR6VABm0lBvfaSr2
         G/YikFKvdVxbh4VsWaV5gO9O5FxeqnImEq41X0bc4fqwwoxU6+SHYlLKQVmqKr5HOcrc
         nULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=FAHlHNyJKVFw99QaoWRjho03GG47PA+i5IVujPtDAlU=;
        b=iKjE3dZ3zzk/JJy8qZwHfoQDd72Vq5SCA3qxDI1lS2WiD+P5ywfsq8wXkyiGfe2ODT
         qoH/7ukko0J3+ZxsOKB9jmx8Bg0AUEqoyJ7/Ktq1+YPhkuvSk+QvqqwNywXwukT/TbG8
         dRx2nzelxn6ou0MWDWRV2NRN2CTO9OIf+6c8QOsXYpM2FQGPg85DVI5HY140VfZU8lWl
         QCmOH4CzkCdMrW3JbmGBydYFuI5FyTOkwCk6grBwGdKwRe/djluF0zQ+0ktfMsORwQ7c
         F1LsM6JrpjZoOkvfUQioL2kIvgz2KyyL6Cja2C4SrOW9adN3q/UPZ4IXTaAHX5T+9H1k
         5MUQ==
X-Gm-Message-State: ACgBeo2KqrXaa25AcT719IPRI4YkSE30UKp7usj2JeTadj1Ao8xSGHxm
	5+tCiDip/c1GEh43vBMRVCZ7PQ==
X-Google-Smtp-Source: AA6agR6GKL8vrSj67V6OoAM1xI9r6/+xkh5Asf1a8rXe72j/6lK7S6YDHYhFZNr6H1xxdjGd9q/k5w==
X-Received: by 2002:a17:907:6d11:b0:730:a382:d5ba with SMTP id sa17-20020a1709076d1100b00730a382d5bamr37826205ejc.371.1662453356867;
        Tue, 06 Sep 2022 01:35:56 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id v25-20020aa7dbd9000000b0043bea0a48d0sm7812304edt.22.2022.09.06.01.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:35:56 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH 0/3] riscv: KVM: Expose Zicbom to the guest
Date: Tue,  6 Sep 2022 10:35:52 +0200
Message-Id: <20220906083555.931806-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_013558_410440_8EA1F9CA 
X-CRM114-Status: UNSURE (   9.28  )
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

Add support for exposing the Zicbom extension to guests. This has been
tested over a QEMU including the Zicbom support [1] ([1] was rebased and
the Zicboz support from it was dropped.) QEMU was further modified to
ensure the cache block size was provided in the DT. kvmtool was also
modified [2] to test the new KVM API and provide the guest the cache
block size in its DT (The kvmtool patches are based on Anup's Svpbmt/Sstc
series [3]). These KVM patches are based on the riscv_init_cbom_blocksize()
cleanup patch from Palmer and the move and expose riscv_cbom_block_size
patch from Anup which were reposted [4]. This series is also available
here [5].

[1] https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicbom
[2] https://github.com/jones-drew/kvmtool/commits/riscv/zicbom
[3] https://github.com/avpatel/kvmtool/commits/riscv_svpbmt_sstc_v1
[4] https://lore.kernel.org/linux-riscv/20220906074509.928865-1-ajones@ventanamicro.com/T/#u
[5] https://github.com/jones-drew/linux/commits/riscv/kvm/zicbom

Thanks,
drew

Andrew Jones (3):
  RISC-V: Output cbom-block-size
  RISC-V: KVM: Provide UAPI for Zicbom block size
  RISC-V: KVM: Expose Zicbom to the guest

 arch/riscv/include/uapi/asm/kvm.h |  2 ++
 arch/riscv/kvm/vcpu.c             | 11 +++++++++++
 arch/riscv/mm/cacheflush.c        |  5 ++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
