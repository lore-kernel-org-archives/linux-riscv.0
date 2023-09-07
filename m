Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5271AEB8FD7
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VfmO4xsHURJUctLe/pdIpG1QDT7SRGUQfI52AtRv2fY=; b=BXEs+LBUp0491WsSC6BAjLh+Be
	F0ztNMpCHdqAcD25BPsrHgL9HaenI6o0UnGrId4PsLDkPZYUUDRqQh2ph5USXelx49AhszWNLIUTA
	AwhgOiHOEsE7dcEtkMS5Rd8D214uGYyB8NfZG2TeS9YPQ356gMixO3UD4fhuqJG/8FlsnjyaMlz2h
	mDFGlC8jkwWKDJIEpsJkJupfFWKPf6hClthM0BruJtIvlKsazLmRGNnaCYBUIq4qUuU7F+HwL3h1E
	EZj9aA4VHznP2KDHzt0dA81UllKupaCah4gcymPsnT7NJzD3EnOnnic3e6RS1d2Zu2oKXJgKx+Gtt
	JwTqxKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDQ8-00C13U-2J;
	Thu, 07 Sep 2023 11:43:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDQ5-00C12J-2I
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 11:43:35 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-31f6ddb3047so728970f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Sep 2023 04:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694087006; x=1694691806; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90u68D9H+JLsBVvyuV4vyLydDhUwYz9a13aqB1Txjj4=;
        b=P+SYQlNeqpq+FH0JX3K2r9yrVOFzG+JBOm0X4Bvm9lc5QStOz+6D3/vWq8M3pUXvt4
         pGBvcOlD3PPtepfExwY4nCtdG8gX1MBkDd0Tncf1JOg+sTDwQ4piGM65+VyeCxrujKBD
         AomUU0s9T/TP2s4ZXXxdSMUsrzSR+vmoKgTuSa+euIAk2HFvDqVqXfWnxqPLzAJM6Kc6
         dJpLb29USyDFAJcACPuigoe6xzf/jGZPLL0ymjz1WHI7nbfmPMvGJfSIXvwFNL0098qn
         DYcPjf2+/FXznqzHit58O9SiONsjJ0EvVJTUJaOBA5QJYycCIOAR5dbAqZjHp1MNrMAk
         KGiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694087006; x=1694691806;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90u68D9H+JLsBVvyuV4vyLydDhUwYz9a13aqB1Txjj4=;
        b=E4f5Aq42NKo8e0KPgFndL2pcbPOHRj5vXCd1dkUw2C0Mo9Zr1TyaLXtdjEloXdZB9d
         K0+21BTC8P2M9kkxAESt24KiOPLR0fQT9XfWQTvgIp09muYHzWV2IWbcPg17zvjI2lkC
         mfW/YlJVu8Bj7Bd97dzFCzRFJ8MTDYQJVExPBHMeOEWTSOXl+eQiMuZu9GxxE7OnaJIF
         maQYPr3d2uGSkP7cL4H4hiAYL9L/WCX2OPtWHJvMMjye9mxKGdmadsPVAKwArt3kvFAo
         sMDcapWu2Z7Zs6LCONmCJLbgDe1KheF4UPcydYacDHehjzYCswmhkrSCGSSxcCXH3bZp
         DY7Q==
X-Gm-Message-State: AOJu0Yx++l7hZlcnPWGg3QRvzn3IePDHCIpipDoPdI20R1ENoJEWE4T2
	/4Mo4ba8HM1eExV6v868YE+JjQyNlbjgdiysYzlmEA==
X-Google-Smtp-Source: AGHT+IFhYlmhCf4jB46umRXIi/Py9M4QQfQzziUEI4I0Mn9rPBWre08kyQfiO58iQvTBTthkqsMkE0/cCHt2BZ4oIXs=
X-Received: by 2002:a05:6000:4ec:b0:314:3c84:4da2 with SMTP id
 cr12-20020a05600004ec00b003143c844da2mr4681376wrb.13.1694087006274; Thu, 07
 Sep 2023 04:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230901123043.73700-1-cuiyunhui@bytedance.com>
In-Reply-To: <20230901123043.73700-1-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 7 Sep 2023 19:43:15 +0800
Message-ID: <CAEEQ3wm6BOMFXr78kb6J5tGXgfNu1fJcvTg=sw4QT2ZeWYQTVQ@mail.gmail.com>
Subject: Re: [PATCH v5] riscv: add userland instruction dump to RISC-V splats
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	guoren@kernel.org, bjorn@rivosinc.com, conor.dooley@microchip.com, 
	jszhang@kernel.org, andy.chiu@sifive.com, cuiyunhui@bytedance.com, 
	dave.hansen@linux.intel.com, elver@google.com, glider@google.com, 
	cyphar@cyphar.com, kirill.shutemov@linux.intel.com, keescook@chromium.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_044334_016732_A06C2078 
X-CRM114-Status: GOOD (  22.37  )
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

SGkgQmrDtnJuLAoKCk9uIEZyaSwgU2VwIDEsIDIwMjMgYXQgODozMOKAr1BNIFl1bmh1aSBDdWkg
PGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+IEFkZCB1c2VybGFuZCBpbnN0cnVj
dGlvbiBkdW1wIGFuZCByZW5hbWUgZHVtcF9rZXJuZWxfaW5zdHIoKQo+IHRvIGR1bXBfaW5zdHIo
KS4KPgo+IEFuIGV4YW1wbGU6Cj4gWyAgICAwLjgyMjQzOV0gRnJlZWluZyB1bnVzZWQga2VybmVs
IGltYWdlIChpbml0bWVtKSBtZW1vcnk6IDY5MTZLCj4gWyAgICAwLjgyMzgxN10gUnVuIC9pbml0
IGFzIGluaXQgcHJvY2Vzcwo+IFsgICAgMC44Mzk0MTFdIGluaXRbMV06IHVuaGFuZGxlZCBzaWdu
YWwgNCBjb2RlIDB4MSBhdCAweDAwMDAwMDAwMDAwNWJlMTggaW4gYmJbMTAwMDArNWZiMDAwXQo+
IFsgICAgMC44NDA3NTFdIENQVTogMCBQSUQ6IDEgQ29tbTogaW5pdCBOb3QgdGFpbnRlZCA1LjE0
LjAtcmM0LTAwMDQ5LWdiZDY0NDI5MGFhNzItZGlydHkgIzE4Nwo+IFsgICAgMC44NDEzNzNdIEhh
cmR3YXJlIG5hbWU6ICAsIEJJT1MKPiBbICAgIDAuODQxNzQzXSBlcGMgOiAwMDAwMDAwMDAwMDVi
ZTE4IHJhIDogMDAwMDAwMDAwMDA3OWU3NCBzcCA6IDAwMDAwMDNmZmZjYWZkYTAKPiBbICAgIDAu
ODQyMjcxXSAgZ3AgOiBmZmZmZmZmZjgxNmU5ZGM4IHRwIDogMDAwMDAwMDAwMDAwMDAwMCB0MCA6
IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAgIDAuODQyOTQ3XSAgdDEgOiAwMDAwMDAzZmZmYzlmZGYw
IHQyIDogMDAwMDAwMDAwMDAwMDAwMCBzMCA6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAgIDAuODQz
NDM0XSAgczEgOiAwMDAwMDAwMDAwMDAwMDAwIGEwIDogMDAwMDAwM2ZmZmNhMDE5MCBhMSA6IDAw
MDAwMDNmZmZjYWZlMTgKPiBbICAgIDAuODQzODkxXSAgYTIgOiAwMDAwMDAwMDAwMDAwMDAwIGEz
IDogMDAwMDAwMDAwMDAwMDAwMCBhNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAgIDAuODQ0MzU3
XSAgYTUgOiAwMDAwMDAwMDAwMDAwMDAwIGE2IDogMDAwMDAwMDAwMDAwMDAwMCBhNyA6IDAwMDAw
MDAwMDAwMDAwMDAKPiBbICAgIDAuODQ0ODAzXSAgczIgOiAwMDAwMDAwMDAwMDAwMDAwIHMzIDog
MDAwMDAwMDAwMDAwMDAwMCBzNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAgIDAuODQ1MjUzXSAg
czUgOiAwMDAwMDAwMDAwMDAwMDAwIHM2IDogMDAwMDAwMDAwMDAwMDAwMCBzNyA6IDAwMDAwMDAw
MDAwMDAwMDAKPiBbICAgIDAuODQ1NzIyXSAgczggOiAwMDAwMDAwMDAwMDAwMDAwIHM5IDogMDAw
MDAwMDAwMDAwMDAwMCBzMTA6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAgIDAuODQ2MTgwXSAgczEx
OiAwMDAwMDAwMDAwZDE0NGUwIHQzIDogMDAwMDAwMDAwMDAwMDAwMCB0NCA6IDAwMDAwMDAwMDAw
MDAwMDAKPiBbICAgIDAuODQ2NjE2XSAgdDUgOiAwMDAwMDAwMDAwMDAwMDAwIHQ2IDogMDAwMDAw
MDAwMDAwMDAwMAo+IFsgICAgMC44NDcyMDRdIHN0YXR1czogMDAwMDAwMDIwMDAwMDAyMCBiYWRh
ZGRyOiAwMDAwMDAwMGYwMDI4MDUzIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDAyCj4gWyAgICAwLjg0
ODIxOV0gQ29kZTogZjA2ZiBmZjVmIDM4MjMgZmExMSAwMTEzIGZiMDEgMmUyMyAwMjAxIDAyOTMg
MDAwMCAoODA1MykgZjAwMgo+IFsgICAgMC44NTEwMTZdIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5j
aW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0ISBleGl0Y29kZT0weDAwMDAwMDA0Cj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZdW5odWkgQ3VpIDxjdWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4KPiAtLS0KPiAg
YXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyB8IDE5ICsrKysrKysrKysrKysrKystLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
LmMKPiBpbmRleCBmNzk4Yzg1M2JlZGUuLjkyM2I0OWMzODk4NSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+
IEBAIC0zMyw3ICszMywxOSBAQCBpbnQgc2hvd191bmhhbmRsZWRfc2lnbmFscyA9IDE7Cj4KPiAg
c3RhdGljIERFRklORV9TUElOTE9DSyhkaWVfbG9jayk7Cj4KPiAtc3RhdGljIHZvaWQgZHVtcF9r
ZXJuZWxfaW5zdHIoY29uc3QgY2hhciAqbG9nbHZsLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiAr
c3RhdGljIGludCBjb3B5X2NvZGUoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHUxNiAqdmFsLCBjb25z
dCB1MTYgKmluc25zKQo+ICt7Cj4gKyAgICAgICBpZiAoIXVzZXJfbW9kZShyZWdzKSkKPiArICAg
ICAgICAgICAgICAgcmV0dXJuIGdldF9rZXJuZWxfbm9mYXVsdCgqdmFsLCBpbnNucyk7Cj4gKwo+
ICsgICAgICAgLyogVGhlIHVzZXIgc3BhY2UgY29kZSBmcm9tIG90aGVyIHRhc2tzIGNhbm5vdCBi
ZSBhY2Nlc3NlZC4gKi8KPiArICAgICAgIGlmIChyZWdzICE9IHRhc2tfcHRfcmVncyhjdXJyZW50
KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FUEVSTTsKPiArCj4gKyAgICAgICByZXR1cm4g
Y29weV9mcm9tX3VzZXJfbm9mYXVsdCh2YWwsIGluc25zLCBzaXplb2YoKnZhbCkpOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgdm9pZCBkdW1wX2luc3RyKGNvbnN0IGNoYXIgKmxvZ2x2bCwgc3RydWN0IHB0
X3JlZ3MgKnJlZ3MpCj4gIHsKPiAgICAgICAgIGNoYXIgc3RyW3NpemVvZigiMDAwMCAiKSAqIDEy
ICsgMiArIDFdLCAqcCA9IHN0cjsKPiAgICAgICAgIGNvbnN0IHUxNiAqaW5zbnMgPSAodTE2ICop
aW5zdHJ1Y3Rpb25fcG9pbnRlcihyZWdzKTsKPiBAQCAtNDIsNyArNTQsNyBAQCBzdGF0aWMgdm9p
ZCBkdW1wX2tlcm5lbF9pbnN0cihjb25zdCBjaGFyICpsb2dsdmwsIHN0cnVjdCBwdF9yZWdzICpy
ZWdzKQo+ICAgICAgICAgaW50IGk7Cj4KPiAgICAgICAgIGZvciAoaSA9IC0xMDsgaSA8IDI7IGkr
Kykgewo+IC0gICAgICAgICAgICAgICBiYWQgPSBnZXRfa2VybmVsX25vZmF1bHQodmFsLCAmaW5z
bnNbaV0pOwo+ICsgICAgICAgICAgICAgICBiYWQgPSBjb3B5X2NvZGUocmVncywgJnZhbCwgJmlu
c25zW2ldKTsKPiAgICAgICAgICAgICAgICAgaWYgKCFiYWQpIHsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBwICs9IHNwcmludGYocCwgaSA9PSAwID8gIiglMDRoeCkgIiA6ICIlMDRoeCAiLCB2
YWwpOwo+ICAgICAgICAgICAgICAgICB9IGVsc2Ugewo+IEBAIC03MSw3ICs4Myw3IEBAIHZvaWQg
ZGllKHN0cnVjdCBwdF9yZWdzICpyZWdzLCBjb25zdCBjaGFyICpzdHIpCj4gICAgICAgICBwcmlu
dF9tb2R1bGVzKCk7Cj4gICAgICAgICBpZiAocmVncykgewo+ICAgICAgICAgICAgICAgICBzaG93
X3JlZ3MocmVncyk7Cj4gLSAgICAgICAgICAgICAgIGR1bXBfa2VybmVsX2luc3RyKEtFUk5fRU1F
UkcsIHJlZ3MpOwo+ICsgICAgICAgICAgICAgICBkdW1wX2luc3RyKEtFUk5fRU1FUkcsIHJlZ3Mp
Owo+ICAgICAgICAgfQo+Cj4gICAgICAgICBjYXVzZSA9IHJlZ3MgPyByZWdzLT5jYXVzZSA6IC0x
Owo+IEBAIC0xMDQsNiArMTE2LDcgQEAgdm9pZCBkb190cmFwKHN0cnVjdCBwdF9yZWdzICpyZWdz
LCBpbnQgc2lnbm8sIGludCBjb2RlLCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gICAgICAgICAgICAg
ICAgIHByaW50X3ZtYV9hZGRyKEtFUk5fQ09OVCAiIGluICIsIGluc3RydWN0aW9uX3BvaW50ZXIo
cmVncykpOwo+ICAgICAgICAgICAgICAgICBwcl9jb250KCJcbiIpOwo+ICAgICAgICAgICAgICAg
ICBfX3Nob3dfcmVncyhyZWdzKTsKPiArICAgICAgICAgICAgICAgZHVtcF9pbnN0cihLRVJOX0VN
RVJHLCByZWdzKTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgZm9yY2Vfc2lnX2ZhdWx0KHNpZ25v
LCBjb2RlLCAodm9pZCBfX3VzZXIgKilhZGRyKTsKPiAtLQo+IDIuMjAuMQo+CgpUaGlzIHBhdGNo
IGhhcyBiZWVuIHBhc3NlZDoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xp
bnV4LXJpc2N2L3BhdGNoLzIwMjMwOTAxMTIzMDQzLjczNzAwLTEtY3VpeXVuaHVpQGJ5dGVkYW5j
ZS5jb20vCgpDb3VsZCB5b3UgaGVscCBtZXJnZSBpdCB0byBsaW51eC1uZXh0PwoKVGhhbmtz77yM
Cll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
