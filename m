Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78D7D3569F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Qsay8FTsG0vB+THbfvcsCRFRDrXiLvm6pMNbNLmZNE=; b=M9hbBbi+P/BYGE
	QiV7yFHqcAKO/4aOHCoO/kCjjR70Xuwfh8IYkeygRVoEVmdM2cBLv2K6PMXrBlD4gZ8zY5Bmb8lTo
	LrpOziX4fp7NCJlg39fiW1PuH6xt16XDmxvbp6mGmkP6S40bAzhrekQjmiXR3YltDyuo4oH11XFj9
	M/E045gfOEsfvuHJwCpV5/qMqDwjsu9WNY1z0TmgsLMzWbqI7qz1HhVWMkMQNh1aEpYxwERHXrqa5
	wfgys6nDffFwkWxJb29pJlz0oK9mjkWgBQUCDfdVVtvoJ7egODy5w1LGlvq/inMEB8uX+YsE9AVYb
	cxIpA7QNKhaobGIhxkIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2uO-0000000FqCt-1YfF;
	Wed, 28 Jan 2026 10:36:24 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2uL-0000000FqBh-1NtG
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 10:36:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso4236664f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 02:36:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769596579; cv=none;
        d=google.com; s=arc-20240605;
        b=kZo0mY6F8wApnCeyUlti0LaZIK/fLchBo2MeGujg7fWZqo/7py7YIpi78dvefasian
         9Di0P1YQ71MR9208bHj3Zz1AupZXsF412YnYlDZbZOJsFqXWAesRKispi0IokiYvLpn5
         XwsZ0LdgHDU0oHVSg8yW0LVJEdqjagGEFVU8Lr/XJTQBV1QobyISqc78ZweTak579WSR
         SmSR3qbtE2CP0isSoMyXKpWAZldRvJhAOP3hNBS/61AFjabPOjK28ePhsNrLVlF3LkIw
         LHr4MspBCjE9D+xe8Oe9TwsJ8DeAar3dr+QrxKh21pNTCJdmOziLbo2Y8nPCZ2+lvs5b
         aCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aNGz1NdF+1GC7KQl+abP/x/JCTd+vu3I0VioJLZrLJA=;
        fh=Js0/Oemi6du0yHkbrM8Re7vtfnNMh+QG8PhQBt/osFU=;
        b=eodHRK0JUolKja0rUeh738Y6zxskQWUFIXS2BADbZrQ09OvJEbHTtAJ+ZrlBuhfTLe
         Q7PIP9Rj6c/PKZgFzQeWT7tdqbPv1fw7SSZkqjb5t7duhiy0axcaalMw8Rosa0yIgUai
         nifvFJEFziL+C6cewnNOSOOgqN3OlgBM4xjmnOJrNz1UnzF55lqisyPOvzy/SUjn1YsY
         rXB6svEhQnfkGIbuKy6KOn5mfsLVhX8/TlTAm3+w5UOybTghqtVPMX7/EuNOQ9JCX4wr
         DfrtcE9L031uiTJFxzaEw8e7pcc1TMlrbsuz4bpgb481uaZXQ2Z2bovy7ZRToqIEmO7E
         jIvA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769596579; x=1770201379; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNGz1NdF+1GC7KQl+abP/x/JCTd+vu3I0VioJLZrLJA=;
        b=NaMLQpNjzbLZ6BVaodE4V4MiqI1CpUA7XGBWw5ca2PsUy4BrLEmR7DHvrVjruWMtf1
         ZsSU35h1yTK13bsvQXfxSOg22pLVLugmiVVmKKsXLCfW7dj9qPmducAXznIGtvEVUVR1
         Rner+XN4r10UmPuA6kss+DwgvITWVQJYsVns2T1KctMQ1r35ykweCn8lgVmzCJltdlaN
         nbGj8zTsC/l2lssD7H5i54AGCW7x87vM0z7AhSbRFFwIISFmsIfkM9zO8aAveFTGiL+3
         RyjpTGqe7DQqhelUrFSH43GPrGfjUK+LrmJm1wy94WMCr6W2R6quKtuTrgOjGplCwXeR
         jiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596579; x=1770201379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNGz1NdF+1GC7KQl+abP/x/JCTd+vu3I0VioJLZrLJA=;
        b=TX5/aMsjGwWmw8AWRqLLQeztJrsmvHiBCO2LC/gQnGVs/T4WrPbyo1Ts5M7Q1KSs9m
         fx79uiJUTbm+KTH5aRrvVnPPvS8S0Rp5uFyHn7yOOsYEcjvJr2elQo/vtMuXFf5LRE2E
         jFxcwwCt96RCbmAzKEcVBgBmTAgzBm+i1KwhBz4IKO66QHOI07o+1dPQikWJ+irGCMlX
         scMPOCPkDXJ+E5TzIsW+WZ+q+kxZdE+Ba0AqxopvBYLGJqz8VbZk357HN2LdhGmnusZ2
         txZvDOiJgZe78Yeb/MbnkZaaL7/9tL2vNbmPWeV1MeW8+d9JH5mIbRBypzGsnkKbyBho
         T5MA==
X-Forwarded-Encrypted: i=1; AJvYcCXteCZH4+c1nT259gxJGVICqkqtJ5e1B9Fou79sFdGGlZl//u+P6jFGnGdJbDYCD/ZfuQyE+86RdcxlKw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgq9CKcanSFnSNEHf3Bn82VK1GVSm791V1JSAFmopHjbEkBzXa
	v2sDv1Uyx5Qpz/URYHn6YyMex8rf+9G1FOrkQMhmfJ2NKk1y9HztZ6mU8Wjgb0o2QuJXOISv50U
	X0BHr6uNYDZq70ziyA62zFSy2vaL1xp0=
X-Gm-Gg: AZuq6aKNoyXUi/2uy3Fz2szhuYL2xtnlcsdSDPZdp0LNS0d8lKGoLDak9PQIMU+1Qna
	U2z7P+UCM314Vk4KxnoBXo9wjxoetq5Ew4JJk/8w/USpBdcD2k9s2LljGRfXXyWJWNdaGEhwp/T
	rmdAFW90Sb5dvUmdjtEFWHXb1ODqL4NqUDhy3jD7MclSmbXbss8j+lcaNuXMN/fnwNt06sf6RSg
	jIlQSr79l5HDpuganuuSsNi8Gaz2bbB9bnEGyIU/M1Xicajbc9IW5sHUf6WF9HgBE96i2I=
X-Received: by 2002:a05:6000:4282:b0:435:a3b9:9b8 with SMTP id
 ffacd0b85a97d-435dd05aeb9mr7009532f8f.24.1769596578375; Wed, 28 Jan 2026
 02:36:18 -0800 (PST)
MIME-Version: 1.0
References: <aXiF55y5D49gcpUg@adminpc-PowerEdge-R7525> <202601272006.NUdRcAIi-lkp@intel.com>
In-Reply-To: <202601272006.NUdRcAIi-lkp@intel.com>
From: Austin Kim <austindh.kim@gmail.com>
Date: Wed, 28 Jan 2026 19:36:06 +0900
X-Gm-Features: AZwV_Qj7MERsWUr2UR9-7KGxNj314Bp7cMumeTxY5gnB1yiNhAliYiHPNAkx7jk
Message-ID: <CADLLry6Ve2d07f9anQSbDeU4GUvSiCVMmSZuvDw2ntB4-HybwQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: export kaslr offset and satp in VMCOREINFO ELF notes
To: kernel test robot <lkp@intel.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Albert Ou <aou@eecs.berkeley.edu>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_023621_401008_4C383DA8 
X-CRM114-Status: GOOD (  13.38  )
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

SGVsbG8sCgoyMDI264WEIDHsm5QgMjjsnbwgKOyImCkgQU0gNDoxNCwga2VybmVsIHRlc3Qgcm9i
b3QgPGxrcEBpbnRlbC5jb20+64uY7J20IOyekeyEsToKPgo+IEhpIEF1c3RpbiwKPgo+IGtlcm5l
bCB0ZXN0IHJvYm90IG5vdGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcnM6Cj4KPiBbYXV0
byBidWlsZCB0ZXN0IEVSUk9SIG9uIGxpbnVzL21hc3Rlcl0KPiBbYWxzbyBidWlsZCB0ZXN0IEVS
Uk9SIG9uIHY2LjE2LXJjMSBuZXh0LTIwMjYwMTI3XQo+IFtJZiB5b3VyIHBhdGNoIGlzIGFwcGxp
ZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBraW5kbHkgZHJvcCB1cyBhIG5vdGUuCj4gQW5kIHdo
ZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1l
bnRlZCBpbgo+IGh0dHBzOi8vZ2l0LXNjbS5jb20vZG9jcy9naXQtZm9ybWF0LXBhdGNoI19iYXNl
X3RyZWVfaW5mb3JtYXRpb25dCj4KPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1s
YWItbGtwL2xpbnV4L2NvbW1pdHMvQXVzdGluLUtpbS9yaXNjdi1leHBvcnQta2FzbHItb2Zmc2V0
LWFuZC1zYXRwLWluLVZNQ09SRUlORk8tRUxGLW5vdGVzLzIwMjYwMTI3LTE3MzUyOAo+IGJhc2U6
ICAgbGludXMvbWFzdGVyCj4gcGF0Y2ggbGluazogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci9hWGlGNTV5NUQ0OWdjcFVnJTQwYWRtaW5wYy1Qb3dlckVkZ2UtUjc1MjUKPiBwYXRjaCBzdWJq
ZWN0OiBbUEFUQ0hdIHJpc2N2OiBleHBvcnQga2FzbHIgb2Zmc2V0IGFuZCBzYXRwIGluIFZNQ09S
RUlORk8gRUxGIG5vdGVzCj4gY29uZmlnOiByaXNjdi1hbGxub2NvbmZpZy1icGYgKGh0dHBzOi8v
ZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI2MDEyNy8yMDI2MDEyNzIwMDYuTlVk
UmNBSWktbGtwQGludGVsLmNvbS9jb25maWcpCj4gY29tcGlsZXI6IHJpc2N2NjQtbGludXgtZ2Nj
IChHQ0MpIDE1LjEuMAo+IHJlcHJvZHVjZSAodGhpcyBpcyBhIFc9MSBidWlsZCk6IChodHRwczov
L2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyNjAxMjcvMjAyNjAxMjcyMDA2Lk5V
ZFJjQUlpLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQo+Cj4gSWYgeW91IGZpeCB0aGUgaXNzdWUg
aW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBv
Zgo+IHRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZ3MKPiB8
IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiB8IENsb3Nl
czogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDEyNzIwMDYuTlVk
UmNBSWktbGtwQGludGVsLmNvbS8KPgo+IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5
ID4+KToKPgo+ICAgIHJpc2N2NjQtbGludXgtbGQ6IGFyY2gvcmlzY3Yva2VybmVsL3ZtY29yZV9p
bmZvLm86IGluIGZ1bmN0aW9uIGBhcmNoX2NyYXNoX3NhdmVfdm1jb3JlaW5mbyc6Cj4gPj4gYXJj
aC9yaXNjdi9rZXJuZWwvdm1jb3JlX2luZm8uYzoyMzooLnRleHQrMHgyNDApOiB1bmRlZmluZWQg
cmVmZXJlbmNlIHRvIGBrYXNscl9vZmZzZXQnCj4KCkZpcnN0LCBJIGFwb2xvZ2l6ZSBmb3IgdGhl
IGluY29udmVuaWVuY2UuCgpUaGlzIGxpbmsgZXJyb3Igb2NjdXJzIHdoZW4gQ09ORklHX1JBTkRP
TUlaRV9CQVNFIGlzIGRpc2FibGVkLgpJbiB0aGUgUklTQy1WIGtlcm5lbCwga2FzbHJfb2Zmc2V0
KCkgaXMgb25seSBkZWZpbmVkIHVuZGVyCkNPTkZJR19SQU5ET01JWkVfQkFTRS4KCkkgd2lsbCBz
dWJtaXQgYSBuZXcgcGF0Y2ggc2hvcnRseSB0byBhdm9pZCB0aGlzIGtpbmQgb2YgZXJyb3IuCgpC
UiwKQXVzdGluIEtpbQoKPgo+IHZpbSArMjMgYXJjaC9yaXNjdi9rZXJuZWwvdm1jb3JlX2luZm8u
Ywo+Cj4gY2ZlOTRkNDU2Nzc1YTQgYXJjaC9yaXNjdi9rZXJuZWwvdm1jb3JlX2luZm8uYyBBdXN0
aW4gS2ltICAgICAgMjAyNi0wMS0yNyAgMTAKPiA2NDlkNmIxMDE5YTJmMiBhcmNoL3Jpc2N2L2tl
cm5lbC9jcmFzaF9jb3JlLmMgIFhpYW50aW5nIFRpYW4gICAyMDIyLTEwLTI2ICAxMSAgdm9pZCBh
cmNoX2NyYXNoX3NhdmVfdm1jb3JlaW5mbyh2b2lkKQo+IDY0OWQ2YjEwMTlhMmYyIGFyY2gvcmlz
Y3Yva2VybmVsL2NyYXNoX2NvcmUuYyAgWGlhbnRpbmcgVGlhbiAgIDIwMjItMTAtMjYgIDEyICB7
Cj4gNjQ5ZDZiMTAxOWEyZjIgYXJjaC9yaXNjdi9rZXJuZWwvY3Jhc2hfY29yZS5jICBYaWFudGlu
ZyBUaWFuICAgMjAyMi0xMC0yNiAgMTMgICBWTUNPUkVJTkZPX05VTUJFUihwaHlzX3JhbV9iYXNl
KTsKPiA2NDlkNmIxMDE5YTJmMiBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaF9jb3JlLmMgIFhpYW50
aW5nIFRpYW4gICAyMDIyLTEwLTI2ICAxNAo+IDY0OWQ2YjEwMTlhMmYyIGFyY2gvcmlzY3Yva2Vy
bmVsL2NyYXNoX2NvcmUuYyAgWGlhbnRpbmcgVGlhbiAgIDIwMjItMTAtMjYgIDE1ICAgdm1jb3Jl
aW5mb19hcHBlbmRfc3RyKCJOVU1CRVIoUEFHRV9PRkZTRVQpPTB4JWx4XG4iLCBQQUdFX09GRlNF
VCk7Cj4gNjQ5ZDZiMTAxOWEyZjIgYXJjaC9yaXNjdi9rZXJuZWwvY3Jhc2hfY29yZS5jICBYaWFu
dGluZyBUaWFuICAgMjAyMi0xMC0yNiAgMTYgICB2bWNvcmVpbmZvX2FwcGVuZF9zdHIoIk5VTUJF
UihWTUFMTE9DX0VORCk9MHglbHhcbiIsIFZNQUxMT0NfRU5EKTsKPiBjNDFiZDI1MTQxODRkNyBh
cmNoL3Jpc2N2L2tlcm5lbC9jcmFzaF9jb3JlLmMgIElnbmF0IEtvcmNoYWdpbiAyMDIzLTExLTI5
ICAxNyAgI2lmZGVmIENPTkZJR19NTVUKPiBjNDFiZDI1MTQxODRkNyBhcmNoL3Jpc2N2L2tlcm5l
bC9jcmFzaF9jb3JlLmMgIElnbmF0IEtvcmNoYWdpbiAyMDIzLTExLTI5ICAxOCAgIFZNQ09SRUlO
Rk9fTlVNQkVSKFZBX0JJVFMpOwo+IDY0OWQ2YjEwMTlhMmYyIGFyY2gvcmlzY3Yva2VybmVsL2Ny
YXNoX2NvcmUuYyAgWGlhbnRpbmcgVGlhbiAgIDIwMjItMTAtMjYgIDE5ICAgdm1jb3JlaW5mb19h
cHBlbmRfc3RyKCJOVU1CRVIoVk1FTU1BUF9TVEFSVCk9MHglbHhcbiIsIFZNRU1NQVBfU1RBUlQp
Owo+IDY0OWQ2YjEwMTlhMmYyIGFyY2gvcmlzY3Yva2VybmVsL2NyYXNoX2NvcmUuYyAgWGlhbnRp
bmcgVGlhbiAgIDIwMjItMTAtMjYgIDIwICAgdm1jb3JlaW5mb19hcHBlbmRfc3RyKCJOVU1CRVIo
Vk1FTU1BUF9FTkQpPTB4JWx4XG4iLCBWTUVNTUFQX0VORCk7Cj4gNjQ5ZDZiMTAxOWEyZjIgYXJj
aC9yaXNjdi9rZXJuZWwvY3Jhc2hfY29yZS5jICBYaWFudGluZyBUaWFuICAgMjAyMi0xMC0yNiAg
MjEgICNpZmRlZiBDT05GSUdfNjRCSVQKPiA2NDlkNmIxMDE5YTJmMiBhcmNoL3Jpc2N2L2tlcm5l
bC9jcmFzaF9jb3JlLmMgIFhpYW50aW5nIFRpYW4gICAyMDIyLTEwLTI2ICAyMiAgIHZtY29yZWlu
Zm9fYXBwZW5kX3N0cigiTlVNQkVSKE1PRFVMRVNfVkFERFIpPTB4JWx4XG4iLCBNT0RVTEVTX1ZB
RERSKTsKPiA2NDlkNmIxMDE5YTJmMiBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaF9jb3JlLmMgIFhp
YW50aW5nIFRpYW4gICAyMDIyLTEwLTI2IEAyMyAgIHZtY29yZWluZm9fYXBwZW5kX3N0cigiTlVN
QkVSKE1PRFVMRVNfRU5EKT0weCVseFxuIiwgTU9EVUxFU19FTkQpOwo+Cj4gLS0KPiAwLURBWSBD
SSBLZXJuZWwgVGVzdCBTZXJ2aWNlCj4gaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0
cy93aWtpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
