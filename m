Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F9CE82CA6
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 15:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UYkwZupAHyiVjdhpn2tN9cqgLuntoAqyifCKxJjAmm4=; b=vbamiGaFo1n5VdxWTDXwVEHsa/
	W14f7cOK5R1W0reT8iFerqfi1YtQoA8up81CsBdR54Az+whwWhpwV49BsyTfQLV+x8gSbn+q7Bqbh
	D5eo7DvFi625ofFfnfkWrjo2aA0tJwyoKMz+gEuNhsbTIhyV08QP7VRCVDmtVgzF8SJsqXB/sEAwZ
	8lzzTEM5eOzFNN4Uh0B1/ROasUTMKhlD/xTxE1f23/kMliKWk3Nge2WDjkgx7WQGytnwRoOE/qEAU
	m1m/Ay8b/w46ocLSC4xP2EnKQzA9swSgLZjBM9/y3w+qwb1l1nCALb3jmjU1wfWdAHuvaAFFQDR7h
	zx/tty/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlW2i-001BmF-0a;
	Wed, 27 Sep 2023 15:01:36 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlW2f-001Blc-0Q
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 15:01:34 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-69101022969so10169927b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1695826892; x=1696431692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yTY333uB+lnx85QRK4UhGRcNGGIw7L3jD83kYOSz/mk=;
        b=IeL75AyITFImIuTEg73h0I9uqrceo815e6kZWGQ3iiZxXQ9Xy7gQRcvzqOlsNfujAB
         W8XNJgWkQVmzLuPO/knyTjq8iud6gi9BZTbz8MBnric7APg1KYNzz3p/pBXCND/ySJsN
         sVGR4x1TbONg5q4dPVnibiESgYI6bvCt2DslAcqY4abcDmLmejDttpPVPrbhoISdJt4w
         oaqaAa/fMqOHSLZS8vuhN+DjkKCUlEvsrbn/aXbBoP7IgsdMxil8x0n4TMLS/4hveJca
         ylZraZlG3HADnsHCtD9GttTIPB+Zjzvlp1GidN14o24lhP8NkCNAT6cEj4kIYnIRYCHS
         KuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695826892; x=1696431692;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTY333uB+lnx85QRK4UhGRcNGGIw7L3jD83kYOSz/mk=;
        b=IGbGlXrLDBpFOUe1v84gr08UkyF2iRN5UXsJdjVRrFQB6x7b29WCyydM0kaYzlBNvx
         nia+oCjE4ULF6/6TtOJB7IHiQsKHJ9b68JcPPAjc+MY4YVkb88j26ALfgZBF+ghdbYRz
         ODDLXLuNyEq/vKKURdcPcd9WlELw2Oi70EBHPWNMeqkE3MLXnL22w1WE4PijBLJnjJ/v
         0wQvCBFxHCqet1+vkQJn8ic1OxsAoFGUJosn4bZwPZoLPD2vXMNsgw9AQ7CfjgIFlTzp
         pta5el3zXoozqGfoWwoVYuGnY4gI9h5kNHQAs/s/nmPqij68ugt5ixbwx93vHsFXg8CY
         urUA==
X-Gm-Message-State: AOJu0YzH1KqkYTLRNGsJCuzDS+8827bd7U4pA8BoJVwNTOo1R8re2grN
	vwwTBaqVv2nrhJXbvbteDVndaw==
X-Google-Smtp-Source: AGHT+IGS9wTm9vyVcNuS0LVmu2jhxPRdEUlru4/3+hbsDAoZiukfMAFderu5eKF3apag2JrFxYUQQQ==
X-Received: by 2002:a05:6a20:3d0b:b0:134:4f86:7966 with SMTP id y11-20020a056a203d0b00b001344f867966mr2743151pzi.9.1695826891666;
        Wed, 27 Sep 2023 08:01:31 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id b19-20020aa78113000000b0069302c3c054sm4003815pfi.207.2023.09.27.08.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 08:01:31 -0700 (PDT)
Date: Wed, 27 Sep 2023 08:01:31 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Sep 2023 08:01:29 PDT (-0700)
Subject: Re: [PATCH v2 0/9] KVM RISC-V Conditional Operations
In-Reply-To: <20230927-snowcap-stadium-2f6aeffac59e@spud>
CC: apatel@ventanamicro.com, pbonzini@redhat.com, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shuah@kernel.org,
  ajones@ventanamicro.com, mchitale@ventanamicro.com, devicetree@vger.kernel.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-ed1b5d0a-469c-43e3-a0fe-b8e498cde538@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_080133_175495_31CA04A5 
X-CRM114-Status: GOOD (  34.16  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyNyBTZXAgMjAyMyAwNzo0NToyOCBQRFQgKC0wNzAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IE9uIFdlZCwgU2VwIDI3LCAyMDIzIGF0IDA3OjU0OjQ5UE0gKzA1MzAsIEFudXAgUGF0
ZWwgd3JvdGU6Cj4+IE9uIE1vbiwgU2VwIDI1LCAyMDIzIGF0IDk6MDfigK9QTSBDb25vciBEb29s
ZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+Cj4+ID4gT24gTW9uLCBTZXAgMjUsIDIw
MjMgYXQgMDQ6MzM6MTVQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+PiA+ID4gT24gTW9u
LCBTZXAgMjUsIDIwMjMgYXQgMDc6MDg6NTBQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPj4g
PiA+ID4gVGhpcyBzZXJpZXMgZXh0ZW5kcyBLVk0gUklTQy1WIHRvIGFsbG93IEd1ZXN0L1ZNIGRp
c2NvdmVyIGFuZCB1c2UKPj4gPiA+ID4gY29uZGl0aW9uYWwgb3BlcmF0aW9ucyByZWxhdGVkIElT
QSBleHRlbnNpb25zIChuYW1lbHkgWFZlbnRhbmFDb25kT3BzCj4+ID4gPiA+IGFuZCBaaWNvbmQp
Lgo+PiA+ID4gPgo+PiA+ID4gPiBUbyB0cnkgdGhlc2UgcGF0Y2hlcywgdXNlIEtWTVRPT0wgZnJv
bSByaXNjdl96YnhfemljbnRyX3Ntc3RhdGVlbl9jb25kb3BzX3YxCj4+ID4gPiA+IGJyYW5jaCBh
dDogaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwva3ZtdG9vbC5naXQKPj4gPiA+ID4KPj4gPiA+
ID4gVGhlc2UgcGF0Y2hlcyBhcmUgYmFzZWQgdXBvbiB0aGUgbGF0ZXN0IHJpc2N2X2t2bV9xdWV1
ZSBhbmQgY2FuIGFsc28gYmUKPj4gPiA+ID4gZm91bmQgaW4gdGhlIHJpc2N2X2t2bV9jb25kb3Bz
X3YyIGJyYW5jaCBhdDoKPj4gPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL2F2cGF0ZWwvbGludXgu
Z2l0Cj4+ID4gPiA+Cj4+ID4gPiA+IENoYW5nZXMgc2luY2UgdjE6Cj4+ID4gPiA+ICAtIFJlYmFz
ZWQgdGhlIHNlcmllcyBvbiByaXNjdl9rdm1fcXVldWUKPj4gPiA+ID4gIC0gU3BsaXQgUEFUQ0gx
IGFuZCBQQVRDSDIgb2YgdjEgc2VyaWVzIGludG8gdHdvIHBhdGNoZXMKPj4gPiA+ID4gIC0gQWRk
ZWQgc2VwYXJhdGUgdGVzdCBjb25maWdzIGZvciBYVmVudGFuYUNvbmRPcHMgYW5kIFppY29uZCBp
biBQQVRDSDcKPj4gPiA+ID4gICAgb2YgdjEgc2VyaWVzLgo+PiA+ID4gPgo+PiA+ID4gPiBBbnVw
IFBhdGVsICg5KToKPj4gPiA+ID4gICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBYVmVudGFuYUNv
bmRPcHMgZXh0ZW5zaW9uIGVudHJ5Cj4+ID4gPiA+ICAgUklTQy1WOiBEZXRlY3QgWFZlbnRhbmFD
b25kT3BzIGZyb20gSVNBIHN0cmluZwo+PiA+ID4gPiAgIGR0LWJpbmRpbmdzOiByaXNjdjogQWRk
IFppY29uZCBleHRlbnNpb24gZW50cnkKPj4gPiA+ID4gICBSSVNDLVY6IERldGVjdCBaaWNvbmQg
ZnJvbSBJU0Egc3RyaW5nCj4+ID4gPgo+PiA+ID4gRm9yIHRoZXNlIDQ6Cj4+ID4gPiBSZXZpZXdl
ZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPj4gPgo+PiA+
IEFjdHVhbGx5LCBub3cgdGhhdCBJIHRoaW5rIG9mIGl0LCBJJ20gZ29pbmcgdG8gdGVtcG9yYXJp
bHkgdW4tcmV2aWV3IHRoaXMuCj4+ID4gRnJvbSBwYXRjaC1hY2NlcHRhbmNlLnJzdDoKPj4gPiB8
IEFkZGl0aW9uYWxseSwgdGhlIFJJU0MtViBzcGVjaWZpY2F0aW9uIGFsbG93cyBpbXBsZW1lbnRl
cnMgdG8gY3JlYXRlCj4+ID4gfCB0aGVpciBvd24gY3VzdG9tIGV4dGVuc2lvbnMuICBUaGVzZSBj
dXN0b20gZXh0ZW5zaW9ucyBhcmVuJ3QgcmVxdWlyZWQKPj4gPiB8IHRvIGdvIHRocm91Z2ggYW55
IHJldmlldyBvciByYXRpZmljYXRpb24gcHJvY2VzcyBieSB0aGUgUklTQy1WCj4+ID4gfCBGb3Vu
ZGF0aW9uLiAgVG8gYXZvaWQgdGhlIG1haW50ZW5hbmNlIGNvbXBsZXhpdHkgYW5kIHBvdGVudGlh
bAo+PiA+IHwgcGVyZm9ybWFuY2UgaW1wYWN0IG9mIGFkZGluZyBrZXJuZWwgY29kZSBmb3IgaW1w
bGVtZW50b3Itc3BlY2lmaWMKPj4gPiB8IFJJU0MtViBleHRlbnNpb25zLCB3ZSdsbCBvbmx5IGNv
bnNpZGVyIHBhdGNoZXMgZm9yIGV4dGVuc2lvbnMgdGhhdCBlaXRoZXI6Cj4+ID4gfAo+PiA+IHwg
LSBIYXZlIGJlZW4gb2ZmaWNpYWxseSBmcm96ZW4gb3IgcmF0aWZpZWQgYnkgdGhlIFJJU0MtViBG
b3VuZGF0aW9uLCBvcgo+PiA+IHwgLSBIYXZlIGJlZW4gaW1wbGVtZW50ZWQgaW4gaGFyZHdhcmUg
dGhhdCBpcyB3aWRlbHkgYXZhaWxhYmxlLCBwZXIgc3RhbmRhcmQKPj4gPiB8ICAgTGludXggcHJh
Y3RpY2UuCj4+ID4KPj4gPiBUaGUgeHZlbnRhbmFjb25kb3BzIGJpdHMgZG9uJ3QgcXVhbGlmeSB1
bmRlciB0aGUgZmlyc3QgZW50cnksIGFuZCBJCj4+ID4gZG9uJ3QgdGhpbmsgdGhleSBxdWFsaWZ5
IHVuZGVyIHRoZSBzZWNvbmQgeWV0LiBBbSBJIHdyb25nPwo+PiAKPj4gVGhlIFZlbnRhbmEgVmV5
cm9uIFYxIHdhcyBhbm5vdW5jZWQgaW4gRGVjIDIwMjIgYXQgUklTQy1WIHN1bW1pdAo+PiBmb2xs
b3dlZCBieSBwcmVzcyByZWxlYXNlczoKPj4gaHR0cHM6Ly93d3cudmVudGFuYW1pY3JvLmNvbS92
ZW50YW5hLWludHJvZHVjZXMtdmV5cm9uLXdvcmxkcy1maXJzdC1kYXRhLWNlbnRlci1jbGFzcy1y
aXNjLXYtY3B1LXByb2R1Y3QtZmFtaWx5Lwo+PiBodHRwczovL3d3dy5lbWJlZGRlZC5jb20vdmVu
dGFuYS1yZXZlYWxzLXJpc2Mtdi1jcHUtY29tcHV0ZS1jaGlwbGV0LWZvci1kYXRhLWNlbnRlci8K
Pj4gaHR0cHM6Ly93d3cucHJuZXdzd2lyZS5jb20vbmV3cy1yZWxlYXNlcy92ZW50YW5hLWludHJv
ZHVjZXMtdmV5cm9uLXdvcmxkcy1maXJzdC1kYXRhLWNlbnRlci1jbGFzcy1yaXNjLXYtY3B1LXBy
b2R1Y3QtZmFtaWx5LTMwMTcwMDk4NS5odG1sCj4+IAo+PiBAUGFsbWVyIGlmIHRoZSBhYm92ZSBs
b29rcyBnb29kIHRvIHlvdSB0aGVuIHBsZWFzZSBhY2sgUEFUQ0gxLXRvLTQKPgo+IFRoZXNlIGFy
ZSBhbm5vdW5jZW1lbnRzIEFGQUlDVCAmIG5vdCBhbiBpbmRpY2F0aW9uIG9mICJiZWluZyBpbXBs
ZW1lbnRlZAo+IGluIGhhcmR3YXJlIHRoYXQgaXMgd2lkZWx5IGF2YWlsYWJsZSIuCgpUaGUgc2Vj
b25kIHR3byBsb29rIHRvIGp1c3QgYmUgbmV3cyBhcnRpY2xlcyBxdW90aW5nIHRoZSBmaXJzdCB3
aXRob3V0IAphbnkgcmVhbCBuZXcgaW5mb3JtYXRpb24sIGF0IGxlYXN0IGp1c3QgZnJvbSBza2lt
bWluZyB0aGVtIC0tIHNvcnJ5IGlmIEkgCm1pc3NlZCBzb21ldGhpbmcsIHRob3VnaC4KClRoZSBh
cnRpY2xlIHNheXMgIlNESyByZWxlYXNlZCB3aXRoIG5lY2Vzc2FyeSBzb2Z0d2FyZSBhbHJlYWR5
IHBvcnRlZCB0byAKVmV5cm9uIiBhbmQgIlZleXJvbiBWMSBEZXZlbG9wbWVudCBQbGF0Zm9ybSBh
dmFpbGFibGUiLCBidXQgYXNpZGUgZnJvbSAKcXVvdGVzIG9mIHRoZSBwcmVzcyByZWxlYXNlIEkg
Y2FuJ3QgZmluZCBpbmZvcm1hdGlvbiBvbiBlaXRoZXIgb2YgdGhvc2UgCihvciBhbnl0aGluZyBW
VDEgcmVsYXRlZCwgYXMgdGhlcmUgd2VyZSBzb21lIG5hbWluZyBhbWJpZ3VpdGllcykuCgpBbnVw
IHNhaWQgZHVyaW5nIHRoZSBjYWxsIHRoYXQgdGhleSdyZSBzdGlsbCBicmluZ2luZyB1cCB0aGUg
Y2hpcCBhbmQgCmhhdmVuJ3Qgc3RhcnRlZCBzYW1wbGluZyB5ZXQsIHdoaWNoIHVzdWFsbHkgbWVh
bnMgdGhpbmdzIGFyZSBmYXIgZnJvbSAKcHVibGljbHkgYXZhaWxpYWJsZS4gIEkgdGhvdWdodCBJ
IGhlYXJkIGhpbSBzYXkgdGhhdCB0aGVzZSBwcmVzcyAKcmVsZWFzZXMgd291bGQgc2F5IHRoZSBj
aGlwIGlzIHNhbXBsaW5nIDJIMjMsIGJ1dCBJIGNhbid0IGZpbmQgYW55dGhpbmcgCmluIHRoZW0g
YWJvdXQgc2FtcGxpbmcuCgpBbnVwIGFsc28gc2FpZCBpdCdzIGF2YWlsaWFibGUgYXMgSVAgYW5k
IEkgcmVtZW1iZXIgc29tZXRoaW5nIGF0IEhvdCAKQ2hpcHMgdGFsa2luZyBhYm91dCBhbiBleGFt
cGxlIHBsYWNlIGFuZCByb3V0ZSBmb3IgYSBWVDEsIHdoaWNoIGFsc28gCnNvdW5kcyB2ZXJ5IG11
Y2ggbGlrZSBhIGNoaXAgdGhhdCdzIG5vdCBhdmFpbGlhYmxlIHlldCAtLSB1c3VhbGx5IGlmIAp0
aGVyZSdzIGEgY2hpcCBmb2xrcyBhcmUgYSBsb3QgbW9yZSBjb25jcmV0ZSBhYm91dCB0aGF0IHNv
cnQgb2YgdGhpbmcuCgpTbyBpcyB0aGVyZSB5b3UgY2FuIHBvaW50IHRvIGFib3V0IHRoaXMgY2hp
cCBhY3R1YWxseSBiZWluZyBwdWJsaWNseSAKYXZhaWxpYWJsZT8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
