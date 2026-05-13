Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D8DCD37AC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 22:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bZP1cPRF1JiX2Bn99Xu8eIZ7jdINnf8oAh9y7l1kxRY=; b=szQrI0jPOXzXFz
	gQroNvHvBgbKVWE2pPoR67A7ZFhKTjTMsUbS4KmY/jhNQqQVzGkhJT+gL6QDjx1Xewr7xNteSHtIr
	YEY9jiKxBSFCP3YrkUnu7q1rMEEwGrRL7I0IkghnksMPeTtz4uXgvEn5W6OpJEI5hfCxArKMEi6j2
	aeFvKP4H4qanh3zgryPGNhvTuxCiUypVfdGJ1c+5X0hkPXtV2fqvCDdL7L1RgLcYR5rWx7iniumen
	o1Nf0YqXGtRhbPsXTSRL5WTidUljO6GQvufnRwaemeIS+usplCe3jwQPGyUX7jKKmdzdmq5gOR/6H
	M04BWW50YNMwmdQZJcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIXa-00000003yCs-3FuO;
	Wed, 13 May 2026 22:58:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNIXZ-00000003yCQ-0Pj5
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 22:58:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B82EE41770;
	Wed, 13 May 2026 22:58:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA69FC19425;
	Wed, 13 May 2026 22:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778713136;
	bh=2WTmkC68e9++sLwAfu2OeUF95dYZL1zeLYcchbQyNdU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AD87Xc44ykaO/I7Q760mBQSZKJUCuvBmGzlDSEy17rzOon9mvkshOSFJw+Zva6bIx
	 3LndLIuEf0uI/WN9KTjy6L9sKiwUyn85u5y7cjSQosm38ttDasCEAynS4xI7SZxIu7
	 CEPo1qJLg/WpRJPeZr0cAKGKt0gDLfoQz3LdpQ0Kn4MVOjHmFrMSPEwHUQWtk4pc4j
	 pZiZ3nIA42fjCEgaMeNd3CaVw6oTd7V+AvuraHLhkqzhsuiHoXeR6Kemz2v/KplG1c
	 CPOpFsjW7hK4487FE06Pzn95sP9Gvrj0dqh48vyeI+sJtelWu6v7hIl1wTzj8aENkU
	 OUpQcvSQFUCfg==
Date: Wed, 13 May 2026 16:58:55 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    =?ISO-8859-15?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Yu-Chun Lin <eleanor.lin@realtek.com>, 
    Kuan-Wei Chiu <visitorckw@gmail.com>, Han Gao <rabenda.cn@gmail.com>, 
    Nam Cao <namcao@linutronix.de>, Pu Lehui <pulehui@huawei.com>, 
    Klara Modin <klarasmodin@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: propagate insert_resource result from
 add_resource
In-Reply-To: <20260512172034.328405-4-thorsten.blum@linux.dev>
Message-ID: <05988bfc-6de7-1011-6535-a80c7a710282@kernel.org>
References: <20260512172034.328405-4-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_155857_154705_3685B2A3 
X-CRM114-Status: UNSURE (   7.42  )
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

On Tue, 12 May 2026, Thorsten Blum wrote:

> Currently, add_resource() returns 1 on success, even though its callers
> only check for negative values. Instead, propagate the insert_resource()
> result from add_resource() to align with standard kernel return-value
> conventions (0 on success, negative errno on failure).
> 
> Use %pR to print the full resource range while at it.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, queued for v7.2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
