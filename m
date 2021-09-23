Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6755EC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 12:05:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD1860EE7
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 12:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DD1860EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rygKhkU8ekyzAWFWddTIRoAjCLOTHrJ/VuNJkQN9nG8=; b=WePWVsaH3XQf+C
	J3wEsHQ2w8ozto8jia4AIgtN8fnHT/tRsPDzrVMlZzkK0mP2CZGYenTRNL9OOPMitNCXDbQPInwyc
	ZZ8RwPnNW3Fn66mY9nhvcO2I+BNUkQCtXwmzZpl0Deb3COtg7p0lgUhnwW08AFqDvUljA8rUqJ0QG
	aF46YXk8G6n0BOXgBjwLPwn99uOYIphHO37HkqTqhiNNSrLjAPLBvbTV/QethdxgMTh5muLBr5i+4
	i4tV33l0TykxjuCZMAcOhwtactv8MpPg5AMmsPNxnrWmAsm/Xw56Gg9dLL+5gkoP9xGDcffi6dXKG
	IH1X9yoKRbSpXsVfqyDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNU2-00BDX0-K5; Thu, 23 Sep 2021 12:05:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNTz-00BDVy-H4
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 12:05:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BA5D61250
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 12:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632398743;
 bh=Sj7Dgzd3HnFxGEbIJASFCGbiMmx0KyzlYpvgK/xgBew=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=i+VYDUeFD2tivbwhGzk8BxI4akTP3N2zEYmcYAARd5o8+mEN11O3pPb3nA6cuzdIP
 l2Efc9Cd4iC282ldMogs86+MGxis40AZu7kTVZhONDK2M7+jsQ0gOv+dh/aJP1DRGr
 vypIK10OrcWx9fMyWOdNLO+jgl7VJ+DSRqDn0xOuVLL47Qr2f5vha5TMfLxHlOAhkb
 Ze4kaJuTy4ydrZnzb7tle/pouUomuTL5sHIVAd/a4AySMrMt83MRh4p5bQn8zM6/zx
 2hCLD9xbIWZTYascVMxOXG7idgHhgoOHDA+R34LJX+a8ywFKCy43vRhjQ/6ULquaoi
 256nO7SOxM/Cg==
Received: by mail-vs1-f47.google.com with SMTP id f18so6277673vsp.2
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 05:05:43 -0700 (PDT)
X-Gm-Message-State: AOAM530G9UOAzPhvYSjl7TSfXo0OZv5ToIyrJrAVQvh/KD8o2WVmyDv7
 wMssDpSegh+OdI61cqwhcwnPtcTzRRc1kp1N//I=
X-Google-Smtp-Source: ABdhPJx8OKyPFON+wpQB9ZUDr4Oc12Wg+KDic4wk846BYfugGjm3VhH1VG/mZde8U/+MnVvRZ0DhTb7vAthIw2ZW+d0=
X-Received: by 2002:a67:f9da:: with SMTP id c26mr3568812vsq.50.1632398742315; 
 Thu, 23 Sep 2021 05:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210923072716.913826-1-guoren@kernel.org>
 <6d7b1668c1f562a5ef426bb2519f9784@mailhost.ics.forth.gr>
 <CAAhSdy0YDP3Nk8N9fnrKgS+3Rjt=5tLCh20upmUGK9SK67nNvg@mail.gmail.com>
 <0861cc74d3886e685e9aa5d13ddcd781@mailhost.ics.forth.gr>
 <16de95480d279b086cf0c612461e4235@mailhost.ics.forth.gr>
 <CAAeLtUDu0yaDBcuC06nX1WUQC9k4eNuWjvAFrpkP_h0nf5BZAw@mail.gmail.com>
 <88696248a0c19a5dff660354b837514d@mailhost.ics.forth.gr>
In-Reply-To: <88696248a0c19a5dff660354b837514d@mailhost.ics.forth.gr>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 23 Sep 2021 20:05:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTwSwgk4qUUEC3LuOGC4jpa9Vu7Pfww=RPAVza90hobOw@mail.gmail.com>
Message-ID: <CAJF2gTTwSwgk4qUUEC3LuOGC4jpa9Vu7Pfww=RPAVza90hobOw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add RISC-V svpbmt extension
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Anup Patel <anup@brainfault.org>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, 
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>, 
 Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>, 
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, 
 Bill Huffman <huffman@cadence.com>, Allen Baum <allen.baum@esperantotech.com>, 
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_050543_638456_447C4ED1 
X-CRM114-Status: GOOD (  14.57  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBTZXAgMjMsIDIwMjEgYXQgNjowOSBQTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiB3cm90ZToKPgo+IM6jz4TOuc+CIDIwMjEtMDktMjMgMTM6MDQsIFBoaWxpcHAg
VG9tc2ljaCDOrc6zz4HOsc+IzrU6Cj4gPgo+ID4gSG93IGlmIHdlIGV4cGFuZCB0aGlzIHRvIGEg
bW11IHN1Ym5vZGUgaW4gY3B1QHggYW5kIGFkZCBhIGJvb2xlYW5zIGZvcgo+ID4gYWRvcm5tZW50
cyBsaWtlIHN2bmFwb3QgYW5kIHN2cGJtdD8KPiA+IFRoZSBvbGRlciBtbXUtdHlwZSBjb3VsZCB0
aGVuIHRyZWF0ZWQgdG8gaW5kaWNhdGUgYSBtbXUgdy9vIGFueQo+ID4gYWRvcm5tZW50cyBzcGVj
aWZpZWQuICBJIGFtIGF3YXJlIHRoYXQgdGhpcyBnZW5lcmF0ZXMgYW4gYWRkaXRpb25hbAo+ID4g
cGFyc2luZy1wYXRoIHRoYXQgd2lsbCBiZSBtYWludGFpbmVkLCBidXQgaXQgd2lsbCBhbGxvdyBm
dXR1cmUKPiA+IHByb3BlcnRpZXMgdG8gYmUgZ3JvdXBlZC4KPiA+Cj4gPiBjcHVAMCB7Cj4gPiAu
Li4KPiA+IG1tdSB7Cj4gPiB0eXBlID0gInJpc2N2LHN2MzkiOwo+ID4gc3VwcG9ydHMtc3ZwYm10
Owo+ID4gfQo+ID4gLi4uCj4gPiB9Cj4KPiBJIHdhcyBhYm91dCB0byBwcm9wb3NlIHRoZSBzYW1l
IHRoaW5nLCB3ZSBjYW4gZG8gdGhpcyBub3cgd2l0aG91dAo+IGJyZWFraW5nIGJhY2t3YXJkcyBj
b21wYXRpYmlsaXR5LCB3ZSBkb24ndCByZWFsbHkgdXNlIG1tdS10eXBlIHByb3BlcnR5Cj4gYXQg
dGhpcyBwb2ludCwgd2UgYXJlIGVpdGhlciBzdjM5IG9yIG5vbW11LgoKSXQgc2hvdWxkIGJlIGFu
b3RoZXIgcGF0Y2guCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpNTDogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtY3NreS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
