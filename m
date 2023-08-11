Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0846EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wescfnqJMsytcHH7G93qFomN+r7IYdHzS4h7rTlqqaY=; b=luwGtdJmzFZDHx
	xbCEbQ3OLczbRUNLJ12NR1Ls+fGvwBLwSfv1VgURxx+IyUZRI7mISkv6CAK4AoH2XcsX2RDZGDFSH
	YG1N0EWJufrkeWXOBZ1a22I9p3ARM5fC66u85bus8lYeKYC7eEx9/HAElbXkcNY3D5z3s7dgkOysF
	psvy9qAON9LhcGJDbxb85AJYQRxgun8Q0HikXuNAGze5saIjXqzW/RW0qIYpy5kkSDJo+USIToau2
	TPFxFejJ9mbwh8G2mostgC/xc68rfZZgTCBzI5D/OJ84Aep83aI3/YdzKhDzvEUOU1yWc9hNzKbmF
	QOv7omjQhknxuFLe7LVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUWm7-00BLkr-2U;
	Fri, 11 Aug 2023 18:22:15 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUWm3-00BLjX-1K
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 18:22:13 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b9e6cc93c6so34767091fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Aug 2023 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1691778128; x=1692382928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8r2XTGoSFK/Ew7sP8+tgqU0eersxAp/UPb63bW1de4=;
        b=Noz59LQMP88FFM7/lbQVcFiwwpbB/XPB2rAhStQDsdmzNpMPmBOJBKZKkqs/E6+xs1
         g2Fr1P0mtADFG6fS7AKkeGk9z75tdsPtanUxIX5qSf7HG8gBjmaJEXL67x2b8VGaC3Xh
         o4E/039x4H9F19sVGMDaF93cTj+lpCrK9NexE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691778128; x=1692382928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8r2XTGoSFK/Ew7sP8+tgqU0eersxAp/UPb63bW1de4=;
        b=XKOvaWXgQpmUJODGQ8ekYXmJL44ANOkBuT5DI3hrak9/RSg2Ok4aXFZkUQM/ECgVzt
         HlcjgXezUWUksuZ9IVmYIUZJKM3VLAHR1VN9ai6f+g0WGpohkVCUy4eyxXCOJiFOgpvJ
         VHLjJyFnd40UftqWFdTHdXoymSxcPDqOKznN+2KlYRS431Kjnm+OJSDdUHHPi6kMSKXZ
         gW1Ka6JW2gTn9OLBLBGg2CUEjIm9ow+sUU8wxgzgACTGvgK4i0CXGITBwLG8pKYOxQOC
         anTxS8QIfnMu+WW5otuzrQWRC4XmCMP++bg9hajqsSQpFWPbFeDMg15RToE3CYo4FyEq
         OaoQ==
X-Gm-Message-State: AOJu0YzddkEeVHMIcP88caOIHh89++xOQtyPB+Z4up4vcmgQnAVJg1Lv
	0XvzP5WuEAEa7CXv3ZFsDQ9YbA0Wh3GdGiXFbk8SDw7tIC18FAzJ+Q==
X-Google-Smtp-Source: AGHT+IHapfAu1BbGq3btuhA/HvbeXQkd1BbdryNDA6Rcye6NSjzJXsiWnv3YfSYB9xYBZAegXGBGDutSUdyY/cUfmuo=
X-Received: by 2002:a2e:9d85:0:b0:2b1:a89a:5f2b with SMTP id
 c5-20020a2e9d85000000b002b1a89a5f2bmr2210137ljj.2.1691778127979; Fri, 11 Aug
 2023 11:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCU+uMF-brnyjA1HLhupYPqL0ebOVu+ivrSn2AewuSrhtBw@mail.gmail.com>
 <ZJphvbTsp6Q4Dfrq@x1> <CAOnJCU+HqEgGpLGb1-4JrSC30rZZ_8Z5h3HMAKUN2xFu-D8uvA@mail.gmail.com>
In-Reply-To: <CAOnJCU+HqEgGpLGb1-4JrSC30rZZ_8Z5h3HMAKUN2xFu-D8uvA@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 11 Aug 2023 11:21:56 -0700
Message-ID: <CAOnJCUKwjqLtneCbdgqde0tDY0fWvBeBbuP8KXQ-vde+X2Rc4Q@mail.gmail.com>
Subject: Re: CFP open for RISC-V MC at Linux Plumbers Conference 2023
To: linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	OpenSBI <opensbi@lists.infradead.org>, U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Drew Fustini <dfustini@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_112211_634479_8685D822 
X-CRM114-Status: GOOD (  14.76  )
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

T24gTW9uLCBKdW4gMjYsIDIwMjMgYXQgMTE6MjHigK9QTSBBdGlzaCBQYXRyYSA8YXRpc2hwQGF0
aXNocGF0cmEub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDI2LCAyMDIzIGF0IDk6MDjigK9Q
TSBEcmV3IEZ1c3RpbmkgPGRmdXN0aW5pQGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
TW9uLCBKdW4gMTksIDIwMjMgYXQgMTI6NTU6MzlQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3JvdGU6
Cj4gPiA+IFRoZSBDRlAgZm9yIHRvcGljIHByb3Bvc2FscyBmb3IgdGhlIFJJU0MtViBtaWNybyBj
b25mZXJlbmNlWzFdIDIwMjMgaXMgb3BlbiBub3cuCj4gPiA+IFBsZWFzZSBzdWJtaXQgeW91ciBw
cm9wb3NhbCBiZWZvcmUgaXQncyB0b28gbGF0ZSEKPiA+Cj4gPiBUaGFua3MgZm9yIHBvc3Rpbmcu
IEkgYW0gbG9va2luZyBmb3J3YXJkIHRvIGl0IQo+ID4KPiA+ID4gVGhlIExpbnV4IHBsdW1iZXJz
IGV2ZW50IHdpbGwgYmUgYm90aCBpbiBwZXJzb24gYW5kIHJlbW90ZQo+ID4gPiAoaHlicmlkKXZp
cnR1YWwgdGhpcyB5ZWFyLiBNb3JlIGRldGFpbHMgY2FuIGJlIGZvdW5kIGhlcmUgWzJdLgo+ID4g
Pgo+ID4gPiBXZSB3aWxsIHN0YXJ0IGFjY2VwdGluZyBwcm9wb3NhbHMgYWZ0ZXIgMTV0aCBBdWd1
c3QgMjAyMyB0byBhdm9pZCBsYXN0Cj4gPiA+IG1pbnV0ZSB2aXNhL3RyYXZlbCBoYXNzbGVzLgo+
ID4gPiBUaGUgY29uZmVyZW5jZSByZWdpc3RyYXRpb24gc2VsbHMgb3V0IHByZXR0eSBxdWlja2x5
IHRvby4gVGh1cywgd2UKPiA+ID4gd291bGQgcHJlZmVyIHRvIHNvcnQgb3V0IHRoZSBzY2hlZHVs
ZSBzb29uZXIgdGhhbiBsYXRlci4KPiA+ID4KCkdlbnRsZSByZW1pbmRlci4gV2Ugd2lsbCBzdGFy
dCBhY2NlcHRpbmcgcHJvcG9zYWxzIGZyb20gbmV4dCB3ZWVrICgxNXRoIEF1Z3VzdCkuCldlIGFy
ZSBwbGFubmluZyB0byBoYXZlIDYtNyBzbG90cyB0aGlzIHllYXIuCgoKPiA+ID4gVGhlIGZpbmFs
IGRlYWRsaW5lIGlzIDE1dGggT2N0b2JlciAyMDIzIHRob3VnaC4KPiA+ID4KCkFzIHBlciBMUEMg
Y29tbWl0dGVlJ3MgcmVjb21tZW5kYXRpb24sIHRoZSBmaW5hbCBkZWFkbGluZSBoYXMgYmVlbgpt
b3ZlZCB0byAxNXRoIHNlcHRlbWJlcgp0byBlYXNlIHRyYXZlbCBhcnJhbmdlbWVudHMuCgo+ID4g
PiBbMV0gaHR0cHM6Ly9scGMuZXZlbnRzL2V2ZW50LzE3L2NvbnRyaWJ1dGlvbnMvMTQxNy8KPiA+
Cj4gPiBJIHRoaW5rIHRoYXQgcGFnZSBpcyBmcm9tIDIwMjIgYW5kIHRoYXQgdGhpcyB3b3VsZCBi
ZSBhIGJldHRlciBsaW5rOgo+Cj4gQ29weSBwYXN0ZSBlcnJvciA6KAo+Cj4gPiBodHRwczovL2xw
Yy5ldmVudHMvYmxvZy9jdXJyZW50L2luZGV4LnBocC8yMDIzLzA2LzIzL3Jpc2Mtdi1taWNyb2Nv
bmZlcmVuY2UtY2ZwLwo+ID4KPgo+IFRoYW5rcy4KPgo+ID4gRHJldwo+Cj4KPgo+IC0tCj4gUmVn
YXJkcywKPiBBdGlzaAoKCgotLSAKUmVnYXJkcywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
