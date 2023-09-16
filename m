Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39931CD37B0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCZckieZ491QaGrJMM/zItGy6gPa/vUP/c2Ummrx9sA=; b=kOlnjeAdpw7xbK
	ZW9YY5YT6C+6QPm1obWmikfFCza69mo2Vj1tQBvq8hJbjXgqVYMXSpr5hDznTHtV6R4zIGP7UF9da
	6cF5gShq9cjbugV7WcK5cMkhBHl2yDbnA3IrmNfeFt/e29Tvpott1ufzPsBw1ZIpcViOIkuYkyrL4
	fQdj7ZlYQ1UCPbh4BV6wWL8ddDEQN/mF5m5SflpJ7oLvdwUOjBrb7Sp79zvAWRaqWfE80PTGfNZvI
	3lmyK1/LhhixZGKfj/u70oPK/cyDYmxHyvJ9aCHbekguR9OntU0ES5rQaLOLeYw8/zAx6NPxF07Id
	4SRqZ5npX7kYgw1fU5xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJSr-00Bhac-23;
	Sat, 16 Sep 2023 00:47:13 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJSo-00BhZk-2b
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:47:12 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-649edb3a3d6so12645936d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694825228; x=1695430028; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBHxW502vU8e53k9oCuqrI/4gYcnPRfLjigLIIeAUug=;
        b=JSfYQKFJ6cgVxmWmdszyUVUPhzH5gM5/Djv+elPHmFD0XIRXjGohP/+bCJBBfj9S7m
         HSYig2pOAuJhzACFXkiYmapVjDd+6bg5WfrmAJzZ/oQt7zfAppIU+fpJBPccFor4P76G
         aPUZuop8DyLx1zmTy93wp99vxhsLzahAYCqg3re7FPHmPXU1rqkxuazQrVE670Qejrm+
         DAJFuvpP6uLTn5vevFqtErS2TIoMLExpN6xeOYbaG4vqAiJuMPqmNEfERJzryWc9oLla
         tZe5VaoMHg+2b7/bh5X40sgGhW7sjZm01Wr84JCDmxiAsnbUMwniY/PgGpS+jUmUnwP8
         1EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694825228; x=1695430028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBHxW502vU8e53k9oCuqrI/4gYcnPRfLjigLIIeAUug=;
        b=a2wPxrEeagf1oiR6Zf2G2UbkKJCfO5l2ZrdTefEuScvvCQaZ7I84KmCrCjTHTn91b5
         C+UlBVWR+GejG8FucOumJ6SXImdIKjjjYbrPxz23ASVcttyzq0GCbDrm9HW6z/IQmTAa
         AZnb0ZibSvVPutCab58OTk1L7a3OacxLW3a6Gb0IcJcclvkiLQ3FCcWuVzxv/LAcofdk
         Kl4eU38dqIxuV+7NOUrH3z8cR1AA+YeghZrM48cs8Oeua+eCAPevv2wG3MGrKF5Wgdk1
         SG02x5YQ1PRGvdPb29dzktY3I+ojCwEI+/h8X1UMT+dk9kKoET48gDFTn9rvNbwujm2t
         scZw==
X-Gm-Message-State: AOJu0Yw/WWjmU9QxpK0kYC+fhe2JygrHFWwOojM5t97A/huI7pNxqXuW
	F6xWmI88a3Rioblf+I2jxzcu8EdLh2ObASOZ87g=
X-Google-Smtp-Source: AGHT+IFFKdbmFxyTAEg51NciK8t4OKI137LB+9RsFkYxzW1wvBThEcZn7VBiNX9iRv/ryzCHsYTOgq/nirF2i6sMg+s=
X-Received: by 2002:a0c:f3c4:0:b0:656:eae:d7b2 with SMTP id
 f4-20020a0cf3c4000000b006560eaed7b2mr4468467qvm.2.1694825227951; Fri, 15 Sep
 2023 17:47:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230915072333.117991-1-wangchen20@iscas.ac.cn>
 <20230915-muster-viability-93d7d4ec2b49@spud> <20230915150332.GA3719864-robh@kernel.org>
In-Reply-To: <20230915150332.GA3719864-robh@kernel.org>
From: Chen Wang <unicornxw@gmail.com>
Date: Sat, 16 Sep 2023 08:46:57 +0800
Message-ID: <CAHAQgRAtFBvoKbfL266cjUNnhSCM4UkU=g6n++7XXXeKOXR8yw@mail.gmail.com>
Subject: Re: [PATCH 04/12] dt-bindings: riscv: Add T-HEAD C920 compatibles
To: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jszhang@kernel.org, guoren@kernel.org, 
	chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
	Wang Chen <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_174710_844861_D9EDC9DC 
X-CRM114-Status: GOOD (  17.05  )
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

VGhhbmtzIGZvciB5b3VyIGRldGFpbGVkIGNsYXJpZmljYXRpb24sIFJvYi4gSSdsbCBwYXkgYXR0
ZW50aW9uIG5leHQgdGltZS4KUmVnYXJkcywKCnVuaWNvcm54CgpSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPiDkuo4yMDIz5bm0OeaciDE15pel5ZGo5LqUIDIzOjAz5YaZ6YGT77yaCj4KPiBP
biBGcmksIFNlcCAxNSwgMjAyMyBhdCAwMzoxMTo0M1BNICswMTAwLCBDb25vciBEb29sZXkgd3Jv
dGU6Cj4gPiBPbiBGcmksIFNlcCAxNSwgMjAyMyBhdCAwMzoyMzozM1BNICswODAwLCBXYW5nIENo
ZW4gd3JvdGU6Cj4gPiA+IFRoZSBDOTIwIGlzIFJJU0MtViBDUFUgY29yZXMgZnJvbSBULUhFQUQg
U2VtaWNvbmR1Y3Rvci4KPiA+ID4gTm90YWJseSwgdGhlIEM5MjAgY29yZSBpcyB1c2VkIGluIHRo
ZSBTT1BIR08gU0cyMDQyIFNvQy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogV2FuZyBDaGVu
IDx3YW5nY2hlbjIwQGlzY2FzLmFjLmNuPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvZ3Vhbmcg
WGluZyA8eGlhb2d1YW5nLnhpbmdAc29waGdvLmNvbT4KPiA+Cj4gPiBJIGZpZ3VyZSB0aGlzIGlz
IG1pc3NpbmcgYSBGcm9tOiBvciBDby1kZXZlbG9wZWQtYnkgbGluZS4KPgo+IEZyb206IChhdXRo
b3IpIGFzIDIgYXV0aG9ycyBmb3IgMSBsaW5lIGNoYW5nZSBpcyBxdWVzdGlvbmFibGUuCj4KPiBU
aGUgc2VuZGVyJ3MgZW1haWwgc2hvdWxkIGJlIHRoZSBsYXN0IFMtby1iLiBTbyBsaWtlIHRoaXM6
Cj4KPiBGcm9tOiBYaWFvZ3VhbmcgWGluZyA8eGlhb2d1YW5nLnhpbmdAc29waGdvLmNvbT4KPgo+
IC4uLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhb2d1YW5nIFhpbmcgPHhpYW9ndWFuZy54aW5nQHNv
cGhnby5jb20+Cj4gU2lnbmVkLW9mZi1ieTogV2FuZyBDaGVuIDx3YW5nY2hlbjIwQGlzY2FzLmFj
LmNuPgo+Cj4KPiA+Cj4gPiA+IC0tLQo+ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2NwdXMueWFtbCB8IDEgKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4gPiBpbmRleCAzOGMwYjUyMTM3MzYuLjE4NWEwMTkx
YmFkNiAxMDA2NDQKPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jpc2N2L2NwdXMueWFtbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiA+IEBAIC00Nyw2ICs0Nyw3IEBAIHByb3BlcnRpZXM6
Cj4gPiA+ICAgICAgICAgICAgICAgIC0gc2lmaXZlLHU3NC1tYwo+ID4gPiAgICAgICAgICAgICAg
ICAtIHRoZWFkLGM5MDYKPiA+ID4gICAgICAgICAgICAgICAgLSB0aGVhZCxjOTEwCj4gPiA+ICsg
ICAgICAgICAgICAgIC0gdGhlYWQsYzkyMAo+ID4gPiAgICAgICAgICAgIC0gY29uc3Q6IHJpc2N2
Cj4gPiA+ICAgICAgICAtIGl0ZW1zOgo+ID4gPiAgICAgICAgICAgIC0gZW51bToKPiA+ID4gLS0K
PiA+ID4gMi4yNS4xCj4gPiA+Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
