Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61B1C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 08:48:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E35222B6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 08:48:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fq2CEDor";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cKjafkJT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84E35222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvANVLGrBIPyG0Q2gRrjoL9c3c+sxWbgKaUJGt9rdMM=; b=Fq2CEDorgpx6xm
	TC+8i7Rq4m4hRKZsK84ppJ67zopObTI9V1CuGZdNBcJDhWu70nEDMHXIDQ0jllpXGwldI73s+AH5H
	ETfQVYM3D5i3rWw+j12dK6MNKw3aJwHZuSwjcb0PQKcg6D0k2rc3GNUF3NdZIvJRLDYy79H5lNOBG
	THUoA4mEumb8bOFpM+gatpnJlJ7wtASmKm09vo5Zx6gpnCm0PTmynlri2iC/g4sZYyKqY85LV+Saz
	BT1j6DObAwKOS9sdzGcXg2yRb955cU2TGe1RR9ASKSXcutWsbg44Io1/G3385F3wgVSn/nQZljji1
	1bubjK0XNRHcHrq6ksVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtqDZ-0001ND-0M; Wed, 13 Feb 2019 08:48:33 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtqDV-0001MU-FO
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 08:48:31 +0000
Received: by mail-wr1-x444.google.com with SMTP id x10so1489685wrs.8
 for <linux-riscv@lists.infradead.org>; Wed, 13 Feb 2019 00:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cEpWGg1h+mnrJufQh7Ng7TE3wjG5O41fk+jfrTVIKNw=;
 b=cKjafkJTYOLTG4ho2NBdRPJuHJRUCROn4QQLCiVbiDKGab2p54QMizO3CM961ycXJZ
 6ukqMH1AnlS8ifhPgvvl/2NuL3ExnBDBtdcHB2BdmbEOxvLNdsLaL9z2JtvdIVOyOUJW
 lRPcc1gKVg1rwxPUDZUb8tXECWg9feqt5L6YKKJrNVfuk+qAvRaLvQijCUAURYOlow7Y
 tm3HrdXcy5sDscxbsT0WFLJ2MyoZaDmouiXCLqTvSqu/i0OWudWvbe80G5dsw7qP7GsW
 9OfNgpdmACEAB9Sx7Auhupq0lE6wheTuJtY/TfllBM3gLTKOSptHAQlymzS0Xt6O6ET/
 HfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cEpWGg1h+mnrJufQh7Ng7TE3wjG5O41fk+jfrTVIKNw=;
 b=LW19Q7+0q23NrixogjaogDVsjkJC5vqaSO4haiOAX6AaMXvPbLa0bMTpFPayGQBREq
 qaS1dwfmzL4mypnxdVsYldwVHfO2KjelLXL/qPNH/hW6suAixwJsSa/P6Qwh72iT7I8Q
 9BTse2IxBO1vc3l73q+YjgQPzCAvQlKE/y7CjCX3dUispF7fhgmvd3+WSkbG4/VCJOrf
 EbOkP/59BjOBTOHkPzkDi16y1qnKi6vddJQCht6iJ23FWaLKA9OXHLJsucHCt2+C/WAn
 jS4mZHL10Rxvpp5Ow9YUTt/L4PY8KagFkA6p2YkCg0iHGnPxy588MSxJ/ger+EOHvvKh
 1U8g==
X-Gm-Message-State: AHQUAuZrHi4vYY4LXP3of6FGSwxSyvc5vU+Ri042oDq/p6UKsNvk0/wr
 m7TNa8BQlHPGqQdW/Ysoh5N0FQ==
X-Google-Smtp-Source: AHgI3IZxSryTmgOpTAXNToofH1y31OBOFXU/hKGdkp6Qr9p5XiWEADAeifWveE9JMRRTS+EDLC3SMA==
X-Received: by 2002:adf:9f48:: with SMTP id f8mr6314943wrg.151.1550047707235; 
 Wed, 13 Feb 2019 00:48:27 -0800 (PST)
Received: from [192.168.27.65] (sju31-1-78-210-255-2.fbx.proxad.net.
 [78.210.255.2])
 by smtp.googlemail.com with ESMTPSA id w16sm11901697wrp.1.2019.02.13.00.48.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Feb 2019 00:48:26 -0800 (PST)
Subject: Re: [v4 PATCH 6/8] clocksource/drivers/riscv: Add required checks
 during clock source init
To: Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org
References: <1549969812-22502-1-git-send-email-atish.patra@wdc.com>
 <1549969812-22502-7-git-send-email-atish.patra@wdc.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <7bd250fb-c896-64e1-d73b-6f3dd284e2d6@linaro.org>
Date: Wed, 13 Feb 2019 09:48:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1549969812-22502-7-git-send-email-atish.patra@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_004829_513659_7DD9AB44 
X-CRM114-Status: GOOD (  17.03  )
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
Cc: Rob Herring <robh@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Andreas Schwab <schwab@suse.de>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMDIvMjAxOSAxMjoxMCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gQ3VycmVudGx5LCBjbG9j
a3NvdXJjZSByZWdpc3RyYXRpb24gaGFwcGVucyBmb3IgYW4gaW52YWxpZCBjcHUgZm9yCj4gbm9u
LXNtcCBrZXJuZWxzLiBUaGlzIGxlYWQgdG8ga2VybmVsIHBhbmljIGFzIGNwdSBob3RwbHVnIHJl
Z2lzdHJhdGlvbgo+IHdpbGwgZmFpbCBmb3IgdGhvc2UgY3B1cy4gTW9yZW92ZXIsIHJpc2N2X2hh
cnRpZF90b19jcHVpZCBjYW4gcmV0dXJuCj4gZXJyb3JzIG5vdy4KPiAKPiBEbyBub3QgcHJvY2Vl
ZCBpZiBoYXJ0aWQgb3IgY3B1aWQgaXMgaW52YWxpZC4gVGFrZSB0aGlzIG9wcHJ0dW5pdHkgdG8K
PiBwcmludCBhcHByb3ByaWF0ZSBlcnJvciBzdHJpbmdzIGZvciBkaWZmZXJlbnQgZmFpbHVyZSBj
YXNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNv
bT4KCkRvIHlvdSB3YW50IG1lIHRvIHRha2UgaXQgdGhyb3VnaCBteSB0cmVlID8KCgo+IC0tLQo+
ICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCAyMyArKysrKysrKysrKysrKysr
KysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jIGIv
ZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1yaXNjdi5jCj4gaW5kZXggNDMxODkyMjAuLmU4MTYz
NjkzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+ICsr
KyBiL2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+IEBAIC05NSwxMyArOTUsMzAg
QEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfdGltZXJfaW5pdF9kdChzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm4pCj4gIAlzdHJ1Y3QgY2xvY2tzb3VyY2UgKmNzOwo+ICAKPiAgCWhhcnRpZCA9IHJpc2N2
X29mX3Byb2Nlc3Nvcl9oYXJ0aWQobik7Cj4gKwlpZiAoaGFydGlkIDwgMCkgewo+ICsJCXByX3dh
cm4oIk5vdCB2YWxpZCBoYXJ0aWQgZm9yIG5vZGUgWyVwT0ZdIGVycm9yID0gWyVkXVxuIiwKPiAr
CQkJbiwgaGFydGlkKTsKPiArCQlyZXR1cm4gaGFydGlkOwo+ICsJfQo+ICsKPiAgCWNwdWlkID0g
cmlzY3ZfaGFydGlkX3RvX2NwdWlkKGhhcnRpZCk7Cj4gKwlpZiAoY3B1aWQgPCAwKSB7Cj4gKwkJ
cHJfd2FybigiSW52YWxpZCBjcHVpZCBmb3IgaGFydGlkIFslZF1cbiIsIGhhcnRpZCk7Cj4gKwkJ
cmV0dXJuIGNwdWlkOwo+ICsJfQo+ICAKPiAgCWlmIChjcHVpZCAhPSBzbXBfcHJvY2Vzc29yX2lk
KCkpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICsJcHJfaW5mbygiJXM6IFJlZ2lzdGVyaW5nIGNsb2Nr
c291cmNlIGNwdWlkIFslZF0gaGFydGlkIFslZF1cbiIsCj4gKwkgICAgICAgX19mdW5jX18sIGNw
dWlkLCBoYXJ0aWQpOwo+ICAJY3MgPSBwZXJfY3B1X3B0cigmcmlzY3ZfY2xvY2tzb3VyY2UsIGNw
dWlkKTsKPiAtCWNsb2Nrc291cmNlX3JlZ2lzdGVyX2h6KGNzLCByaXNjdl90aW1lYmFzZSk7Cj4g
KwllcnJvciA9IGNsb2Nrc291cmNlX3JlZ2lzdGVyX2h6KGNzLCByaXNjdl90aW1lYmFzZSk7Cj4g
KwlpZiAoZXJyb3IpIHsKPiArCQlwcl9lcnIoIlJJU0NWIHRpbWVyIHJlZ2lzdGVyIGZhaWxlZCBb
JWRdIGZvciBjcHUgPSBbJWRdXG4iLAo+ICsJCSAgICAgICBlcnJvciwgY3B1aWQpOwo+ICsJCXJl
dHVybiBlcnJvcjsKPiArCX0KPiAgCj4gIAlzY2hlZF9jbG9ja19yZWdpc3RlcihyaXNjdl9zY2hl
ZF9jbG9jaywKPiAgCQkJQklUU19QRVJfTE9ORywgcmlzY3ZfdGltZWJhc2UpOwo+IEBAIC0xMTAs
OCArMTI3LDggQEAgc3RhdGljIGludCBfX2luaXQgcmlzY3ZfdGltZXJfaW5pdF9kdChzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm4pCj4gIAkJCSAiY2xvY2tldmVudHMvcmlzY3YvdGltZXI6c3RhcnRpbmci
LAo+ICAJCQkgcmlzY3ZfdGltZXJfc3RhcnRpbmdfY3B1LCByaXNjdl90aW1lcl9keWluZ19jcHUp
Owo+ICAJaWYgKGVycm9yKQo+IC0JCXByX2VycigiUklTQ1YgdGltZXIgcmVnaXN0ZXIgZmFpbGVk
IFslZF0gZm9yIGNwdSA9IFslZF1cbiIsCj4gLQkJICAgICAgIGVycm9yLCBjcHVpZCk7Cj4gKwkJ
cHJfZXJyKCJjcHUgaHAgc2V0dXAgc3RhdGUgZmFpbGVkIGZvciBSSVNDViB0aW1lciBbJWRdXG4i
LAo+ICsJCSAgICAgICBlcnJvcik7Cj4gIAlyZXR1cm4gZXJyb3I7Cj4gIH0KPiAgCj4gCgoKLS0g
CiA8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29m
dHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2su
Y29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFy
b29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9n
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
