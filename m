Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10741E71074
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 13:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PnKSwoEhKiiQ4ll8BcbkP2RfNvx+oa7Grg+3csEnGJI=; b=BXjLfnUWnut3q9
	ESh2mpvbta8IIZHiV1Ru3pAvJNL72q9PRGnAvWtFDxqtw8X/VB4/kgr4j8O8x9fCS4clAY3TGOy6M
	cpNnUSJqIOHfw+XeHUTVcfs02l3pngyWZVZltxesPOchNLVEOYl8E3TJGBDdNcCr0T8c42BoS2tiA
	/7V4d01KpZA1ghc6RymJPsOxmp0TZzfS3yY4d4zPHVC4icr0jFm1r293FZedsOXbZUtq0HY8R6pbJ
	7S0CdOuOV2OlWxZtBQQnr3oG6RK6rS7koI5mqL50RbKXzQ9tDZbr70nrBgtcufqBBM+ZkIddU/s53
	P6o0Su3DR+mFYN9mNDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjK6J-006BQf-0w;
	Thu, 21 Sep 2023 13:52:15 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjK6F-006BPe-34
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 13:52:13 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6561fc267dbso5261746d6.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 06:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695304330; x=1695909130; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0QwFnxPqdBvVaar0AtuCTvYbRR1x/XZq77ioNk3ptM=;
        b=HKyEcgHIDuZkBgrfh5TuLpzIfDAMEpallF1x67Sl0oTijLG0nX7WMVap98Xb2O3viO
         hF0sLK7mQmTKGWEOAY7N5SuJck/nwReW41bEpLpvpAB9UEXUVVpdn86f+AGs8KwVMquM
         OGg87Dc93SS90JNvfKdKVSPlp0sXSrubwMXaHz3nO+dwq4vuHgYtNUmfSflQoFMzVREm
         u6cwBMVci613Vy1awurRkk1IOHSCnxNrNXwXg7a3JqD3SB0+ux87meyMSNZnWsxNxLZ/
         oKPUuhOR55G9xKuf64bDUPBuQyRpCWZEvXcqdMZaPIJTgn2ieZSpdgDGT7bLNE+KAslA
         k+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695304330; x=1695909130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0QwFnxPqdBvVaar0AtuCTvYbRR1x/XZq77ioNk3ptM=;
        b=M6ox8k2ZWgfKsJqFJY9UcR+7Sag2fpHR2/Rh8mjjWQQqnOe6UYreCqqASVBXzGXjzu
         KtSHZGsdhLoAA32Xr1gN7qJA4+oKQXAsJzwUMnt/GaARliSqVbukdr1ZSO++hZc4fLTD
         ifee/eTjGlmcrs78c7qouCsOygpV1OY6iAt99eaaF4olMuVEvAjYywv9QtYjJxyNAzRS
         fyAhr/qPdkEP9oVeCgJOSGw3H+UaTV6s9b25tpcM+kzqI1f0v0/9vtV3rAJe4Cvyk+bk
         ftvYGZsLt+2VPrT8C5k5ZWC4EmwewC/Vyv6C978QhjxdiOmIWi03CbezVoruS2lpVo2R
         0jOA==
X-Gm-Message-State: AOJu0YyON3uvtKA6kexYqjU0joFblgU80ejKcmfY8KYw2pz717o1IH9q
	XxA3cMxqq5L1bXzHWEkomVXyxcbuMelG3ji6eQo=
X-Google-Smtp-Source: AGHT+IH57JUHuzOh+vpq91EaewPD02Z80+hZjRFdizwKopdaWk/DGZPX4W6wwSfiGD/Edr4Sx0iI4SOAXukTILHCsgE=
X-Received: by 2002:a0c:b256:0:b0:655:71df:4c7d with SMTP id
 k22-20020a0cb256000000b0065571df4c7dmr5367941qve.56.1695304329735; Thu, 21
 Sep 2023 06:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
 <20230920-arrival-bonanza-e335686420f4@wendy> <CAHAQgRDh72FLQPOFzn2rhsWmOOaLUO0sKyJwJQBG0Z7qZN_YLw@mail.gmail.com>
 <20230921-1ae70cfdbf983e011d5b6754@fedora>
In-Reply-To: <20230921-1ae70cfdbf983e011d5b6754@fedora>
From: Chen Wang <unicornxw@gmail.com>
Date: Thu, 21 Sep 2023 21:51:58 +0800
Message-ID: <CAHAQgRBFje4mdhE3dZZH=HxED0bUauXBD4yNfQzEnpPSWG5HiA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042 bindings
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, aou@eecs.berkeley.edu, chao.wei@sophgo.com, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_065212_012907_831248AB 
X-CRM114-Status: GOOD (  43.64  )
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
ci4KCkNvbm9yLCBkbyB5b3Ugd2FudCBtZSB0byBhZGQgeW91IHRvIHRoZSBNQUlOVEFJTkVSUyBl
bnRyeSB0b28/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
