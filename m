Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB86CC56208
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4UD+zEajFlgu+KXZILRiKP/mx/CeLFLHtJNkfdSuRs=; b=d1PTBUVIkz7uD5
	fLWfTFHxWcVCgrNVklXfM7OoW5Ql9eHsoHxoeZcqOUPZQdv1aN/MqyScPR8a4F3cWoJp5pgOckNAI
	CJF1FMuNoSMYIps62upsW8UBJIEYSpxlDuHhFzL2UciLkiBzWBjsk0DdhPJ0QP51kppjbXOkG61LO
	pKD0bUADzqkJYt91G0lVRAf4P059fQo3xAtZcrudybdDH/M2OKtE1m9yb2AN8/J71OClacVZvXGvT
	r/nOaIRnyMMbi0jkui+pDT4IL8pF3Rpel13urUF/BggnoXeaJI2xco4NcYm9Tup0UmcRuBJUfhlUs
	Y5Eez18UFciTTaSpFbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws137-00000006EUv-0plQ;
	Thu, 06 Aug 2026 16:34:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws136-00000006EUn-1OEq
	for linux-riscv@lists.infradead.org;
	Thu, 06 Aug 2026 16:34:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9244160AB0;
	Thu,  6 Aug 2026 16:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA071F000E9;
	Thu,  6 Aug 2026 16:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786034067;
	bh=vPCPaGW6m03Dz8rTY9uUJofYQcJnNc0xegcWF4cgfhQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=LSLYoLCFi80c3Q4+oBR8MkzzcWUDZ5JfPhtRG3ODlWGMEGfp5/Dg0OExZAYI8CnOQ
	 niEbf8nuwHyrrcgnAqDZctPO069pW8vATfVhr/+Mppmk1RA2tj8A3D1Uu+674Su8A3
	 4YAgWE6PT2xKvyMttejg3Rg8Ehtsn92KNdnKrbr8KOqSTDIt+xlNW0Lxo3+DZewSUH
	 3+arLdU//CiJNsCEdNYI84Ye+EulgyFjkP9RSb/heUmTx5rlxr6LbyiqlWdAJOZhMk
	 AAfezMD26qT4VenU/wz+OPce7zEVWnsHqyPezj3hsmuuYTt/xH4eKazqNPVm7bxE7L
	 4h5ZE2NPJ0RBw==
Date: Thu, 6 Aug 2026 10:34:23 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: cmpxchg: Use .option arch for Zacas and Zabha
In-Reply-To: <20260717-riscv-no-zacas-zabha-in-march-v1-1-82b5b0799fb6@iscas.ac.cn>
Message-ID: <be620a9e-b5fa-0cf5-7142-055575bc4458@kernel.org>
References: <20260717-riscv-no-zacas-zabha-in-march-v1-1-82b5b0799fb6@iscas.ac.cn>
MIME-Version: 1.0
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

On Fri, 17 Jul 2026, Vivian Wang wrote:

> Instead of adding these to -march globally, use .option arch to use
> instructions from these extensions only in code paths where we know they
> are available, like how it is done for most other extensions.
> TOOLCHAIN_HAS_{ZACAS,ZABHA} already depend on AS_HAS_OPTION_ARCH, so
> this is not a functionality regression even on older assemblers.
> 
> Although the compiler is unlikely to generate atomics on its own accord,
> this aligns handling of Zacas and Zabha with most other extensions and
> improves consistency on how assembly code requiring extra extensions is
> written in kernel code.
> 
> This is analogous to the use of __LSE_PREAMBLE or .arch_extension lse in
> arm64 code.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Thanks, queued for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
