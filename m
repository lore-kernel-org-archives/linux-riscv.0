Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695CFC48BE5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 04:07:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1153C61263
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 04:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1153C61263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sFT7vFFyFhB8ZnWhNVtpOorLRLIR3/gYyuuJdJjJ5jY=; b=x2xQkcg6AtvZMOZXwKC7nS04/y
	/jyFru9d2FpTmLsIHcC/0/Wcw7H9Lh/WOJMmQhUPTmgdlKl3wm6T6uTCLYMs4maA6uZu1Cc99hPjq
	x0T7cGDQ3sfA0twZa1qFtYP3v4LbPJ/9/Q8efhcpGo36FxDNHogpYrgDT7K13pn6zMpCS0LAk0FLh
	N1zFZT/USAD2yknGkJNUUpDi/re3iQgX/mV1r+JsXFbWHsfiAiGyRafJiSo5Em6r94r9gXH1tDUkd
	jvBlGQuBohs6gw78MxnEVI8HgX/cslDwfUJK1irvL8TMAGuurkZ/b7M2Ofxn6n1V3E+cKQb+v0rX9
	0uX/MEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lruth-007l5w-4a; Sat, 12 Jun 2021 04:05:25 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrute-007l5X-Va
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 04:05:24 +0000
Received: by mail-pf1-x42a.google.com with SMTP id q25so6048823pfh.7
 for <linux-riscv@lists.infradead.org>; Fri, 11 Jun 2021 21:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=auy0WVYl8Y45pHRqjvZyfXRrSFjA4yBO/RFaVXZLz/g=;
 b=sHMUbaOXb1CsM8eE4QdQCh1OapkMPGVKzu9b30RpoqXznGZfYxAiw+I2qUMxx76pv4
 lUfx+YQAuPkrf4cvZwIge0hYERKN138i0aNRdGRhHWnBoC4EADFUmla4Mr/wHgoemzPo
 g7w2f2nM97s+rdcSBRooWpxEslR3U7oOA1JWCotzkFOypygmCJhNSiVUrT9aXnDP/ICE
 pwmwthrsgE28WVrnc9ObGNuzLvtyELn9WYQB6um8W9X/mb9IUi/2JjH+4LCxmsV1DTU3
 arDtGPHdJXHaQ+MYCSwSINcGPZQQiyw1NtmCXR8/o5N/9pg1RVAldp6V038hJ7ptmmi9
 FrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=auy0WVYl8Y45pHRqjvZyfXRrSFjA4yBO/RFaVXZLz/g=;
 b=OxEfg5jfcBwH0wYTiHRbkT7Hx1ZTNVBACn2IDzzroQYB7WT30gTJIJgrvnIWjSBJvv
 nx3faOhbXB0bAn5zXyXQAaosIBnXK0TroLRci9FCJX7Xo0bJXBKrBdCyFKOQzfFHHju1
 9xC48YOrmtOYfolx0ng4rNeMrK7sl/589xPknjbtSQBKokWHt5UTHuPetVExYAGhknBC
 3C5PGX7XzfZJQdGfOG6k64rOJn9glhntj1r/e6Dqa9iDcZPsaPZ/Y4Ze2V/M+qLB2HNy
 3lgOuHLSE7rHjuZsybOeivkUjhg40wOuzPl5HTE8DW1s2JkvsbkFPhyTOOPM1xWUpvAJ
 zOBQ==
X-Gm-Message-State: AOAM532zwYX47n4/J4rinPW5A4RIJzQBu+CSGcG+gvK/EA24gV8dgn8S
 oIRBYS0civEwimHyf/XXISXvXA==
X-Google-Smtp-Source: ABdhPJwAIG7egTmxzBnoxI6V1ssds0EvLk83JhYrJor3EOEUtwQp3aaBDpd0Ttsb8onwfJ9Tzgoj2Q==
X-Received: by 2002:a62:76d1:0:b029:2e9:e128:2f89 with SMTP id
 r200-20020a6276d10000b02902e9e1282f89mr11181550pfc.59.1623470722189; 
 Fri, 11 Jun 2021 21:05:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v14sm6697211pgl.86.2021.06.11.21.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 21:05:21 -0700 (PDT)
Date: Fri, 11 Jun 2021 21:05:21 -0700 (PDT)
X-Google-Original-Date: Fri, 11 Jun 2021 21:05:19 PDT (-0700)
Subject: RE: [PATCH 1/1] riscv: prevent pipeline stall in
 __asm_to/copy_from_user
In-Reply-To: <67dab8dc517f4add8b0c29074a6b3f06@AcuMS.aculab.com>
CC: akira.tsukamoto@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, gary@garyguo.net, nickhu@andestech.com,
 nylon7@andestech.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: akira.tsukamoto@gmail.com, David.Laight@ACULAB.COM
Message-ID: <mhng-e4f1484c-052f-4981-83f9-3884ee4d5ea0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_210523_048204_F5D7756A 
X-CRM114-Status: GOOD (  22.52  )
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

On Tue, 08 Jun 2021 04:31:40 PDT (-0700), David.Laight@ACULAB.COM wrote:
> From: Akira Tsukamoto
>> Sent: 04 June 2021 10:57
>> 
>> Reducing pipeline stall of read after write (RAW).
>> 
>> These are the results from combination of the speedup with
>> Gary's misalign fix. Speeds up from 680Mbps to 900Mbps.
>> 
>> Before applying these two patches.
> 
> I think the changes should be in separate patches.
> Otherwise it is difficult to see what is relevant.
> It also looks as if there is a register rename.
> Maybe that should be a precursor patch?

Yes, and I'd also prefer the original patches.  This also doesn't apply.

> ...
> 
> I think this is the old main copy loop:
>>  1:
>> -    fixup REG_L, t2, (a1), 10f
>> -    fixup REG_S, t2, (a0), 10f
>> -    addi a1, a1, SZREG
>> -    addi a0, a0, SZREG
>> -    bltu a1, t1, 1b
> and this is the new one:
>>  3:
>> +    fixup REG_L a4,       0(a1), 10f
>> +    fixup REG_L a5,   SZREG(a1), 10f
>> +    fixup REG_L a6, 2*SZREG(a1), 10f
>> +    fixup REG_L a7, 3*SZREG(a1), 10f
>> +    fixup REG_L t0, 4*SZREG(a1), 10f
>> +    fixup REG_L t1, 5*SZREG(a1), 10f
>> +    fixup REG_L t2, 6*SZREG(a1), 10f
>> +    fixup REG_L t3, 7*SZREG(a1), 10f
>> +    fixup REG_S a4,       0(t5), 10f
>> +    fixup REG_S a5,   SZREG(t5), 10f
>> +    fixup REG_S a6, 2*SZREG(t5), 10f
>> +    fixup REG_S a7, 3*SZREG(t5), 10f
>> +    fixup REG_S t0, 4*SZREG(t5), 10f
>> +    fixup REG_S t1, 5*SZREG(t5), 10f
>> +    fixup REG_S t2, 6*SZREG(t5), 10f
>> +    fixup REG_S t3, 7*SZREG(t5), 10f
>> +    addi a1, a1, 8*SZREG
>> +    addi t5, t5, 8*SZREG
>> +    bltu a1, a3, 3b
> 
> I don't know the architecture, but unless there is a stunning
> pipeline delay for memory reads a simple interleaved copy
> may be fast enough.
> So something like:
> 	a = src[0];
> 	do {
> 		b = src[1];
> 		src += 2;
> 		dst[0] = a;
> 		dst += 2;
> 		a = src[0];
> 		dst[-1] = b;
> 	} while (src != src_end);
> 	dst[0] = a;
> 
> It is probably worth doing benchmarks of the copy loop
> in userspace.

I also don't know this microarchitecture, but this seems like a pretty 
wacky load-use delay.

Can we split out the misaligned handling fix to get that in sooner, 
that's likely the more urgent issue.

> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
