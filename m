Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDE9CD5BC8
	for <linux-riscv@archiver.kernel.org>; Tue, 26 May 2026 13:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T7NcjysSCIZcOlBq1IT6f0rZq950T9x/+LWKYozh1Wo=; b=uvfIYyZvKcsbDL
	oKik/dDBwaEGNhmU+C8L6VL/1JEUvbbNByzhsRYyRupV+mLcQEq8vBSFca1nLtgBcDeJWRrKrezxP
	E1rUfDaP0m91nv6vbsGPlrcEIzR9U+lXcA7UbVKJD8i1DTvOI+7EL6FzKDayI3cyH6Tizv4sckDkB
	vXdzMsNSvs4Db4anCGHgGiv77eLKkZ3EJjQmhC+1STf4IWkz+V6VEwxlhcvJf1O/ymXST4mNKmQTq
	emQGUsDOlbocBNpugLAC1tYR3pxiLDBtGT2JYHVMtNP8XZX/QmigUpochvOpg4sqqXl0XKbkpXu/V
	ChGQis55kcfFC8d11FmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrzG-000000024vE-1oCF;
	Tue, 26 May 2026 13:38:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrzE-000000024uo-2UVb
	for linux-riscv@lists.infradead.org;
	Tue, 26 May 2026 13:38:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E20E8602F1;
	Tue, 26 May 2026 13:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164F71F00A3A;
	Tue, 26 May 2026 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779802703;
	bh=oOKcXaMosfo/owsXW+WMOSw10vIYBJ3tP8qIY78PgJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oiu9R8RnVsntp+r4GoHbV3UbMUxnK42UzM7CQADH87umbw39O0GA9VnsLKsP66Dn1
	 FsGGTeVGEjCIfPU46hirCe5shVz/ClDseF7VTqF22ml+vLSz4iay+Gv0BGK2joRee2
	 Hm3S/PDdht6KVdBZCJ39zFgBbtVHVMmctVaoYRnc26S8bKIPpeh/IyT9L+78patlBg
	 +PKbBcB+pOMEw48XmdhVY5R5ZP9kO70UKk+lH0yDWVKpr4L1N7hgtFIUPeX/MJjhPu
	 KXORLa9eT94GCfBt6kUfzQfF/NBx7dZaARwhSfQE6DqbG5z3zWt05t9hoy8SoI9a9H
	 /tESKaH/O46Eg==
Date: Tue, 26 May 2026 13:38:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Subject: Re: (subset) [PATCH v10 0/4] riscv: spacemit: enable SD card support
 with UHS modes for OrangePi RV2
Message-ID: <20260526133821-GKC3748271@kernel.org>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
 <177889984452.2298656.1074391459031404894.b4-ty@b4>
 <7e68e745-0d70-46db-9475-38d3dd5b9cf4@baylibre.com>
 <6b945153-5a7b-415e-904a-1c350b7d52ee@gmail.com>
 <86ac46cd-b7bc-42cc-8c29-996ae21f3654@baylibre.com>
 <CABdCQ=M_E1uHU5WTXCn2mXaxf3-+7M9gXCL=tp1qBW50jf7d5Q@mail.gmail.com>
 <8b9c613c-df1a-4f44-b15d-cdcc21905bc5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b9c613c-df1a-4f44-b15d-cdcc21905bc5@gmail.com>
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, Troy Mitchell <troy.mitchell@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Javier Martinez Canillas <javierm@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, Iker Pedrosa <ikerpedrosam@gmail.com>, Margherita Milani <margherita.milani@amarulasolutions.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, Vincent Legoll <legoll@online.fr>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

HI All,

On 18:45 Mon 25 May     , Andre Heider wrote:
> Hi Iker,
> 
> On 25.05.26 11:36 AM, Iker Pedrosa wrote:
..
> > 
> > So, how has this turned out in the end? Andre, will you take care of
> > sending the latest version for the MUSE Pi Pro?
> 
> Yes, in fact I already sent it last week:
> https://lore.kernel.org/spacemit/20260520130624.1763487-1-a.heider@gmail.com/T/#u
> 
Ok, I will take it
> You should have received that (unless I messed something up) ;)
> 
P.S, please bear with me, I'm currently on travel now, so may slow on this
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
