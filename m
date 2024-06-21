Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09499C2BA1A
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 06:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYusS4oD1jfcp9iKcTqlpH+21aUTcizmgD2/oO6IrQk=; b=VjhvXfMUD9ukPO
	UVd0jsdhUEPOwGGUJwuidLmEVhOFQCarwlZcX81HDH+wwGFG9wiUfvXNlr3Frb+v4PUZk1dagMwyW
	5h/YqdsEwxXU6trezKEQl+KMGPnPugwhBBY5+CW+9xas8Si78rRbZhGhlPpHrmPIH3sFQMsbts/ls
	MEH/KsrZ8SSdFiPnhA1pLIUtFha94cKIgeBbyYQ07gc0cEGWz2IEjNU04d4HRKMLGKeFS3+HuwbJg
	jph5aj1m+0SYv9qoe/sM0NyrTKdOwFnIVul02xEEiT5pJbBiZHerobTP0JUEenwvvhRGE32pGiHuV
	X68YfD+vUzK63a2FNJ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXM3-00000007rRM-2eA9;
	Fri, 21 Jun 2024 06:02:35 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXM0-00000007rPw-24ZR
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 06:02:34 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-25cb994dbfeso770193fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 23:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718949750; x=1719554550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HxD6aiQRHkMqcdxegyZAEnOJyWypP6FV0HkREBx3Ho=;
        b=Gv70aa+kFFv/cPNl9xSZu+DOAAJLjxzxGwm4LrLQ9JgnHes3+ZRpkJ8yrkuAxQQw10
         9gbtdJ93YkGmgs6LHmZuWg1Bw//4kjmCOia9PQZwEkoaPDUDhihR7UG94CgmF7lcx2RV
         RHMxqNn5+rp87xQjmqe0sbE3lqfmFUetkhkog6gBFl1O5jh/9JfIot47HX4TCPoIycnI
         5QPRX6w2Tt3zZtwv1UoSf81sxaN0r73A6PBUFuHgWpLWkg0pQw820cA3cUB5FSBvzpOu
         AhISLDJAUVMH39n2c/7LMp064q9j55ApLK0m+vGVOoURfvriA9/cOtr0quT9lKfaJsD3
         /vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718949750; x=1719554550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HxD6aiQRHkMqcdxegyZAEnOJyWypP6FV0HkREBx3Ho=;
        b=vd0OaukuyAKpTTzk+Boncy4kYZl8tGIlo1N7iX9tGupP9ZG7TDRVTElTvgHg7Or1yv
         KPAFhQhRcFrxOURqyOq2PPoWKNG1CJVuiVenFm2EUoOKRyPGAejbUYGyqFr0smkDvPtM
         PhFgTDZYcfcxOQmXzPdqYh/abSJNw5UeKqg5YsicL6R1zOU2NaMvA266htk9rtXz3uPk
         LP0fQTWJk3g2Iafs0Rt/6QIGCQ8LgIpEhGW3SNNdxxYbbuCxFmZfF93zfjAkwiGvkWnL
         4nYOdUjBoF+lbCYV2AQ1u7DADCjOqMW9bB6pT0a8+phKXY2BHh2Kxt/syueOeSd6yPgy
         FWfA==
X-Forwarded-Encrypted: i=1; AJvYcCW46llLW7lT06l7McgGW/ruNm6PhHrxwkJdqB/zOxRrA73t6RUUYXLa/DCwcgMUc1uKqrJxtkQT75OswTaYSpyeX4LQlBMeZ5bvQNl1ruLP
X-Gm-Message-State: AOJu0YyRBOv4LRd0hfjluTzqXQLL29S/GhCjv3hsvD2fLys9AD5nSe0L
	iglBOY7V5vz5nqF3dpsEHCV9s6VdN1FfSbgxDhpmE0e6g3xdDAeSQeGCzlViPf6cr0F2tSjDHBC
	t2WwMcjX9Om63GMDDlxcX5ROgSLBv+noiSOOzaA==
X-Google-Smtp-Source: AGHT+IH3Tt5BVU8ULxGsm/RJPS3eckiZMRRDqh733Kfp6RT5sXNEsu7b3QvzZ8mhpuOUNM+FhYbIB6ZbOWWHFY5Aesg=
X-Received: by 2002:a05:6871:1cc:b0:255:d15:5acf with SMTP id
 586e51a60fabf-25c94d05a09mr8925908fac.36.1718949749951; Thu, 20 Jun 2024
 23:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240618120842.15159-1-cuiyunhui@bytedance.com>
 <ZnTRbptoowL+1GOP@ghost> <CAEEQ3wnNZJviirqWCAG7mXsbynC+=Gq5q4jh6b4yamm8cnzMAw@mail.gmail.com>
 <ZnTvArAQpfCm10tc@ghost>
In-Reply-To: <ZnTvArAQpfCm10tc@ghost>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 21 Jun 2024 14:02:18 +0800
Message-ID: <CAEEQ3w=6EZMFsH2y7efZsX00CzytyMu+Be_RT8CicejMB6qAJA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] RISC-V: cmdline: Add support for 'memmap' parameter
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alexghiti@rivosinc.com, akpm@linux-foundation.org, bhe@redhat.com, 
	rppt@kernel.org, dawei.li@shingroup.cn, jszhang@kernel.org, 
	namcao@linutronix.de, bjorn@rivosinc.com, vishal.moola@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_230232_821568_9A28992B 
X-CRM114-Status: GOOD (  41.93  )
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

SGkgQ2hhcmxpZe+8jAoKT24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMTE6MTDigK9BTSBDaGFybGll
IEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDIx
LCAyMDI0IGF0IDEwOjA4OjM5QU0gKzA4MDAsIHl1bmh1aSBjdWkgd3JvdGU6Cj4gPiBIaSBDaGFy
bGllLAo+ID4KPiA+IE9uIEZyaSwgSnVuIDIxLCAyMDI0IGF0IDk6MDPigK9BTSBDaGFybGllIEpl
bmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBK
dW4gMTgsIDIwMjQgYXQgMDg6MDg6NDJQTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+ID4g
PiBJbXBsZW1lbnQgc3VwcG9ydCBmb3IgcGFyc2luZyAnbWVtbWFwJyBrZXJuZWwgY29tbWFuZCBs
aW5lIHBhcmFtZXRlci4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2ggY292ZXJzIHBhcnNpbmcg
b2YgdGhlIGZvbGxvd2luZyB0d28gZm9ybWF0cyBmb3IgJ21lbW1hcCcKPiA+ID4gPiBwYXJhbWV0
ZXIgdmFsdWVzOgo+ID4gPiA+Cj4gPiA+ID4gLSBubltLTUddQHNzW0tNR10KPiA+ID4gPiAtIG5u
W0tNR10kc3NbS01HXQo+ID4gPiA+Cj4gPiA+ID4gKFtLTUddID0gSyBNIG9yIEcgKGtpbG8sIG1l
Z2EsIGdpZ2EpKQo+ID4gPiA+Cj4gPiA+ID4gVGhlc2UgdHdvIGFsbG93ZWQgZm9ybWF0cyBmb3Ig
cGFyYW1ldGVyIHZhbHVlIGFyZSBhbHJlYWR5IGRvY3VtZW50ZWQKPiA+ID4gPiBpbiBmaWxlIGtl
cm5lbC1wYXJhbWV0ZXJzLnR4dCBpbiBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlIGZvbGRlci4K
PiA+ID4gPiBTb21lIGFyY2hpdGVjdHVyZXMgYWxyZWFkeSBzdXBwb3J0IHRoZW0sIGJ1dCBNaXBz
IGRpZCBub3QgcHJpb3IgdG8KPiA+ID4KPiA+ID4gQ29weS1wYXN0ZSBmcm9tIGEgTWlwcyBwYXRj
aD8gU2hvdWxkIHNheSByaXNjdiA6KQo+ID4gPgo+ID4gPiBJdCBsb29rcyBsaWtlIHRoaXMgY29k
ZSBpcyBkdXBsaWNhdGVkIGZyb20geHRlbnNhIGFuZCBpcyBlZmZlY3RpdmVseSB0aGUKPiA+ID4g
c2FtZSBhcyBtaXBzLiBDYW4gdGhpcyBjb2RlIGJlIHBsYWNlZCBpbiBhIGdlbmVyaWMgZmlsZSBz
byB0aGF0IHRoZSBjb2RlCj4gPiA+IGNhbiBiZSBzaGFyZWQgYmV0d2VlbiBtaXBzLCByaXNjdiwg
YW5kIHh0ZW5zYSAtLSBtYXliZSBhIG5ldyBjb25maWcgdGhhdAo+ID4gPiBnZXRzIHNlbGVjdGVk
IGJ5IG1pcHMvcmlzY3YveHRlbnNhPwo+ID4KPiA+IFllYWgsIHRoYXQncyBhY3R1YWxseSB3aGF0
IEkgd2FzIHRoaW5raW5nLiBXaGljaCBnZW5lcmFsIGZpbGUgZG8geW91Cj4gPiB0aGluayB3b3Vs
ZCBiZSBtb3JlIHN1aXRhYmxlIHRvIHB1dCBpdCBpbj8KPgo+IEkgYW0gbm90IHN1cmUgdGhlIGJl
c3QgcGxhY2UgdG8gcHV0IGl0LiBXaGF0IGRvIHlvdSB0aGluayBhYm91dAo+IG1tL21lbWJsb2Nr
LmMgbmV4dCB0byB0aGUgIm1lbWJsb2NrIiBlYXJseSBwYXJhbT8KCklzIGl0IGluYXBwcm9wcmlh
dGUgdG8gcHV0IGl0IGluIG1lbWJsb2NrPyBUaGUgaW1wbGVtZW50YXRpb24gb2YgbWlwcwppcyBk
aWZmZXJlbnQgZnJvbSB0aGF0IG9mIHh0ZW5zYSwgYW5kIGVhcmx5X21lbSBpcyBhbHNvIGRpc3Ry
aWJ1dGVkIGluCnZhcmlvdXMgYXJjaHMsIHNvIHdlIHN0aWxsIHB1dCBtZW1tYXAgaW4gcmlzY3Yv
LCBhbmQgdGhlbiBJIHdpbGwKbW9kaWZ5IHRoZSBjb21taXQgbG9nLgpXaGF0IGRvIHlvdSB0aGlu
az8KCj4KPiA+Cj4gPiA+IC0gQ2hhcmxpZQo+ID4gPgo+ID4gPiA+IHRoaXMgcGF0Y2guCj4gPiA+
ID4KPiA+ID4gPiBFeGNlcnB0IGZyb20gRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwt
cGFyYW1ldGVycy50eHQ6Cj4gPiA+ID4KPiA+ID4gPiBtZW1tYXA9bm5bS01HXUBzc1tLTUddCj4g
PiA+ID4gW0tOTF0gRm9yY2UgdXNhZ2Ugb2YgYSBzcGVjaWZpYyByZWdpb24gb2YgbWVtb3J5Lgo+
ID4gPiA+IFJlZ2lvbiBvZiBtZW1vcnkgdG8gYmUgdXNlZCBpcyBmcm9tIHNzIHRvIHNzK25uLgo+
ID4gPiA+Cj4gPiA+ID4gbWVtbWFwPW5uW0tNR10kc3NbS01HXQo+ID4gPiA+IE1hcmsgc3BlY2lm
aWMgbWVtb3J5IGFzIHJlc2VydmVkLgo+ID4gPiA+IFJlZ2lvbiBvZiBtZW1vcnkgdG8gYmUgcmVz
ZXJ2ZWQgaXMgZnJvbSBzcyB0byBzcytubi4KPiA+ID4gPiBFeGFtcGxlOiBFeGNsdWRlIG1lbW9y
eSBmcm9tIDB4MTg2OTAwMDAtMHgxODY5ZmZmZgo+ID4gPiA+IG1lbW1hcD02NEskMHgxODY5MDAw
MAo+ID4gPiA+IG9yCj4gPiA+ID4gbWVtbWFwPTB4MTAwMDAkMHgxODY5MDAwMAo+ID4gPiA+Cj4g
PiA+ID4gVGhlcmUgaXMgbm8gbmVlZCB0byB1cGRhdGUgdGhpcyBkb2N1bWVudGF0aW9uIGZpbGUg
d2l0aCByZXNwZWN0IHRvCj4gPiA+ID4gdGhpcyBwYXRjaC4KPiA+ID4gPgo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gPiA+IC0t
LQo+ID4gPiA+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDUwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNl
cnRpb25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0
LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gPiA+IGluZGV4IGUzNDA1ZTRiOTlhZi4uN2Jl
N2VjMzA5MmFkIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiA+
ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+ID4gPiBAQCAtMjA4LDYgKzIwOCw1NiBA
QCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9tZW0oY2hhciAqcCkKPiA+ID4gPiAgfQo+ID4gPiA+
ICBlYXJseV9wYXJhbSgibWVtIiwgZWFybHlfbWVtKTsKPiA+ID4gPgo+ID4gPiA+ICtzdGF0aWMg
dm9pZCBfX2luaXQgcGFyc2VfbWVtbWFwX29uZShjaGFyICpwKQo+ID4gPiA+ICt7Cj4gPiA+ID4g
KyAgICAgY2hhciAqb2xkcDsKPiA+ID4gPiArICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0X2F0LCBt
ZW1fc2l6ZTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgaWYgKCFwKQo+ID4gPiA+ICsgICAgICAg
ICAgICAgcmV0dXJuOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICBvbGRwID0gcDsKPiA+ID4gPiAr
ICAgICBtZW1fc2l6ZSA9IG1lbXBhcnNlKHAsICZwKTsKPiA+ID4gPiArICAgICBpZiAocCA9PSBv
bGRwKQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gPiA+ICsKPiA+ID4gPiArICAg
ICBzd2l0Y2ggKCpwKSB7Cj4gPiA+ID4gKyAgICAgY2FzZSAnQCc6Cj4gPiA+ID4gKyAgICAgICAg
ICAgICBzdGFydF9hdCA9IG1lbXBhcnNlKHAgKyAxLCAmcCk7Cj4gPiA+ID4gKyAgICAgICAgICAg
ICBtZW1ibG9ja19hZGQoc3RhcnRfYXQsIG1lbV9zaXplKTsKPiA+ID4gPiArICAgICAgICAgICAg
IGJyZWFrOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICBjYXNlICckJzoKPiA+ID4gPiArICAgICAg
ICAgICAgIHN0YXJ0X2F0ID0gbWVtcGFyc2UocCArIDEsICZwKTsKPiA+ID4gPiArICAgICAgICAg
ICAgIG1lbWJsb2NrX3Jlc2VydmUoc3RhcnRfYXQsIG1lbV9zaXplKTsKPiA+ID4gPiArICAgICAg
ICAgICAgIGJyZWFrOwo+ID4gPiA+ICsKPiA+ID4gPiArICAgICBjYXNlIDA6Cj4gPiA+ID4gKyAg
ICAgICAgICAgICBtZW1ibG9ja19yZXNlcnZlKG1lbV9zaXplLCAtbWVtX3NpemUpOwo+ID4gPiA+
ICsgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgIGRlZmF1bHQ6Cj4g
PiA+ID4gKyAgICAgICAgICAgICBwcl93YXJuKCJVbnJlY29nbml6ZWQgbWVtbWFwIHN5bnRheDog
JXNcbiIsIHApOwo+ID4gPiA+ICsgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ID4gKyAgICAgfQo+
ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICtzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9tZW1t
YXBfb3B0KGNoYXIgKnN0cikKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgIHdoaWxlIChzdHIpIHsK
PiA+ID4gPiArICAgICAgICAgICAgIGNoYXIgKmsgPSBzdHJjaHIoc3RyLCAnLCcpOwo+ID4gPiA+
ICsKPiA+ID4gPiArICAgICAgICAgICAgIGlmIChrKQo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAqaysrID0gMDsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgICBwYXJzZV9tZW1t
YXBfb25lKHN0cik7Cj4gPiA+ID4gKyAgICAgICAgICAgICBzdHIgPSBrOwo+ID4gPiA+ICsgICAg
IH0KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiA+ID4gK30KPiA+ID4gPiAr
ZWFybHlfcGFyYW0oIm1lbW1hcCIsIHBhcnNlX21lbW1hcF9vcHQpOwo+ID4gPiA+ICsKPiA+ID4g
PiAgc3RhdGljIHZvaWQgX19pbml0IHNldHVwX2Jvb3RtZW0odm9pZCkKPiA+ID4gPiAgewo+ID4g
PiA+ICAgICAgIHBoeXNfYWRkcl90IHZtbGludXhfZW5kID0gX19wYV9zeW1ib2woJl9lbmQpOwo+
ID4gPiA+IC0tCj4gPiA+ID4gMi4yMC4xCj4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0Cj4gPiA+ID4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
ID4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKPiA+Cj4gPiBUaGFua3MsCj4gPiBZdW5odWkKClRoYW5rcywKWXVuaHVpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
