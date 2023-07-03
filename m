Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACC9EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 11:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhmX9p+Cu4mKHzZFvG+hcupgCxnSvJoG+4X1TkVWtP4=; b=alxpzeHco3VLkP
	E4gtSHJGS/U7Ajc1/tBj6GB8+17bKgJtG/uO9kzgLFq6wU+LZYTSLMdfkhWOZH4K+AA2It9qaD8Pz
	D+4fkCwJlZSPcOqsSPqHhHp7QfcEkK5f1QAtGJoI4ymx51KrlI6oq3GwOaMeaa0vFx++x4BzDMhYA
	ByP59U3EHst7y2n/b5LgZo7xxiVdgGhXYCRwIj+5xv7KhHsDlTqmghAEurAlNJOjfy8wPW4BfgDR3
	i9oN7MzpibwG0t65UdH0Vm7mfmzpCdfo11wXFguxmWcD1HDFUb2pDMufZs84wNGtAhVEvuLT9X2Ay
	pv+d7g86WmmYmVl281kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGHfT-00AMO2-2V;
	Mon, 03 Jul 2023 11:24:31 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGHfR-00AMM7-0o
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 11:24:30 +0000
X-QQ-mid: bizesmtp81t1688383446t1op3cnl
Received: from linux-lab-host.localdomain ( [119.123.131.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Jul 2023 19:24:05 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: cbck7jzG4wYC8mah2/jqlcxJTdWqDIK9P0UT4RX2Zum2vuyXXC6GWwjeRgmzi
	5/ELDpDe6XvNbfUpTU0H8qffvoj/1wliAi3LfhVM+yvinfG5Yq2cc9wgZGr7jh3+q2tf7RO
	AVP4PAzEebTO5WBTKxnDJfl8edKAsiD56sJ7Mdl6KYgMye1rSVWgCU14evKkNZCml/bi14Q
	Sdy6bwd5XLt5b02oNBAone6RkiBz9wx7752eQed4TmgXmfPC6GQzVYaHFX+hc2IbYauTJpj
	k7ulh4XxvMPKqZAqj6EYHYBZo3GgI5uf7R+tKfcGfYV4yCGEeSW2k2rUFnsRkP95SaDkqSl
	61di5Pu28vy0V093/Gb0cHaV39BnMJpsgWjsf5ksaoxSxW3lno=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8141555401561398156
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	david.laight@aculab.com,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@weissschuh.net,
	thomas@t-8ch.de
Subject: Re: [PATCH v5 14/14] selftests/nolibc: add mmap and munmap test cases
Date: Mon,  3 Jul 2023 19:24:04 +0800
Message-Id: <20230703112404.496996-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZKKbS3cwKcHgnGwu@1wt.eu>
References: <ZKKbS3cwKcHgnGwu@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_042429_609459_1900E170 
X-CRM114-Status: GOOD (  28.55  )
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

> On Mon, Jul 03, 2023 at 04:06:47PM +0800, Zhangjin Wu wrote:
> > > >     /* get absolute path of myself, nolibc has no realpath() currently */
> > > >     #ifndef NOLIBC
> > > >             realpath(argv[0], exe);
> > > >     #else
> > > >             /* assume absolute path has no "./" */
> > > >             if (strncmp(argv[0], "./", 2) != 0)
> > > >                     strncat(exe, argv[0], strlen(argv[0]) + 1);
> > > >             else {
> > > >                     pwd = getenv("PWD");
> > > >                     /* skip the ending '\0' */
> > > >                     strncat(exe, getenv("PWD"), strlen(pwd));
> > > >                     /* skip the first '.' */
> > > >                     strncat(exe, argv[0] + 1, strlen(argv[0]));
> > > >             }
> > > >     #endif
> > > 
> > > No, please, not like this. Just copy argv[0] (the pointer not the
> > > contents) and you're fine:
> > >
> > >     static const char *argv0;
> > > 
> > >     int main(int argc, char **argv, char **envp)
> > >     {
> > >             argv0 = argv[0];
> > >             ...
> > >     }
> > > 
> > > Nothing more, nothing less. Your program will always have its correct
> > > path when being called unless someone purposely forces it to something
> > > different, which is not our concern at all since this is a test program.
> > > And I'd rather call it "argv0" which exactly tells us what it contains
> > > than "exe" which can be misleading for that precise reason.
> > >
> > 
> > Yeah, locally, I just used a global argv0 pointer directly, but
> > chroot_exe("./nolibc-test") not work when run 'libc-test' in host
> > system, that is why I tried to get an absolute path ;-)
> > 
> >     CASE_TEST(chroot_exe);        EXPECT_SYSER(1, chroot(exe), -1, ENOTDIR); break;
> > 
> >     -->
> > 
> >     19 chroot_exe = -1 ENOENT  != (-1 ENOTDIR)                      [FAIL]
> 
> Then we have a problem somewhere else and the test should be debugger
> instead. Are you sure there isn't a successful chdir() test before it
> for example, that would change the directory ? If so maybe we just need
> to save the current dir before calling it and restore it later.
>

Yes, as Thomas pointed out, the chdir test cases changed current
directory to "/" just before chroot_exe(), so, restore it with
chdir(getenv("PWD")) solves the issue.

> > I removed the "proc ?" check manually to test if it also work with
> > CONFIG_PROC_FS=n. it doesn't work, without absolute path, we need to add
> > the ENOENT errno back to the errno check list.
> 
> Same as above.
> 
> > I'm not sure if the other syscalls require an absolute path, so, the
> > realpath() is called in this proposed method.
> 
> No, please do not overengineer tests. That's only hiding the dust under
> the carpet and people adding more tests later that will randomly fail
> will have a very hard time trying to figure what's happening under the
> hood. If a test doesn't work as expected, we must not try to work around
> it, but arrange to fix it.

That's right, thanks.

Best regards,
Zhangjin

> 
> Thanks,
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
