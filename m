Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6A7C25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 19:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JghvF8Zy8vi3SFUTgCQl7MpwdMm+q8Zwi/d23hmECwg=; b=ni6+oWNKFfkLrA
	fccnSJJxGMrzUczE+xraTEdgC4rjnBs/RfGAsX9c4Q6H3lvO2nI4yBc+mT7R/OYI7UYiAig63HPm6
	xy0KntUfyMISGHT7aRW/PvPWGpgG+jgpVnb9Rmx0I8YstXTozXys1ACfW1BjA9BBrCww3D/zGlse8
	8NHaXHvg5zigXEwiPYUnOGQfV6E9dU6/WC2JrAOEl5tobramx7l6LqpERqhTjC4Xzfbu6CgH6AK8q
	z2Z4H0Td9IShjMMCNLDdruGe+w9ncjii8Mr0wjooqn+93BfM+ofebMsuI8j7ItnvvzvByYSF6TFwC
	pnkppF8vf2qt6gLNPdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2C8-006O77-75; Tue, 16 Aug 2022 19:25:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2C6-006O5c-1Z
	for linux-riscv@bombadil.infradead.org; Tue, 16 Aug 2022 19:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Mcm/etSCYChahClz5lPhGz680tz38qViCn2Hqn6HaAE=; b=iZi73e2RqV5lql4TiH9vUka0rR
	Y+Q4uwJwYwtGdBv6phl/l4yrntRns9RRclpSPQlSC8I/hYAE85/W/ArEweaKO0GjCltFjrVKYRNJT
	ouL0QeBuLDpsoTktLCYenSXNrV4B9J0uuF0KXVisDFfgAbSmvIqWGGPDYGSs1CrwGZKgjuUUzRdgQ
	ex3r4rdrY+9w6nqal8jwPMMLvezd3z46sz0rdPkySbuABjE5uGjyNjs1ZgXfsOL8Zkg5C64/03I5j
	OEwvPGg9Vmyk6I+A/2ZMCcqBdL21W5ac2xE3sLAMPLLsJpwxqzhxTRCZvDN17OiHib19Z1wW0j11t
	AvmtfBFg==;
Received: from [187.19.239.32] (helo=quaco.ghostprotocols.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO2C3-0032kl-64; Tue, 16 Aug 2022 19:25:40 +0000
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id CD7F64035A; Tue, 16 Aug 2022 16:25:33 -0300 (-03)
Date: Tue, 16 Aug 2022 16:25:33 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, linux@yadro.com,
	Genevieve Chan <genevieve.chan@starfivetech.com>,
	=?iso-8859-1?Q?Jo=E3o_M=E1rio?= Domingos <joao.mario@tecnico.ulisboa.pt>,
	Nikita Shubin <n.shubin@yadro.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	Kautuk Consul <kconsul@ventanamicro.com>
Subject: Re: [PATCH v5] perf arch events: riscv sbi firmware std event files
Message-ID: <YvvvLUnVaO+Fvw3U@kernel.org>
References: <20220628114625.166665-1-nikita.shubin@maquefel.me>
 <20220628114625.166665-4-nikita.shubin@maquefel.me>
 <18c8e9c74955c08fdbd631a35c51b30f3cff3cd3.camel@ventanamicro.com>
 <20220811112303.4e5f0566@redslave.neermore.group>
 <Yvas60duFUkSzuz+@kernel.org>
 <20220815162755.7ed970c6@redslave.neermore.group>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815162755.7ed970c6@redslave.neermore.group>
X-Url: http://acmel.wordpress.com
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

Em Mon, Aug 15, 2022 at 04:27:55PM +0300, Nikita Shubin escreveu:
> > If I get this today it may even get into v6.0. :-)
 
> Well... i missed it :), on the other hand this series depends on 
> https://lkml.org/lkml/2022/7/27/23 
> which hasn't been merged yet.
 
> Just have sent a v6 series.
 
> Thank you for review!

Ok! Hopefully it'll make 6.1 then. :-)

- Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
