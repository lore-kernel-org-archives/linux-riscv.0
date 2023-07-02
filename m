Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45088EB64D9
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Jul 2023 19:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfD6q+pJ4cvlidKfOfZM1thk8Jq8SUk8amPHs2qc8MA=; b=w6B9N6YMwEYvWO
	LZMyb8jdMK/YUmhZbigko99bZp9nsNOtJDylvimdrUWzIsEvZx14s3qPfYl5hSvE/dxNFrlB9uaNZ
	JmP+s90ujYiFycEL2lBGpo9pORVxhxLfD4AmTbFZuzCR2Q7nUsyqW6DlL0VXPWvg7qUzKjvLDmhCD
	pcUKnCBfVwT8CsnI4MN5Rn26cONJ29HURGeLZGMNKsiF4mBcCjp8hKQfEkPPsoLARpO4KoQnRR42v
	oBlMMmpWqqEeYq21crK8psKjO3lrPMWSJFWeDyIcoIlx37f8f88KpN88oX6w7XHo3EOLUpywcviGb
	c69cwL2sZ4b0dbyNU2iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2fs-008SbO-0K;
	Sun, 02 Jul 2023 19:23:56 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG2fo-008Sat-0v
	for linux-riscv@lists.infradead.org;
	Sun, 02 Jul 2023 19:23:53 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 362JNlu1017530;
	Sun, 2 Jul 2023 21:23:47 +0200
Date: Sun, 2 Jul 2023 21:23:47 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, arnd@arndb.de, david.laight@aculab.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 11/14] tools/nolibc: clean up mmap() support
Message-ID: <20230702192347.GJ16233@1wt.eu>
References: <cover.1687957589.git.falcon@tinylab.org>
 <f054cd45de26bccb330ad842bc2b3b708b2a429d.1687957589.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f054cd45de26bccb330ad842bc2b3b708b2a429d.1687957589.git.falcon@tinylab.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_122352_614248_DB8EBCB1 
X-CRM114-Status: GOOD (  10.69  )
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

On Wed, Jun 28, 2023 at 09:41:13PM +0800, Zhangjin Wu wrote:
>  static __attribute__((unused))
>  void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset)
>  {
> -	void *ret = sys_mmap(addr, length, prot, flags, fd, offset);
> -
> -	if ((unsigned long)ret >= -4095UL) {
> -		SET_ERRNO(-(long)ret);
> -		ret = MAP_FAILED;
> -	}
> -	return ret;
> +	return (void *)__sysret((unsigned long)sys_mmap(addr, length, prot, flags, fd, offset));
>  }

One point regarding this one. By doing so, we're hard-coding the fact
that we consider that MAP_FAILED is always -1. I'm not necessarily
against it, but this implication can be confusing for those searching
where it's being set. I would suggest putting a comment before the
mmap() function saying:

 /* Note that on Linux MAP_FAILED is -1 so we can use the generic __sysret()
  * which returns -1 upon error and still satisfy user land that checks for
  * MAP_FAILED.
  */

Since it's an assumed choice that theoretically could affect portability,
it should be reflected in the commit message as well (and we all know it
does not have any impact).

Thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
