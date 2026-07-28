Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0EDC54F4C
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Otlh1zQZ9ACV+S2sslsSp6Yd+6Z3o99mcJ2fYFyhJSQ=; b=wL3fGRyeFuZMh8
	yjqaOYwLWIh69UjhdK+EVlmctCNITebAE7KhEVXqo/hYlAtuZhiBW2FiwmBeUcpbxitS+ODJ+4106
	3dU69yLh+sopnt+TEng+ZQbb1ss4neHLj6gm3PObT+sQ2CnnAgd50d748pg6SyYH9m5Y3G3i9ghBG
	o7YQw8UPgkgkfuby3lRdslTaIuJ4pxu6vlcVeU/J/vLRwnA03ddEU50wuXdpnPCyXBcogO3oHu6ea
	P6eQpu0OV12pHhornED9OxZsC5Fqd2CZHfBtDhfz+OVUF8JJYyCHGEbVkCmmpN1dFhT48XfQIE655
	RfahUhmqk3Y4aAty3oVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojqW-00000005fFe-1DpE;
	Tue, 28 Jul 2026 15:35:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojqT-00000005fEH-2Ixf
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 15:35:54 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47f707e5d75so8623f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 08:35:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252951; cv=none;
        d=google.com; s=arc-20260327;
        b=Hat/qD5r9cnbdR5eHaR85pQVN7hULIOn10D9spTfHgjzA4PUIwjRR6pOQXQkDX8ubh
         renzAHJx2ohcSBQ5vPghejr3MDecTvoYTWJguvHHL2LdMenLipCe3Uvh9J/FdZxwtP/4
         v3CsL9/aKlh2pZxb/8iY9uWAN5Kw4DL45L1n4D10R+7TFBL4HD0Rpt3kegST72GP06ek
         8AIU7DJsyRYkuQ69rc9619NxeJYzAfO52/gTUpKcTYA3xB/4YBE7WPHmjyvlV3fmw1fi
         XO2/Euwh2zLrWx+B/xKmgFPKCUvzK113JXGbvn+AOg0tkqadfWAxSWjQmcaqXPXVAebd
         n0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AViFMS0ewOoq1cL1NaPq6qKbymiWEx2DbacEkdjRd2Q=;
        fh=mkc+DgUavG4NfknKQckWRDObbgJVKIxXE6EEDHm7MWQ=;
        b=ElJBzhRy+3JdFa9FJXUDSz4uyEfO6q9LF2z31i1vzMFyQyBHv2hI3Z3xdTY3rteSXn
         BsdP/gLVnU0PRw552Y3bbT+G+5z0PMyb8hARWKHBOEeIryaZkG3jPDTVUD+WARyJJrRC
         8CfeqP5tENV+V0Fe6orZOrdtMdeoE8H5llduAw72AYM9IxqQ3YxI5I8A2nl9lIV6Bn3/
         e18AFD/112yRuxxI4A7ihXekChMM/DCn5nXCf209A9Xl3bN0REdWNEcmVfhrcLxjnlnw
         OmZrbWpnjGamCaMHHeXD1txTqB8tOMeLOBdMQ/G/lcQc3/ZL3y53wYP6bNTA/P56RKbh
         5Xgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1785252951; x=1785857751; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AViFMS0ewOoq1cL1NaPq6qKbymiWEx2DbacEkdjRd2Q=;
        b=BcUy+UYdoy5au8nohsBDVrW1OryjtOY6vgFDywZhwI104klMXO2xfHg2TUpClwXQ6g
         49LvFER2oXeCzqe0iuFaoFp9pQNxdsWlfOocZUlIZeZv6iGNYaguXULzEBW5ByHAMEJn
         iahXBZuxT7CX8DqaUY7slKO9JA+/SZjjVczGkToYRAvgsAvQYf3jketoWreKTOmNv8jM
         lWUOCHXEXDMxWALwN8BK8hlGe4xVcjnN4NAD/DW1FaJhdi59b4etoxuLJexyldi3wKWJ
         eY8/fA+2nB/Rz6Atgy3Rd9Od0LxUm+ABNqI/ac7IIdlF7gLwhUL7/GqhHEOcLDE2jX13
         ZtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785252951; x=1785857751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AViFMS0ewOoq1cL1NaPq6qKbymiWEx2DbacEkdjRd2Q=;
        b=OLNyJwHfkNXy0AcfU5Ul2CUJ4MFasxcdz0SAwffqWjtfZNeRPQ3YjfO51vEmfuL4Sq
         0w+G/Wc9vKGHtPHVo5TQyDGdSksuhHIs6gckxSkWd9PHpf7bNkTYlpNU33CVCZb8JTDi
         r9Pm+maUqEUxhjJIM77dvuQuFNZl2IQ/wTprwbers+BObbNnE1QRXejfNLd0TXChqqDr
         tBBqF9tqCLzicidxkHvVLOnUMZeEeyRm/vBJe7UUAeLqezSqy5+hm5ggWQ3g2G9yhBHK
         vu+wvPyY5utJcHlhU11gcmOkuch3AcuAclX/Ghr8LNkMLhWlIkrfdVZnU9aq9q2ELo6R
         vxwA==
X-Forwarded-Encrypted: i=1; AHgh+RrhYN1V4keP1tMZOX/OkDE5iRX7ob1i/oES8ptjddel8y92GAHNlbN5blSaMY8JS56mz2Jh5l2Io3zayw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy745VncrhL20G7UlMCzHS3B1dT00PY5weiVMEqBAqLO6/5tU7s
	ZKJFFBnxs/ZERN3xNp39LkkM/OS764v7z6mMyWfc6KuLovLU87QkpnmY/E15NMQtBFOfKFki51s
	W39kaUCQjaGjwbKqF7UJSADd+FhhPWy2orZL4P6MzXQ==
X-Gm-Gg: AR+sD12CYBQW8+UOgZYuYhulXAC9rk5Th+n/C8qy6nCnT18RATDfbJEMi5V1vIlXDNd
	aV2JDPoCXXAmBKsfKwRunTzK3a8WGNf7j1mZru+ilQT2LJnTGFHUFvMA4rKjTldgVQxpkpfUEHc
	RO8oc1hfSu+vnYu+1V4k+KSHeDOi2kdKAZnPxogKiUeAYpJy5f5yN4QRXy4unmk8JiCBgfnGBVc
	00GTXfI0u+VpZsPTEa3r9dIbKTJfYEL4626aciz1L9lwhoTWpTX3yhAoVU0VH9ajeRmfYa18Gyg
	NmfuAGOAF3w9hHVPCbVCv1qofsWNEbIXcEtI50Y9WVMang15AI4FiqwCYZ4mAKGw0J1lWBaSfmf
	/W6YH
X-Received: by 2002:a05:6000:606:b0:47f:2634:b5a with SMTP id
 ffacd0b85a97d-47fb1ea7d51mr3223821f8f.33.1785252951217; Tue, 28 Jul 2026
 08:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260626103619.174179-1-yhchen312@gmail.com>
In-Reply-To: <20260626103619.174179-1-yhchen312@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 28 Jul 2026 21:05:39 +0530
X-Gm-Features: AUfX_mxshNrjU_4DhTQT2LcNdq_XRUYgd4f2QGjF33GZ2jYUBKW7SoamrV0OVuE
Message-ID: <CAAhSdy2Qa2DGFzb27MgmoH5Pf1BOrgwaZBqP__U9eejs5-5Bsw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Add arch-specific tracepoints
To: "Yuhang.chen" <yhchen312@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Quan Zhou <zhouquan@iscas.ac.cn>, "bingyu . xian" <shanbeenyoo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_083553_863641_37333721 
X-CRM114-Status: UNSURE (   8.54  )
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

T24gRnJpLCBKdW4gMjYsIDIwMjYgYXQgNDowN+KAr1BNIFl1aGFuZy5jaGVuIDx5aGNoZW4zMTJA
Z21haWwuY29tPiB3cm90ZToKPgo+IEFkZCBSSVNDLVYgS1ZNIHRyYWNlcG9pbnRzIGZvciBldmVu
dHMgdGhhdCBhcmUgdXNlZnVsIHdoZW4gZGVidWdnaW5nCj4gZ3Vlc3QgZXhpdHMgYW5kIGluLWtl
cm5lbCBlbXVsYXRpb24gcGF0aHMuIFRoZSBleGlzdGluZyBrdm1fZW50cnkgYW5kCj4ga3ZtX2V4
aXQgdHJhY2Vwb2ludHMgYXJlIGtlcHQsIHdpdGggdGhlIGt2bV9lbnRyeSBQQyBmb3JtYXQgZml4
ZWQgdG8gdXNlCj4gemVyby1wYWRkZWQgaGV4YWRlY2ltYWwgb3V0cHV0Lgo+Cj4gVGhlIG5ld2x5
IGFkZGVkIHRyYWNlcG9pbnRzIGNvdmVyOgo+Cj4gKiBrdm1fZ3Vlc3RfZmF1bHQgZm9yIEctc3Rh
Z2UgcGFnZSBmYXVsdHMKPiAqIGt2bV9pcnFfbGluZSBmb3IgdXNlcnNwYWNlIElSUSBpbmplY3Rp
b24KPiAqIGt2bV9tbWlvX2VtdWxhdGUgZm9yIE1NSU8gbG9hZC9zdG9yZSBlbXVsYXRpb24KPiAq
IGt2bV90aW1lcl91cGRhdGVfaXJxIGZvciBWUyB0aW1lciBpbnRlcnJ1cHQgdXBkYXRlcwo+ICog
a3ZtX3dhaXRfcmlzY3YgZm9yIHRyYXBwZWQgV0ZJL1dSUyBpbnN0cnVjdGlvbnMKPiAqIGt2bV9z
YmlfZWNhbGwgZm9yIFNCSSBlY2FsbHMKPiAqIGt2bV9jc3JfYWNjZXNzIGZvciBDU1IgZW11bGF0
aW9uCgpEcm9wIGt2bV9ndWVzdF9mYXVsdCwga3ZtX3NiaV9lY2FsbCwga3ZtX3dhaXRfcmlzY3Ys
IGFuZAprdm1fY3NyX2FjY2VzcyB0cmFjZXBvaW50cy4gSW5zdGVhZCBhZGQgY29tbW9uCmt2bV92
Y3B1X2V4aXQgdHJhY2Vwb2ludCBmb3IgYWxsIHZjcHUgZXhpdHMganVzdCBiZWZvcmUgdGhlCnN3
aXRjaCBjYXNlIGluIGt2bV9yaXNjdl92Y3B1X2V4aXQoKSBmdW5jdGlvbi4KCkRyb3AgdGhlIGt2
bV9pcnFfbGluZSBhbmQga3ZtX3RpbWVyX3VwZGF0ZV9pcnEgdHJhY2Vwb2ludHMuCkluc3RlYWQg
YWRkIGNvbW1vbiBrdm1fdmNwdV9pcnEgdHJhY2Vwb2ludCBjYWxsZWQgZnJvbQprdm1fcmlzY3Zf
dmNwdV9zZXQvdW5zZXRfaW50ZXJydXB0KCkgZnVuY3Rpb24uCgpUaGUga3ZtX21taW9fZW11bGF0
ZSB0cmFjZXBvaW50IGlzIGZpbmUuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
