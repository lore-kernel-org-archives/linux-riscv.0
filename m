Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3878C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 20:51:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 077E6207EA
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 20:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jov541Hi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yixz3jPa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 077E6207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4nqj6SCy1HhMF4znaV/t2L8BNzZGGST+T1bFxYoyKb8=; b=Jov541Hiots+yg9Im6/51fk9j
	L3fEn6bpZfgZmwVS3dwSoAqKIt8gHBNVipHsJKMkNIxXYVvPGhIvllZOCAhqADuXNPY5IjKViHws9
	lgrOhtuTL8doNagMDv4e+zN2IYJushE3QEPVwjGakU2lIKy+6pp13BXjHKEWEahpZ3fnWr3ib+7Kg
	cEjUdF48nDby+cElGuYJRabwsPRxH0IkcoG5GO0GCEyRE5Le3o5eyv9ZXGuNL0XfV4SVVPB/1uOw3
	Z9cSfivaR68IhHa/fg4OzXGVkt4A6LuL3uJDS0ZetgSrytUr25Z72FS5wHqWq3UJyIpdK4iPNthbj
	fmnDSAoJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMHA9-0001X3-2w; Sat, 26 Sep 2020 20:51:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMHA6-0001Sc-M1
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 20:51:19 +0000
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E6207207EA;
 Sat, 26 Sep 2020 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601153476;
 bh=RqI2XkUJnGfTSYFp3HDfs/QKnRhvBG5itC4b0KZfLFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yixz3jPary8hkalk5k87l/xp1SnOuwY3rJU/c7GSsSsNCt+Jp86+pVo0uKZsuQzRF
 AM9CMvDpow13UdBkne6TjU0AvZlCRiVBaE1XP+VLS8bXHm2rC7GfqODCsxoSe+gV9O
 +Z+1p73CjAKJ8z7QueCYIaMf0LZa6NWbA2urMtcM=
Date: Sat, 26 Sep 2020 16:51:14 -0400
From: Sasha Levin <sashal@kernel.org>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH AUTOSEL 5.8 20/20] riscv: Fix Kendryte K210 device tree
Message-ID: <20200926205114.GB2219727@sasha-vm>
References: <CY4PR04MB3751BE40C3EC0BD2F392E9EEE7380@CY4PR04MB3751.namprd04.prod.outlook.com>
 <mhng-ed52d354-09cf-4708-8b07-5e6559a7b5e8@palmerdabbelt-glaptop1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-ed52d354-09cf-4708-8b07-5e6559a7b5e8@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_165118_895497_08424E29 
X-CRM114-Status: GOOD (  16.05  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <Damien.LeMoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 26, 2020 at 12:42:42PM -0700, Palmer Dabbelt wrote:
>>On Tue, 22 Sep 2020 17:27:42 PDT (-0700), Damien Le Moal wrote:
>>>On 2020/09/21 23:41, Sasha Levin wrote:
>>>From: Damien Le Moal <damien.lemoal@wdc.com>
>>>
>>>[ Upstream commit f025d9d9934b84cd03b7796072d10686029c408e ]
>>>
>>>The Kendryte K210 SoC CLINT is compatible with Sifive clint v0
>>>(sifive,clint0). Fix the Kendryte K210 device tree clint entry to be
>>>inline with the sifive timer definition documented in
>>>Documentation/devicetree/bindings/timer/sifive,clint.yaml.
>>>The device tree clint entry is renamed similarly to u-boot device tree
>>>definition to improve compatibility with u-boot defined device tree.
>>>To ensure correct initialization, the interrup-cells attribute is added
>>>and the interrupt-extended attribute definition fixed.
>>>
>>>This fixes boot failures with Kendryte K210 SoC boards.
>>>
>>>Note that the clock referenced is kept as K210_CLK_ACLK, which does not
>>>necessarilly match the clint MTIME increment rate. This however does not
>>>seem to cause any problem for now.
>>>
>>>Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>>>---
>>> arch/riscv/boot/dts/kendryte/k210.dtsi | 6 ++++--
>>> 1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
>>>index c1df56ccb8d55..d2d0ff6456325 100644
>>>--- a/arch/riscv/boot/dts/kendryte/k210.dtsi
>>>+++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
>>>@@ -95,10 +95,12 @@ sysctl: sysctl@50440000 {
>>> 			#clock-cells = <1>;
>>> 		};
>>>-		clint0: interrupt-controller@2000000 {
>>>+		clint0: clint@2000000 {
>>>+			#interrupt-cells = <1>;
>>> 			compatible = "riscv,clint0";
>>> 			reg = <0x2000000 0xC000>;
>>>-			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
>>>+			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
>>>+						&cpu1_intc 3 &cpu1_intc 7>;
>>> 			clocks = <&sysctl K210_CLK_ACLK>;
>>> 		};
>>>
>>
>>Sasha,
>>
>>This is a fix for a problem in 5.9 tree. 5.8 kernel is fine without this patch.
>>And I think applying it to 5.8 might actually break things since the proper
>>clint driver was added to kernel 5.9 and does not exist in 5.8.
>
>IIUC this won't actually break anything on 5.8, as the reason nobody noticed
>that the old one was broken is because the old CLINT driver just didn't care
>about what's in the device tree.  These interrupt numbers are defined by the
>ISA manual so we jut had them encoded into the arch/riscv first-level interrupt
>controller driver.
>
>That said, it definately doesn't fix anything so it seems safer to just not
>backport it.

Sure, I'll drop it. Thanks!

-- 
Thanks,
Sasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
