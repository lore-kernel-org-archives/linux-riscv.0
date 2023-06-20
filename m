Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E3DEB64DA
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 03:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=50z5veuOESbmvmYRP8VRg5WHRlU7DgrK1YDjqmcgitI=; b=vUHH1GEhdAShD+
	tn6ouAS6FZl+fK4a+/739J0N+vGnItkbTKildZLJoB39T5/P3Rpi5c63dRMGHp7RxBPSUCaUETwlN
	iD+FdMpLZfykoOMZa178inkQneSTrq25KbCGUEmuGwyb/dJGLGWJDd+Fva4B1Faa4FPkM+R0p8O+g
	54IGXEZDanjU50l7T152GKSxunamRWsCPkBo+fhF/l7ktbD6VNEAt4Tpw+PAnJGIh6OVa7iC4jehK
	I++DeJkZMSgeVGBo1T5FfiaYIJfWAJ3Af+iQYasHlIbrJ+qlVptL5OosUY9bQjILxZmtBHdVBRoGR
	7ywK+W+4kMHO1qaJaIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBRpS-00A1us-1M;
	Tue, 20 Jun 2023 03:14:50 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBRpP-00A1uU-1w
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 03:14:49 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so5488755e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 20:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687230885; x=1689822885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uqyo5lF4AwdBTzGc1HNFwSE64aWc0p6L5cBBmEt7Tpc=;
        b=i/EUqGMyUXa9aG6pPFn0r02UAFn+MavJrb9ApbyAaak83jn+3pyNYz6C6vhJkpZjGl
         STArlSqWxB6SCQPvMmZM2ej3jZJt9X8DVNtSnmSdfRBpDYqJal4rpP6m+nEQYDdm3JaT
         N/yZzr52RjN1EeaHz38psuMSshz1wuHsGW6jCczk7dxhcod3789zhFvqHKGMiMigZ9tJ
         //XtKOTbeDzYg2SB7kmgfB7rKx+vG7HJFyCEB8852iMc9bZKj6MK6hN7Z9AjzIlzhjS2
         KgpZkQKOopwysEcRKJRNSDMtqZd1dDW2vaEIcF6IURyh5ja3LbVF87Rbg5GwaT9HR9Bn
         8kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687230885; x=1689822885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqyo5lF4AwdBTzGc1HNFwSE64aWc0p6L5cBBmEt7Tpc=;
        b=LwidjMAsLEBOWuFw0cd2HGp2KRFZ5fsN78WITCe8VCkZ8F2dFIyM/aQbfCWHwX/mfy
         BtssiQL7xr4XhigS8rO3dYz/4FFHZonWAKwIoWQKYDjYByMUSQ0kNgwv9HYDTxmEWIKj
         AaSm2v4p5mOV8d/XqeCZQ7W3btdJvnZAcZ0ve+h5SRMiJyjXCT9vXegS7VWFCp8sags6
         jjSngeWkPdSZySlqN/l9etR0/kbRGybvkoY0Phol1A2sSXxphCiQRukoCdcZ51XX4nKj
         68DszWVTivz5QxA1s1z5pZuARDZBL0gOOH/gFo7XTcE9KwvXhSjt4BER7mIpHml1Jm0J
         HqQQ==
X-Gm-Message-State: AC+VfDwBCh41o0dGXBAwIE27fcmPVDdzIlMhd3GrXM+m5DC4/vFa1RLb
	gsEPH6RwT+a0t28CW9rw1pjcRBVaki/okf+LvSboxg==
X-Google-Smtp-Source: ACHHUZ6vqEjLRW4QLCzyiLQ48x1Nfy69MYGkWlDCTNK0yoj1tcpO2ZxAZS7wqqWmeiELbNh5hu82AcEGOEWj4D1qOzs=
X-Received: by 2002:a05:6512:554:b0:4f8:66db:8235 with SMTP id
 h20-20020a056512055400b004f866db8235mr3417503lfl.39.1687230884819; Mon, 19
 Jun 2023 20:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-3-eric.lin@sifive.com>
 <20230616-revision-speed-a83dc926b334@wendy>
In-Reply-To: <20230616-revision-speed-a83dc926b334@wendy>
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 20 Jun 2023 11:14:32 +0800
Message-ID: <CAPqJEFo5genyjY7qJBaESzeppbEnTiDe9qzv98ETLhWfMZeG4A@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: sifive: Add SiFive private L2 cache PMU driver
To: Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	maz@kernel.org, chenhuacai@kernel.org, baolu.lu@linux.intel.com, 
	will@kernel.org, kan.liang@linux.intel.com, nnac123@linux.ibm.com, 
	pierre.gondois@arm.com, jgross@suse.com, chao.gao@intel.com, 
	maobibo@loongson.cn, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com, 
	Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_201447_710773_2ECF6436 
X-CRM114-Status: GOOD (  14.14  )
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

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgNjoxM+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMDI6
MzI6MDlQTSArMDgwMCwgRXJpYyBMaW4gd3JvdGU6Cj4gPiBGcm9tOiBHcmVlbnRpbWUgSHUgPGdy
ZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4KPiA+IFRoaXMgYWRkcyBTaUZpdmUgcHJpdmF0ZSBM
MiBjYWNoZSBQTVUgZHJpdmVyLiBVc2VyCj4gPiBjYW4gdXNlIHBlcmYgdG9vbCB0byBwcm9maWxl
IGJ5IGV2ZW50IG5hbWUgYW5kIGV2ZW50IGlkLgo+ID4KPiA+IEV4YW1wbGU6Cj4gPiAkIHBlcmYg
c3RhdCAtQyAwIC1lIC9zaWZpdmVfcGwyX3BtdS9pbm5lcl9hY3F1aXJlX2Jsb2NrX2J0b3QvCj4g
PiAgICAgICAgICAgICAgICAgLWUgL3NpZml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxvY2tf
bnRvYi8KPiA+ICAgICAgICAgICAgICAgICAtZSAvc2lmaXZlX3BsMl9wbXUvaW5uZXJfYWNxdWly
ZV9ibG9ja19udG90LyBscwo+ID4KPiA+ICBQZXJmb3JtYW5jZSBjb3VudGVyIHN0YXRzIGZvciAn
Q1BVKHMpIDAnOgo+ID4KPiA+ICAgICAgICAgICAgICAgIDMwMCAgICAgIHNpZml2ZV9wbDJfcG11
L2lubmVyX2FjcXVpcmVfYmxvY2tfYnRvdC8KPiA+ICAgICAgICAgICAgICAxNzgwMSAgICAgIHNp
Zml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxvY2tfbnRvYi8KPiA+ICAgICAgICAgICAgICAg
NTI1MyAgICAgIHNpZml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxvY2tfbnRvdC8KPiA+Cj4g
PiAgICAgICAgMC4wODg5MTczMjYgc2Vjb25kcyB0aW1lIGVsYXBzZWQKPiA+Cj4gPiAkIHBlcmYg
c3RhdCAtQyAwIC1lIC9zaWZpdmVfcGwyX3BtdS9ldmVudD0weDEwMDAxLwo+ID4gICAgICAgICAg
ICAgICAgIC1lIC9zaWZpdmVfcGwyX3BtdS9ldmVudD0weDQwMDEvCj4gPiAgICAgICAgICAgICAg
ICAgLWUgL3NpZml2ZV9wbDJfcG11L2V2ZW50PTB4ODAwMS8gbHMKPiA+Cj4gPiAgUGVyZm9ybWFu
Y2UgY291bnRlciBzdGF0cyBmb3IgJ0NQVShzKSAwJzoKPiA+Cj4gPiAgICAgICAgICAgICAgICAy
NTEgICAgICBzaWZpdmVfcGwyX3BtdS9ldmVudD0weDEwMDAxLwo+ID4gICAgICAgICAgICAgICAy
NjIwICAgICAgc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHg0MDAxLwo+ID4gICAgICAgICAgICAgICAg
NjQ0ICAgICAgc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHg4MDAxLwo+ID4KPiA+ICAgICAgICAwLjA5
MjgyNzExMCBzZWNvbmRzIHRpbWUgZWxhcHNlZAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEdyZWVu
dGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFcmlj
IExpbiA8ZXJpYy5saW5Ac2lmaXZlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25n
LmxpQHNpZml2ZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUu
Y29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9zb2Mvc2lmaXZlL0tjb25maWcgICAgICAgICAgICB8
ICAgOSArCj4gPiAgZHJpdmVycy9zb2Mvc2lmaXZlL01ha2VmaWxlICAgICAgICAgICB8ICAgMSAr
Cj4gPiAgZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9wbDIuaCAgICAgICB8ICAyMCArCj4gPiAg
ZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9wbDJfY2FjaGUuYyB8ICAxNiArCj4gPiAgZHJpdmVy
cy9zb2Mvc2lmaXZlL3NpZml2ZV9wbDJfcG11LmMgICB8IDY2OSArKysrKysrKysrKysrKysrKysr
KysrKysrKwo+Cj4gUGVyZiBkcml2ZXJzIHNob3VsZCBiZSBpbiBkcml2ZXJzL3BlcmYsIG5vPwo+
CgpIaSBDb25vciwKClllcywgSSBzZWUgbW9zdCBvZiB0aGUgZHJpdmVycyBhcmUgaW4gdGhlIGRy
aXZlcnMvcGVyZi4KCkJ1dCBJIGdyZXAgcGVyZl9wbXVfcmVnaXN0ZXIoKSwgaXQgc2VlbXMgbm90
IGFsbCB0aGUgcG11IGRyaXZlcnMgYXJlCmluIGRyaXZlcnMvcGVyZiBhcyBiZWxvdzoKCmFyY2gv
YXJtL21hY2gtaW14L21tZGMuYzo1MTc6ICAgcmV0ID0KcGVyZl9wbXVfcmVnaXN0ZXIoJihwbXVf
bW1kYy0+cG11KSwgbmFtZSwgLTEpOwphcmNoL2FybS9tbS9jYWNoZS1sMngwLXBtdS5jOjU1Mjog
ICAgICAgcmV0ID0KcGVyZl9wbXVfcmVnaXN0ZXIobDJ4MF9wbXUsIGwyeDBfbmFtZSwgLTEpOwou
Li4KZHJpdmVycy9kbWEvaWR4ZC9wZXJmbW9uLmM6NjI3OiByYyA9IHBlcmZfcG11X3JlZ2lzdGVy
KCZpZHhkX3BtdS0+cG11LAppZHhkX3BtdS0+bmFtZSwgLTEpOwpkcml2ZXJzL2ZwZ2EvZGZsLWZt
ZS1wZXJmLmM6OTA0OnN0YXRpYyBpbnQKZm1lX3BlcmZfcG11X3JlZ2lzdGVyKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYsCmRyaXZlcnMvZnBnYS9kZmwtZm1lLXBlcmYuYzo5Mjk6ICAgICAg
ICByZXQgPSBwZXJmX3BtdV9yZWdpc3RlcihwbXUsIG5hbWUsIC0xKTsKLi4uCmRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbXUuYzo1NDk6ICAgIHJldCA9CnBlcmZfcG11X3JlZ2lz
dGVyKCZwbXVfZW50cnktPnBtdSwgcG11X25hbWUsIC0xKTsKZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9wbXUuYzoxMTkwOiAgIHJldCA9CnBlcmZfcG11X3JlZ2lzdGVyKCZwbXUtPmJhc2UsIHBt
dS0+bmFtZSwgLTEpOwpkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bS1w
ZXJmLmM6OTA3OiAgIHJldCA9CnBlcmZfcG11X3JlZ2lzdGVyKCZldG1fcG11LCBDT1JFU0lHSFRf
RVRNX1BNVV9OQU1FLCAtMSk7CmRyaXZlcnMvaHd0cmFjaW5nL3B0dC9oaXNpX3B0dC5jOjg5NTog
ICByZXQgPQpwZXJmX3BtdV9yZWdpc3RlcigmaGlzaV9wdHQtPmhpc2lfcHR0X3BtdSwgcG11X25h
bWUsIC0xKTsKZHJpdmVycy9pb21tdS9pbnRlbC9wZXJmbW9uLmM6NTcwOiAgICAgIHJldHVybgpw
ZXJmX3BtdV9yZWdpc3RlcigmaW9tbXVfcG11LT5wbXUsIGlvbW11X3BtdS0+cG11Lm5hbWUsIC0x
KTsKZHJpdmVycy9udmRpbW0vbmRfcGVyZi5jOjMwOTogICByYyA9IHBlcmZfcG11X3JlZ2lzdGVy
KCZuZF9wbXUtPnBtdSwKbmRfcG11LT5wbXUubmFtZSwgLTEpOwouLi4KCkkganVzdCB3b25kZXJp
bmcgd2hhdCBraW5kIG9mIHBtdSBkcml2ZXJzIHNob3VsZCBiZSBpbiBkcml2ZXJzL3BlcmYKYW5k
IHdoYXQga2luZCBvZiBwbXUgZHJpdmVycyBzaG91bGQgbm90IGJlIGluIGRyaXZlcnMvcGVyZi4K
VGhhbmtzLgoKCkJlc3QgcmVnYXJkcywKRXJpYyBMaW4KCj4gQ2hlZXJzLAo+IENvbm9yLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
