Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3B4E80A9D
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 07:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kk69JTxXJljAPP8mqs61Ku1NZNNCYE6c4HUqUS0WSPE=; b=pbK5D2pXNWeKYX
	wf+0QtinZ3paQw1Dr0rY1FobWmZrZLixDArjemDISwkBqtiIUvVSKxcZ/2NwoftyLWjfsSBUoX0Ca
	qM6UuWL4UUrP7wHtE9tDEWGpiii4OnezbhViO0VNM6gghN1oQHSLRwLcI6BhTgn63wd1o1Qyf23LB
	CnbobjHnFCXSQvprUaI3LWAUdSiLeNGLCJF0FxeAt+dRXfticePCRShVukiAD7rstjPyuJ/nqDmBD
	J+xVUW1XcfxwSTH/8XwkO6Ngv0EEHvLInv6LE86aCrQ0q+SFmkRzs4gNdjdAMSK9rvxfNt11dpnLT
	HBrR1ZkVQKTHwIgUETRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOn6-000AN1-1u;
	Wed, 27 Sep 2023 07:17:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOn5-000AMk-0D;
	Wed, 27 Sep 2023 07:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pf7BkGhF9Z47SYL10JArdweUf9nDI7wovj631PwF/S0=; b=o5LpZ6Becuj/eQy6E+S2EvdXlI
	rgTuP7TiqWOIZnt/ZcdHPPX5yQMXXwKz332OCnrwxJHDHmgss3F7kW7+adB8PsCxkfnrJhR1j9CqB
	hkF3pV/ehM7196wi1m6Vvv4vWkbTfDrV8bNfTNfMSL5189o7CmsDpLy6yttJ/0NPn+sbT25qTxIDe
	w2qJR2loxrAbL8ZIV8MpulvdtFomoDCpAhVDwKedNhGCudbm/uigjWhYPHsBJZvfnw3Pz3SsTF6wR
	yq2qH1jiY+2tqdapPCHzL2cU8rgunMPWPN5+/caOMOK5Q4AIqOpuG/Duna6kTuj4YrGR3mI/5gU94
	pbzFKSPw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qlOmt-00CSRZ-Or; Wed, 27 Sep 2023 07:16:47 +0000
Date: Wed, 27 Sep 2023 08:16:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Detect and Enable Svadu Extension Support
Message-ID: <ZRPW3wu6tpKwwunD@casper.infradead.org>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-2-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922085701.3164-2-yongxuan.wang@sifive.com>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Kemeng Shi <shikemeng@huaweicloud.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org, alex@ghiti.fr, David Hildenbrand <david@redhat.com>, tjytimi@163.com, greentime.hu@sifive.com, wchen <waylingii@gmail.com>, Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, linux-kernel@vger.kernel.org, vincent.chen@sifive.com, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 22, 2023 at 08:56:47AM +0000, Yong-Xuan Wang wrote:
> We detect Svadu extension support from DTB and add arch_has_hw_pte_young()
> to enable optimization in MGLRU and __wp_page_copy_user() if Svadu
> extension is available.

If you're going to cc people outside the RiscV space, you should probably
explain what Svadu is.  To me, it sounds like a Great Old One, maybe a
friend of Cthulhu?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
