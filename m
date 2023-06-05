Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E7CC7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 20:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lc7mtIZlN0rqI5iZp1qa3hH9aeiCpBXqTQrRedo9VR0=; b=wpBeSF3B109Rkj
	CNhX41DL+UqcpAG2+YGcnzCIj5JYKJbsDtuBOprv45GydKgyY0T/0GKlcWN6mWncrrE2gw7aKrTL2
	cz4xjYGd+cSN0Y+ihkJ1EsvzFNaULdz0krrR3gJhsl7gsD/ci73hfBhNP0cx2rwUsFN525ALzY43F
	uUNuoLH6UZg7wepbwy3rOQ0b8j3GaJXF6Z1HbmVbKfIJaH2Xmo06B59TLXxMNALBG8+vvVTrU9PN0
	V3QDWXV4T4xE6Lk5jecN3MH/zOgHvjxkS/LoQl3crghJHBt5Ue9l52CayTQpAxjJYf0H7VEv9E0e8
	tLb9POjwNkMpEwnD0MvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HFM-00GmFl-2g;
	Mon, 05 Jun 2023 20:56:12 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HFJ-00GmF7-2L
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 20:56:11 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b1bb2fc9c6so35475831fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 13:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1685998567; x=1688590567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+VjQC/3FZMRhBnW1leNU2wGf62bCTHxEuF7S30g0gU=;
        b=GtsZdAXqhZnN3PMUfxUoUynt9W/ZP+S4464DonG/M1Qz2lefLODWHU6AGUF4AIBh0i
         +Z73NbyVFfhzg85YHiOWCZoigAnZw52oQ+dNiubzTo6LZWYzLMRqF9tvslT13CBP4hiJ
         q76lvKbF6C2vO2bXXHWqGeeJzKVd20VrcKuYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685998567; x=1688590567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+VjQC/3FZMRhBnW1leNU2wGf62bCTHxEuF7S30g0gU=;
        b=XaGQMnYdsQuUPnKN/SwYqUPoPtPnk4962sZHJhts2IgnEjireHs2yobvBblLnIOCrK
         GQLmo+n/G3GOZmBn2eFeAHobetSqW1tGsHAqdbLNNgfQ1MT1c8QVx/L1LPD4DvkOFNAX
         p/hCjWK0rgedvGL7kFQMv5yik19oHcvasX5GA+rgUR4glwyxbitud2fcoxcZlz+L+IF1
         UidGirF40mgch7PmeFPM10FuAeO5e1V0o4pt89lk7Ygy4N+CEWu+h17AHqKu6eOekwv0
         h44TFpOt+LAC2mAvjVduYjaNny14PvjcznGiTiql19LpcumZK+k1BL1eU6RlMNSyAtvN
         zERw==
X-Gm-Message-State: AC+VfDzPxBtl7NkFS480nSvS3tQseXu6ipcehwNraAm/40m0gTnpoLu2
	GvgMD7DU9PJKM/dyUO0a2MaFXLJbMA1ijsMPKwwb
X-Google-Smtp-Source: ACHHUZ7yCVOd2ncyULAi2yoAY7KnOUPO153oV23HaYJ9F6JAJVfUVpnFJxwT6aqwgxRZQDDtL1tSKxHbR1XGQLFm0e0=
X-Received: by 2002:a2e:88c9:0:b0:2af:228a:8670 with SMTP id
 a9-20020a2e88c9000000b002af228a8670mr226471ljk.2.1685998567237; Mon, 05 Jun
 2023 13:56:07 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_7C3B580B47C1B17C16488EC1@qq.com> <CAHVXubjm5ax5KYTV_G=GUUH0KJK=v6_jO09XF1T4AzzUTr0CSg@mail.gmail.com>
 <ZH37WMnx/rYSRF/o@sunil-laptop>
In-Reply-To: <ZH37WMnx/rYSRF/o@sunil-laptop>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 5 Jun 2023 13:55:55 -0700
Message-ID: <CAOnJCU+v-tinJb3=FY9GKzR=CGc+AE45wVdpVVZLSG1WOR2PLA@mail.gmail.com>
Subject: Re: Bug report: kernel paniced while booting
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Song Shuai <songshuaishuai@tinylab.org>, 
	robh <robh@kernel.org>, ajones <ajones@ventanamicro.com>, anup <anup@brainfault.org>, 
	palmer <palmer@rivosinc.com>, "jeeheng.sia" <jeeheng.sia@starfivetech.com>, 
	"leyfoon.tan" <leyfoon.tan@starfivetech.com>, "mason.huo" <mason.huo@starfivetech.com>, 
	"paul.walmsley" <paul.walmsley@sifive.com>, "conor.dooley" <conor.dooley@microchip.com>, 
	guoren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_135610_042768_E3F76E32 
X-CRM114-Status: GOOD (  43.57  )
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

T24gTW9uLCBKdW4gNSwgMjAyMyBhdCA4OjEz4oCvQU0gU3VuaWwgViBMIDxzdW5pbHZsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdW4gMDUsIDIwMjMgYXQgMDQ6MjU6MDZQ
TSArMDIwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gSGkgU29uZywKPiA+Cj4gPiBPbiBN
b24sIEp1biA1LCAyMDIzIGF0IDEyOjUy4oCvUE0gU29uZyBTaHVhaSA8c29uZ3NodWFpc2h1YWlA
dGlueWxhYi5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBEZXNjcmlwdGlvbiBvZiBwcm9ibGVtOgo+
ID4gPgo+ID4gPiBCb290aW5nIExpbnV4IFdpdGggUmlzY1ZWaXJ0UWVtdSBlZGsyIGZpcm13YXJl
LCBhIFN0b3JlL0FNTyBwYWdlIGZhdWx0IHdhcyB0cmFwcGVkIHRvIHRyaWdnZXIgYSBrZXJuZWwg
cGFuaWMuCj4gPiA+IFRoZSBlbnRpcmUgbG9nIGhhcyBiZWVuIHBvc3RlZCBhdCB0aGlzIGxpbmsg
OiBodHRwczovL3Rlcm1iaW4uY29tL25nYTQuCj4gPiA+Cj4gPiA+IFlvdSBjYW4gcmVwcm9kdWNl
IGl0IHdpdGggdGhlIGZvbGxvd2luZyBzdGVwIDoKPiA+ID4KPiA+ID4gMS4gcHJlcGFyZSB0aGUg
ZW52aXJvbm1lbnQgd2l0aAo+ID4gPiAgICAtIFFlbXUtdmlydDogIHY4LjAuMCAod2l0aCBPcGVu
U2JpIHYxLjIpCj4gPiA+ICAgIC0gZWRrMiA6IGF0IGNvbW1pdCAoMmJjODU0NTg4MyAiVWVmaUNw
dVBrZy9DcHVQYWdlVGFibGVMaWI6IFJlZHVjZSB0aGUgbnVtYmVyIG9mIHJhbmRvbSB0ZXN0cyIp
Cj4gPiA+ICAgIC0gTGludXggOiB2Ni40LXJjMSBhbmQgbGF0ZXIgdmVyc2lvbgo+ID4gPgo+ID4g
PiAyLiBzdGFydCB0aGUgUWVtdSB2aXJ0IGJvYXJkCj4gPiA+Cj4gPiA+IGBgYHNoCj4gPiA+ICQg
Y2F0IH4vOF9yaXNjdi9zdGFydF9sYXRlc3Quc2gKPiA+ID4gIyEvYmluL2Jhc2gKPiA+ID4gL2hv
bWUvc29uZy84X3Jpc2N2LzNfYWNwaS9xZW11L29vby91c3IvbG9jYWwvYmluL3FlbXUtc3lzdGVt
LXJpc2N2NjQgXAo+ID4gPiAgICAgICAgIC1zIC1ub2dyYXBoaWMgLWRyaXZlIGZpbGU9L2hvbWUv
c29uZy84X3Jpc2N2LzNfYWNwaS9CdWlsZF92aXJ0L1Jpc2NWVmlydFFlbXUvUkVMRUFTRV9HQ0M1
L0ZWL1JJU0NWX1ZJUlQuZmQsaWY9cGZsYXNoLGZvcm1hdD1yYXcsdW5pdD0xIFwKPiA+ID4gICAg
ICAgICAtbWFjaGluZSB2aXJ0LGFjcGk9b2ZmIC1zbXAgMiAtbSAyRyBcCj4gPiA+ICAgICAgICAg
LWtlcm5lbCAvaG9tZS9zb25nLzlfbGludXgvbGludXgvMDBfcnZfZGVmL2FyY2gvcmlzY3YvYm9v
dC9JbWFnZSBcCj4gPiA+ICAgICAgICAgLWluaXRyZCAvaG9tZS9zb25nLzhfcmlzY3YvM19hY3Bp
L2J1aWxkcm9vdC9vdXRwdXQvaW1hZ2VzL3Jvb3Rmcy5leHQyIFwKPiA+ID4gICAgICAgICAtYXBw
ZW5kICJyb290PS9kZXYvcmFtIHJvIGNvbnNvbGU9dHR5UzAgZWFybHljb249dWFydDgyNTAsbW1p
bywweDEwMDAwMDAwIGVmaT1kZWJ1ZyBsb2dsZXZlbD04IG1lbWJsb2NrPWRlYnVnIiAjIyBhbHNv
IHBhbmljIGJ5IG1lbXRlc3QKPiA+ID4gYGBgCj4gPiA+IDMuIFRoZW4geW91IHdpbGwgZW5jb3Vu
dGVyIHRoZSBrZXJuZWwgcGFuaWMgbG9nZ2VkIGluIHRoZSBhYm92ZSBsaW5rCj4gPiA+Cj4gPiA+
IE90aGVyIEluZm9ybWF0aW9uOgo+ID4gPgo+ID4gPiAxLiAtLS0tLS0tCj4gPiA+Cj4gPiA+IFRo
aXMgcmVwb3J0IGlzIG5vdCBpZGVudGljYWwgdG8gbXkgcHJpb3IgcmVwb3J0IC0tICJrZXJuZWwg
cGFuaWNlZCB3aGVuIHN5c3RlbSBoaWJlcm5hdGVzIiBbMV0sIGJ1dCBib3RoIG9mIHRoZW0KPiA+
ID4gYXJlIGNsb3NlbHkgcmVsYXRlZCB3aXRoIHRoZSBjb21taXQgKDMzMzUwNjhmODcyMSAicmlz
Y3Y6IFVzZSBQVUQvUDREL1BHRCBwYWdlcyBmb3IgdGhlIGxpbmVhciBtYXBwaW5nIikuCj4gPiA+
Cj4gPiA+IFdpdGggdGhpcyBjb21taXQsIGhpYmVybmF0aW9uIGlzIHRyYXBwZWQgd2l0aCAiYWNj
ZXNzIGZhdWx0IiB3aGlsZSBhY2Nlc3NpbmcgdGhlIFBNUC1wcm90ZWN0ZWQgcmVnaW9ucyAobW1v
ZGVfcmVzdjBAODAwMDAwMDApCj4gPiA+IGZyb20gT3BlblNiaSAoQlRXLCBoaWJlcm5hdGlvbiBp
cyBtYXJrZWQgYXMgbm9ucG9ydGFibGUgYnkgQ29ub3JbMl0pLgo+ID4gPgo+ID4gPiBJbiB0aGlz
IHJlcG9ydCwgZWZpX2luaXQgaGFuZG9mZnMgdGhlIG1lbW9yeSBtYXBwaW5nIGZyb20gQm9vdCBT
ZXJ2aWNlcyB0byBtZW1ibG9jayB3aGVyZSByZXNlcnZlcyBtbW9kZV9yZXN2MEA4MDAwMDAwMCwK
PiA+ID4gc28gdGhlcmUgaXMgbm8gImFjY2VzcyBmYXVsdCIgYnV0ICJwYWdlIGZhdWx0Ii4KPiA+
ID4KPiA+ID4gQW5kIHJldmVydGluZyBjb21taXQgMzMzNTA2OGY4NzIxIGluZGVlZCBmaXhlZCB0
aGlzIHBhbmljLgo+ID4gPgo+ID4gPiAyLiAtLS0tLS0tCj4gPiA+Cj4gPiA+IEFzIHRoZSBnZGIt
cHQtZHVtcCBbM10gdG9vbCBzaG93cywgdGhlIFBURSB3aGljaCBjb3ZlcmVkIHRoZSBmYXVsdCB2
aXJ0dWFsIGFkZHJlc3MgaGFkIHRoZSBhcHByb3ByaWF0ZSBwZXJtaXNzaW9uIHRvIHN0b3JlLgo+
ID4gPiBJcyB0aGVyZSBhbm90aGVyIHdheSB0byB0cmlnZ2VyIHRoZSAiU3RvcmUvQU1PIHBhZ2Ug
ZmF1bHQiPyBPciB0aGUgY3JlYXRpb24gb2YgbGluZWFyIG1hcHBpbmcgaW4gY29tbWl0IDMzMzUw
NjhmODcyMSBkaWQgc29tZXRoaW5nIHdyb25nPwo+ID4gPgo+ID4gPiBgYGAKPiA+ID4gKGdkYikg
cC94ICRzYXRwCj4gPiA+ICQxID0gMHhhMDAwMDAwMDAwMDgxNzA4Cj4gPiA+IChnZGIpIHB0IC1z
YXRwIDB4YTAwMDAwMDAwMDA4MTcwOAo+ID4gPiAgICAgICAgICAgICAgQWRkcmVzcyA6ICAgICBM
ZW5ndGggICBQZXJtaXNzaW9ucwo+ID4gPiAgIDB4ZmYxYmZmZmZmZWEzOTAwMCA6ICAgICAweDEw
MDAgfCBXOjEgWDowIFI6MSBTOjEKPiA+ID4gICAweGZmMWJmZmZmZmViZjkwMDAgOiAgICAgMHgx
MDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4gPiA+ICAgMHhmZjFiZmZmZmZlYzAwMDAwIDogICAweDQw
MDAwMCB8IFc6MSBYOjAgUjoxIFM6MQo+ID4gPiAgIDB4ZmY2MDAwMDAwMDAwMDAwMCA6ICAgMHgx
YzAwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiA+ID4gICAweGZmNjAwMDAwMDAyMDAwMDAgOiAgIDB4
YTAwMDAwIHwgVzowIFg6MCBSOjEgUzoxCj4gPiA+ICAgMHhmZjYwMDAwMDAwYzAwMDAwIDogMHg3
ZjAwMDAwMCB8IFc6MSBYOjAgUjoxIFM6MSAgLy8gYmFkYWRkcjogZmY2MDAwMDA3ZmRiMTAwMAo+
ID4gPiAgIDB4ZmY2MDAwMDA3ZmRjMDAwMCA6ICAgIDB4M2QwMDAgfCBXOjEgWDowIFI6MSBTOjEK
PiA+ID4gICAweGZmNjAwMDAwN2ZmYmYwMDAgOiAgICAgMHgxMDAwIHwgVzoxIFg6MCBSOjEgUzox
Cj4gPiA+ICAgMHhmZmZmZmZmZjgwMDAwMDAwIDogICAweGMwMDAwMCB8IFc6MCBYOjEgUjoxIFM6
MQo+ID4gPiAgIDB4ZmZmZmZmZmY4MGMwMDAwMCA6ICAgMHhhMDAwMDAgfCBXOjEgWDowIFI6MSBT
OjEKPiA+ID4KPiA+ID4gYGBgCj4gPiA+Cj4gPiA+IDMuIC0tLS0tLQo+ID4gPgo+ID4gPiBZb3Ug
Y2FuIGFsc28gcmVwcm9kdWNlIHNpbWlsYXIgcGFuaWMgYnkgYXBwZW5kaW5nICJtZW10ZXN0IiBp
biBrZXJuZWwgY21kbGluZS4KPiA+ID4gSSBoYXZlIHBvc3RlZCB0aGUgbWVtdGVzdCBib290IGxv
ZyBhdCB0aGlzIGxpbms6IGh0dHBzOi8vdGVybWJpbi5jb20vMXR3bC4KPiA+ID4KPiA+ID4gUGxl
YXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLgo+ID4gPgo+ID4gPiBbMV06IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L0NBQVlzMj1nUXZraFRlaW9NbXFSRFZHamR0TkZfdmhC
K3ZtXzFkSEp4UE5pNzVZRFFfUUBtYWlsLmdtYWlsLmNvbS8KPiA+ID4gWzJdOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDUyNi1hc3RyaWRlLWRldG9uYXRvci05YWUx
MjAwNTExNTlAd2VuZHkvCj4gPiA+IFszXTogaHR0cHM6Ly9naXRodWIuY29tL21hcnRpbnJhZGV2
L2dkYi1wdC1kdW1wCj4gPgo+ID4gVGhhbmtzIGZvciB0aGUgdGhvcm91Z2ggcmVwb3J0LCByZWFs
bHkgYXBwcmVjaWF0ZWQuCj4gPgo+ID4gU28gdGhlcmUgYXJlIG11bHRpcGxlIGlzc3VlcyBoZXJl
Ogo+ID4KPiA+IC0gdGhlIGZpcnN0IG9uZSBpcyB0aGF0IHRoZSBtZW1vcnkgcmVnaW9uIGZvciBv
cGVuc2JpIGlzIG1hcmtlZCBhcyBub3QKPiA+IGNhY2hlYWJsZSBpbiB0aGUgZWZpIG1lbW9yeSBt
YXAsIGFuZCB0aGVuIHRoaXMgcmVnaW9uIGlzIG5vdCBtYXBwZWQgaW4KPiA+IHRoZSBsaW5lYXIg
bWFwcGluZzoKPiA+IFsgICAgMC4wMDAwMDBdIGVmaTogICAweDAwMDA4MDAwMDAwMC0weDAwMDA4
MDAzZmZmZiBbUmVzZXJ2ZWQgICAgfCAgIHwKPiA+ICB8ICB8ICB8ICB8ICB8ICB8ICB8ICB8ICAg
fCAgfCAgfCAgfFVDXQo+ID4KCkBBbGV4OiBUaGUgT3BlblNCSSByZWdpb24gaXMgbWFya2VkIHJl
c2VydmVkIGJlY2F1c2UgRURLMiBjaG9vc2VzIHRvCmRvIHRoYXQgZXhwbGljaXRseSBhcyBleHBs
YWluZWQgYnkgU3VuaWwuCkkgZG9uJ3QgdGhpbmsgVUMgaGFzIHRvIGRvIGFueXRoaW5nIHdpdGgg
aXQuIEFsbCB0aGUgRUZJIG1lbW9yeSByZWdpb25zIGFyZSBVQy4KCj4gPiAtIHRoZSBzZWNvbmQg
b25lICh0aGF0IEkgZmVlbCBhIGJpdCBhc2hhbWVkIG9mLi4uKSBpcyB0aGF0IEkgZGlkIG5vdAo+
ID4gY2hlY2sgdGhlIGFsaWdubWVudCBvZiB0aGUgdmlydHVhbCBhZGRyZXNzIHdoZW4gY2hvb3Np
bmcgdGhlIG1hcCBzaXplCj4gPiBpbiBiZXN0X21hcF9zaXplKCkgYW5kIHRoZW4gd2UgZW5kIHVw
IHRyeWluZyB0byBtYXAgYSBwaHlzaWNhbCByZWdpb24KPiA+IGFsaWduZWQgb24gMk1CIHRoYXQg
aXMgYWN0dWFsbHkgbm90IGFsaWduZWQgb24gMk1CIHZpcnR1YWxseSBiZWNhdXNlCj4gPiB0aGUg
b3BlbnNiaSByZWdpb24gaXMgbm90IG1hcHBlZCBhdCBhbGwuCj4gPgo+ID4gLSB0aGUgcG9zc2li
bGUgdGhpcmQgb25lIGlzIHRoYXQgd2Ugc2hvdWxkIG5vdCBtYXAgdGhlIGxpbmVhciBtYXBwaW5n
Cj4gPiB1c2luZyA0SyBwYWdlcywgdGhpcyB3b3VsZCBiZSBzbG93IGluIG15IG9waW5pb24sIGFu
ZCBJIHRoaW5rIHdlCj4gPiBzaG91bGQgd2FzdGUgYSBiaXQgb2YgbWVtb3J5IHRvIGFsaWduIHZh
IGFuZCBwYSBvbiBhIDJNQiBib3VuZGFyeS4KPiA+Cj4gPiBTbyBJJ2xsIGZpeCB0aGUgc2Vjb25k
IGlzc3VlLCBhbmQgcG9zc2libHkgdGhlIHRoaXJkIG9uZSwgYW5kIGlmIG5vCj4gPiBvbmUgbG9v
a3MgaW50byB3aHkgdGhlIG9wZW5zYmkgcmVnaW9uIGlzIG1hcHBlZCBpbiBVQywgSSdsbCB0YWtl
IGEKPiA+IGxvb2sgYXQgZWRrMi4KPiA+Cj4gSGkgQWxleCwKPgo+IEVESzIgbWFya3Mgb3BlbnNi
aSByYW5nZSBhcyByZXNlcnZlZCBtZW1vcnkgaW4gRUZJIG1hcC4gQWNjb3JkaW5nIHRvIERUCj4g
c3BlYywgaWYgdGhlIG5vLW1hcCBpcyBub3Qgc2V0LCB3ZSBuZWVkIHRvIG1hcmsgaXQgYXMKPiBF
ZmlCb290U2VydmljZXNEYXRhIGJ1dCBFZmlCb290U2VydmljZXNEYXRhIGlzIGFjdHVhbGx5IGNv
bnNpZGVyZWQgYXMKPiBmcmVlIG1lbW9yeSBpbiBrZXJuZWwsIGFzIHBlciBVRUZJIHNwZWMuIFRv
IGF2b2lkIGtlcm5lbCB1c2luZyB0aGlzCj4gbWVtb3J5LCB3ZSBkZXZpYXRlZCBmcm9tIHRoZSBE
VCBzcGVjIGZvciBvcGVuc2JpIHJhbmdlcy4KPgoKSU1PLCB0aGF0IHNob3VsZCBiZSB0aGUgY29y
cmVjdCB3YXkgdW5sZXNzIHdlIGNhbiBjaGFuZ2UgaXQgdG8KRWZpUnVuU2VydmljZXNEYXRhL0Nv
ZGUuCkxvb2tpbmcgYXQgVS1Cb290IGNvZGUsIGl0IHNldHMgdGhlIG5vLW1hcCByZWdpb24gdG8K
RWZpQm9vdFNlcnZpY2VzRGF0YSB3aGljaCBtYXkgY2F1c2UKaXNzdWVzIGluIFJJU0MtViBhcyB3
ZWxsIGlmIHdlIGxpbmVhciBtYXBwaW5nIHNldHMgdXAgdGhlIGluaXRpYWwgMk1CLgoKCj4gTGV0
IG1lIGtub3cgeW91ciB0aG91Z2h0cyBob3cgd2UgY2FuIGhhbmRsZSB0aGlzIGJldHRlciBpbiBF
REsyCj4gY29uc2lkZXJpbmcgaXQgaGFzIHRvIHN1cHBvcnQgQUNQSSBhbHNvLgo+Cj4gVGhhbmtz
LAo+IFN1bmlsCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgoKCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
