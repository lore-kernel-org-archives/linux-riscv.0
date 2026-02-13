Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A097EEA875
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 02:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sIAwE09lx45dd6dLuc6gtBFVYX93xNV2mXHoKT9WRCY=; b=LfJr1Gw2qo1DZi
	tWv2X9/2RwHTs4zEICC0IiUxNH1qYWM2+b8DOFz84cVD2WgmrB8uZoB/VULNucGCWgdvTM7w19ZRQ
	MQ1qzHRMq7Bn6EO/7ifTddTZW7vo3mxk/giwta4Yrbksgg9eUnnUtqd43hlueJRsV4tHR/hd2I000
	05oW89KkcmGgvfVZUN96240BNmCfQrYLLPRO4irVmqQ6ODTzUIZXWmYxo1FbMZuzZHI2dmN6gutNy
	ke9knKH+pwHDFumbtPu1QAMkkd7LDu5x2JsiYUAEKxXXnFrlKZnr/b/QWnJXYBGyOZxswD0pwU029
	jOYQb7aP16F7G7tVzRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqiy2-00000002rMj-49x7;
	Fri, 13 Feb 2026 02:31:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqiy0-00000002rML-36Z1
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 02:31:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B366441906;
	Fri, 13 Feb 2026 02:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B20D4C4CEF7;
	Fri, 13 Feb 2026 02:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770949893;
	bh=ozPHT1rtCw2SY7id1srqH0gTFj0yy/Ghv+IA3dow14Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O8EsVa1Q2jgoGGubGPlkXCpxpJiy93DfncVYhBPbM2H/kLePh4I1zGog1fLxkceLJ
	 ESUsZdarFm5vD7OOdcJwFtIVQ9ynAia4jFPcGP+u8BwLNXrVeZgn627aWoUShs5LVx
	 skducfxWrJ9PMUj0ZF+2t5YvbFDh2wn1E/62drwGNxzp3HARSLLje/Lyr3VGYkRTnQ
	 ih4f9EQ7+xbuN1Ltxnk6mA17ipoy5tqMg7VnUShtgHpfxEWQ99rMcEeZdvJrbOKhef
	 0BgKW7agLP0jc6HDkF7KxAwieq3RkBAwlgja6vTCZuJwi0M68CWds3WQ3Q/XSGrBa8
	 riBMasVbxlriw==
Date: Thu, 12 Feb 2026 19:31:28 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Anshuman Khandual <anshuman.khandual@arm.com>, 
    David Hildenbrand <david@kernel.org>, Dev Jain <dev.jain@arm.com>, 
    Josephine Pfeiffer <hi@josie.lol>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: ptdump: Replace unbounded sprintf() in
 dump_prot()
In-Reply-To: <20260127110543.436242-1-thorsten.blum@linux.dev>
Message-ID: <c2f12753-a977-ba81-e44a-bec1e7135cbe@kernel.org>
References: <20260127110543.436242-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_183136_830326_5DE9DF90 
X-CRM114-Status: UNSURE (   6.05  )
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

On Tue, 27 Jan 2026, Thorsten Blum wrote:

> Replace the unbounded sprintf("%s", ...) with the faster and safer
> strscpy(). Replace all other sprintf() calls with the safer snprintf().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, queued for v7.1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
