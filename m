Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B0DC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1FXb9q2iLMQOeFTU5/+cWfutW9nEDzCdB4Zll7VLvIg=; b=pX4yYLIbmlRWLuhWRrBmLjoYb/
	6WWVp5aIQxTMZCFwifvJBfJmc04ay8u5jqYlVs2W7bDxUX/6+FknR6ciZKeP5wJoxqgKzq5gnXwuj
	Pe94Ctg7z2da38rqcJXA3BAPaxtQXDOx5higi4VVUQ/5E230JF6oZ8bDtqSjBShtc5eql5fduXVYH
	8HAsupxHqbMCsKeNo3tuqH4TLQ4D+iCxt9UGQxt45GApS2ctV2S7lsLlk+1O0mEaR3XRp15QSs1/B
	BS+QGUsKGXWWhblIQRGA15bU9O76GDt50ja6H8PIuZnuut2lZ3FjyEUpNUn3jG9qSlZk9aDB39SCz
	FSI21N4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZsDq-00000008vwu-37lV;
	Fri, 02 Aug 2024 13:21:30 +0000
Received: from flow1-smtp.messagingengine.com ([103.168.172.136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZsDn-00000008vvF-3a9U
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 13:21:29 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailflow.nyi.internal (Postfix) with ESMTP id 91C96200DFC;
	Fri,  2 Aug 2024 09:21:26 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Fri, 02 Aug 2024 09:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1722604886;
	 x=1722612086; bh=R0DqKzGqX1xbFZH9FuQ/nKBXdcQF/KmOifqz6blhFYM=; b=
	epIVo00Wp9YMmgC8ttebh96AyyWJ0vAYt35/n8Ah1/6GY9ca74EgslxUxVYBy6F/
	alDG1oRu77WQKa12vLryeyas4G0q4g6y1pbWWehUQFT5jc4vNYNmMF1n/QeyjKk8
	jyIgz90MQxO8Px0o9f3CDEWWv9n42BZHqCsEJvkyzXbDHwcY67PX8j0cvQ+8XuFD
	L/FahPp3Y36o2t4UNs4ukx7quF/xJeQNFt670ItFWoqKvWlUnaLZcmsHV2n8+zCQ
	qul3z/SWL2uqUBNwpRyPuCYAvJndGN8bHvzeSHYAL87Gon937cjshMhTmnUwtvNZ
	Mz833tOZb04f9SOf+zhaMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722604886; x=
	1722612086; bh=R0DqKzGqX1xbFZH9FuQ/nKBXdcQF/KmOifqz6blhFYM=; b=k
	ldSn2t2FtBUOpOcVK5o8ITMmEbXPZEsoi6QwwoYGucMAGz6/sqnNsZ90q/7ovktm
	kqQTg8WttPN+yB/iKLzFb/lCGRysoCblxcVN5h8AgIHS9YGJ/IhOphNwAk6Mikqe
	uXppIuQPHd+TGUg0z9XtAejATk5V8+Ldru7JghIHVEVg1xGIEG1hUFaBd/eR92pn
	2+y3apg4bWfv1nI6D2F3irjTxiQ+742zop0DEI77juuhyKdaHNw/rYyHOaT0/yhK
	JFlC0a480YQmdJTGtMKn4cbe2dVLMOJBCMHzl8bbOLkTUp3nR7wxe0TQtLD++MMA
	c+lQGI31lnfeSQb+abfCg==
X-ME-Sender: <xms:Vd2sZtIPksSVLwqVWP20KQPBb6WAsqKVG5PBBve_xYkoQUfuqDvxaQ>
    <xme:Vd2sZpKE9eWo0CbVEPoIiV5zMut6irh_xZyEUaU4QGpx9QDWmKK5cGhpdAbRgyeqA
    UojwRIMa_FLJSzK9ec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkedtgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdv
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:Vd2sZlv2nEgNMtIrDfuarcE-IsCX971gYvIrlSwicWxEgcc1EaTjJQ>
    <xmx:Vd2sZuYS8jqkM2Nc_Ebdow8iPW5fOox28yQNpQONjcw_7H5-XhMhrw>
    <xmx:Vd2sZkZ0WLLb9ySlLDZ2kXhAqDFNpLMUjgspUwm0AnjzbCSf_sATZg>
    <xmx:Vd2sZiACj81lIx51y_lXAxSLVckwPu-xI6Shd0DP_sgO0Ls0NGt-fA>
    <xmx:Vt2sZkNqje0BCjj3jKuDa5CPjs_vBlOJJ6Xug-0-GnuQbN9FKiLzJ5aC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B96AFB60092; Fri,  2 Aug 2024 09:21:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 02 Aug 2024 15:18:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "Jiri Olsa" <jolsa@kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 guoren <guoren@kernel.org>, "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Kees Cook" <kees@kernel.org>, "Peter Zijlstra" <peterz@infradead.org>,
 "H.J. Lu" <hjl.tools@gmail.com>, "Sohil Mehta" <sohil.mehta@intel.com>,
 "Oleg Nesterov" <oleg@redhat.com>, "Andrii Nakryiko" <andrii@kernel.org>,
 linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Message-Id: <6662ea26-9850-48fd-a67c-01daf412dc2e@app.fastmail.com>
In-Reply-To: <20240802181437.29b439e26608561f1289892a@kernel.org>
References: <20240730154500.3155437-1-arnd@kernel.org>
 <20240802181437.29b439e26608561f1289892a@kernel.org>
Subject: Re: [RFC] uretprobe: change syscall number, again
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_062128_103635_62739AEA 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 2, 2024, at 11:14, Masami Hiramatsu wrote:
> On Tue, 30 Jul 2024 17:43:36 +0200 Arnd Bergmann <arnd@kernel.org> wrote:
>> ---
>> I think we should fix this as soon as possible. Please let me know if
>> you agree on this approach, or prefer one of the alternatives.
>
> OK, I think it is good. But you missed to fix a selftest code which
> also needs to be updated.
>
> Could you revert commit 3e301b431b91 ("selftests/bpf: Change uretprobe
>  syscall number in uprobe_syscall test") too?

I folded the change that Jiri suggested now.

> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks,

     Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
