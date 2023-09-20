Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9CBCE79DD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 14:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aaUo8NiK+twUo9JZYq3YG43xy5MrWY7pUKJh7RrtkPQ=; b=fZ4nwbCb5+sYX2
	4GaAD4tfo61PLN7EtWBMmxVRl2A4Tpcv0omRr2SR4Ahta2BEkeb/CCyN1E5U4Gj73LMmQ9MqJ4NO/
	DolA7JyPcQETZw3eTeLOmBTkaP+5Vry6nSvmzQSvd900e4eJg57yAMCB5eLTLn9DqqV4KoTTLriGb
	gxktf8dzOp6fr1HnCaUI4bwEraDMkEsQ/P2aykFil4hIQR/Roe5WXFPDElEMis5d2065y+1DVXDDf
	Hvqc/G2JYXiZV8xwjM+tT4Ure3T650fwZYmDx5yfgMjtNJCYeuRg1GZeqdInUoNnvaoKgyax0LCNm
	UIM7Y65k3Q9YPybXTykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyMX-003ONV-2u;
	Wed, 20 Sep 2023 14:39:34 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiyM3-003Nx0-0W
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 14:39:10 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-578a3069f1eso2084627a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695220741; x=1695825541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVjsOZJ8bggozwjwCYWOh6I0B4C7rlCVK2zz6fw/jxM=;
        b=JSiW3KGnjmqIij6KEazfc4Fj/2vf540pcJvJUI1B7GjZ/uP1diuUXP0VxBhg3iYzLs
         F/JJTG1z/CzKiMFAaNRSpdaUIsJR/Cc4S1v3rnyf5IbnJAxwOhRKa2c2Tl3hAi7z5gFw
         Lg7pzcZWSrNcZQQhR0h6wTeFQRU7bj/bsHVjoMj0lK9fZZbycQD5whcUGOI1rKdV6cOx
         jtR0803I6ZLTx2rZMBUuiwWlZqcdFb7B5IkRQ9w77OWeY+ViVIDNMEnT0NmASchdyg0F
         Arxr/bTPPfDd7O81rk8RasLEiKM3xvhgWHO6l3tmU+eT/bdZaeGF5Py564VjVqN5Tvec
         C5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695220741; x=1695825541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVjsOZJ8bggozwjwCYWOh6I0B4C7rlCVK2zz6fw/jxM=;
        b=nlxnRdxCXB818Wty3u5TazgclZU2bKDe81rsX3i/V5lC/ldxdUxTfRSNG2BzOpkEaf
         rcWHcd9Bxtrl+5rTaD42C+rqIyhjxBQLxEPg7MFG06eLjfQ0X4g7K5kEne0Wx1usIqhC
         xe+JUfvp6PS6gvhKdFle8XxpeyPeMFvtBkI4CanKR1wboqAUGdBUYQZfsWAauKSvhDdX
         AGz7dSC7cpYSF2H3o6dVRSTi8CHLnOtg60wFwmOX1aKVpuD2ofrZQEbTcRhLenLbFxDq
         T/Odw99SkgG6o39OVDinjkW9j42FJM4oe5174/f06mnEC0lXmBxa88jgsVDzYXK0cLBx
         O3Sw==
X-Gm-Message-State: AOJu0YzQKeVH9BZ3wELFrr39InGhQRlhpg6nxZTiywp3gqrCxoMVgY8p
	sZ3adx5yvv23Wd2a/EPlp37J4UnTUECA6N9tklY7YcOWwUSfIfdM5Zs=
X-Google-Smtp-Source: AGHT+IEr2Lac4PW5MEs8w2glHD2rv5IneEoO2/iHMRaS9AnyeCZ7nvHVBgJDCdg7GwNcp3Cwv5ypWCr2gQmimN6JYbQ=
X-Received: by 2002:a17:90b:38d2:b0:271:bc40:5097 with SMTP id
 nn18-20020a17090b38d200b00271bc405097mr2554985pjb.30.1695220741330; Wed, 20
 Sep 2023 07:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <66b988f0-39fc-2ed3-8f38-151d6a3c9e52@linaro.org>
 <IA1PR20MB49536BFE1254ADEE0E795A26BBF9A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20230920-8503c6365655d3ef3dadfd53@fedora>
In-Reply-To: <20230920-8503c6365655d3ef3dadfd53@fedora>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 20 Sep 2023 20:08:49 +0530
Message-ID: <CAK9=C2WWzc_M49-S+Gi509a6-gk3-89sAZn-ZCRhsQc4JwUpoQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, 
	evicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_073903_378616_B7F0C0AE 
X-CRM114-Status: GOOD (  23.50  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgNjoyOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAyMCwgMjAyMyBhdCAwODo0MDowN1BNICsw
ODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+ID4gPk9uIDIwLzA5LzIwMjMgMTQ6MTUsIElub2No
aSBBbWFvdG8gd3JvdGU6Cj4gPiA+Pj4gT24gMjAvMDkvMjAyMyAwODozOSwgQ2hlbiBXYW5nIHdy
b3RlOgo+ID4gPj4+PiBGcm9tOiBJbm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAb3V0bG9vay5jb20+
Cj4gPiA+Pj4+Cj4gPiA+Pj4+IEFkZCB0d28gbmV3IGNvbXBhdGlibGUgc3RyaW5nIGZvcm1hdHRl
ZCBsaWtlIGBDOXh4LWNsaW50LXh4eGAgdG8gaWRlbnRpZnkKPiA+ID4+Pj4gdGhlIHRpbWVyIGFu
ZCBpcGkgZGV2aWNlIHNlcGFyYXRlbHksIGFuZCBkbyBub3QgYWxsb3cgYzkwMC1jbGludCBhcyB0
aGUKPiA+ID4+Pgo+ID4gPj4+IFdoeT8KPiA+ID4+Pgo+ID4gPj4KPiA+ID4+IElmIHVzZSB0aGUg
c2FtZSBjb21wYXRpYmxlLCBTQkkgd2lsbCBwcm9jZXNzIHRoaXMgdHdpY2UgaW4gYm90aCBpcGkg
YW5kCj4gPiA+PiB0aW1lciwgdXNlIGRpZmZlcmVudCBjb21wYXRpYmxlIHdpbGwgYWxsb3cgU0JJ
IHRvIHRyZWF0IHRoZXNlIGFzIGRpZmZlcmVudC4KPiA+ID4+IEFGQUlLLCB0aGUgYWNsaW50IGlu
IFNCSSB1c2UgdGhlIHNhbWUgY29uY2VwdHMsIHdoaWNoIG1ha2UgaGFyZCB0byB1c2UgdGhlCj4g
PiA+PiBzZWNvbmQgcmVnaXN0ZXIgcmFuZ2UuIEkgaGF2ZSBleHBsYWluZWQgaW4gYW5vdGhlciBy
ZXNwb25zZS4KPiA+ID4KPiA+ID5XaGF0IGlzIGEgU0JJPyBMaW51eCBkcml2ZXI/IElmIHNvLCB3
aHkgc29tZSBpbnRlcm1lZGlhdGUgTGludXggZHJpdmVyCj4gPiA+Y2hvaWNlIHNob3VsZCBhZmZl
Y3QgYmluZGluZ3M/Cj4gPiA+QmVzdCByZWdhcmRzLAo+ID4gPktyenlzenRvZgo+ID4gPgo+ID4K
PiA+IFNCSSAoU3VwZXJ2aXNvciBCaW5hcnkgSW50ZXJmYWNlKSBpcyBkZWZpbmVkIGJ5IHJpc2N2
LCB3aGljaCBpcyBhbiBpbnRlcmZhY2UKPiA+IGJldHdlZW4gdGhlIFN1cGVydmlzb3IgRXhlY3V0
aW9uIEVudmlyb25tZW50IChTRUUpIGFuZCB0aGUgc3VwZXJ2aXNvci4gVGhlCj4gPiBkZXRhaWxl
ZCBkb2N1bWVudGF0aW9uIGNhbiBiZSBmb3VuZCBpbiBbMV0uCj4gPgo+ID4gVGhlIGltcGxlbWVu
dCBvZiBTQkkgbmVlZHMgZmR0IGluZm8gb2YgdGhlIHBsYXRmb3JtLCB3aGljaCBpcyBwcm92aWRl
ZCBieQo+ID4ga2VybmVsLiBTbyB3ZSBuZWVkIGEgZHQtYmluZGluZ3MgZm9yIHRoZXNlIGRldmlj
ZXMsIGFuZCB0aGVzZSB3aWxsIGJlCj4gPiBwcm9jZXNzZWQgYnkgU0JJLgo+ID4KPiA+IFsxXSBo
dHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jCj4KPiBZZWFoLCB0
aGlzIGlzIHRoZSB1bmZvcnR1bmF0ZSBwcm9ibGVtIG9mIGhhbGYtYmFrZWQgYmluZGluZ3MgKElN
TykKPiBlbmRpbmcgdXAgaW4gT3BlblNCSSAod2hpY2ggbGlrZWx5IG1lYW5zIHRoZXkgYWxzbyBl
bmRlZCB1cCBpbiBRRU1VKS4KPiBUaGlzIFQtSGVhZCBzdHVmZiBpcyBjb21pbmcgYWNyb3NzIG91
ciAobWV0YXBob3JpY2FsKSBkZXNrcywgc28gd2UgYXJlCj4gb2J2aW91c2x5IGdvaW5nIHRvIHRy
eSB0byBkbyB0aGluZ3MgY29ycmVjdGx5LiBJIG1heSBlbmQgdXAgc3BlYWtpbmcgdG8KPiBBbnVw
IGxhdGVyIHRvZGF5LCBpZiBJIGRvIEkgd2lsbCBwb2ludCBoaW0gYXQgdGhpcyB0aHJlYWQgKGlm
IGhlIGhhc24ndAo+IHNlZW4gaXQgYWxyZWFkeSkuCgpSSVNDLVYgQUNMSU5UIGlzIG9uZSBvZiB0
aG9zZSB1bmZvcnR1bmF0ZSBub24tSVNBIHNwZWNzIChsaWtlClNpRml2ZSBQTElDKSB3aGljaCBp
cyBpbXBsZW1lbnRlZCBieSB2YXJpb3VzIG9yZ2FuaXphdGlvbnMgYnV0Cm5vdCBvZmZpY2lhbGx5
IHJhdGlmaWVkIGJ5IFJWSS4KClRoZSBTaUZpdmUgQ0xJTlQgaGFzIGZsZXhpYmlsaXR5IHJlbGF0
ZWQgbGltaXRhdGlvbnMgd2hpY2ggbWFrZXMgaXQKbm90IHVzZWZ1bCBmb3IgbXVsdGktc29ja2V0
IGFuZCBtdWx0LWRpZSBzeXN0ZW1zLiBUaGUgU2lGaXZlIENMSU5UCmlzIGFsc28gbm90IHVzZWZ1
bCBmb3Igc3lzdGVtcyB3aXRoIEFJQSBiZWNhdXNlIHdpdGggQUlBIE0tbW9kZSBoYXMKYSBuZXcg
d2F5IG9mIGRvaW5nIE0tbW9kZSBJUElzLiBEdWUgdG8gdGhpcyByZWFzb25zLCB0aGUgUklTQy1W
CkFDTElOVCBzcGVjIGJyZWFrcyBkb3duIHRyYWRpdGlvbmFsIFNpRml2ZSBDTElOVCBpbnRvIHR3
byBzZXBhcmF0ZQpkZXZpY2VzIG5hbWVseSBtdGltZXIgYW5kIG1zd2kuIFRoaXMgYWxsb3dzIHBs
YXRmb3JtcyB0byBpbXBsZW1lbnQKb25seSB0aGUgcmVxdWlyZWQgc2V0IG9mIGRldmljZXMuIFRo
ZSBtdGltZXIgYXMgZGVmaW5lZCBieSB0aGUgQUNMSU5UCnNwZWNpZmljYXRpb25zIGFsc28gYWxs
b3dzIHBsYXRmb3JtcyB0byBwbGFjZSBtdGltZSBhbmQgbXRpbWVjbXAKcmVnaXN0ZXJzIGF0IGRp
ZmZlcmVudCBsb2NhdGlvbnMuCgpSZWZlciwgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2
LWFjbGludC9ibG9iL21haW4vcmlzY3YtYWNsaW50LmFkb2MKCldlIG5lZWQgYSBzZXBhcmF0ZSBE
VCBiaW5kaW5ncyBkb2N1bWVudCBmb3IgQUNMSU5UIE1USU1FUgphbmQgQUNMSU5UIE1TV0kgYmVj
YXVzZSB0aGVzZSBhcmUgc2VwYXJhdGUgZGV2aWNlcy4gVGhlClNvcGhnbyBzZzIwNDIgU29DIHNo
b3VsZCBhZGQgdGhlaXIgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMKY29tcGF0aWJsZSBzdHJpbmdz
IGluIHRoaXMgZG9jdW1lbnQuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
