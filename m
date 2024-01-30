Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFAEC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 11:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8p1YBGv1m/myxIQTQ8Cpq6/u0A+7kJlQFkYq2RQlEiA=; b=fd16/67xSK61Od
	bkwFgarc/83ar4KDnEdq28O8ahOf3rOYXhZxtlsLBldzoFS+G81qVQzGCkLn6X6wCu08m6bLw6yM0
	tfwPaiFeM9dLh6dtok1jBtqpZH3Y8iSkdcpg42hidB5joZPSlol5lngl9aeOq6kdjg1R5CuZQSSiC
	3sfuedXHdXtqIG+Vvb3rMwJgEk/dAm96hKyVJ6t8rcQnfA+QCi5sdql2DIp7+vg1ZV9PS8MAHlP1g
	Bwcj/240beJXviqz0Vjz3+GRCIqNKIytPk7+RxkedGTWdVjT1NUB7gKkaRnkl+o00rJs3kP2ihWWk
	UC6TBfefaWLrFleHNf+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmZL-0000000GXP1-3diK;
	Tue, 30 Jan 2024 11:46:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmZI-0000000GXNH-0Wdp;
	Tue, 30 Jan 2024 11:46:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CA06608C3;
	Tue, 30 Jan 2024 11:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08963C43390;
	Tue, 30 Jan 2024 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706615179;
	bh=06r+eoDIdb0wUNK9nK1o7FDcwKFdTlsuHuRKweLT1c4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GueB1uq5VGej0m02UI0z6szNNF68tqP4GszcsjFOcw63xgdIneA5HtrM61SmR5G1N
	 qktGiqME3S+1Y0PEjqFDj2Zvdm79wGhhUtSSuFxc0uoOpNSKAND8GN5r5D6VctVrr6
	 FtcA34kp6rgV7zHn510vSmqNLGCns4S6qh6Jb27so0QrVL+oYtx4Bi2IOGBAa8qA6q
	 +kWsj9IQAi9WRO0/wSuiQrI/c+QXXREzkPQW5h/Qffj00WPpkb0+WNxE2omlQE1qU8
	 T3KZuavUIGgRulenfQ+iDBYvihanGQ9iUUVyG4mjOMkxyMD5HuylFg899ls+EkKVg2
	 yxxXuoVZgb60A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc
 Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
In-Reply-To: <CAK9=C2UYCKUBKggtM606orH2mBu_AbTdB5-R5AP1M0t-LsEbEQ@mail.gmail.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <87r0hzuw87.fsf@all.your.base.are.belong.to.us>
 <87le87uulb.fsf@all.your.base.are.belong.to.us>
 <CAK9=C2UYCKUBKggtM606orH2mBu_AbTdB5-R5AP1M0t-LsEbEQ@mail.gmail.com>
Date: Tue, 30 Jan 2024 12:46:16 +0100
Message-ID: <87cytjvybb.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_034620_276480_77E808DE 
X-CRM114-Status: GOOD (  15.16  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gT24gVHVlLCBK
YW4gMzAsIDIwMjQgYXQgMToyMuKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Pgo+PiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4+
Cj4+ID4gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKPj4gPgo+
PiA+PiBUaGUgUklTQy1WIEFJQSBzcGVjaWZpY2F0aW9uIGlzIHJhdGlmaWVkIGFzLXBlciB0aGUg
UklTQy1WIGludGVybmF0aW9uYWwKPj4gPj4gcHJvY2Vzcy4gVGhlIGxhdGVzdCByYXRpZmllZCBB
SUEgc3BlY2lmY2F0aW9uIGNhbiBiZSBmb3VuZCBhdDoKPj4gPj4gaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2L3Jpc2N2LWFpYS9yZWxlYXNlcy9kb3dubG9hZC8xLjAvcmlzY3YtaW50ZXJydXB0cy0x
LjAucGRmCj4+ID4+Cj4+ID4+IEF0IGEgaGlnaC1sZXZlbCwgdGhlIEFJQSBzcGVjaWZpY2F0aW9u
IGFkZHMgdGhyZWUgdGhpbmdzOgo+PiA+PiAxKSBBSUEgQ1NScwo+PiA+PiAgICAtIEltcHJvdmVk
IGxvY2FsIGludGVycnVwdCBzdXBwb3J0Cj4+ID4+IDIpIEluY29taW5nIE1lc3NhZ2UgU2lnbmFs
ZWQgSW50ZXJydXB0IENvbnRyb2xsZXIgKElNU0lDKQo+PiA+PiAgICAtIFBlci1IQVJUIE1TSSBj
b250cm9sbGVyCj4+ID4+ICAgIC0gU3VwcG9ydCBNU0kgdmlydHVhbGl6YXRpb24KPj4gPj4gICAg
LSBTdXBwb3J0IElQSSBhbG9uZyB3aXRoIHZpcnR1YWxpemF0aW9uCj4+ID4+IDMpIEFkdmFuY2Vk
IFBsYXRmb3JtLUxldmVsIEludGVycnVwdCBDb250cm9sbGVyIChBUExJQykKPj4gPj4gICAgLSBX
aXJlZCBpbnRlcnJ1cHQgY29udHJvbGxlcgo+PiA+PiAgICAtIEluIE1TSS1tb2RlLCBjb252ZXJ0
cyB3aXJlZCBpbnRlcnJ1cHQgaW50byBNU0lzIChpLmUuIE1TSSBnZW5lcmF0b3IpCj4+ID4+ICAg
IC0gSW4gRGlyZWN0LW1vZGUsIGluamVjdHMgZXh0ZXJuYWwgaW50ZXJydXB0cyBkaXJlY3RseSBp
bnRvIEhBUlRzCj4+ID4+Cj4+ID4+IEZvciBhbiBvdmVydmlldyBvZiB0aGUgQUlBIHNwZWNpZmlj
YXRpb24sIHJlZmVyIHRoZSBBSUEgdmlydHVhbGl6YXRpb24KPj4gPj4gdGFsayBhdCBLVk0gRm9y
dW0gMjAyMjoKPj4gPj4gaHR0cHM6Ly9zdGF0aWMuc2NoZWQuY29tL2hvc3RlZF9maWxlcy9rdm1m
b3J1bTIwMjIvYTEvQUlBX1ZpcnR1YWxpemF0aW9uX2luX0tWTV9SSVNDVl9maW5hbC5wZGYKPj4g
Pj4gaHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1yMDcxZEw4WjB5bwo+PiA+Pgo+PiA+
PiBUbyB0ZXN0IHRoaXMgc2VyaWVzLCB1c2UgUUVNVSB2Ny4yIChvciBoaWdoZXIpIGFuZCBPcGVu
U0JJIHYxLjIgKG9yIGhpZ2hlcikuCj4+ID4+Cj4+ID4+IFRoZXNlIHBhdGNoZXMgY2FuIGFsc28g
YmUgZm91bmQgaW4gdGhlIHJpc2N2X2FpYV92MTIgYnJhbmNoIGF0Ogo+PiA+PiBodHRwczovL2dp
dGh1Yi5jb20vYXZwYXRlbC9saW51eC5naXQKPj4gPj4KPj4gPj4gQ2hhbmdlcyBzaW5jZSB2MTE6
Cj4+ID4+ICAtIFJlYmFzZWQgb24gTGludXgtNi44LXJjMQo+PiA+PiAgLSBJbmNsdWRlZCBrZXJu
ZWwvaXJxIHJlbGF0ZWQgcGF0Y2hlcyBmcm9tICJnZW5pcnEsIGlycWNoaXA6IENvbnZlcnQgQVJN
Cj4+ID4+ICAgIE1TSSBoYW5kbGluZyB0byBwZXIgZGV2aWNlIE1TSSBkb21haW5zIiBzZXJpZXMg
YnkgVGhvbWFzLgo+PiA+PiAgICAoUEFUQ0g3LCBQQVRDSDgsIFBBVENIOSwgUEFUQ0gxNCwgUEFU
Q0gxNiwgUEFUQ0gxNywgUEFUQ0gxOCwgUEFUQ0gxOSwKPj4gPj4gICAgIFBBVENIMjAsIFBBVENI
MjEsIFBBVENIMjIsIFBBVENIMjMsIGFuZCBQQVRDSDMyIG9mCj4+ID4+ICAgICBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjIxMTIxMTM1NjUzLjIwODYxMTIzM0Bs
aW51dHJvbml4LmRlLykKPj4gPj4gIC0gVXBkYXRlZCBBUExJQyBNU0ktbW9kZSBkcml2ZXIgdG8g
dXNlIHRoZSBuZXcgV0lSRURfVE9fTVNJIG1lY2hhbmlzbS4KPj4gPj4gIC0gVXBkYXRlZCBJTVNJ
QyBkcml2ZXIgdG8gc3VwcG9ydCBwZXItZGV2aWNlIE1TSSBkb21haW5zIGZvciBQQ0kgYW5kCj4+
ID4+ICAgIHBsYXRmb3JtIGRldmljZXMuCj4+ID4KPj4gPiBUaGFua3MgZm9yIHdvcmtpbmcgb24g
dGhpcywgQW51cCEgSSdtIHN0aWxsIHJldmlld2luZyB0aGUgcGF0Y2hlcy4KPj4gPgo+PiA+IEkn
bSBoaXR0aW5nIGEgYm9vdCBoYW5nIGluIHRleHQgcGF0Y2hpbmcsIHdpdGggdGhpcyBzZXJpZXMg
YXBwbGllZCBvbgo+PiA+IDYuOC1yYzIuIElQSSBpc3N1ZXM/Cj4+Cj4+IE5vdCB0ZXh0IHBhdGNo
aW5nISBPbmUgY3B1IHNwaW5uaW5nIGluIHNtcF9jYWxsX2Z1bmN0aW9uX21hbnlfY29uZCgpIGFu
ZAo+PiB0aGUgb3RoZXJzIGFyZSBpbiBjcHVfcmVsYXgoKS4gU21lbGxzIGxpa2UgSVBJLi4uCj4K
PiBJIHRyaWVkIGJvb3RlZmkgZnJvbSBVLUJvb3QgbXVsdGlwbGUgdGltZXMgYnV0IGNhbid0IHJl
cHJvZHVjZSB0aGUKPiBpc3N1ZSB5b3UgYXJlIHNlZWluZy4KClRoYW5rcyEgSSBjYW4gcmVwcm9k
dWNlIHdpdGhvdXQgRUZJLCBhbmQgc2ltcGxlciBjb21tYW5kLWxpbmU6CgpxZW11LXN5c3RlbS1y
aXNjdjY0IFwKICAtYmlvcyAvcGF0aC90by9md19keW5hbWljLmJpbiBcCiAgLWtlcm5lbCAvcGF0
aC90by9JbWFnZSBcCiAgLWFwcGVuZCAnZWFybHljb24gY29uc29sZT10dHkwIGNvbnNvbGU9dHR5
UzAnIFwKICAtbWFjaGluZSB2aXJ0LGFpYT1hcGxpYy1pbXNpYyBcCiAgLW5vLXJlYm9vdCAtbm9k
ZWZhdWx0cyAtbm9ncmFwaGljIFwKICAtc21wIDQgXAogIC1vYmplY3Qgcm5nLXJhbmRvbSxmaWxl
bmFtZT0vZGV2L3VyYW5kb20saWQ9cm5nMCBcCiAgLWRldmljZSB2aXJ0aW8tcm5nLWRldmljZSxy
bmc9cm5nMCBcCiAgLW0gNEcgLWNoYXJkZXYgc3RkaW8saWQ9Y2hhcjAgLXNlcmlhbCBjaGFyZGV2
OmNoYXIwCgpJIGNhbiByZXByb2R1Y2Ugd2l0aCB5b3VyIHVwc3RyZWFtIHJpc2N2X2FpYV92MTIg
cGx1cyB0aGUgY29uZmlnIGluIHRoZQpnaXN0IFsxXSwgYW5kIGFsbCBsYXRlc3QgUUVNVS9PcGVu
U0JJOgoKUUVNVTogMTFiZTcwNjc3YzcwICgiTWVyZ2UgdGFnICdwdWxsLXZmaW8tMjAyNDAxMjkn
IG9mIGh0dHBzOi8vZ2l0aHViLmNvbS9sZWdvYXRlci9xZW11IGludG8gc3RhZ2luZyIpCk9wZW5T
Qkk6IGJiOTBhOWViZjZkOSAoImxpYjogc2JpOiBQcmludCBudW1iZXIgb2YgZGVidWcgdHJpZ2dl
cnMgZm91bmQiKQpMaW51eDogZDliOWQ2ZWI5ODdmICgiTUFJTlRBSU5FUlM6IEFkZCBlbnRyeSBm
b3IgUklTQy1WIEFJQSBkcml2ZXJzIikKClJlbW92aW5nICIsYWlhPWFwbGljLWltc2ljIiBmcm9t
IHRoZSBDTEkgYWJvdmUgY29tcGxldGVzIHRoZSBib290IChpLmUuCnBhbmlja2luZyBhYm91dCBt
aXNzaW5nIHJvb3QgbW91bnQgOy0pKQoKCkJqw7ZybgoKWzFdIGh0dHBzOi8vZ2lzdC5naXRodWJ1
c2VyY29udGVudC5jb20vYmpvdG8vYmFjNTYzZTZkY2FhYjY4ZGJhMWE1ZWFmNjc1ZDUxYWEvcmF3
L2ZmNjIwOGZiMTdmMjc4MTlkYmU5N2FjZTdkMDM0ZjM4NWQyZGI2NTcvZ2lzdGZpbGUxLnR4dAoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
