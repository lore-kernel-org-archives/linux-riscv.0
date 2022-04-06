Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD18BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 18:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YxsSCEis4XK3DkR94D7D6FPgbD/hKzEZKVOtAInwJY=; b=B1bEuUBBiJs4Jr
	ioLEcAHh+hKTRIi6qM+JZ+ExM3fuSmOYeBR1WlQrDHz8DhteOwzKR1x/vKhJPfHz+xSsWa2DHQX1L
	i79kdA69daC1NTSjNvU8brokHXmEwfHCjJtA4uCzU/+K8BSo1Q5NaAZOoyH1MhLe0T9MC346L1JaX
	UjFI2F+ohdOqjeHo9/w3c9uDYXuhM/TeAlnmon5DkVqSSoA6JZqEcAXQ8K3I6Tcv6NLYfP2kCVwxa
	ERvkhCoJ/t46tGxV6YcJ6QTMRlKQsmokl1ogR9O4AJzkvemfJ5BZEvj3SsYcS/Hb67R66bS5+xmni
	QhjTUSobGxb1hld+fhvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncAA5-007U9V-HR; Wed, 06 Apr 2022 18:13:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncAA2-007U8V-QL
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 18:13:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2BAA1B82004;
 Wed,  6 Apr 2022 18:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555C0C385A3;
 Wed,  6 Apr 2022 18:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1649268819;
 bh=QMVfExX2amMvHMtMH2GP6BV4ahQ74qFyqqVQ9KVADKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nVLUe7kjQEhu47BJhERVDSXy36Yev3KQsjVkpGHx4Xhpkkjbfpx+xmOXrE0vwvRH1
 izDi+3ku6R7AFPmW3NTCcJkcIWmMPWwHpQi5D65PUOkQaTLvTVm9zcgMF1Hzqcdrv/
 apzPtGjoyfCVSk3vOs4spS75LuzT+ireuOcoiQ84=
Date: Wed, 6 Apr 2022 20:13:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@dabbelt.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH V3] riscv: patch_text: Fixup last cpu should be master
Message-ID: <Yk3YUFfvEszb+cXT@kroah.com>
References: <20220406141649.728971-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406141649.728971-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_111343_037884_B6A05BA4 
X-CRM114-Status: GOOD (  14.26  )
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

On Wed, Apr 06, 2022 at 10:16:49PM +0800, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> These patch_text implementations are using stop_machine_cpuslocked
> infrastructure with atomic cpu_count. The original idea: When the
> master CPU patch_text, the others should wait for it. But current
> implementation is using the first CPU as master, which couldn't
> guarantee the remaining CPUs are waiting. This patch changes the
> last CPU as the master to solve the potential risk.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: <stable@vger.kernel.org>
> ---
>  arch/riscv/kernel/patch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What commit id does this change fix?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
