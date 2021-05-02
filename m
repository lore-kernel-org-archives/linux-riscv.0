Return-Path: <SRS0=OIoX=J5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270A9C433ED
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 22:32:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69FDC61244
	for <linux-riscv@archiver.kernel.org>; Sun,  2 May 2021 22:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69FDC61244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=thDVam/qpRN2Ny7IqTILqOvV77+OUDgwGxZR7DLjM68=; b=eocPCPzhXXRFiUPC3ESP1zEhy
	ArVXQ4I0iQoxExnxQR7GMkFjx4HQ6B7gTNiXwZ2Y9j30wO8fLCSRbgUkKQRBSy7gzy0eZ8AKTJMNm
	MzSQI/2lguC3bqrZI3MXTS+dQn4ma5JJJCmH18Gdxoae2VkmQ6sS/91ZXfwHMPkVyTeoYjyAr3C7R
	ZJwNmJZiFFEneBEpIy6QVHcU+JLcFOFtrUOdeBIcg1bziXpVzYvFEQC+XJzTO58Iploqsnz7br9R4
	7mJZ/EldyKVoH0cNAj7q2LqlFPVnwx1lSsRAVMnurdcbTgxhgMFgWBgE1GehXwsk/qn7tlgLqVwk/
	Poc45KdeQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldKcP-00CcoF-Jd; Sun, 02 May 2021 22:31:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldKbs-00Ccmn-7z; Sun, 02 May 2021 22:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=sxg9T1l2P1TCAt0KGvVd11DgxmUSs0be5EJPC9/f71E=; b=udzO03mH7WI7B+E+YTdUOwtAf1
 pjHtqAcqFvgk6A/VPnylKxmrsD2lIsft1hfQrFKrFeNBtjNS6w+ZE+mHiu5d5gHPflr/5ZEY0rMY3
 j/Vp83jF/iLnG6XdNPzIyF+mF5/lYl4l1cbzzG1WNvagPbMrY6WOJxtjqyegDj+NUVKUcLudh1Jxj
 aIs6ARBcGAieZGWtA+1xInBrNjRM1WzTAXphw3z434iaMpsXozUAAxgXsgOVhK/ROYowwzYtHNMjt
 qTvAIs7sHWprczN8zI56TNESOK3PApv5dUV0ZiJ8bjyK89wcLViH+1YjrBh3jVl2hZIW2BIswvKuA
 GSIUL4Rg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1ldKbH-00EKpr-87; Sun, 02 May 2021 22:30:19 +0000
Date: Sun, 2 May 2021 23:30:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Segher Boessenkool <segher@kernel.crashing.org>,
 Joe Perches <joe@perches.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210502223007.GZ1847222@casper.infradead.org>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, May 02, 2021 at 02:08:31PM -0700, Linus Torvalds wrote:
> What is relevant is what version of gcc various distributions actually
> have reasonably easily available, and how old and relevant the
> distributions are. We did decide that (just as an example) RHEL 7 was
> too old to worry about when we updated the gcc version requirement
> last time.
> 
> Last year, Arnd and Kirill (maybe others were involved too) made a
> list of distros and older gcc versions. But I don't think anybody
> actually _maintains_ such a list. It would be perhaps interesting to
> have some way to check what compiler versions are being offered by
> different distros.

fwiw, Debian 9 aka Stretch released June 2017 had gcc 6.3
Debian 10 aka Buster released June 2019 had gcc 7.4 *and* 8.3.
Debian 8 aka Jessie had gcc-4.8.4 and gcc-4.9.2.

So do we care about people who haven't bothered to upgrade userspace
since 2017?  If so, we can't go past 4.9.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
