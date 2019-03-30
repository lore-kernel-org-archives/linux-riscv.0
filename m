Return-Path: <SRS0=IMuD=SB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1ECC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2019 00:26:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56895218AE
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2019 00:26:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UuQ/gr15";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXnVruru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56895218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TZ2EBxTAkTj8/+XCCZWLKP5bhZBom6SzO58cbeJ7Mbc=; b=UuQ/gr15sHWQ4J
	tf/kCL/v8u19fuI+cJWysGtnwduSsZrpcXodL907ctdSM79mvQuZkzq8ZMGLeOyF5TAemPZO6IBd1
	2201/VA1q37JjnRXD6H4QmjmPb6xkhgIW0dUT+WRQdt7xAN3/3diZd0+epHYgd6atJSHfnxoDQBmx
	N70NJZokoYr31tmQtG52bdo6txznMsscohMiZOTtrBrhJ1rErL77E1shOTGN2AYAKaNkv8EmWOp5D
	fL/iSyauMfAjOQnB5tUB11ExVQ9C5oPVbRc8eUn6CV4Vp7JNf5Vb2ybs4xOQu4zQac1UB6YkhBWO8
	jtrXgMOH/rCRED3ltoiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA1pC-0003wE-6z; Sat, 30 Mar 2019 00:26:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hA1p9-0003vv-C5
 for linux-riscv@lists.infradead.org; Sat, 30 Mar 2019 00:26:16 +0000
Received: from guoren-Inspiron-7460 (23.83.240.247.16clouds.com
 [23.83.240.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D68B12184C;
 Sat, 30 Mar 2019 00:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553905574;
 bh=1bhsFjWAK6lh/uCPFObZCtZRp0Km0Vkrns4w9q2CIYg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KXnVruruCipS55pPtOw8/S7k5sLQRYLPqZ+v6p7iBi2Hv7ssYw2BJ0m761ZOhX3VB
 irZ1k53Eg19XOxYMSqEnZX4DRTmOdwy/UjYOqbk/PxMbRh+QAgxwqyL7uD6zr7vCs7
 ZQdMBrtjy6faewlXaCVgmQM2oevmnU5pusaEbo2o=
Date: Sat, 30 Mar 2019 08:26:06 +0800
From: Guo Ren <guoren@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] riscv: fix syscall_get_arguments() and
 syscall_set_arguments()
Message-ID: <20190330002606.GA14268@guoren-Inspiron-7460>
References: <20190329171221.GA32456@altlinux.org>
 <20190329131514.3e4ec93e@gandalf.local.home>
 <20190329181619.GB32651@altlinux.org>
 <20190329163337.7ae78cf9@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190329163337.7ae78cf9@gandalf.local.home>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_172615_486864_604D721E 
X-CRM114-Status: UNSURE (   7.67  )
X-CRM114-Notice: Please train this message.
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
Cc: Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>,
 linux-riscv@lists.infradead.org, "Dmitry V. Levin" <ldv@altlinux.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Thx Dmitry & Steve,

On Fri, Mar 29, 2019 at 04:33:37PM -0400, Steven Rostedt wrote:
> On Fri, 29 Mar 2019 21:16:19 +0300
> "Dmitry V. Levin" <ldv@altlinux.org> wrote:
> 
> > This is fine with me.  If you are adding the fix for riscv,
> > please consider adding the fix for csky, too.
> 
> Yes of course. I mentioned both of these fixes in my reply to Linus.
The BUG is from this commit before upstream:
https://github.com/c-sky/csky-linux/commit/b167422869e6a76b31bda639413efa2ba7e60432#diff-cdc97efef2ab02d6828fa545698f9311

I reference the riscv code without my mind, thx for all.

Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
