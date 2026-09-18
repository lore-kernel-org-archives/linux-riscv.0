Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE117C982D7
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 22:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJ6VWEgjJ5MgAwSivuvpVOwwfDsFOB/Sos3+oOM6Qq8=; b=YQ4uYS6yvsi68Z
	j+UPcKUcbZMXmhYJ/J9usqVHEPDsqklh/mkW4QrNaXRwztVIVeQubVnzrbS4PI3A6r3Y7y313Npbp
	vqqtkUeL/COVZHAyKE+VUuPd1IBFOiPDvnTRnIV8hFr8Dy4AJWxQ//CmKbTPxwfUV70ZKvL7+14Iz
	hSzMMm5jS8vR+KO/Z4OnwNrDpeXcK+QStXLCGFyQYJuuz6uGygnW7pU9FRZF1mjptzXOy1mpzccFT
	+2ZIToSeE29c5RjhTyviyIwuOYPETOaSIixX+vuOT2bXULo5GRH8gr+sFOm9Rx1AOTujbnOWLjSUf
	ieVAmqocied90zLloKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hTN-0000000Ffjs-0G1W;
	Fri, 18 Sep 2026 22:54:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7hTL-0000000Ffjm-1PsF
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 22:54:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7D51411F4;
	Fri, 18 Sep 2026 22:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B6A1F000FF;
	Fri, 18 Sep 2026 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789772062;
	bh=U2ut8MhnRGde+NfAcK9tBoxoZW+uYmB+NXxOZV866LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nN7BFoNw6F/IbGjupqiEg686x1ieDl+PNAXWEQ2ZK4xMOdalGfksWHFGjYN7Kh0pn
	 uq2sgX7VZVO3fQkWFycevHoFSaCVvstQqSY/3ZlZiKoFqahsQ833l1upwArzaWteHh
	 6CIsnKs5u9DPrwOsVV4GTDEthYAqKNvjXKJcl2RCVQF2RChnZKD43c5RkmVnRJarH4
	 XlDhfN4H7RSgZWX027u3gQlL8EDD/ZqPp7gtGmFh4QfozmAMt92ieJEBEahdZ29EcV
	 CgPEwsLK8P7xkzoT/O0zWnBmfalJoEXiqB8+3IRonk3ZfK2EJZ2ei4FrAOlCsBzqZj
	 wc6s9o/5pWauQ==
Date: Fri, 18 Sep 2026 22:54:20 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: add cpu scaling for 3 boards
Message-ID: <20260918225420-GKB297024@kernel.org>
References: <20260804133236.205668-1-a.heider@gmail.com>
 <ac94820c-5e34-4f07-91de-d08e1d4ef629@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac94820c-5e34-4f07-91de-d08e1d4ef629@gmail.com>
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

Hi Andre,

On 11:18 Fri 18 Sep     , Andre Heider wrote:
> Hi,
> 
> friendly ping, anything left for me to do here?
> 

Not really, I will handle them shortly, there is one minor
issue, will fix it while applying (no need sending new)..

WARNING: please, no spaces at the start of a line
#33: FILE: arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts:87:
+       cpu-supply = <&buck1_0v9>;$


Thanks for the ping (and sorry for the delay)..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
