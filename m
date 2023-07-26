Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF185C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jul 2023 01:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyTW3liKDTr7CNpEg7kYkgFrCA7xu1eFeXEfGiteoP4=; b=IDUbYFUAZxwCbS
	jhtaH6mTnH8/7tLBRtOEXO1fwBirycbwY58uCpDFzCoA8D/fe7vw4k4v/aFrspqsT4zlQPZ8jn1sw
	cvciMbTV5+c+sf8cMeAcuwL+rMfutl4nN8gIVZIk7sr4mN84jQ4kK5HveRBlPqZ4aH1cukE68CC5Q
	TY8JUQv/nwO+Ga801F4e94zqYJbrEltMg8McV5gYME361D2mtuwqB4J9Cmn12+KG19U2ycLEAn/Z9
	8e6WoEcQrXQavOHo9zB4GFdab3ZGBePI9dUsZJXm5XUn/rIh7nz5dX4Ncno99PXYel39qIJ5nz1Im
	FaSNtfCVHtL51ZoWtywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOTU4-008rOs-1r;
	Wed, 26 Jul 2023 01:38:36 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOTU0-008rO1-1O
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jul 2023 01:38:34 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-76571dae5feso543844885a.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 18:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690335507; x=1690940307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbgWKCuCj/Omvba/7tqwaalVu90LErpD4j/GDLXb99c=;
        b=LoqBio8RQOAMQhcmOJcaLwZR7UcjmPZNKoe7hH+aPnkE6d1dz9BPAVh7NC5TAH2AAk
         hMWjvFcunsKnoNpl/N2bKrLgk7xF8bBFaTNe2lQtZB1/HhgH5AQaQojQHYk9Wb3GmHll
         xmvKZ8F+7bj8eP4f0duRQDmfQR3r8Es0L4JFGzUaCzYw92Yg0G0zzSU4FgQkx112MnNi
         ewquHnC0idqwbzxLCYZ6l1yJneyZYT6oByiP2OIeIfypJU+B3yr8QASxI66pkBLjb/LC
         SQyFp83Ns7IaRvicopGdBtI809JkOGs/D+rscfrgvpnfHu0y3n1WaBjkrg0UqQKVLh19
         A9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690335507; x=1690940307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbgWKCuCj/Omvba/7tqwaalVu90LErpD4j/GDLXb99c=;
        b=SNXyuZNCdQbgiX99icH17DcXWuNSNoKMHDxjwHgXZj1yaEmBijNh0jIXpfOww7xl/H
         zjrQLehRyBtpSU0iHD4F1DK4cgABxXYeS3je1PeR6P1SJJjrlW4NEdLhUZO9r+Jzl1rf
         K63Z/itrhXDEwGqsVqQ+4H9f7dAtgxrpS847MqKYnjEiIFgXem5Zw3AsjFngYjFc4KgA
         fmT2g8ANSmoiHnWu3zWpTiZ5G+fXSLYOoaqtPVIgPh4F0SoxMazYIYqDAtM91yQXmLh5
         OUTzF+94JcOxeN4a9ioemmUxW82HQ/NoMfmBINk0wXHGn9og30XTpqLmbFtJ5CohY3fr
         8zLg==
X-Gm-Message-State: ABy/qLYSRwwOUeH3h/I9rF0now5+xmAm9TZv2wm0P7cvdoDqW3fAnUdq
	iqhzWb/F8cyBqyL+SpmEC0nC29y9svIfMNVVMDwzig==
X-Google-Smtp-Source: APBJJlENQF4ezVhy4E842gW8nERhoJjO63HZHSlEnPGEiUaMRktnohAfSIUQCOqjsJw/CrUTwgKfGehUfslxRGNq14c=
X-Received: by 2002:a05:620a:2f8:b0:76c:4d4c:7940 with SMTP id
 a24-20020a05620a02f800b0076c4d4c7940mr590338qko.72.1690335507122; Tue, 25 Jul
 2023 18:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v2-3-a470ab8fe806@baylibre.com> <ZMBmalZwaRCiy2BG@xhacker>
In-Reply-To: <ZMBmalZwaRCiy2BG@xhacker>
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 25 Jul 2023 18:38:16 -0700
Message-ID: <CAFTh7p3m+4kLxPV+NXJWSRW-ZDZv930z=SbfuELmgcZFnQ4fig@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] MAINTAINERS: add reviewer for T-Head RISC-V SoC support
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
	Jason Kridner <jkridner@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_183832_474618_553EEC0B 
X-CRM114-Status: GOOD (  15.15  )
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgNTozMOKAr1BNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEp1bCAyNCwgMjAyMyBhdCAxMDoyMDo0MEFN
IC0wNzAwLCBEcmV3IEZ1c3Rpbmkgd3JvdGU6Cj4gPiBJIHdpbGwgbWFpbnRhaW4gc3VwcG9ydCBm
b3IgdGhlIFRIMTUyMC1iYXNlZCBCZWFnbGVWIEFoZWFkIGJvYXJkIHNvCj4gPiBhZGRpbmcgbXlz
ZWxmIGFzIGEgcmV2aWV3ZXIgZm9yIFQtSGVhZCBTb0MgcGF0Y2hlcy4KPgo+IEhpIERyZXcsCj4K
PiBUaGFua3MgZm9yIHlvdXIgaW50ZXJlc3QgaW4gbWFpbnRhaW5pbmcgdGhlIFNvQyBzdXBwb3J0
IHBhcnQuIEhvd2V2ZXIsCj4gbWFpbnRhaW5lcnNoaXAgaW52b2x2ZXMgYWN0aXZlIHJldmlld2lu
ZyBhbmQgbWFpbnRhaW5pbmcgdGhlIHdob2xlIFNvQwo+IHN1cHBvcnQgcGFydCBhbmQgbm90IGp1
c3Qgc3BlY2lmaWMgYm9hcmQgcGFydCwgYWx0aG91Z2ggY3VycmVudGx5LCB0aGUKPiBTb0Mgc3Vw
cG9ydCBpbiBtYWlubGluZSBpcyBtaW5pbWFsLiBJJ2QgbGlrZSB0byBzZWUgeW91ciBwYXRjaAo+
IHJldmlld2luZywgdGVzdGluZyBhbmQgc28gb24uCgpZZXMsIHRoYXQgaXMgdW5kZXJzdGFuZGFi
bGUuIEkgd2FzIGp1c3QgYWRkaW5nIGEgUmV2aWV3ZXIgZW50cnkgYXMgSQphbSBzdXBwb3J0aW5n
IHRoZSBCZWFnbGVWIEFoZWFkIGFuZCBJIHdvdWxkIGxpa2UgdG8gdGVzdCBwYXRjaGVzCnJlbGF0
ZWQgdG8gdGhlIHRoMTUyMC4gIEJ1dCBpdCBpcyBub3QgdG9vIGJpZyBvZiBhIGRlYWwgYXMgSSBh
bSBhbHNvCnN1YnNjcmliZWQgdG8gYWxsIHRoZSByZWxldmFudCBtYWlsaW5nIGxpc3RzIHRoYXQg
d291bGQgcmVjZWl2ZQpwYXRjaGVzLgoKVGhhbmtzLApEcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
