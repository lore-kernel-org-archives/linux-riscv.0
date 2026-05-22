Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3434DCD5BB1
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yg26ZiqIv9fWFFHXLrEXawUc8e9XnX8dyT/XIdF/Hf8=; b=NubMSHP9ITCKbn
	goN3pfR+EpYzL6euwqCUCOGzlv6OxvP1Vhl1Fw+M2AM0h+BKP5c+igFiqob735TRW1IiOe4ItYded
	RSouBL3lwy5OrqnwI8yi0RwPvVi8TUEJ908bQiXdfiu0Tbu9MZvOzJHMUWEOpvYpMNaBspVgBubqY
	Rkxna8fdvXEEDPs4+AR5cGm0rThoshsf3Bg0M6T1NYnLINmQ4vKLOq3ll0AT9W+RadLHTRYf48jRh
	iAtknbMG94bU+fnd02bLsESjQ2L1iU0Py7+45Cry9issLkMHAlhqv56VzViek+PNUZxqpDsjYKHyq
	HKQffBXi60tqFAAXEmkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPdF-0000000Auep-48Wr;
	Fri, 22 May 2026 13:09:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPdE-0000000AueG-1IIj;
	Fri, 22 May 2026 13:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EQj1Rbpw/H3Oe/sDGMgX6onZ6xyYKXcG7QBzM5CpJi0=; b=pyFlsOsI1W2H+d/c1dR87cu4A1
	nbk3QdhQ5igmGpectY46XehGUF3atPk8mqBTiAMYhp+RVUaHnf7U7vngJ2F4UAUNwxrJuFWL2uqdB
	d/WzjoEOMMz3D7k6H05YXwgJRsOWxWdJDddNXfpSrUVVgHRj5tJE6frgLHjiVX5xx+Bd6y6rK5bDz
	BjnT1OR4KHVpKXlgod+qjgxUoNjEidgt2I4IkCQEqjwx8IU2B9gxtaWWSot0M7QRZv1MxzvStf58r
	evpBrKrXC124rfJ3AuHL6Tt3FC+WRpKb7tjf8+PbXNt3tbgW/GZM31sgXDj/od4TakCYHwR3VUGW7
	FSgIl7pw==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPd1-0000000A7eI-1OCp;
	Fri, 22 May 2026 13:09:27 +0000
Date: Fri, 22 May 2026 14:09:27 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, bhe@redhat.com, chentao@kylinos.cn,
	chrisl@kernel.org, david@kernel.org, jack@suse.cz,
	kasong@tencent.com, kunwu.chan@gmail.com, liam@infradead.org,
	lianux.mm@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, liyangouwen1@oppo.com,
	ljs@kernel.org, loongarch@lists.linux.dev, mhocko@suse.com,
	nphamcs@gmail.com, nzzhao@126.com, pfalcato@suse.de,
	rppt@kernel.org, shikemeng@huaweicloud.com, surenb@google.com,
	vbabka@kernel.org, wanglian@kylinos.cn, youngjun.park@lge.com
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ahBVh4NM2uoyhPNm@casper.infradead.org>
References: <ag4kj84EcKqamdB-@casper.infradead.org>
 <20260522023305.98223-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522023305.98223-1-baohua@kernel.org>
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

On Fri, May 22, 2026 at 10:33:05AM +0800, Barry Song (Xiaomi) wrote:
> need to touch `filemap.c` at all (probably because you are already
> maintaining `filemap.c` perfectly):

I'm going to give you one chance to apologise for that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
