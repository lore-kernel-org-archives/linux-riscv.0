Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161A4C48BF8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 01:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7deDGSKVFjtRcTAbcetC+jjuIwAhjAN8lUBjh2sgls=; b=c55WKZWil6E7kn
	vqSD/Y77VyS+6LrbyX8+5nNo6sePcab7+2d/1suK7zg/GDwkUA1yfMW/mH8hEeqragkEuBAvBgGzD
	aWd3/sF2+33vBOnM2Tod6oD9qkIGvIGqM73qPbfaGRCLq+Yb/MBLRIXPLFvPqLvBe0/1KKtSe5CZI
	2BS2Zk82lltL5hEL3SWB+gRDY5XxCx1Ly3Qz2j7meQNlNL6iVDIOiV6k44el1Dx8vPykkjYSoHq4B
	yR9xcg5KETQQOeyjRm1j2tA7tgXiQUGQcA9CYhJ5AL/151fM1D+k+susPQPYPype6d4pxLvo9hZhB
	6/cn246erP7J+ReAgDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcEm5-0000000Ciyb-0ThL;
	Tue, 20 Feb 2024 01:18:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcEm2-0000000Ciy0-1dcQ
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 01:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DFAA560FE3
	for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 01:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91057C43390
	for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 01:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708391897;
	bh=WTH8xvtj80oNQYl3D+sWeUGKtHxI3W3Jq2AUCHP7cEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FSzC9IHvaWwdQgtgv46bhtCoFk2IR78ZsruEuyYO/MCPdSd1tVpszZiJUkGC4Qf9R
	 oMFwHu89BN5NYmQ6p3vuyYZw0RT4GK0A7D4UHy6ZJHkLC6a7XwglRlYEdgnOn1+Zu6
	 SlDFv87OzkaTNVLfp41FRcB/bjtlgI+J0MYI2Rfx91twuj3P5+FbPjl3v9DEt7mfEn
	 zPiOyoodcPVVW0l+YEbNtix84qomqQJvDT2Cp7TbgF75p92Kf9L9n/HJ2rxW6oB1wc
	 9VLB8iDFhuw4WNAg+OHifdKh2XjZ5RA+Qh75+C0gSezapxGzoi0LPz8Q1syvuPjMXs
	 ecoOqmsGcffdA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-512ab55fde6so2866345e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 17:18:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFH/KYesGgPr/5/KwXYX1d/3B8pbVafZkJOEuVcYae1177TZXG9Si5E9XvFV1Tvd9t2Y/Bzqvd7+AW8beAcbL+ojnYZN4ybRIzzchDpWNh
X-Gm-Message-State: AOJu0YxEhFVIiWtSeWA+ePtAcrA39fojJ/2x7Wtytq6N04jMTD/Kve8P
	u9nY90FA4rESDlmhlUAqxADqZpLe/whCVi0r1XWqO4IQ3p9AnlInPVsJz0+qRG5RBIFbYUfQRnt
	ntb8RwfaSYVKK4jmWnG6G/WCPaH8=
X-Google-Smtp-Source: AGHT+IGMJfhDTJq1YqqIQGq98YiHO1JYn61LbwsGJ+VOUot9UnoTW+nNWZE7jsiRg+M3Bm2sv8S6XKJo1YK/Hc+mNjo=
X-Received: by 2002:a05:6512:1321:b0:512:bf09:9313 with SMTP id
 x33-20020a056512132100b00512bf099313mr1095294lfu.50.1708391895799; Mon, 19
 Feb 2024 17:18:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1708223519.git.unicorn_wang@outlook.com> <dc899c89e5c30e2267965f185b52d6dded4eb1ac.1708223519.git.unicorn_wang@outlook.com>
In-Reply-To: <dc899c89e5c30e2267965f185b52d6dded4eb1ac.1708223519.git.unicorn_wang@outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 20 Feb 2024 09:18:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRPU6-8Wwds=PRREjU3W0cmCpBcc=w7=J9p_y+XSd3o6w@mail.gmail.com>
Message-ID: <CAJF2gTRPU6-8Wwds=PRREjU3W0cmCpBcc=w7=J9p_y+XSd3o6w@mail.gmail.com>
Subject: Re: [PATCH v10 5/5] riscv: dts: add clock generator for Sophgo SG2042 SoC
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, richardcochran@gmail.com, 
	robh+dt@kernel.org, sboyd@kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, haijiao.liu@sophgo.com, 
	xiaoguang.xing@sophgo.com, jszhang@kernel.org, inochiama@outlook.com, 
	samuel.holland@sifive.com, Chen Wang <unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_171818_540525_54724CDA 
X-CRM114-Status: GOOD (  14.75  )
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

T24gU3VuLCBGZWIgMTgsIDIwMjQgYXQgMTA6NTLigK9BTSBDaGVuIFdhbmcgPHVuaWNvcm54d0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9v
ay5jb20+Cj4KPiBBZGQgY2xvY2sgZ2VuZXJhdG9yIG5vZGUgdG8gZGV2aWNlIHRyZWUgZm9yIFNH
MjA0MiwgYW5kIGVuYWJsZSBjbG9jayBmb3IKPiB1YXJ0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hl
biBXYW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+Cj4gLS0tCj4gIC4uLi9ib290L2R0cy9z
b3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRzICB8IDEyICsrKysrCj4gIGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpICAgICAgICB8IDQ4ICsrKysrKysrKysrKysrKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA2MCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRzIGIvYXJj
aC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRzCj4gaW5kZXgg
NDliNGI5YzJjMTAxLi44MGNiMDE3OTc0ZDggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290
L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRzCj4gKysrIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRzCj4gQEAgLTE0LDYgKzE0LDE4
IEBAIGNob3NlbiB7Cj4gICAgICAgICB9Owo+ICB9Owo+Cj4gKyZjZ2lfbWFpbiB7Cj4gKyAgICAg
ICBjbG9jay1mcmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+ICt9Owo+ICsKPiArJmNnaV9kcGxsMCB7
Cj4gKyAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+ICt9Owo+ICsKPiArJmNn
aV9kcGxsMSB7Cj4gKyAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MjUwMDAwMDA+Owo+ICt9Owo+
ICsKSWYgYWxsIGFyZSBmaXhlZCwgd2h5IGRvIHdlIHNlcGFyYXRlIHRoZW0gaW50byB0aHJlZSBw
aWVjZXM/IFRvIHNob3cKcmVhbCBpbnRlcm5hbCBoYXJkd2FyZT8KCj4gICZ1YXJ0MCB7Cj4gICAg
ICAgICBzdGF0dXMgPSAib2theSI7Cj4gIH07Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cy
MDQyLmR0c2kKPiBpbmRleCBlYWQxY2MzNWQ4OGIuLmU3MGM0M2UyY2NiZSAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaQo+ICsrKyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvL3NnMjA0Mi5kdHNpCj4gQEAgLTUsNiArNSw5IEBACj4KPiAgL2R0
cy12MS87Cj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEu
aD4KPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDItcGxsLmg+Cj4g
KyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9zb3BoZ28sc2cyMDQyLXJwZ2F0ZS5oPgo+ICsj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0Mi1jbGtnZW4uaD4KPgo+ICAj
aW5jbHVkZSAic2cyMDQyLWNwdXMuZHRzaSIKPgo+IEBAIC0xOCwxMiArMjEsNTQgQEAgYWxpYXNl
cyB7Cj4gICAgICAgICAgICAgICAgIHNlcmlhbDAgPSAmdWFydDA7Cj4gICAgICAgICB9Owo+Cj4g
KyAgICAgICBjZ2lfbWFpbjogb3NjaWxsYXRvcjAgewo+ICsgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gImZpeGVkLWNsb2NrIjsKPiArICAgICAgICAgICAgICAgY2xvY2stb3V0cHV0LW5hbWVz
ID0gImNnaV9tYWluIjsKPiArICAgICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0gPDA+Owo+ICsg
ICAgICAgfTsKPiArCj4gKyAgICAgICBjZ2lfZHBsbDA6IG9zY2lsbGF0b3IxIHsKPiArICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7Cj4gKyAgICAgICAgICAgICAgIGNs
b2NrLW91dHB1dC1uYW1lcyA9ICJjZ2lfZHBsbDAiOwo+ICsgICAgICAgICAgICAgICAjY2xvY2st
Y2VsbHMgPSA8MD47Cj4gKyAgICAgICB9Owo+ICsKPiArICAgICAgIGNnaV9kcGxsMTogb3NjaWxs
YXRvcjIgewo+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKPiAr
ICAgICAgICAgICAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0gImNnaV9kcGxsMSI7Cj4gKyAgICAg
ICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsKPiArICAgICAgIH07Cj4gKwo+ICAgICAgICAg
c29jOiBzb2Mgewo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1idXMiOwo+
ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiAgICAgICAgICAgICAgICAg
I3NpemUtY2VsbHMgPSA8Mj47Cj4gICAgICAgICAgICAgICAgIHJhbmdlczsKPgo+ICsgICAgICAg
ICAgICAgICBwbGxjbGs6IGNsb2NrLWNvbnRyb2xsZXJANzAzMDAxMDBjMCB7Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQyLXBsbCI7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NzAgMHgzMDAxMDBjMCAweDAgMHg0MD47Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPCZjZ2lfbWFpbj4sIDwmY2dpX2RwbGwwPiwg
PCZjZ2lfZHBsbDE+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwx
PjsKPiArICAgICAgICAgICAgICAgfTsKPiArCj4gKyAgICAgICAgICAgICAgIHJwZ2F0ZTogY2xv
Y2stY29udHJvbGxlckA3MDMwMDEwMzY4IHsKPiArICAgICAgICAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gInNvcGhnbyxzZzIwNDItcnBnYXRlIjsKPiArICAgICAgICAgICAgICAgICAgICAg
ICByZWcgPSA8MHg3MCAweDMwMDEwMzY4IDB4MCAweDk4PjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBjbG9ja3MgPSA8JmNsa2dlbiBHQVRFX0NMS19SUF9DUFVfTk9STUFMPjsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4gKyAgICAgICAgICAgICAgIH07
Cj4gKwo+ICsgICAgICAgICAgICAgICBjbGtnZW46IGNsb2NrLWNvbnRyb2xsZXJANzAzMDAxMjAw
MCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzb3BoZ28sc2cyMDQy
LWNsa2dlbiI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4NzAgMHgzMDAxMjAw
MCAweDAgMHgxMDAwPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnBsbGNs
ayBNUExMX0NMSz4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZwbGxjbGsg
RlBMTF9DTEs+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmcGxsY2xrIERQ
TEwwX0NMSz4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZwbGxjbGsgRFBM
TDFfQ0xLPjsKPiArICAgICAgICAgICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47Cj4g
KyAgICAgICAgICAgICAgIH07Cj4gKwo+ICAgICAgICAgICAgICAgICBjbGludF9tc3dpOiBpbnRl
cnJ1cHQtY29udHJvbGxlckA3MDk0MDAwMDAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gInNvcGhnbyxzZzIwNDItYWNsaW50LW1zd2kiLCAidGhlYWQsYzkwMC1hY2xp
bnQtbXN3aSI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwNzAgMHg5
NDAwMDAwMCAweDAwMDAwMDAwIDB4MDAwMDQwMDA+Owo+IEBAIC0zMzMsNiArMzc4LDkgQEAgdWFy
dDA6IHNlcmlhbEA3MDQwMDAwMDAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1
cHQtcGFyZW50ID0gPCZpbnRjPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRz
ID0gPDExMiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBj
bG9jay1mcmVxdWVuY3kgPSA8NTAwMDAwMDAwPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBj
bG9ja3MgPSA8JmNsa2dlbiBHQVRFX0NMS19VQVJUXzUwME0+LAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmY2xrZ2VuIEdBVEVfQ0xLX0FQQl9VQVJUPjsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJiYXVkY2xrIiwgImFwYl9wY2xrIjsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZWctc2hpZnQgPSA8Mj47Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgcmVnLWlvLXdpZHRoID0gPDQ+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1
cyA9ICJkaXNhYmxlZCI7Cj4gLS0KPiAyLjI1LjEKPgpPdGhlcnMgTEdUTS4KClJldmlld2VkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
