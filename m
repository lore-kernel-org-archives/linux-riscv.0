Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856F7C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 04:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXHUcTLfV1JQ1g34LEXh1lYjXFngYC9gMkRVcXmR7a8=; b=NqLmMHKHfMtYW2
	OgdIIulUkBin+72EBebjbio0q4cnM7NfSmE7pgUfioyBbYZ4R5nrhtbpjylFAvc/cPSilk4m8o/GE
	OKaNZH9l5+rhWW9byX7/o2H3g9y0RNWAfAjJPdoTWT1lpt9zVQ9+SjEgOCPspooi3+O+FnO7TwHoN
	Tp1CurNF1MAJqNFDYTodCkwrufg81ewn/A8JK2m4y0gpH6v4TkCSWvfkdNYAVxnobtFoPpWMhZfur
	xBL0yQgbD5jUeUyA0XEGReNGeLBR1YHam2PMko0VO+/Qa3ow+phxSZYnRSVIkKnIcC/ujG7tD18Xn
	s60QHcfnvjQ64Wmj73qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPE6A-0000000C6W6-0faV;
	Thu, 04 Jul 2024 04:29:34 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPE67-0000000C6Vc-17ht
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 04:29:32 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-38362117f6eso129185ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 21:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1720067369; x=1720672169; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/x8uqtBWEOzlRCQu86kjjAnrFAC8DqXpnxLOvgdulDI=;
        b=Kl2je5SfCYZUX/DbVOTbM4mRDgKvHzqSlBsyGPbvnHaK1phiScJug+v4gF1MGCwVwd
         7cyT3N3PDcBD9RvgV9spqJZrXRt+CixOGuz5wAWORvqXC2waNjcrDb85Pa34y5eBLxBX
         EkfxuUv8K3oHvYdb4aLK6Ga1YiMZOYvf5/9Z7REC6jSDUvEBRMMCUdkzTBDHp1YXjxmz
         CFi7nYJvVjiiDom8WAjZYG/0KFy7UghWLeEFmWVTBjmqnBwHkC2DmUbdYs+0Peph8dlY
         RHn9Bj/4NOiPiuoL+A9facdYL5fRLJrRCzRiBkeuiriHb+g71PJmHMbzEYfPfS2moTov
         PJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720067369; x=1720672169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/x8uqtBWEOzlRCQu86kjjAnrFAC8DqXpnxLOvgdulDI=;
        b=NUq/Q8kMmrO7WQZpwmdBs2VBw71xy6hePnWDvTBKLu8z/zTMVJJB3GX90UjqgjpLCn
         cFNl34k3aBqpTuUtVfS9WvTR6nFIhVCkwoNsw10cLmDVFY/5zLlCaUqba5TtpZPtylne
         Dj31C06jt/votrishHM9j5XWkvufmy8OYtrvFZIyCZgGnRMZpIfo8KzOA2fgk3gPcWfa
         Pco4Lpv7h2nJCm9mEYsN6JTuqLbaq8Hev6m+roXinxRS9EQweKvO/L6Y/g7XrhvfUXsi
         rYTmcuFG//GetYaq0fimFkB6Wyb7OtqKfLp2D4yt6YNYVmlFmWNTpGcxGnCw9Wm++vx6
         IpHA==
X-Forwarded-Encrypted: i=1; AJvYcCVEQ43KpEO/SZvmVppW00LCW06KMi0asXluSzTr6tx2X0Kkfos6epvrCY+ZzKSIkWfV4T9VkLqERWKWGo1gkZd6NntcKaLJkGhguMw3tnQH
X-Gm-Message-State: AOJu0YzxC5s2PgCOMeIYCPMY+mBpN75iVTBs5Ul31792pcgmGDn0c4zP
	ZVrGZyIGga+8wl5XoCWIJUTkflQruKQl3DWjtJN8f4j14jmtrlHYmbSfTcrBLQ==
X-Google-Smtp-Source: AGHT+IHktRWVslmmx7Xk3Q69c9B87Qql/AEyNyH9YU/soO+uZ55IsjIvet+79ZawprWgeW5wyoS5IA==
X-Received: by 2002:a05:6e02:13a9:b0:381:c5f0:20d5 with SMTP id e9e14a558f8ab-383953e23c4mr9787485ab.0.1720067369370;
        Wed, 03 Jul 2024 21:29:29 -0700 (PDT)
Received: from [192.168.86.39] (121-45-188-148.tpgi.com.au. [121.45.188.148])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6abbcc26sm7527085a12.38.2024.07.03.21.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 21:29:29 -0700 (PDT)
Message-ID: <23ce05ba-105d-480f-968a-1ecc2e482634@tenstorrent.com>
Date: Thu, 4 Jul 2024 14:29:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: vdso: do not strip debugging info for vdso.so.dbg
To: duchangbin <changbin.du@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240611040947.3024710-1-changbin.du@huawei.com>
 <ef2b1430475140c88a929b1678338726@huawei.com>
Content-Language: en-US
From: Cyril Bur <cyrilbur@tenstorrent.com>
In-Reply-To: <ef2b1430475140c88a929b1678338726@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_212931_352251_6BBB8043 
X-CRM114-Status: GOOD (  14.12  )
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



On 4/7/2024 11:57 am, duchangbin wrote:
> Hello,
> Is there any problem with this change? Ping~
> 
> On Tue, Jun 11, 2024 at 12:09:47PM +0800, Changbin Du wrote:
>> The vdso.so.dbg is a debug version of vdso and could be used for debugging
>> purpose. For example, perf-annotate requires debugging info to show source
>> lines. So let's keep its debugging info.
>>
>> Signed-off-by: Changbin Du <changbin.du@huawei.com>

Looks good to me

Reviewed-by: Cyril Bur <cyrilbur@tenstorrent.com>
>> ---
>>   arch/riscv/kernel/vdso/Makefile | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
>> index f7ef8ad9b550..960feb1526ca 100644
>> --- a/arch/riscv/kernel/vdso/Makefile
>> +++ b/arch/riscv/kernel/vdso/Makefile
>> @@ -45,7 +45,7 @@ $(obj)/vdso.o: $(obj)/vdso.so
>>   # link rule for the .so file, .lds has to be first
>>   $(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
>>   	$(call if_changed,vdsold)
>> -LDFLAGS_vdso.so.dbg = -shared -S -soname=linux-vdso.so.1 \
>> +LDFLAGS_vdso.so.dbg = -shared -soname=linux-vdso.so.1 \
>>   	--build-id=sha1 --hash-style=both --eh-frame-hdr
>>   
>>   # strip rule for the .so file
>> -- 
>> 2.34.1
>>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
