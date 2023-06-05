Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62ED2C77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SGxore4tFwGy+yiYNu6CT+jchdEpYDEWZuMv0fKjhLg=; b=0OIpyhfbMgvBny
	Nsxo+mZ/6EpcN4a10WZIB/xyoOU1aP/DBCH4xNLUET4A5rwd/DdFv4KM7QDUUD7/VLa8txAYBqjcr
	Li0Ujp401RJ81VpUwkLaFKrlqKf7PugmR1YL0KMK6OVYVJ4Y8ksSNfBHnGJPVIXOAI/53JYL2+lg8
	jIUuZhzzQulbIPkWx2z4hZuD7AexUQBDd8K2M6nis3GbGAdi9xCZCL3qk7shcvCs304Ko/GClAHgF
	thZ4SOLtNucy75QijjKiZKVgqLl95vXQqVTT1SsUyYfIMf++cb/t+ROcOr6zMUm9Awq0ndMc84Qy/
	4OhGGQzLRqSgp13O85Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6B97-00FmRG-2n;
	Mon, 05 Jun 2023 14:25:21 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6B94-00FmQQ-1Q
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 14:25:20 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f7e7fc9fe6so2334255e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 07:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685975117; x=1688567117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxY/DFb0Xc65/sIk33eQ5kU5e3RFqDt3i4PU+gIaqZo=;
        b=RWxQCw+404bQg7ZrNY8wzn/xkbMoQbmONRI/WtuGQ9FU7P5BqYhK2dtbgOaqKZePn2
         UHo+FNU1SFKy5CCg9HpHoVKm7V1Yal/OVU46R2nAoM6QDllKrzeSAcUBQnhiZlqT2JXi
         BfPHa2U9aJ6z7bJEPZM9MEocy2ixUrbr206NvykYVPt8dCflixenhUbtk/MAbzNgOmwU
         nYrFUtD59USCl3H1/d5Ly+nreoJ2gKnarOuXMOQrao7FndovWlnfR/JZjXqwe6GBQMfy
         LCailM5r+s9EsUqGUFi3a9o+WpWZZTILTT02wUUvSljYAXN+heMi1JQdZFhk1M5xU7x+
         mQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685975117; x=1688567117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxY/DFb0Xc65/sIk33eQ5kU5e3RFqDt3i4PU+gIaqZo=;
        b=MOuy8MHvkZAY/gIwuUaEF2Qk1OAaijbKiIqDdDpXSdc0VzgxNjjtym1ynRhhNw+d/Z
         ArCQU5QTlQP3h/O0ijPKY6PMTHlyo7w3RsMZo66jkqNUq27kf7R3I2UVfHNiiwOWTOEp
         JeTq4G/GGj1XK6TQU3ngodauAdpMFRpXKgLUOP6JsGXZ3lF3GJyKsHQwHt8zR9ZgjSOt
         mMFNOJAgnq76xzyEZLp7yFFn7pzWjZkI06d+UdgIroytOEEJvcOEDQL+iY1+efgZbXkq
         FXpQr5s902CTaPvksvUBptBRewDfgL7gwWuMxXZKDZEljNVomvwjheLjy3V9+56rTv4w
         J5jw==
X-Gm-Message-State: AC+VfDz+ZlI4WCScF6ic5AUn735/SzbRZ/jQ72fsrkeGe+I2czrUkszI
	32IqPWqJ9dIkee8C1nEnChaR9E+06Y6DReOSNRPYeQ==
X-Google-Smtp-Source: ACHHUZ4/jLLozMZcxY703u73KSSPom54Lxv5yGos/FWpptJObFYaZBtT26FgQxTHny6dITyO2JpBUqYyf/wNplMzIM4=
X-Received: by 2002:a7b:cbc9:0:b0:3f6:76e:604b with SMTP id
 n9-20020a7bcbc9000000b003f6076e604bmr8031855wmi.0.1685975116855; Mon, 05 Jun
 2023 07:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_7C3B580B47C1B17C16488EC1@qq.com>
In-Reply-To: <tencent_7C3B580B47C1B17C16488EC1@qq.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 5 Jun 2023 16:25:06 +0200
Message-ID: <CAHVXubjm5ax5KYTV_G=GUUH0KJK=v6_jO09XF1T4AzzUTr0CSg@mail.gmail.com>
Subject: Re: Bug report: kernel paniced while booting
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: robh <robh@kernel.org>, ajones <ajones@ventanamicro.com>, anup <anup@brainfault.org>, 
	palmer <palmer@rivosinc.com>, "jeeheng.sia" <jeeheng.sia@starfivetech.com>, 
	"leyfoon.tan" <leyfoon.tan@starfivetech.com>, "mason.huo" <mason.huo@starfivetech.com>, 
	"paul.walmsley" <paul.walmsley@sifive.com>, "conor.dooley" <conor.dooley@microchip.com>, 
	guoren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_072518_481038_7650F6A5 
X-CRM114-Status: GOOD (  25.87  )
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

SGkgU29uZywKCk9uIE1vbiwgSnVuIDUsIDIwMjMgYXQgMTI6NTLigK9QTSBTb25nIFNodWFpIDxz
b25nc2h1YWlzaHVhaUB0aW55bGFiLm9yZz4gd3JvdGU6Cj4KPiBEZXNjcmlwdGlvbiBvZiBwcm9i
bGVtOgo+Cj4gQm9vdGluZyBMaW51eCBXaXRoIFJpc2NWVmlydFFlbXUgZWRrMiBmaXJtd2FyZSwg
YSBTdG9yZS9BTU8gcGFnZSBmYXVsdCB3YXMgdHJhcHBlZCB0byB0cmlnZ2VyIGEga2VybmVsIHBh
bmljLgo+IFRoZSBlbnRpcmUgbG9nIGhhcyBiZWVuIHBvc3RlZCBhdCB0aGlzIGxpbmsgOiBodHRw
czovL3Rlcm1iaW4uY29tL25nYTQuCj4KPiBZb3UgY2FuIHJlcHJvZHVjZSBpdCB3aXRoIHRoZSBm
b2xsb3dpbmcgc3RlcCA6Cj4KPiAxLiBwcmVwYXJlIHRoZSBlbnZpcm9ubWVudCB3aXRoCj4gICAg
LSBRZW11LXZpcnQ6ICB2OC4wLjAgKHdpdGggT3BlblNiaSB2MS4yKQo+ICAgIC0gZWRrMiA6IGF0
IGNvbW1pdCAoMmJjODU0NTg4MyAiVWVmaUNwdVBrZy9DcHVQYWdlVGFibGVMaWI6IFJlZHVjZSB0
aGUgbnVtYmVyIG9mIHJhbmRvbSB0ZXN0cyIpCj4gICAgLSBMaW51eCA6IHY2LjQtcmMxIGFuZCBs
YXRlciB2ZXJzaW9uCj4KPiAyLiBzdGFydCB0aGUgUWVtdSB2aXJ0IGJvYXJkCj4KPiBgYGBzaAo+
ICQgY2F0IH4vOF9yaXNjdi9zdGFydF9sYXRlc3Quc2gKPiAjIS9iaW4vYmFzaAo+IC9ob21lL3Nv
bmcvOF9yaXNjdi8zX2FjcGkvcWVtdS9vb28vdXNyL2xvY2FsL2Jpbi9xZW11LXN5c3RlbS1yaXNj
djY0IFwKPiAgICAgICAgIC1zIC1ub2dyYXBoaWMgLWRyaXZlIGZpbGU9L2hvbWUvc29uZy84X3Jp
c2N2LzNfYWNwaS9CdWlsZF92aXJ0L1Jpc2NWVmlydFFlbXUvUkVMRUFTRV9HQ0M1L0ZWL1JJU0NW
X1ZJUlQuZmQsaWY9cGZsYXNoLGZvcm1hdD1yYXcsdW5pdD0xIFwKPiAgICAgICAgIC1tYWNoaW5l
IHZpcnQsYWNwaT1vZmYgLXNtcCAyIC1tIDJHIFwKPiAgICAgICAgIC1rZXJuZWwgL2hvbWUvc29u
Zy85X2xpbnV4L2xpbnV4LzAwX3J2X2RlZi9hcmNoL3Jpc2N2L2Jvb3QvSW1hZ2UgXAo+ICAgICAg
ICAgLWluaXRyZCAvaG9tZS9zb25nLzhfcmlzY3YvM19hY3BpL2J1aWxkcm9vdC9vdXRwdXQvaW1h
Z2VzL3Jvb3Rmcy5leHQyIFwKPiAgICAgICAgIC1hcHBlbmQgInJvb3Q9L2Rldi9yYW0gcm8gY29u
c29sZT10dHlTMCBlYXJseWNvbj11YXJ0ODI1MCxtbWlvLDB4MTAwMDAwMDAgZWZpPWRlYnVnIGxv
Z2xldmVsPTggbWVtYmxvY2s9ZGVidWciICMjIGFsc28gcGFuaWMgYnkgbWVtdGVzdAo+IGBgYAo+
IDMuIFRoZW4geW91IHdpbGwgZW5jb3VudGVyIHRoZSBrZXJuZWwgcGFuaWMgbG9nZ2VkIGluIHRo
ZSBhYm92ZSBsaW5rCj4KPiBPdGhlciBJbmZvcm1hdGlvbjoKPgo+IDEuIC0tLS0tLS0KPgo+IFRo
aXMgcmVwb3J0IGlzIG5vdCBpZGVudGljYWwgdG8gbXkgcHJpb3IgcmVwb3J0IC0tICJrZXJuZWwg
cGFuaWNlZCB3aGVuIHN5c3RlbSBoaWJlcm5hdGVzIiBbMV0sIGJ1dCBib3RoIG9mIHRoZW0KPiBh
cmUgY2xvc2VseSByZWxhdGVkIHdpdGggdGhlIGNvbW1pdCAoMzMzNTA2OGY4NzIxICJyaXNjdjog
VXNlIFBVRC9QNEQvUEdEIHBhZ2VzIGZvciB0aGUgbGluZWFyIG1hcHBpbmciKS4KPgo+IFdpdGgg
dGhpcyBjb21taXQsIGhpYmVybmF0aW9uIGlzIHRyYXBwZWQgd2l0aCAiYWNjZXNzIGZhdWx0IiB3
aGlsZSBhY2Nlc3NpbmcgdGhlIFBNUC1wcm90ZWN0ZWQgcmVnaW9ucyAobW1vZGVfcmVzdjBAODAw
MDAwMDApCj4gZnJvbSBPcGVuU2JpIChCVFcsIGhpYmVybmF0aW9uIGlzIG1hcmtlZCBhcyBub25w
b3J0YWJsZSBieSBDb25vclsyXSkuCj4KPiBJbiB0aGlzIHJlcG9ydCwgZWZpX2luaXQgaGFuZG9m
ZnMgdGhlIG1lbW9yeSBtYXBwaW5nIGZyb20gQm9vdCBTZXJ2aWNlcyB0byBtZW1ibG9jayB3aGVy
ZSByZXNlcnZlcyBtbW9kZV9yZXN2MEA4MDAwMDAwMCwKPiBzbyB0aGVyZSBpcyBubyAiYWNjZXNz
IGZhdWx0IiBidXQgInBhZ2UgZmF1bHQiLgo+Cj4gQW5kIHJldmVydGluZyBjb21taXQgMzMzNTA2
OGY4NzIxIGluZGVlZCBmaXhlZCB0aGlzIHBhbmljLgo+Cj4gMi4gLS0tLS0tLQo+Cj4gQXMgdGhl
IGdkYi1wdC1kdW1wIFszXSB0b29sIHNob3dzLCB0aGUgUFRFIHdoaWNoIGNvdmVyZWQgdGhlIGZh
dWx0IHZpcnR1YWwgYWRkcmVzcyBoYWQgdGhlIGFwcHJvcHJpYXRlIHBlcm1pc3Npb24gdG8gc3Rv
cmUuCj4gSXMgdGhlcmUgYW5vdGhlciB3YXkgdG8gdHJpZ2dlciB0aGUgIlN0b3JlL0FNTyBwYWdl
IGZhdWx0Ij8gT3IgdGhlIGNyZWF0aW9uIG9mIGxpbmVhciBtYXBwaW5nIGluIGNvbW1pdCAzMzM1
MDY4Zjg3MjEgZGlkIHNvbWV0aGluZyB3cm9uZz8KPgo+IGBgYAo+IChnZGIpIHAveCAkc2F0cAo+
ICQxID0gMHhhMDAwMDAwMDAwMDgxNzA4Cj4gKGdkYikgcHQgLXNhdHAgMHhhMDAwMDAwMDAwMDgx
NzA4Cj4gICAgICAgICAgICAgIEFkZHJlc3MgOiAgICAgTGVuZ3RoICAgUGVybWlzc2lvbnMKPiAg
IDB4ZmYxYmZmZmZmZWEzOTAwMCA6ICAgICAweDEwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiAgIDB4
ZmYxYmZmZmZmZWJmOTAwMCA6ICAgICAweDEwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiAgIDB4ZmYx
YmZmZmZmZWMwMDAwMCA6ICAgMHg0MDAwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiAgIDB4ZmY2MDAw
MDAwMDAwMDAwMCA6ICAgMHgxYzAwMDAgfCBXOjEgWDowIFI6MSBTOjEKPiAgIDB4ZmY2MDAwMDAw
MDIwMDAwMCA6ICAgMHhhMDAwMDAgfCBXOjAgWDowIFI6MSBTOjEKPiAgIDB4ZmY2MDAwMDAwMGMw
MDAwMCA6IDB4N2YwMDAwMDAgfCBXOjEgWDowIFI6MSBTOjEgIC8vIGJhZGFkZHI6IGZmNjAwMDAw
N2ZkYjEwMDAKPiAgIDB4ZmY2MDAwMDA3ZmRjMDAwMCA6ICAgIDB4M2QwMDAgfCBXOjEgWDowIFI6
MSBTOjEKPiAgIDB4ZmY2MDAwMDA3ZmZiZjAwMCA6ICAgICAweDEwMDAgfCBXOjEgWDowIFI6MSBT
OjEKPiAgIDB4ZmZmZmZmZmY4MDAwMDAwMCA6ICAgMHhjMDAwMDAgfCBXOjAgWDoxIFI6MSBTOjEK
PiAgIDB4ZmZmZmZmZmY4MGMwMDAwMCA6ICAgMHhhMDAwMDAgfCBXOjEgWDowIFI6MSBTOjEKPgo+
IGBgYAo+Cj4gMy4gLS0tLS0tCj4KPiBZb3UgY2FuIGFsc28gcmVwcm9kdWNlIHNpbWlsYXIgcGFu
aWMgYnkgYXBwZW5kaW5nICJtZW10ZXN0IiBpbiBrZXJuZWwgY21kbGluZS4KPiBJIGhhdmUgcG9z
dGVkIHRoZSBtZW10ZXN0IGJvb3QgbG9nIGF0IHRoaXMgbGluazogaHR0cHM6Ly90ZXJtYmluLmNv
bS8xdHdsLgo+Cj4gUGxlYXNlIGNvcnJlY3QgbWUgaWYgSSdtIHdyb25nLgo+Cj4gWzFdOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9DQUFZczI9Z1F2a2hUZWlvTW1xUkRWR2pk
dE5GX3ZoQit2bV8xZEhKeFBOaTc1WURRX1FAbWFpbC5nbWFpbC5jb20vCj4gWzJdOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIzMDUyNi1hc3RyaWRlLWRldG9uYXRvci05
YWUxMjAwNTExNTlAd2VuZHkvCj4gWzNdOiBodHRwczovL2dpdGh1Yi5jb20vbWFydGlucmFkZXYv
Z2RiLXB0LWR1bXAKClRoYW5rcyBmb3IgdGhlIHRob3JvdWdoIHJlcG9ydCwgcmVhbGx5IGFwcHJl
Y2lhdGVkLgoKU28gdGhlcmUgYXJlIG11bHRpcGxlIGlzc3VlcyBoZXJlOgoKLSB0aGUgZmlyc3Qg
b25lIGlzIHRoYXQgdGhlIG1lbW9yeSByZWdpb24gZm9yIG9wZW5zYmkgaXMgbWFya2VkIGFzIG5v
dApjYWNoZWFibGUgaW4gdGhlIGVmaSBtZW1vcnkgbWFwLCBhbmQgdGhlbiB0aGlzIHJlZ2lvbiBp
cyBub3QgbWFwcGVkIGluCnRoZSBsaW5lYXIgbWFwcGluZzoKWyAgICAwLjAwMDAwMF0gZWZpOiAg
IDB4MDAwMDgwMDAwMDAwLTB4MDAwMDgwMDNmZmZmIFtSZXNlcnZlZCAgICB8ICAgfAogfCAgfCAg
fCAgfCAgfCAgfCAgfCAgfCAgIHwgIHwgIHwgIHxVQ10KCi0gdGhlIHNlY29uZCBvbmUgKHRoYXQg
SSBmZWVsIGEgYml0IGFzaGFtZWQgb2YuLi4pIGlzIHRoYXQgSSBkaWQgbm90CmNoZWNrIHRoZSBh
bGlnbm1lbnQgb2YgdGhlIHZpcnR1YWwgYWRkcmVzcyB3aGVuIGNob29zaW5nIHRoZSBtYXAgc2l6
ZQppbiBiZXN0X21hcF9zaXplKCkgYW5kIHRoZW4gd2UgZW5kIHVwIHRyeWluZyB0byBtYXAgYSBw
aHlzaWNhbCByZWdpb24KYWxpZ25lZCBvbiAyTUIgdGhhdCBpcyBhY3R1YWxseSBub3QgYWxpZ25l
ZCBvbiAyTUIgdmlydHVhbGx5IGJlY2F1c2UKdGhlIG9wZW5zYmkgcmVnaW9uIGlzIG5vdCBtYXBw
ZWQgYXQgYWxsLgoKLSB0aGUgcG9zc2libGUgdGhpcmQgb25lIGlzIHRoYXQgd2Ugc2hvdWxkIG5v
dCBtYXAgdGhlIGxpbmVhciBtYXBwaW5nCnVzaW5nIDRLIHBhZ2VzLCB0aGlzIHdvdWxkIGJlIHNs
b3cgaW4gbXkgb3BpbmlvbiwgYW5kIEkgdGhpbmsgd2UKc2hvdWxkIHdhc3RlIGEgYml0IG9mIG1l
bW9yeSB0byBhbGlnbiB2YSBhbmQgcGEgb24gYSAyTUIgYm91bmRhcnkuCgpTbyBJJ2xsIGZpeCB0
aGUgc2Vjb25kIGlzc3VlLCBhbmQgcG9zc2libHkgdGhlIHRoaXJkIG9uZSwgYW5kIGlmIG5vCm9u
ZSBsb29rcyBpbnRvIHdoeSB0aGUgb3BlbnNiaSByZWdpb24gaXMgbWFwcGVkIGluIFVDLCBJJ2xs
IHRha2UgYQpsb29rIGF0IGVkazIuCgpTb3JyeSBmb3IgdGhhdCwKCkFsZXgKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
