Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD9AEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uD1jzhH4rU9zn4/xzIsc2yS7Q5qF06HFb//bfQnVEro=; b=S9ziuiCwMTL018
	XxWb/eXTWRZ0HWkGszMrjd/OWpGxUHpNGcHrwMU7lnSNqUKoIfmStG565uEKjy23t755Pv4Yg7PNl
	sZoy3pi45k3eYnQfCCpg7NgP3pXKliZVFgEkG9gzJ6N02pUIihG4vPyJBa+zk08xtpqLXi/LpaAWw
	cSAF+oT0YHbLrSKHzoOYEkt17SQjjhNirgKArROeQ0Xv9NEQ70fSPN6p3FxBvINsgPscQzCjIYkmC
	VSCszjHxPKBUrTr+ciHE5zw7IIJ3XO5IbEATLiPxJG6njmLt/NwB00Iz+NPmg6SZs++uwPhGIUBlF
	BSV+2CTQPUY+VxPQ/SKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkYn-00DBML-0C;
	Fri, 21 Jul 2023 07:28:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkYi-00DBK7-0G
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:28:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 3FD3C24DD54;
	Fri, 21 Jul 2023 15:27:38 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 15:27:36 +0800
Received: from [192.168.120.43] (171.223.208.138) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Jul
 2023 15:27:34 +0800
Message-ID: <ce3e0ffb-abcd-2392-8767-db460bce4b4b@starfivetech.com>
Date: Fri, 21 Jul 2023 15:27:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/2] Add ethernet nodes for StarFive JH7110 SoC
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <netdev@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jose Abreu
	<joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>, Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230714104521.18751-1-samin.guo@starfivetech.com>
 <20230720-cardstock-annoying-27b3b19e980a@spud>
 <42beaf41-947e-f585-5ec1-f1710830e556@starfivetech.com>
 <A0012BE7-8947-49C8-8697-1F879EE7B0B7@kernel.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <A0012BE7-8947-49C8-8697-1F879EE7B0B7@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_002817_723499_21EED018 
X-CRM114-Status: GOOD (  14.86  )
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

CgotLS0tLS0tLSDljp/lp4vkv6Hmga8gLS0tLS0tLS0K5Li76aKYOiBSZTogW1BBVENIIHYxIDAv
Ml0gQWRkIGV0aGVybmV0IG5vZGVzIGZvciBTdGFyRml2ZSBKSDcxMTAgU29DCkZyb206IENvbm9y
IERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4K5pS25Lu25Lq6OiBHdW8gU2FtaW4gPHNhbWluLmd1
b0BzdGFyZml2ZXRlY2guY29tPiwgUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4sIEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz4sIFBh
dWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNvbT4sIFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAZGFiYmVsdC5jb20+LCBBbGJlcnQgT3UgPGFvdUBlZWNzLmJlcmtlbGV5LmVkdT4sIEhh
bCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29tPiwgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZywgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZywgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcK5pel5pyfOiAyMDIzLzcvMjEKCj4g
Cj4gCj4gT24gMjEgSnVseSAyMDIzIDAzOjA5OjE5IElTVCwgR3VvIFNhbWluIDxzYW1pbi5ndW9A
c3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+IC0tLS0tLS0tIOWOn+Wni+S/oeaBryAt
LS0tLS0tLQo+PiDkuLvpopg6IFJlOiBbUEFUQ0ggdjEgMC8yXSBBZGQgZXRoZXJuZXQgbm9kZXMg
Zm9yIFN0YXJGaXZlIEpINzExMCBTb0MKPj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vckBrZXJu
ZWwub3JnPgo+PiDmlLbku7bkuro6IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4sIFJv
YiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+LCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5
c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+LCBQYXVsIFdhbG1zbGV5IDxwYXVsLndhbG1z
bGV5QHNpZml2ZS5jb20+LCBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPiwgQWxi
ZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+LCBIYWwgRmVuZyA8aGFsLmZlbmdAc3RhcmZp
dmV0ZWNoLmNvbT4sIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcsIGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBuZXRkZXZAdmdl
ci5rZXJuZWwub3JnLCBTYW1pbiBHdW8gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPgo+PiDm
l6XmnJ86IDIwMjMvNy8yMQo+Pgo+Pj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4KPj4+Cj4+PiBPbiBGcmksIDE0IEp1bCAyMDIzIDE4OjQ1OjE5ICswODAw
LCBTYW1pbiBHdW8gd3JvdGU6Cj4+Pj4gVGhpcyBzZXJpZXMgYWRkcyBldGhlcm5ldCBub2RlcyBm
b3IgU3RhckZpdmUgSkg3MTEwIFJJU0MtViBTb0MsCj4+Pj4gYW5kIGhhcyBiZWVuIHRlc3RlZCBv
biBTdGFyRml2ZSBWaXNpb25GaXZlLTIgdjEuMkEgYW5kIHYxLjNCIFNCQyBib2FyZHMuCj4+Pj4K
Pj4+PiBUaGUgZmlyc3QgcGF0Y2ggYWRkcyBldGhlcm5ldCBub2RlcyBmb3Igamg3MTEwIFNvQywg
dGhlIHNlY29uZCBwYXRjaAo+Pj4+IGFkZHMgZXRoZXJuZXQgbm9kZXMgZm9yIHZpc2lvbmZpdmUg
MiBTQkNzLgo+Pj4+Cj4+Pj4gVGhpcyBzZXJpZXMgcmVsaWVzIG9uIHhpbmd5dSdzIHN5c2NvbiBw
YXRjaFsxXS4KPj4+PiBGb3IgbW9yZSBpbmZvcm1hdGlvbiBhbmQgc3VwcG9ydCwgeW91IGNhbiB2
aXNpdCBSVnNwYWNlIHdpa2lbMl0uCj4+Pj4KPj4+PiBbLi4uXQo+Pj4KPj4+IEFwcGxpZWQgdG8g
cmlzY3YtZHQtZm9yLW5leHQsIHRoYW5rcyEKPj4+Cj4+PiBbMS8yXSByaXNjdjogZHRzOiBzdGFy
Zml2ZTogamg3MTEwOiBBZGQgZXRoZXJuZXQgZGV2aWNlIG5vZGVzCj4+PiAgICAgICBodHRwczov
L2dpdC5rZXJuZWwub3JnL2Nvbm9yL2MvMWZmMTY2Yzk3OTcyCj4+PiBbMi8yXSByaXNjdjogZHRz
OiBzdGFyZml2ZTogdmlzaW9uZml2ZSAyOiBBZGQgY29uZmlndXJhdGlvbiBvZiBnbWFjIGFuZCBw
aHkKPj4+ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3IvYy9iMTVhNzNjMzU4ZDEK
Pj4+Cj4+PiBUaGFua3MsCj4+PiBDb25vci4KPj4KPj4KPj4gSGkgQ29ub3LvvIwKPj4KPj4gVGhh
bmsgeW91IHNvIG11Y2jvvIEgCj4+Cj4+IFRoZXJlIGlzIGEgcXVlc3Rpb24gYWJvdXQgdGhlIGNv
bmZpZ3VyYXRpb24gb2YgcGh5IHRoYXQgSSB3b3VsZCBsaWtlIHRvIGNvbnN1bHQgeW91Lgo+Pgo+
PiBMYXRlc3Qgb24gbW90b3Jjb21tIFBIWSBWNVsxXTogRm9sbG93IFJvYiBIZXJyaW5nJ3MgYWR2
aWNlCj4+IG1vdG9yY29tbSxyeC14eHgtZHJpdmVyLXN0cmVuZ3RoIENoYW5nZWQgdG8gbW90b3Jj
b21tLHJ4LXh4eC1kcnYtbWljcm9hbXAgLgo+PiBWNSBoYXMgYWxyZWFkeSByZWNlaXZlZCBhIHJl
dmlld2VkLWJ5IGZyb20gQW5kcmV3IEx1bm4sIGFuZCBpdCBzaG91bGQgbm90IGNoYW5nZSBhZ2Fp
bi4KPj4KPj4gU2hvdWxkIEkgc3VibWl0IGFub3RoZXIgcGFjdGhlcyBiYXNlZCBvbiByaXNjdi1k
dC1mb3ItbmV4dD8gCj4gCj4gSHVoLCBkdGJzX2NoZWNrIHBhc3NlZCBmb3IgdGhlc2UgcGF0Y2hl
cywKPiBJIGRpZG4ndCByZWFsaXNlIGNoYW5nZXMgdG8gdGhlIG1vdG9yY29tbSBzdHVmZgo+IHdl
cmUgYSBkZXAuIGZvciB0aGlzLiBJJ2xsIHRha2UgYSBsb29rIGxhdGVyLgo+CkhpIENvbm9yLAoK
VGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gZm9sbG93IHRoaXMuCgpBZnRlciBkaXNjdXNz
aW5nIHdpdGggSEFMLCBJIGhhdmUgcHJlcGFyZWQgdGhlIGNvZGUgYW5kIGNvbnNpZGVyZWQgYWRk
aW5nIHRoZSBmb2xsb3dpbmcgcGF0Y2ggdG8gCk1vdG9yY29tbSdzIHBhdGNoc2V0ZXMgdjYuIChU
byBmaXggc29tZSBzcGVsbGluZyBlcnJvcnMgaW4gdjVbMV0pCndoaWNoIHdpbGwgdGhlbiBzZW5k
IHBhdGNoZXMgYmFzZWQgb24gbGludXgtbmV4dC4gV2hhdCBkbyB5b3UgdGhpbms/IEBBbmRyZXcg
QENvbm9yCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L25ldGRldmJw
Zi9jb3Zlci8yMDIzMDcyMDExMTUwOS4yMTg0My0xLXNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29t
CgoKCi0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZp
c2lvbmZpdmUtMi12MS4zYi5kdHMKKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLXYxLjNiLmR0cwpAQCAtMjgsOCArMjgsOCBAQAog
ICAgICAgIG1vdG9yY29tbSx0eC1jbGstYWRqLWVuYWJsZWQ7CiAgICAgICAgbW90b3Jjb21tLHR4
LWNsay0xMDAtaW52ZXJ0ZWQ7CiAgICAgICAgbW90b3Jjb21tLHR4LWNsay0xMDAwLWludmVydGVk
OwotICAgICAgIG1vdG9yY29tbSxyeC1jbGstZHJpdmVyLXN0cmVuZ3RoID0gPDM5NzA+OwotICAg
ICAgIG1vdG9yY29tbSxyeC1kYXRhLWRyaXZlci1zdHJlbmd0aCA9IDwyOTEwPjsKKyAgICAgICBt
b3RvcmNvbW0scngtY2xrLWRydi1taWNyb2FtcCA9IDwzOTcwPjsKKyAgICAgICBtb3RvcmNvbW0s
cngtZGF0YS1kcnYtbWljcm9hbXAgPSA8MjkxMD47CiAgICAgICAgcngtaW50ZXJuYWwtZGVsYXkt
cHMgPSA8MTUwMD47CiAgICAgICAgdHgtaW50ZXJuYWwtZGVsYXktcHMgPSA8MTUwMD47CiB9OwpA
QCAtMzcsOCArMzcsOCBAQAogJnBoeTEgewogICAgICAgIG1vdG9yY29tbSx0eC1jbGstYWRqLWVu
YWJsZWQ7CiAgICAgICAgbW90b3Jjb21tLHR4LWNsay0xMDAtaW52ZXJ0ZWQ7Ci0gICAgICAgbW90
b3Jjb21tLHJ4LWNsay1kcml2ZXItc3RyZW5ndGggPSA8Mzk3MD47Ci0gICAgICAgbW90b3Jjb21t
LHJ4LWRhdGEtZHJpdmVyLXN0cmVuZ3RoID0gPDI5MTA+OworICAgICAgIG1vdG9yY29tbSxyeC1j
bGstZHJ2LW1pY3JvYW1wID0gPDM5NzA+OworICAgICAgIG1vdG9yY29tbSxyeC1kYXRhLWRydi1t
aWNyb2FtcCA9IDwyOTEwPjsKICAgICAgICByeC1pbnRlcm5hbC1kZWxheS1wcyA9IDwzMDA+Owog
ICAgICAgIHR4LWludGVybmFsLWRlbGF5LXBzID0gPDA+OwogfTsKCgpCZXN0IHJlZ2FyZHMsClNh
bWluCgo+Pgo+PiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L25ldGRl
dmJwZi9jb3Zlci8yMDIzMDcyMDExMTUwOS4yMTg0My0xLXNhbWluLmd1b0BzdGFyZml2ZXRlY2gu
Y29tCj4+Cj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gU2FtaW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
