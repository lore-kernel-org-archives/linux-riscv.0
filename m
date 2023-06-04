Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B1DC77B73
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9JyMyB6zyysJPJwNKBYHUMlXAErWJ/MMKZIQLRSGuQ=; b=3jaH3M2fLAXYt9
	OwnogWCyq41ko9lX7ksLOjtQM/ac3o35mJUUNre+2+Ek2nPXIGKUnYYsmmdgN344JY5G1yOOuHxLi
	8oeqHrmAAAiNLNCS62xQK+r0A8iwZjmX5gWagmXXRBvXxwiVrudrNFVzDreW8vN9SEn6qk0/DRoAt
	rsLYYTmlephNYvUWT5IdlRIDbWYtBpnPMt8ZELnhv1c13DOj5doSIwgvTXE7oTsJO1gVCpWXBzPhH
	9QrTXwRSFttT3qfJrH4KGa6+z2Qhmu0VezEjhIwkTPIL3qoedd2Gtrn5h5iQtgVoVEKQysb+MYu5+
	DeUA/SV2II1wQ2y/NHfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5lky-00C1Tm-2g;
	Sun, 04 Jun 2023 11:18:44 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5lkv-00C1T6-0h
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 11:18:43 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 354BIZQr001811;
	Sun, 4 Jun 2023 13:18:35 +0200
Date: Sun, 4 Jun 2023 13:18:35 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        thomas@t-8ch.de,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v3 02/12] tools/nolibc: add missing nanoseconds support
 for __NR_statx
Message-ID: <ZHxzC6X5dgzmH+Ek@1wt.eu>
References: <cover.1685777982.git.falcon@tinylab.org>
 <bcb69a382bbb68826f974ef4f521c8f1c60e47bc.1685777982.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcb69a382bbb68826f974ef4f521c8f1c60e47bc.1685777982.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_041842_153523_49C891F5 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jun 03, 2023 at 04:02:04PM +0800, Zhangjin Wu wrote:
> Commit a89c937d781a ("tools/nolibc: support nanoseconds in stat()")
> added nanoseconds for stat() but missed the statx case, this adds it.
> =

> The stx_atime, stx_mtime, stx_ctime are in type of 'struct
> statx_timestamp', which is incompatible with 'struct timespec', should
> convert explicitly.
> =

>     /* include/uapi/linux/stat.h */
> =

>     struct statx_timestamp {
>     	__s64	tv_sec;
>     	__u32	tv_nsec;
>     	__s32	__reserved;
>     };
> =

>     /* include/uapi/linux/time.h */
>     struct timespec {
>     	__kernel_old_time_t	tv_sec;		/* seconds */
>     	long			tv_nsec;	/* nanoseconds */
>     };
> =

> Without this patch, the stat_timestamps test case would fail when
> __NR_statx defined.
> =

> Fixes: a89c937d781a ("tools/nolibc: support nanoseconds in stat()")
> Suggested-by: Thomas Wei=DFschuh <linux@weissschuh.net>
> Link: https://lore.kernel.org/linux-riscv/3a3edd48-1ace-4c89-89e8-9c594dd=
1b3c9@t-8ch.de/
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>

Thank you. I've queued it immediately after Thomas' patch.
I'll let the two of you tell me if it's better to squash them
together to avoid breaking bisect and mark you co-authors.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
