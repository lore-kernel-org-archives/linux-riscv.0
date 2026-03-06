Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7622F0182E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 12:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nCdtb4vJSWz4F+04vgW/+j3FCZjqK/7tLXFs8TjNK0=; b=BYV8YVpI5/KXMu
	Vs1JUBaxNdN267OS0YFpBGaCf6C6bKq239DbtObKoRGyDnpe2KnIO1EovVH/x4rLf1RA0rBOj2WKp
	Ji8tx8y64sgcZmIFP6wCsOnUaRJpch+Vh7DgqdUc1i+LILrp1rofAKVv/8oi/4COMfitM1xlP7sjJ
	pFWhJf7tbkyn327mtr8eMsMThr6iDp1LYmP/5M6WOqBl+pmMH5e79cdgLmaYE18O6Gkf9nUAGOUl0
	4IkCi0NqTnucdZFWeZApn393DUeqXzJPfV/7agDIPsVskT1wa3ulGL51ny8Hd20TQayCXo7uGpy5o
	7736uIM643pTAAeZjTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUaz-00000003g9N-1e2L;
	Fri, 06 Mar 2026 12:47:57 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyUaw-00000003g8W-2yGI
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 12:47:56 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-64ca1ba0089so8396196d50.1
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 04:47:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772801273; cv=none;
        d=google.com; s=arc-20240605;
        b=a60cMw2HFTP5qHpmKkgh051m7Yql05+EpX30qOKP2EQt97fjdS+Oh0Qe7Z6f9feo9c
         Ip/lGc6+OIdilLIRh6YPFiliGqpDVi4FMNZbN8Ej/a0xLj0a8H24YbccuX0LEcPIU5s7
         yfZV6LvQWC0QE0WyQ8sJXuWMo2v2S1LI3St2iPtLAmQQCQYzso7qV3AQLEEN1hheGC31
         k6T0IJ6U1YTxSvoNMCLGSPHqSf1Yj7zHwTX1jMJl+HyLafNqmZ1ZPMZfeCuXF6lJ1caB
         OGfRAsVouDsqWxu7nQdoMbNKXDguWJw3umAaaqcst+nrRaEsfD9XgpAudpoSzxngA8d8
         LB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZoBEJ7tkkeq/IYAC/TzZaRt6GXvGlu3YZe/iwn07mtE=;
        fh=/bkHaqbquJPvp0IU/V3W+Tw0GnXwxi+MoxBNSVKUnXk=;
        b=cx+QgrMpgFQeayMRDX4+CoLBHhI+3uNGWOZc6jw1hHGBl92Xi6NwnzluL12xiUOimE
         cO/ovVembykcsse03VIMNVEJ6QsDp7iFfqVQxWk5yOl5DzXDRUPsFIaDZynyO5UnZI+g
         VfvILnEFEc+Gd4s3NhbAKpaCB+t/tVzBHUEBnNhp0nIy4mssBWAorDGShstDERtIW40j
         tBAXIDkzcZd+d1zM3y/FnhDvRHNF8F5OPgR8HOiRDtQjy/y/Y41XT+ihWY4U8nfT7XiI
         gxaMfUEFZSxJndcpz2nmv5RJTV4Ix2Y60CEGV/nrCDLcdsG0sHXmdVU0l52IHORea601
         1rAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1772801273; x=1773406073; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZoBEJ7tkkeq/IYAC/TzZaRt6GXvGlu3YZe/iwn07mtE=;
        b=1JFE5HZxV3jZSOSDtXR0+d/n4VwtRDiOwSQQHAjfAJPka8kLWNGJqTWLDbhM4Z/BUw
         tRbLXPqKRyDvlWU1jJAE5ymOMojdYJvz3wgbLMGM9GtL+F5Tk1vMjCSl2AN9yO7ZvAyC
         2Cv57STXcGyW3MZhFwhlXPJGL6qvQLApYiIs1fVPLrPt0iKjKE3OOrBEW7QuaP9wfU/L
         pGC2zumhGE0jSLEocsd6tCVTJi7K8430MIZRRsdHRXsucPhhv7jx3d5bpFZZ/FTbZoDT
         2Nv81AAB1C3/JqGZuVFioFy9+L3HjegziG9bFDEMa6ig/pxMmWUNY+pWGyTGL2t6NAG+
         7AvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772801273; x=1773406073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZoBEJ7tkkeq/IYAC/TzZaRt6GXvGlu3YZe/iwn07mtE=;
        b=XLZk06Kyi1PA+DsN2sweYSsZXisKEB8Ldkj+TRBmEkvw8A2cfW//SGUOVLDO0uMU7v
         Hk5AhRPTvWux73LUvJfbmnoVBFWv1/VOX61OoNtyRKjqWTT/1TIoiJfWaeByt7qCIAne
         Adlw6NDws+r8TclEwduMZyZdQ0xx0PsmM0CPsSX7dJf+1LQN1ZlAGR/1VA+6Shsc4Z/d
         Xwt6foxivYR3B7gVp/d3FowAoTN5WmwVe9ZKtLZSy/F7HdXfuTd1IHHyOAc4kCrG6usn
         b9BsChFyqJA9smlgDj3Hg5huRFCCphHesr6kpR3CYZ3eKrnFkmcXd48DGXSSZT0R3bAg
         kM5w==
X-Forwarded-Encrypted: i=1; AJvYcCWNdRlUmF7lLor/bCcBELm7G6opaKBNftpe7jYnjVb43Euh5tKGr+vLRKyfmuCS9n22/WypcIzsMCHE4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPI42SNbNIPSNXaArY9myC9N/mEEFlgXgaRTQ/xa6Tqu8n/M3d
	ZPXiNl5LZG5Z74OtSbpV/1B/atgpM+dzxo45at1devr42nommHfxgJr0p3jgdkzSV0FDywQ/2qp
	+sDq04upRMPvBHzY3h7uZ8+RC7gy+ZHMyugD/3p8VPQ==
X-Gm-Gg: ATEYQzyVPVvPl5PhSswAW64XL7Lu5a4O6LZsvUe99bvlKuC18iBMz+lWKl+LwHpbChm
	EE3T+q9d7qqFfwE6f2KPJWtuf6iTurLjCUJRoo7sRnXY5iWn+lCf1kMRVPNVkwzIt1jeSz4mbgB
	0NEDaxiNWUk1MRCgI+FNXyMc41OUs3NExzj5ih55Gu0J9LmGF2r9beKYFMOSwxHRnUUe17Ods2W
	/3i8mskQc1QpFRhZDZe6WkwlNBfrEhQtmydMO5vqACUeG2674rVTHEFowunIp5aiSOKfTctWk5f
	7dFrx4gAGFtHGlc0IeueH+JAFIBUnHZyw0NygkyFJIFrAvRLx6xHDXpZ
X-Received: by 2002:a05:690e:e27:b0:644:6f3c:11f3 with SMTP id
 956f58d0204a3-64d14166306mr1423697d50.27.1772801273353; Fri, 06 Mar 2026
 04:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-11-andrew.jones@oss.qualcomm.com> <CAH1PCMaAiQC1+zqPeRQAFDQz6QG8DzV4FpYGhjPh1ymko_7TMg@mail.gmail.com>
 <tkdt3jh6rghrkiiwntap2f6vmesh7bve23lfpkt5mufux2cjw6@yfwqu7ba2mnm>
In-Reply-To: <tkdt3jh6rghrkiiwntap2f6vmesh7bve23lfpkt5mufux2cjw6@yfwqu7ba2mnm>
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 6 Mar 2026 20:47:42 +0800
X-Gm-Features: AaiRm52vR-ew6g12xjiqG2c5yLPepgtpowQBDchLgrx1Ddp_6ubgTEwTrdOXM9g
Message-ID: <CAH1PCMYgswKMwBzxhqL_5Ek49KC36_6pt1BCJrS7e5-8L3OnkQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 10/11] riscv: /proc/cpuinfo: Add rva23 bases to output
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Charlie Jenkins <thecharlesjenkins@gmail.com>, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_044754_783908_80BB63A5 
X-CRM114-Status: GOOD (  14.78  )
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

T24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgODowOOKAr0FNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gU2F0LCBGZWIgMjEsIDIwMjYgYXQg
MDY6NTI6MTlQTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90ZToKPiA+IE9uIEZyaSwgRmViIDYsIDIw
MjYgYXQgODoyNOKAr0FNIEFuZHJldyBKb25lcwo+ID4gPGFuZHJldy5qb25lc0Bvc3MucXVhbGNv
bW0uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT3V0cHV0IHRoZSBydmEyMyh1fHMpNjQgSVNBIGJh
c2VzIHRoYXQgdGhlIElTQSBleHRlbnNpb25zIHByb3ZpZGUgb24KPiA+ID4gbmV3ICdpc2EgYmFz
ZXMnIGxpbmVzIGJvdGggZm9yIHRoZSBMQ0Qgb2YgYWxsIGhhcnRzIGFuZCBwZXIgaGFydCwgYXMK
PiA+ID4gc2hvd24gaW4gdGhlIGV4YW1wbGUgb3V0cHV0IGJlbG93IHdoZW4gYm9vdGluZyBxZW11
IHdpdGgKPiA+ID4gLWNwdSBydmEyM3M2NCxzdjM5PW9uLHBtcD1vbjoKPiA+ID4KPiA+ID4gcHJv
Y2Vzc29yICAgICAgIDogMAo+ID4gPiBoYXJ0ICAgICAgICAgICAgOiA0Cj4gPiA+IGlzYSBiYXNl
cyAgICAgICA6IHJ2NjRpbWEgcnZhMjN1NjQKPiA+ID4gaXNhICAgICAgICAgICAgIDogcnY2NGlt
YWZkY2J2aF96aWNib21femljYm9wX3ppY2Jvel96aWNjYW1vYV96aWNjaWZfemljY2xzbV96aWNj
cnNlX3ppY250cl96aWNvbmRfemljc3JfemlmZW5jZWlfemloaW50bnRsX3ppaGludHBhdXNlX3pp
aHBtX3ppbW9wX3phNjRyc196YWFtb196YWxyc2NfemF3cnNfemZhX3pmaG1pbl96Y2FfemNiX3pj
ZF96Y21vcF96YmFfemJiX3pic196a3RfenZiYl96dmUzMmZfenZlMzJ4X3p2ZTY0ZF96dmU2NGZf
enZlNjR4X3p2ZmhtaW5fenZrYl96dmt0X3NtYWlhX3NtbnBtX3Ntc3RhdGVlbl9zc2FpYV9zc2Nv
ZnBtZl9zc25wbV9zc3RjX3N2YWRlX3N2aW52YWxfc3ZuYXBvdF9zdnBibXQKPiA+ID4gbW11ICAg
ICAgICAgICAgIDogc3YzOQo+ID4gPiBtdmVuZG9yaWQgICAgICAgOiAweDAKPiA+ID4gbWFyY2hp
ZCAgICAgICAgIDogMHgwCj4gPiA+IG1pbXBpZCAgICAgICAgICA6IDB4MAo+ID4gPiBoYXJ0IGlz
YSBiYXNlcyAgOiBydjY0aW1hIHJ2YTIzdTY0Cj4gPiA+IGhhcnQgaXNhICAgICAgICA6IHJ2NjRp
bWFmZGNidmhfemljYm9tX3ppY2JvcF96aWNib3pfemljY2Ftb2FfemljY2lmX3ppY2Nsc21femlj
Y3JzZV96aWNudHJfemljb25kX3ppY3NyX3ppZmVuY2VpX3ppaGludG50bF96aWhpbnRwYXVzZV96
aWhwbV96aW1vcF96YTY0cnNfemFhbW9femFscnNjX3phd3JzX3pmYV96ZmhtaW5femNhX3pjYl96
Y2RfemNtb3BfemJhX3piYl96YnNfemt0X3p2YmJfenZlMzJmX3p2ZTMyeF96dmU2NGRfenZlNjRm
X3p2ZTY0eF96dmZobWluX3p2a2JfenZrdF9zbWFpYV9zbW5wbV9zbXN0YXRlZW5fc3NhaWFfc3Nj
b2ZwbWZfc3NucG1fc3N0Y19zdmFkZV9zdmludmFsX3N2bmFwb3Rfc3ZwYm10Cj4gPiA+Cj4gPiA+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5j
b20+Cj4gPiA+IC0tLQo+ID4gPiArICAgICAgIC8qIFJWQTIzUzY0ICovCj4gPiA+ICsgICAgICAg
c2V0X2JpdChSSVNDVl9JU0FfRVhUX1pJRkVOQ0VJLCBleHRfbWFzayk7Cj4gPiA+ICsgICAgICAg
LyogVE9ETzogU3MxcDEzICovCj4gPiA+ICsgICAgICAgLyogU3ZiYXJlLCBTdjM5IC0tIGFzc3Vt
ZWQgKi8KPiA+ID4gKyAgICAgICBzZXRfYml0KFJJU0NWX0lTQV9FWFRfU1ZBREUsIGV4dF9tYXNr
KTsKPiA+ID4gKyAgICAgICAvKiBUT0RPOiBTc2NjcHRyLCBTc3R2ZWNkLCBTc3R2YWxhLCBTc2Nv
dW50ZXJlbncgKi8KPiA+Cj4gPiBGb3IgdGhpcywKPiA+Cj4gPiA+ICsgICAgICAgc2V0X2JpdChS
SVNDVl9JU0FfRVhUX1NWUEJNVCwgZXh0X21hc2spOwo+ID4gPiArICAgICAgIHNldF9iaXQoUklT
Q1ZfSVNBX0VYVF9TVklOVkFMLCBleHRfbWFzayk7Cj4gPiA+ICsgICAgICAgc2V0X2JpdChSSVND
Vl9JU0FfRVhUX1NWTkFQT1QsIGV4dF9tYXNrKTsKPiA+ID4gKyAgICAgICBzZXRfYml0KFJJU0NW
X0lTQV9FWFRfU1NUQywgZXh0X21hc2spOwo+ID4gPiArICAgICAgIHNldF9iaXQoUklTQ1ZfSVNB
X0VYVF9TU0NPRlBNRiwgZXh0X21hc2spOwo+ID4gPiArICAgICAgIHNldF9iaXQoUklTQ1ZfSVNB
X0VYVF9TU05QTSwgZXh0X21hc2spOwo+ID4gPiArICAgICAgIC8qIFRPRE86IFNzdTY0eGwgKi8K
PiA+ID4gKyAgICAgICAvKiBUT0RPOiBTaGEgPSBTc3N0YXRlZW4sIFNoY291bnRlcmVudywgU2h2
c3R2YWxhLCBTaHR2YWxhLCBTaHZzdHZlY2QsIFNodnNhdHBhLCBTaGdhdHBhICovCgpIaSwgZHJl
dwoKQWJvdXQgJ1NoYScsIHlvdXIgcmVhZGluZyBvZiB0aGUgcHJvZmlsZS9zcGVjLCBkbyB5b3Ug
cHJlZmVyIHRvIGRlZmluZQpTaGEgYXMgYSBfQlVORExFIG9yIGFzIGEgX1NVUEVSU0VUKCkgd2hp
Y2ggaGFzIGl0cyBvd24gaWQ/CgpJIGRlZmluZWQgaXQgYXMgX1NVUEVSU0VUKCkgaW4gbXkgcGF0
Y2ggOC84IFsxXSwgYnV0IHdpdGggdG9kYXkncyBjb2RlCnJldmlldywgSSBndWVzcyBidW5kbGUg
aXMgYSBiZXR0ZXIgZml0LiBXaGF0IGRvIHlvdSB0aGluaz8KCkJUVywgU2hhID0gSCArIDcgb3Ro
ZXJzLiBJdCBpbmNsdWRlcyBILgoKQlIsCkd1b2RvbmcKCj4gPgo+ID4gQW5kIHRoaXMsIHRoZXNl
IFRPRE9zLCBJJ2QgYmUgaGFwcHkgaWYgbXkgcGF0Y2hlcyA3IGFuZCA4IFsxXSBjYW4gYmUKPiA+
IHVzZWZ1bCBoZXJlLgo+ID4KPiA+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI2MDIwNy1pc2EtZXh0LXBhcnNlLWV4cG9ydC12MS03LWE2NGQzYThiYzIwYUByaXNjc3Rhci5j
b20vCj4gPiBbMV0KPgo+IEFic29sdXRlbHkhCj4KPiBUaGFua3MsCj4gZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
