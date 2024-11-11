Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8939AD2E9D4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9bW3yagNh9WWHtocNU1gEmotuhAGXa8t4UIk8DR0WY=; b=TpetkWxq7AKIXj
	ii0XCOOLHPCma1Nuyn2KPWXpqbqLNGcBHTrOOoUwEPSBMPutYXRedOGQ1U4+zW4TOxXvpgj19ukGO
	6Pdld1muO9Zo5L1IiPsfJw2p+gVTrIO90AM4djiMbMk0FwYhY7MrFFddfyRByzPTbb5SqifxlMfWr
	7nPsEhoTCIl/A7a6tbnKsmUFw2I0fX6bElTnBZ7eaaoJHArzlCpXV3PgkeIpsVMVv0Kup3Wl85JQp
	8v11Q3crGC24nZ3UeIn/HdWX+Pp/pKevvygKKOTCGW87TbcZXmdIRrWLiv6Kq8ia/4RGNkA291RSK
	yDuy82cvuVWQf0aUCsjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARfH-0000000HGxj-00f9;
	Mon, 11 Nov 2024 10:28:59 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARfE-0000000HGsh-3TBz
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 10:28:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D9621C0008;
	Mon, 11 Nov 2024 10:28:37 +0000 (UTC)
Message-ID: <26452229-7461-48aa-987a-28444ace4f28@ghiti.fr>
Date: Mon, 11 Nov 2024 11:28:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: add forwarding header for
 arch/riscv/include/asm/fence.h
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrea Parri <parri.andrea@gmail.com>, linux-kernel@vger.kernel.org
References: <mvm5xq44bqh.fsf@suse.de>
 <d380fd10-ebc4-4d66-becb-13995372d41a@ghiti.fr> <mvmfrnyxg2n.fsf@suse.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvmfrnyxg2n.fsf@suse.de>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_022857_044704_6F474979 
X-CRM114-Status: UNSURE (   9.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Andreas,

On 11/11/2024 10:41, Andreas Schwab wrote:
> On Nov 04 2024, Alexandre Ghiti wrote:
>
>> Unless you have any objection, we'll try to make Bjorn's patch into
>> 6.12-rc7 instead of yours.
> It still fails the same:
>
> In file included from /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/tools/include/asm/barrier.h:12,
>                   from /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/tools/include/linux/ring_buffer.h:4,
>                   from libbpf.c:37:
> /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/tools/include/asm/../../arch/riscv/include/asm/barrier.h:13:10: fatal error: asm/fence.h: No such file or directory
>     13 | #include <asm/fence.h>
>        |          ^~~~~~~~~~~~~
> compilation terminated.
> make[5]: *** [/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/tools/build/Makefile.build:106: /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o] Error 1
> make[5]: *** Waiting for unfinished jobs....
> make[4]: *** [Makefile:164: /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/linux-obj/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2
> make[3]: *** [Makefile:63: /home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/linux-obj/tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2
> make[2]: *** [Makefile:76: bpf/resolve_btfids] Error 2
> make[1]: *** [/home/abuild/rpmbuild/BUILD/kernel-default-6.12~rc7/linux-6.12-rc7/Makefile:1393: tools/bpf/resolve_btfids] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [../Makefile:224: __sub-make] Error 2
>

Indeed, Bjorn's patches did not make it into rc7...


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
