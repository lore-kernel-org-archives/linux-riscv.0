Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6340CC369D5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 02:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hWnQdqW0cmGUxUtAr5hLLkjXtZB6sV3f7/BRw9DM8Fo=; b=T2013Jb/bj7YCp
	I9o8kHqzmypgYLb0p/s6ejtEKAHkXlRJiYx2ddBxSKvRP/aDooVJ1BXbiepoQsGFFV/QMTTvklU2c
	FGj51IXKrXzuTbaWE0UDUJ1N+0veOad7G2lnc7JB9XDshpxrgu287KwZjM47nNpS9h5Z7DrUfdgB/
	dfMLDNypJp9yfUqmWBDFtwyLXrW0eGVy6dkrWuiSXX/aKmCMvdVX5bJ5sS0heRpWPdpCkF/ARHQVR
	zqwjuuwbmzmJAQQ03REIN+Rk4lvy7PuxTI60Sa62383q2NqevbuKQIs65xgwSiX6+7MSFwyyUoDUA
	9ayXw3e9fGkxTeifaCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ayC-000000087Zv-23ED;
	Tue, 29 Apr 2025 02:45:16 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9axU-000000087VH-3BZH
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 02:44:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745894658; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W7Yqbl3KpTat/YCL5zO60BQism51l0PaZskt2Vj3NMRX7/ATEeDYjoIbfFXiqp9Redyr6QPoajgVisPtElobNqgguNSYYBvcWvTa1ZcmBE+geEWfZJUHcf8URe2450CtFeuXEcA52oRitOHYJ+gkZ1fHPEjNHw+FIGzqoA3gL+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745894658; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y8qohLpxxXxjlKsGCMSvmJyXGDphODOZWso+yF8m3A0=; 
	b=YeU8SaNId4zOrIMVHLz8bFrSr9UiTlEtuGhiOiak6R54fg53lmOnTdh4NN+X3TSyItXEZTVlPtjNOxQoG1U7KQuEa5IhgUHJu8luYh/6585S3LnbomIVE8azzmUU41iK+1AcpxWFt0rkFIHw+fnIJ8KnmfD3Snfi2KN+Co4qD/M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745894658;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Y8qohLpxxXxjlKsGCMSvmJyXGDphODOZWso+yF8m3A0=;
	b=rxu3yHkMtXenqyShakil1PCUh7UQ7F9cG2qo8QLzJXOwSBpHvYGMOCDE4HwX2Gg3
	1qHPo9fVI3cYtJ8l5W0dPJ68jFneYBTM8DjWZ7e9Q8U1PHpRIW1/jx9bImqvok5Niyn
	ZPKBoZd3avLaZz+kdP/h12Z0oZ00DKDUiKpldNqw=
Received: by mx.zohomail.com with SMTPS id 1745894656786665.8936609850081;
	Mon, 28 Apr 2025 19:44:16 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Conor Dooley" <conor@kernel.org>
In-Reply-To: <20250428-water-sermon-eefdfa511f8d@spud>
Cc: "Jassi Brar" <jassisinghbrar@gmail.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, "Yuntao Dai" <d1581209858@live.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH v3 2/3] riscv: dts: add mailbox for Sophgo CV18XX series
	 SoC
Message-ID: <183aa9ef25290278.6bcb31a17e34dfae.e6a8b825df767676@Jude-Air.local>
Date: Tue, 29 Apr 2025 02:44:10 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_194433_158491_15EA0224 
X-CRM114-Status: GOOD (  12.44  )
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

Hi Conor,
Thanks for you review.

The previous email accidentally lost some Cc lists :(, I'm sorry to
harass you.

On 28/04/2025 17:55, Conor Dooley wrote:
> On Mon, Apr 28, 2025 at 08:39:45PM +0800, Junhui Liu wrote:
>> From: Yuntao Dai <d1581209858@live.com>
>> 
>> Add mailbox node for Sophgo CV18XX series SoC.
>> 
>> Signed-off-by: Yuntao Dai <d1581209858@live.com>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> index c18822ec849f353bc296965d2d600a3df314cff6..f7277288f03c024039054bdc4176fc95c2c8be52 100644
>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> @@ -55,6 +55,13 @@ soc {
>>  		dma-noncoherent;
>>  		ranges;
>>  
>> +		mailbox: mailbox@1900000 {
>> +			compatible = "sophgo,cv1800b-mailbox";
>> +			reg = <0x01900000 0x1000>;
>> +			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
>> +			#mbox-cells = <2>;
>> +		};
> 
> No user added here, is there another series in the works that adds a
> user of the mailbox?
> 

There isn't an actual user node in this specific patch. I used a
`mailbox-test` node to verify the functionality in this patch series.

The intended user for this mailbox is the `remoteproc` node. I plan to
submit the `remoteproc` driver patches once the corresponding reset
driver [1] is ready and merged.

link: https://lore.kernel.org/linux-riscv/20250209122936.2338821-1-inochiama@gmail.com/ [1]

>> +
>>  		clk: clock-controller@3002000 {
>>  			reg = <0x03002000 0x1000>;
>>  			clocks = <&osc>;
>> 
>>

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
