Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3346CC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 16:56:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4ABB613C0
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 16:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4ABB613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sryUG7hIgF2XnVy/1q+62Pxo8diCJWjvKiiGr0p0L50=; b=YvE+4VKJdNEqS7q9U/a/4LUhN
	l41Zl/5V456qXD/yqRH75tBqT71mkwvKFSg/xvVDU9FbnUwYQxLhFA0fchuuvx50c8P4kEBoNcVQ6
	4+trQmjn8838oFpzcODfJuxUNBFjdwVt02JlkrBIU0XxZlJuia+ayzZ4UDGdVcPSeU2hpa0oF1LjJ
	78hebJompC/5+sX3zzDsM0o4mHo9cKUMvfBFSc7IYi8vFuof3Yk0v4E1TmXNxqyUpD9pWkatZ32XI
	QnpVPJWHRFyZDvfGF8hFOsei3HSy68+fy/qRQNoWWUxOSAE/eX7qABX7Co0lgIUw72Ut8TTFQ/u9T
	yQtEdMAjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTp04-0033D2-Ru; Tue, 06 Apr 2021 16:56:26 +0000
Received: from alln-iport-5.cisco.com ([173.37.142.92])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTozy-0033CA-Fq; Tue, 06 Apr 2021 16:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2543; q=dns/txt; s=iport;
 t=1617728178; x=1618937778;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cZx99TFaCLts0bYspySXDfTAZA7sX1ryp1fo4EAJaBw=;
 b=A+U1pHah+3bpUmz86IiSSTTVm9wXBZsDSmidvbfPNFy5pwrORFJ+8ReI
 eJVxqX9Zk7K4dTWKCwlNYbs6S1L0SbrTPGi+A5WAg/X2VGW9zllhsjO4d
 Vw0GyKGeyO1Wq6JG3mg5qe2AO2D4CHbu6utAZjtSg3+eYc9UFyKz2eqBL M=;
X-IPAS-Result: =?us-ascii?q?A0AWAgAIkmxgmIMNJK1aHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?VKDeAE5lkYDkAwWilqBaAsBAQENAQE0BAEBhFACgXYCJTgTAgMBAQEDAgMBA?=
 =?us-ascii?q?QEBAQUBAQECAQYEFAEBAQEBAQEBaIVdhkUBBTo/EAsSBhUZPA0OBoMEgwirV?=
 =?us-ascii?q?HWBNIEBiB+BRCKBF41NJxyBSUKENT6DeYEGhTgEggRCAS0Qg3GQQo1gnCmDF?=
 =?us-ascii?q?YEmm0cyEKRhLbgRAgQGBQIWgWshgVszGggbFYMlTxkOjjiOUCEDZwIGCgEBA?=
 =?us-ascii?q?wmNRAEB?=
IronPort-HdrOrdr: A9a23:az4voqCHQftEAsTlHekR55DYdL4zR+YMi2QD/UoZc3NoW+afkN
 2jm+le+B/vkTAKWGwhn9foAtjkfVr385lp7Y4NeYqzRQWOghrLEKhO5ZbvqgeLJwTQ7ehYvJ
 0MT4FfD5nKAUF+nYLG5mCDYrId6f2m1IztuuvE1XdqSmhRGsJdxiN0EBySHEEzZCQuP/sEPa
 GR7MZGuDasEE5/Bq+GL0IIUOTZq9rAmIiOW347LiQ64wqDhy7A0tDHOiWfty1zbxp/hZE/7G
 PCjwv1ooKkvv3T8G6760bjq7JLhdDm1txPQPapt/FQADDthgG0Db4RPIG/gA==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,201,1613433600"; d="scan'208";a="693085054"
Received: from alln-core-1.cisco.com ([173.36.13.131])
 by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 06 Apr 2021 16:56:13 +0000
Received: from zorba ([10.24.14.212])
 by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 136GuAm7015894
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 6 Apr 2021 16:56:12 GMT
Date: Tue, 6 Apr 2021 09:56:10 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: will@kernel.org, robh@kernel.org, daniel@gimpelevich.san-francisco.ca.us, 
 arnd@kernel.org, akpm@linux-foundation.org, linux-arch@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 00/20] Implement GENERIC_CMDLINE
Message-ID: <20210406165610.GV2469518@zorba>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
X-Outbound-SMTP-Client: 10.24.14.212, [10.24.14.212]
X-Outbound-Node: alln-core-1.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_175619_011977_0793E259 
X-CRM114-Status: GOOD (  20.33  )
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

On Fri, Apr 02, 2021 at 03:18:01PM +0000, Christophe Leroy wrote:
> The purpose of this series is to improve and enhance the
> handling of kernel boot arguments.
> 
> Current situation is that most if not all architectures are using
> similar options to do some manupulation on command line arguments:
> - Prepend built-in arguments in front of bootloader provided arguments
> - Append built-in arguments after bootloader provided arguments
> - Replace bootloader provided arguments by built-in arguments
> - Use built-in arguments when none is provided by bootloader.
> 
> On some architectures, all the options are possible. On other ones,
> only a subset are available.
> 
> The purpose of this series is to refactor and enhance the
> handling of kernel boot arguments so that every architecture can
> benefit from all possibilities.
> 
> It is first focussed on powerpc but also extends the capability
> for other arches.
> 
> The work has been focussed on minimising the churn in architectures
> by keeping the most commonly used namings.
> 
> Main changes in V4:
> - Included patch from Daniel to replace powerpc's strcpy() by strlcpy()
> - Using strlcpy() instead of zeroing first char + strlcat() (idea taken frm Daniel's series)
> - Reworked the convertion of EFI which was wrong in V3
> - Added "too long" command line handling
> - Changed cmdline macro into a function
> - Done a few fixes in arch (NIOS2, SH, ARM)
> - Taken comments into account (see individual responses for details)
> - Tested on powerpc, build tested on ARM64, X86_64.
> 

Why submit your changes ? My changes have been around for almost 10 years, and
are more widely used. Your changes are very new and unstable, but don't really
solve the needs of people using my series.

I've tried to work with you and I take comments from you, but yet you insist to
submit your own series.

I would suggest this isn't going to go anyplace unless we work together.

I can't really support your changes because, honestly, your changes are really
ugly and they just look more and more like my changes with every passing
iteration .. As the maturity of your changes continue they will just become my
change set.

I've been thru every iteration of these changes, and I see those attempts in
your changes. Everything different in your changes I've tried, and found not to
be useful, then it falls away in later iterations.

When you give me comments on something which I haven't tried I typically
incorporate it.

Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
