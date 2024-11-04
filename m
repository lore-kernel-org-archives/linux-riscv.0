Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19384D1BDE7
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8UVtoX87tO9taJT4hYPPl6jV2A4M+ayS/IhXvfIS7g=; b=KvD4gUFxX4DCQK
	nv4Xo8xMfUg8NAKmDC0m7kdnx0e0Te8OAmeIAAVsBpkIEgv8d6OXfdm3OgAgyU65fUyuczLXsmJrv
	kzBIlxyqNOVg1C5OvjGJ9PVk2U2hFbnzgJwxeVFMPRlkGaaDOWujAs7e2qnFv7r4j3FTJFjLFwHiM
	Dys2RNqRzVdG7HQE/2VnlFHNnWFVIPiduu4n3Jfo8/+TPtjm8PCQAJjC4ugK/+f6z+h39TNhv9NCQ
	61iFkbYsJjDjtBx8Pq3INd1aUOPSewN0X98D4G4dGm6Xm+rhAL2kizIdwOtaQY+UkH2C0va3IWLOC
	j7QnA8Y4lMCKUXFQz/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82qS-0000000Eucd-1Kjx;
	Mon, 04 Nov 2024 19:34:36 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82kS-0000000Etdw-2kb4
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 19:28:26 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5ebc27fdc30so2430914eaf.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 11:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730748503; x=1731353303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzNSBwfqv5RMOk+iTL2p4n+4xz8bY6vzv1XRWCkFoUw=;
        b=RSKfOL5UcZn0uSaQDZmS6RNe3F9+Ogg6v/srbl3UYaBHudjPMcj/6SM8nwBhxKAC/g
         p0/eJosFlWmN1gPVeMkm6fc01Xi7QCOA6Y3YYNp+MKufmNH4SQa1P7vCUYds569sTCmO
         7mwFTFPE9GF/zELPIxi6c3i/hdW24IMNkAIBPkwMQ6G3QoxEgVw8aU3MytX98Z0jFVXL
         O/rcAWHt7vWv55JdLfgM7D6mZlf4rfCc1Xi3DsDJsLRRUG2yTFvGcRNUeBLOA3S3ggz2
         FSiiQJWkUFD6gpb5/8S5FqRr5Cy1HRnB4Bdq3WKd97Rbt4+V0OnaBgdsgLaVawvBszTB
         ergQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730748503; x=1731353303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzNSBwfqv5RMOk+iTL2p4n+4xz8bY6vzv1XRWCkFoUw=;
        b=aOwmfFLiAXeSJE6nu1VAkP5UnxKHitQrKS/6PH+t1BVf/D9fm5i+HBFj3Pm/MER7a4
         UQf6sO26eZlughFmyTHvr4mLl7oezauNGW5gHdmHz4E3hWQnQ2YPiYCFkqyeqLLN1WPI
         a81aJNmwPQJOslXgTf098yR3J6oj/MqYwmT9e6eRTeLrr2yN3/plCBNkgij2Cz4ljCXX
         1ss1tKbanMz7z9ii03dLl8RWfuHsCtfNOQo7fP7ZFLymoECO/wQTJZ9Dqhs11JBPBH83
         3N04t1zCxUD01GpjFXUWu8pLyoJT7gqZ4eS330h2d008HGnmrLrqU1E8ozEihEgs/1zT
         ve+g==
X-Forwarded-Encrypted: i=1; AJvYcCXenA/oTshWlfPzVDh13uh2oT1/pnGKG1InEzKDtdevM6Zm2iwu64DDHB2/DtS7YA9klhtTPooM1fcr7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtOc3Zjhb/5tIkOq9/KKRxy6GW0DKtrZxZNvhWJVPUW2W2dcFv
	rqDgwpx0QwNjrjoiitgrTKKNTrazYjoPtnd7gasAj0taAyFBQjf3cA0ltNwuI4LOzHYHztwv5UM
	FU+ZZsMc7l/UH+DUul3W/nmCaHlVC3w==
X-Google-Smtp-Source: AGHT+IGIG32r9in+QfMAZeroaZPlTVZht5B6vJdC60syp76/vE/ZoshB2cvJMG3UXj+CkQFMi/mJ7Er8nRgBVNx+lZY=
X-Received: by 2002:a05:6820:1885:b0:5ee:bb2:bdd4 with SMTP id
 006d021491bc7-5ee0bb2c243mr4053231eaf.1.1730748502801; Mon, 04 Nov 2024
 11:28:22 -0800 (PST)
MIME-Version: 1.0
References: <20241025125110.1347757-1-valentina.fernandezalanis@microchip.com>
 <20241025125110.1347757-4-valentina.fernandezalanis@microchip.com>
 <CABb+yY3cDD-E-P1MPKQjdX7R2XVVKjwXUW-BANWcz-9aR6kskA@mail.gmail.com> <ee8b10e3-ccd2-409e-82d0-612107f3fe26@microchip.com>
In-Reply-To: <ee8b10e3-ccd2-409e-82d0-612107f3fe26@microchip.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 4 Nov 2024 13:28:11 -0600
Message-ID: <CABb+yY1Oy-vdXSQBQHoqzsK8xpXXfHw5ZQ5Q6gjv0gdFK2hwDA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mailbox: add Microchip IPC support
To: Valentina.FernandezAlanis@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	peterlin@andestech.com, Conor.Dooley@microchip.com, conor+dt@kernel.org, 
	ycliang@andestech.com, dminus@andestech.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, krzk+dt@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_112824_720772_A3510975 
X-CRM114-Status: GOOD (  16.90  )
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

T24gTW9uLCBOb3YgNCwgMjAyNCBhdCAxOjAx4oCvUE0gPFZhbGVudGluYS5GZXJuYW5kZXpBbGFu
aXNAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiAwMy8xMS8yMDI0IDAwOjIzLCBKYXNzaSBC
cmFyIHdyb3RlOgoKPiBSZWdhcmRpbmcgdGhlIEVYUE9SVCBmdW5jdGlvbiwgSSB1bmRlcnN0YW5k
IHRoYXQgaXTigJlzIGFsc28gcG9zc2libGUgdG8KPiByZXRyaWV2ZSBjb25fcHJpdiBmcm9tIG1i
b3hfY2hhbiBpbiB0aGUgY2xpZW50LiBIb3dldmVyLCBJIGZlbHQgaXQgd291bGQKPiBiZSBjbGVh
bmVyIHRvIGV4cG9ydCB0aGUgZnVuY3Rpb24gdG8gb2J0YWluIHRoZSBjaGFubmVsIElEIGRpcmVj
dGx5LAo+IHJhdGhlciB0aGFuIGRlY2xhcmluZyB0aGUgc3RydWN0IGlwY19jaGFuX2luZm8gaW4g
YSBoZWFkZXIgZmlsZSB0byBtYWtlCj4gaXQgYWNjZXNzaWJsZSB0byB0aGUgY2xpZW50Lgo+Cj4g
SWYgbmVjZXNzYXJ5LCBJIGNhbiByZW1vdmUgdGhlIGZ1bmN0aW9uIGFuZCBpbnN0ZWFkIGV4cG9z
ZSBzdHJ1Y3QKPiBpcGNfY2hhbl9pbmZvIGluIGxpbnV4L21haWxib3gvbWNocC1pcGMuaC4KPgpZ
ZXMgcGxlYXNlIGF2b2lkIEVYUE9SVCBhdCBhbnkgY29zdC4gVGhleSBhcmUgb25seSBhY2NlcHRh
YmxlIHdoZW4gbm8Kb3RoZXIgbWVhbnMgZXhpc3QuCgo+ID4KPiA+PiArc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgbWNocF9pcGNfZHJpdmVyID0gewo+ID4+ICsgICAgICAgLmRyaXZlciA9
IHsKPiA+PiArICAgICAgICAgICAgICAgLm5hbWUgPSAibWljcm9jaGlwX2lwYyIsCj4gPj4gKyAg
ICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IG1jaHBfaXBjX29mX21hdGNoLAo+ID4+ICsg
ICAgICAgfSwKPiA+PiArICAgICAgIC5wcm9iZSA9IG1jaHBfaXBjX3Byb2JlLAo+ID4gVGhlIGRy
aXZlciBjb3VsZCBiZSBidWlsdCBhcyBhIG1vZHVsZSwgc28gcGxlYXNlIHByb3ZpZGUgLnJlbW92
ZSgpCj4gPiBldmVuIGlmIHlvdSBuZXZlciBpbnRlbmQgdG8gdW5sb2FkIGl0Lgo+IEluIHRoaXMg
cGFydGljdWxhciBjYXNlLCB0aGVyZSBpcyBub3RoaW5nIHNwZWNpZmljIHRvIGltcGxlbWVudCBp
biB0aGUKPiAucmVtb3ZlKCkgZnVuY3Rpb24gYmVjYXVzZSBhbGwgcmVzb3VyY2VzIGFsbG9jYXRl
ZCBpbiB0aGUgLnByb2JlKCkKPiBmdW5jdGlvbiBhcmUgbWFuYWdlZCB1c2luZyBkZXZtXyoKCk9L
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
