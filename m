Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085A5C636D3
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 17:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ycOAK8f50vjYQvqaf6wRMp1EuLIMwtFwHmdiiKKuTZA=; b=PpiS0zH5O6alY/
	yKGPY7gQt96dEWEeiYXQ08AyztT9CJ2Sfuf+M+08M3qFEfln5wNTA/eon+ezMflV9SEeq6yXuDiok
	WGE49x5yppdxWmLznrQvhP7/RIXFBLA1Aag6zrfcVNICtS5chhYN5xNceRpkFf/xCahbGdpKNpTRr
	vLyJkJwZScK+oTQ8mP7ifFitBxak6vpCN5PhmeJ09RdtxV3H6szm5kCbB3orEcuh4jknCJaPERN9V
	TG0pHSbJDIDNadFbM5m5cI2iDCds0QrGL4uZhqodmNhNTKpJQGzgo1FjWfCFCyeHEG3dqm2jwNKkK
	6YvzNiTPrpbp8am1GPNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP4uB-009OoW-1b; Mon, 06 Feb 2023 17:03:47 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP4u7-009OmU-8c
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 17:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1675703017; bh=oduEQSmX5w2TdFT5GxpWGp4vTr2PGe2Au2vMj0xJ5So=;
	h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
	b=P0jOEWRl0CXpc9SmfcYFQJiTerzPpeVShGflI1Lb6t9VN8cY1cFAe5KN0NA/VM5/B
	 NIVV8IjyjMaUs4bkSzt6Q8RdfmEBKIsmX9CuvKBOXpTVG1ViBgqbRBCH2SsDXhJVUF
	 pB9pw6nJIuyEjUvONT8BIUwGqfKTHPpYvwPj8pdqy4jNfb1tzf2WJ+8oHQ73Jh5rnC
	 6y2lTO8Q50BzK278UQQ7tUfimxXz62r/lMLBbC+k+MUAEeWUSLY/8Nv3u32zrzU5ZT
	 BYTMd4BGE5b0ldxT7DJACqf3T3ttNUQJPYcrdL0pJlLeuWFHQmsI+z0IStbJTR0kXi
	 1nvSs+t6h11ig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.187.227]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ykW-1pV7Dk22L8-006Au1; Mon, 06
 Feb 2023 17:58:06 +0100
Message-ID: <84b1c2e4-c096-ed19-9701-472b54a4890c@gmx.de>
Date: Mon, 6 Feb 2023 17:58:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org
Cc: linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9l0w4M91DwYLO3N@ZenIV>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 08/10] parisc: fix livelock in uaccess
In-Reply-To: <Y9l0w4M91DwYLO3N@ZenIV>
X-Provags-ID: V03:K1:VFAdDPOyDsZ+gDOfjL++mZzEtC+e2v/KCjg8uQsf0yjF1YAzaMS
 oXW29IrTBTtPzkOTcXxudlWjrhGfO1ez3hBLeyfLw2/Z0WaXrXMv7w5zk4brciWkWNAVj/v
 2eu8fda/vTBeLfXmUNcSX1hbCAIv8EKxS//63b0kTRVmu0h5ndbdvcdcQ/q/cL7nrZwQpu6
 Stb8GCjAJJ4AQa7UKcYFw==
UI-OutboundReport: notjunk:1;M01:P0:pNu+OePvHJ8=;UPjd7JTPMm1JBN1+hrQQLCqZtk4
 zhIWT/ZfpLteWMo7KFcRoBMWDakF8GuMs8kNMw+NN/OAgmWpyO42IMHPBb58sc8oiliJJ+pU1
 ph2xp0weMpWq/WD/2joYAhFq9cD8nbWXTp/SfjfpkM0n/pJh+UMqWWfkE74kBhQH8E/A1vRnE
 HmOJ3FSeyNpiLQremOkZlQWj4f4SEorEPrPbwrq8abra1Iqs/YlHedQX1QDHpjH+zde1Bgbmj
 Oo/W5Jw/J9aq7r6/qmPEInLrSxbKUvm901bI628jKrZt1c1VQ/xRpu7Qh8EiPO1ia5rZmvi0B
 53dpXaAn2ZkxFlGoL876DlG70wwQpeXY5R8Af0FzlvPCINMcTZrrr5eSrRKweto4sppi1LN+E
 GsJHcDG63p4c5KGSVe46eXam56YHVxiBtJ2ezfBKER1ilj7FcJxQfezXS1zxb5QyaFY0rwhFX
 QyS+IwOhlXFRnwXuubxBjBP/i9+we8MTbvbj5/LKAllUueo+0LFVAduH8nQf/xD8isBHoNasD
 HCzUupqPxm4FRzS1vn1J3fJRCkxISWKGKJZPRKfVho00lKKKji2i5kr4mCZxYSVXN4ifBhuLb
 Fd5FJm5kKg9hP0dAM8+ACGI0zOoD8wgqhE22YShQP8mlGNSWXpvsAchj4yJFai4qwAYRfjhwi
 mmbwUZOaywKdLyQK5TIy05rx+5pMhyhkAc15Sr3CmE50vt2hZ0elFWuNBSGxnzBwo5q7y6SyI
 e6My2FDulZZkByQUA/Mp1BAleNfwh8wCHgy3mp6z8TSbfDWcwcZaEeebyJY2Eh6cd8EMeohf/
 iIOtwoySfjyrnITLnqYuxp+IKbeVO2fgO+0upzWvBCKEAdqJ6jI4va187p7er3LOUpBo1Tb94
 tmELsaFtOYlOdi+CyRgsOX5ULbgR0m1BgeSPBr+8L8dtzUDAr59dtqwRMOIvINXg1Sq1s9dbY
 +8ufLQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_090343_623506_589518DF 
X-CRM114-Status: GOOD (  17.20  )
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

Hi Al,

On 1/31/23 21:06, Al Viro wrote:
> parisc equivalent of 26178ec11ef3 "x86: mm: consolidate VM_FAULT_RETRY handling"
> If e.g. get_user() triggers a page fault and a fatal signal is caught, we might
> end up with handle_mm_fault() returning VM_FAULT_RETRY and not doing anything
> to page tables.  In such case we must *not* return to the faulting insn -
> that would repeat the entire thing without making any progress; what we need
> instead is to treat that as failed (user) memory access.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>   arch/parisc/mm/fault.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/parisc/mm/fault.c b/arch/parisc/mm/fault.c
> index 869204e97ec9..bb30ff6a3e19 100644
> --- a/arch/parisc/mm/fault.c
> +++ b/arch/parisc/mm/fault.c
> @@ -308,8 +308,11 @@ void do_page_fault(struct pt_regs *regs, unsigned long code,
>
>   	fault = handle_mm_fault(vma, address, flags, regs);
>
> -	if (fault_signal_pending(fault, regs))
> +	if (fault_signal_pending(fault, regs)) {
> +		if (!user_mode(regs))
> +			goto no_context;
>   		return;
> +	}

The testcase in
   https://lore.kernel.org/lkml/20170822102527.GA14671@leverpostej/
   https://lore.kernel.org/linux-arch/20210121123140.GD48431@C02TD0UTHF1T.local/
does hang with and without above patch on parisc.
It does not consume CPU in that state and can be killed with ^C.

Any idea?

Helge

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
