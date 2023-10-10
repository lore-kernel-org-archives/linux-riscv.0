Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A42CD8CB5
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 19:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esIwiBoRMleYqgN6idjxnl5ZI1BgXji7zCEo4j59Rqs=; b=1jaKs+YnOEDYYK
	lY09CcsX9j82YzmqERVe7LvrLMlphlIO9O+6LcyCxvta+9FpFnfJow5pyHZjfIjehmpjw/TACHxf2
	0a3K1ulcsTOcOJfiWheDtfpqmIFgzOZ9kiVFQTiPUrprSSz7ESHkisq4BIuGvnfBwY8QJDlKsjrcR
	cZxiPWpF73gA7RbJk/8tMAe0SSTEsGCpQ8uTZ/28iTdbCVqYKIq0grxm4lG5gI+v0JX/xcfmTZK/c
	+U44qYgtfKzgrDYAeVYBMeYGOIMtc7uGTvA7UfvZuZlJF5nJgRjByauP1ObDFmytq/VR9d7qafsdw
	4ZFLgGcZpcmDm/xdOEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqIiB-00E3oG-0E;
	Tue, 10 Oct 2023 19:48:11 +0000
Received: from ms.lwn.net ([45.79.88.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqIi7-00E3n3-1Y
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 19:48:09 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 854832B2;
	Tue, 10 Oct 2023 19:47:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 854832B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1696967278; bh=cSAnQCe5ozuzSh9BgixGZxQQjWIwqW45PYOSq7td7vo=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=CbxkbiA2JrjJ87nEvlpd4zsoRbQ4ntUP79tUocWMU9pnJORSrhJCLX37LCi/7ltAo
	 WITACmB4Vlc/964LfUkHgKAF9Y25q5avKFSEcIZ4iZePafCyT4fZ64bvCM64UqBSPS
	 GeGG1lnoJc8IZPoO3YsEYb0B8F5xlys1t70DBIlhp11QUSPjO6vf4Qen522cRhr4ft
	 QzOe7XMIiED2pE+VUcRO3Nu9d2JikRoa6DEM+8obm4ubqwWHuXyB9tVmQAVWDMsypm
	 8o5FZmBcAuol5goJcN6q8iJTK5zIMfq7Mi4Yneo6cunyfjVCZBdeKJ0gLZUzDNlPge
	 ItpJaDMhQrsHA==
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex
 Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>, Costa
 Shulyupin <costa.shul@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Heiko Carstens <hca@linux.ibm.com>, Ard Biesheuvel
 <ardb@kernel.org>, Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Sunil V L <sunilvl@ventanamicro.com>, Evan Green
 <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Heiko
 Stuebner <heiko@sntech.de>, Andy Chiu <andy.chiu@sifive.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Song Shuai <songshuaishuai@tinylab.org>,
 Andrew Jones <ajones@ventanamicro.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 Anup Patel <anup@brainfault.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Charlie Jenkins <charlie@rivosinc.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Wu XiangCheng <bobwxc@email.cn>, Sami Tolvanen
 <samitolvanen@google.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH v1] docs: move riscv under arch
In-Reply-To: <20230930185354.3034118-1-costa.shul@redhat.com>
References: <87h6nbka8x.fsf@meer.lwn.net>
 <20230930185354.3034118-1-costa.shul@redhat.com>
Date: Tue, 10 Oct 2023 13:47:57 -0600
Message-ID: <87jzru5keq.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_124807_523523_620E57A6 
X-CRM114-Status: UNSURE (   8.84  )
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

Costa Shulyupin <costa.shul@redhat.com> writes:

> and fix all in-tree references.
>
> Architecture-specific documentation is being moved into Documentation/arch/
> as a way of cleaning up the top-level documentation directory and making
> the docs hierarchy more closely match the source hierarchy.
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>

Applied, thanks.

This is the last of the arch moves!  Thanks again for helping push this
through to a conclusion.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
