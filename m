Return-Path: <SRS0=RZUB=PM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD69C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 00:36:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F271820675
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 00:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tMT/IoMs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="B6J9fOp3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F271820675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=1NU0p/VaftCKOuPdE3r1ke/lKNf2OY0jmrtMleeC+G0=; b=tMT/IoMsuzgCBzSmB0tCAVObl
	Xr/UCIAE3rP040vSBt6nuPQaQOuKJybwvGGBMPjgsOMuosxWtjKBJ5XGguwqvg9MFb6B3qInhZXse
	KddV09toH/ViNp2J0nnh3wyYnEqCI7+KomvVn6RB09bVTlIoxiZdyRVccrDIc2W45JAT7DnbD2QEK
	rYQjI5Sh6aB1FLkriUwu34LbvOdgiANYEUMvJOaIX2ZYWKWpN0Pyi0FCYXI53b61PJb3RDuzZeC3n
	i0v3Bx2T7pkUBh3CFtMVPj53gUD9b2hzZWKVPu9v8cWraOjDs1GgbKE2cS4YaroIw7H07OtTzwlzH
	slh00LRjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfDTQ-0000YT-ON; Fri, 04 Jan 2019 00:36:28 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfDTN-0000Y6-Q5
 for linux-riscv@lists.infradead.org; Fri, 04 Jan 2019 00:36:27 +0000
Received: by mail-pl1-x642.google.com with SMTP id e11so16602517plt.11
 for <linux-riscv@lists.infradead.org>; Thu, 03 Jan 2019 16:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sH696XfMqLRQ1tRvrc7Fi9lOpjV2QeG6g65JbjgrN0o=;
 b=B6J9fOp38YeW6xFrZDaVgQ9j69DE8ZH7irSliG5g2loIrXzWMOLx+VFHHWDY84sCyw
 ZCJCreI5Q6A4YSSe/EnME/RmhcS4NoVdJZt70efYDkn6+HLTXUs4KjINN6Xemej0aXs9
 JNqIvBBmAzkMmDwtDJDzL92fKPcUwmUsqIqPmzgjOUI07M2OHwVNzFijtsZGjlMSWXT6
 Pb5Zpcjr+Czcm/cdTNLWFTaJ3hHyJmsrQEQlA/64KO1ufM/yS3Y6GS8THA2doMPhqwsZ
 vOgmMRYWYZEepX9NI8ZgJ/ce2N028oPIG0fLBppKfdhoXxpFMUyVA8wG62aHRKxVftpf
 VcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sH696XfMqLRQ1tRvrc7Fi9lOpjV2QeG6g65JbjgrN0o=;
 b=LKCtsodprGVTQydJey0jRBJYI0s+NC9bfGkv6VKuK3qFpTdA0S6jfJ0YjCpCyXDHbA
 YRfi88tiuYJiJ2b0i5wfIOvzsQDYeAyyTKWu18KQbXsByTmgURaSD37dSPwu1AkB3y2k
 c4JDcygQhzMnMvWeo/8TUn01jgBFFW9AoB4pP+G59+uUXjYUQaMx+apkVMhxsq40zsKK
 QQ+VDVoVx9lEynGajex3x/NLi2O8k7Z4rUFWBTuqf+oDH5LN4mIZVTTlQVCeb0Qeadsn
 fHVe7S9uZWYGUfAtzqcNIE3++bPnJxdKaZriDRhQAuUoeM3/TILU12nDaGJr9vPpX8ve
 k9ig==
X-Gm-Message-State: AJcUukc6GaKzQQW33j5pLaEqtqaqD3kqoIcDrVP7QaZ80AACDG9Hp9WD
 XEiRsEGq9gJ/IlwcX8P3k0978g==
X-Google-Smtp-Source: ALg8bN5tKx1pXPFVw8R1Ze6QioXVWxnN4YZ4M2AQ0KfMIXpLFVOHxbATrDS/BtLmEsJjRwZmkE5ROg==
X-Received: by 2002:a17:902:24a2:: with SMTP id
 w31mr48185166pla.216.1546562183309; 
 Thu, 03 Jan 2019 16:36:23 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i184sm78920216pfc.41.2019.01.03.16.36.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Jan 2019 16:36:22 -0800 (PST)
Date: Thu, 03 Jan 2019 16:36:22 -0800 (PST)
X-Google-Original-Date: Thu, 03 Jan 2019 16:35:55 PST (-0800)
Subject: Re: [PATCH v2 1/4] dt-bindings: Correct RISC-V's timebase-frequency
In-Reply-To: <5d652370-4782-23b2-9896-b9666b3cc1e7@linaro.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: daniel.lezcano@linaro.org
Message-ID: <mhng-9767f556-9f5a-4366-931f-131222d3253b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190103_163625_875778_C2E82D44 
X-CRM114-Status: GOOD (  16.18  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 aou@eecs.berkeley.edu, dmitriy@oss-tech.org, anup@brainfault.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, robh+dt@kernel.org, tglx@linutronix.de,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 14 Dec 2018 01:17:24 PST (-0800), daniel.lezcano@linaro.org wrote:
> On 14/12/2018 00:14, Atish Patra wrote:
>> From: Palmer Dabbelt <palmer@sifive.com>
>>
>> In RISC-V systems, timebase-frequency is per cpu instead of one
>> instance for entire SOC as there is a individual timer per each CPU.
>> Fix the DT binding accordingly.
>
> Why not use a fixed-clock instead of this timebase property which forces
> to declare a global variable to be exported from arch/riscv to
> drivers/clocksource ?

That makes sense to me.  I've always disliked this global variable and a big 
part of why my original version got delayed forever is that I'd hoped to get 
rid of it.

Given that this is all a mess anyway I'm OK breaking backwards compatibility 
here.

Is there an example of how to do this?

> In addition, please add the 'Fixes' tag
>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> [Atish: Update the commit text]
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  Documentation/devicetree/bindings/riscv/cpus.txt | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
>> index adf7b7af..b0b038d6 100644
>> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
>> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
>> @@ -93,9 +93,9 @@ Linux is allowed to run on.
>>          cpus {
>>                  #address-cells = <1>;
>>                  #size-cells = <0>;
>> -                timebase-frequency = <1000000>;
>>                  cpu@0 {
>>                          clock-frequency = <1600000000>;
>> +                        timebase-frequency = <1000000>;
>>                          compatible = "sifive,rocket0", "riscv";
>>                          device_type = "cpu";
>>                          i-cache-block-size = <64>;
>> @@ -113,6 +113,7 @@ Linux is allowed to run on.
>>                  };
>>                  cpu@1 {
>>                          clock-frequency = <1600000000>;
>> +                        timebase-frequency = <1000000>;
>>                          compatible = "sifive,rocket0", "riscv";
>>                          d-cache-block-size = <64>;
>>                          d-cache-sets = <64>;
>> @@ -145,6 +146,7 @@ Example: Spike ISA Simulator with 1 Hart
>>  This device tree matches the Spike ISA golden model as run with `spike -p1`.
>>
>>          cpus {
>> +                timebase-frequency = <1000000>;
>>                  cpu@0 {
>>                          device_type = "cpu";
>>                          reg = <0x00000000>;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
