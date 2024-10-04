Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A854CF8855
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hVlShEo5AI7JIaWewnOIOKlz+F3zYH2yKuRXAJIryH8=; b=WAD4FucLTz/EyR
	+Tzm86DJUIaKzmnX9auIjuLyy6uFmI0mwy/xzvD99Lrc++vDmjnJIj7sbnQ3py5FEGitsdMimbkpK
	SmN3vvL+ydoZC0JIoHN6w+tynsHGyQVbLOimXVzUaJpXtFo/6gppef2+Hsl1ad08HRs42LC9FWknX
	PdXUH8Qzvd5B3Mpld3dOuBnjV1Zpchbpx7HWfuN87dbq24c8N1d7lwV5+kFWgVK4Lm1fIh1JSO/B5
	sffCMbCzR62LA/QQeT2pQh5cDM1dpXfRjYAfcskNZfIT5diefmrN0zIxbCGkT/f8gVhNH1+SaWa9P
	scEExSPwGgL9Xf+Gy5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swnkR-0000000Dqsa-1Eh6;
	Fri, 04 Oct 2024 19:13:55 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swniu-0000000DqVn-19MR
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 19:12:25 +0000
Date: Fri, 4 Oct 2024 21:12:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728069135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7AeF0ZofiX5pl4vuZpB1WuoW4qG1+FzaxAU1/cHHP30=;
	b=Nhue05u01U/zZCZIlxKCOkfD4O/BLxG5TTEnJw8DqMjnL13o5N3VKr2EhaDJQCNI+hKaVb
	jOxyVzZgumSrwnHTx2GxNetFa36zqE+aE3iuAmZbYtrxtofC7B3mdsEtfP/9d/JpMsHOO6
	5KaphMGuv/JOqT8OHKgI80grB/PQQao7ljb6Z2TdcP7bNAoiHmSJEQSgnDHrY8zO5V34tN
	Ftj7PNCBBFs83f4v+ROuDyXMZlbOC8boMelFWk0/WWTbDiyQlYERNvLNNz/LJV0FGqGx5n
	pt4xeH6pel/knRw3E+WBuOAgPhT5fzDNKKkA/7kdtxUeUWcSZOGQ3vRUf9Q7KQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728069135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7AeF0ZofiX5pl4vuZpB1WuoW4qG1+FzaxAU1/cHHP30=;
	b=F3FoS7s7vcmWEL8t467rHR7Hhl1T+dLLZzNWb1+yRtuCuylQiqly+KBV6ozKSGp3xCqRbg
	ORMXfQtqclOrboDw==
From: Nam Cao <namcao@linutronix.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux-MM <linux-mm@kvack.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: VM_BUG_ON_PAGE(PageAnonNotKsm(page)) defconfig riscv64
Message-ID: <20241004190952.AMYdQn7P@linutronix.de>
References: <CANiq72k-wbyR=FeBVBPMqqF6Re9eO4LtdHYqvMQgXSe3cHQsGg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiq72k-wbyR=FeBVBPMqqF6Re9eO4LtdHYqvMQgXSe3cHQsGg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_121220_674136_D626ABE0 
X-CRM114-Status: UNSURE (   8.71  )
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

On Fri, Oct 04, 2024 at 03:09:22PM +0200, Miguel Ojeda wrote:
> Hi Matthew,
> 
> I noticed riscv64 defconfig seems to reproducibly hit
> `VM_BUG_ON_PAGE(PageAnonNotKsm(page))` in today's next-20241004 --
> please see below.
> 
> I hope that helps!

I can also reproduce this on arm64 with CONFIG_DEBUG_VM_PGFLAGS=y.

Looks like an invert logic bug from:
https://lore.kernel.org/linux-mm/20241002152533.1350629-5-willy@infradead.org/

I made the below changes and the problem goes away.

Best regards,
Nam

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index fe9abdf26ab0..ccf3c78faefc 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -1131,14 +1131,14 @@ static __always_inline int PageAnonExclusive(const struct page *page)
 
 static __always_inline void SetPageAnonExclusive(struct page *page)
 {
-	VM_BUG_ON_PGFLAGS(PageAnonNotKsm(page), page);
+	VM_BUG_ON_PGFLAGS(!PageAnonNotKsm(page), page);
 	VM_BUG_ON_PGFLAGS(PageHuge(page) && !PageHead(page), page);
 	set_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
 }
 
 static __always_inline void ClearPageAnonExclusive(struct page *page)
 {
-	VM_BUG_ON_PGFLAGS(PageAnonNotKsm(page), page);
+	VM_BUG_ON_PGFLAGS(!PageAnonNotKsm(page), page);
 	VM_BUG_ON_PGFLAGS(PageHuge(page) && !PageHead(page), page);
 	clear_bit(PG_anon_exclusive, &PF_ANY(page, 1)->flags);
 }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
