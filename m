Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3802C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsPtIllE1ab0VP0+XmG7Y/Onb2CxoCSgDf+GUMnUvOw=; b=Qn2609/s5uJPMa
	Vg/L/w7tWG83OkSpVNuGpftDvHLHBXdlQcN7/Jln9jf4do7z8BKZg0wm/QxZvKM/Yg63/MsJXw/y8
	GmiZyrzLJjYH/Xn0uJ3RhD0YmJIU5BjaV0UqnRNbNSk5zGzWrXUclCM3cQFANVOKf8er5eqq1EhVc
	pVjCuanIYmJ+5cAvVmg18pqUaG1y/Ew/gjMILlKiY9mZ8EEE8DChzqeC99LhQXtBmL71hKZ20pa9l
	XsIUleFypBc2EDVR4JX8o6SqNeINU9/sSvOyxYjJ5//NoNLzLrO02zSkX/UF3jgot7su6XjmrnD7f
	ZTcAdTfus4y+EGpniVUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppXHO-008YjY-0S;
	Thu, 20 Apr 2023 16:37:06 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppXHK-008Yi3-1y
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 16:37:04 +0000
Received: by mail-lj1-x229.google.com with SMTP id h4so3528578ljb.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1682008620; x=1684600620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaoOElEQ0goOV5AcB9fTNnR/4qFK40qSxrlBrcvfN5Y=;
        b=CV7+QEiz/91/5eLG1KsECNXNMCvTFnLjPK7KbXXAMVmEiW8DYf2xWYcDmVRMvTdOAW
         oSos0+eCkdCS6HuIjKQT3gEanvT5ABpuPIa5g8r4sTZSGahJSdO1vd16NENHnybpDtiX
         wW2Uc/5y3RsAtVx/iI2ZajRUgCdrRBjgziesG3AZRjRXqTfA2oFBt8e7ayONkK1x1Soe
         bGtqQPGW2w+Ek8bBkSb2b1pfvesC0F+WBWck8051pddoZhDrtH8PZBvfBoUSf4PICZsR
         1stj+KZA66+r0K5faUYmbXktnOepv/cUBuroI5B7cmjaiit5CmIQAf7MUOsRfebX+A2J
         4UuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682008620; x=1684600620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaoOElEQ0goOV5AcB9fTNnR/4qFK40qSxrlBrcvfN5Y=;
        b=SiWKE6fuIvs27Ve2K5Y+CGigRKr04e337YfY2U3+D2g2nBD2QAgmxQtTWxw5HfEgGi
         vWCXZryf4wpB8UrGQHRP00irsp+OqA+D1FAumUI2/mnC+MBbpCGJcL2qxWld4bbnXs1s
         hmxENClyYJUuN9UfTkMPUBDTA3Y0kcDjQfXUY/9DuSc01Wptv85b48hHoSB43YrTbSKM
         8yH5kdqGwiMjoio9c10ECF5sbIAFUuUONq4TAu+CRepf3cctoXk+BcStREs7QveF44+g
         2Cy/zd0FDj9ZinynqIjXrpSmu8xXRbHAdXDnNM1zLZH/X8pIDCR2PuNDIj6EKtHOEB/K
         elKA==
X-Gm-Message-State: AAQBX9eBZOCk2stKh+d7ZZ2N6OK56y+SnQShKbDq5s5fAiqTl9VnhP4R
	NpSTc45wz9K/lr19FydSeP4zOc1tcjZpSKfLk2aoNQ==
X-Google-Smtp-Source: AKy350Y/gCfruOP47zfXMzbSrGhfLdIMZSMEbrN+QX7vMyYfd5JW9/Vs/H3jmgt9AW7Bu0mWwJ7OZZMykmdImfvJGxg=
X-Received: by 2002:a2e:9c4d:0:b0:2a7:8606:7448 with SMTP id
 t13-20020a2e9c4d000000b002a786067448mr569407ljj.0.1682008619777; Thu, 20 Apr
 2023 09:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <87leinq5wg.fsf@all.your.base.are.belong.to.us> <mhng-607b5023-8f07-4a82-b292-35078123e9e8@palmer-ri-x1c9>
In-Reply-To: <mhng-607b5023-8f07-4a82-b292-35078123e9e8@palmer-ri-x1c9>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Fri, 21 Apr 2023 00:36:48 +0800
Message-ID: <CABgGipWbSFnAK=DwT9X2esPBVTi0p+Oft1NyWbZ60LOwHj4dgA@mail.gmail.com>
Subject: Re: [PATCH -next v18 00/20] riscv: Add vector ISA support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: bjorn@kernel.org, linux-riscv@lists.infradead.org, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com, 
	Richard Henderson <richard.henderson@linaro.org>, libc-alpha@sourceware.org, 
	Andrew Waterman <andrew@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_093702_691557_AFAA6DB2 
X-CRM114-Status: GOOD (  39.45  )
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

T24gV2VkLCBBcHIgMTksIDIwMjMgYXQgMTE6MTjigK9QTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgMTkgQXByIDIwMjMgMDc6NTQ6MjMgUERU
ICgtMDcwMCksIGJqb3JuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBCasO2cm4gVMO2cGVsIDxiam9y
bkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4gPgo+ID4+IEFuZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2
ZS5jb20+IHdyaXRlczoKPiA+Pgo+ID4+PiBUaGlzIHBhdGNoc2V0IGlzIGltcGxlbWVudGVkIGJh
c2VkIG9uIHZlY3RvciAxLjAgc3BlYyB0byBhZGQgdmVjdG9yIHN1cHBvcnQKPiA+Pj4gaW4gcmlz
Y3YgTGludXgga2VybmVsLiBUaGVyZSBhcmUgc29tZSBhc3N1bXB0aW9ucyBmb3IgdGhpcyBpbXBs
ZW1lbnRhdGlvbnMuCj4gPj4+Cj4gPj4+IDEuIFdlIGFzc3VtZSBhbGwgaGFydHMgaGFzIHRoZSBz
YW1lIElTQSBpbiB0aGUgc3lzdGVtLgo+ID4+PiAyLiBXZSBkaXNhYmxlIHZlY3RvciBpbiBib3Ro
IGtlcm5lbCBhbmQgdXNlciBzcGFjZSBbMV0gYnkgZGVmYXVsdC4gT25seQo+ID4+PiAgICBlbmFi
bGUgYW4gdXNlcidzIHZlY3RvciBhZnRlciBhbiBpbGxlZ2FsIGluc3RydWN0aW9uIHRyYXAgd2hl
cmUgaXQKPiA+Pj4gICAgYWN0dWFsbHkgc3RhcnRzIGV4ZWN1dGluZyB2ZWN0b3IgKHRoZSBmaXJz
dC11c2UgdHJhcCBbMl0pLgo+ID4+PiAzLiBXZSBkZXRlY3QgInJpc2N2LGlzYSIgdG8gZGV0ZXJt
aW5lIHdoZXRoZXIgdmVjdG9yIGlzIHN1cHBvcnQgb3Igbm90Lgo+ID4+Pgo+ID4+PiBXZSBkZWZp
bmVkIGEgbmV3IHN0cnVjdHVyZSBfX3Jpc2N2X3ZfZXh0X3N0YXRlIGluIHN0cnVjdCB0aHJlYWRf
c3RydWN0IHRvCj4gPj4+IHNhdmUvcmVzdG9yZSB0aGUgdmVjdG9yIHJlbGF0ZWQgcmVnaXN0ZXJz
LiBJdCBpcyB1c2VkIGZvciBib3RoIGtlcm5lbCBzcGFjZQo+ID4+PiBhbmQgdXNlciBzcGFjZS4K
PiA+Pj4gIC0gSW4ga2VybmVsIHNwYWNlLCB0aGUgZGF0YXAgcG9pbnRlciBpbiBfX3Jpc2N2X3Zf
ZXh0X3N0YXRlIHdpbGwgYmUKPiA+Pj4gICAgYWxsb2NhdGVkIHRvIHNhdmUgdmVjdG9yIHJlZ2lz
dGVycy4KPiA+Pj4gIC0gSW4gdXNlciBzcGFjZSwKPiA+Pj4gICAgIC0gSW4gc2lnbmFsIGhhbmRs
ZXIgb2YgdXNlciBzcGFjZSwgdGhlIHN0cnVjdHVyZSBpcyBwbGFjZWQKPiA+Pj4gICAgICAgcmln
aHQgYWZ0ZXIgX19yaXNjdl9jdHhfaGRyLCB3aGljaCBpcyBlbWJlZGRlZCBpbiBmcCByZXNlcnZl
ZAo+ID4+PiAgICAgICBhZXJhLiBUaGlzIGlzIHJlcXVpcmVkIHRvIGF2b2lkIEFCSSBicmVhayBb
Ml0uIEFuZCBkYXRhcCBwb2ludHMKPiA+Pj4gICAgICAgdG8gdGhlIGVuZCBvZiBfX3Jpc2N2X3Zf
ZXh0X3N0YXRlLgo+ID4+PiAgICAgLSBJbiBwdHJhY2UsIHRoZSBkYXRhIHdpbGwgYmUgcHV0IGlu
IHVidWYgaW4gd2hpY2ggd2UgdXNlCj4gPj4+ICAgICAgIHJpc2N2X3ZyX2dldCgpL3Jpc2N2X3Zy
X3NldCgpIHRvIGdldCBvciBzZXQgdGhlCj4gPj4+ICAgICAgIF9fcmlzY3Zfdl9leHRfc3RhdGUg
ZGF0YSBzdHJ1Y3R1cmUgZnJvbS90byBpdCwgZGF0YXAgcG9pbnRlcgo+ID4+PiAgICAgICB3b3Vs
ZCBiZSB6ZXJvZWQgYW5kIHZlY3RvciByZWdpc3RlcnMgd2lsbCBiZSBjb3BpZWQgdG8gdGhlCj4g
Pj4+ICAgICAgIGFkZHJlc3MgcmlnaHQgYWZ0ZXIgdGhlIF9fcmlzY3Zfdl9leHRfc3RhdGUgc3Ry
dWN0dXJlIGluIHVidWYuCj4gPj4+Cj4gPj4+IFRoaXMgcGF0Y2hzZXQgaXMgcmViYXNlZCB0byB2
Ni4zLXJjMSBhbmQgaXQgaXMgdGVzdGVkIGJ5IHJ1bm5pbmcgc2V2ZXJhbAo+ID4+PiB2ZWN0b3Ig
cHJvZ3JhbXMgc2ltdWx0YW5lb3VzbHkuIEl0IGRlbGl2ZXJzIHNpZ25hbHMgY29ycmVjdGx5IGlu
IGEgdGVzdAo+ID4+PiB3aGVyZSB3ZSBjYW4gc2VlIGEgdmFsaWQgdWNvbnRleHRfdCBpbiBhIHNp
Z25hbCBoYW5kbGVyLCBhbmQgYSBjb3JyZWN0IFYKPiA+Pj4gY29udGV4dCByZXR1cmluZyBiYWNr
IGZyb20gaXQuIEFuZCB0aGUgcHRyYWNlIGludGVyZmFjZSBpcyB0ZXN0ZWQgYnkKPiA+Pj4gUFRS
QUNFX3tHRVQsU0VUfVJFR1NFVC4gTGFzdGx5LCBLVk0gaXMgdGVzdGVkIGJ5IHJ1bm5pbmcgYWJv
dmUgdGVzdHMgaW4KPiA+Pj4gYSBndWVzdCB1c2luZyB0aGUgc2FtZSBrZXJuZWwgaW1hZ2UuIEFs
bCB0ZXN0cyBhcmUgZG9uZSBvbiBhbiBydjY0Z2N2Cj4gPj4+IHZpcnQgUUVNVS4KPiA+Pj4KPiA+
Pj4gTm90ZTogcGxlYXNlIGFwcGx5IHRoZSBwYXRjaCBhdCBbNF0gZHVlIHRvIGEgcmVncmVzc2lv
biBpbnRyb2R1Y2VkIGJ5Cj4gPj4+IGNvbW1pdCA1OTZmZjRhMDliODkgKCJjcHVtYXNrOiByZS1p
bnRyb2R1Y2UgY29uc3RhbnQtc2l6ZWQgY3B1bWFzawo+ID4+PiBvcHRpbWl6YXRpb25zIikgYmVm
b3JlIHRlc3RpbmcgdGhlIHNlcmllcy4KPiA+Pj4KPiA+Pj4gU291cmNlIHRyZWU6Cj4gPj4+IGh0
dHBzOi8vZ2l0aHViLmNvbS9zaWZpdmUvcmlzY3YtbGludXgvdHJlZS9yaXNjdi9mb3ItbmV4dC92
ZWN0b3ItdjE4Cj4gPj4KPiA+PiBBZnRlciBzb21lIG9mZmxpc3QgZGlzY3Vzc2lvbnMsIHdlIG1p
Z2h0IGhhdmUgYSBpZGVudGlmaWVkIGEKPiA+PiBwb3RlbnRpYWwgbGliYy0+YXBwbGljYXRpb24g
QUJJIGJyZWFrLgo+ID4+Cj4gPj4gR2l2ZW4gYW4gYXBwbGljYXRpb24gdGhhdCBkb2VzIGN1c3Rv
bSB0YXNrIHNjaGVkdWxpbmcgdmlhIGEgc2lnbmFsCj4gPj4gaGFuZGxlci4gVGhlIGFwcGxpY2F0
aW9uIGJpbmFyeSBpcyBub3QgdmVjdG9yIGF3YXJlLCBidXQgbGliYyBpcy4gTGliYwo+ID4+IGlz
IHVzaW5nIHZlY3RvciByZWdpc3RlcnMgZm9yIG1lbWNweS4gSXQncyBhbiAib2xkIGFwcGxpY2F0
aW9uLCBuZXcKPiA+PiBsaWJyYXJ5LCBuZXcga2VybmVsIi1zY2VuYXJpby4KPiA+Pgo+ID4+ICB8
IC4uLgo+ID4+ICB8IHN0cnVjdCBjb250ZXh0ICpwMV9jdHg7Cj4gPj4gIHwgc3RydWN0IGNvbnRl
eHQgKnAyX2N0eDsKPiA+PiAgfAo+ID4+ICB8IHZvaWQgc2lnaGFuZGxlcihpbnQgc2lnLCBzaWdp
bmZvX3QgKmluZm8sIHZvaWQgKnVjb250ZXh0KQo+ID4+ICB8IHsKPiA+PiAgfCAgIGlmIChwMV9y
dW5uaW5nKQo+ID4+ICB8ICAgICBzd2l0Y2hfdG8ocDFfY3R4LCBwMl9jdHgpOwo+ID4+ICB8ICAg
aWYgKHAyX3J1bm5pbmcpCj4gPj4gIHwgICAgIHN3aXRjaF90byhwMl9jdHgsIHAxX2N0eCk7Cj4g
Pj4gIHwgfQo+ID4+ICB8Cj4gPj4gIHwgdm9pZCBwMSh2b2lkKQo+ID4+ICB8IHsKPiA+PiAgfCAg
IG1lbWNweShmb28sIGJhciwgMTcpOwo+ID4+ICB8IH0KPiA+PiAgfAo+ID4+ICB8IHZvaWQgcDIo
dm9pZCkKPiA+PiAgfCB7Cj4gPj4gIHwgICAuLi4KPiA+PiAgfCB9Cj4gPj4gIHwgLi4uCj4gPj4K
PiA+PiBUaGUgc3dpdGNoX3RvKCkgZnVuY3Rpb24gc2NoZWR1bGVzIHAxKCkgYW5kIHAyKCkuIEUu
Zy4sIHRoZQo+ID4+IGFwcGxpY2F0aW9uIChhc3N1bWVzIHRoYXQgaXQpIHNhdmVzIHRoZSBjb21w
bGV0ZSB0YXNrIHN0YXRlIGZyb20KPiA+PiBzaWdjb250ZXh0ICh1Y29udGV4dCkgdG8gcDFfY3R4
LCBhbmQgcmVzdG9yZXMgc2lnY29udGV4dCB0byBwMl9jdHgsIHNvCj4gPj4gd2hlbiBzaWdyZXR1
cm4gaXMgY2FsbGVkLCBwMigpIGlzIHJ1bm5pbmcsIGFuZCBwMSgpIGhhcyBiZWVuCj4gPj4gaW50
ZXJydXB0ZWQuCj4gPj4KPiA+PiBUaGUgIm9sZCBhcHBsaWNhdGlvbiIgd2hpY2ggaXMgbm90IGF3
YXJlIG9mIHZlY3RvciwgaXMgbm93IHJ1biBvbiBhCj4gPj4gdmVjdG9yIGVuYWJsZWQga2VybmVs
L2dsaWJjLgo+ID4+Cj4gPj4gQXNzdW1lIHRoYXQgdGhlIHNpZ2hhbmRsZXIgaXMgaGl0LCBhbmQg
cDEoKSBpcyBpbiB0aGUgbWlkZGxlIG9mIHRoZQo+ID4+IHZlY3RvciBtZW1jcHkuIFRoZSBzd2l0
Y2hfdG8oKSBmdW5jdGlvbiB3aWxsIG5vdCBzYXZlIHRoZSB2ZWN0b3IKPiA+PiBzdGF0ZSwgYW5k
IG5leHQgdGltZSBwMigpIGlzIHNjaGVkdWxlZCB0byBydW4gaXQgd2lsbCBoYXZlIGluY29ycmVj
dAo+ID4+IG1hY2hpbmUgc3RhdGUuCj4KPiBUaGFua3MgZm9yIHdyaXRpbmcgdGhpcyB1cCwgYW5k
IHNvcnJ5IEkndmUgZHJvcHBlZCB0aGUgYmFsbCBhIGZldyB0aW1lcyBvbgo+IGRlc2NyaWJpbmcg
aXQuCj4KPiA+PiBOb3c6Cj4gPj4KPiA+PiBJcyB0aGlzIGFuIGFjdHVhbCBvciB0aGVvcmV0aWNh
bCBwcm9ibGVtIChpLmUuIGFyZSB0aGVyZSBhbnkKPiA+PiBhcHBsaWNhdGlvbnMgaW4gdGhlIHdp
bGQpPyBJJ2QgYmUgc3VycHJpc2VkIGlmIGl0IHdvdWxkIG5vdCBiZSB0aGUKPiA+PiBsYXR0ZXIu
Li4KPgo+IEkgYWxzbyBoYXZlIG5vIGlkZWEuICBJdCdzIGtpbmQgb2Ygb2RkIHRvIHNheSAibm9i
b2R5IGNhcmVzIGFib3V0IHRoZQo+IEFCSSBicmVhayIgd2hlbiB3ZSBjYW4gbWFuaWZlc3QgaXQg
d2l0aCBzb21lIGZhaXJseSBzaW1wbGUgZXhhbXBsZSwgYnV0Cj4gSSdkIGJldCB0aGF0IG5vYm9k
eSBjYXJlcy4KPgo+ID4+IFJlZ2FyZGxlc3MsIGEga2VybmVsIGtub2IgZm9yIGRpc2FibGluZyB2
ZWN0b3IgKHN5c2N0bC9wcmN0bCkgdG8gYXZvaWQKPiA+PiB0aGVzZSBraW5kIG9mIGJyZWFrcyBp
cyBuZWVkZWQgKHJpZ2h0PykuIENvdWxkIHRoaXMga25vYiBiZSBhCj4gPj4gZm9sbG93LXVwIHBh
dGNoIHRvIHRoZSBleGlzdGluZyB2MTggc2VyaWVzPwo+ID4+Cj4gPj4gTm90ZSB0aGF0IGFybTY0
IGRvZXMgbm90IHN1ZmZlciBmcm9tIHRoaXMgd2l0aCBTVkUsIGJlY2F1c2UgdGhlIGRlZmF1bHQK
PiA+PiB2ZWN0b3IgbGVuZ3RoICh2bD09MC8xMjhiKjMyKSBmaXRzIGluIHRoZSAibGVnYWN5IiBz
aWdjb250ZXh0Lgo+ID4KPiA+IEFuZHksIHRvIGNsYXJpZnkgZnJvbSB0aGUgcGF0Y2h3b3JrIGNh
bGw7IEluCj4gPiBEb2N1bWVudGF0aW9uL2FybTY0L3N2ZS5yc3Q6Cj4gPgo+ID4gVGhlcmUncyBh
IHBlci1wcm9jZXNzIHByY3RsIChzZWN0aW9uIDYpLCBhbmQgYSBzeXN0ZW0gcnVudGltZSBjb25m
Cj4gPiAoc2VjdGlvbiA5KS4KClRoYW5rcyBmb3IgcG9pbnRpbmcgbWUgb3V0IQoKPgo+IEkgdGhp
bmsgaWYgd2Ugd2FudCB0byBwbGF5IGl0IHNhZmUgV1JUIHRoZSBBQkkgYnJlYWssIHRoZW4gd2Ug
Y2FuCj4gZXNzZW50aWFsbHkganVzdCBkbyB0aGUgc2FtZSB0aGluZy4gIEl0J2xsIGJlIGEgbXVj
aCBiaWdnZXIgY2xpZmYgZm9yIHVzCj4gYmVjYXVzZSB3ZSBoYXZlIG5vIHNwYWNlIGZvciB0aGUg
ViBleHRlbnNpb24sIGJ1dCB0aGF0IHdhcyBqdXN0IGEKPiBtaXN0YWtlIGFuZCB0aGVyZSdzIG5v
dGhpbmcgd2UgY2FuIGRvIGFib3V0IGl0LgoKSSB1bmRlcnN0YW5kIHRoZSBjb25jZXJuLiBJdCBp
cyBnb29kIHRvIHByb3ZpZGUgYSB3YXkgdG8gaGF2ZSBleHBsaWNpdApjb250cm9scyBvZiBWZWN0
b3IgcmF0aGVyIHRoYW4gZG8gbm90aGluZyBpZiBzdWNoIEFCSSBicmVhayBoYXBwZW5zLgpBcyBm
b3IgaW1wbGVtZW50YXRpb24gZGV0YWlscywgZG8geW91IHRoaW5rIGEgc3lzdGVtLXdpZGUgIHN5
c2N0bAphbG9uZSBpcyBlbm91Z2g/IE9yLCBkbyB3ZSBhbHNvIG5lZWQgYSBwcmN0bCBmb3IgcGVy
LXByb2Nlc3MgY29udHJvbD8KCj4KPiA+IEJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
