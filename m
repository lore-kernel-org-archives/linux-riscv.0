Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05CBC43218
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 13:07:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72D0E20673
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 13:07:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SmocCtTq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAt+Ugq6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72D0E20673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SHDN/A9hOqBiJs6LHmbHqhaCq/Rb/Qg2QOU2EaklI4w=; b=SmocCtTqO6ra/o9aYtf7qD9RL
	cWGiagnzn8AxT60dcg2V5baBw8p2wYzaw5s9SSbEjZfVaWxSq4R3wFV3mI0+6sjg/1u4FNwuO3slh
	UHduH3CGbOVYGSsLW34V+lkaO7kDWxhcBgv2JjBnEqc+kaXe/Z6Sgj3+OOeCfZaM8A3Wb1I2QehFj
	fszW5uzkvE92OaDip7JGhjYBTEWVR6F9MTOdDa3dS1s98+Guz+ov6kBH+JulULXA9hivQilMfgV44
	GpQD/4rCFW1GDS6Vvis/V588EkZY4hYW7DMc0vbgtxV9b9psvty9pz1lWYaG9+5LQ7mJ7H8Cb4Zsz
	FmGpAEAug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hagV9-0001xy-Eu; Tue, 11 Jun 2019 13:07:47 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hagV5-0001wY-7L; Tue, 11 Jun 2019 13:07:45 +0000
Received: by mail-pl1-x641.google.com with SMTP id a93so5105911pla.7;
 Tue, 11 Jun 2019 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TR2jsLXLuKJzsRWAqZLBERMt4T32XKyN+tY7oRfNleI=;
 b=nAt+Ugq6jGDQK0SymQwKd3xpbk2GdnlJurj19UoyEM0TmKUTrJ4JpE2LoBkYEnxlTB
 YJNQXTvg6Evv9BBlKAk54NPras07mCWlJhU8Ghzd03qh2eLz3Cl3T9tvuy0q7ma1Cap1
 pD0zep2s+9jF15F9BKXq/Dm1q/OflWRkGa1D21zFfJZJTu2C7g+DX3riFbcD1FChjFON
 N9dGXcOni7cmh3OfdWDDNRGJKapyMgAKoLheqO/Inz8S+CUwy3Ia2spBSVcBllLFcKZw
 hAZd0Ks8kSvs094FDW/MW4wUU7vcSj81k50PGF0GOBSIDSXqkuMHn/F6NGK8o1ohXqYZ
 VTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TR2jsLXLuKJzsRWAqZLBERMt4T32XKyN+tY7oRfNleI=;
 b=D9HsqrdhNKuPqcICcIPQe9Unvy9zCClG3nWO3en7IhRMp4kDx4SujCMLty2PiU2Nv8
 3XPCp8L2iaN2Cbqc16G9E3OEPoIM9xX204EvxFGZkYIqH7OJkpmJL8JFgQPpISDuKWav
 2av2t9+eNLkP2R654sEHdtsRMhiGIKpxzD6ZboaVGL+8CBq+52Pot3kvHEw1K2fHmDju
 QDjYhstbxbKU+KM7E10ukSMmZGmlH910iKjZacZb3tLkXysLt3SC6ndBq4NsaXmkyNnL
 m76NZ2Um1cI7la8BnPMs1H9zojBxMM2o9xa3b2ey0L+pdeZx9BtT4JVcn2kxsloOhpzc
 gFDQ==
X-Gm-Message-State: APjAAAXX8C13SF6X6okFLK1LzuiEVCds9Rpv4VqDgO9vA3inOiGVdDmA
 yNkNGHRN3ttEoE4viw3m3Z0=
X-Google-Smtp-Source: APXvYqzDvUanWKNQFEmP3JE3hL2wEFYJdTHSqZFrqEzStqOSHDdhJITgiUevhXhq35ik1yQ8pCASsQ==
X-Received: by 2002:a17:902:9a42:: with SMTP id
 x2mr59510096plv.106.1560258462160; 
 Tue, 11 Jun 2019 06:07:42 -0700 (PDT)
Received: from [10.44.0.192] ([103.48.210.53])
 by smtp.gmail.com with ESMTPSA id q36sm4347237pgl.23.2019.06.11.06.07.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 06:07:41 -0700 (PDT)
From: Greg Ungerer <gregungerer00@gmail.com>
X-Google-Original-From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH 04/15] binfmt_flat: remove flat_old_ram_flag
To: Christoph Hellwig <hch@lst.de>
References: <20190610212015.9157-1-hch@lst.de>
 <20190610212015.9157-5-hch@lst.de>
 <b1ce6fc6-343c-7686-b4f4-35a305dc2adb@linux-m68k.org>
 <20190611073648.GA21522@lst.de>
Message-ID: <1aaf5ce2-1e7a-e818-fbeb-42fbe551a108@linux-m68k.org>
Date: Tue, 11 Jun 2019 23:07:36 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611073648.GA21522@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_060743_286033_6B735AD9 
X-CRM114-Status: GOOD (  16.66  )
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 11/6/19 5:36 pm, Christoph Hellwig wrote:
> On Tue, Jun 11, 2019 at 04:04:39PM +1000, Greg Ungerer wrote:
>>> index c0e4535dc1ec..18d82fd5f57c 100644
>>> --- a/fs/binfmt_flat.c
>>> +++ b/fs/binfmt_flat.c
>>> @@ -488,7 +488,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>    	 * fix up the flags for the older format,  there were all kinds
>>>    	 * of endian hacks,  this only works for the simple cases
>>>    	 */
>>> -	if (rev == OLD_FLAT_VERSION && flat_old_ram_flag(flags))
>>> +	if (IS_ENABLED(CONFIG_BINFMT_FLAT_OLD_ALWAYS_RAM) &&
>>> +	    rev == OLD_FLAT_VERSION)
>>
>> The flags are from the binary file header here, so this is going to lose
>> that check for most platforms (except h8300 where it would always have
>> been true).
> 
> Indeed.  The old code is:
> 
> 	if (rev == OLD_FLAT_VERSION && flat_old_ram_flag(flags))
> 		flags = FLAT_FLAG_RAM;
> 
> which for !h8300 evaluates to:
> 
> 	if (rev == OLD_FLAT_VERSION && flags)
> 		flags = FLAT_FLAG_RAM;
> 
> so basically if any flag was set it was turned into FLAT_FLAG_RAM.
> Was that really intentional?

Probably not, looking at the flags. For the compressed flag it
makes some sense. But I don't think many of the others need load
to RAM behavior.


>  I guess even if it wasn't the is no
> point in changing this historic behavior now.
> 
> So I guess what we could do it something like:
> 
> 	if (rev == OLD_FLAT_VERSION &&
> 	    (flags || IS_ENABLED(CONFIG_BINFMT_FLAT_OLD_ALWAYS_RAM)))
> 		flags = FLAT_FLAG_RAM;

Yeah, that to looks to preserve the old behavior.

Regards
Greg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
