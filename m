Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62CDCA0EE6
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkZgU086O4o0zZjcOkxnolA+RLT2mo3w3MXCeMIcPro=; b=hkiBaCGb3C0Yx/
	xyw47bGOQFqKfFce79oRaP+KLRN0FpUt4czSt2ZtBLpqd0ITCcMCZ4yFP1vUTyo3YipPmxLEdcpMO
	1e5g5j/PEkznzshELMnGx6pwbZxT+vg0bNshwMFlQ2AYzR3DXDP86QPsB7FSIzFTu9E4l38qoMKVU
	srZ49teMYSC4WKResvuqfIuMSpbtQOl9Se5ExveEiYCyWPzVSr2WVfOYaHDMqccfNc1SCVzf2eEGj
	QjbsVv9JhGr6qxUTQYI3Tku1xT+dyqwPgqV6OzUPPL/Oq3h+pHojq0Yt5D95QPXvrotnFL4liWWwX
	5Ab+9l+ZrA61Z8PgS0rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKdW-0000000AIwq-0hKD;
	Tue, 19 Aug 2025 11:36:18 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJ5g-0000000A3F0-47fI
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 09:57:18 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55ce52658a7so4886133e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 02:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755597435; x=1756202235; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B657FCRrA1HpbcN+g/vtvEIg1TfbvbOHf4kJ5LZvO5U=;
        b=TJsfggMNqF4DkuoX4A/uIJ11zg6Zt7ogsgqxsldqboApPBVFstnUbapeCHXEB8VGEh
         76zFtk3UN1FnD2rMVNiC0Ckpnrzew3SNnBvS7AUP49dzxWB6Q/VISpBFgQblB7kPudRV
         /8uOThl7F0cUgv9K+zZyANF6C7rhNm60TR8BQqWWwzKW754vh2ia4Ehty8papOgZSt9I
         BvHcSVkv/GsWs+uP8Yz2vASIFQiWQDFoG/+qLcL5LM1NiXl9dCrvAOQiu1ryKIJRjv6i
         U13g5MnwO3/UkYh7q7EwCtOjqQKH72mwptcLyREMBlje7rgCTZG7j6Iz1HiiPYJ8Fm8X
         pVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597435; x=1756202235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B657FCRrA1HpbcN+g/vtvEIg1TfbvbOHf4kJ5LZvO5U=;
        b=Sf7DiCpPkR1JSXOL0EhWJokjykZHHqZtncY/MOD4MklQSVwBBTapSNWlMrvnaKkkvG
         EcPMPQ1aZ2hwh4uwTpfq735vU8E1rZjyanhNrGuPzBRsPpt1aiDX8aEq22gV/jmzas2B
         arRXmqtdK/lcZKXOJs5XOBJ+a2fLkxf0W6t2eCTiRtmBACabrg65MSfla0UqxjynOCrw
         KwQpe/uAv/I4Ta1Bdv6hH9HeC5jqpnn9T6bSWL5XkXufXbnsVHMkN2orPW9YYe9itXOe
         A1x5fabPquULykTA0fAHGKXu9ZAeFFTVXmocVWqseeq3oqgMdCFZQS2CkKI4ibfhpJR8
         mzsg==
X-Forwarded-Encrypted: i=1; AJvYcCUQk60BEAJMTJqj9dIt+dc+aS6YdiJ97l+HDJDfhuHYrWFGAMr/U60YJ0aTp96Ca3N4paBtEJ6ppPZsvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvxvH6wix/jTxG8yF/cpDRIIpr+n8RC68a7inqaJIvTZ1I37/W
	G3sG+xEeDyEnJIhf29Si08i4wz5vx0BhiKp2F5Nd44Kyldi2/9D9JzCEWwggjeCI+Gd1w9SGTiG
	K3Vpz02/3ty4EMyJCBqqNVREDZ24wNNV21ZSNUqeKJA==
X-Gm-Gg: ASbGncu0cMhdykEqcRTt4roBBXnojs+yP7GYH9Uc54APw831MF9Bu6bJEpcjhlrjko0
	HjaqNuxnn2reGTdv/f4wKCdIuh2IRUVaMGjaf/9mnJviIvckfQm7pBmOKAHXMAu2ejZzsgslbwV
	XspOL5UPGV6wBAttW/h4WsivDE5mlzNKM9i5v2GqICZieZ678k4gT6gTXy1/xp0OKlEz5PEjRYq
	lJjL8dC
X-Google-Smtp-Source: AGHT+IE584Lps5ZJGPPasz2qjXvE1uln/YoeKZ+NEr5/UBb8mlMMaF+8xE4Mk12v0EiPPAIF33QJj8U3svU1V3OfZ8Y=
X-Received: by 2002:a05:6512:3411:b0:55c:e5c3:1a44 with SMTP id
 2adb3069b0e04-55e007db76bmr626581e87.48.1755597435230; Tue, 19 Aug 2025
 02:57:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3omyk7YGVHNV5mgR13cON1SxdpqsxGQJsWWE1Hoyw=5A@mail.gmail.com>
 <20250819012558.88733-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20250819012558.88733-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 19 Aug 2025 15:27:01 +0530
X-Gm-Features: Ac12FXyTUxSpF4ciP7rx8i1SvNQzuuHLy0NA8cpXjF9T81-EV5Hi44pHTVwLXYE
Message-ID: <CAK9=C2XN3izaV_cB5dTkRD0FRD+gqdRVYWKxMAuaCG+LP3D2aw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Using user-mode pte within kvm_riscv_gstage_ioremap
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, alex@ghiti.fr, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, guoren@linux.alibaba.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_025717_027061_9BAEFE5F 
X-CRM114-Status: GOOD (  16.91  )
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

T24gVHVlLCBBdWcgMTksIDIwMjUgYXQgNjo1NuKAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gPj4KPiA+PiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51
eC5hbGliYWJhLmNvbT4KPiA+Pgo+ID4+IEN1cnJlbnRseSB3ZSB1c2Uga3ZtX3Jpc2N2X2dzdGFn
ZV9pb3JlbWFwIHRvIG1hcCBJTVNJQyBncGEgdG8gdGhlIHNwYSBvZgo+ID4+IGd1ZXN0IGludGVy
cnVwdCBmaWxlIHdpdGhpbiBJTVNJQy4KPiA+Pgo+ID4+IFRoZSBQQUdFX0tFUk5FTF9JTyBwcm9w
ZXJ0eSBkb2VzIG5vdCBpbmNsdWRlIHVzZXIgbW9kZSBzZXR0aW5ncywgc28gd2hlbgo+ID4+IGFj
Y2Vzc2luZyB0aGUgSU1TSUMgYWRkcmVzcyBpbiB0aGUgdmlydHVhbCBtYWNoaW5lLCAgYSAgZ3Vl
c3QgcGFnZSBmYXVsdAo+ID4+IHdpbGwgb2NjdXIsIHRoaXMgaXMgbm90IGV4cGVjdGVkLgo+ID4+
Cj4gPj4gQWNjb3JkaW5nIHRvIHRoZSBSSVNDLVYgUHJpdmlsZWdlZCBBcmNoaXRlY3R1cmUgU3Bl
YywgZm9yIEctc3RhZ2UgYWRkcmVzcwo+ID4+IHRyYW5zbGF0aW9uLCBhbGwgbWVtb3J5IGFjY2Vz
c2VzIGFyZSBjb25zaWRlcmVkIHRvIGJlIHVzZXItbGV2ZWwgYWNjZXNzZXMKPiA+PiBhcyB0aG91
Z2ggZXhlY3V0ZWQgaW4gVW1vZGUuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUg
PGZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPiA+Cj4gPk92ZXJhbGwsIGEgZ29vZCBmaXgu
IFRoYW5rcyEKPiA+Cj4gPlRoZSBwYXRjaCBzdWJqZWN0IGFuZCBkZXNjcmlwdGlvbiBuZWVkcyBp
bXByb3ZlbWVudHMuIEFsc28sIHRoZXJlIGlzIG5vCj4gPkZpeGVzIHRhZyB3aGljaCBpcyByZXF1
aXJlZCBmb3IgYmFja3BvcnRpbmcuCj4gPgo+ID5JIGhhdmUgdGFrZW4gY2FyZSBvZiB0aGUgYWJv
dmUgdGhpbmdzIGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcgdGhpcyBwYXRjaC4KPiA+Cj4gPlF1ZXVl
ZCB0aGlzIHBhdGNoIGFzIGZpeGVzIGZvciBMaW51eC02LjE3Cj4gPgo+ID5UaGFua3MsCj4gPkFu
dXAKPiA+Cj4KPiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lgo+IEkgd2lsbCBzZW5kIGEgdjIgcGF0
Y2ggdG8gZml4IHRoZXNlIGNvbW1lbnRzLgoKTm8gbmVlZCwgaXQncyBhbHJlYWR5IHBhcnQgb2Yg
bXkgcmlzY3Zfa3ZtX2ZpeGVzIGJyYW5jaCBhdDoKaHR0cHMvL2dpdGh1Yi5jb20va3ZtLXJpc2N2
L2xpbnV4LmdpdAoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
