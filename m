Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F4C982D1
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 13:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxOMmZF6pL+umzIKa1lPhb2iwDZkMjQVIcjwQ7WcXWo=; b=A5nWqmt+yQH+B6
	RDATrVMBCFnyOZBLoRs17ZSfY9b48TY7ar3+ExNWkDIT+op1pltfS4Ftio9GM67ZPUxidB8I/BhMc
	bTg0Ct7SPw2WwO+Zh3GLlXq+cPjGeJPOewHUkj9IQnqalxEzO0LMb7t9qnURzVinpmaWtZb0nt1HG
	BBdVBzbdUIs4WR+/7lJAts7OCN91NxJ+DqzmJIoA0WxS6gfJizV+/JEpUpRATfQg3Z6WE6bZ/vPou
	rbhkPtNaSTgCDXbzIvmcbrrQoI1jhlYaBRmppbQ8cLooNdF3iOMFcOL583gdFXiXoRKBnSMUdX4gS
	wvK/gWdJe0kPbvrkliAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Bjl-0000000BMGs-1FCJ;
	Thu, 17 Sep 2026 13:01:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Bji-0000000BMFY-1Uwi
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 13:01:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789650067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVKdgmi+8pcFasq/0rsQQ87M1qfknQkQcXTRjGslQCE=;
	b=dfFYNjjVX/LBiegpLu2EtL177DpFzS1f7QgSqpYhwd78h/9fuXUAd52TsFen0p7P5eywdC
	7U2msVDH6yIf7409cN7Dqp1NuB5dzMF1CjU3QIM36v2XKBXhuBvo+q5HNNKto+v0mQazKi
	eL/AMtK6biSp9MrcT6/5kjdfxK90ijA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-Bl9d6JHjN9um_ceeDEz29w-1; Thu, 17 Sep 2026 09:01:06 -0400
X-MC-Unique: Bl9d6JHjN9um_ceeDEz29w-1
X-Mimecast-MFC-AGG-ID: Bl9d6JHjN9um_ceeDEz29w_1789650065
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e6c17ec1dso9967175e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 06:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789650065; x=1790254865;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVKdgmi+8pcFasq/0rsQQ87M1qfknQkQcXTRjGslQCE=;
        b=EoPoDQNXkOHtXEDHyRkq0Wv8jcAkKPbynDROm0r6jrOfFTBjnTdti+Bb43kMW/Kd29
         5gT7FVcGJre/X6uWDuc+vCDQFKOsrdrJUu/zCtlM5qtVpUabQDWBEGAm7P7/1AfNMPkk
         TMdcd3HFgGMd37ij1nyTAXmlwLDrYbKlmUUvnuvW9Bg/vPuX4T7V56ZoUPNZtCMqebnD
         fGQeAdZRTCSzM8t257KVgXWUgbwVf3WK6sOjUaxLDLeHnQhWiGN4unlH8fRBzILUEWd5
         Ld8rMbJcDpLkVcPYt460DV/jEudLqPlieGAyHPU3qIDTkYmRRjxNChNUmfmrRFpJvnsJ
         GKpA==
X-Forwarded-Encrypted: i=1; AKwUvBwzQ+OpZPQCQv9YmDWrPbgaE9frGmyAJ1UJoCF7esjBWaq1F/GiRTumQ6jilALH2cuKXjayBWWsPF6e3A==@lists.infradead.org
X-Gm-Message-State: AFuF++mrr5pscbsLD0zYms/F7lGZE9yql1fvkJbOEd+08GttWAhXvIMd
	nVeanYeWQbXtKr1BOZdLx2hc1pIaox1L4So6Pi4dE0OxSuXYZTyrPCaoBLf/bTjHC9gcCm7eS1S
	FYj603QEEdMFBOWyuY+yiExhnL0NmYkS9GPRHlbmcNcrUR5ApotgYqhXad04qjxg2W8TCM7Zl/3
	oedIQbLXedL0zAlANEdbuB5WOlWnZD+NzniaXNhGHrw4KT9esW3hJ16oU=
X-Gm-Gg: AYBFou1bcjX+8sbF7HJGahGQ8Lwvx9MeKNRvxTpj7jBpE7AHunYqSAIVtkCfAWISQbP
	09+qpz0WyOkff+Iaz/pIK6Efi2GsptHmPyUU8UKpMsk7mryWXcwgYBimCoDSMO04CfgV+jL1HuQ
	urK7sUw4kf271rUXDAUkPdK759J3maIAB/2QsP3+s5Jpff0QP4cDuRpd/JwBe5InCAqgc3jECcq
	mwdazfJ59hvtQSFSQ==
X-Received: by 2002:a05:600c:674a:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-49fbd3cbce8mr39240655e9.22.1789650064757;
        Thu, 17 Sep 2026 06:01:04 -0700 (PDT)
X-Received: by 2002:a05:600c:674a:b0:49f:bd3c:bc1b with SMTP id
 5b1f17b1804b1-49fbd3cbce8mr39239915e9.22.1789650064232; Thu, 17 Sep 2026
 06:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260917062306.46978-1-min_halo@163.com>
In-Reply-To: <20260917062306.46978-1-min_halo@163.com>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Thu, 17 Sep 2026 09:00:52 -0400
X-Gm-Features: AcwNN1X7pTf9zf7-_RrERJT_XeD7bvpIhJKNMsqd-FNmPRKmwewQD6boNViraSM
Message-ID: <CADRr4beOuFxa4A+CCLC8MFAALKBUptLaVANvDb6ZS42m_UMrbQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: hwprobe: use _BITULL() rather than BIT() in MIPS
 vendor uapi header
To: Zongmin Zhou <min_halo@163.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Zongmin Zhou <zhouzongmin@kylinos.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w_m8ZccIzzLYeCDohosQZomAb5UG5nx0jO21Bb1i0nU_1789650065
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_060110_480416_CAEFD118 
X-CRM114-Status: GOOD (  19.94  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgMzo1NOKAr0FNIFpvbmdtaW4gWmhvdSA8bWluX2hhbG9A
MTYzLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBab25nbWluIFpob3UgPHpob3V6b25nbWluQGt5bGlu
b3MuY24+Cj4KPiBCSVQoKSBpcyBhIGtlcm5lbC1pbnRlcm5hbCBtYWNybyB0aGF0IGlzIG5vdCBh
dmFpbGFibGUgdG8gdXNlcnNwYWNlLCBidXQKPiB0aGUgTUlQUyB2ZW5kb3IgZXh0ZW5zaW9uIHVh
cGkgaGVhZGVyIHVzZXMgaXQgd2l0aG91dCBkZWZpbmluZyBvcgo+IGluY2x1ZGluZyBpdC4gQW55
IHVzZXJzcGFjZSBwcm9ncmFtIHRoYXQgaW5jbHVkZXMgdGhpcyBoZWFkZXIgYW5kIHVzZXMKPiBS
SVNDVl9IV1BST0JFX1ZFTkRPUl9FWFRfWE1JUFNFWEVDVEwgZmFpbHMgdG8gYnVpbGQuCgpNYXli
ZSBDQyBzdGFibGU/Cgo+Cj4gVXNlIF9CSVRVTEwoMCkgZnJvbSBsaW51eC9jb25zdC5oIGluc3Rl
YWQsIHdoaWNoIGtlZXBzIHRoZSB2YWx1ZSBhdCAxLAo+IHNvIHRoZXJlIGlzIG5vIEFCSSBjaGFu
Z2UuCj4KPiBGaXhlczogYmI0YjBmOGExYmNiICgicmlzY3Y6IGh3cHJvYmU6IEFkZCBNSVBTIHZl
bmRvciBleHRlbnNpb24gcHJvYmluZyIpCj4gU2lnbmVkLW9mZi1ieTogWm9uZ21pbiBaaG91IDx6
aG91em9uZ21pbkBreWxpbm9zLmNuPgoKUmV2aWV3ZWQtYnk6IEplc3NlIFRhdWJlIDxqdGF1YmVw
ZUByZWRoYXQuY29tPgoKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3ZlbmRv
ci9taXBzLmggfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS92
ZW5kb3IvbWlwcy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL3ZlbmRvci9taXBzLmgK
PiBpbmRleCBlNjVhYjI2OGIyNjUuLmEzMWMyM2FmZTc0ZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20vdmVuZG9yL21pcHMuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS91YXBpL2FzbS92ZW5kb3IvbWlwcy5oCj4gQEAgLTEsMyArMSw1IEBACj4gIC8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIFdJVEggTGludXgtc3lzY2FsbC1ub3RlICovCj4K
PiAtI2RlZmluZSBSSVNDVl9IV1BST0JFX1ZFTkRPUl9FWFRfWE1JUFNFWEVDVEwgICBCSVQoMCkK
PiArI2luY2x1ZGUgPGxpbnV4L2NvbnN0Lmg+Cj4gKwo+ICsjZGVmaW5lIFJJU0NWX0hXUFJPQkVf
VkVORE9SX0VYVF9YTUlQU0VYRUNUTCAgIF9CSVRVTEwoMCkKClRoaXMgY2hhbmdlcyB0aGUgdHlw
ZSBmcm9tIGB1bnNpZ25lZCBsb25nYCB0byBgdW5zaWduZWQgbG9uZyBsb25nYCwgdGhvdWdoIHRo
ZQp0eXBlIHdoZW4gcGFzc2VkIHRvIGBod3Byb2JlYCBpcyBgdW5zaWduZWQgbG9uZyBsb25nYCBz
byBpdCBkb2Vzbid0CmJyZWFrIGFueXRoaW5nLgoKVGhhbmtzLApKZXNzZSBUYXViZQoKPiAtLQo+
IDIuMzQuMQo+Cj4KPiBObyB2aXJ1cyBmb3VuZAo+ICAgICAgICAgICAgICAgICBDaGVja2VkIGJ5
IEhpbGxzdG9uZSBOZXR3b3JrIEFudGlWaXJ1cwo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
