Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAF9C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 17:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=G2+7jDtuu2GAcj1a/Z2IQFxmB2U8JryJI1pRx7awNCE=; b=X8z3QXGf8i1wFEC42K8nCrd1kQ
	7GZtDjMYDuTg7ZQglSCEwKu+6OrSQ4fSbYynkRnJqQxC+TTw1KE0QteJ6+FJNnkLeNb0myY8DDrwZ
	jE5qeOYHxXrQ1YzrzZ8D0vcKLm8uUv8zI12xVzcDrumS7tiiybDnS3ByJfvDNQ/am1D27+pHogcrs
	cmbxHcw6tQPUNroFC7dSzB7BBtcE8uGns+LItyOu+aFW4KkMpItUiQ+jLDxG8ENZ2WDNIq31bUT6L
	6P97dK/aSBFOGKDKcYofRNAiDsWBemnIXfMW+dliqDCUG9yjv1W+N5QCRRXZH1kZFjgqD8xEBSr9v
	TLSTnrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Q8c-0026zp-1E;
	Tue, 07 Nov 2023 17:45:18 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Q8Y-0026yU-1a
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 17:45:16 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1e9c42fc0c9so2495318fac.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 09:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699379111; x=1699983911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLw1ycS53eoBey8p/LpxiLSZTGGyXo8/Ae2SXePJVaQ=;
        b=Hr7XUr3pXB+0XwqVE4bE+ZSWeT5b7vwD6j7V8y4bZ26OPpUpdsxfEi4MT2m+58SvMq
         KSpkgLuHBpNuzXU0HKtwpEz9T5B0CvhevRMgQSGXloilMVVO9ceKkoxHZuwdhUwoc5V8
         0/2CFWpRDth1WIczed4DPHdQkGPOpNxOsf5m8mBtHJXiDBnIOuACD+t7/7DzXoRTyMLg
         WFe+P0gtlyZCpUlATBtaL19xnXxstM3YsqiK+TMyS6iAsbiVMpYM9Xo//Q4M5fhJWZYv
         KlKhFB/R7cDWGjf0y++o2PS7muwUHvrF65WPn50EnB8K073a7JnMF30NU1uARS2Hm/gW
         AvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699379111; x=1699983911;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLw1ycS53eoBey8p/LpxiLSZTGGyXo8/Ae2SXePJVaQ=;
        b=sQgYRoDeUpC/TZygs3BcIajB1TIC39GesISAVlFdRZsGF9xf9tOMa9/ooXK6oddMkc
         hYVLDNSQ3KxvGBHW3RMo2zi+vuvWups/XB3YTd1QUc/oM++1v4wO1YL5nJ+9uVva3zaZ
         hRp4g7b+UpLxHExKyRXQ3JlLpXyEWXqcINp2ZNYubCz7jUqibdW1LSs1WLhaK7t9rFqv
         LpgiMaCRSdGw0xCqh9Fgz2zVPkUKyOZ9dTpveCc9EqyUI2l4zS1kqiVqVREQ/DwjiNFH
         0PLJ+jOk5jP+HtgztQakPnEl21rxQdv2KVysqGRg6QihpaOjEfewJKOCLdwSlSmipH1A
         8VvA==
X-Gm-Message-State: AOJu0YwDOGJAn0DreqREzkrc4jvkmu2yTGs17Ev8ytDBsbMIjVcsS9IK
	i37Iw6ZjKaxKp4nL7VLqJmuFUQ==
X-Google-Smtp-Source: AGHT+IHlLVdERqtE0XvCqLkdz065+DVCPLV1AtuGY6e3yJ09g92r1jrGx//kJTvNDqRtAkpZI5gK9A==
X-Received: by 2002:a54:4114:0:b0:3a8:4d1f:9da5 with SMTP id l20-20020a544114000000b003a84d1f9da5mr28836438oic.31.1699379110989;
        Tue, 07 Nov 2023 09:45:10 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id j26-20020aca171a000000b003b2df32d9a9sm1617905oii.19.2023.11.07.09.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 09:45:10 -0800 (PST)
Date: Tue, 07 Nov 2023 09:45:10 -0800 (PST)
X-Google-Original-Date: Tue, 07 Nov 2023 09:45:08 PST (-0800)
Subject: Re: [PATCH v3] RISC-V: Probe misaligned access speed in parallel
In-Reply-To: <CALs-HsvX=zHvSKV5Skuxk=7jWq_mGqhsRSeuefD7OiYOCr3Gkw@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Evan Green <evan@rivosinc.com>
Message-ID: <mhng-7b97d1d2-d230-42ef-b3e8-5312da36495e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_094514_536677_4CCB9645 
X-CRM114-Status: GOOD (  44.90  )
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
Cc: apatel@ventanamicro.com, aou@eecs.berkeley.edu, heiko@sntech.de, leyfoon.tan@starfivetech.com, Marc Zyngier <maz@kernel.org>, bigeasy@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, David.Laight@aculab.com, jszhang@kernel.org, greentime.hu@sifive.com, cleger@rivosinc.com, linux-riscv@lists.infradead.org, ajones@ventanamicro.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwNyBOb3YgMjAyMyAwOToyNjowMyBQU1QgKC0wODAwKSwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBUdWUsIE5vdiA3LCAyMDIzIGF0IDEyOjM04oCvQU0gU2ViYXN0aWFuIEFuZHJ6ZWog
U2lld2lvcgo+IDxiaWdlYXN5QGxpbnV0cm9uaXguZGU+IHdyb3RlOgo+Pgo+PiBPbiAyMDIzLTEx
LTA2IDE0OjU4OjU1IFstMDgwMF0sIEV2YW4gR3JlZW4gd3JvdGU6Cj4+ID4gUHJvYmluZyBmb3Ig
bWlzYWxpZ25lZCBhY2Nlc3Mgc3BlZWQgdGFrZXMgYWJvdXQgMC4wNiBzZWNvbmRzLiBPbiBhCj4+
ID4gc3lzdGVtIHdpdGggNjQgY29yZXMsIGRvaW5nIHRoaXMgaW4gc21wX2NhbGxpbigpIG1lYW5z
IGl0J3MgZG9uZQo+PiA+IHNlcmlhbGx5LCBleHRlbmRpbmcgYm9vdCB0aW1lIGJ5IDMuOCBzZWNv
bmRzLiBUaGF0J3MgYSBsb3Qgb2YgYm9vdCB0aW1lLgo+PiA+Cj4+ID4gSW5zdGVhZCBvZiBtZWFz
dXJpbmcgZWFjaCBDUFUgc2VyaWFsbHksIGxldCdzIGRvIHRoZSBtZWFzdXJlbWVudHMgb24KPj4g
PiBhbGwgQ1BVcyBpbiBwYXJhbGxlbC4gSWYgd2UgZGlzYWJsZSBwcmVlbXB0aW9uIG9uIGFsbCBD
UFVzLCB0aGUKPj4gPiBqaWZmaWVzIHN0b3AgdGlja2luZywgc28gd2UgY2FuIGRvIHRoaXMgaW4g
c3RhZ2VzIG9mIDEpIGV2ZXJ5Ym9keQo+PiA+IGV4Y2VwdCBjb3JlIDAsIHRoZW4gMikgY29yZSAw
LiBUaGUgYWxsb2NhdGlvbnMgYXJlIGFsbCBkb25lIG91dHNpZGUgb2YKPj4gPiBvbl9lYWNoX2Nw
dSgpIHRvIGF2b2lkIGNhbGxpbmcgYWxsb2NfcGFnZXMoKSB3aXRoIGludGVycnVwdHMgZGlzYWJs
ZWQuCj4+ID4KPj4gPiBGb3IgaG90cGx1Z2dlZCBDUFVzIHRoYXQgY29tZSBpbiBhZnRlciB0aGUg
Ym9vdCB0aW1lIG1lYXN1cmVtZW50LAo+PiA+IHJlZ2lzdGVyIENQVSBob3RwbHVnIGNhbGxiYWNr
cywgYW5kIGRvIHRoZSBtZWFzdXJlbWVudCB0aGVyZS4gSW50ZXJydXB0cwo+PiA+IGFyZSBlbmFi
bGVkIGluIHRob3NlIGNhbGxiYWNrcywgc28gdGhleSdyZSBmaW5lIHRvIGRvIGFsbG9jX3BhZ2Vz
KCkgaW4uCj4+Cj4+IEkgdGhpbmsgdGhpcyBpcyBkcmFnZ2VkIG91dCBvZiBwcm9wb3J0aW9uLiBJ
IHdvdWxkIGRvIHRoaXMgKGlmIG5lZWRlZAo+PiBjYW4gY2FuJ3QgYmUgaWRlbnRpZmllZCBieSBD
UFUtSUQgb3Igc28pIG9uIGJvb3QgQ1BVIG9ubHkuIElmIHRoZXJlIGlzCj4+IGV2aWRlbmNlLyBw
cm9vZi8gYmxlc3NpbmcgZnJvbSB0aGUgaGlnaCBSaXNjViBjb3VuY2lsIHRoYXQgZGlmZmVyZW50
Cj4+IHR5cGVzIG9mIENQVSBjb3JlcyBhcmUgbWl4ZWQgdG9nZXRoZXIgdGhlbiB0aGlzIGNvdWxk
IGJlIGV4dGVuZGVkLgo+PiBZb3UgYnJvdWdodCBCaWctTGl0dGxlIHVwIGluIHRoZSBvdGhlciB0
aHJlYWQuIFRoaXMgaXMgYWN0dWFsbHkga25vd24uCj4+IFNhbWUgYXMgd2l0aCBoeXBlci10aHJl
YWRzIG9uIHg4NiwgeW91IGtub3cgd2hpY2ggQ1BVIGlzIHRoZSBjb3JlIGFuZAo+PiB3aGljaCBo
eXBlciB0aHJlYWQgKENQVSkgYmVsb25ncyB0byBpdC4KPj4gU28gaW4gdGVybXMgb2YgQmlnTGl0
dGxlIHlvdSBfY291bGRfIGxpbWl0IHRoaXMgdG8gb25lIEJpZyBhbmQgb25lCj4+IExpdHRsZSBj
b3JlIGluc3RlYWQgcnVubmluZyBpdCBvbiBhbGwuCj4KPiBEb2luZyBpdCBvbiBvbmUgcGVyIGNs
dXN0ZXIgbWlnaHQgYWxzbyBoYXBwZW4gdG8gd29yaywgYnV0IEkgc3RpbGwgc2VlCj4gbm90aGlu
ZyB0aGF0IHByZXZlbnRzIHZhcmlldHkgd2l0aGluIGEgY2x1c3Rlciwgc28gSSdtIG5vdCBjb21m
b3J0YWJsZQo+IHdpdGggdGhhdCBhc3N1bXB0aW9uLiBJdCBhbHNvIGRvZXNuJ3QgYnV5IG11Y2gu
IEknbSBub3Qgc3VyZSB3aGF0IGtpbmQKPiBvZiBndWlkYW5jZSBSVkkgaXMgcHJvdmlkaW5nIG9u
IGludGVncmF0aW5nIG11bHRpcGxlIENQVXMgaW50byBhCj4gc3lzdGVtLiBJIGhhdmVuJ3Qgc2Vl
biBhbnkgbXlzZWxmLCBidXQgYW0gaGFwcHkgdG8gcmVhc3Nlc3MgaWYgdGhlcmUncwo+IGRvY3Vt
ZW50YXRpb24gYmFubmluZyB0aGUgc2NlbmFyaW9zIEknbSBpbWFnaW5pbmcuCgpJSVVDIHRoZXJl
J3MgcHJldHR5IG11Y2ggbm8gcnVsZXMgaGVyZSwgYW5kIHZlbmRvcnMgYXJlIGFscmVhZHkgYnVp
bGRpbmcgCndhY2t5IHN5c3RlbXMgKHRoZSBLMjMwIGp1c3Qgc2hvd2VkIHVwIHdpdGggaGV0ZXJv
Z2Vub3VzLUlTQSBjb3JlcywgCndlJ3ZlIGdvdCBhIGhhbmRmdWwgbm93KS4gIEkgZ3Vlc3Mgd2Ug
Y291bGQgd3JpdGUgdXAgc29tZSBndWlkYW5jZSBpbiAKRG9jdW1lbnRhdGlvbi9yaXNjdiBkZXNj
cmliaW5nIHdoYXQgc29ydCBvZiBzeXN0ZW1zIHdlIGdlbmVyYWxseSB0ZXN0IApvbiwgYnV0IGdp
dmVuIGhvdyBSSVNDLVYgZ2VuZXJhbGx5IGdvZXMgdmVuZG9ycyBhcmUganVzdCBnb2luZyB0byBi
dWlsZCAKdGhlIGNyYXp5IHN0dWZmIGFueXdheSBhbmQgd2UnbGwgaGF2ZSB0byBkZWFsIHdpdGgg
aXQuCgo+Cj4+Cj4+IEJ1dCB0aGlzIGlzIGp1c3QgbXkgZmV3IG9uIHRoaXMuIEZyb20gUFJFRU1Q
VF9SVCdzIHBvaW50IG9mIHZpZXcsIHRoZQo+PiB3YXkgeW91IHJlc3RydWN0dXJlZCB0aGUgbWVt
b3J5IGFsbG9jYXRpb24gc2hvdWxkIHdvcmsgbm93Lgo+Cj4gVGhhbmtzIQo+Cj4+Cj4+ID4gUmVw
b3J0ZWQtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPj4gPiBDbG9zZXM6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9taG5nLTkzNTk5OTNkLTY4NzItNDEzNC04M2Nl
LWM5N2RlYmUxY2Y5YUBwYWxtZXItcmkteDFjOS9ULyNtYWU5YjhmNDAwMTZmOWRmNDI4ODI5ZDMz
MzYwMTQ0ZGM1MDI2YmNiZgo+PiA+IEZpeGVzOiA1ODRlYTY1NjRiY2EgKCJSSVNDLVY6IFByb2Jl
IGZvciB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIikKPj4gPiBTaWduZWQtb2ZmLWJ5OiBFdmFuIEdy
ZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KPj4gPgo+PiA+Cj4+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUu
Ywo+PiA+IGluZGV4IDZhMDFkZWQ2MTVjZC4uZmU1OWUxOGRiZDViIDEwMDY0NAo+PiA+IC0tLSBh
L2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+PiA+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYwo+PiDigKYKPj4gPgo+PiA+IC1zdGF0aWMgaW50IF9faW5pdCBjaGVj
a191bmFsaWduZWRfYWNjZXNzX2Jvb3RfY3B1KHZvaWQpCj4+ID4gKy8qIE1lYXN1cmUgdW5hbGln
bmVkIGFjY2VzcyBvbiBhbGwgQ1BVcyBwcmVzZW50IGF0IGJvb3QgaW4gcGFyYWxsZWwuICovCj4+
ID4gK3N0YXRpYyBpbnQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19hbGxfY3B1cyh2b2lkKQo+PiA+
ICB7Cj4+ID4gLSAgICAgY2hlY2tfdW5hbGlnbmVkX2FjY2VzcygwKTsKPj4gPiArICAgICB1bnNp
Z25lZCBpbnQgY3B1Owo+PiA+ICsgICAgIHVuc2lnbmVkIGludCBjcHVfY291bnQgPSBudW1fcG9z
c2libGVfY3B1cygpOwo+PiA+ICsgICAgIHN0cnVjdCBwYWdlICoqYnVmcyA9IGt6YWxsb2MoY3B1
X2NvdW50ICogc2l6ZW9mKHN0cnVjdCBwYWdlICopLAo+PiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7Cj4+Cj4+IGtjYWxsb2MoKS4gRm9yIGJlYXV0eSBy
ZWFzb25zIHlvdSBjb3VsZCB0cnkgYSByZXZlcnNlIHhtYXMgdHJlZS4KPj4KPj4gPiArCj4+ID4g
KyAgICAgaWYgKCFidWZzKSB7Cj4+ID4gKyAgICAgICAgICAgICBwcl93YXJuKCJBbGxvY2F0aW9u
IGZhaWx1cmUsIG5vdCBtZWFzdXJpbmcgbWlzYWxpZ25lZCBwZXJmb3JtYW5jZVxuIik7Cj4+ID4g
KyAgICAgICAgICAgICByZXR1cm4gMDsKPj4gPiArICAgICB9Cj4+ID4gKwo+PiA+ICsgICAgIC8q
Cj4+ID4gKyAgICAgICogQWxsb2NhdGUgc2VwYXJhdGUgYnVmZmVycyBmb3IgZWFjaCBDUFUgc28g
dGhlcmUncyBubyBmaWdodGluZyBvdmVyCj4+ID4gKyAgICAgICogY2FjaGUgbGluZXMuCj4+ID4g
KyAgICAgICovCj4+ID4gKyAgICAgZm9yX2VhY2hfY3B1KGNwdSwgY3B1X29ubGluZV9tYXNrKSB7
Cj4+ID4gKyAgICAgICAgICAgICBidWZzW2NwdV0gPSBhbGxvY19wYWdlcyhHRlBfS0VSTkVMLCBN
SVNBTElHTkVEX0JVRkZFUl9PUkRFUik7Cj4+ID4gKyAgICAgICAgICAgICBpZiAoIWJ1ZnNbY3B1
XSkgewo+PiA+ICsgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJBbGxvY2F0aW9uIGZhaWx1
cmUsIG5vdCBtZWFzdXJpbmcgbWlzYWxpZ25lZCBwZXJmb3JtYW5jZVxuIik7Cj4+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+PiA+ICsgICAgICAgICAgICAgfQo+PiA+ICsgICAg
IH0KPj4gPiArCj4+ID4gKyAgICAgLyogQ2hlY2sgZXZlcnlib2R5IGV4Y2VwdCAwLCB3aG8gc3Rh
eXMgYmVoaW5kIHRvIHRlbmQgamlmZmllcy4gKi8KPj4gPiArICAgICBvbl9lYWNoX2NwdShjaGVj
a191bmFsaWduZWRfYWNjZXNzX25vbmJvb3RfY3B1LCBidWZzLCAxKTsKPj4KPj4gY29tbWVudHMh
IF9IT1dfIGRvIHlvdSBlbnN1cmUgdGhhdCBDUFUwIGlzIGxlZnQgb3V0PyBZb3UgZG9uJ3QuIENQ
VTAKPj4gZG9lcyB0aGlzIGFuZCB0aGUgbGVhdmVzIHdoaWNoIGlzIGEgd2FzdGUuIFVzaW5nIG9u
X2VhY2hfY3B1X2NvbmQoKQo+PiBjb3VsZCBkZWFsIHdpdGggdGhpcy4gQW5kIHlvdSBoYXZlIHRo
ZSBjaGVjayB3aXRoaW4gdGhlIHdyYXBwZXIKPj4gKGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Nfbm9u
Ym9vdF9jcHUoKSkgYW55d2F5Lgo+Pgo+PiA+ICsgICAgIC8qIENoZWNrIGNvcmUgMC4gKi8KPj4g
PiArICAgICBzbXBfY2FsbF9vbl9jcHUoMCwgY2hlY2tfdW5hbGlnbmVkX2FjY2VzcywgYnVmc1sw
XSwgdHJ1ZSk7Cj4+Cj4+IE5vdyB0aGF0IGNvbW1lbnQgaXMgb2J2aW91cy4gSWYgeW91IHdhbnQg
dG8gYWRkIGEgY29tbWVudCwgd2h5IG5vdCBzdGF0ZQo+PiB3aHkgQ1BVMCBoYXMgdG8gYmUgZG9u
ZSBsYXN0Pwo+Pgo+PiA+ICsKPj4gPiArICAgICAvKiBTZXR1cCBob3RwbHVnIGNhbGxiYWNrIGZv
ciBhbnkgbmV3IENQVXMgdGhhdCBjb21lIG9ubGluZS4gKi8KPj4gPiArICAgICBjcHVocF9zZXR1
cF9zdGF0ZV9ub2NhbGxzKENQVUhQX0FQX09OTElORV9EWU4sICJyaXNjdjpvbmxpbmUiLAo+PiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmlzY3Zfb25saW5lX2NwdSwgTlVMTCk7
Cj4+IEluc3RlYWQgcmlzY3Y6b25saW5lIHlvdSBjb3VsZCB1c2UgcmlzY3Y6dW5hbGlnZWRfY2hl
Y2sgb3Igc29tZXRoaW5nCj4+IHRoYXQgcGluIHBvaW50cyB0aGUgY2FsbGJhY2sgdG8gc29tZXRo
aW5nIG9idmlvdXMuIFRoaXMgaXMgZXhwb3J0ZWQgdmlhCj4+IHN5c2ZzLgo+Pgo+PiBBZ2Fpbiwg
Y29tbWVudCBpcyBvYnZpb3VzLiBGb3IgdGhhdCB0byBtYWtlIHNlbnNlIHdvdWxkIHJlcXVpcmUg
UmlzY1YgdG8KPj4gc3VwcG9ydCBwaHlzaWNhbC1ob3RwbHVnLiBGb3IgS1ZNIGxpa2UgZW52aXJv
bm1lbnQgKHdoZXJlIHlvdSBjYW4gcGx1ZyBpbgo+PiBDUFVzIGxhdGVyKSB0aGlzIHByb2JhYmx5
IGRvZXNuJ3QgbWFrZSBzZW5zZSBhdCBhbGwuIFdoeSBub3Q/IEJlY2F1c2UKPj4KPj4gLSB3aXRo
b3V0IGV4cGxpY2l0IENQVSBwaW5uaW5nIHlvdXIgc2xvdy8gZmFzdCBDUFUgbWFwcGluZyAoaG9z
dCA8LT4KPj4gICBndWVzdCkgY291bGQgY2hhbmdlIGlmIHRoZSBzY2hlZHVsZXIgb24gdGhlIGhv
c3QgbW92ZXMgdGhlIHRocmVhZHMKPj4gICBhcm91bmQuCj4KPiBUYWtpbmcgYSBzeXN0ZW0gd2l0
aCBub24taWRlbnRpY2FsIGNvcmVzIGFuZCBhbGxvd2luZyB2Y3B1cyB0byBib3VuY2UKPiBiZXR3
ZWVuIHRoZW0gc291bmRzIGxpa2UgYSBoeXBlcnZpc29yIGNvbmZpZ3VyYXRpb24gaXNzdWUgdG8g
bWUsCj4gcmVnYXJkbGVzcyBvZiB0aGlzIHBhdGNoLgo+Cj4+Cj4+IC0gd2l0aG91dCBleHBsaWNp
dCB0YXNrIG9mZmxvYWQgYW5kIHJlc291cmNlIHBhcnRpdGlvbmluZyBvbiB0aGUgaG9zdAo+PiAg
IHlvdXIgZ3Vlc3QgdGhyZWFkIG1pZ2h0IGdldCBpbnRlcnJ1cHQgZHVyaW5nIHRoZSBtZWFzdXJl
bWVudC4gVGhpcyBpcwo+PiAgIGRvbmUgZHVyaW5nIGJvb3Qgc28gY2hhbmNlcyBhcmUgaGlnaCB0
aGF0IGl0IHJ1bnMgMTAwJSBvZiBpdHMgdGltZQo+PiAgIHNsaWNlIGFuZCB3aWxsIGJlIHByZWVt
cHRlZCBvbmNlIG90aGVyIHRhc2tzIG9uIHRoZSBob3N0IGFzayBmb3IgQ1BVCj4+ICAgcnVuIHRp
bWUuCj4KPiBUaGUgbWVhc3VyZW1lbnQgdGFrZXMgdGhlIGJlc3QgKGxvd2VzdCB0aW1lKSBpdGVy
YXRpb24uIFNvIHVubGVzcwo+IGV2ZXJ5IGl0ZXJhdGlvbiBnZXRzIGludGVycnVwdGVkLCBJIHNo
b3VsZCBnZXQgYSBnb29kIHJlYWQgaW4gdGhlcmUKPiBzb21ld2hlcmUuCj4gLUV2YW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
