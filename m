Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102F4C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 10:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1ausoG1VpT3kou4oxMmKCVSECjnY8hXrC3xOX9//V0=; b=fp3xf/8uMn8qzx
	SHsqG9ZFhc/3ChXKmL53HhGoJF8nTMKNHynbO7v2tK8v0VSpXZ42p5MTgiuEg0a7z5D6S96Om6iFi
	nUN4XKb6/hOJJxGEqtSycU+0Wm7+/fDonuHxhGSWYT8WJLzWlzMK3ljWpDE2+0+UK58hbMoNbgAxF
	NW7l//TjPNlyQECPsBcuqwzpCcSMmIF0xuSWv4Yp7wM0iJE9jcxZbjs/LGmEF8vFq7+d/B5n09lOQ
	R41h6TJo04ByB/N9cRlX8RlugwtRWjVW2kzLS688XlhbXpKzab+gKdLBs+on07bTQ5s6rqdmQnq9Z
	tDsx11HgfpdVrz94L7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6rzQ-00Ao8I-IM; Mon, 10 Jan 2022 10:33:24 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6rzN-00Ao6K-2O
 for linux-riscv@lists.infradead.org; Mon, 10 Jan 2022 10:33:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h10so15679671wrb.1
 for <linux-riscv@lists.infradead.org>; Mon, 10 Jan 2022 02:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ux09BdvBfy5otBeH83si9wqeKjp8gHNJ9Zt3Er9zFxE=;
 b=uXYTgRqNTmPW/huo6KEYGPOM4ISUhPLQBff/OQu1mryKVB8bfEA9SMGpAzs8WENMSr
 fuyNQuevmAkNaM1DIBs9B5ePOxvg6kIQUNCfH4GFaXO0BAGjC6GgZqB5Fa+1alU087Z8
 P+Vm7f+/pCXvExKs6et7iTpYsEWdwEv98+Oj1Ut/3CLURBSYQn8BBRcI2i4huO0Nyhig
 jAh0PzBKkTaun4SPlD9rbsylUIDBnG5CqjHmWput0432gybnuR4m4QvkFs0RSDDvlb27
 XDCH8P8FAS/PXCOIbQZcLNaqtzSULbKkPi6r/pLPsz//6OCjXG/9tpB7zbwtR5B9wtSf
 7hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ux09BdvBfy5otBeH83si9wqeKjp8gHNJ9Zt3Er9zFxE=;
 b=cnv/mXlxK4jS9elahMCjXuCFfhbgOQHELkET/vktk4/mBJM1cnmc6mkb7eOSZ2j9l9
 YVGSi+xfGVD+wa2If+VePY/SU8paSUvxkRsf0Cl1ET1mwaEMWAm1YriPPm7MxmmPcGIw
 DXAOKSsI9cA1iix9YXgpe29KGjYBNnQYqmTjqcn76a8WI9BeBAWLR3KQSb+1zsn4GF3F
 oKUvSr9UIxbf0TOLf4GEvu1PLz0YFmn3Evn8njvW3IYX1KTprBEcU6Iut2uj+Uywjfuo
 UVxHqd/KAHWwE/yirKgEk8lFrENY7rdp71WhI1Ys0XbtqcNH+Rhhghl/wjPAGMRN2dS9
 c4gg==
X-Gm-Message-State: AOAM533coG3iMXROFid4/WdFr4mlvcIDyY77Y+gm4VE4+VX41FhLtfp0
 fBL1arkaVxA1wjQQ9sSIGJ4w1w==
X-Google-Smtp-Source: ABdhPJzMfF4X4m8rqBSMupPmJ6wMSv1HcNXmy8LWfHPif6guaPAHOVr+QYANksWrPaZREcLyZVwvuQ==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr63672846wrq.273.1641810799760; 
 Mon, 10 Jan 2022 02:33:19 -0800 (PST)
Received: from google.com ([31.124.24.179])
 by smtp.gmail.com with ESMTPSA id ba18sm6324269wrb.40.2022.01.10.02.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 02:33:19 -0800 (PST)
Date: Mon, 10 Jan 2022 10:33:23 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michal Simek <michal.simek@xilinx.com>, Suman Anna <s-anna@ti.com>,
 - <patches@opensource.cirrus.com>, John Crispin <john@phrozen.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
Message-ID: <YdwLc2ZTERBoXgxR@google.com>
References: <20220107031905.2406176-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107031905.2406176-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_023321_153250_B3F18E04 
X-CRM114-Status: GOOD (  11.21  )
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

T24gVGh1LCAwNiBKYW4gMjAyMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+ICdpbnRlcnJ1cHQtcGFy
ZW50JyBpcyBuZXZlciByZXF1aXJlZCBhcyBpdCBjYW4gYmUgaW4gYSBwYXJlbnQgbm9kZSBvciBh
Cj4gcGFyZW50IG5vZGUgaXRzZWxmIGNhbiBiZSBhbiBpbnRlcnJ1cHQgcHJvdmlkZXIuIFdoZXJl
IGV4YWN0bHkgaXQgbGl2ZXMgaXMKPiBvdXRzaWRlIHRoZSBzY29wZSBvZiBhIGJpbmRpbmcgc2No
ZW1hLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4g
LS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vdG9zaGliYSxncGlvLXZpc2NvbnRp
LnlhbWwgIHwgMSAtCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21haWxib3gvdGksb21hcC1t
YWlsYm94LnlhbWwgICAgIHwgOSAtLS0tLS0tLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21mZC9jaXJydXMsbWFkZXJhLnlhbWwgfCAxIC0KCkFja2VkLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0
L2xhbnRpcSxldG9wLXh3YXkueWFtbCAgICAgICAgfCAxIC0KPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L2xhbnRpcSx4cngyMDAtbmV0LnlhbWwgICAgICAgfCAxIC0KPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcGNpL3NpZml2ZSxmdTc0MC1wY2llLnlhbWwgICAgICAgfCAxIC0KPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL3hpbGlueC12ZXJzYWwtY3BtLnlhbWwgICAgICAg
fCAxIC0KPiAgNyBmaWxlcyBjaGFuZ2VkLCAxNSBkZWxldGlvbnMoLSkKCi0tIApMZWUgSm9uZXMg
W+adjueQvOaWr10KUHJpbmNpcGFsIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2Vz
CkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cg
TGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
