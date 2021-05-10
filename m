Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B31C43140
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 11:23:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9D9E60FDC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 11:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9D9E60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qti28ZMt1W+4nYsNA/rZscs1umFz7b3CXPtthj7qU9Q=; b=WWIoXH/p1uRQ79ChnAlR7Tm3v
	dmL/oT/9jELkPKn5W8yQLb6UvPbZEAnd9ysQsahQZeDG12+6DJ75jYvLIpAwi+eAsR5mXxkVG/Fan
	jywiLKPpqM1acKzyihnVe39amC6tvooIKZY1zYzE3jbYzi5/lngjZOMvlvV/0RlsIERKxRdLrOZpe
	6iFU8VvQrHVWXA6xiE3KZqFQdK5a777jgkoMEt2s2aH9hLyf7iBpr6V2rX2njKQos4OKaw1s0p6Qv
	Z2uvnh9stzrBTBx6jC6BIdexfaVhL8onyBbaFW/YXzPSzkJOLCF7ABnI1XOatHbiGpTNRkVTnQK2V
	wCzRFgsUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg405-00E4H6-2o; Mon, 10 May 2021 11:23:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3X0-00E0cS-Ji; Mon, 10 May 2021 10:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=GWicXhhP8t7jOGZurHjueOJK1QYxQW5khYIthm1fU+w=; b=cLtufRz8bEgSTA1bm8R68GsxsL
 YaAK/kE1CnSbJhDlsBx9o0hlcVFlQTIRAAoLQVgrcO4CY4SQjxK72rUHrpJpu9mpBu17SBS+5KMrH
 sODJDo+5K8ZOBnZVJTXLCzBAP3tH+FQxP6DOqQbmX4+5vbKIwDBYw8K+f8+72odqlHM6cv4Q0Og+1
 LEJEM8+BdogOEomo6TpTrl7ZWBY3Puud517qOMEjD4m6r2NWBW1ojL5BVjqEQSEUCP23wZAfedFc7
 J8Aie7ZEJKsBFLL6y5iodjYZTYWSXUHwP+hsTgUSDdaVULHxTDiatwApSnDeN82dzcSmbOd/TSDja
 vL+Yc5wQ==;
Received: from wp530.webpack.hosteurope.de ([2a01:488:42:1000:50ed:8234::])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3Ww-008ZhA-VU; Mon, 10 May 2021 10:52:57 +0000
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1lg3Wn-0008EG-Lc; Mon, 10 May 2021 12:52:45 +0200
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
 kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sgx@vger.kernel.org, linux-usb@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, netdev@vger.kernel.org,
 rcu@vger.kernel.org, x86@kernel.org
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Message-ID: <c4479ced-f4d8-1a1e-ee54-9abc55344187@leemhuis.info>
Date: Mon, 10 May 2021 12:52:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
Content-Language: en-BS
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1620643975;446fd51c;
X-HE-SMSGID: 1lg3Wn-0008EG-Lc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_035255_163300_4F45A767 
X-CRM114-Status: GOOD (  13.37  )
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

Ck9uIDEwLjA1LjIxIDEyOjI2LCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4KPiBBcyBM
aW51eCBkZXZlbG9wZXJzIGFyZSBhbGwgYXJvdW5kIHRoZSBnbG9iZSwgYW5kIG5vdCBldmVyeWJv
ZHkgaGFzIFVURi04Cj4gYXMgdGhlaXIgZGVmYXVsdCBjaGFyc2V0LCBiZXR0ZXIgdG8gdXNlIFVU
Ri04IG9ubHkgb24gY2FzZXMgd2hlcmUgaXQgaXMgcmVhbGx5Cj4gbmVlZGVkLgo+IFvigKZdCj4g
VGhlIHJlbWFpbmluZyBwYXRjaGVzIG9uIHNlcmllcyBhZGRyZXNzIHN1Y2ggY2FzZXMgb24gKi5y
c3QgZmlsZXMgYW5kIAo+IGluc2lkZSB0aGUgRG9jdW1lbnRhdGlvbi9BQkksIHVzaW5nIHRoaXMg
cGVybCBtYXAgdGFibGUgaW4gb3JkZXIgdG8gZG8gdGhlCj4gY2hhcnNldCBjb252ZXJzaW9uOgo+
IAo+IG15ICVjaGFyX21hcCA9ICgKPiBb4oCmXQo+IAkweDIwMTMgPT4gJy0nLAkJIyBFTiBEQVNI
Cj4gCTB4MjAxNCA9PiAnLScsCQkjIEVNIERBU0gKCkkgbWlnaHQgYmUgcGVyZm9ybWluZyBiaWtl
IHNoZWRkaW5nIGhlcmUsIGJ1dCB3b3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8KcmVwbGFjZSB0aG9z
ZSB0d28gd2l0aCAiLS0iLCBhcyBleHBsYWluZWQgaW4KaHR0cHM6Ly9lbi53aWtpcGVkaWEub3Jn
L3dpa2kvRGFzaCNBcHByb3hpbWF0aW5nX3RoZV9lbV9kYXNoX3dpdGhfdHdvX29yX3RocmVlX2h5
cGhlbnMKCkZvciBFTSBEQVNIIHRoZXJlIHNlZW1zIHRvIGJlIGV2ZW4gIi0tLSIsIGJ1dCBJJ2Qg
c2F5IHRoYXQgaXMgYSBiaXQgdG9vCm11Y2guCgpPciBkbyB5b3UgZmVhciB0aGUgZXh0cmEgd29y
ayBhcyBzb21lIGxpbmVzIHRoZW4gbWlnaHQgYnJlYWsgdGhlCjgwLWNoYXJhY3RlciBsaW1pdCB0
aGVuPwoKQ2lhbywgVGhvcnN0ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
