Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE44AC88E77
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 00:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+gqzeDLojqpJ2AMkckZyt2fzdd2M3cKsSR7FpVVHUzg=; b=mmE5Dp6/X5WvzY
	YeifbiS4QaF9cLSfpIAbZZXs/x3wW+RuDAb+A4NyDBvgtkXs99kRMMt5JX0sibJycdyXYWpU0WeE6
	q8WT5PceDrJBiVp1PZZOE1T0bvs7y2y5W3hps7ybsNvmV1p320B3u3bF7bq39wk7suCUGyYYhTkwa
	ujeokz8IwYOltJRxwNxXlL4VkhtvqNxwA/r9WXPnX/JhdxqCCIXA+44itH/ITSiNcoYuebtXRj4qE
	3y6wJxpAOLTtCcwVM9LFAGvMx4Tw6Xf+y4iXQ0WOQrpm9TBGWCPyFSDykHlBI/NaDnrymZNaKH7Z9
	OOFfx4smB4yvwOkqGd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dhw-000000087xk-08Ni;
	Wed, 16 Sep 2026 00:41:04 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dht-000000087xF-0jHE
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 00:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=NheJufshGj64fhQKNC2c1j1k0ck6W8lDGbWhTay9uUc=; b=sOZbLu5ewE2w8rWxU4D/CswcOx
	vscT/TR8V1ChxhajcNhxsAxXX1GdIm1/RSRx7ubFcr0dhqE/e/Aer1+4AVYBL2AlOv1C4Q4APfSgV
	bRUb14/0B5DwqRLMIYou200gkuWYkYtB9Mb8rQ6eSfBtDTDYS7QqI4UH9SzM8KxR8GhZrq7sMc/Bd
	DSCwoISx0sN0zEwd5oiMfAhueKhCXJO8CRKnmS91PYW62IzBRAnIGt97wWKyLxiNvisbUFbYC3vBs
	gLqbtDk2oQLAcdruS5xD7b4sKxqWd7Y/XGluJ1o57LoXxm07Kd4Y5Oari8tZ2vtnzM3eg77XVBp+Z
	mnfwUndg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6dhc-002hgB-1A; Wed, 16 Sep 2026 02:40:43 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x6dha-0087zL-Kq; Wed, 16 Sep 2026 02:40:43 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x6dha-00000002ADJ-2w79;
	Wed, 16 Sep 2026 02:40:42 +0200
MIME-Version: 1.0
Date: Tue, 15 Sep 2026 21:40:42 -0300
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
In-Reply-To: <uufwu7rqyxf7h55lgavcwrnylnq5gdbd7o5d7mfugrxpblds2d@adra5c2z22gg>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <bpnqwggtidgiec5akns3fa5edbsvl7xf55dxabtwng2xspy4pn@ue554aii2ngk>
 <53155340c897560bfc67e61ba9568fd6@igalia.com>
 <mokz5pdtwswkyab4byfq7q7m6ac2g6ceoi6jflyxmaszaibzqa@su6m4kamtdpy>
 <b1a6cec17e7c828fcebe310ca2a0d25b@igalia.com>
 <rywhz6soawf5dzyui5g7dnbufsgpxr7ma7honuhejwgncemzrm@f32at7hl6ugm>
 <6e93af907298022f077126f1be7bd386@igalia.com>
 <uufwu7rqyxf7h55lgavcwrnylnq5gdbd7o5d7mfugrxpblds2d@adra5c2z22gg>
Message-ID: <cdc75421500371a8839fe5347af5c103@igalia.com>
X-Sender: mfo@igalia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_174101_232879_77264CCA 
X-CRM114-Status: GOOD (  30.79  )
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

On 2026-09-10 04:29, Joel Granados wrote:
> On Wed, Sep 09, 2026 at 02:29:30PM -0300, Mauricio Faria de Oliveira wrote:
>> On 2026-09-09 11:07, Joel Granados wrote:
>> > On Fri, Sep 04, 2026 at 02:45:23PM -0300, Mauricio Faria de Oliveira wrote:
>> >> On 2026-09-04 10:41, Joel Granados wrote:
>> >> > On Thu, Aug 20, 2026 at 06:22:13PM -0300, Mauricio Faria de Oliveira wrote:
>> >> >> On 2026-08-20 09:51, Joel Granados wrote:
>> >> >> > On Wed, Aug 19, 2026 at 03:16:13PM -0300, Mauricio Faria de Oliveira wrote:
>> >> >> >> This series adds 'sysctl:' aliases to modules that register sysctl tables; e.g.:
>> > <... snip ...>
>> >> > use the correct call moving forward?
>> >>
>> >> This scheme currently covers all modules, AFAIK, as it is wrapped in the
>> >> functions that register sysctl tables.
>> >>
>> >> On moving forward: usage of such functions in a way that breaks a
>> >> requirement of this series (e.g., failing to specify the template
>> >> table/path parameter(s), or not having constant initializers) hits a
>> >> build error, as the requirements are actually from the compiler.
>> >>
>> >> >> I guess that a different design could use MODULE_SYSCTL_TABLE() as
>> >> >> MODULE_DEVICE_TABLE(), declared per table instead of wrapped into
>> >> >> register sysctl functions.
>> >> >> However, it seems to require moving the value of the path argument (or
>> >> >> its template) into the macro and still referencing it in the function
>> >> >> (or its instantiation of the template), which adds obfuscation, to all
>> >> >> callers.
>> >> >>
>> >> >> What do you think?
>> >> > It might be that having it inside the module subsys is more work, but I
>> >> > believe that there is the right place to have it. I still don't see that
>> >> > adding a module specific arg to the sysctl register is a good thing.
>> >>
>> >> Ok, cool. I can work on a different design.
>> >>
>> >> Please just let me know whether you are OK with the remaining (above),
>> >> and I'll be happy to tackle this.
>> >
>> > What is "the remaining"?
>> 
>> I meant the rest of the email, addressing the points/questions you
>> raised.
> 
> * The dependency on a sysctl path to load a module still is
>   backwards to me. It should be: I need feature A, I load modules
>   M{1,2,3} for A and I set sysctl S{1,2,3...}. Not sure why sysctl tools
>   do it the other way around.

Right, but note:
- the feature may, or may not, be built as a module (unknown to sysctl
tool).
- there is no simple way to identify which module provides a sysctl,
today.

Let's compare this with device-id module aliases: userspace doesn't know
whether a driver is built-in or a module, but it can load the module, if
any, based on the device-id, not the module name.

> * The fact that the invariance is in the sysctl path and not the module
>   identifier maybe points to a deeper issue.

It does seem that the invariance in the sysctl path is correct, as that
doesn't change with the variable of whether the code is built-in or a
module.

A similar comparison with device-id module aliases applies, IIUIC.

> * I still believe that this is better placed outside the sysctl
>   subsys as it does not cater solely to module loading.

Understood; your point about a module-specific argument in sysctl
register functions precisely confirmed that this approach is misplaced.

I'll try a different design, more similar to MODULE_DEVICE_TABLE().
Maybe the only requirement from sysctl is for struct
ctl_table.procname's offset to be zero (for file2alias). And apparently
something with the path string in a table declaration macro. We'll see.

Thanks again for reviewing and providing constructive feedback. That's
very appreciated.

> 
> Best

-- 
Mauricio

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
