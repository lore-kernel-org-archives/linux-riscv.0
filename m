Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAE6C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 10:24:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D8DF222A1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 10:24:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ugMIxrRF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NN+GXW5O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D8DF222A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eL8xvYDKYLiRE/be21OO7K3alh2pG8IZ7rcaRJisis0=; b=ugMIxrRFGGxqrq
	IukChgMEpt1LfgnxpgkaMRoMRwnBJD80ZxiFxve/v3u5FZJ8SLWwfPUWCEUcR4gH830583pwLApyZ
	fP5a1dtMePOHVogKz6cCXwcSGZLLrci3W9ALUlmSSK/JlQPa9w+51CV27xaVM25Q+g7w4qqM6SbBB
	QTfpzv2LSVS4dAGEcX+lYuV22c09il5q4qA97RsU+lblNh0esyr2/vQPoH0CI2XRQ/QoasJoF3NAR
	31CGqMyHYHJ72H9n/3z/GwRlYundmbtwaeWjlFpN5YSkPKaCWxVfw+jRfXTk5wBjjCeG4SSE35bjA
	OZAoTrL7o9cu9F//5xjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guEC7-0004Gk-1W; Thu, 14 Feb 2019 10:24:39 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guEC3-0004FY-Kt
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 10:24:37 +0000
Received: by mail-wr1-x441.google.com with SMTP id q18so5819839wrx.9
 for <linux-riscv@lists.infradead.org>; Thu, 14 Feb 2019 02:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UMBFCAKL92/Q/MudKCxdvcCfgzMzaNRtyfpVp1Xip9U=;
 b=NN+GXW5OwtOog0fhdY6oVfREZ2kPBXclT+/OkDuXIxa1osiCxeAlT/pLmV6PLRzQgB
 /D5n/jv3cpbVdqUwJMuDtr1ogLNZwSSCYlrgBQWk6bVvncvbZ7RCQkLNCXHLkIqYTHg8
 KgGExCHMqV0R2lbrGWzYEsz2kSxAd8xf6a9CKzqPLWpp0h7P2IjwE3TVcYj43c0gaOQz
 XdNBH1Kz3wUBzIVTVOWu339IItxeq2WaBQBn80nFSi9cQs+SwmyckGNpFZGdFvAbHcCY
 1ytBPGV4kPVauYaICy113k2rrIwGhUJ7FtPSgy7K8nQEvEHab7O0xd6/r1g4PW3yuamr
 c4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UMBFCAKL92/Q/MudKCxdvcCfgzMzaNRtyfpVp1Xip9U=;
 b=YvaW1P4TN8PMzpnFGUmUi323wPexnnoV81wb1wJEbB/lTcrmcJeWf1+2og9ccJchRD
 yg2dzInY9uKiNaeNY+Y+cP9K9ib6jV/MvtcsuKeyKKxSJW66r4ujjaOIjVwrd+8gygoP
 +vmCPXKfkUGjODwPu3Wmu8SG6hnWNgxHOr03QkRh11Af5GMu7QPKe+3W5EHe/kHdRFcH
 VxVIpUMHJCw7fVVx9gdppTsApEdYmgmRpQsxTu6EtNqApmy67rYUWQBsPENjTUGf0Qwe
 cb6wZzIhksQko/1adyW5B443gXCQXeIRc4HcdM7vU0J7Yozva0tJqFNpzNkPTZ3LNIzp
 wjxw==
X-Gm-Message-State: AHQUAuZkC6E/6ZLXuWFXFtsZ/Ha6PgafdCckA/tl8rC/suPIwwPn5B3n
 HV2GyTowg9FJOzoD3De9g4NaeA==
X-Google-Smtp-Source: AHgI3IbjB3YttdZp6MnipTngwslPbQ3Xy73uZ2lNUUi03kZMsryha8F37ZlYZb5z25rN8BvagF1Lbg==
X-Received: by 2002:adf:e290:: with SMTP id v16mr2337596wri.100.1550139872790; 
 Thu, 14 Feb 2019 02:24:32 -0800 (PST)
Received: from [192.168.27.65] (sju31-1-78-210-255-2.fbx.proxad.net.
 [78.210.255.2])
 by smtp.googlemail.com with ESMTPSA id 126sm2304113wmd.1.2019.02.14.02.24.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Feb 2019 02:24:32 -0800 (PST)
Subject: Re: [v5 PATCH 6/8] clocksource/drivers/riscv: Add required checks
 during clock source init
To: Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
References: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
 <1550089092-28783-7-git-send-email-atish.patra@wdc.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <bf8f0535-26d4-843a-d89c-8ab235411b4c@linaro.org>
Date: Thu, 14 Feb 2019 11:24:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1550089092-28783-7-git-send-email-atish.patra@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_022435_691517_CAA37E0D 
X-CRM114-Status: GOOD (  18.35  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Marc Zyngier <marc.zyngier@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@linutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTMvMDIvMjAxOSAyMToxOCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gQ3VycmVudGx5LCBjbG9j
a3NvdXJjZSByZWdpc3RyYXRpb24gaGFwcGVucyBmb3IgYW4gaW52YWxpZCBjcHUgZm9yCj4gbm9u
LXNtcCBrZXJuZWxzLiBUaGlzIGxlYWQgdG8ga2VybmVsIHBhbmljIGFzIGNwdSBob3RwbHVnIHJl
Z2lzdHJhdGlvbgo+IHdpbGwgZmFpbCBmb3IgdGhvc2UgY3B1cy4gTW9yZW92ZXIsIHJpc2N2X2hh
cnRpZF90b19jcHVpZCBjYW4gcmV0dXJuCj4gZXJyb3JzIG5vdy4KPiAKPiBEbyBub3QgcHJvY2Vl
ZCBpZiBoYXJ0aWQgb3IgY3B1aWQgaXMgaW52YWxpZC4gVGFrZSB0aGlzIG9wcHJ0dW5pdHkgdG8K
PiBwcmludCBhcHByb3ByaWF0ZSBlcnJvciBzdHJpbmdzIGZvciBkaWZmZXJlbnQgZmFpbHVyZSBj
YXNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNv
bT4KCkhpIEF0aXNoLAoKSSBhcHBsaWVkIHRoaXMgcGF0Y2ggZm9yIDUuMSB3aXRoIHRoZSB0eXBv
IGZpeGVkIGFuZCB0aGUgcmV2aWV3ZWQtYnkgdGFncy4KCiAgLS0gRGFuaWVsCgo+IC0tLQo+ICBk
cml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCAyMyArKysrKysrKysrKysrKysrKysr
Ky0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIvZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gaW5kZXggNDMxODkyMjAuLmU4MTYzNjkz
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ICsrKyBi
L2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+IEBAIC05NSwxMyArOTUsMzAgQEAg
c3RhdGljIGludCBfX2luaXQgcmlzY3ZfdGltZXJfaW5pdF9kdChzdHJ1Y3QgZGV2aWNlX25vZGUg
Km4pCj4gIAlzdHJ1Y3QgY2xvY2tzb3VyY2UgKmNzOwo+ICAKPiAgCWhhcnRpZCA9IHJpc2N2X29m
X3Byb2Nlc3Nvcl9oYXJ0aWQobik7Cj4gKwlpZiAoaGFydGlkIDwgMCkgewo+ICsJCXByX3dhcm4o
Ik5vdCB2YWxpZCBoYXJ0aWQgZm9yIG5vZGUgWyVwT0ZdIGVycm9yID0gWyVkXVxuIiwKPiArCQkJ
biwgaGFydGlkKTsKPiArCQlyZXR1cm4gaGFydGlkOwo+ICsJfQo+ICsKPiAgCWNwdWlkID0gcmlz
Y3ZfaGFydGlkX3RvX2NwdWlkKGhhcnRpZCk7Cj4gKwlpZiAoY3B1aWQgPCAwKSB7Cj4gKwkJcHJf
d2FybigiSW52YWxpZCBjcHVpZCBmb3IgaGFydGlkIFslZF1cbiIsIGhhcnRpZCk7Cj4gKwkJcmV0
dXJuIGNwdWlkOwo+ICsJfQo+ICAKPiAgCWlmIChjcHVpZCAhPSBzbXBfcHJvY2Vzc29yX2lkKCkp
Cj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICsJcHJfaW5mbygiJXM6IFJlZ2lzdGVyaW5nIGNsb2Nrc291
cmNlIGNwdWlkIFslZF0gaGFydGlkIFslZF1cbiIsCj4gKwkgICAgICAgX19mdW5jX18sIGNwdWlk
LCBoYXJ0aWQpOwo+ICAJY3MgPSBwZXJfY3B1X3B0cigmcmlzY3ZfY2xvY2tzb3VyY2UsIGNwdWlk
KTsKPiAtCWNsb2Nrc291cmNlX3JlZ2lzdGVyX2h6KGNzLCByaXNjdl90aW1lYmFzZSk7Cj4gKwll
cnJvciA9IGNsb2Nrc291cmNlX3JlZ2lzdGVyX2h6KGNzLCByaXNjdl90aW1lYmFzZSk7Cj4gKwlp
ZiAoZXJyb3IpIHsKPiArCQlwcl9lcnIoIlJJU0NWIHRpbWVyIHJlZ2lzdGVyIGZhaWxlZCBbJWRd
IGZvciBjcHUgPSBbJWRdXG4iLAo+ICsJCSAgICAgICBlcnJvciwgY3B1aWQpOwo+ICsJCXJldHVy
biBlcnJvcjsKPiArCX0KPiAgCj4gIAlzY2hlZF9jbG9ja19yZWdpc3RlcihyaXNjdl9zY2hlZF9j
bG9jaywKPiAgCQkJQklUU19QRVJfTE9ORywgcmlzY3ZfdGltZWJhc2UpOwo+IEBAIC0xMTAsOCAr
MTI3LDggQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfdGltZXJfaW5pdF9kdChzdHJ1Y3QgZGV2
aWNlX25vZGUgKm4pCj4gIAkJCSAiY2xvY2tldmVudHMvcmlzY3YvdGltZXI6c3RhcnRpbmciLAo+
ICAJCQkgcmlzY3ZfdGltZXJfc3RhcnRpbmdfY3B1LCByaXNjdl90aW1lcl9keWluZ19jcHUpOwo+
ICAJaWYgKGVycm9yKQo+IC0JCXByX2VycigiUklTQ1YgdGltZXIgcmVnaXN0ZXIgZmFpbGVkIFsl
ZF0gZm9yIGNwdSA9IFslZF1cbiIsCj4gLQkJICAgICAgIGVycm9yLCBjcHVpZCk7Cj4gKwkJcHJf
ZXJyKCJjcHUgaHAgc2V0dXAgc3RhdGUgZmFpbGVkIGZvciBSSVNDViB0aW1lciBbJWRdXG4iLAo+
ICsJCSAgICAgICBlcnJvcik7Cj4gIAlyZXR1cm4gZXJyb3I7Cj4gIH0KPiAgCj4gCgoKLS0gCiA8
aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29t
L3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29y
Zz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
