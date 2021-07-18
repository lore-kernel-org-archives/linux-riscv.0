Return-Path: <SRS0=1tpi=MK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44D1C636CA
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 19:37:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 886C06108B
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 19:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 886C06108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9pNSwXPo8Cy960QfmbZgLchIWdNzaSeJtAsaEgFPM0=; b=ZFfeOXC3x1IOCF
	8Kb+t0nohQvZy01yhR8GnaA1hE/tYngMVZxBIPd8eV1+cZcjfiDSFv30/RPB2fWvgWIv9pIW5KKH8
	sp+Kgrv+fTd9yhJQVDLTKRPFm1/feZfG61u+EelO5TkPZ8NQoI0wP4mVcNUxXPS5fx2LlKlhp1BCK
	87L+L4gJVmi0wk+SqiQfUsxNZMrECmnAidMo7pAcsvZlfdkqsG5mZTEA1Nk7bB0zsuIcL2Y6jui07
	SecIZI9GHFYkIia8khNUxcojokKixYWb/V1ng4N9QBzaqMjOvIZhgecu7tWoViDdVOieQZCeHj9SI
	Fp1WuOR/TgjwTG4IOgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Cb2-007y2p-7a; Sun, 18 Jul 2021 19:37:04 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Cay-007y1r-RU
 for linux-riscv@lists.infradead.org; Sun, 18 Jul 2021 19:37:02 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 46F1E1FF85;
 Sun, 18 Jul 2021 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626637017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4VE9wboOFBx1A8aW4S+ryH5vyFPrMvrAxG+rYAOecbI=;
 b=ukHRmbXDBEVbDHcM8eunsLDAOCZk5tNxG2yqo2wO+OmNccN+pO9QVa8fBvTTQ+h1/EaJe+
 qsC1Me6BrCQHMrj/f3WSmmaTpkRy3BWLxX1oG5wrL3f/tcP4ZLSyMqvPiEb1Kzeuo4vzpa
 F7wuGKbvUdPQgRGF0k2/WVsElwduTII=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626637017;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4VE9wboOFBx1A8aW4S+ryH5vyFPrMvrAxG+rYAOecbI=;
 b=P4Wce5HwkC9qDoGp1bzga35bz0KN5aO0WYhI+Y8CCVO4Vs+nvxKEGEASXw86rC2vKUtHP2
 DJOa6+oJWTVjvIDA==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id AEAC5A3B83;
 Sun, 18 Jul 2021 19:36:56 +0000 (UTC)
Date: Sun, 18 Jul 2021 21:36:55 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] libbpf: Remove from kernel tree.
Message-ID: <20210718193655.GP24916@kitsune.suse.cz>
References: <20210718065039.15627-1-msuchanek@suse.de>
 <c621c6c6-ad2d-5ce0-3f8c-014daf7cad64@iogearbox.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c621c6c6-ad2d-5ce0-3f8c-014daf7cad64@iogearbox.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_123701_091263_69898E9E 
X-CRM114-Status: GOOD (  16.97  )
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

On Sun, Jul 18, 2021 at 09:04:16PM +0200, Daniel Borkmann wrote:
> On 7/18/21 8:50 AM, Michal Suchanek wrote:
> > libbpf shipped by the kernel is outdated and has problems. Remove it.
> > 
> > Current version of libbpf is available at
> > 
> > https://github.com/libbpf/libbpf
> > 
> > Link: https://lore.kernel.org/bpf/b07015ebd7bbadb06a95a5105d9f6b4ed5817b2f.camel@debian.org/
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> 
> NAK, I'm not applying any of this. If there are issues, then fix them. If

They are fixed in the github version.

> you would have checked tools/lib/bpf/ git history, you would have found
> that libbpf is under active development in the upstream kernel tree and

So is the github version.

> you could have spared yourself this patch.

You could have spared me a lot of problems if there was only one source
for libbpf.

Can't you BPF people agree on one place to develop the library?

Thanks

Michal

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
