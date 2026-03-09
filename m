Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6BDF41807
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 16:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwQAh+mgCfqfk7FO3BqN9PYKLT034XdrNEnDcsbaSok=; b=3LpngYak1/+Naw
	RA4pAIPGR0bzSdJOgyHmpTYPkqkT75zW7K0JSpDuPrPsYniyTvJ3DnxhIf2jVwDP6+PucxChghAxO
	0hB9B4bULbQ8gOnWNA1UYxD4kE3PINhqWa+lV6wH5yasDmBM8nI/3E0aJC0Tt4y2myis0t/wpFW6Q
	EkdTvTtmxiW9SxgqXD/hte5o/W1gxQcZlA4tXi9Bk6GuVN6eUjhPujb+0lBS8vDjTvIDNex29AZhx
	1Wkd/augqNwoyux8E4FO56v4Wj+RkbvQW85GXFO2rpD62brHcO0HxF5gUMphhErCpRv2BnvOmBs5u
	rTFnTYoTyi6BoPNw0YHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdpP-00000007lbI-3mmA;
	Mon, 09 Mar 2026 16:51:35 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzdpM-00000007la5-2DwB
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 16:51:34 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.14])
	by APP-05 (Coremail) with SMTP id zQCowAAnvA98+q5pb6z5CQ--.23212S2;
	Tue, 10 Mar 2026 00:51:09 +0800 (CST)
Message-ID: <57436150684e72049b62657caec544a2f18aab1c.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda	
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman	 <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren	 <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Han Gao
 <gaohan@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Tue, 10 Mar 2026 00:51:08 +0800
In-Reply-To: <301a33fc27bd01bb50d57779c2f9eb51a4fafaa5.camel@iscas.ac.cn>
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
		 <20260129023922.1527729-4-zhengxingda@iscas.ac.cn>
		 <DGY9GWWLXGNX.265MMEXXCG8YA@bootlin.com>
	 <301a33fc27bd01bb50d57779c2f9eb51a4fafaa5.camel@iscas.ac.cn>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAnvA98+q5pb6z5CQ--.23212S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1fGw4fZFyxKrWfZFykGrg_yoW8Wr4fpF
	Z2qa4SyFn8XrWxGF4jvr1DAr1aq3ykJF4rAryrtr1Fva4IgF1UWr1kCr98uw1jka1kCr15
	AF1DJrnYvFn5ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU0iSdDUUUUU==
X-Originating-IP: [112.94.103.14]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_095132_942522_C1A03806 
X-CRM114-Status: GOOD (  12.52  )
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

5ZyoIDIwMjYtMDMtMTDkuoznmoQgMDA6MzUgKzA4MDDvvIxJY2Vub3d5IFpoZW5n5YaZ6YGT77ya
Cj09PT09PT09PT09PT09PT0gODwgPT09PT09PT09PT09PT09PT09Cj4gPiA+ICsJaWYgKElTX0VS
UihicmlkZ2UpKQo+ID4gPiArCQlyZXR1cm4gRVJSX1BUUihQVFJfRVJSKGJyaWRnZSkpOwo+ID4g
PiArCj4gPiA+ICsJYnJpZGdlLT5jcnRjID0gY3J0YzsKPiA+ID4gKwlicmlkZ2UtPmludGYgPSBp
bnRmOwo+ID4gPiArCWJyaWRnZS0+bmV4dF9icmlkZ2UgPSBuZXh0Owo+ID4gCj4gPiBUaGVyZSBp
cyBub3cgYSBuZXh0X2JyaWRnZSBmaWVsZCBpbiBzdHJ1Y3QgZHJtX2JyaWRnZSwgd2hpY2gKPiA+
IGhhbmRsZXMKPiA+IHRoZQo+ID4gYnJpZGdlIGxpZmV0aW1lIGluIGEgc2FmZXIgd2F5IGFuZCBt
b3JlIHNpbXBseSBbMF0sIHNvIHlvdSBjb3VsZAo+ID4gdXNlCj4gPiBpdDoKPiAKPiBHbGFkIHRv
IGhlYXIgc3VjaCBhIGZpZWxkIGV4aXN0cyBub3cuIFdpbGwgbW9yZSBjb2RlIGFib3V0Cj4gbmV4
dF9icmlkZ2UKPiBsaWZldGltZSBtYW5hZ2VtZW50IGJlaW5nIHNoYXJlZD8KCkxvb2tzIGxpa2Ug
bm93IG1hbnkgZHJpdmVycyBjYW4ganVzdCBzaGFyZSB0aGUgLmF0dGFjaCBmdW5jdGlvbiwKYmVj
YXVzZSB0aGV5J3JlIGFsbCBkb2luZyB0aGUgc2FtZSB0aGluZzoKCmBgYAppbnQgZHJtX2JyaWRn
ZV9hdHRhY2hfbmV4dChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAoJCQkgICBzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIsCgkJCSAgIGVudW0gZHJtX2JyaWRnZV9hdHRhY2hfZmxhZ3MgZmxh
Z3MpCnsKCXJldHVybiBkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBicmlkZ2UtPm5leHRfYnJp
ZGdlLAoJCQkJIGJyaWRnZSwgZmxhZ3MpOwp9CmBgYAoKQXQgbGVhc3QgdnNfYnJpZGdlX2F0dGFj
aCBoZXJlIGFuZCBtZXNvbl9lbmNvZGVyXypfYXR0YWNoIChuYW1lZAplbmNvZGVyIGJ1dCB0aGV5
J3JlIGJyaWRnZSBkcml2ZXJzIG5vdykgbWF0Y2ggdGhpcyBwYXR0ZXJuICh0aGUgbGF0dGVyCmRv
ZXMgYSBjYXN0IGZyb20gYHN0cnVjdCBkcm1fYnJpZGdlICpgIHRvIHRoZWlyIHN1YmNsYXNzZXMs
IGJ1dCB0aGVuCm9ubHkgYWNjZXNzaW5nIHRoZSBgYnJpZGdlYCBmaWVsZCBvZiB0aGUgc3ViY2xh
c3NlcyBhbmQgZG9pbmcgdGhlIHNhbWUKdGhpbmdzIGhlcmUpLgoKVGhhbmtzLApJY2Vub3d5Cgo+
IAo+IFRoYW5rcywKPiBJY2Vub3d5Cj4gCj4gPiAKPiA+IMKgwqDCoMKgwqDCoCBicmlkZ2UtPmJh
c2UubmV4dF9icmlkZ2UgPSBuZXh0Owo+ID4gCj4gPiBPciwgYWZ0ZXIgdGhlIHJlbmFtZXMgSSBz
dWdnZXN0ZWQgYWJvdmU6Cj4gPiAKPiA+IMKgwqDCoMKgwqDCoCB2YnJpZGdlLT5icmlkZ2UubmV4
dF9icmlkZ2UgPSBuZXh0Owo+ID4gCj4gPiBbMF0KPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4u
Y29tL2xpbnV4L3Y3LjAtcmMyL3NvdXJjZS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgjTDEyNjkt
TDEyNzgKPiA+IAo+ID4gTHVjYQo+ID4gCj4gPiAtLQo+ID4gTHVjYSBDZXJlc29saSwgQm9vdGxp
bgo+ID4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwo+ID4gaHR0cHM6Ly9i
b290bGluLmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
