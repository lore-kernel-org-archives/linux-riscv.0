Return-Path: <SRS0=5eSd=YZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD155CA9ECB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2019 02:47:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D096208CB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2019 02:47:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pkt2Rxm6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ftKx2W17";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMa5u7Ao"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D096208CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClSZCRR42x4ZXM1EHS7RodlfHocwWwICRpWJkCOESOc=; b=Pkt2Rxm6AGHKjC
	7BCq38AEvHdrgjYTChaeBhW/JpBoo1Dda1DQ50Nhd8ZkQavChU5WxjsXXrbWH1aICNJh0hnxHgump
	lI9e4F26RVNcMbLOE2UV19TkMSIOMJbXsMa5Dgupu6i+bY5IkM+LuA+SEVvBH2xPmGFcqIiMjrwIy
	vf6x78eiRb5QB9NTCMuitM5pMXEEn5PTbO3VTmA8Q0QKWW7kD+MILUIgt3BZXdz6kjlTuc/TuXUTI
	21o0kiWd3Uu5Jm23v/veDdgcy/XQsJVsC7u+JqmLSy2otD0s5IAM8lFuRBesF6Oy+bw7Pco4Ptecg
	1uRvJUYjAKTXVcn+Shtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQMyF-0007jH-I6; Fri, 01 Nov 2019 02:47:27 +0000
Received: from [85.118.1.10] (helo=casper.infradead.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQMyD-0007WJ-GR
 for linux-riscv@bombadil.infradead.org; Fri, 01 Nov 2019 02:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PASzEIpgisfcWQDC8L4j4ToQF0VbheMgpqommbfd01k=; b=ftKx2W17+Q92aRoZuOG5yaoURH
 D/TMBTOJ/+zzp8WvGLN/UAzpOS5YU50VH2aW/qcYQ1slF/lj1rrNXgQYpNKdazx8tlRAddL7vXVl2
 ACxUvo1kbB7E0sKznDNA6UE5SBbmOqH2WvUjyVFT9XSMrXGOll6ZdTXvxq4Lm/IZTKKRas9IpCGoT
 7bH0e2o71hFHMndbUnjDrV+I/xtNAl7u/Azztc0CJvleRD1fX2B7keWt067WTWY4o08zSDs4hkGeb
 zkBMrdKKjFOZKQfUUUpcysSJOnt0N4Vje8y5sDYsHB3BVx7lq1FJ7t3q/pStNoz3MTvAf+YUo6sdL
 Gjg8WszQ==;
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQMvg-0003DX-G7
 for linux-riscv@lists.infradead.org; Fri, 01 Nov 2019 02:44:50 +0000
Received: by mail-lj1-x244.google.com with SMTP id s4so8716759ljj.10
 for <linux-riscv@lists.infradead.org>; Thu, 31 Oct 2019 19:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PASzEIpgisfcWQDC8L4j4ToQF0VbheMgpqommbfd01k=;
 b=IMa5u7AoWjoY3hOc6/1R23WCdWnSJ75sDfC11wdE4mIpvGhrgdZk3d+y7s5qEobOqu
 ij0slq22e6xXJxcuQX0gUbMmvJWv8itNUCGtrK6pmkvA6uP1lx1aA7PZKXbZ/sxhBniz
 f+mY2ZAPZWkwIEUOY+jfXu4WypHEVWDJFVHf0jR0vmvcJ2pvDteJzDN3kCfplasV5wBg
 aAH24j8rLbzUD6d0ZMDUYDCv3E5SU0WRZMESfrDw1aydHJe/+xgH9pCEhn858YHzHfrT
 nnFNIQm16ZNyeYXVvjUDruqEL0S+8B3yMEWDo5DO3tuRPr2Z1cCOH+L535XgeU+DU0lN
 28zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PASzEIpgisfcWQDC8L4j4ToQF0VbheMgpqommbfd01k=;
 b=IbByYIQR55VRWpMe6aYuepknUr2V1DIxQ/x0/ctCbbtVcCt+Z3EUV3+t2Qkb2B9yVh
 +YYuCDIAnw9dG42T5istC90o2yBSNO2fPjoYSx7j5P+i2jdvdp3CTOlZiwNHiyPkn/r7
 waPwO7by+eAx8ti5F1f/64KrXoZTNLpv7/OJRnkge5gtSm4WDI1aM4HnqVpz6b0VnYtS
 XvFf1ks3mpYqJSHc37o/bydaNMFgQdeUTDbtmm3rhw7+os7GOrmMSEIUdFgo4OKXSJN1
 GdkK2bSCCcge0EXSjENL7MtqjwV2sYRyGuM41XjD01NedjQoOsEsvQlpnfqa59N6oL0o
 vWRg==
X-Gm-Message-State: APjAAAX+U04WWJ3sYoXxL1DG1YjPccAE7P1yXy1tgyinrv1mUNdkRKjZ
 21jHDqmjPaUtJnJ49okL90ZXeKLmkDk4uAVTRr0=
X-Google-Smtp-Source: APXvYqxCQJmg76DTsmub5138VbTiILnGPxk9iG6MGyvjslofZPaI43c0sAjNotk7JflRDBvVc1W+qJTYE8tOovXlJ6M=
X-Received: by 2002:a2e:814b:: with SMTP id t11mr6600766ljg.20.1572576132633; 
 Thu, 31 Oct 2019 19:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <1572574830-11181-1-git-send-email-zong.li@sifive.com>
In-Reply-To: <1572574830-11181-1-git-send-email-zong.li@sifive.com>
From: Zong Li <zongbox@gmail.com>
Date: Fri, 1 Nov 2019 10:42:01 +0800
Message-ID: <CA+ZOyajsnoN8KdvqFi9dvgC1s-1Zs7kE-s7-jFhYr0WHejSkQA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Use PMD_SIZE to repalce PTE_PARENT_SIZE
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191101_024448_581093_30FD8137 
X-CRM114-Status: GOOD (  16.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Wm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPiDmlrwgMjAxOeW5tDEx5pyIMeaXpSDpgLHkupQg
5LiK5Y2IMTA6MjDlr6vpgZPvvJoKPgo+IFRoZSBQTURfU0laRSBpcyBlcXVhbCB0byBQR0RJUl9T
SVpFIHdoZW4gX19QQUdFVEFCTEVfUE1EX0ZPTERFRCBpcwo+IGRlZmluZWQuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yv
bW0vaW5pdC5jIHwgOCArKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIv
YXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRleCA1NzM0NjNkLi45YTliMDFhIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBA
QCAtMjczLDcgKzI3Myw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjcmVhdGVfcG1kX21hcHBpbmco
cG1kX3QgKnBtZHAsCj4gICNkZWZpbmUgZ2V0X3BnZF9uZXh0X3ZpcnQoX19wYSkgICAgICAgIGdl
dF9wbWRfdmlydChfX3BhKQo+ICAjZGVmaW5lIGNyZWF0ZV9wZ2RfbmV4dF9tYXBwaW5nKF9fbmV4
dHAsIF9fdmEsIF9fcGEsIF9fc3osIF9fcHJvdCkgICAgIFwKPiAgICAgICAgIGNyZWF0ZV9wbWRf
bWFwcGluZyhfX25leHRwLCBfX3ZhLCBfX3BhLCBfX3N6LCBfX3Byb3QpCj4gLSNkZWZpbmUgUFRF
X1BBUkVOVF9TSVpFICAgICAgICAgICAgICAgIFBNRF9TSVpFCj4gICNkZWZpbmUgZml4bWFwX3Bn
ZF9uZXh0ICAgICAgICAgICAgICAgIGZpeG1hcF9wbWQKPiAgI2Vsc2UKPiAgI2RlZmluZSBwZ2Rf
bmV4dF90ICAgICAgICAgICAgIHB0ZV90Cj4gQEAgLTI4MSw3ICsyODAsNiBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgY3JlYXRlX3BtZF9tYXBwaW5nKHBtZF90ICpwbWRwLAo+ICAjZGVmaW5lIGdldF9w
Z2RfbmV4dF92aXJ0KF9fcGEpICAgICAgICBnZXRfcHRlX3ZpcnQoX19wYSkKPiAgI2RlZmluZSBj
cmVhdGVfcGdkX25leHRfbWFwcGluZyhfX25leHRwLCBfX3ZhLCBfX3BhLCBfX3N6LCBfX3Byb3Qp
ICAgICBcCj4gICAgICAgICBjcmVhdGVfcHRlX21hcHBpbmcoX19uZXh0cCwgX192YSwgX19wYSwg
X19zeiwgX19wcm90KQo+IC0jZGVmaW5lIFBURV9QQVJFTlRfU0laRSAgICAgICAgICAgICAgICBQ
R0RJUl9TSVpFCj4gICNkZWZpbmUgZml4bWFwX3BnZF9uZXh0ICAgICAgICAgICAgICAgIGZpeG1h
cF9wdGUKPiAgI2VuZGlmCj4KPiBAQCAtMzE3LDkgKzMxNSw5IEBAIHN0YXRpYyB1aW50cHRyX3Qg
X19pbml0IGJlc3RfbWFwX3NpemUocGh5c19hZGRyX3QgYmFzZSwgcGh5c19hZGRyX3Qgc2l6ZSkK
PiAgICAgICAgIHVpbnRwdHJfdCBtYXBfc2l6ZSA9IFBBR0VfU0laRTsKPgo+ICAgICAgICAgLyog
VXBncmFkZSB0byBQTUQvUEdESVIgbWFwcGluZ3Mgd2hlbmV2ZXIgcG9zc2libGUgKi8KClRoaXMg
Y29tbWVudCBzaG91bGQgYmUgZml4ZWQgYWxzby4gdGhpcyBwYXRjaCBuZWVkcyB0aGUgbmV4dCB2
ZXJzaW9uLgoKPiAtICAgICAgIGlmICghKGJhc2UgJiAoUFRFX1BBUkVOVF9TSVpFIC0gMSkpICYm
Cj4gLSAgICAgICAgICAgIShzaXplICYgKFBURV9QQVJFTlRfU0laRSAtIDEpKSkKPiAtICAgICAg
ICAgICAgICAgbWFwX3NpemUgPSBQVEVfUEFSRU5UX1NJWkU7Cj4gKyAgICAgICBpZiAoIShiYXNl
ICYgKFBNRF9TSVpFIC0gMSkpICYmCj4gKyAgICAgICAgICAgIShzaXplICYgKFBNRF9TSVpFIC0g
MSkpKQo+ICsgICAgICAgICAgICAgICBtYXBfc2l6ZSA9IFBNRF9TSVpFOwo+Cj4gICAgICAgICBy
ZXR1cm4gbWFwX3NpemU7Cj4gIH0KPiAtLQo+IDIuNy40Cj4KPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
