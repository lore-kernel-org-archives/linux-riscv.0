Return-Path: <SRS0=rJkP=WC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B90FC31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2019 18:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCC020818
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2019 18:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IXLT/q+d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="fy3Wp8DI";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="YgIZmpux"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BCC020818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYA8AkxRhQeN2y87aYTjn/q2xUqGC4bg1MyKxHfVQio=; b=IXLT/q+dHEzqMH
	tHih7MI3zY7gFuG06he5evk8As+Wb1LbHLOrhx1O8wsTB+sAxcxH18KfQuopD6Ibmx6nyHqVT2hG5
	ToTWzWxorNHhWLi9FJWwGC7b3RJ9+6qfR0De7N61gqPrfA42y7Bt6HGsQ//cMF4o1KQhPpUtmVygm
	eRbau5TDxJYpTCZmT5ZTNxhvG8HMWarF2uSusae2msepZOHmaC2nnR9ryRT9drYO3QaJDqvppGX93
	hvIgjmTp1EnUm4mldtNBCVUdi6hSr5cHPu3br77SY9P/CkS+IKJlWKljBeEuCS3v5ys/i0HK7ZsLE
	3SJrWSF7gmMdDQ4UUHpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv4LH-00005A-5I; Tue, 06 Aug 2019 18:37:51 +0000
Received: from pb-smtp1.pobox.com ([64.147.108.70])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv4LF-0008WJ-5c
 for linux-riscv@lists.infradead.org; Tue, 06 Aug 2019 18:37:50 +0000
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 17C691677C4;
 Tue,  6 Aug 2019 14:37:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=o6RJbZTUTi4jFuXhFVfJQVZYJes=; b=fy3Wp8
 DI+YyFTH0HdYTCOsNVX8Ho3uhaNFr6I0rAPlEw5F0XHA5TB4+azYegf8b2/jiaUH
 Z6/G0zokpPYZ1d+xv71XAJnRtjjyEu7x7Sa2Ix0k0BiUol7vN3En2OXC6oJQKmy3
 nPVLPjnYXNjeWuq5L8O7gBIAjegDKEfXblkXM=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id 0DB541677C2;
 Tue,  6 Aug 2019 14:37:45 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=0YvkOmCAJdANlNTo8ct/4vVBLFRjnNJQaLBZy5Flbu8=;
 b=YgIZmpuxGPort0vb9c3rTwI7rxj8ORN/nwjOJfXt/9xZoF5swPmjVfA/4pmPDwd2wGM8PKatK1u4ThZhNiRFoAOFGSj6uiPyVF8+2JmDNuceq+QUDfAwgPIVTKLfluwxacKDuZc5IiHRQ0Pb22sozLNsBOUl9mUez8sqJG049PY=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 82B8E1677C1;
 Tue,  6 Aug 2019 14:37:44 -0400 (EDT)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id B244A2DA017B;
 Tue,  6 Aug 2019 14:37:43 -0400 (EDT)
Date: Tue, 6 Aug 2019 14:37:43 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: About __udivdi3
In-Reply-To: <mhng-206638da-813f-4beb-bb68-ec2ff8fe0730@palmer-si-x1c4>
Message-ID: <nycvar.YSQ.7.76.1908061413360.19480@knanqh.ubzr>
References: <mhng-206638da-813f-4beb-bb68-ec2ff8fe0730@palmer-si-x1c4>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-Pobox-Relay-ID: 47BB6C46-B879-11E9-BD09-46F8B7964D18-78420484!pb-smtp1.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_113749_315658_93AA2919 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
Cc: tesheng@andestech.com, dslin1010@gmail.com, alankao@andestech.com,
 rick@andestech.com, Christoph Hellwig <hch@infradead.org>, kclin@andestech.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 6 Aug 2019, Palmer Dabbelt wrote:

>    Author: Palmer Dabbelt <palmer@sifive.com>
>    Date:   Tue Aug 6 08:03:59 2019 -0700
>    
>        RISC-V: Remove udivdi3
>    
>        This should never have landed in the first place: it was added as part
>        of 64-bit divide support for 32-bit systems, but the kernel doesn't
>        allow this sort of division.  I must have forgotten to remove it.
>    
>        This patch removes the support.  Since this routine only worked on
>        64-bit platforms but was only built on 32-bit platforms, it's
>        essentially just nonsense anyway.
>    
>        Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Acked-by: Nicolas Pitre <nico@fluxnic.net>

Related: there is still some opportunity for performance gain on rv32 by 
providing an assembly version of __arch_xprod_64() if someone is up to 
it.


Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
