Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42301C2BA18
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 03:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zn6gz3axexVdcIaRp/rYVbA5ITcj4wa9QWpDmcTiktw=; b=cWZvTxurCzzCjs
	uMY903QochzYHJFIdB7vwyOSFlsgQXuPRBHMU1liC8TssOUz1dZLtL20bz+6qKDFbbP01VNTmNYSN
	Fbg3Ez/xLG7xCBQNajS6GICzTPSfo+vPle0iXxQ5ZUtuPhcbNMDcWSxQ/17WK0lQ9ZcPg3FyGmIJu
	dk78smP4RB5fm2fVCbHOpPewi60etiMqSujwMq8lyY7l+11P43yyRLbDQ0TjVpu9IyzvnXe3ul4pW
	7Xvs2r5WDLTzqd2QA2lhBwN1D7CvOOZBY6fMSBKyOOYz6D+SOBKfgJFJPlJpSVUUGjWsYr7EOWi6g
	DTy3/bjZJarLVGnK6BGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKUf6-00000007WUE-36U0;
	Fri, 21 Jun 2024 03:10:04 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKUf3-00000007WTO-1XB3
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 03:10:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f47f07aceaso12301625ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 20:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718939400; x=1719544200; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0v4GHVLko6b2d6yCPPJ+7mz46mQ9AAseTgFJ3I+E9Ss=;
        b=mo+n2Waq3eB2rDI3lVz24gmvnbSjH38/HXivyqH9ZHqKrQI0YANcnIX1DmMvtSBeW/
         xPkhND40UY2CxDlX3qqeeFXNgbTHaaEGysW7iVUQnGAQzdRCMpQhRpjLlwgfEEcuZUNc
         k/yef2cZQRXkrwCvS1GLyjoX+47E+Pf1ie1RmZM+wasaa0HLbp21ciP5IWnBSBBa43Ej
         LdZvMNxZYX3YqY9AV26ao4N1lLVE5N5lVFsuBQf3n62TQfyfX/rIXi5yOQCnBgl2dNOE
         U6tuIVRKHEvv+wW2idVdwWULOJ7h5Jvp6cpajIslIpR2CDtlUV080WkEXegUXLE/ps2D
         SnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718939400; x=1719544200;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0v4GHVLko6b2d6yCPPJ+7mz46mQ9AAseTgFJ3I+E9Ss=;
        b=EWOp7r+F92TVJcZJ5FE/qFmcN1FCkG0oXE4TppNjZvXNgdzzeKzEMeHFl7Qh4VIJqW
         8vPuOQpJuNzAET+RMgLflsCSptuIVeLTmk9hL2uNqxA34dBrCv8BMUViaC7fTX/VoIbQ
         QJm6hWKDzIkX6I1u8O66C1YZeMZ++T43TCZDfd3tVNNISCJvDi75YIJVTXwmUP8iXKWT
         tBmax3094noc5vnxgED4d4Dpon3r9cbPr01dUw9FSm/VscRFqKwUXrHhFQisBU0hq8CC
         ECVo3da4XhJ011dijOnHx+4bnJtVevj2Q9WuZZqXTQOzsRwmGXWRW27ZpJtxuW6k/Yrw
         Y3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVKVwdKNArukNe6F7yj2xIk4IUWP7qNL0S5lUllUSfQUc/H0gK3ah4Gb7V0+Tk1oilsUbjCNWkjd0zqQkJjQ5DIrpbVvx9uJyQhKLeHU7V
X-Gm-Message-State: AOJu0Yy9MfzkCX2s/AnwgpRbZMdz1uvnu9+1/3T3HfqN88n20OmMOTwz
	R88KPj/v+fKiYIy6dxj11RobUEDHoS3+ZS5xIRez4Jh3Gw1YVnY3SVRRoCARxP8=
X-Google-Smtp-Source: AGHT+IFFY2CE7Fj0jGtDzkU4sKdGCQMRvDZCbXWHqL9tztfL9yqPx3keG5JRhkAANqhTh3TGHFGhmA==
X-Received: by 2002:a17:903:32d1:b0:1f9:c52f:d9b5 with SMTP id d9443c01a7336-1f9c52fdcefmr46099765ad.66.1718939400383;
        Thu, 20 Jun 2024 20:10:00 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:c36f:e04a:309e:a49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c644fsm3537945ad.145.2024.06.20.20.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 20:09:59 -0700 (PDT)
Date: Thu, 20 Jun 2024 20:09:54 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com, akpm@linux-foundation.org, bhe@redhat.com,
	rppt@kernel.org, dawei.li@shingroup.cn, jszhang@kernel.org,
	namcao@linutronix.de, bjorn@rivosinc.com, vishal.moola@gmail.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [External] Re: [PATCH] RISC-V: cmdline: Add support for 'memmap'
 parameter
Message-ID: <ZnTvArAQpfCm10tc@ghost>
References: <20240618120842.15159-1-cuiyunhui@bytedance.com>
 <ZnTRbptoowL+1GOP@ghost>
 <CAEEQ3wnNZJviirqWCAG7mXsbynC+=Gq5q4jh6b4yamm8cnzMAw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wnNZJviirqWCAG7mXsbynC+=Gq5q4jh6b4yamm8cnzMAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_201001_552591_7CF55B5E 
X-CRM114-Status: GOOD (  39.01  )
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

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMTA6MDg6MzlBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBDaGFybGllLAo+IAo+IE9uIEZyaSwgSnVuIDIxLCAyMDI0IGF0IDk6MDPigK9BTSBD
aGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBU
dWUsIEp1biAxOCwgMjAyNCBhdCAwODowODo0MlBNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+
ID4gPiBJbXBsZW1lbnQgc3VwcG9ydCBmb3IgcGFyc2luZyAnbWVtbWFwJyBrZXJuZWwgY29tbWFu
ZCBsaW5lIHBhcmFtZXRlci4KPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBjb3ZlcnMgcGFyc2luZyBv
ZiB0aGUgZm9sbG93aW5nIHR3byBmb3JtYXRzIGZvciAnbWVtbWFwJwo+ID4gPiBwYXJhbWV0ZXIg
dmFsdWVzOgo+ID4gPgo+ID4gPiAtIG5uW0tNR11Ac3NbS01HXQo+ID4gPiAtIG5uW0tNR10kc3Nb
S01HXQo+ID4gPgo+ID4gPiAoW0tNR10gPSBLIE0gb3IgRyAoa2lsbywgbWVnYSwgZ2lnYSkpCj4g
PiA+Cj4gPiA+IFRoZXNlIHR3byBhbGxvd2VkIGZvcm1hdHMgZm9yIHBhcmFtZXRlciB2YWx1ZSBh
cmUgYWxyZWFkeSBkb2N1bWVudGVkCj4gPiA+IGluIGZpbGUga2VybmVsLXBhcmFtZXRlcnMudHh0
IGluIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUgZm9sZGVyLgo+ID4gPiBTb21lIGFyY2hpdGVj
dHVyZXMgYWxyZWFkeSBzdXBwb3J0IHRoZW0sIGJ1dCBNaXBzIGRpZCBub3QgcHJpb3IgdG8KPiA+
Cj4gPiBDb3B5LXBhc3RlIGZyb20gYSBNaXBzIHBhdGNoPyBTaG91bGQgc2F5IHJpc2N2IDopCj4g
Pgo+ID4gSXQgbG9va3MgbGlrZSB0aGlzIGNvZGUgaXMgZHVwbGljYXRlZCBmcm9tIHh0ZW5zYSBh
bmQgaXMgZWZmZWN0aXZlbHkgdGhlCj4gPiBzYW1lIGFzIG1pcHMuIENhbiB0aGlzIGNvZGUgYmUg
cGxhY2VkIGluIGEgZ2VuZXJpYyBmaWxlIHNvIHRoYXQgdGhlIGNvZGUKPiA+IGNhbiBiZSBzaGFy
ZWQgYmV0d2VlbiBtaXBzLCByaXNjdiwgYW5kIHh0ZW5zYSAtLSBtYXliZSBhIG5ldyBjb25maWcg
dGhhdAo+ID4gZ2V0cyBzZWxlY3RlZCBieSBtaXBzL3Jpc2N2L3h0ZW5zYT8KPiAKPiBZZWFoLCB0
aGF0J3MgYWN0dWFsbHkgd2hhdCBJIHdhcyB0aGlua2luZy4gV2hpY2ggZ2VuZXJhbCBmaWxlIGRv
IHlvdQo+IHRoaW5rIHdvdWxkIGJlIG1vcmUgc3VpdGFibGUgdG8gcHV0IGl0IGluPwoKSSBhbSBu
b3Qgc3VyZSB0aGUgYmVzdCBwbGFjZSB0byBwdXQgaXQuIFdoYXQgZG8geW91IHRoaW5rIGFib3V0
Cm1tL21lbWJsb2NrLmMgbmV4dCB0byB0aGUgIm1lbWJsb2NrIiBlYXJseSBwYXJhbT8KCj4gCj4g
PiAtIENoYXJsaWUKPiA+Cj4gPiA+IHRoaXMgcGF0Y2guCj4gPiA+Cj4gPiA+IEV4Y2VycHQgZnJv
bSBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dDoKPiA+ID4K
PiA+ID4gbWVtbWFwPW5uW0tNR11Ac3NbS01HXQo+ID4gPiBbS05MXSBGb3JjZSB1c2FnZSBvZiBh
IHNwZWNpZmljIHJlZ2lvbiBvZiBtZW1vcnkuCj4gPiA+IFJlZ2lvbiBvZiBtZW1vcnkgdG8gYmUg
dXNlZCBpcyBmcm9tIHNzIHRvIHNzK25uLgo+ID4gPgo+ID4gPiBtZW1tYXA9bm5bS01HXSRzc1tL
TUddCj4gPiA+IE1hcmsgc3BlY2lmaWMgbWVtb3J5IGFzIHJlc2VydmVkLgo+ID4gPiBSZWdpb24g
b2YgbWVtb3J5IHRvIGJlIHJlc2VydmVkIGlzIGZyb20gc3MgdG8gc3Mrbm4uCj4gPiA+IEV4YW1w
bGU6IEV4Y2x1ZGUgbWVtb3J5IGZyb20gMHgxODY5MDAwMC0weDE4NjlmZmZmCj4gPiA+IG1lbW1h
cD02NEskMHgxODY5MDAwMAo+ID4gPiBvcgo+ID4gPiBtZW1tYXA9MHgxMDAwMCQweDE4NjkwMDAw
Cj4gPiA+Cj4gPiA+IFRoZXJlIGlzIG5vIG5lZWQgdG8gdXBkYXRlIHRoaXMgZG9jdW1lbnRhdGlv
biBmaWxlIHdpdGggcmVzcGVjdCB0bwo+ID4gPiB0aGlzIHBhdGNoLgo+ID4gPgo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiA+ID4gLS0t
Cj4gPiA+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDUwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9u
cygrKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNo
L3Jpc2N2L21tL2luaXQuYwo+ID4gPiBpbmRleCBlMzQwNWU0Yjk5YWYuLjdiZTdlYzMwOTJhZCAx
MDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+ID4gKysrIGIvYXJjaC9y
aXNjdi9tbS9pbml0LmMKPiA+ID4gQEAgLTIwOCw2ICsyMDgsNTYgQEAgc3RhdGljIGludCBfX2lu
aXQgZWFybHlfbWVtKGNoYXIgKnApCj4gPiA+ICB9Cj4gPiA+ICBlYXJseV9wYXJhbSgibWVtIiwg
ZWFybHlfbWVtKTsKPiA+ID4KPiA+ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBwYXJzZV9tZW1tYXBf
b25lKGNoYXIgKnApCj4gPiA+ICt7Cj4gPiA+ICsgICAgIGNoYXIgKm9sZHA7Cj4gPiA+ICsgICAg
IHVuc2lnbmVkIGxvbmcgc3RhcnRfYXQsIG1lbV9zaXplOwo+ID4gPiArCj4gPiA+ICsgICAgIGlm
ICghcCkKPiA+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiA+ICsKPiA+ID4gKyAgICAgb2xk
cCA9IHA7Cj4gPiA+ICsgICAgIG1lbV9zaXplID0gbWVtcGFyc2UocCwgJnApOwo+ID4gPiArICAg
ICBpZiAocCA9PSBvbGRwKQo+ID4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gKwo+ID4g
PiArICAgICBzd2l0Y2ggKCpwKSB7Cj4gPiA+ICsgICAgIGNhc2UgJ0AnOgo+ID4gPiArICAgICAg
ICAgICAgIHN0YXJ0X2F0ID0gbWVtcGFyc2UocCArIDEsICZwKTsKPiA+ID4gKyAgICAgICAgICAg
ICBtZW1ibG9ja19hZGQoc3RhcnRfYXQsIG1lbV9zaXplKTsKPiA+ID4gKyAgICAgICAgICAgICBi
cmVhazsKPiA+ID4gKwo+ID4gPiArICAgICBjYXNlICckJzoKPiA+ID4gKyAgICAgICAgICAgICBz
dGFydF9hdCA9IG1lbXBhcnNlKHAgKyAxLCAmcCk7Cj4gPiA+ICsgICAgICAgICAgICAgbWVtYmxv
Y2tfcmVzZXJ2ZShzdGFydF9hdCwgbWVtX3NpemUpOwo+ID4gPiArICAgICAgICAgICAgIGJyZWFr
Owo+ID4gPiArCj4gPiA+ICsgICAgIGNhc2UgMDoKPiA+ID4gKyAgICAgICAgICAgICBtZW1ibG9j
a19yZXNlcnZlKG1lbV9zaXplLCAtbWVtX3NpemUpOwo+ID4gPiArICAgICAgICAgICAgIGJyZWFr
Owo+ID4gPiArCj4gPiA+ICsgICAgIGRlZmF1bHQ6Cj4gPiA+ICsgICAgICAgICAgICAgcHJfd2Fy
bigiVW5yZWNvZ25pemVkIG1lbW1hcCBzeW50YXg6ICVzXG4iLCBwKTsKPiA+ID4gKyAgICAgICAg
ICAgICBicmVhazsKPiA+ID4gKyAgICAgfQo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMg
aW50IF9faW5pdCBwYXJzZV9tZW1tYXBfb3B0KGNoYXIgKnN0cikKPiA+ID4gK3sKPiA+ID4gKyAg
ICAgd2hpbGUgKHN0cikgewo+ID4gPiArICAgICAgICAgICAgIGNoYXIgKmsgPSBzdHJjaHIoc3Ry
LCAnLCcpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgaWYgKGspCj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAqaysrID0gMDsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgIHBhcnNl
X21lbW1hcF9vbmUoc3RyKTsKPiA+ID4gKyAgICAgICAgICAgICBzdHIgPSBrOwo+ID4gPiArICAg
ICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiA+ICt9Cj4gPiA+ICtlYXJseV9w
YXJhbSgibWVtbWFwIiwgcGFyc2VfbWVtbWFwX29wdCk7Cj4gPiA+ICsKPiA+ID4gIHN0YXRpYyB2
b2lkIF9faW5pdCBzZXR1cF9ib290bWVtKHZvaWQpCj4gPiA+ICB7Cj4gPiA+ICAgICAgIHBoeXNf
YWRkcl90IHZtbGludXhfZW5kID0gX19wYV9zeW1ib2woJl9lbmQpOwo+ID4gPiAtLQo+ID4gPiAy
LjIwLjEKPiA+ID4KPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gPiA+IGxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo+IAo+IFRoYW5rcywKPiBZdW5odWkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
