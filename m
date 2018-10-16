Return-Path: <SRS0=QIML=M4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF5DC04EBD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 17:32:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50DCD2098A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 16 Oct 2018 17:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QVtAmr63";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Tij+a/vV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50DCD2098A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jhpoo+L0RrjTsybG5bSH76KrmGUh0/2ZgF/VM6wk88Q=; b=QVtAmr63ksr6ccHjY8BiQxXP9
	iBQ4L8OQqAk5PIqw0eMPhxr6zBgCSV0EmxiIEj7uBvmdyJO8uV/qkghKijKTseNnRiUSuV8b2C0yt
	xJFewLjAE8zt5oEdlf4vLCkdV2Is5OvCBf29Qq+IznqCwRdMA+8Ujkhr5VQbNX6L8C1amfsaGG3Xs
	R6Z9FotAGmNbMlP43mGAYX+k2Qjd/rueg2g1YUI9V4Kv5d2r5gsA58UbIfKvOQefVLWZc88sVx3DS
	jZsEgWWl91GL5FmsQLr0OwFXntS+Z57iqPMnZbVuqJUsLuvxPVD/YNKT995mxtpG8dmhzXh/6akmA
	VZSDyYCIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCTCK-0006sj-6n; Tue, 16 Oct 2018 17:32:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCTCH-0006rh-9P
 for linux-riscv@lists.infradead.org; Tue, 16 Oct 2018 17:31:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id r64-v6so11785115pfb.13
 for <linux-riscv@lists.infradead.org>; Tue, 16 Oct 2018 10:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Nz+s1fq47X5/tu2PUFqFtpaCvyk5Jvn12B4Jt34WfdQ=;
 b=Tij+a/vVR5UJBfRbD6QFNoeWPVM2vyWEpbGPdFnqbc953KwSPSBHllc0LpN+l7p1V2
 GfLeEW6EWm15937hAwEgD3hdlP0HOkz3vLJfvv3PH0/SxX/QlkiagpYTvj9UvKNNWmGO
 cQ7S2QIVFA7sb4yV0ajys/4alqPPVURvqAxFgKUQ9He8bQSgE6XD01oNBJ3dsEiRTjQ9
 uB8/ha24w4d/bguUY49WcTjTtaUHtizXoD9xNa/yGswfP6ShcRA0LGRm4QAwXyp+POV3
 1y1Fgc/WdT0xzdqZd4vdmelogWubL997KVtSs6z+cQDC8VLLwdOnyGX1GHNIKu2Sl06c
 Scvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Nz+s1fq47X5/tu2PUFqFtpaCvyk5Jvn12B4Jt34WfdQ=;
 b=JFq0EEDWyGA6oRMAPfDctlbaz19P7WEkO5STLXzpOvVSrFm85vs5nORiKL5JkUPOUD
 LzCO3vTzee0zpdcy5TuF3SA+dA8T30JffeQxRbT+enUeJATEMwNr+icpk9DnspgB7bwW
 qku6nMQlOeUX3g48Tmq81oiy/+mwFboxOLACydr1n8SelVr50vwxKYdkzinDnMMMtYe8
 FX7XCcieafEGxTpfE3RtbYPx+6V5FtUIScPukorvvWGEolplWQpF8S2ni+5Ycnt1Zmy4
 I/TWLm55EUiDBopZZiEH0K9XticTdrVO6+xj949zVSqfaSUdRqGTuc74EQSpIagxGo9a
 JYjA==
X-Gm-Message-State: ABuFfoirf1b3rEMvQLgnxHYQfIpYGn4jDRzwlSFW8yy9GWuLlqSD8O3Z
 KSKZxMF6nOwVH9gytrfoZs1gnlRFHQg=
X-Google-Smtp-Source: ACcGV60oxet49enyexZROKkznZaXNAJF9gjKNfM0xepagrr3RD+J8+ysVC3L2ifXD852nBgFipG4Mg==
X-Received: by 2002:a62:2845:: with SMTP id
 o66-v6mr22895541pfo.17.1539711104628; 
 Tue, 16 Oct 2018 10:31:44 -0700 (PDT)
Received: from [192.168.0.21] (97-120-178-141.ptld.qwest.net. [97.120.178.141])
 by smtp.gmail.com with ESMTPSA id z15-v6sm18183925pfn.170.2018.10.16.10.31.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Oct 2018 10:31:44 -0700 (PDT)
Subject: Re: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM
 Controller.
To: Thierry Reding <thierry.reding@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
 <20181010134926.GD21134@ulmo> <25758ab9-eb36-741b-6264-42412b3ddd8e@wdc.com>
 <20181016110142.GC8852@ulmo>
From: Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <6e108e3c-15c1-b13b-ac3e-60c5eb209c7b@sifive.com>
Date: Tue, 16 Oct 2018 10:31:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181016110142.GC8852@ulmo>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181016_103157_332945_8A3339E4 
X-CRM114-Status: GOOD (  16.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Wesley Terpstra <wesley@sifive.com>, linus.walleij@linaro.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181016173142.uMZXHmNZI2RoWQbYnGSElUE0TiOuzWy9L3ubpLgwErU@z>


On 10/16/18 4:01 AM, Thierry Reding wrote:
> On Mon, Oct 15, 2018 at 03:57:35PM -0700, Atish Patra wrote:
>> On 10/10/18 6:49 AM, Thierry Reding wrote:
>>> On Tue, Oct 09, 2018 at 11:51:22AM -0700, Atish Patra wrote:
>>>> +Required properties:
>>>> +- compatible: should be one of
>>>> +	"sifive,fu540-c000-pwm0","sifive,pwm0".
>>> What's the '0' in here? A version number?
>>>
>> I think yes. Since fu540 is the first Linux capable RISC-V core, SiFive =
Guys
>> decided mark it as version 0.
>>
>> @Wesly: Please correct me if I am wrong.
> It seems fairly superfluous to me to have a version number in additon to
> the fu540-c000, which already seems to be the core plus some sort of
> part number. Do you really expect there to be any changes in the SoC
> that would require a different compatible string at this point? If the
> SoC has taped out, how will you ever get a different version of the PWM
> IP in it?
>
> I would expect any improvements or changes to the PWM IP to show up in a
> different SoC generation, at which point it would be something like
> "sifive,fu640-c000" maybe, or perhaps "sifive,fu540-d000", or whatever
> the numbering is.


The "0" suffix refers to a revision number for the underlying PWM IP block.

It's certainly important to keep that version number on the =

"sifive,pwm0" compatible string that doesn't have the chip name =

associated with it.

As to whether there could ever be a FU540-C000 part with different IP =

block versions on it: FU540-C000 is ultimately a marketing name.=A0 While =

theoretically we shouldn't have another "FU540-C000" chip with different =

peripheral IP block versions on it, I don't think any engineer can =

guarantee that it won't happen.


- Paul


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
