Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363DBC04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZodWUXYAPR6J9I9XiwszoF+3AgXKN3BZbI8rTmvqL4o=; b=SXbdlIx1wjyY40
	JCpAOF5+VDUyAmxJRAtCTKGwtV6uy0ljIk/4p8voVMVU97BFb5YEJgx859yVFw4xUAQgGJO9Q3ixd
	dTh8fF1A3S915bapTEmrQBHQ4tnmyN/O51SR4NcvBBACUz8J+30cpABbUCKMOxnPjIaofMtqJzfDs
	4kphCAme/RX1Dv9p5gqEst2Go6IgUs3vMuT8jB9ridGmTnIU+Veuv9hvhrdUwAaZX3b00bMqbU5np
	xrKW1gsW6SJzifpiuSeaxmzLq0OzZiN5nGfZmDJqAwsppA3pEEnjEr1XXaYVUjTWWYcaZ4qOT0CU/
	JH3mrYAKnMVf4S8dCunw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wkX-0000000GopC-1cq0;
	Tue, 14 May 2024 18:19:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wkU-0000000Gooe-1ViD
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 18:19:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ecc23e6c9dso38930895ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 May 2024 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715710776; x=1716315576; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4yE8PHtXF9AkX0GwPOppSksjMPPZgrt95Kyo7zIpUQ=;
        b=XQbMAWzdpoj9Z13cdinjuorqJXXGj+hhJbeaC6rtWStZ2fwdTEG/8j8bvxSIVE//Ar
         8GtSdxSkUyoRM8zdqEDuzqhlGmhcLkL1NNoC8bk58KaxvsLzgt6O/jctE5Pk8O77cNr3
         qWEicDBMGcran2ruFIcP5nMVCqz/Z1lLWExuqg+DLfOLtdtVAkyFJ8H/jItuVBz6me62
         ItrwAnsf9paKMcjM9fd4lz5KWO8EPGByWk7Hv4kkn79kD4ezAFXZyCzasqYgRb6mSmmq
         bmDmsR18dJ2CH9Lp3yfoUPx86Eeuz7oSNK9KGXOOs+38Mq3WU79XJ1G9mtocqRp/AD+0
         4Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715710776; x=1716315576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4yE8PHtXF9AkX0GwPOppSksjMPPZgrt95Kyo7zIpUQ=;
        b=jxqjCVQA668ZEcCe/3E7pJ3DkoLSUN9C3M2qLgWtWBp3/uu56PqBcX2SiRoYuDsUNB
         wXBz/AXsZPLGBaQ1cI4nqbC8COXtZj5o0pBaBAXamJGGrF0uTIb8gj/lCWNqJlYhP6kg
         0+Q3TvGTq38FzxOB9h569XTMfjPjb+eSvlRLd3i4UFv1TRh6hNhZNZ09qSNrXEBN9LIY
         5IKCSbwUg8eXuuQeSJFqJ/nRX+bMCmkApuKWCsallNhw2Gs6FnoQEYxsrQFnvxASvtQD
         ABsbZdGpDaFYkywasjza41do2irD73HKEsWqqw/SjlA9ypn7oySwrCUi86HOsTp0fuob
         BPww==
X-Forwarded-Encrypted: i=1; AJvYcCX3dPVJc2ukN+DeiI0vAOqppxoZyKzYYEqY9sG4FIdDglvGz8AlBovFO+zgVW7ZpryC2g21jqQZ90MFiTdE3waY2EV8Ra5CtH7mDFoshwBu
X-Gm-Message-State: AOJu0YzOfxdz9cOE/BkCLs9zqh0TBnnStYFG+iI4rfUbyL6afTB1C95V
	2h5x2V2y7eYdv+96JBvMEg4/FMFaJYkbC5vWGuTxm5N2DSG2kfJKFbd+5w/fyG9K54Nd7wjLDS7
	E2bqo4pheOSnlnwdvYlU51LLGt/ackLotjv80+w==
X-Google-Smtp-Source: AGHT+IGrNPfGRNY9rxybr2+ATyOBM4sZ06JwqWI7W036mxj+C9hBk3WrEH1mxMbLyVOJaL28BsB71FX2eT5wnG5Zvgw=
X-Received: by 2002:a17:902:f70d:b0:1e5:8769:aadc with SMTP id
 d9443c01a7336-1ef43d26f24mr156761075ad.22.1715710776174; Tue, 14 May 2024
 11:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714752293.git.tjeznach@rivosinc.com> <b28d4fe49c5fe4e3ece9de789cfd92cfa5b3c16c.1714752293.git.tjeznach@rivosinc.com>
 <CANXhq0q+aQ1T37j4uQi5ryUyPxBtvQkaBJ9qvS9iGwSRGaQSyQ@mail.gmail.com>
In-Reply-To: <CANXhq0q+aQ1T37j4uQi5ryUyPxBtvQkaBJ9qvS9iGwSRGaQSyQ@mail.gmail.com>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 14 May 2024 11:19:25 -0700
Message-ID: <CAH2o1u5fMtKYLAzYwdKXgp2YDE7jH=b4Rm1VXFGOzojt0eUzQg@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] iommu/riscv: Enable IOMMU registration and device probe.
To: Zong Li <zong.li@sifive.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, 
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
	Lu Baolu <baolu.lu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_111938_432068_73D5A19E 
X-CRM114-Status: GOOD (  24.26  )
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

T24gTW9uLCBNYXkgMTMsIDIwMjQgYXQgMTA6NTbigK9QTSBab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBNYXkgNCwgMjAyNCBhdCAxMjoxM+KAr0FNIFRvbWFz
eiBKZXpuYWNoIDx0amV6bmFjaEByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IEFkdmVydGlz
ZSBJT01NVSBkZXZpY2UgYW5kIGl0cyBjb3JlIEFQSS4KPiA+IE9ubHkgbWluaW1hbCBpbXBsZW1l
bnRhdGlvbiBmb3Igc2luZ2xlIGlkZW50aXR5IGRvbWFpbiB0eXBlLCB3aXRob3V0Cj4gPiBwZXIt
Z3JvdXAgZG9tYWluIHByb3RlY3Rpb24uCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEx1IEJhb2x1IDxi
YW9sdS5sdUBsaW51eC5pbnRlbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUb21hc3ogSmV6bmFj
aCA8dGplem5hY2hAcml2b3NpbmMuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9pb21tdS9yaXNj
di9pb21tdS5jIHwgNjYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA2NiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+
ID4gaW5kZXggM2M1YTZiNDk2NjlkLi4xZjg4OWRhZmZiMGUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMKPiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUuYwo+ID4gQEAgLTE3LDYgKzE3LDcgQEAKPiA+ICAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgo+
ID4gICNpbmNsdWRlIDxsaW51eC9pb21tdS5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwu
aD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcGNpLmg+Cj4gPgo+ID4gICNpbmNsdWRlICJpb21tdS1i
aXRzLmgiCj4gPiAgI2luY2x1ZGUgImlvbW11LmgiCj4gPiBAQCAtMzYsNiArMzcsNjAgQEAgc3Rh
dGljIHZvaWQgcmlzY3ZfaW9tbXVfZGlzYWJsZShzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICpp
b21tdSkKPiA+ICAgICAgICAgcmlzY3ZfaW9tbXVfd3JpdGVsKGlvbW11LCBSSVNDVl9JT01NVV9S
RUdfUFFDU1IsIDApOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGljIGludCByaXNjdl9pb21tdV9hdHRh
Y2hfaWRlbnRpdHlfZG9tYWluKHN0cnVjdCBpb21tdV9kb21haW4gKmlvbW11X2RvbWFpbiwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXYpCj4gPiArewo+ID4gKyAgICAgICAvKiBHbG9iYWwgcGFzcy10aHJvdWdoIGFscmVh
ZHkgZW5hYmxlZCwgZG8gbm90aGluZyBmb3Igbm93LiAqLwo+ID4gKyAgICAgICByZXR1cm4gMDsK
PiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIHN0cnVjdCBpb21tdV9kb21haW4gcmlzY3ZfaW9tbXVf
aWRlbnRpdHlfZG9tYWluID0gewo+ID4gKyAgICAgICAudHlwZSA9IElPTU1VX0RPTUFJTl9JREVO
VElUWSwKPiA+ICsgICAgICAgLm9wcyA9ICYoY29uc3Qgc3RydWN0IGlvbW11X2RvbWFpbl9vcHMp
IHsKPiA+ICsgICAgICAgICAgICAgICAuYXR0YWNoX2RldiA9IHJpc2N2X2lvbW11X2F0dGFjaF9p
ZGVudGl0eV9kb21haW4sCj4gPiArICAgICAgIH0KPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyBp
bnQgcmlzY3ZfaW9tbXVfZGV2aWNlX2RvbWFpbl90eXBlKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+
ICt7Cj4gPiArICAgICAgIHJldHVybiBJT01NVV9ET01BSU5fSURFTlRJVFk7Cj4gPiArfQo+ID4g
Kwo+ID4gK3N0YXRpYyBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKnJpc2N2X2lvbW11X2RldmljZV9ncm91
cChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiArewo+ID4gKyAgICAgICBpZiAoZGV2X2lzX3BjaShk
ZXYpKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBwY2lfZGV2aWNlX2dyb3VwKGRldik7Cj4g
PiArICAgICAgIHJldHVybiBnZW5lcmljX2RldmljZV9ncm91cChkZXYpOwo+ID4gK30KPiA+ICsK
PiA+ICtzdGF0aWMgaW50IHJpc2N2X2lvbW11X29mX3hsYXRlKHN0cnVjdCBkZXZpY2UgKmRldiwg
Y29uc3Qgc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqYXJncykKPiA+ICt7Cj4gPiArICAgICAgIHJl
dHVybiBpb21tdV9md3NwZWNfYWRkX2lkcyhkZXYsIGFyZ3MtPmFyZ3MsIDEpOwo+ID4gK30KPiA+
ICsKPiA+ICtzdGF0aWMgc3RydWN0IGlvbW11X2RldmljZSAqcmlzY3ZfaW9tbXVfcHJvYmVfZGV2
aWNlKHN0cnVjdCBkZXZpY2UgKmRldikKPiA+ICt7Cj4gPiArICAgICAgIHN0cnVjdCBpb21tdV9m
d3NwZWMgKmZ3c3BlYyA9IGRldl9pb21tdV9md3NwZWNfZ2V0KGRldik7Cj4gPiArICAgICAgIHN0
cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11Owo+ID4gKwo+ID4gKyAgICAgICBpZiAoIWZ3
c3BlYy0+aW9tbXVfZndub2RlLT5kZXYgfHwgIWZ3c3BlYy0+bnVtX2lkcykKPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKPgo+IEl0IHNlZW1zIHRvIG1lIHRoYXQg
d2UgbWlnaHQgbmVlZCB0byBlbnN1cmUgZndzcGVjIGlzIG5vdCBOVUxMIGJlZm9yZQo+IGFjY2Vz
c2luZyBmd3NwZWMtPmlvbW11X2Z3bm9kZSwgb3RoZXJ3aXNlLCBpdCB3aWxsIGNhdXNlIE5VTEwg
cG9pbnRlcgo+IGRlcmVmZXJlbmNlLgo+CgpUaGFuayB5b3UuIEZpeCBhcHBsaWVkIHRvIHY1LgoK
PiA+ICsKPiA+ICsgICAgICAgaW9tbXUgPSBkZXZfZ2V0X2RydmRhdGEoZndzcGVjLT5pb21tdV9m
d25vZGUtPmRldik7Cj4gPiArICAgICAgIGlmICghaW9tbXUpCj4gPiArICAgICAgICAgICAgICAg
cmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4gPiArCj4gPiArICAgICAgIHJldHVybiAmaW9tbXUt
PmlvbW11Owo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGlvbW11X29wcyBy
aXNjdl9pb21tdV9vcHMgPSB7Cj4gPiArICAgICAgIC5vZl94bGF0ZSA9IHJpc2N2X2lvbW11X29m
X3hsYXRlLAo+ID4gKyAgICAgICAuaWRlbnRpdHlfZG9tYWluID0gJnJpc2N2X2lvbW11X2lkZW50
aXR5X2RvbWFpbiwKPiA+ICsgICAgICAgLmRlZl9kb21haW5fdHlwZSA9IHJpc2N2X2lvbW11X2Rl
dmljZV9kb21haW5fdHlwZSwKPiA+ICsgICAgICAgLmRldmljZV9ncm91cCA9IHJpc2N2X2lvbW11
X2RldmljZV9ncm91cCwKPiA+ICsgICAgICAgLnByb2JlX2RldmljZSA9IHJpc2N2X2lvbW11X3By
b2JlX2RldmljZSwKPiA+ICt9Owo+ID4gKwo+ID4gIHN0YXRpYyBpbnQgcmlzY3ZfaW9tbXVfaW5p
dF9jaGVjayhzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiA+ICB7Cj4gPiAgICAg
ICAgIHU2NCBkZHRwOwo+ID4gQEAgLTcxLDYgKzEyNiw3IEBAIHN0YXRpYyBpbnQgcmlzY3ZfaW9t
bXVfaW5pdF9jaGVjayhzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiA+Cj4gPiAg
dm9pZCByaXNjdl9pb21tdV9yZW1vdmUoc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSAqaW9tbXUp
Cj4gPiAgewo+ID4gKyAgICAgICBpb21tdV9kZXZpY2VfdW5yZWdpc3RlcigmaW9tbXUtPmlvbW11
KTsKPiA+ICAgICAgICAgaW9tbXVfZGV2aWNlX3N5c2ZzX3JlbW92ZSgmaW9tbXUtPmlvbW11KTsK
PiA+ICB9Cj4gPgo+ID4gQEAgLTk1LDUgKzE1MSwxNSBAQCBpbnQgcmlzY3ZfaW9tbXVfaW5pdChz
dHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSkKPiA+ICAgICAgICAgICAgICAgICByZXR1
cm4gZGV2X2Vycl9wcm9iZShpb21tdS0+ZGV2LCByYywKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiY2Fubm90IHJlZ2lzdGVyIHN5c2ZzIGludGVyZmFjZVxuIik7Cj4g
Pgo+ID4gKyAgICAgICByYyA9IGlvbW11X2RldmljZV9yZWdpc3RlcigmaW9tbXUtPmlvbW11LCAm
cmlzY3ZfaW9tbXVfb3BzLCBpb21tdS0+ZGV2KTsKPiA+ICsgICAgICAgaWYgKHJjKSB7Cj4gPiAr
ICAgICAgICAgICAgICAgZGV2X2Vycl9wcm9iZShpb21tdS0+ZGV2LCByYywgImNhbm5vdCByZWdp
c3RlciBpb21tdSBpbnRlcmZhY2VcbiIpOwo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX3Jl
bW92ZV9zeXNmczsKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+
ICsKPiA+ICtlcnJfcmVtb3ZlX3N5c2ZzOgo+ID4gKyAgICAgICBpb21tdV9kZXZpY2Vfc3lzZnNf
cmVtb3ZlKCZpb21tdS0+aW9tbXUpOwo+ID4gKyAgICAgICByZXR1cm4gcmM7Cj4gPiAgfQo+ID4g
LS0KPiA+IDIuMzQuMQo+ID4KPiA+CgpCZXN0LAotIFRvbWFzegoKPiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
