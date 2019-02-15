Return-Path: <SRS0=HaOg=QW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF948C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 09:31:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95BF6206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Feb 2019 09:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lADo2ALT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="NQ0eGso6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95BF6206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYMAkwTwPWwI87BEFA39YGDclSeLSCN1zfZ136U2NEQ=; b=lADo2ALTqBJEFU
	INKUhOhmktkL3s0Hgz5DPXlb/pcRr1IMxBQnI5xUXnDyKt9otqOE/hYFJ4rRDi2VyViwuISO1oxP9
	JM8Q4zUmA3ac2V7VxwYKY+s3fIOJl9Oy06WkG53FeHmUoSFW+VN+Xe83wtni1PVpu340jFYq6jXKv
	kWtxwjekL9/Fs0IFD1cscfX7xbMwC6U4KPqv7fO8EVW4tTISLSWjDYnoyZOhBTD26dCvy0qGLaIY3
	swQiNzKxDg1q0BhpuY3zy/wPMCjboiLx8b0gj6VIKBw/QPn94vcDrC1V/kGAslCDnW48FYhca4gDn
	7gRZu7jZi2oiS+OEWbfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guZpu-0007nZ-2e; Fri, 15 Feb 2019 09:31:10 +0000
Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guZpq-0007mc-S6
 for linux-riscv@lists.infradead.org; Fri, 15 Feb 2019 09:31:08 +0000
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id x1F9Ukq7020247
 for <linux-riscv@lists.infradead.org>; Fri, 15 Feb 2019 18:30:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x1F9Ukq7020247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1550223047;
 bh=v5CD2QsDxnxVejyPIDnfbiJ1pltYltlIlJJglB+jvf0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NQ0eGso6oKLWfKf5cFvUyBYm2OHHA6KMFXxb4raGJ4xk9alAwE6b986gzBUM+NhXJ
 7DBOoEHgcydBqd66HIPfVc4IGD6owhhGMsMg7vel7aNIcFRL7kjpEJfVbrDs9CUz/l
 ysapVJjYa5w++SdewUAfTkQvgNL2YivGFbSizA5cT1adFaWjEjC4Hf9INDo2e5tswx
 FTHdhvVKRnLz/ku8BegAQSxM9MN7v/uSQkKYYitc5E6sTVTqkO17cTaxksidmNhP94
 M7rL+DFrSSgn7hVggMbmu1DQW/1/6NmVo+z79o2t0B1+hWDSFCoyHxRSXTF8rGFQ7m
 xpL2fn30+eDJA==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id e81so2282638vsd.2
 for <linux-riscv@lists.infradead.org>; Fri, 15 Feb 2019 01:30:46 -0800 (PST)
X-Gm-Message-State: AHQUAubmlot49P10VYs3cXwsEgmjNQ36LbLea7Al3Bn1tOh/CD1fFNG0
 c765af5oZl+RxNzXwQ/+YxldrmQwbG4+q6q2c40=
X-Google-Smtp-Source: AHgI3Ia3aUMPs8A+f0S+OAOntXz63yvlxIZCcSZkHkAspWZKdCm1fRVczLmf1lM9pbiclIsGKkljQY6lvGdNXZnifOU=
X-Received: by 2002:a67:c913:: with SMTP id w19mr4362629vsk.179.1550223045823; 
 Fri, 15 Feb 2019 01:30:45 -0800 (PST)
MIME-Version: 1.0
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-2-hch@lst.de>
 <e7a2efe3-f56c-7dfd-6613-dc9229556673@c-s.fr> <20190214170510.GC32441@lst.de>
 <d5451fc4-9183-702a-e9ed-4a2be1f82a11@c-s.fr>
In-Reply-To: <d5451fc4-9183-702a-e9ed-4a2be1f82a11@c-s.fr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 15 Feb 2019 18:30:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNATnsMbciyEd-1HZZmb5A66-TBtq0R3X-=JPMNT6iADo4w@mail.gmail.com>
Message-ID: <CAK7LNATnsMbciyEd-1HZZmb5A66-TBtq0R3X-=JPMNT6iADo4w@mail.gmail.com>
Subject: Re: [PATCH 01/11] powerpc: remove dead ifdefs in <asm/checksum.h>
To: Christophe Leroy <christophe.leroy@c-s.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190215_013107_130578_621AFF9A 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBGZWIgMTUsIDIwMTkgYXQgNToxOCBQTSBDaHJpc3RvcGhlIExlcm95CjxjaHJpc3Rv
cGhlLmxlcm95QGMtcy5mcj4gd3JvdGU6Cj4KPgo+Cj4gTGUgMTQvMDIvMjAxOSDDoCAxODowNSwg
Q2hyaXN0b3BoIEhlbGx3aWcgYSDDqWNyaXQgOgo+ID4gT24gVGh1LCBGZWIgMTQsIDIwMTkgYXQg
MDk6MjY6MTlBTSArMDEwMCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPiA+PiBDb3VsZCB5b3Ug
YWxzbyByZW1vdmUgdGhlICdjb25maWcgR0VORVJJQ19DU1VNJyBpdGVtIGluCj4gPj4gYXJjaC9w
b3dlcnBjL0tjb25maWcgPwo+ID4KPiA+IEFsbCB0aGUgc2VwYXJhdGUgZGVjbGFyYXRpb25zIGdv
IGF3YXkgbGF0ZXIgaW4gdGhpcyBzZXJpZXMuCj4gPgo+Cj4gSSBzYXcsIGJ1dCB0aGUgcHVycG9z
ZSBvZiB0aGUgbGF0ZXIgcGF0Y2ggaXMgdG8gcmVwbGFjZSBhcmNoIGRlZmluZWQKPiBHRU5FUklD
X0NTVU0gYnkgYSBjb21tb24gb25lIHRoYXQgYXJjaGVzIHNlbGVjdC4gRm9yIHRoZSBwb3dlcnBj
IHlvdSBhcmUKPiBub3QgaW4gdGhhdCBjYXNlIGFzIHRoZSBwb3dlcnBjIGRvZXMgbm90IHNlbGVj
dCBHRU5FUklDX0NTVU0uCj4KPiBTbyBJIHJlYWxseSBiZWxpZXZlIHRoYXQgYWxsIHN0YWxlIGJp
dHMgb2YgcmVtYWluaW5nIEdFTkVSSUNfQ1NVTSBpbgo+IHBvd2VycGMgc2hvdWxkIGdvIGF3YXkg
YXMgYSBzaW5nbGUgZGVkaWNhdGVkIHBhdGNoLCBhcyBhIGZpeCBvZiBjb21taXQKPiBkNGZkZTU2
OGEzNGEgKCJwb3dlcnBjLzY0OiBVc2Ugb3B0aW1pemVkIGNoZWNrc3VtIHJvdXRpbmVzIG9uCj4g
bGl0dGxlLWVuZGlhbiIpCj4KPiBSZWdhcmRpbmcgdGhlICNpZmRlZiBfX0tFUk5FTF9fICwgSSB0
aGluayB3ZSBzaG91bGQgZG8gYSB3aWRlIGNsZWFudXAgaW4KPiBhcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20sIG5vdCBvbmx5IGFzbS9jaGVja3N1bS5oCj4KPiBDaHJpc3RvcGhlCgoKUGxlYXNlIHNl
bmQgc3VjaCBjbGVhbnVwcyB0byBQb3dlclBDIE1MCmluc3RlYWQgb2YgdG8gbWUgKEtidWlsZCku
CgoKQ2hyaXN0b3BoLApJIHRoaW5rIHRoaXMgb25lIGlzIGluZGVwZW5kZW50IG9mIHRoZSByZXN0
IG9mIHRoaXMgc2VyaWVzLgpIb3cgYWJvdXQgc2VwYXJhdGluZyBpdCBpZiB5b3Ugdm9sdW50ZWVy
IHRvIFBvd2VycGMgY2xlYW5zdXA/CgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
