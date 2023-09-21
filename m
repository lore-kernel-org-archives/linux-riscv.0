Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C999FE7106C
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 13:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33cI8gj5zgI0A5dURSUvdB3XbR/LX9+G+s7OkBHvt7Q=; b=yC3eHMu7TSIs09
	PA8/v8rWEULmMoNub4VDuTQKYtCjH6QBA6tOG3KatN+QhFqzSqdScawQEUbL3JMdV5eU83zzvnYXj
	58QlifmmupOn0A5y+ebZAs2BTKrTJZyRlhoN7FyoPELfLmDYIpklc6y2MuTBiJv7YBMz5eMcMFSk1
	DdR9TxMtVlLYoMgdpvdkh2c+WItNusf0FJI1/SEDRf8c19mG+YK6A+IAK3pPGiSoqHqtKMz7OaBLB
	n/MLgaz/UM9bnbgeQ4UtkYvmJcHtW0UjAYLYnH19obqq711M+etEWwvYsesqwISrm+Hb4ajddhNRi
	nG9NY0nzcHsgWJ9jwXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJva-0069m7-1V;
	Thu, 21 Sep 2023 13:41:10 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJvX-0069lc-0b
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 13:41:09 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-57b64731334so128770eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 06:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695303666; x=1695908466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rpm5+JLYJmdv53YiNxNC9Ky9+Imr89A4Evb+6bL1iE=;
        b=WqpZ33JS+DYlvFdaqvstMh3xaoUmRiLJsrG0TXjeSXxdqWtMednLIcqgTjV/UgWVLA
         6IYA6B7p/dyc9uDCMIV5DrHquD2BJCyqPXNRlkqwbO1rYrNRfjb7d5WFKzCDaEJsGBI4
         iPBdk+ZtMbIaGXHlCvV4hUmh2nMShMmw2zcelTIe6R2eXV6Un4DaAwYFBXErJrjnDDm4
         Iz4urNdn1+kYbOydZqRjmdU3XaR1yDapMO6D9JRlRAqed7h54v/0mP3E2DM+YyqFvxgy
         yqbGhlnohxZmS4AAUUfjjle5082k6REziRZq42uZD+5DgKDCIFOSKk+BenOu/ffMPXDW
         JYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695303666; x=1695908466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rpm5+JLYJmdv53YiNxNC9Ky9+Imr89A4Evb+6bL1iE=;
        b=BGzI+PUskCXnDzHAlesOZpIzmmXUfUL+0UEytdtcB/04QsQ5Hv717MhnZKli4F757p
         8gNtaJTAx7II9zV7YZ4NiM2SQg5HwB+DgUSgwdKAAzuLXZhXE1qDn8pehvdcUF6Ob+sJ
         s/05ROolJB1ynwsmgGCKSFu351Ci1yYkqotH5quHfm0bHdPQNmk+t8Cx7b6Oeh5kAYhZ
         ffEN9YpXKoLQiXXz6LOlyU522+R6B8sst8Clh4KTIUC7oBMmPb5WXgL8sTAVDZxabxsl
         WqfbOfGwjRhzMFKEp1ffbfzgQ13m9Me812ih2WOHKBPN4knalHxv4lf4FiODPueyHV9v
         bTaw==
X-Gm-Message-State: AOJu0Yy544ZNXu6rorZOh/bLY/AchlidpTnh5TxlnrgI2bUjTRldJ2SH
	ow3Dq6G/0vLBX5csCxKWIrpA3PCHxu1ak5sjANg=
X-Google-Smtp-Source: AGHT+IGIIZWD7Q1hxOFFNiQrY1guGCVYQP0GsAOt+m86LmLPjHCrGLS7jwLW+qpsBYUIZB1XkJ4C92WYSDgjdG9MBZc=
X-Received: by 2002:a05:6870:1481:b0:1c0:f8a7:ec14 with SMTP id
 k1-20020a056870148100b001c0f8a7ec14mr5497639oab.57.1695303666009; Thu, 21 Sep
 2023 06:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
 <20230920-arrival-bonanza-e335686420f4@wendy> <CAHAQgRDh72FLQPOFzn2rhsWmOOaLUO0sKyJwJQBG0Z7qZN_YLw@mail.gmail.com>
 <20230921-1ae70cfdbf983e011d5b6754@fedora>
In-Reply-To: <20230921-1ae70cfdbf983e011d5b6754@fedora>
From: Chen Wang <unicornxw@gmail.com>
Date: Thu, 21 Sep 2023 21:40:55 +0800
Message-ID: <CAHAQgRAmO6-aoCM6LALO5+B5N=_=-jD-JrJ0X50avc0_dJy3TQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042 bindings
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_064107_229761_FEF1B963 
X-CRM114-Status: GOOD (  43.17  )
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

UmVnYXJkcywKCnVuaWNvcm54CgpDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IOS6jjIw
MjPlubQ55pyIMjHml6Xlkajlm5sgMjA6MTjlhpnpgZPvvJoKPgo+IE9uIFRodSwgU2VwIDIxLCAy
MDIzIGF0IDA2OjIxOjA4UE0gKzA4MDAsIENoZW4gV2FuZyB3cm90ZToKPiA+IENvbm9yIERvb2xl
eSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+IOS6jjIwMjPlubQ55pyIMjDml6XlkajkuIkg
MTY6MjnlhpnpgZPvvJoKPiA+ID4gT24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMDI6Mzc6NTFQTSAr
MDgwMCwgQ2hlbiBXYW5nIHdyb3RlOgo+ID4gPiA+IEFkZCBEVCBiaW5kaW5nIGRvY3VtZW50YXRp
b24gZm9yIHRoZSBTb3BoZ28gU0cyMDQyIFNvYyBbMV0gYW5kIHRoZQo+ID4gPiA+IE1pbGstViBQ
aW9uZWVyIGJvYXJkIFsyXS4KPiA+ID4gPgo+ID4gPiA+IFsxXTogaHR0cHM6Ly9lbi5zb3BoZ28u
Y29tL3Byb2R1Y3QvaW50cm9kdWNlL3NnMjA0Mi5odG1sCj4gPiA+ID4gWzJdOiBodHRwczovL21p
bGt2LmlvL3Bpb25lZXIKPiA+ID4KPiA+ID4gQWdhaW4sIGxpbmsgdGFncyBwbGVhc2UuCj4gPiA+
Cj4gPiA+ID4gQWNrZWQtYnk6IENoYW8gV2VpIDxjaGFvLndlaUBzb3BoZ28uY29tPgo+ID4gPiA+
IEFja2VkLWJ5OiBYaWFvZ3VhbmcgWGluZyA8eGlhb2d1YW5nLnhpbmdAc29waGdvLmNvbT4KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHdhbmdjaGVuMjBAaXNjYXMuYWMuY24+Cj4g
PiA+ID4gLS0tCj4gPiA+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NvcGhnby55
YW1sICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysKPiA+ID4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwKPiA+ID4g
Pgo+ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cmlzY3Yvc29waGdvLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3Yvc29waGdvLnlhbWwKPiA+ID4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gPiA+IGluZGV4
IDAwMDAwMDAwMDAwMC4uODI0NjhhZTkxNWRiCj4gPiA+ID4gLS0tIC9kZXYvbnVsbAo+ID4gPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zb3BoZ28ueWFt
bAo+ID4gPiA+IEBAIC0wLDAgKzEsMjggQEAKPiA+ID4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+ID4gKyVZQU1MIDEuMgo+
ID4gPiA+ICstLS0KPiA+ID4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9y
aXNjdi9zb3BoZ28ueWFtbCMKPiA+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ID4gKwo+ID4gPiA+ICt0aXRsZTogU29waGdv
IFNvQy1iYXNlZCBib2FyZHMKPiA+ID4gPiArCj4gPiA+ID4gK21haW50YWluZXJzOgo+ID4gPiA+
ICsgIC0gQ2hhbyBXZWkgPGNoYW8ud2VpQHNvcGhnby5jb20+Cj4gPiA+ID4gKyAgLSBYaWFvZ3Vh
bmcgWGluZyA8eGlhb2d1YW5nLnhpbmdAc29waGdvLmNvbT4KPiA+ID4gPiArCj4gPiA+ID4gK2Rl
c2NyaXB0aW9uOgo+ID4gPiA+ICsgIFNvcGhnbyBTb0MtYmFzZWQgYm9hcmRzCj4gPiA+ID4gKwo+
ID4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4gPiA+ICsgICRub2RlbmFtZToKPiA+ID4gPiArICAgIGNv
bnN0OiAnLycKPiA+ID4gPiArICBjb21wYXRpYmxlOgo+ID4gPiA+ICsgICAgb25lT2Y6Cj4gPiA+
ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiA+ID4gKyAgICAgICAgICAtIGVudW06Cj4gPiA+ID4gKyAg
ICAgICAgICAgICAgLSBtaWxrdixwaW9uZWVyCj4gPiA+ID4gKyAgICAgICAgICAtIGNvbnN0OiBz
b3BoZ28sc2cyMDQyCj4gPiA+ID4gKwo+ID4gPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogdHJ1
ZQo+ID4gPiA+ICsKPiA+ID4gPiArLi4uCj4gPiA+ID4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMKPiA+ID4gPiBpbmRleCA5MGYxMzI4MWQyOTcuLmI3NGQ1MDUwMDNlMiAx
MDA2NDQKPiA+ID4gPiAtLS0gYS9NQUlOVEFJTkVSUwo+ID4gPiA+ICsrKyBiL01BSU5UQUlORVJT
Cj4gPiA+ID4gQEAgLTIwMDYzLDYgKzIwMDYzLDEzIEBAIEY6ICAgZHJpdmVycy9jaGFyL3Nvbnlw
aS5jCj4gPiA+ID4gIEY6ICAgZHJpdmVycy9wbGF0Zm9ybS94ODYvc29ueS1sYXB0b3AuYwo+ID4g
PiA+ICBGOiAgIGluY2x1ZGUvbGludXgvc29ueS1sYXB0b3AuaAo+ID4gPiA+Cj4gPiA+ID4gK1NP
UEhHTyBERVZJQ0VUUkVFUwo+ID4gPiA+ICtNOiAgIFhpYW9ndWFuZyBYaW5nIDx4aWFvZ3Vhbmcu
eGluZ0Bzb3BoZ28uY29tPgo+ID4gPiA+ICtNOiAgIENoYW8gV2VpIDxjaGFvLndlaUBzb3BoZ28u
Y29tPgo+ID4gPiA+ICtTOiAgIE1haW50YWluZWQKPiA+ID4gPiArRjogICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yvc29waGdvLnlhbWwKPiA+ID4KPiA+ID4gPiArRjog
ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby8KPiA+ID4KPiA+ID4gRmlyc3RseSwgdGhpcyBk
aXJlY3RvcnkgZG9lcyBub3QgZXhpc3QgYXQgdGhlIHRpbWUgb2YgdGhpcyBwYXRjaCwgc28gaXQK
PiA+ID4gc2hvdWxkIG5vdCBiZSBhZGRlZCBoZXJlLCBidXQgcmF0aGVyIGF0IHRoZSB0aW1lIHRo
YXQgeW91IGNyZWF0ZSBpdC4KPiA+ID4KPiA+ID4gU2Vjb25kbHksIGFyZSBYaWFvZ3VhbmcgWGlu
ZyBhbmQgQ2hhbyBXZWkgZ29pbmcgdG8gbW9uaXRvciB0aGUgbGlzdHMgJgo+ID4gPiBhcHBseSBw
YXRjaGVzIGZvciB0aGVzZSBmaWxlcz8gSWYgc28sIHlvdSBzaG91bGQgYWRkIGEgZ2l0IHRyZWUg
aGVyZQo+ID4gPiB0aGF0IHRoZXkgd2lsbCBhcHBseSBwYXRjaGVzIHRvICYgYWRkIHRvIGxpbnV4
LW5leHQuIEFsc28sIEknZCByZWFsbHkKPiA+ID4gbGlrZSB0byBzZWUgc29tZSBvbi1saXN0IHNp
Z25zIG9mIGxpZmUgZnJvbSB0aGVzZSBwZW9wbGUsIG90aGVyd2lzZQo+ID4gPiBJJ2QgcmF0aGVy
IHNlZSB5b3VyIG5hbWUgaGVyZSBpbnN0ZWFkIG9mIHRoZWlycy4KPiA+ID4KPiA+ID4gSWYgdGhl
eSBkb24ndCBpbnRlbmQgcmV2aWV3aW5nL3Rlc3RpbmcvYXBwbHlpbmcgcGF0Y2hlcywgSSBjYW4g
ZG8gaXQgYXMKPiA+ID4gYSBsYXN0IHJlc29ydCBidXQgSSB3b3VsZCByYXRoZXIgdGhhdCBzb21l
b25lIHdobyBzcGVjaWZpY2FsbHkgY2FyZXMgZm9yCj4gPiA+IHRoaXMgaGFyZHdhcmUgZG9lcyBp
dC4KPiA+Cj4gPiBQbGVhc2UgYWxsb3cgbWUgdG8gZXhwbGFpbiBmaXJzdC4gQXMgYSBjb21tdW5p
dHkgdm9sdW50ZWVyLCBJIGFjdHVhbGx5Cj4gPiBoYWQgZnVsbCBkaXNjdXNzaW9ucyBhbmQgdGVz
dGluZyB3aXRoIFNvcGhnbyBwZW9wbGUgd2hlbiBzdWJtaXR0aW5nCj4gPiBwYXRjaGVzLCBzbyBJ
IGFkZGVkIHRhZyBzdWNoICJBY2tlZC1ieTogWGlhb2d1YW5nIFhpbmcgLi4uIiB0byB0aGUKPiA+
IHNpZ25hdHVyZSBwYXJ0IG9mIG1vc3QgcGF0Y2hlcy4gQWxzbyBpZiB5b3UgdGhpbmsgYSBmb3Jt
YWwgZW1haWwgaXMKPiA+IHJlcXVpcmVkLCBJIHdpbGwgdGFsayB0aGVtIHRvIHNlbmQgaXQuCj4K
PiBObywgSSdtIG9rYXkgd2l0aCB0aGUgYWNrcyB0aGF0IGFyZSBvbiB0aGVzZSBwYXRjaGVzLiBJ
IGp1c3Qgd2FudCB0bwo+IG1ha2Ugc3VyZSB0aGF0IHRob3NlIHdobyBhcmUgYWNraW5nIGtub3cg
d2h5IHRoZXkgYXJlICYgYW0gd29uZGVyaW5nIHdoeQo+IHlvdXIgbmFtZSBpcyBub3QgdGhlcmUs
IHNlZWluZyBhcyB5b3UncmUgdGhlIG9uZSB3aG8gaGFzIHN1Ym1pdHRlZCB0aGVzZQo+IHBhdGNo
ZXMuCj4KPiA+IEFzIGZvciB0aGUgaXNzdWUgb2YgTUFJTlRBSU5FUlMsIEkgZGlzY3Vzc2VkIGl0
IHdpdGggdGhlIHBlb3BsZSBmcm9tCj4gPiBTb3BoZ28uIFRoZXkgKGluY2x1ZGluZyBtZSBhbHNv
KSBmZWVsIHRoYXQgd2UgYXJlIG5vdCB2ZXJ5IGZhbWlsaWFyCj4gPiB3aXRoIHRoZSBjb21tdW5p
dHkgcHJvY2VzcyAoZXNwZWNpYWxseSBhcyBtYWludGFpbmVyLCBhbmQgYWN0dWFsbHkgSQo+ID4g
bW9kaWZ5IHRoZSBmaWxlIE1BSU5UQUlORVJTIGlzIGp1c3QgdG8gc3VwcHJlc3Mgd2FybmluZyBp
bmZvcm1hdGlvbgo+ID4gd2hlbiBydW5uaW5nIGNoZWNrcGF0Y2gucGwpLCBzbyB3ZSBzaW5jZXJl
bHkgaG9wZSB0byBpbnZpdGUgeW91LCBNci4KPiA+IENvbm9yLAo+Cj4gT2ggZ29kLCB0aGVyZSdz
IG5vIG5lZWQgdG8gY2FsbCBtZSAiTXIuIENvbm9yIi4gQ29ub3Igd2lsbCBkbyBwZXJmZWN0bHkK
PiBmaW5lIQo+Cj4gPiB0byBoZWxwIHVzIGZvciBhIHBlcmlvZCBvZiB0aW1lIG9uIG1haW50ZW5h
bmNlIHdvcmssIGluY2x1ZGluZwo+ID4gY2hlY2tpbmcgcmVsZXZhbnQgcGF0Y2hlcywgbWVyZ2lu
ZyBhbmQgc3VibWl0dGluZyBQUnMsIHdlIHdpbGwgbGVhcm4KPiA+IHRvZ2V0aGVyIHdpdGggeW91
IGZvciBhIHdoaWxlLCBhbmQgdGhlbiB0YWtlIG92ZXIgdGhpcyBwYXJ0IG9mIHRoZQo+ID4gd29y
ayB3aGVuIHdlIGJlY29tZSBmYW1pbGlhciB3aXRoIGl0LiBXZSBrbm93IHRoYXQgeW91IGFyZSBh
bHNvIHZlcnkKPiA+IGJ1c3kgYXQgd29yaywgZXNwZWNpYWxseSBpZiB5b3UgZG9uJ3QgaGF2ZSB0
aGUgaGFyZHdhcmUgYXQgaGFuZC4gSQo+ID4gaGF2ZSB0aGUgaGFyZHdhcmUgaGVyZSBhbmQgSSBj
YW4gdGFrZSB0aGUgcmVzcG9uc2liaWxpdHkgdG8gcnVuCj4gPiB0ZXN0aW5nLiBXaGF0IGRvIHlv
dSB0aGluaz8gSSdtIHdhaXRpbmcgZm9yIHlvdXIgcmVwbHkuIFRoYW5rcyBpbgo+ID4gYWR2YW5j
ZS4KPgo+IFRoYXQgc2VlbXMgZmluZSB0byBtZS4gSW4gdGhhdCBjYXNlLCB5b3Ugc2hvdWxkIGFk
ZCB5b3Vyc2VsZiB0byB0aGUKPiBNQUlOVEFJTkVSUyBlbnRyeS4KPgo+IFRoYW5rcywKPiBDb25v
ci4KCk9rYXnvvIxJIHdpbGwgYWRkIGl0IGluIG5leHQgcmV2aXNpb24sIHRoYW5rIHlvdSBhZ2Fp
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
