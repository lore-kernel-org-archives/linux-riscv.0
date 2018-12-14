Return-Path: <SRS0=7WNQ=OX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578CBC67839
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 09:17:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 299C220866
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 14 Dec 2018 09:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lgr0uLy1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHk5BADs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 299C220866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHv5JoYJxU0tcq8GWkBGtQTfTS2XB2afobK6+usZS5I=; b=Lgr0uLy1qVHiPq
	D63rXSxjd4X2yJfUXcDjpQkCMoHZziwFNIG3cnxruF0CJAg+9k0eGl9uHNpjLyQNaduixzbhhYz6z
	19Kf5rtkLWns8KtT0RdIcgBendz7DYgenBEotSBnKabnxlLGQeZLZ5buhUTSSBcqoMIsvVmhvLcFS
	wYP4afHSH8NBajft8hSeWc+iAMi3ax3j8ASFSWUQUjPvR2UdXFKjq6NauJ97WViGxUBtWwmFl6eAl
	9tT1cBSFsssc1pNX+wB0h2ZOgL5lvTg8DFuV8Ow+LBHqG+YsVQq3InbhmL6r4ScU3EplUXSRQnhXO
	uquXUb8xtEVx2hH6rLZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXjbM-00052r-1t; Fri, 14 Dec 2018 09:17:44 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXjbJ-00051o-3r
 for linux-riscv@lists.infradead.org; Fri, 14 Dec 2018 09:17:42 +0000
Received: by mail-wm1-x344.google.com with SMTP id s14so4964633wmh.1
 for <linux-riscv@lists.infradead.org>; Fri, 14 Dec 2018 01:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7UCphVpGxcgorfFMBuUs6+drT6tpgBRcwZsgdfxlhF4=;
 b=CHk5BADsuqOP/zMPk6h9fYHYJRhPt5i4RFkjYeHyiAlqQZUQj5DS70zq5W5O5WlHEL
 L9FNz24uf4eYK1XoruC11b0/4hiXrzxH48FU1SHEMQdfoQ4OZQOV9VT5v0Sj0gFr9CHG
 ToD3N2JY3ymOLXEsjqDRJXOnDp6EEPqx+W9+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7UCphVpGxcgorfFMBuUs6+drT6tpgBRcwZsgdfxlhF4=;
 b=KKVfL9rVBe11TWei1GN5NnS7gtHoLEYNMJ5+4NZZixo6nKcD1NAi0dxvBjZ7HTljbB
 i5gDMZo8Hm+rYF43ZgSfGgD+v5dsO2nNkAL7xD4VMIjnBFeqZ466GwIJKPcFL5Gp8lY6
 QGLhW6oQkrFFrFvNyCVYxPD7lrBjBpSHTb1OBbqp+Z7OETLBVcGbSfb0u3pDe5okiS9a
 r4SS6frGGlLrRRr6JY7yZztlIFu9qecRpMHuN/hlWeKyhTBQJu+xUyNUuhXiZ7JUfAYW
 +TImf9c6twLsV+Ocqb+WoK/BEvGJDOO3Jp+r3cM7OvyGdXvpq5EgjfEQZUZzJ6r0f+Uk
 HC6w==
X-Gm-Message-State: AA+aEWZMGPIvXwyXyeN5DCa8lib3PHRMzI5q0fg7mW1+6jPZpCVAFxLD
 Vq8T7IeqDt/1eAbpD61LOw3JuQ==
X-Google-Smtp-Source: AFSGD/X/EA5xiLHEZ0OUya6FXxpT2ZTa9Gbbt5BVpadmOd95AyCBJvVkI5EidKP3n0i0FLL53lnYsg==
X-Received: by 2002:a1c:a58a:: with SMTP id o132mr2712844wme.6.1544779047107; 
 Fri, 14 Dec 2018 01:17:27 -0800 (PST)
Received: from [192.168.0.40] (77.37.95.92.rev.sfr.net. [92.95.37.77])
 by smtp.googlemail.com with ESMTPSA id b12sm2861827wrt.17.2018.12.14.01.17.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Dec 2018 01:17:26 -0800 (PST)
Subject: Re: [PATCH v2 1/4] dt-bindings: Correct RISC-V's timebase-frequency
To: Atish Patra <atish.patra@wdc.com>, linux-kernel@vger.kernel.org
References: <1544742869-19980-1-git-send-email-atish.patra@wdc.com>
 <1544742869-19980-2-git-send-email-atish.patra@wdc.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <5d652370-4782-23b2-9896-b9666b3cc1e7@linaro.org>
Date: Fri, 14 Dec 2018 10:17:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1544742869-19980-2-git-send-email-atish.patra@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_011741_158889_B1CCBCB2 
X-CRM114-Status: GOOD (  19.08  )
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
 Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTQvMTIvMjAxOCAwMDoxNCwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gRnJvbTogUGFsbWVyIERh
YmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPgo+IAo+IEluIFJJU0MtViBzeXN0ZW1zLCB0aW1lYmFz
ZS1mcmVxdWVuY3kgaXMgcGVyIGNwdSBpbnN0ZWFkIG9mIG9uZQo+IGluc3RhbmNlIGZvciBlbnRp
cmUgU09DIGFzIHRoZXJlIGlzIGEgaW5kaXZpZHVhbCB0aW1lciBwZXIgZWFjaCBDUFUuCj4gRml4
IHRoZSBEVCBiaW5kaW5nIGFjY29yZGluZ2x5LgoKV2h5IG5vdCB1c2UgYSBmaXhlZC1jbG9jayBp
bnN0ZWFkIG9mIHRoaXMgdGltZWJhc2UgcHJvcGVydHkgd2hpY2ggZm9yY2VzCnRvIGRlY2xhcmUg
YSBnbG9iYWwgdmFyaWFibGUgdG8gYmUgZXhwb3J0ZWQgZnJvbSBhcmNoL3Jpc2N2IHRvCmRyaXZl
cnMvY2xvY2tzb3VyY2UgPwoKSW4gYWRkaXRpb24sIHBsZWFzZSBhZGQgdGhlICdGaXhlcycgdGFn
Cgo+IFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAc2lmaXZlLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBbQXRpc2g6IFVw
ZGF0ZSB0aGUgY29tbWl0IHRleHRdCj4gU2lnbmVkLW9mZi1ieTogQXRpc2ggUGF0cmEgPGF0aXNo
LnBhdHJhQHdkYy5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVz
LnR4dCB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9jcHVzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNj
di9jcHVzLnR4dAo+IGluZGV4IGFkZjdiN2FmLi5iMGIwMzhkNiAxMDA2NDQKPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy50eHQKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy50eHQKPiBAQCAtOTMsOSAr
OTMsOSBAQCBMaW51eCBpcyBhbGxvd2VkIHRvIHJ1biBvbi4KPiAgICAgICAgICBjcHVzIHsKPiAg
ICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICAgICAgICAgICAgICAgICAg
I3NpemUtY2VsbHMgPSA8MD47Cj4gLSAgICAgICAgICAgICAgICB0aW1lYmFzZS1mcmVxdWVuY3kg
PSA8MTAwMDAwMD47Cj4gICAgICAgICAgICAgICAgICBjcHVAMCB7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwxNjAwMDAwMDAwPjsKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgdGltZWJhc2UtZnJlcXVlbmN5ID0gPDEwMDAwMDA+Owo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpZml2ZSxyb2NrZXQwIiwgInJpc2N2IjsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAiY3B1IjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgaS1jYWNoZS1ibG9jay1zaXplID0gPDY0PjsKPiBAQCAtMTEzLDYgKzEx
Myw3IEBAIExpbnV4IGlzIGFsbG93ZWQgdG8gcnVuIG9uLgo+ICAgICAgICAgICAgICAgICAgfTsK
PiAgICAgICAgICAgICAgICAgIGNwdUAxIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgY2xv
Y2stZnJlcXVlbmN5ID0gPDE2MDAwMDAwMDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICB0
aW1lYmFzZS1mcmVxdWVuY3kgPSA8MTAwMDAwMD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAic2lmaXZlLHJvY2tldDAiLCAicmlzY3YiOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICBkLWNhY2hlLWJsb2NrLXNpemUgPSA8NjQ+Owo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICBkLWNhY2hlLXNldHMgPSA8NjQ+Owo+IEBAIC0xNDUsNiArMTQ2LDcgQEAgRXhhbXBs
ZTogU3Bpa2UgSVNBIFNpbXVsYXRvciB3aXRoIDEgSGFydAo+ICBUaGlzIGRldmljZSB0cmVlIG1h
dGNoZXMgdGhlIFNwaWtlIElTQSBnb2xkZW4gbW9kZWwgYXMgcnVuIHdpdGggYHNwaWtlIC1wMWAu
Cj4gIAo+ICAgICAgICAgIGNwdXMgewo+ICsgICAgICAgICAgICAgICAgdGltZWJhc2UtZnJlcXVl
bmN5ID0gPDEwMDAwMDA+Owo+ICAgICAgICAgICAgICAgICAgY3B1QDAgewo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJjcHUiOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHgwMDAwMDAwMD47CgoKCgoKLS0gCiA8aHR0cDovL3d3dy5saW5hcm8ub3Jn
Lz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xs
b3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJv
b2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8v
d3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
