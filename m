Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436EB606A31A
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2026 04:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bCkvFFSz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=DqdJbXfC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZTcNfyXZONNbpF4z0CaephSgVan9uHhHSH3IBDNjQiI=; b=bCkvFFSzTcwDmpmC45VJIxTkFv
	2RW+ufdJFNxtkDRZQNRT5udSoc0XrjibUl+/pbKSHXXwIJeOb4ATsYiBnUmApQ3npJJjfqhgi4pss
	vlXyo/jgxVThZaVa2JIXU33vGZ6Gk998WdfW7prDckRah77LZh6KGxmR4FyJwqY7LVP2PQupgYZxt
	ginptnUEiQScFsf2eihV4/mIjBMkjMnGQOoOZs6on+rVypvXyo4QeO9ISwYzuj5stNE/0JRPnjRWr
	dfoxrrm3K67Mh+bQ56aMALtdY1Kp+rmfva6SQYvCV4OaZdSo8jnp43YRB0DtDTe3FY2y/GL/Wu+Is
	fL4C1psA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKTYd-0000000HQRx-1MLx;
	Sat, 24 Oct 2026 04:40:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKTYb-0000000HQRa-29ni
	for linux-riscv@lists.infradead.org;
	Sat, 24 Oct 2026 04:40:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a20c923847so12009515e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 21:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792816834; cv=none;
        d=google.com; s=arc-20260327;
        b=Za+pQ91slxFAWCYh7PhJJTi0VGIBUSbprVjiLd6H72wPmrmgjLKka0+L0MSaH1uGeW
         hR53HoPrwI+dLe7vQdF7VDDeuQ0IW/T09QKNKWZIsdI9fmh1S0lcM2r0tvTwjM3XmByS
         gNKgyqEVs5v/cW3ekZ99dv4gU+0TTBseFeXiRa4mlXyFjyO7yo1QkV174wmJL1RN7h1G
         nx6AgdUqmHRQ6vfAvaX4udbXVwmPnQ32K66IzooC3UXEY565sxhCqZ8mzvFo9gTpO/Ys
         cqyQpDQYMxvJwluASp4LYl43I2ZuMddMSogHvsHz7lDz5NgWyUPCkg9iK4iVWgMsSwYT
         H01Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bx0/wKcHbeiKNHmFEBOm5dxMuuf8+Fr1Y4vMDOLL7v8=;
        fh=UPggLlux++XPAG4GEx3dVNHTUlqrbyPzRa7zKWbmzmY=;
        b=c2OqRA+O4LUn++OdIKOuGu+LAwx44XAEthqluNLxYG9G5qGB32dpz9T4dEYdzE//U+
         y6K7ZWPr7N1oTy2rYbQXxPgvUMEXuzooVgboiO+1/Ynq64+U3fnREgAzo/Yem2RRSgVX
         u/xEtB3aWZdfYCfLVzCTUPW1ML9CFdbMDCOM6CBmV8YnmqI5P8q2K6ruu0hJCGyMb7eZ
         AUxnXJbLw8RWtrVdvXaEcyY0uUyzvrMfIPbOx2mNMVQrVuRojimVbsBp4bDmYmyzE80H
         91lus0ChKTK/CRkuSaUdOi+ZhCYFqyV5J0IwcrYHK2R/cNvAT92zNUa8Fmq/csJXt/ma
         Cw8g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792816834; x=1793421634; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bx0/wKcHbeiKNHmFEBOm5dxMuuf8+Fr1Y4vMDOLL7v8=;
        b=DqdJbXfC0F+guovYL7P9YXPzf4UW6WB7ucLooSOCvt05AYNCQIzpTqlwUdWLiI4fnY
         Mdwpmd+W07QOh9t6+cFd0EMVmua8GGPYLtjG+WjrFnhG8ja72QjafxqCc6BzYFsyumMT
         2uf9Rbiw1VMX4IA4lf+67hc/IFwn9yUFNmkXP0XWklhGiFbhPKmX2/YiuLpLEPsm/EG0
         cUF5drUZX+6hszOJbRvWIrbOfMMaMZwMMXd8jg64+PlTL/t0gdtqotylHxEL+HiFVLIu
         cqrx4UI+oCvCusBIRmTqkLNHPkH/rFP6u6cM097a8WCcHYvA6ZrwMFA63QYlagi/C67q
         lhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792816834; x=1793421634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bx0/wKcHbeiKNHmFEBOm5dxMuuf8+Fr1Y4vMDOLL7v8=;
        b=A35K/Y1zs8L04MLD3dE+0+j4eB3zOTYDjjg3XNKcZvw12uk2tVEevaibD9EAvZIAy6
         7PuhZfchQzf9OfJJOhBZuIe2AKwW4cwtriT/+lYUDVjTrgchwbHP6gauo2gyClqD0DFA
         gNxCt//PALWzXRurdjN1A9EeDghSNFpn9FRkQUwEF6ZlsiJ7THAn4pGibhqYQRLJS442
         nl/LUFG6fb6QH6TUID0YNLDtCNGplObYqHiq5YhoO4g6I1XBefa3v0n7WWkDXoRF9yOf
         dxipCA6a7qNnvqjQRdCG/Gzb/VPvBEkhCV6nhpNCXEDPw+7qtotEkmD1XSVf/0R7fBYX
         nD1w==
X-Forwarded-Encrypted: i=1; AKwUvBx2eMmi67HbOomglitUvaGNxlBCh/m9ARqT271G6pT4GNChyV04Bhp6z37tKlsm8UqVj0l98HZJMik16g==@lists.infradead.org
X-Gm-Message-State: AFq9FYK8ifrngRGQeQF8t2wTIzTUw8EcTuG0UPOTUqtoch3OR6xjiFIH
	kPnCPpkG73n213owBZtIPzUl5VJR97jJ1EzpvM3MLRmnF25o+K8YCI9WgljiMP8Un0WADAka2qU
	VCkgI5eB2o+B4kxnJcWKsi1f9w7MNXKbAu+cVupSaIQ==
X-Gm-Gg: AYBFou0TPk9dOC/j7QWmoBmYkGRvAGvpdEwnV9qyVpeo9A1S2X3XvJ64Ee1kG7254ZQ
	VTmqq+6QOaaRhE3r2p0IYivtis5EY9APS9syLeKrCoCCii0ZPg+FsTd8u7xKobg1gy2dH2eP+cA
	g3aEz9UkiqyXl2Zxcqf21/3Wusxo/Z3z3VBPKjpTZE5CR5V+qCs7AxYgf1UMhhw8ihwV8sqDHhZ
	J5lmjqCDYydlp2cjoqb/5Fy4jeRqyR23mlMLV5Yp9PxE7oqioXv8cU217g1QVrHN1kf0/o1MKv2
	8He/HvlIPe1WoMysjLkhfdrJwQhMMs/AGu7NOlCRUyTgZBJICFqJqIy6uusG3EhddHG7uIfaM1g
	ZrOiONx97Vwb33zrJh5FOlpUyTDRi9adP9RIU5f2IVPplO5jRpGMlJliKA1X3zBjqDd31itHSLz
	Phny5NrTijkjOu60svbknKDL3NnlGpmCT6wm64L2aTxiQ5nZKi6wEZ1PM=
X-Received: by 2002:a05:600c:1c26:b0:4a1:d798:b08a with SMTP id
 5b1f17b1804b1-4a35aca500cmr13825895e9.21.1792816834039; Fri, 23 Oct 2026
 21:40:34 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260718040000.006.d6f39b01-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718040000.006.d6f39b01-caplitmus-rv@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Oct 2026 10:10:22 +0530
X-Gm-Features: AclHuK-Aa9nHvGIr0-n7GYUfK2M05kKCRP7g5XpxhDUMoJIkzRzG40FEBcm0xis
Message-ID: <CAAhSdy3vAi7emCX5aXkN37XicacoDFCSE4Yj8MxRPSosQBAwBQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip/riscv-rpmi-sysmsi: Validate system MSI indices
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Rahul Pathak <rahul@summations.net>, Thomas Gleixner <tglx@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_214037_576956_66E29142 
X-CRM114-Status: GOOD (  20.12  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgMTA6MDfigK9BTSBQZW5ncGVuZyBIb3UgPHBlbmdwZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IFNZU19OVU1fTVNJIGlzIHRoZSBudW1iZXIgb2YgYXZh
aWxhYmxlIHN5c3RlbSBNU0lzLiBPcGVuU0JJIGFuZCB0aGUgTGludXgKPiB3aXJlZC1NU0kgZG9t
YWluIHRoZXJlZm9yZSB0cmVhdCB2YWxpZCBzeXN0ZW0gTVNJIGluZGljZXMgYXMgdGhlIGhhbGYt
b3Blbgo+IHJhbmdlIFswLCBTWVNfTlVNX01TSSkuIFRoZSBkcml2ZXIgc3RvcmVzIHRoaXMgY291
bnQgaW4gbnJfaXJxcywgYnV0IGl0cwo+IHRyYW5zbGF0aW9uIGNhbGxiYWNrIG9ubHkgc3VidHJh
Y3RzIGdzaV9iYXNlLgo+Cj4gRm9yIERULCBnc2lfYmFzZSBpcyB6ZXJvLCBzbyBhbiBpbnRlcnJ1
cHQgc3BlY2lmaWVyIGF0IG9yIGFib3ZlCj4gU1lTX05VTV9NU0kgY2FuIGJlIHJldGFpbmVkIGFz
IHRoZSBoYXJkd2FyZSBpbnRlcnJ1cHQgbnVtYmVyLiBUaGUgd2lyZWQKPiBNU0kgYWxsb2NhdGlv
biBwYXRoIHVzZXMgYSBzZXBhcmF0ZSBkZXNjcmlwdG9yIGluZGV4IGFuZCBwcmVzZXJ2ZXMgdGhl
Cj4gaGFyZHdhcmUgbnVtYmVyIGluIHRoZSBNU0kgY29va2llLCBzbyB0aGUgZG9tYWluIHNpemUg
ZG9lcyBub3QgcmVqZWN0IGl0Lgo+Cj4gUmVqZWN0IGEgcmF3IHZhbHVlIGJlbG93IGdzaV9iYXNl
IGFuZCBhIHRyYW5zbGF0ZWQgdmFsdWUgb3V0c2lkZSB0aGF0Cj4gaGFsZi1vcGVuIHJhbmdlLgo+
Cj4gRml4ZXM6IGFhNDM5NTNlODYyYyAoImlycWNoaXA6IEFkZCBkcml2ZXIgZm9yIHRoZSBSUE1J
IHN5c3RlbSBNU0kgc2VydmljZSBncm91cCIpCj4gU2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91
IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1ycG1pLXN5c21zaS5jIHwgNyArKysrKystCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LXJwbWktc3lzbXNpLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LXJwbWktc3lzbXNpLmMKPiBpbmRleCA2MTJmMzk3MmY3YWYwLi45ZDk1N2Y4YTEyNDc3IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtcnBtaS1zeXNtc2kuYwo+ICsr
KyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtcnBtaS1zeXNtc2kuYwo+IEBAIC0xNzQsOCAr
MTc0LDEzIEBAIHN0YXRpYyBpbnQgcnBtaV9zeXNtc2lfdHJhbnNsYXRlKHN0cnVjdCBpcnFfZG9t
YWluICpkLCBzdHJ1Y3QgaXJxX2Z3c3BlYyAqZndzcGVjCj4gICAgICAgICBpZiAoV0FSTl9PTihm
d3NwZWMtPnBhcmFtX2NvdW50IDwgMSkpCj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+Cj4gLSAgICAgICAvKiBGb3IgRFQsIGdzaV9iYXNlIGlzIGFsd2F5cyB6ZXJvLiAqLwo+ICsg
ICAgICAgaWYgKGZ3c3BlYy0+cGFyYW1bMF0gPCBwcml2LT5nc2lfYmFzZSkKPiArICAgICAgICAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICAgICAgICAgKmh3aXJxID0gZndzcGVjLT5wYXJh
bVswXSAtIHByaXYtPmdzaV9iYXNlOwo+ICsgICAgICAgaWYgKCpod2lycSA+PSBwcml2LT5ucl9p
cnFzKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArCj4gICAgICAgICAqdHlw
ZSA9IElSUV9UWVBFX05PTkU7Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IC0tCj4gMi40My4w
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
