Return-Path: <SRS0=eWHs=WI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972B9C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 21:16:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49DEF2070C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 21:16:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r3uBLqKz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49DEF2070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Up3Bh5A+ri55tkBDifua+1uSLKaj/qy9Vq4x6BO+AdQ=; b=r3uBLqKzKNK2V9
	AoxeSW+PbLqk6WDbMk4PAruOIvPPd4LseezeAT1h+Ha2hnxL8Y/h2iPJs0mGYnwTeo7cC7spP9ZyZ
	k/iW+c9PSO0xkD9R8p7dtJfB45H7cOh9jExjHPlWrIF6DRlm6eQYRX27tabhU9Z6tzbMwgMlpQrod
	slxFlva77W4hbAaHPHa6ONfzsF7chB0VpqPfTkonCClcSiHUm/6pKu9WfVDE+M/S9074k9Dar5sJ3
	YUZl1gwSnB9T82CHeq95v4OZIHXUeoAyvZnqnnicULE82mXiPicHorwWojvuO1QLa+05WkGXZG+j9
	Xe0BaM4XXnH30emg+9Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxHgI-0006AC-7d; Mon, 12 Aug 2019 21:16:42 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxHgF-00069K-Vm
 for linux-riscv@lists.infradead.org; Mon, 12 Aug 2019 21:16:41 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B1E6F737;
 Mon, 12 Aug 2019 21:16:35 +0000 (UTC)
Date: Mon, 12 Aug 2019 15:16:34 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Sheriff Esseson <sheriffesseson@gmail.com>
Subject: Re: [PATCH v2] Documentation: virt: Fix broken reference to virt
 tree's index
Message-ID: <20190812151634.49c126a0@lwn.net>
In-Reply-To: <20190809132349.GA15460@localhost>
References: <20190809132349.GA15460@localhost>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_141640_029675_AC33C940 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "open list:BPF \(Safe dynamic programs
 and tools\)" <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "open list:BPF \(Safe dynamic programs
 and tools\)" <netdev@vger.kernel.org>, Palmer Dabbelt <palmer@sifive.com>,
 Alexei Starovoitov <ast@kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Yonghong Song <yhs@fb.com>,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Martin KaFai Lau <kafai@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 9 Aug 2019 14:23:49 +0100
Sheriff Esseson <sheriffesseson@gmail.com> wrote:

> Fix broken reference to virt/index.rst.
> 
> Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to
> Documentation/virt")
> 
> Signed-off-by: Sheriff Esseson <sheriffesseson@gmail.com>

Note that you should keep the "Fixes:" tag on a single line, and not put a
blank line between it and the other tags.  I've fixed that up and applied
the patch, thanks.

jon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
