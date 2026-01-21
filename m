Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50516C44506
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 21:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55NMcm/ZAGAwXzYfmgx1ymCpTp29fRnFuE9oIibW3Nw=; b=RE42I4JgBTaKQ3
	A8VM24C/Y44dIbGTtdM+gVKBoTd/+c5yPDwpskFNXzQlu0vbDoWue8J9g6wCFVmaCxsTWF1a4cCN8
	Q1cw/alfnJKkN+7Nn3bCJi9e/fA6WJxrzOWXmpvEoW20TZi/orD2IMrdxr2Qb5MIVvCr+NfO74/WI
	QCtaNucmoaUpBg3Vkz4b4EGje78aMMWQ4mGZtwx4lKfx1DgcpSC67zv8QQLmBq/FmgzCzFv1S8mJ2
	ghveG4hfhuuZzUjdwXXxxf+Yl8MkFEj1egFEmZJT2rRUoh1cznSjKJcKldolRItV3aACUzfM7pqMe
	g+z7JMRvaz6aK7d1VEgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifpi-000000064nl-0fGp;
	Wed, 21 Jan 2026 21:33:46 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifpf-000000064nQ-2DB1
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 21:33:44 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b8712507269so27065766b.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 13:33:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769031222; cv=none;
        d=google.com; s=arc-20240605;
        b=Zmjh9ULS9pImcLukthqbCcTT193X9UZexhBk5b8PUnE4TgTGwdaWfgu8kajhFMQvNJ
         z4gxIzt1NJL6TfoBpkVzlBYxYSab1jgpQ0fwycL0TzAL/X/DevvFK5aTgMqoU5IRnP6G
         9gGpK0LbYdRuTCYqLjNW6Xo7VWa/HyckgbBbjV5SVF6ezkUH1FGg3KrY5leWBJYL69GE
         urKBPFAAsydZBKU3AIcRwYPPqNNxoAu4ij1t8EiwPU0f5DY+ygKQ5sUsnyXyXJ0+21AR
         G7yqU64idhprBXHZCc9bywI0VmCHLj90hPjxmo7KdplE6GUolhnMSP7FF1Lz8ZzVsjAR
         ic2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rdw8/k4mPWtOxekw6orbX+KTYc25Gzc3eXrblJrkBDI=;
        fh=NztQwOsrgLpheifJXu9g3gX3cWtNo2EUaunTIGtSOxU=;
        b=Z0qxHi63VOSZpxR8T9PYi48bdZ1fYHII5RDL6VPvKNZ9V0ujdTgjY9B7Yshdkad1oi
         2ETZRnQKttXbBjX5G6qUqIVbtnVhqTmRnCkTFrdkmpUhu5iasNafCUyk7KRfBdgu2AF6
         3uwEuRRkMEa1o8IuRa0U0oMZBffIrL7GXv886MkDj6GBIMXYIYJbpqWK/2okNKiEGTLI
         +un9YSHC4u8nsEw9f8fjg055zakdlhhbu3QwXk+ufa2ms3oSqZ2DqTG1vLbn2BLjQhoe
         2YGZy9RS3qAx+ZFM9ekb5W4zWf1O8XBtiy8LI3B7f7dNIdXzksBsHCcUyMUrtkvTx0LI
         LZ6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769031222; x=1769636022; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rdw8/k4mPWtOxekw6orbX+KTYc25Gzc3eXrblJrkBDI=;
        b=dCDWAB9XkqrbE+MYtuA5QRVHk2IqOf8SKLMyDFnYm/oGKbA7KO54ZE138+qga7LNTU
         peUJKMq/Ywdb7DOUEAQXjv0IYJK8bJz93HGv46aoC8Pj+C0MftKkFl217/RM62iy55QT
         kXUlV2050vaUGVjVB3XZHvh+DuNjwVMsY8bj4SNxYvSPj/9BNbnD+nYhwgjX7fUzh8q4
         aTxsbXXrKt4759NtK81n+iM2d8Vd++2TE27La9kGZAdXO8GHnKaqsBqz8tOptqpxXZU3
         H2OyjLtYMzd0JkObp7MAgxlHsSvZRr9UmUGnPfmCXbK0k4WxDiQ+N8UxDLsCS4ujkOpw
         J72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769031222; x=1769636022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rdw8/k4mPWtOxekw6orbX+KTYc25Gzc3eXrblJrkBDI=;
        b=wauzc2Vhc9mPv5e7YKkB1/hPzUTJcmiwrYphvHBy7PfaJa1p6x5IpFwj/SO0ECbij4
         WyFIHmQGU/PeGkwZtpdqXGGGsXP4+9UKFhb1S8gndfo2Rz9JhqByOcFefF23LCdwf+RY
         PRgC3rCGc7h8S6/dupQPJ5tbDh27YrThhrD77i0QjWv1W4I/X8hqZgj6Gn2Zj2us55NN
         ksNt/DIdexYhP6NJENDpoKgOr5w7/zam0CPZuuRPF1ZTvg/W/JsuhQsSCbujHL3U1DbZ
         QuInpY1iQGblIBBfMsEJUzWUKncJcnyefg3hJyde7N783uPmpr/u320l7+90mrSXqUXa
         9cXg==
X-Gm-Message-State: AOJu0Yzk3/0ZxirlPsdv9DLqAf7hL/ZYN58iyx6Ranycf/MsUugD4+l0
	3Qeec4RAQOQo+rwiWPQlGjkpBj838//8Vx+yfNYWzIn4L/1/6e5np0D8IpjgVHqADJ+b4CQCet/
	wottoId1ppk8PYNr6hdcrGqMRRJAnhss=
X-Gm-Gg: AZuq6aJwlDDGLMTVwmw7/CygtXQ+RLZL6/5kcBTRHB5+SbKWM1wVvPFg8C/6AKE/PKQ
	FRTeDvGM6mbgdxdScSuwMjFg9BDBZBWU7E/LmgWDG+AEt39h2ebMwrn9YJEsR5ldycCHfqBhdS+
	cWBeMzFTQfL3vflFdtZss2nhwiOToSrOuzBSv20+KAktlqs+oM/yw49qwEClu6fR/Er9SBNIyOg
	CEPf1/KkIa+/eZAeHRGjWsCuymcMN2VPp8sUVubj9xSUE8KGy6RQ6K3h6ho442cgFgO
X-Received: by 2002:a17:907:97c4:b0:b87:2d79:61c with SMTP id
 a640c23a62f3a-b880023667fmr540373066b.8.1769031221404; Wed, 21 Jan 2026
 13:33:41 -0800 (PST)
MIME-Version: 1.0
References: <20251214163537.1054292-1-geomatsi@gmail.com> <20251214163537.1054292-7-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-7-geomatsi@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 21 Jan 2026 15:33:30 -0600
X-Gm-Features: AZwV_Qh3bndCXU54sipWubfknrF3sYKBLBuqCLOAnsmX5JPh4z1Wyf_sbCt4Tp4
Message-ID: <CAFTtA3MQnF5NK3q2+kt_VLC9QZ=gDHE8VFp-aOznu+b+=62jLw@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] selftests: riscv: verify initial vector state with ptrace
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Oleg Nesterov <oleg@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Joel Granados <joel.granados@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_133343_610858_BE5179C5 
X-CRM114-Status: GOOD (  19.25  )
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

SGkgU2VyZ2V5LAoKT24gU3VuLCBEZWMgMTQsIDIwMjUgYXQgMTA6MzXigK9BTSBTZXJnZXkgTWF0
eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSB0ZXN0IGNhc2Ug
dGhhdCBhdHRhY2hlcyB0byBhIHRyYWNlZCBwcm9jZXNzIGltbWVkaWF0ZWx5IGFmdGVyIGl0cwo+
IGZpcnN0IGV4ZWN1dGVkIHZlY3RvciBpbnN0cnVjdGlvbnMgdG8gdmVyaWZ5IHRoZSBpbml0aWFs
IHZlY3RvciBjb250ZXh0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IE1hdHl1a2V2aWNoIDxn
ZW9tYXRzaUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFp
bC5jb20+Cgo+IC0tLQo+ICAuLi4vcmlzY3YvdmVjdG9yL3ZhbGlkYXRlX3ZfcHRyYWNlLmMgICAg
ICAgICAgfCAxMzUgKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMzUgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2
L3ZlY3Rvci92YWxpZGF0ZV92X3B0cmFjZS5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlz
Y3YvdmVjdG9yL3ZhbGlkYXRlX3ZfcHRyYWNlLmMKPiBpbmRleCBiNjQ5ODZiNDIyNzAuLmE4ZDY0
ZDM1MWVkZCAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi92ZWN0
b3IvdmFsaWRhdGVfdl9wdHJhY2UuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jp
c2N2L3ZlY3Rvci92YWxpZGF0ZV92X3B0cmFjZS5jCj4gQEAgLTEzLDYgKzEzLDkgQEAKPiAgI2lu
Y2x1ZGUgImtzZWxmdGVzdF9oYXJuZXNzLmgiCj4gICNpbmNsdWRlICJ2X2hlbHBlcnMuaCIKPgo+
ICsjZGVmaW5lIFNSX0ZTX0RJUlRZICAgIDB4MDAwMDYwMDBVTAo+ICsjZGVmaW5lIENTUl9WWFJN
X1NISUZUIDEKPiArCj4gIHZvbGF0aWxlIHVuc2lnbmVkIGxvbmcgY2hsZF9sb2NrOwo+Cj4gIFRF
U1QocHRyYWNlX3Zfbm90X2VuYWJsZWQpCj4gQEAgLTc3LDQgKzgwLDEzNiBAQCBURVNUKHB0cmFj
ZV92X25vdF9lbmFibGVkKQo+ICAgICAgICAgfQo+ICB9Cj4KPiArVEVTVChwdHJhY2Vfdl9lYXJs
eV9kZWJ1ZykKPiArewo+ICsgICAgICAgc3RhdGljIHZvbGF0aWxlIHVuc2lnbmVkIGxvbmcgdnN0
YXJ0Owo+ICsgICAgICAgc3RhdGljIHZvbGF0aWxlIHVuc2lnbmVkIGxvbmcgdnR5cGU7Cj4gKyAg
ICAgICBzdGF0aWMgdm9sYXRpbGUgdW5zaWduZWQgbG9uZyB2bGVuYjsKPiArICAgICAgIHN0YXRp
YyB2b2xhdGlsZSB1bnNpZ25lZCBsb25nIHZjc3I7Cj4gKyAgICAgICBzdGF0aWMgdm9sYXRpbGUg
dW5zaWduZWQgbG9uZyB2bDsKPiArICAgICAgIGJvb2wgeHRoZWFkdmVjdG9yOwo+ICsgICAgICAg
cGlkX3QgcGlkOwo+ICsKPiArICAgICAgIGlmICghKGlzX3ZlY3Rvcl9zdXBwb3J0ZWQoKSB8fCBp
c194dGhlYWR2ZWN0b3Jfc3VwcG9ydGVkKCkpKQo+ICsgICAgICAgICAgICAgICBTS0lQKHJldHVy
biwgIlZlY3RvciBub3Qgc3VwcG9ydGVkIik7Cj4gKwo+ICsgICAgICAgeHRoZWFkdmVjdG9yID0g
aXNfeHRoZWFkdmVjdG9yX3N1cHBvcnRlZCgpOwo+ICsKPiArICAgICAgIGNobGRfbG9jayA9IDE7
Cj4gKyAgICAgICBwaWQgPSBmb3JrKCk7Cj4gKyAgICAgICBBU1NFUlRfTEUoMCwgcGlkKQo+ICsg
ICAgICAgICAgICAgICBUSF9MT0coImZvcms6ICVtIik7Cj4gKwo+ICsgICAgICAgaWYgKHBpZCA9
PSAwKSB7Cj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdnhzYXQsIHZ4cm07Cj4gKwo+
ICsgICAgICAgICAgICAgICB2bGVuYiA9IGdldF92cl9sZW4oKTsKPiArCj4gKyAgICAgICAgICAg
ICAgIHdoaWxlIChjaGxkX2xvY2sgPT0gMSkKPiArICAgICAgICAgICAgICAgICAgICAgICBhc20g
dm9sYXRpbGUgKCIiIDogOiAiZyIoY2hsZF9sb2NrKSA6ICJtZW1vcnkiKTsKPiArCj4gKyAgICAg
ICAgICAgICAgIGFzbSB2b2xhdGlsZSAoCj4gKyAgICAgICAgICAgICAgICAgICAgICAgImNzcnIg
JVt2c3RhcnRdLCB2c3RhcnRcbiIKPiArICAgICAgICAgICAgICAgICAgICAgICAiY3NyciAlW3Z0
eXBlXSwgdnR5cGVcbiIKPiArICAgICAgICAgICAgICAgICAgICAgICAiY3NyciAlW3ZsXSwgdmxc
biIKPiArICAgICAgICAgICAgICAgICAgICAgICA6IFt2dHlwZV0gIj1yIih2dHlwZSksIFt2c3Rh
cnRdICI9ciIodnN0YXJ0KSwgW3ZsXSAiPXIiKHZsKQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IDoKPiArICAgICAgICAgICAgICAgICAgICAgICA6ICJtZW1vcnkiKTsKPiArCj4gKyAgICAgICAg
ICAgICAgIC8qIG5vICdpc194dGhlYWR2ZWN0b3Jfc3VwcG9ydGVkKCknIGhlcmUgdG8gYXZvaWQg
Y2xvYmJlcmluZyB2LXN0YXRlIGJ5IHN5c2NhbGwgKi8KPiArICAgICAgICAgICAgICAgaWYgKHh0
aGVhZHZlY3Rvcikgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGFzbSB2b2xhdGlsZSAoCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiY3NycyBzc3RhdHVzLCAlW2JpdF1cbiIK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjc3JyICVbdnhzYXRdLCB2eHNhdFxu
Igo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImNzcnIgJVt2eHJtXSwgdnhybVxu
Igo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBbdnhzYXRdICI9ciIodnhzYXQp
LCBbdnhybV0gIj1yIih2eHJtKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBb
Yml0XSAiciIgKFNSX0ZTX0RJUlRZKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
OiAibWVtb3J5Iik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdmNzciA9IHZ4c2F0IHwgdnhy
bSA8PCBDU1JfVlhSTV9TSElGVDsKPiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBhc20gdm9sYXRpbGUgKAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgImNzcnIgJVt2Y3NyXSwgdmNzclxuIgo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgOiBbdmNzcl0gIj1yIih2Y3NyKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7Cj4g
KyAgICAgICAgICAgICAgIH0KPiArCj4gKyAgICAgICAgICAgICAgIGFzbSB2b2xhdGlsZSAoCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgIi5vcHRpb24gcHVzaFxuIgo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICIub3B0aW9uIG5vcnZjXG4iCj4gKyAgICAgICAgICAgICAgICAgICAgICAgImVi
cmVha1xuIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICIub3B0aW9uIHBvcFxuIik7Cj4gKyAg
ICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgX19yaXNjdl92X3JlZ3NldF9z
dGF0ZSAqcmVnc2V0X2RhdGE7Cj4gKyAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdnN0YXJ0
X2NzcjsKPiArICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB2bGVuYl9jc3I7Cj4gKyAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdnR5cGVfY3NyOwo+ICsgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIHZjc3JfY3NyOwo+ICsgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHZsX2Nz
cjsKPiArICAgICAgICAgICAgICAgc2l6ZV90IHJlZ3NldF9zaXplOwo+ICsgICAgICAgICAgICAg
ICBzdHJ1Y3QgaW92ZWMgaW92Owo+ICsgICAgICAgICAgICAgICBpbnQgc3RhdHVzOwo+ICsKPiAr
ICAgICAgICAgICAgICAgLyogYXR0YWNoICovCj4gKwo+ICsgICAgICAgICAgICAgICBBU1NFUlRf
RVEoMCwgcHRyYWNlKFBUUkFDRV9BVFRBQ0gsIHBpZCwgTlVMTCwgTlVMTCkpOwo+ICsgICAgICAg
ICAgICAgICBBU1NFUlRfRVEocGlkLCB3YWl0cGlkKHBpZCwgJnN0YXR1cywgMCkpOwo+ICsgICAg
ICAgICAgICAgICBBU1NFUlRfVFJVRShXSUZTVE9QUEVEKHN0YXR1cykpOwo+ICsKPiArICAgICAg
ICAgICAgICAgLyogdW5sb2NrICovCj4gKwo+ICsgICAgICAgICAgICAgICBBU1NFUlRfRVEoMCwg
cHRyYWNlKFBUUkFDRV9QT0tFREFUQSwgcGlkLCAmY2hsZF9sb2NrLCAwKSk7Cj4gKwo+ICsgICAg
ICAgICAgICAgICAvKiByZXN1bWUgYW5kIHdhaXQgZm9yIGVicmVhayAqLwo+ICsKPiArICAgICAg
ICAgICAgICAgQVNTRVJUX0VRKDAsIHB0cmFjZShQVFJBQ0VfQ09OVCwgcGlkLCBOVUxMLCBOVUxM
KSk7Cj4gKyAgICAgICAgICAgICAgIEFTU0VSVF9FUShwaWQsIHdhaXRwaWQocGlkLCAmc3RhdHVz
LCAwKSk7Cj4gKyAgICAgICAgICAgICAgIEFTU0VSVF9UUlVFKFdJRlNUT1BQRUQoc3RhdHVzKSk7
Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiByZWFkIHRyYWNlZSB2ZWN0b3IgY3NyIHJlZ3MgdXNp
bmcgcHRyYWNlIFBFRUtEQVRBICovCj4gKwo+ICsgICAgICAgICAgICAgICBlcnJubyA9IDA7Cj4g
KyAgICAgICAgICAgICAgIHZzdGFydF9jc3IgPSBwdHJhY2UoUFRSQUNFX1BFRUtEQVRBLCBwaWQs
ICZ2c3RhcnQsIE5VTEwpOwo+ICsgICAgICAgICAgICAgICBBU1NFUlRfRkFMU0UoKGVycm5vICE9
IDApICYmICh2c3RhcnRfY3NyID09IC0xKSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBlcnJubyA9
IDA7Cj4gKyAgICAgICAgICAgICAgIHZsX2NzciA9IHB0cmFjZShQVFJBQ0VfUEVFS0RBVEEsIHBp
ZCwgJnZsLCBOVUxMKTsKPiArICAgICAgICAgICAgICAgQVNTRVJUX0ZBTFNFKChlcnJubyAhPSAw
KSAmJiAodmxfY3NyID09IC0xKSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBlcnJubyA9IDA7Cj4g
KyAgICAgICAgICAgICAgIHZ0eXBlX2NzciA9IHB0cmFjZShQVFJBQ0VfUEVFS0RBVEEsIHBpZCwg
JnZ0eXBlLCBOVUxMKTsKPiArICAgICAgICAgICAgICAgQVNTRVJUX0ZBTFNFKChlcnJubyAhPSAw
KSAmJiAodnR5cGVfY3NyID09IC0xKSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBlcnJubyA9IDA7
Cj4gKyAgICAgICAgICAgICAgIHZjc3JfY3NyID0gcHRyYWNlKFBUUkFDRV9QRUVLREFUQSwgcGlk
LCAmdmNzciwgTlVMTCk7Cj4gKyAgICAgICAgICAgICAgIEFTU0VSVF9GQUxTRSgoZXJybm8gIT0g
MCkgJiYgKHZjc3JfY3NyID09IC0xKSk7Cj4gKwo+ICsgICAgICAgICAgICAgICBlcnJubyA9IDA7
Cj4gKyAgICAgICAgICAgICAgIHZsZW5iX2NzciA9IHB0cmFjZShQVFJBQ0VfUEVFS0RBVEEsIHBp
ZCwgJnZsZW5iLCBOVUxMKTsKPiArICAgICAgICAgICAgICAgQVNTRVJUX0ZBTFNFKChlcnJubyAh
PSAwKSAmJiAodmxlbmJfY3NyID09IC0xKSk7Cj4gKwo+ICsgICAgICAgICAgICAgICAvKiByZWFk
IHRyYWNlZSBjc3IgcmVncyB1c2luZyBwdHJhY2UgR0VUUkVHU0VUICovCj4gKwo+ICsgICAgICAg
ICAgICAgICByZWdzZXRfc2l6ZSA9IHNpemVvZigqcmVnc2V0X2RhdGEpICsgdmxlbmJfY3NyICog
MzI7Cj4gKyAgICAgICAgICAgICAgIHJlZ3NldF9kYXRhID0gY2FsbG9jKDEsIHJlZ3NldF9zaXpl
KTsKPiArCj4gKyAgICAgICAgICAgICAgIGlvdi5pb3ZfYmFzZSA9IHJlZ3NldF9kYXRhOwo+ICsg
ICAgICAgICAgICAgICBpb3YuaW92X2xlbiA9IHJlZ3NldF9zaXplOwo+ICsKPiArICAgICAgICAg
ICAgICAgQVNTRVJUX0VRKDAsIHB0cmFjZShQVFJBQ0VfR0VUUkVHU0VULCBwaWQsIE5UX1JJU0NW
X1ZFQ1RPUiwgJmlvdikpOwo+ICsKPiArICAgICAgICAgICAgICAgLyogY29tcGFyZSAqLwo+ICsK
PiArICAgICAgICAgICAgICAgRVhQRUNUX0VRKHZzdGFydF9jc3IsIHJlZ3NldF9kYXRhLT52c3Rh
cnQpOwo+ICsgICAgICAgICAgICAgICBFWFBFQ1RfRVEodnR5cGVfY3NyLCByZWdzZXRfZGF0YS0+
dnR5cGUpOwo+ICsgICAgICAgICAgICAgICBFWFBFQ1RfRVEodmxlbmJfY3NyLCByZWdzZXRfZGF0
YS0+dmxlbmIpOwo+ICsgICAgICAgICAgICAgICBFWFBFQ1RfRVEodmNzcl9jc3IsIHJlZ3NldF9k
YXRhLT52Y3NyKTsKPiArICAgICAgICAgICAgICAgRVhQRUNUX0VRKHZsX2NzciwgcmVnc2V0X2Rh
dGEtPnZsKTsKPiArCj4gKyAgICAgICAgICAgICAgIC8qIGNsZWFudXAgKi8KPiArCj4gKyAgICAg
ICAgICAgICAgIEFTU0VSVF9FUSgwLCBraWxsKHBpZCwgU0lHS0lMTCkpOwo+ICsgICAgICAgfQo+
ICt9Cj4gKwo+ICBURVNUX0hBUk5FU1NfTUFJTgo+IC0tCj4gMi41Mi4wCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
