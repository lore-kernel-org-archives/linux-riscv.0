Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB0DC5475B
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Mar 2024 02:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JdoBHjM7gvp45tSRg+Dh3/nSo+L30pamhUDEl/nPNJQ=; b=FUjvRitp9yumYI
	kubaQ0F4O8r3XyrdvA0TdZFwLPfeVI6pydDNACNjnxQ5Zh41UD4lMS8pUgQADU9d7p7m6i1lF8AXk
	eTbrI3XHbGIA+u0vaymMuxuVOdFb/nJrM6l0sUNOHriw+eLbMUd6EhvkjDmfTl+zLSveSSIudEAuL
	YBS+Sf6jQFougbC4yMBorVY+CT8Sloy0kZ0Q2SEHnHnj8C6rgeZb4QnglFm65PM9WBP6EbYjAyvsA
	N175LBee4i+gUpodfO5CIo4To69Z1AToTBFoMLT4znKZ02mmNK2TcC23nsbtC8lhEf1HXW/yo4oah
	NsOnyxOhTsFGJ+1NlyHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rimCP-0000000C72y-0UOG;
	Sat, 09 Mar 2024 02:12:33 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rimCL-0000000C71M-43oB
	for linux-riscv@lists.infradead.org;
	Sat, 09 Mar 2024 02:12:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F2753CE1729;
	Sat,  9 Mar 2024 02:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A95BC43390;
	Sat,  9 Mar 2024 02:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709950347;
	bh=OzgyO4IQYqZO7GHdWY27S+Mv/4FWMjbv/XOkG9jawcM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=cMurn1NqjCrTSIhehMUO3u7dFWoSZvSmbqleispdQ4yWxSumJhKpJvZTagnjAmZk5
	 kmZnKNVzf0APG+zz0/VbsLicdkd5dnSiPr+pMaadh/rdTl4R0UViZd7zK0nZnTDZxs
	 kc/SqlHJKsDAereJ0Jqv2acSPOFfW/IXsgkty3fztWQt73qToL7rVYcKEnelQoh36+
	 ACbcKmYKRffbYssbhBi5+03nNJz1zm7EebWFPeM7vFqI6Q08ZKKR5Cqt+pxT2f3daa
	 wZ/0VCQBndf4or0+Lhdjpe0DvsjPLh1FaYz34FHNGNkyf/AKYoOdLRoTVqyE/ubiZ+
	 rqBV+dO47G8Sg==
Message-ID: <274dad1569745dd705cbc65dcb1523db.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <49faf8ff209673e27338d4b83948ade86b3c66e4.1708397315.git.unicorn_wang@outlook.com>
References: <cover.1708397315.git.unicorn_wang@outlook.com> <49faf8ff209673e27338d4b83948ade86b3c66e4.1708397315.git.unicorn_wang@outlook.com>
Subject: Re: [PATCH v11 2/5] dt-bindings: clock: sophgo: add RP gate clocks for SG2042
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen Wang <unicorn_wang@outlook.com>
To: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, devicetree@vger.kernel.org, guoren@kernel.org, haijiao.liu@sophgo.com, inochiama@outlook.com, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com, robh+dt@kernel.org, samuel.holland@sifive.com, xiaoguang.xing@sophgo.com
Date: Fri, 08 Mar 2024 18:12:25 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_181230_198984_7D73EC2E 
X-CRM114-Status: UNSURE (   4.17  )
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

Quoting Chen Wang (2024-02-19 19:08:59)
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add bindings for the gate clocks of RP subsystem for Sophgo SG2042.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
