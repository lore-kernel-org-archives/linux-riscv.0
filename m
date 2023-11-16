Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344FCC197A0
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSXuPWscNFHObO5QE2nfNBz9EkJkzBPRc1Y+ArxZZQ8=; b=o8svqcGBJgn3/i
	Ee2nGOcfjc8oBRLNLUIYZQl+7hSFbDedH8gG9TkohhqhlA5PFI0+7/M4tz1wrxQH1w9tdbcXurPGt
	kGlTIJM91w4h+EcUPBLm4tTTNhyK5vu/vQmDV/eI5RLFkJQFYs45hAofZkCI/Gm4BzfUt683ID5Zi
	sJwY/zaaSMCRoiBbW1akRp4Z11u1S9MuGuVVuNzheSwodvMlWObTRZMZfaOpod9CqAjF+arafxQcM
	O/TASpTfs/YnPCXdv9+RDHcYDOQn/ev+UGxgzv7aNgugIhuN8eyP04V3xaxbZW6UJu+/Cp7bfiTac
	cqF5gQDSvc4ffpIorIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ZMQ-0033QL-0E;
	Thu, 16 Nov 2023 10:12:34 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3ZMM-0033OC-0d
	for linux-riscv@lists.infradead.org;
	Thu, 16 Nov 2023 10:12:32 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-28094a3b760so457889a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Nov 2023 02:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700129548; x=1700734348; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhaFfpVqJgGoKXCozqLAMmf/sLVC3yUm3pzsgBTdMG4=;
        b=SG8UML2yk7i3TRYjCdqZQkB6j6d3SvOTYw3V8DYfq/RVVY3vsUKQ3fbFT9ZQ7Z3Mcw
         CsFGyXcMLjfRYFjNTGnWyHVFMhl0sp5iBH29A5iCd3m089yJMO27fqCkvA06Vjr47+ao
         Z6NUNAWhPpN19hBdTRrNGn2q1al0YPRR2uasdzfs6IzQetZI7UyjGvzm/tcFmC5Q3ufu
         ewBatd3FvpFkHFadIXNwD84TI5s3vrJ1jPfuSJElHuNUsV20f1LBgpoVsHRpwPD7m7f2
         4b5kdbq5QzKOky0ezt+yWhNfiAA42d/4qcsBlBJIEA/q6NAJuoeyhi7jkmnmPAeF29UN
         rxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700129548; x=1700734348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhaFfpVqJgGoKXCozqLAMmf/sLVC3yUm3pzsgBTdMG4=;
        b=LHJhPtP25v/ckd7CAMGFjnrwtjiMtIRkX/271/dmg6uakkn0HtqNiJq22VjE+P+4Wr
         c+yTE0Rzm5I4sWUWSE/rHvoUzzqHLsYVzndwICIqyAb4Sn+60Pkfmxt3jdsfluUSrWpZ
         6pESz3s4hU18KO7TuVI9shO/dPsYA8NN/jRBWG1obayPw7MLcVirerWzt7/MxX281LBE
         R5y9ibIGPVzbqJBaMc2x/1D63ywRN43uRwzRO+OH/YY0TMaymZuORupq+Fz+PFffad2/
         O9+QXxphKG6QhhnTqGU5K/P4y0KVBOnPSBwpDeMU330pqITlLwLQHhcW3i0gVxQNwo1C
         T7rQ==
X-Gm-Message-State: AOJu0YwUHw4juJ7TBbFtQfmSCytHBzriiNuqesjCvHPFc9SHrvbXxcNh
	FdD7eSsoHDDLiCElRaVj1q3RSFHmBP00NuDwhOdjJc7hwSq6xsgG
X-Google-Smtp-Source: AGHT+IGO493FTH5Nga22fHGWOfhfWijW+qFSfcR7qeGsqzA6k31EsikJ0C3BCeQcR0M5rGmr1UDLtKQpgrLpfjDTJf8=
X-Received: by 2002:a17:90b:3b83:b0:280:cc73:4c79 with SMTP id
 pc3-20020a17090b3b8300b00280cc734c79mr12707187pjb.7.1700129547996; Thu, 16
 Nov 2023 02:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20231116040749.8430-1-joshua.yeong@starfivetech.com>
In-Reply-To: <20231116040749.8430-1-joshua.yeong@starfivetech.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 16 Nov 2023 15:42:15 +0530
Message-ID: <CAK9=C2UDF+osNRNp4V8JgAK7DKEdOY18s-8dKQUnBZ++fdK8DA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clocksource/timer-risc: Add riscv_clock_shutdown callback
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_021230_240515_53378432 
X-CRM114-Status: GOOD (  14.91  )
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

T24gVGh1LCBOb3YgMTYsIDIwMjMgYXQgOTozOOKAr0FNIEpvc2h1YSBZZW9uZwo8am9zaHVhLnll
b25nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+Cj4gQWRkIGNsb2Nrc291cmNlIGRldGFjaC9z
aHV0ZG93biBjYWxsYmFjayB0byBkaXNhYmxlIFJJU0MtViB0aW1lciBpbnRlcnJ1cHQgd2hlbgo+
IHN3aXRjaGluZyBvdXQgcmlzY3YgdGltZXIgYXMgY2xvY2sgc291cmNlCj4KPiBTaWduZWQtb2Zm
LWJ5OiBKb3NodWEgWWVvbmcgPGpvc2h1YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tPgoKVHlwbyBp
biBwYXRjaCBzdWJqZWN0OiBzL3RpbWVyLXJpc2MvdGltZXItcmlzY3YvCgpPdGhlcndpc2UsIGl0
IGxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZh
dWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvdGlt
ZXItcmlzY3YuYyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gaW5kZXggNTc4NTdjMGRmYmE5Li5lNjZk
Y2JkNjY1NjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5j
Cj4gKysrIGIvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gQEAgLTYxLDEyICs2
MSwxOSBAQCBzdGF0aWMgaW50IHJpc2N2X2Nsb2NrX25leHRfZXZlbnQodW5zaWduZWQgbG9uZyBk
ZWx0YSwKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGludCByaXNjdl9jbG9j
a19zaHV0ZG93bihzdHJ1Y3QgY2xvY2tfZXZlbnRfZGV2aWNlICpldnQpCj4gK3sKPiArICAgICAg
IHJpc2N2X2Nsb2NrX2V2ZW50X3N0b3AoKTsKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+
ICBzdGF0aWMgdW5zaWduZWQgaW50IHJpc2N2X2Nsb2NrX2V2ZW50X2lycTsKPiAgc3RhdGljIERF
RklORV9QRVJfQ1BVKHN0cnVjdCBjbG9ja19ldmVudF9kZXZpY2UsIHJpc2N2X2Nsb2NrX2V2ZW50
KSA9IHsKPiAgICAgICAgIC5uYW1lICAgICAgICAgICAgICAgICAgID0gInJpc2N2X3RpbWVyX2Ns
b2NrZXZlbnQiLAo+ICAgICAgICAgLmZlYXR1cmVzICAgICAgICAgICAgICAgPSBDTE9DS19FVlRf
RkVBVF9PTkVTSE9ULAo+ICAgICAgICAgLnJhdGluZyAgICAgICAgICAgICAgICAgPSAxMDAsCj4g
ICAgICAgICAuc2V0X25leHRfZXZlbnQgICAgICAgICA9IHJpc2N2X2Nsb2NrX25leHRfZXZlbnQs
Cj4gKyAgICAgICAuc2V0X3N0YXRlX3NodXRkb3duICAgICA9IHJpc2N2X2Nsb2NrX3NodXRkb3du
LAo+ICB9Owo+Cj4gIC8qCj4gLS0KPiAyLjI1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
