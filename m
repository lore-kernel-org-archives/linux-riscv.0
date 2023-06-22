Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA45DEB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 19:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeIP/9KgcutpdLWolo6wQ5eCXbNgDX5fwpujak6mgvk=; b=n+KcevEEbWKbf0
	8/a0TqoKECE3fzsuHOIii4bXFIEe6pUjExffMApLW6dsR1jXo5996scrJWcGDdSRGG1ayuJBnVqav
	VKCEmDwFiDDiEiSBZ4mZYNasjPjDpdmMfvHDn60v2xlvOA8L9XI2yFiPAbAbFOa5WtdI0/VCVS0oB
	BOit6B579rNXqvuqfkA5hqebX2leS79Bhh84XCRiwsneFpDdjeE/OTYSmA/k2PFPdoINReQvdAUjy
	lFVwWeqy3ijzTxeofcWie7dHt9AC2JmhOUv2xqewn3HulNEdtLdriDix/MLS+w3S0MuaqY6qzTzIA
	kvOq2+hG2tHWH8QRqpfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPgD-001WsE-0k;
	Thu, 22 Jun 2023 19:09:17 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCPg8-001Wqq-38
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 19:09:15 +0000
X-QQ-mid: bizesmtp68t1687460925t3449k82
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Jun 2023 03:08:43 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: zT6n3Y95oi0+GF2rz41IpqKmQQtPn9dIE2aj0KkXMIaCuzLAVuWvOc3JP5oeO
	PKznVlOojlNN6dUd5Tr33s/TsUPIxkR/zyEGfmHjEhnYEGfmqpPLcHD6P44A3G0OtsIngvF
	zg8X/8uKlWtzEIjFJNh9Ehw81v8ZGwOSu2nEKWXvPcLYUKpP8OLaOTK3yX9FWRe+wlt/wW1
	Cjjg9MamTX7Ydembt+uVrXDW/myWX152jB9blHmVoU9/TqU1kj0d2hRbhF3XtI77FI3slHf
	jxB8z+eCNy+gZVBtxzvpTJPhcVlMwsRZYsAcVsA5bJooVK3U2mqFfztB79sbX+oFQFDynek
	Gv1xDLxCtuiH78WOuPu9VSZCYQEaH9Pl3OOyZ/ZhJgSBZCh/EqUlpzwqhhbhQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11068915257765438877
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: arnd@arndb.de,
	david.laight@aculab.com,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	w@1wt.eu
Subject: Re: [PATCH v4 07/10] tools/nolibc: clean up mmap() support
Date: Fri, 23 Jun 2023 03:08:43 +0800
Message-Id: <20230622190843.1189684-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <31d85464-5731-4df6-8fcd-2b0be11eac90@t-8ch.de>
References: <31d85464-5731-4df6-8fcd-2b0be11eac90@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_120913_332801_FC03FAB1 
X-CRM114-Status: GOOD (  19.44  )
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

Hi, Thomas

> On 2023-06-19 23:51:20+0800, Zhangjin Wu wrote:
> > Do several cleanups together:
> > 
> > - Since all supported architectures have my_syscall6() now, remove the
> >   #ifdef check.
> > 
> > - Move the mmap() related macros to tools/include/nolibc/types.h
> > 
> > - Apply the new __sysret() to convert the calling of sys_map() to
> >   oneline code
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/include/nolibc/sys.h   | 24 +-----------------------
> >  tools/include/nolibc/types.h | 11 +++++++++++
> >  2 files changed, 12 insertions(+), 23 deletions(-)
> > 
> > diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
> > index 8a6e16472d54..1c02cec3bcd9 100644
> > --- a/tools/include/nolibc/sys.h
> > +++ b/tools/include/nolibc/sys.h
> > @@ -624,26 +624,11 @@ int mknod(const char *path, mode_t mode, dev_t dev)
> >  	return __sysret(sys_mknod(path, mode, dev));
> >  }
> >  
> > -#ifndef MAP_SHARED
> > -#define MAP_SHARED		0x01	/* Share changes */
> > -#define MAP_PRIVATE		0x02	/* Changes are private */
> > -#define MAP_SHARED_VALIDATE	0x03	/* share + validate extension flags */
> > -#endif
> > -
> > -#ifndef MAP_FAILED
> > -#define MAP_FAILED ((void *)-1)
> > -#endif
> > -
> >  #ifndef sys_mmap
> >  static __attribute__((unused))
> >  void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,
> >  	       off_t offset)
> 
> This could return a plain integer type instead to save some casts.
> Not sure if API compatibility is guaranteed for the raw sys_ functions.
>

Seems musl simply not provide the sys_xxx() functions, but let the library
routines call __syscall() directly. If we can treat these sys_xxx() as internal
functions, perhaps we can simply let the return type of sys_xxx() as 'long' to.

    $ grep "^void \*sys_" -ur tools/include/nolibc/sys.h 
    void *sys_brk(void *addr)
    void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,

Thanks,
Zhangjin


> >  {
> > -#ifndef my_syscall6
> > -	/* Function not implemented. */
> > -	return (void *)-ENOSYS;
> > -#else
> > -
> >  	int n;
> >  
> >  #if defined(__NR_mmap2)
> > @@ -654,20 +639,13 @@ void *sys_mmap(void *addr, size_t length, int prot, int flags, int fd,
> >  #endif
> >  
> >  	return (void *)my_syscall6(n, addr, length, prot, flags, fd, offset);
> > -#endif
> >  }
> >  #endif
> >  
> >  static __attribute__((unused))
> >  void *mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset)
> >  {
> > -	void *ret = sys_mmap(addr, length, prot, flags, fd, offset);
> > -
> > -	if ((unsigned long)ret >= -4095UL) {
> > -		SET_ERRNO(-(long)ret);
> > -		ret = MAP_FAILED;
> > -	}
> > -	return ret;
> > +	return (void *)__sysret((unsigned long)sys_mmap(addr, length, prot, flags, fd, offset));
> >  }
> >  
> >  static __attribute__((unused))
> > diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> > index f96e28bff4ba..f889d4e0ac7e 100644
> > --- a/tools/include/nolibc/types.h
> > +++ b/tools/include/nolibc/types.h
> > @@ -81,6 +81,17 @@
> >  #define MAXPATHLEN     (PATH_MAX)
> >  #endif
> >  
> > +/* flags for mmap */
> > +#ifndef MAP_SHARED
> > +#define MAP_SHARED		0x01	/* Share changes */
> > +#define MAP_PRIVATE		0x02	/* Changes are private */
> > +#define MAP_SHARED_VALIDATE	0x03	/* share + validate extension flags */
> > +#endif
> > +
> > +#ifndef MAP_FAILED
> > +#define MAP_FAILED ((void *)-1)
> > +#endif
> > +
> >  /* whence values for lseek() */
> >  #define SEEK_SET       0
> >  #define SEEK_CUR       1
> > -- 
> > 2.25.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
