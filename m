Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3CBC87FCB
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Aug 2025 08:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBbdTLms/YMxgGuYttt9TrxiOs79rSr5lHuck6ajqFo=; b=PokTRGOujqzmFh
	zDpQccI10vYuCX4hHgMQ37xoJOVJ84rWtJoZHibQBEZml9t28uAyZRIoos+TYTGyXsgdZ2yFgHXa6
	OxJ8OW7nK2/NIHSiUFNQ+Jy8dyCRoDXtGsRD9yC2cKg47E0fi4Ntv8249Pm7L+N3M1OklkyRK5a3T
	AxaFnB2JBbgljh7S0n26OzPR4xcJfGGRbxKAh6SYLs96Yhb3vh32+L2oGud9GHhERFM2FvUVZNnny
	Z9R+Wy93EARQp/+vQV6tbUHCsso/vKeZq7WjrclAcAK9Ydp8bQCSS183IGQltFHoGZaCB/jiJZzl6
	cjm8I2FoaiKRSE2d1OZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhlP3-00000005HPx-0b3U;
	Fri, 01 Aug 2025 08:46:13 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhl8x-00000005FdL-3CHX
	for linux-riscv@lists.infradead.org;
	Fri, 01 Aug 2025 08:29:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0913A438CF;
	Fri,  1 Aug 2025 08:29:28 +0000 (UTC)
Message-ID: <918d999b-ecef-487a-a486-40b1d94beb15@ghiti.fr>
Date: Fri, 1 Aug 2025 10:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] riscv: mmap(): use unsigned offset type in
 riscv_sys_mmap
To: liu.xuemei1@zte.com.cn, paul.walmsley@sifive.com
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250801104948133AaMr5S6E382PbNNhoJgHA@zte.com.cn>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250801104948133AaMr5S6E382PbNNhoJgHA@zte.com.cn>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepteeiieetgffhuedvvdejieduheehieffffegveeitdelheegfffgtdevkeethedunecuffhomhgrihhnpehinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemvggumegujedutgemfedufedvmeefkegrudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemvggumegujedutgemfedufedvmeefkegruddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemvggumegujedutgemfedufedvmeefkegrudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepiedprhgtphhtthhopehlihhurdiguhgvmhgvihduseiithgvrdgtohhmrdgtnhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdpr
 hgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_012935_938821_F185C543 
X-CRM114-Status: GOOD (  17.55  )
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

Hi Jessica,

On 8/1/25 04:49, liu.xuemei1@zte.com.cn wrote:
> From: Jessica Liu <liu.xuemei1@zte.com.cn>
>
> The variable type of offset should be consistent with the relevant
> interfaces of mmap which described in commit 295f10061af0 ("syscalls:
> mmap(): use unsigned offset type consistently). Otherwise, a user input
> with the top bit set would result in a negative page offset rather than a
> large one.
>
> Signed-off-by: Jessica Liu <liu.xuemei1@zte.com.cn>
> ---
> arch/riscv/kernel/sys_riscv.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index d77afe05578f..795b2e815ac9 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -10,7 +10,7 @@
>
> static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>   			unsigned long prot, unsigned long flags,
> -			   unsigned long fd, off_t offset,
> +			   unsigned long fd, unsigned long offset,
>   			unsigned long page_shift_offset)
> {
>   	if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
> --
> 2.25.1
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


I had already merged this one for 6.17 but I did not say it so you could 
not know, sorry about that, I'll do better next release.

Thanks for your patches,

Alex



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
