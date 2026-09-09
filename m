Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27D16C79FB6
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ns1L1drxBxQIs+H0A8bQ3F6J4b8vZl/7hfWdTwqxLQk=; b=cEy3GHnnMGI/kt
	YgQsO/T+/wbwwdAQRTbPGN1lCq2XERCyKnFUjLEmcBi7wGIcI2MdBAn1zjaS3B8va1LKYFHla8H4t
	xpjwDmNIgvoIw8IBEMid+nmQ/svnjlqJqYUXkKQfR8RJIFw0NOPvrBOahHpVlMf7PokBNqbVYPhuc
	oUZxSRlJUFPOpDIp6ou/PgEvw2PDPpV/elWONGqjy7mDhNSBW6UrJp9JE2OEZT9JbpLI2X6N+AY9D
	mIl4YlNWWi4iJP5FcM10uYF8cWuKbkm4CnTd8oV67sLBSM3EnpUs2OS4dZ12E+P9HKlqUoo9su3qP
	uFbTjnU1MTPF5LYCkv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4M7O-0000000CUgx-3u5Z;
	Wed, 09 Sep 2026 17:29:54 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4M7L-0000000CUea-2RXm
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 17:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=ixMZSD8+UhNtarF+6aKvQsI19PdlMWk8UdPjHUJ+BP8=; b=KMw6Bqep7POVCO8ABQLqn26u4z
	Vm92Tg+j/0+PmqqK/dvW828O7HrV+w+lZ60KY8e00z2BinoAcJO+teusI18GQwPZa93g46fWpKzrh
	AgVGA7OW13ikcCWBdkNHyCF5MJrQ4LKcZ+GKP5SaO3VjFYCmljrmH6AfZWccpFDtmCtNfrdPm7mPs
	y4KaCldihKnLxKrccLdvn9dRcj2yIzJUCoUAgq4c2VAAZwBqHbq49TxRAg0vo9Q8rWDVmDAvS1GYm
	9TAWMFQFYzZ/e/mtZNAnThAS4lu2g6BMirzitO5ItyIEr8XkzcaGF4jYGgtJDCV/itEvyRHzncwMa
	n8Da47kw==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x4M72-00HA6O-2e; Wed, 09 Sep 2026 19:29:32 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x4M71-008Hsn-5l; Wed, 09 Sep 2026 19:29:31 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x4M71-00000007Q64-0Tnk;
	Wed, 09 Sep 2026 19:29:30 +0200
MIME-Version: 1.0
Date: Wed, 09 Sep 2026 14:29:30 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 kernel-dev@igalia.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, fsverity@lists.linux.dev,
 keyrings@vger.kernel.org, bpf@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
 lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-sctp@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
 bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com,
 virtualization@lists.linux.dev
Subject: Re: [PATCH RFC v3 00/13] sysctl: add module aliases
In-Reply-To: <rywhz6soawf5dzyui5g7dnbufsgpxr7ma7honuhejwgncemzrm@f32at7hl6ugm>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <bpnqwggtidgiec5akns3fa5edbsvl7xf55dxabtwng2xspy4pn@ue554aii2ngk>
 <53155340c897560bfc67e61ba9568fd6@igalia.com>
 <mokz5pdtwswkyab4byfq7q7m6ac2g6ceoi6jflyxmaszaibzqa@su6m4kamtdpy>
 <b1a6cec17e7c828fcebe310ca2a0d25b@igalia.com>
 <rywhz6soawf5dzyui5g7dnbufsgpxr7ma7honuhejwgncemzrm@f32at7hl6ugm>
Message-ID: <6e93af907298022f077126f1be7bd386@igalia.com>
X-Sender: mfo@igalia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_102951_963354_CCB09BB6 
X-CRM114-Status: GOOD (  20.23  )
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

On 2026-09-09 11:07, Joel Granados wrote:
> On Fri, Sep 04, 2026 at 02:45:23PM -0300, Mauricio Faria de Oliveira wrote:
>> On 2026-09-04 10:41, Joel Granados wrote:
>> > On Thu, Aug 20, 2026 at 06:22:13PM -0300, Mauricio Faria de Oliveira wrote:
>> >> On 2026-08-20 09:51, Joel Granados wrote:
>> >> > On Wed, Aug 19, 2026 at 03:16:13PM -0300, Mauricio Faria de Oliveira wrote:
>> >> >> This series adds 'sysctl:' aliases to modules that register sysctl tables; e.g.:
> <... snip ...>
>> > use the correct call moving forward?
>> 
>> This scheme currently covers all modules, AFAIK, as it is wrapped in the
>> functions that register sysctl tables.
>> 
>> On moving forward: usage of such functions in a way that breaks a
>> requirement of this series (e.g., failing to specify the template
>> table/path parameter(s), or not having constant initializers) hits a
>> build error, as the requirements are actually from the compiler.
>> 
>> >> I guess that a different design could use MODULE_SYSCTL_TABLE() as
>> >> MODULE_DEVICE_TABLE(), declared per table instead of wrapped into
>> >> register sysctl functions.
>> >> However, it seems to require moving the value of the path argument (or
>> >> its template) into the macro and still referencing it in the function
>> >> (or its instantiation of the template), which adds obfuscation, to all
>> >> callers. 
>> >> 
>> >> What do you think?
>> > It might be that having it inside the module subsys is more work, but I
>> > believe that there is the right place to have it. I still don't see that
>> > adding a module specific arg to the sysctl register is a good thing.
>> 
>> Ok, cool. I can work on a different design.
>> 
>> Please just let me know whether you are OK with the remaining (above),
>> and I'll be happy to tackle this.
> 
> What is "the remaining"?

I meant the rest of the email, addressing the points/questions you
raised.

cheers,

> 
> Best

-- 
Mauricio

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
