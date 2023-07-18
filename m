Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50823EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X94pHrBXB2NsNfuuRyWryaqllyh0vsNwD9kG7yMid9o=; b=iHFKllJVdkvaCx
	OOR9wY6um4EB//XX5hH4MPiiQgoK37kTLPdYN210mp/B3p+Y+RPCsOZFwQFAuJo/iWkG5u2VnnShr
	yXJg4pK+ZcBfBD5W5BvUv9E71htBdpUi72lDASoO3ZpCNef2TFUkM2MVX1L3D8w47oIChWtnfzaKR
	v1pW36Z4zmPadLjBTQfgxUZlLIfWYvU39NS8/j7hdtmUqeTfCV4FDxB2t/ClTnZk2xiuWLlyI0FuB
	lBPKDxWgs2liL3fvh7w+DCQNPqBeDtXxd28MnVJ8zg+5ClbctVzKPrRqmYHb0RZvPcuq0fbVQ5h9j
	FptYVDSz0x1cZ/Synafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Za-005gat-02;
	Wed, 19 Jul 2023 06:22:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0ZY-005gZn-1V
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MQcjDzMAzlRozW1RPujrpQZ4VH1P5tCP35WnE5FcHBE=; b=h9M6xVhlWoOunvpIpJ9WqMOpGa
	YORGQhFqnEHVG8F88K6ZIXbiNFji0zZ7tIj62h1uuUt5GGAdGp8JItg3liKNgfvgIF+CAAjQXfRrC
	Xi4oWh+yBNEFz41RPIsfuHqf3YW2Md5vau7WxYDPW6lQxAjwIe/ArhPgDm4QQq9tLwLVOEsP0IKFa
	0A2BnaVZjTrnlkeF1GQPDeDuRfN35Z0HyrAtT6zlcu3NkDaaFZx2z4LPmMI7pbCkNOhPmGylKg0gp
	MzYI0SHBs48ISxDnCRzIYqQmIaCau09UFU1sVkhVUf5H3YTgolPd/JEqGGk0NT0ARWBV5VElSIgoK
	PNEOTLCg==;
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLpiS-00BswK-38
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 18:46:35 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b8392076c9so76999241fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 11:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1689705928; x=1692297928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQcjDzMAzlRozW1RPujrpQZ4VH1P5tCP35WnE5FcHBE=;
        b=r1k7qnUmhCTSWZGAs71mSrDWoBX/Fdfp8ciPXPeO79WEvaW14u2V2twf8H8hPmlrwq
         v7XOvVUuIH5xSIvMoXKzrpO9pfxG9Ll9caqXglrV6tB0s4I7PWvWpmyi6TlfHvMq4yb7
         fxujR2cDW42G0RZwaYhCmMyyaRdQe8UtnKA4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689705928; x=1692297928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQcjDzMAzlRozW1RPujrpQZ4VH1P5tCP35WnE5FcHBE=;
        b=KxZzKR8HlpiTbc+iPEDhJK5NNpGWEE0chyDGI6GiPeIV4sKrEY/BlMhnGDxz5Dul/E
         +R50nSjECH7xlk7QqGvOARCZXHpR3EV5gEGU8XBw/Db3Ftrn0gXUiiqDB976WLqhg7cP
         r4hWTidodLg6u9cpLooABwWN9LXZVIpWShEcKsbJAgPYnYFEVWz14mOHtMkcorVoCwZd
         PujPHdlK/X0/j7Lt0pqYjoi6e2WITddgm9rgAf/RjublyZFQjgVNiwXaq6oai3plNBw5
         9hCdEXOUnRldGuYsMKmsK6SOXXC0giedxlcTP4oqgvLxrt+3KmxNsaGu1N+mHnX3pExk
         NVNw==
X-Gm-Message-State: ABy/qLY/aTpS/4LaSrdY/avfOkTjitj5Vs/zavYALXZpXW5oeSZ0u8a4
	ML9x0iut7fYBIEV8+gxJLTeTX2tILhmP5Be8fovz
X-Google-Smtp-Source: APBJJlHLou947zMltu5m9xW4Za9OZOwIq/iPUwzG6P9FaszY4ZwbDsZ0RuUADIU6B09s7vukUf9+BkUVhiPNJSdUFQA=
X-Received: by 2002:a2e:2c19:0:b0:2b6:ad79:a4fb with SMTP id
 s25-20020a2e2c19000000b002b6ad79a4fbmr11475404ljs.1.1689705927456; Tue, 18
 Jul 2023 11:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
 <DDB4EEB8-12A0-4E66-8E96-808E84A82078@remlab.net> <CAOnJCU+ee=FXWp7mz_Tn07TbRBb3eXLFBqyRBAJbhQTO-Jxvrw@mail.gmail.com>
 <4761144.fSbbhVQpq0@basile.remlab.net>
In-Reply-To: <4761144.fSbbhVQpq0@basile.remlab.net>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 18 Jul 2023 11:45:15 -0700
Message-ID: <CAOnJCUJreDYWZcSRr-pb1vwRg_LyU7TBG+b_9Ys8rVmM8_fvgA@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] riscv: Allow userspace to directly access perf counters
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aurelien Jarno <aurelien@aurel32.net>, Mathieu Malaterre <malat@debian.org>, 
	Jan Newger <jannewger@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_194633_415005_2823CD84 
X-CRM114-Status: GOOD (  39.61  )
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

T24gVHVlLCBKdWwgMTgsIDIwMjMgYXQgMTA6MDbigK9BTSBSw6ltaSBEZW5pcy1Db3VybW9udCA8
cmVtaUByZW1sYWIubmV0PiB3cm90ZToKPgo+ICAgICAgICAgSGksCj4KPiBMZSB0aWlzdGFpbmEg
MTguIGhlaW7DpGt1dXRhIDIwMjMsIDIuMjIuNTQgRUVTVCBBdGlzaCBQYXRyYSBhIMOpY3JpdCA6
Cj4gPiA+IEFGQUlLLCBpZiB0aGUgZGVmYXVsdCBzZXR0aW5ncyBicmVha3MgdXNlciBzcGFjZSwg
dGhlIHBhdGNoc2V0IGlzCj4gPiA+IGNvbnNpZGVyZWQgdG8gYnJlYWsgdXNlciBzcGFjZS4gVGhh
dCBiZWluZyB0aGUgY2FzZSwgZWl0aGVyIHRoaXMgY2FzZSBpcwo+ID4gPiBkZWVtZWQgc3BlY2lh
bCBlbm91Z2ggdGhhdCBicmVha2luZyB1c2VyIHNwYWNlIGlzIE9LLCBvciBpdCBpcyBub3QuCj4K
PiA+IFRoaXMgY2FzZSBpcyBhIHNwZWNpYWwgY2FzZSBhcyB0aGUgdXNhZ2Ugd2FzIGluY29ycmVj
dCBpbiB0aGUgZmlyc3QKPiA+IHBsYWNlLgo+Cj4gSSBhZ3JlZSB0aGF0IGl0J3Mgbm90IG9ubHkg
aW5zZWN1cmUgYnV0IGFsc28gaW5jb3JyZWN0LiBIb3dldmVyIGl0IG1vc3RseQo+IHdvcmtzLiBJ
biBmYWN0IEkgZG9uJ3QgZGlzYWdyZWUgd2l0aCB0aGUgY2hhbmdlIGFzIHN1Y2gsIGJ1dCBJIHRo
aW5rIHRoYXQgdGhlCj4gY29tbWl0IG1lc3NhZ2VzIGFyZSBtaXNsZWFkaW5nIGFuZCBjb25mdXNp
bmcuIEZvciBhIHN0YXJ0LCBpbiBvbmUgcGxhY2UgaXQKPiBzYXlzIHRoYXQgaXQgaXMgbm90IGJy
ZWFraW5nIHVzZXIgc3BhY2UgYW5kIGluIGFub3RoZXIgaXQgc2F5cyBiYXNpY2FsbHkgdGhlCj4g
b3Bwb3NpdGUuCj4KCkFncmVlZC4gV2Ugd2lsbCBpbXByb3ZlIHRoZSBjb21taXQgbWVzc2FnZSB0
byBjbGFyaWZ5IHRoYXQuIFRoYXQncyBhbHNvIHRoZQpyZWFzb24gSSBzdGFydGVkIHRoaXMgd2hv
bGUgdGhyZWFkIDopCgo+IChVbmZvcnR1bmF0ZWx5LCBub3QgZXZlcnlib2R5IGFncmVlcyB3aXRo
IHRoZSBjaGFuZ2UuIEkgY2FuJ3Qgc2VlbSB0byBnZXQKPiBGRm1wZWcncyBjaGVja2FzbSB0b29s
IGZpeGVkOgo+IGh0dHA6Ly9mZm1wZWcub3JnL3BpcGVybWFpbC9mZm1wZWctZGV2ZWwvMjAyMy1K
dWx5LzMxMjI0NS5odG1sICkKPgoKV2h5IGNhbid0IHJkdGltZShlcXVpdmFsZW50IG9mIHJkdHNj
KSBiZSB1c2VkIGluc3RlYWQgb2YgcmRjeWNsZSA/CldoYXQgZG9lcyBpdCB1c2UgaW4geDg2ID8g
SXQgYWxzbyBkb2Vzbid0IGFsbG93IHJlYWRpbmcgY3ljbGUgY291bnRlcgpieSBkZWZhdWx0LgoK
VGhlIHBlcmYgc3lzY2FsbCBvdmVyaGVhZCBpcyBqdXN0IG9uZSB0aW1lIHNldHVwIHRoaW5nIGR1
cmluZyB0aGUKc3RhcnQgb2YgdGhlIGFwcGxpY2F0aW9uLgpGb3IgY291bnRpbmcgdGhlIGN5Y2xl
cyBiZWZvcmUvYWZ0ZXIgYSBsb29wLCBpdCBzdGlsbCBwcm92aWRlcyBhCmRpcmVjdCBDU1IgYWNj
ZXNzIGluIHVzZXIgbW9kZS4KCj4gQWxzbyB0aGlzIGlzIG5vdCB0aGUgZmlyc3QgdGltZSBzb21l
Ym9keSBhcmd1ZXMgdGhhdCBhbiBBUEkgc2hvdWxkIGJlIHJlbW92ZWQKPiBiZWNhdXNlIGl0J3Mg
YnJva2VuLiBUaGF0J3Mgbm90IHNwZWNpYWwuCj4KPiA+IEFueSBhcHBsaWNhdGlvbiB0aGF0IGdl
bnVpbmVseSByZXF1aXJlcyByZGN5Y2xlIGNhbiBhbHdheXMgZ2V0Cj4gPiBpdCBub3cgdmlhIHRo
ZSBwZXJmIGludGVyZmFjZS4KPgo+IFN1cmUuIEJ1dCB0aGUgcXVlc3Rpb24gaXMgd2hldGhlciBp
dCBicmVha3MgdXNlciBzcGFjZSBhbmQgaWYgc28sIHdoZXRoZXIKPiB0aGF0J3MgYWNjZXB0YWJs
ZS4gRXhpc3RpbmcgYXBwcyB0aGF0IGNhbGwgUkRDWUNMRSB3aWxsIG5vdyBmYWlsLCBwcmVzdW1i
bHkKPiByZWNlaXZlIFNJR0lMTCg/KS4KPgoKWWVzLiBXaXRoIHRoaXMgY2hhbmdlcyBpdCB3aWxs
IHJlY2VpdmUgU0lHSUxMIGlmIHRoZSBkZWZhdWx0IGlzIE5PIEFDQ0VTUy4KWW91IGNhbiBjaGFu
Z2UgdGhlIHN5c2N0bCBwYXJhbWV0ZXIgdG8gZW5hYmxlIHRoZSBkaXJlY3QgYWNjZXNzIHRob3Vn
aAphbmQgbWFrZSBpdCB3b3JrIHRob3VnaC4KCj4gPiBJZiB0aGUgaW5zZWN1cmUgYW5kIGluY29y
cmVjdCBiZWhhdmlvciBpcyBhbGxvd2VkLCB3ZSBzdXNwZWN0IHRoZSB1c2VyCj4gPiBzcGFjZSBi
ZWhhdmlvciB3aWxsIG5ldmVyIGJlIGZpeGVkIGFzIGl0IGlzIGhhcmQgdG8gcHV0IGEgZnV0dXJl
IGZsYWcKPiA+IGRhdGUgaW4gdGhlc2UgY2FzZXMuCj4KPiBGb3IgYmV0dGVyIG9yIHdvcnNlLCBJ
IGNhbiBvbmx5IGFncmVlIHRoZXJlLiBCdXQgdGhlbiBhZGRpbmcgYW4gb3B0aW9uIHRvCj4gcHJl
c2VydmUgdGhlIGJyb2tlbiBiZWhhdmlvdXIgaXMgYmVnZ2luZyBmb3IgcGVvcGxlIHRvIChhYil1
c2UgaXQsIGFuZCBpbmRlZWQKPiBuZXZlciBmaXggdGhlIHByb2JsZW0sIGFuZCBuZXZlciBiZSBh
YmxlIHRvIHJlbW92ZSB0aGUgb3B0aW9uLgo+Cgp4ODYgc3RpbGwgY2FycmllcyB0aGF0IG9wdGlv
bi4gU28gSSBkb24ndCB0aGluayBvbmNlIGdldCBkb3duIHBhdGgsIGl0CndpbGwgdmVyeSBkaWZm
aWN1bHQgdG8gcmVtb3ZlIGl0LgoKPiA+ID4gSWYgaXQgaXMgbm90IE9LLCB0aGVuIHRoZSBvbmx5
IHdheSBvdXQgdGhhdCBJIGNhbiB0aGluayBvZiwgY29uc2lzdHMgb2YKPiA+ID4gdHJhcHBpbmcg
YW5kIGVtdWxhdGluZyB0aGUgY291bnRlcnMsIHJldHVybmluZyB0aGUgc2FtZSBzYW5pdGlzZWQg
dmFsdWVzCj4gPiA+IHRoYXQgTGludXggcGVyZiB3b3VsZCByZXR1cm4uIFRoZW4geW91IGNhbiBh
ZGQgYSBrZXJuZWwgY29uZmlnIG9wdGlvbiB0bwo+ID4gPiBkaXNhYmxlIHRoYXQgdHJhcC1hbmQt
ZW11bGF0aW9uIGNvZGUgaW4gdGhlIGZ1dHVyZS4KPiA+IFdoYXQgZG8geW91IG1lYW4gYnkgInNh
bml0aXNlZCIgdmFsdWUgPwo+Cj4gSSBtZWFuIHdoYXRldmVyIGF2b2lkcyBjcmVhdGluZyBhIHNl
Y3VyaXR5IGlzc3VlLiBQcmVzdW1hYmx5IHJlcG9ydCB0aGUgbnVtYmVyCj4gb2YgY3ljbGVzIHNw
ZW50IGluIHRoZSBjYWxsaW5nIHRocmVhZCBhbmQgaW4gdXNlciBtb2RlIHNpbmNlIHRoZSBmaXJz
dCB0aW1lCj4gdGhhdCB0aGUgcHJvY2VzcyBjYWxsZWQgUkRDWUNMRT8KPgo+IE1heWJlIGl0J3Mg
bm90IHJlYXNvbmFibGUgZm9yIGNvbXBsZXhpdHkgb3IgcGVyZm9ybWFuY2UgcmVhc29ucywgYnV0
IHRoZW4gSU1PLAo+IGl0IGRlc2VydmVzIGEgbGl0dGxlIGJpdCBiZXR0ZXIgZXhwbGFpbmluZyBp
biB0aGUgY29tbWl0IG1lc3NhZ2UuCj4KClllcy4gSSBiZWxpZXZlIHRoZSBjb21wbGV4aXRpZXMg
YW5kIHRocm93YXdheSBjb2RlIChhc3N1bWluZyB3ZSBzaG91bGQKc3RvcCBkb2luZyB0aGF0IGlu
IHRoZSBsb25nIHJ1bikKaXMgbm90IHdvcnRoIGl0IGdpdmVuIHRoYXQgd2UgaGF2ZSBhIHBlcmZl
Y3RseSB2YWxpZCBpbnRlcmZhY2UgdmlhCnBlcmYgd2l0aG91dCBhbnkgcGVyZm9ybWFuY2Ugc2Fj
cmlmaWNlLgpSSVNDLVYgaXMgbm90IHRoZSBmaXJzdCBvbmUgdG8gZG8gaXQuIEl0IGlzIGRpc2Fi
bGVkIGJ5IGRlZmF1bHQgZm9yCkFSTTY0L3g4NiBhcyB3ZWxsLgoKSWYgdGhlIGFwcGxpY2F0aW9u
IHVzYWdlIHdhcyBsZWdhbCBhbmQgd2UgaGF2ZSB5ZWFycyBvZiBzb2Z0d2FyZQpkZXZlbG9wbWVu
dCByZWx5aW5nIG9uIHRoYXQsIGl0IG1pZ2h0IGhhdmUKbWFkZSBzZW5zZSAoZS5nLiB4ODYgbGVn
YWN5IHVzYWdlKS4gSG93ZXZlciwgUklTQy1WIGlzIHN0aWxsIHlvdW5nIHRvCmF2b2lkIHRob3Nl
IHBpdGZhbGxzLgoKPiAtLQo+IOmbt+exs+KAp+W+t+WwvC3lupPlsJTokpkKPiBodHRwOi8vd3d3
LnJlbWxhYi5uZXQvCj4KPgo+CgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
