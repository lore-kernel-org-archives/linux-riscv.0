Return-Path: <SRS0=JPO6=RN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D49C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 10 Mar 2019 18:50:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11785206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 10 Mar 2019 18:50:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r1qdH/ot"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11785206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bB0HE6ZFyus9eTvmxS216x8Zmy3ge43NWjcNMYFKr8I=; b=r1qdH/otjmjBJngs8McNZnO9aE
	TBi6Cvg+0DSfuVSehKV4LaqtsZeaWY1hR84hGIqbbSWO0+Xrka/xHNhL6hNy7WYeMSRUEbXVlwu/M
	RH2+3rznCKkezywLvNPMJAl7Oj2/LXvsYgaTjTKTUSAI7MERvum2VT5WAqgZrFE3U+Me0CBCblWsZ
	hzelQfkRp/Rvi3qUmlELTpePNK8z/O3AVnzrFnzJyj7UzdvX6aIdoiWpU+aHbgl0XLqA7/JoATiXI
	Vawohe88FS5g+cecFPyajTwnKCpn1ACc8PbOcYstObyWLAhMIr6SKBzW+eBkT691GoZVrGGntjEKP
	hNBYWshA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h33X1-0006sD-Uz; Sun, 10 Mar 2019 18:50:43 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h33Wy-0006rj-Hz
 for linux-riscv@lists.infradead.org; Sun, 10 Mar 2019 18:50:42 +0000
Received: from [192.168.1.110] ([95.118.75.201]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MmlbE-1gcHHN1ijO-00jq0d; Sun, 10 Mar 2019 19:50:23 +0100
Subject: Re: Debian build polishing
To: Theodore Ts'o <tytso@mit.edu>,
 "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com,
 michal.lkml@markovi.net, apw@canonical.com, joe@perches.com,
 linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org
References: <1552049064-32044-1-git-send-email-info@metux.net>
 <20190308175703.GA7178@lambda>
 <fe53cd84-5953-786a-3a4f-6eac652a1cdd@metux.net>
 <20190308215724.GA22319@mit.edu>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <341b78ca-9901-78f0-f404-59194f3da503@metux.net>
Date: Sun, 10 Mar 2019 19:50:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190308215724.GA22319@mit.edu>
Content-Language: en-US
X-Provags-ID: V03:K1:EXEO90gebp7GRFtaKUhcA3Tn43Jia/LepSm/l7xrUkStWAqouv2
 jgluwvjgu+P4piPRPETEvS/6qdVD9CUGzaBc5jJ1WE02y+n4rTuGWXM6+VAaQWBHkRrAPHj
 0jPp/Iq0qs5brj7kNQNOI/BbUKUGerHjZJeFsS/xXU0GINO3mQUJwsaH+ImE4bTFh9/kWVO
 rFDaYL0Ppwc5shzeA7SPw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VAfFX1BIva8=:IQsHEI6mgAjXWG9YpdPpDf
 zpUUozFUyL3pJOkbmMNYtxPt/F0lYkDiu1404pzHWqdpZSBq2pyByHmAOfmCOIYsouWZ3pR1F
 L5/3G7Lf9qxbalfNUzTPWl/vXCqfKqebCD/QkZZf5pboQJLNHhbu1jAcjo9Wm8B3q3HznXtZl
 HR8eorDalVpYVW3N+Gfx7A9/I6uxe6eWHkZFbdG+PpFGeJ3aJBCUXnT9of0r/+k9HDKZdprPK
 BFKAawyTAkUFCF1ZtQ6svmXJj8bLKajmtUMd0wV68+kxcRBCJcD3+DMcjI+8EfZVf2WrpWebO
 EKfZd6Y2SEOHQM//n8vorZRPtyvtqsxZNgmSfZNNHQ/mL44OWM2lMdRHAoqtzx43a1Y7gz2fx
 Fw9yH1f77WgICAO0Xdquc7JnK33/H2mtjavsewnDcIZBYeU1FTVhgo6X+lbJpUSei69U0YUuu
 DpcygZ+C3ZwBnSvypk0NCJatJblABKkrB3IipcPvHTBpKzRLFp/CvlrYgsBdTPaKDykV01b86
 ieFpLi8FfqXIvm1dLAbHrwR/rzGg8qceD72Ay5lxC82p+LRycNVU00lmOIy8IL8R+miiShoga
 TuzKu6l17pybs5MaR2pG3GEr1XUWDlFzz5fctoLQCuz0k/dgo1Rn6hTSkuEzVJ43SplGmlmdI
 9qT67TnNYbX5fGEdcQ5z+tcq5yOXTYEyE4PN0a4bQyYPZbLxydIznxhbmRc4hw41hukC7KqSN
 YTESv3j7ARHGaooO4oF1IemduJAREPilePqa71KSF8kxf+lDeyIU/GfVXzY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190310_115040_895244_92F7A01B 
X-CRM114-Status: GOOD (  10.38  )
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

On 08.03.19 22:57, Theodore Ts'o wrote:

> The full debian directory lands in the O= directory.  So presumably
> you could make it work for use case if there was a "make O=/build/dir
> debian-prepare" which copies the necessary debian/ files into the
> build directory and then someone could cd into /build/dir and run
> "dpkg-buildpackage"?

Didn't touch these rules at all, so it should still work as it used to.

I thought about changing the old deb rules to just call the new
debian/rules file, but haven't done so yet.

Maybe you could find some time to test whether my approach also
works for you ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
