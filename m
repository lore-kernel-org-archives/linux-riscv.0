Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEE9C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 07:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKnPFlKV9ni1gXrqbIys/Lwum8qfOVQrgXNQOBioFHc=; b=L9I4FbXIZ1rOSS
	iFoGHmlYgrqj+L5iWw9XE8xdcVbUCydtPjrm/lSLECihuGZCx0PB/vbGAj6IZdmCc54S5WisbH7Ze
	V+0PdvE0gdNc3g9460EEdr6IGyWLQRQSZ9tWFi3j1JLW0QOeWQ6EpyLfwCVhNX+/JhR8cYHxMhmpU
	t5LNiNfJ/w3JIratEzfcvJa3eVat6yYELBjntOnZPNHmhKKh/YI3zSJnrjOgaPsXhHRfXAxThjMVZ
	Glaz7KH5WQwI3GVWUkTqMoJxj9SoB+fRSBhvozhVqZlLH6P28Wg6ajHWN65Rnw+9NxeEDtT8mRZ3B
	XKHEmooeM7nmz3aysxXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFAO0-00ESgv-Jg; Wed, 02 Feb 2022 07:49:04 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFANn-00ESb5-5t; Wed, 02 Feb 2022 07:48:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0D24367373; Wed,  2 Feb 2022 08:48:47 +0100 (CET)
Date: Wed, 2 Feb 2022 08:48:46 +0100
From: Christoph Hellwig <hch@lst.de>
To: guoren@kernel.org
Cc: palmer@dabbelt.com, arnd@arndb.de, anup@brainfault.org,
 gregkh@linuxfoundation.org, liush@allwinnertech.com,
 wefu@redhat.com, drew@beagleboard.org, wangjunqiang@iscas.ac.cn,
 hch@lst.de, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V5 06/21] asm-generic: compat: Cleanup duplicate
 definitions
Message-ID: <20220202074846.GA18398@lst.de>
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-7-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220201150545.1512822-7-guoren@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_234851_389355_824A3188 
X-CRM114-Status: UNSURE (   8.42  )
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

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
