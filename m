Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE97BCA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 17:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSSz+xGfWUfuFkDP+zhLf6JJlOlUNDwjOqVG5Dqim8k=; b=dlv/jQKZ34Ul8n
	S0Z0vOstdQ/tLL9YilPh4CyOK7oP5wPja8nCl60UaWHHY6bXDF1XOK4R/28lABoIsDJGLwwsTJNBH
	EWy3ELbHAcoW8O5bOkX5m5VMQ3VssbmwnVLlK5COmnmA2FD6EfM/jTFfIxLDOQHrOALOuXqCm+4Qd
	WYfEiq965vBadoOQRKO4/oyCtlCHN5pMg3G6bVpoM4Ue2FkueDEItiGFs0lZo4SZhnSSkMBmlwq9d
	WQbZXWs3HImv96Lw8iXF/RwQ/8P8tn75I+77Db5dZ1Jzzitsq6n2F0OFMrCUXF/9tahadxYHkg6lj
	1MqXw5ZxQKr9Hgxqnseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgj3-0000000C6uT-3RgU;
	Fri, 02 Oct 2026 17:07:13 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCgj1-0000000C6tv-2YV8
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 17:07:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso188865f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 10:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790960829; cv=none;
        d=google.com; s=arc-20260327;
        b=YXSqKNV4IwwEWdvq3w2AlW8+thtafKzAUX+gJWBEXAoZuySSTA0pusAb+hExk6nexy
         amQ4WX6C0UsriYCM48LQuGZKbpp8J4CeCpOp+ugC6kTYQKeh4pSPi3CQ9i+FbUM+wP3v
         SWOy9fBIjoaT0HQcUfWqw8BKjO4ikZ6xtfYa60mH/tNwQ7u7Oxx2Yg9zHF4Ocmf0Nb9g
         TXgJ75CzMm2GnU1BXQOXW1ayxF8NnVnyhtAiyJADE6xRdonEvPrNFk81L4MXe1oQrh2X
         vCjX6RR9pvrT3gTLKbV1uhwhJ10If6iMUpkY/wCYqXfGlRC5PxrebrH6Z2FZQBS3rTZJ
         PdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YRAF9fjGwIYHesPfozv5hf5MECp6k/GYZrrLDm0L2Tg=;
        fh=ZIESiry5zQ431dcJY8OlmGQLEoSrGlOC0gG6uzdeXbI=;
        b=SYQA7tbSTRBS7PVNK0kOCHocFwKo+STDOPAvUZwPRIgZh44QQofAj1GlnuReXHi+yE
         kXo3iK3HtoWZdA6Ygqd9vCCzx3Gk3UpONnUHriBE4ECQ1n15BwE6ZCeOQHdSjGI2VH8G
         n1BKFO9nSO7cPSIBnNLRR1AkwOYsq14qvahCHSWwHknRUYK8JazIBbSr8/NeXzH/LeTL
         6ckYKLFyZsugTBu8E9YWObQCr8qDg23ZDYSa6RYyYLZKxoMOGNYNGYdJENYFefNEhR32
         ZRzV0PZTPV6fwOhjw8ykkoLMdhD3nHSIgyjC79WfNFI/NnlNpYthUDhDGlya8DpYJ4vo
         LZ0w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790960829; x=1791565629; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YRAF9fjGwIYHesPfozv5hf5MECp6k/GYZrrLDm0L2Tg=;
        b=fDVGy5SGNf3rdIfYUDeLHjUEp09E/yxQdpeoiLcYlnmtXphhglmFiIekL0gtuz0dZ5
         6h8MYVezaRdzMYbhlT6IamA+vI2X6myqoNGjSIUGz1msc9bfRgPzjmkHdK0eGiWA6XnA
         q5m14uT+ZUvdsm080r6MvrZ2geX8/JoO0Gn2aDm8TR5yKtaCRAS0T81ofjeK6szZ9kmB
         ENMzjC/BEIarW6oi0EmAz82RJyAMgOakUUXn/tayyxFmAKy7DpgkE7K5Xe23n8EBX7mo
         +TWz60NlZH+z8GnbdwWvkGVtFDroJB9VuLKb9Rhq4iWIIwuLTPfSQhVHWh1J1v263uG1
         0WNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960829; x=1791565629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRAF9fjGwIYHesPfozv5hf5MECp6k/GYZrrLDm0L2Tg=;
        b=WpPihd3jCPtAuP7xuO+8lptNrlsbdAgTiFrL+Alb2o5r6GOzsA5cJRkFxLg8yKogOm
         vxxPdFzGucrtYrwOLb5jRHovLuZrk3JuZ7hoDLU114edOQ421ofL2trd8xkfW+/pyPEu
         9s6ALhm1cxpi+KF3jyNbtv6lFQnj4KMnTWsqeUaJ1by+aTuiz77dS6S7294IMb0OIFYD
         zAOPcwKVQfDBpxntDi4I7mXWvnjaU3k0iRr3SkzAFovfulOSWFfWLKz2R+x4u9Os8IP9
         u03gedRqcxZIvGjHCfhagtql4ss1FXOFX/mgkNa2kq2pCjAqSG+TGP2fmvbqaZ677MyK
         BFXg==
X-Forwarded-Encrypted: i=1; AKwUvBwWQNUvpbcvcsdpLRJxpBTePHVR2XfMDF9iJMItQ83LpHgwzog1Fq4vncJTldnyEtw/VomKHQrU1T5Dtg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKUI7wuOw6SgUMeIDw4NeW6TBcaIJyb0BPIwoF7EP9C6ypGjHDv
	+E8GcYSUeaBw5Tk7rD9x8xh0HXBz3Plrttzvep9zTrIbEUzwh8lP6CIRDrd3VyQuk+znwM9ZYMb
	5LRd6jygXQcSeUF88jcTWJ4HDnc1odhQo34DcZLrFGQ==
X-Gm-Gg: AYBFou2hyjY9algkcpYEy6PdBgFJUngeJ9szqEucmwoXmMTYirU7JP57oiQrlaQ+rG2
	KRLmv3QvgMluhioWCTg+PvHhyYyZaUS1mny30ehpUkRvLeHttjHNF8C/F3SFE8OejiI+D+2pi+w
	6DDFWeAk5jg5ImxhNfjY+4h3fuJ5hLljV/y5qRzynuSQs58L+uLQZcJui8vPkJdEabvtolEWFXV
	WJEXGewIj3pqW4z+4+cQJYlBP6GIQnT2Jg8bvZnxtwaVFVaoowdRH2QvFdhHTu4o2kBoC/pAjyF
	Q10h5BahDW0Zzmn5WGb7MogulrzI8Bd+HOGJxLQJJht1rrWoW0dG0Tsf3h53VPeeQ2Umk5zEgFs
	e5+MoO0nrDlEkPqo5gcJTDeFfeWLZmj99mnAt0GsnoI01Gc0dGDpuhOFmQpl3px/Fev4WnECIS2
	c=
X-Received: by 2002:a05:6000:98f:b0:48b:116d:56fb with SMTP id
 ffacd0b85a97d-48c47c66e18mr153844f8f.1.1790960829073; Fri, 02 Oct 2026
 10:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261002120417.2708979-1-prajwal.n@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Oct 2026 22:36:57 +0530
X-Gm-Features: AclHuK-ubBdUYjWUG1h1QKLotxslbT8a1w5X5HriAuAQT2PubWA5bXeuAQfD03U
Message-ID: <CAAhSdy2prY0pkfpMxXqyJWKXmy4B49MpmvaaV+U97BxL9ie92g@mail.gmail.com>
Subject: Re: [PATCH] irqchip: riscv-imsic: Expose the fwnode via the global config
To: Prajwal N <prajwal.n@oss.qualcomm.com>
Cc: tglx@kernel.org, radu@rendec.net, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, prajwal.n.oss@gmail.com, 
	Sunil V L <sunilvl@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_100711_690331_0536A823 
X-CRM114-Status: GOOD (  22.52  )
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

K1N1bmlsCgpPbiBGcmksIE9jdCAyLCAyMDI2IGF0IDU6MzTigK9QTSBQcmFqd2FsIE4gPHByYWp3
YWwubkBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IFRoZSBmd25vZGUgZGVzY3JpYmVzIGEg
Z2xvYmFsIHByb3BlcnR5IG9mIHRoZSBJTVNJQyBpbnRlcnJ1cHQKPiBjb250cm9sbGVyIHRoYXQg
aXMgZXF1YWxseSByZWxldmFudCB0byBleHRlcm5hbCBjb25zdW1lcnMgb2YKPiBpbXNpY19nbG9i
YWxfY29uZmlnIGFzIGl0IGlzIHRvIHRoZSBpbXNpY19wcml2IGl0c2VsZi4KPgo+IEtlZXBpbmcg
aXQgaW4gaW1zaWNfcHJpdiBmb3JjZXMgdGhlIGV4dGVybmFsIGRyaXZlcnMgdG8gYWNjZXNzCj4g
dGhlIHByaXZhdGUgc3RydWN0dXJlIHJhdGhlciB0aGFuIHVzaW5nIHRoZSBhbHJlYWR5IGV4cG9y
dGVkCj4gaW1zaWNfZ2V0X2dsb2JhbF9jb25maWcoKSBpbnRlcmZhY2UuCj4KPiBNb3ZpbmcgdGhl
IGZ3bm9kZSBpbnRvIGltc2ljX2dsb2JhbF9jb25maWcgbWFrZXMgdGhlIHB1YmxpYwo+IEFQSSBz
ZWxmLWNvbnRhaW5lZCBhbmQgZWxpbWluYXRlcyB0aGUgbmVlZCBmb3IgY2FsbGVycyB0bwo+IGFj
Y2VzcyBpbXNpY19wcml2IGludGVybmFscyBkaXJlY3RseS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBy
YWp3YWwgTiA8cHJhandhbC5uQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaXJx
Y2hpcC9pcnEtcmlzY3YtaW1zaWMtZWFybHkuYyAgICB8ICAyICstCj4gIGRyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQo+ICBk
cml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmMgICAgfCAgMiArLQo+ICBkcml2
ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXN0YXRlLmggICAgfCAgMyAtLS0KPiAgaW5jbHVk
ZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2ljLmggICAgICAgIHwgIDMgKysrCj4gIDUgZmlsZXMg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jIGIvZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gaW5kZXggMTJlZmQyNDFjZTg4Li43Njk4NDkx
NDcxNDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJs
eS5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gQEAg
LTc1LDcgKzc1LDcgQEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfaXBpX2RvbWFpbl9pbml0KHZv
aWQpCj4gICAgICAgICByaXNjdl9pcGlfc2V0X3ZpcnFfcmFuZ2UodmlycSwgSU1TSUNfTlJfSVBJ
KTsKPgo+ICAgICAgICAgLyogQW5ub3VuY2UgdGhhdCBJTVNJQyBpcyBwcm92aWRpbmcgSVBJcyAq
Lwo+IC0gICAgICAgcHJfaW5mbygiJXBmd1A6IHByb3ZpZGluZyBJUElzIHVzaW5nIGludGVycnVw
dCAlZFxuIiwgaW1zaWMtPmZ3bm9kZSwgSU1TSUNfSVBJX0lEKTsKPiArICAgICAgIHByX2luZm8o
IiVwZndQOiBwcm92aWRpbmcgSVBJcyB1c2luZyBpbnRlcnJ1cHQgJWRcbiIsIGltc2ljLT5nbG9i
YWwuZndub2RlLCBJTVNJQ19JUElfSUQpOwo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMgYi9k
cml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiBpbmRleCA2NDNjOGU0
NTk2MTEuLjk1ZmY3NmU2M2E2OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNoaXAvaXJxLXJp
c2N2LWltc2ljLXBsYXRmb3JtLmMKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLXBsYXRmb3JtLmMKPiBAQCAtMzEzLDQwICszMTMsNDAgQEAgaW50IGltc2ljX2lycWRvbWFp
bl9pbml0KHZvaWQpCj4gICAgICAgICB9Owo+ICAgICAgICAgc3RydWN0IGltc2ljX2dsb2JhbF9j
b25maWcgKmdsb2JhbDsKPgo+IC0gICAgICAgaWYgKCFpbXNpYyB8fCAhaW1zaWMtPmZ3bm9kZSkg
ewo+ICsgICAgICAgaWYgKCFpbXNpYyB8fCAhaW1zaWMtPmdsb2JhbC5md25vZGUpIHsKPiAgICAg
ICAgICAgICAgICAgcHJfZXJyKCJlYXJseSBkcml2ZXIgbm90IHByb2JlZFxuIik7Cj4gICAgICAg
ICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBpZiAoaW1z
aWMtPmJhc2VfZG9tYWluKSB7Cj4gLSAgICAgICAgICAgICAgIHByX2VycigiJXBmd1A6IGlycSBk
b21haW4gYWxyZWFkeSBjcmVhdGVkXG4iLCBpbXNpYy0+Zndub2RlKTsKPiArICAgICAgICAgICAg
ICAgcHJfZXJyKCIlcGZ3UDogaXJxIGRvbWFpbiBhbHJlYWR5IGNyZWF0ZWRcbiIsIGltc2ljLT5n
bG9iYWwuZndub2RlKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gICAgICAg
ICB9Cj4KPiAgICAgICAgIC8qIENyZWF0ZSBCYXNlIElSUSBkb21haW4gKi8KPiAtICAgICAgIGlu
Zm8uZndub2RlID0gaW1zaWMtPmZ3bm9kZSwKPiArICAgICAgIGluZm8uZndub2RlID0gaW1zaWMt
Pmdsb2JhbC5md25vZGUsCj4gICAgICAgICBpbXNpYy0+YmFzZV9kb21haW4gPSBtc2lfY3JlYXRl
X3BhcmVudF9pcnFfZG9tYWluKCZpbmZvLCAmaW1zaWNfbXNpX3BhcmVudF9vcHMpOwo+ICAgICAg
ICAgaWYgKCFpbXNpYy0+YmFzZV9kb21haW4pIHsKPiAtICAgICAgICAgICAgICAgcHJfZXJyKCIl
cGZ3UDogZmFpbGVkIHRvIGNyZWF0ZSBJTVNJQyBiYXNlIGRvbWFpblxuIiwgaW1zaWMtPmZ3bm9k
ZSk7Cj4gKyAgICAgICAgICAgICAgIHByX2VycigiJXBmd1A6IGZhaWxlZCB0byBjcmVhdGUgSU1T
SUMgYmFzZSBkb21haW5cbiIsIGltc2ljLT5nbG9iYWwuZndub2RlKTsKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FTk9NRU07Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGdsb2JhbCA9ICZpbXNp
Yy0+Z2xvYmFsOwo+ICAgICAgICAgcHJfaW5mbygiJXBmd1A6ICBoYXJ0LWluZGV4LWJpdHM6ICVk
LCAgZ3Vlc3QtaW5kZXgtYml0czogJWRcbiIsCj4gLSAgICAgICAgICAgICAgIGltc2ljLT5md25v
ZGUsIGdsb2JhbC0+aGFydF9pbmRleF9iaXRzLCBnbG9iYWwtPmd1ZXN0X2luZGV4X2JpdHMpOwo+
ICsgICAgICAgICAgICAgICBpbXNpYy0+Z2xvYmFsLmZ3bm9kZSwgZ2xvYmFsLT5oYXJ0X2luZGV4
X2JpdHMsIGdsb2JhbC0+Z3Vlc3RfaW5kZXhfYml0cyk7Cj4gICAgICAgICBwcl9pbmZvKCIlcGZ3
UDogZ3JvdXAtaW5kZXgtYml0czogJWQsIGdyb3VwLWluZGV4LXNoaWZ0OiAlZFxuIiwKPiAtICAg
ICAgICAgICAgICAgaW1zaWMtPmZ3bm9kZSwgZ2xvYmFsLT5ncm91cF9pbmRleF9iaXRzLCBnbG9i
YWwtPmdyb3VwX2luZGV4X3NoaWZ0KTsKPiArICAgICAgICAgICAgICAgaW1zaWMtPmdsb2JhbC5m
d25vZGUsIGdsb2JhbC0+Z3JvdXBfaW5kZXhfYml0cywgZ2xvYmFsLT5ncm91cF9pbmRleF9zaGlm
dCk7Cj4gICAgICAgICBwcl9pbmZvKCIlcGZ3UDogcGVyLUNQVSBJRHMgJWQgYXQgYmFzZSBhZGRy
ZXNzICVwYVxuIiwKPiAtICAgICAgICAgICAgICAgaW1zaWMtPmZ3bm9kZSwgZ2xvYmFsLT5ucl9p
ZHMsICZnbG9iYWwtPmJhc2VfYWRkcik7Cj4gKyAgICAgICAgICAgICAgIGltc2ljLT5nbG9iYWwu
Zndub2RlLCBnbG9iYWwtPm5yX2lkcywgJmdsb2JhbC0+YmFzZV9hZGRyKTsKPiAgICAgICAgIHBy
X2luZm8oIiVwZndQOiB0b3RhbCAlZCBpbnRlcnJ1cHRzIGF2YWlsYWJsZVxuIiwKPiAtICAgICAg
ICAgICAgICAgaW1zaWMtPmZ3bm9kZSwgbnVtX3Bvc3NpYmxlX2NwdXMoKSAqIChnbG9iYWwtPm5y
X2lkcyAtIDEpKTsKPiArICAgICAgICAgICAgICAgaW1zaWMtPmdsb2JhbC5md25vZGUsIG51bV9w
b3NzaWJsZV9jcHVzKCkgKiAoZ2xvYmFsLT5ucl9pZHMgLSAxKSk7Cj4KPiAgICAgICAgIHJldHVy
biAwOwo+ICB9Cj4KPiAgc3RhdGljIGludCBpbXNpY19wbGF0Zm9ybV9wcm9iZV9jb21tb24oc3Ry
dWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSkKPiAgewo+IC0gICAgICAgaWYgKGltc2ljICYmIGlt
c2ljLT5md25vZGUgIT0gZndub2RlKSB7Cj4gKyAgICAgICBpZiAoaW1zaWMgJiYgaW1zaWMtPmds
b2JhbC5md25vZGUgIT0gZndub2RlKSB7Cj4gICAgICAgICAgICAgICAgIHByX2VycigiJXBmd1A6
IGZ3bm9kZSBtaXNtYXRjaFxuIiwgZndub2RlKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
Tk9ERVY7Cj4gICAgICAgICB9Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlz
Y3YtaW1zaWMtc3RhdGUuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUu
Ywo+IGluZGV4IGI4ZDFiYmJmNDJmNy4uYWU5ODJmODkzMThiIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+ICsrKyBiL2RyaXZlcnMvaXJxY2hp
cC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+IEBAIC04MTMsOSArODEzLDkgQEAgaW50IF9faW5p
dCBpbXNpY19zZXR1cF9zdGF0ZShzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCB2b2lkICpv
cGFxdWUpCj4gICAgICAgICBpbXNpYyA9IGt6YWxsb2Nfb2JqKCppbXNpYyk7Cj4gICAgICAgICBp
ZiAoIWltc2ljKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiAtICAgICAgIGlt
c2ljLT5md25vZGUgPSBmd25vZGU7Cj4gICAgICAgICBnbG9iYWwgPSAmaW1zaWMtPmdsb2JhbDsK
Pgo+ICsgICAgICAgZ2xvYmFsLT5md25vZGUgPSBmd25vZGU7Cj4gICAgICAgICBnbG9iYWwtPmxv
Y2FsID0gYWxsb2NfcGVyY3B1KHR5cGVvZigqZ2xvYmFsLT5sb2NhbCkpOwo+ICAgICAgICAgaWYg
KCFnbG9iYWwtPmxvY2FsKSB7Cj4gICAgICAgICAgICAgICAgIHJjID0gLUVOT01FTTsKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5oIGIvZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5oCj4gaW5kZXggYzQyZWUxODBiMzA1Li4x
NzhiNjc4ZjVjMGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNp
Yy1zdGF0ZS5oCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0ZS5o
Cj4gQEAgLTQ0LDkgKzQ0LDYgQEAgc3RydWN0IGltc2ljX2xvY2FsX3ByaXYgewo+ICB9Owo+Cj4g
IHN0cnVjdCBpbXNpY19wcml2IHsKPiAtICAgICAgIC8qIERldmljZSBkZXRhaWxzICovCj4gLSAg
ICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAgICAgICAgICAgICAgICAgICAgKmZ3bm9kZTsKPiAt
Cj4gICAgICAgICAvKiBHbG9iYWwgY29uZmlndXJhdGlvbiBjb21tb24gZm9yIGFsbCBIQVJUcyAq
Lwo+ICAgICAgICAgc3RydWN0IGltc2ljX2dsb2JhbF9jb25maWcgICAgICAgICAgICAgIGdsb2Jh
bDsKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaCBi
L2luY2x1ZGUvbGludXgvaXJxY2hpcC9yaXNjdi1pbXNpYy5oCj4gaW5kZXggNjFhZjNhNWJlYTA5
Li5iN2JlMWFhZDc3NzQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2
LWltc2ljLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2lycWNoaXAvcmlzY3YtaW1zaWMuaAo+IEBA
IC00Niw2ICs0Niw5IEBAIHN0cnVjdCBpbXNpY19sb2NhbF9jb25maWcgewo+ICB9Owo+Cj4gIHN0
cnVjdCBpbXNpY19nbG9iYWxfY29uZmlnIHsKPiArICAgICAgIC8qIERldmljZSBkZXRhaWxzICov
Cj4gKyAgICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAgICAgICAgICAgICAgICAgICAgKmZ3bm9k
ZTsKPiArCgpOb3cgdGhhdCBmd25vZGUgaXMgcGFydCBvZiBzdHJ1Y3QgaW1zaWNfZ2xvYmFsX2Nv
bmZpZywgSSBzdWdnZXN0CmhhdmluZyBhbm90aGVyIHBhdGNoIChvbi10b3Atb2YgdGhpcyBwYXRj
aCkgd2hpY2ggcmVwbGFjZSB0aGUKaW1zaWNfYWNwaV9nZXRfZndub2RlKCkgZnVuY3Rpb24gd2l0
aCBjb2RlIHNlcXVlbmNlIGFjY2Vzc2luZwpmd25vZGUgZnJvbSBzdHJ1Y3QgaW1zaWNfZ2xvYmFs
X2NvbmZpZy4KCj4gICAgICAgICAvKgo+ICAgICAgICAgICogTVNJIFRhcmdldCBBZGRyZXNzIFNj
aGVtZQo+ICAgICAgICAgICoKPiAtLQo+IDIuNDMuMAo+CgpSZWdhcmRzLApBbnVwCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
