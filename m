Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3BFC021BB
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MUh3cho/+vvFdne8uWoAqPtGhoKXSVHVnfGVUa0Fso=; b=RojMaop0lMohMb
	vCXjvu4eS++5BGK85LW/4R0hOC9WONr3VPQZ1SGw0+kDUYptdy+6YECHl1JRc0w8jBLFCP7jXCSxi
	5DS4BFP5lsi9a5MVcM06DRyFQ+KjuVimzuihKeNOfzcdurZBAjRG5HlyQNJFrpzJ4SyayISpi7EDp
	68oYgr4Eh6Nl5nAuSJZ+cRyuhcUnKybwFV8tk9hrFH3YKK5jWJzhDY4cLEEpVSSQ8EQ0AQ78QbCuK
	nljLP7vIEqgbGW6Cy8P6NYaf8TmWsaDFsuOtA7nIgdgysEU4Uv/GjGnxog2vHJwjy1oEuu70cTGmd
	rvApPWcjeow+ZmXWMLvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxxw-00000000H9y-1kfm;
	Tue, 25 Feb 2025 16:39:28 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvax-0000000HTJi-3HoV
	for linux-riscv@lists.infradead.org;
	Tue, 25 Feb 2025 14:07:37 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e0b70fb1daso7335681a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2025 06:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740492454; x=1741097254; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52CPMxSHvISiy3Wem3SvA0rcU6ZBPvQeZSq+VknVkPQ=;
        b=GQasY+39GGtFsAA/Max2K27oU4utn1wimoJV+BQJYxSTVuUeMTyYSLM2ACYxE46hgl
         gBkTZnxQskJIbXLZBPz3ZLO8BIBDWbQTIHzw4QJCSgwKFf9mCjt8ZMl6jwy+dMdSENyq
         Sgoo9o6UNOKv55pzmWIui1lQSEbHxeH/YsAode4KOl00XyA7e8nxkaU6phXQdRGUezS0
         TT9Jl0RXnvD3s2rNUavlmSwAzWW6x8YaouJyGmWh8giP7r118LMW/kf9Vt1N/61lzbZQ
         b9O3qC+SF7VHuQZrO5hxyuBIaT1w+oV1VDNIN+yUDk/icymXQ3Q+kAxRUILUrhoZEtYF
         mt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740492454; x=1741097254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52CPMxSHvISiy3Wem3SvA0rcU6ZBPvQeZSq+VknVkPQ=;
        b=KZ3gL8nhyUpGmq9l6uhzBtZ27Y7YAwA+1woSC5/Yxbik6mPz1VaeKtIg3a2Me1C8I0
         9z9LItr7vvsZW24FAKaCN5jePD8JqdRjn8gXc7OW9gechYT5OTtAyd3BFjIFv8tlk7jM
         TEK0Wq1Ei4vrn/NvHXGgRsDaNg6sBgp0V5Rli4MX41BEXnT/3eLbwOKJS3swrlpoLkuA
         2zyto3za15wADahPWd+6q16a05rWJqg5jwgk8mn6TONX2dS1VNJiOLYOI2UdkbrWiCK7
         xEfWklpKkW7+XcG4HPyBc0n6TxzIn9krWWw30Xde8JDaX3z6ipCChcRU5rJ7qKmNfb0s
         w/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCWFIOr2rIPFAjkvg6cMwzk7SzcRTdTYpBzZkqp5Qx1poXqyB044KZG55PepKR6Tps81C6zdPmece+cN/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrJc5CRGbB8Pju1gRyxStrUUaIzvlh6zqjy+03J7FFg+SvmOWp
	v0X0w2GWN2HFHm8YAfqGP+RoqsCLwyxIIlbIHV4vQkIYET5ZuOVB4HcVy2Dp1S1zyyL/FWFf6iw
	8sTuNiZKUBxjlyL3B8p/DGB4/y5JsTlwfIPNSog==
X-Gm-Gg: ASbGncsFsl85gDqnmMVZwrUlu4IibWhIm79lsJJI6Aexb9Uf/0Srs1DktF4Y7pYX/55
	t1JSrOjbGIwcwCZXlqXbmcxlY7NYDpY/iDDaKYmqU1jc2/UKrPXxt3WZ/VIozXHVR4FigzR78M2
	NET6H1T6k=
X-Google-Smtp-Source: AGHT+IEQN2EDCAAeHFkbNRXvx783uJdY53BszHXjfFa/MVQdphVBraQZDPpAVQvXLTkAQT+0PQSNrmUIWMt1Q9RBz8w=
X-Received: by 2002:a05:6402:42c9:b0:5d3:cff5:634f with SMTP id
 4fb4d7f45d1cf-5e0b721e1famr17991883a12.24.1740492454054; Tue, 25 Feb 2025
 06:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
 <CAHVXubhapunBD_+cZ=WeEp9GPJec795xOWSnMKmh_iSH09r2Yw@mail.gmail.com> <CAEEQ3wkeLrTFVqVZEAYSsROSLHzkC-EeKvuPHmW=qH3CxamwhA@mail.gmail.com>
In-Reply-To: <CAEEQ3wkeLrTFVqVZEAYSsROSLHzkC-EeKvuPHmW=qH3CxamwhA@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 25 Feb 2025 15:07:23 +0100
X-Gm-Features: AQ5f1Jq1ao-dkwxD2tcF7rBD5LcSaT1gKrmPFXFhH7IkW09oLtBAZAZXrkzMTtc
Message-ID: <CAHVXubhCOivB8oxG7gcCNKTfK0DgHdu721SxsyGX2E4XAjbi6w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 0/3] Enable Zicbom in usermode
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: ajones@ventanamicro.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_060735_820702_F9808E66 
X-CRM114-Status: GOOD (  23.73  )
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

T24gVHVlLCBGZWIgMjUsIDIwMjUgYXQgMjoyN+KAr1BNIHl1bmh1aSBjdWkgPGN1aXl1bmh1aUBi
eXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEhpIEFsZXgsCj4KPiBPbiBUdWUsIEZlYiAyNSwgMjAy
NSBhdCA5OjIx4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3
cm90ZToKPiA+Cj4gPiBIaSBZdW5odWksCj4gPgo+ID4gT24gV2VkLCBKYW4gMTUsIDIwMjUgYXQg
Mzo0MOKAr0FNIFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPiA+
ID4KPiA+ID4gdjEvdjI6Cj4gPiA+IFRoZXJlIGlzIG9ubHkgdGhlIGZpcnN0IHBhdGNoOiBSSVND
LVY6IEVuYWJsZSBjYm8uY2xlYW4vZmx1c2ggaW4gdXNlcm1vZGUsCj4gPiA+IHdoaWNoIG1haW5s
eSByZW1vdmVzIHRoZSBlbmFibGluZyBvZiBjYm8uaW52YWwgaW4gdXNlciBtb2RlLgo+ID4gPgo+
ID4gPiB2MzoKPiA+ID4gQWRkIHRoZSBmdW5jdGlvbmFsaXR5IG9mIEV4cG9zZSBaaWNib20gYW5k
IHNlbGZ0ZXN0cyBmb3IgWmljYm9tLgo+ID4gPgo+ID4gPiB2NDoKPiA+ID4gTW9kaWZ5IHRoZSBv
cmRlciBvZiBtYWNyb3MsIFRoZSB0ZXN0X25vX2Nib19pbnZhbCBmdW5jdGlvbiBpcyBhZGRlZAo+
ID4gPiBzZXBhcmF0ZWx5Lgo+ID4gPgo+ID4gPiB2NToKPiA+ID4gMS4gTW9kaWZ5IHRoZSBvcmRl
ciBvZiBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT01fQkxPQ0tfU0laRSBpbiBod3Byb2JlLnJzdAo+
ID4gPiAyLiAiVEVTVF9OT19aSUNCT0lOVkFMIiAtPiAiVEVTVF9OT19DQk9fSU5WQUwiCj4gPiA+
Cj4gPiA+IFl1bmh1aSBDdWkgKDMpOgo+ID4gPiAgIFJJU0MtVjogRW5hYmxlIGNiby5jbGVhbi9m
bHVzaCBpbiB1c2VybW9kZQo+ID4gPiAgIFJJU0MtVjogaHdwcm9iZTogRXhwb3NlIFppY2JvbSBl
eHRlbnNpb24gYW5kIGl0cyBibG9jayBzaXplCj4gPiA+ICAgUklTQy1WOiBzZWxmdGVzdHM6IEFk
ZCBURVNUX1pJQ0JPTSBpbnRvIENCTyB0ZXN0cwo+ID4gPgo+ID4gPiAgRG9jdW1lbnRhdGlvbi9h
cmNoL3Jpc2N2L2h3cHJvYmUucnN0ICAgICAgICB8ICA2ICsrCj4gPiA+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2h3cHJvYmUuaCAgICAgICAgICAgIHwgIDIgKy0KPiA+ID4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggICAgICAgfCAgMiArCj4gPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICAgICAgICAgIHwgIDggKysrCj4gPiA+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jICAgICAgICAgICAgIHwgIDYgKysKPiA+ID4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMgfCA2NiArKysrKysrKysrKysr
KysrKy0tLS0KPiA+ID4gIDYgZmlsZXMgY2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIuMzkuMgo+ID4gPgo+ID4KPiA+IFNvIGEg
djYgbmVlZHMgdG8gYmUgc2VudCB3aXRoOgo+ID4KPiA+IC0gdGhlIGZpeCBmb3IgaHdwcm9iZV9l
eHQwX2hhcygpIHJlcG9ydGVkIGJ5IGtlcm5lbCB0ZXN0IHJvYm90Cj4gPiAtIGEgcmViYXNlIG9u
IHRvcCBvZiA2LjE0IHNpbmNlIHBhdGNoIDIgd2lsbCBjb25mbGljdCB3aXRoCj4gPiBSSVNDVl9I
V1BST0JFX0tFWV9WRU5ET1JfRVhUX1RIRUFEXzAKPgo+IFRoYW5rIHlvdSBmb3IgdGhlIHJlbWlu
ZGVyLiBJbiBmYWN0LCB2ZXJzaW9uIDYgd2FzIHNlbnQgb3V0IGFsbW9zdCBhCj4gbW9udGggYWdv
LiBSZWZlcmVuY2U6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI1MDEyNDAzNTk1
OS40NTQ5OS0xLWN1aXl1bmh1aUBieXRlZGFuY2UuY29tLwoKT2ggc29ycnksIEkgbWlzc2VkIGl0
IHNvbWVob3chCgpJIHRoaW5rIHdlIGNhbiBmaXggUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdoZW4g
bWVyZ2luZyB0aGUgcGF0Y2guCgpTb3JyeSBhZ2FpbiBhbmQgdGhhbmtzIQoKQWxleAoKPgo+ID4K
PiA+IERvIHlvdSB0aGluayB5b3UgY2FuIGRvIHRoYXQgc29vbiBzbyB0aGF0IGl0IGdldHMgbWVy
Z2VkIGluIDYuMTU/IFRoZQo+ID4gcGF0Y2hzZXQgcmVjZWl2ZWQgYSBsb3Qgb2YgUkIgc28gaXQg
d291bGQgYmUgdG9vIGJhZCB0byBtaXNzIHRoaXMKPiA+IHJlbGVhc2UuCj4gPgo+ID4gVGhhbmtz
LAo+ID4KPiA+IEFsZXgKPgo+IFRoYW5rcywKPiBZdW5odWkKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
