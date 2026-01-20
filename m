Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0FED2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJsDXW16lUI9PLaCtL/W6oyUdLTjJq3Vv4JRJAE71gk=; b=UknJyoE4PuarfQ
	RFlv7FXFrWmXvsGyDSd87NnhdpokLFeMZIStyGAW2WM6nsNUHcdfgZ0xc0pe1BQcKwQtNSLpejm3d
	loEstw8N1FYx0SRDJoYQhj62srm1n0qf5D03JhCmog8IHxccLrHMsRtryK3BYZdUmn9knyfvCQU7o
	9s2J4I/sM1Sl4fqQmx8EOMYsw0Qyp1ZBjocjbhQDQSl9/HJnDGZ5M5kRAabN4tldrRtX4meHJZ7aE
	eEe+GpY/Ad3IJ9O4yeyMUjYbp7M4DrLQ+6paBq+1RuiZ5DXGXfSipZ+wAfm4oBw/X/dJNTgr94UCE
	by6MKIBa/0R7FCZvVPsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAi1-00000003oXu-1CeE;
	Tue, 20 Jan 2026 12:19:45 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAhy-00000003oXC-1Pch
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 12:19:43 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-793ee375a23so17716117b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 04:19:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768911581; cv=none;
        d=google.com; s=arc-20240605;
        b=BnYRqklC/uVMHMDM16QfzZQ03JkJbtrVAtT93Is98MbTWUSRP/N2F3m0SPpymOOmmF
         dHCq/Oa7XQ2NFfLZvOE4n5oSKxcFrJ2hSrFjrPkLodfZCBLdRR4ZCavPsIF1vXJ7SKwl
         hePfn6yO2kfLYE5vjmIT15O+u0pzZjb30R+rMayxE/zbKubqqDEwn1/hTrAuVceHwtBz
         ktV7WKn9VgieLAytswRdwndmcDCVOHb1F8jPaGDhErG+woxGAinfSAOIHuh0xL75zuG5
         CFsb8KeCti6ebX6mhmI8rvpOl0ugUMvd+6j6OHKxTTPXYxdFK0bkbzWqMUr0C5dRM78e
         +UiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hXaB+rRblVbZQvSIZXsi1b0KhXGaFyJ7cF5b57eRTUc=;
        fh=JWF4UNLJwe9ADJRsDeliClmli3C26MMTFKT4GiJahHQ=;
        b=i2xR3JYB685VYzs0AGrQKrUgJ1veD844Smp2CYqedrsDD1A1gLB4ZhJtrSDM6NB0P2
         A0jjqWPU5/PUYGNH7dtyVfAA7c8bR7eLwJq7gRThEBcQEMzj/eBzLFAEcPpie4bSWWuk
         ni/GOOZzAbLzzGqrbH3uikCn//ByhStKjbIDaJ5yjon7MyA+jszY9W65OnqAmH3zeF6H
         /M2AVT25lnCp1Sa9YixVsP74isXpV27WYyZES/MnG+PR/sgLWV+TNdmo0dWB3doFR3sW
         PJc/TeBL0d66LHarJJUOiuVc+9LYd0RrT5rJhZxqconTotGYRgBri5GzSQP6DnmjvgcV
         aEVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768911581; x=1769516381; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXaB+rRblVbZQvSIZXsi1b0KhXGaFyJ7cF5b57eRTUc=;
        b=XqqjbS/MFy19+RrT2bA12jQgrMye+dE6gFuIjjpcSRhCmeyowsUV978p56u412GUbc
         b8yxYNGORtgX+CBdq/XuU4Lix3+8Ha0yI1un0YonVS5qlp0bYh7eDoTPyrFUKXXEPg8k
         ZC0u5iO2CHPnZ3tPWPGALoqImCLXKP1sPfsPoy5nrBf5g2gY/c9XdTniQRbuDTe4PpFd
         nsd7XUC9Zw2qziN0mdBwN5oR8+sqjiSX0wC2okgtPiwh/XKEvi6mNzVPwvDD+bG5LXcx
         Dol0EVHEscF5T8llffdXMLaMykPrCHiio3/+fpDLe/Q0sUHg9GbVXjtPN3Ozl6NzXkGP
         I0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911581; x=1769516381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXaB+rRblVbZQvSIZXsi1b0KhXGaFyJ7cF5b57eRTUc=;
        b=oQ/bZpd9w7kuu5eHUv6hW+6YfLq7POJeU/8W0a86fNtawhJ5nDmfgINXVX/dYCpJm2
         x4KJ1ogdE8LqfpOBYisokG7D6G28bfMh93BnPoL8D+EJiFzA1nNRY5D/YwLYEZKSORFr
         mZ5wWNPj2w5w10BqVCdsk9TX1m+BeUNUzc+4cbHmqExXXRWWe+8LFTZVo+d7qsBdK7ji
         C2cd2Alg+fZCuxvx8O1K72Ji+req/PZKTYXAIOsrZljpg8roN7FzK43z7LDCHEBvLzA9
         Qql8d4+PTY/UbCDHuu4OUQRQXyoFBEpsUD/fbW+5cZyI3bf9LyjDZ/boZAiZL7L60DEo
         TyFg==
X-Forwarded-Encrypted: i=1; AJvYcCUGd0vq7yPipreRGVY8zyHh6PgkdrYIHXkOdSJXrqJkLeYWJEjUTb32hpdy8qVzKsDrkaNigtF9+XV1fw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhVCz3VhA9zby9/4eJ9qA7bBqoNbol9qUf+2i98jLyiFcD45/A
	8xgFdOubYlhJVrfYXJLv1KKns4Qh9o6WoMY9ToFwV2lHzoeZ2I6PMSzPdHKl/CiXG/cNaifms2x
	Y5RzZaNr9Fzr4Om243rX6Lv0tdl2tzrBjlAvOl5oPMQ==
X-Gm-Gg: AZuq6aLk+QyH9egtYVbbh3CUZ8rKmyGmQLziOYNemOi58bD/cIoMkYiIwM/Anga5Uj+
	YCqSeLMnMv6KYtyZF/jQEczK8QAhDHKLi0geDBzBGgnzdjlMZVNdTYzmIZMmZgbq9A/DB7e2gnR
	af+UfZAnKH/8ukchcGiHzH4R7nQe/v7syVo6P3iJUh1Wissxa4FGACyhqd2qMkMCwVZK06BCkyC
	RM5JyhElUtSjzMZN7c1j7Ljd9mVSJZPCZuzGd4YySpVaJsNAMg55Ow3VxdhEfB99E36TzJMIP5o
	50cK4xQ4uwqXZ9AjCsbBRZaOl81MOIBy72FsGMH8TJqBMo3oswNngrc=
X-Received: by 2002:a05:690c:dc3:b0:783:6f68:2a05 with SMTP id
 00721157ae682-793c5262618mr117640327b3.14.1768911581006; Tue, 20 Jan 2026
 04:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
In-Reply-To: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 20 Jan 2026 20:19:29 +0800
X-Gm-Features: AZwV_QgnDKIFyIp77S13MLZLNCHgwh0zxvlAvzBrnx4VVxVC0QrI7vSOpSwulKc
Message-ID: <CAH1PCMaewGAC4J-w76Sz1L838BHO3Zz4-E47vq02cwASkz2wkg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] reset: spacemit: Add support for SpacemiT K3 SoC
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_041942_515184_B036FAEC 
X-CRM114-Status: GOOD (  26.44  )
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgYXQgNzoxMeKAr1BNIEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlz
Y3N0YXIuY29tPiB3cm90ZToKPgo+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIHJl
c2V0IGNvbnRyb2xsZXIgZm91bmQgb24gdGhlIFNwYWNlbWlUCj4gSzMgU29DLgo+Cj4gVGhlIGNs
b2NrIGRyaXZlciBjaGFuZ2VzLCB3aGljaCBkZWZpbmVkIG5ldyBhdXhpbGlhcnkgZGV2aWNlIG5h
bWUKPiBwYXR0ZXJucyBmb3IgcmVzZXQgb24gSzEgYW5kIEszLCBoYXZlIGJlZW4gYXBwbGllZCB0
byB0aGUgY2xvY2sgdHJlZS4KPiBUbyBmYWNpbGl0YXRlIG1lcmdpbmcsIFlpeHVuIExhbiBoYXMg
Y3JlYXRlZCBhbiBpbW11dGFibGUgdGFnCj4gKHNwYWNlbWl0LWNsa3JzdC12Ni4yMC0zKSB3aXRo
aW4gaGlzIHB1bGwgcmVxdWVzdCB0byB0aGUgY2xvY2sKPiBzdWJzeXN0ZW0gWzFdLiBIZW5jZSwg
dGhlIGRlcGVuZGVuY2llcyBtZW50aW9uZWQgaW4gdjIgaGF2ZSBub3cKCkFwb2xvZ2llcywgSSBu
b3RpY2VkIHRoZSBsaW5rIFsxXSByZWZlcmVuY2VkIHdhcyBpbmNvcnJlY3QuIEZpeGVkIGJlbG93
LgoKPiBiZWVuIGRlYmxvY2tlZCwgbWFraW5nIHRoZSByZXNldCBkcml2ZXIgcmVhZHkgdG8gYmUg
YXBwbGllZCwgaWYgaXQKPiBnZXRzIGFwcHJvdmFsIGZyb20gcmV2aWV3Lgo+Cj4gSW4gdGhpcyB2
ZXJzaW9uICh2MyksIHRoZSBlbnRpcmUgc2VyaWVzIGhhcyBiZWVuIHJlYmFzZWQgYW5kIHRlc3Rl
ZAo+IG9uIHRvcCBvZiB0aGUgbGludXgtbmV4dCB0YWc6IG5leHQtMjAyNjAxMTkuCj4KPiBHZW5l
cmFsIGluZm9ybWFpdG9uIGFib3V0IHRoZSBzZXJpZXM6Cj4KPiBUaGUgSzMgcmVzZXQgY29udHJv
bGxlciBzaGFyZXMgdGhlIHNhbWUgYXJjaGl0ZWN0dXJlIGFzIHRoZSBLMS4gVG8KPiBmYWNpbGl0
YXRlIHN1cHBvcnQgZm9yIGJvdGggYW5kIGZ1dHVyZSBTb0NzLCB0aGUgZXhpc3RpbmcgSzEgcmVz
ZXQKPiBkcml2ZXIgaXMgcmVmYWN0b3JlZCB3aXRoIHRoZSBmb2xsb3dpbmcgY2hhbmdlczoKPgo+
IDEuIFRoZSBleGlzdGluZyBLMSBkcml2ZXIgaXMgbW92ZWQgdG8gYSBkZWRpY2F0ZWQgJ2RyaXZl
cnMvcmVzZXQvc3BhY2VtaXQvJwo+ICAgIGRpcmVjdG9yeS4KPiAyLiBDb21tb24gcmVzZXQgb3Bl
cmF0aW9ucyBhcmUgZXh0cmFjdGVkIGludG8gcmVzZXQtc3BhY2VtaXQtY29tbW9uLntjLGh9Cj4K
PiBUaGUgSzMgZHJpdmVyIGlzIGltcGxlbWVudGVkIHVzaW5nIHRoaXMgY29tbW9uIGluZnJhc3Ry
dWN0dXJlLgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY2xrLzIwMjYw
MTE0MDYwNDEwLjMzNDA1NDAtMS15aXh1bi5sYW5AZ21haWwuY29tLyBbMV0KClBsZWFzZSB1c2Ug
dGhpcyBsaW5rIGZvciB0aGUgaW1tdXRhYmxlIHRhZyByZWZlcmVuY2UgaW5zdGVhZDoKTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvc3BhY2VtaXQvMjAyNjAxMTQwOTI3NDItR1lDNzkzMzI2
N0BnZW50b28ub3JnLyBbMV0KClRoZSBjb2RlIHJlbWFpbnMgdW5jaGFuZ2VkLgoKQmVzdCByZWdh
cmRzLApHdW9kb25nIFh1Cgo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAgLSBVcGRhdGVkIGRlcGVuZGVu
Y3kgc3RhdHVzIGFuZCBiYXNlIGluZm9ybWF0aW9uLgo+ICAtIFBhdGNoIDE6Cj4gICAgICBBZGQg
QWNrZWQtYnkgZnJvbSBLcnp5c3p0b2YgYW5kIEFsZXguCj4gIC0gUGF0Y2ggMjoKPiAgICAgIFJl
bW92ZWQgdHJhaWxpbmcgYmxhbmsgbGluZSBmcm9tIE1ha2VmaWxlLgo+ICAtIFBhdGNoIDEvMi8z
LzQ6Cj4gICAgICBBZGQgQWNrZWQtYnkgLyBSZXZpZXdlZC1ieSBmcm9tIEFsZXggRWxkZXIuCj4K
PiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAxMDgtazMtcmVz
ZXQtdjItMC00NTdkZjIzNWVmZTlAcmlzY3N0YXIuY29tCj4KPiBDaGFuZ2VzIGluIHYyOgo+ICAt
IFBhdGNoIDE6Cj4gICAgICBVcGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIGV4cGxhaW4gdGhl
IHdoeS4KPiAgICAgIFVwZGF0ZSB0aGUgc3BhY2VtaXQsazEtc3lzY29uLnlhbWwgdG8gcG9pbnQg
dG8gazMgcmVzZXQgSURzCj4gICAgICBoZWFkZXIgZmlsZS4KPiAgLSBQYXRjaCAzOgo+ICAgICAg
VXNlIGRldi0+ZHJpdmVyLT5vd25lciBmb3IgdGhlIHJlc2V0IGNvbnRyb2xsZXIgb3duZXIgaW5z
dGVhZCBvZgo+ICAgICAgVEhJU19NT0RVTEUgdG8gZml4IHRoZSBtb2R1bGUgcmVmZXJlbmNlIGNv
dW50aW5nIGlzc3VlIHBvaW50ZWQgb3V0Cj4gICAgICBieSBLcnp5c3p0b2YgS296bG93c2tpLgo+
ICAtIFBhdGNoIDMgYW5kIDQ6Cj4gICAgICBVcGRhdGUgdGhlIEsxX0FVWF9ERVZfSUQgYW5kIEsz
X0FVWF9ERVZfSUQgbWFjcm9zIHRvIGEgc2ltcGxlciBidXQgZGlyZWN0Cj4gICAgICBmb3JtLCBv
bmUgYmVuZWZpdCBpcyB0byBpbXByb3ZlIHRoZSBjb2RlIHJlYWRhYmlsaXR5LiBNb3JlIGRpc2N1
c3Npb24KPiAgICAgIGNhbiBiZSBmb3VuZCBpbiBMaW5rIFs0XS4KPiBMaW5rIHRvIHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUxMjI5LWszLXJlc2V0LXYxLTAtZWRhMDc0N2JkZWQz
QHJpc2NzdGFyLmNvbQo+Cj4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBYdSA8Z3VvZG9uZ0ByaXNj
c3Rhci5jb20+Cj4gLS0tCj4gR3VvZG9uZyBYdSAoNCk6Cj4gICAgICAgZHQtYmluZGluZ3M6IHNv
Yzogc3BhY2VtaXQ6IEFkZCBLMyByZXNldCBzdXBwb3J0IGFuZCBJRHMKPiAgICAgICByZXNldDog
Q3JlYXRlIHN1YmRpcmVjdG9yeSBmb3IgU3BhY2VtaVQgZHJpdmVycwo+ICAgICAgIHJlc2V0OiBz
cGFjZW1pdDogRXh0cmFjdCBjb21tb24gSzEgcmVzZXQgY29kZQo+ICAgICAgIHJlc2V0OiBzcGFj
ZW1pdDogQWRkIFNwYWNlbWlUIEszIHJlc2V0IGRyaXZlcgo+Cj4gIC4uLi9iaW5kaW5ncy9zb2Mv
c3BhY2VtaXQvc3BhY2VtaXQsazEtc3lzY29uLnlhbWwgIHwgICA4ICstCj4gIGRyaXZlcnMvcmVz
ZXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEyICstCj4gIGRyaXZl
cnMvcmVzZXQvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCj4g
IGRyaXZlcnMvcmVzZXQvc3BhY2VtaXQvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgIHwgIDM2
ICsrKysKPiAgZHJpdmVycy9yZXNldC9zcGFjZW1pdC9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgfCAgIDUgKwo+ICBkcml2ZXJzL3Jlc2V0L3NwYWNlbWl0L3Jlc2V0LXNwYWNlbWl0LWNvbW1v
bi5jICAgICB8ICA3NyArKysrKysrCj4gIGRyaXZlcnMvcmVzZXQvc3BhY2VtaXQvcmVzZXQtc3Bh
Y2VtaXQtY29tbW9uLmggICAgIHwgIDQyICsrKysKPiAgLi4uL3Jlc2V0LXNwYWNlbWl0LWsxLmN9
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMDcgKy0tLS0tLS0tLQo+ICBkcml2ZXJzL3Jl
c2V0L3NwYWNlbWl0L3Jlc2V0LXNwYWNlbWl0LWszLmMgICAgICAgICB8IDIzMyArKysrKysrKysr
KysrKysrKysrKysKPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9zcGFjZW1pdCxrMy1yZXNl
dHMuaCAgICAgfCAxNzEgKysrKysrKysrKysrKysrCj4gIDEwIGZpbGVzIGNoYW5nZWQsIDU4MyBp
bnNlcnRpb25zKCspLCAxMTAgZGVsZXRpb25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IDZhZGE5
OTY1OWM2ZDZhMGNkZTgzZTZjMGY0ZWQwZWYwYmExODY3ZTEKPiBjaGFuZ2UtaWQ6IDIwMjUxMjI5
LWszLXJlc2V0LThkOWI3NTFlZjM5MQo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gR3VvZG9uZyBY
dSA8Z3VvZG9uZ0ByaXNjc3Rhci5jb20+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
