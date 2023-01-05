Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC9AC3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 22:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=38dAwojgFa7jB8whN6KV1IJaxyx/8JOmyb7BCkUiRqs=; b=Ljt2LgngEPRg4t
	xLyizUwZIqMlbRhgM9/52m+zHoN1bWl+ZzjccjpKSnqMKIsPBEbuo1ydBjB1Yj4B7MtprWo2beSRb
	goOsazuSeREo2ykElC3agDf0W3QbN1LZ0zBhusANzJBG7eOqHcoJIabQCNHu6IaFoBq1tjgr17xrE
	UMg5V3/iXvkgHIfYEAUuZVbivKux3NWe1ZmKTS2FABKx3serEuaZiXE3mxx/+bHPZeCZu6tq9qYjo
	d8MOnpboj1gUmWaBrMXL6wfTIOxGrctEqUgGwN0baMPrblSV/J9/agLyPy7XVztOsi2+MTQ+bFWwQ
	8wDRgHTrg2BCvhDwCggQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYzJ-00FkQh-Rn; Thu, 05 Jan 2023 22:45:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVMJ-00DrBv-Jl; Thu, 05 Jan 2023 18:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/9qR6Ggey80h9L/qZBHe9ezWYYj2JCC/xmXTYt6n9Fc=; b=TeS5DMjD2wMIcuo10Rx6lUbPg3
	adUjhXGMgazKqHSAcxDnRBbdk1AOKPvy7yVQrFM+EPxbTPL9Ii47T7w5hm3pS+ibdR+mE09TCtCdb
	9uyDQVC6Mzj8cuxXvKNeuux4QJoFHVbjlSCVEGOMPB6Bwba83et5gsJoVAK6OX5fGiwYE5TQMavBA
	YfzBymX+j+X6XZ7zr1/85WHW5d/M4EfPR65rNuHuLlhB0Haz4OKMzJNLasPd1E28s9Ihub7nOVpEf
	aPNwws4oIUQDqOJvaHxkVe72a2z0X1ijQCSWQGK0vGzk3X4Dd7Kess8aBmjBziBWPixZpyvLfvpx9
	ZQIskMtA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDQz6-001N3R-2G;
	Thu, 05 Jan 2023 14:12:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BEDA61ACA;
	Thu,  5 Jan 2023 14:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A407C433EF;
	Thu,  5 Jan 2023 14:12:40 +0000 (UTC)
Date: Thu, 5 Jan 2023 09:12:38 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Jules Maselbas" <jmaselbas@kalray.eu>, "Yann Sionneau"
 <ysionneau@kalray.eu>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Aneesh Kumar" <aneesh.kumar@linux.ibm.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Arnaldo Carvalho de Melo"
 <acme@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 bpf@vger.kernel.org, "Christian Brauner" <brauner@kernel.org>,
 devicetree@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>,
 "Eric Paris" <eparis@redhat.com>, "Ingo Molnar" <mingo@redhat.com>, "Jan
 Kiszka" <jan.kiszka@siemens.com>, "Jason Baron" <jbaron@akamai.com>, "Jiri
 Olsa" <jolsa@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Josh
 Poimboeuf" <jpoimboe@kernel.org>, "Kees Cook" <keescook@chromium.org>,
 "Kieran Bingham" <kbingham@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, Linux-Arch
 <linux-arch@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-audit@redhat.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, "Marc Zyngier" <maz@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>, "Nicholas Piggin"
 <npiggin@gmail.com>, "Oleg Nesterov" <oleg@redhat.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Paul Moore" <paul@paul-moore.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Peter Zijlstra" <peterz@infradead.org>, "Rob
 Herring" <robh+dt@kernel.org>, "Sebastian Reichel" <sre@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Waiman Long" <longman@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Alex Michon" <amichon@kalray.eu>, "Ashley
 Lesdalons" <alesdalons@kalray.eu>, "Benjamin Mugnier"
 <mugnier.benjamin@gmail.com>, "Clement Leger" <clement.leger@bootlin.com>,
 "Guillaume Missonnier" <gmissonnier@kalray.eu>, "Guillaume Thouvenin"
 <gthouvenin@kalray.eu>, "Jean-Christophe Pince" <jcpince@gmail.com>,
 "Jonathan Borne" <jborne@kalray.eu>, "Julian Vetter" <jvetter@kalray.eu>,
 "Julien Hascoet" <jhascoet@kalray.eu>, "Julien Villette"
 <jvillette@kalray.eu>, "Louis Morhet" <lmorhet@kalray.eu>, "Luc Michel"
 <lmichel@kalray.eu>, Marc =?UTF-8?B?UG91bGhpw6hz?= <dkm@kataplop.net>,
 "Marius Gligor" <mgligor@kalray.eu>, "Samuel Jones" <sjones@kalray.eu>,
 "Thomas Costis" <tcostis@kalray.eu>, "Vincent Chardon"
 <vincent.chardon@elsys-design.com>
Subject: Re: [RFC PATCH 00/25] Upstream kvx Linux port
Message-ID: <20230105091238.42bd6e6f@gandalf.local.home>
In-Reply-To: <5b69db0b-9eed-42ce-8e93-4b656022433f@app.fastmail.com>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
	<7c531595-e987-422b-bcf7-48ad0ba49ce6@app.fastmail.com>
	<20230105104019.GA7446@tellis.lin.mbt.kalray.eu>
	<5b69db0b-9eed-42ce-8e93-4b656022433f@app.fastmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_141245_088781_4E6C6DBA 
X-CRM114-Status: GOOD (  20.21  )
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

On Thu, 05 Jan 2023 13:05:32 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

> >> I did not receive most of the other patches as I'm
> >> not subscribed to all the mainline lists. For future 
> >> submissions, can you add the linux-arch list to Cc for
> >> all patches?  
> >
> > We misused get_maintainers.pl, running it on each patch instead
> > of using it on the whole series. next time every one will be in
> > copy of every patch in the series and including linux-arch.  
> 
> Be careful not to make the list too long though, there is
> usually a limit of 1024 characters for the entire Cc list,
> above this your mails may get dropped by the mailing lists.

It's best to include mailing lists for the entire series, and perhaps
individuals for each patch. As I don't want the entire series just to see
the tracing portion.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
