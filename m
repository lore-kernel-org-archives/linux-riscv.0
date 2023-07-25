Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65327C001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 15:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZM6KxOOxajNxC9NjxmIg+r8u/Yne2NHom0rv/PSCroU=; b=Yg5TIKE6XJcpIW
	aUPKSz2T6vO7+jIOWM3PVx1clMjkxhZXqfvugansiGreA6ybxL38/tYbgNxUKXYVH5s+chZxKudqC
	N5pEj5/GCzdBS82BGKdmY2kRDlEVB/mnUBr7I0KD69fDLHFp/vHszDJa+Ldwgd86UYFQRqQYT8QzM
	DIEGqlR3jqKe1gKhJkB3kCemb8mNEBtAJ4q9qcW10wyboKy7THcRhuDskSnLfb0gHVdc66Lrlp4H1
	FoOXKF9QgJ61d31HoAS9w11dDu9is5NmIDw+ReUSpc+MisHc1T5dLApB9AvDCGOtKQTyxtxcttL+0
	XlM4kHYMlNVNnbpPz90A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOKCE-007whP-0p;
	Tue, 25 Jul 2023 15:43:34 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOKCB-007wga-1U
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 15:43:33 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-26834a73b8dso581470a91.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jul 2023 08:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690299810; x=1690904610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+gDE6Cs996RG3GqZsaJFunZXFp2ML2TuD0abc+ohd0=;
        b=TZ0XcGoL9GHkCIzg/KZc+hMs2zlyYbXFcp8JjShW6TYjdrNIfnsIjgm0EisSVSqzEx
         Qw+Z1nuAPmT9jYhJ5+cBC97bqdvaVB2yzZ6stKnLn56EohJSmgo1Jm/xXFrv2ET/leb4
         uU+iX2L+bAhXG0ThVHyB8VmyO/0VRUhDzTh3WD9Jk4wQQSIwBDh4/zAGG/qXqLIqtYuV
         82DEGlOb9CUjodIzFj1Kg8pihT++ceud4u7X/0rgh3WxRJ4As4o+73pvJKjySOjAIa8X
         NYdBc2EI3EsO/G6zNYq5vo0ERppfDmfO4iqMUg0JtZDAu4SDARGUDtM8kSbsWqBUDOMO
         +YvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690299810; x=1690904610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+gDE6Cs996RG3GqZsaJFunZXFp2ML2TuD0abc+ohd0=;
        b=DYx8L4SvRRVwoxQKONxfjtmYfmUICB443q1piEmSm+LYAmcr4xGrVRt9MMlnb5PAN1
         BzWaGIsj3/11I/o5ux0eVo1JO4CGQxeChJ52x1S4N4OO67D8WkksKirWVZoWIIcQmnLi
         1sAxEcAYJ2znvQYnOzrH1ZiRW3Kf9XcCQaZjA+HaMAYT8ygYlnoU23Wb+1bYOdza8m+n
         k/p8hcpAnekvAq9DgE8GpFOpX9pJ1FKwmPEbJCfXGsEHKMKva6tuUPR/nQrbj+OKZI4i
         uYmqSJw0Gb++1Zx1HiIZ/ZB/faFljAjm94LqSRK9oTAsz+nWlf91tmXVeQLvHz/svS7O
         N9vA==
X-Gm-Message-State: ABy/qLZxwAg12VqmkjdiGGyGTFkbmmR5Q1jj736Lm/AE2OvfWQPZHkWM
	o4wgjRwlWtW+gWGrZUEoXw9zZm9nz83IFxsN2a/UWg==
X-Google-Smtp-Source: APBJJlF2L/xNS/4rgqa3Q/8+YpQsoy/Vs8zfSJHaAPfpvL/vWB8ng5Rd4ymgE8wmiCB2vf95x1dd7lodUaEO+bf1uSA=
X-Received: by 2002:a17:90b:202:b0:268:1745:b61 with SMTP id
 fy2-20020a17090b020200b0026817450b61mr4966305pjb.34.1690299810608; Tue, 25
 Jul 2023 08:43:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230724142033.306538-1-mchitale@ventanamicro.com>
 <20230724-scrap-pranker-7fd120078136@spud> <CAK9=C2XXnQWqJgES2iWjatG9SFeFEUXZzLXz1gTYQ0aAh=7KJg@mail.gmail.com>
 <20230725-dwelled-obtain-24bf6a4e6964@wendy>
In-Reply-To: <20230725-dwelled-obtain-24bf6a4e6964@wendy>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 25 Jul 2023 21:13:19 +0530
Message-ID: <CAK9=C2UapxZewmW+dfctr7hOHZfNUhiPCx4mq08-j_vN5LFsWw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Risc-V Kvm Smstateen
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Mayuresh Chitale <mchitale@ventanamicro.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_084331_520459_18E1A6D1 
X-CRM114-Status: GOOD (  40.12  )
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgMzozN+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSGV5IEFudXAsCj4KPiBPbiBUdWUsIEp1bCAy
NSwgMjAyMyBhdCAwOTo0NzoxNEFNICswNTMwLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gT24gTW9u
LCBKdWwgMjQsIDIwMjMgYXQgMTA6MDjigK9QTSBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1bCAyNCwgMjAyMyBhdCAwNzo1MDoyNlBNICswNTMw
LCBNYXl1cmVzaCBDaGl0YWxlIHdyb3RlOgo+ID4gPiA+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9y
dCB0byBkZXRlY3QgdGhlIFNtc3RhdGVlbiBleHRlbnNpb24gZm9yIGJvdGgsIHRoZQo+ID4gPiA+
IGhvc3QgYW5kIHRoZSBndWVzdCB2Y3B1LiBJdCBhbHNvIGFkZHMgc2VudmNmZyBhbmQgc3N0YXRl
ZW4wIHRvIHRoZSBPTkVfUkVHCj4gPiA+ID4gaW50ZXJmYWNlIGFuZCB0aGUgdmNwdSBjb250ZXh0
IHNhdmUvcmVzdG9yZS4KPiA+ID4KPiA+ID4gVGhlcmUncyBub3QgcmVhbGx5IGFuIGV4cGxhbmF0
aW9uIGluIHRoaXMgc2VyaWVzIG9mIHdoZXJlIFNtc3RhdGVlbiBpcwo+ID4gPiBuZWVkZWQsIG9y
IHdoeSBpdCBpcyBvbmx5IGltcGxlbWVudGVkIGZvciBLVk0uIFRoZSBzcGVjIG1lbnRpb25zIHRo
YXQgdGhpcwo+ID4gPiBhbHNvIGFwcGxpZXMgdG8gc2VwYXJhdGUgdXNlciB0aHJlYWRzLCBhcyB3
ZWxsIGFzIHRvIGd1ZXN0cyBydW5uaW5nIGluIGEKPiA+ID4gaHlwZXJ2aXNvci4gQXMgeW91ciBm
aXJzdCBwYXRjaCB3aWxsIGxlYWQgdG8gc21zdGF0ZWVuIGJlaW5nIHNldCBpbgo+ID4gPiAvcHJv
Yy9jcHVpbmZvLCBpdCBjb3VsZCByZWFzb25hYmx5IGJlIGFzc3VtZWQgdGhhdCB0aGUga2VybmVs
IGl0c2VsZgo+ID4gPiBzdXBwb3J0cyB0aGUgZXh0ZW5zaW9uLiBXaHkgZG9lcyBvbmx5IEtWTSwg
YW5kIG5vdCB0aGUga2VybmVsLCByZXF1aXJlCj4gPiA+IHN1cHBvcnQgZm9yIHNtc3RhdGVlbj8K
PiA+Cj4gPiBIZXJlJ3MgdGhlIG1vdGl2YXRpb24gYmVoaW5kIFNtc3RhdGVlbiBmcm9tIHRoZSBz
cGVjOgo+ID4gIlRoZSBpbXBsZW1lbnRhdGlvbiBvZiBvcHRpb25hbCBSSVNDLVYgZXh0ZW5zaW9u
cyBoYXMgdGhlIHBvdGVudGlhbCB0byBvcGVuCj4gPiBjb3ZlcnQgY2hhbm5lbHMgYmV0d2VlbiBz
ZXBhcmF0ZSB1c2VyIHRocmVhZHMsIG9yIGJldHdlZW4gc2VwYXJhdGUgZ3Vlc3QKPiA+IE9TZXMg
cnVubmluZyB1bmRlciBhIGh5cGVydmlzb3IuIFRoZSBwcm9ibGVtIG9jY3VycyB3aGVuIGFuIGV4
dGVuc2lvbgo+ID4gYWRkcyBwcm9jZXNzb3Igc3RhdGUtLS11c3VhbGx5IGV4cGxpY2l0IHJlZ2lz
dGVycywgYnV0IHBvc3NpYmx5IG90aGVyIGZvcm1zIG9mCj4gPiBzdGF0ZS0tLXRoYXQgdGhlIG1h
aW4gT1Mgb3IgaHlwZXJ2aXNvciBpcyB1bmF3YXJlIG9mIChhbmQgaGVuY2Ugd29u4oCZdAo+ID4g
Y29udGV4dC1zd2l0Y2gpIGJ1dCB0aGF0IGNhbiBiZSBtb2RpZmllZC93cml0dGVuIGJ5IG9uZSB1
c2VyIHRocmVhZCBvcgo+ID4gZ3Vlc3QgT1MgYW5kIHBlcmNlaXZlZC9leGFtaW5lZC9yZWFkIGJ5
IGFub3RoZXIuIgo+Cj4gVGhpcyBtdWNoIEkgZ2F0aGVyZWQgZnJvbSBteSAoYnJpZWYpIHJlYWRp
bmcgb2YgdGhlIHNwZWMuCj4KPiA+IEJhc2VkIG9uIHRoZSBhYm92ZSwgU3NhaWEgZXh0ZW5zaW9u
IHJlbGF0ZWQgQ1NScyBuZWVkIHRvIGJlIGV4cGxpY2l0bHkKPiA+IGVuYWJsZWQgZm9yIEhTLW1v
ZGUgYnkgTS1tb2RlICh3aGljaCBPcGVuU0JJIGFscmVhZHkgZG9lcykgYW5kCj4gPiBmb3IgVlMt
bW9kZSBieSBIUy1tb2RlICh3aGljaCB0aGlzIHNlcmllcyBhZGRzIGZvciBLVk0gUklTQy1WKS4K
Pgo+IEFoIHJpZ2h0LiBSZWFkaW5nIGJhY2sgdGhyb3VnaCB0aGUgcGF0Y2hlcywgaW4gWzQvN10g
SSBzZWUgIkNvbmZpZ3VyZQo+IGhzdGF0ZWVuMCByZWdpc3RlciBzbyB0aGF0IHRoZSBBSUEgc3Rh
dGUgYW5kIGVudmNmZyBhcmUgYWNjZXNzaWJsZSB0bwo+IHRoZSB2Y3B1cyIuIEkgd291bGQgYXNr
IHRoYXQsIGF0IGxlYXN0LCBbMS83XSBpcyB1cGRhdGVkIHRvIHByb3ZpZGUgdGhpcwo+IG1vdGl2
YXRpb24gJiB0aGUgcmF0aW9uYWxlIGZvciB3aHkgb25seSBLVk0gbmVlZHMgdG8gY2FyZS4gVGhl
Cj4gbW90aXZhdGlvbiBmb3IgdGhlIHdvcmsgc2hvdWxkIGFwcGVhciBpbiB0aGUgcGF0Y2hzZXQg
c29tZXdoZXJlLCBhbmQKPiBwcm9iYWJseSBpbiB0aGUgY292ZXIgdG9vLgoKWWVzLCBtb3JlIGRl
dGFpbHMgY2FuIGJlIGFkZGVkIHRvIHRoZSBjb21taXQgZGVzY3JpcHRpb24gb2YgUEFUQ0gxCmFu
ZCBjb3ZlciBsZXR0ZXIuCgo+Cj4gPiBDdXJyZW50bHksIHRoZXJlIGFyZSBubyBuZXcgZXh0ZW5z
aW9ucyBhZGRpbmdzIENTUnMgZm9yIHVzZXItc3BhY2UKPiA+IHNvIFJJU0MtViBrZXJuZWwgZG9l
cyBub3QgbmVlZCB0byBzZXQgdXAgc3N0YXRlZW5YIENTUnMgZm9yIHByb2Nlc3Nlcwo+ID4gb3Ig
dGFza3MgYnV0IGluIHRoZSBmdXR1cmUgUklTQy1WIGtlcm5lbCBtaWdodCB0b3VjaCBzc3RhdGVl
blggQ1NScy4KPgo+IFJpZ2h0LCB0aGF0IGlzIHdoYXQgSSBmaWd1cmVkIHdhcyBnb2luZyBvbiwg
aWdub3JpbmcgaXQgZm9yIG5vdywgaW4gdGhlCj4gaG9wZXMgdGhhdCB3ZSByZW1lbWJlciB0byBk
ZWFsIHdpdGggaXQgYmVmb3JlIHNvbWUgdXNlcnNwYWNlIHZpc2libGUKPiBzaWRlIGNoYW5uZWwg
c2hvd3MgdXAuCj4KPiBEdW1iIHF1ZXN0aW9uIG1heWJlLCBidXQgSSBmaW5kIHRoaXMgdG8gYmUg
cXVpdGUgLUVOT1BBUlNFOgo+ID4gQml0IDAgb2YgdGhlc2UgcmVnaXN0ZXJzIGlzIG5vdCBjdXN0
b20gc3RhdGUgaXRzZWxmOyBpdCBpcyBhIHN0YW5kYXJkIGZpZWxkIG9mIGEgc3RhbmRhcmQgQ1NS
LCBlaXRoZXIgbXN0YXRlZW4wLAo+ID4gaHN0YXRlZW4wLCBvciBzc3RhdGVlbjAuIFRoZSByZXF1
aXJlbWVudHMgdGhhdCBub24tc3RhbmRhcmQgZXh0ZW5zaW9ucyBtdXN0IG1lZXQgdG8gYmUgY29u
Zm9ybWluZyBhcmUgbm90Cj4gPiByZWxheGVkIGR1ZSBzb2xlbHkgdG8gY2hhbmdlcyBpbiB0aGUg
dmFsdWUgb2YgdGhpcyBiaXQuIEluIHBhcnRpY3VsYXIsIGlmIHNvZnR3YXJlIHNldHMgdGhpcyBi
aXQgYnV0IGRvZXMgbm90IGV4ZWN1dGUKPiA+IGFueSBjdXN0b20gaW5zdHJ1Y3Rpb25zIG9yIGFj
Y2VzcyBhbnkgY3VzdG9tIHN0YXRlLCB0aGUgc29mdHdhcmUgbXVzdCBjb250aW51ZSB0byBleGVj
dXRlIGFzIHNwZWNpZmllZCBieSBhbGwKPiA+IHJlbGV2YW50IFJJU0MtViBzdGFuZGFyZHMsIG9y
IHRoZSBoYXJkd2FyZSBpcyBub3Qgc3RhbmRhcmQtY29uZm9ybWluZy4KPiBEb2VzIHRoaXMgbWVh
biB0aGF0IGJpdCAwIG9mIHRoZSBDU1JzIG1lbnRpb25lZCBpbiB0aGUgcXVvdGUgY29udHJvbHMg
YWxsCj4gbm9uLXN0YW5kYXJkIGV4dGVuc2lvbnMgYXQgdGhlIHJlc3BlY3RpdmUgcHJpdmlsZWdl
IGxldmVsPyBJZiBzbywgZG9lcwo+IHRoYXQgbm90IG1ha2UgdGhlICJpZ25vcmUgdGhhdCB3ZSB3
aWxsIG5vdyByZXBvcnQgdGhlIHByZXNlbmNlIG9mIHRoaXMKPiBleHRlbnNpb24iIGFwcHJvYWNo
IGZsaW1zaWVyLCBzaW5jZSB3ZSBoYXZlIGxpdHRsZSB2aXNpYmlsaXR5IGludG8gd2hhdAo+IG1h
eSBleGlzdCBvbiB0aGF0IGZyb250PwoKWWVzLCBiaXQwIG9mIHRoZSBzdGF0ZWVuIENTUnMgY29u
dHJvbHMgdGhlIGFjY2VzcyB0byBjdXN0b20gcmVnaXN0ZXJzCmFkZGVkIGJ5IGN1c3RvbSBleHRl
bnNpb25zLiBPZiBjb3Vyc2UsIG5vdCBhbGwgY3VzdG9tIGV4dGVuc2lvbnMKd291bGQgYWRkIGN1
c3RvbSByZWdpc3RlcnMuCgpIaWdoZXIgcHJpdmlsZWdlIGxldmVscyAoc3VjaCBhcyBoeXBlcnZp
c29ycykgc2hvdWxkIG5vdCBlbmFibGUKYml0MCBieSBkZWZhdWx0LiBJdCBzaG91bGQgYmUgZW5h
YmxlZCBvbmx5IGlmIGhpZ2hlciBwcml2aWxlZ2UgbGV2ZWxzCmtub3dzIHdoYXQgaXQgaXMgYW5k
IGhvdyB0byBjb250ZXh0LXN3aXRjaCB0aGUgY3VzdG9tIHJlZ2lzdGVycy4KCj4KPiBHcmFudGVk
LCBpdCBpcyBub3QgYXMgaWYgZGVsYXlpbmcgdGhpcyBwYXRjaHNldCB3b3VsZCBiZW5lZml0IGFu
eW9uZSBpbgo+IHRoYXQgcmVnYXJkLCBzaW5jZSB0aG9zZSBhdHRlbXB0aW5nIHRvIGV4cGxvaXQg
dGhlIHNpZGUgY2hhbm5lbCBrbm93IHRoYXQKPiB0aGUgc2lkZSBjaGFubmVsIGV4aXN0cywgd2hl
dGhlciB0aGUga2VybmVsIHJlcG9ydHMgaGF2aW5nIHNzdGF0ZWVuIG9yCj4gbm90LiBUaGlzIHBy
b2JhYmx5IGp1c3QgYm9pbHMgZG93biB0byAvcHJvYy9jcHVpbmZvIGJlaW5nIGEgdGVycmlibGUK
PiBpbnRlcmZhY2UgZm9yIGRldGVjdGluZyBleHRlbnNpb24gc3VwcG9ydCBpbiB0aGUga2VybmVs
Lgo+IEkndmUgZ290IHNvbWUgb3RoZXIgY29tbWVudHMgYWJvdXQgaXQgdGhhdCBjYW1lIHVwIG9u
IElSQyB5ZXN0ZXJkYXksIHNvCj4gSSdsbCBnbyBjb21wbGFpbiBhYm91dCBpdCBlbHNld2hlcmUg
OikKPgo+IFRoYW5rcywKPiBDb25vci4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
