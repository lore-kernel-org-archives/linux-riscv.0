Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2EBC54E49
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSqsHFbGiZiz7p3NL/uHH8hHsHaJQgiFrTaXUk6Qmik=; b=aimFSbLSq6nlbl
	iHqkrTSvzc/w6nCyunEN2KUGzBHYxRjJnXdu1Xr8kP9xa9M9AjBZV89nKTtPeuvDbt5pnNz6yATk6
	FrqrPWbKiXAkOeT2AT5bGVV7AWmIo9TcVfdW1BGCIfo055F7gidA3JCwz4t8wtZl1WQExTISxk1n4
	3njcXtbb3DVykv6t7td2NJ7eU1vtJqGm0/2VSEwCqeN9++sukw+oElEWva48tIokGmX+MlxspRM5x
	tPEXsj3edK7jN2hJ+3oUr+XcIxIeQ5SF38xTk2U0fBA4Ot2Qff0tt3vXbQbsQWo4EihPDGUOK+Z7E
	T2WaW69yUn/KD84yvkxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheI7-0000000Fd7I-1HT8;
	Tue, 05 Mar 2024 23:33:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rheI4-0000000Fd5P-3LuX
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 23:33:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 720FDCE1EEE
	for <linux-riscv@lists.infradead.org>; Tue,  5 Mar 2024 23:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D59C433A6
	for <linux-riscv@lists.infradead.org>; Tue,  5 Mar 2024 23:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709681621;
	bh=eLpdEbLb/e5fMTtGq4VE53hJODUQV0E7L2x6Fi1q+GQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YwujledT0wjoR1dOgkhjHbu20ofdHfBi85Be6kukJDk/vI4ww9ayamqiugYQimwnw
	 OMoMOZHsO9Zfz0hoS5zBFvFCnAozYufp9nBstrdepb6/RrhnmGo/GkQHh7rK+sXYVq
	 b3GqgLwkb3RCy7Sq7M8EkdixR9+bJryOr2AdkR83ZmEv0vQzXj2DTCW4QFfpxMOdfY
	 MyopwrkrUKwsY5DiWqDlpG9MDZMZrIUtEdmbtH8fcbga4+evMzOU/ZwB4V3i35cvaW
	 UbGjzNyPFKSO/60YmkpLXPk2ECmdIoTeOLzK9E7pAyYoUYZqRtQ45ZMx7is9ZTd3zN
	 h7a8uLRrGYvxQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d29111272eso19936551fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Mar 2024 15:33:41 -0800 (PST)
X-Gm-Message-State: AOJu0YyvlGkQemOoRTUx1QZ+5RG7HvHUQZDXLuvjql4gSv7OK5qeNQY9
	RClGfDmJJ0ZtEmwBDqIwFQhcMQdRYHskn8bzwYKlXagaXGPJebTxqQ+ZRedU4kFkWgCJL/K0oTh
	An7T/QWm6Ef3xyC4WjTs+HA+ScZc=
X-Google-Smtp-Source: AGHT+IGg0aE/JTW6xwqaUQn2xbuKQVBVSRFqFG9CACRonHlxpjny0NRLymtQDYdaNsAxMQ9m2w/KjejdKarYzDPbMJA=
X-Received: by 2002:a05:651c:793:b0:2d3:dcb0:56d9 with SMTP id
 g19-20020a05651c079300b002d3dcb056d9mr2172197lje.29.1709681619544; Tue, 05
 Mar 2024 15:33:39 -0800 (PST)
MIME-Version: 1.0
References: <tencent_587730262984A011834F42D0563BC6B10405@qq.com> <tencent_26733B06E132C458857C36DEF36D084A6A0A@qq.com>
In-Reply-To: <tencent_26733B06E132C458857C36DEF36D084A6A0A@qq.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Mar 2024 07:33:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ_TCkkE9daRHzyY7fMcqULQUHj9vj7sVhtkp9Td__Fsw@mail.gmail.com>
Message-ID: <CAJF2gTQ_TCkkE9daRHzyY7fMcqULQUHj9vj7sVhtkp9Td__Fsw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] dt-bindings: riscv: Add T-HEAD C908 compatible
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_153345_044138_35DAE879 
X-CRM114-Status: GOOD (  12.35  )
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

T24gV2VkLCBNYXIgNiwgMjAyNCBhdCAzOjQ04oCvQU0gWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxm
Lm5hbWU+IHdyb3RlOgo+Cj4gVGhlIHRoZWFkLGM5MDggaXMgYSBSSVNDLVYgQ1BVIGNvcmUgZnJv
bSBULUhFQUQgU2VtaWNvbmR1Y3RvciB3aGljaCB1c2VkCj4gaW4gQ2FuYWFuIEtlbmRyeXRlIEsy
MzAgU29DLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+
Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4g
LS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwg
fCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiBpbmRleCA5ZDg2
NzBjMDBlM2IuLmU4NTNhN2ZjZWU4YSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+IEBAIC00Nyw2ICs0Nyw3IEBAIHByb3Bl
cnRpZXM6Cj4gICAgICAgICAgICAgICAgLSBzaWZpdmUsdTc0Cj4gICAgICAgICAgICAgICAgLSBz
aWZpdmUsdTc0LW1jCj4gICAgICAgICAgICAgICAgLSB0aGVhZCxjOTA2Cj4gKyAgICAgICAgICAg
ICAgLSB0aGVhZCxjOTA4Cj4gICAgICAgICAgICAgICAgLSB0aGVhZCxjOTEwCj4gICAgICAgICAg
ICAgICAgLSB0aGVhZCxjOTIwCj4gICAgICAgICAgICAtIGNvbnN0OiByaXNjdgo+IC0tCj4gMi40
My4wCj4KTEdUTSwgR3JlYXQgam9iIQoKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
