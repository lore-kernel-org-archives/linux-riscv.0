Return-Path: <SRS0=YT8n=JG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232E9C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 01:24:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD479610C9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Apr 2021 01:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD479610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cisco.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7V35+o3mRf9y6csX2448aSfaXTdvVPoRU8BIlnULwCk=; b=jyma20n14EH1XBnPJeJ1dUfb3
	NpRMLQSCK3kY9Jo62fcvC11LZIaPNSd/kj3yh4mRW68+3omh/DaE4FrbCP0h+F9rG7Lz11TdtUG57
	Lc/Fed8kMpGBPDCfHid6mZlVHGviDCJ1E6UTmK4I67N6/ldEZjkGFv/GWStJ2KRso2DlOuRKyfGfo
	0CkdOubbFIZByouHabqVxkIMlMYlyDiLUjd0WX8an5vDlUkNV3ZrKVfeIhklr9wetg3B1xBYTpaMb
	LKGEZduDt2Tiy1YTtEMVWC9eqb1pQ9aWJ/gqwO7TzAIoMX8VIGKy72xlchEhRavws4/FekbGZWzgd
	C/fIs+Vbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUfsY-009d93-QO; Fri, 09 Apr 2021 01:24:11 +0000
Received: from alln-iport-6.cisco.com ([173.37.142.93])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUfsQ-009d63-PR; Fri, 09 Apr 2021 01:24:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=1925; q=dns/txt; s=iport;
 t=1617931442; x=1619141042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WkzLqPqjAxF6Ch0t2FT084suyCe7GM/KMpezthHSR4s=;
 b=NBZTs3Iuc+Ytm1+JSftPN6M0YsYXfa7TA67rSfBAEX6RSrauGz3GF72r
 8qsG7gHpyNbzGT/Af814XMSIpTDERaNWpai5IHALuYfjrYtpm5+zpoLAH
 Bv0Pbfh8lvGcFKWpgl4DeO0im5SndeFcC95qF83nWLQl90So9Rvx5sr41 Y=;
X-IPAS-Result: =?us-ascii?q?A0ABAAAUrG9gmIENJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE+BQEBAQELAYN3ATmNF4k1kA2KXIF8CwEBAQ0BATQEAQGEU?=
 =?us-ascii?q?AKBdwIlNAkOAgMBAQEDAgMBAQEBAQUBAQECAQYEFAEBAQEBAQEBaIVdhkUBA?=
 =?us-ascii?q?gM6OgUQCxIGLjwNDgaDBIMIqjx1gTSBAYgUgUQigRcBjUwnHIFJQoETgyI+i?=
 =?us-ascii?q?jkEgkeCNaAbikiRYYMVgSabRzIQpGEtszuEVgIEBgUCFoFUOIFbMxoIGxWDJ?=
 =?us-ascii?q?U8ZDo44jlAhA2cCBgoBAQMJjDRdAQE?=
IronPort-HdrOrdr: A9a23:QdBVtK4Vqwy1Ov3XkQPXwHXXdLJzesId70hD6mlaQ3VuHfCwvc
 aogfgdyFvYiCwJXmshhNCHP8C7MBbh3LRy5pQcOqrnYRn+tAKTXeNfxKbr3jGIIUfD38FH06
 MIScVDIf32SWN3lMPrpDS/euxQpOWv1ICNqaPgw2x2TQdsApsQjDtRLgqACEV5SE1nKPMCda
 a03cZMqzq+dXl/VK3SbUUtZOTNq8bGk5jre3c9ZyIP0hWEjj+j9dfBfSSw4xF2aV9y6IZn13
 TZmArk4ajmlPe3xnbnpgnuxqUTvsf9wd1eA8HJsOwpE3HHjwalY5kJYczkgAwI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,208,1613433600"; d="scan'208";a="717254170"
Received: from alln-core-9.cisco.com ([173.36.13.129])
 by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 09 Apr 2021 01:23:53 +0000
Received: from zorba ([10.24.9.242])
 by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 1391Nnm8027721
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 9 Apr 2021 01:23:51 GMT
Date: Thu, 8 Apr 2021 18:23:49 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Rob Herring <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, will@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org, linux-arch@vger.kernel.org,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 microblaze <monstr@monstr.eu>, linux-mips@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, openrisc@lists.librecores.org,
 linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 19/20] mips: Convert to GENERIC_CMDLINE
Message-ID: <20210409012349.GG3981976@zorba>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
 <20210406173836.GW2469518@zorba>
 <20210408190408.GA1724284@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408190408.GA1724284@robh.at.kernel.org>
X-Outbound-SMTP-Client: 10.24.9.242, [10.24.9.242]
X-Outbound-Node: alln-core-9.cisco.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_022403_376232_D4A74C1D 
X-CRM114-Status: GOOD (  23.37  )
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

On Thu, Apr 08, 2021 at 02:04:08PM -0500, Rob Herring wrote:
> On Tue, Apr 06, 2021 at 10:38:36AM -0700, Daniel Walker wrote:
> > On Fri, Apr 02, 2021 at 03:18:21PM +0000, Christophe Leroy wrote:
> > > -config CMDLINE_BOOL
> > > -	bool "Built-in kernel command line"
> > > -	help
> > > -	  For most systems, it is firmware or second stage bootloader that
> > > -	  by default specifies the kernel command line options.  However,
> > > -	  it might be necessary or advantageous to either override the
> > > -	  default kernel command line or add a few extra options to it.
> > > -	  For such cases, this option allows you to hardcode your own
> > > -	  command line options directly into the kernel.  For that, you
> > > -	  should choose 'Y' here, and fill in the extra boot arguments
> > > -	  in CONFIG_CMDLINE.
> > > -
> > > -	  The built-in options will be concatenated to the default command
> > > -	  line if CMDLINE_OVERRIDE is set to 'N'. Otherwise, the default
> > > -	  command line will be ignored and replaced by the built-in string.
> > > -
> > > -	  Most MIPS systems will normally expect 'N' here and rely upon
> > > -	  the command line from the firmware or the second-stage bootloader.
> > > -
> > 
> > 
> > See how you complained that I have CMDLINE_BOOL in my changed, and you think it
> > shouldn't exist.
> > 
> > Yet here mips has it, and you just deleted it with no feature parity in your
> > changes for this.
> 
> AFAICT, CMDLINE_BOOL equates to a non-empty or empty CONFIG_CMDLINE. You 
> seem to need it just because you have CMDLINE_PREPEND and 
> CMDLINE_APPEND. If that's not it, what feature is missing? CMDLINE_BOOL 
> is not a feature, but an implementation detail.

Not true.

It makes it easier to turn it all off inside the Kconfig , so it's for usability
and multiple architecture have it even with just CMDLINE as I was commenting
here.

Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
