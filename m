Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E16C4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcz41gxOCp92Lj+iVxpVGAC7QtUMRSCnuUrbw3ziG+Y=; b=DdwADUsXNApkiA
	41hKgGC3reFV047B/oFkAd7MvSp7RiphZFRn3ns5EhyDNTdHqlNVBPlIvA4cinhm0gdgH0WU/1Sok
	I/6OIdQzR1eXlgbfTONEg+E9Tuvbcc54Mk7pWm2P1N9pAH3zmqfClDe62HX7zhfM2WLdMOIIMC8hf
	TNA5j91ikBuDkbP5xmrLltCeQ83iByebOzqAaTxrWa2T4i+5HvHgsplHAV6KQ+ah7AX8pszdwhjOY
	rtv3F0v3Wxrz/oGdM0GwGD7BZ326eu/zSu6erqzWFxABuBgP1h2YKxT9NiJgx4WRHTDASGuoCFJ0X
	o7ZsCQE57kZ7SM39MGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNaEv-00CVut-31;
	Wed, 10 Jan 2024 15:11:33 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNaEs-00CVsA-0K
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jan 2024 15:11:32 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3606f133b1fso11763845ab.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 07:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1704899488; x=1705504288; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u7dnx0armDk/+RvWWpSg/XyhmNCzgM7h7SgaiA/YSV0=;
        b=GkuT9FHWrqCyt1H8muIlGkkswAl85I1xGQCY3tSpIcNiGHwT5qcR6A7U3Ca2fYBGkt
         h9tWErriGRzcPEs2cptyfhkVxuhLycVO8q4V1EWnL1bCn4fDDY26g129KG/HvEmIIfny
         aC26RmJMFeDKmPsAvgrzCit+/z32+aPg1wSRGI/p/hwFeyu/S1QcUi9Ay/ICfLupzTI0
         pF5fPQgkiM9DEbqnTL82vlvEtC45VQ57qaV1rI3uuyARuHMi0gs6CIICVsjFrsOzNoQv
         gMtXF7PHvZIUISEA75VHkBRdavPOaHZg0XwmYw0VMlpJFB+QZjLthR4akk9/gfH7vlUG
         F51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704899488; x=1705504288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u7dnx0armDk/+RvWWpSg/XyhmNCzgM7h7SgaiA/YSV0=;
        b=szG8+NzTZK9W3OOAMsrLPcVnpr673ryxCIDG9Y+LyJFMYifVGmksGnzZ69rBS5Y6rW
         Lg7uQCcqji0njINbr0MdnrevoFvWolubBNsqz3CUO5DysU/lfLk/rX2OfzL8ryjn5EVE
         TkkY7CjMI5bw1Y8AQ2u6OLmEH7rGZtbcq/Bi1bb18XQYeytqDUERZGhpUjiF3UZym+Ae
         m82x4LqZawGjw5IVzCcC75UV1MHCVy1/iLah3i7rMi2itOQcwe7GwKD7VdZxhnioBKVa
         4vL4/35U0ukqar+tRe3asei0bT2gm3ssHg9f14gYqz5x5xXumRiBitqQLooIKpyM/Id4
         /yEQ==
X-Gm-Message-State: AOJu0YwT9AKN4oAntomEpyJZC3Kfshreh9E/PT/B8nqauYxlurlNgtl/
	muzC/fHpvXQCu1bPB+Qcyobr+i1HLEcCvdpWFUczU3tMYwA60A==
X-Google-Smtp-Source: AGHT+IEuq58zauZkEQ1xO5LVtDSLalCCv+/Jivx2TA3XmedpEjlVHqJRGlt6ZOsWmnTKoMBajwuUrebUCLahkbpfozk=
X-Received: by 2002:a92:c56b:0:b0:360:8a0b:50dc with SMTP id
 b11-20020a92c56b000000b003608a0b50dcmr143554ilj.10.1704899488291; Wed, 10 Jan
 2024 07:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20240110073917.2398826-1-peterlin@andestech.com> <20240110073917.2398826-3-peterlin@andestech.com>
In-Reply-To: <20240110073917.2398826-3-peterlin@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Jan 2024 20:41:16 +0530
Message-ID: <CAAhSdy1KLSFBA_vD+NX15wuiOsz5QadQWj4ZWOK11qfL1LuHqA@mail.gmail.com>
Subject: Re: [PATCH v7 02/16] irqchip/riscv-intc: Allow large non-standard
 interrupt number
To: Yu Chien Peter Lin <peterlin@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_071130_519580_895493DF 
X-CRM114-Status: GOOD (  24.20  )
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
Cc: mark.rutland@arm.com, irogers@google.com, heiko@sntech.de, geert+renesas@glider.be, alexander.shishkin@linux.intel.com, paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, guoren@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org, will@kernel.org, linux-renesas-soc@vger.kernel.org, tim609@andestech.com, samuel@sholland.org, dminus@andestech.com, magnus.damm@gmail.com, jernej.skrabec@gmail.com, Randolph <randolph@andestech.com>, peterz@infradead.org, wens@csie.org, mingo@redhat.com, jszhang@kernel.org, inochiama@outlook.com, linux-sunxi@lists.linux.dev, ajones@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, andre.przywara@arm.com, locus84@andestech.com, acme@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com, robh+dt@kernel.org, atishp@atishpatra.org, namhyung@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, ycliang@andestech.com, n.shubin@yadro.com, rdunlap@infradead.org, chao.wei@sophgo.com, adrian.hunter@intel.com, conor@kernel.org, linux-perf-users@vger.kernel.org, evan@rivosinc.com, palmer@dabbelt.com, jolsa@kernel.org, unicorn_wang@outlook.com, wefu@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMTAsIDIwMjQgYXQgMToxMOKAr1BNIFl1IENoaWVuIFBldGVyIExpbgo8cGV0
ZXJsaW5AYW5kZXN0ZWNoLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIHRoZSBpbXBsZW1lbnRh
dGlvbiBvZiB0aGUgUklTQy1WIElOVEMgZHJpdmVyIHVzZXMgdGhlCj4gaW50ZXJydXB0IGNhdXNl
IGFzIHRoZSBoYXJkd2FyZSBpbnRlcnJ1cHQgbnVtYmVyLCB3aXRoIGEgbWF4aW11bSBvZgo+IDY0
IGludGVycnVwdHMuIEhvd2V2ZXIsIHRoZSBwbGF0Zm9ybSBjYW4gZXhwYW5kIHRoZSBpbnRlcnJ1
cHQgbnVtYmVyCj4gZnVydGhlciBmb3IgY3VzdG9tIGxvY2FsIGludGVycnVwdHMuCj4KPiBUbyBm
dWxseSB1dGlsaXplIHRoZSBhdmFpbGFibGUgbG9jYWwgaW50ZXJydXB0IHNvdXJjZXMsIHN3aXRj
aAo+IHRvIHVzaW5nIGlycV9kb21haW5fY3JlYXRlX3RyZWUoKSB0aGF0IGNyZWF0ZXMgdGhlIHJh
ZGl4IHRyZWUKPiBtYXAsIGFkZCBnbG9iYWwgdmFyaWFibGVzIChyaXNjdl9pbnRjX25yX2lycXMs
IHJpc2N2X2ludGNfY3VzdG9tX2Jhc2UKPiBhbmQgcmlzY3ZfaW50Y19jdXN0b21fbnJfaXJxcykg
dG8gZGV0ZXJtaW5lIHRoZSB2YWxpZCByYW5nZSBvZiBsb2NhbAo+IGludGVycnVwdCBudW1iZXIg
KGh3aXJxKS4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5A
YW5kZXN0ZWNoLmNvbT4KPiBSZXZpZXdlZC1ieTogUmFuZG9scGggPHJhbmRvbHBoQGFuZGVzdGVj
aC5jb20+CgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBA
YnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+IENoYW5nZXMgdjEgLT4gdjI6
Cj4gICAtIEZpeGVkIGlycSBtYXBwaW5nIGZhaWx1cmUgY2hlY2tpbmcgKHN1Z2dlc3RlZCBieSBD
bMOpbWVudCBhbmQgQW51cCkKPiBDaGFuZ2VzIHYyIC0+IHYzOgo+ICAgLSBObyBjaGFuZ2UKPiBD
aGFuZ2VzIHYzIC0+IHY0OiAoU3VnZ2VzdGVkIGJ5IFRob21hcyBbMV0pCj4gICAtIFVzZSBwcl93
YXJuX3JhdGVsaW1pdGVkIGluc3RlYWQKPiAgIC0gRml4IGNvZGluZyBzdHlsZSBhbmQgY29tbWl0
IG1lc3NhZ2UKPiBDaGFuZ2VzIHY0IC0+IHY1OiAoU3VnZ2VzdGVkIGJ5IFRob21hcykKPiAgIC0g
Rml4IGNvbW1pdCBtZXNzYWdlCj4gQ2hhbmdlcyB2NSAtPiB2NjogKFN1Z2dlc3RlZCBieSBBbnVw
IFsyXSkKPiAgIC0gQWRkIHJpc2N2X2ludGNfKiBnbG9iYWwgdmFyaWFibGVzIGZvciBjaGVja2lu
ZyByYW5nZSBpbiByaXNjdl9pbnRjX2RvbWFpbl9hbGxvYygpCj4gICAtIEFkdmVydGlzZSB0aGUg
bnVtYmVyIG9mIGludGVycnVwdHMgYWxsb3dlZAo+IENoYW5nZXMgdjYgLT4gdjc6Cj4gICAtIE5v
IGZ1bmN0aW9uYWwgY2hhbmdlCj4KPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2xpbnV4LXJpc2N2L3BhdGNoLzIwMjMxMDIzMDA0MTAwLjI2NjM0ODYtMy1wZXRlcmxp
bkBhbmRlc3RlY2guY29tLyMyNTU3MzA4NQo+IFsyXSBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtcmlzY3YvcGF0Y2gvMjAyMzEyMTMwNzAzMDEuMTY4NDc1MS0zLXBl
dGVybGluQGFuZGVzdGVjaC5jb20vIzI1NjM2NTg5Cj4gLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9p
cnEtcmlzY3YtaW50Yy5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jIGIvZHJpdmVycy9pcnFjaGlw
L2lycS1yaXNjdi1pbnRjLmMKPiBpbmRleCBlOGQwMWIxNGNjZGQuLmIxM2ExNmIxNjRjOSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWludGMuYwo+ICsrKyBiL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW50Yy5jCj4gQEAgLTE5LDE1ICsxOSwxNyBAQAo+ICAjaW5j
bHVkZSA8bGludXgvc21wLmg+Cj4KPiAgc3RhdGljIHN0cnVjdCBpcnFfZG9tYWluICppbnRjX2Rv
bWFpbjsKPiArc3RhdGljIHVuc2lnbmVkIGludCByaXNjdl9pbnRjX25yX2lycXMgX19yb19hZnRl
cl9pbml0Owo+ICtzdGF0aWMgdW5zaWduZWQgaW50IHJpc2N2X2ludGNfY3VzdG9tX2Jhc2UgX19y
b19hZnRlcl9pbml0Owo+ICtzdGF0aWMgdW5zaWduZWQgaW50IHJpc2N2X2ludGNfY3VzdG9tX25y
X2lycXMgX19yb19hZnRlcl9pbml0Owo+Cj4gIHN0YXRpYyBhc21saW5rYWdlIHZvaWQgcmlzY3Zf
aW50Y19pcnEoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIHsKPiAgICAgICAgIHVuc2lnbmVkIGxv
bmcgY2F1c2UgPSByZWdzLT5jYXVzZSAmIH5DQVVTRV9JUlFfRkxBRzsKPgo+IC0gICAgICAgaWYg
KHVubGlrZWx5KGNhdXNlID49IEJJVFNfUEVSX0xPTkcpKQo+IC0gICAgICAgICAgICAgICBwYW5p
YygidW5leHBlY3RlZCBpbnRlcnJ1cHQgY2F1c2UiKTsKPiAtCj4gLSAgICAgICBnZW5lcmljX2hh
bmRsZV9kb21haW5faXJxKGludGNfZG9tYWluLCBjYXVzZSk7Cj4gKyAgICAgICBpZiAoZ2VuZXJp
Y19oYW5kbGVfZG9tYWluX2lycShpbnRjX2RvbWFpbiwgY2F1c2UpKQo+ICsgICAgICAgICAgICAg
ICBwcl93YXJuX3JhdGVsaW1pdGVkKCJGYWlsZWQgdG8gaGFuZGxlIGludGVycnVwdCAoY2F1c2U6
ICVsZClcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2F1c2UpOwo+
ICB9Cj4KPiAgLyoKPiBAQCAtOTMsNiArOTUsMTQgQEAgc3RhdGljIGludCByaXNjdl9pbnRjX2Rv
bWFpbl9hbGxvYyhzdHJ1Y3QgaXJxX2RvbWFpbiAqZG9tYWluLAo+ICAgICAgICAgaWYgKHJldCkK
PiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IE9ubHkgYWxsb3cgaHdpcnEgZm9yIHdoaWNoIHdlIGhhdmUgY29ycmVzcG9uZGluZyBzdGFuZGFy
ZCBvcgo+ICsgICAgICAgICogY3VzdG9tIGludGVycnVwdCBlbmFibGUgcmVnaXN0ZXIuCj4gKyAg
ICAgICAgKi8KPiArICAgICAgIGlmICgocmlzY3ZfaW50Y19ucl9pcnFzIDw9IGh3aXJxICYmIGh3
aXJxIDwgcmlzY3ZfaW50Y19jdXN0b21fYmFzZSkgfHwKPiArICAgICAgICAgICAocmlzY3ZfaW50
Y19jdXN0b21fYmFzZSArIHJpc2N2X2ludGNfY3VzdG9tX25yX2lycXMpIDw9IGh3aXJxKQo+ICsg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gICAgICAgICBmb3IgKGkgPSAwOyBp
IDwgbnJfaXJxczsgaSsrKSB7Cj4gICAgICAgICAgICAgICAgIHJldCA9IHJpc2N2X2ludGNfZG9t
YWluX21hcChkb21haW4sIHZpcnEgKyBpLCBod2lycSArIGkpOwo+ICAgICAgICAgICAgICAgICBp
ZiAocmV0KQo+IEBAIC0xMTcsOCArMTI3LDcgQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfaW50
Y19pbml0X2NvbW1vbihzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZm4pCj4gIHsKPiAgICAgICAgIGlu
dCByYzsKPgo+IC0gICAgICAgaW50Y19kb21haW4gPSBpcnFfZG9tYWluX2NyZWF0ZV9saW5lYXIo
Zm4sIEJJVFNfUEVSX0xPTkcsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmcmlzY3ZfaW50Y19kb21haW5fb3BzLCBOVUxMKTsKPiArICAgICAgIGludGNf
ZG9tYWluID0gaXJxX2RvbWFpbl9jcmVhdGVfdHJlZShmbiwgJnJpc2N2X2ludGNfZG9tYWluX29w
cywgTlVMTCk7Cj4gICAgICAgICBpZiAoIWludGNfZG9tYWluKSB7Cj4gICAgICAgICAgICAgICAg
IHByX2VycigidW5hYmxlIHRvIGFkZCBJUlEgZG9tYWluXG4iKTsKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FTlhJTzsKPiBAQCAtMTMyLDcgKzE0MSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBy
aXNjdl9pbnRjX2luaXRfY29tbW9uKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmbikKPgo+ICAgICAg
ICAgcmlzY3Zfc2V0X2ludGNfaHdub2RlX2ZuKHJpc2N2X2ludGNfaHdub2RlKTsKPgo+IC0gICAg
ICAgcHJfaW5mbygiJWQgbG9jYWwgaW50ZXJydXB0cyBtYXBwZWRcbiIsIEJJVFNfUEVSX0xPTkcp
Owo+ICsgICAgICAgcHJfaW5mbygiJWQgbG9jYWwgaW50ZXJydXB0cyBtYXBwZWRcbiIsIHJpc2N2
X2ludGNfbnJfaXJxcyk7Cj4gKyAgICAgICBpZiAocmlzY3ZfaW50Y19jdXN0b21fbnJfaXJxcykK
PiArICAgICAgICAgICAgICAgcHJfaW5mbygiJWQgY3VzdG9tIGxvY2FsIGludGVycnVwdHMgbWFw
cGVkXG4iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2X2ludGNfY3VzdG9tX25yX2ly
cXMpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IEBAIC0xNjYsNiArMTc4LDEwIEBAIHN0
YXRpYyBpbnQgX19pbml0IHJpc2N2X2ludGNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUs
Cj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICByaXNj
dl9pbnRjX25yX2lycXMgPSBCSVRTX1BFUl9MT05HOwo+ICsgICAgICAgcmlzY3ZfaW50Y19jdXN0
b21fYmFzZSA9IHJpc2N2X2ludGNfbnJfaXJxczsKPiArICAgICAgIHJpc2N2X2ludGNfY3VzdG9t
X25yX2lycXMgPSAwOwo+ICsKPiAgICAgICAgIHJldHVybiByaXNjdl9pbnRjX2luaXRfY29tbW9u
KG9mX25vZGVfdG9fZndub2RlKG5vZGUpKTsKPiAgfQo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
