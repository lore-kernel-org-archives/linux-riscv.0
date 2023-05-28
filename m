Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C0AC77B7E
	for <linux-riscv@archiver.kernel.org>; Sun, 28 May 2023 07:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oARTPIlhw7WQpLUCd4l3XRq6DfmoN/ZGwVa2DQPDTSQ=; b=fONxd5JxbfeWDu
	gJ87RSgGXkqXvk7H7ySck1j7Mf6nEm/D5GqQ0d2zZNcPHqrR/ewrqnA7O/Rk/2vg2CR59I0xEyK7M
	pxakdcUt2alhBLaHP3YxanzTVm3+s7dKRzjJmQMzXHOgohMY33BFIMjF5FjabmPhwjtpzleRNxi4G
	0T2I66oxSFUYxndcHAuLPlXQ/HAuiDVp3kTH4H407KeBr974LEys1G9vQV1Xp3Mxu0x587bXnbvGr
	uAF9g+VRsYwshapiXhwb3TAI/n2IrHOAa9tejhAqXIBuZ+Z5rxH9TbDk1o7HGrMFRyz4/weEB8SUK
	WRWwpgqSkW3bXg6auz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3BDD-0078g0-37;
	Sun, 28 May 2023 07:53:11 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3BD7-0078dI-0t
	for linux-riscv@lists.infradead.org;
	Sun, 28 May 2023 07:53:08 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34S7qZL7001986;
	Sun, 28 May 2023 09:52:35 +0200
Date: Sun, 28 May 2023 09:52:35 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 06/13] selftests/nolibc: allow specify a bios for qemu
Message-ID: <20230528075235.GD1956@1wt.eu>
References: <cover.1684949267.git.falcon@tinylab.org>
 <63bee74a7b3754a1b0e82bc57de52c18d2de003d.1684949268.git.falcon@tinylab.org>
 <2ab94136-d341-4a26-964e-6d6c32e66c9b@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ab94136-d341-4a26-964e-6d6c32e66c9b@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_005306_277933_845E7359 
X-CRM114-Status: UNSURE (   9.82  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, May 26, 2023 at 09:00:02AM +0200, Thomas Wei=DFschuh wrote:
> On 2023-05-25 01:52:29+0800, Zhangjin Wu wrote:
> > riscv qemu has a builtin bios (opensbi), but it may not match the latest
> > kernel and some old versions may hang during boot, let's allow user pass
> > a newer version to qemu via the -bios option.
> =

> Nitpick:
> =

> This seems very specific and hopefully only necessary temporarily.
> =

> Instead it could be changed to some generic mechanim like
> "QEMU_ARGS_EXTRA"?

FWIW I, too, think that QEMU_ARGS_EXTRA could be very convenient for
various test cases on any architecture (change number of CPUs, RAM
size, boot options etc).

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
