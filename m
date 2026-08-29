Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23FAC61DD7
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Aug 2026 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQsS+0awQ7aa3wjVskBxR2jxVVzm0c9uFn6iFAbwH1s=; b=X+FGk7bVzjd8LO
	1RefRFE8x3XqFkYYn5e9/PUvMB4lZ6GqU7Cp5cEnG6sK3iRO6hryYNa9Wb6Zy+sLFlrMopnF0qwZf
	VmSnsjh6P3xjyiw+6MhFm8IAF1UjGgEZBT382xa/IXto/pIGbqj+WVRhlY9whLO1/y85ki8Yd7iWV
	Y/Gzsuk+7M1ZQHUQMziPq197Orgdduy9R/rGgdKxXFuKtuHmnBKrkST1hsk6IOeHTXeQMzz/w0cGv
	RfZ1HXCzKNKsyPqnlk3nIFfFezunDKLnJfSXtUz9MUHjEOxKdsUOjyhBceSM/S9vTgcQs2AQIC2xI
	hgM5PFuNHN4A/D7lXMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0DHf-00000006oeW-1bD1;
	Sat, 29 Aug 2026 07:15:23 +0000
Received: from out-237.mta0.migadu.com ([2001:41d0:1004:224b::ed] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0DHc-00000006oe3-32WP
	for linux-riscv@lists.infradead.org;
	Sat, 29 Aug 2026 07:15:22 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=SWGcWsZvj8fiVLTc4wzzXvO66kZLaBJbnY4FcfB6iKo=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787987718; v=1; x=1788592518;
 b=Pn5xW3pZVzeo4ZjngNjB/qv/DJNpDd98nEVW3nCL6coaRlaTwhM3eDmc9gaGGxTXGZxNPlmO
 Ch8jzuS2soW4HN1NKeZLwATlesV2nd4sb/PHYcv+qBs4XHk1DFFMbjY2KedS5eaxEE9Y7N2/ihG
 SAjwtdFA/FwNCvdcr2o06TRxZDjcKbc0XsK3Y9WbeIezbE/q6i5Pd91Yrx+cY5GFCSa5Xfj4e3i
 rKTQ8mgx5B6gBLhJx0NtQZZwzlKcs5z8y9VUdd0TFLgc9KYLmIhT8CuHzBOpnzeFu0i5Iaxgs4M
 QTLo6N3O9ofgPa62o6L0CZDvZL5GkY0vwAVMS5/kIfcaw==
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4fc2f53bcf373baa;
	Sat, 29 Aug 2026 07:15:10 +0000
X-Mizu-Trace-ID: 4fc2f53bcf373baa
X-Migadu-Flow: FLOW_OUT
Date: Sat, 29 Aug 2026 15:15:06 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Yukai Wu <xiaoyewuz.ruster@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Update arch/riscv/patch-acceptance.rst
 translation
Message-ID: <apKG-g3vNMtgvV6y@wyuan.org>
References: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260829022344.192491-1-xiaoyewuz.Ruster@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_001521_112350_9798B8AF 
X-CRM114-Status: UNSURE (   5.34  )
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

On Sat, Aug 29, 2026 at 10:23:27AM +0800, Yukai Wu wrote:
> Update Documentation/arch/riscv/patch-acceptance.rst translation.
> 
> Update the translation through commit ed843ae947f8
> ("docs: move riscv under arch")

Acked-by: Weijie Yuan <wy@wyuan.org>

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
