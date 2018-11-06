Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB6DC32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 06:59:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B38620827
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 06:59:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ASzpeBFX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B38620827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u85ys1Gctjs9zJIYt3NaCA9ta6bFcE0PjcGZUTZiQOc=; b=ASzpeBFXsaZ58X
	UN3JwZLk3A71nhdb/jNGbvOr/t4gtLN/gquaJcaygUJnlNwURRED6r1J+CCy3txC+z7AuPAPboEp0
	0C+ROzF9OEDrrjLX8f2/gGWZgDiIKYfrp8r2mzIBCfQNvzO32CQeLPfNMJBnJwkVozkFTARSodsvJ
	639Q8yky3S9GAWP/Ga9I+iZF3byD9zcVoqdmG4+WDFHqAgTxZlP8gyj40+KeYyDkzWYB3c9Izl3lB
	O7BMhk6FP0+wa6c51hkM5VGFYuJ86MRSFMeliZp/1v++F2fw4O5L//gbMwxKRDQQYL2jswgNHgQ5E
	e8dNd2XToxC6wcoz8GGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJvKT-0004sX-Jg; Tue, 06 Nov 2018 06:59:13 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gJvKR-0004sB-V2; Tue, 06 Nov 2018 06:59:11 +0000
Date: Mon, 5 Nov 2018 22:59:11 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 0/2] RISC-V: A proposal to add vendor-specific code
Message-ID: <20181106065911.GB13526@infradead.org>
References: <CAAhSdy0Y_jdc=2Lf8epof_+7HigCfhDxMNe8EF0fHfncqhs-zA@mail.gmail.com>
 <mhng-01f0ac6a-c2fd-41be-9d53-44d1c139d453@palmer-si-x1c4>
 <20181101174857.du2zu4vnrhpu5asf@excalibur.cnev.de>
 <20181105065807.GA1286@andestech.com>
 <20181105070551.GA7274@infradead.org>
 <CAK8P3a2c98VVPArCkdAR=-nnDBq1gYRCLDDgQB71eGiTSRdb4A@mail.gmail.com>
 <20181105090852.GA14924@infradead.org>
 <CAK8P3a2MSK-S+AzDGjq6t8WjcKrkj0XmynNL+fMPvL=JgnoEVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2MSK-S+AzDGjq6t8WjcKrkj0XmynNL+fMPvL=JgnoEVA@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zong@andestech.com, aou@eecs.berkeley.edu, alankao@andestech.com,
 greentime@andestech.com, palmer@sifive.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vincent Chen <vincentc@andestech.com>,
 kito@andestech.com, linux-riscv@lists.infradead.org, deanbo422@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106065911.JKNOsII6a_Q5T0GLIKoNas_b9isYNlglknYkOSRtEz0@z>

On Mon, Nov 05, 2018 at 02:51:33PM +0100, Arnd Bergmann wrote:
> With the stricter policy you suggest, we'd loose the ability to support
> some extensions that might be common:
> 
> - an extension for user space that adds new registers that must be
>   saved and restored on a task switch, e.g. FPU, DSP or NPU
>   instructions. ARM supports several incompatible extensions like
>   that in one kernel, and this is really ugly, but I suspect RISC-V
>   will already need the same thing to support all combinations of
>   standard extensions, so from a practical perspective it's not
>   much different for custom extension, aside from the question
>   how far you want to go to discourage custom extensions by
>   requiring users to patch their kernels.

Palmer already explain that this is supposed to be handled by the
XS bit + SBI calls.  I'm personally not totally sold on the SBI call
and standard ways to save the state in the instruction set, similar
to modern x86 might be a better option, but that is something the
privileged spec working group will have to decide.

> - A crypto instruction for a cipher that is used in the kernel
>   for speeding up network or block data encryption.
>   This would typically be a standalone loadable module, so
>   the impact of allowing custom extensions in addition to
>   standard ones is minimal.

And that is a prime example for something that should never be vendor
specific.  If an instruction set extension is useful for something
entirely generic it should be standardized in a working group as an
extension.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
