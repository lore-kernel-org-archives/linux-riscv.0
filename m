Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D9AC001DC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmdjmyaEceeqO/A2cXXPlZcao6ntNhAI0VnUOqe83TI=; b=nzd8SDw+tx/rHk
	GFkDPaUF3OrD3Jf6NC02FpTBoC5gGNr+BgeMUYcBvdNO+koeaVtDTsgPzCtOQ73y985wWkAHYZzoQ
	GnhuD6GB7v3GZXwr9A/DMf0ktYlXzsVyHhFfc+ME33+UDV8LEO12iXKM8QkUnOqbC5JEGbbUekXYc
	uv9heJm8ShKU9RCz5EglgJw7kYdqee+DsK/bbab4lSAlFOFYGyauWnuMBdJ/rTV0IyRRFwyLVZjlc
	XqIubE7Vo0EPgZvjsbklhHkkWhsF4BUU8n+TKv53Vay1v9mup0wfy9xp6qbX7UCUNwygxg6NhxpDH
	z2449yQsGTbkDfffPJ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzss-005MNr-2k;
	Wed, 19 Jul 2023 05:37:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzsr-005MNN-0q
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=r4G8i0z25JPUORewUf5NcbkzT14wHq+ZHZkM3VxrvWg=; b=VA5NLakV/PQbpfqfdnnJalZbBl
	tEUHpsIUylY/qQOiWb6xf0LrOQer78wPMuqd/zxf8ikddcRM8mBj5Iip6JgyD3t8NXkwcqR47Mcvn
	aIBRCDB0t4g6zu2L6Mz0NZe+N1Cxq7/QvwwN9oLi29+EMxM28+3GvVxrj/Ic6HktGlWfDM6sWYWS/
	M6xGFDX+NkHA3g8c8gnmYCOIPQhfuUCOY2Cd2Sgm5TI7cMX470StGOhTgTX8brVvUfLCoi2t/Sao4
	oPBBrzS64effYhRIpMmToqcQUWIxtqkSX81req2rW7y3jqv2laie2mroOaKGP2vhRo3ly9V23Rgtg
	69PDePGw==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLtW8-00CAA9-0W
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 22:50:09 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b701dee4bfso98733731fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 15:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689720541; x=1692312541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r4G8i0z25JPUORewUf5NcbkzT14wHq+ZHZkM3VxrvWg=;
        b=TutWihx/ByldQVPemMfBSq0RWHlMdgdBqrUU6qj+Nb7xp5Qs/lPey9xZSHfZd3e1zO
         enGeUmcf3NEW7W6Jy4W1yGhXvEroVBz90nk0JHR0gwqGlnDh7RW7orehVw6gk10dsX/o
         8GzQONkIqJPja0IOfyV6rvUx83kc0gQyRCDWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689720541; x=1692312541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4G8i0z25JPUORewUf5NcbkzT14wHq+ZHZkM3VxrvWg=;
        b=BT+8wVFvJ3IubcjcpuH/6TKfjIO1eAvrt+sjGmfdbnl2NfdMwhyNqjerccuUcg2T1f
         +lAdQ9F9mlVNSitX1kd6ad+dh2GdnbpfYag50LUo+rkTm68VO72V/aVvtfrhg3GncVgK
         XL9oXdYXZglqGg/at8vdXy5HdX0u1c1Skdnttg8aEdfst0CQrVlCWb1++ZnyQ0vWiyzc
         OBakO5Fyxn5SyktRS2/15myfDMuPv9qQ3cMjpDilfXxTevHps22yJipE9WUUfrVy1GZU
         19qPskVWqKYsZ/gNfm+9/t7bnlds/kIyfk97+0Bub91bF99GkF3EofzIDB3Tk/2JAsfj
         1IWw==
X-Gm-Message-State: ABy/qLasMt9BmtO+HJ5cuAHVeXQRU/GccTRVbzA/1aZb4yB9ySgieLm6
	zaJga0UV47N+IgRazMCvQ9dGljeN7FkMtncJYxth
X-Google-Smtp-Source: APBJJlGDK/RpNs7dyiRNzDW6ZJiyQedtPhRBV07nFoX4NeU0wURCRm2qTRS5Ad3SJ5QWR1wl6N13zuoAXzynQwqm52I=
X-Received: by 2002:a2e:84d7:0:b0:2a7:adf7:1781 with SMTP id
 q23-20020a2e84d7000000b002a7adf71781mr11501967ljh.2.1689720541250; Tue, 18
 Jul 2023 15:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
 <4761144.fSbbhVQpq0@basile.remlab.net> <CAOnJCUJreDYWZcSRr-pb1vwRg_LyU7TBG+b_9Ys8rVmM8_fvgA@mail.gmail.com>
 <8756384.Zvl9fuB8X0@basile.remlab.net>
In-Reply-To: <8756384.Zvl9fuB8X0@basile.remlab.net>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 18 Jul 2023 15:48:49 -0700
Message-ID: <CAOnJCU+W9u+HnMfjU_y9W7331Zx07eQs9R1twV0=KsBAeSMSjw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] riscv: Allow userspace to directly access perf counters
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aurelien Jarno <aurelien@aurel32.net>, Mathieu Malaterre <malat@debian.org>, 
	Jan Newger <jannewger@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_235004_573537_B641C65B 
X-CRM114-Status: GOOD (  22.24  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMTI6MDTigK9QTSBSw6ltaSBEZW5pcy1Db3VybW9udCA8
cmVtaUByZW1sYWIubmV0PiB3cm90ZToKPgo+IExlIHRpaXN0YWluYSAxOC4gaGVpbsOka3V1dGEg
MjAyMywgMjEuNDUuMTUgRUVTVCBBdGlzaCBQYXRyYSBhIMOpY3JpdCA6Cj4gPiA+IEkgYWdyZWUg
dGhhdCBpdCdzIG5vdCBvbmx5IGluc2VjdXJlIGJ1dCBhbHNvIGluY29ycmVjdC4gSG93ZXZlciBp
dCBtb3N0bHkKPiA+ID4gd29ya3MuIEluIGZhY3QgSSBkb24ndCBkaXNhZ3JlZSB3aXRoIHRoZSBj
aGFuZ2UgYXMgc3VjaCwgYnV0IEkgdGhpbmsgdGhhdAo+ID4gPiB0aGUgY29tbWl0IG1lc3NhZ2Vz
IGFyZSBtaXNsZWFkaW5nIGFuZCBjb25mdXNpbmcuIEZvciBhIHN0YXJ0LCBpbiBvbmUKPiA+ID4g
cGxhY2UgaXQgc2F5cyB0aGF0IGl0IGlzIG5vdCBicmVha2luZyB1c2VyIHNwYWNlIGFuZCBpbiBh
bm90aGVyIGl0IHNheXMKPiA+ID4gYmFzaWNhbGx5IHRoZSBvcHBvc2l0ZS4KPiA+Cj4gPiBBZ3Jl
ZWQuIFdlIHdpbGwgaW1wcm92ZSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gY2xhcmlmeSB0aGF0LiBU
aGF0J3MgYWxzbyB0aGUKPiA+IHJlYXNvbiBJIHN0YXJ0ZWQgdGhpcyB3aG9sZSB0aHJlYWQgOikK
PiA+Cj4gPiA+IChVbmZvcnR1bmF0ZWx5LCBub3QgZXZlcnlib2R5IGFncmVlcyB3aXRoIHRoZSBj
aGFuZ2UuIEkgY2FuJ3Qgc2VlbSB0byBnZXQKPiA+ID4gRkZtcGVnJ3MgY2hlY2thc20gdG9vbCBm
aXhlZDoKPiA+ID4gaHR0cDovL2ZmbXBlZy5vcmcvcGlwZXJtYWlsL2ZmbXBlZy1kZXZlbC8yMDIz
LUp1bHkvMzEyMjQ1Lmh0bWwgKQo+ID4KPiA+IFdoeSBjYW4ndCByZHRpbWUoZXF1aXZhbGVudCBv
ZiByZHRzYykgYmUgdXNlZCBpbnN0ZWFkIG9mIHJkY3ljbGUgPwo+Cj4gSXNuJ3QgUkRUSU0gc3Vz
Y2VwdGlibGUgdG8gaW50ZXJmZXJlbmNlIGZyb20gcG93ZXIgbWFuYWdlbWVudCBhbmQgQ1BVCj4g
ZnJlcXVlbmN5IHNjYWxpbmc/IEkgc3VwcG9zZSB0aGF0IFJEQ1lDTEUgbWF5IGJlaGF2ZSBkaWZm
ZXJlbnRseSBkZXBlbmRpbmcgb24KPiBQTSBpbiAqc29tZSogZGVzaWducywgYnV0IHRoYXQgd291
bGQgc3RpbGwgYmUgd2F5IGJldHRlciB0aGFuIFJEVElNRSBmb3IgdGhlCj4gcHVycG9zZS4KPgoK
WWVzLiBCdXQgdGhhdCdzIHdoYXQgaXQgaXMgcHJvYmFibHkgdXNpbmcgZm9yIG90aGVyIElTQXMg
PyBNeSBwb2ludAp3YXMgaXQgc2hvdWxkCmp1c3QgZG8gd2hhdGV2ZXIgaXQgZG9lcyBmb3Igb3Ro
ZXIgSVNBLiBSSVNDLVYgaXMgbm8gc3BlY2lhbCBpbiB0aGF0IHJlZ2FyZC4KCj4gQXMgZmFyIGFz
IGJlbmNobWFya2luZyBpcyBjb25jZXJuZWQgKF9leGNsdWRpbmdfIHN5c3RlbSBzZWN1cml0eSks
IFJEVElNRQo+IHNlZW1zIHRvIGhhdmUgYWxsIHRoZSBwcm9ibGVtcyBvZiBSRENZQ0xFLCBhbmQg
dGhlbiBzb21lIG1vcmUsIG5vPwo+CgpDb3JyZWN0LiBJZiB0aGUgYXBwbGljYXRpb24gY2FuIGRl
YWwgd2l0aCBub2lzeSBkYXRhLCBpdCBjYW4gdXNlCnJkdGltZSBzaW1pbGFyIHRvCm90aGVyIGFy
Y2hpdGVjdHVyZXMuIE90aGVyd2lzZSwgaXQgc2hvdWxkIGp1c3QgdXNlIHRoZSBwZXJmIG1tYXAK
aW50ZXJmYWNlIGluIHRoZSBiZWdpbm5pbmcKYW5kIHJlYWQgdGhlIGNvdW50ZXJzIHdoZW5ldmVy
IHJlcXVpcmVkLgoKPiA+IFRoZSBwZXJmIHN5c2NhbGwgb3ZlcmhlYWQgaXMganVzdCBvbmUgdGlt
ZSBzZXR1cCB0aGluZyBkdXJpbmcgdGhlCj4gPiBzdGFydCBvZiB0aGUgYXBwbGljYXRpb24uCj4g
PiBGb3IgY291bnRpbmcgdGhlIGN5Y2xlcyBiZWZvcmUvYWZ0ZXIgYSBsb29wLCBpdCBzdGlsbCBw
cm92aWRlcyBhCj4gPiBkaXJlY3QgQ1NSIGFjY2VzcyBpbiB1c2VyIG1vZGUuCj4KPiBJIHN1cHBv
c2UgdGhhdCB5b3UgYWxsdWRlIHRvIG1tYXAoKSBoZXJlPyBUaGUgKGR1bWIpIEZGbXBlZyBjb2Rl
IGlzIHVzaW5nIHRoZQo+IGlvY3RsKCkgaW50ZXJmYWNlIHRob3VnaCwgYnV0IHRoYXQncyBqdXN0
IGxhemluZXNzLgo+CgpZZWFoLiBJIGFncmVlIGl0IGlzIG1vcmUgd29yayBidXQganVzdCBvbmUg
dGltZSBlZmZvcnQgdG8gZ2V0IG1vcmUKcmVsaWFibGUgZGF0YSB3aXRob3V0CmNvbXByb21pc2lu
ZyB0aGUgc2VjdXJpdHkuCgo+IC0tCj4g44Os44Of44O744OH44OLLeOCr+ODvOODq+ODouODswo+
IGh0dHA6Ly93d3cucmVtbGFiLm5ldC8KPgo+Cj4KCgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
