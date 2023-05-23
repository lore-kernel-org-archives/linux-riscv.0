Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5708C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 20:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qAIPwrH5sV9ZW7GYREXpRLK4fuw8I1WWhh48y2zvTv8=; b=AL4rsQy5lClCmv
	Y+9y4yzZb2fUsm4/r+KhE3NjKN7iCuMLEelfs48pbVtJPAuHL/27+HssHJRbV82c5yiyU4pqy+IBT
	QpJ609SFTG6N+miiMQjqRX19xSzVWYatNr5LTPKMGhSNihlxqpQMA8+IAoY12NS3WPwJXIi8DYtlD
	FXX0R5WAffMvv+Z/m9gOmyKQ6URy6YD54gfLSjNdX37rrCGwJmyJU6/OuzGl+zRb8SAOu4jdz+lbU
	dmBdS5r109Su0HjTYRDI9pDE3pxOvBYv6erQNJOTBzffj1O9QSSi9rnA6oyLWGpS+KaMMALqr8PMt
	zt7Uh7zenqpE/LHPvA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1YNh-00BLcg-0w;
	Tue, 23 May 2023 20:13:17 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1YNd-00BLZ7-31
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 20:13:16 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 34NKCcxC014675;
	Tue, 23 May 2023 22:12:38 +0200
Date: Tue, 23 May 2023 22:12:38 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        Zhangjin Wu <falcon@tinylab.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH 7/7] tools/nolibc: simplify stackprotector compiler flags
Message-ID: <ZG0eNtYH1VvXdLBN@1wt.eu>
References: <20230521-nolibc-automatic-stack-protector-v1-0-dad6c80c51c1@weissschuh.net>
 <20230521-nolibc-automatic-stack-protector-v1-7-dad6c80c51c1@weissschuh.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230521-nolibc-automatic-stack-protector-v1-7-dad6c80c51c1@weissschuh.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_131314_421654_ADC96225 
X-CRM114-Status: GOOD (  13.94  )
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

Hi Thomas, Zhangjin,

I merged and pushed this series on top of the previous series, it's in
branch 20230523-nolibc-rv32+stkp3.

However, Thomas, I found an issue with this last patch that I partially
reverted in a last patch I pushed as well so that we can discuss it:

On Sun, May 21, 2023 at 11:36:35AM +0200, Thomas Wei=DFschuh wrote:
>  =

> -CFLAGS_STACKPROTECTOR =3D -DNOLIBC_STACKPROTECTOR \
> -			$(call cc-option,-mstack-protector-guard=3Dglobal) \
> -			$(call cc-option,-fstack-protector-all)
> -CFLAGS_STKP_i386 =3D $(CFLAGS_STACKPROTECTOR)
> -CFLAGS_STKP_x86_64 =3D $(CFLAGS_STACKPROTECTOR)
> -CFLAGS_STKP_x86 =3D $(CFLAGS_STACKPROTECTOR)
> -CFLAGS_STKP_arm64 =3D $(CFLAGS_STACKPROTECTOR)
> -CFLAGS_STKP_arm =3D $(CFLAGS_STACKPROTECTOR)
> -CFLAGS_STKP_mips =3D $(CFLAGS_STACKPROTECTOR)
> -CFLAGS_STKP_riscv =3D $(CFLAGS_STACKPROTECTOR)
> -CFLAGS_STKP_loongarch =3D $(CFLAGS_STACKPROTECTOR)
> +CFLAGS_STACKPROTECTOR =3D $(call cc-option,-mstack-protector-guard=3Dglo=
bal -fstack-protector-all)
>  CFLAGS_s390 =3D -m64
>  CFLAGS  ?=3D -Os -fno-ident -fno-asynchronous-unwind-tables -std=3Dc89 \
>  		$(call cc-option,-fno-stack-protector) \
> +		$(call cc-option,-mstack-protector-guard=3Dglobal $(call cc-option,-fs=
tack-protector-all)) \
>  		$(CFLAGS_STKP_$(ARCH)) $(CFLAGS_$(ARCH))

By doing so, we reintroduce the forced stack-protector mechanism
that cannot be disabled anymore. The ability to disable it was the
main point of the options above. In fact checking __SSP__* was a
solution to save the user from having to set -DNOLIBC_STACKPROTECTOR
to match their compiler's flags, but here in the nolibc-test we still
want to be able to forcefully disable stkp for a run (at least to
unbreak gcc-9, and possibly to confirm that non-stkp builds still
continue to work when your local toolchain has it by default).

So I reverted that part and only dropped -DNOLIBC_STACKPROTECTOR.
This way I could run the test on all archs with gcc-9 by forcing
CFLAGS_STACKPROTECTOR=3D and verified it was still possible to
disable it for a specific arch only by setting CFLAGS_STKP_$ARCH.

If you're fine with this we can squash this one into your cleanup
patch.

Zhangjin I think this branch should work well enough for you to
serve as a base for your upcoming series. We'll clean it up later
once we all agree on the stat() replacement for syscall() and on
the various remaining points including your time32 alternatives.

Thanks to you both,
Willy

PS: we're still carrying a long CC list of individuals who are likely
    not that much interested in our discussion, I propose that we trim
    it on next exchanges and only keep us 3 and the lists, in order to
    remove some of their e-mail pollution.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
