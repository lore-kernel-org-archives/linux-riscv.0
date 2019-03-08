Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F054C10F09
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 21:10:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED2C20855
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 21:10:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S2YEu0ZB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ED2C20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SCPmlzOzhc8kNVp5AFMae0G1TMF7PAzhza8x713tdA0=; b=S2YEu0ZBpDtUOSPctT+6cCy7fx
	55QF7aDT+na51WqsiTh9DEb9pktwcl3B/1li0nYFHnYnv+zjtrHdP+ZeSLMOLji6XQ/l+C08q3HLC
	xVYQAFAaz8TVdWUuTMfuiyqweJUYtxGPrFYYQKul+7q41zDovOBqBCOdbM6LpI64lPj0pGRKqovR2
	fOoBgPQPywTqNpJRrDf6ALnZFfPW0IgGsU12b0U9YINhzkJEZEHU1foKxji9+2TRKSqJJzzIF7iKC
	BfdzUnrt8FnoLoUc+nvHtupYK/86m5xLOveMLjaEXFutP/LohvpsQ+yJad4lqvUga+bn7E6wPjAge
	Clb2kb8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2MlM-0003jt-1b; Fri, 08 Mar 2019 21:10:40 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2MlJ-0003iv-PB
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 21:10:39 +0000
Received: from [192.168.1.110] ([95.117.97.241]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MUGmJ-1hSSDN38p1-00RKt3; Fri, 08 Mar 2019 22:10:22 +0100
Subject: Re: Debian build polishing
To: Theodore Ts'o <tytso@mit.edu>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com,
 michal.lkml@markovi.net, apw@canonical.com, joe@perches.com,
 linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org
References: <1552049064-32044-1-git-send-email-info@metux.net>
 <20190308175703.GA7178@lambda>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <fe53cd84-5953-786a-3a4f-6eac652a1cdd@metux.net>
Date: Fri, 8 Mar 2019 22:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190308175703.GA7178@lambda>
Content-Language: en-US
X-Provags-ID: V03:K1:3PmkOyG6x/QQ8jBy7+rUN/zFUMrd1+8/SGCKfaNgpnEqF0QY1Yq
 kdT4zLl7Hajp/VMYG9pj+GyQCMPhKKjSa5x1s4MTzL/QmMMe+4QaeRXILdHuRGY9+et6+qp
 HxWhZN5UQHkHpVdvUsIwURT1Vwwqr9kVOEb3wKq+7+80QsECpQMs1kPcYkXK1ddjjl4AlEi
 LeFGbyyRzNRvViX8g47+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:k1/nOnkA0zQ=:EOzz3SvJKSI/o9mRfWIb/8
 BD5jiEtAKecdN9Vv4vDPSDCvQC32lj1IBnsi81diCLmWthfMTRzZwlbt/Fdak0NL32wgfnZEA
 6Qackka/zPsoyQgh6DO3I3pEYbAVb+F08/PnHBEsgu/VL3Iy3be8ggFv+IniY76qcNCkltfu1
 QBEDS+YlzeZZcDzRe8+nMxWulFA03MKs8BrN9CCEBssm/kmHruL1ZWo2hd1g602bxY8x08CBa
 5yKYKrw5okkp5ePICTTH/OiQnscXBgxn//09qs0a4uKtiixv9GiPFYB/cPYI9mGLS8dxNYu7b
 BrhT4hlauTslRVq6lef4KPUny/3J13CVA/pyvRNSSxzQGiWy98S7TLdTCjl4fSk2Iz0LTV4h9
 hde1CteuahXeBMIHNf6MEkqjo6E0e7bkaA16Nwbzq+CaY2wHBwQBDnwKUKch78s+UcArBq208
 acIKm4lc7x1WKaq2EG1lh8SmcBNocg7ArIVlHTKo1lnYsFI2Mz1O/nFo9isJvMjWsHMtzjqWD
 qoWoDEwKCHuZEsIGzYrUJspDQGqTLI/P9p/sveQmd0grcLaB869pv6NBUalNxtGrqj/MBkHfZ
 1tcSZg1SnkY/Vr2zuUNFGBrRm2VJls22ZYs7cqWt8tOM1tTsEO4y4gqXrlGsLUF5v4Rv9f3a4
 WGM+4wGkdhzghZ+RUngSkey6Ux2lsZo1pTuuTW4dQ9EDFDpZrviOk6J/ae+VQicN1/4AT/Ev9
 Gy7p8qNrqkz96TVBfmRiO960TUoPs9q3ul3GEHTSb5u3/XtiRiNQo11oNcU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_131038_123501_AD9AEBE8 
X-CRM114-Status: GOOD (  13.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 08.03.19 18:57, Theodore Ts'o wrote:
> On Fri, Mar 08, 2019 at 01:44:19PM +0100, Enrico Weigelt, metux IT consult wrote:
>> One point still puzzling me: once the debian/rules is applied and
>> somebody calls `make deb-pkg`, he'll end up w/ unclean tree, as
>> now a git-tracked file is changed.
> 
> This is not something I've noticed, but I build my Debian packages
> like this:
> 
> make O=/build/linux-build bindeb-pkg

This doesn't work for my environment:

The requirement is that every debian source tree has a ./debian/rules
file (w/ the standard rules like binary, clean, ...). This is called by
upper level build machinery (git-buildpackage, dpkg-buildpackage, ...)

The idea behind is building all packages exactly the same way - one
standard workflow, that just takes a source tree (from git) and spits
out some .deb files.

> So I really hope your patches don't break this.  

It shouldn't (at least I dont intend to). Haven't tried where exactly
the generated debian/rules file lands in your case.

> Also, are there any changes the performance of building the Debian
> packages before and after your changes?  And are there any differences 
> in the packages in terms of any pre-or-post install/removal scripts?

I don't think so. In essence I just replace the generated rules file by
a fixed one. Okay, it will take *a little* bit longer, as the rules file
now calls `make kernelarch`, `make kernelrelease` and `make
kernellocalversion`, before starting actual build. But that shouldn't be
the big deal, IMHO.

> There are a lot of things I really dislike about the "official" Debian
> kernel build processes (they're optimzied for distribution release
> engineers, not kernel developers), 

I try to bring these two world a bit closer together.

> so I'm really hoping that making
> things more like the "official Debian way" doesn't break some of the
> things I really like about the existing "make bindeb-pkg" build
> system.

I intend not to.

Actually, the official Debian way for Kernel build is entirely
different, and that's really complicated and hard to really understand
(that's why I'm  doing this here).

But here I'm just coping w/ the first entry point into the build
process, which now becomes `./debian/rules binary` instead of
`make bindeb-pkg`. The final result (in the .deb files) should be
the time (unless I did something wrong).


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
