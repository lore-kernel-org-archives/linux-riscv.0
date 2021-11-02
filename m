Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C59DC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 08:51:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC2EB60E98
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 08:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC2EB60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QnTdJPxPBeJkWnPuz+urq0FZrZme/ubs30FxXdg3NDs=; b=WGa8VvvQECHi3B
	lAFm0mA0kLkUzEUIID/YkUqhsWr2J9q54SzPnhJq+kj080XoC9HqVxz+z4sll87qJZYp0p+FSt6c2
	nLNTzEzba2nDlj8wRbuX3sDZN5g3xv5ITOo+jRZqszsvHV3ezN+I/nVJfly0UXQZtiaLziKNSlSG7
	hkKRHeKRN/gZThTtp+wr3IFM23hrKKFI/WNWSiBjcUmWgQT8E4J/NGly9urZHCuoL++x67TcnRRFq
	1XYUPz1cPxtWlUMOgX60q2jizDCdmHst8wXXd03oHOYOV36KRjHy9cz741Xw6lb5D/E5R3CKBqKfP
	pS6bxxuTf0YeHUca7JNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhpW6-0010DP-Fk; Tue, 02 Nov 2021 08:51:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhpW4-0010Cn-EV
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 08:51:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D586260F70
 for <linux-riscv@lists.infradead.org>; Tue,  2 Nov 2021 08:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635843095;
 bh=YPf6/M2ebb35G16XuM5VQwFjUhWRcpJIy1yYwPnDS7k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fftVrso7Ja5UMZ/cbC8pu8j060xZaMp+R9hjaMQX/jKNo14P80ODhhm5+xz0UFVA/
 7UipisfN12J1h8YB2OOwWUhmwqtipcxsG6nKRQRkq06YlmdQ7ONJz08r7ipTfYfhor
 WG3DLzoZ/J9MPfm7es/RvjCPGXo9JUNyBAtoeCGOC3MP/6IzBmQNs+WyFoVUjIb8du
 Xj/ftxfJ/+4IeS4rPi9F/Ban684Wqg3hUD3tfCn49e+JAw97UhIfi/Kpi9TyqVjr2W
 ofeAGDV6u2wjiZYT4WET+AjIvA4ErmybIBRzB9BnMm29wPJZRjvXjtEWxNAwz0QK8X
 OuIubCCa8omkg==
Received: by mail-vk1-f177.google.com with SMTP id b125so8414420vkb.9
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 01:51:35 -0700 (PDT)
X-Gm-Message-State: AOAM530SqvKI9kBzPauAJmx35uGbHcMIRuwgelenWF49XNiQ+G9J8TSQ
 4gGz+pS9jwEW1JqM1Elpp5qlkjAGCAeA4S+TL70=
X-Google-Smtp-Source: ABdhPJwrbsKCWw5C3jjAJ84DekQMMCaOINyBIVGKEkLsFaB1DnX4bVGP0b6bJeIeLpHfeJtl0x0CE5eVBWVKtgr6KEs=
X-Received: by 2002:a05:6122:1682:: with SMTP id
 2mr36158634vkl.22.1635843094957; 
 Tue, 02 Nov 2021 01:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211025040607.92786-1-wefu@redhat.com>
 <mhng-ac32ff92-86cb-4377-ba63-de1856e84fb1@palmerdabbelt-glaptop>
 <CAJF2gTT90V6gQw12XZEXB1TJXb5QNdXM6qcfXh1yzWzDPExgPQ@mail.gmail.com>
 <20211102055857.GB26925@lst.de>
In-Reply-To: <20211102055857.GB26925@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 2 Nov 2021 16:51:23 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSfp+JZ4YxiynVA4KO0Z4PwJ4_uF8UO3Tx3mDOHPnFTeQ@mail.gmail.com>
Message-ID: <CAJF2gTSfp+JZ4YxiynVA4KO0Z4PwJ4_uF8UO3Tx3mDOHPnFTeQ@mail.gmail.com>
Subject: Re: [RESEND PATCH V3 0/2] riscv: add RISC-V Svpbmt Standard Extension
 supports
To: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Wei Fu <wefu@redhat.com>, 
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, liush <liush@allwinnertech.com>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, Aniket Ponkshe <aniket.ponkshe@canonical.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Gordan Markus <gordan.markus@canonical.com>, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>, 
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, 
 "Xinhaoqu (Freddie)" <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_015136_525254_D878893D 
X-CRM114-Status: UNSURE (   9.22  )
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

Thx Christoph,

On Tue, Nov 2, 2021 at 1:59 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Nov 02, 2021 at 10:07:58AM +0800, Guo Ren wrote:
> >
> > To separate MMU & no-MMU clearly, I suggest fuwei add
> > #if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
>
> Actually - for documentation purposes a new CONFIG_RISCV_SVPBMT that
> depends on 64BIT && MMU would probably much better as it clearly
> documents the intent here.
Okay


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
