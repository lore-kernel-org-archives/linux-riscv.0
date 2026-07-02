Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D87C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 06:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:To:From:Date:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UxL8M+popV/R+yJupVohtROdMyA3G8CorwYFNn+R63U=; b=t7kpzUPRTQDhOj3zilRyqP7l4f
	5mqPj3caHa9p91Bv/AqjaO9b6AIpB08B3q+nClY+lhMSKLm2m/GzXJNrgZ9Xa3If14EkTj0sWkuWe
	Jf//pG3m2sIBjPf11Mqv7EpBWLakwltD++Jx1QHpByt/pLrXCSB6ukzsOhcY2RQVyUhGT4ZrvOcCk
	HaKPtV6Lys/tAu4eLRRGpFQz00V9F4XdEK3YWW9e/Mvaw/b0GoYXotaPWdWYR27E3WPcTYDLfoZJP
	8XPxpPuochlyBavgbazLMwIVL/iFsyAWFxiSWovlSMR2qRPTasrsA2p5wCX2hDtTRl5FLuCHMiBnb
	24TMCXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAnO-00000003dfJ-12i6;
	Thu, 02 Jul 2026 06:21:10 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAnL-00000003df0-1xQj
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 06:21:08 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id EFC121380BEE;
	Thu,  2 Jul 2026 02:21:05 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 02:21:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782973265;
	 x=1782980465; bh=b3PWSBg4KChgsJan4tuQCL8jbVLFvYUrGfeJer055uM=; b=
	pHG6L5mHwpZ3+t5ToOn88ZFsBk/C4OTZhsX4TG3c/Jn22zYlndw3yAb5k+Xi0afh
	pmgxFuvKvn2WzbHsGmYr8xpNhshaVrqt8RX/YVKMcsNY7+HhVHcAUKmJCtg0C8iJ
	pq6uQxeZKcxSHthNbdF2GgtA/DtusqRQMjNsF9VDT+ehZsXFv3K0UH/81+Z17GAW
	qmsyyAhPIYBsJFRGSDOmS8s0QjXy57JKLTBlLoy2divLD816rwL5dRpZuum7DQ+T
	2jG0Vi428hRsMde6LRDHrXKy+ohPp1d/bjF9p1bA3Q6PxLStspEz6TERmv7GyLpB
	TjjgXYDVBay3ayP5X4Sp+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1782973265; x=1782980465; bh=b
	3PWSBg4KChgsJan4tuQCL8jbVLFvYUrGfeJer055uM=; b=nL/rU/Yw5uhaXwXhi
	Pd3VAx3B2hx7wViUybdKoAQE+tVB17JWqmgJ85oRMoaLYHDoDWVbGQqP7/jPlIPU
	hzbo9kt/XdamhIBRpkOv4/lunP1reK+zNkZgOQjxx115BlKGKezHMD05psIryBAj
	5LRCN7P9/fAgRQO8SWm/ccU53eWMTgwM9u2dEhWtqDmP0bBoyNtcEzjQh3+7oJ1B
	ZjGO8+Gmq9TqtIRRgJOO3n9v6MLzQ8TSKTFNIABkPUFjxvQtCrMk6GYaK/w6YIf9
	vvIaPZTtgA5tQsOEZsbx6RUGGOSIIQXvDiI07XWpmunN5bmAAH1o1FX6lIjes+k4
	FJCQg==
X-ME-Sender: <xms:TgNGak7Ze3et09HaNnBg_7EeQDX1WpWebr4V831dQRQ0tvGSRYeivA>
    <xme:TgNGagtubviHB1QN1yH-MEOhjFwJ8OckeYJXHlsGjoKr7RueVhicU1OBsXy2_s9kp
    RsZM6FGHSlUvd4aJTwHseRgONcCnDljF7qFg43tXxjmj3ZPxkWMv4q4>
X-ME-Proxy-Cause: dmFkZTFLXnvGPrjS72UE2Cqoo5k3ZB5gW2fmq0+H7vA6q9/xqCZId+5ccMWvDzoGXPw/0n
    bjmGiO0C5Lo3nj4814huzfyegsEBWSnqZoUE37P6yUUBXeBynDaNZOtEBZabAT6pGBLEgU
    TEXwWHPQDy4swa2ntT+PIpDMucMVt6OvaMl5lrlzMeK7PZwOzrwQDo9+/Gzz/Ie0GPu+Tm
    kbTjJ/ulLLG9DyncXMFNYmwJcjO6WDGqMUTanigqlUey17X5CJkl0f5gb2UEykQU+/4Cjo
    mfffcyLiE7gORaIWIJTK/7sCi1c8oo/WWzgxdhxPbFkX7CHDV/F+fGNobcmZI3WILujIku
    kiedAWW3wRu29mXJiSRShIxXoXZ5aZqgbsuWLiW6ge3WV8Hb+V3JwhBVZWtnluFGL+P1Ns
    4Z5fVXr51VV6UZILO2z+SSwiFlEu7tZlvb5FQn7yigxfSJGrT4rMcV3J/B+VlYDYX5gEDU
    V6u8xf8P2wj9O9ZpESK00kmIyUHTVbXQlq6l7G4dzuHWpBQG8cvL7+wxEaBV6d8AzjoyNB
    5/rkY8Z2KYSOkqZoV39s+5tQtJs9f64Or/qTG1GQcjMVv0vUkB43dqvpcEeDCp2r5ZAyW1
    Anmp3iBPSl4IC2zBhhx5W5jKsXeXS7eXQveoueb2CZRFXBR0D+w/2xtPZQlg
X-ME-Proxy: <xmx:TgNGaqCgZyrr9Xnr787Z91vrIHBNiHjg43elOA4_XUWAhfKmGuwMdw>
    <xmx:TgNGagSOcRYgdkPiRpDyOyP4_XAjmTow4SSXpP2BodR0JaFbxyJeqQ>
    <xmx:TgNGamKPz_fqI_hnI52rvFsBrZFhzD9m9HQVojzO4Mmyabb9IIP9fg>
    <xmx:TgNGap5OGCVE8hEKbrsOGNvpaduUNlxToEz72V_Qp4afO3lJIy6hRg>
    <xmx:UQNGalg_WH4O8rD15jW7viiZk_F5cGP2IcPo9TPcvYnUn-YFbaXQEXfz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C0D98182007E; Thu,  2 Jul 2026 02:21:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AGRLTTzEx-Mw
Date: Thu, 02 Jul 2026 08:20:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yunhui Cui" <cuiyunhui@bytedance.com>, "Paul Walmsley" <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Dennis Zhou" <dennis@kernel.org>, "Tejun Heo" <tj@kernel.org>,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>,
 "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Jiri Olsa" <jolsa@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, pulehui@huawei.com,
 puranjay@kernel.org, "Thomas Huth" <thuth@redhat.com>,
 "Andrew Jones" <ajones@ventanamicro.com>,
 "Ben Dooks" <ben.dooks@codethink.co.uk>,
 =?UTF-8?Q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>,
 "Samuel Holland" <samuel.holland@sifive.com>,
 "Zong Li" <zong.li@sifive.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Deepak Gupta" <debug@rivosinc.com>,
 seanwascoding@gmail.com, "Andy Chiu" <andybnac@gmail.com>,
 menglong8.dong@gmail.com, cyrilbur@tenstorrent.com,
 "Vivian Wang" <wangruikang@iscas.ac.cn>,
 "Atish Patra" <atishp@rivosinc.com>,
 "Anup Patel" <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, qingfang.deng@siflower.com.cn,
 Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev
Message-Id: <c190a4ea-8c87-4b4a-9146-20e06d0250b0@app.fastmail.com>
In-Reply-To: <20260702025443.83389-2-cuiyunhui@bytedance.com>
References: <20260702025443.83389-1-cuiyunhui@bytedance.com>
 <20260702025443.83389-2-cuiyunhui@bytedance.com>
Subject: Re: [PATCH v7 1/3] riscv: io: avoid null-pointer arithmetic in PIO helpers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_232107_577863_61FFCD6E 
X-CRM114-Status: UNSURE (   6.15  )
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

On Thu, Jul 2, 2026, at 04:54, Yunhui Cui wrote:
> When port I/O is not supported, exposing the port-string helpers is both
> unnecessary and can make clang diagnose null-pointer arithmetic from the
> PCI_IOBASE based address expression.  Keep the MMIO string helpers
> available as before, but only provide the port I/O variants when
> CONFIG_HAS_IOPORT is enabled.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
