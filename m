Return-Path: <SRS0=W16s=BP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4610CC433E1
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 17:05:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F592245C
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2020 17:05:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kS+lZ76V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DFoey0bO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09F592245C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v30RG8qRcFzAN34PnmWWW6VgZpKmPHO8ptO4RQu+IpY=; b=kS+lZ76V3C+HTpM5jXtbGRjMs
	4ZFMLk4sd/t9VmNzEg0anaYddG+OznMGEkEBIPsNwUkNzGXzhMDiWON2heI9hP1dFu5Uyi3Rl4Sz+
	MYWg7hspa/lacTCd1c1s7sO9/o4Yo1wp/JuWkynoQ+MYBL9XxE2sTALXfTsmz7A+5GvkoTNecvOdu
	But+8TFaT+XXiMjNCHid9t3LAQdkTq+qHMiD/aQA4RuHWEkrdeEz1MCT+nAzg3bnxq96gxqE53SER
	fES6sEj4icMxwsotGhLVXKepdQPa7xPUC51Hw3RdkBD5oelIXTjCfOB4XGGh5NxP2Zum0t4bVYo8A
	KwWt2Jmtw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3Mqi-0006mF-Gt; Wed, 05 Aug 2020 17:05:08 +0000
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Mqf-0006lE-J4
 for linux-riscv@lists.infradead.org; Wed, 05 Aug 2020 17:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596647104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aqjcjFj0cLfrtaKdyRnzSHGUtnIcD/6QjX80vbdnnDs=;
 b=DFoey0bO6w7ZCt8Lg+nIYUyo0aGbPoqmgOjySZ3QP6IegNTWwAL+A73U/sE9pP0xpqLrYg
 pjWQgL8+iiCRtROab1pv2TAojdUHe7i9p9eWkEZUEUSkbp/HKozUk3L5U+xvNID06Zn6IW
 FAPZ2RNi4EzqopFrwRAMbAuN7ohn9SA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-v1Ut0-vMMlKQmdlxYzNI4g-1; Wed, 05 Aug 2020 13:03:04 -0400
X-MC-Unique: v1Ut0-vMMlKQmdlxYzNI4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AA368F53CF;
 Wed,  5 Aug 2020 17:02:48 +0000 (UTC)
Received: from elisabeth (unknown [10.36.110.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 488217B910;
 Wed,  5 Aug 2020 17:02:41 +0000 (UTC)
Date: Wed, 5 Aug 2020 19:02:34 +0200
From: Stefano Brivio <sbrivio@redhat.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH net-next v2 2/6] tunnels: PMTU discovery support for
 directly bridged IP packets
Message-ID: <20200805190234.1d95dccd@elisabeth>
In-Reply-To: <CA+G9fYsJdoQieVr6=e09nYAvpAjnay5XSmJ3WkZHgMdzJRUYEw@mail.gmail.com>
References: <cover.1596520062.git.sbrivio@redhat.com>
 <83e5876f589b0071638630dd93fbe0fa6b1b257c.1596520062.git.sbrivio@redhat.com>
 <CA+G9fYsJdoQieVr6=e09nYAvpAjnay5XSmJ3WkZHgMdzJRUYEw@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_130505_919462_1420493D 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, aou@eecs.berkeley.edu,
 Nikolay Aleksandrov <nikolay@cumulusnetworks.com>,
 Netdev <netdev@vger.kernel.org>, Aaron Conole <aconole@redhat.com>,
 paul.walmsley@sifive.com, Florian Westphal <fw@strlen.de>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Pravin B Shelar <pshelar@ovn.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Roopa Prabhu <roopa@cumulusnetworks.com>, Numan Siddique <nusiddiq@redhat.com>,
 David Ahern <dsahern@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-riscv@lists.infradead.org, Lourdes Pedrajas <lu@pplo.net>,
 "David S. Miller" <davem@davemloft.net>, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Naresh,

On Wed, 5 Aug 2020 22:24:03 +0530
Naresh Kamboju <naresh.kamboju@linaro.org> wrote:

> On Tue, 4 Aug 2020 at 11:24, Stefano Brivio <sbrivio@redhat.com> wrote:
> >
> > +       icmp6h->icmp6_cksum = csum_ipv6_magic(&nip6h->saddr, &nip6h->daddr, len,
> > +                                             IPPROTO_ICMPV6, csum);
> 
> Linux next build breaks for riscv architecture defconfig build.

Yes, sorry for that. Stephen Rothwell already reported this for s390
defconfig and I sent a patch some hours ago:

	https://patchwork.ozlabs.org/project/netdev/patch/a85e9878716c2904488d56335320b7131613e94c.1596633316.git.sbrivio@redhat.com/

Thanks for reporting this though!

-- 
Stefano


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
