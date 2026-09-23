Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88E6C982FA
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 11:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mF8rlrNP+0LoN+cL74qwBLgysPn5bDJ5buMuLPMzcM4=; b=Cv0h3y8vtSYANv
	koJwW8xCfgkIhpkx5+yr7/SzhotDCXrhi8w9aNd0072qtVlf26hp9SjkS3BpixnH5j+wSFFKb2GYa
	Mp+DJ+6Zx1bniBmz3RVZk7H8AHeOsjgEv84cDAXJgnDS37taXasx3/rzgKwf+l0ZjUWth8QKJUg+k
	T4bmqtwbJnZXqN0Soadg2h7oPjOe72s8RDLhSpYEr9OvGtZrWdFNHtiz5Zky0i7yS1VAmdNIqJpsS
	u1CPHqfqnh64C6aarTX1TT1PVt1dNdcjZdrhRicfa014UVN/aAzlI3sx6Gne2mXOUcKo3KhbasqK5
	wa2y6tlTMVBKVFjoijsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LZQ-000000089Jb-3OIj;
	Wed, 23 Sep 2026 11:55:28 +0000
Received: from mail-wr2-x12.google.com ([2a00:1450:4864:30::12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LZN-000000089I7-05u5
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 11:55:27 +0000
Received: by mail-wr2-x12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso668371f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 04:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790164523; cv=none;
        d=google.com; s=arc-20260327;
        b=YQx3LBWNG3AdYJu50z/H/HNGcpQxQ+dqPKKboe/CLOHDxwB6nulCB1Y4EI2QsW+8yF
         jMwhEw/rlxYKB/Zkn6ftMdqiIiohW797j8jnjZa6XFo2ezLnZI0MPrpJzH0br4DjUQBQ
         gUT3DEH74AXFcAkDEfu+uxsi3aqD59veYDwMZnAnEckT0KhiYAZwImf8RAlR7EGFPVCC
         g9fziFR+IQ+qNnlKfuowTpBPW9HDNRsPYm6LgoPhpSN0oV6jt3CC1cqc3fGN/cDRcVM9
         WyWN5zmJD9KFySDZv9GQCJ7xA0hYu6x8X1HLT5w4sT2+f7FVS5ZTdwUikmU6pO5b/b96
         /ZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVdhMrrjS3oE1TYac2kH0SXF1gwoyCJ45igZqsjG9/w=;
        fh=H5WwhnEgaNaZTKk19GJ1ONBlqCz1A00/ER6CJ4P2t28=;
        b=p++3APzsbTY1EaHSplB9swcxnIjuB6A6QxBPjgT69QQ1KrUvq/IJ0iclKO0h/WTECo
         3xCaxn7slnXiZNAx2U2UvQeWaaAvGwktFHBNfhaQLGXpnvPQDIyr7LT0yvvmmsNiTUm/
         0gJh+mG9OKCF5aRSyGehKi4oBEO4nRvGNPmq89ev4233MuTHGf33GST9OSMpneVdkE7p
         9hIt22/zX1jjT2pm1kXTm4DCPD91oS6A9LpnZpP761pgwbG+8u5YtCsCk4ML69JbYebA
         ZCGn7iDevbyVrshnJEg2+tXlyIIEjhVWPmjGlzs57RQ9/cNH95jQK3lGyhpzJNcRjGGO
         K5OQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790164523; x=1790769323; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HVdhMrrjS3oE1TYac2kH0SXF1gwoyCJ45igZqsjG9/w=;
        b=FFjhewfMSeevNBe6gsHgN6PdFU1LK0P1OUM028ZNA6iDPQ/SXvZvbKB4o6tslQF0Nr
         dCrTVDFxDfJ+nVQ6+I7u3iAmupahuWN6A36i5qUT6f5guiz0+UkF4GnW97c7WpHZE39k
         A/NF5P4IE8DE8O+D/1DCn+o9MH7oxLDWwtimvVDXZtTWCvYXuqIrvtqR2PLo73LEQajD
         0LeOd2wXTXw2ShOa2q8RISAHnmjmtld8rFdIvBJ/mbuZA3ch0eGKY9rAXEC8bYpizPTJ
         GdfoLDAauV5g6gPIfHCcQIIHv6GnQhzgHyk5Yr+p1LNLbURGUk8u7mZvplWudwaWrfvI
         FwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790164523; x=1790769323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVdhMrrjS3oE1TYac2kH0SXF1gwoyCJ45igZqsjG9/w=;
        b=oq1ZkVE9DC6b7OQhE9j7Ye7w1WNlFAuK0R0GVlNvryH9HGzzP5j9XSvsjAkVJscBfM
         ycE13vfY0lFD5j4Lb8VBCDEu7i9zXBrkPp78j7o9XOrNf+9mbH+klIMx6KWm0vC7rbNN
         iJmPMWUuSbVQ3tB4uFBSmFedKZjcW5Uy3CCurBY3tpeaFkgeln5S0LtmX6txfyPIb9mh
         gjwOB9iN3nsIw0FL5V46WrKmfexWYGEyy8/qD5jWqtci1v/Z7oIa9f+Gv+sQrVXci/bw
         BFEMx3egwuW+Vdsdcuo1O9S6wpB4Bc7QIm90Y6sQvnGnYpVOgb5+cWFWOaROckKtMBXz
         jQwQ==
X-Gm-Message-State: AFuF++kTDggMxGSwWr4uyPAzRH4s29fwpILJSVUwCn2K52MhGfU8mnh7
	Gu1GC7S/PMpqJb1278djHf5pNRpz3qf9/LPzKOQDD7dmQrpPwH7fELk2MHKOwOkbbXMMXTXpaAJ
	yAV6LMIiCgl0K8YREjFZz2DA7UUBQkNpv6swzQW0RHg==
X-Gm-Gg: AYBFou1BnGrXUbkyD4Fte7tYZipt/AHoq9bkSocbKDCJ2jyxpgfK3wsU1rYdwvInUYd
	VFLPqG9oygSN9YqzV7t4TWThuzFzER9s4jPkIF9zXAmgInnic6v/9Fm3AiRSXeDO04LaiWtnb+y
	6eu7RnHoYem8GAxX+vZlyozAkGtrK3UI+GTyiQCL9naEPaF94GcObSEAW6k9n1RzlZQz1GsmOOo
	yrJpG3Tow0RtApCPSBXSTDmoRZdvB0pyVzJx2dG+pVyKL990pAvYeAq/DfGdbeEBGM2X8oOuHSf
	i4Zk0MIVvbmm6bieOIAygRQHKZlfMNu3mada2rtC/teR6vwLZP8cHNFWRs4q1Zi8LbgG7Ty66UG
	do1mXAfKjAUCiiJwvn5wTi03+w21U9a2yWaj2WXRjw0EXoP7pCSkOOKrQjviIKN61Z7ASzuRx4h
	aZ
X-Received: by 2002:a05:6000:4023:b0:486:f17d:14dc with SMTP id
 ffacd0b85a97d-4886705f8fdmr4136204f8f.12.1790164523026; Wed, 23 Sep 2026
 04:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com> <20260831145943.313726-12-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260831145943.313726-12-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Sep 2026 17:25:11 +0530
X-Gm-Features: AclHuK_zLIl-mrpS78xV6vRgDB9dAAUf9QhniI9fOC93j9unzeVYyRI1tSChnzo
Message-ID: <CAAhSdy3o=JtEXnFANPdNn3E3XuKk2wUwXwrekQ+1ropJWnrYGA@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] irqchip/riscv-imsic: Add S-mode MSI address list
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, tglx@kernel.org, 
	kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_045525_088562_4F8675F9 
X-CRM114-Status: GOOD (  21.85  )
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

T24gTW9uLCBBdWcgMzEsIDIwMjYgYXQgODozMOKAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gVXBjb21pbmcgUklTQy1WIElPTU1VIGlu
dGVycnVwdCByZW1hcHBpbmcgbmVlZHMgdG8gbWFwIGV2ZXJ5IHBvc3NpYmxlCj4gaG9zdCBJTVNJ
QyB0YXJnZXQgaW50byBvbmUgY29udGlndW91cyBNU0kgSU9WQSByYW5nZS4gTVNJIG1lc3NhZ2UK
PiBjb21wb3NpdGlvbiB0aGVuIHVzZXMgdGhlIHRhcmdldCBDUFUncyBwb3NpdGlvbiB3aXRoaW4g
dGhhdCByYW5nZS4KPgo+IEJ1aWxkIGFuIFMtbW9kZSBJTVNJQyBwaHlzaWNhbCBhZGRyZXNzIGFy
cmF5IGluZGV4ZWQgYnkgbG9naWNhbCBDUFUuCj4gUmVxdWlyZSBldmVyeSBwb3NzaWJsZSBDUFUg
dG8gaGF2ZSBhbiBpbml0aWFsaXplZCBJTVNJQyBwYWdlIGJlZm9yZQo+IHB1Ymxpc2hpbmcgdGhl
IGFycmF5LiBUaGlzIHByZXNlcnZlcyBwaHlzaWNhbCBhZGRyZXNzIHplcm8gYXMgYSB2YWxpZAo+
IHRhcmdldCBhbmQgZ3VhcmFudGVlcyB0aGUgYXJyYXkgaGFzIG51bV9wb3NzaWJsZV9jcHVzKCkg
ZW50cmllcy4KPgo+IFRoZSBhcnJheSBzaXplIGFuZCBlYWNoIHRhcmdldCdzIGluZGV4IGNhbiB0
aGVyZWZvcmUgYmUgZGVyaXZlZAo+IGRpcmVjdGx5LCB3aXRob3V0IHN0b3JpbmcgZHVwbGljYXRl
IGNvdW50IG9yIHBlci1DUFUgaW5kZXggbWV0YWRhdGEuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMgfCAzMiArKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuaCB8ICAxICsK
PiAgMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jIGIvZHJpdmVycy9pcnFjaGlwL2ly
cS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gaW5kZXggZGYzOGE3NjcwYTg5Li5jN2ViZGRkMzA4ZWMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4g
KysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5jCj4gQEAgLTcwOSw2
ICs3MDksMzEgQEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfZ2V0X21taW9fcmVzb3VyY2Uoc3Ry
dWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwKPiAgICAgICAgIHJldHVybiBvZl9hZGRyZXNzX3Rv
X3Jlc291cmNlKHRvX29mX25vZGUoZndub2RlKSwgaW5kZXgsIHJlcyk7Cj4gIH0KPgo+ICtzdGF0
aWMgaW50IF9faW5pdCBpbXNpY19pbml0X3Ntb2RlX21zaV9wYSh2b2lkKQo+ICt7Cj4gKyAgICAg
ICBzdHJ1Y3QgaW1zaWNfZ2xvYmFsX2NvbmZpZyAqZ2xvYmFsID0gJmltc2ljLT5nbG9iYWw7Cj4g
KyAgICAgICBwaHlzX2FkZHJfdCAqc21vZGVfbXNpX3BhOwo+ICsgICAgICAgdW5zaWduZWQgaW50
IGNwdTsKPiArCj4gKyAgICAgICBzbW9kZV9tc2lfcGEgPSBrY2FsbG9jKG51bV9wb3NzaWJsZV9j
cHVzKCksIHNpemVvZigqc21vZGVfbXNpX3BhKSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBpZiAo
IXNtb2RlX21zaV9wYSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsg
ICAgICAgZm9yX2VhY2hfcG9zc2libGVfY3B1KGNwdSkgewo+ICsgICAgICAgICAgICAgICBzdHJ1
Y3QgaW1zaWNfbG9jYWxfY29uZmlnICpsb2NhbCA9IHBlcl9jcHVfcHRyKGdsb2JhbC0+bG9jYWws
IGNwdSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoIWxvY2FsLT5tc2lfdmEpIHsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBrZnJlZShzbW9kZV9tc2lfcGEpOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICsgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAg
ICAgICAgICAgICBzbW9kZV9tc2lfcGFbY3B1XSA9IGxvY2FsLT5tc2lfcGE7Cj4gKyAgICAgICB9
Cj4gKwo+ICsgICAgICAgaW1zaWMtPnNtb2RlX21zaV9wYSA9IHNtb2RlX21zaV9wYTsKPiArICAg
ICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICBzdGF0aWMgaW50IF9faW5pdCBpbXNpY19wYXJzZV9m
d25vZGUoc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgc3RydWN0IGltc2ljX2dsb2JhbF9jb25maWcgKmdsb2JhbCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTMyICpucl9wYXJlbnRfaXJxcywK
PiBAQCAtOTU5LDYgKzk4NCwxMiBAQCBpbnQgX19pbml0IGltc2ljX3NldHVwX3N0YXRlKHN0cnVj
dCBmd25vZGVfaGFuZGxlICpmd25vZGUsIHZvaWQgKm9wYXF1ZSkKPiAgICAgICAgICAgICAgICAg
Z290byBvdXRfbG9jYWxfY2xlYW51cDsKPiAgICAgICAgIH0KPgo+ICsgICAgICAgcmMgPSBpbXNp
Y19pbml0X3Ntb2RlX21zaV9wYSgpOwo+ICsgICAgICAgaWYgKHJjKSB7Cj4gKyAgICAgICAgICAg
ICAgIHByX2VycigiJXBmd1A6IGZhaWxlZCB0byBpbml0aWFsaXplIFMtbW9kZSBNU0kgYWRkcmVz
c2VzXG4iLCBmd25vZGUpOwo+ICsgICAgICAgICAgICAgICBnb3RvIG91dF9sb2NhbF9jbGVhbnVw
Owo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIC8qIEluaXRpYWxpemUgbWF0cml4IGFsbG9jYXRv
ciAqLwo+ICAgICAgICAgcmMgPSBpbXNpY19tYXRyaXhfaW5pdCgpOwo+ICAgICAgICAgaWYgKHJj
KSB7Cj4gQEAgLTk4NCw2ICsxMDE1LDcgQEAgaW50IF9faW5pdCBpbXNpY19zZXR1cF9zdGF0ZShz
dHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpvcGFxdWUpCj4gIG91dF9mcmVlX2xv
Y2FsOgo+ICAgICAgICAgZnJlZV9wZXJjcHUoaW1zaWMtPmdsb2JhbC5sb2NhbCk7Cj4gIG91dF9m
cmVlX3ByaXY6Cj4gKyAgICAgICBrZnJlZShpbXNpYy0+c21vZGVfbXNpX3BhKTsKPiAgICAgICAg
IGtmcmVlKGltc2ljKTsKPiAgICAgICAgIGltc2ljID0gTlVMTDsKPiAgICAgICAgIHJldHVybiBy
YzsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5o
IGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5oCj4gaW5kZXggYzQyZWUx
ODBiMzA1Li4xMTM1MmYxNGUzMmQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1y
aXNjdi1pbXNpYy1zdGF0ZS5oCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNp
Yy1zdGF0ZS5oCj4gQEAgLTQ5LDYgKzQ5LDcgQEAgc3RydWN0IGltc2ljX3ByaXYgewo+Cj4gICAg
ICAgICAvKiBHbG9iYWwgY29uZmlndXJhdGlvbiBjb21tb24gZm9yIGFsbCBIQVJUcyAqLwo+ICAg
ICAgICAgc3RydWN0IGltc2ljX2dsb2JhbF9jb25maWcgICAgICAgICAgICAgIGdsb2JhbDsKPiAr
ICAgICAgIHBoeXNfYWRkcl90ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqc21vZGVfbXNp
X3BhOwoKUGxlYXNlIGEgY29tbWVudCBvdmVyIGhlcmUgYWJvdXQgd2hhdCB0aGlzIGlzIGZvci4K
CkkgYWxzbyBzdWdnZXN0IHJlbmFtaW5nICJzbW9kZV9tc2lfcGEiIHRvICJtc2lfcGFfbGlzdCIg
YmVjYXVzZQp0aGVvcml0aWNhbGx5IElNU0lDIGRyaXZlciBjYW4gd29yayBmb3IgTS1tb2RlIGFz
IHdlbGwgYWx0aG91Z2gKd2UgaGF2ZSBub3QgdHJpZWQgaXQgZm9yIE0tbW9kZS4KClJlZ2FyZHMs
CkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
