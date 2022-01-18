Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D7FC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jan 2022 14:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qmvf9qLo7fug6raoEsc+Mhv6LufmnfgZBe2t5Yq5gc=; b=qu9naazQdKGByt
	8qqE6GluaDOfjO5JN/qGjzB8GKe3J03F3n18fgek7gKEX/8BxcRfTXo9DcbOLJFyqI8cyLNUA3Efc
	9S5+Dg+XoNA91tbLUyQMlOlFZu4j8hDa2FSQw4UzV5gsqAFtTdJaY6iT2XgrgGMHtu/AteCyiI7Wi
	lQXOW3W2KJw3EKaeyJ+RzU1KF6SEzMnOpAPCyHL11YgXkaqPIjKZoyBJl3ZLgFYxCVBrbvCiaQ36w
	Vo/bBsHPyUpMk/eFIcofAQZ89XnJHIGm3aF5OgwhVlo214VGWWr9eU+Z+/XOxCtsl07REjb4b1CYL
	i62IDUQ1jIRp6Cpt4okA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9pM5-001pjx-Og; Tue, 18 Jan 2022 14:21:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9pLs-001pgl-BU; Tue, 18 Jan 2022 14:20:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 23BDD6149E;
 Tue, 18 Jan 2022 14:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60690C00446;
 Tue, 18 Jan 2022 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642515646;
 bh=LQnVNXXFkBGvBwIEYlzUC8mACRKwyF7PmpnrofVDnmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=khXMs8nOsMDKs5MbBbUOYqR0A/rLczE6TVnUebuvjd1p/2kox9EI8UHHK3/EjV30Z
 ohxTVi74dxt8DMuc247yuDL7XlpUTU0Zx8h9nonZxWsId6kYqmpHC0XIVOLA3xeXAW
 eLxJcJWMsST1k9ztnKqcMMcgjxgmKJ1NGTpgYlI8lE/i+uFAOa1rMuu5RoDEDEz6wo
 SSUb1DBt8Hrs4qjX8iLFIZWLnncgw7TBwix/+xt7cI42bgjDT8OXg7e7JtRjocepJ3
 oxCpVtpas1q4P4rbAkfT+tu3MbIqUJlCCTdjPERSM3/oTW+JZf6DSlaAj1WDwvVpDO
 ZU5KAaVkdPuvw==
Date: Tue, 18 Jan 2022 22:13:03 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 hpa@zytor.com, Eric Biederman <ebiederm@xmission.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 Alexandre ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v2 0/5] kexec: use IS_ENABLED(CONFIG_KEXEC_CORE) instead
 of #ifdef
Message-ID: <YebK70Sx4w8zLfj/@xhacker>
References: <20211206160514.2000-1-jszhang@kernel.org>
 <20220116133847.GE2388@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220116133847.GE2388@MiWiFi-R3L-srv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_062048_479355_3E85F4F2 
X-CRM114-Status: GOOD (  16.42  )
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

On Sun, Jan 16, 2022 at 09:38:47PM +0800, Baoquan He wrote:
> Hi Jisheng,

Hi Baoquan,

> 
> On 12/07/21 at 12:05am, Jisheng Zhang wrote:
> > Replace the conditional compilation using "#ifdef CONFIG_KEXEC_CORE"
> > by a check for "IS_ENABLED(CONFIG_KEXEC_CORE)", to simplify the code
> > and increase compile coverage.
> 
> I go through this patchset, You mention the benefits it brings are
> 1) simplity the code;
> 2) increase compile coverage;
> 
> For benefit 1), it mainly removes the dummy function in x86, arm and
> arm64, right?

Another benefit: remove those #ifdef #else #endif usage. Recently, I
fixed a bug due to lots of "#ifdefs":
http://lists.infradead.org/pipermail/linux-riscv/2021-December/010607.html

> 
> For benefit 2), increasing compile coverage, could you tell more how it
> achieves and why it matters? What if people disables CONFIG_KEXEC_CORE in
> purpose? Please forgive my poor compiling knowledge.

Just my humble opinion, let's compare the code::

#ifdef CONFIG_KEXEC_CORE

code block A;

#endif

If KEXEC_CORE is disabled, code block A won't be compiled at all, the
preprocessor will remove code block A;

If we convert the code to:

if (IS_ENABLED(CONFIG_KEXEC_CORE)) {
	code block A;
}

Even if KEXEC_CORE is disabled, code block A is still compiled.

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
