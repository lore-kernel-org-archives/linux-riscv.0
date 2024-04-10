Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDA6CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 10:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+gmH8MND78SUj+6w4JNk2SUV4HGP42Z724KKrpispXo=; b=C3wHeKtXF4PcHq
	/FJoTqjYiWFf8WbYG/cjRBt0ohwg+klKdb2azaGZsXz9aXHoqeOyXZj63Sl7AhHd8J1izEOb921fA
	EQdiAiB5hSBUMSswZm+b7v4K5OZsHbh8WGR01/7Vl3+8Ecrwt4me8mC90M8yEF0YjKKCBlTCwdzXd
	Iw7lLxmZOjfXOXQg/T9f4RBXIznGzqP8Djsr/D0dYm64Nf1SVXxXZJF5z9LeUYUv+e8kedZI9qJLk
	P77adEMY87nmC/6h/kuk+yV8UOi9rRReL3sCNFefiJenqXSiZwxnNjhRiSPRlJPam5w8ieyZ9DJt1
	Ux7tgG7w9BCZ1i3z2psQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVRN-00000006TCK-0ZtM;
	Wed, 10 Apr 2024 10:44:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruVRJ-00000006TAE-2wU0
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 10:44:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D0BCCCE2728;
	Wed, 10 Apr 2024 10:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CEFC433F1;
	Wed, 10 Apr 2024 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712745863;
	bh=Bk3mwOlBc8d/2rqp8L4enHpQiDZEZfTlKgGkqsDe1Zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xz7tCpLG9ar6z+Y/r9n8bZ7HT+B/o0Kk0fIXgtfjbVmFvZM5xEtkHSkhZ8+LyfE+H
	 4brxdgGzZmLals5+10vmSg0PtVo9Aj5MyhWaqSz4UtvdcoVE7za1I5z64KMlvbpskT
	 pmhFklgSupwkOlgipyPVGSJCLBshLwyPQIMjdpIGXeggHuNVNdUwD9OfS0DesealuZ
	 vPOgEy8lXk3DlNeeNKH0sH8VM9CPDNixtnJl4qMY9UKp1eDERR9zYGH9ss40YUA01d
	 CSgTppu4qDzUnN3WUMwwjyJmQLVo/OlmLIG0GN9N9UqPwieRgrsSodST9FS0K/pNPQ
	 l7++WqZZPT6aw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] RISC-V: drop SOC_SIFIVE for ARCH_SIFIVE
Date: Wed, 10 Apr 2024 11:44:15 +0100
Message-ID: <20240410-scarce-lyrically-63677063159d@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305-praying-clad-c4fbcaa7ed0a@spud>
References: <20240305-praying-clad-c4fbcaa7ed0a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=488; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=L9aP10EtX7u+zgE1Cd5w8MLZr4gSnhW66FKNakw9VNQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGliuQ33vDnsWFucnITXK1U6yXStCpwc3szavJtvb5d9z KvlLB0dpSwMYhwMsmKKLIm3+1qk1v9x2eHc8xZmDisTyBAGLk4BmAjLe4bfbEzP79St4gv+eDLr rcMFDfHCY1eWCFflzv0XcubPRs5/qYwMnXm/RTfs3/XF8nDVa0a/Qyah/inztBdv+yRSqLxJxiy OBwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_034426_039265_40A47374 
X-CRM114-Status: UNSURE (   6.41  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 05 Mar 2024 18:37:05 +0000, Conor Dooley wrote:
> All the users in the kernel are gone and generated .config files from
> previous LTS kernels will contain ARCH_SIFIVE. Drop SOC_SIFIVE and
> update the defconfig.
> 
> 

Applied to riscv-soc-for-next, thanks!

[1/2] RISC-V: drop SOC_SIFIVE for ARCH_SIFIVE
      https://git.kernel.org/conor/c/d2a351e63779
[2/2] RISC-V: drop SOC_VIRT for ARCH_VIRT
      https://git.kernel.org/conor/c/1553a1c48281

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
