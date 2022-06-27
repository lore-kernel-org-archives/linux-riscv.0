Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5435DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oOL8PaWcGVtQ9oJ7hQ82RTB/TAUiQYbcNptAR4XjQNU=; b=BS6/2Xp7SCb3K2wfkH2gtxuWNU
	QMgD4kQ8fpWNGC64wyqhO/R5WzgOdfQPy5N7oTXv9SDmNVALkD6yK3r9LjyDiI1BR/SAjuJ05qzL4
	6LD61yVd6pWDnFi5pJKCMsg8iDWItCi0e8TR7r2O7LDodyfuz4JhIn6grxtoPeD70kdeyN76FMFdL
	V3NxBHSvC+0PhhCyC9G4uUnOk8i8gCCFxtMmKhoowmirZf3fjExLpUNiMRetF7T4C24V9lGPv5rpG
	6SObUL0OL29XQPjgeRn2kAfvTVYCE3PfNEDqj9PBDY5tcyT4Tgh0x/eipgfEfUS85ewD5A4LAROjA
	N2gVlAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oyo-001C1l-VJ; Mon, 27 Jun 2022 13:40:42 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oym-001C04-72
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 13:40:42 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B7F9E5C00A0;
	Mon, 27 Jun 2022 09:40:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 27 Jun 2022 09:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1656337233; x=
	1656423633; bh=VmH1ItcgdR9yLmtHIQblCwoWnqaK8QpzOYYSIYStQo8=; b=W
	6ZgPzFSOSstzSlPkL96ySA528auJvAslWW8vDg5qezyJvV1+N9u6zuEuvAM+oaz+
	ff2uSB//o7HZ1x7GS89mc6rF6Lkt6CpWLeykpnkB5Gg+MRmML1s6ug7ngz0huLCp
	+15HPU6L/ZO5Lm4csRgW1UCzn6Wq7OyZFvDH/bHsmmH/GBuPIFn1Jdbc9Tz3dYsf
	ilWgpvZimbSueJQ0wkpFMGwlBYdxuUkN6E/KB9KOWLtNSQT4DYRvdTzDHYsGzdA+
	v5NJRLgwl9cPGCjryDawOjET0KV3KlA5J532XRMZpt8tB40wLY/XsOYxdkf6USe9
	Emo6VoOLgbZj1874ASqfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656337233; x=
	1656423633; bh=VmH1ItcgdR9yLmtHIQblCwoWnqaK8QpzOYYSIYStQo8=; b=J
	l4m2ts68BiSTJYOGXO4PS2bCXxr52bv3awRlpRjZkVMApRevrN1swf91dK5VSzbi
	vlDgC0174yQYu43xulPkY+aNZQ6yxecj/iRNlDm890XFGqRt87oTeOgFBMLrEdu8
	N0iglfp90QEV5tuBoGtbZV5QEJjySJLN4Ukd7SHWXtI85+YVsnlA5sptVyFcmsHo
	qD2JQdBScvSqrLlINFzjSqivKRYMytay9NLIozOzhmWvfB/NZ9LRLDCErDT7VrQv
	wOp7ar1nUioXyXUzLJo8N5ZuPNx3yE4Q8BaUnijzTMTJhR56vPlSSDINd6ZK3pHr
	o1yJ7E35bBgs0W8xhXdpQ==
X-ME-Sender: <xms:ULO5YqQdhAP1iaqPyXjKmIfe46gbojhZoh7V4WqFnAoTAZMsMcnwVg>
    <xme:ULO5YvwSCAXTiPZ0KOt0vTIwi1H2VF0NlI_zfOEoRSool3pmVgvyjL1q2XE5Wr7Ap
    kjEkUry38moW9tWiw>
X-ME-Received: <xmr:ULO5Yn3VLmXUeIRtIPSjjHtpzyDPH4S1Avt4qY0nA9yA1jTM37eLEA-n80lthjT_jK91vEsdPtS_QlqvmT8R6vMv8U-boIjBwhuyAbdSFYHwSr4dvPreA68Chw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvvehfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpefftdevkedvgeekueeutefgteffieelvedukeeuhfehledvhfei
    tdehudfhudehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ULO5YmCg3qKg3H2zkHxC8ggOnMAeXIu8t_lLi-c-SDYgpuvetJEgDw>
    <xmx:ULO5YjhNpLHQNaLdXvKbXTN9bKfBNphIqrkKUcWqVGCgU60n4KhOkg>
    <xmx:ULO5YirN24BuX9prBn5c0WfcVXsLwrOc2hXNdAzMG_oiY6o7XXBD9g>
    <xmx:UbO5Yjyvm8HKhtO7p0wx_qWAmKqei6H_ClCvwYMPvfxjirzctg0fvA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jun 2022 09:40:31 -0400 (EDT)
Subject: Re: [PATCH v1 2/3] irqchip/sifive-plic: Name the chip more
 generically
To: Marc Zyngier <maz@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Prabhakar <prabhakar.csengg@gmail.com>, Sagar Kadam
 <sagar.kadam@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-renesas-soc@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Gleixner <tglx@linutronix.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220627051257.38543-1-samuel@sholland.org>
 <20220627051257.38543-3-samuel@sholland.org>
 <20511a05f39408c8ffbcc98923c4abd2@kernel.org>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <b031cfb7-6a50-cc01-3b8c-5e75d01b4a43@sholland.org>
Date: Mon, 27 Jun 2022 08:40:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20511a05f39408c8ffbcc98923c4abd2@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_064040_830323_C9601C75 
X-CRM114-Status: UNSURE (   9.83  )
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

On 6/27/22 2:11 AM, Marc Zyngier wrote:
> On 2022-06-27 06:12, Samuel Holland wrote:
>> The interface for SiFive's PLIC was adopted and clarified by RISC-V as
>> the standard PLIC interface. Now that several PLIC implementations by
>> different vendors share this same interface, it is somewhat misleading
>> to report "SiFive PLIC" to userspace, when no SiFive hardware may be
>> present. This is especially the case when some implementations are
>> subtly incompatible with the binding and behavior of the SiFive PLIC,
>> yet are similar enough to share a driver.
> 
> Too late. This is ABI, and not changing, exactly because userspace
> sees it.

That makes sense. I will drop this patch.

Regards,
Samuel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
