Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0312C636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 11:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lx3pt/HMf6XaWNZ4Z3bKBR5gQTmMau7K5nc/BtI+ZLA=; b=49IpmzGDq3MP39
	c3RDYZSp9/TW9yBZRoLWBMEJ7+j2mOFTzC2Q13Ml6ZBG3YFy9egViVFr/fUUxL31Px2kQXSSRmoWl
	gPb2ESru/ata2ASTqpt7R+FPhDx3upVvyW3rpC1zr9vb2WbVgWR//1flkM++jG76YgWQYDosanK4D
	Z+/nZ9mH++Mw5uY4nnTpnxSKsVAKRAQoTmTqTsTwjVDD9PDJ7sXOmDJ6jpu0xV+BV4kHDnjsnfKFG
	kx9hrM21UbTfkq0MsgQMJ5ZBlMnpAbr1nZ7V8/aB24/LX7S15Z3rE7MtWy1qG4eoxMZftS6XyQB1C
	RJDJ8ZI7aMsIZZH6rBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSFXR-005Wpa-3n; Wed, 15 Feb 2023 11:01:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSFXN-005Woh-TL
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 11:01:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A51861B20;
	Wed, 15 Feb 2023 11:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47A77C433D2;
	Wed, 15 Feb 2023 11:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676458880;
	bh=IMpmER3plSrPEyPwHBO12hKRit2F+CRHQYxnU1U6els=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rqBMGlSiJgKY90EQOFovxSh9ADuPOUNWZE+X8gR/i0cEFSHTbrgeywn70TtcxC0UA
	 3ZFJXPubTVzGnIC4YT+KbY0JByUFpPwssZ3d8KmDhypEQdZlxF3VMh5ie1ZU2p7G/Z
	 e2T4e4Hi8xjpH6KrZJhgnJvza88+U00MkKN3KX25JEtrwFobB+TZM900Qvk6jWDXGY
	 YXV1urK78wjt8ZESoCp53dq5xuCg1z06hXDeUFHaW+6T7Ut5HGAQ16otXKyf7416lW
	 2Tv8aSUgE3+xdBkO84wNS9CsCo05PkTX8j4c2a6MepFonn9+aG9beW3kiyvHZ2tE0j
	 tnYvWZcHLudBg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Changbin Du <changbin.du@huawei.com>, Guo Ren <guoren@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Changbin Du <changbin.du@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Hui Wang
 <hw.huiwang@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH v4] riscv: patch: Fixup lockdep warning in stop_machine
In-Reply-To: <20230215034532.xs726l7mp6xlnkdf@M910t>
References: <20230202114116.3695793-1-changbin.du@huawei.com>
 <Y+wlula69tYrSZjQ@spud>
 <CAJF2gTQBiE7d_RiNjxoyx9gppYQxXBLeNhEsX04tjtjM_56gRQ@mail.gmail.com>
 <20230215034532.xs726l7mp6xlnkdf@M910t>
Date: Wed, 15 Feb 2023 12:01:17 +0100
Message-ID: <87wn4j42gy.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_030122_023643_B54F51B0 
X-CRM114-Status: GOOD (  13.32  )
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

Changbin Du <changbin.du@huawei.com> writes:

> On Wed, Feb 15, 2023 at 09:24:33AM +0800, Guo Ren wrote:
>> On Wed, Feb 15, 2023 at 8:22 AM Conor Dooley <conor@kernel.org> wrote:
>> >
>> > Hey Changbin,
>> >
>> > On Thu, Feb 02, 2023 at 07:41:16PM +0800, Changbin Du wrote:
>> > > The task of ftrace_arch_code_modify(_post)_prepare() caller is
>> > > stop_machine, whose caller and work thread are of different tasks. The
>> > > lockdep checker needs the same task context, or it's wrong. That means
>> > > it's a bug here to use lockdep_assert_held because we don't guarantee
>> > > the same task context.
>> I'm trying to delete all stop_machine in riscv, from ftrace to kprobe.
>> When I have done, we needn't this patch.
>>
> Which approch would you use? I looked through the riscv-spec, but didn't find any
> description abount concurrent modification and execution.

CMODX is not specified for RISC-V yet, unfortunately.

This has been discussed here [1]. Maybe we can start with stating for
which implementations Guo's approach work?

[1] https://lore.kernel.org/all/CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
