Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA612CD5BB8
	for <linux-riscv@archiver.kernel.org>; Sat, 23 May 2026 22:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3z74NzK0Ano0NTnUsRroiDwhvUrPMl2T1D9TQiBsSw=; b=I8H0p8SctLxZ+0
	5BxQxz45M9/FT+8DSAy9RAbXaWrIxf52UeSLZcnTBiLPnby1nApeQybWJxaMU6VKRuXbDho6GY7/X
	DKQcwNJ31ELE8/+2klIQFN4SUPoxCTTsrN9cs2xrI85Or56156Z/X1P/dMJDuek58InWpLhNExMWA
	Sp43Vi7uVjqp6+VApXFhJVtc4+D7yU3AwSJcyIWP89TzOONbhfCoFQV5sTb34HN6cMstKAAg0jDvO
	gG2M1Z2n+/t6gKUDJHW8UJVDEQscJU6nxqGE6B3J4dSybbV0ELSTVtBzMWochIlI1KkROBNscYk7s
	kgzy39nZk3Hjsxa5+C5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQv5J-0000000E5mZ-29R0;
	Sat, 23 May 2026 22:44:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQv5I-0000000E5mP-0WEe
	for linux-riscv@lists.infradead.org;
	Sat, 23 May 2026 22:44:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DBB16001A;
	Sat, 23 May 2026 22:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191671F000E9;
	Sat, 23 May 2026 22:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779576280;
	bh=Ly0RA4VR9deG/+GQfcotwpWhgxpylLFnae+5Pv9ttM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kuiRxfMAnmum87HB0p5Jf+HbK3f+Q6KJxqfksoT3Z1colDAfSu4CVUnK6DwY3uzND
	 qAo9Cvv2OmNGdbwQ/j0fGuYPxYuDJ+PXH7cCI9EUmJrslTkoRmXeVuT3lLh5wtc2ZR
	 BJhhQs3WY3uIpesOKy7tguT6Cb8M34q07ME530AvdFCvlIHbz49m+ERnbnp+oDlFol
	 MeTqUlIf1SIFFEhXpf9y9H3eiXMAV50ih4UYDs7QUMkfHVT3vW63j0gAv51pa1nXFX
	 8124VZO1ljYRsB/7HbMBQnHqtBR6ZWiqY9JVeA8k0277L0VUa3/qz79Kij8MrTaW8G
	 0qdwvc8C3dFIg==
Date: Sat, 23 May 2026 19:44:36 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Cc: namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	palmer@dabbelt.com, pjw@kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] perf riscv: Fix discarded const qualifier in
 _get_field()
Message-ID: <ahIt1ArEyRH8HIXf@x1>
References: <20260513154851.1085334-3-guanli.oerv@isrc.iscas.ac.cn>
 <20260513180721.1179904-1-guanli.oerv@isrc.iscas.ac.cn>
 <6f54fc06-1a75-4910-82a5-172a42f34284@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f54fc06-1a75-4910-82a5-172a42f34284@isrc.iscas.ac.cn>
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

On Sun, May 24, 2026 at 02:41:26AM +0800, Li Guan wrote:
> Hi Arnaldo, Namhyung,
> 
> Just a gentle ping on this patch. It has received a Reviewed-by from Ian.
> Could you please consider picking it up for perf-tools-next?

Thanks, applying.

- Arnaldo

> Thanks,
> Li Guan
> 
> On 5/14/2026 2:07 AM, Li Guan wrote:
> > The assignment of strrchr() return values to non-const char * variables
> > triggers a -Werror=discarded-qualifiers warning when building with GCC 14.
> > This happens because in newer glibc versions, strrchr() returns a
> > const char * if the input string is const.
> > 
> > Properly declare 'line2' and 'nl' as const char * to match the glibc
> > function signature and ensure type safety. This avoids the need for
> > explicit type casting and aligns with the design pattern of not
> > modifying read-only memory in the perf tool.
> > 
> > Signed-off-by: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
> > ---
> > v2:
> >   - Drop the auxtrace decoupling and weak stub approach as they interfered
> >     with the cross-platform analysis intent, per Ian's feedback.
> >   - Focus on a clean fix for the const qualifier issue in RISC-V header.c
> >     by properly declaring local variables as const.
> >   - Use Li Guan as the preferred name format for consistency.
> >   - Verified that this fix is not yet present in acme/perf-tools-next.
> > 
> >   tools/perf/arch/riscv/util/header.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/perf/arch/riscv/util/header.c b/tools/perf/arch/riscv/util/header.c
> > index 4b839203d4..891984e909 100644
> > --- a/tools/perf/arch/riscv/util/header.c
> > +++ b/tools/perf/arch/riscv/util/header.c
> > @@ -19,7 +19,7 @@
> >   static char *_get_field(const char *line)
> >   {
> > -	char *line2, *nl;
> > +	const char *line2, *nl;
> >   	line2 = strrchr(line, ' ');
> >   	if (!line2)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
