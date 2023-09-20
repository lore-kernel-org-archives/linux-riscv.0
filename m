Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50517CE79AD
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMNOoinuqf0o5O1ACo22VtrzCPniRk64DqMzZ1iW1DA=; b=vnBRbonKWED8Iw
	LhOG9QzhQj6MXm1pRcjkSq1LBHuKs9aV/Z6ZrNLtSZuLSHbvN4uv6dXE9Yi9skG2bn0Ub6mS0WmRq
	upSxDt0HqhRQdHmOv7CLFCIHY2HrQzTQL8KiVgsaQvwqIA8AfsZ6rvyXfSXZQqTQxIK4zqRmonyYa
	cspiomjiKQP494DrmSn9ZQUg+ZCjek0tjMqpKKYAgRP6Xx7a1LbPcptpahOQY8pw0Jk5CEiKCDpUL
	Lsg53taGCZSNT/9E0til/N0j8IKIOOYmTpJVD9Jv+SAgo7v0YqpxCfsd78u8npwfcDk23g+FlSpP7
	hLUPKLZ468XyPqflPcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirzs-002Bsg-3D;
	Wed, 20 Sep 2023 07:51:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirzq-002BsB-1U
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:51:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EE59A61A41
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19AAC433D9
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695196300;
	bh=YhB+A7iHmnmzoZBCFb7X2I4fWEuWQ8+59ZBtsGegYaE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jpJLjy/5IqVHJKhetfC3m64SELPEhe+uDcmU+8ae7pKKhrI8ttOvhXg8STgC4BECW
	 hkjfuqWG5qWX4MVHlTXVPg/lcumtcZqub6g7US/SyHxWJ9icvZDrnh8PlJ1hx2yuoH
	 FGmt5RlNRH4MbjPg/RkozOf1ArduSt4F8xFBJZmpDCyJHvnognnaeCXghzgOyPiFNH
	 15y1qX41SHRgx7oxVaXIp4mahZxppiSU6VGJb0UikrxDRYeBuLRlcj3r9g49arbstv
	 CEr5z1JsBdD+E7/YgN6hsyAXASBwQARxkHFPbaI+gtboRXKDQhSE55SiJJEIy4wlCh
	 qBGPGdEDIIAMQ==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9adcb89b48bso663926766b.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:51:40 -0700 (PDT)
X-Gm-Message-State: AOJu0YyeWtvqe25cprFg9P6L6GsA2pFy1NISt8RFG3q5UxHWFNUYlo8Y
	RdxRBES5WatfNliUNw7360LLO6tDRm+lhPMqK9E=
X-Google-Smtp-Source: AGHT+IHJGMtQRq4hJtwB0IoLnShAiYYmpLruCzt+pRdlxwjYpm4dlJQHOZBhuUpQIRfn83gR6MeyI28oZ/mw/6JVkUs=
X-Received: by 2002:a17:906:18c:b0:9ae:5120:514c with SMTP id
 12-20020a170906018c00b009ae5120514cmr237222ejb.0.1695196299190; Wed, 20 Sep
 2023 00:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <05fcf91d60468323a6c7cdb8ac57c356ab4a3050.1695189879.git.wangchen20@iscas.ac.cn>
In-Reply-To: <05fcf91d60468323a6c7cdb8ac57c356ab4a3050.1695189879.git.wangchen20@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 15:51:26 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR0Q=sdVtSHOgmvnhBk8SJbEi+NjWGR62OB0JJ1i0ekZA@mail.gmail.com>
Message-ID: <CAJF2gTR0Q=sdVtSHOgmvnhBk8SJbEi+NjWGR62OB0JJ1i0ekZA@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] dt-bindings: serial: snps-dw-apb-uart: Add
 Sophgo SG2042 uarts
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_005142_544305_E291D7D2 
X-CRM114-Status: GOOD (  13.25  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjo0MOKAr1BNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1pbC5yZW5u
ZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPgo+IEFkZCBjb21wYXRpYmxlIGZvciB0aGUgdWFy
dHMgb24gdGhlIFNvcGhnbyBTRzIwNDIgUklTQy1WIFNvQy4KPgo+IFNpZ25lZC1vZmYtYnk6IEVt
aWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZyA8d2FuZ2NoZW4yMEBpc2Nhcy5hYy5jbj4KPiAtLS0K
PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9zbnBzLWR3LWFwYi11
YXJ0LnlhbWwgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9zbnBzLWR3
LWFwYi11YXJ0LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFs
L3NucHMtZHctYXBiLXVhcnQueWFtbAo+IGluZGV4IDE3YzU1MzEyM2Y5Ni4uMDExZDg5ZTZkZjBm
IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwv
c25wcy1kdy1hcGItdWFydC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NlcmlhbC9zbnBzLWR3LWFwYi11YXJ0LnlhbWwKPiBAQCAtNDUsNiArNDUsNyBAQCBw
cm9wZXJ0aWVzOgo+ICAgICAgICAgICAgLSBjb25zdDogc25wcyxkdy1hcGItdWFydAo+ICAgICAg
ICAtIGl0ZW1zOgo+ICAgICAgICAgICAgLSBlbnVtOgo+ICsgICAgICAgICAgICAgIC0gc29waGdv
LHNnMjA0Mi11YXJ0Cj4gICAgICAgICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMDAtaHN1YXJ0Cj4g
ICAgICAgICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMDAtdWFydAo+ICAgICAgICAgICAgLSBjb25z
dDogc25wcyxkdy1hcGItdWFydAo+IC0tCj4gMi4yNS4xCj4KTEdUTQoKUmV2aWV3ZWQtYnk6IEd1
byBSZW4gPGd1b3JlbkBrZXJuZWwub2c+CgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
