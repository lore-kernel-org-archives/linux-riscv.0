Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F5CD3B7D2
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 04:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjRPGaKTyF6DrEvcgtAXGM71s7rbPrGehkyyxQ5haP0=; b=xsSD86BOXUKnMH
	0Ci2p498yzoc+7hY+Fa8KI2o77HzsfWQ6ntQ1xRctxecMfqYodCTzBktWuwbJpkOqHBYmTDWGlqHn
	JL1jLH4z4pPvdxJ46yHDOnvBgW4PmDxpU4dYO42U6th4kdwVc5umFHT1Pngy8jlOLJk1JNVQ9/vJP
	12oTIk12P6+xQ9+u1CF+fcLhnVpfgV29DGOPSi3HTGntThw0aaneUk5CG2hMpJ0aufXBbJCpLVma7
	Cf6bRmnUh2Mp++yLCD6m1fMjMPQGur17OowAJrpnBHfSXKGcgaqc7tBKYMQGmq88sg/uOLCYAYi5C
	FkK1jlBC+p6TD2ZpK9ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQm3-000000072KS-07P4;
	Mon, 25 Nov 2024 04:32:35 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFQm0-000000072Je-1olk
	for linux-riscv@lists.infradead.org;
	Mon, 25 Nov 2024 04:32:33 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3a761e21ddeso15117995ab.3
        for <linux-riscv@lists.infradead.org>; Sun, 24 Nov 2024 20:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1732509151; x=1733113951; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuP71Y6DNMRZn5Z/NIHYONj3bIPsmDbwbNxhp9KsWsI=;
        b=Qy5V2Hay3vP0ACzRbCwSlOyEuejdYIlBhE779HRLN/ZBzcif8wWOSlnChWOl58uICT
         PF0aUQTILZCkjg0lbjL2BB7AOAzDt+IKscuT+QnbnkWs0WjAdJ7Hhh8ly4ci4xLl6Oix
         n165C99e5Owm5iIG6Mxv9XM+s3gOAnEvuNCeUEzq/7lcyeAgmgDdZJhWzx18cNael2ha
         Vwt/8SUnNAgx2XTlXTxzGBt2ey24gSsVBYUrzseKYQbMj3CHEuLB0Iwt7p3q/vbc3cS9
         p0rXw4o2yBcvBS88galGXpd5Gp2J9140EQE4zy1MNcdLmBPN3tw3Y4ZMqxhfOVF3goGG
         mvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732509151; x=1733113951;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuP71Y6DNMRZn5Z/NIHYONj3bIPsmDbwbNxhp9KsWsI=;
        b=WexcOzfMZdDwfMFwWfA9hTGiLhQt7kJ0C3emNs/UCL5wP7EMr9yuNFxFqvQrm+y/sm
         YoJoDAKeMKh6BJBIipc0UmdJ8h/Gr0D2KEGYy3grVH29NjOkyctTaa3qQa3+lNhu8C0m
         jP2qA1pG58cvsGT6bHQdUPopObGnqXiYrB/KWVV2YVM21b0l3oUFHevAaDmZKzA3BOcE
         Ngmti+HYfGxtUle98oa2iRwwvIt1dChcJzu7IV0Ntp+yhXE1h3IqX4Z7mcVgcImXYEuv
         l3wffd55KmgiL2Blvx1rwsyCpT98ldmSGz1s9+sQTyiKfMnwqrllKRb88IsmR5lsCn4v
         Uy1g==
X-Gm-Message-State: AOJu0YzCml65lCgd3qxSDzcQPGbNI+DhTpLdrhNJhu/kK4TejaCRm3HA
	+oX5ndAdkxgE6YPudnf88kDikxOkwLJ4m6v26ShwyfNfcLy09WW1hlNhyAiXzhzNfyZ4V8+8vck
	HNuMwhf4WYvmnfCUOUSIeM2BwCxwlXqMz/OfzOmcxcX5XbFx6
X-Gm-Gg: ASbGncsWd60I30wodobefzyWjyFvj3mz5HIGnomSEotZOmb/Mk1dutK1QJOYjIRQkrs
	81MLWiWPr19tzQP2UcAG/fE9OHtR59wqO
X-Google-Smtp-Source: AGHT+IE0XgK4cCIGwVFLckTXIbnG7ckY0QK1kEizBDP2hOJwie9buVoHmF7NwplyFHtsm5kZBiOvnP0znmn0ysFd5ps=
X-Received: by 2002:a05:6602:608a:b0:82c:ddfc:c57b with SMTP id
 ca18e2360f4ac-83ecdc5d8damr1342017439f.5.1732509150836; Sun, 24 Nov 2024
 20:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20241124221458.347464-1-michaelneuling@tenstorrent.com>
In-Reply-To: <20241124221458.347464-1-michaelneuling@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 25 Nov 2024 10:02:19 +0530
Message-ID: <CAAhSdy2Qq61qSLkuFkgiT2o5wXNDp3qO=U40AU1CFkcY6iNYhw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix csr_write -> csr_set for HVIEN PMU
 overflow bit
To: Michael Neuling <michaelneuling@tenstorrent.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, 
	palmer@dabbelt.com, mikey@neuling.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_203232_674127_340BE82D 
X-CRM114-Status: GOOD (  14.55  )
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

T24gTW9uLCBOb3YgMjUsIDIwMjQgYXQgMzo0NeKAr0FNIE1pY2hhZWwgTmV1bGluZwo8bWljaGFl
bG5ldWxpbmdAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IFRoaXMgZG9lc24ndCBjYXVzZSBh
IHByb2JsZW0gY3VycmVudGx5IGFzIEhWSUVOIGlzbid0IHVzZWQgZWxzZXdoZXJlCj4geWV0LiBG
b3VuZCBieSBpbnNwZWN0aW9uLgo+CgpGaXhlcyB0YWcgPwoKPiBTaWduZWQtb2ZmLWJ5OiBNaWNo
YWVsIE5ldWxpbmcgPG1pY2hhZWxuZXVsaW5nQHRlbnN0b3JyZW50LmNvbT4KCk90aGVyd2lzZSBp
dCBsb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWEu
Ywo+IGluZGV4IDI5NjdkMzA1YzQuLjlmM2I1Mjc1OTYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9rdm0vYWlhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+IEBAIC01NTIsNyArNTUy
LDcgQEAgdm9pZCBrdm1fcmlzY3ZfYWlhX2VuYWJsZSh2b2lkKQo+ICAgICAgICAgY3NyX3NldChD
U1JfSElFLCBCSVQoSVJRX1NfR0VYVCkpOwo+ICAgICAgICAgLyogRW5hYmxlIElSUSBmaWx0ZXJp
bmcgZm9yIG92ZXJmbG93IGludGVycnVwdCBvbmx5IGlmIHNzY29mcG1mIGlzIHByZXNlbnQgKi8K
PiAgICAgICAgIGlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIFJJU0NW
X0lTQV9FWFRfU1NDT0ZQTUYpKQo+IC0gICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX0hWSUVO
LCBCSVQoSVJRX1BNVV9PVkYpKTsKPiArICAgICAgICAgICAgICAgY3NyX3NldChDU1JfSFZJRU4s
IEJJVChJUlFfUE1VX09WRikpOwo+ICB9Cj4KPiAgdm9pZCBrdm1fcmlzY3ZfYWlhX2Rpc2FibGUo
dm9pZCkKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
