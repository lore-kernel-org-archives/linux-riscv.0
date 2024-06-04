Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DB1C25B78
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jun 2024 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPuNORxb+HLP0k+FZnyYQBhD78jwPW9s9RP7sZMtSw0=; b=CZERPBfmMZM6Lp
	Tzg7F2LURJMaIxSTUBnrBKnnJT74YtekRquSUW1QdN5Z1mZN1gQcpWDigyGvZAlFzEK1VTrZsMefO
	eFTWT67cg2yv6o1iu7z88uZ07QO7oVO/zJEUh7AyzNSpndruPOyeCGUWAvM3ugPH6r2UtPZ8HyqIG
	e8RLTdiWOTgdtrXCvZ3iCbav0E/cTW1Oe+VURsBer036PPP8AB09irt1VNGdr2vFe1HwugDXQIaMt
	gNJV31ryFsC0/um8iTGzAXST0ZHIKDLgSbvcV//tJeDdTxkTmTzAH+jMEqe7PB5i/GVlSqAdkSww6
	hXGOfeh/Hf3zr9rj0SuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sESae-00000002AKY-0jih;
	Tue, 04 Jun 2024 11:44:32 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sESaa-00000002AIi-1O3m
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jun 2024 11:44:30 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-57a31d63b6bso1204994a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Jun 2024 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717501466; x=1718106266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BXu54JL29te3bk0JIakNdnue3MoNyfA1fQ0KpkafnY=;
        b=DmKZ0sLhCezW0AE8IAEUA6gDqt1qGDIwacuJiT5V77s5oQmH+c8jzk39YIposhAbUR
         1eEsGoySKXeAr6IqMp3zJ2x/62aUtrRhI/BADGku+a3jmmsaT3RqYWklQ8hZSBfaRNRE
         queq9pDEIMgYuS0/Y0QjptKTkJmGgwdD6yWe8QfMVgO484eKarRciyyLPNjmDoj+Q+y5
         14f6X66aEMD4hh/Rr2PKEBFWE/BO5wrn3X2uF2Z6EhwTTeYm8K27IpfRLLByC0vRWgTg
         CKPWrNjCxtAb34A/5apDicmoCwkafDBH/sHtaszgjR5cBFuoTyNkQmKzRspntv/ANDxv
         Y4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717501466; x=1718106266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BXu54JL29te3bk0JIakNdnue3MoNyfA1fQ0KpkafnY=;
        b=tbaUXmNWSPnvqcLi96X3jwt2w7ALOoqx1tK9BJUkHzocdbWqo2ckht9tKadFvjZThg
         z7hGAF21JpBHkULb0nWRfCDKAKAbF04AgnUtiBOu4F79jRVsWZ/HEgGmcbUGTXuq7tF0
         YjzpvtMHcTHwirpuVLwpKfHDU93lvnX8GJOoBotmOEmQ9AHkaWqphBc3tgFoZUI/6276
         xScQVlb5b75rpLu1EN4y2dKqHuVIaE0a+gk71t8b3H5AwUzuf+XdYRVo2fcbA7WyVW6m
         pLngbY111ZChqWQkrlR0FRaGww97gqsxG1bAHiPjIbjSJdyCgIyjPd939te2JBr6wd9Q
         H1GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBKQIzao5x3OGDFiXIk6fQpHT3eRonPhvZ+SsKO48RRRVkO0Snr++d275JKMF55lOpyXO6mXoRnKKzOGPFbt+IRVus+JRQB+Y3tI/1xvGG
X-Gm-Message-State: AOJu0YzVfqrZ8VPo3zFGa0jHn6blGpmTZ1zwdOB403L7UPHyI7c3Dl40
	2P0Db2u6Umv1PqpJwjpvJnGwZKAyN66ycSwwVcoO8YK41kOIkeA2pfmqkg/au8PPm+jIjgECZcY
	F0bhDTYVJEhNqORY6CcUmbZXca0NzHgpPIJ4yXw==
X-Google-Smtp-Source: AGHT+IF5j0HlHcUwqZev1qhJa4XLMrGdrhzyscNN/jd+ZNq5k0ymbm8yvqEpsVyAB4LEq75CK9UuVo8NGyvZXeKaCp4=
X-Received: by 2002:a17:907:7ea1:b0:a68:e9dc:b07 with SMTP id
 a640c23a62f3a-a68e9dc0feemr501609066b.60.1717501465846; Tue, 04 Jun 2024
 04:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240131155929.169961-1-alexghiti@rivosinc.com>
 <20240131155929.169961-4-alexghiti@rivosinc.com> <CAEEQ3wnT-K18R1KQjJbeSdnFnRFQZt=wCuAHeDrf7EohwZ7n=w@mail.gmail.com>
 <CAHVXubiKAY_L04ZwYSp-MpPPT5sPzxm4wB6HVFPzsMcB-3zq9w@mail.gmail.com>
 <CAEEQ3wkkNyrjVCDxprNP5Z=NzO=EYeKeWf3CDvVNJHY1uovmMQ@mail.gmail.com>
 <CAHVXubi+s2Q0y_xLbHpQJpz+yXvKWJ8e96wwAHP6A9C7U-He7g@mail.gmail.com>
 <CAHVXubg4vtfjSJ-w8-7suzZ9L5ZmTo8udUMaYjJ5veKBmikNjA@mail.gmail.com> <20240604-dazzling-envy-1dcf111eb2c5@spud>
In-Reply-To: <20240604-dazzling-envy-1dcf111eb2c5@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 4 Jun 2024 13:44:15 +0200
Message-ID: <CAHVXubhy1yEKOx91gc9S++yKOoQa+sJ5EDSiMFwR6qepwzRMew@mail.gmail.com>
Subject: Re: [External] [PATCH RFC/RFT v2 3/4] riscv: Stop emitting preventive
 sfence.vma for new vmalloc mappings
To: Conor Dooley <conor@kernel.org>
Cc: yunhui cui <cuiyunhui@bytedance.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Ved Shanbhogue <ved@rivosinc.com>, 
	Matt Evans <mev@rivosinc.com>, Dylan Jhong <dylan@andestech.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_044428_526294_46DBDCB3 
X-CRM114-Status: GOOD (  22.48  )
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

T24gVHVlLCBKdW4gNCwgMjAyNCBhdCAxMDo1MuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEp1biAwNCwgMjAyNCBhdCAwOToxNzoyNkFNICsw
MjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBPbiBUdWUsIEp1biA0LCAyMDI0IGF0IDk6
MTXigK9BTSBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+
ID4gPiBPbiBUdWUsIEp1biA0LCAyMDI0IGF0IDg6MjHigK9BTSB5dW5odWkgY3VpIDxjdWl5dW5o
dWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBBcyBmb3IgdGhlIGN1cnJl
bnQgc3RhdHVzIG9mIHRoZSBwYXRjaCwgdGhlcmUgYXJlIHR3byBwb2ludHMgdGhhdCBjYW4KPiA+
ID4gPiBiZSBvcHRpbWl6ZWQ6Cj4gPiA+ID4gMS4gU29tZSBjaGlwIGhhcmR3YXJlIGltcGxlbWVu
dGF0aW9ucyBtYXkgbm90IGNhY2hlIFRMQiBpbnZhbGlkCj4gPiA+ID4gZW50cmllcywgc28gaXQg
ZG9lc24ndCBtYXR0ZXIgd2hldGhlciBzdnZwdGMgaXMgYXZhaWxhYmxlIG9yIG5vdC4gQ2FuCj4g
PiA+ID4gd2UgY29uc2lkZXIgYWRkaW5nIGEgQ09ORklHX1JJU0NWX1NWVlBUQyB0byBjb250cm9s
IGl0Pwo+ID4KPiA+IFRoYXQgd291bGQgcHJvZHVjZSBhIG5vbi1wb3J0YWJsZSBrZXJuZWwuIEJ1
dCBJJ20gbm90IG9wcG9zZWQgdG8gdGhhdAo+ID4gYXQgYWxsLCBsZXQgbWUgY2hlY2sgaG93IHdl
IGhhbmRsZSBvdGhlciBleHRlbnNpb25zLiBNYXliZSBAQ29ub3IKPiA+IERvb2xleSBoYXMgc29t
ZSBmZWVkYmFjayBoZXJlPwo+Cj4gVG8gYmUgaG9uZXN0LCBub3QgcmVhbGx5IHN1cmUgd2hhdCB0
byBnaXZlIGZlZWRiYWNrIG9uLiBDb3VsZCB5b3UKPiBlbGFib3JhdGUgb24gZXhhY3RseSB3aGF0
IHRoZSBvcHRpb24gaXMgZ29pbmcgdG8gZG8/IEdpdmVuIHRoZQo+IHBvcnRhYmlsaXR5IGNvbmNl
cm4sIEkgZ3Vlc3MgeW91IHdlcmUgcHJvcG9zaW5nIHRoYXQgdGhlIG9wdGlvbiB3b3VsZAo+IHJl
bW92ZSB0aGUgcHJldmVudGF0aXZlIGZlbmNlcywgcmF0aGVyIHRoYW4geW91ciBjdXJyZW50IHBh
dGNoIHRoYXQKPiByZW1vdmVzIHRoZW0gdmlhIGFuIGFsdGVybmF0aXZlPwoKTm8gbm8sIEkgd29u
J3QgZG8gdGhhdCwgd2UgbmVlZCBhIGdlbmVyaWMga2VybmVsIGZvciBkaXN0cm9zIHNvIHRoYXQn
cwpub3QgZXZlbiBhIHF1ZXN0aW9uLiBXaGF0IFl1bmh1aSB3YXMgYXNraW5nIGFib3V0ICh0byBt
ZSkgaXM6IGNhbiB3ZQppbnRyb2R1Y2UgYSBLY29uZmlnIG9wdGlvbiB0byBhbHdheXMgcmVtb3Zl
IHRoZSBwcmV2ZW50aXZlIGZlbmNlcywKYnlwYXNzaW5nIHRoZSB1c2Ugb2YgYWx0ZXJuYXRpdmVz
IGFsdG9nZXRoZXI/CgpUbyBtZSwgaXQgd29uJ3QgbWFrZSBhIGRpZmZlcmVuY2UgaW4gdGVybXMg
b2YgcGVyZm9ybWFuY2UuIEJ1dCBpZiB3ZQphbHJlYWR5IG9mZmVyIHN1Y2ggYSBwb3NzaWJpbGl0
eSBmb3Igb3RoZXIgZXh0ZW5zaW9ucywgd2VsbCBJJ2xsIGRvCml0LiBPdGhlcndpc2UsIHRoZSBx
dWVzdGlvbiBpczogc2hvdWxkIHdlIHN0YXJ0IGRvaW5nIHRoYXQ/Cgo+IEkgZG9uJ3QgdGhpbmsg
d2UgaGF2ZSBhbnkgZXh0ZW5zaW9uCj4gcmVsYXRlZCBvcHRpb25zIHRoYXQgd29yayBsaWtlIHRo
YXQgYXQgdGhlIG1vbWVudCwgYW5kIG1ha2luZyB0aGF0IGFuCj4gb3B0aW9uIHdpbGwganVzdCBt
ZWFuIHRoYXQgZGlzdHJvcyB0aGF0IGxvb2sgdG8gY2F0ZXIgZm9yIG11bHRpcGxlCj4gcGxhdGZv
cm1zIHdvbid0IGJlIGFibGUgdG8gdHVybiBpdCBvbi4KPgo+IFRoYW5rcywKPiBDb25vci4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
