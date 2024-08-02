Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F77DC52D6D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 14:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BrPvZ2HQPCtPyR7/47Ac/jerlidweSYZuM1g9MqXRYg=; b=V3ntHLPglJqCj5
	uechZMUqTJ1hRLY1g6VW/3mp64QPoLDTjM8FO1XiuRout/KFNRbmYDdGKwrrJoLkTEK+AaPFy4Rva
	/YVcnaWzltvifI/GN5eWZdaG3Vq3GlFGhctUo/LkbJ5oQvtE0gNg9QbOR8N1wd8cN/BtXed5k6he5
	IqN+O0SaC3a0zCqwyKbnbcuEMFxqOS4jLVdD0ZVC1o/Ybt2j+oDzzBvIM737VKq4/SWjRTV+DaaWh
	/uTcudXSAn2Tt2V8vzLTedQg8fiyHAyi6Cei7MU2urSOLe9m4MSgQBoJqiuLDK5H/pZq+8tRZ61Vu
	/cPvF+jOKMM7uSbVNNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZspU-00000009140-1Wzk;
	Fri, 02 Aug 2024 14:00:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZspS-0000000913L-22lm
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 14:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 772A7CE1AFA;
	Fri,  2 Aug 2024 14:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 556C3C32782;
	Fri,  2 Aug 2024 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722607219;
	bh=mUHev5+wVFteh2AXlxax3nVXkSA/YXwRUNjtnJNhS/0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IG/BvCXvY0pdD/1jBt6YyxN2brYe0X1adt7Np3EwFJ8nm46pkhcnBRggFGuyOZQhv
	 C8MAMSXe7ax1l9oVlSsCJQeOu5o5uc1dt3UWxhRPnSiCWwgFh7hqLUktgkNkg99o20
	 T5/uHc6VbTNQ1zLLp2y5bPokkNUdkNBpYYTlwsdTBx6moQKAj4h5pbmtPTpHD+1tzJ
	 J280i2hmY/UiyY3yYYA/3Z+VyPWqxaCfMtPZAM76vTz9xDea4k4ETaj8+m+sUWdajO
	 9wMz+36Rs98K64/mUDIkWtYNtI41hNg7StHK5+dSmMGqYG6FQyHJ3LrSiqgKTccy96
	 jUGwKzcGODu+Q==
Date: Fri, 2 Aug 2024 23:00:12 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, x86@kernel.org, "Jiri Olsa"
 <jolsa@kernel.org>, "Linus Torvalds" <torvalds@linux-foundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 guoren <guoren@kernel.org>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Kees Cook" <kees@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "H.J. Lu" <hjl.tools@gmail.com>, "Sohil Mehta" <sohil.mehta@intel.com>,
 "Oleg Nesterov" <oleg@redhat.com>, "Andrii Nakryiko" <andrii@kernel.org>,
 linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: [RFC] uretprobe: change syscall number, again
Message-Id: <20240802230012.938e42a56ff2d0f09ca8100b@kernel.org>
In-Reply-To: <6662ea26-9850-48fd-a67c-01daf412dc2e@app.fastmail.com>
References: <20240730154500.3155437-1-arnd@kernel.org>
	<20240802181437.29b439e26608561f1289892a@kernel.org>
	<6662ea26-9850-48fd-a67c-01daf412dc2e@app.fastmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_070022_712642_FB733CA5 
X-CRM114-Status: GOOD (  15.42  )
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

On Fri, 02 Aug 2024 15:18:52 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Fri, Aug 2, 2024, at 11:14, Masami Hiramatsu wrote:
> > On Tue, 30 Jul 2024 17:43:36 +0200 Arnd Bergmann <arnd@kernel.org> wrote:
> >> ---
> >> I think we should fix this as soon as possible. Please let me know if
> >> you agree on this approach, or prefer one of the alternatives.
> >
> > OK, I think it is good. But you missed to fix a selftest code which
> > also needs to be updated.
> >
> > Could you revert commit 3e301b431b91 ("selftests/bpf: Change uretprobe
> >  syscall number in uprobe_syscall test") too?
> 
> I folded the change that Jiri suggested now.

Thanks Jiri and Arnd for fix that!

> 
> > Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
> 
> Thanks,
> 
>      Arnd
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
