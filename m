Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F571EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 12:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQfJYKjFuTxBxFIcup163TdO5/H4oZgTTG6YYCHpg8U=; b=p307/ZaC1SZVHC
	s4fxG035xNOarHcA9cDoA+CYrViPBmZkhL/pVwJqjiSm5tHoE9w0H5L+55nKujyhh8ajYQJYa/XII
	DwaQ0ACP+dGYYkKGQpbmGR8qttKnCVlLts1Zk7z7Tah49SxnI29G9K8vNqa1pb662goPfKO3gszFP
	91k8fEzVFqNBPSk2thEHgSdNsYUutKccqGG+A19kprzjuiKwPWZ0R0tYit2V2KVGFt3WjQtlcIuXs
	q63NHQVbezSNV2osPwgpRD0ssmlN6xH/R6pH+ctI+frz6z8xmVzSmkXnRlLIcPgVCFPjUvk9jZItI
	uWd07CWfson5wOFXRQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqsn-0016R0-31;
	Thu, 29 Jun 2023 12:36:21 +0000
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEqsk-0016Ov-1F;
	Thu, 29 Jun 2023 12:36:20 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 3C0B92B00163;
	Thu, 29 Jun 2023 08:36:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 29 Jun 2023 08:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1688042167; x=1688049367; bh=bT
	G+9AqapEnTzTdZN+3/z4mAZ7LW415XlukWbIMXEK4=; b=jVer3ZsYEpv4oKp9MB
	szsrrrdYGu7rGZrQTOVLMkGALoFHHLvc/oUUpXJBoXJgdCfT0l7aA0yKhATrYNXB
	aEGN9jvcC01pqiHdFsqq0bkFFSz9UIn0wpYtG5wYSyHBgIUb0q0WF10Dn3D0ys+Q
	XdVTz1xDdvBF5BWZT8QJkN/TJUgNTFQEn9uRiImRIIIxVlZAUYgfDYxAZN24C9If
	0fvLO/7Vh+JJJx9ib3bnVyk06XlQdUmqqoWItzk2IhpGynOSTiS1PFOrwsJCeCaJ
	8UiDOATEhC65kKFJEjC7rOkzppp5TX9XQuMvRoXskdiug/iaC/tnwPy1ygPdzaL6
	IoZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688042167; x=1688049367; bh=bTG+9AqapEnTz
	TdZN+3/z4mAZ7LW415XlukWbIMXEK4=; b=CccPJWvx1a+Oz1MM5Taiu9fsGftW9
	hmgBcLqXYChcnfp2nv6RWUg7M5kQcytbmDfhV1AVipcw49+CmNKous2ER6JLcGud
	qLKDK3EFXotIhbICdzx3r91mhkebGgUqVWBxeOtOqIwIjt2VLx2+7M0e0ZNBw8IY
	QYBew9HSxFvupkHfoU1p8ZntBi5WUvQWBmTXQhafzKFZRTGtPdZIsRBX2guG6EvC
	jm91VDAmWV04RD50eKeuNQ1gIbDXgSNCl/ADV15oAHykwZ0L0pLZZYK3u1cr3+Rr
	x7zXD2MAiXbufbU1CsLjDKzyEFWnoX4+00s21o08yDXbrmZmwqDH+dXBg==
X-ME-Sender: <xms:tnqdZAyITayvFU5PbWEsgwbjYWgt1_bFD3KxUqWmvV0MpPRpzRhMYw>
    <xme:tnqdZETRQyAQkFjh37a8uYBhXLeGI9R7f1m3td7LD-JziB80SvWJeQz0ASta2bqx9
    LtzynNQufcPspiPv5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeggdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:t3qdZCWK84TlQOUoGax5_YXtDLllqy8UMuSas5speVwKDdAYHHtFmg>
    <xmx:t3qdZOh7zh5gc4FrE0MBs27VLcYOiuEURtr1UYpC_ojWWV1ts5U5xw>
    <xmx:t3qdZCD2YEfxCMDoMp6Bks-zFbCY2rQklJKHTChqpgGWw39PgvnhXA>
    <xmx:t3qdZKjiEc4oaeDQe8Jc0rTS3lifMyHCY8K24zrYhOb09JLKNV8fH1kx3iQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D6555B60086; Thu, 29 Jun 2023 08:36:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <80e3a583-805e-4e8f-a67b-ebe2e4b9a7e5@app.fastmail.com>
In-Reply-To: <20230629121952.10559-8-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-8-tzimmermann@suse.de>
Date: Thu, 29 Jun 2023 14:35:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Kees Cook" <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Juerg Haefliger" <juerg.haefliger@canonical.com>
Subject: Re: [PATCH 07/12] arch/x86: Declare edid_info in <asm/screen_info.h>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_053618_979619_CEE5BAE8 
X-CRM114-Status: UNSURE (   9.21  )
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

On Thu, Jun 29, 2023, at 13:45, Thomas Zimmermann wrote:
> The global variable edid_info contains the firmware's EDID information
> as an extension to the regular screen_info on x86. Therefore move it to
> <asm/screen_info.h>.
>
> Add the Kconfig token ARCH_HAS_EDID_INFO to guard against access on
> architectures that don't provide edid_info. Select it on x86.

I'm not sure we need another symbol in addition to
CONFIG_FIRMWARE_EDID. Since all the code behind that
existing symbol is also x86 specific, would it be enough
to just add either 'depends on X86' or 'depends on X86 ||
COMPILE_TEST' there?

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
