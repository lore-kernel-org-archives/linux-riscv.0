Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF4ECE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8KAvKfTcj/UnrUA/PSe7BXT2Rx2swrk9cGigRaaF78=; b=Cy17K8T1F063R1
	72pWXU0RfCtHnjdnTKzmpchLUG7KA7ykn5rLVw0fd54Oam9xUC5iweQf859GseKYZXiLrAcC6FS7N
	4UawopKqJNm7nJzRGaFsrHLfTKQaHmKK7hejglbCV9RFkvAsbFGhtxRnXuzgCL1EUHl8dICpxKDDu
	Rh5+f00u8OXHfajWUTKHt3DWAMMmxO9SZ3Kp68TFBFW4bPccrabjnhdBykRlmQaW4jPTkgCEo9+NJ
	CMhY+hb9czvbs7TvDP2n/PXcMWz/4EBPm/RQSXCNu43hSuzvjpHph5EaEBHAVdfg4fRcju02ZvbtM
	nmPqf6EVCJrnMnSihCuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirnC-0029bX-2X;
	Wed, 20 Sep 2023 07:38:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirnA-0029ao-0z
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:38:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9EF31B81ACB
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDC0C433C7
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695195514;
	bh=4NlRl7tmZMlfASt9XMRrxPS/AlpbPNnFQnsAF66CTlA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fbOv5Ga5pOr8bEBqOsDmwv+qo+NkSh7hSrqE9C/EQnXiA7C5v9Cy5dCGE8jSKmdvZ
	 O/v5Zatn42gteY9WxSpqTymCnb+ixM0XX4DLLgN1Fxilum3hjw9q7y+mgHeszDM7Bs
	 ZPb0wsc18lBuK3JclBPaONYI54BGmI598o12WgsYaHKLv6501kgIK9onNvHdK3ax4u
	 y7maDMUZ1dknByW8d3NcpRbqLW41yrtOQ4uPfFsqhe/VjGoK20ddyGNieIS7+YSb54
	 BVb4lyyQbfTv4ycjdl/l3GGArDJ9MdgZAPCHSQxqyEqih+GGENIEgbmA17AmTbRAXc
	 YzzS4LEzKCnRQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9ad8bf9bfabso857223966b.3
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:38:34 -0700 (PDT)
X-Gm-Message-State: AOJu0YzJJdc+hDI3Dn27iQFfJM3MoLbXMrz7TztshVfWUvmUTg3zoHAc
	GIn/kZZFceEPPCvuEWh2zmaF0MB7yL+Oh+F7og0=
X-Google-Smtp-Source: AGHT+IGLN8EgkEV3ltTwt+G6aGQQKtZQniuqxBAE1MIL3EKm4G4pYEaRbZGEIQOkUwjSiwQT7EJF3oIY42lCYaKF3b0=
X-Received: by 2002:a17:906:3694:b0:99b:627b:e96d with SMTP id
 a20-20020a170906369400b0099b627be96dmr1221708ejc.44.1695195512786; Wed, 20
 Sep 2023 00:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <dbd7d823a73d8a9484efcd55f6616f5392daf608.1695189879.git.wangchen20@iscas.ac.cn>
In-Reply-To: <dbd7d823a73d8a9484efcd55f6616f5392daf608.1695189879.git.wangchen20@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 15:38:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRd=G+-zzFXEF+XUT3vLtfeHJknODoTWUVP36hy-7MoRg@mail.gmail.com>
Message-ID: <CAJF2gTRd=G+-zzFXEF+XUT3vLtfeHJknODoTWUVP36hy-7MoRg@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: vendor-prefixes: add milkv/sophgo
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_003836_667551_1B36F889 
X-CRM114-Status: GOOD (  13.73  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjozN+KAr1BNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgbmV3IHZlbmRvciBzdHJpbmdzIHRvIGR0IGJpbmRpbmdz
Lgo+IFRoZXNlIG5ldyB2ZW5kb3Igc3RyaW5ncyBhcmUgdXNlZCBieQo+IC0gU29waGdvIFNHMjA0
MiBTb0MgWzFdCj4gLSBNaWxrLVYgUGlvbmVlciBib2FyZCBbMl0sIHdoaWNoIHVzZXMgU0cyMDQy
IGNoaXAuCj4KPiBbMV06IGh0dHBzOi8vZW4uc29waGdvLmNvbS9wcm9kdWN0L2ludHJvZHVjZS9z
ZzIwNDIuaHRtbAo+IFsyXTogaHR0cHM6Ly9taWxrdi5pby9waW9uZWVyCj4KPiBBY2tlZC1ieTog
WGlhb2d1YW5nIFhpbmcgPHhpYW9ndWFuZy54aW5nQHNvcGhnby5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hlbiBXYW5nIDx3YW5nY2hlbjIwQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgfCA0ICsrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+IGluZGV4IDU3
MzU3OGRiOTUwOS4uZmNjYTllMDcwYTlhIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAo+IEBAIC04NjMsNiAr
ODYzLDggQEAgcGF0dGVyblByb3BlcnRpZXM6Cj4gICAgICBkZXNjcmlwdGlvbjogTWlrcm9FbGVr
dHJvbmlrYSBkLm8uby4KPiAgICAiXm1pa3JvdGlrLC4qIjoKPiAgICAgIGRlc2NyaXB0aW9uOiBN
aWtyb1Rpawo+ICsgICJebWlsa3YsLioiOgo+ICsgICAgZGVzY3JpcHRpb246IE1pbGtWIFRlY2hu
b2xvZ3kgQ28uLCBMdGQKPiAgICAiXm1pbmlhbmQsLioiOgo+ICAgICAgZGVzY3JpcHRpb246IE1p
bmlhbmQgVGVjaAo+ICAgICJebWluaXgsLioiOgo+IEBAIC0xMjczLDYgKzEyNzUsOCBAQCBwYXR0
ZXJuUHJvcGVydGllczoKPiAgICAgIGRlc2NyaXB0aW9uOiBTb2xvbW9uIFN5c3RlY2ggTGltaXRl
ZAo+ICAgICJec29ueSwuKiI6Cj4gICAgICBkZXNjcmlwdGlvbjogU29ueSBDb3Jwb3JhdGlvbgo+
ICsgICJec29waGdvLC4qIjoKPiArICAgIGRlc2NyaXB0aW9uOiBTb3BoZ28gVGVjaG5vbG9neSBJ
bmMuCj4gICAgIl5zb3VyY2VwYXJ0cywuKiI6Cj4gICAgICBkZXNjcmlwdGlvbjogU291cmNlIFBh
cnRzIEluYy4KPiAgICAiXnNwYW5zaW9uLC4qIjoKPiAtLQo+IDIuMjUuMQo+ClJldmlld2VkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
