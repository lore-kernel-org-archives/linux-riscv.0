Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF549D64078
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9//RvPWw5cHMNPoT+/BACnIP7pjdxf4qLvuAJ+nWgc=; b=OZctXvRq99uflB
	hFoPa3GjpxAHoNTTOxSRqahNjg+pn3EJmPd6nRg69XlnN7VOIUpuHwLPQpDaGiGFi6NXk7unCGyy+
	NH1Fj2sEaOb8DnsWE6yWer+hd6uEDn3NNMFIJJsSrJsJLY0KZLRZfVbFd7v3rlSGmzpMR6S3DFi7A
	XonBIUR6cdDaYydrzzaZqfi2blBEC6iXhYUlOkXUprp68Ydew5ZuoV/acUDQvBKP6VaAXymhUuscH
	J+AZ4f4bBdi8DHMdXMeosMlwBY94TRpj/eIBlLz03peUmSnale9IW85Q7qCTcXmDQSH8zSpBBryN4
	NdRmZn1W26AvC5orm7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UGM-0000000Bgj9-2UPc;
	Fri, 08 Nov 2024 19:03:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9UDM-0000000Bg98-3k2C
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 19:00:14 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20c8ac50b79so12055ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 11:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731092412; x=1731697212; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgUoiaIvwmd0dqXDVNwJZBRERye992Iv81OIK7UWxZo=;
        b=lrcMSya99XVYblpKj6SK9AosDdOL8rjK4omni5m6C9Pm6CTf3W+ARsvhOJ0IAdtLZF
         4KXDWugDpA+PPt1MOwqe5icyTtNxcL3Ea1OO21m98KLOQ7TwYDnT+e2dcKFrV/mhY4R/
         s/pgbuc6MZvowTnh4xpkfQ35X5p/ZMX+mFTPKHihowmz7KdDxMt/8bKYgHOwAT1aKV33
         Dzb+fpt0Q1lwjZrP0p/IDLEu+WYPhmnIf51LGDur6WtwZcE4K2iCrFoZRGapRfEyz7bM
         TL1yStUeBptIsTnmXjAOud7tpdjn54pcuN24Li6gDq7TjcO/+uusjCv5upWVm2jeBNMa
         9OKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731092412; x=1731697212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgUoiaIvwmd0dqXDVNwJZBRERye992Iv81OIK7UWxZo=;
        b=GiX581P1uCCOcVBiPDpDOIoNeijPd9DpL6AQm3+eH+ykKdd8bk2gGIxeC/x6tvRRAL
         T46NigOkB2gLVhMfFLngY2M5FaKh95CuRKYBMimMnkJ7nhJKEIFl2yiEhkEPwUU7LpEq
         uQeD/V0LbVGlxogNqLlpHwF8FOFJra/vAqjNdWbxiYtM26UWWTJKqA37NasJWsO8W+OO
         cdren1qd43HerNJqXbeAoVWr1/DuJ/RGBIOa8sr18RcBrLC9gXZwjhI6D6KwOOHpJmr5
         xfrJs8eNfCTEbf5P2nE+4HSCXDDS8U4Rv90LQs+ASHp+doV0Cj5RacpbboE/+uL6hwzw
         xuvg==
X-Forwarded-Encrypted: i=1; AJvYcCVLQ/10csCeKKQC4pojDHJ5brLzfeqFeAE49eb6w0nqjo3yVNeOGP0TRNglA7B82iVesHWM/5aJIuZ1IQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMNF1l0X9srni9DrS/dh905vS5KGrSPa1hck2AjgRhiPqLRohb
	AVakhuX3rCn21nKqm8aJ4czYQndz3EgkRROOruD2DBbYU2rctlSgcvXx5UunSv2LP0NfNhWOzNM
	MUoKzaakIDt8iTimA4SN5zB6m28UXaKYFXHpL
X-Gm-Gg: ASbGncv0Iryc5xwfyISGIDB4RiDmW3M+mFI0+1X8nZiQo6O9vLP7sSvea/yIhoGEXHO
	5kiXTw2RKycr3C/0oJw8QPy9FpuPG93mH
X-Google-Smtp-Source: AGHT+IGbkZj+JMTOqmjdWQBlay0wkfJ4YtvQ+jjTvTX1drjgAdh01rmyeaMVQcVNM/9W5ndlugybvJQ8F6IRVI5txY0=
X-Received: by 2002:a17:902:f908:b0:20b:b52:3f7c with SMTP id
 d9443c01a7336-2118df7660fmr108525ad.18.1731092411428; Fri, 08 Nov 2024
 11:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com> <CAP-5=fXf9HtqKZyvfXNbKLTB-dL_Ax5Hd0_Gn1J-y0T1SE9wLQ@mail.gmail.com>
 <78eb729c-7594-460f-9d79-97fb683d8b5e@linaro.org> <CAHBxVyFXWpczMmWJbpWoLUjQ4nfNC2_h1yZqSd7kSr6N8Rvm5Q@mail.gmail.com>
In-Reply-To: <CAHBxVyFXWpczMmWJbpWoLUjQ4nfNC2_h1yZqSd7kSr6N8Rvm5Q@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 8 Nov 2024 10:59:59 -0800
Message-ID: <CAP-5=fV23r-_yVvGP3n5gjH8uZ2rEXmbZEwxr2wF+bpg=m745A@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Prefer sysfs/JSON events also when no PMU is provided
To: Atish Kumar Patra <atishp@rivosinc.com>
Cc: James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ben Gainey <ben.gainey@arm.com>, 
	Junhao He <hejunhao3@huawei.com>, linux-riscv@lists.infradead.org, beeman@rivosinc.com, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Dominique Martinet <asmadeus@codewreck.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_110012_969631_9CC26D0E 
X-CRM114-Status: GOOD (  51.42  )
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

T24gRnJpLCBOb3YgOCwgMjAyNCBhdCAxMDozOOKAr0FNIEF0aXNoIEt1bWFyIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgTm92IDgsIDIwMjQgYXQgNDoxNuKA
r0FNIEphbWVzIENsYXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3JnPiB3cm90ZToKPiA+Cj4gPgo+
ID4KPiA+IE9uIDA3LzExLzIwMjQgMTg6NTEsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiA+IE9uIFNh
dCwgT2N0IDI2LCAyMDI0IGF0IDU6MTjigK9BTSBJYW4gUm9nZXJzIDxpcm9nZXJzQGdvb2dsZS5j
b20+IHdyb3RlOgo+ID4gPj4KPiA+ID4+IEF0IHRoZSBSSVNDLVYgc3VtbWl0IHRoZSB0b3BpYyBv
ZiBhdm9pZGluZyBldmVudCBkYXRhIGJlaW5nIGluIHRoZQo+ID4gPj4gUklTQy1WIFBNVSBrZXJu
ZWwgZHJpdmVyIGNhbWUgdXAuIFRoZXJlIGlzIGEgcHJlZmVyZW5jZSBmb3Igc3lzZnMvSlNPTgo+
ID4gPj4gZXZlbnRzIGJlaW5nIHRoZSBwcmlvcml0eSB3aGVuIG5vIFBNVSBpcyBwcm92aWRlZCBz
byB0aGF0IGxlZ2FjeQo+ID4gPj4gZXZlbnRzIG1heWJlIHN1cHBvcnRlZCB2aWEganNvbi4gT3Jp
Z2luYWxseSBNYXJrIFJ1dGxhbmQgYWxzbwo+ID4gPj4gZXhwcmVzc2VkIGF0IExQQyAyMDIzIHRo
YXQgZG9pbmcgdGhpcyB3b3VsZCByZXNvbHZlIGJ1Z3Mgb24gQVJNIEFwcGxlCj4gPiA+PiBNPyBw
cm9jZXNzb3JzLCBidXQgSmFtZXMgQ2xhcmsgbW9yZSByZWNlbnRseSB0ZXN0ZWQgdGhpcyBhbmQg
YmVsaWV2ZXMKPiA+ID4+IHRoZSBkcml2ZXIgaXNzdWVzIHRoZXJlIG1heSBub3QgaGF2ZSBleGlz
dGVkIG9yIGhhdmUgYmVlbiByZXNvbHZlZC4gSW4KPiA+ID4+IGFueSBjYXNlLCBpdCBpcyBpbmNv
bnNpc3RlbnQgdGhhdCB3aXRoIGEgUE1VIGV2ZW50IG5hbWVzIGF2b2lkIGxlZ2FjeQo+ID4gPj4g
ZW5jb2RpbmdzLCBidXQgd2hlbiB3aWxkY2FyZGluZyBQTVVzIChpZSB3aXRob3V0IGEgUE1VIHdp
dGggdGhlIGV2ZW50Cj4gPiA+PiBuYW1lKSB0aGUgbGVnYWN5IGVuY29kaW5ncyBoYXZlIHByaW9y
aXR5Lgo+ID4gPj4KPiA+ID4+IFRoZSBwYXRjaCBkb2luZyB0aGlzIHdvcmsgd2FzIHJldmVydGVk
IGluIGEgdjYuMTAgcmVsZWFzZSBjYW5kaWRhdGUKPiA+ID4+IGFzLCBldmVuIHRob3VnaCB0aGUg
cGF0Y2ggd2FzIHBvc3RlZCBmb3Igd2Vla3MgYW5kIGhhZCBiZWVuIG9uCj4gPiA+PiBsaW51eC1u
ZXh0IGZvciB3ZWVrcyB3aXRob3V0IGlzc3VlLCBMaW51cyB3YXMgaW4gdGhlIGhhYml0IG9mIHVz
aW5nCj4gPiA+PiBleHBsaWNpdCBsZWdhY3kgZXZlbnRzIHdpdGggdW5zdXBwb3J0ZWQgcHJlY2lz
aW9uIG9wdGlvbnMgb24gaGlzCj4gPiA+PiBOZW92ZXJzZS1OMS4gVGhpcyBtYWNoaW5lIGhhcyBT
TEMgUE1VIGV2ZW50cyBmb3IgYnVzIGFuZCBDUFUgY3ljbGVzCj4gPiA+PiB3aGVyZSBBUk0gZGVj
aWRlZCB0byBjYWxsIHRoZSBldmVudHMgYnVzX2N5Y2xlcyBhbmQgY3ljbGVzLCB0aGUgbGF0dGVy
Cj4gPiA+PiBiZWluZyBhbHNvIGEgbGVnYWN5IGV2ZW50IG5hbWUuIEFSTSBoYXZlbid0IHJlbmFt
ZWQgdGhlIGN5Y2xlcyBldmVudAo+ID4gPj4gdG8gYSBtb3JlIGNvbnNpc3RlbnQgY3B1X2N5Y2xl
cyBhbmQgYXZvaWRlZCB0aGUgcHJvYmxlbS4gV2l0aCB0aGVzZQo+ID4gPj4gY2hhbmdlcyB0aGUg
cHJvYmxlbWF0aWMgZXZlbnQgd2lsbCBub3cgYmUgc2tpcHBlZCwgYSBsYXJnZSB3YXJuaW5nCj4g
PiA+PiBwcm9kdWNlZCwgYW5kIHBlcmYgcmVjb3JkIHdpbGwgY29udGludWUgZm9yIHRoZSBvdGhl
ciBQTVUgZXZlbnRzLiBUaGlzCj4gPiA+PiBzb2x1dGlvbiB3YXMgcHJvcG9zZWQgYnkgQXJuYWxk
by4KPiA+ID4+Cj4gPiA+PiBUd28gbWlub3IgY2hhbmdlcyBoYXZlIGJlZW4gYWRkZWQgdG8gaGVs
cCB3aXRoIHRoZSBlcnJvciBtZXNzYWdlIGFuZAo+ID4gPj4gdG8gd29yayBhcm91bmQgaXNzdWVz
IG9jY3VycmluZyB3aXRoICJwZXJmIHN0YXQgbWV0cmljcyAoc2hhZG93IHN0YXQpCj4gPiA+PiB0
ZXN0Ii4KPiA+ID4+Cj4gPiA+PiBUaGUgcGF0Y2hlcyBoYXZlIG9ubHkgYmVlbiB0ZXN0ZWQgb24g
bXkgeDg2IG5vbi1oeWJyaWQgbGFwdG9wLgo+ID4gPgo+ID4gPiBIaSBBdGlzaCBhbmQgSmFtZXMs
Cj4gPiA+Cj4gPiA+IENvdWxkIEkgZ2V0IHlvdXIgdGFncyBmb3IgdGhpcyBzZXJpZXM/Cj4gPiA+
Cj4KPiBIaSBJYW4sCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoZXMuIEl0IGRlZmluaXRlbHkgaGVs
cHMgdG8gaGF2ZSBhIGNsZWFuIHNsYXRlCj4gaW1wbGVtZW50YXRpb24KPiBmb3IgdGhlIHBlcmYg
dG9vbC4gSG93ZXZlciwgSSBoYXZlIHNvbWUgb3BlbiBxdWVzdGlvbnMgYWJvdXQgb3RoZXIgdXNl
IGNhc2VzCj4gdGhhdCB3ZSBkaXNjdXNzZWQgZHVyaW5nIHRoZSBSVkkgU3VtbWl0LgoKVGhhbmtz
IEF0aXNoLCBjb3VsZCBJIGdldCB5b3VyIGFja2VkL3Jldmlld2VkL3Rlc3RlZCB0YWdzPwoKSWFu
Cgo+ID4gPiBUaGUgcGF0Y2hlcyB3ZXJlIG9yaWdpbmFsbHkgbW90aXZhdGVkIGJ5IHdhbnRpbmcg
dG8gbWFrZSB0aGUgYmVoYXZpb3IKPiA+ID4gb2YgZXZlbnRzIHBhcnNlZCBsaWtlICJjeWNsZXMi
IG1hdGNoIHRoYXQgb2YgImNwdS9jeWNsZXMvIiwgdGhlIFBNVSBpcwo+ID4gPiB3aWxkY2FyZGVk
IHRvICJjcHUiIGluIHRoZSBmaXJzdCBjYXNlLiBUaGlzIHdhcyBkaXZlcmdlbnQgYmVjYXVzZSBv
Zgo+ID4gPiBBUk0gd2Ugc3dpdGNoZWQgZnJvbSBwcmVmZXJyaW5nIGxlZ2FjeSAodHlwZSA9IFBF
UkZfVFlQRV9IQVJEV0FSRSwKPiA+ID4gY29uZmlnID0gUEVSRl9DT1VOVF9IV19DUFVfQ1lDTEVT
KSB0byBzeXNmcy9qc29uICh0eXBlPTxjb3JlIFBNVSdzCj4gPiA+IHR5cGU+LCBjb25maWc9PGVu
Y29kaW5nIGZyb20gZXZlbnQ+KSB3aGVuIGEgUE1VIG5hbWUgd2FzIGdpdmVuLiBUaGlzCj4gPiA+
IGFsaWducyB3aXRoIFJJU0MtViB3YW50aW5nIHRvIHVzZSBqc29uIGVuY29kaW5ncyB0byBhdm9p
ZCBjb21wbGV4aXR5Cj4gPiA+IGluIHRoZSBQTVUgZHJpdmVyLgo+ID4gPgo+ID4KPiA+IEkgY291
bGRuJ3QgZmluZCB0aGUgdGhyZWFkLCBidXQgSSByZW1lbWJlciBmYWlybHkgcmVjZW50bHkgaXQg
d2FzCj4gPiBtZW50aW9uZWQgdGhhdCBSSVNDLVYgd291bGQgYmUgc3VwcG9ydGluZyB0aGUgbGVn
YWN5IGV2ZW50cyBhZnRlciBhbGwsCj4gPiBtYXliZSBpdCB3YXMgYSBjb21tZW50IGZyb20gQXRp
c2g/IEknbSBub3Qgc3VyZSBpZiB0aGF0IGNoYW5nZXMgdGhlCj4gPiByZXF1aXJlbWVudHMgZm9y
IHRoaXMgb3Igbm90Pwo+ID4KPiA+IEkgc3RpbGwgY2FuJ3QgcmVhbGx5IGltYWdpbmUgaG93IHRv
b2xpbmcgd291bGQgd29yayBpZiBldmVyeSB0b29sIGhhcyB0bwo+ID4gbWFpbnRhaW4gdGhlIG1h
cHBpbmdzIG9mIGJhc2ljIGV2ZW50cyBsaWtlIGluc3RydWN0aW9ucyBhbmQgYnJhbmNoZXMuCj4g
PiBGb3IgZXhhbXBsZSBhbGwgdGhlIHBlcmZfZXZlbnRfb3BlbiB0ZXN0cyBpbiBsdHAgdXNlIHRo
ZSBsZWdhY3kgZXZlbnRzLgo+ID4KPgo+IE5vIGl0IGhhcyBub3QgY2hhbmdlZC4gV2hpbGUgdGhp
cyBzZXJpZXMgaGVscHMgdG8gYXZvaWQgY2x1bmt5IHZlbmRvcgo+IHNwZWNpZmljIGVuY29kaW5n
cwo+IGluIHRoZSBkcml2ZXIgZm9yIHBlcmYgdG9vbCwgSSBhbSBzdGlsbCB1bnN1cmUgaG93IHdl
IHdpbGwgbWFuYWdlCj4gb3RoZXIgYXBwbGljYXRpb25zCj4gKGRpcmVjdGx5IHBhc3NpbmcgbGVn
YWN5IGV2ZW50cyB0aHJvdWdoIHBlcmZfZXZlbnRfb3BlbiBvcgo+IHBlcmZfZXZsaXN0X19vcGVu
KSB3aWxsIHdvcmsuCj4KPiBJIGhhdmUgb25seSBhbmVjZG90YWwgZGF0YSBhYm91dCBmb2xrcyBy
ZWx5aW5nIHBlcmYgbGVnYWN5IGV2ZW50cwo+IGRpcmVjdGx5IHRvIHByb2ZpbGUKPiB0aGVpciBh
cHBsaWNhdGlvbi4gQWxsIG9mIHRoZW0gdXNlIG1vc3RseSBjeWNsZS9pbnN0cnVjdGlvbiBldmVu
dHMgdGhvdWdoLgo+IEFyZSB0aGVyZSBhbnkgdXNlcnMgd2hvIHVzZSBvdGhlciBsZWdhY3kgZXZl
bnRzIGRpcmVjdGx5IHdpdGhvdXQgcGVyZiB0b29sID8KPgo+IElmIG5vdCwgd2UgbWF5IGhhdmUg
b25seSBjeWNsZS9pbnN0cnVjdGlvbiBtYXBwaW5nIGluIHRoZSBkcml2ZXIgYW5kCj4gcmVseSBv
biBqc29uIGZvciBldmVyeXRoaW5nIGVsc2UuCj4gVGhlIG90aGVyIHVzZSBjYXNlIGlzIHZpcnR1
YWxpemF0aW9uLiBJIGhhdmUgYmVlbiBwbGF5aW5nIHdpdGggdGhlc2UKPiBwYXRjaGVzIHRvIGZp
bmQgYSBjbGVhbiBzb2x1dGlvbiB0bwo+IGVuYWJsZSBhbGwgdGhlIHVzZSBjYXNlcy4gSWYgeW91
IGhhdmUgYW55IG90aGVyIGlkZWFzLCBwbGVhc2UgbGV0IG1lIGtub3cuCj4KPiA+IEFuZCB3b3Vs
ZG4ndCBwb3J0aW5nIGV4aXN0aW5nIHNvZnR3YXJlIHRvIFJJU0MtViB3b3VsZCBiZSBhbiBpc3N1
ZSBpZiBpdAo+ID4gZG9lc24ndCBiZWhhdmUgaW4gYSBzaW1pbGFyIHdheSB0byB3aGF0J3MgdGhl
cmUgYWxyZWFkeT8KPiA+Cj4gPiA+IEphbWVzLCBjb3VsZCB5b3Ugc2hvdyB0aGUgbmVvdmVyc2Ug
d2l0aCB0aGUgY21uIFBNVSBiZWhhdmlvciBmb3IgcGVyZgo+ID4gPiByZWNvcmQgb2YgImN5Y2xl
czpwcCIgZHVlIHRvIHNlbnNpdGl2aXRpZXMgdGhlcmUuCj4gPiA+Cj4gPgo+ID4gWWVwIEkgY2Fu
IGNoZWNrIHRoaXMgb24gTW9uZGF5Lgo+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPiBJYW4KPiA+ID4K
PiA+Cj4gPgo+ID4gPgo+ID4gPgo+ID4gPgo+ID4gPj4gSWFuIFJvZ2VycyAoNCk6Cj4gPiA+PiAg
ICBwZXJmIGV2c2VsOiBBZGQgcG11X25hbWUgaGVscGVyCj4gPiA+PiAgICBwZXJmIHN0YXQ6IEZp
eCBmaW5kX3N0YXQgZm9yIG1peGVkIGxlZ2FjeS9ub24tbGVnYWN5IGV2ZW50cwo+ID4gPj4gICAg
cGVyZiByZWNvcmQ6IFNraXAgZG9uJ3QgZmFpbCBmb3IgZXZlbnRzIHRoYXQgZG9uJ3Qgb3Blbgo+
ID4gPj4gICAgcGVyZiBwYXJzZS1ldmVudHM6IFJlYXBwbHkgIlByZWZlciBzeXNmcy9KU09OIGhh
cmR3YXJlIGV2ZW50cyBvdmVyCj4gPiA+PiAgICAgIGxlZ2FjeSIKPiA+ID4+Cj4gPiA+PiAgIHRv
b2xzL3BlcmYvYnVpbHRpbi1yZWNvcmQuYyAgICB8IDIyICsrKysrKystLS0KPiA+ID4+ICAgdG9v
bHMvcGVyZi91dGlsL2V2c2VsLmMgICAgICAgIHwgMTAgKysrKysKPiA+ID4+ICAgdG9vbHMvcGVy
Zi91dGlsL2V2c2VsLmggICAgICAgIHwgIDEgKwo+ID4gPj4gICB0b29scy9wZXJmL3V0aWwvcGFy
c2UtZXZlbnRzLmMgfCAyNiArKysrKysrKystLS0KPiA+ID4+ICAgdG9vbHMvcGVyZi91dGlsL3Bh
cnNlLWV2ZW50cy5sIHwgNzYgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQo+ID4g
Pj4gICB0b29scy9wZXJmL3V0aWwvcGFyc2UtZXZlbnRzLnkgfCA2MCArKysrKysrKysrKysrKysr
KystLS0tLS0tLS0KPiA+ID4+ICAgdG9vbHMvcGVyZi91dGlsL3BtdXMuYyAgICAgICAgIHwgMjAg
KysrKysrKy0tCj4gPiA+PiAgIHRvb2xzL3BlcmYvdXRpbC9zdGF0LXNoYWRvdy5jICB8ICAzICst
Cj4gPiA+PiAgIDggZmlsZXMgY2hhbmdlZCwgMTQ1IGluc2VydGlvbnMoKyksIDczIGRlbGV0aW9u
cygtKQo+ID4gPj4KPiA+ID4+IC0tCj4gPiA+PiAyLjQ3LjAuMTYzLmcxMjI2ZjZkOGZhLWdvb2cK
PiA+ID4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
