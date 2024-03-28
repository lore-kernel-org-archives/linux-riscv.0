Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B686ECD1283
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7x8jCWSGW3BDCTRaSrWHyGUi2hnvK9/Q3vtsL+NzrUY=; b=HY70qOqpfdKmqm
	RWiSJYGsKSAjiYBtVQw1eG+ys5KxReFYiNlypCrq0HJ+8XcVzR5TTsFeHO/5iOupsogAFBCnFgdRt
	241TC3u+xnes/0RC0F7VaNUceLoMLnxXkp+R0Z7oXl0YXs/LtvceqmIlXH+pkjwGwf4UQA9mhDArq
	7qfJePr9yGPuHrC0QkhDKurAIgHim2GKseJTvMU9D8yffCAZSSY1Z9X7CwgzdN8u7M6h9oOEF3jPK
	ccWaq+XNPLOzU5W5t9x2/i0Op3wbufJD04XnQYhsVQAaZYCH+SYie4BpJh5jjuOjBABkN8sZvDNsJ
	z4C8ejZYsf2iZ3rBra8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptvX-0000000F2X9-1yLC;
	Thu, 28 Mar 2024 17:52:35 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptvS-0000000F2Uj-0lNk;
	Thu, 28 Mar 2024 17:52:31 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7e05b1ef941so329975241.3;
        Thu, 28 Mar 2024 10:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648348; x=1712253148; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7LBZgef3OmAKuVME1pwiv1MCdqK5azmNzQAONOqk24=;
        b=MYHxwm3RjlqtYJyduSo/RsbTyYEKakM+tQC7xHA+7/49U5UaFly74esGSBsOtkvsG2
         jpgdy12yDJJbxs31xl9j4N2yZu4x222FPFypsRdQ8C91sHD/P+Iojp09oNy+Ms7HMPet
         rfkNiqYI153LYVBNdXFank1HtYCYNTqhy5FkpLQj7v7v0tVK4lByyPeuw4ecjGFqMLD5
         cl+atDh8MudywbuMgCrav/fYOxz/n/iDgsv/VuMQDDH+RfSJzcZEjIRVLEnovze6ypH8
         cMLlBqDtMyOzjhpFwM8pzGshYS1CnMwi7iuDZynrnTr2014Ho+eTWKb2owhvGGgKc4tp
         CrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648348; x=1712253148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7LBZgef3OmAKuVME1pwiv1MCdqK5azmNzQAONOqk24=;
        b=sqkvk7ic7MIY5LPxAjFsbOkCu3Qw63t/avd4qXesXWZBstea75kQ4LuEwbTJoO0uck
         XU+gZ0DgbNoDGw5gH7xzRuFSGCj1LU9P+45KvGFQTpmAwRhT3pR6Pp21zK8hY2no4J7l
         jYU8S4fldX6ZbSHQcIfEIgQx8zaetSAItebExbcx8D8L6izWcP0GWn3RFYLVQiqAjuGE
         Ugm/2vs0IzhWHTvySivEVw/IqyPn+SVMtDyb+8o/9T/in3zP7vvfjet5PnBYRGsujwYA
         T4fYTRa2mP9IQNvL10Xd3ecHJ8+evzjldf5zFcy9QZahXKBDKNkm1Ud+C+4aDQoFZSgC
         jzQA==
X-Forwarded-Encrypted: i=1; AJvYcCWSu6w38rE1XtAPwDXDsA0rrxSo0vjvsYu/Em2wPQradV4fsdZtKgSGn0/yc7spGlFDrk1VY+nA0OF4TX+oJfmXY69htgq4hgjG7gdbvu0Q5DNEzoiLDMLGMpSVJCoJ+Nz3xYjOpTQBMns33+svUoyBXfsw3luV7+U2A0BTGrWRl4RnkysPbNmO+gYLffYDPt4UyIoynEH7WkiVqjRy7PQz3gXgNvllRS3BDc8ghxe5Lp4Tp8UA36Gk2bQI56NP+0FsnSOVICMnaMNxKiN90XoWdj1rbgJmw/TDTIEgdyBo+ml6
X-Gm-Message-State: AOJu0YwhZciYWjrj8+PjKOd+fVNqtpgzjUb40Sm4zsMVBiRXg5WxwJn8
	s3iVqeEd+F7odr+3VL41bpqHiIcil5Te14btx0nhxJmLpM/fmdhN3jdSHbwDdHawTFqlOQVU3Ti
	hQ09pJtkc1mO2TkETsBLsRYAyg4c=
X-Google-Smtp-Source: AGHT+IE95pKnkyYhJyn8YRFxcJ3UpRrXG0+tqWRBp7m1EgSmM0bJzOr09iKkrzG5ElLe1R0ae4jladZnXe+pzUi/Iq8=
X-Received: by 2002:a05:6102:6d1:b0:478:4c1a:efbd with SMTP id
 m17-20020a05610206d100b004784c1aefbdmr2262487vsg.13.1711648347936; Thu, 28
 Mar 2024 10:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com> <ZgRePyo2zC4A1Fp4@mail.minyard.net>
In-Reply-To: <ZgRePyo2zC4A1Fp4@mail.minyard.net>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:52:16 -0700
Message-ID: <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
To: minyard@acm.org
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_105230_253981_C52E76E1 
X-CRM114-Status: GOOD (  34.49  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMTE6MDXigK9BTSBDb3JleSBNaW55YXJkIDxtaW55YXJk
QGFjbS5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMDQ6MDM6MTFQTSAr
MDAwMCwgQWxsZW4gUGFpcyB3cm90ZToKPiA+IFRoZSBvbmx5IGdlbmVyaWMgaW50ZXJmYWNlIHRv
IGV4ZWN1dGUgYXN5bmNocm9ub3VzbHkgaW4gdGhlIEJIIGNvbnRleHQgaXMKPiA+IHRhc2tsZXQ7
IGhvd2V2ZXIsIGl0J3MgbWFya2VkIGRlcHJlY2F0ZWQgYW5kIGhhcyBzb21lIGRlc2lnbiBmbGF3
cy4gVG8KPiA+IHJlcGxhY2UgdGFza2xldHMsIEJIIHdvcmtxdWV1ZSBzdXBwb3J0IHdhcyByZWNl
bnRseSBhZGRlZC4gQSBCSCB3b3JrcXVldWUKPiA+IGJlaGF2ZXMgc2ltaWxhcmx5IHRvIHJlZ3Vs
YXIgd29ya3F1ZXVlcyBleGNlcHQgdGhhdCB0aGUgcXVldWVkIHdvcmsgaXRlbXMKPiA+IGFyZSBl
eGVjdXRlZCBpbiB0aGUgQkggY29udGV4dC4KPiA+Cj4gPiBUaGlzIHBhdGNoIGNvbnZlcnRzIGRy
aXZlcnMvaW5maW5pYmFuZC8qIGZyb20gdGFza2xldCB0byBCSCB3b3JrcXVldWUuCj4KPiBJIHRo
aW5rIHlvdSBtZWFuIGRyaXZlcnMvY2hhci9pcG1pLyogaGVyZS4KCiBNeSBhcG9sb2dpZXMsIG15
IHNjcmlwdHMgbWVzc2VkIHVwIHRoZSBjb21taXQgbWVzc2FnZXMgZm9yIHRoaXMgc2VyaWVzLgpX
aWxsIGhhdmUgaXQgZml4ZWQgaW4gdjIuCgo+Cj4gSSBiZWxpZXZlIHRoYXQgd29yayBxdWV1ZXMg
aXRlbXMgYXJlIGV4ZWN1dGUgc2luZ2xlLXRocmVhZGVkIGZvciBhIHdvcmsKPiBxdWV1ZSwgc28g
dGhpcyBzaG91bGQgYmUgZ29vZC4gIEkgbmVlZCB0byB0ZXN0IHRoaXMsIHRob3VnaC4gIEl0IG1h
eSBiZQo+IHRoYXQgYW4gSVBNSSBkZXZpY2UgY2FuIGhhdmUgaXRzIG93biB3b3JrIHF1ZXVlOyBp
dCBtYXkgbm90IGJlIGltcG9ydGFudAo+IHRvIHJ1biBpdCBpbiBiaCBjb250ZXh0LgoKICBGYWly
IHBvaW50LiBDb3VsZCB5b3UgcGxlYXNlIGxldCBtZSBrbm93IG9uY2UgeW91IGhhdmUgaGFkIGEg
Y2hhbmNlIHRvIHRlc3QKdGhlc2UgY2hhbmdlcy4gTWVhbndoaWxlLCBJIHdpbGwgd29yayBvbiBS
RkMgd2hlcmVpbiBJUE1JIHdpbGwgaGF2ZSBpdHMgb3duCndvcmtxdWV1ZS4KCiBUaGFua3MgZm9y
IHRha2luZyB0aW1lIG91dCB0byByZXZpZXcuCgotIEFsbGVuCgo+Cj4gLWNvcmV5Cj4KPiA+Cj4g
PiBCYXNlZCBvbiB0aGUgd29yayBkb25lIGJ5IFRlanVuIEhlbyA8dGpAa2VybmVsLm9yZz4KPiA+
IEJyYW5jaDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
dGovd3EuZ2l0IGZvci02LjEwCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQWxsZW4gUGFpcyA8YWxs
ZW4ubGttbEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2NoYXIvaXBtaS9pcG1pX21z
Z2hhbmRsZXIuYyB8IDMwICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2NoYXIvaXBtaS9pcG1pX21zZ2hhbmRsZXIuYyBiL2RyaXZlcnMvY2hh
ci9pcG1pL2lwbWlfbXNnaGFuZGxlci5jCj4gPiBpbmRleCBiMGVlZGM0NTk1YjMuLmZjZTJhMmRi
ZGM4MiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvY2hhci9pcG1pL2lwbWlfbXNnaGFuZGxlci5j
Cj4gPiArKysgYi9kcml2ZXJzL2NoYXIvaXBtaS9pcG1pX21zZ2hhbmRsZXIuYwo+ID4gQEAgLTM2
LDEyICszNiwxMyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9ub3NwZWMuaD4KPiA+ICAjaW5jbHVk
ZSA8bGludXgvdm1hbGxvYy5oPgo+ID4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ID4gKyNp
bmNsdWRlIDxsaW51eC93b3JrcXVldWUuaD4KPiA+Cj4gPiAgI2RlZmluZSBJUE1JX0RSSVZFUl9W
RVJTSU9OICIzOS4yIgo+ID4KPiA+ICBzdGF0aWMgc3RydWN0IGlwbWlfcmVjdl9tc2cgKmlwbWlf
YWxsb2NfcmVjdl9tc2codm9pZCk7Cj4gPiAgc3RhdGljIGludCBpcG1pX2luaXRfbXNnaGFuZGxl
cih2b2lkKTsKPiA+IC1zdGF0aWMgdm9pZCBzbWlfcmVjdl90YXNrbGV0KHN0cnVjdCB0YXNrbGV0
X3N0cnVjdCAqdCk7Cj4gPiArc3RhdGljIHZvaWQgc21pX3JlY3Zfd29yayhzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKnQpOwo+ID4gIHN0YXRpYyB2b2lkIGhhbmRsZV9uZXdfcmVjdl9tc2dzKHN0cnVjdCBp
cG1pX3NtaSAqaW50Zik7Cj4gPiAgc3RhdGljIHZvaWQgbmVlZF93YWl0ZXIoc3RydWN0IGlwbWlf
c21pICppbnRmKTsKPiA+ICBzdGF0aWMgaW50IGhhbmRsZV9vbmVfcmVjdl9tc2coc3RydWN0IGlw
bWlfc21pICppbnRmLAo+ID4gQEAgLTQ5OCwxMyArNDk5LDEzIEBAIHN0cnVjdCBpcG1pX3NtaSB7
Cj4gPiAgICAgICAvKgo+ID4gICAgICAgICogTWVzc2FnZXMgcXVldWVkIGZvciBkZWxpdmVyeS4g
IElmIGRlbGl2ZXJ5IGZhaWxzIChvdXQgb2YgbWVtb3J5Cj4gPiAgICAgICAgKiBmb3IgaW5zdGFu
Y2UpLCBUaGV5IHdpbGwgc3RheSBpbiBoZXJlIHRvIGJlIHByb2Nlc3NlZCBsYXRlciBpbiBhCj4g
PiAtICAgICAgKiBwZXJpb2RpYyB0aW1lciBpbnRlcnJ1cHQuICBUaGUgdGFza2xldCBpcyBmb3Ig
aGFuZGxpbmcgcmVjZWl2ZWQKPiA+ICsgICAgICAqIHBlcmlvZGljIHRpbWVyIGludGVycnVwdC4g
IFRoZSB3b3JrIGlzIGZvciBoYW5kbGluZyByZWNlaXZlZAo+ID4gICAgICAgICogbWVzc2FnZXMg
ZGlyZWN0bHkgZnJvbSB0aGUgaGFuZGxlci4KPiA+ICAgICAgICAqLwo+ID4gICAgICAgc3Bpbmxv
Y2tfdCAgICAgICB3YWl0aW5nX3Jjdl9tc2dzX2xvY2s7Cj4gPiAgICAgICBzdHJ1Y3QgbGlzdF9o
ZWFkIHdhaXRpbmdfcmN2X21zZ3M7Cj4gPiAgICAgICBhdG9taWNfdCAgICAgICAgIHdhdGNoZG9n
X3ByZXRpbWVvdXRzX3RvX2RlbGl2ZXI7Cj4gPiAtICAgICBzdHJ1Y3QgdGFza2xldF9zdHJ1Y3Qg
cmVjdl90YXNrbGV0Owo+ID4gKyAgICAgc3RydWN0IHdvcmtfc3RydWN0IHJlY3Zfd29yazsKPiA+
Cj4gPiAgICAgICBzcGlubG9ja190ICAgICAgICAgICAgIHhtaXRfbXNnc19sb2NrOwo+ID4gICAg
ICAgc3RydWN0IGxpc3RfaGVhZCAgICAgICB4bWl0X21zZ3M7Cj4gPiBAQCAtNzA0LDcgKzcwNSw3
IEBAIHN0YXRpYyB2b2lkIGNsZWFuX3VwX2ludGVyZmFjZV9kYXRhKHN0cnVjdCBpcG1pX3NtaSAq
aW50ZikKPiA+ICAgICAgIHN0cnVjdCBjbWRfcmN2ciAgKnJjdnIsICpyY3ZyMjsKPiA+ICAgICAg
IHN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKPiA+Cj4gPiAtICAgICB0YXNrbGV0X2tpbGwoJmludGYt
PnJlY3ZfdGFza2xldCk7Cj4gPiArICAgICBjYW5jZWxfd29ya19zeW5jKCZpbnRmLT5yZWN2X3dv
cmspOwo+ID4KPiA+ICAgICAgIGZyZWVfc21pX21zZ19saXN0KCZpbnRmLT53YWl0aW5nX3Jjdl9t
c2dzKTsKPiA+ICAgICAgIGZyZWVfcmVjdl9tc2dfbGlzdCgmaW50Zi0+d2FpdGluZ19ldmVudHMp
Owo+ID4gQEAgLTEzMTksNyArMTMyMCw3IEBAIHN0YXRpYyB2b2lkIGZyZWVfdXNlcihzdHJ1Y3Qg
a3JlZiAqcmVmKQo+ID4gIHsKPiA+ICAgICAgIHN0cnVjdCBpcG1pX3VzZXIgKnVzZXIgPSBjb250
YWluZXJfb2YocmVmLCBzdHJ1Y3QgaXBtaV91c2VyLCByZWZjb3VudCk7Cj4gPgo+ID4gLSAgICAg
LyogU1JDVSBjbGVhbnVwIG11c3QgaGFwcGVuIGluIHRhc2sgY29udGV4dC4gKi8KPiA+ICsgICAg
IC8qIFNSQ1UgY2xlYW51cCBtdXN0IGhhcHBlbiBpbiB3b3JrIGNvbnRleHQuICovCj4gPiAgICAg
ICBxdWV1ZV93b3JrKHJlbW92ZV93b3JrX3dxLCAmdXNlci0+cmVtb3ZlX3dvcmspOwo+ID4gIH0K
PiA+Cj4gPiBAQCAtMzYwNSw4ICszNjA2LDcgQEAgaW50IGlwbWlfYWRkX3NtaShzdHJ1Y3QgbW9k
dWxlICAgICAgICAgKm93bmVyLAo+ID4gICAgICAgaW50Zi0+Y3Vycl9zZXEgPSAwOwo+ID4gICAg
ICAgc3Bpbl9sb2NrX2luaXQoJmludGYtPndhaXRpbmdfcmN2X21zZ3NfbG9jayk7Cj4gPiAgICAg
ICBJTklUX0xJU1RfSEVBRCgmaW50Zi0+d2FpdGluZ19yY3ZfbXNncyk7Cj4gPiAtICAgICB0YXNr
bGV0X3NldHVwKCZpbnRmLT5yZWN2X3Rhc2tsZXQsCj4gPiAtICAgICAgICAgICAgICAgICAgc21p
X3JlY3ZfdGFza2xldCk7Cj4gPiArICAgICBJTklUX1dPUksoJmludGYtPnJlY3Zfd29yaywgc21p
X3JlY3Zfd29yayk7Cj4gPiAgICAgICBhdG9taWNfc2V0KCZpbnRmLT53YXRjaGRvZ19wcmV0aW1l
b3V0c190b19kZWxpdmVyLCAwKTsKPiA+ICAgICAgIHNwaW5fbG9ja19pbml0KCZpbnRmLT54bWl0
X21zZ3NfbG9jayk7Cj4gPiAgICAgICBJTklUX0xJU1RfSEVBRCgmaW50Zi0+eG1pdF9tc2dzKTsK
PiA+IEBAIC00Nzc5LDcgKzQ3NzksNyBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfbmV3X3JlY3ZfbXNn
cyhzdHJ1Y3QgaXBtaV9zbWkgKmludGYpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICogVG8g
cHJlc2VydmUgbWVzc2FnZSBvcmRlciwgcXVpdCBpZiB3ZQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAqIGNhbid0IGhhbmRsZSBhIG1lc3NhZ2UuICBBZGQgdGhlIG1lc3NhZ2UKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgKiBiYWNrIGF0IHRoZSBoZWFkLCB0aGlzIGlzIHNhZmUgYmVjYXVz
ZSB0aGlzCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICogdGFza2xldCBpcyB0aGUgb25seSB0
aGluZyB0aGF0IHB1bGxzIHRoZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAqIHdvcmsgaXMg
dGhlIG9ubHkgdGhpbmcgdGhhdCBwdWxscyB0aGUKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
KiBtZXNzYWdlcy4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBsaXN0X2FkZCgmc21pX21zZy0+bGluaywgJmludGYtPndhaXRpbmdfcmN2X21z
Z3MpOwo+ID4gQEAgLTQ4MTIsMTAgKzQ4MTIsMTAgQEAgc3RhdGljIHZvaWQgaGFuZGxlX25ld19y
ZWN2X21zZ3Moc3RydWN0IGlwbWlfc21pICppbnRmKQo+ID4gICAgICAgfQo+ID4gIH0KPiA+Cj4g
PiAtc3RhdGljIHZvaWQgc21pX3JlY3ZfdGFza2xldChzdHJ1Y3QgdGFza2xldF9zdHJ1Y3QgKnQp
Cj4gPiArc3RhdGljIHZvaWQgc21pX3JlY3Zfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKnQpCj4g
PiAgewo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBmbGFncyA9IDA7IC8qIGtlZXAgdXMgd2Fybmlu
Zy1mcmVlLiAqLwo+ID4gLSAgICAgc3RydWN0IGlwbWlfc21pICppbnRmID0gZnJvbV90YXNrbGV0
KGludGYsIHQsIHJlY3ZfdGFza2xldCk7Cj4gPiArICAgICBzdHJ1Y3QgaXBtaV9zbWkgKmludGYg
PSBmcm9tX3dvcmsoaW50ZiwgdCwgcmVjdl93b3JrKTsKPiA+ICAgICAgIGludCBydW5fdG9fY29t
cGxldGlvbiA9IGludGYtPnJ1bl90b19jb21wbGV0aW9uOwo+ID4gICAgICAgc3RydWN0IGlwbWlf
c21pX21zZyAqbmV3bXNnID0gTlVMTDsKPiA+Cj4gPiBAQCAtNDg2Niw3ICs0ODY2LDcgQEAgdm9p
ZCBpcG1pX3NtaV9tc2dfcmVjZWl2ZWQoc3RydWN0IGlwbWlfc21pICppbnRmLAo+ID4KPiA+ICAg
ICAgIC8qCj4gPiAgICAgICAgKiBUbyBwcmVzZXJ2ZSBtZXNzYWdlIG9yZGVyLCB3ZSBrZWVwIGEg
cXVldWUgYW5kIGRlbGl2ZXIgZnJvbQo+ID4gLSAgICAgICogYSB0YXNrbGV0Lgo+ID4gKyAgICAg
ICogYSB3b3JrLgo+ID4gICAgICAgICovCj4gPiAgICAgICBpZiAoIXJ1bl90b19jb21wbGV0aW9u
KQo+ID4gICAgICAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW50Zi0+d2FpdGluZ19yY3Zf
bXNnc19sb2NrLCBmbGFncyk7Cj4gPiBAQCAtNDg4Nyw5ICs0ODg3LDkgQEAgdm9pZCBpcG1pX3Nt
aV9tc2dfcmVjZWl2ZWQoc3RydWN0IGlwbWlfc21pICppbnRmLAo+ID4gICAgICAgICAgICAgICBz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZpbnRmLT54bWl0X21zZ3NfbG9jaywgZmxhZ3MpOwo+ID4K
PiA+ICAgICAgIGlmIChydW5fdG9fY29tcGxldGlvbikKPiA+IC0gICAgICAgICAgICAgc21pX3Jl
Y3ZfdGFza2xldCgmaW50Zi0+cmVjdl90YXNrbGV0KTsKPiA+ICsgICAgICAgICAgICAgc21pX3Jl
Y3Zfd29yaygmaW50Zi0+cmVjdl93b3JrKTsKPiA+ICAgICAgIGVsc2UKPiA+IC0gICAgICAgICAg
ICAgdGFza2xldF9zY2hlZHVsZSgmaW50Zi0+cmVjdl90YXNrbGV0KTsKPiA+ICsgICAgICAgICAg
ICAgcXVldWVfd29yayhzeXN0ZW1fYmhfd3EsICZpbnRmLT5yZWN2X3dvcmspOwo+ID4gIH0KPiA+
ICBFWFBPUlRfU1lNQk9MKGlwbWlfc21pX21zZ19yZWNlaXZlZCk7Cj4gPgo+ID4gQEAgLTQ4OTks
NyArNDg5OSw3IEBAIHZvaWQgaXBtaV9zbWlfd2F0Y2hkb2dfcHJldGltZW91dChzdHJ1Y3QgaXBt
aV9zbWkgKmludGYpCj4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+Cj4gPiAgICAgICBhdG9t
aWNfc2V0KCZpbnRmLT53YXRjaGRvZ19wcmV0aW1lb3V0c190b19kZWxpdmVyLCAxKTsKPiA+IC0g
ICAgIHRhc2tsZXRfc2NoZWR1bGUoJmludGYtPnJlY3ZfdGFza2xldCk7Cj4gPiArICAgICBxdWV1
ZV93b3JrKHN5c3RlbV9iaF93cSwgJmludGYtPnJlY3Zfd29yayk7Cj4gPiAgfQo+ID4gIEVYUE9S
VF9TWU1CT0woaXBtaV9zbWlfd2F0Y2hkb2dfcHJldGltZW91dCk7Cj4gPgo+ID4gQEAgLTUwNjgs
NyArNTA2OCw3IEBAIHN0YXRpYyBib29sIGlwbWlfdGltZW91dF9oYW5kbGVyKHN0cnVjdCBpcG1p
X3NtaSAqaW50ZiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFn
cyk7Cj4gPiAgICAgICB9Cj4gPgo+ID4gLSAgICAgdGFza2xldF9zY2hlZHVsZSgmaW50Zi0+cmVj
dl90YXNrbGV0KTsKPiA+ICsgICAgIHF1ZXVlX3dvcmsoc3lzdGVtX2JoX3dxLCAmaW50Zi0+cmVj
dl93b3JrKTsKPiA+Cj4gPiAgICAgICByZXR1cm4gbmVlZF90aW1lcjsKPiA+ICB9Cj4gPiAtLQo+
ID4gMi4xNy4xCj4gPgo+ID4KPgoKCi0tIAogICAgICAgLSBBbGxlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
