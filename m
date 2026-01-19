Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53ABD2ECF5
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 23:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yorZoxNydOarpRCiY3ccbuSDyOI12hYghfw2MbiXmHM=; b=sXD1SxE5MKb+/9
	VIOwOGJAxHrY7Zwm3zOFI99ELoxjXIF6IwfWjucD2+oOPml+a7HKe/duNoBB4PwqN5ilWCOIee3bu
	0ReACO9HJmAewXUlUwrdC6txhWRRZERp7SAKTRQ+yOivr9v+nGYShyi67MEXqZ2qjTfr5GYzCCjzl
	Oc2Rwmw4pWWlizUCC8Qq2SVggAgkB7oRxFTM/hdP4ALmb5xiYz2y+rPUm7v1J0emYx1jL/tMGIRZ7
	cdLp2488rwlqXGC2TMTTr2Z8/EkPnVf8XpeNI5TMcKEWFdgllNcu2VIHpd0S+ZaR8kAPxSKxZF6EW
	7wM1G5O+CrsFIt5A/7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhz42-00000002yqa-3kWo;
	Mon, 19 Jan 2026 23:53:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhz41-00000002yqF-19mP
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 23:53:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F80060151
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 23:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27974C19425
	for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768866820;
	bh=cGakJU4QjXpVKqVk7iTfLklopa5iarhgK0sVfCXw2Zc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JrUlcXsWcm3Gep3dMJbs+AmlhGfq4qhDeSk1ypl7KVINik2k7POZsc/6ubyGlAFF3
	 wXvGJ78usnvU6Vs2JHoJWfqsKeRCt6KExuIdYokRSG8FDVupx+u3Mcf5x7LifTEzvq
	 jz9mwLUX6eltjGfef+3JJV+/te/51TYUMhrBi76m7oStoXO7WJEeSIkIGRaOOQStBf
	 9c+PL8npUVgkYCtUliwfFcsAhg/wuhnv/9FPD1Kg8JleEBEuaYqo8KfAE/mRStIFsD
	 2V3M1ZzhJmd0KEylxYM+dQBKLWstjxsFUwJhsZBl+HZYzxQAcmwU/uEMYjsok7pij9
	 tl493tMSjdKKg==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6467c5acb7dso3926634d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 15:53:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWbN1uWI6/24+6/M2vuOwQeLi42mnoGTOBQK8d5z9rULcY9Wdp0NLwRRQfMj+lxM3VA/INUmm7I4hHqHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH4ShFh8fMQOjD0ds5uPmsxvkoj95OCN0q6lARYZlKakHb3eFh
	hAnoD2FCJMtb/BYxHUQrqK1MqOjOGnlbCLmgx/9hiH3hkT7xGMC+Ck4j56uWb+liVZ7gESP3etr
	85rLOUIXXd3p6pGv+721RT8F2dTfU2RY=
X-Received: by 2002:a05:690e:1685:b0:643:2169:d6d3 with SMTP id
 956f58d0204a3-64917736136mr8776075d50.69.1768866819491; Mon, 19 Jan 2026
 15:53:39 -0800 (PST)
MIME-Version: 1.0
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
In-Reply-To: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Jan 2026 00:53:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLnmbGN1riUpXGa3kuwVQh2gQ8D9GZgtnJDs2yzouvBY6Q@mail.gmail.com>
X-Gm-Features: AZwV_Qh_eDw0c-w4THoUkVrCkuqzPwqyf9Zz69eeTwoO5y4GUJtui-8WqMWvvzs
Message-ID: <CAD++jLnmbGN1riUpXGa3kuwVQh2gQ8D9GZgtnJDs2yzouvBY6Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
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

T24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjQz4oCvQU0gVHJveSBNaXRjaGVsbAo8dHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgoKPiBDaGFuZ2UgdGhlIHNpemUgb2YgdGhl
IHJlZyByZWdpc3RlciB0byAweDEwMDAgdG8gbWF0Y2ggdGhlIGhhcmR3YXJlLgo+IFRoaXMgcmVn
aXN0ZXIgcmFuZ2UgY292ZXJzIHRoZSBJTyBwb3dlciBkb21haW4ncyByZWdpc3RlciBhZGRyZXNz
ZXMuCj4KPiBUaGUgSU8gcG93ZXIgZG9tYWluIHJlZ2lzdGVycyBhcmUgcHJvdGVjdGVkLiBJbiBv
cmRlciB0byBhY2Nlc3MgdGhlCj4gcHJvdGVjdGVkIElPIHBvd2VyIGRvbWFpbiByZWdpc3RlcnMs
IGEgdmFsaWQgdW5sb2NrIHNlcXVlbmNlIG11c3QgYmUKPiBwZXJmb3JtZWQgYnkgd3JpdGluZyB0
aGUgcmVxdWlyZWQga2V5cyB0byB0aGUgQUlCIFNlY3VyZSBBY2Nlc3MgUmVnaXN0ZXIKPiAoQVNB
UikuCj4KPiBUaGUgQVNBUiByZWdpc3RlciByZXNpZGVzIHdpdGhpbiB0aGUgQVBCQyByZWdpc3Rl
ciBhZGRyZXNzIHNwYWNlLgo+IEEgY29ycmVzcG9uZGluZyBzeXNjb24gcHJvcGVydHkgYHNwYWNl
bWl0LGFwYmNgIGlzIGFkZGVkIHRvIGFsbG93Cj4gdGhlIHBpbmN0cmwgZHJpdmVyIHRvIGFjY2Vz
cyB0aGlzIHJlZ2lzdGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogVHJveSBNaXRjaGVsbCA8dHJveS5t
aXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+CgpBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXN3QGtlcm5lbC5vcmc+CgpJIGhhdmUgYXBwbGllZCBwYXRjaGVzIDEgJiAyIGluIHRoZSBzZXJp
ZXMuCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
