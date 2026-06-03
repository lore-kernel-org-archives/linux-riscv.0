Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A24CD6E5D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 02:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gfcHjh/hcpA2laSoJbDSP6TZRMAyXZm+svgi3w47BvE=; b=Ffrsd81PeubpK2g1JsaKPC8zBV
	H0WNVVtReCBPwiYSIYKfoXTNdkmgD+c85eM0pWJs8unPtLPE6kyf5Bj+mOtUNbd0sPiUHBIoV6bdt
	e5EqrRVlgOj6q4MoMgHCW2PUUM7JYyDqnwU1p46GE+stmwEeNt5sCQIeylz018PvwcQd+kNTi3yC1
	dsYdQAllVPniHLpiRqSRzqij+Uk80R0gta5Sd88C9qJj6yEk/wFYeduxR9DTRB72uuckrIAm2ABfN
	ayf8zxGvpl2BLQyhPBEQcqtt2+Jh1YEU2TUC160NWE+j62DIcZsziUZ1PkSKAbNgkoryQkDbhAxUk
	j78snoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbRI-0000000E7Ax-0l6g;
	Wed, 03 Jun 2026 02:34:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbRF-0000000E7AS-0Wld
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 02:34:38 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-bec423a5265so609634366b.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 19:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780454075; cv=none;
        d=google.com; s=arc-20240605;
        b=SvN8MKHdFI9s3xLQ39X7p4nQmAe13b3y4Fu9iwssTdY8PZ97b3Z9e3Zi6Ok9I5ksYb
         KGL2bvkS7ZVVtXAzmi48IyAC4/yQzs69IB86k1zCetwgW6ypxADPyiyrICJvk2t92NSg
         jVLleMnmvnW9hBGL3SBZVTvxI+vDsnGJ74iK/U4Eey2KuMu2asd2nhTcQsnalN2+vv0L
         sSD/DlwqwGZxIUMS/dP7xgABLkAnSBbSiFkh8alHNVhkHAfkmtOKKTtJQwCI5MHW/XJy
         VNS5Gi7tp5+SQE5CNY8B+BacICzKk+iklorqoIoUPWm1XWaNxaDWXWyJm9pEW/On6Fk3
         nU0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MhM54igllfAcaP/e6wGqc1OkYhoPLRjxnHSKVTEqOXo=;
        fh=uyk08dmfmzDuKu6LdC8TaxyrbPcHme3bvbztzdXlrSo=;
        b=WOkajdesqGdj844NL8gotZakZKgM8/tYnLyOXSq2+15rODE4teDBD/xja91KkrzGNa
         Q1I5Iuvp/fyIbIdpLIlebYdY9wuqHzf7tccK1G+as72pujRHKyt0uVbf3JpcPLcXGrC0
         Fe2YSrfwwY4aIYFpNFHt7uFdFCW6/i3rGdKedqIyu6KbLpRv7U25pPwoLVkiaih7S3Vb
         /xdc3NSanuxJJihIQw9hps4dqNFNzR8FVBKBkJaXlfjURZ2KCDjwNd6qBdMt/rjn1TvY
         wyYqECjtx3AXqEfSPnCpFVJF9n7bZuxYlcrPUjjoSx1Uil5RQ5xDZvs8TMgvaVEO7c2r
         P+7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780454075; x=1781058875; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhM54igllfAcaP/e6wGqc1OkYhoPLRjxnHSKVTEqOXo=;
        b=CvrE+n9cUh8Z9Ht98dBroHrCDn2Ks6tSaIk2HwYVJeXnO6yhR+uZ2fSvrOSlgELjkX
         9CAzk5sI48JZ+QrjMDYsQIPnpDTuyABPTWmemVAb1qjXIIP/iE1f1gsSKZIweNKSFTRj
         SSk+AzFEBXdLVde6eOIZq/PQS1LMccGY2VLx3mFBqb8VoDUF1D3LQht32prcWV0Pswld
         7crCGDhJ4MhNhij6lzK3989pXeXvRDbHyYxdnkhj4HQsIWejeQNKwscChAHTjP9CQ8dU
         hr8dOUs++eYVyHE5VoK4SAZuyK9Mg6G1lyATdWAwu0jkts70QPYR4zPUixsitdBepxdk
         6nYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780454075; x=1781058875;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhM54igllfAcaP/e6wGqc1OkYhoPLRjxnHSKVTEqOXo=;
        b=RkC2hpKIPYV6Ed8XG9T+O/URSxYPLeHeHUO5chgYawn9BafXL1ubvFFHtfC8Jab2nR
         oGA4+h5Q5leNp1PMVao5u5glfmx0rxd/vMjtNwlzTYXSt3BMBjFNVXP7mvdBcELg4GJc
         Fc6J0dV4rEGPTHclt0KMB7RDonmlcsNl2fGuW/A4T/ef2jGianyY/bDh//Y+FDSunEk1
         UlIwGxK/5T3FJAn7kZHEJ2ES42N0YjgXgBYknWy0gp6UIztOiY2WFAgJAPv0ZgsmwN35
         UNm8NwmqoSb0mbq1cSYnJoWtRZ1dRpN1oY3lLDNShzl3nflNoOJb6QJWQfVSKm905uAp
         lB5A==
X-Forwarded-Encrypted: i=1; AFNElJ8leKjv+ueWPM9keEvGPwYMvazjoVN7oe0lDQr7HRrxZAzfmSQwmtUXkW3KZQOWS2xiMM4FSQQsMK31CQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+61VBfeByRiDrVI9cNPt4XrMxhzRorDbL8I5mfyj2gtOMs4Sl
	BcHEjeKdmTZFHlU5HbaOu4knbRzLKl5WBsF7aVpr12EojgJlvlZnYw4XOgl7V9lp/TZcmVhui4D
	RdKmwquxjL8dx53OWf5yuta+INdnDria2YBMkwedcSQ==
X-Gm-Gg: Acq92OEadWT6BHC1s0mQAVM4k4mVJPVM+FDBS2azD9l/J/58OryF9suNqQoldh6biHl
	UOMvNb2N5HA3gfyaxUj4ZT4oRrasj22w6ijyhZn/ujxL4qk5hNYTo2EfsftG3nIh2eg4dQFuoVL
	nZPaKH3zEUXLyAD6llKAdU4Pb9fXheiVV1o62Z/ccF6TIRibddc2gLPhxwobh2HZ0g+yO8U2nbl
	KNxrKuB5CB2gTCUOIWbPeVAy01O2va7ZKvHb6lqtDINO88KHIY0bbAt7TaViLsGvCInxZi9jLpo
	5djb9BUHo+/9rHV5XDmL
X-Received: by 2002:a17:906:4fce:b0:bec:5264:ee9b with SMTP id
 a640c23a62f3a-bf0aa923eecmr55592466b.36.1780454074602; Tue, 02 Jun 2026
 19:34:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260522093634.3530233-1-zong.li@sifive.com> <CANXhq0pfU1+Qv-SdJRzwvSDQw010+QovUH-OuG4tcwwsjf90MQ@mail.gmail.com>
In-Reply-To: <CANXhq0pfU1+Qv-SdJRzwvSDQw010+QovUH-OuG4tcwwsjf90MQ@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 3 Jun 2026 10:34:23 +0800
X-Gm-Features: AVHnY4JSS10hVsakQKpljSCONyFzEzKcPkSfphiWUchKrwWAwpmxjodt_QySj7Q
Message-ID: <CANXhq0rwnhd0tOeOw+HG+F0YRfGDuoS0ek3ce1PP+nLN4M8Stw@mail.gmail.com>
Subject: Re: [PATCH] riscv: cfi: reduce shadow stack size limit from 2GB to 512MB
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	debug@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, re@w6rz.net, 
	Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, szabolcs.nagy@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_193437_226413_1E8F13B8 
X-CRM114-Status: GOOD (  47.66  )
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

PiBPbiBUaHUsIE1heSAyOCwgMjAyNiBhdCA5OjA34oCvQU0gWm9uZyBMaSA8em9uZy5saUBzaWZp
dmUuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBGcmksIE1heSAyMiwgMjAyNiBhdCA1OjM24oCvUE0g
Wm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gQ2hhbmdlIHRo
ZSBzaGFkb3cgc3RhY2sgc2l6ZSBjYWxjdWxhdGlvbiBmcm9tIFJMSU1JVF9TVEFDSy8yIChjYXBw
ZWQgYXQKPiA+ID4gMkdCKSB0byBSTElNSVRfU1RBQ0svOCAoY2FwcGVkIGF0IDUxMk1CKSwgZm9s
bG93aW5nIERhdmlkIExhaWdodCdzCj4gPiA+IGFuYWx5c2lzIGFuZCByZWNvbW1lbmRhdGlvbi4K
PiA+ID4KPiA+ID4gUmF0aW9uYWxlOgo+ID4gPgo+ID4gPiBEYXZpZCBMYWlnaHQgcG9pbnRlZCBv
dXQgdGhhdCB0aGUgZm9jdXMgc2hvdWxkIGJlIG9uIHRoZSByYXRpbyBiZXR3ZWVuCj4gPiA+IHNo
YWRvdyBzdGFjayBzaXplIGFuZCB0aGUgbm9ybWFsIHN0YWNrIHNpemUsIHJhdGhlciB0aGFuIGp1
c3QgdGhlCj4gPiA+IGFic29sdXRlIHVwcGVyIGxpbWl0LiBIaXMgYW5hbHlzaXMgc2hvd2VkIHRo
YXQgd2hpbGUgdGhlcmUgYXJlIG1hbnkKPiA+ID4gZnVuY3Rpb25zIHdpdGggc21hbGwgc3RhY2sg
ZnJhbWVzLCB0aGUgbWFqb3JpdHkgaGF2ZSBzdGFjayBkZWx0YXMgb2YKPiA+ID4gb3ZlciA2NCBi
eXRlcyBkdWUgdG8gc2F2ZWQgcmVnaXN0ZXJzIGFuZCBsb2NhbCB2YXJpYWJsZXMuCj4gPiA+Cj4g
PiA+IFNoYWRvdyBzdGFja3Mgb25seSBzdG9yZSByZXR1cm4gYWRkcmVzc2VzICg4IGJ5dGVzIHBl
ciBlbnRyeSBvbiA2NC1iaXQKPiA+ID4gc3lzdGVtcyksIHdoZXJlYXMgbm9ybWFsIHN0YWNrIGZy
YW1lcyB0eXBpY2FsbHkgY29uc3VtZSA2NCsgYnl0ZXMuIFRoaXMKPiA+ID4gODo2NCBieXRlIHJh
dGlvIG1lYW5zIHRoYXQgcHJvZ3JhbXMgdXNpbmcgYSBsb3Qgb2Ygc3RhY2sgc3BhY2UgYXJlCj4g
PiA+IGRvbWluYXRlZCBieSBsYXJnZSBidWZmZXIgYWxsb2NhdGlvbnMgYW5kIGxvY2FsIHZhcmlh
Ymxlcywgbm90IGV4dHJlbWUKPiA+ID4gcmVjdXJzaW9uIGRlcHRocyB3aXRoIG1pbmltYWwgbG9j
YWwgZGF0YS4KPiA+ID4KPiA+ID4gRm9yIGV4YW1wbGUsIHdpdGggdGhlIGRlZmF1bHQgUkxJTUlU
X1NUQUNLIG9mIDhNQjoKPiA+ID4gLSBSTElNSVRfU1RBQ0svMiBnaXZlcyBhIDRNQiBzaGFkb3cg
c3RhY2sgc3VwcG9ydGluZyA1MTJLIG5lc3RlZCBjYWxscwo+ID4gPiAtIFJMSU1JVF9TVEFDSy84
IGdpdmVzIGEgMU1CIHNoYWRvdyBzdGFjayBzdXBwb3J0aW5nIDEyOEsgbmVzdGVkIGNhbGxzCj4g
PiA+Cj4gPiA+IEdpdmVuIHR5cGljYWwgc3RhY2sgZnJhbWUgc2l6ZXMgb2YgNjQrIGJ5dGVzLCBS
TElNSVRfU1RBQ0svOCBpcyBzdGlsbAo+ID4gPiBjb25zZXJ2YXRpdmUgYW5kIHByb3ZpZGVzIGFk
ZXF1YXRlIGRlcHRoIGZvciBwcmFjdGljYWwgYXBwbGljYXRpb25zLgo+ID4gPiBEYXZpZCBub3Rl
ZCB0aGF0IHRoaXMgY291bGQgZXZlbiBiZSBzYWZlbHkgaGFsdmVkIGFnYWluLgo+ID4gPgo+ID4g
PiBUaGlzIHJlZHVjdGlvbiBhbHNvIGJldHRlciBhY2NvbW1vZGF0ZXMgbWVtb3J5LWNvbnN0cmFp
bmVkIHBsYXRmb3Jtcy4KPiA+ID4gT24gc3lzdGVtcyB3aXRoIGxpbWl0ZWQgcGh5c2ljYWwgbWVt
b3J5LCBhbGxvY2F0aW5nIGxhcmdlIHNoYWRvdyBzdGFja3MKPiA+ID4gY2FuIGNhdXNlIHZpcnR1
YWwgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZXMgd2hlbiBvdmVyY29tbWl0IG1vZGUgaXMgc2V0
Cj4gPiA+IHRvIE9WRVJDT01NSVRfR1VFU1Mgb3IgT1ZFUkNPTU1JVF9ORVZFUi4KPiA+ID4KPiA+
Cj4gPiBBZGRpbmcgTWFyaywgU3phYm9sY3MgYW5kIENhdGFsaW4gdG8gdGhpcyB0aHJlYWQuCj4g
Pgo+ID4gSSBub3RpY2VkIHlvdXIgcHJldmlvdXMgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIHNoYWRv
dyBzdGFjayBzaXplIGluIHRoZQo+ID4gQVJNNjQgR0NTIHBhdGNoIHNlcmllcy4gSSBzZWUgdGhh
dCB0aGUgR0NTIHNpemUgd2FzIGV2ZW50dWFsbHkgcmVkdWNlZAo+ID4gZnJvbSA0RyB0byAyRy4K
PiA+Cj4gPiBCZWNhdXNlIHRoZSBSSVNDLVYgc2hhZG93IHN0YWNrIHN0b3JlcyB2ZXJ5IHNpbWls
YXIgZGF0YSB0byBHQ1MsIEkKPiA+IGFsc28gcmVkdWNlZCB0aGUgUklTQy1WIHNoYWRvdyBzdGFj
ayBzaXplIHRvIDJHIGluIG15IHJlY2VudCBwYXRjaC4KPiA+IFlvdSBjYW4gZmluZCB0aGUgcmVh
c29ucyBmb3IgdGhpcyBjaGFuZ2UgaGVyZToKPiA+IGh0dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9waXBlcm1haWwvbGludXgtcmlzY3YvMjAyNi1NYXkvMDkxMzA4Lmh0bWwKPiA+Cj4gPiBJbiB0
aGUgc2FtZSB0aHJlYWQsIHdlIGRpc2N1c3NlZCBpZiB3ZSBjb3VsZCBtYWtlIHRoZSBzaXplIGV2
ZW4KPiA+IHNtYWxsZXIuIFRoYW5rIERhdmlkIGZvciBoaXMgaGVscGZ1bCBhbmFseXNpcyBvbiB0
aGlzIHRvcGljLgo+ID4KPiA+IFNpbmNlIEdDUyBoYXMgYmVlbiBtZXJnZWQgZm9yIGEgZmV3IHll
YXJzIG5vdywgd2UnZCBsaWtlIHRvIGxlYXJuIGZyb20KPiA+IHlvdXIgZXhwZXJpZW5jZS4gV2Ug
d2FudCB0byBtYWtlIHN1cmUgd2UgYXJlIG5vdCBtaXNzaW5nIGFueSBpbXBvcnRhbnQKPiA+IGlt
cGFjdHMgb3IgaXNzdWVzLiBUaGVyZWZvcmUsIHdlIHdvdWxkIHJlYWxseSBhcHByZWNpYXRlIGl0
IGlmIHlvdQo+ID4gY291bGQgc2hhcmUgeW91ciB0aG91Z2h0cyB3aXRoIHVzLiBUaGlzIHdpbGwg
Z2l2ZSB1cyB0aGUgY29uZmlkZW5jZSB0bwo+ID4gbW92ZSBmb3J3YXJkIHdpdGggdGhlIHBhdGNo
Cj4gPgo+ID4gVGhhbmtzCj4gPgo+ID4KPiBOb2JvZHkgaGFzIHJlcG9ydGVkIGl0IGNhdXNpbmcg
dGhlbSBhIHByb2JsZW0sIGJ1dCB0aGVyZSdzIG5vdCByZWFsbHkKPiBtdWNoIHByYWN0aWNhbCB1
c2UgeWV0IGR1ZSB0byBoYXJkd2FyZSBhdmFpbGFiaWxpdHkgc28gdGhhdCBtaWdodCBjaGFuZ2UK
PiBhbmQgSSdtIG5vdCBzdXJlIGhvdyBtdWNoIGluZmVyZW5jZSB5b3UgY2FuIGRyYXcgdGhlcmUg
LSB0aGVyZSBpcyBtdWNoCj4gbW9yZSB0ZXN0IHVzZSB0aGFuIHByb2R1Y3Rpb24gdXNlIGF0IHRo
aXMgc3RhZ2UuICBJIHdvdWxkIGJlIGFzdG9uaXNoZWQKPiBpZiBhbnlvbmUgd2FudGVkIHRoZSBz
aGFkb3cgc3RhY2sgdG8gYmUgYmlnZ2VyLCB0aGUgbW9yZSBsaWtlbHkgcHJvYmxlbQo+IGlzIGV4
Y2Vzc2l2ZSBWQSB1c2FnZSBidXQgd2UgZmVsdCBpdCB3YXMgYmV0dGVyIHRvIGVyciBvbiB0aGUg
c2lkZSBvZgo+IHVzaW5nIHRvbyBtdWNoIG1lbW9yeS4gIFRoZSBnZW5lcmFsIGZlZWRiYWNrIGZy
b20gdXNlcnNwYWNlIHBlb3BsZSB3YXMKPiB0aGF0IHRoZXkgd2VyZW4ndCB0b28gY29uY2VybmVk
IGFib3V0IGlzc3Vlcy4KCkhpIE1hcmssClNvcnJ5IGZvciB0aGUgZGVsYXllZCByZXNwb25zZTsg
Zm9yIHNvbWUgcmVhc29uLCB5b3VyIHByZXZpb3VzIGVtYWlsCmRpZG4ndCBzaG93IHVwIGluIG15
IGluYm94LiBJIHBhc3RlZCB5b3VyIG1lc3NhZ2UgYWJvdmUuCgpUaGFuayB5b3UgdmVyeSBtdWNo
IGZvciBzaGFyaW5nIHlvdXIgdmFsdWFibGUgZXhwZXJpZW5jZSB3aXRoIEdDUy4KQmFzZWQgb24g
eW91ciBpbnNpZ2h0cyBhbmQgb3VyIGN1cnJlbnQgY29uc2lkZXJhdGlvbnMsIFBlcmhhcHMgaXQg
aXMKcG9zc2libGUgZm9yIHVzIHRvIHRyeSBjaGFuZ2luZyBpdCB0byA1MTJNQiBmaXJzdC5UaGlz
IHdpbGwgYWxsb3cgdXMKdG8gc3VjY2Vzc2Z1bGx5IGVuYWJsZSB0aGUgc2hhZG93IHN0YWNrIG9u
IGEgbWVtb3J5LWNvbnN0cmFpbmVkCnBsYXRmb3JtLgoKVGhhbmtzIGFnYWluIGZvciB5b3VyIGhl
bHAhCgo+ID4KPiA+ID4gU3VnZ2VzdGVkLWJ5OiBEYXZpZCBMYWlnaHQgPGRhdmlkLmxhaWdodC5s
aW51eEBnbWFpbC5jb20+Cj4gPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDUxODEwNTcyNS43YWZlN2E0Y0BwdW1wa2luLwo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBab25n
IExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvdXNlcmNmaS5jIHwgNCArKy0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdXNlcmNmaS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5jCj4gPiA+IGluZGV4
IGNiZmI0ZTQ5NWU5Zi4uYWRmOTc0MjZhOTA2IDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC91c2VyY2ZpLmMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdXNlcmNmaS5j
Cj4gPiA+IEBAIC0xMTAsNyArMTEwLDcgQEAgdm9pZCBzZXRfaW5kaXJfbHBfbG9jayhzdHJ1Y3Qg
dGFza19zdHJ1Y3QgKnRhc2ssIGJvb2wgbG9jaykKPiA+ID4gIH0KPiA+ID4gIC8qCj4gPiA+ICAg
KiBUaGUgc2hhZG93IHN0YWNrIG9ubHkgc3RvcmVzIHRoZSByZXR1cm4gYWRkcmVzcyBhbmQgbm90
IGFueSB2YXJpYWJsZXMKPiA+ID4gLSAqIHRoaXMgc2hvdWxkIGJlIG1vcmUgdGhhbiBzdWZmaWNp
ZW50IGZvciBtb3N0IGFwcGxpY2F0aW9ucy4KPiA+ID4gKyAqIDUxMk0gc2hvdWxkIGJlIG1vcmUg
dGhhbiBzdWZmaWNpZW50IGZvciBtb3N0IGFwcGxpY2F0aW9ucy4KPiA+ID4gICAqIEVsc2UgUEFH
RV9BTElHTiBpdCBhbmQgcmV0dXJuIGJhY2sKPiA+ID4gICAqLwo+ID4gPiAgc3RhdGljIHVuc2ln
bmVkIGxvbmcgY2FsY19zaHN0a19zaXplKHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiA+ID4gQEAgLTEx
OCw3ICsxMTgsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBjYWxjX3Noc3RrX3NpemUodW5zaWdu
ZWQgbG9uZyBzaXplKQo+ID4gPiAgICAgICAgIGlmIChzaXplKQo+ID4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIFBBR0VfQUxJR04oc2l6ZSk7Cj4gPiA+Cj4gPiA+IC0gICAgICAgcmV0dXJuIFBB
R0VfQUxJR04obWluKHJsaW1pdChSTElNSVRfU1RBQ0spIC8gMiwgU1pfMkcpKTsKPiA+ID4gKyAg
ICAgICByZXR1cm4gUEFHRV9BTElHTihtaW4ocmxpbWl0KFJMSU1JVF9TVEFDSykgLyA4LCBTWl81
MTJNKSk7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+ICAvKgo+ID4gPiAtLQo+ID4gPiAyLjQzLjcKPiA+
ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
