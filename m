Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F81C54E41
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 17:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+suuUnO49LHA/DJLCwq1Rj3Gui95CN5RtJQLSzFfiqw=; b=2pMBN3UmHtOoGC
	6JJx/HzHwDLCCjpwRDh56ZuTvmTqtOy+ebl/6V8No51knpFSIgvgq7vy9d2kCAxNgLy3ikyDvxQcd
	FwJM5kwsV0oyUqmRgADAen0JNkafp9qOAhOd0SANz4jDztLNAdmmpSgMNENtVx2jopAvhqNC5dQA3
	Ar2RDopKPq8/5D9fyTH/4y5GGjyaxNw1zLXirKEFjJ8llptRvCtyX0A47bPIoTEO2BcNuOkeMcy3L
	7sJDrb/1pqfpfauR4uV3SmTnntLumjlnGqD53VJjbMR5bKUa/OVnLS3RCzpToM59W1xZHK0BlRmCH
	RlmN9t/48XGc8kkEp8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZ2P-0000000Elst-0OGn;
	Tue, 05 Mar 2024 17:57:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZ2M-0000000Else-436W
	for linux-riscv@bombadil.infradead.org;
	Tue, 05 Mar 2024 17:57:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=g0VikDDZHRPX1F+raT86tLLC0uFSiNwgf0RrjwgjTDQ=; b=D0Yj7hAy57eXDQ88Ne78f08NXd
	46sU57Z/d2Sv6Ywjl9QNeBbyX/U0GO/f2MQGInPvJzE2y51dD49+DS6V30IeiuaCUoaW/MfduBtnL
	gAxuOaqZXxC/zYGYwnubabq4JJZ4yuzhnKF090TsU3fk1K4l6cd1bN+3WVWbccZ3DjAP45yRbNn3U
	xGAn5bmCUilITPbwBBbTEKPKw8YygWMzY+tUdOeQyG9KwCVh3lyS8Gfxi9k0h7nMaKskeIjHJYfnp
	HEPLayx/wTRTSHMyBjTTn0crn9M1RxixEa3LidMFZLgrfT2cPGKkbeulg7e1bUc9DCfJ8ojWC1cuN
	Oub269NA==;
Received: from xmbg9.mail.qq.com ([81.69.217.21])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZ28-00000005dVV-3vHf
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 17:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709661403; bh=g0VikDDZHRPX1F+raT86tLLC0uFSiNwgf0RrjwgjTDQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=HwD1+tdX0ZXlMnInOeIsFzjfI9ECybREY0exQLf67zLuM9W3to3Xc4biHxlE7S49e
	 JzcXZ3q3qacjloG+QvizQ4UuOmRYJ+JIchH7HYlwV0b5kyJyPv+Zb1DTUr3sQ1XB85
	 8CYZR2kdGk5iNWLzAisFQ2f2roZ6smQZKD5WlWKs=
Received: from smtpclient.apple ([2001:da8:c800:d084:84f7:c158:bab8:8899])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id CA3A6E33; Wed, 06 Mar 2024 01:50:35 +0800
X-QQ-mid: xmsmtpt1709661035tuur2m1ml
Message-ID: <tencent_AA20462764AFF185EF405043DBC99119F705@qq.com>
X-QQ-XMAILINFO: MqG4KXyEKpQye6Sjmokj1B8vEqsYsqQnANZBIE4uyKBM4b5RwTTrbxPOnZHCQE
	 KRRrkBsbf1ueRLgIJ7T5wutix5QYmVTMCSqaXaljN8cql0RcxLes6XLihiYdbzps4oDNvTZOA9Fu
	 CBVavCNUSqx4vcYwRBtCCOt8vAEyJVyMJqQRhzR7R4gNR8oe3og50qFzGCntxAVPNiLcFXoT2cXA
	 Vn5HAln+26uVyyXY4hX0dRRtat24JWwKnOiNsZehzXslBakYPNM/Mp5D38c1ip/6wEaHzai5L3Sj
	 04VHEi6a/wWDyyt+Fes1wM1KauEkaAQMB/BwRNb2b5P9gR5lkSpVUSJbnGM28EyaQl5X9IcmquE9
	 8rRifQolFDLvNi3aVyVvZ9I5j5ggoSS9yvRORyBtCQddSVeCK52fHn0Af9XO0JLWs5D8YOcD6kzI
	 ppY2rTiLFnrn9Ylq4pAo0m0PaOckv1FzTlfRBguih3tze5JTyOAme/kfXFbymLmiWp07GCSxi6bs
	 8ZmIQy4mlbUJphJW8vpuCW8xnLeKPAnJLRAaNBn/1vXYvsy+pNZopKsMeb0/HoIYHhKmsCHbnbBX
	 u31zi24Hj3Pz4pp9D+eVPixgXHDowZRB/NtpXp0qykbDFZ/l5A/EzK9dUezWAxr3hMZFCWbUMEeu
	 LQp7e4K2R9/lYf1Ue49cAD2ICig/OIS26EFTFo9wHdpvQZwCz/rOuJXh9CfV9FIaQtkN8K80nPKK
	 /45G5FmwHjkGMGXXHDs2b2HnqfSNFT4YTDcNoNT0IJ10Q4bbFvCYUwWQ+/muBk9TBhQbhs6NSaWD
	 QyfqrAloAxFlSwQuLKZMHkdr2Zd6ulYYW+yLgsH9gDDsdgPtu2kYw+MLKMgnT4UsDpUtUHubxrhs
	 WBvPuW16BnOPtUWzPiUy45TLXrxu6clqdu1x/sBdZDqGdvYIXboSCuzgh3zTd6k3u2gf7qEKJA/b
	 p1JkaQyAAMprbAZFxFm17RoryXI97zMfGZYu59RkCeLC6Hre2FlUaCpWZA0MzE71teFaVsELU=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Resend: Re: [PATCH v3 5/7] riscv: Kconfig.socs: Allow SOC_CANAAN with
 MMU for K230
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240305-fascism-enrich-06483ddeb149@spud>
Date: Wed, 6 Mar 2024 01:50:25 +0800
Cc: Damien Le Moal <dlemoal@kernel.org>,
 linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
X-OQ-MSGID: <066CA89A-31BD-47DF-B540-D1D5844B8597@cyyself.name>
References: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
 <tencent_0432DA968E39B81431F921F38D747C008208@qq.com>
 <ef8df22f-dac8-4652-bf17-d10254e6abfb@kernel.org>
 <tencent_E56A833916E00EC7B4840C34FAF1250ADE0A@qq.com>
 <20240305-fascism-enrich-06483ddeb149@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3774.400.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_175658_258237_250807F7 
X-CRM114-Status: GOOD (  26.82  )
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

VGhlIGxhc3QgZW1haWwgd2FzIG5vdCByZWNlaXZlZCBpbiB0aGUgbGlzdCBkdWUgdG8gSSBkaWRu
4oCZdCBjaGFuZ2UgdGhlIG1vZGUKdG8gcGxhaW50ZXh0LiBTb3JyeSBmb3IgdGhhdC4gVGhpcyBp
cyBhIHJlc2VuZCBlbWFpbC4KCj4gT24gTWFyIDYsIDIwMjQsIGF0IDAxOjIwLCBDb25vciBEb29s
ZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+IE9uIFR1ZSwgTWFyIDA1LCAyMDI0IGF0
IDAzOjQ3OjE1UE0gKzA4MDAsIFlhbmd5dSBDaGVuIHdyb3RlOgo+PiBPbiAyMDI0LzMvNSAwNzo0
NiwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4+PiBPbiAzLzUvMjQgMDY6MDUsIFlhbmd5dSBDaGVu
IHdyb3RlOgo+Pj4+IFNpbmNlIEsyMzAgd2FzIHJlbGVhc2VkLCBTT0NfQ0FOQUFOIGlzIG5vIGxv
bmdlciBvbmx5IHJlZmVycmVkIHRvIHRoZSBLMjEwLgo+Pj4+IFJlbW92ZSBpdCBkZXBlbmRzIG9u
ICFNTVUgd2lsbCBhbGxvdyBidWlsZGluZyBkdHMgZm9yIEsyMzAgYW5kIHJlbW92ZSB0aGUKPj4+
PiBLMjEwIHN0cmluZyBmcm9tIHRoZSBoZWxwIG1lc3NhZ2UuCj4+Pj4gCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogWWFuZ3l1IENoZW4gPGN5eUBjeXlzZWxmLm5hbWU+Cj4+Pj4gUmV2aWV3ZWQtYnk6IENv
bm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGFy
Y2gvcmlzY3YvS2NvbmZpZy5zb2NzIHwgNSArKy0tLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+IAo+Pj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L0tjb25maWcuc29jcyBiL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzCj4+Pj4gaW5kZXgg
NjIzZGU1ZjhhMjA4Li5iNGU5YjdmNzU1MTAgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9L
Y29uZmlnLnNvY3MKPj4+PiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+Pj4+IEBAIC03
NSwxMyArNzUsMTIgQEAgY29uZmlnIEFSQ0hfQ0FOQUFOCj4+Pj4gICBkZWZfYm9vbCBTT0NfQ0FO
QUFOCj4+Pj4gIGNvbmZpZyBTT0NfQ0FOQUFOCj4+Pj4gLSBib29sICJDYW5hYW4gS2VuZHJ5dGUg
SzIxMCBTb0MiCj4+Pj4gLSBkZXBlbmRzIG9uICFNTVUKPj4+IAo+Pj4gVGhpcyBzZWVtcyB3cm9u
ZyB0byBtZS4gVGhlIGsyMTAgc3VwcG9ydCBkb2VzIHJlcXVpcmUgbm8tbW11LiBTbyB3aHkgcmVt
b3ZlCj4+PiB0aGlzID8KPj4gCj4+IEl0IGp1c3QgYWxsb3dzIFNPQ19DQU5BQU4gdG8gYmUgc2Vs
ZWN0ZWQgd2hlbiBNTVU9eS4gV2l0aCB0aGlzIHBhdGNoLAo+PiBub21tdV9rMjEwX2RlZmNvbmZp
ZyBzdGlsbCB3b3Jrcy4KPiAKPiBJIHRoaW5rIHRoZSBjb25jZXJuIGhlcmUgaXMgdGhhdCB0aGlz
IHdvdWxkIGFsbG93IHBlb3BsZSB0byBidWlsZCBhCj4ga2VybmVsIGZvciB0aGUgazEyMCB3aXRo
IHRoZSBNTVUgZW5hYmxlZCwgbm90IHRoYXQgdGhlIGV4aXN0aW5nIG5vbW11Cj4gYnVpbGQgd2ls
bCBiZSBhZmZlY3RlZC4KPiAKCkFoYS4gSSBkb24ndCB0aGluayBpcyB0aGVyZSBhbnlvbmUgd2ls
bCB0cnkgYSBidWlsZCB3aXRoIE1NVSBvbgpLMjEwLiBJdCBvbmx5IGhhcyA2TUIgb2YgbWVtb3J5
IGF2YWlsYWJsZSB0byB0aGUgQ1BVLiBGb3IgcnY2NCBpZgp0aGUgUy1Nb2RlIHNvZnR3YXJlIHN0
YXJ0cyBhdCAyTUIsIGl0IHdpbGwgb25seSBoYXZlIDRNQiBmb3IgUy1Nb2RlCkxpbnV4LiBJdCdz
IGhhcmQgdG8gdHJpbSB0aGUga2VybmVsIGFuZCBmaXQgaW4gNE1CIGFuZCBldmVuIHByZXNlcnZl
CnNvbWUgbWVtb3J5IGZvciB1c2Vyc3BhY2UuCgpJIGFsc28gdHJpZWQgdG8gbWFrZSBub21tdV9r
MjEwX2RlZmNvbmZpZyBvbiBnY2MgMTMuMi4wLCBpdCBwcm9kdWNlZCBhCjEuNk0ga2VybmVsIGlu
IGFyY2gvcmlzY3YvYm9vdC9JbWFnZS4gQnV0IGlmIEkgdXNlIG5jb25maWcgdG8gc2V0CkNPTkZJ
R19NTVU9eSBhbmQgcmVidWlsZCwgdGhlIGtlcm5lbCBmaWxlIHdpbGwgaW5jcmVhc2UgdG8gMTFN
LgoKPiBNYXliZSB5b3UgY291bGQgc3F1YXNoIGluIHNvbWV0aGluZyBsaWtlIHRoZSBmb2xsb3dp
bmc/Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZy5zb2NzIGIvYXJjaC9yaXNj
di9LY29uZmlnLnNvY3MKPiBpbmRleCBiNGU5YjdmNzU1MTAuLjc1ZDU1MDU5MTYzZiAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcwo+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZp
Zy5zb2NzCj4gQEAgLTcyLDE1ICs3MiwxOSBAQCBjb25maWcgU09DX1ZJUlQKPiAgIFRoaXMgZW5h
YmxlcyBzdXBwb3J0IGZvciBRRU1VIFZpcnQgTWFjaGluZS4KPiAKPiBjb25maWcgQVJDSF9DQU5B
QU4KPiAtIGRlZl9ib29sIFNPQ19DQU5BQU4KPiArIGJvb2wgIkNhbmFhbiBLZW5kcnl0ZSBTb0Nz
Igo+ICsgaGVscAo+ICsgICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgQ2FuYWFuIEtlbmRyeXRl
IFNvQyBwbGF0Zm9ybSBoYXJkd2FyZS4KPiAKPiBjb25maWcgU09DX0NBTkFBTgo+IC0gYm9vbCAi
Q2FuYWFuIEtlbmRyeXRlIFNvQyIKPiArIGJvb2wgIkNhbmFhbiBLZW5kcnl0ZSBLMjEwIFNvQyIK
PiArIGRlcGVuZHMgb24gIU1NVQo+ICsgZGVwZW5kcyBvbiBBUkNIX0NBTkFBTgo+IHNlbGVjdCBD
TElOVF9USU1FUiBpZiBSSVNDVl9NX01PREUKPiBzZWxlY3QgQVJDSF9IQVNfUkVTRVRfQ09OVFJP
TExFUgo+IHNlbGVjdCBQSU5DVFJMCj4gc2VsZWN0IENPTU1PTl9DTEsKPiBoZWxwCj4gLSAgIFRo
aXMgZW5hYmxlcyBzdXBwb3J0IGZvciBDYW5hYW4gS2VuZHJ5dGUgU29DIHBsYXRmb3JtIGhhcmR3
YXJlLgo+ICsgICBUaGlzIGVuYWJsZXMgc3VwcG9ydCBmb3IgQ2FuYWFuIEtlbmRyeXRlIEsyMTAg
U29DIHBsYXRmb3JtIGhhcmR3YXJlLgo+IAo+IGVuZG1lbnUgIyAiU29DIHNlbGVjdGlvbiIKPiAK
PiAoV2hpY2ggcmVtaW5kcyBtZSwgSSByZWFsbHkgbmVlZCB0byBnbyBhbmQgZmluaXNoIHNvcnRp
bmcgb3V0IHRoZSBBUkNIXwo+IHN0dWZmKQoKU2VlbXMgbGlrZSBhbiBpZGVhIGlmIHdlIHdhbnQg
dGhpcyBjb25zaWRlcmF0aW9uLiBCdXQgSSBkb24ndCB0aGluayB3ZSBuZWVkCnRoaXMgYXMgdGhl
IG9waW5pb25zIHNob3duIGFib3ZlLgoKSWYgaXQgc2hvdWxkIGJlLCBJIHRoaW5rIFNPQ19DQU5B
QU4gc2hvdWxkIGJlIHJlbmFtZWQgdG8gU09DX0syMTAgb3IKU09DX0NBTkFBTl9LMjEwLgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
