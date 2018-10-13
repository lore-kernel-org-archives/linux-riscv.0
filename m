Return-Path: <SRS0=D72f=MZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C49AC71122
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 02:25:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E69F20868
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Oct 2018 02:25:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XWtZlm82";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="uV2twWkm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E69F20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ssI2Cmg1QlKLSBPFcjEKyAyHxgJwPjq+crlOJxx9uD0=; b=XWtZlm820WsGAi
	Iow8r6B8zE4YM1EAHvJZsGgI+Aojd9SM/3Dp/0LcIV5lUCFoJBWpogDoWA2TyUfZYQEe2ccbOgoAA
	zTKzepj6PfvIynFITSqo8LPB0/A0fRVGVrn0RSGA7nvA5S4enP9Q4GCzHDlMfEXPxgJb9a2Zgx88o
	FObmuMUiLob1oVEmDQnOENBvbE8qc4HIavVY4CyaubVzbTyifyggjh220h8Lwb1Igv3TwrhWy7P6S
	tRfiLqJ57BPr27vrOYU/abK/TRBtfFXPUV3XCKW+9y2OSt0NC7riiyDoaGn27Wtw/xwUMou9hVXCX
	JyMA/eswyMDAvPtgOp1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB9cN-0006kK-03; Sat, 13 Oct 2018 02:25:27 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB9cI-00067K-KA
 for linux-riscv@lists.infradead.org; Sat, 13 Oct 2018 02:25:24 +0000
Received: by mail-ot1-x343.google.com with SMTP id u22so14083394ota.12
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 19:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=AVT8yt4SB5J9DoLXgmc7fyXmf+sZ/QolyovgztLAQ10=;
 b=uV2twWkmECSPrusRnN/vXPmvBFYTjOqR8hUGj7uFIqFnja6HWyEE59/EX6URRSK7ei
 bsLQO8pq96Yj7M5G0CjsRbi5afMpRO5p6LGi6gqkF1Fsb96X2cpi7a6HzEjPHM5S5b/+
 frAsPOqLD9LWEf7OVOqxvcQcS5euFpCDZTZ4mQNwNIu+I5BIdazSX176UsMrE2WE7yqy
 vEzD1H9jpf2yN7Z39bZVobe1cuQmeBj/6yYghOi4Eg5BRvkIX/X2/Np9eIx+7MbesZ3i
 M/WKTCz0rPGomijvt/NLvxi250WzkhscHNYFINjgKIa6h6fyG7Vk/yjb5v+LZqg963lC
 Fyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=AVT8yt4SB5J9DoLXgmc7fyXmf+sZ/QolyovgztLAQ10=;
 b=GYztkfur7vRGForIpbM2ngtaK/GbuN02bqdPksfJy2boUUxzNnRwMSEQ09UelXvIWp
 qFhzgL+6G7OfE3iqngcREUpel7B5NZ+KkjjMexorvMuPfa1FIqxkdaHuvuoOoKaw8ImG
 yNGwmiArDvG2nWoPyGkeg2A61TdOlb8lQvjs4K0dBDzaiRNzRqYKZYtPQky5nHVb8c1X
 f1XNXLJo8a61g69ymqHJEk/lEZUSK0FJmrkcUR3nVEhTK7zmxzuQe3ETwKQNxOaeoRSF
 Tq6JsqzXry71d2zNVfClOLr8aheYrh+SASJfJPQ/BV6Vj3tHwzz92gVTsb9Gt70sv/6v
 D6cw==
X-Gm-Message-State: ABuFfojvfxJrHRIK+DE62Ov2YZhSgWK414RW8flpdQfiAB4utMr6Thdf
 +zXaMBGemeyfY37zfufVW2XQA64cdG7544ZtSk/0pA==
X-Google-Smtp-Source: ACcGV626tmOS/hq+IOOBvcyLVHGavVFHf8rpMv7Ej7UrZuwws9AFWJei17jzLnNTEoqbyX0OG7eWDPlqeQQBpHBj980=
X-Received: by 2002:a9d:62cb:: with SMTP id z11mr5748873otk.342.1539397509267; 
 Fri, 12 Oct 2018 19:25:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:56d8:0:0:0:0:0 with HTTP; Fri, 12 Oct 2018 19:25:08
 -0700 (PDT)
In-Reply-To: <20181013021057.GA213522@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-2-joel@joelfernandes.org>
 <20181012113056.gxhcbrqyu7k7xnyv@kshutemo-mobl1>
 <20181012125046.GA170912@joelaf.mtv.corp.google.com>
 <20181012.111836.1569129998592378186.davem@davemloft.net>
 <20181013013540.GA207108@joelaf.mtv.corp.google.com>
 <CAKOZueuNvWvn18vffJWpbpg7h-uScT8gXrrudTB2pnT4M2HJ_w@mail.gmail.com>
 <20181013014429.GB207108@joelaf.mtv.corp.google.com>
 <CAKOZues25aaKz3_AiyfJ=r2QBd5MghgY3ky_ptg4Z8=ST4DCgw@mail.gmail.com>
 <20181013021057.GA213522@joelaf.mtv.corp.google.com>
From: Daniel Colascione <dancol@google.com>
Date: Fri, 12 Oct 2018 19:25:08 -0700
Message-ID:
 <CAKOZueu2wdkeUFYLQ8qE48yJs1_uRz-9RVJRkp==CL=jp=Q8+g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
To: Joel Fernandes <joel@joelfernandes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_192522_690110_06890C7E 
X-CRM114-Status: GOOD (  20.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 Michal Hocko <mhocko@kernel.org>, linux-mm <linux-mm@kvack.org>,
 Lokesh Gidra <lokeshgidra@google.com>, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, deller@gmx.de, Hugh Dickins <hughd@google.com>,
 jejb@parisc-linux.org, kasan-dev@googlegroups.com,
 kvmarm@lists.cs.columbia.edu, mingo@redhat.com, geert@linux-m68k.org,
 aryabinin@virtuozzo.com, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, fenghua.yu@intel.com, jdike@addtoit.com,
 linux-um@lists.infradead.org, Julia Lawall <Julia.Lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, bp@alien8.de, luto@kernel.org,
 nios2-dev@lists.rocketboards.org, kirill@shutemov.name, gxt@pku.edu.cn,
 Chris Zankel <chris@zankel.net>, richard@nod.at, linux-parisc@vger.kernel.org,
 Ramon Pantin <pantin@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>,
 linux-alpha@vger.kernel.org, lftan@altera.com,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181013022508.zob6I_-i7F805_V7Pj-uz_9ixBq_y05V2uawLwxroto@z>

On Fri, Oct 12, 2018 at 7:10 PM, Joel Fernandes <joel@joelfernandes.org> wrote:
> On Fri, Oct 12, 2018 at 06:54:33PM -0700, Daniel Colascione wrote:
>> I wonder whether it makes sense to expose to userspace somehow whether
>> mremap is "fast" for a particular architecture. If a feature relies on
>> fast mremap, it might be better for some userland component to disable
>> that feature entirely rather than blindly use mremap and end up
>> performing very poorly. If we're disabling fast mremap when THP is
>> enabled, the userland component can't just rely on an architecture
>> switch and some kind of runtime feature detection becomes even more
>> important.
>
> I hate to point out that its forbidden to top post on LKML :-)
> https://kernelnewbies.org/mailinglistguidelines
> So don't that Mr. Dan! :D

Guilty as charged. I really should switch back to Gnus. :-)

> But anyway, I think this runtime detection thing is not needed. THP is
> actually expected to be as fast as this anyway, so if that's available then
> we should already be as fast.

Ah, I think the commit message is confusing. (Or else I'm misreading
the patch now.) It's not quite that we're disabling the feature when
THP is enabled anywhere, but rather that we use the move_huge_pmd path
for huge PMDs and use the new code only for non-huge PMDs. (Right?) If
that's the case, the commit message shouldn't say "Incase THP is
enabled, the optimization is skipped". Even if THP is enabled on a
system generally, we might use the new PMD-moving code for mapping
types that don't support THP-ization, right?

> This is for non-THP where THP cannot be enabled
> and there is still room for some improvement. Most/all architectures will be
> just fine with this. This flag is more of a safety-net type of thing where in
> the future if there is this one or two weird architectures that don't play
> well, then they can turn it off at the architecture level by not selecting
> the flag. See my latest patches for the per-architecture compile-time
> controls. Ideally we'd like to blanket turn it on on all, but this is just
> playing it extra safe as Kirill and me were discussing on other threads.

Sure. I'm just pointing out that the 500x performance different turns
the operation into a qualitatively different feature, so if we expect
to actually ship a mainstream architecture without support for this
thing, we should make it explicit. If we're not, we shouldn't.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
