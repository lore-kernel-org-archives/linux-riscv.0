Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C16AE83840
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIX995xpsp4yaVCdckPWChfmwvRtlYPFAM1eLoTJa0s=; b=ZqNAc5mA0aG3XS
	FrU4Usyy2LbXBEZPsd76K4BvS8iSGkWu9jaOvm96osIwM8vcOj5632EYokp5XfzwdLsZCmY5Jb3Kr
	yQFgJvokSqsgFtmMl6q8KuLP/0U1IONcHxoLZQsMUSyd/KHpGzFTBUspyKHlBRoQ0dSZ/Mbmdxg0a
	zwcfZrv+fK7ieIUmBW37kd70Dgt/okStiQxoKxh5FdqTGvEfhk+HpYqnN62huZ6doYk0mdS6rSvy7
	zHMtC5g+WUn8MBOrKGwNmOhqSGELhIRTXBr2Zj+KJQJqabskEBW9zzZ7L4r0HCuPHrb86T5tAdT8H
	pQU5CG8yvg56OJINsp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6uU-00000007Kxn-42Yp;
	Mon, 16 Feb 2026 22:17:42 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6uS-00000007Kwm-17Tj
	for linux-riscv@lists.infradead.org;
	Mon, 16 Feb 2026 22:17:41 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-797d6f934e2so8513627b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 16 Feb 2026 14:17:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771280259; cv=none;
        d=google.com; s=arc-20240605;
        b=GfValPst5Vhpa/hTbIZzz49bvpIIDlchIbSjjS5cQRPhGXCwvpe10h5u9+7BVFmuW6
         U7LdA6nkX3n1qsNnBci5HqPOsWKkg6I7ttg8NmgMjhml4JZqKLjKv+7A5zzG8ngl57hg
         +pAxAgzbif3AzAj8SrbmxAOjTt8z8G4pAv9spV5+zswI3bcDC66A0fmvk/t9eZ6CAPnL
         t8hPsGEhXJUzQKY3c7Gsp4gv9og4rMG4tje+c1zrsdZvySqze04X4xWY0b7ueXh2AqMN
         fy3wQEzNWoog1A+z11uXS2q0pAECvr8sS5pUrk+qr/z5EqncqyUe9EVbJpHXoKVBg9Xr
         EcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fbDbwMbQLt5XbpuHjhGQIUh0CrFsQYIf/s77CykekJo=;
        fh=qj+yr5iHPp/NqY+esZkppmbjk6HT/UDNWIuypBx4UFU=;
        b=gA6260dXh3hML53Ia/5NsfIHvaa5dQfve2rxIE0Z+8h0iWIPg/nFzyqQhGYD5SGUM5
         j8erzmGICBH6W3yT8jDcKfLNpwZZBrkDlhlma9+T3p6IFtm3+KEIGEsLnb2Tgo3x0n1R
         SHsio/NFqOpbsD2CjS2Akf+I3UYdDqFCkBi2Gxffsl160fkDZR9UOOIE2Zs+pl0Vq10O
         QgJBVYQF3z2GDIB7o/eyo2ewuV/8iSL82m4A17h3REOJtHPMnxzY03dqIY/n4lIIIzKG
         lrepA0skHfsdbG29r4cT55UFWww6gNxJRmqOqmFcarcQiIzLAAjSK1AHNu7hJ06F5WGJ
         P08A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771280259; x=1771885059; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbDbwMbQLt5XbpuHjhGQIUh0CrFsQYIf/s77CykekJo=;
        b=SM4LpEgU5eXpEzNOPT96jR1kT29OVjmtcwXKshcbvpnXzDAmie7M61JGiZD04iXIiU
         sh4YuqIeh+Jb6wMkvddJDgXaIuCet/3A5hhTaBqVkGRQAAmSqQKLWnreQUbUWLV8/fE5
         iV3ANAGQP1glLHsL87wWLGyra20NI9Jau6a4j72nWSxYKS8WZj40eRPO5GUij5AQchtN
         APGGdAegmChY/zn7bTkh7mK9nCVXbIK4jzDAusyIvyLeyxwaWLwC9PwqwaD2XNaljwha
         FjXGsuIKlMXPI4QlaTQEUujaItTilH8+0AK3Ogs98XTjsUASPZp1mQj6W8HEi2ImImFt
         j01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771280259; x=1771885059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbDbwMbQLt5XbpuHjhGQIUh0CrFsQYIf/s77CykekJo=;
        b=vsWKOuQCcofnYqBkmfMErFjZHKXvvfJ9+XFfV03LAwt2iS8DevJDkywuXYjzsfWBcM
         KXcGZIRqfFOrYZipdjfrTCnPvljUlqDOFfT7YDsZhsook8dJ0l+z+LlE/98VSekDjH/Y
         +tvjpd8Qf25sSJc9NcqzrW4BRryY4RlLn/L1E1qPMiI2KypEYhKYHMJ2veTbRZyPO25W
         T2Z+sNNT/eip02Tfvzv94Tju7pKsSPp6WsjfZmC9+MWBNSfWtExicCUzs8WoafvjmR10
         sTO/u+BWTf4XZzHBb21TJ+MVcGg2Dz9296vbnz044TZAg4GZ/jJVvvQfp6YibBw85SSh
         shtg==
X-Forwarded-Encrypted: i=1; AJvYcCWmT4q99cgrTX+66cQ5FBlo2Cs3R5oFm1PRZBQyxL1aRmG1KZDOiObqu2T5uKKVPwegqjSHN1rKapR8Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsgwblQIzh2Wj9CQZOBGkW4GV9ts6z4TIHYPXr5etc/r6VrO4T
	yOXylJ9dh6JZ3tbaUvSTCowDJC4yeofTlnVjdNJI6Nc6bRlFnHmgTbMk4JDAs+eH3P2L7wz062P
	dzO1HrjxENegpYeo6nN8jwO02cZNp0SbGC2+NCqlukA==
X-Gm-Gg: AZuq6aL0oYDs0Pq72EILoFOVCFAgNpyhnUheZROje9Wdg3sIqHKSLDMGQL552+8lDIx
	N8cL5V7FvqZ8bRtLKfJk1yeU/bUySZcEtQxNNB7kv7Dxk+E2Fi8Dr6/LJHYPHdlUEuGlcUycLpn
	xlUyyGiL/macRUrGFrfAmM+c16VM+bi+b3g00QdGbzhbGIHhl8nZHNRnc6zPlSZS3vtdhAN1ZJK
	Y4LJOMtF9I3H8PPomXg6GqXvVTKs4MU8/CkJUAuh209QpkBF9gD4LbNVVZCIgwoVM42Mi/NcD5j
	RfhxQRkQTnx5TafTK1nh0uBVDWAv6c95T3EUI47MXHbW5DT8A//O9a08Z6dbmFIMI2mb4A==
X-Received: by 2002:a05:690c:ed5:b0:796:312a:b817 with SMTP id
 00721157ae682-797a0c0a56amr85503357b3.9.1771280259025; Mon, 16 Feb 2026
 14:17:39 -0800 (PST)
MIME-Version: 1.0
References: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
 <20260130-atlantis-clocks-v4-2-46de52d52924@oss.tenstorrent.com> <d17eaa6b5fcb22a4c06f7c36408fb919ec60b45e.camel@pengutronix.de>
In-Reply-To: <d17eaa6b5fcb22a4c06f7c36408fb919ec60b45e.camel@pengutronix.de>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 16 Feb 2026 16:17:27 -0600
X-Gm-Features: AaiRm50q4OGcgQ2WR3mQNWcX2yR9Qi1_VyUxZhZmCORJZkYdV6XOGqE6n6kyxlM
Message-ID: <CAEev2e_uMb+fSQymuNuMZvLDatCTKnHmUQ-d-PkautDjeBND+A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] reset: tenstorrent: Add reset controller for Atlantis
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
	bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_141740_321349_AC942B65 
X-CRM114-Status: GOOD (  26.55  )
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

SGVsbyBQaGlsaXBwLAoKT24gTW9uLCBGZWIgMiwgMjAyNiBhdCA4OjA14oCvQU0gUGhpbGlwcCBa
YWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiBGciwgMjAyNi0wMS0z
MCBhdCAxMTo1MCAtMDYwMCwgQW5pcnVkaCBTcmluaXZhc2FuIHdyb3RlOgo+ID4gQWRkcyBBdGxh
bnRpcyBSZXNldCBDb250cm9sbGVyIGFuZCBhdXhpbGlhcnkgZGV2aWNlIGRlZmluaXRpb25zIGZv
cgo+ID4gcmVzZXQgdG8gc2hhcmUgc2FtZSByZWdtYXAgaW50ZXJmYWNlIGFzIHByY20gKGNsb2Nr
IGNvbnRyb2xsZXIpLgo+ID4KPiA+IFRoaXMgdmVyc2lvbiBvZiB0aGUgcmVzZXQgY29udHJvbGxl
ciBkcml2ZXIgY292ZXJzIHJlc2V0cyBmcm9tIHRoZSBSQ1BVCj4gPiBwcmNtLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFuaXJ1ZGggU3Jpbml2YXNhbiA8YXNyaW5pdmFzYW5Ab3NzLnRlbnN0b3Jy
ZW50LmNvbT4KPiA+IC0tLQo+ID4gIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArCj4gPiAgZHJpdmVycy9yZXNldC9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgIHwgIDExICsrCj4gPiAgZHJpdmVycy9yZXNldC9NYWtlZmlsZSAgICAgICAgICAgICAg
ICAgICAgIHwgICAxICsKPiA+ICBkcml2ZXJzL3Jlc2V0L3Jlc2V0LXRlbnN0b3JyZW50LWF0bGFu
dGlzLmMgfCAxNjAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBpbmNsdWRlL3Nv
Yy90ZW5zdG9ycmVudC9hdGxhbnRpcy1wcmNtLmggICAgfCAgMzEgKysrKysrCj4gPiAgNSBmaWxl
cyBjaGFuZ2VkLCAyMDUgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9NQUlOVEFJ
TkVSUyBiL01BSU5UQUlORVJTCj4gPiBpbmRleCAwZmM3YmM2ZDA0NTguLjBjZGUxNzc0NTY3ZCAx
MDA2NDQKPiA+IC0tLSBhL01BSU5UQUlORVJTCj4gPiArKysgYi9NQUlOVEFJTkVSUwo+ID4gQEAg
LTIyNTM3LDcgKzIyNTM3LDkgQEAgVDogICAgZ2l0IGh0dHBzOi8vZ2l0aHViLmNvbS90ZW5zdG9y
cmVudC9saW51eC5naXQKPiA+ICBGOiAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jbG9jay90ZW5zdG9ycmVudCxhdGxhbnRpcy1wcmNtLnlhbWwKPiA+ICBGOiAgIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi90ZW5zdG9ycmVudC55YW1sCj4gPiAgRjog
ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RlbnN0b3JyZW50Lwo+ID4gK0Y6ICAgZHJpdmVycy9yZXNl
dC9yZXNldC10ZW5zdG9ycmVudC1hdGxhbnRpcy5jCj4gPiAgRjogICBpbmNsdWRlL2R0LWJpbmRp
bmdzL2Nsb2NrL3RlbnN0b3JyZW50LGF0bGFudGlzLXByY20uaAo+ID4gK0Y6ICAgaW5jbHVkZS9z
b2MvdGVuc3RvcnJlbnQvCj4gPgo+ID4gIFJJU0MtViBUSEVBRCBTb0MgU1VQUE9SVAo+ID4gIE06
ICAgRHJldyBGdXN0aW5pIDxmdXN0aW5pQGtlcm5lbC5vcmc+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9yZXNldC9LY29uZmlnIGIvZHJpdmVycy9yZXNldC9LY29uZmlnCj4gPiBpbmRleCA2ZTVk
NmRlZmZhN2QuLmNhZGU3NzcxNzQ5MiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcmVzZXQvS2Nv
bmZpZwo+ID4gKysrIGIvZHJpdmVycy9yZXNldC9LY29uZmlnCj4gPiBAQCAtMzI0LDYgKzMyNCwx
NyBAQCBjb25maWcgUkVTRVRfU1VOWEkKPiA+ICAgICAgIGhlbHAKPiA+ICAgICAgICAgVGhpcyBl
bmFibGVzIHRoZSByZXNldCBkcml2ZXIgZm9yIEFsbHdpbm5lciBTb0NzLgo+ID4KPiA+ICtjb25m
aWcgUkVTRVRfVEVOU1RPUlJFTlRfQVRMQU5USVMKPiA+ICsgICAgIHRyaXN0YXRlICJUZW5zdG9y
cmVudCBhdGxhbnRpcyByZXNldCBkcml2ZXIiCj4gPiArICAgICBkZXBlbmRzIG9uIEFSQ0hfVEVO
U1RPUlJFTlQgfHwgQ09NUElMRV9URVNUCj4gPiArICAgICBzZWxlY3QgQVVYSUxJQVJZX0JVUwo+
ID4gKyAgICAgZGVmYXVsdCBBUkNIX1RFTlNUT1JSRU5UCj4gPiArICAgICBoZWxwCj4gPiArICAg
ICAgIFRoaXMgZW5hYmxlcyB0aGUgZHJpdmVyIGZvciB0aGUgcmVzZXQgY29udHJvbGxlcgo+ID4g
KyAgICAgICBwcmVzZW50IGluIHRoZSBUZW5zdG9ycmVudCBBdGxhbnRpcyBTb0MuCj4gPiArICAg
ICAgIEVuYWJsZSB0aGlzIG9wdGlvbiB0byBiZSBhYmxlIHRvIHVzZSBoYXJkd2FyZQo+ID4gKyAg
ICAgICByZXNldHMgb24gQXRhbGFudGlzIGJhc2VkIHN5c3RlbXMuCj4gPiArCj4gPiAgY29uZmln
IFJFU0VUX1RIMTUyMAo+ID4gICAgICAgdHJpc3RhdGUgIlQtSEVBRCBUSDE1MjAgcmVzZXQgY29u
dHJvbGxlciIKPiA+ICAgICAgIGRlcGVuZHMgb24gQVJDSF9USEVBRCB8fCBDT01QSUxFX1RFU1QK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Jlc2V0L01ha2VmaWxlIGIvZHJpdmVycy9yZXNldC9N
YWtlZmlsZQo+ID4gaW5kZXggOWMzZTQ4NGRmZDgxLi5hMzE5NTlkYTBhODggMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL3Jlc2V0L01ha2VmaWxlCj4gPiArKysgYi9kcml2ZXJzL3Jlc2V0L01ha2Vm
aWxlCj4gPiBAQCAtNDEsNiArNDEsNyBAQCBvYmotJChDT05GSUdfUkVTRVRfU09DRlBHQSkgKz0g
cmVzZXQtc29jZnBnYS5vCj4gPiAgb2JqLSQoQ09ORklHX1JFU0VUX1NQQUNFTUlUKSArPSByZXNl
dC1zcGFjZW1pdC5vCj4gPiAgb2JqLSQoQ09ORklHX1JFU0VUX1NVTlBMVVMpICs9IHJlc2V0LXN1
bnBsdXMubwo+ID4gIG9iai0kKENPTkZJR19SRVNFVF9TVU5YSSkgKz0gcmVzZXQtc3VueGkubwo+
ID4gK29iai0kKENPTkZJR19SRVNFVF9URU5TVE9SUkVOVF9BVExBTlRJUykgKz0gcmVzZXQtdGVu
c3RvcnJlbnQtYXRsYW50aXMubwo+ID4gIG9iai0kKENPTkZJR19SRVNFVF9USDE1MjApICs9IHJl
c2V0LXRoMTUyMC5vCj4gPiAgb2JqLSQoQ09ORklHX1JFU0VUX1RJX1NDSSkgKz0gcmVzZXQtdGkt
c2NpLm8KPiA+ICBvYmotJChDT05GSUdfUkVTRVRfVElfU1lTQ09OKSArPSByZXNldC10aS1zeXNj
b24ubwo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzZXQvcmVzZXQtdGVuc3RvcnJlbnQtYXRs
YW50aXMuYyBiL2RyaXZlcnMvcmVzZXQvcmVzZXQtdGVuc3RvcnJlbnQtYXRsYW50aXMuYwo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNmZlOTE0M2FkNzZj
Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9kcml2ZXJzL3Jlc2V0L3Jlc2V0LXRlbnN0b3Jy
ZW50LWF0bGFudGlzLmMKPiA+IEBAIC0wLDAgKzEsMTYwIEBACj4gPiArLy8gU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+ICsvKgo+ID4gKyAqIFRlbnN0b3JyZW50IEF0bGFudGlz
IFBSQ00gUmVzZXQgRHJpdmVyCj4gPiArICoKPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjYgVGVu
c3RvcnJlbnQKPiA+ICsgKi8KPiA+ICsKPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sv
dGVuc3RvcnJlbnQsYXRsYW50aXMtcHJjbS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9hdXhpbGlh
cnlfYnVzLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3Jlc2V0LWNvbnRyb2xsZXIuaD4KPiA+ICsj
aW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gPiArI2luY2x1ZGUgPHNvYy90ZW5zdG9ycmVudC9h
dGxhbnRpcy1wcmNtLmg+Cj4gPiArCj4gPiArc3RydWN0IGF0bGFudGlzX3Jlc2V0X2RhdGEgewo+
ID4gKyAgICAgdTggYml0Owo+ID4gKyAgICAgdTE2IHJlZzsKPiA+ICsgICAgIGJvb2wgYWN0aXZl
X2xvdzsKPiA+ICt9Owo+ID4gKwo+ID4gK3N0cnVjdCBhdGxhbnRpc19yZXNldF9jb250cm9sbGVy
X2RhdGEgewo+ID4gKyAgICAgY29uc3Qgc3RydWN0IGF0bGFudGlzX3Jlc2V0X2RhdGEgKnJlc2V0
X2RhdGE7Cj4gPiArICAgICBzaXplX3QgY291bnQ7Cj4gPiArfTsKPiA+ICsKPiA+ICtzdHJ1Y3Qg
YXRsYW50aXNfcmVzZXRfY29udHJvbGxlciB7Cj4gPiArICAgICBzdHJ1Y3QgcmVzZXRfY29udHJv
bGxlcl9kZXYgcmNkZXY7Cj4gPiArICAgICBjb25zdCBzdHJ1Y3QgYXRsYW50aXNfcmVzZXRfY29u
dHJvbGxlcl9kYXRhICpkYXRhOwo+ID4gKyAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ID4g
K307Cj4gPiArCj4gPiArI2RlZmluZSB0b19hdGxhbnRpc19yZXNldF9jb250cm9sbGVyKF9yY2Rl
dikgXAo+ID4gKyAgICAgY29udGFpbmVyX29mKChfcmNkZXYpLCBzdHJ1Y3QgYXRsYW50aXNfcmVz
ZXRfY29udHJvbGxlciwgcmNkZXYpCj4KPiBQbGVhc2UgbWFrZSB0aGlzIGFuIGlubGluZSBmdW5j
dGlvbiBhcyB3ZWxsLiBXaXRoIHRoYXQsCj4KPiBSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8
cC56YWJlbEBwZW5ndXRyb25peC5kZT4KCkkndmUgbWFkZSBzb21lIG5vbi10cml2aWFsIGNoYW5n
ZXMgdG8gdGhlIHJlc2V0IGRyaXZlciBpbiB2NiBiYXNlZCBvbgpzb21lIGNvbW1lbnRzIEkgcmVj
ZWl2ZWQgaW4gdjUsIHNvIEkgaGF2ZSBkcm9wcGVkIHlvdXIgUmIgdGFnLgoKCj4KPiBTaW5jZSB0
aGlzIHBhdGNoIGJvdGggZGVwZW5kcyBvbiBwYXRjaCAxIGFuZCBpcyBhIGRlcGVuZGVuY3kgZm9y
IHBhdGNoCj4gMywgSSBzdXBwb3NlIHRoaXMgc2hvdWxkIGdvIHRocm91Z2ggdGhlIGNsb2NrIHRy
ZWUuCj4KPiByZWdhcmRzCj4gUGhpbGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
