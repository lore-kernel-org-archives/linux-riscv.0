Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B012DC3DA70
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jul 2024 00:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRgqRyX2LO7MLcMLeoZI7RP/LFkrOH0h/2yUlgWxErs=; b=o0oYjicSqcX5kTbJErwgKYrScH
	eQYJfkbak1JK7iJPzEw2f4pAhV0VYUPym/6k4c1aOyFlEl8TGGp5f60h2RIMfOUx04VocFiErZ0Q+
	AAKWL5qaa2Y5oOszb85DPOUnvG9lZLYa7+op/dEU1zh7ih5QCCv2BxYW4fCfxy9oNR3u6RY2raf2d
	Ea+OlZRnDyE7/HFPKOeaD33VGDHj8wENFlIOlgZe8XYq0REGsS+k8gkP5AOnjJcZxS5eB4vg7DFWt
	6JJg0/xbwoh52hS92Kjd/eUeDU5w8ycOmnaOunkLPSLoASlDq7KQRKKWBOgdLqZLfdW44wAIDG61V
	476l7Kdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW3CL-0000000AwJp-1l3g;
	Tue, 23 Jul 2024 00:16:09 +0000
Received: from giraffe.ash.relay.mailchannels.net ([23.83.222.69])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sW3Bw-0000000AwCu-1Pxu;
	Tue, 23 Jul 2024 00:15:46 +0000
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1E086805A36;
	Tue, 23 Jul 2024 00:15:39 +0000 (UTC)
Received: from pdx1-sub0-mail-a214.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4A384806031;
	Tue, 23 Jul 2024 00:15:38 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1721693738; a=rsa-sha256;
	cv=none;
	b=NT/VuLPGSsXIS+33VS9VsqvYIMvRYDDuKR7jGAo1uczzflAGxyy0dq8IzLuBXAUoCF/A5o
	r0dUQSRQwV0cGgh5kT4NsYiRkj7qRJ3SUqjV+hVTET1wLEVqagAZ6BMufpiCU60vxhTIHG
	UiwgbCQaussisE3yLEVZeHmpAtoBjdg07DpL8KGqH+amyJLjzn4SNXrWInTsHOVKK6O13a
	qxlp8722ii2v/+YIvG9YRD1PYeR6ohGVzZyRhEjiUMQMePf7apiR9KsZSQf3oxZ8HamAIl
	yqzyfnZ5cru80vvBbNejM9uPRTG9x53YJP47GMbYztpBrW0c20m4P3OkS6sdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1721693738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=BfrsTF3PjDyketH5sAvV75FgyXiYN8/JjDAq8vHafIY=;
	b=E2ZM2eRjdopLhRqJ0qkfxrHZlZAsVY66TXjoXe6dr3bDm3AABn4cDR12NX7RXY0R1JoBVM
	bCSZqgizyBERW3jZ/jul91PwZ5i20Q78rmORhjyNFw0OwG/VEQHwqYaMRLqg3pGqqDNWVk
	NbiQv6TvMfq1yYQAmrCxYS8G09Tt7xc+74qJ6IArlOoMy/MD6C/lJGZLMEIgSj4PjS2uOy
	1d1WKJzIHp9QF/4p/tI+9TqjK1jYZXXeDWqukjxduieiW7xDncLGKeQtO1tfLCd93aveOD
	Cfg0m8teciQcZOjYG5n7Uhlgs1/fgszgOFydcfaGWi4oJJNm4ZsEh89c7a9j4g==
ARC-Authentication-Results: i=1;
	rspamd-587dc898b6-9fwgf;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Fearful-Macabre: 125d6dc84c6e5729_1721693738922_585174325
X-MC-Loop-Signature: 1721693738922:3890902801
X-MC-Ingress-Time: 1721693738922
Received: from pdx1-sub0-mail-a214.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.241.7 (trex/7.0.2);
	Tue, 23 Jul 2024 00:15:38 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a214.dreamhost.com (Postfix) with ESMTPSA id 4WSd2v6Krhz2K;
	Mon, 22 Jul 2024 17:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1721693738;
	bh=BfrsTF3PjDyketH5sAvV75FgyXiYN8/JjDAq8vHafIY=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=FU5sqAqlnBAYPEJ1amDjGSFoog2KTuxMpl2bRre6zYepul8zS777HtjxiV/Ti470X
	 7tTal7LNWT5qzdwm/Kgi3LJXNinfroiFwVnE6WJGEz2W/hH5jx9Nn61DcPRQ7jOeGJ
	 QG2H/imfq2kX6wbJ1Wx+WC82p9fLQZ3CQU7UUqDOyiXQ8yVnFmdTaulAI/+6MeA0Ly
	 TdXIhGuabrciys+H/4aPga+ApM7IEMPP6W7QeZajTtwkoraSNUOE2DuNdBwtLT8juH
	 ND031tUJHkyvIA/KoaxhVv/myZsSqprEhkI80zrbBDsKfaVGCL4giJ+3VB8gTxKhgo
	 bf18mBD7JAeog==
Date: Mon, 22 Jul 2024 17:15:32 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 04/17] arch, mm: move definition of node_data to generic
 code
Message-ID: <vwofm2kcltxn4ysrf4lefe2zdqvo2upxdyntatmnh3sywcnjlq@4c6wlllurfn5>
Mail-Followup-To: Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240716111346.3676969-5-rppt@kernel.org>
User-Agent: NeoMutt/20240425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_171544_602545_F3A70060 
X-CRM114-Status: UNSURE (   7.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 16 Jul 2024, Mike Rapoport wrote:\n
>From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
>Every architecture that supports NUMA defines node_data in the same way:
>
>	struct pglist_data *node_data[MAX_NUMNODES];
>
>No reason to keep multiple copies of this definition and its forward
>declarations, especially when such forward declaration is the only thing
>in include/asm/mmzone.h for many architectures.
>
>Add definition and declaration of node_data to generic code and drop
>architecture-specific versions.
>
>Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Nice cleanup.

Acked-by: Davidlohr Bueso <dave@stgolabs.net>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
