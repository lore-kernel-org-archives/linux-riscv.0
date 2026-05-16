Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C93BCD4F21
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 14:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/juGHGWbxMvm2HPToyxeyypjMd1OMVCTCmRaRbH2XPc=; b=uurxPzYg7s/EJU
	T2PjDCGkWr4TSulWRWEkakievZDWk84RWZhiMPciQnxtuXz+RtpbjKHxh/r41MYmryDm+pW99lALF
	nEfsxVyZFq28Vg0lUYOnu5SOTeRKXDzwYejqCU0s4CYI1l12oqF24pezmVK16nxFbwZfJHl3N4aTV
	2rYD+YWkfwMPHOf5TcD32BQVsVwZeRgv0Y92XG0+NZbRhIPYyrabKYwgdpr7zAjoOXMsh4bQI/k9M
	PPVeMjSzpWA5BNFZVi8Q4Xs9DfkyWHzAtyQ0OoD5YxtS7YBGPSRA+xbK3S6R7UpaI3fvMPglrvz7q
	hkFqr34XdtYTBAisl/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGTZ-0000000Atkd-2EBE;
	Sat, 16 May 2026 14:58:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOGTX-0000000Atk8-26Fb
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 14:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DB14445BA
	for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 14:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0870AC2BCF5
	for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778943526;
	bh=cj6DCkgT4nLvdRIrKGN5toggTRHiMavADIBTkg63RsE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eGQV6Yjolm3KPajKQCTPhOXBTnJiQHGujbPXrxoHisgiQihaxNxPQeylYzml+oQ0E
	 UsyNGC9BcX8CBGookrLqzTHUAb9Bklp6f3IHDeVWWln30UowpCWtYY4HKNrtfVQFF7
	 jKejTCzA9XyqPW2a8ckzbaQd8c6PBM6XZoor35sOcVe5aXU6W+8msj4hfFjcKRVy6H
	 L5fRMDpRihEGBv79UE7RtDqa6YsckOvEX4OCkVPA+t86ds+8tWYcu5ajiBD0or3ebM
	 gCK/vIeMUUQM2i3Oyayo735pd3mSjJ4iMqGJv3PmNe9Y4trxtK4+13REJKAUOGJJwT
	 rZDwl8UMC+GnA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a8ee4b703fso815993e87.0
        for <linux-riscv@lists.infradead.org>; Sat, 16 May 2026 07:58:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+hKHRlBtFz2TnX/VrjjEmb+4B15xlqNu87oHgN2s9DuuaawjT5WqLuqFTZyk44ouu3l4kY1ECocIbCjA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxFfVn6RDy0e6REs8e/Nw5LM9XZG2hoLU0XZ/OhCx+LcSXyaUk
	Uz/o/SX8fqjHSee+UNSZQugDZKF3IgavB/4AK6jeGOTqVqu29TBc+3nLaiXzyknjCvFx384Udzc
	VhdrU2SvfFyun0to9jvCBJ/HoIR/EJVQ=
X-Received: by 2002:a05:6512:3409:b0:5a8:73c3:f27b with SMTP id
 2adb3069b0e04-5aa0e623b51mr2521095e87.15.1778943524744; Sat, 16 May 2026
 07:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-energize-dramatize-051909e54256@spud>
 <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
 <20260514-used-revival-306ddced4ab8@spud> <20260514-afterglow-overlabor-bc483b2a8b35@spud>
In-Reply-To: <20260514-afterglow-overlabor-bc483b2a8b35@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 16 May 2026 16:58:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLnsL7w+2mR6JmAEwEXcfbipoL6eLWwz6g9ZCbr4T22Wmw@mail.gmail.com>
X-Gm-Features: AVHnY4JdmrVpvtaNxwOlXXn3NxCkXK8mtEn98EOr0BMFQmQRWm8DuStr0owd8fc
Message-ID: <CAD++jLnsL7w+2mR6JmAEwEXcfbipoL6eLWwz6g9ZCbr4T22Wmw@mail.gmail.com>
Subject: Re: [RFC v1 0/4] generic pinmux dt_node_to_map implementation
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_075847_560461_FFD982F0 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgOTo0MOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+ID4gUmlnaHQsIHdlbGwgSSdsbCBnbyBjbGVhbiBpdCB1cCBJIHN1
cHBvc2UuIEkgbWlnaHQgc2VuZCBhIHJmYyB2MiB3aXRoIGFuCj4gPiBleHRyYSBwYXRjaCB0aGF0
IHRyaWVzIHRvIGdldCByaWQgb2Ygc29tZSBvZiB0aGUgY29kZSBkdXBsaWNhdGlvbiBhbmQKPiA+
IHlvdSBjYW4gdGVsbCBtZSB3aGljaCB2ZXJzaW9uIHlvdSBwcmVmZXI/Cj4KPiBBY3R1YWxseSwg
bm8gbmVlZCBmb3IgcmZjIHYyLCBjYW4ganVzdCBwYXN0ZSBoZXJlOgoKTG9va3MgZ29vZCB3aXRo
IHNvbWUgcmVuYW1pbmcuCgpTZW5kIGEgbm9uLVJGQyB2ZXJzaW9uIHdoZW4geW91IGZlZWwgcmVh
ZHkhCgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
