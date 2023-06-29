Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A845BEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWj5VGsyrFe8vEZen4jHvXkqeFqiDLDDPd7+4ce90Qc=; b=n3zRq/lLu5YZOd
	HLaLhl5akNwa4v6wYjPKFuDforVql3ilZtwoCGPrHmCPilTpaFpCKRgnJPToUlM8C1yqee3FEGBGO
	03VTO4hSAHJfmicgDcUNaQu+hPIqEoH26yhmA2TBSycf8f3cxCQI6hAeI8jR8Ny0P33nsl3gpnZos
	xhiy/gLlct+E/49tnllAZgaiAUrx+QK4EtUR44QW86Fwm46Yz1azvzfYVGVCdOMHWS4bdXePN65UX
	te9iDaoSTtU+krQhlGZGCrzEoGHavUQ7lRDVAgMFbf459sgG53g6mRNxSweki06783HMjqLGZ/2WT
	00y9Icv2L71qTZ/jyfuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0nd-002RC3-1E;
	Thu, 29 Jun 2023 23:11:41 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0nb-002RBA-0y
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:11:40 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b69e6cce7dso19600481fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 16:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688080297; x=1690672297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouIIJPlckIJc9s2Ly4rKH2jNlWjaAkDeAVhQw+0U5tI=;
        b=m4m8CXI5kC9XyLaB3B93wRD//YHWodMtxl8KCaREWm2mLWWsOuW2lkGcxQb58OX/Z/
         Ad662wXUZPHwSQYS4o4BeqGrSKnLU0jAVe0i0Fo5db3KfKvNW+TvQ6XPT0oF8WzbFue+
         D6w0CTphRNULh071DYz+veN2UHVwygD1RslfbZSniNwqHugKQoMf+llv5QYqiC3uMdiZ
         Sr2xQughruiYIKC/i99TZhG0Y8OcRRBMQFKcxRZgWEqCywKswIbBlA/FYJHGF7IABDh9
         WScBt11ybJihu6wKpgYSUNXNvMF6E8kbQap6AYhqQSKFWSq5IlUGplv9GtbBeXP5apMB
         cEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688080297; x=1690672297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouIIJPlckIJc9s2Ly4rKH2jNlWjaAkDeAVhQw+0U5tI=;
        b=C26XeNviKvViOsBIw4s6mYtIUlIyNLNggxQv2TrNyaHRBoHdunXngv4Wcw+F5Wy1wI
         Mp6ocCPEUFSB66Br6yVABK8OO/d466eOVyV6GU8iHJ52j4aKp8QOQVv1NiyYRjgNnS83
         P72ZfnovwgKHPytDc87xh5oH03WXdaC9CFctLkRcDwjhdlbAfpMEuFhH+sSPZ1N4nz/M
         6uPTJwt0EaOn1ubteMcyqaATbO/WoIpDAtdCZQR+BM1nDmdgYs4y/GNUvD3rzyOclG9s
         Id4Yj6ULUhaTv35S4B+ZKSjm6FXHoaUlYj2YgTQ8nyqa2BLwj9DhALnknKg4WgOfK3/L
         5IHA==
X-Gm-Message-State: ABy/qLYx0dn3wM13Rj7n2HFER4ZoW/uRrjCs/tt4nsbPtstihGqEPLRU
	1iGImgdICnEBhRZqSE+JU9Z7gbgC+Tf+60vVDNySiq0NMVDsGOra
X-Google-Smtp-Source: APBJJlFPCnjLtVPVAgBt/mvIUDlRQlncLV2H4x3FcrZq3O2Nmv/iTODNm0bAvQbrqOeggFoTUGqALCq8sh+oIRyH6BE=
X-Received: by 2002:a05:6512:1094:b0:4f9:5a61:195c with SMTP id
 j20-20020a056512109400b004f95a61195cmr976866lfg.13.1688080297379; Thu, 29 Jun
 2023 16:11:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy> <20230629-museum-playhouse-6dbe7e573f2c@wendy>
In-Reply-To: <20230629-museum-playhouse-6dbe7e573f2c@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 29 Jun 2023 16:11:01 -0700
Message-ID: <CALs-Hsu5yA7eBPOFQkmd94GR+15wuFkbYbYSg4RubmkdQDyi8g@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] RISC-V: shunt isa_ext_arr to cpufeature.c
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_161139_341010_50C9ACCE 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMTozMOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gVG8gZmFjaWxpdGF0ZSB1c2luZyBvbmUgc3Ry
dWN0IHRvIGRlZmluZSBleHRlbnNpb25zLCByYXRoZXIgdGhhbiBoYXZpbmcKPiBzZXZlcmFsLCBz
aHVudCBpc2FfZXh0X2FyciB0byBjcHVmZWF0dXJlLmMsIHdoZXJlIGl0IHdpbGwgYmUgdXNlZCBm
b3IKPiBwcm9iaW5nIGV4dGVuc2lvbiBwcmVzZW5jZSBhbHNvLgo+IEFzIHRoYXQgc2NvcGUgb2Yg
dGhlIGFycmF5IGFzIHdpZGVuZWQsIHByZWZpeCBpdCB3aXRoIHJpc2N2ICYgZHJvcCB0aGUKPiB0
eXBlIGZyb20gdGhlIHZhcmlhYmxlIG5hbWUuCj4KPiBTaW5jZSB0aGUgbmV3IGFycmF5IGlzIGNv
bnN0LCBwcmludF9pc2EoKSBuZWVkcyBhIHdlZSBiaXQgb2YgY2xlYW51cCB0bwo+IGF2b2lkIGNv
bXBsYWludHMgYWJvdXQgbG9zaW5nIHRoZSBjb25zdCBxdWFsaWZpZXIuCj4KPiBSZXZpZXdlZC1i
eTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgoKUmV2aWV3ZWQtYnk6
IEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
