Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D57C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeynQhqrDLXH77OUpq69F3I2l+2n9eQNfqvU7s423ts=; b=tiOkvgLF+1VoZ2
	uflVpNEiHAJd8Nz3UirxTF+qXXfwCPaaZyzTHq6uSAvWS+XDUqlfo7XbCo+1d3BGxMB06mvtX7UBD
	5iQqUEXPt2+Hw8VrH/N4ajpmQgRGkFUkYYDEryQRfsOv7UIRzcuRdHCPg1lXUxbWOL1hRTEWNHv3H
	vTFvvOT1Inbjh9p50wv7L9clshZ5iQ2VLDr4HYi1NFM9vRhHaURk+iE5JaxPj9fgbHFCwoWfYm4ql
	fQ3tOgGnIxCIsGz3jDRu9JAo8nibSDOllA2f+wE7DeoQUriHtUhteUn3YF7o7PA4TfRhAmEnypprK
	1ozQuZMKpnHw+aX3OSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevJz-0000000Cmh1-0wGi;
	Fri, 16 Aug 2024 11:40:43 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sevJw-0000000Cmg4-3ORP
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 11:40:42 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2f3bfcc2727so13017921fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1723808439; x=1724413239; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BpxzkK3UKTxghQc+n3gc+K3CuWVs47t1vTAqsGCdLNg=;
        b=DcwPEZN5U+0mhEUYI2DYEO6fzE/oMa6YfPklrWNGGXGY9Fa0cXVQJMUKo78oeb1a4T
         6xQlaD0tFW+coE4GOg9wyTP+nsp+Wjg+hAkBKfvpUn5TT+DP+5g+YwOUVuO34ajzF9N7
         CcKi7EZ4UdrKHt7iwnp338OH3dT1dBiaBR1i0wPhvNmJ/m7yl6C2YzT7T823Op77zSMW
         UDHVD6oUYlqLQkXUzy4CV6uTR5EwsdriKUCJfD/UqG+EbRVgNesuOhwv5HlwX7gbD/YY
         MbFPFPUc6OT2+w6QEC16U2FrqRZaScwZqBl7Moz4X23V49ePowGoLt5IeRTKUWQb92ra
         7g9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723808439; x=1724413239;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BpxzkK3UKTxghQc+n3gc+K3CuWVs47t1vTAqsGCdLNg=;
        b=TIHeXJt3ys+oThpQXsw/u+YRIg8XRNbcBIfOy3F4s5jZb5VmpsGQwGGCQG98rFaIkW
         UT6S+HTJVHvcrpLil5v9PW/+ybZokPYgMRdGcxT45DWfrdEwDsAYf8y4wukqa/CzRPKU
         n+hKYfdvSlKxNuIKy4DWGG2ERjsEsFxEUFJLZL/F/W6YZEh8RdF+82H0v68cwTEI5j1I
         6qvHHFzs25ObbJ3h8Nb2BrIeH4qCpc8ne/4lDecc0B5Wpsqo7dEu7MijikRO7kth7Xll
         83z74+c2RF0Mq6AUq9ayVis78bYj+DhQzWJgurCNcu0d/mLX+GoqIq4dTd+l8xxz6TPV
         peZg==
X-Forwarded-Encrypted: i=1; AJvYcCWW7cIH+AWRt/13UzoDNXj0OIVg0RclKGpsb1a250QfmJ8vbzZuML/S6bqP9D8FGteVr2ZRY//w3zPyqpaRpbMp4gb+3OTbpTzkoUIIsERl
X-Gm-Message-State: AOJu0YxqSBKC/YpltDm1VPrrzvAIVa4q+ILzCivJIrCJXGQXBeXojoig
	bbwm8dKgzcSDFGfXCpy3WEjGpzVXSmw/VynDJmSr/toyttY0gtmJDlZ1o4MV+C0=
X-Google-Smtp-Source: AGHT+IFK0XlavC2ASBQwNlu5VWovN1G7tk/Vc3gjrKwPR0rZkWiyoOFZOREKvMWyOZrRdt5yv7L0VQ==
X-Received: by 2002:a2e:3809:0:b0:2f0:27da:6864 with SMTP id 38308e7fff4ca-2f3be5851b4mr21142821fa.17.1723808438254;
        Fri, 16 Aug 2024 04:40:38 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838393560bsm241591966b.139.2024.08.16.04.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 04:40:37 -0700 (PDT)
Date: Fri, 16 Aug 2024 13:40:36 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, maz@kernel.org, mark.rutland@arm.com, robh@kernel.org, 
	saravanak@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH] of/irq: Support #msi-cells=<0> in of_msi_get_domain
Message-ID: <20240816-e5563ca888e15bb00e2652ab@orel>
References: <20240816095520.96348-2-ajones@ventanamicro.com>
 <CAAhSdy0wxpDXoUmGyuQOeMfNCubdp9_iYdBOSN=EcweG1nkwwg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0wxpDXoUmGyuQOeMfNCubdp9_iYdBOSN=EcweG1nkwwg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_044040_874558_C9887C2D 
X-CRM114-Status: GOOD (  29.84  )
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

T24gRnJpLCBBdWcgMTYsIDIwMjQgYXQgMDQ6MTQ6NTJQTSBHTVQsIEFudXAgUGF0ZWwgd3JvdGU6
Cj4gT24gRnJpLCBBdWcgMTYsIDIwMjQgYXQgMzoyNeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVz
QHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IEFuICdtc2ktcGFyZW50JyBwcm9wZXJ0
eSB3aXRoIGEgc2luZ2xlIGVudHJ5IGFuZCBubyBhY2NvbXBhbnlpbmcKPiA+ICcjbXNpLWNlbGxz
JyBwcm9wZXJ0eSBpcyBjb25zaWRlcmVkIHRoZSBsZWdhY3kgZGVmaW5pdGlvbiBhcyBvcHBvc2Vk
Cj4gPiB0byBpdHMgZGVmaW5pdGlvbiBhZnRlciBiZWluZyBleHBhbmRlZCB3aXRoIGNvbW1pdCAx
MjZiMTZlMmFkOTgKPiA+ICgiRG9jczogZHQ6IGFkZCBnZW5lcmljIE1TSSBiaW5kaW5ncyIpLiBI
b3dldmVyLCB0aGUgbGVnYWN5Cj4gPiBkZWZpbml0aW9uIGlzIGNvbXBsZXRlbHkgY29tcGF0aWJs
ZSB3aXRoIHRoZSBjdXJyZW50IGRlZmluaXRpb24gYW5kLAo+ID4gc2luY2Ugb2ZfcGhhbmRsZV9p
dGVyYXRvcl9uZXh0KCkgdG9sZXJhdGVzIG1pc3NpbmcgYW5kIHByZXNlbnQtYnV0LQo+ID4gemVy
byAqY2VsbHMgcHJvcGVydGllcyBzaW5jZSBjb21taXQgZTQyZWU2MTAxN2Y1ICgib2Y6IExldAo+
ID4gb2ZfZm9yX2VhY2hfcGhhbmRsZSBmYWxsYmFjayB0byBub24tbmVnYXRpdmUgY2VsbF9jb3Vu
dCIpLCB0aGVyZSdzIG5vCj4gPiBuZWVkIGFueW1vcmUgdG8gc3BlY2lhbCBjYXNlIHRoZSBsZWdh
Y3kgZGVmaW5pdGlvbiBpbgo+ID4gb2ZfbXNpX2dldF9kb21haW4oKS4KPiA+Cj4gPiBJbmRlZWQs
IHNwZWNpYWwgY2FzaW5nIGhhcyB0dXJuZWQgb3V0IHRvIGJlIGhhcm1mdWwsIGJlY2F1c2UsIGFz
IG9mCj4gPiBjb21taXQgN2MwMjUyMzhiNDdhICgiZHQtYmluZGluZ3M6IGlycWNoaXA6IERlc2Ny
aWJlIHRoZSBJTVggTVUgYmxvY2sKPiA+IGFzIGEgTVNJIGNvbnRyb2xsZXIiKSwgTVNJIGNvbnRy
b2xsZXIgRFQgYmluZGluZ3MgaGF2ZSBzdGFydGVkCj4gPiBzcGVjaWZ5aW5nICcjbXNpLWNlbGxz
JyBhcyBhIHJlcXVpcmVkIHByb3BlcnR5IChldmVuIHdoZW4gdGhlIHZhbHVlCj4gPiBtdXN0IGJl
IHplcm8pIGFzIGFuIGVmZm9ydCB0byBtYWtlIHRoZSBiaW5kaW5ncyBtb3JlIGV4cGxpY2l0LiBC
dXQsCj4gPiBzaW5jZSB0aGUgc3BlY2lhbCBjYXNpbmcgb2YgJ21zaS1wYXJlbnQnIG9ubHkgdXNl
cyB0aGUgZXhpc3RlbmNlIG9mCj4gPiAnI21zaS1jZWxscycgZm9yIGl0cyBoZXVyaXN0aWMsIGFu
ZCBub3Qgd2hldGhlciBvciBub3QgaXQncyBhbHNvCj4gPiBub256ZXJvLCB0aGUgbGVnYWN5IHBh
dGggaXMgbm90IHRha2VuLiBGdXJ0aGVybW9yZSwgdGhlIHBhdGggdG8KPiA+IHN1cHBvcnQgdGhl
IG5ldywgYnJvYWRlciBkZWZpbml0aW9uIGlzbid0IHRha2VuIGVpdGhlciBzaW5jZSB0aGF0Cj4g
PiBwYXRoIGhhcyBiZWVuIHJlc3RyaWN0ZWQgdG8gdGhlIHBsYXRmb3JtLW1zaSBidXMuCj4gPgo+
ID4gQnV0LCBuZWl0aGVyIHRoZSBkZWZpbml0aW9uIG9mICdtc2ktcGFyZW50JyBub3IgdGhlIGRl
ZmluaXRpb24gb2YKPiA+ICcjbXNpLWNlbGxzJyBpcyBwbGF0Zm9ybS1tc2ktc3BlY2lmaWMgKHRo
ZSBwbGF0Zm9ybS1tc2kgYnVzIHdhcyBqdXN0Cj4gPiB0aGUgZmlyc3QgYnVzIHRoYXQgbmVlZGVk
ICcjbXNpLWNlbGxzJyksIHNvIHJlbW92ZSBib3RoIHRoZSBzcGVjaWFsCj4gPiBjYXNpbmcgYW5k
IHRoZSByZXN0cmljdGlvbi4gVGhpcyBub3Qgb25seSBzaW1wbGlmaWVzIHRoZSBjb2RlIGJ1dAo+
ID4gYWxzbyByZXNvbHZlcyBhbiBpc3N1ZSB3aXRoIFBDSSBkZXZpY2VzIGZpbmRpbmcgdGhlaXIg
TVNJIGNvbnRyb2xsZXJzCj4gPiBvbiByaXNjdiwgYXMgdGhlIHJpc2N2LGltc2ljcyBiaW5kaW5n
IHJlcXVpcmVzICcjbXNpLWNlbGxzPTwwPicuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3
IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvb2Yv
aXJxLmMgfCAzNyArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL29mL2lycS5jIGIvZHJpdmVycy9vZi9pcnEuYwo+ID4gaW5kZXgg
Yzk0MjAzY2U2NWJiLi4wMjZiNTJjOGVlNjMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL29mL2ly
cS5jCj4gPiArKysgYi9kcml2ZXJzL29mL2lycS5jCj4gPiBAQCAtNzA5LDggKzcwOSw3IEBAIHN0
cnVjdCBpcnFfZG9tYWluICpvZl9tc2lfbWFwX2dldF9kZXZpY2VfZG9tYWluKHN0cnVjdCBkZXZp
Y2UgKmRldiwgdTMyIGlkLAo+ID4gICAqIEBucDogZGV2aWNlIG5vZGUgZm9yIEBkZXYKPiA+ICAg
KiBAdG9rZW46IGJ1cyB0eXBlIGZvciB0aGlzIGRvbWFpbgo+ID4gICAqCj4gPiAtICogUGFyc2Ug
dGhlIG1zaS1wYXJlbnQgcHJvcGVydHkgKGJvdGggdGhlIHNpbXBsZSBhbmQgdGhlIGNvbXBsZXgK
PiA+IC0gKiB2ZXJzaW9ucyksIGFuZCByZXR1cm5zIHRoZSBjb3JyZXNwb25kaW5nIE1TSSBkb21h
aW4uCj4gPiArICogUGFyc2UgdGhlIG1zaS1wYXJlbnQgcHJvcGVydHkgYW5kIHJldHVybnMgdGhl
IGNvcnJlc3BvbmRpbmcgTVNJIGRvbWFpbi4KPiA+ICAgKgo+ID4gICAqIFJldHVybnM6IHRoZSBN
U0kgZG9tYWluIGZvciB0aGlzIGRldmljZSAob3IgTlVMTCBvbiBmYWlsdXJlKS4KPiA+ICAgKi8K
PiA+IEBAIC03MTgsMzMgKzcxNywxOSBAQCBzdHJ1Y3QgaXJxX2RvbWFpbiAqb2ZfbXNpX2dldF9k
b21haW4oc3RydWN0IGRldmljZSAqZGV2LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZW51bSBpcnFfZG9tYWluX2J1c190b2tlbiB0b2tlbikKPiA+ICB7
Cj4gPiAtICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbXNpX25wOwo+ID4gKyAgICAgICBzdHJ1
Y3Qgb2ZfcGhhbmRsZV9hcmdzIGFyZ3M7Cj4gPiAgICAgICAgIHN0cnVjdCBpcnFfZG9tYWluICpk
Owo+ID4gKyAgICAgICBpbnQgaW5kZXggPSAwOwo+ID4KPiA+IC0gICAgICAgLyogQ2hlY2sgZm9y
IGEgc2luZ2xlIG1zaS1wYXJlbnQgcHJvcGVydHkgKi8KPiA+IC0gICAgICAgbXNpX25wID0gb2Zf
cGFyc2VfcGhhbmRsZShucCwgIm1zaS1wYXJlbnQiLCAwKTsKPiA+IC0gICAgICAgaWYgKG1zaV9u
cCAmJiAhb2ZfcHJvcGVydHlfcmVhZF9ib29sKG1zaV9ucCwgIiNtc2ktY2VsbHMiKSkgewo+ID4g
LSAgICAgICAgICAgICAgIGQgPSBpcnFfZmluZF9tYXRjaGluZ19ob3N0KG1zaV9ucCwgdG9rZW4p
Owo+ID4gLSAgICAgICAgICAgICAgIGlmICghZCkKPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
IG9mX25vZGVfcHV0KG1zaV9ucCk7Cj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIGQ7Cj4gPiAt
ICAgICAgIH0KPiAKPiBEcm9wcGluZyB0aGlzIHNwZWNpYWwgY2FzZSBvZiBzaW5nbGUgbXNpLXBh
cmVudCBwcm9wZXJ0eSBicmVha3MKPiBSSVNDLVYgS1ZNIGd1ZXN0IGNyZWF0ZWQgdXNpbmcgS1ZN
VE9PbCB3aXRoIEFJQSBhdmFpbGFibGUKPiBvbiB0aGUgaG9zdC4KCk91Y2guIFRoaXMgaXMgYSBw
YXBlcmJhZyBtb21lbnQgYXMgSSBjYW4gZWFzaWx5IHJlcHJvZHVjZSB0aGF0LgoKPiAKPiBMZXQn
cyBub3QgZHJvcCB0aGlzIHNwZWNpYWwgY2FzZS4KCkknbGwgd29yayBvdXQgYSBbbXVjaCBiZXR0
ZXIgdGVzdGVkXSB2MiBub3cuCgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
