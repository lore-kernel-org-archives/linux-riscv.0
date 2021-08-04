Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49480C4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 04:18:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D203A60E52
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 04:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D203A60E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ecsA/E4m16abKSEVN05xNOOtV6FbAK3ePZPtlLH3nLc=; b=Q2aPRGLWjYh5/MWWHZZxHQDJhS
	E9c/ym7YlnHaeyv8ysPuMfbcqmrX8D2UXLJpFOCwwrjjcpjnRSgqti4I8YJkd5FD7Uzo/9CoW+dz9
	x7FpyIvJdX3vOnjevnWZtploDRxTsDnKk8kk09Ri5Sz0GlXI6LX1ABBu7L5rCHl3PhCqB9njIaK9q
	H7WbvPOU/b5oWJdo3vSWgKuV8kpOKiK7WrQTHZC3kU+VzRdvfF0mwm2vkBqGOC1ulN2tiVHmKbN/L
	LipD+vrmXlKZhv5zSPYAJTlYteRCEUkFqm9WF8ih4F3ZLS/wgQP16l5jSNpOGWWi3+0BJDq+rgQft
	dsx2jPDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB8Lh-004k2J-I1; Wed, 04 Aug 2021 04:17:45 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB8Le-004k1m-EO
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 04:17:44 +0000
Received: by mail-pj1-x102b.google.com with SMTP id j1so1178531pjv.3
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 21:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2nhmhsD02swUNGOs+pWN1f/pBH1u3TBjPpQ5E28Bnk4=;
 b=RN2o6y4lLPWKfCm77thZdN4Dt3iOZzNyu0VRtESWaEYOSRE9WNrSD0o5YQkUv0sFlF
 716hiNy2RGcmyjnRtIGv7Fyw+s9pMjAO5rarIBg7USE5dSSkBx/RjV3fXI17oRX0Mvnv
 80+/lw/cJ/W1vDo3mA+qftq337E+MmRP09+h2+wcLa6++bXHpm3K80xp0tje+/tY/MzU
 cWWMsgwdAHEFathcpJUeuuJbJCCm+YAjJw+E8hQjpp+axT6GlPJhtyobyztWepotpdnT
 YYEc5H3LMUaKkuyg8UfnDP5pc4T2ASyshkX2FXKohgLoKNeYCxO083IidqGQZ58AAKt1
 B38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=2nhmhsD02swUNGOs+pWN1f/pBH1u3TBjPpQ5E28Bnk4=;
 b=hLHIhxobMwNhb/b2q10ZTk01hEHpXmN19jjPDWhib51/3BcyQ9p9g7G6ZLH42d6wqJ
 P1sRzp6u2Iz2yRfJJaGmE9F5kvutkkgGK2iXDujfkVqst2mfLePUYjyn/mt1pbtpfH1w
 7FJ0fC3cv2DO0/tvltVHULAQSzxoN6mFXudMq6Fai7FYK/0zgGQMQAx33vscg/dQqG/t
 pfu6f2axLReqBv/h47ZSyt39/HBuuZ2Ta1+mm0b0KWoPIBZJiAAMHXYqrWZAIrdJWlOg
 px5AFyS5nAyXh9Apjzg4GY0aoZ/rT8BcdPBhxkUFUon13BCZEp1dRKrR3Tj8Nnnq7rnD
 7iWQ==
X-Gm-Message-State: AOAM533J7pcAaTtohio1srCanywvaPf9R9urigv3lvBw1DvfxonAh5cb
 b+gSaPUuGVmD0ZCQ4BC2K4h4HQ==
X-Google-Smtp-Source: ABdhPJz6agqeARIoaeR47VypfuIBgV5nmdECVVEwjtwqbdqo2YuBOSMSHhxZK3WMCR0nnWPwULfSqA==
X-Received: by 2002:a62:b615:0:b029:34a:3920:a7ea with SMTP id
 j21-20020a62b6150000b029034a3920a7eamr25702160pff.21.1628050661707; 
 Tue, 03 Aug 2021 21:17:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a26sm780937pfi.29.2021.08.03.21.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 21:17:41 -0700 (PDT)
Date: Tue, 03 Aug 2021 21:17:41 -0700 (PDT)
X-Google-Original-Date: Tue, 03 Aug 2021 21:17:35 PDT (-0700)
Subject: Re: [PATCH] riscv: dts: fix memory size for the SiFive HiFive
 Unmatched
In-Reply-To: <de2d60b1-6b84-3d47-8fe7-3f939100b7a8@canonical.com>
CC: plr.vincent@gmail.com, schwab@linux-m68k.org, qiuwenbo@kylinos.com.cn,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heinrich.schuchardt@canonical.com
Message-ID: <mhng-f37a2b55-a8de-4245-9f60-6d18ab2da7e0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_211742_528990_49178B6C 
X-CRM114-Status: GOOD (  25.35  )
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

On Fri, 30 Jul 2021 04:54:28 PDT (-0700), heinrich.schuchardt@canonical.com wrote:
> On 04.07.21 14:13, Vincent Pelletier wrote:
>> On Sun, 04 Jul 2021 11:15:55 +0200, Andreas Schwab <schwab@linux-m68k.org> wrote:
>>> On Jul 04 2021, Qiu Wenbo wrote:
>>>
>>>> The production version of HiFive Unmatched have 16GB memory.
>>>>
>>>> Signed-off-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
>>>> ---
>>>>   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
>>>> index b1c3c596578f..2e4ea84f27e7 100644
>>>> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
>>>> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
>>>> @@ -24,7 +24,7 @@ cpus {
>>>>
>>>>   	memory@80000000 {
>>>>   		device_type = "memory";
>>>> -		reg = <0x0 0x80000000 0x2 0x00000000>;
>>>> +		reg = <0x0 0x80000000 0x4 0x00000000>;
>>>>   	};
>>>>
>>>>   	soc {
>>>
>>> https://github.com/sifive/meta-sifive/blob/2021.06/recipes-kernel/linux/files/0003-riscv-sifive-unmatched-update-for-16GB-rev3.patch
>>> contains more changes.
>>
>> Here is what I learned on this topic while poking at the regulator part
>> of this devicetree:
>>
>> While these extra changes match the board's schematics, they are
>> rejected by the da9063-regulator driver:
>> - some channels are merged on the board, but the devicetree does not
>>    show that: they have different names, with different maximum current.
>>    The updated values exceed the single-channel maximum, so the driver
>>    rejects them.
>> - 3 of the regulators are further configurable in overdrive mode on the
>>    board, allowing higher maximum current, but the driver does not
>>    handle this.
>>    Similarly to previous point, the updated values exceed the
>>    non-overdrive maximum, so the driver rejects them.
>>    I've submitted a tentative fix, but its logic is backwards: it
>>    detects the overdrive bits and increases the maximums, whereas it
>>    should see the higher maximums and as a reaction enable the overdrive
>>    bits
>> - also, some voltages fall in-between possible values, which causes the
>>    driver to reject as well (ex: vdd_bperi is at 1.05V, but the chip can
>>    either do 1.04 or 1.06)
>> - ...and likewise for some current values (ex: vdd_bpro is at 2.5A, but
>>    the chip can only detect 2.4 or 2.6)
>>
>> So from a pure system behaviour perspective, these extra changes should
>> not matter either way (at least in my understanding). At least not with
>> the driver in its current state.
>>
>> OTOH:
>> - the changes missing here are more correct than current master
>> - not including them will probably make meta-sifive maintainer's life a
>>    bit more difficult
>>
>
> We should not mix changes that are unrelated in a single patch. Even if
> regulator changes are advised they should be submitted in a separate patch.
>
> The HiFive Unmatched shows the full available memory with this patch alone.
>
> Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Agreed.  This is on fixes, if there are more DTS fixes I'm happy to take 
those as well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
