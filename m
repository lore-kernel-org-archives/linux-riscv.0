Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3320C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1J8vRDOXICxvtBfdGI0o8YB1wBpse6mGWH8SSg7nD4=; b=z0gr55kGWzrcd8
	xEKY2RRd28ZT6e9VSEW2Sa5JsYecpwTtqk2TZxwfZ3Mp4Wi+4PRBws6ck4cWdpj+afJ61db4MQlp9
	CEcC3ReoSesbNLXAPFZYRJlM7Fz0SxL/+QVrC4rY9nJPt7whocuGr7XHqHtb5wOySwis4Lwz3XZ6g
	lu3L4SAZZtXu1PKkNLfMPWoLt5teEti3ngBwfln4FgnlvpHTjsGTxX8Dk11kYDVg3fyJXe72+tOTl
	HFMwMa9FbDxOsvg4SpCQMoZK3qlgOPTBjYy8Kuy8lLwW6l25a7ecUbdpIcKkpz52dqmC15DBcVqh+
	FFXQ2klDt/jHmt+Byq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrMXg-0031OZ-8O; Wed, 18 May 2022 16:28:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrMXV-0031M1-7c; Wed, 18 May 2022 16:28:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF94F616AF;
 Wed, 18 May 2022 16:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DE6C385A9;
 Wed, 18 May 2022 16:28:41 +0000 (UTC)
Date: Wed, 18 May 2022 17:28:38 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com,
 Guohanjun <guohanjun@huawei.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH -next 2/2] arm64/mm: fix page table check compile error
 for CONFIG_PGTABLE_LEVELS=2
Message-ID: <YoUetqxz7Q38RLAu@arm.com>
References: <20220517074548.2227779-1-tongtiangen@huawei.com>
 <20220517074548.2227779-3-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517074548.2227779-3-tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_092845_346229_B500981E 
X-CRM114-Status: GOOD (  12.20  )
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

On Tue, May 17, 2022 at 07:45:48AM +0000, Tong Tiangen wrote:
> If CONFIG_PGTABLE_LEVELS=2 and CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y,
> then we trigger a compile error:
> 
>   error: implicit declaration of function 'pte_user_accessible_page'
> 
> Move the definition of page table check helper out of branch
> CONFIG_PGTABLE_LEVELS > 2
> 
> Fixes: daf214c14dbe ("arm64/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK")
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

I'd drop the fixes tag here since the patch is queued in the mm tree and
AFAIK that one doesn't have stable git commit ids. Otherwise:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

(I cc'ed Andrew and linux-mm as Andrew queued the original patches)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
