Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074A6C74A5B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Mar 2023 22:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fGL9C0Tqt4xFoa4GzZeY/VD2Pyf4tW2dzsVB52lO0w=; b=h7yyy+L82J9yMP
	CoN2WN3bXDuLfaKYGgLwQ7wCDLUvH9jfPjYolw01x9VKpy9XoL+j0whwkkEmR7RYN8UzwozOVaVwa
	YTVUmCjkndEkHf9u9VFp696BrzjEere2rhXf9JUlDUFATnBT4PYKQzKwYnNV4qn5003u4FqedNRIg
	8I9FinZQVBhmEyIHW+Nyff3pcAVR1wSO8qW2NJlzpGF/TKwy50Fl3EzCOSg21vYOpWKREvMKgl3iJ
	LnMC+qanOdzt0aubQxk3hRNxzJx8KpxcsV1LfN23Lchy6vxmchIANdJVwaqys9jnKCqmSSNRDoTvs
	6iA2vGLEnUcxUAsGZHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgYSe-009GRw-0a;
	Sun, 26 Mar 2023 22:03:36 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgYSb-009GRN-0E
	for linux-riscv@lists.infradead.org;
	Sun, 26 Mar 2023 22:03:35 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0839968B05; Mon, 27 Mar 2023 00:03:22 +0200 (CEST)
Date: Mon, 27 Mar 2023 00:03:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, esyr@redhat.com,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH V3] uapi: Fixup strace compile error
Message-ID: <20230326220321.GA18023@lst.de>
References: <20230324073630.161034-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324073630.161034-1-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230326_150333_272944_58F5639D 
X-CRM114-Status: UNSURE (   7.76  )
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
