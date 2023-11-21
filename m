Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06EBC61D90
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 21:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=y7nMzAOSzWma/BoKUkifrwRjQgTc3Fzpsb/JO363VGc=; b=tLaj9+riZx/58g
	HxR8eaR8LjpU9loTojv54Dld48G7LT9V4Mj4l+ss+cKo8xwiAY/3mCmwrCKsEjg01GBh4gWEMUzRb
	vnKgxWA9v+Q6aDEGu9fx1z26OKUknAdsmHIuGYz0/Rfxm4GgNS5Z09ESRfsf89ihxDZ2pLiNvdoKS
	jXL5/P/GHX+TNbVGKrRYfSGklKU38UPYPH2InbqOz7AbehPNFdGvID3liRYC0Qdpa3lxXVVnte2pB
	ecOYqT0qyfr5BvvNVMCh+GcHfquHO/UKAoBzAQZX4IraHmnKZ18FVvw7/4maSvowP6vkwWzuU0Rdx
	fnF+NMeOHHPIZS7zHs1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YLy-0007PF-2n;
	Tue, 21 Nov 2023 21:32:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YLw-0007Or-29
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 21:32:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4AF0619BF;
	Tue, 21 Nov 2023 21:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EC73C433C7;
	Tue, 21 Nov 2023 21:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700602335;
	bh=X2pX6zjIezmOphz2fsepwof1up+Wj7drUJ9WUWnm88s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=QfTakCdQV8fvOFgAXcIyUOQDs2rJgK2uOSKu59J3XdHZ2v2BCwE10Nyfc+vv8aalL
	 7K3Ok6GSc6zNsvLmOLMRYi3ur5ch5bduBBWpcGHd6BAit8h0XdQo1VB5xCmKjiViEY
	 KMxirtK1cKoJaLO+fkC4jTlZGU16LmuKN3jla02bswEb3F/k9JH9zfpXrrLmycnGKn
	 urKheLGBEKFmGXyxhVbQVS3TtWCSBB9bb3VbFq53B037iLlzAQlkI+9Sh5uJE0Lh9o
	 pekgOsGoM2ML7SzaLyWYUudKG+uI5pCfqx9nmdxtKoSL69Kur+83dlGm0qQ2/51j5D
	 2VXyhh0KFGNUA==
Date: Tue, 21 Nov 2023 15:32:13 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v11 19/20] PCI: starfive: Add JH7110 PCIe controller
Message-ID: <20231121213213.GA258296@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ad43c202-3796-469c-b7fb-7591026e6888@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_133216_750560_D3CC3396 
X-CRM114-Status: UNSURE (   6.92  )
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

On Tue, Nov 21, 2023 at 08:52:21AM +0800, Minda Chen wrote:
> ...
> BTW. Could you give any comments to Refactoring patches (patch 2 -
> patch 16)and PLDA patch(patch 17) next week?  Thanks.

I think Krzysztof or Lorenzo will handle these.  I skimmed them and
didn't see any major problems.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
