Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26597D743D8
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 20:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFi2IgiJuOZS/guZOAg+y1Ck0he1iMxU0BmfuAuVHcQ=; b=KjxCBsNSu7p9hf
	VYlT5b2KXff8j3kcUDLj9XbRtpKhR8PpiPC8RGiGLSQA9O7aY8Lmrh76pgcNdrphimkcb3/KPIU2R
	aRDjC3GD0ry6viN1Vhi3x6yZWum3PKw8/Fxg8tWnkrG3f9HPUDpVGiTqWcWIAKWudgpu2k9dJ0KLV
	NyiN8jxx7ODIxTyBjMthMSaqLFh+bXZVx1R8pxm94PybS0dfGfafwpNogKigMG0LAHe8IZYVQSB33
	rMNbDfrnKIDLAAb3m/Yo/qV1UPEbqbnNYfiF44isknJesVQUTiQuZvovO5Q699MxLyvkK8pCA8K7Y
	gE98dGSB5MXpxBkia+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDrjv-0000000GErB-2ROq;
	Wed, 20 Nov 2024 20:55:55 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDrjt-0000000GEqk-2neM
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 20:55:54 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-514ce0ab49dso53736e0c.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Nov 2024 12:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732136152; x=1732740952; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GEU16SY6D2+FNGsv+vi6MOGftSt+XXRnPBa2/XQnoQ=;
        b=DWIMCqfGBUyhxVToq7NaEZwioFxIQ8pAQFF4PPi+2ilU7IMLdSYvhj8S/8lHGyKmFs
         kWIh00IKqMJnzkMF5KOPz2B6y4FFt+v+XRfvKtvTr3zL/hSFw4pQPJ/qzdabM9TyB+PN
         XDvQCKkDMLGD5n8LH9Cc3rfPNyjYalwgd0RLWkFQAsvGJKAM480saPz+ykoP5BOv10JB
         fd4vZ8yn31SjRBOLvAB52BPK9GZJwQct194by+QoRZx+n+lQJsgkWxuxB5sfw6F0MZl7
         3SeStKCOLMthTGBC21spTi4Vrm34d8kHcysxUZkyEY+XTMttZqJE6aaj3Dk+p6jvXDeF
         D5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732136152; x=1732740952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GEU16SY6D2+FNGsv+vi6MOGftSt+XXRnPBa2/XQnoQ=;
        b=KLEhosGdsGi6pYDQijOBg0MvNA8A7rq7yHBqQfxU5LToYtdZseltc+8zQ6G8OzRc6c
         n7cwqX+dJaK+kQntIFKnZLqJbCZ9vdEZ4lP3jhHnUTuPAdKgV3IAXbiU1ruq6gPjosKL
         +bXfh1s5N6gnB2xsA91RmnRKMsWUhT6CxfPMdDEGXIAqOb/vBtwwQGadD2ACjEaR98Fx
         MSGLjnzl9cqXphaVzEeLAcag5ocU48dksbsgDeh9vPnNfVYramM117Mj8gByvKgmFSA7
         QJrW/YyyckZgimy40t1hYg3+MckMKy2VcPHTQXoZjToMuGBh0m5hICF5+CZLdVD+wHBl
         7b8g==
X-Forwarded-Encrypted: i=1; AJvYcCUsQHhd7vsdhbTBT4NicZl6reUengO3FNBQUM/hscrGNhYK7BDVR1v8jjqGf5fUOzZUYSUZMvoUGd8bZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjY2EZcS8dfFN0a4DWc0xtDUl/mk1TsovYfIEnsqflGIB29g+g
	ZUsYdjMSNHke2RvNW0EqI0sYUPBTix4zw9wpngUfdhmQ/IG7Zd91Uluuk6jgLyqSj+yIBfrbzch
	1eNQ0pbK225O64491zQugIsPGgxA=
X-Google-Smtp-Source: AGHT+IEJuSywj88ou3300eGP//EzJLr4FP2P+jKiwz9tfQIZzaYG3//rsXhc6t95YYxAuz5GXhpf8bORiIoKSUEgTug=
X-Received: by 2002:a05:6122:3d0c:b0:50d:4cb8:5b10 with SMTP id
 71dfb90a1353d-514cf8bbcc0mr5324149e0c.4.1732136151922; Wed, 20 Nov 2024
 12:55:51 -0800 (PST)
MIME-Version: 1.0
References: <d33c9e3245c0bd3073d9618fcd014ba37e90e6bd.1732098271.git.geert+renesas@glider.be>
In-Reply-To: <d33c9e3245c0bd3073d9618fcd014ba37e90e6bd.1732098271.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 Nov 2024 20:55:25 +0000
Message-ID: <CA+V-a8uo3R8OpzRCJWLU9K=DgKw=JrLdLX76RER1mt9Lqmi6KQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: Disable Renesas SoC support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_125553_705945_DC99B2C5 
X-CRM114-Status: GOOD (  15.57  )
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

T24gV2VkLCBOb3YgMjAsIDIwMjQgYXQgMTA6MjjigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4KPGdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPiB3cm90ZToKPgo+IEZvbGxvdy11cCB0byBjb21taXQgZTM2
ZGRmMzIyNjg2NGUwOSAoInJpc2N2OiBkZWZjb25maWc6IERpc2FibGUgUlovRml2ZQo+IHBlcmlw
aGVyYWwgc3VwcG9ydCIpIGluIHY2LjEyLXJjMToKPgo+ICAgLSBEaXNhYmxlIEFSQ0hfUkVORVNB
UywgdG9vLCBhcyBjdXJyZW50bHkgUlovRml2ZSBpcyB0aGUgc29sZSBSZW5lc2FzCj4gICAgIFJJ
U0MtViBTb0MsCj4gICAtIERyb3Agbm8gbG9uZ2VyIG5lZWRlZCBleHBsaWNpdCBkaXNhYmxlIG9m
IFVTQl9YSENJX1JDQVIsIHdoaWNoCj4gICAgIGRlcGVuZHMgb24gQVJDSF9SRU5FU0FTLgo+Cj4g
U2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT4KPiAtLS0KPiBBcHBhcmVudGx5IEkgZm9yZ290IHRvIHN1Ym1pdCB0aGlzLCBwcm9iYWJseSBk
dWUgdG8gUGFsbWVyJ3MgdmVyc2lvbgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0
MDkxNzEzMTkzNi4xODk4MC0xLXBhbG1lckByaXZvc2luYy5jb20KPgo+ICBhcmNoL3Jpc2N2L2Nv
bmZpZ3MvZGVmY29uZmlnIHwgMiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkK
PgpSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJw
LnJlbmVzYXMuY29tPgoKQ2hlZXJzLApQcmFiaGFrYXIKCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvY29uZmlncy9kZWZjb25maWcgYi9hcmNoL3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnCj4gaW5k
ZXggYjRhMzczNDU3MDNlYjM1Ny4uZGIwY2UyYzJjNzY2YWMxNSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2NvbmZpZ3MvZGVmY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNv
bmZpZwo+IEBAIC0yNyw3ICsyNyw2IEBAIENPTkZJR19FWFBFUlQ9eQo+ICAjIENPTkZJR19TWVNG
U19TWVNDQUxMIGlzIG5vdCBzZXQKPiAgQ09ORklHX1BST0ZJTElORz15Cj4gIENPTkZJR19BUkNI
X01JQ1JPQ0hJUD15Cj4gLUNPTkZJR19BUkNIX1JFTkVTQVM9eQo+ICBDT05GSUdfQVJDSF9TSUZJ
VkU9eQo+ICBDT05GSUdfQVJDSF9TT1BIR089eQo+ICBDT05GSUdfU09DX1NUQVJGSVZFPXkKPiBA
QCAtMjAxLDcgKzIwMCw2IEBAIENPTkZJR19VU0I9eQo+ICBDT05GSUdfVVNCX09URz15Cj4gIENP
TkZJR19VU0JfWEhDSV9IQ0Q9eQo+ICBDT05GSUdfVVNCX1hIQ0lfUExBVEZPUk09eQo+IC0jIENP
TkZJR19VU0JfWEhDSV9SQ0FSIGlzIG5vdCBzZXQKPiAgQ09ORklHX1VTQl9FSENJX0hDRD15Cj4g
IENPTkZJR19VU0JfRUhDSV9IQ0RfUExBVEZPUk09eQo+ICBDT05GSUdfVVNCX09IQ0lfSENEPXkK
PiAtLQo+IDIuMzQuMQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
