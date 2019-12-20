Return-Path: <SRS0=aj0H=2K=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FCFC43603
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2019 22:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A672082E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2019 22:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GJ4m/28b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6A672082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pwsan.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CagoeS+SDpXyuonNb/ASHnKxyol4XFHZhIDokSivU0s=; b=GJ4m/28bgdFxyAdAm1KEKV0is
	soQ+cmpPWyqegg/XUU0sUHkxDYMjvQdC//QFdPrrTG3BogWcMmqXzieBXjsyFTU+pzqqdK6A0RT9E
	Bfcyr+4PSt/rtxLOkWLi0kZ22JpZNL+7n0ZWhCtqIGFUwnC1xlphTfCIcTZZic9X771CdrNPkF3gw
	rELYxkWrdU9/ZgxMxlyaxav4icx6xFJm6nXL2Huj4bU3bH2N/ZqLK9WPslpHTvV9/9nm3D9IvcUe/
	JdRobwKL53YVYi3rMSIcytgLLF1C912Dh5H+JSjIau+jiAFyLHDGzz34EygwadfHqKD3m/EBm0s/V
	YYyFehmoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiR2n-00025y-UQ; Fri, 20 Dec 2019 22:46:49 +0000
Received: from utopia.booyaka.com ([74.50.51.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiR2k-00025J-Nx
 for linux-riscv@lists.infradead.org; Fri, 20 Dec 2019 22:46:48 +0000
Received: (qmail 14788 invoked by uid 1019); 20 Dec 2019 22:46:39 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
 by localhost with SMTP; 20 Dec 2019 22:46:39 -0000
Date: Fri, 20 Dec 2019 22:46:39 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [RFC/RFT 2/2] RISC-V: kprobes/kretprobe support
In-Reply-To: <alpine.DEB.2.21.9999.1912200313100.3767@viisi.sifive.com>
Message-ID: <alpine.DEB.2.21.999.1912202244070.7752@utopia.booyaka.com>
References: <20181113195804.22825-1-me@packi.ch>
 <20181113195804.22825-3-me@packi.ch>
 <20181114003730.06f810517a270070734df4ce@kernel.org>
 <20181114074951.0902699286fdf8652f2878a4@kernel.org>
 <05082ba4-33d6-a95c-e049-78791dafc009@packi.ch>
 <alpine.DEB.2.21.9999.1912200313100.3767@viisi.sifive.com>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_144646_870380_0206E46E 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Patrick Staehlin <me@packi.ch>, Albert Ou <aou@eecs.berkeley.edu>,
 Anders Roxell <anders.roxell@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Alan Kao <alankao@andestech.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Zong Li <zong@andestech.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-riscv@lists.infradead.org,
 Jim Wilson <jimw@sifive.com>, zhong jiang <zhongjiang@huawei.com>,
 Ingo Molnar <mingo@kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 20 Dec 2019, Paul Walmsley wrote:

> Are you still working on these kprobes/kretprobe patches for RISC-V?

Just saw the reply that contained the original off-list messages:

https://lore.kernel.org/linux-riscv/20181113195804.22825-1-me@packi.ch/T/#mdfae8698806243c76f88f1da8594c23756523e82

Looking forward to what comes in early January.

I know the BPF guys have some test cases that are blocked by missing 
kprobes/tracepoint support:

https://lore.kernel.org/linux-riscv/20191216091343.23260-1-bjorn.topel@gmail.com/



- Paul

