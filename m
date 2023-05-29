Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C5DC77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 20:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6F4gepfSSv0e8g/1ekgcJJlTrSEQ8HiQyhqPXC+Z/3U=; b=0YUSbeC3BD+BSv
	ODUf8Ng/tMQ8/V5BbHT7wdtSR1VRw26AXP5/phD/QZnUW0AT3lZH0zoMtPqRgJ7XG7DXWekWUa2N4
	N2hUHwM1AtMNJGRyXWyyf/acJTOGa7AY0cMjlOMjZkWiKoYYanDUi+mGbBJcM7Y1AMIzhp2TAInV5
	zZDutdMLycVmBAWjDsjV2Ums/uHXaFSXSrlGQOfK9DiD94WVZZSZ41Zi8IgwAImTWuom+2JCPKD7/
	Ym3e5GI8Ncw5Pub0GBjh7jTi/0ar7Bs7KgeZaUZSZ8LS61oguUGKLaM9uI/pJWUswrS6eNwL7gaVn
	wtMMLQho6Q5AqDe4p5hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jWu-00BdoS-0i;
	Mon, 29 May 2023 20:31:48 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3jWq-00Bdmp-0H;
	Mon, 29 May 2023 20:31:45 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 2291B320090C;
	Mon, 29 May 2023 16:31:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 29 May 2023 16:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1685392295; x=
	1685478695; bh=DCa8NPk9IuG+WNbCMRnuP/IxB0Pl7FH8qyE+0eRHJLE=; b=g
	51xJiMNAfnywRNaD3sFCi4EWoKX95CMbfsWfgr8i8QBh2XU01iTYEH651FTYMfBR
	eENJxHZXEBY6SHI82PoBlibyNwyMHb5CEMDsM4HAc/1DPIrxGAcw2ini7p8OpwAt
	0XBSEzx0uuMml7y7tKe1HD4n1O+OodJSt1hUCaj7Z2ltFzWeMlVWjlIyOi5ibTuM
	H9lf4NAVJx/6bOTle/jlhB17+06jUR86qkstmwB2UJcP9BoEw4R0yx5aq6TZNMff
	uNOrKIqz/mXARFrDKSjCs7Ano9QeYkuN6kasWAfb6WLqR9/gKZNp2CgHsNO7G+Ex
	0cqUHmJsfss/o80o0bceQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685392295; x=1685478695; bh=DCa8NPk9IuG+W
	NbCMRnuP/IxB0Pl7FH8qyE+0eRHJLE=; b=jxLgL3msxxvEE+iVvJ9EYQ6flYOI+
	PTknpL87XHUqZUUXtxuycAfdgmrGeDDBzHwt8yoTQ8OTW2tYp4I4HyGD6vZjKWiL
	EI9CvuulhRsv5KAy5SIv37QTKPsdZYc5cEtmkwrQ1jaNbUtFsZGjmPXwfGyHF6lH
	fda1PWXR4MgivTlR3gOsOvs4n3GQsmRNmwkN+A3mfnYvulUbqBSSBOMyg5CsT2Gg
	QuF4SHa6SSA/9ajq/ExTcDInNXEhick4e1XyH6ixuPrGszeje3ZjtMWd2vH6G6gq
	hI2niC4RY0efP30eC6MD4ryUHVv+bxW+e8U7tILGJuxI57iI3hUGqGTcA==
X-ME-Sender: <xms:pQt1ZGquY-RJJPwhiyXLj88_vwSRsqQaqIvqq3TYp75IlzMqclkMuQ>
    <xme:pQt1ZEqb0sqR3fGtfUCNZMdnr3xVXXAEXb3EL3QbwrSYPaw-KgK0HqHyVRfmLGHlL
    2SLFJsRbwj10RktFEs>
X-ME-Received: <xmr:pQt1ZLPyyN6Dxb9Ex9rfS4LxYu9JqnWKuu0r_uHQMiI5jU_MFwU8gqlxTxSoeOxsWMaAJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeekhedgudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttddttddttddvnecuhfhrohhmpedfmfhi
    rhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhesshhhuhhtvghmohhvrd
    hnrghmvgeqnecuggftrfgrthhtvghrnhephfeigefhtdefhedtfedthefghedutddvueeh
    tedttdehjeeukeejgeeuiedvkedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdrnhgrmhgv
X-ME-Proxy: <xmx:pQt1ZF6Ug6G2DzdYaiBpXCA-6GY5DMUd-e0vIMZjZWfBENTGm7YSXQ>
    <xmx:pQt1ZF5kPoNys_QUug6msAqk6_nQsiFszi7Le9iIkVO_5nb8Pt9Vww>
    <xmx:pQt1ZFjMS3tBme0-PUUGqQ47XYrB6EOI87nK0zN0js6fveWGb-TiMg>
    <xmx:pwt1ZLYZvYFsVW_s17E_0AwQLCBmIG-wSGrCfVwazXpeHtO0wIVizQ>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 29 May 2023 16:31:33 -0400 (EDT)
Received: by box.shutemov.name (Postfix, from userid 1000)
	id EF39B10CE6B; Mon, 29 May 2023 23:31:29 +0300 (+03)
Date: Mon, 29 May 2023 23:31:29 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Usama Arif <usama.arif@bytedance.com>,	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,	Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,	Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
Message-ID: <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name>
 <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx>
 <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bki3kkfi.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_133144_507357_8D676EA3 
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

On Mon, May 29, 2023 at 09:27:13PM +0200, Thomas Gleixner wrote:
> On Mon, May 29 2023 at 05:39, Kirill A. Shutemov wrote:
> > On Sat, May 27, 2023 at 03:40:02PM +0200, Thomas Gleixner wrote:
> > But it gets broken again on "x86/smpboot: Implement a bit spinlock to
> > protect the realmode stack" with
> >
> > [    0.554079] .... node  #0, CPUs:        #1  #2
> > [    0.738071] Callback from call_rcu_tasks() invoked.
> > [   10.562065] CPU2 failed to report alive state
> > [   10.566337]   #3
> > [   20.570066] CPU3 failed to report alive state
> > [   20.574268]   #4
> > ...
> >
> > Notably CPU1 is missing from "failed to report" list. So CPU1 takes the
> > lock fine, but seems never unlocks it.
> >
> > Maybe trampoline_lock(%rip) in head_64.S somehow is not the same as
> > &tr_lock in trampoline_64.S. I donno.
> 
> It's definitely the same in the regular startup (16bit mode), but TDX
> starts up via:
> 
> trampoline_start64
>   trampoline_compat
>     LOAD_REALMODE_ESP <- lock
> 
> That place cannot work with that LOAD_REALMODE_ESP macro. The untested
> below should cure it.

Yep, works for me.

Aaand the next patch that breaks TDX boot is... <drum roll>

	x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and enable it

Disabling parallel bringup helps. I didn't look closer yet. If you have
an idea let me know.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
