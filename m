Return-Path: <SRS0=MS/g=DD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC45C2D0A8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 19:43:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E676C2344C
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Sep 2020 19:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tXsvGzc2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="AqILSeTx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E676C2344C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=bJ3BktSmgT4sp03SkXPaT+Q82DXU8ydkufKoMd4zQk4=; b=tXsvGzc2pEaf17mq9EUeCdjvD
	AJyf49z6NputWa/jGbCaiC7i5NW2EgpfQlJRbUBfhZdq7OYPosJLC16kkuetW5JUc0sSCDKCT2uNP
	fUeVR9mF5CMFoh70oO2DYO9vugHaYDeZrTNTx4q4VjDID9SuAue+K3+1+duWVQzNieTuZIpQw2131
	G2PHzpGBv7rRls75jfQma31SA4o1swPdTGj+D2irzzUkiyN8EO/DcF9XPgMAF+0dx0Fm5RDuhZZCx
	78Rin8A5qaqQu0toorSlOl1KsB1btYh6CyD3HfcDbnsD9Gjv3MZJ0lsqYYRAetq9JOVfD+V1vGRWT
	e5vegMBvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMG5q-0008Bk-T7; Sat, 26 Sep 2020 19:42:50 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMG5o-0008AY-5C
 for linux-riscv@lists.infradead.org; Sat, 26 Sep 2020 19:42:48 +0000
Received: by mail-pg1-x543.google.com with SMTP id s31so812514pga.7
 for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2020 12:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sl+PbqQM6zKU6OzSuHlucAlpdcjvMRLZvonIss7WfIg=;
 b=AqILSeTxE1hr7FW5OY4qwKVHgIpVSLzOMF7VcIcmZJhFYo93tcWFotkN32LYluLsPa
 NmgWwMfnDLDZBGJqf9m0o6r9nmP3CV8QKDbtC86YOScFWRwmJ1kR6CLSGAsZJsGIYToi
 lsaaXBBwTLe1OlfR2RGVsxeMXiOwl/aIuVhncz9XVGKKBoAQjI3YS8rgY1LiQbW5/CcH
 i3YLDf3vRhmO8Xjhe3wYfj1xnzoU0Sb/Ggax4hPYjOCcYv+Q8wQo1TrF0iZWjLLrhY8O
 ZzJ/FRZ3J4BBSaQwYm9bQiS8oT5pNYkTsUQ+PGNHGEsUj8ETgRcQ4IShHdI0eTd4t24q
 LaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sl+PbqQM6zKU6OzSuHlucAlpdcjvMRLZvonIss7WfIg=;
 b=GJgA2fPeBCo9bH3vgVJI0r2hBrfH5x6h0keJP7Fte6xzJCvmFa0y1ioXPoj2rglTOc
 e7wCqdh4Q+Z5aJwicpWKLMfCp47VHsR9HayGBD3UztzoKFoa8DelX4ECfqn+EnrzH4iu
 wbgb7MT7UEx7gHCLmHcVsfyiq8B6LODZwSRGkxXUTAUHfwP46/n2Ktm4tNs9A9O4S/N9
 1wmta90VkeQjcFL5dUZXDoU3LOlUlKnb2i7aD0CRxQrSxg2VIEfxpqqC7VX3St36dbAH
 /6C38EZptYIuylrSp4ShhezwKQBUyDnCOo20Tc0MwN4gqHiQvPysmWTZMev3DZbk/psp
 tCXg==
X-Gm-Message-State: AOAM532MITj+kyMG8v9bKTUM9v/fkACwbySWc8wwkwSD2nvX3z635UvI
 Vr83gwHz+PDgw05m0jgll2zbfg==
X-Google-Smtp-Source: ABdhPJwDm088vYVEZecm77Rvz3ZyvKHOxZFUXoAqMcVnAOy+PMCy2Sgdk2td8bswV7Tj/v9tZrkqMw==
X-Received: by 2002:a63:a546:: with SMTP id r6mr738000pgu.160.1601149363758;
 Sat, 26 Sep 2020 12:42:43 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gj6sm2458790pjb.10.2020.09.26.12.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 12:42:42 -0700 (PDT)
Date: Sat, 26 Sep 2020 12:42:42 -0700 (PDT)
X-Google-Original-Date: Sat, 26 Sep 2020 12:42:40 PDT (-0700)
Subject: Re: [PATCH AUTOSEL 5.8 20/20] riscv: Fix Kendryte K210 device tree
In-Reply-To: <CY4PR04MB3751BE40C3EC0BD2F392E9EEE7380@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-ed52d354-09cf-4708-8b07-5e6559a7b5e8@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200926_154248_221408_DCDAE85B 
X-CRM114-Status: GOOD (  19.25  )
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
Cc: sashal@kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

>On Tue, 22 Sep 2020 17:27:42 PDT (-0700), Damien Le Moal wrote:
>> On 2020/09/21 23:41, Sasha Levin wrote:
>> From: Damien Le Moal <damien.lemoal@wdc.com>
>> 
>> [ Upstream commit f025d9d9934b84cd03b7796072d10686029c408e ]
>> 
>> The Kendryte K210 SoC CLINT is compatible with Sifive clint v0
>> (sifive,clint0). Fix the Kendryte K210 device tree clint entry to be
>> inline with the sifive timer definition documented in
>> Documentation/devicetree/bindings/timer/sifive,clint.yaml.
>> The device tree clint entry is renamed similarly to u-boot device tree
>> definition to improve compatibility with u-boot defined device tree.
>> To ensure correct initialization, the interrup-cells attribute is added
>> and the interrupt-extended attribute definition fixed.
>> 
>> This fixes boot failures with Kendryte K210 SoC boards.
>> 
>> Note that the clock referenced is kept as K210_CLK_ACLK, which does not
>> necessarilly match the clint MTIME increment rate. This however does not
>> seem to cause any problem for now.
>> 
>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>  arch/riscv/boot/dts/kendryte/k210.dtsi | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
>> index c1df56ccb8d55..d2d0ff6456325 100644
>> --- a/arch/riscv/boot/dts/kendryte/k210.dtsi
>> +++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
>> @@ -95,10 +95,12 @@ sysctl: sysctl@50440000 {
>>  			#clock-cells = <1>;
>>  		};
>>  
>> -		clint0: interrupt-controller@2000000 {
>> +		clint0: clint@2000000 {
>> +			#interrupt-cells = <1>;
>>  			compatible = "riscv,clint0";
>>  			reg = <0x2000000 0xC000>;
>> -			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
>> +			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
>> +						&cpu1_intc 3 &cpu1_intc 7>;
>>  			clocks = <&sysctl K210_CLK_ACLK>;
>>  		};
>>  
>> 
>
>Sasha,
>
>This is a fix for a problem in 5.9 tree. 5.8 kernel is fine without this patch.
>And I think applying it to 5.8 might actually break things since the proper
>clint driver was added to kernel 5.9 and does not exist in 5.8.

IIUC this won't actually break anything on 5.8, as the reason nobody noticed
that the old one was broken is because the old CLINT driver just didn't care
about what's in the device tree.  These interrupt numbers are defined by the
ISA manual so we jut had them encoded into the arch/riscv first-level interrupt
controller driver.

That said, it definately doesn't fix anything so it seems safer to just not
backport it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
