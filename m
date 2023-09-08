Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5079EE7FF2
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=as0OE7S5xu7CiKmvNPlIExWtgYIe1wup0qxdEwX+49A=; b=bmDJhAc0avrPJn
	nkKOVNFP8CZY9RBRsN0vGo0AL+9Dqmik9mmNQlpZbTgdx2f3W/i7psnTGnAZfrcj9ZQ8aX5I0ArnA
	sYSRJ0UHORTQf7BpdVoK3d8SSXdnaPNnY1P8OTwYw8fNj9B0GfoZgrV+IzD+9haIMIIcP2UURP4t6
	O9weMx92t92vipMQ1Mjgw45OU9sBDZsiriGTV+O/KV63DZX4ORtXxb0zND05X3yzTcVDV/G5qAHZb
	GuUAvJD9tc+xTgHgBWbQLAGVU3NFfTRgLEhrJeTx2O+CskNjVLl9K8SD9yHCXAbRHUaQNIw6ectG8
	Yc0gCU3TNzpoCf+pd4kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qebbc-00DqtI-1B;
	Fri, 08 Sep 2023 13:33:04 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qebbY-00DqsI-1K
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 13:33:03 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5CC093F65E
	for <linux-riscv@lists.infradead.org>; Fri,  8 Sep 2023 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1694179974;
	bh=zqnhyZNLywg0xbvkm1uHFRR58gPTiCIAHqj9eCxtNas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=dXXtwiZMalpJJNutx/AOuIn1L75t0RF+uF5ce5DgEnXFXIsLVX2McomXzJSCx0Bas
	 i2vKn1cNQ8xvZKjPl++VOuHcS7lbyPMpR3oyoH7sukXtIOJZgPPY7wgksbzBSd/DtH
	 razKroJBBVUXnvu5G+MvTMdY76LbLeIhrbpFlkeMWiftFYoTKxB2/3uDf+fXrbtBmA
	 32rtOHze/9YKpYtWq8p6RMfX5MYPdHjjZi27SQ6Yx9RHdcS+Le1nhG2iS17TKxxKn6
	 cQ1wWwEzYkjCs7FveGz2NE9vEO8u7vBxJPkYX2+reo4C4p7rebc6gSGDbUccw0MWWU
	 wkC8qnvhLL69w==
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-500c67585acso2145734e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Sep 2023 06:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694179974; x=1694784774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqnhyZNLywg0xbvkm1uHFRR58gPTiCIAHqj9eCxtNas=;
        b=WIlKOCBn1+EsAb+40aTR+te0cqZioySWgpejrkvlhcPk+0V6VYzTEVz3Jy/VUDSHqH
         /LaxaMUnHH5kFjKjPLEFVYk2OA3QrLTJCrd14ZePva61wbNPcfGiQIb3IkL5wjrH7YMx
         52flVGMgS6+yAMqWiV0txxpolizlWcvySaUXDWSL1eagcf7Bly8wz1f2BigmooMHjbsq
         XavFRIDYp5krlQPzTrt5kbx7xRd5tY5odv8p+2TvCYcZraVlLRCYsHW24YSNtkILxkrL
         TgKYlRhTtG9VdeO4VcBQ7HG7RaUjATOqOA8Xq4YxxIKTDNa1Zw1v6QpK5zQNs/nm/eUM
         Wgpg==
X-Gm-Message-State: AOJu0YzPbtEG9dlq4urHAN2jDBeawiC5XHMWt7zSTCuTzWp4zZEMuCI0
	RZkGwzedpm45TvBdWswymib6Z8PNPdmgfRiSupPqDvCMzO29kUmAokITlqgNBADumot7Qtd8P4y
	WC9c/jZLyGQygoaAclGpvOzfNyAezk/B3F5e5Xk20bFp7TJm2r5/GyPyR2b/XqA==
X-Received: by 2002:a05:6512:3082:b0:4f9:586b:dba1 with SMTP id z2-20020a056512308200b004f9586bdba1mr2492958lfd.4.1694179973652;
        Fri, 08 Sep 2023 06:32:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQebtOEBXNF4XxOrD/m0xqiyvOa6CRhaA5PweNX/oEc3iI8U1qvOKmWus5LBiJh9SF87AJkxS4IXLdALU1FgM=
X-Received: by 2002:a05:6512:3082:b0:4f9:586b:dba1 with SMTP id
 z2-20020a056512308200b004f9586bdba1mr2492928lfd.4.1694179973237; Fri, 08 Sep
 2023 06:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
 <20230830031846.127957-2-william.qiu@starfivetech.com> <20230830-commence-trickery-40eaa193cb15@wendy>
 <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org> <20230830-procedure-frostbite-56c751f7c276@wendy>
 <efab6f52-4d7f-ea3c-0fc3-4e3ad03c14c7@starfivetech.com> <20230901-remold-sublease-a1ddb1fc6348@spud>
 <9EF26965-10E5-4BCA-AC5E-93C5AA55A0DF@jrtc27.com> <20230901-affected-wanting-ab517791a870@spud>
 <dd63bb4f-a59b-0323-08fb-03f8cc048b6e@starfivetech.com>
In-Reply-To: <dd63bb4f-a59b-0323-08fb-03f8cc048b6e@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 8 Sep 2023 15:32:36 +0200
Message-ID: <CAJM55Z8XowmB-Hfzr+hBtWu+SGL2v7jya6Nx5_rATf8=5qA4Fg@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
To: William Qiu <william.qiu@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, Jessica Clarke <jrtc27@jrtc27.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-mmc@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_063300_615875_08FFED0C 
X-CRM114-Status: GOOD (  38.43  )
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

T24gRnJpLCA4IFNlcHQgMjAyMyBhdCAxMjowMywgV2lsbGlhbSBRaXUgPHdpbGxpYW0ucWl1QHN0
YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+IE9uIDIwMjMvOS8yIDE6NDMsIENvbm9yIERvb2xleSB3
cm90ZToKPiA+IE9uIEZyaSwgU2VwIDAxLCAyMDIzIGF0IDA2OjIwOjM4UE0gKzAxMDAsIEplc3Np
Y2EgQ2xhcmtlIHdyb3RlOgo+ID4+IE9uIDEgU2VwIDIwMjMsIGF0IDE2OjQyLCBDb25vciBEb29s
ZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+ID4KPiA+PiA+IE9uIEZyaSwgU2VwIDAx
LCAyMDIzIGF0IDEwOjMzOjEzQU0gKzA4MDAsIFdpbGxpYW0gUWl1IHdyb3RlOgo+ID4+ID4+Cj4g
Pj4gPj4KPiA+PiA+PiBPbiAyMDIzLzgvMzAgMTY6MzQsIENvbm9yIERvb2xleSB3cm90ZToKPiA+
PiA+Pj4gT24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgMDk6Mjk6MjBBTSArMDIwMCwgS3J6eXN6dG9m
IEtvemxvd3NraSB3cm90ZToKPiA+PiA+Pj4+IE9uIDMwLzA4LzIwMjMgMDg6NTAsIENvbm9yIERv
b2xleSB3cm90ZToKPiA+PiA+Pj4+PiBPbiBXZWQsIEF1ZyAzMCwgMjAyMyBhdCAxMToxODo0NEFN
ICswODAwLCBXaWxsaWFtIFFpdSB3cm90ZToKPiA+PiA+Pj4+Pj4gRHVlIHRvIHRoZSBjaGFuZ2Ug
b2YgdHVuaW5nIGltcGxlbWVudGF0aW9uLCBpdCdzIG5vIGxvbmdlciBuZWNlc3NhcnkgdG8KPiA+
PiA+Pj4+Pj4gdXNlIHRoZSAic3RhcmZpdmUsc3lzcmVnIiBwcm9wZXJ0eSBpbiBkdHMsIHNvIGRy
b3AgdGhlIHJlbGV2YW50Cj4gPj4gPj4+Pj4+IGRlc2NyaXB0aW9uIGluIGR0LWJpbmRpbmdzIGhl
cmUuCj4gPj4gPj4+Pj4KPiA+PiA+Pj4+PiBIb3cgZG9lcyBjaGFuZ2luZyB5b3VyIHNvZnR3YXJl
IGltcGxhbnRhdGlvbiBpbnZhbGlkYXRlIGEgZGVzY3JpcHRpb24gb2YKPiA+PiA+Pj4+PiB0aGUg
aGFyZHdhcmU/Cj4gPj4gPj4+Pj4KPiA+PiA+Pj4+Cj4gPj4gPj4+PiBXaGljaCBpcyBraW5kIG9m
IHByb29mIHRoYXQgdGhpcyBzeXNjb24gd2FzIGp1c3QgdG8gc3Vic3RpdHV0ZQo+ID4+ID4+Pj4g
aW5jb21wbGV0ZSBoYXJkd2FyZSBkZXNjcmlwdGlvbiAoZS5nLiBtaXNzaW5nIGNsb2NrcyBhbmQg
cGh5cykuIFdlCj4gPj4gPj4+PiBzaG91bGQgaGF2ZSByZWplY3RlZCBpdC4gSnVzdCBsaWtlIHdl
IHNob3VsZCByZWplY3QgdGhlbSBpbiB0aGUgZnV0dXJlLgo+ID4+ID4+Pgo+ID4+ID4+PiA6cyBJ
IGR1bm5vIHdoYXQgdG8gZG8gd2l0aCB0aGlzLi4uIEknbSBpbmNsaW5lZCB0byBzYXkgbm90IHRv
IHJlbW92ZSBpdAo+ID4+ID4+PiBmcm9tIHRoZSBiaW5kaW5nIG9yIGR0cyBhdCBhbGwgJiBvbmx5
IGNoYW5nZSB0aGUgc29mdHdhcmUuCj4gPj4gPj4+Cj4gPj4gPj4+PiBUaGVyZSBhcmUganVzdCBm
ZXcgY2FzZXMgd2hlcmUgc3lzY29uIGlzIHJlYXNvbmFibGUuIEFsbCBvdGhlcnMgaXMganVzdAo+
ID4+ID4+Pj4gbGF6aW5lc3MuIEl0J3Mgbm90IG9ubHkgc3RhcmZpdmV0ZWNoLCBvZiBjb3Vyc2Uu
IFNldmVyYWwgb3RoZXIKPiA+PiA+Pj4+IGNvbnRyaWJ1dG9ycyBkbyB0aGUgc2FtZS4KPiA+PiA+
Pj4KPiA+PiA+Pj4gSSdtIG5vdCBzdXJlIGlmIGxhemluZXNzIGlzIGZhaXIsIGxhY2sgb2YgdW5k
ZXJzdGFuZGluZyBpcyB1c3VhbGx5IG1vcmUKPiA+PiA+Pj4gbGlrZWx5Lgo+ID4+ID4+Cj4gPj4g
Pj4gRm9yIHRoaXMsIEkgdGVuZCB0byBrZWVwIGl0IGluIGJpbmRpbmcsIGJ1dCByZW1vdmUgaXQg
ZnJvbSByZXF1aXJlZC4gQmVjYXVzZQo+ID4+ID4+IHdlIG9ubHkgbW9kaWZ5IHRoZSB0dW5pbmcg
aW1wbGVtZW50YXRpb24sIGl0IGRvZXNuJ3QgbWVhbiB0aGF0IHRoaXMgcHJvcGVydHkKPiA+PiA+
PiBuZWVkIHRvIGJlIHJlbW92ZWQsIGl0J3MganVzdCBubyBsb25nZXIgYmUgdGhlIHJlcXVpcmVk
IG9uZS4KPiA+PiA+Cj4gPj4gPiBQbGVhc2Ugb25seSByZW1vdmUgaXQgZnJvbSByZXF1aXJlZCBp
ZiB0aGUgY3VycmVudCBkcml2ZXIgZG9lc24ndCBicmVhawo+ID4+ID4gaWYgdGhlIHJlZ21hcCBp
cyByZW1vdmVkLgo+ID4+Cj4gPj4gRWl0aGVyIHdheSBwbGVhc2UgbWFrZSBzdXJlIHRoZSBkb2N1
bWVudGF0aW9uIGNsZWFybHkgc3RhdGVzIOKAnG5ldmVyIHVzZQo+ID4+IHRoaXMsIGlmIHlvdeKA
mXJlIHVzaW5nIGl0IHlvdeKAmXJlIGRvaW5nIGl0IHdyb25nLCB0aGlzIG9ubHkgZXhpc3RzCj4g
Pj4gYmVjYXVzZSBpdCB3YXMgd3JvbmdseSB1c2VkIGluIHRoZSBwYXN04oCdLiBPdGhlcndpc2Ug
cGVvcGxlIHdyaXRpbmcKPiA+PiBkcml2ZXJzIGZvciBvdGhlciBPU2VzIHdpbGwgcHJvYmFibHkg
dXNlIGl0IHRvbyB0aGlua2luZyB0aGV5IG5lZWQgdG8uCj4gPgo+ID4gTWF5YmUgd2Ugc2hvdWxk
IGp1c3QgZGVsZXRlIGl0IGlmIHRoZSBpbXBhY3QgaXMgZ29pbmcgdG8gYmUgbmVnbGlnaWJsZSwK
PiA+IHNvdW5kcyBsaWtlIHlvdSdyZSBub3QgdXNpbmcgaXQgaW4gRnJlZUJTRCwgd2hpY2ggd2Fz
IHBhcnQgb2Ygd2hhdCBJIHdhcwo+ID4gd29ycmllZCBhYm91dC4gR3Vlc3MgaXQgZGVwZW5kcyBv
biB3aGF0IEVtaWwgJiB0aGUgZGlzdHJvIGhlYWRzIHRoaW5rLgo+IEhpIENvbm9yLAo+Cj4gQWZ0
ZXIgZGlzY3Vzc2luZyBpdCB3aXRoIG91ciBjb2xsZWFndWVzLCB3ZSBkZWNpZGVkIHRoYXQgZGVs
ZXRpbmcgaXQgd2FzIHRoZSBiZXN0Cj4gY291cnNlIG9mIGFjdGlvbi4gU2luY2UgdGhlcmUgd2ls
bCBubyBsb25nZXIgYmUgYSByZWxhdGVkIGltcGxlbWVudGF0aW9uIG9mCj4gInN0YXJmaXZlLHN5
c3JlZyIgaW4gZnV0dXJlIGRyaXZlcnMsIGV2ZW4gaWYgdGhlIGR0LWJpbmRpbmcgaXMgZGVzY3Jp
YmVkLCBpdCB3aWxsCj4gYmUgIm5ldmVyIHVzZSIsIHNvIEkgdGhpbmsgaXQgc2hvdWxkIGJlIGRl
bGV0ZWQuCj4KPiBXaGF0IGRvIHlvdSB0aGluaz8KClRoZSBkZXZpY2UgdHJlZSBzaG91bGQgYmUg
YSBkZXNjcmlwdGlvbiBvZiB0aGUgaGFyZHdhcmUgYW5kIHRoZXJlCnJlYWxseSBpcyBhICd1MF9z
ZGlvX2RhdGFfc3Ryb2JlX3BoYXNlX2N0cmwnIGZpZWxkIGluIHRoZSBzeXNyZWcKcmVnaXN0ZXJz
WzFdIG9uIHRoZSBKSDcxMTAgdGhhdCBzZWVtcyB0byBkbyBfc29tZXRoaW5nXyByZWxhdGVkIHRv
IHRoZQpzZGlvIGludGVyZmFjZS4gU28gSSBkb24ndCB0aGluayB0aGUgZmFjdCB0aGF0IHRoZSBM
aW51eCBkcml2ZXIgbm8KbG9uZ2VyIHVzZXMgaXQgaXMgYSBnb29kIHJlYXNvbiB0byByZW1vdmUg
aXQsIGJ1dCBpZiB0aGVyZSBhcmUgc29tZQpvdGhlciBwcmFnbWF0aWMgcmVhc29ucyB0byBkbyBz
byB0aGVuIEknbSBmaW5lIHdpdGggaXQuIFJlbW92aW5nIGl0CmZyb20gdGhlIGxpc3Qgb2YgcmVx
dWlyZWQgcHJvcGVydGllcyBzaG91bGQgYmUgZmluZSB0aG91Z2guCgovRW1pbAoKWzFdOiBodHRw
czovL2RvYy1lbi5ydnNwYWNlLm9yZy9KSDcxMTAvVFJNL0pINzExMF9UUk0vc3lzX3N5c2Nvbi5o
dG1sCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
