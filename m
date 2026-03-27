Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0E510ED65C
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 11:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02vDo3AAUSRD67UEedCX8FErD56+7UAFwkZvj2GOUyc=; b=1YThIBxKtVgQC7
	S4zbuDmoppvoSyY6WGq9ZSLDj7Laxc4QD1xHy7BP4lMLAsosAEACwDnbuN5qELomqHD1zERHkKlNn
	tzSYh6z2vRt4z7di71DpMk7wGTXWROdb1MDbMf6UI5UcQeIbyj+Xpeha9Ifzr51ab5mkjjY7IM9fg
	/Fh53hzhkPQJdZQT6UxmboH2qVFwhs+41/rx/Py+owL0wm/Nu5wJzB9ssKizUrPgqDwjFsoN4WfOt
	1zdxEmowAa4YU/PD6r9oEaYebAOTFfGmr1h7o0nL0ExLLZIiX0KrPIh1Bpcl8pNb6mY+7QttHaNPf
	ea+A8pO+NBSGWgQ2lXnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Zy-00000007HwM-0H4s;
	Fri, 27 Mar 2026 11:42:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Zv-00000007Hvx-1yQX
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 11:42:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E729640B07;
	Fri, 27 Mar 2026 11:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEB4C19423;
	Fri, 27 Mar 2026 11:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611734;
	bh=QFl4kqD1CXMDcmig90mgvgQHa4TAFpGhjWa9ypPBZVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s1L6hU7TSlEUEytoAbYnGtCrx/F00Ih8LsQL7hcSWLsnvSOsKYrt9CN9zt4QJ7OOb
	 DUN/8Syqyff8FBYTSOPJ07peDbQGs5zWxRtS6yXFvf2E575BgGFdgD000mBe8gd1OG
	 P4ob3xC3hjfE5tbWB0B4rrXgOiyx9ncNdu7f/Ez7RSkkQrmvtpEfnMKzlrW5nFvpPs
	 Ixu2hW0LzmflkhSQhjarSDkRZgZhKBAKCx4d02PWgdugvxbrPRZPQkRabjVTMB2Lvu
	 pl3N6T+KkhPdcKtBXp7fSX+X4zADpEd5XRRIBdnVUH6S3yIk/j7R0EOs8bbMlvE0un
	 LyfjiuGqBZq0A==
Date: Fri, 27 Mar 2026 12:42:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Drew Fustini <fustini@kernel.org>
Subject: Re: [GIT PULL] RISC-V T-HEAD Devicetrees for v7.1
Message-ID: <20260327-tricky-translucent-copperhead-bf3ac7@quoll>
References: <abcEKCNIA9wDgIcE@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abcEKCNIA9wDgIcE@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_044215_529358_023EACB2 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jisheng Zhang <jszhang@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 15, 2026 at 12:10:32PM -0700, Drew Fustini wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.1
> 
> for you to fetch changes up to 9c99a784d9117a192ebf779d4f72ebec435ada97:
> 
>   riscv: dts: thead: lichee-pi-4a: enable HDMI (2026-03-14 09:19:26 -0700)

Thanks, applied (dropping the SoB from tag - no code is in the tag).

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
