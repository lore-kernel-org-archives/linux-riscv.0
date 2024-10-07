Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700EACFB43F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 12:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WH/ccxOl7SHqimct50spx/ypCFo5fm7cRG0IcZcRU8=; b=gGMRbmc45HQbvC
	JrCob7lWoq7ngOpB6DgrCZX1Af/8tZTQ4hzm2ZnQCLqstWX09h5g4MIhDxCUimdO5jCYSNXByuiZ3
	OC+euUW7LM3lRSMTRCjNa3BnwTUj2mRp1Dd3WMFRU0h/Azb84vgpRImyweKV1qqIIybQJGphlBjZa
	I0UEmyWOMSMYXZYZer1r0x07MRRVWTUAbOxlBGbMgB1J8hejoU0xZ7tMeMR2YHV6ZQAACzPk5qMcg
	cqrSoccC4turrtxGsvCizarIf3LPxgCVdWD5of5OvYfYwyMryqUygoKzZpXhJTNZ6GtpwxJ56y8rP
	MDUMf/f5GTxkYpNV2oIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmrD-00000002Kmg-39y8;
	Mon, 07 Oct 2024 12:28:59 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmfp-00000002IJI-03lr
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 12:17:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b1GIVNxvx5+F1w8uwFX+BMCBEvmeEUB2jrfqPiIRgmE=; b=XvgCYL3RuKZgyPLXt5ZWSTtREd
	IGUeTq7T8ekDDV09zJb8Qn2Qqt3G5QRycXl73nk49IWLIrosEi8HwO7B6yJOD58rQnaF/TgytmZDN
	fji2JIW7V3Ahzwdo1r2DObuNuB5ajyY7i4zFPhdo7o3vyRbWcqzkscrqVBlymR6wylV0EqVfimV90
	NyX+i+lue8XTMrVq+yhn3X+9ddLVhUfBTglWSgDOmjma7aIwhQheguZKx8ABPWFYfqQ7MuQ//gavA
	6MA3yOJ+U4zTLLAfTP6QJVK0nsqwf222Ffck6Uu19lWqasZTmhxGVZNTwoG3XEbqnnX04fy+nLSfL
	J1F4SWVw==;
Received: from [167.98.27.226] (helo=[10.35.6.109])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1sxmfe-00AAdC-5o; Mon, 07 Oct 2024 13:17:02 +0100
Message-ID: <37cfd941-f51d-44d8-8283-389ea8d53e69@codethink.co.uk>
Date: Mon, 7 Oct 2024 13:17:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: make ZONE_DMA32 optional
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
 <e8f6ed93-d47c-4c07-963c-8f16f498abed@ghiti.fr>
 <VI1PR09MB2333FEC324AA0B3E5F1D7F98947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <VI1PR09MB2333FEC324AA0B3E5F1D7F98947C2@VI1PR09MB2333.eurprd09.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_051713_173732_99481E73 
X-CRM114-Status: GOOD (  15.36  )
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

On 06/10/2024 11:44, Vladimir Kondratiev wrote:
>> I'm wondering how distro kernels will deal with that since some
>> platforms will need the ZONE_DMA32 and some others will break when
>> enabled as you have shown.
> 
> I agree platforms with no ZONE_DMA32 is non-portable,
> to address this I will add dependency on NONPORTABLE and re-submit
> shortly. Thanks for pointing that.

So the last time I got to looking at this, the SoC had no memory
in the 32bit space and all the on-chip IP blocks where all 64bit
DMA capable.

The only thing we didn't sort out was anything connected by the DW
PCIe core, but we think that could use an inbound  translation window.

However, software wise we didn't have the time to try and either
hack something into the kernel or write some form of IOMMU for the 
inbound translation unit. We just removed the warnings to get the
initial testing through.

>> Is there a way to make it optional at runtime instead?
> Unfortunately no, or at least I see no way to do so
> 
> Thanks, Vladimir
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
