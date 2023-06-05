Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C46C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 21:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krwiKL6CcAqboirOP/U68uCWmvLF0UQY3NSgjZ/4Dys=; b=lRc7Qw0AjFH4Zk
	CuTm+Oxz2aK6p6P8EIA05bYnj6ke66utUDJRDxfqpDOcWRw2jWTeeK5hKtNjR+3XDKxMaSl3CNFGL
	4rLcsOnLOIGEZKLSUOWwapFDaTK4CKP2NbgySUXviC5PvWvTL9/URfLwxB1BQqWhxDcNL7YDzeXEB
	ha1t+tgMh3qYiq/fv3j+l2N3hX1OxkJ2p68nQ4Ry7PVyHDKikhIue+h6w1YaUEHwPchuHbhB6NXoS
	OWV5rUvLA7O6Y3Q2rysSdDvtRBwYIWkn+rUekINoi/I8ZGQ+jvv+3h4TFWSla+iAxJHnji80tHypH
	pc9U71djpPneVxY/ON9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HyU-00Gtaf-2S;
	Mon, 05 Jun 2023 21:42:50 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HyR-00GtZs-2F
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 21:42:49 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-30ae61354fbso4683076f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 14:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1686001365; x=1688593365;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LgjrKN+wjMH42ISANHiTqCT6nDW3U22wKpUgG9wT3A=;
        b=bVq2//S2ZasBkEqaT3bXZ7Wf+rkt5IAaZKgnwUcrgqwFPd7PBvtrnubW0nAhl1arDp
         FniLhqmYj8QnPT9lOLv0ApzafiE1L/Dx/OQsC6AJQNMfXVl9wzJpVoYZHYX3IvYtI/ck
         HssXy14JLo1z+A5nWFyiOcG76nJvGspgMXcSk6X+7DWgYBxb0flfRnBQyP+qhh53g4Dv
         SIAihpLDkdoisA82+K5hBMKha/zNdPCh8hWe0Krm6zi/PLj/ONUM59PYihvlhJMS9nRU
         ZU0QXYDaW3OflY/nkPp81k4H98soo7Strnojih4obtZUbiedWzwwo58iVv31e0BypN8t
         NZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686001365; x=1688593365;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LgjrKN+wjMH42ISANHiTqCT6nDW3U22wKpUgG9wT3A=;
        b=N6lcD56jS74pLFV+pswR9whrBU+MawORRpeLie/WzxQL+HwfBUCSW5lhDqJMKcPx0c
         o2kzt6Kykdpxs7JuFoaeV5i43KuCnspwvr3g43XEJYrPdSGn7tF50xU4gVT/3QGthVbi
         ofH34lWY/U5vULlt1z6b2MPrUZ9ioROP7M7K91MTdI3TtxeDFvdEocZIMfRcTM6sfysk
         dxtcnufZn/9F6DTnrbc2Wa6cvkoHZqsgpjPIcdviSEDmWk/ESwpoYZKU90XqU70EBcTe
         yVmBOLCczmffaIx8f28rfTi05PqRraC8WMcrbocZ+QWCRELRMkI9DxdaPX908bo7hdb4
         bpCQ==
X-Gm-Message-State: AC+VfDykIjMBGC9xlG0KVFx8RDBOmG4wiu9CeO4ykyGl9wShRONP55he
	HYXyZ8TGMYnK5G/gQf43bBZ/3g==
X-Google-Smtp-Source: ACHHUZ6fajNvK1GtLEp6bPHOwBmzormt+gl48Yi1iW0Ml5iubD6K7iEUExkpKZ+upqokZnDY9V4xpA==
X-Received: by 2002:adf:f64c:0:b0:307:c0c4:109a with SMTP id x12-20020adff64c000000b00307c0c4109amr142920wrp.6.1686001364752;
        Mon, 05 Jun 2023 14:42:44 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d4c52000000b0030ae901bc54sm10635125wrt.62.2023.06.05.14.42.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Jun 2023 14:42:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: Bug report: kernel paniced while booting
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <ZH37WMnx/rYSRF/o@sunil-laptop>
Date: Mon, 5 Jun 2023 22:42:33 +0100
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Song Shuai <songshuaishuai@tinylab.org>,
 robh <robh@kernel.org>,
 ajones <ajones@ventanamicro.com>,
 anup <anup@brainfault.org>,
 palmer <palmer@rivosinc.com>,
 "jeeheng.sia" <jeeheng.sia@starfivetech.com>,
 "leyfoon.tan" <leyfoon.tan@starfivetech.com>,
 "mason.huo" <mason.huo@starfivetech.com>,
 "paul.walmsley" <paul.walmsley@sifive.com>,
 "conor.dooley" <conor.dooley@microchip.com>,
 guoren <guoren@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Message-Id: <38747287-B219-4B48-B088-A33ADC7954A0@jrtc27.com>
References: <tencent_7C3B580B47C1B17C16488EC1@qq.com>
 <CAHVXubjm5ax5KYTV_G=GUUH0KJK=v6_jO09XF1T4AzzUTr0CSg@mail.gmail.com>
 <ZH37WMnx/rYSRF/o@sunil-laptop>
To: Sunil V L <sunilvl@ventanamicro.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_144247_763916_2BC2FA3A 
X-CRM114-Status: GOOD (  29.80  )
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

T24gNSBKdW4gMjAyMywgYXQgMTY6MTIsIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8u
Y29tPiB3cm90ZToKPiAKPiBPbiBNb24sIEp1biAwNSwgMjAyMyBhdCAwNDoyNTowNlBNICswMjAw
LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+IEhpIFNvbmcsCj4+IAo+PiBPbiBNb24sIEp1biA1
LCAyMDIzIGF0IDEyOjUy4oCvUE0gU29uZyBTaHVhaSA8c29uZ3NodWFpc2h1YWlAdGlueWxhYi5v
cmc+IHdyb3RlOgo+Pj4gCj4+PiBEZXNjcmlwdGlvbiBvZiBwcm9ibGVtOgo+Pj4gCj4+PiBCb290
aW5nIExpbnV4IFdpdGggUmlzY1ZWaXJ0UWVtdSBlZGsyIGZpcm13YXJlLCBhIFN0b3JlL0FNTyBw
YWdlIGZhdWx0IHdhcyB0cmFwcGVkIHRvIHRyaWdnZXIgYSBrZXJuZWwgcGFuaWMuCj4+PiBUaGUg
ZW50aXJlIGxvZyBoYXMgYmVlbiBwb3N0ZWQgYXQgdGhpcyBsaW5rIDogaHR0cHM6Ly90ZXJtYmlu
LmNvbS9uZ2E0Lgo+Pj4gCj4+PiBZb3UgY2FuIHJlcHJvZHVjZSBpdCB3aXRoIHRoZSBmb2xsb3dp
bmcgc3RlcCA6Cj4+PiAKPj4+IDEuIHByZXBhcmUgdGhlIGVudmlyb25tZW50IHdpdGgKPj4+ICAg
LSBRZW11LXZpcnQ6ICB2OC4wLjAgKHdpdGggT3BlblNiaSB2MS4yKQo+Pj4gICAtIGVkazIgOiBh
dCBjb21taXQgKDJiYzg1NDU4ODMgIlVlZmlDcHVQa2cvQ3B1UGFnZVRhYmxlTGliOiBSZWR1Y2Ug
dGhlIG51bWJlciBvZiByYW5kb20gdGVzdHMiKQo+Pj4gICAtIExpbnV4IDogdjYuNC1yYzEgYW5k
IGxhdGVyIHZlcnNpb24KPj4+IAo+Pj4gMi4gc3RhcnQgdGhlIFFlbXUgdmlydCBib2FyZAo+Pj4g
Cj4+PiBgYGBzaAo+Pj4gJCBjYXQgfi84X3Jpc2N2L3N0YXJ0X2xhdGVzdC5zaAo+Pj4gIyEvYmlu
L2Jhc2gKPj4+IC9ob21lL3NvbmcvOF9yaXNjdi8zX2FjcGkvcWVtdS9vb28vdXNyL2xvY2FsL2Jp
bi9xZW11LXN5c3RlbS1yaXNjdjY0IFwKPj4+ICAgICAgICAtcyAtbm9ncmFwaGljIC1kcml2ZSBm
aWxlPS9ob21lL3NvbmcvOF9yaXNjdi8zX2FjcGkvQnVpbGRfdmlydC9SaXNjVlZpcnRRZW11L1JF
TEVBU0VfR0NDNS9GVi9SSVNDVl9WSVJULmZkLGlmPXBmbGFzaCxmb3JtYXQ9cmF3LHVuaXQ9MSBc
Cj4+PiAgICAgICAgLW1hY2hpbmUgdmlydCxhY3BpPW9mZiAtc21wIDIgLW0gMkcgXAo+Pj4gICAg
ICAgIC1rZXJuZWwgL2hvbWUvc29uZy85X2xpbnV4L2xpbnV4LzAwX3J2X2RlZi9hcmNoL3Jpc2N2
L2Jvb3QvSW1hZ2UgXAo+Pj4gICAgICAgIC1pbml0cmQgL2hvbWUvc29uZy84X3Jpc2N2LzNfYWNw
aS9idWlsZHJvb3Qvb3V0cHV0L2ltYWdlcy9yb290ZnMuZXh0MiBcCj4+PiAgICAgICAgLWFwcGVu
ZCAicm9vdD0vZGV2L3JhbSBybyBjb25zb2xlPXR0eVMwIGVhcmx5Y29uPXVhcnQ4MjUwLG1taW8s
MHgxMDAwMDAwMCBlZmk9ZGVidWcgbG9nbGV2ZWw9OCBtZW1ibG9jaz1kZWJ1ZyIgIyMgYWxzbyBw
YW5pYyBieSBtZW10ZXN0Cj4+PiBgYGAKPj4+IDMuIFRoZW4geW91IHdpbGwgZW5jb3VudGVyIHRo
ZSBrZXJuZWwgcGFuaWMgbG9nZ2VkIGluIHRoZSBhYm92ZSBsaW5rCj4+PiAKPj4+IE90aGVyIElu
Zm9ybWF0aW9uOgo+Pj4gCj4+PiAxLiAtLS0tLS0tCj4+PiAKPj4+IFRoaXMgcmVwb3J0IGlzIG5v
dCBpZGVudGljYWwgdG8gbXkgcHJpb3IgcmVwb3J0IC0tICJrZXJuZWwgcGFuaWNlZCB3aGVuIHN5
c3RlbSBoaWJlcm5hdGVzIiBbMV0sIGJ1dCBib3RoIG9mIHRoZW0KPj4+IGFyZSBjbG9zZWx5IHJl
bGF0ZWQgd2l0aCB0aGUgY29tbWl0ICgzMzM1MDY4Zjg3MjEgInJpc2N2OiBVc2UgUFVEL1A0RC9Q
R0QgcGFnZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyIpLgo+Pj4gCj4+PiBXaXRoIHRoaXMgY29t
bWl0LCBoaWJlcm5hdGlvbiBpcyB0cmFwcGVkIHdpdGggImFjY2VzcyBmYXVsdCIgd2hpbGUgYWNj
ZXNzaW5nIHRoZSBQTVAtcHJvdGVjdGVkIHJlZ2lvbnMgKG1tb2RlX3Jlc3YwQDgwMDAwMDAwKQo+
Pj4gZnJvbSBPcGVuU2JpIChCVFcsIGhpYmVybmF0aW9uIGlzIG1hcmtlZCBhcyBub25wb3J0YWJs
ZSBieSBDb25vclsyXSkuCj4+PiAKPj4+IEluIHRoaXMgcmVwb3J0LCBlZmlfaW5pdCBoYW5kb2Zm
cyB0aGUgbWVtb3J5IG1hcHBpbmcgZnJvbSBCb290IFNlcnZpY2VzIHRvIG1lbWJsb2NrIHdoZXJl
IHJlc2VydmVzIG1tb2RlX3Jlc3YwQDgwMDAwMDAwLAo+Pj4gc28gdGhlcmUgaXMgbm8gImFjY2Vz
cyBmYXVsdCIgYnV0ICJwYWdlIGZhdWx0Ii4KPj4+IAo+Pj4gQW5kIHJldmVydGluZyBjb21taXQg
MzMzNTA2OGY4NzIxIGluZGVlZCBmaXhlZCB0aGlzIHBhbmljLgo+Pj4gCj4+PiAyLiAtLS0tLS0t
Cj4+PiAKPj4+IEFzIHRoZSBnZGItcHQtZHVtcCBbM10gdG9vbCBzaG93cywgdGhlIFBURSB3aGlj
aCBjb3ZlcmVkIHRoZSBmYXVsdCB2aXJ0dWFsIGFkZHJlc3MgaGFkIHRoZSBhcHByb3ByaWF0ZSBw
ZXJtaXNzaW9uIHRvIHN0b3JlLgo+Pj4gSXMgdGhlcmUgYW5vdGhlciB3YXkgdG8gdHJpZ2dlciB0
aGUgIlN0b3JlL0FNTyBwYWdlIGZhdWx0Ij8gT3IgdGhlIGNyZWF0aW9uIG9mIGxpbmVhciBtYXBw
aW5nIGluIGNvbW1pdCAzMzM1MDY4Zjg3MjEgZGlkIHNvbWV0aGluZyB3cm9uZz8KPj4+IAo+Pj4g
YGBgCj4+PiAoZ2RiKSBwL3ggJHNhdHAKPj4+ICQxID0gMHhhMDAwMDAwMDAwMDgxNzA4Cj4+PiAo
Z2RiKSBwdCAtc2F0cCAweGEwMDAwMDAwMDAwODE3MDgKPj4+ICAgICAgICAgICAgIEFkZHJlc3Mg
OiAgICAgTGVuZ3RoICAgUGVybWlzc2lvbnMKPj4+ICAweGZmMWJmZmZmZmVhMzkwMDAgOiAgICAg
MHgxMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4+PiAgMHhmZjFiZmZmZmZlYmY5MDAwIDogICAgIDB4
MTAwMCB8IFc6MSBYOjAgUjoxIFM6MQo+Pj4gIDB4ZmYxYmZmZmZmZWMwMDAwMCA6ICAgMHg0MDAw
MDAgfCBXOjEgWDowIFI6MSBTOjEKPj4+ICAweGZmNjAwMDAwMDAwMDAwMDAgOiAgIDB4MWMwMDAw
IHwgVzoxIFg6MCBSOjEgUzoxCj4+PiAgMHhmZjYwMDAwMDAwMjAwMDAwIDogICAweGEwMDAwMCB8
IFc6MCBYOjAgUjoxIFM6MQo+Pj4gIDB4ZmY2MDAwMDAwMGMwMDAwMCA6IDB4N2YwMDAwMDAgfCBX
OjEgWDowIFI6MSBTOjEgIC8vIGJhZGFkZHI6IGZmNjAwMDAwN2ZkYjEwMDAKPj4+ICAweGZmNjAw
MDAwN2ZkYzAwMDAgOiAgICAweDNkMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4+PiAgMHhmZjYwMDAw
MDdmZmJmMDAwIDogICAgIDB4MTAwMCB8IFc6MSBYOjAgUjoxIFM6MQo+Pj4gIDB4ZmZmZmZmZmY4
MDAwMDAwMCA6ICAgMHhjMDAwMDAgfCBXOjAgWDoxIFI6MSBTOjEKPj4+ICAweGZmZmZmZmZmODBj
MDAwMDAgOiAgIDB4YTAwMDAwIHwgVzoxIFg6MCBSOjEgUzoxCj4+PiAKPj4+IGBgYAo+Pj4gCj4+
PiAzLiAtLS0tLS0KPj4+IAo+Pj4gWW91IGNhbiBhbHNvIHJlcHJvZHVjZSBzaW1pbGFyIHBhbmlj
IGJ5IGFwcGVuZGluZyAibWVtdGVzdCIgaW4ga2VybmVsIGNtZGxpbmUuCj4+PiBJIGhhdmUgcG9z
dGVkIHRoZSBtZW10ZXN0IGJvb3QgbG9nIGF0IHRoaXMgbGluazogaHR0cHM6Ly90ZXJtYmluLmNv
bS8xdHdsLgo+Pj4gCj4+PiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJJ20gd3JvbmcuCj4+PiAKPj4+
IFsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvQ0FBWXMyPWdRdmtoVGVp
b01tcVJEVkdqZHRORl92aEIrdm1fMWRISnhQTmk3NVlEUV9RQG1haWwuZ21haWwuY29tLwo+Pj4g
WzJdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDUyNi1hc3RyaWRl
LWRldG9uYXRvci05YWUxMjAwNTExNTlAd2VuZHkvCj4+PiBbM106IGh0dHBzOi8vZ2l0aHViLmNv
bS9tYXJ0aW5yYWRldi9nZGItcHQtZHVtcAo+PiAKPj4gVGhhbmtzIGZvciB0aGUgdGhvcm91Z2gg
cmVwb3J0LCByZWFsbHkgYXBwcmVjaWF0ZWQuCj4+IAo+PiBTbyB0aGVyZSBhcmUgbXVsdGlwbGUg
aXNzdWVzIGhlcmU6Cj4+IAo+PiAtIHRoZSBmaXJzdCBvbmUgaXMgdGhhdCB0aGUgbWVtb3J5IHJl
Z2lvbiBmb3Igb3BlbnNiaSBpcyBtYXJrZWQgYXMgbm90Cj4+IGNhY2hlYWJsZSBpbiB0aGUgZWZp
IG1lbW9yeSBtYXAsIGFuZCB0aGVuIHRoaXMgcmVnaW9uIGlzIG5vdCBtYXBwZWQgaW4KPj4gdGhl
IGxpbmVhciBtYXBwaW5nOgo+PiBbICAgIDAuMDAwMDAwXSBlZmk6ICAgMHgwMDAwODAwMDAwMDAt
MHgwMDAwODAwM2ZmZmYgW1Jlc2VydmVkICAgIHwgICB8Cj4+IHwgIHwgIHwgIHwgIHwgIHwgIHwg
IHwgICB8ICB8ICB8ICB8VUNdCj4+IAo+PiAtIHRoZSBzZWNvbmQgb25lICh0aGF0IEkgZmVlbCBh
IGJpdCBhc2hhbWVkIG9mLi4uKSBpcyB0aGF0IEkgZGlkIG5vdAo+PiBjaGVjayB0aGUgYWxpZ25t
ZW50IG9mIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgd2hlbiBjaG9vc2luZyB0aGUgbWFwIHNpemUKPj4g
aW4gYmVzdF9tYXBfc2l6ZSgpIGFuZCB0aGVuIHdlIGVuZCB1cCB0cnlpbmcgdG8gbWFwIGEgcGh5
c2ljYWwgcmVnaW9uCj4+IGFsaWduZWQgb24gMk1CIHRoYXQgaXMgYWN0dWFsbHkgbm90IGFsaWdu
ZWQgb24gMk1CIHZpcnR1YWxseSBiZWNhdXNlCj4+IHRoZSBvcGVuc2JpIHJlZ2lvbiBpcyBub3Qg
bWFwcGVkIGF0IGFsbC4KPj4gCj4+IC0gdGhlIHBvc3NpYmxlIHRoaXJkIG9uZSBpcyB0aGF0IHdl
IHNob3VsZCBub3QgbWFwIHRoZSBsaW5lYXIgbWFwcGluZwo+PiB1c2luZyA0SyBwYWdlcywgdGhp
cyB3b3VsZCBiZSBzbG93IGluIG15IG9waW5pb24sIGFuZCBJIHRoaW5rIHdlCj4+IHNob3VsZCB3
YXN0ZSBhIGJpdCBvZiBtZW1vcnkgdG8gYWxpZ24gdmEgYW5kIHBhIG9uIGEgMk1CIGJvdW5kYXJ5
Lgo+PiAKPj4gU28gSSdsbCBmaXggdGhlIHNlY29uZCBpc3N1ZSwgYW5kIHBvc3NpYmx5IHRoZSB0
aGlyZCBvbmUsIGFuZCBpZiBubwo+PiBvbmUgbG9va3MgaW50byB3aHkgdGhlIG9wZW5zYmkgcmVn
aW9uIGlzIG1hcHBlZCBpbiBVQywgSSdsbCB0YWtlIGEKPj4gbG9vayBhdCBlZGsyLgo+PiAKPiBI
aSBBbGV4LAo+IAo+IEVESzIgbWFya3Mgb3BlbnNiaSByYW5nZSBhcyByZXNlcnZlZCBtZW1vcnkg
aW4gRUZJIG1hcC4gQWNjb3JkaW5nIHRvIERUCj4gc3BlYywgaWYgdGhlIG5vLW1hcCBpcyBub3Qg
c2V0LCB3ZSBuZWVkIHRvIG1hcmsgaXQgYXMKPiBFZmlCb290U2VydmljZXNEYXRhIGJ1dCBFZmlC
b290U2VydmljZXNEYXRhIGlzIGFjdHVhbGx5IGNvbnNpZGVyZWQgYXMKPiBmcmVlIG1lbW9yeSBp
biBrZXJuZWwsIGFzIHBlciBVRUZJIHNwZWMuIFRvIGF2b2lkIGtlcm5lbCB1c2luZyB0aGlzCj4g
bWVtb3J5LCB3ZSBkZXZpYXRlZCBmcm9tIHRoZSBEVCBzcGVjIGZvciBvcGVuc2JpIHJhbmdlcy4K
ClZpb2xhdGluZyBzcGVjcyBpcyBuZXZlciB0aGUgYW5zd2VyLiBEbyBvbmUgb2Y6CgoxLiBVc2Ug
bm8tbWFwIGFuZCB0YWtlIHRoZSBwZXJmb3JtYW5jZSBoaXQKMi4gRXhjbHVkZSB0aGUgbWVtb3J5
IHJhbmdlIGZyb20gL21lbW9yeSBpdHNlbGYKMy4gQ29tZSB1cCB3aXRoIGEgbmV3IG5vLWFjY2Vz
cyBwcm9wZXJ0eSB0aGF04oCZcyBhIHdlYWtlciBuby1tYXAKICAgKGkuZS4gdGhhdCBhbGxvd3Mg
bWFwcGluZyBhbmQgc3BlY3VsYXRpdmUgYWNjZXNzKSBhbmQgdXNlcwogICBFZmlSdW50aW1lU2Vy
dmljZXNEYXRhIGluIEVGSSBsYW5kCgoyIGZlZWxzIG1vc3Qgbm9ybWFsIHRvIG1lLCBwZXJzb25h
bGx5LCBidXQgYWxsIGFyZSBmaW5lLgoKSmVzcwoKPiBMZXQgbWUga25vdyB5b3VyIHRob3VnaHRz
IGhvdyB3ZSBjYW4gaGFuZGxlIHRoaXMgYmV0dGVyIGluIEVESzIKPiBjb25zaWRlcmluZyBpdCBo
YXMgdG8gc3VwcG9ydCBBQ1BJIGFsc28uCj4gCj4gVGhhbmtzLAo+IFN1bmlsCj4gCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
