Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FF1ECAAD3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Sep 2022 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5fyJ8TcFubyR1KoZpMB5ZfG5JNmNpi+Zrp5fr+BeZI=; b=yDA3tY/KYp8wbK
	n9Xt5QQ6OFUqsnQk9Iab2WPogCp9lD3wFD1NVP7+4PgcaTqihrXaTofgU71teh+zHEYQ1ypOQ6qOn
	2p4P44byJBJfPT3EdF3DDnqiOHMOD/8zPez1INm1TiwH2CKSqnUbHjyAtOhCYtYSEeYL0i0D+B3gS
	FZ3UpVYYYQx7knrpSxi3jUIZe25pd8WCyK+X2IWSXweYh5J3LTHln703aNOB/L3rPNWdagk1dOYop
	xq5wY4UE374+rRb6a/2XeB1d1isXik9Alyb4O39WFWdyxZefh3R2HB9JObC1fVEx+Ioe1Mh4CPx3X
	xP7IdAofJB1UxD4aBnSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYT2S-001exo-GN; Wed, 14 Sep 2022 14:06:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYT2M-001emF-1a
	for linux-riscv@lists.infradead.org; Wed, 14 Sep 2022 14:06:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A644EB81BAD
	for <linux-riscv@lists.infradead.org>; Wed, 14 Sep 2022 14:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B75C43144
	for <linux-riscv@lists.infradead.org>; Wed, 14 Sep 2022 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663164402;
	bh=SbVhyLp4vuNdV4ZgSHN3FyYQusUe29UK76RsveSytbI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hidBY2LE4TusaHYxc963VAq5k6T2+IiJUNk6ZB+AiCSbgb0x8Vfp7qdDpXPYTmjjw
	 UCtyWSdaJPjfJOjd9dua/we+EuciX1tIWOjWXPRBqIVoBL1M9pV9IFRL/ZzzLyoIGH
	 qNldVzD4j6zmVQGDxKK7bEX0wEkha1NDuFXraee9V0aQdBUnILbbtObpwu91xQUQdT
	 OwztY32Han+pPzvzktJ0mu6Quo087cPjFki/18pjeyQJnzLvZFUxQnaio9tK1vPgSn
	 QscbzPZwkNIlhhfxdKPIeMw7o4xhSgyg5U3pc9qxWByoTXLJIoNh3tSxXaz0a1vt6i
	 0vl1u8yFWfwvA==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-127dca21a7dso41200888fac.12
        for <linux-riscv@lists.infradead.org>; Wed, 14 Sep 2022 07:06:42 -0700 (PDT)
X-Gm-Message-State: ACgBeo05ii8AmMFkZHPYR0TzJHEpjztr6n8KkBEzImaXo7S3mJbIAHLS
	u23urlgKGwJBHAo9brTSOcXXpONBVY/DUlFi43o=
X-Google-Smtp-Source: AA6agR6NppOamWRvCdsQ2N7xTzUkWLxWWqzTZdu2G0zYKx/IZbVDJkJgLzgDAY5wxBuviEdCFnq9oSYKimIJ5qfeI8M=
X-Received: by 2002:a05:6870:7092:b0:11e:ff3a:d984 with SMTP id
 v18-20020a056870709200b0011eff3ad984mr2338931oae.19.1663164401916; Wed, 14
 Sep 2022 07:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220913094252.3555240-1-andy.chiu@sifive.com> <20220913094252.3555240-6-andy.chiu@sifive.com>
In-Reply-To: <20220913094252.3555240-6-andy.chiu@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 14 Sep 2022 22:06:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRntKCD-Ou0cDtyCQhvSKq7iOqyo7+pxk7NO88UVi3nOg@mail.gmail.com>
Message-ID: <CAJF2gTRntKCD-Ou0cDtyCQhvSKq7iOqyo7+pxk7NO88UVi3nOg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 riscv/for-next 5/5] riscv: align arch_static_branch function
To: Andy Chiu <andy.chiu@sifive.com>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	rostedt@goodmis.org, mingo@redhat.com, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, ardb@kernel.org, 
	greentime.hu@sifive.com, zong.li@sifive.com, kernel@esmil.dk, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_070646_397803_E2CED220 
X-CRM114-Status: GOOD (  17.40  )
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

Is this patch related to this series?

On Tue, Sep 13, 2022 at 5:44 PM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> runtime code patching must be done at a naturally aligned address, or we
> may execute on a partial instruction.
If it's true, we can't use static branches at all. Have you
encountered a problem?

If you are right, arm64 ... csky all need the patch.


>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/jump_label.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> index 38af2ec7b9bf..729991e8f782 100644
> --- a/arch/riscv/include/asm/jump_label.h
> +++ b/arch/riscv/include/asm/jump_label.h
> @@ -18,6 +18,7 @@ static __always_inline bool arch_static_branch(struct static_key *key,
>                                                bool branch)
>  {
>         asm_volatile_goto(
> +               "       .align          2                       \n\t"
>                 "       .option push                            \n\t"
>                 "       .option norelax                         \n\t"
>                 "       .option norvc                           \n\t"
> @@ -39,6 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key,
>                                                     bool branch)
>  {
>         asm_volatile_goto(
> +               "       .align          2                       \n\t"
>                 "       .option push                            \n\t"
>                 "       .option norelax                         \n\t"
>                 "       .option norvc                           \n\t"
> --
> 2.36.0
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
