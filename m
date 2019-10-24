Return-Path: <SRS0=OP9P=YR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B86CA9EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 10:13:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3AC20663
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 10:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oeWztN2J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="cTWe2LNo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3AC20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=3jIb8BHpndl3cEpzlUB4yfKo9+vpY8+j2yRuEPB1DCk=; b=oeW
	ztN2J8VWM2hKBZaglhavqWQQLsp+qXhwjk7MmGQzzKq2P29cEC/21qjhhC2cYiKNI7EoLmcMJDkrT
	5H3dmickQfpjxPd/pGF9FDvqg9i6dKKV/l7xz+7+C8kvZiMnoRpSNawWstLsrAtyCJtRGJtKIGThc
	noBmo0TdjrGRvEEhk5TFG7HsDwPKNdYb1TbiLbNCCY4MR670ToRJ+6Ajo9RzHwDxYBVAQ3sE11tOc
	H0r3/OXOUBqQSQSVp1j6Tdyw34U1F+JuUGykqFD2WKO9Fwv89nViKdN1uqhGitvsPdtt4R1U2oIzL
	d0LaRQ52OMbL5FfTvDEuEuQ0bb4gSTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNa7u-0004sE-7Y; Thu, 24 Oct 2019 10:13:54 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNa7R-0004NG-2C
 for linux-riscv@lists.infradead.org; Thu, 24 Oct 2019 10:13:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id v9so14120485wrq.5
 for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2019 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id;
 bh=4e4CMe8f6py1Yt2lWLrn331C7GRW8uLQcBzyGRI9nf4=;
 b=cTWe2LNoVh1mOyCENVn7zpGv3Jprre8rDXIaPx76j+yvm1hAVwpu6ypxuWj/UlDG97
 I2oGLcNkL8BrxO7xHx2/ggo3DF85rMITBcd3ReMP4P9wlSe/Km4gkC2pZ+KiWQRbD1Ub
 oUOBZe7O6NpUfMuls2FITbvA/QIqoL2gGBGoTs3Sn6F5kl9WU1rliddwVhPBlkqkn9m1
 Lphmv7GnryVkgYA2cAn/Us7kHpjQ0Omkljg9UkRBs0ezBVER1StVBdwBnkO4Pzx7gs//
 2BwDWL51kb6jgX/pMfJ4olGJpU45RWhG1faxx4yo1ZoMybOydnuSGIvh54WChKjDxe8h
 lKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=4e4CMe8f6py1Yt2lWLrn331C7GRW8uLQcBzyGRI9nf4=;
 b=B/9AKwaYXNAj+qMiNLzzU5/IWXSn9FOkpEtOiB4UDtFa8sL1bxsGj2NQo/aV97JPX8
 E6/qxrPqVG/6XWYgKCGOR/mFwDciucTxvryHsVdfJBPPKHjDBYeKMG1Mb1GMRT7v6eoI
 db5yS4Dr81YC1lu2tX8qIidiCsC7jyP6tt5Vdq3fctw8xIIzfS9opkReE7MC0dWQzjeh
 OBy0WVMf2gN/4oGy0Rzo6FAEA/lTT/OOUV4xf6YA11eoPOswn9iFy3jgzEbNdl7hvZOQ
 nbbhObZ+f9xswJGD3TsAm2Y1Jd7SkGso0kMYvqmBC/18Z3HObE2plGbIRdWmIMik4npX
 jC5A==
X-Gm-Message-State: APjAAAUUiWDYVSSZySyvMJGlCPAHFiz0hVvzRAEf7wlLoWQnqVZecJQ0
 Ls1vjPJNQHXukE2yVminQlAfvg==
X-Google-Smtp-Source: APXvYqwcFnA4ofb/Q4g7Tcra8udIzZaJReC4T76gGILoFLWpLp7LWZeYpE1c6/ZFH9jYdiQyaQs7MQ==
X-Received: by 2002:adf:92a5:: with SMTP id 34mr2881720wrn.337.1571911998458; 
 Thu, 24 Oct 2019 03:13:18 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id i3sm20429658wrw.69.2019.10.24.03.13.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Oct 2019 03:13:17 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, palmer@sifive.com, hch@infradead.org, longman@redhat.com,
 helgaas@kernel.org
Subject: [PATCH 0/2] Enabling MSI for Microblaze
Date: Thu, 24 Oct 2019 12:13:10 +0200
Message-Id: <cover.1571911976.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_031325_145968_3CDC6BB0 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Eric Biggers <ebiggers@google.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-pci@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-arch@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, Jackie Liu <liuyun01@kylinos.cn>,
 Russell King <linux@armlinux.org.uk>, Firoz Khan <firoz.khan@linaro.org>,
 Wesley Terpstra <wesley@sifive.com>, James Hogan <jhogan@kernel.org>,
 linux-snps-arc@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Vineet Gupta <vgupta@synopsys.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

these two patches come from discussion with Christoph, Bjorn, Palmer and
Waiman. The first patch was suggestion by Christoph here
https://lore.kernel.org/linux-riscv/20191008154604.GA7903@infradead.org/
The second part was discussed
https://lore.kernel.org/linux-pci/mhng-5d9bcb53-225e-441f-86cc-b335624b3e7c@palmer-si-x1e/
and
https://lore.kernel.org/linux-pci/20191017181937.7004-1-palmer@sifive.com/

Thanks,
Michal


Michal Simek (1):
  asm-generic: Make msi.h a mandatory include/asm header

Palmer Dabbelt (1):
  pci: Default to PCI_MSI_IRQ_DOMAIN

 arch/arc/include/asm/Kbuild     | 1 -
 arch/arm/include/asm/Kbuild     | 1 -
 arch/arm64/include/asm/Kbuild   | 1 -
 arch/mips/include/asm/Kbuild    | 1 -
 arch/powerpc/include/asm/Kbuild | 1 -
 arch/riscv/include/asm/Kbuild   | 1 -
 arch/sparc/include/asm/Kbuild   | 1 -
 drivers/pci/Kconfig             | 2 +-
 include/asm-generic/Kbuild      | 1 +
 9 files changed, 2 insertions(+), 8 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
