Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E890DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 18:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfeDr2d7j4FP1v4QrCTB/QFPeQev2+1lcb2ExTTOsHw=; b=BsucixQsrOPud5
	+l9BarBOvo0GmrCXgOBmOQuUCGcIzh+RgBADMfv5uV0q6oxbAwJxZJO6l+Oxco37T/KGtIyRXJQHT
	BO/TOi80Q2gLvjokPkeDWkMJii3AXEemfmt9rRcUILKz4Z5SDNVJAKHnAQ0VzM2pwH94S7USYa7Cl
	ILmw5z1HSftOBNN6M1t5gpTvCMwM7lUXMj0ZyQdSeBe4uq1OT1woGG8jb+cVBd6OLk3fOxN5I3T/e
	Exd6dXkIV7g7+5HGB5jSf0486gpEbBAQMNx8X/AB0VK0S79L7sESVPF7q6eMHxiGzdAcbQ0D2IpqZ
	68AM+1Dfkvali+cU+0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzjz5-0087rf-V2; Tue, 21 Dec 2021 18:35:35 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzjz2-0087qk-SF; Tue, 21 Dec 2021 18:35:34 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MXoQG-1myiI21Vvw-00YCU7; Tue, 21 Dec 2021 19:35:30 +0100
Received: by mail-lf1-f53.google.com with SMTP id bp20so15665482lfb.6;
 Tue, 21 Dec 2021 10:35:30 -0800 (PST)
X-Gm-Message-State: AOAM531lh3bItmp/uW0HT+FO/FgvP5TNhh1NropqoUsHhqV0Ykb2jLX/
 NLjHzxKmkPWyT++NKdJIlYMG6hYcxO1/RP8xwrs=
X-Google-Smtp-Source: ABdhPJxLPfvoBB+dfcIJaQqwJtQ3BevGRPxqadC+I3rCQp9PvcGuMoU65G3rfQPJYAfstpb2qB1NqFuHBwuqdhFOzcw=
X-Received: by 2002:adf:f051:: with SMTP id t17mr3447981wro.192.1640107753248; 
 Tue, 21 Dec 2021 09:29:13 -0800 (PST)
MIME-Version: 1.0
References: <20211221170057.2637763-1-guoren@kernel.org>
 <20211221170057.2637763-2-guoren@kernel.org>
In-Reply-To: <20211221170057.2637763-2-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 18:28:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3_Ha89oH5NYx6zPzTBj9y8spCAeihcbjqQVriDv9jCaQ@mail.gmail.com>
Message-ID: <CAK8P3a3_Ha89oH5NYx6zPzTBj9y8spCAeihcbjqQVriDv9jCaQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] sched: Remove unused TASK_SIZE_OF
To: Guo Ren <guoren@kernel.org>
Cc: Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 sparclinux <sparclinux@vger.kernel.or>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:oZEMmoLmfeY3uTiEo4Pn5Li8ZoAZ1uRMYx3u+yPELoRSzUVt4km
 12zRbkwTEzseegTp3HNZVztxkeoan7ASNJJ513Wl/p0wIAr8YUxKXbm1VMbTL4CJUiwr4+E
 eRkKK90kZqDFWqovSNhpIiwVX2YRlcYXwLiLM3PllL0NWpgnOiN6l6DIOrYzFigkaiJzkWV
 Y4JV7y9EYQleMr+KUy3TA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dtlWhVYiPQE=:TqMPBayvOjLeW8ohqEIX3H
 276dwU/3a9Cwi4amEW/2IglUbjtIRUr6YPmOUbI4HY7XZclaetXwI8cfyKDCaPcOunqAItG/3
 bcT9sPJSp/OPM9NPL9ifMoSYQxYlUWM84ePpQqIwHtYLk6mtWA703000p4KmZt4rlpeydGH2t
 jFefTZvgP9Xl31kwqKNaqCccdjucM95fKJcpm/0GFe7rXIjIwUF0RFlvV1pQZA1si7nQebZkD
 /G1H9cwsKonnV8cP3wH81s8P0ZKIFJYzNHiTt10ieHzT6SBBS6akqoTkLl3+QWmaz8KrOZYhi
 22ByLuzs6c8ef1F3IhjQwDtoq9eMCP71hXT0u/5+C6UvqxrGEJoFaB+YQl2h0Ww7ppPAwbN8z
 MrWB1p2wlYDEu7OCWec+IT70E/Qd5l0kAQgWks/D/BLkjeOlKJZeSGeyb1xBGmcgylNKM7SfF
 EcyKm0oWC+BkioRm8TNMr8tabY5lB1bEjJ1jBl6SZ5AkpQtl2YaAu2nmhyotAXUZmDKEoeHgT
 Gay7nd/0g9NtB8pdEmSnlMp7Ny6hKKm4+rFEMUwmAqqDVwigW57A8C7ZYEubAoqaTpu2rEr0J
 W/VWSEhrAOW4kS4+V/UchmkFkcJrpOpGTZr+MkqZf/LBVhqANAqyfpt2IFJESe6fNbZOtyEkx
 ythBnu734riJiCABJSZ5TqQVHlF+YFR45+VJjIUofLISXQW5eBXAqxbFG96Z0FW1jKsX/Qvz9
 zhUz3jOtJnH6/npJt6KygQrhT4rXSlFRPsk1DVSUzfn4OTMtiojRYKZ2MAIpbdO1Hn1acNPZf
 sECoL+827lV69IGGDlKmEzRUrZ8/c9+XqJHhCA5kj2g7laSV3g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_103533_228568_69669A98 
X-CRM114-Status: GOOD (  13.87  )
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

On Tue, Dec 21, 2021 at 6:00 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> This macro isn't used in Linux, now. Delete in include/linux/sched.h
> and arch's include/asm. This would confuse people who are
> implementing the COMPAT feature for architecture.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>

It would help to list how long it has been unused for. Looking through
the git history, I see commit a06db751c321 ("pagemap: check
permissions and capabilities at open time") removing the last user.

I would normally offer to take the entire series through the asm-generic
tree, as I do for this kind of cross-architecture work. I'll probably
not have time before the merge window to pick it up though, so it
may be better to go through the architecture trees, or possibly
linux-mm for anything that fails to get picked up.

For the series:

Review-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
