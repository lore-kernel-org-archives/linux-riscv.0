Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F73AC47DA7
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jan 2024 06:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/y7yqZpJbPb/1XoUF0h+hMm2OzQtSXzXsOpM7Kp5CXk=; b=LEss6bUr9dR5/z
	UR3v9ta06V9Ky4UQJd9V6R8innCnQ1clNijNQHQ81/nkw4cZxVPwD2PfRWV9pa27L0kmIjtf6To1w
	IngyCE/nN8R6ZxbCGSkCon7JMQOwSEJxEWrxhIhuNcbVCX0v3SawIMNcSGBweUq4I35EkM+Bq58hT
	gyPmmKUWk8i3PXJbm/0wWtp0tTr1BPgpES/66t2sPhyesuvYDK5MquVd1zP0h58Gr1ro3MUddjkdC
	7dhilauzlPGKif652A/NXmW4PsuAdLRvNfmFuPaw2Bcw3RBUcAM0MPX9vbGW6K2guE1F2Fbq5L+HC
	l7vQ/bX/gwH14xRRvjDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPzYZ-00EbMb-0n;
	Wed, 17 Jan 2024 06:37:47 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPzYW-00EbLK-06
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jan 2024 06:37:45 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-dc2308fe275so982360276.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 22:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705473461; x=1706078261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MjS89mx0sQXy2eTiKmRoWh0TgEsc77yp3/tG8fkBm0=;
        b=O1saHJI4TAPpfTn960IcJPhiHPVLG0MCx03vIqX1iURXQ3VUcrRJ4VQROJasnvXYHr
         pKy5O2igszE9CmVKLMRMd0QljE0y4AA/nwyYy//4JCmO9jd7tiBDInDKypJNKhX059+T
         uGmKZoeRHSBP+9BxTkBaaX0Ds7+1OT+n6ORsJa17VnHPPLG7w0O+w4m057jEAj4PjhrR
         IwxQlaerRDhict7E7KW4y0bcv2DHNSmWwzkfqQXyhdC3yUc/tqMcdrdmhEvSNBU4mBYD
         kfUdcpE6jbHwYbmE2gnPN+OAsoVXkGWkq+e93G4l4UKwLtIU7CM0Yf3NW8KMpmNs/pK+
         qDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705473461; x=1706078261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MjS89mx0sQXy2eTiKmRoWh0TgEsc77yp3/tG8fkBm0=;
        b=p3TVRg7Kq2QFATe2es5ctioqcreCScOovwD65gQ8egtx3oo8u+rgNcLwQViUc2IFnq
         qHy5ungrYF2xT+5bks+1Wx9NDA1ynAf5bJeyHkKKk9RV/PS09MPpz99Ery5J0oB8DHXb
         Zr80Ov8Sw+I1VrJyaPxStp8O7jsRIlHnpKTFWq+Wsoma1i494lrfKv30kKqOrNiulyl0
         5cX7r3dgWN28LoU+ItrxI4orTpXgr+izPFAn6pZtIFcEttpmsi4my//4BOeWO1PwIuAD
         BCsN+qdzRSTh6Mu0Mn+j9MnvXbe4M3bpXEDH0M5uAjR3LBq+kWFc+nKpBBCec0RJ9lD9
         WN8Q==
X-Gm-Message-State: AOJu0Yx2uHqWmI6VW5Mz9XnDOrNPG5RgS+nYvydvrHbn89RgHvqbxS/L
	pwAEMlyWitdN8grhK2kKtQdZsyZ/3qnf5ZkmEIQ67nuLUTs6nA==
X-Google-Smtp-Source: AGHT+IFEMyWcAcqOEFbcyT/yrtYZJx8PYnYGhp0KuSEal/fflTbBO9CbsaFUxysMnyygE2daNgRd/NjFO6m06R+oiAo=
X-Received: by 2002:a25:ab52:0:b0:dc2:3bb2:61 with SMTP id u76-20020a25ab52000000b00dc23bb20061mr367501ybi.90.1705473461632;
 Tue, 16 Jan 2024 22:37:41 -0800 (PST)
MIME-Version: 1.0
References: <20240116041054.11641-1-nylon.chen@sifive.com> <20240116041054.11641-2-nylon.chen@sifive.com>
 <CAJM55Z9ZbmbPKaJ8LJ5KyoCW9fAEJaT3Q4PbcadwLNCq1NXbxA@mail.gmail.com> <20240116-custard-drew-9a02e83d538a@wendy>
In-Reply-To: <20240116-custard-drew-9a02e83d538a@wendy>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Wed, 17 Jan 2024 14:37:30 +0800
Message-ID: <CAHh=Yk_dye_KMXbug1VwYXU0Wm-mZgx_t-oJx1N0uYVByb1z7Q@mail.gmail.com>
Subject: Re: [v6 1/3] riscv: dts: sifive: unleashed/unmatched: Remove PWM
 controlled LED's active-low properties
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	robh+dt@kernel.org, u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com, 
	aou@eecs.berkeley.edu, zong.li@sifve.com, vincent.chen@sifive.com, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	nylon7717@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_223744_072105_20406C44 
X-CRM114-Status: GOOD (  27.85  )
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4g5pa8IDIwMjTlubQx5pyI
MTbml6Ug6YCx5LqMIOS4i+WNiDY6NDXlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgSmFuIDE2LCAyMDI0
IGF0IDAyOjIwOjU3QU0gLTA4MDAsIEVtaWwgUmVubmVyIEJlcnRoaW5nIHdyb3RlOgo+ID4gTnls
b24gQ2hlbiB3cm90ZToKPiA+ID4gVGhpcyByZW1vdmVzIHRoZSBhY3RpdmUtbG93IHByb3BlcnRp
ZXMgb2YgdGhlIFBXTS1jb250cm9sbGVkIExFRHMgaW4KPiA+ID4gdGhlIEhpRml2ZSBVbm1hdGNo
ZWQgZGV2aWNlIHRyZWUuCj4gPiA+Cj4gPiA+IFRoZSByZWZlcmVuY2UgaXMgaGlmaXZlLXVubGVh
c2hlZC1hMDAucGRmWzBdIGFuZCBoaWZpdmUtdW5tYXRjaGVkLXNjaGVtYXRpY3MtdjMucGRmWzFd
Lgo+ID4gPgo+ID4gPiBMaW5rOiBodHRwczovL3NpZml2ZS5jZG4ucHJpc21pYy5pby9zaWZpdmUv
YzUyYThlMzItMDVjZS00YWFmLTk1YzgtN2JmODQ1M2Y4Njk4X2hpZml2ZS11bmxlYXNoZWQtYTAw
LXNjaGVtYXRpY3MtMS5wZGYgWzBdCj4gPiA+IExpbms6IGh0dHBzOi8vc2lmaXZlLmNkbi5wcmlz
bWljLmlvL3NpZml2ZS82YTA2ZDZjMC02ZTY2LTQ5YjUtOGU5ZS1lNjhjZTc2ZjQxOTJfaGlmaXZl
LXVubWF0Y2hlZC1zY2hlbWF0aWNzLXYzLnBkZiBbMV0KPiA+ID4KPiA+ID4gQWNrZWQtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiA+IFJldmlld2VkLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4gPiBDby1kZXZl
bG9wZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmdmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBab25nIExpIDx6b25nLmxpQHNpZnZlLmNvbT4KPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBWaW5j
ZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBW
aW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJj
aC9yaXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubGVhc2hlZC1hMDAuZHRzIHwgIDggKysr
Ky0tLS0KPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQt
YTAwLmR0cyB8IDEyICsrKystLS0tLS0tLQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubGVhc2hlZC1hMDAuZHRzIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubGVhc2hlZC1hMDAuZHRzCj4gPiA+IGluZGV4IDkw
MGE1MDUyNmQ3Ny4uMTFlN2FjMWM1NGJiIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NpZml2ZS9oaWZpdmUtdW5sZWFzaGVkLWEwMC5kdHMKPiA+ID4gKysrIGIvYXJjaC9y
aXNjdi9ib290L2R0cy9zaWZpdmUvaGlmaXZlLXVubGVhc2hlZC1hMDAuZHRzCj4gPiA+IEBAIC00
OSw3ICs0OSw3IEBAIGxlZC1jb250cm9sbGVyIHsKPiA+ID4gICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJwd20tbGVkcyI7Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgIGxlZC1kMSB7Cj4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgcHdtcyA9IDwmcHdtMCAwIDc4MTI1MDAgUFdNX1BPTEFSSVRZX0lO
VkVSVEVEPjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICBwd21zID0gPCZwd20wIDAgNzgxMjUw
MCAwPjsKPiA+ID4gICAgICAgICAgICAgICAgICAgICBhY3RpdmUtbG93Owo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47Cj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKPiA+ID4gQEAgLTU3LDcgKzU3LDcg
QEAgbGVkLWQxIHsKPiA+ID4gICAgICAgICAgICAgfTsKPiA+ID4KPiA+ID4gICAgICAgICAgICAg
bGVkLWQyIHsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICBwd21zID0gPCZwd20wIDEgNzgxMjUw
MCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+ID4gPiArICAgICAgICAgICAgICAgICAgIHB3bXMg
PSA8JnB3bTAgMSA3ODEyNTAwIDA+Owo+ID4gPiAgICAgICAgICAgICAgICAgICAgIGFjdGl2ZS1s
b3c7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX0dSRUVO
PjsKPiA+ID4gICAgICAgICAgICAgICAgICAgICBtYXgtYnJpZ2h0bmVzcyA9IDwyNTU+Owo+ID4g
PiBAQCAtNjUsNyArNjUsNyBAQCBsZWQtZDIgewo+ID4gPiAgICAgICAgICAgICB9Owo+ID4gPgo+
ID4gPiAgICAgICAgICAgICBsZWQtZDMgewo+ID4gPiAtICAgICAgICAgICAgICAgICAgIHB3bXMg
PSA8JnB3bTAgMiA3ODEyNTAwIFBXTV9QT0xBUklUWV9JTlZFUlRFRD47Cj4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgcHdtcyA9IDwmcHdtMCAyIDc4MTI1MDAgMD47Cj4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgYWN0aXZlLWxvdzsKPiA+ID4gICAgICAgICAgICAgICAgICAgICBjb2xvciA9IDxM
RURfQ09MT1JfSURfR1JFRU4+Owo+ID4gPiAgICAgICAgICAgICAgICAgICAgIG1heC1icmlnaHRu
ZXNzID0gPDI1NT47Cj4gPiA+IEBAIC03Myw3ICs3Myw3IEBAIGxlZC1kMyB7Cj4gPiA+ICAgICAg
ICAgICAgIH07Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgIGxlZC1kNCB7Cj4gPiA+IC0gICAgICAg
ICAgICAgICAgICAgcHdtcyA9IDwmcHdtMCAzIDc4MTI1MDAgUFdNX1BPTEFSSVRZX0lOVkVSVEVE
PjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICBwd21zID0gPCZwd20wIDMgNzgxMjUwMCAwPjsK
PiA+ID4gICAgICAgICAgICAgICAgICAgICBhY3RpdmUtbG93Owo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9JRF9HUkVFTj47Cj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cwo+ID4gPiBpbmRleCAwNzM4
N2Y5YzEzNWMuLmIzMjhlZTgwNjkzZiAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290
L2R0cy9zaWZpdmUvaGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzCj4gPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc2lmaXZlL2hpZml2ZS11bm1hdGNoZWQtYTAwLmR0cwo+ID4gPiBAQCAtNTEs
OCArNTEsNyBAQCBsZWQtY29udHJvbGxlci0xIHsKPiA+ID4gICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJwd20tbGVkcyI7Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgIGxlZC1kMTIgewo+ID4gPiAt
ICAgICAgICAgICAgICAgICAgIHB3bXMgPSA8JnB3bTAgMCA3ODEyNTAwIFBXTV9QT0xBUklUWV9J
TlZFUlRFRD47Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgYWN0aXZlLWxvdzsKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICBwd21zID0gPCZwd20wIDAgNzgxMjUwMCAwPjsKPiA+CgpIaSBFbWls
IGFuZCBDb25vciwgdGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLgo+Cj4KPiA+IEhlcmUgeW91IHJl
bW92ZSB0aGUgYWN0aXZlLWxvdyBwcm9wZXJ0eSwgYnV0IHlvdSBkb24ndCBhYm92ZS4gSSdtIG5v
dCBzdXJlCj4gPiB3aGF0J3MgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLCBidXQgSSB3b3VsZCBoYXZl
IGV4cGVjdGVkIHRoZSBzYW1lIGNoYW5nZSBpbiBib3RoCj4gPiBwbGFjZXMuCj4KRm9yIHRoaXMg
cGF0Y2gsIGFsbCAiYWN0aXZlLWxvdyIgc2hvdWxkIGJlIGRlbGV0ZWQuIFRoaXMgaXMgbXkKbWlz
dGFrZS4gSSB3aWxsIGZpeCBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Cj4KPiBKdXN0IHRvIG5v
dGUsIHRoZSBvcmlnaW5hbCB2ZXJzaW9uIG9mIHRoaXMgdGhhdCBJIGFja2VkL3Jldmlld2VkIHJl
bW92ZWQKPiB0aGUgcHJvcGVydHkgZnJvbSBhbGwgbGVkIG5vZGVzLiBJIHRoZW4gYXBwYXJlbnRs
eSBkaWRuJ3QgbG9vayBjbG9zZWx5Cj4gZW5vdWdoIGF0IHY1IGFuZCBsZWZ0IGFja2VkL3Jldmll
d2VkIHRhZ3Mgb24gaXQgdG9vLiBJdCBkaWQgbm90IHJlbW92ZQo+IHRoZSBhY3RpdmUtbG93IHBy
b3BlcnRpZXMgYnV0IHRoaXMgY2hhbmdlIHdhcyBub3QgbWVudGlvbmVkIGluIHRoZQo+IGNoYW5n
ZWxvZyBmb3IgdGhlIHNlcmllcy4KU29ycnkgQ29ub3IsIEkgYXBvbG9naXplIGZvciBhbnkgY29u
ZnVzaW9uIEkgbWF5IGhhdmUgY2F1c2VkLgo+Cj4gRDQgb24gdGhlIHVubGVhc2hlZCBhbmQgRDEy
IG9uIHRoZSB1bm1hdGNoZWQgaGF2ZSB0aGUgc2FtZSBjaXJjdWl0cnkKPiAobW9kdWxvIHRoZSBw
bGFjZW1lbnQgb2YgdGhlIHNlcmllcyByZXNpc3Rvcikgc28gSSBkb24ndCBnZXQgd2h5IHRoZQo+
IHByb3BlcnR5IGlzIGJlaW5nIHJlbW92ZWQgZnJvbSBvbmx5IEQxMi4KPgo+IEkgcmVzY2luZCBt
eSBhY2svcmV2aWV3IHVudGlsIHRoYXQgaXMgY2xhcmlmaWVkIGFuZC9vciBmaXhlZC4KPgo+IFRo
YW5rcywKPiBDb25vci4KPgo+Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgY29sb3IgPSA8TEVE
X0NPTE9SX0lEX0dSRUVOPjsKPiA+ID4gICAgICAgICAgICAgICAgICAgICBtYXgtYnJpZ2h0bmVz
cyA9IDwyNTU+Owo+ID4gPiAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gImQxMiI7Cj4gPiA+
IEBAIC02OCwyMCArNjcsMTcgQEAgbXVsdGktbGVkIHsKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICBsYWJlbCA9ICJkMiI7Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgbGVkLXJlZCB7
Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBwd21zID0gPCZwd20wIDIgNzgxMjUw
MCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYWN0aXZlLWxvdzsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHB3bXMgPSA8
JnB3bTAgMiA3ODEyNTAwIDA+Owo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29s
b3IgPSA8TEVEX0NPTE9SX0lEX1JFRD47Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgfTsKPiA+
ID4KPiA+ID4gICAgICAgICAgICAgICAgICAgICBsZWQtZ3JlZW4gewo+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcHdtcyA9IDwmcHdtMCAxIDc4MTI1MDAgUFdNX1BPTEFSSVRZX0lO
VkVSVEVEPjsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIGFjdGl2ZS1sb3c7Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBwd21zID0gPCZwd20wIDEgNzgxMjUwMCAw
PjsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbG9yID0gPExFRF9DT0xPUl9J
RF9HUkVFTj47Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgfTsKPiA+ID4KPiA+ID4gICAgICAg
ICAgICAgICAgICAgICBsZWQtYmx1ZSB7Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICBwd21zID0gPCZwd20wIDMgNzgxMjUwMCBQV01fUE9MQVJJVFlfSU5WRVJURUQ+Owo+ID4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgYWN0aXZlLWxvdzsKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHB3bXMgPSA8JnB3bTAgMyA3ODEyNTAwIDA+Owo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29sb3IgPSA8TEVEX0NPTE9SX0lEX0JMVUU+Owo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgIH07Cj4gPiA+ICAgICAgICAgICAgIH07Cj4gPiA+IC0tCj4gPiA+
IDIuNDIuMAo+ID4gPgo+ID4gPgo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4gPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+ID4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
