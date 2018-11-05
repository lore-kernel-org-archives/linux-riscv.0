Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A05CC46475
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 16:03:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F144420827
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 16:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M+xFKzeE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="GiPtssnK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F144420827
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J6CMk5fgDoCCUnikzhrZuiT+pYcEXGR+JNVtvGsWTuM=; b=M+xFKzeEzKRTlK
	5YI/HkLXbwsHeGHHW8v8wKszXXnzCyDYtRriQ3Dtu2WcqGihGH2eqpNsdP2CH6uxSz7HVyYZRKMn3
	jLAugG0nvDBt+9tG5gVt04ElJ0JUFvbh8uo2toa/P2iky2pShK//ecDGm8R4ZTVMBDArXj9TOr6Ou
	RekWMgUwBRotyW9g5zZgfQH/9NsP7yTZKM7kTu6W9aFrJCOjCmwBmCe2C1gKo0fbD58WXRZzYhacm
	t0NGNFtG0/zaF+MfZrPKt54TXaEhDxZro4fXDp7D/63dfxF81v6Yuv6IjPRiYzbDOzwEMdNaf5r8e
	4ViT8ZYla/5mP9Owf5Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJhLU-0007AK-TC; Mon, 05 Nov 2018 16:03:20 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJhLS-000794-FF
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 16:03:19 +0000
Received: by mail-lj1-x241.google.com with SMTP id j4-v6so8495574ljc.12
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 08:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZMxhmbRAIQLj3oBn3eeQ8aveNoV65uYF5CVgV05Xyuk=;
 b=GiPtssnKl+CaYcqrZMuvjYnXfJEkhYhBdBk25cK3lMl5KHop+yZDGdkKEBVAWelLOD
 XFoXM6UHeFBGL1xiYaLo0wDP1NDAtA8li3Ebkbd+MzXjTD67OXlAn9kIqT2Wgd5Uyo5p
 3gOWByV58uKDmRcPpGA2EdqoDXHJ9gLZF6HEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZMxhmbRAIQLj3oBn3eeQ8aveNoV65uYF5CVgV05Xyuk=;
 b=NeypFLqyot058/MGcSWd9ifuFoJxYNghFVJ+0bfQuRrhkF/pQwm3Yn2sTBApEPMwkJ
 XwJe63DT9Cc04mAtpvb4d81k+aBIw8PWFbKmE0QVgIn8UOL0lkl88AJNohLvm3nA1fdx
 CKVeVrAqPZtBXcPL9lQ7byUttp/HE93m1R+NJYbV08Ng1RSrlxxY7+34kY0bJBqxt1vv
 jKoKbHU/ng52qynFyIUX0kdLh/8tn+dsrkD+4O0N6EgIa7galokNj6l5Oh3rhu/GOlCZ
 kWucytUAs2c34lCyvCKgbKNyaYqrA74UkaFSPRj7tN+lc6JF5HAVd7fyt78HUt4HBQ4o
 SBRA==
X-Gm-Message-State: AGRZ1gJYzg15Hu/favNXQatJNHU76bEyYEmR11VItrVbd6sGk/mevQwT
 bQOV0UMyn3TXkPgOrn/TcJh/Og==
X-Google-Smtp-Source: AJdET5dHwTi+LwResUvqRCTJaFDsD+V9E3BMBcl9877qrnDgToHnef7nrlD6NwZfnQ8oNqQkZ2sGKg==
X-Received: by 2002:a2e:9107:: with SMTP id
 m7-v6mr14900524ljg.23.1541433781673; 
 Mon, 05 Nov 2018 08:03:01 -0800 (PST)
Received: from puchatek.local (89-77-138-96.dynamic.chello.pl. [89.77.138.96])
 by smtp.gmail.com with ESMTPSA id
 67-v6sm1724796ljc.26.2018.11.05.08.03.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Nov 2018 08:03:00 -0800 (PST)
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
To: David Abdurachmanov <david.abdurachmanov@gmail.com>, palmer@sifive.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=marcin.juszkiewicz@linaro.org; prefer-encrypt=mutual; keydata=
 xsBNBFpUjlUBCACcrMkSqYJk8B5O6vhcdvMM4yMBxil9hqLD6oKoLkgNCGpnb03xtf2dkdbq
 yZJKEpPteoiYof/qrS7VewUcqWpNfuq5Q3x/Aun89CUVU1GZ+mY+nHhiTddSTCswCNhYfY8S
 lu0eCYIeF5xr3xNcvRIQhxvO1y3aLAo7Te7CikfmtpcM/5IEbUX3EXejoUeMlvdXvX19NM6I
 8uX1DO7v9g0CUN+1h+9YOvLIV+bOJ33jlsB2TNystteoBKotJYhIbfBhrLMWLMzBhOPUaTIe
 hlGO3+4CHi82MqowKYxablG29vFSCn6UFyJS25xLSbMflslCFJey8I4Wry33R1dmzT2jABEB
 AAHNMk1hcmNpbiBKdXN6a2lld2ljeiA8bWFyY2luLmp1c3praWV3aWN6QGxpbmFyby5vcmc+
 wsCOBBMBCAA4FiEE8CbDcZeweWDKBjDApkmLmwOs1qMFAlpUjlUCGwMFCwkIBwIGFQgJCgsC
 BBYCAwECHgECF4AACgkQpkmLmwOs1qMVDQf/aIA4NIB03g6JqFoTvhrzvc+n5ALveUyRyChY
 QE71qYCRJi+2A8apTGxkJuk15I9bJ8ySnb6Z51MRg81pikfbPpumtUr9l5u0377JwZmKE/wE
 9drdHfiB+0iamr0+XTvADjIwEnRwz+Vts9ydZQ39cyDv9+2CRTpv/2yY8eM037Ftkejr5HSd
 PzHAHYAQ1SZZNQPHOvYhX3DxOeiOAKz5PUtLgosQLGnaXJ0PRPoajTh/pV3OPiiLeY9UfVsK
 h0s6vo5fSFIdYBSpRW6rEvIrvCmh2Ovgwmy7J6UQk5qiP5T+vFfyZDR90Z3o5kAxShLfGpIZ
 sWxSxuxeMf9SU96d0c7ATQRaVI5VAQgAvzQOLdVY5IoLKIFYz99HtW3FD05UiBdaeVrO14mv
 rh7AGqtd1vmMW7kTpnNhCMi2S54oM18ZMDcD0m1bTIVhSKNcrWuaTOQtL5KyDjHb5j1Q+MRJ
 d4M0n4rs+oskGicsvAHqcRh8BVTFbgVetn+GgT58alufWzIWDGpLcW4W0SgkL5/tYxEXDQI0
 +UJqMmoyDxZbIHmNJUxCXIFbxvUm5X5pNfT7sirfH+OzAeUt5PmjiIDW2Z9h/fgn0ybeLdty
 ZHPKLVwVwSZ+R7PE2IknkYfcKBaomLhDCfCqOKM3uX+8UtXyJ9cKQdnDZr+g6/ICveJ5SbtG
 vVXDRBTvt14o3QARAQABwsB2BBgBCAAgFiEE8CbDcZeweWDKBjDApkmLmwOs1qMFAlpUjlUC
 GwwACgkQpkmLmwOs1qMggggAjQ+LfkLRinj6VwYuQrIHxuyOipZi81s5GTeg5S2cIVKzA5V2
 LTCrIREhzJcEfU/wtj0WXhov1cDWt+QJUkJo7PugiWGH74LqSUkjcJl5WLNbhRzdXiTEjCij
 uwNnZjiHMzOzrlOLDZNZ2qdDTthcBVXexKLWzyJtVkWXdbDPUV47zhGzCc+Q1fvWi8aCJGlv
 8GxOIVR8OXEe1TV64dlUCbmcmjcFRQmvJyMwZE28AqhNtKsRlLkY0o5Yn02wkmgRtAbNA9jL
 00ZX+4x0H+Qm8NQG5Ps9Ay7DePwZH21SsWBleOo43xNlbiw+NUOxC+cIK9BJqAqMmCYoUwtT
 j99pMA==
Message-ID: <10c6f266-12ce-9f1a-5859-52873ff329f1@linaro.org>
Date: Mon, 5 Nov 2018 17:02:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_080318_614047_3C335A9F 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105160259.wAjrv-NdKJY3aJ4DBvMMtzlueIcmQY_hwJnZM9xK8oo@z>

VyBkbml1IDA1LjExLjIwMTggb8KgMTU6MjYsIERhdmlkIEFiZHVyYWNobWFub3YgcGlzemU6Cj4g
TWFyY2luIEp1c3praWV3aWN6IHJlcG9ydGVkIGlzc3VlcyB3aGlsZSBnZW5lcmF0aW5nIHN5c2Nh
bGwgdGFibGUgZm9yIHJpc2N2Cj4gdXNpbmcgNC4yMC1yYzEuIFRoZSBwYXRjaCByZWZhY3RvcnMg
b3VyIHVuaXN0ZC5oIGZpbGVzIHRvIG1hdGNoIHNvbWUgb3RoZXIKPiBhcmNoaXRlY3R1cmVzLgo+
IAo+IC0gQWRkIGFzbS91bmlzdGQuaCBVQVBJIGhlYWRlciwgd2hpY2ggaGFzIF9fQVJDSF9XQU5U
X05FV19TVEFUCj4gLSBSZW1vdmUgYXNtL3N5c2NhbGxzLmggVUFQSSBoZWFkZXIgYW5kIG1lcmdl
IHRvIGFzbS91bmlzdGQuaAo+IC0gQWRqdXN0IGtlcm5lbCBhc20vdW5pc3RkLmgKPiAKPiBTbyBu
b3cgYXNtL3VuaXN0ZC5oIFVBUEkgaGVhZGVyIHNob3VsZCBzaG93IGFsbCBzeXNjYWxscyBmb3Ig
cmlzY3YuCj4gCj4gQmVmb3JlIHRoaXMsIE1ha2VmaWxlIHNpbXBseSBwdXQgYCNpbmNsdWRlIDxh
c20tZ2VuZXJpYy91bmlzdGQuaD5gIGludG8KPiBnZW5lcmF0ZWQgYXNtL3VuaXN0ZC5oIFVBUEkg
aGVhZGVyIHRodXMgdXNlciBkaWRuJ3Qgc2VlOgo+IAo+IC0gX19OUl9yaXNjdl9mbHVzaF9pY2Fj
aGUKPiAtIF9fTlJfbmV3ZnN0YXRhdAo+IC0gX19OUl9mc3RhdAo+IAo+IHdoaWNoIGFyZSBzdXBw
b3J0ZWQgYnkgcmlzY3Yga2VybmVsLgoKVGVzdGVkLWJ5OiBNYXJjaW4gSnVzemtpZXdpY3ogPG1h
cmNpbi5qdXN6a2lld2ljekBsaW5hcm8ub3JnPgoKV2l0aCBwYXRjaCBhcHBsaWVkIEkgZ290IHBy
b3BlciBzeXNjYWxsIGRhdGE6Cgpmc3RhdCAgODAKbmV3ZnN0YXRhdCAgICAgNzkKcmlzY3ZfZmx1
c2hfaWNhY2hlICAgICAyNTkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
