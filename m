Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE55DEB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 19:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=smDsk9xRG3Ewv1wM9PyJ2ZTgoHBOzH2DdxnqCVM+Tmg=; b=JuDwCFoAGo5/V6
	Wr/u4R1TBkxqYzpLodn8ptRCShpKGg7Hc1g2EW6fD4umYFCppWBcDQQhy8tqMVEZwA+PHr2oroAbc
	aPspHDNSGy5mG/RIjgmKeKOtwN82C4XwdnxkFlRq6tL9hpGIhN/Hs3PLxaADoBK0BLfMx1dcDOalX
	r5Y13rb9/XNGCKoWDbSSdMXMIQnmzvy769NSBV4A8CkL73gENWcRMckMahaNbQ+ijIQbbBSHmtZdZ
	iL70sLKHm3s6q8Kzy0WWRxalr3PujQjuMZxFX6ELrwwGJpRDAVkKL6O92k7dCdXP6ZoOepe0gys1D
	EY0QqWgdvI3VAbl8JcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC3md-00FaUt-0a;
	Wed, 21 Jun 2023 19:46:27 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC3mZ-00FaTu-31
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 19:46:25 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-543cc9541feso3503723a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 12:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687376782; x=1689968782;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yAEYX8p4xEPzztgSX6jBgXp6p/Xb2RUIX5fAtspxlsk=;
        b=O+py1+Rpcwp6w+AR4wey7NcLDxvddKtqNBonT+E2kowjbpXM93WK2d43d5Lo5eadvb
         i1DD8KpxveaNKlUarBlGyvv63EeTdAtgxwo23u1pgyTF7sMO2mlwVF04KbyxzEbx2IBq
         SVO7gg7973NHQ5PTrGDCCXBdnKUOJiIhuf0NTRX3jPr5EEE369JzQbXVvqwODDHVK80h
         H5vDaJf2v9Gcr8imIk5JdCHcKtI0UlFmWGXHvOMXroAd/7QvwD7ulLCMX3q7tP2dskCM
         GDPPpffLk6SXcGT+pZT3hWOQu6LHlBrT6Gd4QG7Dye4iUkxqC2t1+iztrMudIflP44WK
         oUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687376782; x=1689968782;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAEYX8p4xEPzztgSX6jBgXp6p/Xb2RUIX5fAtspxlsk=;
        b=aDEnNgJylptgAk+VHeM+72CH6MD5/KnfQ3zfJPPTaYCx4GpLCBqAm4PFrocr31ca5c
         c2vEmpzXZucbi4J+IKgukkvdjeBH9sc+SVM5XPgNOTbMLXxu3wl7y1XLFelLsAnfb8bS
         Nzynq63+tH6NPro8KfY0qL9zXZFt4rV1I4i+3sPSO5sKk6TPrI32QECFrkn9iMm4QdAk
         Tp0iNlk89jRd5oq7auGRyXgfHz4NzTYonmNTaMz/RksgsM+NEmumrD5AZJBuF68Zr7ap
         Z9uxiYEIcuFanxoI3+70izEtnbhQ7RHftZwm+bNbE5RfnkVnM/xu0aeQzwIEL8CtPrbd
         WLCg==
X-Gm-Message-State: AC+VfDyiLB+VZaF7BZ13+FamYebnNX6qt8/pS/zk3AsVLnfgI7HO5f+X
	ygj/sf+t2ZthQ6xzi5s80ClXNw==
X-Google-Smtp-Source: ACHHUZ7++iionK3i1+rBjCBOM2BOzaovcT/5zgI9IHyrmKGBJktrKL9rdXh969Ib7fB+ucArnYBWvQ==
X-Received: by 2002:a05:6a20:13d9:b0:123:89f0:ec6b with SMTP id ho25-20020a056a2013d900b0012389f0ec6bmr1062014pzc.47.1687376782376;
        Wed, 21 Jun 2023 12:46:22 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id fe15-20020a056a002f0f00b006687f6727e1sm3222011pfb.206.2023.06.21.12.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 12:46:21 -0700 (PDT)
Date: Wed, 21 Jun 2023 12:46:21 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 12:45:41 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <mhng-1d790a82-44ad-4b9c-bfe4-6303f09b0705@palmer-ri-x1c9a>
CC: bjorn@kernel.org, Conor Dooley <conor@kernel.org>, jszhang@kernel.org,
  llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com, nathan@kernel.org
Message-ID: <mhng-ad2d02fa-2d4d-4bf1-ab2a-fd84fa4bcb40@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_124624_187787_37CCEB08 
X-CRM114-Status: GOOD (  18.14  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1298054329718760124=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1298054329718760124==
Content-Type: text/plain

On Wed, 21 Jun 2023 11:19:31 PDT (-0700), Palmer Dabbelt wrote:
> On Wed, 21 Jun 2023 10:51:15 PDT (-0700), bjorn@kernel.org wrote:
>> Conor Dooley <conor@kernel.org> writes:
>>
>> [...]
>>
>>>> So I'm no longer actually sure there's a hang, just something slow.
>>>> That's even more of a grey area, but I think it's sane to call a 1-hour
>>>> link time a regression -- unless it's expected that this is just very
>>>> slow to link?
>>>
>>> I dunno, if it was only a thing for allyesconfig, then whatever - but
>>> it's gonna significantly increase build times for any large kernels if LLD
>>> is this much slower than LD. Regression in my book.
>>>
>>> I'm gonna go and experiment with mixed toolchain builds, I'll report
>>> back..
>>
>> I took palmer/for-next (1bd2963b2175 ("Merge patch series "riscv: enable
>> HAVE_LD_DEAD_CODE_DATA_ELIMINATION"")) for a tuxmake build with llvm-16:
>>
>>   | ~/src/tuxmake/run -v --wrapper ccache --target-arch riscv \
>>   |     --toolchain=llvm-16 --runtime docker --directory . -k \
>>   |     allyesconfig
>>
>> Took forever, but passed after 2.5h.
>
> Thanks.  I just re-ran mine 17/trunk LLD under time (rather that just
> checking top sometimes), it's at 1.5h but even that seems quite long.
>
> I guess this is sort of up to the LLVM folks: if it's expected that DCE
> takes a very long time to link then I'm not opposed to allowing it, but
> if this is probably a bug in LLD then it seems best to turn it off until
> we sort things out over there.
>
> I think maybe Nick or Nathan is the best bet to know?

Looks like it's about 2h for me.  I'm going to drop these from my 
staging tree in the interest of making progress on other stuff, but if 
this is just expected behavior them I'm OK taking them (though that's 
too much compute for me to test regularly):

$ time ../../../../llvm/install/bin/ld.lld -melf64lriscv -z noexecstack -r -o vmlinux.o --whole-archive vmlinux.a --no-whole-archive --start-group ./drivers/firmware/efi/libstub/lib.a --end-group                                                                                                                                    

real    111m50.678s
user    111m18.739s
sys     1m13.147s

>> CONFIG_CC_VERSION_TEXT="Debian clang version 16.0.6 (++20230610113307+7cbf1a259152-1~exp1~20230610233402.106)"
>>
>>
>> Björn


--===============1298054329718760124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1298054329718760124==--
