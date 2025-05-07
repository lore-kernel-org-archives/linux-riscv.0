Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33D3C3ABBF
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+7g8IfnCISOttoz4/iWe1EWbQIxok4UtGrPUo83MgKk=; b=uaX9kMKZLqf2Fz
	8/LtBDTQIBJ/bXBPCDNyg8okoAzHRed60EMHO7wpcc9UXDF5jyEvfnnQUQMtNXiEHBm5b2nT7Hz96
	xmx+CktJziE63y3IotDkr9LjvHNZA/7x9AAyUCfDL1T7L3SUVbECyc+igfFWms09V5i574oQh1/x7
	Ltk4WzIaBf/DxusWEriZ7FZ+Z9lCEM8xlYQCJYPtvKt5c8UnwTNPKVXqIwWj2UHqZBTohgaYPOuP6
	kC2Q+5HUWlmDH0GpZuP6AJ5eeJiLopl3B3sIN75ffdDL6mC4fJdxks0hSce6ut4bWbZZs2hBNZ8+r
	oLcsVJcUFfhYu1cfCbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCf3U-0000000FbRP-1yPG;
	Wed, 07 May 2025 13:43:24 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCebw-0000000FXMw-1nsj
	for linux-riscv@lists.infradead.org;
	Wed, 07 May 2025 13:14:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746623684; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eDcPnx8EZoR6mILNb1tC9QJ2hoMrWLxxe6xqeD5gDldVIaSd5yha8mjGIS6OpzWm+uQOrDic4bA8+9+3OiETC12L5zJqUxEVBdGn29v/Le16i+Cqs1r0OJDkSLQGN96Qx8WLmRSGm6hVrKJc6Z6fOuiFMG0x8VQHieTu68DKmAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746623684; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZsmKLqMYFF5FclFI2zl2gM9NnSF+GvqV6ouEAfjIasM=; 
	b=iZ39D3xX3qtNwIulRL+AXulntpwWckebQj6nyzJ9/p61cdTJzvc0dPnR5qVaEAR9Ao2z/n11WrVXFTiKb1qp37N1i0ybVTU8jb24Uuglx0N4qS3o7L0lD+1dNtrYTDtVsCnbeUOrE3yq5vuVJqNp8byFI8QnewwHDUkzkGQsaJo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746623684;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZsmKLqMYFF5FclFI2zl2gM9NnSF+GvqV6ouEAfjIasM=;
	b=HUYLgu2nlDBywApn/QVH6qKLLqV/PsDfMGc0ZbZByNa026ebRL8Q1Rcb6u8sgcaX
	hQQvKZ1+cRh3O5d+5CosaREm+17xzQhycT+XLT8zSaRlDEKkHiQdAJJLOq+qQOb2b9N
	eNR4nbf8FU9ACw0jDJhWNx8kvJXkQDIihmERn0QQ=
Received: by mx.zohomail.com with SMTPS id 1746623681228340.1573753215861;
	Wed, 7 May 2025 06:14:41 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Inochi Amaoto" <inochiama@gmail.com>, 
	"Conor Dooley" <conor@kernel.org>
In-Reply-To: <myug24f2rnscxracipkv2ghsjlv32qcyui6u4ckpwtaij6bw3x@yesvbm6vh5ls>
Cc: "Jassi Brar" <jassisinghbrar@gmail.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Yuntao Dai" <d1581209858@live.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH v3 2/3] riscv: dts: add mailbox for Sophgo CV18XX series
	 SoC
Message-ID: <183d40fa26bbd878.d80bda6c3142fde6.abe31e31d76ed1ce@Jude-Air.local>
Date: Wed, 7 May 2025 13:14:33 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_061456_866877_24D4382B 
X-CRM114-Status: GOOD (  19.56  )
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

Hi Inochi,

On 07/05/2025 20:12, Inochi Amaoto wrote:
> On Tue, Apr 29, 2025 at 02:44:10AM +0000, Junhui Liu wrote:
>> Hi Conor,
>> Thanks for you review.
>> 
>> The previous email accidentally lost some Cc lists :(, I'm sorry to
>> harass you.
>> 
>> On 28/04/2025 17:55, Conor Dooley wrote:
>> > On Mon, Apr 28, 2025 at 08:39:45PM +0800, Junhui Liu wrote:
>> >> From: Yuntao Dai <d1581209858@live.com>
>> >> 
>> >> Add mailbox node for Sophgo CV18XX series SoC.
>> >> 
>> >> Signed-off-by: Yuntao Dai <d1581209858@live.com>
>> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> >> ---
>> >>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 7 +++++++
>> >>  1 file changed, 7 insertions(+)
>> >> 
>> >> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> >> index c18822ec849f353bc296965d2d600a3df314cff6..f7277288f03c024039054bdc4176fc95c2c8be52 100644
>> >> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> >> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> >> @@ -55,6 +55,13 @@ soc {
>> >>  		dma-noncoherent;
>> >>  		ranges;
>> >>  
>> >> +		mailbox: mailbox@1900000 {
>> >> +			compatible = "sophgo,cv1800b-mailbox";
>> >> +			reg = <0x01900000 0x1000>;
>> >> +			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
>> >> +			#mbox-cells = <2>;
>> >> +		};
>> > 
>> > No user added here, is there another series in the works that adds a
>> > user of the mailbox?
>> > 
>> 
>> There isn't an actual user node in this specific patch. I used a
>> `mailbox-test` node to verify the functionality in this patch series.
>> 
> 
> I am happy to see the way you test it. Can you add it to the cover?

Sure, I will post the testing process to the cover letter in the next
version.

> 
>> The intended user for this mailbox is the `remoteproc` node. I plan to
>> submit the `remoteproc` driver patches once the corresponding reset
>> driver [1] is ready and merged.
>> 
>> link: https://lore.kernel.org/linux-riscv/20250209122936.2338821-1-inochiama@gmail.com/ [1]
>> 
> 
> I will submit a version for this in the next rc1. I think you can submit
> you remoteproc patch in RFC to get it reviewed.

ok, thanks.

> 
> Regards,
> Inochi

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
