Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E479C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNRkByu4d8KxI+v8FEC+xQatrVaKgzgD1xQEnDI6UnA=; b=AYM8vSFOwcVKB/
	iNnSoh3eJZwn9jNzrHA0YCzUxWYz+nLHOLbIr6e4JN+5Tyox+bgjF+iZP2T8Ta+nIYft70SbP87ff
	7Xsl6aTFw4pwcKdM6EBtvFa39MA9refyyTtHbBvpfjBSgbsQYhMLEL+Rm+O6nY3v5i8cnHErZl/5x
	kTR9dfhheJR9JimNrJmrTytwHzPyGZe40NgntvJBcospRLJ5pbd4HCIEp83jd/o/8RSj2Sk0dlb+O
	JBzYrnvuLoBKS7t+nfx6y788TIfzEszDPoX48iRqfGBHkSeXThvKJOZa6mW4/RiGBrS7/wkwPO7Qz
	2J6B6R6jQWMlodntFJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZhn-00000008MEM-3QxP;
	Fri, 21 Jun 2024 08:33:11 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKZhj-00000008MCS-46z7
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 08:33:09 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a6fc30e3237so179084166b.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 01:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718958786; x=1719563586; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=13CmNwUXr5VhUsxq5NU9l1BI3PLV5wmazLWOuEQIO+k=;
        b=gznGQBnAzRmyqbvffmjXn/ygePJtQflMF9UEqByRniMeRrDpcbWAGTQX3BZhm79oJW
         rkaGvSUOEHDzgxqf3LqzYHiivlZ/ByFahvQuBGtTYBrQYHoqHAPQeFw646zVAT3Qfiu7
         DyIa4C5Cn/usCxDOylnJOkWO8tpePDrkDDFCIVQchrH1ewe9ldZF/Z+mfuxEik/9dbhY
         OU38tH2lC0IhW76vBnzcCUl29mv02dlq2z68E885nmuMwu79KDYFdkNInTcWbdj1Iryp
         afyDjEOBRPCsxwyUCiUX5VliJtmVg0nZX+ZQrpZIuy1OjhVV20rBbTjhRtXzTfACNN3O
         oomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718958786; x=1719563586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13CmNwUXr5VhUsxq5NU9l1BI3PLV5wmazLWOuEQIO+k=;
        b=WN1qaXGtZR2wUGMKn0tnmsFD7+mp5OEALwvXQNhQS4C1cgmz4P/RFihykr9WbzD6dW
         rbV3qKTE9NlJU0MZ7jeBQseF2rI0P+g8aVdqAaYS8sxo+EHfo7LBKO1f1cKK/PBsRf9e
         KZ2RB5U5CLq4SIMo3PcErZvx5sKCrYavkB6V+oNawMuJiiE4dLCUd0FfBXjQFngXcAHr
         KGSNlfDgJcKzFfbYwjksc0ACvPLBWcwtrtcMZDFSoDy32nYnMw+6K1Yt1Q5zmamUHpvU
         5IXndwDhvBW9AnI/F3/Fq9oC3Qp0lMIZm6Jt70p1CwFnlxJ+oUCieFiYGAEqm7Feb8XX
         7YDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVytm9CrmLNdaQxv5rQsQiH429htmEHlGOQmXDX2+Rsdh7wdYVoWuWEIh6CKTuQXLRvPtu3e6+F1Kc6KxK5DWo/69hoa0Psd/PGk4NYSHH
X-Gm-Message-State: AOJu0Yyno+qemFA8+kDYfmh/4WrAOzw/yIjjw8xnc98Z/SWu8JM2fSys
	ElnWHpxp0q8+EVYukUffrcURWnJfenUsdU9wpdgrlthm13s25gL8ZUw5pOSldys=
X-Google-Smtp-Source: AGHT+IHvj0QAH2876hMCNrT7ElOxqJnXNZ06Sc4+oHnPw0f7XyOBJdmylote20qcntY2N07KCc4kBw==
X-Received: by 2002:a17:907:a4c7:b0:a6f:b69e:8c98 with SMTP id a640c23a62f3a-a6fb69e8d25mr438502466b.62.1718958785171;
        Fri, 21 Jun 2024 01:33:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf56ed53sm57395866b.217.2024.06.21.01.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 01:33:04 -0700 (PDT)
Date: Fri, 21 Jun 2024 10:33:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, alex@ghiti.fr, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
Message-ID: <20240621-10d503a9a2e7d54e67db102c@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com>
 <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_013308_051069_DBDCB3AC 
X-CRM114-Status: GOOD (  33.31  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMTE6NTU6NDRBTSBHTVQsIEFudXAgUGF0ZWwgd3JvdGU6
Cj4gT24gV2VkLCBKdW4gNSwgMjAyNCBhdCAxMDoyNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gV2VkLCBKdW4gMDUsIDIwMjQgYXQgMDg6MTU6
MDhQTSArMDgwMCwgWW9uZy1YdWFuIFdhbmcgd3JvdGU6Cj4gPiA+IEFkZCBlbnRyaWVzIGZvciB0
aGUgU3ZhZGUgYW5kIFN2YWR1IGV4dGVuc2lvbnMgdG8gdGhlIHJpc2N2LGlzYS1leHRlbnNpb25z
Cj4gPiA+IHByb3BlcnR5Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2Fu
ZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbCB8IDMwICsrKysrKysrKysrKysrKysr
KysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+IGRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbAo+ID4gPiBpbmRleCA0NjhjNjQ2MjQ3YWEuLjFlMzA5ODg4MjZiOSAxMDA2NDQK
PiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVu
c2lvbnMueWFtbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiA+IEBAIC0xNTMsNiArMTUzLDM2IEBAIHByb3BlcnRp
ZXM6Cj4gPiA+ICAgICAgICAgICAgICByYXRpZmllZCBhdCBjb21taXQgM2Y5ZWQzNCAoIkFkZCBh
YmlsaXR5IHRvIG1hbnVhbGx5IHRyaWdnZXIKPiA+ID4gICAgICAgICAgICAgIHdvcmtmbG93LiAo
IzIpIikgb2YgcmlzY3YtdGltZS1jb21wYXJlLgo+ID4gPgo+ID4gPiArICAgICAgICAtIGNvbnN0
OiBzdmFkZQo+ID4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiA+ICsgICAgICAgICAg
ICBUaGUgc3RhbmRhcmQgU3ZhZGUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZm9yIHJhaXNp
bmcgcGFnZS1mYXVsdAo+ID4gPiArICAgICAgICAgICAgZXhjZXB0aW9ucyB3aGVuIFBURSBBL0Qg
Yml0cyBuZWVkIGJlIHNldCBhcyByYXRpZmllZCBpbiB0aGUgMjAyNDAyMTMKPiA+ID4gKyAgICAg
ICAgICAgIHZlcnNpb24gb2YgdGhlIHByaXZpbGVnZWQgSVNBIHNwZWNpZmljYXRpb24uCj4gPiA+
ICsKPiA+ID4gKyAgICAgICAgICAgIEJvdGggU3ZhZGUgYW5kIFN2YWR1IGV4dGVuc2lvbnMgY29u
dHJvbCB0aGUgaGFyZHdhcmUgYmVoYXZpb3Igd2hlbgo+ID4gPiArICAgICAgICAgICAgdGhlIFBU
RSBBL0QgYml0cyBuZWVkIHRvIGJlIHNldC4gVGhlIGRlZmF1bHQgYmVoYXZpb3IgZm9yIHRoZSBm
b3VyCj4gPiA+ICsgICAgICAgICAgICBwb3NzaWJsZSBjb21iaW5hdGlvbnMgb2YgdGhlc2UgZXh0
ZW5zaW9ucyBpbiB0aGUgZGV2aWNlIHRyZWUgYXJlOgo+ID4gPiArICAgICAgICAgICAgMS4gTmVp
dGhlciBzdmFkZSBub3Igc3ZhZHUgaW4gRFQ6IGRlZmF1bHQgdG8gc3ZhZGUuCj4gPgo+ID4gSSB0
aGluayB0aGlzIG5lZWRzIHRvIGJlIGV4cGFuZGVkIG9uLCBhcyB0byB3aHkgbm90aGluZyBtZWFu
cyBzdmFkZS4KPiAKPiBBY3R1YWxseSBpZiBib3RoIFN2YWRlIGFuZCBTdmFkdSBhcmUgbm90IHBy
ZXNlbnQgaW4gRFQgdGhlbgo+IGl0IGlzIGxlZnQgdG8gdGhlIHBsYXRmb3JtIGFuZCBPcGVuU0JJ
IGRvZXMgbm90aGluZy4KClRoaXMgaXMgYSBnb29kIHBvaW50LCBhbmQgbWF5YmUgaXQncyB3b3J0
aCBpbnRlZ3JhdGluZyBzb21ldGhpbmcgdGhhdApzdGF0ZXMgdGhpcyBjYXNlIGlzIHRlY2huaWNh
bGx5IHVua25vd24gaW50byB0aGUgZmluYWwgdGV4dC4gKEV2ZW4gdGhvdWdoCmhpc3RvcmljYWxs
eSB0aGlzIGhhcyBiZWVuIGFzc3VtZWQgdG8gbWVhbiBzdmFkZS4pCgo+IAo+ID4KPiA+ID4gKyAg
ICAgICAgICAgIDIuIE9ubHkgc3ZhZGUgaW4gRFQ6IHVzZSBzdmFkZS4KPiA+Cj4gPiBUaGF0J3Mg
YSBzdGF0ZW1lbnQgb2YgdGhlIG9idmlvdXMsIHJpZ2h0Pwo+ID4KPiA+ID4gKyAgICAgICAgICAg
IDMuIE9ubHkgc3ZhZHUgaW4gRFQ6IHVzZSBzdmFkdS4KPiA+Cj4gPiBUaGlzIGlzIG5vdCByZWxl
dmFudCBmb3IgU3ZhZGUuCj4gPgo+ID4gPiArICAgICAgICAgICAgNC4gQm90aCBzdmFkZSBhbmQg
c3ZhZHUgaW4gRFQ6IGRlZmF1bHQgdG8gc3ZhZGUgKExpbnV4IGNhbiBzd2l0Y2ggdG8KPiA+ID4g
KyAgICAgICAgICAgICAgIHN2YWR1IG9uY2UgdGhlIFNCSSBGV0ZUIGV4dGVuc2lvbiBpcyBhdmFp
bGFibGUpLgo+ID4KPiA+ICJUaGUgcHJpdmlsZWdlIGxldmVsIHRvIHdoaWNoIHRoaXMgZGV2aWNl
dHJlZSBoYXMgYmVlbiBwcm92aWRlZCBjYW4gc3dpdGNoIHRvCj4gPiBTdmFkdSBpZiB0aGUgU0JJ
IEZXRlQgZXh0ZW5zaW9uIGlzIGF2YWlsYWJsZSIuCj4gPgo+ID4gPiArICAgICAgICAtIGNvbnN0
OiBzdmFkdQo+ID4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiA+ICsgICAgICAgICAg
ICBUaGUgc3RhbmRhcmQgU3ZhZHUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZm9yIGhhcmR3
YXJlIHVwZGF0aW5nCj4gPiA+ICsgICAgICAgICAgICBvZiBQVEUgQS9EIGJpdHMgYXMgcmF0aWZp
ZWQgYXQgY29tbWl0IGMxYWJjY2YgKCJNZXJnZSBwdWxsIHJlcXVlc3QKPiA+ID4gKyAgICAgICAg
ICAgICMyNSBmcm9tIHZlZC1yaXZvcy9yYXRpZmllZCIpIG9mIHJpc2N2LXN2YWR1Lgo+ID4gPiAr
Cj4gPiA+ICsgICAgICAgICAgICBCb3RoIFN2YWRlIGFuZCBTdmFkdSBleHRlbnNpb25zIGNvbnRy
b2wgdGhlIGhhcmR3YXJlIGJlaGF2aW9yIHdoZW4KPiA+ID4gKyAgICAgICAgICAgIHRoZSBQVEUg
QS9EIGJpdHMgbmVlZCB0byBiZSBzZXQuIFRoZSBkZWZhdWx0IGJlaGF2aW9yIGZvciB0aGUgZm91
cgo+ID4gPiArICAgICAgICAgICAgcG9zc2libGUgY29tYmluYXRpb25zIG9mIHRoZXNlIGV4dGVu
c2lvbnMgaW4gdGhlIGRldmljZSB0cmVlIGFyZToKPiA+Cj4gPiBAQW51cC9EcmV3L0FsZXgsIGFy
ZSB3ZSBtaXNzaW5nIHNvbWUgd29yZGluZyBpbiBoZXJlIGFib3V0IGl0IG9ubHkgYmVpbmcKPiA+
IHZhbGlkIHRvIGhhdmUgU3ZhZHUgaW4gaXNvbGF0aW9uIGlmIHRoZSBwcm92aWRlciBvZiB0aGUg
ZGV2aWNldHJlZSBoYXMKPiA+IGFjdHVhbGx5IHR1cm5lZCBvbiBTdmFkdT8gVGhlIGJpbmRpbmcg
c2F5cyAidGhlIGRlZmF1bHQgYmVoYXZpb3VyIiwgYnV0Cj4gPiBpdCBpcyBub3QgdGhlICJkZWZh
dWx0IiBiZWhhdmlvdXIsIHRoZSBiZWhhdmlvdXIgaXMgYSBtdXN0IEFGQUlDVC4gSWYKPiA+IHlv
dSBzZXQgU3ZhZHUgaW4gaXNvbGF0aW9uLCB5b3UgL211c3QvIGhhdmUgdHVybmVkIGl0IG9uLiBJ
ZiB5b3Ugc2V0Cj4gPiBTdmFkdSBhbmQgU3ZhZGUsIHlvdSBtdXN0IGhhdmUgU3ZhZHUgdHVybmVk
IG9mZj8KPiAKPiBZZXMsIHRoZSB3b3JkaW5nIHNob3VsZCBiZSBtb3JlIG9mIHJlcXVpcmVtZW50
IHN0eWxlIHVzaW5nCj4gbXVzdCBvciBtYXkuCj4gCj4gSG93IGFib3V0IHRoaXMgPwoKSSdtIG1v
c3RseSBqdXN0ICsxJ2luZyBldmVyeXRoaW5nIGJlbG93LCBidXQgd2l0aCBhIG1pbm9yIHdvcmRp
bmcgY2hhbmdlCnN1Z2dlc3Rpb24KCj4gMSkgQm90aCBTdmFkZSBhbmQgU3ZhZHUgbm90IHByZXNl
bnQgaW4gRFQgPT4gU3VwZXJ2aXNvciBtYXkKCk5laXRoZXIgU3ZhZGUgbm9yIFN2YWR1IHByZXNl
bnQuLi4KCj4gICAgIGFzc3VtZSBTdmFkZSB0byBiZSBwcmVzZW50IGFuZCBlbmFibGVkIG9yIGl0
IGNhbiBkaXNjb3Zlcgo+ICAgICBiYXNlZCBvbiBtdmVuZG9yaWQsIG1hcmNoaWQsIGFuZCBtaW1w
aWQuCj4gMikgT25seSBTdmFkZSBwcmVzZW50IGluIERUID0+IFN1cGVydmlzb3IgbXVzdCBhc3N1
bWUgU3ZhZGUKPiAgICAgdG8gYmUgYWx3YXlzIGVuYWJsZWQuIChPYnZpb3VzKQo+IDMpIE9ubHkg
U3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1lIFN2YWR1Cj4gICAg
IHRvIGJlIGFsd2F5cyBlbmFibGVkLiAoT2J2aW91cykKPiA0KSBCb3RoIFN2YWRlIGFuZCBTdmFk
dSBwcmVzZW50IGluIERUID0+IFN1cGVydmlzb3IgbXVzdAo+ICAgICBhc3N1bWUgU3ZhZHUgdHVy
bmVkLW9mZiBhdCBib290IHRpbWUuIFRvIHVzZSBTdmFkdSwgc3VwZXJ2aXNvcgo+ICAgICBtdXN0
IGV4cGxpY2l0bHkgZW5hYmxlIGl0IHVzaW5nIHRoZSBTQkkgRldGVCBleHRlbnNpb24uCj4gCj4g
SU1PLCB0aGUgIzIgYW5kICMzIGFyZSBkZWZpbml0ZWx5IG9idmlvdXMgYnV0IHN0aWxsIHdvcnRo
IG1lbnRpb25pbmcuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
