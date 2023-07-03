Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DC6EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 13:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WeG6QoP/vzQxr3uBDKYunTZyg3/U1UNamteV3FAWFrY=; b=MRHfr7Q4us9uIM
	psE/m0uQ0ktJMKlyY6ur6vYaAYmaVfhcAE66eJJjkzn9hZ5jMajdDUQ1IApNq3gM1kLnR3Qx4V7wA
	p0Ss5a+6CF4w82fpyqk/RM7HD3MUR0EDnJSPCc5Xmm2+/1lflbtOVlJ3bfyj1omyuxDAgIak2NUwZ
	n0ftUwVQvu8SUQabUvj4OYwao4qyLBykYvecu++786h/YlnalpcC1AM+4lYdCBW3Oy1mcP0kRVYcm
	6U4Eo0TBquAHGTUSOJSkTHSbOuu+JRcJ6MgbuBBQ8qE+rwTQzoE7gBJI9KCunBZ8lXqfCkZvtVvvs
	MCk8SJar42XbWP7Kdf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJaC-00AdGW-1e;
	Mon, 03 Jul 2023 13:27:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJaA-00AdEy-1I
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 13:27:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc0981756so42261265e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 06:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1688390825; x=1690982825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ch0Zdn2eah8PqhuHuapNHzKo9dNMTzx4t7MOAgB9bHE=;
        b=JEljl7dtutPv1ZmMniNULgo5xKZiLmvIn7CfiX4r1Hi7NAOz1ya4l1DO5EpDyoMbi/
         vQ+EQjDpThGdMmNzQMBhDFMF34MHuLnF7lueTjnBS6sFW2OkWKppllSiwK58GrwlJ5F3
         dSbLyMuih+dExPtmLE/vVFXKWeVKBR5S1GWeg5MfbaVxEObMM+FusYRohyw2bWhiVJ3r
         hVE/ZzoUQZAxhc+8Df8Y8q9jfzhLxeNBd/CmlnLd8BlNWt2RQj/kkbpuOxEIKLJBcki7
         s0w2ZC+/ufxRduCiFRiQMKwmthHkxguR4aLZF83dH+/0FMGb3LtTv7PEeGPxOrPbN6lX
         6qmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688390825; x=1690982825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ch0Zdn2eah8PqhuHuapNHzKo9dNMTzx4t7MOAgB9bHE=;
        b=ZA4iTSbi3iZ3hZm87RxP6+Yj+80XuZk2yv5yHoWOr+Jc8GccMoO0rgrM4i2XgKw639
         E0+cJRbW9E/2rucUIEsAOFhOYg2vxYU7CK9ZyX3f3yn2OHi7gjT0hE8tOtwmFwmLh8IY
         204Kucs/2LY+sRVTHfMaPu3uw5ZCbB/RASRGHu+NTZZ0v1760JgRcqD9oZ7aZbQa4rSu
         RejzonvhJElHE8sqS6xorjPQKCF4d6tJxOQP3rK7dXQEieU8rvHL/cbkDwUoGrXekpfV
         sHa5wnlc6R6W8F30u72gI5x3ddN+rggncoqO2nbzhKpATkCsXGw9RJkkQs2X/4eVI+op
         J4Nw==
X-Gm-Message-State: AC+VfDxcKvmwArjygP244I4sKDXiBSOmRzFDi5+AgFc7HnSFCEhI4V8k
	Zs/Us60B55WxhtxuAsI5zJlohfnrVUQLw4l/QaFXaw==
X-Google-Smtp-Source: ACHHUZ6vbMWhn2vCoqguDXs/DsOPc8iovpI/n64CjZN1eD3CG+RwJ25ngGZ0BTHapVp31P2ONtJvb8N1hf1MfZjDrLo=
X-Received: by 2002:a05:600c:204b:b0:3fb:c217:722e with SMTP id
 p11-20020a05600c204b00b003fbc217722emr7467529wmg.33.1688390825022; Mon, 03
 Jul 2023 06:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230702095735.860-1-cuiyunhui@bytedance.com> <20230702095735.860-2-cuiyunhui@bytedance.com>
 <20230702-collide-rumor-f0d915a4f1b2@spud> <CAEEQ3w=CMSMnYmfprYS4ydsA=EBJtLhQQHWky754EC-iifcYtg@mail.gmail.com>
 <20230703-rebuff-smashing-6b2c6f80ba05@wendy> <CAEEQ3w=-1Zns_pZRSeM0+Wv46y6RttcT5jFy_ENnq--RptYp2g@mail.gmail.com>
 <20230703-patrol-paced-76cd5e24db6b@wendy>
In-Reply-To: <20230703-patrol-paced-76cd5e24db6b@wendy>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Mon, 3 Jul 2023 21:26:53 +0800
Message-ID: <CAEEQ3wmBSwn80kA_cnw766P4Q03tE6_TVtkndVeUsRrPqt0KyQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 2/3] firmware: introduce FFI for SMBIOS entry.
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, ardb@kernel.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, rminnich@gmail.com, mark.rutland@arm.com, 
	lpieralisi@kernel.org, rafael@kernel.org, lenb@kernel.org, jdelvare@suse.com, 
	yc.hung@mediatek.com, angelogioacchino.delregno@collabora.com, 
	allen-kh.cheng@mediatek.com, pierre-louis.bossart@linux.intel.com, 
	tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, geshijian@bytedance.com, weidong.wd@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_062710_655333_ADC198E1 
X-CRM114-Status: GOOD (  30.75  )
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

SGkgQ29ub3IsCgpPbiBNb24sIEp1bCAzLCAyMDIzIGF0IDk6MDPigK9QTSBDb25vciBEb29sZXkg
PGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDAzLCAy
MDIzIGF0IDA4OjQxOjMwUE0gKzA4MDAsIOi/kOi+ieW0lCB3cm90ZToKPiA+IE9uIE1vbiwgSnVs
IDMsIDIwMjMgYXQgNDozNuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+IHdyb3RlOgo+ID4gPiBPbiBNb24sIEp1bCAwMywgMjAyMyBhdCAwNDoyMzo1M1BNICsw
ODAwLCDov5DovonltJQgd3JvdGU6Cj4KPiA+ID4gPiA+ID4gK0ZEVCBGSVJNV0FSRSBJTlRFUkZB
Q0UgKEZGSSkKPiA+ID4gPiA+ID4gK006ICAgWXVuaHVpIEN1aSBjdWl5dW5odWlAYnl0ZWRhbmNl
LmNvbQo+ID4gPiA+ID4gPiArUzogICBNYWludGFpbmVkCj4gPiA+ID4gPiA+ICtGOiAgIGRyaXZl
cnMvZmlybXdhcmUvZmZpLmMKPiA+ID4gPiA+ID4gK0Y6ICAgaW5jbHVkZS9saW51eC9mZmkuaAo+
ID4gPiA+ID4KPiA+ID4gPiA+IEFyZSB5b3UgZ29pbmcgdG8gYXBwbHkgcGF0Y2hlcyBmb3IgdGhp
cywgb3IgaXMgc29tZW9uZSBlbHNlPwo+ID4gPiA+IFllcywgIGl0IHdpbGwgYmUgdXNlZCBieSBw
YXRjaCAzLzMuCj4gPiA+Cj4gPiA+IFRoYXQncyBub3Qgd2hhdCBJIGFza2VkIDooCj4gPgo+ID4g
U29ycnksICBvaywgIHdoYXQgZG8geW91IHdhbnQgdG8gYXNrPwo+Cj4gV2hvIGlzIGdvaW5nIHRv
IGFwcGx5IHBhdGNoZXMgZm9yIGRyaXZlcnMvZmlybXdhcmUvZmZpKj8KCkknbGwgdXBkYXRlIHRv
IHYzOgpGOiAgIGRyaXZlcnMvZmlybXdhcmUvZmZpKgpGOiAgIGluY2x1ZGUvbGludXgvZmZpKgpB
bmQgSSdsbCBwbGFuIHRvIG1haW50YWluIHRoZW0uCkJ1dCBub3csICBJIGRvbid0IGtub3cgaG93
IHRvIGFwcGx5IHRoZSBwYXRjaGVzLiBDb3VsZCB5b3UgZ2l2ZSBzb21lCnN1Z2dlc3Rpb25zPwoK
Pgo+ID4gPiA+ID4gPiAgc3RhdGljIHZvaWQgX19pbml0IGRtaV9zY2FuX21hY2hpbmUodm9pZCkK
PiA+ID4gPiA+ID4gQEAgLTY2MCw1OCArNjg2LDIyIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBkbWlf
c2Nhbl9tYWNoaW5lKHZvaWQpCj4gPiA+ID4gPiA+ICAgICAgIGNoYXIgX19pb21lbSAqcCwgKnE7
Cj4gPiA+ID4gPiA+ICAgICAgIGNoYXIgYnVmWzMyXTsKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4g
KyNpZmRlZiBDT05GSUdfRkRUX0ZXX0lOVEVSRkFDRQo+ID4gPiA+ID4gPiArICAgICBpZiAoZG1p
X3NhY25fc21iaW9zKGZmaS5zbWJpb3MzLCBmZmkuc21iaW9zKSkKPiA+ID4gPiA+Cj4gPiA+ID4g
PiAiZG1pX3NhY25fc21iaW9zIgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gKyAgICAgICAgICAgICBn
b3RvIGVycm9yOwo+ID4gPiA+ID4gPiArI2VuZGlmCj4gPiA+ID4gPgo+ID4gPiA+ID4gRG9lcyB0
aGlzIG5vdCBtZWFuIHRoYXQgaWYgRkRUX0ZXX0lOVEVSRkFDRSBpcyBlbmFibGVkLCBidXQgdGhl
IHBsYXRmb3JtCj4gPiA+ID4gPiB3YW50cyB0byB1c2UgRUZJLCBpdCB3b24ndCBiZSBhYmxlIHRv
PyBUaGUgYGdvdG8gZXJyb3I7YCBtYWtlcyB0aGlzIGxvb2sKPiA+ID4gPiA+IG11dHVhbGx5IGV4
Y2x1c2l2ZSB0byBteSBlZmktdW5hd2FyZSBleWVzLgo+ID4gPiA+Cj4gPiA+ID4gSWYgeW91IGhh
dmUgZW5hYmxlZCBGRkksIHRoZW4gaWYgc29tZXRoaW5nIGdvZXMgd3JvbmcsIHlvdSBzaG91bGQg
Z290byBlcnJvci4KPiA+ID4gPiBKdXN0IGxpa2UgdGhlIG9yaWdpbiBjb2RlOgo+ID4gPiA+ICAg
ICAgICAgaWYgKGVmaV9lbmFibGVkKEVGSV9DT05GSUdfVEFCTEVTKSkgewo+ID4gPiA+ICAgICAg
ICAgICAgICAgICBpZiAoZG1pX3NhY25fc21iaW9zKGVmaS5zbWJpb3MzLCBlZmkuc21iaW9zKSkK
PiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycm9yOwo+ID4gPiA+ICAgICAg
ICAgfSBlbHNlIGlmIChJU19FTkFCTEVEKENPTkZJR19ETUlfU0NBTl9NQUNISU5FX05PTl9FRklf
RkFMTEJBQ0spKSB7Cj4gPiA+ID4gICAgICAgICAgICAgICAgIHAgPSBkbWlfZWFybHlfcmVtYXAo
U01CSU9TX0VOVFJZX1BPSU5UX1NDQU5fU1RBUlQsIDB4MTAwMDApOwo+ID4gPiA+ICAgICAgICAg
ICAgICAgICBpZiAocCA9PSBOVUxMKQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gZXJyb3I7Cj4gPiA+Cj4gPiA+IERvZXMgdGhpcyBub3QgbWFrZSBGRkkgYW5kIEVGSSBtdXR1
YWxseSBleGNsdXNpdmUgS2NvbmZpZyBvcHRpb25zPwo+ID4gPiBTdXBwb3NlIHlvdSBhcmUgb24g
YSBzeXN0ZW0gdGhhdCBkb2VzIG5vdCBpbXBsZW1lbnQgRkZJLCBidXQgZG9lcwo+ID4gPiBpbXBs
ZW1lbnQgRUZJIC0gd2hhdCdzIGdvaW5nIHRvIGhhcHBlbiB0aGVuPwo+ID4gPiBBRkFJQ1QsIGRt
aV9zYWNuX3NtYmlvcyhmZmkuc21iaW9zMywgZmZpLnNtYmlvcykgd2lsbCBmYWlsICYgeW91J2xs
IGRvIGEKPiA+ID4gYGdvdG8gZXJyb3JgICYgc2tpcCB0aGUgRUZJIGNvZGUuIFdoYXQgYW0gSSBt
aXNzaW5nPwo+ID4KPiA+IENvZGUgaXMgbm90IGludGVuZGVkIHRvIGJlIG11dHVhbGx5IGV4Y2x1
c2l2ZSwgZ2V0IHRoZSBjb3JyZWN0IHZhbHVlIGFuZCByZXR1cm4sCj4gPiBUaGUgY29kZSBpcyBn
b2luZyB0byBiZSBjaGFuZ2VkIHRvIHRoaXM6Cj4gPgo+ID4gI2lmZGVmIENPTkZJR19GRFRfRldf
SU5URVJGQUNFCj4KPiBJZGVhbGx5LCB0aGVzZSB3b3VsZCBiZSBJU19FTkFCTEVEKCkgaW5zdGVh
ZCBvZiAjaWZkZWYgLSBidXQgaWYgeW91IGNvcHkKPiB3aGF0IEVGSSBkb2VzLCB0aGVuIHlvdSBk
b24ndCBuZWVkIGVpdGhlciwgYXMgdGhlcmUgd2lsbCBhbHdheXMgYmUgYW4KPiBmZmlfZW5hYmxl
ZCgpIGRlZmluZWQuCgpPa2F577yMIHRoaXMgY2FuIHJlZmVyIHRvIHRoZSBjb2RlIG9mIEVGSS4g
OikKCj4KPiA+ICAgICAgICAgaWYgKGZmaV9lbmFibGVkKEZGSV9DT05GSUdfVEFCTEVTKSkgewo+
Cj4gSSBkb24ndCBrbm93IHdoYXQgdGhpcyBmdW5jdGlvbiBpcywgYnV0IHRoaXMgY29kZSBzZWVt
cyBsaWtlIGEgc3RlcCBpbgo+IHRoZSByaWdodCBkaXJlY3Rpb24uCgpPa2F5LCBJJ2xsIHVwZGF0
ZSBpdCBvbiB2My4KCj4KPiA+ICAgICAgICAgICAgICAgICBpZiAoIWRtaV9zYWNuX3NtYmlvcyhm
Zmkuc21iaW9zMywgZmZpLnNtYmlvcykpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm47Cj4gPiAgICAgICAgIH0KPiA+ICNlbmRpZgo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKVGhhbmtz
LApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
