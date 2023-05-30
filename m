Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F85CC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 09:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fx9EUDMhdXTWEin2G4hshQROoaNXFDXq/wvV5Oz9RaE=; b=qYeys5zaIkLd6e
	W58sGXgK4tqqzyb/lQaLL1urSvn+mIU/PLHs+L92xi0KYQB8tW0EomzOEgPZaJS7s42ZOyb5HizmN
	2U5W7O1Sh9ksmUavvNbPqjKVY/wnUUOFYcZOwV9cZW++LwuWeqogxZF/0N+2Vq76kP9bew/IB7uho
	92Gu8xW8I+0maqEO9uC7ysOfLl3RyKE8QYjt7dGW21tLdbqrNqzgxYFOGt3ESnkdGEliegj5PCZDS
	oCY/WtS3IpII7djdSNXZGVEnFDNl2eU2rq19ueiC48RSaxTjkRJkxGOtV4LENVjpyKH/5q+qbqsJb
	BweIUxThoWZhprKtYYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vVJ-00D7ZV-1A;
	Tue, 30 May 2023 09:18:57 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vVF-00D7Xc-1p
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 09:18:55 +0000
Date: Tue, 30 May 2023 11:18:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685438326; bh=iu1Nw16K2WBuaMwQflIMrw8Zb5Pee49UbSoz4UZPF9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hpXqt7eFXwb3MXONv8u6XidxCco8p42t2rHmv29axh8znnaLlOdTPSTLoLHy5BeN4
	 kGy8DTGTGUdHn1fGcejk4VsysinyFB/DyLhRBYh45HL81i9dUGY3cZG39wuqGZ7MXJ
	 OZ0Uqb2Jl5LMvq0C3fgIL5VorPVBbYLGm628g6Ro=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] selftests/nolibc: add sizeof test for the new 64bit
 data types
Message-ID: <c68a6f60-0906-408a-9454-419085df695e@t-8ch.de>
References: <cover.1685428087.git.falcon@tinylab.org>
 <d1f4073e1dd9a51be93ea9e14ebd746b312646a4.1685428087.git.falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1f4073e1dd9a51be93ea9e14ebd746b312646a4.1685428087.git.falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_021854_084836_6F606E2C 
X-CRM114-Status: GOOD (  12.51  )
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

On 2023-05-30 14:42:56+0800, Zhangjin Wu wrote:
> These test cases are required to make sure the new added data types are
> really 64bit based.
> 
> Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> ---
>  tools/testing/selftests/nolibc/nolibc-test.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index 20d184da9a2b..43ce4d34b596 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -721,6 +721,14 @@ int run_stdlib(int min, int max)
>  #else
>  # warning "__SIZEOF_LONG__ is undefined"
>  #endif /* __SIZEOF_LONG__ */
> +		CASE_TEST(sizeof_time_t);           EXPECT_EQ(1, 8,                sizeof(time_t)); break;
> +		CASE_TEST(sizeof_timespec);         EXPECT_EQ(1, 16,               sizeof(struct timespec)); break;
> +#ifdef NOLIBC
> +		CASE_TEST(sizeof_itimerspec);       EXPECT_EQ(1, 32,               sizeof(struct itimerspec)); break;
> +#endif
> +		CASE_TEST(sizeof_timeval);          EXPECT_EQ(1, 16,               sizeof(struct timeval)); break;
> +		CASE_TEST(sizeof_itimerval);        EXPECT_EQ(1, 32,               sizeof(struct itimerval)); break;
> +		CASE_TEST(sizeof_off_t);            EXPECT_EQ(1, 8,                sizeof(off_t)); break;

These will break on 32bit glibc configurations.
(At least on x86)

>  		case __LINE__:
>  			return ret; /* must be last */
>  		/* note: do not set any defaults so as to permit holes above */
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
