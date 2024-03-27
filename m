Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F93CD11DF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 01:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q32FvlggtH7diCbFDZafJTpRu/BOldYdwzhyZ9J9qD8=; b=MmJpAQUY3c1bOw
	+yLm6IT4RDQcv036hSJWX4I+3nmdR6DOIdCvBkI+H0Ok6SqWmQ0Qb/21EU68FNVEOZBvL0C/gnvZ6
	eg1iVcCaYl8xxH9xk5JJEoMKadsb1RL0nogspspnKDTsHRU+1Act7XYzmdYod+W4ac3NW5uZIQI42
	v7xYCzMvrYhGZZdWqDolewvtE2frOmFvdtCizaSSinW7fE4zdeATJCGna+1ErI2C2UV/flXjonYRB
	/36l5BFDRifCcDPR97WlXGkxrUk9J9BsXnL7P35PI8kUt6uLm0nkhy4XIM983YO8+E9setDUo8NYV
	JGTgTytlYvgpua9fep/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpIBP-000000075lY-08oU;
	Wed, 27 Mar 2024 01:34:27 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpIBK-000000075ku-42mo
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 01:34:24 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-475ffc62cbaso1747405137.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 18:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711503260; x=1712108060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCYB7c+BMWHnOOEe3cAwNiyes927XAOxAN0PxG44CVM=;
        b=aWYsRbIDrTKDnicCBzVXzV8RCX7BUGt0Rt8aKG7YJb/JPRnxBJ61zEmEilP+hxCKMj
         N5VxuYDPMkEp0lh7Z/WFTd4/o+krWjbtxs8nerjA67tEBKzUCf79iqrl2OWTJ2GcO/lI
         X202dUIInA+QNciQA0SXeChgKV2W/BnSgq0lxeS8TieVnrKmrfESDBEVCooYVzq9/pme
         TRlr/So6n1auUCvAYud5U0Ya06YydQ+5I39bpZaeCfjmB+MOgK+V/rRExs/N/zossnMW
         HgpmEDgseh3FdBrgG8Ll9X7XI0Tz/4PcWN8fBVeE3NNXfAnus5nNXTgrlZShf271tK0a
         bmjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711503260; x=1712108060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCYB7c+BMWHnOOEe3cAwNiyes927XAOxAN0PxG44CVM=;
        b=brxX2lt40i7XvmwQmNrz+Z5MTkGuuEPGZwa0gtXR5BqZD/ILhR9k4cjcqRWk/P9TB3
         b6ZcnS2b5FxWzVIw2Wbjuh0JnVA478I95BzEy4TJi8JXVpFQEMK4FpP9O0DGoTEx3FdF
         Jt1aheBEJmI7xNU10JkTGnaEn1RYO/UJ27J3BX4VcsdnRIoVqo/djHPMpqQKY3oUIjo1
         MuLZWa/w6SHj4+GCaB9u6B5e5PMbhN4rydF03gr3n91F9GftLb0ET66tD+ZLaYNjLg9Y
         cvie0OBOYrxsqJUymmSrF8GeHFejJw/O71SNxuLJzFJUUBKocx7yX6S7BnitDLLHA0Tf
         u6/g==
X-Forwarded-Encrypted: i=1; AJvYcCVxswfhwu31tuHI6XgI+KCDnv7s0wZD5yXuxavBFWYoPMSlAVq786moE1Bpt9gvWTE6Ec5QYO4Bl+Pv3/jla0Lsvs+zuw51CqTYPLEUnWxW
X-Gm-Message-State: AOJu0Yy+sV4umreq4+OrgE3LIlV3nmjmcF584x8MAd5ACTswacd/HLAA
	Mi7H8Oax36KuqiNQa1HvybrI7z+YOEeFlKIHEA2H8lrxCiLd8MpTkpmkPY1SarGvCxswtHJzrFv
	N3pKjhMshefxsEyxBqY2dL+zLPfE=
X-Google-Smtp-Source: AGHT+IGcOWldV2TYE5N0G/Ct0a7Zt3ICmaV1ZDUQCub4y7h5dq1o3m51b3vR3b0n7p3KF5iHGCAzfwGleI/UKNanIT8=
X-Received: by 2002:a67:e91a:0:b0:476:d5f9:bf96 with SMTP id
 c26-20020a67e91a000000b00476d5f9bf96mr8044725vso.0.1711503260425; Tue, 26 Mar
 2024 18:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <a49546e8-6749-4458-98da-67fd37b7df18@rivosinc.com>
 <mhng-a3b495e6-aca6-4137-a3c1-8fcacafd8596@palmer-ri-x1c9a>
 <ZfLxip96o5MVjHAF@xhacker> <ZfL1buKdDI-p5b9X@xhacker> <ZgGteKG_a3KGn5wV@xhacker>
 <CAGu26P_tUpSvXqdSz3pOdPNHbe6MyEYJ2XCHo8pD8jeE5pT+_Q@mail.gmail.com> <ZgNzBwsmeibHMjvc@xhacker>
In-Reply-To: <ZgNzBwsmeibHMjvc@xhacker>
From: Charles Lohr <lohr85@gmail.com>
Date: Tue, 26 Mar 2024 18:34:09 -0700
Message-ID: <CAGu26P-CqdsQzNTNDidBUg=pxU3vs7QhNEajokGKe7p8M2sLBA@mail.gmail.com>
Subject: Re: [PATCH] riscv: deprecate CONFIG_MMU=n
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, cleger@rivosinc.com, 
	Conor Dooley <conor@kernel.org>, samuel.holland@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, ajones@ventanamicro.com, dlemoal@kernel.org, 
	Bjorn Topel <bjorn@rivosinc.com>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_183423_040090_8C8F22AC 
X-CRM114-Status: GOOD (  58.29  )
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

U29ycnksIGlmIHlvdSBkb24ndCBtaW5kIGNsYXJpZnlpbmcsIGRvIHlvdSBrbm93IHdoaWNoIHZl
cnNpb24geW91CnVzZWQsIHdoZXJlIHlvdSBnb3QgaXQsIGFuZCBpZiB5b3UgaGFkIHRvIGFwcGx5
IGFueSBwYXRjaGVzPwoKQ2hhcmxlcwoKT24gVHVlLCBNYXIgMjYsIDIwMjQgYXQgNjoyOOKAr1BN
IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIE1h
ciAyNiwgMjAyNCBhdCAwMToyNTowOFBNIC0wNzAwLCBDaGFybGVzIExvaHIgd3JvdGU6Cj4gPiBK
aXNoZW5nLCBhcmUgeW91IHVzaW5nIG11c2wgb3IgdWNsaWJjPyBJJ3ZlIGJlZW4gaGF2aW5nIGRp
ZmZpY3VsdHkKPiA+IGdldHRpbmcgbmV3IHZlcnNpb25zIG9mIGVhY2ggd29ya2luZyB3aXRoIHRo
ZSBuZXdlciBrZXJuZWxzIHdpdGgKPiA+IHN5c3RlbSBjYWxscyBub3QgbGluaW5nIHVwLgo+Cj4g
SGkgQ2hhcmxlcywKPgo+IEkgdGVzdGVkIG5vbW11IGxpbnV4IHdpdGggdWNsaWJjLCBib3RoIHJ2
MzIgYW5kIHJ2NjQKPgo+IFRoYW5rcwo+Cj4gPgo+ID4gQWxzbywgaXMgdGhlcmUgYSBiZXR0ZXIg
cGxhY2UgdG8gYXNrIHF1ZXN0aW9ucyBhYm91dCB0aGUgbW9yZQo+ID4gdXNlci1zcGFjeSBzdHVm
Zj8gIFRoYXQncyByZWFsbHkgd2hlcmUgSSd2ZSBiZWVuIHN0cnVnZ2xpbmcgdG8KPiA+IG1haW50
YWluIHRoaW5ncywga2VlcGluZyBidWlsZHJvb3Qgd29ya2luZyB3aGVuIHRhcmdldGluZyBSVjMy
IE5PTU1VLgo+ID4gVGhhbmtmdWxseSBhIGxvdCBvZiB0aGUgc3RpY2tpZXN0IHByb2JsZW1zIGhh
dmUgYWxsIGJlZW4gdXBzdHJlYW1lZC4KPiA+Cj4gPiBDaGFybGVzCj4gPgo+ID4gT24gTW9uLCBN
YXIgMjUsIDIwMjQgYXQgMTA6MTLigK9BTSBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIE1hciAxNCwgMjAyNCBhdCAwOTowMjo0M1BN
ICswODAwLCBKaXNoZW5nIFpoYW5nIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgTWFyIDE0LCAyMDI0
IGF0IDA4OjQ2OjIxUE0gKzA4MDAsIEppc2hlbmcgWmhhbmcgd3JvdGU6Cj4gPiA+ID4gPiBPbiBU
dWUsIEZlYiAyNywgMjAyNCBhdCAwODozODo1MEFNIC0wODAwLCBQYWxtZXIgRGFiYmVsdCB3cm90
ZToKPiA+ID4gPiA+ID4gT24gVHVlLCAyNyBGZWIgMjAyNCAwMToxMTo0MSBQU1QgKC0wODAwKSwg
Y2xlZ2VyQHJpdm9zaW5jLmNvbSB3cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4g
PiA+ID4gPiA+ID4gT24gMjYvMDIvMjAyNCAyMDowMCwgQ2hhcmxlcyBMb2hyIHdyb3RlOgo+ID4g
PiA+ID4gPiA+ID4gV09BSCEgUGxlYXNlIERPIE5PVCBkZXByZWNhdGUgTk9NTVUuIEkgdXNlIHRo
ZSBOT01NVSBidWlsZCBjb25zdGFudGx5Cj4gPiA+ID4gPiA+ID4gPiBhbmQgTk9NTVUgTGludXgg
b24gUklTQy1WIGlzIHRoZSBhdmVudWUgdXNlZCBieSBtYW55IEZQR0Egc29mdCBjb3Jlcwo+ID4g
PiA+ID4gPiA+ID4gZm9yIExpbnV4LCBhcyB3ZWxsIGFzIHNvbWUgbGltaXRlZCBzeXN0ZW1zLgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPSy4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSBqdXN0
IGJ1aWxkIHRlc3QgdGhpcyBzdHVmZiwgYXMgSSBkb24ndCByZWFsbHkgaGF2ZSBhIHVzZSBmb3Ig
aXQKPiA+ID4gPiA+ID4gcGVyc29uYWxseS4gIEkgZmlndXJlZCBpZiBub2JvZHkncyByZXBvcnRp
bmcgYnVncyB0aGVuIHByb2JhYmx5IGl0J3MgYnJva2VuCj4gPiA+ID4gPiA+IGFuZCBub2JvZHkn
cyBub3RpY2VkIGJlY2F1c2Ugbm9ib2R5J3MgdXNpbmcgaXQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiBJIGdldCBuZXcgY29waWVzIG9mIHRoZSBrZXJuZWwgd2hlbiB0aGVyZSBhcmUgcmVs
ZWFzZXMgYW5kIHRlc3QgdGhlbQo+ID4gPiA+ID4gPiA+ID4gZnJlcXVlbnRseSB0byBtYWtlIHN1
cmUgZXZlcnl0aGluZyBpcyBzdGlsbCB3b3JraW5nIGFzIGV4cGVjdGVkLgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBJJ2QgYWN0dWFsbHkgZXhwZWN0ZWQgaXQgdG8gYmUgYnJva2VuLCBidXQgSSBn
dWVzcyB3ZSBtYW5hZ2VkIHRvIGF2b2lkCj4gPiA+ID4gPiA+IHNjcmV3aW5nIHRoaW5ncyB1cCA7
KQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gRm9yIHVzIHdlIGp1c3QgZG9uJ3QgY2FyZSBh
Ym91dCBYSVAuIEkgbWVhbiBpZiBzb21lb25lIGRpZCBwdXNoIGl0Cj4gPiA+ID4gPgo+ID4gPiA+
ID4gSSBkb24ndCBjYXJlIFhJUCBlaXRoZXIsIGFuZCBJTUhPIHRoZSBYSVAncyBtYWludGVuYW5j
ZSBlZmZvcnQgaXMgbXVjaAo+ID4gPiA+ID4gYmlnZ2VyIHRoYW4gTk9NTVUoanVzdCBjaGVjayB0
aGUgdmFyaW91cyBYSVBfRklYVVAqIG9yIENPTkZJR19YSVBfS0VSTkVMCj4gPiA+ID4gPiBtYWNy
b3MgYXJvdW5kIGxvd2xldmVsIHBndGFibGUuaCwgcGFnZS5oKS4gSWYgd2UgY2FuIHJlbW92ZSBY
SVAsIHRoZQo+ID4gPiA+ID4gY29kZSByZWFkYWJpbGl0eSB3aWxsIGJlIG11Y2ggYmV0dGVyLgo+
ID4gPiA+ID4KPiA+ID4gPiA+IE9yIHNlbmRpbmcgb3V0IGEgc2ltaWxhciBYSVAgZGVwcmVjYXRp
b24gcGF0Y2ggdG8gc2VlIHdoZXRoZXIgdGhlcmUncwo+ID4gPiA+ID4gYW55IGNvbXBsYWluID8g
OykKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiB0aHJvdWdoIHRvIGZydWl0aW9uLCBJJ2QgYWxz
byB0ZXN0IGFuZCB1c2UgaXQsIGJ1dCBJIHVyZ2UgeW91IHBsZWFzZQo+ID4gPiA+ID4gPiA+ID4g
ZG8gbm90IGRlcHJlY2F0ZSB0aGlzLiAgV2hpbGUgaXQncyBzb21ldGltZXMgbmVlZGVkIGEgYml0
IG9mIGEKPiA+ID4gPiA+Cj4gPiA+ID4gPiArMSBmb3IgdXJnZSB0aGUgdXBzdHJlYW0gcGxlYXNl
IGRvIG5vdCBkZXByZWNhdGUgTk9NTVUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQmVzaWRlcyB0aGUg
c29mdChGUEdBKSBjb3JlIG1lbnRpb25lZCBieSBDaGFybGVzLCBoZXJlIGlzIGFub3RoZXIgcmVh
bAo+ID4gPiA+Cj4gPiA+ID4gQW5kIEknZCBsaWtlIHRvIHdyaXRlIG1vcmUgYWJvdXQgc29mdCBj
b3JlOiByaXNjdiBpcyBhIGZyZWUgYW5kIG9wZW4KPiA+ID4gPiBJU0EsIHRoaXMgbWFrZSBpdCBy
ZWFsbHkgZ29vZCBmb3IgZWR1Y2F0aW9uLCBmb3Igc2ltcGxlIHJpc2N2Cj4gPiA+ID4gaW1wbGVt
ZW50YXRpb24gb3IgZW11bGF0b3IuIE9uY2UgcmlzY3YgSU1BIGlzIGltcGxlbWVudGVkKGV2ZW4g
aWYgTU1VLAo+ID4gPiA+IGNhY2hlLCBUTEIgc3R1ZmYgZG9uJ3QgZXhpc3QpLCBpdCdzIG5vdCBm
YXIgYXdheSBmcm9tIG1ha2luZyBsaW51eAo+ID4gPiA+IHJ1bm5pbmcgb24gdGhlIEZQR0Egb3Ig
ZW11bGF0b3IuIElmIHRoZSBnYWluIGlzIGxhcmdlciB0aGFuIHRoZSBtYWludGVuYW5jZQo+ID4g
PiA+IGVmZm9ydCwgSSdkIGxpa2UgdG8gdXJnZSBrZWVwaW5nIHRoZSBOT01NVSBzdXBwb3J0Lgo+
ID4gPiA+Cj4gPiA+ID4gVGhhbmtzIGEgbG90Cj4gPiA+ID4KPiA+ID4gPiA+IHVzYWdlIGNhc2U6
IEFzIGlzIGtub3duLCBTb3BoZ28gQ1YxODAwQiBwbGF0Zm9ybXMgc3VjaCBhcyBNaWxrIER1bwo+
ID4gPiA+ID4gY29udGFpbnMgdHdvIEM5MDYgY29yZSwgb25lKGEuay5hIGJpZyBjb3JlKSB3aXRo
IE1NVSBhbm90aGVyKGEuay5hIHNtYWxsCj4gPiA+ID4gPiBjb3JlKXcvbyBNTVUuIFRoZSB2ZW5k
b3Igc2RrIHJ1bnMgZnJlZXJ0b3Mgb24gdGhlIHNtYWxsIGNvcmUsIGJ1dCBpdAo+ID4gPiA+ID4g
ZG9lc24ndCBwcmV2ZW50IHVzZXJzIHRvIHJ1biBvdGhlciBPUyBzdWNoIGFzIHRocmVhZHgsIHpl
cGh5ciBvciBub21tdQo+ID4gPiA+ID4gbGludXggb24gdGhlIHNtYWxsIGNvcmUuIEluIGZhY3Qs
IEkgc3VjZXNzZnVsbHkgYnJvdWdodCB1cCBub21tdSBsaW51eAo+ID4gPiA+ID4gb24gdGhlIHNt
YWxsIGNvcmUuIEkgZGlkbid0IGp1c3Qgc2VuZCBvdXQgdGhlIHBhdGNoZXMgaW4gdGltZSBkdXJp
bmcgdGhpcwo+ID4gPiA+ID4gZGV2IHdpbmRvdyBkdW8gdG8gbXkgcGVyc29uYWwgY2FyZWVyIHJl
YXNvbihJIHNwZW50IHRoZSB0aW1lIG9uIGh1bnRpbmcKPiA+ID4gPiA+IGZvciBhIG5ldyBqb2Ip
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSBwbGFuIHRvIHNlbmQgb3V0IE5PTU1VIHJlbGF0ZWQgcGF0
Y2hlcyBvbmNlIDYuOS1yYzEgaXMgb3V0Lgo+ID4gPgo+ID4gPiBBcyBpcyBwcm9taXNlZCwgdGhl
IE5PTU1VIGltcHJvdmVtZW50IHBhdGNoZXMgYXJlIHNlbnQgb3V0Cj4gPiA+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwMzI1MTY0MDIxLjMyMjktMS1qc3poYW5nQGtl
cm5lbC5vcmcvVC8jdAo+ID4gPgo+ID4gPiBUaGFua3MKPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+ID4gPiBjcmVhdGl2ZSBidWlsZCB0byBnZXQgZXZlcnl0aGluZyB3b3JraW5nLCBJJ3ZlIG5l
dmVyIG5lZWRlZCB0byBwYXRjaAo+ID4gPiA+ID4gPiA+ID4gYW55dGhpbmcgaW4gdGhlIGtlcm5l
bCBiZXlvbmQgcGF0Y2hpbmcgaW4gYSBjdXN0b20gY29uc29sZSBmb3Igc2VyaWFsCj4gPiA+ID4g
PiA+ID4gPiBvdXRwdXQuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
ID4gSGV5IENoYXJsZXMsCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBObyB3b3JyaWVzLCB3
ZSBhY3R1YWxseSBkaWQgbm90IGV4cGVjdGVkIE5PTU1VIHRvIGhhdmUgKnNvIG1hbnkqIHVzZXJz
Lgo+ID4gPiA+ID4gPiA+IEkgZ3Vlc3MgZGVwcmVjYXRpbmcgc3R1ZmYgaXMgYSBnb29kIHdheSB0
byBoYXZlIGltbWVkaWF0ZSBmZWVkYmFjayA7KS4KPiA+ID4gPiA+ID4gPiBIYXZpbmcgRkRQSUMg
cHNBQkkgdG8gYmUgbWVyZ2VkIHVwc3RyZWFtIGNvdWxkIGFsc28gcHJvYmFibHkgYmUgYQo+ID4g
PiA+ID4gPiA+IHBvc2l0aXZlIHBvaW50IHRvd2FyZCBhIGJldHRlciBOT01NVSBzdXBwb3J0Lgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBZYSwgdGhhdCdzIHByb2JhYmx5IHRoZSByaWdodCB3YXkg
dG8gZG8gaXQuICBUb3VjaGluZyBhbnl0aGluZyBpbiB0aGUgcHNBQkkKPiA+ID4gPiA+ID4gaXMg
cHJldHR5IG1pc2VyYWJsZSwgdGhvdWdoLCBzbyBJIGRvbid0IHJlYWxseSB3YW50IHRvIGZvcmNl
IHBlb3BsZSB0byBkbwo+ID4gPiA+ID4gPiBpdC4uLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gSSBhbSBoYXBweSB0byBkaXNjdXNzIHRoZSBwb3NzaWJpbGl0eSBvZiBtZSBhbmQgb3Igb25l
IG9mIHRoZSBvdGhlcgo+ID4gPiA+ID4gPiA+ID4gUklTQy1WIHNvZnQgKEZQR0EpIGNvcmUgcGVv
cGxlIHN0ZXBwaW5nIHVwIHRvIHRyeSB0byBiZSBtb3JlIGFjdGl2ZSwKPiA+ID4gPiA+ID4gPiA+
IGJ1dCBzbyBmYXIgd2UndmUganVzdCBiZWVuIHZlcnkgd2VsbCBzZXJ2aWNlZCBieSB0aGUgY3Vy
cmVudCBOT01NVQo+ID4gPiA+ID4gPiA+ID4gTGludXggc2V0dXAuCj4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiBJdCBjb3VsZCBwcm9iYWJseSBiZSBuaWNlIHRvIGhhdmUgc29tZSBmZWVkYmFj
ay9UZXN0ZWQtYnk6IGZyb20gTk9NTVUKPiA+ID4gPiA+ID4gPiB1c2VycyBmb3IgbmV3IHJlbGVh
c2VzIHRoZW4uCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEhhdmluZyBtb3JlIHVwc3RyZWFtIGlu
dGVyYWN0aW9uIGZyb20gdXNlcnMgaXMgYWx3YXlzIGFwcHJlY2lhdGVkLCB0aGF0J3MKPiA+ID4g
PiA+ID4gdGhlIGJlc3Qgd2F5IHRvIHByb3ZlIHBlb3BsZSBhcmUgdXNpbmcgdGhlIGNvZGUuICBJ
ZiB5b3UgZ3V5cyBoYXZlIHRoZSB0aW1lCj4gPiA+ID4gPiA+IGl0J2QgYmUgZ3JlYXQgdG8gZ2V0
IHRoaXMgaW50byBzb21lIHNvcnQgb2YgQ0ksIGlkZWFsbHkgcnVubmluZyBvbiBzb21lIHJlYWwK
PiA+ID4gPiA+ID4gcGxhdGZvcm0uCj4gPiA+ID4gPgo+ID4gPiA+ID4gQXMgYWJvdmUsIEknZCBh
bHNvIGxpa2UgdG8gc3RlcCB1cCBvbiB0aGUgTk9NTVUgc3R1ZmYsIGF0IGxlYXN0IHRlc3QKPiA+
ID4gPiA+IG5vbW11IG9uIG1pbGt2IGR1bydzIHNtYWxsIGNvcmUuIEFuZCBjYW4gYmUgc2VlbiBm
cm9tIG15IGdpdCBjb21taXQKPiA+ID4gPiA+IGhpc3RvdHJ5LCBJIHdhcyBhY3RpdmUsIGFuZCBJ
IGJlbGl2ZSBJIHdpbGwgc3RpbGwgYmUgYWN0aXZlIG9uIHJpc2N2IGxpbnV4Cj4gPiA+ID4gPiBr
ZXJuZWwgZGV2ZWxvcG1lbnQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRo
YW5rcywKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IENsw6ltZW50Cj4gPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBDaGFybGVzCj4gPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IE9uIE1vbiwgRmViIDI2LCAyMDI0IGF0IDg6
MDPigK9BTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBPbiBNb24sIEZlYiAyNiwgMjAyNCBhdCAwNDoyNToy
NFBNICswMTAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPiA+ID4gSSBn
dWVzcyBJIGNvdWxkIGFsc28gbWFyayBYSVAgYXMgZGVwcmVjYXRlZC4KPiA+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+ID4gSSdtIG5vdCBzbyBzdXJlLCBwZW9wbGUgcmVjZW50bHkgYWRk
ZWQgWElQIHN1cHBvcnQgdG8gUUVNVSAoYW5kIHNlbnQKPiA+ID4gPiA+ID4gPiA+ID4ga2VybmVs
IGZpeGVzIGluIERlY2VtYmVyKS4gWElQIGlzIGFsc28gbm90IG5lYXJseSBhcyBtdWNoIG9mIGEg
cHJvYmxlbQo+ID4gPiA+ID4gPiA+ID4gPiB0byBzdXBwb3J0LCB0aGVyZSdzIGZhciBsZXNzIHRo
YXQgaXQgZG9lcyBkaWZmZXJlbnRseSwgdGhlIG1haW4gYmFycmllcgo+ID4gPiA+ID4gPiA+ID4g
PiB3YXMgdGhlIGluYWJpbGl0eSB0byB0ZXN0IGl0IHdoaWNoIGlzIG5vIGxvbmdlciB0aGUgY2Fz
ZS4KPiA+ID4gPiA+ID4gPiA+ID4gVGhhdCBzYWlkLCBYSVAgaXMgZ29ubmEga2lsbCBpdHNlbGYg
b2ZmIEkgZmVlbCBhcyBpdCBkb2VzIG5vdCBzdXBwb3J0Cj4gPiA+ID4gPiA+ID4gPiA+IHJ1bnRp
bWUgcGF0Y2hpbmcgYW5kIHRoZXJlZm9yZSBpcyBleHRyZW1lbHkgbGltaXRlZCBvbiBleHRlbnNp
b25zLCBnaXZlbgo+ID4gPiA+ID4gPiA+ID4gPiB3ZSB1c2UgYWx0ZXJuYXRpdmVzIGZvciBhbGwg
b2YgdGhhdCAoYWx0aG91Z2ggSSBzdXBwb3NlIGlmIHNvbWVvbmUgaGFzIGEKPiA+ID4gPiA+ID4g
PiA+ID4gdXNlY2FzZSB0aGV5IGNvdWxkIG1ha2UgbmFzdHkgbWFjcm9zIHdvcnNlIGFuZCBpbXBs
ZW1lbnQgYSBjb21waWxldGltZQo+ID4gPiA+ID4gPiA+ID4gPiBzd2l0Y2ggaW4gdGhlIGFsdGVy
bmF0aXZlcyB0b28pLgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gPiBDaGVlcnMs
Cj4gPiA+ID4gPiA+ID4gPiA+IENvbm9yLgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+
ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
PiA+ID4gPiA+ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gPiA+ID4gPiA+ID4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+ID4gPiA+ID4gPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gPiA+ID4gPiA+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4gPiA+ID4gPiBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+ID4gPiA+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
