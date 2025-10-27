Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A0ACCF9E5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 15:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/30u/8ssdnTOvh477CuDj9N82gZBBCDPiuz0noNtGo=; b=Av39JHy/YIRF9Y
	Y5aJeFT4MAnw4l484ZdMeV/3jw2QuZkzgB066cc9CY/jEOWKeoQRAUbPjnuliQNnsPrlrrMyCjWo+
	aubKqTRA6PTDJlUz4hGUToK/M2Sq5MEPCvcHY/h+4AACMSenXq1QhjahnzqliU2aYcV4cg8Z1Hmwx
	7iVoSd4+N3QVZIV1fATozP+qhBXIfMXjWKoy1se2T9Vb/iyggD0U19lB9P3Xz/tFsMjWsyi/2Hbgh
	oXPGA4U2cIaOJXxSa1S0uY1QNCV/LkypCT7YzM03RQ4FfsWum6LeLwbzCTkaTbwwJdrRzbQVtT5OK
	43jN4ekWJ+Z8CQAGTViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOuz-0000000ECUA-16Qk;
	Mon, 27 Oct 2025 15:13:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOuy-0000000ECTi-1WDV
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 15:13:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4FDA602BC;
	Mon, 27 Oct 2025 15:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6ABC4CEF1;
	Mon, 27 Oct 2025 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761578035;
	bh=W2Fm/JXD3DZoOXC3XAzhtcZToQPBAK1HXhOkauQfS8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjHqcYc/bPckDKMAfWyb04uL6xHe4Sfz7haCynNGyDUcz3ouzLeBxJzZb/HA0Q0S4
	 SDfbr+exnE4dssaEmxfq51u1izA5kQd0331hzYLOaWtMsrSqU55Mo2ENaScUFqRr6/
	 D9vPKEluFb32VANqEU/Yp9I0PF5S5XhhkQeW2KlqzXTaGNa2XxyW7LkS5t6jqKNUZb
	 ApCpg0waTEa8vzr5ILz7EnK5R9kGIzqL/L7iCHoNRRFEzGxppbOSxwxl62DxWYP4O+
	 7BzIDSnHw0z/p5/XqJ8j6ND4hsURGHnwpb0cttb/GtYiVBqLMQqNoDKQxfFDrlc1uY
	 CCL4BPcbUhfdA==
Date: Mon, 27 Oct 2025 10:13:52 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Longbin Li <looong.bin@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20251027151352.GA765054-robh@kernel.org>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
 <20251024-hangout-designing-33e96c0d35fc@spud>
 <oymxspgopaqja63nipufgzn6kpobkdopemfaw3azhom3ikvk5f@e7cg4lq64j2o>
 <20251025-shakable-jujitsu-3a5e9c8895a5@spud>
 <ugmphokne6ssc7ou7apvbldxg7xxk24wp5jrzdasjiplnu6gfy@ebbuxnjqlsw4>
 <20251026-registrar-impart-0f714e11e410@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251026-registrar-impart-0f714e11e410@spud>
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

On Sun, Oct 26, 2025 at 09:44:12PM +0000, Conor Dooley wrote:
> Rob, Longbin,
> 
> On Sun, Oct 26, 2025 at 05:47:32PM +0800, Longbin Li wrote:
> > On Sat, Oct 25, 2025 at 01:44:00PM +0100, Conor Dooley wrote:
> > > On Sat, Oct 25, 2025 at 10:27:13AM +0800, Longbin Li wrote:
> > > > On Fri, Oct 24, 2025 at 05:46:03PM +0100, Conor Dooley wrote:
> > > > 
> > > > > > ...
> > > > > > +
> > > > > > +properties:
> > > > > > +  compatible:
> > > > > > +    oneOf:
> > > > > > +      - items:
> > > > > > +          - const: sophgo,cv1800b-top-syscon
> > > > > > +          - const: syscon
> > > > > > +          - const: simple-mfd
> > > > > > +
> > > > > > +  reg:
> > > > > > +    maxItems: 1
> > > > > > +
> > > > > > +  "#address-cells":
> > > > > > +    const: 1
> > > > > > +
> > > > > > +  "#size-cells":
> > > > > > +    const: 1
> > > > > > +
> > > > > > +  ranges: true
> > > > > 
> > > > > Do you actually use ranges?
> > > > > 
> > 
> > Actually, I do not use it.
> > I added it following Rob's suggestion in
> > https://lore.kernel.org/all/20251015134144.GA3265377-robh@kernel.org/.
> > Should I drop it or not?
> 
> I don't know why he suggested it, if it is not being used. Rob?

Child nodes are memory-mapped, right? MMIO should have 'ranges' all the 
way down. Doesn't matter if Linux (currently) uses it or not.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
