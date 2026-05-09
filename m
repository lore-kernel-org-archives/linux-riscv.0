Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4ABCD343F
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZxUJ+l137vWsnpWZkAg1sEdK6rxPUexjmnN1VCmShQ=; b=jM9dxIbN52cTRw
	dR3/+pZ7H+G1oL7lPw76kET78+15Qqla7XM++102Gz2O8fry0FenEDPIwV3ENUf6dspOvv0iHvPib
	2mnc0EcyWnBZqZQgkL75RRgWXq0C9ZF04x2sYxAVOdOmWLstfZCF8HJtRC040wTE/C7GTJRKIs3AP
	n+Fwh/KProChoj0l9T8LVmfUIwMZ0R4XDUopqXUZnRPoWKeusmcKHJo2ZocUzFsSXU6zLw16CgKUJ
	fg9ZK/3onvtOX9gzFDoguJOUpwDTiL1Si9+2VReNgGHUkwPooB3s7gKC7Ah0mdy01s/YfZ8PvGE90
	0uFANKTMGalAMsQUKfzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcAR-00000008UNX-15X5;
	Sat, 09 May 2026 07:32:07 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcAN-00000008UMn-0gu6
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 07:32:05 +0000
Received: from localhost (unknown [115.199.218.204])
	by APP-01 (Coremail) with SMTP id qwCowAB3HWnm4v5pssCvDw--.31819S2;
	Sat, 09 May 2026 15:31:50 +0800 (CST)
Date: Sat, 9 May 2026 15:31:50 +0800
From: Zishun Yi <vulab@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>, Will Pierce <wgpierce17@gmail.com>, 
	Maxim Kochetkov <fido_max@inbox.ru>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Markus.Elfring@web.de, 
	patchwork@lists.ozlabs.org
Subject: Re: [PATCH] riscv: Check the return value of reloc handlers
Message-ID: <qb46gvbcqyp3pqbdjbx4v4vkziqiwbmn46747deqejkcyaqhnc@dvloherhy5sl>
References: <20260321113419.34437-1-vulab@iscas.ac.cn>
 <6c1715e6-2bb9-40fd-dfb2-791468522614@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c1715e6-2bb9-40fd-dfb2-791468522614@kernel.org>
X-CM-TRANSID: qwCowAB3HWnm4v5pssCvDw--.31819S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWrWFy3Cw4fGr4DAw45GFg_yoW8Wr1UpF
	Wvg3W3Ca18JFyxC397ur48Z3yfZrW3CF47Gr98Wr43ZFyY9ry2vwna9FWY9FZrXw1rWr42
	yr4xur98Ca4ay37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07j16wZUUUUU=
X-Originating-IP: [115.199.218.204]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUCA2n+2sIcQQAAsa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_003203_576827_06F9E5A0 
X-CRM114-Status: GOOD (  13.57  )
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

On Thu, Apr 30, 2026 at 02:04:20PM -0600, Paul Walmsley wrote:
> 
> Thank you for sending this and several other fixes.  I would like to 
> accept the RISC-V-oriented fixes, but have a few questions first -- 
> similar to the ones that Markus already asked you several weeks ago.
> 
> First: were these fixes found and/or generated by LLM tools?  They appear 
> to be.  If so, please add an Assisted-by: tag, according to the directions 
> documented here:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n637 
> 
> and here:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-assistants.rst

Yes, they were found by LLM tools. I will send a v2 for these patches
with the Assisted-by: tag added. Thanks.

> 
> 
> Second: is it possible for you both to get your own unique E-mail 
> accounts?  Many kernel developers and tools assume that a specific E-mail 
> address will be used by only one person.  For example, Patchwork is now 
> incorrectly attributing patches originally sent by Zishun Yi to Wentao 
> Liang, under the not-unreasonable assumption that each developer will have 
> their own E-mail address.
> 

Regarding the email address, I apologize for the confusion. I am
currently an intern and do not have a personal work email. We were
instructed to use this shared email address for submitting patches and
sign-offs. If this is strictly prohibited, please let me know how we
should handle this situation.

Best,
Zishun Yi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
