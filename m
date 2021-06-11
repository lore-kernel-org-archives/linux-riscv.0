Return-Path: <SRS0=LC3o=LF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C1AAC48BE0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 16:41:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AF426100A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Jun 2021 16:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AF426100A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZsBB2dA6WZ2/+z9K32fPa1RkN0FwUliagafpOhkU8U=; b=cEUn6C2TU6rfmc
	O67FLtJnlbWow4xLtGm8kEzvP33xgfy39B/vQqQQ+93+sYNmfzQIMysbCxBL10qlQhEPqJ7WnRApr
	ZJY6qdJ43UkZhu/HE2NvweamsaPjQ+oozJzw0mhtTI7riXHcEn4A5Q3gBQTxN/GXMVIWzrHDReLSh
	FVW7HapwwcpQm4YvdokRwFSo2L2vMHE8PYcAqlESdaXjQRE4tcIUusptCQHGo0GE9VBFMQNwLy2Rr
	z/DMwTtuxoEsDZAo2DbBw3a++i5RpnvA27O71/Udr7rEpfDAYXC+cajAdyqlG0ClxNuYh1vxbRiuj
	sx0+36lQehN7tVhkkF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrkDw-0063rp-Jp; Fri, 11 Jun 2021 16:41:36 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrkDp-0063qZ-C6
 for linux-riscv@lists.infradead.org; Fri, 11 Jun 2021 16:41:30 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4G1mnW3mnLz1s3pb;
 Fri, 11 Jun 2021 18:41:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4G1mnV6lD7z1r0wv;
 Fri, 11 Jun 2021 18:41:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id DNOF1t6SXpEc; Fri, 11 Jun 2021 18:41:17 +0200 (CEST)
X-Auth-Info: UjAl/qSEJiAcUzh+KfzDTVzON+wrDx36PXw07BKvqDwzz+F6woY6oRGDBmF8tT9C
Received: from igel.home (ppp-46-244-189-84.dynamic.mnet-online.de
 [46.244.189.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 11 Jun 2021 18:41:17 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id C31282C3655; Fri, 11 Jun 2021 18:41:16 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Andrey Ryabinin
 <ryabinin.a.a@gmail.com>,  Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,  Dmitry Vyukov
 <dvyukov@google.com>,  =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,  Andrii
 Nakryiko <andrii@kernel.org>,  Martin KaFai Lau <kafai@fb.com>,  Song Liu
 <songliubraving@fb.com>,  Yonghong Song <yhs@fb.com>,  John Fastabend
 <john.fastabend@gmail.com>,  KP Singh <kpsingh@kernel.org>,  Luke Nelson
 <luke.r.nels@gmail.com>,  Xi Wang <xi.wang@gmail.com>,
 linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com,  netdev@vger.kernel.org,  bpf@vger.kernel.org
Subject: Re: [PATCH 7/9] riscv: bpf: Avoid breaking W^X
References: <20210330022144.150edc6e@xhacker>
 <20210330022521.2a904a8c@xhacker> <87o8ccqypw.fsf@igel.home>
 <20210612002334.6af72545@xhacker>
X-Yow: I will SHAVE and buy JELL-O and bring my MARRIAGE MANUAL!!
Date: Fri, 11 Jun 2021 18:41:16 +0200
In-Reply-To: <20210612002334.6af72545@xhacker> (Jisheng Zhang's message of
 "Sat, 12 Jun 2021 00:23:34 +0800")
Message-ID: <87bl8cqrpv.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_094129_587948_5261B4B8 
X-CRM114-Status: GOOD (  12.36  )
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

On Jun 12 2021, Jisheng Zhang wrote:

> I reproduced an kernel panic with the defconfig on qemu, but I'm not sure whether
> this is the issue you saw, I will check.
>
>     0.161959] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
> [    0.167028] pinctrl core: initialized pinctrl subsystem
> [    0.190727] Unable to handle kernel paging request at virtual address ffffffff81651bd8
> [    0.191361] Oops [#1]
> [    0.191509] Modules linked in:
> [    0.191814] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc5-default+ #3
> [    0.192179] Hardware name: riscv-virtio,qemu (DT)
> [    0.192492] epc : __memset+0xc4/0xfc
> [    0.192712]  ra : skb_flow_dissector_init+0x22/0x86

Yes, that's the same.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
