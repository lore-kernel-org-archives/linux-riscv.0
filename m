Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98028CCD187
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 22:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wisLyXw7nydMuCH5FbVqqrJStitDjD0x/YHT1cEhzQ=; b=TcVXuY5egIsoJx
	xIttRzyDP+5833kuO5ElU/sVUQlyq3wmQoXQmQ13ivifdGF3ru2FHhx4JRiOd+y+GUA5KahqnN8Vx
	uYA9Pfi2orgQ+orfeOILbEmDdftAQAwz7Fc0NEDXoQ2MtMbOGfWvmHvJeQIS+4wCAlH231EfVUhV1
	09URhoO1FtKIEEQhPa5pwlStR4mR2p1Rp5onBrsTmYQKu3hOE9B+5wOTJ9kxhIyBTrdwJt/Nnv322
	9CLGBY0QAMWrK0hGc+aob1UV8BDMa6YLWaFl2tZ1hkI6VbC6f5oifOVl/yRcJMQqdFjsWLc5j6NR/
	ALAls+3KGPt/GkGd04MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Lkp-00000009UIS-0Rho;
	Fri, 10 Oct 2025 22:38:27 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Lkn-00000009UI7-0VmC
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 22:38:26 +0000
Received: from localhost (unknown [116.232.147.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EAABC340DCC;
	Fri, 10 Oct 2025 22:38:21 +0000 (UTC)
Date: Sat, 11 Oct 2025 06:38:16 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] riscv: dts: spacemit: add Ethernet support for
 MusePi Pro
Message-ID: <20251010223816-GYA1444158@gentoo.org>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
 <20251010-k1-musepi-pro-dts-v2-5-6e1b491f6f3e@linux.spacemit.com>
 <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
 <59657BBB86F7B678+aOilnA5Z-QL7xF9O@kernel.org>
 <20251010064310-GYA1439398@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251010064310-GYA1439398@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_153825_183648_961A3BE4 
X-CRM114-Status: GOOD (  12.45  )
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

Hi Troy,

On 14:43 Fri 10 Oct     , Yixun Lan wrote:
> Hi Troy, Vivian:
> 
> On 14:20 Fri 10 Oct     , Troy Mitchell wrote:
> > On Fri, Oct 10, 2025 at 02:13:31PM +0800, Vivian Wang wrote:
> > > 
> [snip]..
> > > 
> > > Maybe Yixun can chime in about this as well.
> > We have talked here [1]
> > 
> > Personally, I think splitting them makes the commit history clearer.
> > I'm happy to merge them if others also think it's more appropriate.
> > 
> I do not have strong preference, either way is fine for me
> If you plan to split the DT into fine patches, then go ahead
please squash the patches, see Conor's suggestion here:
https://lore.kernel.org/all/20251010-confider-raven-0ad7a810e5de@spud/

Also, I'd plan to collect patches once v6.18-rc1 tagged, you can wait
and do it after that..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
