Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61B5E7719F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5RyEVXN+NyrwYyPrPkB8vxBv9cyANYa2sTlaRJ88ns=; b=uZtsQxj3RR2++7
	nAGhIldQe2D717BOG4R+lz2HZee2Y4cYPYNLgxuO+dOHTLEtkH7hPkM/2y2xNNkNiTUzmfCN6wKwh
	fEhDgF+u5FdzLxNsM1yW6lkF1v384wT6yiuHlPBJQ7zKHKqZNR2L09LiNBP4rwJu08RS+rovITOYy
	ziQuily2eRkUIE8xnld9XxXXjFusW+jqfL/00dctDtOtbpSv0ax/FCWT01HOxoK5Nbi2/bF+VUudO
	fMVD3E+fFJ5e7PU/R93RQ2lIxyGSp/i/WtSsmXCg8UJSEIfeTin7YAxy4pSVXPV8QTFFXoey34liN
	0A5v7QB7r4Mf2EKKlaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJnq-000000058hC-3Dt7;
	Mon, 13 Jan 2025 12:44:22 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJmS-000000058FB-0a0Z
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 12:42:57 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa67333f7d2so649232166b.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 04:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736772175; x=1737376975; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sAiYWUvh1If93v3noS5+E3HP+RI1JtXuaeQPNUKjPW8=;
        b=dEhBPyoKBtY72jYuWGEdDJvELvfp2OtOVfksDkZPWImNgCou9eYbsynmqVC++xOig4
         JXpWkJ055uR0tc4gMVrKQDv/KNIt/5QP/1ifJD3MLGvU/STZq8+K16W+YIrvIaCDJv66
         NhibrtYoq/COGtC9kMLAJbu1U9Fm3g5TPRcmkT/FyKDPAYNLj3MvtbjWWCy9Tjwo1CjL
         n7UoPwKtyoGnJF/yMj+xYHpoNQ/mVP2eV+iBxq3r8xWJe2Y5w58O0heI7wT1n8eBfyyO
         XleLpbzDMbpupGaPWbcZ9yMYNGta7J4+1J37o/8JsfLVYdc4mQfw8Oepolb8PV6Gqx4H
         CDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736772175; x=1737376975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAiYWUvh1If93v3noS5+E3HP+RI1JtXuaeQPNUKjPW8=;
        b=p1hkYKkGumVh15XSAn1ZdVNppQVFEt1rlpanbohRm+e/k9DkjxkhUFjjY8S1JmJKtB
         Pyemuojl+/oTzVr6dLez19acok0bk5tULj9zK+B5Cqz9GI0ZGRgEWiWxBZb0ZWkltFdB
         NLj9vBFs+r50YWxEkPcoqWPKj1Fm1/eHBxYToeXAJVm36ly6qzQEszC7AqBbEY1Mv4t1
         v59pQIMcgM2svFtsILGxT6qz0dKaMB+iIPKmzQh3og89HmhfGp4G2kchmQZFMv1v/9pX
         VHMjWgM6i5D/J2hG0pdeU5eLiEsfPqHBSoWRtX2SiJnos1Lzf9Qc8K91xcVmshe8CJaR
         36wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/ibiUsyIlW8ddNKEsCJ+Jex6uRRpfhNrxG4IUCnb1TQ5WhBV3cyOXc5/AS0A7DXLkQk8fxQ71Hl2vxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyCIF+QZK/svtGBf3TeRK2YU462s9MbpKUTLwuCJ+uicTGSiq4B
	RXn4Mfq3MY0e8V9wDALZICAS1oYnC279hcxQ20eyBsj27+tIbiemZCmOdURXaTs=
X-Gm-Gg: ASbGncv2TWKQkmX0KQvUki8Ta4qys3ftjXMZ21OA9Q/amAz0k61awIsSt+9z+ghZwME
	WXwdyqNEajcjl5YqEJxY/BFtMoUpY5ihZC1dnMIOFSb/kc2mWVYfDQHGAYanv03kp0k7125JArv
	PW80tdOmVAwLQGlaTd1EdyYV4sPLbd/Vu7w1IRc/LF6OQnI8ChW7eJMMCAx5hniwp3Hd1x+/neJ
	hojOHhM/cKSeNOdq0jmg0TiTdfae77IixV58Ai0cMgWaM/ZFrbazoDEuFBBdTXrKQXrL/wXWeMB
	3NpLfCJexXDU9TbxIaqpnuoX6r4TFMrqaMHq5vY3Ow==
X-Google-Smtp-Source: AGHT+IHqDWNUz/KeZigVP+2fBm6l9Rhdi8pdp5RkiyA5Lr4TwoY5aGNc8rpSMR3abpZ24Sr0716z1A==
X-Received: by 2002:a17:907:1b91:b0:ab2:c282:e8ca with SMTP id a640c23a62f3a-ab2c282e946mr1186491766b.24.1736772174410;
        Mon, 13 Jan 2025 04:42:54 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90d6838sm506052766b.55.2025.01.13.04.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 04:42:54 -0800 (PST)
Date: Mon, 13 Jan 2025 13:42:53 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: yunhui cui <cuiyunhui@bytedance.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	samuel.holland@sifive.com, shuah@kernel.org
Subject: Re: [External] Re: [PATCH v3 3/3] RISC-V: selftests: Add TEST_ZICBOM
 into CBO tests
Message-ID: <20250113-28a67adb2827a1adea1c714d@orel>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-3-cuiyunhui@bytedance.com>
 <20250113-cb08bcb35bc8b6213fe89ecd@orel>
 <CAEEQ3wmOVKiy1FVdB+LggdX-7a_JMh+2A-bjG0XGF7nY0Goo2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEEQ3wmOVKiy1FVdB+LggdX-7a_JMh+2A-bjG0XGF7nY0Goo2w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_044256_176156_B870003E 
X-CRM114-Status: GOOD (  29.32  )
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

T24gTW9uLCBKYW4gMTMsIDIwMjUgYXQgMDc6NDk6MzlQTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90
ZToKPiBIaSBkcmV3LAo+IAo+IE9uIE1vbiwgSmFuIDEzLCAyMDI1IGF0IDU6MTjigK9QTSBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24s
IEphbiAxMywgMjAyNSBhdCAwNDozNjozNVBNICswODAwLCBZdW5odWkgQ3VpIHdyb3RlOgo+ID4g
PiBBZGQgdGVzdCBmb3IgWmljYm9tIGFuZCBpdHMgYmxvY2sgc2l6ZSBpbnRvIENCTyB0ZXN0cywg
d2hlbgo+ID4gPiBaaWNib20gaXMgcHJlc2VudCwgdGVzdCB0aGF0IGNiby5jbGVhbi9mbHVzaCBt
YXkgYmUgaXNzdWVkIGFuZCB3b3Jrcy4KPiA+ID4gQXMgdGhlIHNvZnR3YXJlIGNhbid0IHZlcmlm
eSB0aGUgY2xlYW4vZmx1c2ggZnVuY3Rpb25zLCB3ZSBqdXN0IGp1ZGdlZAo+ID4gPiB0aGF0IGNi
by5jbGVhbi9mbHVzaCBpc24ndCBleGVjdXRlZCBpbGxlZ2FsbHkuCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4gPiAtLS0K
PiA+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJvYmUvY2JvLmMgfCA0OSAr
KysrKysrKysrKysrKysrKystLS0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MyBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9iZS9jYm8uYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L3Jpc2N2L2h3cHJvYmUvY2JvLmMKPiA+ID4gaW5kZXggYTQwNTQxYmI3YzdkLi5iNjNlMjNmOTVl
MDggMTAwNjQ0Cj4gPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L2h3cHJv
YmUvY2JvLmMKPiA+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvaHdwcm9i
ZS9jYm8uYwo+ID4gPiBAQCAtODEsNiArODEsMzAgQEAgc3RhdGljIGJvb2wgaXNfcG93ZXJfb2Zf
MihfX3U2NCBuKQo+ID4gPiAgICAgICByZXR1cm4gbiAhPSAwICYmIChuICYgKG4gLSAxKSkgPT0g
MDsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gK3N0YXRpYyB2b2lkIHRlc3RfemljYm9tKHZvaWQgKmFy
ZykKPiA+ID4gK3sKPiA+ID4gKyAgICAgc3RydWN0IHJpc2N2X2h3cHJvYmUgcGFpciA9IHsKPiA+
ID4gKyAgICAgICAgICAgICAua2V5ID0gUklTQ1ZfSFdQUk9CRV9LRVlfWklDQk9NX0JMT0NLX1NJ
WkUsCj4gPiA+ICsgICAgIH07Cj4gPiA+ICsgICAgIGNwdV9zZXRfdCAqY3B1cyA9IChjcHVfc2V0
X3QgKilhcmc7Cj4gPiA+ICsgICAgIF9fdTY0IGJsb2NrX3NpemU7Cj4gPiA+ICsgICAgIGxvbmcg
cmM7Cj4gPiA+ICsKPiA+ID4gKyAgICAgcmMgPSByaXNjdl9od3Byb2JlKCZwYWlyLCAxLCBzaXpl
b2YoY3B1X3NldF90KSwgKHVuc2lnbmVkIGxvbmcgKiljcHVzLCAwKTsKPiA+ID4gKyAgICAgYmxv
Y2tfc2l6ZSA9IHBhaXIudmFsdWU7Cj4gPiA+ICsgICAgIGtzZnRfdGVzdF9yZXN1bHQocmMgPT0g
MCAmJiBwYWlyLmtleSA9PSBSSVNDVl9IV1BST0JFX0tFWV9aSUNCT01fQkxPQ0tfU0laRSAmJgo+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgIGlzX3Bvd2VyX29mXzIoYmxvY2tfc2l6ZSksICJa
aWNib20gYmxvY2sgc2l6ZVxuIik7Cj4gPiA+ICsgICAgIGtzZnRfcHJpbnRfbXNnKCJaaWNib20g
YmxvY2sgc2l6ZTogJWxsdVxuIiwgYmxvY2tfc2l6ZSk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgaWxs
ZWdhbF9pbnNuID0gZmFsc2U7Cj4gPiA+ICsgICAgIGNib19jbGVhbigmbWVtW2Jsb2NrX3NpemVd
KTsKPiA+ID4gKyAgICAga3NmdF90ZXN0X3Jlc3VsdCghaWxsZWdhbF9pbnNuLCAiY2JvLmNsZWFu
XG4iKTsKPiA+ID4gKwo+ID4gPiArICAgICBpbGxlZ2FsX2luc24gPSBmYWxzZTsKPiA+ID4gKyAg
ICAgY2JvX2ZsdXNoKCZtZW1bYmxvY2tfc2l6ZV0pOwo+ID4gPiArICAgICBrc2Z0X3Rlc3RfcmVz
dWx0KCFpbGxlZ2FsX2luc24sICJjYm8uZmx1c2hcbiIpOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+
ICBzdGF0aWMgdm9pZCB0ZXN0X3ppY2Jveih2b2lkICphcmcpCj4gPiA+ICB7Cj4gPiA+ICAgICAg
IHN0cnVjdCByaXNjdl9od3Byb2JlIHBhaXIgPSB7Cj4gPiA+IEBAIC0xMjksNyArMTUzLDcgQEAg
c3RhdGljIHZvaWQgdGVzdF96aWNib3oodm9pZCAqYXJnKQo+ID4gPiAgICAgICBrc2Z0X3Rlc3Rf
cmVzdWx0X3Bhc3MoImNiby56ZXJvIGNoZWNrXG4iKTsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gLXN0
YXRpYyB2b2lkIGNoZWNrX25vX3ppY2Jvel9jcHVzKGNwdV9zZXRfdCAqY3B1cykKPiA+ID4gK3N0
YXRpYyB2b2lkIGNoZWNrX25vX3ppY2JvX2NwdXMoY3B1X3NldF90ICpjcHVzLCBfX3U2NCBjYm8p
Cj4gPiA+ICB7Cj4gPiA+ICAgICAgIHN0cnVjdCByaXNjdl9od3Byb2JlIHBhaXIgPSB7Cj4gPiA+
ICAgICAgICAgICAgICAgLmtleSA9IFJJU0NWX0hXUFJPQkVfS0VZX0lNQV9FWFRfMCwKPiA+ID4g
QEAgLTEzNyw2ICsxNjEsNyBAQCBzdGF0aWMgdm9pZCBjaGVja19ub196aWNib3pfY3B1cyhjcHVf
c2V0X3QgKmNwdXMpCj4gPiA+ICAgICAgIGNwdV9zZXRfdCBvbmVfY3B1Owo+ID4gPiAgICAgICBp
bnQgaSA9IDAsIGMgPSAwOwo+ID4gPiAgICAgICBsb25nIHJjOwo+ID4gPiArICAgICBjaGFyICpj
Ym9zdHI7Cj4gPiA+Cj4gPiA+ICAgICAgIHdoaWxlIChpKysgPCBDUFVfQ09VTlQoY3B1cykpIHsK
PiA+ID4gICAgICAgICAgICAgICB3aGlsZSAoIUNQVV9JU1NFVChjLCBjcHVzKSkKPiA+ID4gQEAg
LTE0OCwxMCArMTczLDEzIEBAIHN0YXRpYyB2b2lkIGNoZWNrX25vX3ppY2Jvel9jcHVzKGNwdV9z
ZXRfdCAqY3B1cykKPiA+ID4gICAgICAgICAgICAgICByYyA9IHJpc2N2X2h3cHJvYmUoJnBhaXIs
IDEsIHNpemVvZihjcHVfc2V0X3QpLCAodW5zaWduZWQgbG9uZyAqKSZvbmVfY3B1LCAwKTsKPiA+
ID4gICAgICAgICAgICAgICBhc3NlcnQocmMgPT0gMCAmJiBwYWlyLmtleSA9PSBSSVNDVl9IV1BS
T0JFX0tFWV9JTUFfRVhUXzApOwo+ID4gPgo+ID4gPiAtICAgICAgICAgICAgIGlmIChwYWlyLnZh
bHVlICYgUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9aKQo+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAga3NmdF9leGl0X2ZhaWxfbXNnKCJaaWNib3ogaXMgb25seSBwcmVzZW50IG9uIGEgc3Vic2V0
IG9mIGhhcnRzLlxuIgo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJVc2UgdGFza3NldCB0byBzZWxlY3QgYSBzZXQgb2YgaGFydHMgd2hlcmUgWmljYm96XG4i
Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInByZXNlbmNl
IChwcmVzZW50IG9yIG5vdCkgaXMgY29uc2lzdGVudCBmb3IgZWFjaCBoYXJ0XG4iKTsKPiA+ID4g
KyAgICAgICAgICAgICBjYm9zdHIgPSBjYm8gPT0gUklTQ1ZfSFdQUk9CRV9FWFRfWklDQk9aID8g
IlppY2JveiIgOiAiWmljYm9tIjsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgIGlmIChwYWly
LnZhbHVlICYgY2JvKQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAga3NmdF9leGl0X2ZhaWxf
bXNnKCIlcyBpcyBvbmx5IHByZXNlbnQgb24gYSBzdWJzZXQgb2YgaGFydHMuXG4iCj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlVzZSB0YXNrc2V0IHRvIHNl
bGVjdCBhIHNldCBvZiBoYXJ0cyB3aGVyZSAlc1xuIgo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJwcmVzZW5jZSAocHJlc2VudCBvciBub3QpIGlzIGNvbnNp
c3RlbnQgZm9yIGVhY2ggaGFydFxuIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjYm9zdHIsIGNib3N0cik7Cj4gPiA+ICAgICAgICAgICAgICAgKytjOwo+
ID4gPiAgICAgICB9Cj4gPiA+ICB9Cj4gPiA+IEBAIC0xNTksNiArMTg3LDcgQEAgc3RhdGljIHZv
aWQgY2hlY2tfbm9femljYm96X2NwdXMoY3B1X3NldF90ICpjcHVzKQo+ID4gPiAgZW51bSB7Cj4g
PiA+ICAgICAgIFRFU1RfWklDQk9aLAo+ID4gPiAgICAgICBURVNUX05PX1pJQ0JPWiwKPiA+ID4g
KyAgICAgVEVTVF9aSUNCT00sCj4gPiA+ICAgICAgIFRFU1RfTk9fWklDQk9NLAo+ID4gPiAgfTsK
PiA+ID4KPiA+ID4gQEAgLTE2OSw2ICsxOTgsNyBAQCBzdGF0aWMgc3RydWN0IHRlc3RfaW5mbyB7
Cj4gPiA+ICB9IHRlc3RzW10gPSB7Cj4gPiA+ICAgICAgIFtURVNUX1pJQ0JPWl0gICAgICAgICAg
ID0geyAubnJfdGVzdHMgPSAzLCB0ZXN0X3ppY2JveiB9LAo+ID4gPiAgICAgICBbVEVTVF9OT19a
SUNCT1pdICAgICAgICA9IHsgLm5yX3Rlc3RzID0gMSwgdGVzdF9ub196aWNib3ogfSwKPiA+ID4g
KyAgICAgW1RFU1RfWklDQk9NXSAgICAgICAgICAgPSB7IC5ucl90ZXN0cyA9IDMsIHRlc3Rfemlj
Ym9tIH0sCj4gPiA+ICAgICAgIFtURVNUX05PX1pJQ0JPTV0gICAgICAgID0geyAubnJfdGVzdHMg
PSAzLCB0ZXN0X25vX3ppY2JvbSB9LAo+ID4gPiAgfTsKPiA+ID4KPiA+ID4gQEAgLTIwNiw3ICsy
MzYsMTQgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQo+ID4gPiAgICAgICAgICAg
ICAgIHRlc3RzW1RFU1RfWklDQk9aXS5lbmFibGVkID0gdHJ1ZTsKPiA+ID4gICAgICAgICAgICAg
ICB0ZXN0c1tURVNUX05PX1pJQ0JPWl0uZW5hYmxlZCA9IGZhbHNlOwo+ID4gPiAgICAgICB9IGVs
c2Ugewo+ID4gPiAtICAgICAgICAgICAgIGNoZWNrX25vX3ppY2Jvel9jcHVzKCZjcHVzKTsKPiA+
ID4gKyAgICAgICAgICAgICBjaGVja19ub196aWNib19jcHVzKCZjcHVzLCBSSVNDVl9IV1BST0JF
X0VYVF9aSUNCT1opOwo+ID4gPiArICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgaWYgKHBhaXIu
dmFsdWUgJiBSSVNDVl9IV1BST0JFX0VYVF9aSUNCT00pIHsKPiA+ID4gKyAgICAgICAgICAgICB0
ZXN0c1tURVNUX1pJQ0JPTV0uZW5hYmxlZCA9IHRydWU7Cj4gPiA+ICsgICAgICAgICAgICAgdGVz
dHNbVEVTVF9OT19aSUNCT01dLmVuYWJsZWQgPSBmYWxzZTsKPiA+ID4gKyAgICAgfSBlbHNlIHsK
PiA+ID4gKyAgICAgICAgICAgICBjaGVja19ub196aWNib19jcHVzKCZjcHVzLCBSSVNDVl9IV1BS
T0JFX0VYVF9aSUNCT00pOwo+ID4gPiAgICAgICB9Cj4gPiA+Cj4gPiA+ICAgICAgIGZvciAoaSA9
IDA7IGkgPCBBUlJBWV9TSVpFKHRlc3RzKTsgKytpKQo+ID4gPiAtLQo+ID4gPiAyLjM5LjIKPiA+
ID4KPiA+Cj4gPiBUaGUgdGVzdF9ub196aWNib20oKSB0ZXN0IG5lZWRzIHRvIGhhdmUgdGhlIGls
bGVnYWwgaW5zdHJ1Y3Rpb24gU0lHSUxMCj4gPiB0ZXN0IGZvciBjYm8uaW52YWwgbW92ZWQgb3V0
IGludG8gaXRzIG93biB0ZXN0LiBTbywgZXZlbiB3aGVuIHdlIGhhdmUKPiA+IHppY2JvbSB3ZSBz
dGlsbCB0ZXN0IHRoYXQgY2JvLmludmFsIGdlbmVyYXRlcyBhIFNJR0lMTC4KPiAKPiBEbyB5b3Ug
bWVhbiBtb3ZpbmcgY2JvX2ludmFsKCkgaW50byB0ZXN0X3ppY2JvbSgpPyBUaGVuIGRvZXMKPiBj
Ym9faW52YWwoJm1lbVswXSkgYWxzbyBuZWVkIHRvIGJlIHRlc3RlZCBpbiB0ZXN0X25vX3ppY2Jv
bSgpPwoKTm8sIEknZCBjcmVhdGUgYSBuZXcgdGVzdCBuYW1lZCB0ZXN0X25vX2Nib19pbnZhbCgp
LCB3aGljaCBzaG91bGQgYWx3YXlzCnJ1biByZWdhcmRsZXNzIG9mIHppY2JvbS96aWNib3ogZGV0
ZWN0aW9uLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
