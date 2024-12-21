Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B177FE7718C
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 16:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUZr+saf60F8nk2VkNbJSX4+AzMI2VuWZK4pxFxrusY=; b=htwp+UUrDbTZKV
	3GHqVNkV9SJ1x7ZzqPhs+YIWLIUUCK6MRYeAV5iNog10Nry0Mu5O8KLPPW+eRTqGuYbO/84N7oR+x
	byYCBQqv01qrPqqRzeFpkBRtXNi4hbHPEHDhdz2b0I3Z4ZzJhm0IQXkdIGVSMn43UWHk9sOB1OLIG
	5nKizMoyN/kTBKLj6rDhOBoe4veyhD8arJXuOLOHd6Nj5imtaoS67bOkmA2/mdUMTwUKuZ0WpNX9R
	xTfANJOkYPHFgCAHe4M66w3sohGoZwECfQ3w7+ZOEvrn51op2G4yEbg53VwxYONSg1+v/qfBJuKHt
	Zzht5/ED3CF5CQ8FSrXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2SP-00000007Bpw-2fJA;
	Sat, 21 Dec 2024 16:36:01 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP2SM-00000007Bp9-2BEt
	for linux-riscv@lists.infradead.org;
	Sat, 21 Dec 2024 16:36:00 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 4BLGZeKv012220;
	Sat, 21 Dec 2024 17:35:40 +0100
Date: Sat, 21 Dec 2024 17:35:40 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, Zhangjin Wu <falcon@tinylab.org>
Subject: Re: [PATCH 1/6] tools/nolibc: add support for waitid()
Message-ID: <20241221163540.GA11984@1wt.eu>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
 <20241221-nolibc-rv32-v1-1-d9ef6dab7c63@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241221-nolibc-rv32-v1-1-d9ef6dab7c63@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_083558_986294_E36BD99E 
X-CRM114-Status: GOOD (  10.47  )
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

Hi Thomas!

On Sat, Dec 21, 2024 at 03:44:28PM +0100, Thomas Wei=DFschuh wrote:
> waitid() is the modern variant of the family of wait-like syscalls.
> Some architectures have dropped support for wait(), wait4() and waitpid()
> but all of them support waitid().
> It is more flexible and easier to use than the older ones.

I'm generally fine with the series, but I'm starting to get concerned
that some simple applications that used to rely on wait() or waitpid()
will not work on this architecture. Just like we did for some early
syscalls that got replaced (e.g. open->openat etc), I think we'll have
to implement a default wrapper relying on waitid() for all these calls
in this case, and maybe as well for lseek->llseek() btw, what do you
think ?

The single fact that you've had to modify some of the nolibc-test code
(which is supposed to be the application here) indicates that we're
progressively going away from what applications need on certain archs.
Ideally an application relying on long-established calls should continue
to work unmodified.

Maybe it will be time for us to run an overall audit of arch-dependent
syscalls we currently have, to make sure that the common ones continue
to work fine there (and waitpid() definitely is as common a syscall as
open() since it's the good old and portable one).

Cheers,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
