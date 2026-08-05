Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707F7C55174
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Aug 2026 03:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uRI450WND/p3V3vpn3gEPW9V4DKTcR1q409i6BeiKOg=; b=UNunyDCFpkIkm3LytYhhZiuu0v
	O2RAa7shsv9PnjIrk8p4C+1NqFMkAlDlE2E0wdMOHKtnqDurJZ7XCBsDKM+HbZbuM0U1qrMKsMY+z
	Zak06msgaDnAcm27ipM3geOg2eZ5EBO9OUd+FeubExVPv8I2UUza2u/EWaD5jBWe6IZC299vxCqpd
	7LOBNhaRQW2kym5yy54+KfnZlukO3Ar42XXy5Acqn1UdOoi5nN6ZbB8YLtmOMU/9NW9buEdj/KYzO
	/ItOywVtIV2BM9DFjrLLa1XJBLbr1//yxPIkB/W1HmvagdzQbuYuwoAFu4JeBQi43F2eLCRqQe3sm
	OjDrOcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSd1-00000003Bt3-1tXv;
	Wed, 05 Aug 2026 03:49:15 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrScz-00000003Bs2-1MMR
	for linux-riscv@lists.infradead.org;
	Wed, 05 Aug 2026 03:49:14 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6ae88f4e4f4so310738eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 20:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785901748; cv=none;
        d=google.com; s=arc-20260327;
        b=fEW2NQugBa/zVUhx34sIhvJFZ3pq6PTtzQXK2uN2kIygS9AiEBqVFg+3sPm2axLvlK
         Tuk05SxhsiWfpSUDLwZq9q0JGoNJyZV2jgw6aVoyEBTr/+NOBY72rksrKjKUOO5C4sZR
         2L/C+yMLb3fhOvc6Y6W9YCDkL1uR5FyP2+k40V/1kd7fGKXs8twgwuZqxq+YR9fIQxto
         zuBaLbZf+ryZJIT+VAqnTjqAZc7Jt3WSzqtBKthkZf52k4w7UECj9kNoWS1dR0EtjZHt
         xpNzGZ2m/PZPv6OUyzf54InwZrha8nfBsHroXA2ejFoBs9dWcPUThkUfnbKQtlzIofGv
         vZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ll2P0qYxyfEF/ILiWPhyeOUnag1IndBgGQoJ1d2b5Xg=;
        fh=0e5RtPUJiyGSw1vDp/VXor8woWGlHCZ2ordbRWW4Rs0=;
        b=Pyx4Ib5X86FYIxMr6kPNTXJJByo2Lq9a4oUlvDMnV1O3Z15TZUVZ8N6AxJLbwPo6oJ
         epFaZYRqoBhBivIyCtaPTtkf8V9pI+iPFSFsl+wAQrLpT8CUeogZsrJLvt+wx0I2UDKK
         vmZUVEOYbKQsSMiBN5le/NgTt5rcklG8ihYe+ScMfbrJ7H7ow8gPNT4b62SqOT077oeh
         8DEITiVSYH1QMufihOjAAYtrkznM2jx0Vbg0VEuteickFzpZMRdLSUhM+4V+yrZOrFfA
         XaHVDrqlP8agni9nvejntp9tPNQYd7w3tjC5tTJmbCytG2BLAzNVcUjh3Ef0LjA6CChv
         7vkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1785901748; x=1786506548; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll2P0qYxyfEF/ILiWPhyeOUnag1IndBgGQoJ1d2b5Xg=;
        b=REfDGewTwydrqWbLgRog5AudtvGGM3bva1klf6+9ymS8wAXXF4g6yZVZuHmemZu2iD
         YJtfpGNNhJ2ZQwm1M/mmgM8y8NVYG27KL/tPkR52UMSfDgor4QnayyXmZRzGWAFbOQaq
         lihm8rvvTqud5BIz7Kjo1v68FLpJWrVpYIUrs4Old2eJunLALb7CMZIT493kJDuZJLGZ
         6bL8jYEH/3nkolACEV8Iro4dDBwfVLMTI0WNZi2vk2FQrJO3m81uGQoAKwAx7EH4bd5a
         BT3Q9GNdEpn8+hrcg1QMD41j/FXeGyrK/wqF0kbNF1ID2DyrKdYiPNzB3FIXLg9F9h8D
         lIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785901748; x=1786506548;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll2P0qYxyfEF/ILiWPhyeOUnag1IndBgGQoJ1d2b5Xg=;
        b=q9CKM3uqwD8pulMImuPgDzoxxtObDo4D+TuYrfpV2UqE/wdRjrSpT9OQmPu5P+DpF5
         2taDlDZOHWHR36jON1x24S5gx/m4NdR6D8bl9x19Udk550aWV+ZbyEVVa/Sah7jQ6CKv
         m5Wi5jZrsbYYYXRwoS8TmbkJuh+kwjEbHDjZNQtrgNrXuVGv1U1ugH5AYy50551d2sy6
         TarVCK7TQxj6W6DBmMaAEjrUTMX6uMhgp09u1yNxA8kNdamVEIIFrZqyNKTDY5iOWb2G
         Pl7IGxOZdGI8oLGQuCDa4NbBktsAG+dOVOmlqaNFE8OI6n9p/f5qhxVpU4Jfyq7ewDzT
         OdoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbI/Qf1Oj2gw0wBEKm+6FFeK0rKj5YuZVYkPEWENZ3u7i9RD0SkUlzymcqY1rEsdcjvv5LvhcEqGe7jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLY0+0g6osZmqDh0MAw3fGJH+CT9JJWN4Z4iFs7Ztlgz0eNGoZ
	raWxvY37NbcqOv4SM5nitTmArrM6v5XlFjx9x4FERH4+0+oSd/kbKlloPV4rC6s3EV4n4qukMT2
	5ZZjXBrpj/EI5Btn3aL9Ej/Bxqa2f61d2LIQIcPkdnA==
X-Gm-Gg: AR+sD113OHyHKgkAXy4lbptNodbxZzlAjWPFzQPo/8ksE7rQEl0uKEC4U/z6aJN8jkc
	hbp1THBnTBZH3UY+Ldcpnp+VhvvqT73/dHuytlGQ0MSRpLniOnqn9GOmaM/ZHtqugDQsIdWSBkK
	lRmDcjKvWZL4oxV5Q0wH4bkATzAdb4/RHgG+vzegsLPqHThD/UEp9z3SLGXI+EjMBHS4q8Y2CCX
	HvqCHH3PuU1B/gv3xOJpl9bC1hBSTDlSeeaWlotVllXBdcAApSXy6dJL7qml7eyXus2/b3EC21p
	cy3/YjMeedEPO9xFx6TKrrSXd+EKFNtWQzo/KaozcNcp1CM=
X-Received: by 2002:a05:6820:f02b:b0:6aa:d792:e0a6 with SMTP id
 006d021491bc7-6ae96d11b94mr2031328eaf.13.1785901748338; Tue, 04 Aug 2026
 20:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260623083551.86021-1-cuiyunhui@bytedance.com>
In-Reply-To: <20260623083551.86021-1-cuiyunhui@bytedance.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 5 Aug 2026 11:48:54 +0800
X-Gm-Features: AUfX_mxkEk2FizVQlsQRGMPr_E2pPPQi1y_XYdvAEmWHCmq-R0HPoI5qVJCGVUA
Message-ID: <CAEEQ3wkOOLbFrRRyvLtJdwLFfmTOHdacX3zX0b-=vzipwsJcbg@mail.gmail.com>
Subject: Re: [PATCH] riscv: uaccess: Add a fast path for small aligned copies
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	cuiyunhui@bytedance.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_204913_377275_E56D43AF 
X-CRM114-Status: GOOD (  21.21  )
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

SGkgUGF1bCwKCk9uIFR1ZSwgSnVuIDIzLCAyMDI2IGF0IDQ6MzbigK9QTSBZdW5odWkgQ3VpIDxj
dWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBUaGUgc2NhbGFyIHVzZXIgY29weSBy
b3V0aW5lIGN1cnJlbnRseSBlbnRlcnMgdGhlIHdvcmQtY29weSBwYXRoIG9ubHkKPiBmb3IgY29w
aWVzIG9mIGF0IGxlYXN0IDkgKiBTWlJFRyAtIDEgYnl0ZXMuIE9uIFJWNjQgdGhpcyBpcyA3MSBi
eXRlcywKPiBzbyBjb21tb24gMzItYnl0ZSBhbmQgNjQtYnl0ZSBhbGlnbmVkIHVzZXIva2VybmVs
IGNvcGllcyBmYWxsIGJhY2sgdG8KPiBieXRlLWJ5LWJ5dGUgY29weWluZy4KPgo+IEFkZCBhIHNt
YWxsLWNvcHkgd29yZCBwYXRoIGZvciBjb3BpZXMgYmVsb3cgdGhhdCB0aHJlc2hvbGQgd2hlbiBi
b3RoCj4gc291cmNlIGFuZCBkZXN0aW5hdGlvbiBhcmUgU1pSRUctYWxpZ25lZC4gVW5hbGlnbmVk
IGFuZCBzdWItd29yZCBjb3BpZXMKPiBrZWVwIHVzaW5nIHRoZSBleGlzdGluZyBieXRlLWNvcHkg
cGF0aCwgYW5kIGxhcmdlciBjb3BpZXMga2VlcCB1c2luZyB0aGUKPiBleGlzdGluZyBsYXJnZS1j
b3B5IHBhdGhzLgo+Cj4gVGhpcyBpcyBhIGdlbmVyaWMgdXNlcmNvcHkgaW1wcm92ZW1lbnQuIE9u
ZSBjb21tb24gY2FzZSBpcyBMaW51eCBBSU86Cj4gaW9fZ2V0ZXZlbnRzKCkgY29waWVzIDMyLWJ5
dGUgc3RydWN0IGlvX2V2ZW50IG9iamVjdHMgdG8gdXNlcnNwYWNlLCBhbmQKPiBpb19zdWJtaXQo
KSBjb3BpZXMgNjQtYnl0ZSBzdHJ1Y3QgaW9jYiBvYmplY3RzIGZyb20gdXNlcnNwYWNlLgo+Cj4g
ZmlvIGxpYmFpbyByYW5kcncgdGhyZWUtcnVuIGF2ZXJhZ2VzIGltcHJvdmVkOgo+Cj4gICBiYXNl
bGluZTogICByZWFkIDU2MGsgSU9QUywgd3JpdGUgMjQwayBJT1BTLCBzeXMgNjguNjAlCj4gICB0
aGlzIHBhdGNoOiByZWFkIDU5M2sgSU9QUywgd3JpdGUgMjU0ayBJT1BTLCBzeXMgNjkuMDMlCj4K
PiBUaGlzIGlzIGFib3V0ICs1LjglIHJlYWQgSU9QUyBhbmQgKzUuNSUgd3JpdGUgSU9QUy4KPgo+
IGxtYmVuY2ggYndfcGlwZSB3aXRoIHNtYWxsIG1lc3NhZ2VzIHdhcyBhbHNvIGltcHJvdmVkOgo+
Cj4gICBid19waXBlIC1tIDxzaXplPiAtTSAxNm0gLVcgMSAtTiA1Cj4KPiAgIHNpemUgICBiYXNl
bGluZSBNQi9zICAgdGhpcyBwYXRjaCBNQi9zICAgY2hhbmdlCj4gICAgMzIgICAgICAgNjIuNTIg
ICAgICAgICAgICA3NC41NCAgICAgICAgICsxOS4yJQo+ICAgIDY0ICAgICAgMTIyLjU3ICAgICAg
ICAgICAxNTUuMzEgICAgICAgICArMjYuNyUKPgo+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBDdWkg
PGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2xpYi91YWNjZXNz
LlMgfCAxOSArKysrKysrKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbGliL3Vh
Y2Nlc3MuUyBiL2FyY2gvcmlzY3YvbGliL3VhY2Nlc3MuUwo+IGluZGV4IDRlZmVhMWIzMzI2Yzgu
LjJkNzgwMDdmMTBkMDEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4g
KysrIGIvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4gQEAgLTcwLDEyICs3MCwyNyBAQCBTWU1f
RlVOQ19TVEFSVChmYWxsYmFja19zY2FsYXJfdXNlcmNvcHlfc3VtX2VuYWJsZWQpCj4gICAgICAg
ICBhZGQgICAgIHQwLCBhMCwgYTIKPgo+ICAgICAgICAgLyoKPiAtICAgICAgICAqIFVzZSBieXRl
IGNvcHkgb25seSBpZiB0b28gc21hbGwuCj4gLSAgICAgICAgKiBTWlJFRyBob2xkcyA0IGZvciBS
VjMyIGFuZCA4IGZvciBSVjY0Cj4gKyAgICAgICAgKiBGb3Igc21hbGwgY29waWVzIGJlbG93IHRo
ZSBsYXJnZS1jb3B5IHRocmVzaG9sZCwgdXNlIHdvcmQtY29weSBpZgo+ICsgICAgICAgICogYm90
aCBzcmMgYW5kIGRzdCBhcmUgbmF0dXJhbGx5IGFsaWduZWQuIFVuYWxpZ25lZCBvciBzdWItd29y
ZCBjb3BpZXMKPiArICAgICAgICAqIGFyZSBsZWZ0IHRvIHRoZSBieXRlLWNvcHkgdGFpbC4KPiAg
ICAgICAgICAqLwo+ICAgICAgICAgbGkgICAgICBhMywgOSpTWlJFRy0xIC8qIHNpemUgbXVzdCA+
PSAod29yZF9jb3B5IHN0cmlkZSArIFNaUkVHLTEpICovCj4gKyAgICAgICBiZ2V1ICAgIGEyLCBh
MywgLkxsYXJnZV9jb3B5X3VzZXIKPiArICAgICAgIGxpICAgICAgYTMsIFNaUkVHCj4gICAgICAg
ICBibHR1ICAgIGEyLCBhMywgLkxieXRlX2NvcHlfdGFpbAo+ICsgICAgICAgb3IgICAgICBhMywg
YTAsIGExCj4gKyAgICAgICBhbmRpICAgIGEzLCBhMywgU1pSRUctMQo+ICsgICAgICAgYm5leiAg
ICBhMywgLkxieXRlX2NvcHlfdGFpbAo+ICsgICAgICAgYW5kaSAgICB0MSwgdDAsIH4oU1pSRUct
MSkKPiArNToKPiArICAgICAgIGZpeHVwIFJFR19MICAgYTUsIDAoYTEpLCAxMGYKPiArICAgICAg
IGFkZGkgICAgYTEsIGExLCBTWlJFRwo+ICsgICAgICAgZml4dXAgUkVHX1MgICBhNSwgMChhMCks
IDEwZgo+ICsgICAgICAgYWRkaSAgICBhMCwgYTAsIFNaUkVHCj4gKyAgICAgICBibHR1ICAgIGEw
LCB0MSwgNWIKPiArICAgICAgIGogICAgICAgLkxieXRlX2NvcHlfdGFpbAo+Cj4gKy5MbGFyZ2Vf
Y29weV91c2VyOgo+ICAgICAgICAgLyoKPiAgICAgICAgICAqIENvcHkgZmlyc3QgYnl0ZXMgdW50
aWwgZHN0IGlzIGFsaWduZWQgdG8gd29yZCBib3VuZGFyeS4KPiAgICAgICAgICAqIGEwIC0gc3Rh
cnQgb2YgZHN0Cj4gLS0KPiAyLjM5LjUKPgoKQ291bGQgeW91IHBsZWFzZSBoZWxwIGNvbmZpcm0g
d2hldGhlciB0aGlzIHBhdGNoIGNhbiBiZSBtZXJnZWQ/CgpUaGFua3PvvIwKWXVuaHVpCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
