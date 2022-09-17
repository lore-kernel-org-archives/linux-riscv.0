Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D35CECAAD3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Sep 2022 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AMaq+g2C8IMnGlsabfokpZYTRrWI5C+KSsKPiC83npk=; b=lNXlPAf9BW30K7Mntj3C+Gnlj4
	ry9rE5orwz+Y/iPnHI1OLtsZJpVoCTAOypMLD6X/OncM6J68e7e65o58hOs3aJfNx+vaqIbPcDrdP
	R+QeJ0hH2N/Jhrftu3JLBBIyztB+CzitfsinmE8ftrfTYzCz90LvcZyEQQYouGNZvCXP79RJJYXsy
	GCr40+PUDCTAo1pYP8JRWu/KiNHu/RUYWoobyiMY9/TpsJ47i+5+IuEbOmsnA/WyNLMAjCoiHdkXP
	8jvgptFchyiaSoKEGkbACYcbO8RnFbo9g/ARjFx6lPVA1IFCw54B25qJsjaoxWBTML0RWYSvGNB+R
	81yO7QJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZZ0s-006Z5O-Rw; Sat, 17 Sep 2022 14:41:46 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZZ0p-006Z2A-4o
	for linux-riscv@lists.infradead.org; Sat, 17 Sep 2022 14:41:44 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 29so35355644edv.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Sep 2022 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=B7c48Z8IZiBzjAtTLrYPY8QrxbyK5DhJJQyC2Fi78rY=;
        b=DHKuitl1k5Dq4xohtm6Hc8tkHQviYn3xo84WZoWcPcUOwVw+q6v5AVFl1Qb5pDlLP6
         fsYfm8YFpC0KqcbZaG76v2X2w3GJ4Am4EfD+zBUIqKwc06SJlsWxhptRYSYBWixGzgiD
         7R7vnMI0OiQo6IqvEMkWpxIBoft4kWDWig6WjbFDaQWyfxSiZx8sd+8VM+gfmet+JiBX
         k67F/8pBSUQy9+wEQpdPseROfOvHXzIh78E9hy/QIIhT9Gmrgd/OHk/WiDEp2FPCu7uT
         8bqfbrjlNfvkkkd0kCm9z7wWmyfxExZmPmbbAgTRwvmkvb5Hi3fAv4SyUjQKRXz3r54e
         JrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=B7c48Z8IZiBzjAtTLrYPY8QrxbyK5DhJJQyC2Fi78rY=;
        b=HcMrtgMWnnIVTMqSysIFfBS3co3wIXzvEY2eCjDHStFHv74NQm4Jin3j9iabs2eTnD
         5kwkEWMkNwhxw9ni+OHhh021OrPdNwbKzLCnoRDxzv/xg5Zj+nYLyXEkHa7rMEoy1mUp
         Ygee8CP4+MuixZ6C/bpP0UGcQBgzntYVokxK1cESgsiJHY1S4Ru7F5smUjdt5gu6ZerY
         HKa6me+l2fAwRnG6CvQEIA0DNyvLM0iEoGCIUEWMA+RygFu6S9SGKi2Kv+swc6N7btyr
         KCK0z+Ssh93E7YS+6+FOTPzHwx8uuXpUd3UxeU536WmRv6epLT0cTsLXwQN16vYCcj7c
         4ipQ==
X-Gm-Message-State: ACrzQf3y3apfG/ypp38iX1OfOf9cGv+89fZhkELVoijDSmyZ6TGN18LI
	LWcRQLfGAoSxd/zaiW0vLc0b2Nnltn/LwpJ2Yok=
X-Google-Smtp-Source: AMsMyM4d1Aka8XgJxz0Zktp0Q3125bi/VgZwK3Dgx/cFNzeiVEtBEZ/yc+ZnRFbfRjJ0z9eItt9YdA==
X-Received: by 2002:aa7:cb18:0:b0:452:9071:aff with SMTP id s24-20020aa7cb18000000b0045290710affmr7909086edt.194.1663425695017;
        Sat, 17 Sep 2022 07:41:35 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
        by smtp.gmail.com with ESMTPSA id y9-20020a1709064b0900b0073d218af237sm12114436eju.216.2022.09.17.07.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 07:41:34 -0700 (PDT)
Date: Sat, 17 Sep 2022 07:41:34 -0700 (PDT)
X-Google-Original-Date: Sat, 17 Sep 2022 04:30:08 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Avoid coupling the T-Head CMOs and Zicbom
In-Reply-To: <4d7ab3d1-72cc-f1cf-15bf-50bbb64837da@microchip.com>
CC: linux-riscv@lists.infradead.org, stable@vger.kernel.org, lkp@intel.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-85fb2ed5-046c-4fd3-a703-b417bff95c57@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_074143_396674_019D2EC0 
X-CRM114-Status: GOOD (  14.01  )
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

On Fri, 16 Sep 2022 05:22:59 PDT (-0700), Conor.Dooley@microchip.com wrote:
> On 15/09/2022 18:13, Conor Dooley wrote:
>> On 15/09/2022 18:09, Palmer Dabbelt wrote:
>>> We could make the T-Head CMOs depend on a new-enough assembler to have
>>> Zicbom, but it's not strictly necessary because the T-Head CMOs
>>> circumvent the assembler.
>>>
>>> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
>>> Cc: stable@vger.kernel.org
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-by: Conor Dooley <conor.dooley@microchip.com>
>> 
>> I build-tested this last night when I accidentally found it so:
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> This is the one you I noticed you missed, msg-id is:
> 4d943291-f78f-31ed-0d67-7073e1f762e2@microchip.com

Sorry about that, the scripts to search for a Reviewed-by weren't 
handling the base64 encoding that Exchange was doing.  It should be 
fixed, at least it is for the test merge I just made.

> 
>> 
>>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>> ---
>>>   arch/riscv/include/asm/cacheflush.h | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
>>> index a89c005b4bbf..273ece6b622f 100644
>>> --- a/arch/riscv/include/asm/cacheflush.h
>>> +++ b/arch/riscv/include/asm/cacheflush.h
>>> @@ -42,8 +42,12 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>>>   
>>>   #endif /* CONFIG_SMP */
>>>   
>>> -#ifdef CONFIG_RISCV_ISA_ZICBOM
>>> +/*
>>> + * The T-Head CMO errata internally probe the CBOM block size, but otherwise
>>> + * don't depend on Zicbom.
>>> + */
>>>   extern unsigned int riscv_cbom_block_size;
>>> +#ifdef CONFIG_RISCV_ISA_ZICBOM
>>>   void riscv_init_cbom_blocksize(void);
>>>   #else
>>>   static inline void riscv_init_cbom_blocksize(void) { }
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
