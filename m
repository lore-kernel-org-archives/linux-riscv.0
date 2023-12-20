Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F2EC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 15:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RvPJNQqTCMxGRq37cZYHz5YzeK9tktOymMTVZMFSh1c=; b=Yw3HaqKQpCU+SjIVAgQnuBcZWX
	YHkjg+fUmY4dCwHw5hSLUcakNpqRE8xbu6MqkEBmXZSpqmL6GOzSmI4019zPqNJKokYkMwXlC2SW1
	aeDiB4MrFgBE4JfplRTgYeSRm/1C/cLTQydzcegXNWZS5S+E8KqoIstBMC/ZGqIGBBXnTTHBf6R1I
	3j01YotNnyyHGs+Gcb9GbQ+i93nYzheJnOwaX3xfEzS6rg9DdYxNqq95pYhS/++i6oglZC/rDxOsV
	EN5WaBF+RRDYJBdF898pPvcNpcLTHYWgrIWNzeyVh+3FI+IZ5NDeWbejm4FwYZlDGye9Pw/SypVud
	qfDA6GjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyIg-000CFL-0C;
	Wed, 20 Dec 2023 15:15:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyId-000CEL-2e
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 15:15:57 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d3eae5c1d7so5932015ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 07:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1703085354; x=1703690154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaicGxNdPLRmyws5JYo3khT+Ac6LA4uoPj/EyTp1vA8=;
        b=wswH/A/YQPmCYWTNezu0Xh/Uf2m4v/RohjbraA4d3LdWxa9Axnm/0v40sqsibjBeiT
         gRHAMWVNSp4ZHDRL19lGutGzisDHqmbhk0qcq8W0YmqwLnSZDmQT7KYZYUpLzJm8UvTq
         mau6N0GZ07gwsIfGMbfFXFSVTaZ5E9EKQi/MZJC6GjNhOUI2JST24K8Apu7svTO0CSZL
         QFwAqK+Y2WrDFFdsWGt+a4RD2sqY9YhlAHyqvH+OaMbJWj3IZtF06lIaFnwHGUpHCKSY
         ozpyn71M2lH4UuqlJhzTsLJaqhiKfKWibx4ysB5vEPu9JvCd3v58wAP1hlpa04tqwiaL
         m4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703085354; x=1703690154;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DaicGxNdPLRmyws5JYo3khT+Ac6LA4uoPj/EyTp1vA8=;
        b=rp9OTL+6hFxLqYEU9ScEA3EKe8F0Vwni5CgxkDMDW7NiNbKrpnc5QAafnmno1wJCnH
         mU7DqF20Vy/mvPc5O5SqBMc9BpZuvJ8vya779nlo6QdzSUZ51h/Lcg3Xzs612+kfdLVT
         5vs3S/7HSKrGBfYtzbN+rbO/q5HjMcnFFQ4Ietfc+85Ehq/5DJo51oXUt9kFy0X2U9y2
         YRI11HBfC/gRV8nVUWqgdUZAA0vz3ln7Ue7XPI5IYk9Pqyv5sPdvve4lOTSwiNeIjxVs
         VPgbwbPne9ucoyQvojIlV/Xkb/dF8JUAfllF6ZZZt42nsHXYW5+8bJMpNTAol1sNJviD
         9pVA==
X-Gm-Message-State: AOJu0Yxi0JjHpoZH9OlughsSoMab7cszpIVr3TArwrKcTGNk2jErpDSp
	X7d6YDKYFWo2tk8nEqjwJb1zcA==
X-Google-Smtp-Source: AGHT+IFUwtHVhBFKjQ1VGCUu1CwOKjDbVqBIOeKOWo6tZ0yd4Xvgr+rrVAmzxW439nZFpL+S0CaWVg==
X-Received: by 2002:a17:902:b108:b0:1d3:e7d3:d459 with SMTP id q8-20020a170902b10800b001d3e7d3d459mr1637507plr.29.1703085353873;
        Wed, 20 Dec 2023 07:15:53 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id bi1-20020a170902bf0100b001cf594f71f3sm23003373plb.157.2023.12.20.07.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:15:53 -0800 (PST)
Date: Wed, 20 Dec 2023 07:15:53 -0800 (PST)
X-Google-Original-Date: Wed, 20 Dec 2023 07:15:51 PST (-0800)
Subject: Re: [PATCH] dt-bindings: riscv: cpus: Add AMD MicroBlaze V compatible
In-Reply-To: <20231109-hardcore-empathic-dd95ccb2c878@spud>
CC: michal.simek@amd.com, linux-kernel@vger.kernel.org, monstr@monstr.eu,
  michal.simek@xilinx.com, git@xilinx.com, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org, devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-78b77d96-e318-45f5-9032-4a1bee73afcd@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_071556_195425_9E2552F7 
X-CRM114-Status: GOOD (  15.15  )
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

On Thu, 09 Nov 2023 09:15:09 PST (-0800), Conor Dooley wrote:
> On Mon, Nov 06, 2023 at 12:37:47PM +0100, Michal Simek wrote:
>> MicroBlaze V is new AMD/Xilinx soft-core 32bit RISC-V processor IP.
>> It is hardware compatible with classic MicroBlaze processor.
>> 
>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> I thought I had already done so, but must have forgot to actually send
> the email.

Conor asked me to pick it up, it's over staged for testing.  Pretty much 
no chance it fails anything, so should show up on for-next soon.

>
> Cheers,
> Conor.
>
>> ---
>> 
>>  Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> index 97e8441eda1c..7b077af62b27 100644
>> --- a/Documentation/devicetree/bindings/riscv/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
>> @@ -32,6 +32,7 @@ properties:
>>      oneOf:
>>        - items:
>>            - enum:
>> +              - amd,mbv32
>>                - andestech,ax45mp
>>                - canaan,k210
>>                - sifive,bullet0
>> -- 
>> 2.36.1
>> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
