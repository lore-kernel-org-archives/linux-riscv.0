Return-Path: <SRS0=akOg=YS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56CBCA9EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2019 06:11:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DE9920867
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2019 06:11:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fCqXYSwG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com header.i=@monstr-eu.20150623.gappssmtp.com header.b="QrKWgESw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DE9920867
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OrOgT5KCRdZDrx3PSwgmu4R8k8nkX19YVmIrTUo0j/o=; b=fCq
	XYSwGEHSbwzg5/soB8L3kywdX4WFFLb6F0XE8kVj9TDRUZnM9E0xNEU9QPjwttKxQRa4T+dnoBLZZ
	gORF/I0GZuuJZq9CQTQimZElXVf274snHUOiqx80nMlI+5EavQHZuCLxVjDZHNNQwK65ncBTSDD/O
	Qats0+ttrFMcJRg6afbCUHV1TMlQw0m+7OcUnog8AL2rlh6FJvcFtsBzatb2ajMNfENZdo8FRen+t
	QLTApqCUpAo985Jz0sCajka2mbh/Rtnx/8BIKJB1qYYrHZ/dT+BEA+JIXhvVj6txVbXQ5fdyMsvOl
	LUJfhQ/UnC6cGL3DZZsJDN1wkGFDzMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNsoY-0005Pd-PH; Fri, 25 Oct 2019 06:11:10 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNsoD-00057K-Ko
 for linux-riscv@lists.infradead.org; Fri, 25 Oct 2019 06:10:53 +0000
Received: by mail-wm1-x341.google.com with SMTP id p21so706422wmg.2
 for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2019 23:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id;
 bh=UZtQcpZNm2bgRElTtB0/YYRtxpmigD0UWuciJCpp5gM=;
 b=QrKWgESwGfrtCnkB4ANF4RDTIvZX+3mgrn+F048ehqIGeg2PIMapuhi5B29YdIPJRF
 OuF/1XgB1E3hujF7fmLSGOWHCpq+9DlFVEduBO8ipDdnjmiangiskHjwO3FsA7j8x1KD
 1Smuo6qnW1seJDFFROI5kLkQKHJzW7j8nL7QRsx6D6T92OoNZE6hSbJWqfQ2kzquPzUV
 EGGwKGRq2Dt/b39DcGka7dZFK17Wt7MIOIDReJEBLetmCZXSMWSBNVp4MthobvqT9E3G
 LimR87SPwJ5FuFVOpPQc3/2WoUZLiJcnk52cJ7R4bO2cA7rCH/FuOM9im/yZQR0mR3/u
 6apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=UZtQcpZNm2bgRElTtB0/YYRtxpmigD0UWuciJCpp5gM=;
 b=mr5HnTeeyDOfY2cEnnNFTIS+xbMh9+1ZjQm59OPfLhBTAK47BGbw2OVeoBgYKsEH2D
 obVFvRRlIN1JP1wa7kF2SEgHz2aqzYVw4+1rG4vAd/2sYVvodqWJY+YzUU2zTnpSx/ae
 PFVRkfxikk5Ouqa8EPiVdHQXWuji2r5J42gbckuY5q1Pb8QOOSjou0Wy6HibQSaxI0q+
 SZr/5CpZ9gfNU/WZ9L0DV2ZTlG2nAIX4dMHQqu1TNHoYTAG8G2V75TybmFQH3ls6SiGa
 BqEd8a7/u3Hlj1vOGQg1pmzqIaQjq9fU8HcsDzpmTN87m7pQ34caDBIONiM4HnUzApTc
 75Rg==
X-Gm-Message-State: APjAAAVviW3mvRlAWN+nBnk0iI/Wgq4j9a32fAP3dTrWJC0zBsD+aqb2
 8JGFf/uUVUOtDDalPuYElMHgQA==
X-Google-Smtp-Source: APXvYqwEgYO6Ro5u2lCKSVB90BazD7V/pF/lyQv5RjmcJQ3shOXOE39URbi4sRXKy/2ygEnJau+JXA==
X-Received: by 2002:a7b:c924:: with SMTP id h4mr1846926wml.46.1571983844471;
 Thu, 24 Oct 2019 23:10:44 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id k24sm6458006wmi.1.2019.10.24.23.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Oct 2019 23:10:43 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, palmer@sifive.com, hch@infradead.org, longman@redhat.com,
 helgaas@kernel.org
Subject: [PATCH v2 0/2] Enabling MSI for Microblaze
Date: Fri, 25 Oct 2019 08:10:36 +0200
Message-Id: <cover.1571983829.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_231049_680997_92FE38C7 
X-CRM114-Status: UNSURE (   9.40  )
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
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, Jackie Liu <liuyun01@kylinos.cn>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@kernel.org>,
 Firoz Khan <firoz.khan@linaro.org>, Wesley Terpstra <wesley@sifive.com>,
 James Hogan <jhogan@kernel.org>, linux-snps-arc@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
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

Changes in v2:
- Fix typo in commit message s/expect/except/ - Reported-by: Masahiro

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
