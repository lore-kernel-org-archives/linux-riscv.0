Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993CFEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2rqoeKB+sHyuAgkhHJk12VSKoDSziz4352jFI8Oh5Y=; b=kLO/kMQsjbZYhx
	ktuJyAYZudZOrlWO6vpZkphYEXm+pwjVMwVvWHY0EdHBcorKnyoxl9ptqgPrDr5B8wIrjG/wHMw3A
	Ea0TA4pLbcf3sz1HEB8ZAvKR2hLTfd9VqFeKDRRlddtuVvwwrOXkBp0PSaw1x1L2r4qfvPLk0Tt9B
	G0yJL9szy85ievSrG/dpH7Yeoy+pQ5yI1Wk5Zml8Pi2kMnIoXu1aa53bBlmu0zfwIUYIGE/jbWN2N
	axAbq5msCKp1GlWNVI1ETDcY0TZIcf9pr4pX+cOjIjQ9KGsHcKSalXY5fwy9VSAIrx/4RGr7iEIJ7
	cHeQWnpi3ViBqkVjnnXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdjn-000mb7-2S;
	Wed, 12 Jul 2023 17:34:51 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdjl-000mZ3-0h
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:34:50 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so11712775e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 10:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689183282; x=1691775282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Kn9GKWzSCL2y3w2iBtXzlaPYZE6roRbs1qwKy/TmHY=;
        b=o6+YFgzBDpsGfJuM/ertNh1ht/TceQDD5URMBDxiTzgooE3nIvHSeo2ebIf1in/J7A
         +F/OptuLwzFhjBxN2yMdo0uxGPfdfmlYgE5duf+IWZZFl4dW+F+tkI1KnIkAXsG5ExNa
         0tRzmewVAtiO7Kch2Ml/5iQwg2aE0ES/KR3tgvYqknmWCG2OZIyGnVtS8hO+/aFOjARf
         U8L72Wzsve03ef41G8okxF49C32zxtmTRMIj6xvdb+AkwLXrLo3B226rTerhSxAu6yAC
         6ENUpGSc5LR0Iem+lN2brhVBBb20EMb7wvfwBXzbDv4BNRg1eATMXMfX/IaJNI5Kjwh+
         0NnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689183282; x=1691775282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Kn9GKWzSCL2y3w2iBtXzlaPYZE6roRbs1qwKy/TmHY=;
        b=ciqWxC9nju3VMgQ4EQf5r++ihZZkh3ON17HYqfzVYUBg4GF7W9cM0qCliX1ubpUAtR
         UplRBqKaWZYKpAtwEcHUDD0/iZVIljRNJWCsRKmrUfdBTM88uVFcPiUuRbbIPst60/OV
         DpdBir6pHLUBFT+blC+QSfwJc3LtpuzA7C4BZ+eM/TYBUoLxidiZcwIjRfGnRZo4Dqh4
         bfcHGtWY/mqnbIAqeQ3xTGbfpxzVPZ+6fmCHomBV0QlrSYVQwbq3RRXlSB81NILXuAO3
         pQsJUTX9Hx5ys+ob92SkCMnEQLfJKiWTWpgVfdGZzJ24uB3LIuAb+zUibBAfDAcjeD00
         qjlw==
X-Gm-Message-State: ABy/qLb7dBDENceVrpS9/eIrQlbC6eWqw+KOL7inAspEev37RpV+B2dJ
	JcWhI2hbHcI3weyfTY+cKz+CXbzk404kl2b2m5A4Tw==
X-Google-Smtp-Source: APBJJlGLe1857hveLUdO5LGGF1AxUUzRt+f/c/dzcQTQoh/f/dXe05qgO01maJoi+rxEnXtAHpOuHL5xkN7wEJ1BXNk=
X-Received: by 2002:a05:6512:114b:b0:4f9:ec5e:d624 with SMTP id
 m11-20020a056512114b00b004f9ec5ed624mr18739314lfg.38.1689183282151; Wed, 12
 Jul 2023 10:34:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230710-equipment-stained-dd042d66ba5d@wendy> <20230710-banker-visible-4c4cb3685dc1@wendy>
In-Reply-To: <20230710-banker-visible-4c4cb3685dc1@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 12 Jul 2023 10:34:06 -0700
Message-ID: <CALs-HsstyS+qFJZjb7Lv_2LmygfhA_EAeEdoCSRhtaXnYfhw0w@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] RISC-V: repurpose riscv_isa_ext array in riscv_fill_hwcap()
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_103449_252704_602E2CD6 
X-CRM114-Status: GOOD (  23.31  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgMjozNuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gSW4gcmlzY3ZfZmlsbF9od2NhcCgpIHJpc2N2
X2lzYV9leHQgYXJyYXkgY2FuIGJlIGxvb3BlZCBvdmVyLCByYXRoZXIKPiB0aGFuIGR1cGxpY2F0
aW5nIHRoZSBsaXN0IG9mIGV4dGVuc2lvbnMgd2l0aCBpbmRpdmlkdWFsCj4gU0VUX0lTQV9FWFRf
TUFQKCkgdXNhZ2UuIFdoaWxlIGF0IGl0LCBkcm9wIHRoZSBzdGF0ZW1lbnQtb2YtdGhlLW9idmlv
dXMKPiBjb21tZW50cyBmcm9tIHRoZSBzdHJ1Y3QsIHJlbmFtZSB1cHJvcCB0byBzb21ldGhpbmcg
bW9yZSBzdWl0YWJsZSBmb3IKPiBpdHMgbmV3IHVzZSAmIGNvbnN0aWZ5IHRoZSBtZW1iZXJzLgo+
Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
PiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+IC0gRGVsZXRlIHRoZSBub3cgdW51c2VkIGRlZmluaXRp
b24KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHwgIDcgKystLS0tLQo+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyAgICAgICAgfCAgNSArKystLQo+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAyNiArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAz
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vaHdjYXAuaAo+IGluZGV4IDdhNTdlNjEwOWFlZi4uMjQ2MGFjMmZjN2VkIDEwMDY0
NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vaHdjYXAuaAo+IEBAIC01NSw3ICs1NSw2IEBACj4gICNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9aSUhQTSAgICAgICAgICAgIDQyCj4KPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhU
X01BWCAgICAgICAgICAgICAgNjQKPiAtI2RlZmluZSBSSVNDVl9JU0FfRVhUX05BTUVfTEVOX01B
WCAgICAgMzIKPgo+ICAjaWZkZWYgQ09ORklHX1JJU0NWX01fTU9ERQo+ICAjZGVmaW5lIFJJU0NW
X0lTQV9FWFRfU3hBSUEgICAgICAgICAgICBSSVNDVl9JU0FfRVhUX1NNQUlBCj4gQEAgLTcwLDEw
ICs2OSw4IEBACj4gIHVuc2lnbmVkIGxvbmcgcmlzY3ZfZ2V0X2VsZl9od2NhcCh2b2lkKTsKPgo+
ICBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhIHsKPiAtICAgICAgIC8qIE5hbWUgb2YgdGhlIGV4
dGVuc2lvbiBkaXNwbGF5ZWQgdG8gdXNlcnNwYWNlIHZpYSAvcHJvYy9jcHVpbmZvICovCj4gLSAg
ICAgICBjaGFyIHVwcm9wW1JJU0NWX0lTQV9FWFRfTkFNRV9MRU5fTUFYXTsKPiAtICAgICAgIC8q
IFRoZSBsb2dpY2FsIElTQSBleHRlbnNpb24gSUQgKi8KPiAtICAgICAgIHVuc2lnbmVkIGludCBp
c2FfZXh0X2lkOwo+ICsgICAgICAgY29uc3QgdW5zaWduZWQgaW50IGlkOwo+ICsgICAgICAgY29u
c3QgY2hhciAqbmFtZTsKPiAgfTsKPgo+ICBleHRlcm4gY29uc3Qgc3RydWN0IHJpc2N2X2lzYV9l
eHRfZGF0YSByaXNjdl9pc2FfZXh0W107Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L2NwdS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiBpbmRleCBiZjkzMjkzZDUxZjMuLmFh
MTdlZWIwZWM5YSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gQEAgLTE2OCw5ICsxNjgsMTAgQEAgc3RhdGljIHZv
aWQgcHJpbnRfaXNhX2V4dChzdHJ1Y3Qgc2VxX2ZpbGUgKmYpCj4gIHsKPiAgICAgICAgIGZvciAo
aW50IGkgPSAwOyBpIDwgcmlzY3ZfaXNhX2V4dF9jb3VudDsgaSsrKSB7Cj4gICAgICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCByaXNjdl9pc2FfZXh0X2RhdGEgKmVkYXRhID0gJnJpc2N2X2lzYV9l
eHRbaV07Cj4gLSAgICAgICAgICAgICAgIGlmICghX19yaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWls
YWJsZShOVUxMLCBlZGF0YS0+aXNhX2V4dF9pZCkpCj4gKyAgICAgICAgICAgICAgIGlmICghX19y
aXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBlZGF0YS0+aWQpKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IC0gICAgICAgICAgICAgICBzZXFfcHJpbnRmKGYs
ICJfJXMiLCBlZGF0YS0+dXByb3ApOwo+ICsKPiArICAgICAgICAgICAgICAgc2VxX3ByaW50Zihm
LCAiXyVzIiwgZWRhdGEtPm5hbWUpOwo+ICAgICAgICAgfQo+ICB9Cj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCj4gaW5kZXggZmI0NzYxNTNmZmZjLi42ZDhjZDQ1YWY3MjMgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
Y3B1ZmVhdHVyZS5jCj4gQEAgLTk5LDExICs5OSwxMCBAQCBzdGF0aWMgYm9vbCByaXNjdl9pc2Ff
ZXh0ZW5zaW9uX2NoZWNrKGludCBpZCkKPiAgICAgICAgIHJldHVybiB0cnVlOwo+ICB9Cj4KPiAt
I2RlZmluZSBfX1JJU0NWX0lTQV9FWFRfREFUQShVUFJPUCwgRVhUSUQpIFwKPiAtICAgICAgIHsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
IC0gICAgICAgICAgICAgICAudXByb3AgPSAjVVBST1AsICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gLSAgICAgICAgICAgICAgIC5pc2FfZXh0X2lkID0gRVhUSUQsICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiAtICAgICAgIH0KPiArI2RlZmluZSBfX1JJU0NWX0lTQV9F
WFRfREFUQShfbmFtZSwgX2lkKSB7ICAgICBcCj4gKyAgICAgICAubmFtZSA9ICNfbmFtZSwgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgLmlkID0gX2lkLCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArfQo+Cj4gIC8qCj4gICAqIFRoZSBjYW5vbmljYWwgb3JkZXIg
b2YgSVNBIGV4dGVuc2lvbiBuYW1lcyBpbiB0aGUgSVNBIHN0cmluZyBpcyBkZWZpbmVkIGluCj4g
QEAgLTM2NiwyMCArMzY1LDkgQEAgdm9pZCBfX2luaXQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzZXRfYml0KG5yLCBpc2Fp
bmZvLT5pc2EpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAvKiBzb3J0ZWQgYWxwaGFiZXRpY2FsbHkgKi8KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFNFVF9JU0FfRVhUX01BUCgic21haWEiLCBSSVNDVl9JU0FfRVhUX1NNQUlBKTsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgic3NhaWEiLCBS
SVNDVl9JU0FfRVhUX1NTQUlBKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNF
VF9JU0FfRVhUX01BUCgic3Njb2ZwbWYiLCBSSVNDVl9JU0FfRVhUX1NTQ09GUE1GKTsKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgic3N0YyIsIFJJU0NW
X0lTQV9FWFRfU1NUQyk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRVRfSVNB
X0VYVF9NQVAoInN2aW52YWwiLCBSSVNDVl9JU0FfRVhUX1NWSU5WQUwpOwo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgU0VUX0lTQV9FWFRfTUFQKCJzdm5hcG90IiwgUklTQ1ZfSVNB
X0VYVF9TVk5BUE9UKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0Ff
RVhUX01BUCgic3ZwYm10IiwgUklTQ1ZfSVNBX0VYVF9TVlBCTVQpOwo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgU0VUX0lTQV9FWFRfTUFQKCJ6YmEiLCBSSVNDVl9JU0FfRVhUX1pC
QSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VYVF9NQVAoInpi
YiIsIFJJU0NWX0lTQV9FWFRfWkJCKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFNFVF9JU0FfRVhUX01BUCgiemJzIiwgUklTQ1ZfSVNBX0VYVF9aQlMpOwo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgU0VUX0lTQV9FWFRfTUFQKCJ6aWNib20iLCBSSVNDVl9JU0Ff
RVhUX1pJQ0JPTSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VY
VF9NQVAoInppY2JveiIsIFJJU0NWX0lTQV9FWFRfWklDQk9aKTsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgiemloaW50cGF1c2UiLCBSSVNDVl9JU0Ff
RVhUX1pJSElOVFBBVVNFKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZvciAo
aW50IGkgPSAwOyBpIDwgcmlzY3ZfaXNhX2V4dF9jb3VudDsgaSsrKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VYVF9NQVAocmlzY3ZfaXNhX2V4dFtp
XS5uYW1lLAoKRG9lcyB0aGlzIHN0aWxsIHdvcmssIGdpdmVuIHRoYXQgU0VUX0lTQV9FWFRfTUFQ
KCkgZG9lcyBzaXplb2YobmFtZSkKdG8gZ2V0IHRoZSBzdHJpbmcgbGVuZ3RoPyBJIHdvcnJ5IHRo
YXQgbGluZSBvZiB0aGUgbWFjcm8gaXMgbm93CmV2YWx1YXRpbmcgdG8gYSBjb25zdGFudCBzaXpl
b2YocG9pbnRlciksIGFuZCB0aGUgbWFjcm8gbmVlZHMgdG8KY2hhbmdlIHRvIHVzZSBzdHJsZW4o
KS4KCi1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
