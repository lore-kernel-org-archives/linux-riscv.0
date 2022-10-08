Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C9FC433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 14:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJh7WIxKtYpJoOrv5/SEiEFsJyMj9UZxYvesZH1DD7I=; b=Svu8rFPCddCPVW
	Nwr7uYzuIgUsNTGRuueYCXIVGxbUCLYJWFrCU2rR0fjk3vifnaj5yi5s3bSbwhkUYuKot7d74DwGC
	GUqvNKEzLkxdfFK6pi/CpRVO6adnL7gOPQjGoEWrabWLoJ93U1CTnuUAGVX0xmEJRRgroEIKcEbJM
	PR3IYfVnfSr/1V6K16n5tf/0ROBgI3rOeBC/U4vqq1hObYv5h0oZ9t3cnmfo6CPacPmvG0WO+ysaZ
	gP/pQVmW5T5rn/iKcj+Esagabl7TsuVGyF3YDH343WYWAHkLXuBrX1AGt+gu9N6Ibx2NadOZWJOug
	a9e8MzXcXV44PdjHaicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohAf7-00DOwZ-Ap; Sat, 08 Oct 2022 14:18:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohAf4-00DOv7-Co
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 14:18:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 939B260B2E;
	Sat,  8 Oct 2022 14:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA66EC433D6;
	Sat,  8 Oct 2022 14:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665238714;
	bh=AUMnXmbKs1i6Qjt6RJif9g0nKBuFWpjAIMlUnXBwHyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Irj53r5uh7JKLsWfaz00Ted8G5G2Tt7pcty8UZq4h7/Jpk+wBzjHUVLekcTLkn36W
	 O4zWBJBk08z2J0loe125SXUpth+SEu8HIkH1yg202CXqZuUeBLl7jJGo2S1KvdHWcf
	 dVAKBRTveXwkkCDJfHFADfvUfPYGko93SYsxZR8XqJGhTq3rFP6Nz1m8p9r2L03X/w
	 3Z2whHQ/Ek+cGbBY2T8rOlVPDkbQc4jS3EUTjEsDZLusRxCsh4Q9cmTBFhhg2PYwsX
	 Ukk9a9rjTJHNiWurLcXbMaLg4jupPxedc6/Wtuqca76vtstbfQjMh9TMs+GZ4aRiLB
	 t57KtBm+dxC3g==
Date: Sat, 8 Oct 2022 22:08:59 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Conor.Dooley@microchip.com, peterz@infradead.org, jpoimboe@kernel.org,
	jbaron@akamai.com, ajones@ventanamicro.com, ardb@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	samuel@sholland.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: jump_label: mark arguments as const to satisfy
 asm constraints
Message-ID: <Y0GEe8K7V81r5yhe@xhacker>
References: <20221006064028.548-1-jszhang@kernel.org>
 <20221006124144.abaz74g7nxrb5hxj@kamzik>
 <4c8fa16a-8463-ee32-7307-0383fa94403c@microchip.com>
 <Y0GBO77e2Lu/khkI@xhacker>
 <20221008100748.1078fb3f@rorschach.local.home>
 <20221008100902.0bbbc1cc@rorschach.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221008100902.0bbbc1cc@rorschach.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_071842_515220_A45A147A 
X-CRM114-Status: UNSURE (   8.13  )
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

On Sat, Oct 08, 2022 at 10:09:02AM -0400, Steven Rostedt wrote:
> On Sat, 8 Oct 2022 10:07:48 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> > Link: https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/
> > 
> 
> This way tools can be used to map commits to links relevant to them.
> They key off the "Link:" tag keyword.

Thank you so much!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
