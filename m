Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6408EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 21:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OPcMpVOwaC8GpGn4xmltr2FuCLgPj1gUSjvJm3umL8=; b=SRwhHtn6DGpCdC
	xMJblEnTgmH97YAF0OnZxfXiH7IrBZpAGrKQPbpV9EKAcsIO7EWU5hme3cdD2GV2EO3HTqA2Wdq4G
	D+1+RS5g9QTH50zpEFIsO0zAPhAceSAfbrzWwfH4j8m25yGBsf6JOuHDqKXu+bR7Ac3NLO9HAoEq0
	Pnmr5lrk8Ai+AuqiNus0KjRiGJfyZ4KSZFzzDlIW2G3Hul9Tyd6VWk6maZy7vJcAoCgZ33ibQJdyw
	vQTKicFRYiNHIUv3Vjs3vqY3qBsh/gwZ/pi9lOpD7RoFiEs5HGUI6omD3squOjYp+P1miOWkiqMk3
	VA5O0lGR8b/FBIOp/DJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWui-002mP2-1K;
	Thu, 06 Jul 2023 21:53:24 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHWuf-002mOX-20
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 21:53:22 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-635de03a85bso7499186d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 14:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688680400; x=1691272400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBxUFQm+Fi2nfK6JwAktFvqvGOaZfQCpQcGkegfNKWA=;
        b=IdwYkOkQgpfEOoBHEabk9hjQtHzBsF6ZeF9SD6dm87+oBCmYkcLIlUY8np6XZm3KWd
         I7RIwMxH5MMGnDFYNcEIYMXVJ+5EKg89pSzAwA5BK3vDXu+CygwHmIX9qW63Rwe+zzaA
         a2AGeJTgXLZsZwwOSbaxSswTYyQ/+mKiRaCgAIA03AehpeQG71JDkhmaMvB+dS7Ojdyd
         /lGVv6dpqLvOyKQx/sOTHDlYxIsqv3esCU7h0IReQA3Zkca1ixjjqCq8GGp6604KroDm
         Ndn+srE9Gmpn468LzjoX0KuV7vqj958pM8qZXQTzXT/5pLc0Cs0r49r1GFv/COYVcOIY
         Diag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688680400; x=1691272400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBxUFQm+Fi2nfK6JwAktFvqvGOaZfQCpQcGkegfNKWA=;
        b=JZ5r9WbetMuuft/qCJ0NbHNsqYGUm0UBIcKknCSBpppbjSsacg6RzUpNC0tz08tPw1
         eAiC32qRjYesaTRdBycWrpBUWjCTPWlFTI/bF0va0g0RxkPgY7IBTOOtUVhqXrDaEQ2W
         kU/RjHj1pw4voZnAf/dlM/Upi2FfvZPMYkQcIgaTjs3zOwD5Uj0T4P+yLqVEds7jJKK4
         lZj21q/xIQ2BW4f4p218T6fig4ZMytmd28JOH67drlwBQOcG0Ds8SnPxBFY53QwguIaC
         Jgiu1t5eJ2Vv7G5MF7Q//87mSOcjV8AX4rEODVPDedZy8ESx6+kaTmglDvgN0c1FoW9l
         vYdg==
X-Gm-Message-State: ABy/qLZeLq6Re1aUMx676nuVkxlI+OkS/yvOJEnwIgN+cOh1d7CUnUhn
	nZoz2YFsgRHqNAiFeeCYGrS6FAQTvJ1MkEOKJ+k=
X-Google-Smtp-Source: APBJJlGOP1AXpGFdZDFE3UAD3VyP7xlxaQsokLGHTP1lR8hT5XwQ8vbLB5qiIdhGtjSdyH+n2FfHNFCBgPIK/LJexpg=
X-Received: by 2002:a0c:e54d:0:b0:634:7c34:6c96 with SMTP id
 n13-20020a0ce54d000000b006347c346c96mr2615436qvm.7.1688680399878; Thu, 06 Jul
 2023 14:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAMj1kXFZren0Q19DimwQaETCLz64D4bZQC5B2N=i3SAWHygkTQ@mail.gmail.com>
 <mhng-b66b085a-eb15-4c9b-b2aa-93ddf16ec7aa@palmer-ri-x1c9a>
 <CAP6exYKwZG=_47r0jAUFYNL5-P-SS==k6vWdKiMJ9nB0upH5Zw@mail.gmail.com> <20230706-barcode-front-5bed954740a7@spud>
In-Reply-To: <20230706-barcode-front-5bed954740a7@spud>
From: ron minnich <rminnich@gmail.com>
Date: Thu, 6 Jul 2023 14:53:09 -0700
Message-ID: <CAP6exYLPq__LeMk43uh3CCb5cG8Vc2PWDPoY2U6spb=Fgd=7eg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 0/4] Obtain SMBIOS and ACPI entry from FFI
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_145321_685943_803C699E 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, kernel@esmil.dk, rafael@kernel.org, lpieralisi@kernel.org, cuiyunhui@bytedance.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, geshijian@bytedance.com, tinghan.shen@mediatek.com, pierre-louis.bossart@linux.intel.com, linux-acpi@vger.kernel.org, lenb@kernel.org, jdelvare@suse.com, Paul Walmsley <paul.walmsley@sifive.com>, allen-kh.cheng@mediatek.com, jrtc27@jrtc27.com, angelogioacchino.delregno@collabora.com, weidong.wd@bytedance.com, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, yc.hung@mediatek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

b2gsIGdtYWlsLCBpdCBwb3BwZWQgYmFjayBpbnRvIGh0bWwgbW9kZSBmb3Igc29tZSByZWFzb24u
IEkga2luZGEgd2lzaAppdCB3b3VsZCBzdG9wIGRvaW5nIG1lIHNvIG1hbnkgZmF2b3JzLgoKCk9u
IFRodSwgSnVsIDYsIDIwMjMgYXQgMjo0N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBIZXkgUm9uLAo+Cj4gT24gVGh1LCBKdWwgMDYsIDIwMjMgYXQgMDI6
Mzk6MTNQTSAtMDcwMCwgcm9uIG1pbm5pY2ggd3JvdGU6Cj4KPiBQbGVhc2UgZG8gbm90IHRvcC1w
b3N0IG9yIHNlbmQgSFRNTCBtYWlscyB0byBMS01MLCB0aGV5IGFyZSByZWplY3RlZCBieQo+IHRo
ZSBsaXN0IHNlcnZpY2VzLgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
