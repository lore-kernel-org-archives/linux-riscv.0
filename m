Return-Path: <SRS0=7WNQ=OX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900D0C6786C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 09:24:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BBFC20866
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 09:24:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k0kyCTpW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+BT/Llv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BBFC20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJT01Y4anWfWNUIOgyLQnzvjTX4Tw00jicZNQDk3P4o=; b=k0kyCTpWHY0Lwg
	FuG7XWxY6nRpzcm5LTzy0rOQEJsM/UTmu6U1UOMv/F+HUrqJcNTDgf5BEyLcPgs6pvsy5vW63C0Wg
	+Wwpvoi6FJQ4pfSNqge+MIpfmUNBzjOJTSo/7r1QKQlE5timDqIBBq+yMnBiIJTsjIZC0cfLHhmCA
	QkvAqc8NI6uww/FJ5n/ilBrn1RrRQDh23aqmmVyOI/cCoj3At0cSccWctGYwbFhP7ZGIwf7nB9HLV
	MYur2ME1677kMuVfCVdLMwr2INAyWX3U8NbVH3wlHMRNMtzJ3+cu5Tw/6z1KjMnkQpK6xZHvsxuHS
	RrIMFtH2kqt72XBO9G1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXji4-0007OR-FZ; Fri, 14 Dec 2018 09:24:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXji1-0007NH-L1
 for linux-riscv@lists.infradead.org; Fri, 14 Dec 2018 09:24:39 +0000
Received: by mail-wm1-x342.google.com with SMTP id g67so5065683wmd.2
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 01:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4pz4LVo2xw/Nz9f9E3476iZ62QabH9C+7vUJFOIWiVc=;
 b=T+BT/Llvs8hT8xsjRfn/Ajwdbj4WffLH0apUiCEHJswepABq1gg2v2ayAV8B8txqba
 Yic9qRWyfQ053qfyqB8ibecFCt+QlvDm+1U+owkRP8SpBhh//IBWf/mq1QZQQ+ouaZiH
 XXtyU7pVBJhRxDvEFlcLbJnfD+t7IuiRHkn+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4pz4LVo2xw/Nz9f9E3476iZ62QabH9C+7vUJFOIWiVc=;
 b=Th8CBtnw9ydTyiwrvF+XTu4Tcx7LLoFVREr6MHalRdjHfmxp/R3FUKctKJ5Cl0XtCI
 5c36233S0C+ebPwUx73Wz4kgb7ZmxVlnB++gTT55M44vRo6ZrJK4emnTcidILVUJr0YG
 gC13DmkDUFjWlFTXUioFI76K6wHEsxYGxbWdeni8RI0O08Tv7H240zyGL4NB6fOrlpIy
 fHQNSwUhZ6xpwG7jv4DotixtWdfqBCrM12100nIsDnefaUEWn2RW3ShyrbiP5VmvEZqf
 pXZ4pjD4kYwEu+AxVLMcsgY/t+rlYM74DyBXg5bzTLByPDtNxoLvHcfJFSQ1YFLXISku
 Ealw==
X-Gm-Message-State: AA+aEWY9IxEEAlR5cmW4GI0ZimvN1VodwkGKsAmWXfYL8U5i1Xq7GVN5
 KhTp5OsfXSbUvO/kK2X8+eLPUQ==
X-Google-Smtp-Source: AFSGD/W1Q4k4ws46VynhAEscyRb7pEJtMCAvfDpTL46MiCOt2WnxmyF887PX2DkUJqD0UI57AUMwlw==
X-Received: by 2002:a1c:68d7:: with SMTP id d206mr2421272wmc.43.1544779463856; 
 Fri, 14 Dec 2018 01:24:23 -0800 (PST)
Received: from [192.168.0.40] (77.37.95.92.rev.sfr.net. [92.95.37.77])
 by smtp.googlemail.com with ESMTPSA id v133sm3390933wmf.19.2018.12.14.01.24.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Dec 2018 01:24:23 -0800 (PST)
Subject: Re: [PATCH v2 2/4] RISC-V: Support per-hart timebase-frequency
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
References: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
 <1544742869-19980-3-git-send-email-atish.patra@wdc.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <b11115c8-b194-0f73-b4ab-5d1d643790ad@linaro.org>
Date: Fri, 14 Dec 2018 10:24:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1544742869-19980-3-git-send-email-atish.patra@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_012437_704078_1F6AEA55 
X-CRM114-Status: GOOD (  23.57  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Damien Le Moal <Damien.LeMoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Christoph Hellwig <hch@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQvMTIvMjAxOCAwMDoxNCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gRm9sbG93IHRoZSB1cGRh
dGVkIERUIHNwZWNzIGFuZCByZWFkIHRoZSB0aW1lYmFzZS1mcmVxdWVuY3kKPiBmcm9tIHRoZSBi
b290IGNwdS4gS2VlcCB0aGUgb2xkIERUIHJlYWRpbmcgYXMgd2VsbCBmb3IgYmFja3dhcmQKPiBj
b21wYXRpYmlsaXR5LiBUaGlzIHBhdGNoIGlzIHJld29yayBvZiBvbGQgcGF0Y2ggZnJvbSBQYWxt
ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNoLnBhdHJhQHdkYy5jb20+
Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3RpbWUuYyAgICAgICAgICB8ICA5ICstLS0tLS0t
LQo+ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3Jpc2N2X3RpbWVyLmMgfCAzMSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdGltZS5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvdGltZS5jCj4gaW5kZXggMTkxMWM4ZjYuLjIyNWZlNzQzIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RpbWUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3RpbWUuYwo+IEBAIC0yMCwxNCArMjAsNyBAQCB1bnNpZ25lZCBsb25nIHJpc2N2X3Rp
bWViYXNlOwo+ICAKPiAgdm9pZCBfX2luaXQgdGltZV9pbml0KHZvaWQpCj4gIHsKPiAtCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqY3B1Owo+IC0JdTMyIHByb3A7Cj4gLQo+IC0JY3B1ID0gb2ZfZmluZF9u
b2RlX2J5X3BhdGgoIi9jcHVzIik7Cj4gLQlpZiAoIWNwdSB8fCBvZl9wcm9wZXJ0eV9yZWFkX3Uz
MihjcHUsICJ0aW1lYmFzZS1mcmVxdWVuY3kiLCAmcHJvcCkpCj4gLQkJcGFuaWMoS0VSTl9XQVJO
SU5HICJSSVNDLVYgc3lzdGVtIHdpdGggbm8gJ3RpbWViYXNlLWZyZXF1ZW5jeScgaW4gRFRTXG4i
KTsKPiAtCXJpc2N2X3RpbWViYXNlID0gcHJvcDsKPiArCXRpbWVyX3Byb2JlKCk7Cj4gIAo+ICAJ
bHBqX2ZpbmUgPSByaXNjdl90aW1lYmFzZSAvIEhaOwo+IC0JdGltZXJfcHJvYmUoKTsKPiAgfQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsb2Nrc291cmNlL3Jpc2N2X3RpbWVyLmMgYi9kcml2ZXJz
L2Nsb2Nrc291cmNlL3Jpc2N2X3RpbWVyLmMKPiBpbmRleCAwODRlOTdkYy4uNzUyNjI0MDkgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9jbG9ja3NvdXJjZS9yaXNjdl90aW1lci5jCj4gKysrIGIvZHJp
dmVycy9jbG9ja3NvdXJjZS9yaXNjdl90aW1lci5jCj4gQEAgLTgzLDYgKzgzLDM1IEBAIHZvaWQg
cmlzY3ZfdGltZXJfaW50ZXJydXB0KHZvaWQpCj4gIAlldmRldi0+ZXZlbnRfaGFuZGxlcihldmRl
dik7Cj4gIH0KPiAgCj4gK3N0YXRpYyB2b2lkIF9faW5pdCByaXNjdl90aW1lYmFzZV9mcmVxdWVu
Y3koc3RydWN0IGRldmljZV9ub2RlICpub2RlLAo+ICsJCQkJCSAgICBpbnQgaGFydGlkKQo+ICt7
Cj4gKwl1MzIgdGltZWJhc2U7Cj4gKwo+ICsJaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2Rl
LCAidGltZWJhc2UtZnJlcXVlbmN5IiwgJnRpbWViYXNlKSkKPiArCQlnb3RvIGNoZWNrOwo+ICsK
PiArCS8qCj4gKwkgKiBBcyBwZXIgdGhlIERUIHNwZWNpZmljYXRpb24sIHRpbWViYXNlLWZyZXF1
ZW5jeSBzaG91bGQgYmUgcHJlc2VudAo+ICsJICogdW5kZXIgaW5kaXZpZHVhbCBjcHUgbm9kZS4g
VW5mb3J0dW5hdGVseSwgdGhlcmUgYXJlIGFscmVhZHkgYXZhaWxhYmxlCj4gKwkgKiBIaUZpdmUg
VW5sZWFzaGVkIGRldmljZXMgd2hlcmUgdGhlIHRpbWViYXNlLWZyZXF1ZW5jeSBlbnRyeSBpcyB1
bmRlcgo+ICsJICogQ1BVcy4gY2hlY2sgdW5kZXIgcGFyZW50ICJjcHVzIiBub2RlIHRvIGNvdmVy
IHRob3NlIGRldmljZXMuCj4gKwkgKi8KPiArCWlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIobm9k
ZS0+cGFyZW50LCAidGltZWJhc2UtZnJlcXVlbmN5IiwKPiArCQkJCSAgJnRpbWViYXNlKSkKPiAr
CQlnb3RvIGNoZWNrOwo+ICsKPiArCXBhbmljKCJSSVNDLVYgc3lzdGVtIHdpdGggbm8gdGltZWJh
c2UtZnJlcXVlbmN5IGluIERUUyBmb3IgaGFydCBbJWRdXG4iLAo+ICsJICAgICAgaGFydGlkKTsK
Cm5vIHBhbmljIGluIHRoZSBkcml2ZXIgY29kZSBwbGVhc2UuIEFsdGVybmF0aXZlbHkgdXNlIHBy
X2VyciBhbmQgbGV0IHRoZQp0aW1lci1wcm9iZSBmdW5jdGlvbiBzcGl0IHRoZSBjcml0aWNhbCBl
cnJvciBvbiB0aGUgY29uc29sZS4KCkl0IHdvdWxkIGJlIG5pY2VyIHRvIGFkZCBhIGZpeGVkLWNs
b2NrIGFuZCBnZXQgdGhlIHJhdGUgZnJvbSBpdC4KCj4gK2NoZWNrOgo+ICsJLyogUklTQy1WIElT
QSBzcGVjaWZpY2F0aW9uIG1hbmRhdGVzIHRoYXQgZXZlcnkgY3B1IGhhcyBhIHRpbWVyICovCj4g
KwlpZiAoIXJpc2N2X3RpbWViYXNlKQo+ICsJCXJpc2N2X3RpbWViYXNlID0gdGltZWJhc2U7Cj4g
KwllbHNlIGlmIChyaXNjdl90aW1lYmFzZSAmJiByaXNjdl90aW1lYmFzZSAhPSB0aW1lYmFzZSkK
PiArCQlwcl93YXJuKCJSSVNDLVYgc3lzdGVtIHdpdGggZGlmZmVyZW50IHRpbWViYXNlLWZyZXF1
ZW5jeVxuIik7Cj4gK30KPiArCj4gIHN0YXRpYyBpbnQgX19pbml0IHJpc2N2X3RpbWVyX2luaXRf
ZHQoc3RydWN0IGRldmljZV9ub2RlICpuKQo+ICB7Cj4gIAlpbnQgY3B1aWQsIGhhcnRpZCwgZXJy
b3I7Cj4gQEAgLTkwLDEwICsxMTksMTIgQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfdGltZXJf
aW5pdF9kdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm4pCj4gIAo+ICAJaGFydGlkID0gcmlzY3Zfb2Zf
cHJvY2Vzc29yX2hhcnRpZChuKTsKPiAgCWNwdWlkID0gcmlzY3ZfaGFydGlkX3RvX2NwdWlkKGhh
cnRpZCk7Cj4gKwlyaXNjdl90aW1lYmFzZV9mcmVxdWVuY3kobiwgaGFydGlkKTsKPiAgCj4gIAlp
ZiAoY3B1aWQgIT0gc21wX3Byb2Nlc3Nvcl9pZCgpKQo+ICAJCXJldHVybiAwOwoKU29tZWhvdyBy
ZWxhdGVkIHRvIHRoaXMgY2hhbmdlLiBBcmUgeW91IHN1cmUgdGhlIHRlc3QgYWJvdmUgbWFrZXMg
c2Vuc2U/Cgo+ICsJLyogVGhpcyBzaG91bGQgYmUgY2FsbGVkIG9ubHkgZm9yIGJvb3QgY3B1ICov
Cj4gIAljcyA9IHBlcl9jcHVfcHRyKCZyaXNjdl9jbG9ja3NvdXJjZSwgY3B1aWQpOwo+ICAJY2xv
Y2tzb3VyY2VfcmVnaXN0ZXJfaHooY3MsIHJpc2N2X3RpbWViYXNlKTsKPiAgCj4gCgoKLS0gCiA8
aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29t
L3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29y
Zz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
