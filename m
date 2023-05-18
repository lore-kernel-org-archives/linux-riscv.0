Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264C1C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 17:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0n3tELzKGCGLaYnU6GxEWiFDzbtquU5CzToy3XjCkg=; b=mD1kE41WpRpeyVM7Skxnhzg1EQ
	LRB6OFrtdzFoq8gjACUFWITjNSJYI0f7+SaVN+cvUQKS0sOGAH3ZjqZEhBaooLeDu+lF9oP48Zo0e
	HYo6Ty7wDSmrku7fuhMpq6eFl982duL/ScqhW7THZ4S5Heh3dKVF0WSRIoD5GlVU0BQJBPeFyQZ5G
	An1fsEqUVNfJPY9GmaeYSJh/i1FGjjCYAP6GKtglQk8aXW9Zl4K9tusB3IJKNMS0NoMkcP64S33SR
	103AwaA9tvgaYjmQfHiA9XQb4+G2XAV4S2wBHwNuKGLlH3kRaFAExFNQe6U7nCbeDkJyqFRTVUw/X
	brhAl0Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhgw-00DhmV-2Y;
	Thu, 18 May 2023 17:45:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzhgt-00Dhlp-2i
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 17:45:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8F1B06438C;
	Thu, 18 May 2023 17:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E47C433D2;
	Thu, 18 May 2023 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684431925;
	bh=lrNR3Kj8pwFUL4gmGaZGPGna/6gQVw84egS4nJteM9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jsAPYUpOGrJjow4IZQA8Vn9fegedOfdXtFRGY1bmYYo19X1SUsnAOamSK1TdB/aIg
	 em2keJtu12XgSiWFyoWI5s41Vvsq+e4tKQ1nmZlbjjevZYT+eRUMZZ4IWLKbFVq4o2
	 B6N+W/CZKnGp9ACxHnWwjaEjeiXWMrIotVilRL1r8WayjPpbDd8EguOaV7aWYt99lG
	 NcWuWTuaweS6Hn+2CLAYH4KOCTHD+iVXW4pt/RT02SImUgE3xfGYDypUaPyIKztjbD
	 SNddghEDcllERzPdhV/BWqeX453R8n/1nUS5ukBAwnK0TE68QIbgD8m/XM5gbVThDZ
	 Q63PWwsg6sUuQ==
Date: Thu, 18 May 2023 13:45:23 -0400
From: Sasha Levin <sashal@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.3 5/7] riscv: Unconditionnally select
 KASAN_VMALLOC if KASAN
Message-ID: <ZGZkM98lOHUEF4mA@sashalap>
References: <20230509035455.59524-1-sashal@kernel.org>
 <20230509035455.59524-5-sashal@kernel.org>
 <bea1128b-903c-a7d0-9929-d9667999bb6d@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bea1128b-903c-a7d0-9929-d9667999bb6d@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_104527_935414_0EAA2483 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 12, 2023 at 11:51:03AM +0200, Alexandre Ghiti wrote:
>Hi Sasha,
>
>On 5/9/23 05:54, Sasha Levin wrote:
>>From: Alexandre Ghiti <alexghiti@rivosinc.com>
>>
>>[ Upstream commit 864046c512c2cd8418dc928b91981fb12a80396c ]
>>
>>If KASAN is enabled, VMAP_STACK depends on KASAN_VMALLOC so enable
>>KASAN_VMALLOC with KASAN so that we can enable VMAP_STACK by default.
>>
>>Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>Reviewed-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
>>Link: https://lore.kernel.org/r/20230203075232.274282-7-alexghiti@rivosin=
c.com
>>Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>>---
>>  arch/riscv/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>>diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>index eb7f29a412f87..d6aad84efb95e 100644
>>--- a/arch/riscv/Kconfig
>>+++ b/arch/riscv/Kconfig
>>@@ -118,6 +118,7 @@ config RISCV
>>  	select HAVE_SYSCALL_TRACEPOINTS
>>  	select IRQ_DOMAIN
>>  	select IRQ_FORCED_THREADING
>>+	select KASAN_VMALLOC if KASAN
>>  	select MODULES_USE_ELF_RELA if MODULES
>>  	select MODULE_SECTIONS if MODULES
>>  	select OF
>
>
>KASAN_VMALLOC is broken for any kernel < 6.4, so this one should not =

>be backported to any kernel (5.15, 6.1, 6.2, 6.3).

Ack, dropped. Thanks!

-- =

Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
