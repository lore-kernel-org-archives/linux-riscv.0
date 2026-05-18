Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0744CCD4F49
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 08:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bqqer7dNh2FSdT0qygaSBjH1YfE6twNG1QNMhjmsems=; b=RWNS99NRXIKB03
	O3NMtYhrlxhcCR2BztEz8TmgTfVUGHNyUZb1eoLInzfg5YdUTzhtZhJIoMTscSNKXIa4a9qgND80c
	jvZaQwvcGBy8hGDxfO5BHhS7JnoEWiVS9qM7gkfk9ObFoCf461Tabt9lMC/ljpfRlJ8rSG1eQUoiG
	TZzqGZ3YnyDvGAZ85hR4GoL0RdhmPnomzCXTGHz6ujStToIAJVc22Pjk4GrDYUapmYhx8C7q8hVKz
	dmILra0sWLsvWNMiPQ5aHhxpIOIXTcP3NizMdSxTcXLintU1V/sjIOg6WACKKfsl+R6iNRjxaFBa1
	QDLzs6+jhGWrx+JI7ZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtAi-0000000Ek9M-41qg;
	Mon, 18 May 2026 08:17:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtAg-0000000Ek8q-3jwi
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 May 2026 08:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LEMT5XZx/8ZB7BkbNfRwbkaEqKtjPRrku1nVoW/0ZLg=; b=WJVrEIJZtamemQLd8O65IxcWaf
	0Ku2WV7QV+mrCvKSVGCDki9rNSGuJjqbQH0OAegNJ9vhx08QoFkDNjx4ku6p6wfFKv+3P2L7jh4Tw
	P+lXUxQEUx37RG0ifMxvAcl7ZPCiQvqarVuDf+BIKq9qgt/E4YeLlg7FnuSl4Ym7xVyGSrV4PnCdi
	x6roKrmROREhQpe9hbQ2m1pGwr7Y9t0iNjMXSvS240hsDbx1EQSkDj4OMlgeWl3mH9HMJkJMUH1al
	28RDtVNkUbIIuBKJcIOI7snkW2CfQkcuCFPHuc7zd3H2UmXCrHjiqUkV8PNkkm08j6zLWsZpsXmGF
	fBhcHaJg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtAc-0000000AKGM-11sV
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 08:17:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4680C4453B
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 08:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29287C2BCFD
	for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 08:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779092266;
	bh=Ul481Oj63L3fQNQKRZasHWY8R/T/fpQT+enoDCnu0aA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cyiQqcP8ILb6BFTKh8XkpjrKQmYrZRKtwPQHnDMNygyamDc2y8vflQDG97b21eLWy
	 4Lx8JjOJrGVrGhcOnUNk8Kd2yLEHXPaLf7iSCvYTgJ6vCCtJVJCm4gw9wtmIK4cEUh
	 4T+KmFK/eZ/7T1K3rimWtH0YeUWOqUGAn3TZnClSOAiGKkOoIvYSOcuo/C5kDKYiDk
	 iER3+cmg8a1LW3I16Kx34lsG9ayW4ABPE34SrtTvygIKglB6/ppX2995zGaHIP5lZ8
	 bh5Up1hoB946WVGeacBOaSFMfxg3K5gdWcBDgPHPkbxSCoeWN7so8bg55ZcGglxwxs
	 IETeYC16sUuNQ==
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43fe62837baso996535f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 01:17:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9M0gHLBa1DPHNikwwEg1pjiGhVpZwPL+YDkWMt9XiFE1xZ5eauKG30BgcPGMFmSYDturTKoez/mqlfdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUAI59lzomDF22qUZEu2Q3NLZXeG/HYYGMAT6hMgmYJiLK17a3
	qMbjhSKLxnpOT2bAOmj1sl+0Q2UJdEhFw1yX83tXKxjlnL/GclYGJkjnTzjG3HrLqygbfZEUBH2
	9AKlsd9RDxr4zsRQ2MGH9qDlvykKwQ4w=
X-Received: by 2002:a05:6000:2c10:b0:450:e5fd:e1a1 with SMTP id
 ffacd0b85a97d-45e5c35dcc2mr22439533f8f.3.1779092263882; Mon, 18 May 2026
 01:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260518080646.1278708-1-guoren@kernel.org>
In-Reply-To: <20260518080646.1278708-1-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 18 May 2026 16:17:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR9mxS2mPe7wFn=EHGN4cH1M2TR_F6vL_eVN-J1WR5r0w@mail.gmail.com>
X-Gm-Features: AVHnY4JiBZmk0s94unrXlHCrjiGSD6g5hjHqdBGISApRuzTppnfo56W12EzSNE0
Message-ID: <CAJF2gTR9mxS2mPe7wFn=EHGN4cH1M2TR_F6vL_eVN-J1WR5r0w@mail.gmail.com>
Subject: Re: [PATCH V3] riscv: mm: Fixup no5lvl failure when vaddr is invalid
To: guoren@kernel.org, gaohan@iscas.ac.cn, wangruikang@iscas.ac.cn
Cc: alex@ghiti.fr, alexghiti@rivosinc.com, bjorn@kernel.org, 
	bjorn@rivosinc.com, cuiyunhui@bytedance.com, fangyu.yu@linux.alibaba.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, pjw@kernel.org, samuel.holland@sifive.com, 
	Chen Pei <cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_091751_068026_510462EE 
X-CRM114-Status: GOOD (  21.36  )
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

T2gsIGl0IGhhcyBiZWVuIGluIHRoZSBtYXN0ZXIgdHJlZSwgcGxlYXNlIGlnbm9yZSB0aGlzIHBh
dGNoOgoKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC9kYjkwOWJkNzk4
NmMxMGRhMDc0OTE3YWYzZGFlODNhNjBmYTY1MDkzCgpPbiBNb24sIE1heSAxOCwgMjAyNiBhdCA0
OjA34oCvUE0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogIkd1
byBSZW4gKEFsaWJhYmEgREFNTyBBY2FkZW15KSIgPGd1b3JlbkBrZXJuZWwub3JnPgo+Cj4gVW5s
aWtlIG5vNGx2bCwgbm81bHZsIHN0aWxsIGNvbnRpbnVlcyBkZXRlY3Qgc2F0cCwgd2hpY2gKPiBy
ZXF1aXJlcyB2YT1wYSBtYXBwaW5nLiBXaGVuIHBhPTB4ODAwMDAwMDAwMDAwLCBubzVsdmwKPiB3
b3VsZCBmYWlsIGluIFN2NDggbW9kZSBkdWUgdG8gYW4gaWxsZWdhbCBWQSB2YWx1ZSBvZgo+IDB4
ODAwMDAwMDAwMDAwLgo+Cj4gU28sIHByZXZlbnQgZGV0ZWN0aW5nIHRoZSBzYXRwIGZsb3cgZm9y
IG5vNWx2bCwgd2hlbgo+IHZhZGRyIGlzIGludmFsaWQuIEFkZCB0aGUgaXNfdmFkZHJfdmFsaWQo
KSBmdW5jdGlvbiBmb3IKPiBjaGVja2luZy4KPgo+IEZpeGVzOiAyNmU3YWFjYjgzZGYgKCJyaXNj
djogQWxsb3cgdG8gZG93bmdyYWRlIHBhZ2luZyBtb2RlIGZyb20gdGhlIGNvbW1hbmQgbGluZSIp
Cj4gQ2M6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiBDYzogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IFRlc3RlZC1ieTogRmFuZ3l1IFl1IDxm
YW5neXUueXVAbGludXguYWxpYmFiYS5jb20+Cj4gVGVzdGVkLWJ5OiBDaGVuIFBlaSA8Y3AwNjEz
QGxpbnV4LmFsaWJhYmEuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gKEFsaWJhYmEgREFN
TyBBY2FkZW15KSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gLS0tCj4gQ2hhbmdlbG9nOgo+IHYzOgo+
ICAtIEFkZCB0d28gVGVzdGVkLWJ5IHRhZ3MuCj4gIC0gUmViYXNlIG9uIExpbnV4IDcuMS1yYzEu
Cj4KPiB2MjoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDEyNTA1
NTIxMi40MzMxNjMtMS1ndW9yZW5Aa2VybmVsLm9yZy8KPiAgLSBVc2UgaXNfdmFkZHJfdmFsaWQo
KSBpbnN0ZWFkIG9mIHNpbXBsZSByZXR1cm4uCj4gIC0gRG9uJ3QgY2hhbmdlIHRoZSBvcmlnaW5h
bCBubzVsdmwgY29kZSBsb2dpYy4KPgo+IHYxOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjYwMTE4MTQ1NDQxLjI5MTMwMi0xLWd1b3JlbkBrZXJuZWwub3JnLwo+IC0t
LQo+ICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gaW5kZXggZGVjZDdkZjQw
ZmE0Li5mYThkMmY2ZjU1NGIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiAr
KysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IEBAIC03OTIsNiArNzkyLDI3IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBzZXRfbW1hcF9ybmRfYml0c19tYXgodm9pZCkKPiAgICAgICAgIG1tYXBfcm5k
X2JpdHNfbWF4ID0gTU1BUF9WQV9CSVRTIC0gUEFHRV9TSElGVCAtIDM7Cj4gIH0KPgo+ICtzdGF0
aWMgYm9vbCBfX2luaXQgaXNfdmFkZHJfdmFsaWQodW5zaWduZWQgbG9uZyB2YSkKPiArewo+ICsg
ICAgICAgdW5zaWduZWQgbG9uZyB1cCA9IDA7Cj4gKwo+ICsgICAgICAgc3dpdGNoIChzYXRwX21v
ZGUpIHsKPiArICAgICAgIGNhc2UgU0FUUF9NT0RFXzM5Ogo+ICsgICAgICAgICAgICAgICB1cCA9
IDFVTCA8PCAzODsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBjYXNlIFNBVFBf
TU9ERV80ODoKPiArICAgICAgICAgICAgICAgdXAgPSAxVUwgPDwgNDc7Cj4gKyAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSBTQVRQX01PREVfNTc6Cj4gKyAgICAgICAgICAgICAg
IHVwID0gMVVMIDw8IDU2Owo+ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGRlZmF1
bHQ6Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArICAgICAgIH0KPiArCj4gKyAg
ICAgICByZXR1cm4gKHZhIDwgdXApIHx8ICh2YSA+PSAoVUxPTkdfTUFYIC0gdXAgKyAxKSk7Cj4g
K30KPiArCj4gIC8qCj4gICAqIFRoZXJlIGlzIGEgc2ltcGxlIHdheSB0byBkZXRlcm1pbmUgaWYg
NC1sZXZlbCBpcyBzdXBwb3J0ZWQgYnkgdGhlCj4gICAqIHVuZGVybHlpbmcgaGFyZHdhcmU6IGVz
dGFibGlzaCAxOjEgbWFwcGluZyBpbiA0LWxldmVsIHBhZ2UgdGFibGUgbW9kZQo+IEBAIC04MzMs
NiArODU0LDkgQEAgc3RhdGljIF9faW5pdCB2b2lkIHNldF9zYXRwX21vZGUodWludHB0cl90IGR0
Yl9wYSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXRfc2F0cF9tb2RlX3BtZCArIFBN
RF9TSVpFLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBNRF9TSVpFLCBQQUdFX0tFUk5F
TF9FWEVDKTsKPiAgcmV0cnk6Cj4gKyAgICAgICBpZiAoIWlzX3ZhZGRyX3ZhbGlkKHNldF9zYXRw
X21vZGVfcG1kKSkKPiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gKwo+ICAgICAgICAgY3Jl
YXRlX3BnZF9tYXBwaW5nKGVhcmx5X3BnX2RpciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzZXRfc2F0cF9tb2RlX3BtZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBwZ3RhYmxl
X2w1X2VuYWJsZWQgPwo+IEBAIC04NTUsNiArODc5LDcgQEAgc3RhdGljIF9faW5pdCB2b2lkIHNl
dF9zYXRwX21vZGUodWludHB0cl90IGR0Yl9wYSkKPiAgICAgICAgICAgICAgICAgZGlzYWJsZV9w
Z3RhYmxlX2w0KCk7Cj4gICAgICAgICB9Cj4KPiArb3V0Ogo+ICAgICAgICAgbWVtc2V0KGVhcmx5
X3BnX2RpciwgMCwgUEFHRV9TSVpFKTsKPiAgICAgICAgIG1lbXNldChlYXJseV9wNGQsIDAsIFBB
R0VfU0laRSk7Cj4gICAgICAgICBtZW1zZXQoZWFybHlfcHVkLCAwLCBQQUdFX1NJWkUpOwo+IC0t
Cj4gMi40My4wCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
