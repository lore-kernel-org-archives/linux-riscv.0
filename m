Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F6EE7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=y8q4VAlTs/HxciihS/h1AfICjAvgU5l+K52xpvAfLg0=; b=5Gs+aC4s9hW5vg
	5ewUZzEi2p20+XAue+K7fvAD3MLQBSIHBDEGiy/tnzGHFsG372VLCWHh9rBDyOn1M3ZR0RJqNjkiM
	+A75eDHzDABHFB1dFvYzkGHDxZOHL1eoXiovecnrln4+db9TVIERIHXR2mf3e8PYnKrECHzt8yGUT
	9NZ1T7NATmeCMeF9LoqqpaPsPJdhADYfAyWuTZFGKTGoHpXsgzhQsby+A6SC0Rog0HMXnr2OljMb0
	AGsgMwMAgPKf6XHcdr+IUnaqdvWJ0et4esu3XqV80vyUZEH6kiarj1ydLugsjtXNSCa/oX69XBzS2
	rmTUCJd2545fncuU/0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4BA-0000000CIhD-3fOt;
	Tue, 10 Dec 2024 17:37:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL45j-0000000CHZH-0QA2
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 17:32:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 17C335C5895;
	Tue, 10 Dec 2024 17:31:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E42C4CED6;
	Tue, 10 Dec 2024 17:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733851930;
	bh=IxO2jZVD7vsyOj0R6kZ+Q4fChpCEVzfOmGWNeuAqZU0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=t3OlXSDRD2a/bgR5s7zm+vNw1rGNC/BISmDSJjCWf4bs/Y+TNQDnMA6iqkulof9xn
	 H/bWksCsWwz6x8hTF4NKS5WohswdbbwbYsqoTK2ud2J6ivC74OyWwKupVQ+aJNAZ5q
	 dwENrC8DQS3YCT+llKVL6hHFzOngMso7aXHPTjcbJAJZKys5n3cpjeI6+rtnXWVl+E
	 P16KlrudVnVpRprYCaYU3WuycyYS4XryHRmAilipCk92y/QENjunkEki/FaesgFgxN
	 1Yjgv4HuK91TTUD07aHXt0qZA75lZrCW31QSEJ9ReVziEKbCaKuFVYp6swwdnakM+l
	 /98oUswqsptoQ==
Date: Tue, 10 Dec 2024 11:32:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: kw@linux.com, u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu,
	arnd@arndb.de, bhelgaas@google.com, unicorn_wang@outlook.com,
	conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
	krzk+dt@kernel.org, lee@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, pbrobinson@gmail.com, robh@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: Re: [PATCH v2 3/5] dt-bindings: mfd: syscon: Add sg2042 pcie ctrl
 compatible
Message-ID: <20241210173208.GA3248062@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29ceb01afb1838755b4b64ae891f51a5b1bb7716.1733726572.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093211_175818_B671A37C 
X-CRM114-Status: UNSURE (   5.06  )
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

On Mon, Dec 09, 2024 at 03:20:14PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Document SOPHGO SG2042 compatible for PCIe control registers.
> These registers are shared by pcie controller nodes.

s/pcie/PCIe/ to be consistent (also in subject and other patches).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
