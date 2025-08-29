Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FD1CA0FFE
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 00:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6EK0mObu69+W3/UNDwetKdVU5Oq2JyyrR2/Sgmk2Zc=; b=J8o/zrRb5Z5HHI
	KxjCu9GnerIzqhOBoqKTuTcElmRNeZnN5/zsrR/2nFc3ygRWVyqWmCBIYzHIe+JeoL+uM3gZ7i7O/
	TbyzOmNJa5DqNPb2iBJN9RnwducBiSyMhC4Kk7PXgf+kj/9NrmQ2+5SZv7TzHqDIBUDYLvr8ZV9A1
	04c8x3WviR7z4IAGGJdkTMwokfBV09JUFT3A3u7aXCyf5ziJ2LqAeCLoLSZj5AL9NQH6NcbmzD8Th
	xbP76prgL7JH6FDtBcKjM9pEsJF3xiopPUq0XcnuLCEJ+0aZPgUnB5ZkxKeM4rV1OUSOwfs0zthun
	kq/WWG4Lb5kOFAUguJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9lg-00000007Ab7-2HlP;
	Sat, 30 Aug 2025 00:48:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us2fN-00000006V0b-16xx
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 17:13:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94231435FA;
	Fri, 29 Aug 2025 17:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5A8C4CEF0;
	Fri, 29 Aug 2025 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756487612;
	bh=TDpt43ch3xVFskhEnjng4dGYL5sbO9BabNljtnfMN/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQwBaTjCL6KvIS8b+9WD6cJfEZVYh0GnSyDb+kxAYAu9n3ltNjoi7P+fq0HMWxwbi
	 v87zT06R8+j4T/eRdvDOY7VhricaDjCyvgncYqxAd1nuLhoeCIDbcwz7iVsO9UeEH6
	 1j3BIX3mdIUZxfQ655xmxjMjb9PZbpg62cTvL6eFzuRpgCbA/bi5S75EWU4cg6OqAN
	 J/nbr8nICiMg0YmtI6CsTnQwbpSArhuIY7Im/XW5R31P6MqjBqbrgPtv+1l9LDdEdY
	 AWp9ulPoRQO7nousGvMgM5z/jegWgDQ3YWfRn3GPGHPS3DQvbXVaIGV+NsOS8hfR1H
	 7Nl0NwY+D0ROg==
Date: Fri, 29 Aug 2025 12:13:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: unicorn_wang@outlook.com, tglx@linutronix.de, sophgo@lists.linux.dev,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	bhelgaas@google.com, lpieralisi@kernel.org, alex@ghiti.fr,
	paul.walmsley@sifive.com, kwilczynski@kernel.org,
	xiaoguang.xing@sophgo.com, conor+dt@kernel.org, kishon@kernel.org,
	devicetree@vger.kernel.org, s-vadapalli@ti.com,
	thomas.richard@bootlin.com, linux-kernel@vger.kernel.org,
	sycamoremoon376@gmail.com, palmer@dabbelt.com, bwawrzyn@cisco.com,
	chao.wei@sophgo.com, arnd@arndb.de, 18255117159@163.com,
	fengchun.li@sophgo.com, u.kleine-koenig@baylibre.com,
	krzk+dt@kernel.org, mani@kernel.org, linux-pci@vger.kernel.org,
	rabenda.cn@gmail.com, inochiama@gmail.com
Subject: Re: [PATCH 1/5] dt-bindings: pci: Add Sophgo SG2042 PCIe host
Message-ID: <175648760972.1027309.4591259567798589217.robh@kernel.org>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
 <c9362bb49e4d48647db85d85c06040de8f38cb83.1756344464.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9362bb49e4d48647db85d85c06040de8f38cb83.1756344464.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_101333_321565_36177E16 
X-CRM114-Status: UNSURE (   8.27  )
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


On Thu, 28 Aug 2025 10:16:54 +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add binding for Sophgo SG2042 PCIe host controller.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/pci/sophgo,sg2042-pcie-host.yaml | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
