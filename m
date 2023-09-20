Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ADFCE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5NnQRDY4oM48iTwOCKvLM4vqGsYffJVMZHNo2QXcKI=; b=FcbLbkS1iMiO0V
	IxC5j8OG6zw0xcYqr8VUHYf2SyIi7RpQ96tRaIyrY9HXJRRPwuj+l5DpA0Vl7Ru5xz1aocbrdySUH
	zEnkLiPg68Z4JZNj0tCj5HfkMkvxvHoWqUzu+AdJcXhzRKsKbPcZRC0E1J8igjJItv62NwZNHLlpK
	zQrZC0tt9cG6PxI4v3625rFWxmWhFBUwJgCS0BQDNe4+rKE5gIlg8usL115LaAx4zahyGep7PEf7K
	oq0REwl8xnYSPrZfbdUQ3JwiDc76iruQqMGi55M8Tk7K6rbj4Ss6IVo5HoczjvrPDCmZO9zbggU1o
	sCx8XQwH436BHMFdg61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirjw-0029AL-2q;
	Wed, 20 Sep 2023 07:35:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirju-00299g-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:35:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DF084619F9
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C657C433C9
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695195313;
	bh=MwnjbUi7Sx9APmmmeYu8ljwitw4TVsfCiEHzcg97XsQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KIrPPOoTRRCKLsXBrrHXlGCl1dlS+AzrvF5nNUDpCtW6vK6bSZ2oMcH/HVFNiFQe9
	 rZF1jgAVQmeMP8csfh8PqU8uH53WJ/X6H8g0IP/s5mDoD0/hEX+3vB0IrMX7s89Q0a
	 uMsLAaLPSLF288lvxprrDLtzxBBmd3lkeMyyE6B2TTIVF4N0SzSABwKbVUKpGtIW2Z
	 qDYetfxJLy/7EcEzHy7LXBHo4pcC4MQNl6OuGPhFmjpMlMSNQSMvHCquZep6VeUyK9
	 NtvKE0WAFXUmv6XxUmq4yOEYBZ2turpfGXAL/IjrQ4Ump9qk6ZQS9RJHmmGlc8jHWb
	 nqqdHX+dLnggQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so108107671fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:35:13 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz9d1Rlh51+cTu3aHgjWlLFS+tUsuYpn+UoZ4IApSyJbhBBwo6Z
	R9IStaW/AJt9rda1Ph3zj6yuO5eAmCgocnc4a+E=
X-Google-Smtp-Source: AGHT+IHch1AXwlNkfWZcAKqcoQehbFmp5SKV23GQUuzMcerp45Vu3rzzpiA/6uMhIfrtq2Gks/bl+L8cD0WzeapAy7o=
X-Received: by 2002:a2e:88d1:0:b0:2bd:10b7:4610 with SMTP id
 a17-20020a2e88d1000000b002bd10b74610mr1389072ljk.25.1695195311475; Wed, 20
 Sep 2023 00:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <2c6db3d2db0d27d4b2b8364e0c03be3da292101e.1695189879.git.wangchen20@iscas.ac.cn>
In-Reply-To: <2c6db3d2db0d27d4b2b8364e0c03be3da292101e.1695189879.git.wangchen20@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 15:34:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQym7Ad8y+m368hr7RgcjNpc2TfWRT8qu0cJyhJHm9vuQ@mail.gmail.com>
Message-ID: <CAJF2gTQym7Ad8y+m368hr7RgcjNpc2TfWRT8qu0cJyhJHm9vuQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] riscv: Add SOPHGO SOC family Kconfig support
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_003514_548605_62912FA3 
X-CRM114-Status: GOOD (  14.96  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjozNeKAr1BNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgZmlyc3QgU29DIGluIHRoZSBTT1BIR08gc2VyaWVzIGlz
IFNHMjA0Miwgd2hpY2ggY29udGFpbnMgNjQgUklTQy1WCj4gY29yZXMuCj4KPiBBY2tlZC1ieTog
WGlhb2d1YW5nIFhpbmcgPHhpYW9ndWFuZy54aW5nQHNvcGhnby5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogQ2hlbiBXYW5nIDx3YW5nY2hlbjIwQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBhcmNoL3Jpc2N2
L0tjb25maWcuc29jcyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzIGIvYXJjaC9yaXNjdi9L
Y29uZmlnLnNvY3MKPiBpbmRleCA2ODMzZDAxZTJlNzAuLmQ0ZGY3YjVkMGYxNiAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5z
b2NzCj4gQEAgLTIyLDYgKzIyLDExIEBAIGNvbmZpZyBTT0NfU0lGSVZFCj4gICAgICAgICBoZWxw
Cj4gICAgICAgICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZvciBTaUZpdmUgU29DIHBsYXRmb3Jt
IGhhcmR3YXJlLgo+Cj4gK2NvbmZpZyBBUkNIX1NPUEhHTwo+ICsgICAgICAgYm9vbCAiU29waGdv
IFNvQ3MiCj4gKyAgICAgICBoZWxwCj4gKyAgICAgICAgIFRoaXMgZW5hYmxlcyBzdXBwb3J0IGZv
ciBTb3BoZ28gU29DIHBsYXRmb3JtIGhhcmR3YXJlLgo+ICsKUmV2aWV3ZWQtYnk6IEd1byBSZW4g
PGd1b3JlbkBrZXJuZWwub3JnPgoKPiAgY29uZmlnIEFSQ0hfU1RBUkZJVkUKPiAgICAgICAgIGRl
Zl9ib29sIFNPQ19TVEFSRklWRQo+Cj4gLS0KPiAyLjI1LjEKPgoKCi0tIApCZXN0IFJlZ2FyZHMK
IEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
