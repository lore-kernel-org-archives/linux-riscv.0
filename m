Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7643AC48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOdxIjOsR2TPaHXucHP2o1R4ucgDvAq15njbhVt75bw=; b=qSlMfE1mF8/+oJ
	iPiGlxxXKzDi0TIZmcUphmKxyeJCWtnZNwX5Shijc6dWHCTwVcGgzIHOuU6gfyRWEkI6vMDIaG3Rc
	/XpT2AMywJGcjEKi9a0w9J+CfNxIPhxInsNxGQixgVZCCr3w68XTvyhYTBAxlZG5hXrQGpFx5eAh2
	Ls8l6y3HtFBZAUwjmfKSu4rXC6dYngMCh58vXQG8JgAyftD/QI1T8HYAnidSp9HdSx/9qzNqrUV9i
	vpxMWxGwghh1iLvyMRU8e6I/MPIhfnXS+xo48StzUaVMOtUlwcmadoHd6DTZHLXv9aUoAgiHNq+gv
	ThGwE9dmF6snRcKJH7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyFZ-00000009PBv-0fF3;
	Mon, 19 Feb 2024 07:39:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyFW-00000009PBH-1a6i
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 07:39:39 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4126144d931so8927035e9.2
        for <linux-riscv@lists.infradead.org>; Sun, 18 Feb 2024 23:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708328376; x=1708933176; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ztvukbsw2DpPqYv6GrnPegXCQAC9j1Oi6plVvewLB6I=;
        b=KheP2EuCPeInSSsF96AMqn+GmMQyNvVv0Pu+LwNLgbmq2brATvU7j3FuW5wcCQPBZU
         +lOZTQZA+dJgDIIjtemgUFM+O32w6l0+/BiFtuj4FeCl9aNQ2zFXLdQt871brlqKRRNy
         aO6h0OSUxgfv8q2PkZXb212c9dp0HZoj6L3tyfY5KLsBAD28myQYroklXF0PHCg5QY6T
         8+MDLCpX+HHTWZ8pzcLCOe5cXU/07JTecjoCVoseQK0yBMArKXUjMLE6lrdT3SOZ6bLt
         9dgwQguwGwNTmOcw8NeeVwonnLBZBZsppwGvnRB+ayXEa2D7xoFlI+rgb03tVn38Jbl5
         HNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708328376; x=1708933176;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ztvukbsw2DpPqYv6GrnPegXCQAC9j1Oi6plVvewLB6I=;
        b=Ol9r3rJfwz0G+j804ngDasxEdZK05joXXbgOcHoQ2FtjQ3CNlhM1CaXglfuod27sDN
         bDmo7t1PxT30b1jwXbRRVXfmPw/W/Bk1dNO/yXcYlFjxXxllg89aOeX4/rQ6707GxkNv
         0BKucJ4WATZio8pL+Ur7uxLKtp5bJ5d2z1disetjTIvVq3iEXst57Hlk2zSkTOADl584
         vEbGchXSmCoPYv8e1GQYD7IQXG28ePjIzhdlre99opnF/ri7Y/T/qPlA5aUbBhHhQKVI
         M8GgVT5FxLqQf1f6AwzAoyhBq2BqWNj061nUeeXgSvJqVuorqB0bHAlaO+c01ABe3HNr
         tseA==
X-Forwarded-Encrypted: i=1; AJvYcCV0eI2LJEmwVk3vRGTaiWoV1958HNGMRsCR8PC+dbDAEKb8ZzkzHEcWLoI+kUxQPJAxzFRkWp6m5D8PWU03mXVuARnDHISBQ/Ct+qiB7J/6
X-Gm-Message-State: AOJu0YxYhk1owPIV+TZMzY6iJPyiVmV/eUjN6r1DRtGh1tPuJo9lVLkN
	4LgwVCAByXfzvo3Ek3E05iCV8P6zCBSqHMMJvuae9qaopf8B+GpoW3oLsWPG8mY=
X-Google-Smtp-Source: AGHT+IHzTk4jAkU4Cb4x2j5R1eZYxapWDSX9BdPNE/TAg6w2jAWj8XsoaKg0OzZkL2HOPDbGsXDXjw==
X-Received: by 2002:a05:600c:354a:b0:412:5b86:2f2c with SMTP id i10-20020a05600c354a00b004125b862f2cmr3647927wmq.14.1708328375766;
        Sun, 18 Feb 2024 23:39:35 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id k35-20020a05600c1ca300b00412393ddac2sm10715749wms.6.2024.02.18.23.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 23:39:35 -0800 (PST)
Message-ID: <c6bea32e-5169-4181-ab42-a8f7f35594b2@tuxon.dev>
Date: Mon, 19 Feb 2024 09:39:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/17] dt-bindings: clock: r9a09g011-cpg: Add always-on
 power domain IDs
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-6-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVbCYfaM6Zi5AZhj+yc8vySFdCDFF3x1rgbV9Y5xh4LSA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVbCYfaM6Zi5AZhj+yc8vySFdCDFF3x1rgbV9Y5xh4LSA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240218_233938_435108_CFD69FE1 
X-CRM114-Status: GOOD (  18.21  )
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

CgpPbiAxNi4wMi4yMDI0IDE2OjAzLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgQ2xh
dWRpdSwKPiAKPiBPbiBUaHUsIEZlYiA4LCAyMDI0IGF0IDE6NDPigK9QTSBDbGF1ZGl1IDxjbGF1
ZGl1LmJlem5lYUB0dXhvbi5kZXY+IHdyb3RlOgo+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xh
dWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+Cj4+Cj4+IEFkZCBhbHdheXMtb24gcG93ZXIg
ZG9tYWluIElEIGZvciBSWi9WMk0gKFI5QTA5RzAxMSkgU29DLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+Cj4gCj4g
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+IAo+PiAtLS0gYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Ns
b2NrL3I5YTA5ZzAxMS1jcGcuaAo+PiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3I5
YTA5ZzAxMS1jcGcuaAo+PiBAQCAtMzQ5LDQgKzM0OSw3IEBACj4+ICAjZGVmaW5lIFI5QTA5RzAx
MV9ERElfUkVTRVQgICAgICAgICAgICA5Mwo+PiAgI2RlZmluZSBSOUEwOUcwMTFfRERJX1JFU0VU
Tl9BUEIgICAgICAgOTQKPj4KPj4gKy8qIFBvd2VyIGRvbWFpbiBJRHMuICovCj4+ICsjZGVmaW5l
IFI5QTA5RzAxMV9QRF9BTFdBWVNfT04gICAgICAgICAwCj4gCj4gUlovVjJNIGhhcyBtYW55IG1v
cmUgcG93ZXIgZG9tYWlucywgYnV0IHRoZXkgYXJlIG5vdCBjb250cm9sbGVkIHRocm91Z2gKPiBD
UEdfQlVTXypfTVNUT1AgcmVnaXN0ZXJzLCBidXQgYnkgdGhlIEludGVybmFsIFBvd2VyIERvbWFp
biBDb250cm9sbGVyCj4gKFBNQykuCgpJIHdhc24ndCBhd2FyZSBvZiB0aGF0LiBJJ2xsIGJlIGNo
ZWNraW5nIGl0LgoKPiAKPj4gKwo+PiAgI2VuZGlmIC8qIF9fRFRfQklORElOR1NfQ0xPQ0tfUjlB
MDlHMDExX0NQR19IX18gKi8KPiAKPiBHcntvZXRqZSxlZXRpbmd9cywKPiAKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydAo+IAo+IAo+IC0tCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwo+
IAo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
