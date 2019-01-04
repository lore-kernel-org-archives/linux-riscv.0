Return-Path: <SRS0=RZUB=PM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D1DC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 22:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B18CE2173B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  4 Jan 2019 22:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CSFtFzJv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Oym7T3hR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B18CE2173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=iIgw1iuCf5pSRrDx8b1WdQqw+4R0W1RNamUwhYE0GoA=; b=CSFtFzJvaa9Nw2Bo35g+xHJnO
	Jr4xySOXSZ5zkVBlw0ZvJuiBFXhY5qQ1+JWewGQGmUfVp2T2FgBAgZ1RZTMxvJRxm4avF43QQj5G9
	2sUIF+kpzaKJl0TNE/H6Zou3yCBUCQiVbWCuLSXBCMv/eCuAFZWBDx6B9QBpofRwNE1FsrdjBvil5
	65GvRYEQSzvPcYiI2rbM0jFkGFo0zU1Rv4mSkwBwGx3vmtA3Do0FxKn/PEnzOnfASI70vyyR+nw98
	WIDfIGHpWy04qpOpAkHJo2qXMuAmX6i9xV3/U3nCv311uV2/pxJbiOuTFAFxr6NchSNn43Hjfg2gs
	Rv+bhdPOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfYF0-00031c-HZ; Fri, 04 Jan 2019 22:46:58 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfYEx-000314-Ak
 for linux-riscv@lists.infradead.org; Fri, 04 Jan 2019 22:46:57 +0000
Received: by mail-pf1-x444.google.com with SMTP id h3so18931125pfg.1
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jan 2019 14:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=LRY8C7wucfF/B/r5Qck4+abP1qaq8PZ2hb27AmRVcRY=;
 b=Oym7T3hRS8UnLGxENZoHx9nleXmgJlHuk1zs+xwJEMXim9Mcy3/9KdDuOiiKXdGofS
 zu+SVZjS+3tB+bxH7Qg8fn9URCwXfv7UmI8YCcD0EEVwU7YMqlHiYJGqBuuYsMe3gpkO
 vbcSXR6TjSmOKk31I9bZ3dw/MBqoO1EA9iv8FzkMR56rGHYMVtX63Mw8xcBQfi8mYuxb
 VAH8/RBFAqDbDiYgkD0s9+cbl0RIeVmqzRhlaBICRTynfvdKN+qVls6ZoB8taT1HCyl4
 QRfIKPTB7ot/5Fwkwgp32HKKOpLhp06kNrY5lWz/UaYGPmryRhJni0pz5QilxVUQpyw6
 GHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=LRY8C7wucfF/B/r5Qck4+abP1qaq8PZ2hb27AmRVcRY=;
 b=Qqyg974L/z5XEXoBbR+d2LR0RPkQ8po6S4DsMmfQi66QBH6Lyxxx6HS/FsGEnsi53Q
 tgB87nTC53HqkF1kATTU+dGocennDhVobbW3C6cIK2ECfpjU9MNu1/dAaLul/IzkbXiB
 b1A9y3AFCUPGmA979WVjtvpggrTMk1Ahk+EX+8AO0k4qmcOKRhpvqakW3CLyAnT9ft5M
 02lL7q2lS3JGqSqw4qcRb8+hY9HIGa5nHxNOD83rKFlnXHejDDLHgN6jTV4xYNCQz+7B
 SQXdqGHwZirhklOLJklRfIqDaTdTwYUijR7pxLU+67Tb0XGbPuLGQJZgoXrwFhrCMvOj
 JDhQ==
X-Gm-Message-State: AJcUukcmDirBOHlvBr7yYWLcnemZbpUicWv4AGhlF8X9nvj3giG7ugtl
 Gyo8/dPcKYQPYahp341zzXNAJQ==
X-Google-Smtp-Source: ALg8bN46pet05eyEz7IC11sFR9391SdiwJOxH/CsYO6MAAskxf6IV6l6F3gVqEk6GbUn3kc1y/nqog==
X-Received: by 2002:a63:6f0d:: with SMTP id k13mr3100518pgc.42.1546642013905; 
 Fri, 04 Jan 2019 14:46:53 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id z186sm91085267pfz.119.2019.01.04.14.46.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Jan 2019 14:46:52 -0800 (PST)
Date: Fri, 04 Jan 2019 14:46:52 -0800 (PST)
X-Google-Original-Date: Fri, 04 Jan 2019 14:35:01 PST (-0800)
Subject: Re: [PATCH 3/7] dt-bindings: riscv: cpus: add E51 cores to the list
 of documented CPUs
In-Reply-To: <20181220210141.GA17198@bogus>
From: Palmer Dabbelt <palmer@sifive.com>
To: robh@kernel.org
Message-ID: <mhng-199961ff-1c6e-41f4-b7e4-66c1bbba15e3@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190104_144655_397129_DED3C05D 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, paul@pwsan.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 20 Dec 2018 13:01:41 PST (-0800), robh@kernel.org wrote:
> On Fri, Dec 14, 2018 at 09:21:50PM -0800, Paul Walmsley wrote:
>> Add compatible strings for the SiFive E51 family of CPU cores to the
>> RISC-V CPU compatible string documentation.  The E51 CPU core is
>> described in:
>>
>> https://static.dev.sifive.com/FU540-C000-v1.0.pdf
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Palmer Dabbelt <palmer@sifive.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-riscv@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
>> Signed-off-by: Paul Walmsley <paul@pwsan.com>
>> ---
>>  Documentation/devicetree/bindings/riscv/cpus.txt | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
>> index adf7b7af5dc3..fb9d4f86f41f 100644
>> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
>> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
>> @@ -68,8 +68,9 @@ described below.
>>          - compatible:
>>                  Usage: required
>>                  Value type: <stringlist>
>> -                Definition: must contain "riscv", may contain one of
>> -                            "sifive,rocket0"
>> +                Definition: must contain "riscv", may contain one or
>> +			    more of "sifive,rocket0", "sifive,e51",
>> +			    "sifive,e5"
>
> I can't really tell what are valid combinations from this. It reads that
> I could list every string here and that would be valid. It is basically
> 'riscv' plus any other combinations of strings.

I think that's actually the correct interpretation: if it's a RISC-V CPU then 
it must have "riscv" listed in compatible, but it can also be anything else.  
There's some concrete examples here (a "sifive,e51" is a type of "riscv"), but 
I don't think it's realistic to count on us being able to enumerate all RISC-V 
implementations here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
