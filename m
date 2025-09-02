Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298CBCA0FFE
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 04:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bc7P3C3swF9WXz/YSvdnHwzSx1F7hv8ieKbAONRtsDY=; b=d2aAs2jEhIK03Z
	3YygVK9QAomygoXtL7MkRrfWrBUWk9LXLTLIU7NPYdQ2p1GiP+K7OBKMH5aP+n7Yqpnw/DljLXfAl
	E0PrFrAn/52KdtBpdgT8dNYazmfbz86JOvknS+Rxn0cn1KwrnoS6fPVrqXeKBDvoaMyPpzHufsj3K
	Gj3e12H2MqoM7iFKjYBA0kOCZFNz3c+tH3L4q68swYVytyV2tyS6KaYi4LKbpCzH1rbH2aQBZd+Th
	IUU59Qybs3pM2/UINFQlPct7uxgKClIuEK3Xuhf4xzs4tZYxnZ15DUXt6IBYDUyYKHVMbE4B3lZfJ
	hmTgeV3YxPhzWi62igNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utID9-0000000F8Pp-37rB;
	Tue, 02 Sep 2025 04:01:35 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utID7-0000000F8PF-40OY
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 04:01:35 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3ec3b5f05e8so22252375ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 21:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756785692; x=1757390492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0vF3AA+Rkq7nWTBrL0TBSZgMNIOZptEtxBEHlmZxNk=;
        b=lDUHMFPMECsW1jFnT+sLt2vw+Qe8sWfpP2V7PGIymSjwwyhcenFS263J2/h0ZstNxh
         FT6duBQAnAlt6U8CTyOho4qD1VuQiiO43FrP29HooYjEDPU7doEEwgPVy+h5dx1azVjy
         FMB5woab/nGd52m3kHuY7+K/6C0QsyOFZSA+2UTot1TQW+gAw6DGLjE7mGKnErScphaO
         e41o+1nCvWBMpxcJ5UXg2VKr+fbxOtsb/hsti0sPkDBdACRu1K1eBvRClHUzpa1ipoLO
         qys+7x7VBz8fvEIfV7BZzaXSar3XdGn9G6NjhWs9MZOyoE2crHm6Z7z5WQ/P/FXm6S1f
         c17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756785692; x=1757390492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0vF3AA+Rkq7nWTBrL0TBSZgMNIOZptEtxBEHlmZxNk=;
        b=s9ZMNg0zvZ4WJwGewID2L2hiZ5WiINrKY4wgbIaOyVsn/adWk8L4gR2ZAjghYozdoY
         BOEiZSJAcWKoi4YJJcB+OV3c+VQ4HKl2UxlBH9Q411k7xU2ejdgKoh2iS5qm1hJHaDd3
         /LtbkuxCwt/NSZbHCYR9yvH/q8zYaBg6dQ+krKOPAlSCAkCULbn8bXCavD+xGSlgeUDh
         LyXu0pXByBg1RP94lB3mWGqwO8DD2Jy9G0A51f5dba76TJ26AFvhB/CKsPuHKs4zO9bP
         g/UC6Ok7SUJNAE6JjkWOKGAwmEJ1kqkulqAGIzyo2IkGAz/+PIQrc5k9EFIKmReDJDfk
         nGRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRY1TKfq+0ITESSM4P98PQkQH0KeNYsMP1I8U6stVjhrCJbdu4Wl/itliMIhaGQ01BusYeUf85avBqPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzproJEpCF7UjUDWmhnRJGcvjjaNUOlnQQuy/YiAiVxumf6gCo9
	wmcRLfZw7coBPQq62DnLnf50CdksKmvDwACzIkkU0ZTDOEVLYOvQeOgfWdbGNSTuQh7CnbFEt9/
	0VFKSSGExxVUBYmtGrVMOOeQLFdG2Hk8uFrUdK6bgRw==
X-Gm-Gg: ASbGncuvlNH/53Ctj58keNKZg/Bs5FaaKIFGLvEzLqudZEKae+rQvfwq2E6ViBkr4Hz
	h1i52bUCeAD+V8q882AKHGKA/m9Yw9cw0nPWu8mVK8nADw+ZihXOd0pNmYGtZVztiuEgYujUAJ/
	AkAkxQpajChqGD4j45IV/ONYei6CffLjoLBkjf/tS7oGy2nkEFk/9Z0dND8g94VgB1U18qr2W8D
	5OiJFpUnw==
X-Google-Smtp-Source: AGHT+IHyzW+/5sZk3REX6p5gITjtt3mTNs/VjN2Tek/XlWrX+PGuWni51wU7hsEbW1hVZXbmTe8C4BoqMzr7Lu08/nA=
X-Received: by 2002:a05:6e02:4901:b0:3f4:3c3b:5af8 with SMTP id
 e9e14a558f8ab-3f43c3b5b5fmr171695585ab.27.1756785692539; Mon, 01 Sep 2025
 21:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240614142156.29420-3-zong.li@sifive.com> <20250901133629.87310-1-ni_liqiang@126.com>
In-Reply-To: <20250901133629.87310-1-ni_liqiang@126.com>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 2 Sep 2025 12:01:19 +0800
X-Gm-Features: Ac12FXwpi8gyi1mSx73Jw2TbBz0hbsvAceRzz4mouXq2z_brh7Py0L56YowF_GU
Message-ID: <CANXhq0ra+yv-Wt_vKTN3+c4StsPQB1vR+=Kp3RVSh0g10Oogqw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/10] RISC-V IOMMU HPM and nested IOMMU support
To: niliqiang <ni_liqiang@126.com>
Cc: aou@eecs.berkeley.edu, iommu@lists.linux.dev, jgg@ziepe.ca, 
	joro@8bytes.org, kevin.tian@intel.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	robin.murphy@arm.com, tjeznach@rivosinc.com, will@kernel.org, 
	chenruisust@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_210134_013326_1A6B6135 
X-CRM114-Status: GOOD (  34.99  )
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

T24gTW9uLCBTZXAgMSwgMjAyNSBhdCA5OjM34oCvUE0gbmlsaXFpYW5nIDxuaV9saXFpYW5nQDEy
Ni5jb20+IHdyb3RlOgo+Cj4gSGkgWm9uZwo+Cj4gRnJpLCAxNCBKdW4gMjAyNCAyMjoyMTo0OCAr
MDgwMCwgWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPgo+ID4gVGhpcyBwYXRj
aCBpbml0aWFsaXplIHRoZSBwbXUgc3R1ZmYgYW5kIHVuaW5pdGlhbGl6ZSBpdCB3aGVuIGRyaXZl
cgo+ID4gcmVtb3ZpbmcuIFRoZSBpbnRlcnJ1cHQgaGFuZGxpbmcgaXMgYWxzbyBwcm92aWRlZCwg
dGhpcyBoYW5kbGVyIG5lZWQgdG8KPiA+IGJlIHByaW1hcnkgaGFuZGxlciBpbnN0ZWFkIG9mIHRo
cmVhZCBmdW5jdGlvbiwgYmVjYXVzZSBwdF9yZWdzIGlzIGVtcHR5Cj4gPiB3aGVuIHRocmVhZGlu
ZyB0aGUgSVJRLCBidXQgcHRfcmVncyBpcyBuZWNlc3NhcnkgYnkgcGVyZl9ldmVudF9vdmVyZmxv
dy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgfCA2NSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlv
bnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIGIv
ZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gPiBpbmRleCA4YjZhNjRjMWFkOGQuLjE3MTZi
MjI1MWYzOCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ID4g
KysrIGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gPiBAQCAtNTQwLDYgKzU0MCw2MiBA
QCBzdGF0aWMgaXJxcmV0dXJuX3QgcmlzY3ZfaW9tbXVfZmx0cV9wcm9jZXNzKGludCBpcnEsIHZv
aWQgKmRhdGEpCj4gPiAgIHJldHVybiBJUlFfSEFORExFRDsKPiA+ICB9Cj4gPgo+ID4gKy8qCj4g
PiArICogSU9NTVUgSGFyZHdhcmUgcGVyZm9ybWFuY2UgbW9uaXRvcgo+ID4gKyAqLwo+ID4gKwo+
ID4gKy8qIEhQTSBpbnRlcnJ1cHQgcHJpbWFyeSBoYW5kbGVyICovCj4gPiArc3RhdGljIGlycXJl
dHVybl90IHJpc2N2X2lvbW11X2hwbV9pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQp
Cj4gPiArewo+ID4gKyBzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGV2aWNlICppb21tdSA9IChzdHJ1Y3Qg
cmlzY3ZfaW9tbXVfZGV2aWNlICopZGV2X2lkOwo+ID4gKwo+ID4gKyAvKiBQcm9jZXNzIHBtdSBp
cnEgKi8KPiA+ICsgcmlzY3ZfaW9tbXVfcG11X2hhbmRsZV9pcnEoJmlvbW11LT5wbXUpOwo+ID4g
Kwo+ID4gKyAvKiBDbGVhciBwZXJmb3JtYW5jZSBtb25pdG9yaW5nIGludGVycnVwdCBwZW5kaW5n
ICovCj4gPiArIHJpc2N2X2lvbW11X3dyaXRlbChpb21tdSwgUklTQ1ZfSU9NTVVfUkVHX0lQU1Is
IFJJU0NWX0lPTU1VX0lQU1JfUE1JUCk7Cj4gPiArCj4gPiArIHJldHVybiBJUlFfSEFORExFRDsK
PiA+ICt9Cj4gPiArCj4gPiArLyogSFBNIGluaXRpYWxpemF0aW9uICovCj4gPiArc3RhdGljIGlu
dCByaXNjdl9pb21tdV9ocG1fZW5hYmxlKHN0cnVjdCByaXNjdl9pb21tdV9kZXZpY2UgKmlvbW11
KQo+ID4gK3sKPiA+ICsgaW50IHJjOwo+ID4gKwo+ID4gKyBpZiAoIShpb21tdS0+Y2FwcyAmIFJJ
U0NWX0lPTU1VX0NBUEFCSUxJVElFU19IUE0pKQo+ID4gKyAgICAgcmV0dXJuIDA7Cj4gPiArCj4g
PiArIC8qCj4gPiArICAqIHB0X3JlZ3MgaXMgZW1wdHkgd2hlbiB0aHJlYWRpbmcgdGhlIElSUSwg
YnV0IHB0X3JlZ3MgaXMgbmVjZXNzYXJ5Cj4gPiArICAqIGJ5IHBlcmZfZXZlbnRfb3ZlcmZsb3cu
IFVzZSBwcmltYXJ5IGhhbmRsZXIgaW5zdGVhZCBvZiB0aHJlYWQKPiA+ICsgICogZnVuY3Rpb24g
Zm9yIFBNIElSUS4KPiA+ICsgICoKPiA+ICsgICogU2V0IHRoZSBJUlFGX09ORVNIT1QgZmxhZyBi
ZWNhdXNlIHRoaXMgSVJRIG1pZ2h0IGJlIHNoYXJlZCB3aXRoCj4gPiArICAqIG90aGVyIHRocmVh
ZGVkIElSUXMgYnkgb3RoZXIgcXVldWVzLgo+ID4gKyAgKi8KPiA+ICsgcmMgPSBkZXZtX3JlcXVl
c3RfaXJxKGlvbW11LT5kZXYsCj4gPiArICAgICAgICAgICAgICAgaW9tbXUtPmlycXNbcmlzY3Zf
aW9tbXVfcXVldWVfdmVjKGlvbW11LCBSSVNDVl9JT01NVV9JUFNSX1BNSVApXSwKPiA+ICsgICAg
ICAgICAgICAgICByaXNjdl9pb21tdV9ocG1faXJxX2hhbmRsZXIsIElSUUZfT05FU0hPVCB8IElS
UUZfU0hBUkVELCBOVUxMLCBpb21tdSk7Cj4gPiArIGlmIChyYykKPiA+ICsgICAgIHJldHVybiBy
YzsKPiA+ICsKPiA+ICsgcmV0dXJuIHJpc2N2X2lvbW11X3BtdV9pbml0KCZpb21tdS0+cG11LCBp
b21tdS0+cmVnLCBkZXZfbmFtZShpb21tdS0+ZGV2KSk7Cj4gPiArfQo+ID4gKwo+Cj4gV2hhdCBh
cmUgdGhlIGJlbmVmaXRzIG9mIGluaXRpYWxpemluZyB0aGUgaW9tbXUtcG11IGRyaXZlciBpbiB0
aGUgaW9tbXUgZHJpdmVyPwo+Cj4gSXQgbWlnaHQgYmUgYmV0dGVyIGZvciB0aGUgUklTQy1WIElP
TU1VIFBNVSBkcml2ZXIgdG8gYmUgbG9hZGVkIGFzIGEgc2VwYXJhdGUgbW9kdWxlLCBhcyB0aGlz
IHdvdWxkIGFsbG93IGdyZWF0ZXIgZmxleGliaWxpdHkgc2luY2UgZGlmZmVyZW50IHZlbmRvcnMg
bWF5IG5lZWQgdG8gYWRkIGN1c3RvbSBldmVudHMuCj4KPiBBbHNvLCBJJ20gbm90IHF1aXRlIGNs
ZWFyIG9uIGhvdyBjdXN0b20gZXZlbnRzIHNob3VsZCBiZSBhZGRlZCBpZiB0aGUgUklTQy1WIGlv
bW11LXBtdSBpcyBwbGFjZWQgd2l0aGluIHRoZSBpb21tdSBkcml2ZXIuCgpIaSBMaXFpYW5nLApN
eSBvcmlnaW5hbCBpZGVhIGlzIHRoYXQsIHNpbmNlIHRoZSBJT01NVSBIUE0gaXMgbm90IGFsd2F5
cyBwcmVzZW50LAppdCBkZXBlbmRzIG9uIHRoZSBjYXBhYmlsaXR5LkhQTSBiaXQsIGlmIHdlIHNl
cGFyYXRlIEhQTSBpbnRvIGFuCmluZGl2aWR1YWwgbW9kdWxlLCBJIGFzc3VtZSB0aGF0IHRoZSBQ
TVUgZHJpdmVyIG1heSBub3QgaGF2ZSBhY2Nlc3MgdG8KdGhlIElPTU1VJ3MgY29tcGxldGUgTU1J
TyByZWdpb24uIEnigJltIG5vdCBzdXJlIGhvdyB3ZSB3b3VsZCBjaGVjayB0aGUKY2FwYWJpbGl0
eSByZWdpc3RlciBpbiB0aGUgUE1VIGRyaXZlciBhbmQgYXZvaWQgdGhlIGZvbGxvd2luZwpzaXR1
YXRpb246IGNhcGFiaWxpdHkuSFBNIGlzIHplcm8sIGJ1dCB0aGUgSU9NTVUtUE1VIGRyaXZlciBp
cyBzdGlsbApsb2FkZWQgYmVjYXVzZSB0aGUgUE1VIG5vZGUgaXMgcHJlc2VudCBpbiB0aGUgRFRT
LiBJdCB3aWxsIGJlIGhlbHBmdWwKaWYgeW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIG9uIHRoaXMu
CgpSZWdhcmRpbmcgY3VzdG9tIGV2ZW50cywgc2luY2Ugd2UgZG9u4oCZdCBoYXZlIHRoZSBkcml2
ZXIgZGF0YSwgbXkKY3VycmVudCByb3VnaCBpZGVhIGlzIHRvIGFkZCBhIHZlbmRvciBldmVudCBt
YXAgdGFibGUgdG8gbGlzdCB0aGUKdmVuZG9yIGV2ZW50cyBhbmQgdXNlIEtjb25maWcgdG8gZGVm
aW5lIHRoZW0gcmVzcGVjdGl2ZWx5LiBUaGlzIGlzCmp1c3QgYW4gaW5pdGlhbCB0aG91Z2h0IGFu
ZCBtYXkgbm90IGJlIHRoZSBnb29kIHNvbHV0aW9uLCBzbyBmZWVsIGZyZWUKdG8gc2hhcmUgYW55
IHJlY29tbWVuZGF0aW9ucy4gT2YgY291cnNlLCBpZiB3ZSBldmVudHVhbGx5IGRlY2lkZSB0bwpt
b3ZlIGl0IHRvIGRyaXZlcnMvcGVyZiBhcyBhbiBpbmRpdmlkdWFsIG1vZHVsZSwgdGhlbiB3ZSBj
b3VsZCB1c2UgdGhlCmRyaXZlciBkYXRhIGZvciBjdXN0b20gZXZlbnRzLCBzaW1pbGFyIHRvIHdo
YXQgQVJNIGRvZXMuCgpUaGFua3MKCj4KPgo+IEJlc3QgcmVnYXJkcywKPiBMaXFpYW5nCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
