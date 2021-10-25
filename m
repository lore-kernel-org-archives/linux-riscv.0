Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54BDC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 01:12:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA3160C51
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 01:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EA3160C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gc8EUgqnvdshQA3Bl3TO0r36bRxsOkoJ42VdlPCslEA=; b=nr9KvYQFUsvGjt
	V/sSRpFC7mccMQ09q8SdCWetb4HuBZ01k+PomKCMs+7nkGa5EWKcktPq7OlJnVjlqKOZjjBCw3T5P
	quiU6lCfX/P1PtnhrwzkOeuw2P8gZ2UMtod08BLlAR07LO2S7PBHBmfKZJ7Uojo2HQYJHwnH1UTCC
	Pchxp/NIkVp2UT9IBbt61xRXis+fYFGzaH/R+RQbC2B5CHvYJFAcrNWVwOx9llLRf6nYzy8HzEF/p
	6UKnK5UEgBSuzl0frMXa3/UCsAygvg+N3CmFg7SAH8ynd2+/4WOjpfg/gjrV+Im9Mm9WLpK0xPYoy
	X2Wvz8bytdZGVSEjn60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meoXX-00Erjh-JH; Mon, 25 Oct 2021 01:12:39 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meoXV-00Erid-Gs
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 01:12:38 +0000
Received: by mail-ed1-x536.google.com with SMTP id r12so3276363edt.6
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 18:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C+ecm+t2PsReTz6De6QOhCuZZsxdJqQBgK7vEegwMuM=;
 b=WEqLmWzDOX6QrqtFA5QIgOR5wjRm+JCAf99IwnVz5q2Wi+41Ep2VDqUZX/KLOB2Wq5
 duRgfXwHFkQ3EdHrgl9P4A1pIitqtYIdlX9BCisBEgKhTnugGnERhixIDUGF40Qi1L17
 hr7LagynymmsJkgY4UIT6uN7GalDTyFrpJCQm7h0Xf8U+KwpSjBYLU419fOiKUDJmk32
 d6cgk6E4U8vNmQW/y5Vz/CB6T+qMbVYJT0bMrQ2ovyBH2CtyhWK3wQ8/IxTK2xUM6CAX
 xunNLmibV2ixTcr9gt3/Jt3XbsLl3t44N+avlEgUKW0qV9YBK2UKB8Is/1D2tdbFSu+R
 QPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C+ecm+t2PsReTz6De6QOhCuZZsxdJqQBgK7vEegwMuM=;
 b=yt+kU05Adwboc1R9bhMgyIYpC4YTcVLlNvb+LTLZeD7qm7buHwJk/0r0TYZiQeTV/T
 HAKIAbzwAi8Nr2uXdjwkfGwojm0CgcRbcgLytK3ioIHyM23vWGkuVqkfcR1SdUIPQ0pD
 1faa+qu25s9sLFcfEI7hV59Q79sBvk8w/UsYaxNUgJ5QL/P6OoIW6y8fncTBfILjW80D
 XtdsLtKs6IJ6J5KOxrC9YH/RkauM/OLyZR8EhIiQzvPmJAByl8M393HdYylMNx0IsByB
 hLAg+iGBPmkSwE3MMYrx+muwVHqoPeRYuixORebmFh5rYTMPNkwCv/oVkOSgVa1zBQ3W
 z87Q==
X-Gm-Message-State: AOAM533kZCyRAqtWCC4yryJqBLijkCsde93pB5bdkdjE6gOFFHIL/YrU
 cuuaGV1js2/MQQOYWGk36bdCbbCkAiOPQVH/Sxc=
X-Google-Smtp-Source: ABdhPJy97jYbxK5dor/maO8rTF/AfWltfXK/H+KUbkMlti5Bg3qbCSqAqT1WuqNvLeMXEnWRcFB7cRFKWXk3lRNbLy0=
X-Received: by 2002:a17:907:3da7:: with SMTP id
 he39mr18612364ejc.554.1635124355353; 
 Sun, 24 Oct 2021 18:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-51275835-4c34-4099-85f5-13c6dbef4e19@palmerdabbelt-glaptop>
 <750f6239-154d-9190-24ff-ece033add638@infradead.org>
In-Reply-To: <750f6239-154d-9190-24ff-ece033add638@infradead.org>
From: Daniel Mangum <georgedanielmangum@gmail.com>
Date: Sun, 24 Oct 2021 21:12:24 -0400
Message-ID: <CAA=qMX65_rV8DndydsvT3y9ZMkQ37PNjDFuKcmdbB1mRNdVMNg@mail.gmail.com>
Subject: Re: [PATCH] riscv: cacheinfo: fix typo of homogenous
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <Atish.Patra@wdc.com>, 
 Peter Zijlstra <peterz@infradead.org>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_181237_605337_5F5E1598 
X-CRM114-Status: GOOD (  22.60  )
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

Thanks for the feedback folks! I have sent a v2 patch.

Dan


On Sat, Oct 23, 2021 at 4:36 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 10/23/21 1:30 PM, Palmer Dabbelt wrote:
> > On Fri, 08 Oct 2021 13:56:25 PDT (-0700), georgedanielmangum@gmail.com wrote:
> >> Updates 'homonogenous' to 'homogenous' in comment.
> >
> > I don't really know spelling that well, but checkpatch says
> >
> >     WARNING: 'homogenous' may be misspelled - perhaps 'homogeneous'?
> >
> > when applying this.  It looks like they're both words, but "homogeneous" is the right one?
> >
>
> Internet search to grammar.com says:
>
> To summarise, Earlier, homogenous was used as a scientific term, mainly in biology, but now it is almost obsolete, being replaced by homologous. Whereas, homogeneous is a common word, very much in use and means having similar or comparable characteristics.
>
> Several web sites agree that homogeneous is currently preferable.
>
> >>
> >> Signed-off-by: hasheddan <georgedanielmangum@gmail.com>
> >> ---
> >>  arch/riscv/kernel/cacheinfo.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> >> index 90deabfe63ea..ff98546b1152 100644
> >> --- a/arch/riscv/kernel/cacheinfo.c
> >> +++ b/arch/riscv/kernel/cacheinfo.c
> >> @@ -29,7 +29,7 @@ static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
> >>      /*
> >>       * Using raw_smp_processor_id() elides a preemptability check, but this
> >>       * is really indicative of a larger problem: the cacheinfo UABI assumes
> >> -     * that cores have a homonogenous view of the cache hierarchy.  That
> >> +     * that cores have a homogenous view of the cache hierarchy.  That
> >>       * happens to be the case for the current set of RISC-V systems, but
> >>       * likely won't be true in general.  Since there's no way to provide
> >>       * correct information for these systems via the current UABI we're
>
>
> --
> ~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
