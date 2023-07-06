Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3C7EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 20:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+kuYKsl/tbYSRUpRwUjm7C4RVTKIwLN5meX8CGqJX+E=; b=mgtLTwS/mew4J5
	nJlsfe1Z5bV+tmCgvHx9+jHptMsaH3k8QS8pJRUtWMB8ZpvN4NvT9kRcS2Jcbn5fSLzL9r9kzP4s9
	reIJ83+EVrYcoqpACymuljuqEFxDpsyuBJ/vVuvzJXUEWB9UHBcQV87AT0uC+r1f6ZI/dxRgpPLxm
	Um9lHwwKnfgbbT7kv8xlSPksBNxWkCXq8G6LHxxt5cp39IHz/LAMf75R6UGxKMkZN+hk12DPXD2aD
	GfGSzGxahOFnnyV59NMf2npLI/pH4sBkNTkeuzrY6rcLDBZCqsnILPwAOi7Q1l5uctjAwgIEDNcUG
	olsaMLSmmq0OQ5R3JWRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHVDy-002ZS5-1P;
	Thu, 06 Jul 2023 20:05:10 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHVDw-002ZR6-0o
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 20:05:10 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so606707b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688673906; x=1691265906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hnkU1J21cgPCgfLbbAiAIZoNsBwKuuCf1YF0BIHy7Ic=;
        b=eNkKpcswikHAy4YnPlzhh32csWj8/a/27/eR1UxF2vYAWa8hB6W/3fdoQc00EhktTV
         7b+GdZfAunRDt1cZ6WS7aiEdFi6GBV5Cwqn9YAnHNoQ1s8vyPQ9SiYCKuv7duiMYdAA4
         nYtb+/IoFRwm4GJxBlDvPrPkPJgVhhpR1yPcH3NSeUwpY00m6JQaEEhdPV5HDy7tPRum
         SdwGtXG+nqLn8GZcPVxlCisgFOIhhyPW4wJED/NbREPqEJ7jpPTD93ONATzIGzj5YQnz
         k5NXVtNCvXVZvG5uDyu+FVZgo1uTxht9VBF2FO3ehBuOaNGYUvhzMnRzCTsm6K8NZxKj
         7KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688673906; x=1691265906;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnkU1J21cgPCgfLbbAiAIZoNsBwKuuCf1YF0BIHy7Ic=;
        b=RAlL3Ht8g47cdRhkT9l8RG5sBiuordW/cAHgGGlAoMppPgXElccuwbwkofZOpcSDHP
         HHEWkqgp0QgSNNZF3O0ENzS4IwLFivbIpPmk9RQsdERbMO6HxkONjAOwoJUqxRqVKQwi
         Q2rSlfaPL0A+FT3vo85NKtdLG6XjZX2C5CG6aE3cCAR3r/SREXAH/+lm32iwQX9jPq22
         lHrtNCAbMPSCNvUkhYbwviXIektXpwoW4PTzPADV5zJ8bhc/rkE271vbRC2OCLQCxxlI
         HHJJeeE4QWsEi1T66cPzmPJYmIJIWmemy0nwvKU/vaBic9vR7kVySDjMnuvNa1mv0560
         /v6g==
X-Gm-Message-State: ABy/qLbo4CUbXyyH3PBIeFdfuhkA70GBoPaK8bu3P46/ocjgqvlQBQLZ
	AzQ8WatU49uRdGlgbPYLdxR4Sw==
X-Google-Smtp-Source: APBJJlFpjlMvFOnYLsjkx91j6F39vUvc1Z+HSSxEZ0f/QUWe6J10GWMr9dc4Pp2hWjDQ2G4iYEZtfA==
X-Received: by 2002:a05:6a00:1796:b0:66c:6766:7373 with SMTP id s22-20020a056a00179600b0066c67667373mr3206720pfg.23.1688673906529;
        Thu, 06 Jul 2023 13:05:06 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7928f000000b0064aea45b040sm1622325pfa.168.2023.07.06.13.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 13:05:06 -0700 (PDT)
Date: Thu, 6 Jul 2023 13:05:04 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] RISC-V: Add T-Head 0.7.1 vector extension to hwprobe
Message-ID: <ZKcecLVQ61P886R/@ghost>
References: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
 <20230705-thead_vendor_extensions-v1-2-ad6915349c4d@rivosinc.com>
 <2286282.ElGaqSPkdT@basile.remlab.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2286282.ElGaqSPkdT@basile.remlab.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_130508_296381_ACD35F4D 
X-CRM114-Status: GOOD (  36.33  )
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

T24gVGh1LCBKdWwgMDYsIDIwMjMgYXQgMDc6MzI6MzZQTSArMDMwMCwgUsOpbWkgRGVuaXMtQ291
cm1vbnQgd3JvdGU6Cj4gTGUgdG9yc3RhaW5hIDYuIGhlaW7DpGt1dXRhIDIwMjMsIDYuMzAuMTgg
RUVTVCBDaGFybGllIEplbmtpbnMgYSDDqWNyaXQgOgo+ID4gVXNpbmcgdmVuZG9yIGV4dGVuc2lv
bnMgaW4gaHdwcm9iZSwgYWRkIHRoZSBhYmlsaXR5IHRvIHF1ZXJ5IGlmIHRoZQo+ID4gMC43LjEg
dmVjdG9yIGV4dGVuc2lvbiBpcyBhdmFpbGFibGUuIEl0IGlzIGRldGVybWluZWQgdG8gYmUgYXZh
aWxhYmxlCj4gPiBvbmx5IGlmIHRoZSBrZXJuZWwgaXMgY29tcGlsZWQgd2l0aCB2ZWN0b3Igc3Vw
cG9ydCwgYW5kIHRoZSB1c2VyIGlzCj4gPiB1c2luZyB0aGUgYzkwNi4KPiA+IAo+ID4gU2lnbmVk
LW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+
ID4gIGFyY2gvcmlzY3YvS2NvbmZpZy52ZW5kb3IgICAgICAgICAgICAgICAgICAgICAgIHwgMTEg
KysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2V4dGVuc2lvbnMuaCAgICAg
ICAgICAgICB8IDE2ICsrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNf
cmlzY3YuYyAgICAgICAgICAgICAgICAgICB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gPiAg
YXJjaC9yaXNjdi92ZW5kb3JfZXh0ZW5zaW9ucy9NYWtlZmlsZSAgICAgICAgICAgfCAgMiArKwo+
ID4gIGFyY2gvcmlzY3YvdmVuZG9yX2V4dGVuc2lvbnMvdGhlYWQvTWFrZWZpbGUgICAgIHwgIDgg
KysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkL2V4dGVuc2lv
bnMuYyB8IDI0Cj4gPiArKysrKysrKysrKysrKysrKysrKysrKysgNiBmaWxlcyBjaGFuZ2VkLCA4
MSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcu
dmVuZG9yIGIvYXJjaC9yaXNjdi9LY29uZmlnLnZlbmRvcgo+ID4gaW5kZXggMjEzYWMzZTZmZWQ1
Li5iOGI5ZDE1MTUzZWIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcudmVuZG9y
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcudmVuZG9yCj4gPiBAQCAtMSwzICsxLDE0IEBA
Cj4gPiAgbWVudSAiVmVuZG9yIGV4dGVuc2lvbnMgc2VsZWN0aW9uIgo+ID4gCj4gPiArY29uZmln
IFZFTkRPUl9FWFRFTlNJT05TX1RIRUFECj4gPiArCWJvb2wgIlQtSEVBRCB2ZW5kb3IgZXh0ZW5z
aW9ucyIKPiA+ICsJZGVwZW5kcyBvbiBSSVNDVl9BTFRFUk5BVElWRQo+ID4gKwlkZWZhdWx0IG4K
PiA+ICsJaGVscAo+ID4gKwkgIEFsbCBULUhFQUQgdmVuZG9yIGV4dGVuc2lvbnMgS2NvbmZpZyBk
ZXBlbmQgb24gdGhpcyBLY29uZmlnLiAKPiBEaXNhYmxpbmcKPiA+ICsJICB0aGlzIEtjb25maWcg
d2lsbCBkaXNhYmxlIGFsbCBULUhFQUQgdmVuZG9yIGV4dGVuc2lvbnMuIFBsZWFzZSBzYXkgCj4g
IlkiCj4gPiArCSAgaGVyZSBpZiB5b3VyIHBsYXRmb3JtIHVzZXMgVC1IRUFEIHZlbmRvciBleHRl
bnNpb25zLgo+ID4gKwo+ID4gKwkgIE90aGVyd2lzZSwgcGxlYXNlIHNheSAiTiIgaGVyZSB0byBh
dm9pZCB1bm5lY2Vzc2FyeSBvdmVyaGVhZC4KPiA+ICsKPiA+ICBlbmRtZW51ICMgIlZlbmRvciBl
eHRlbnNpb25zIHNlbGVjdGlvbiIKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2V4dGVuc2lvbnMuaAo+ID4gYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2V4dGVuc2lvbnMu
aCBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4yN2NlMjk0YTNk
NjUKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXh0
ZW5zaW9ucy5oCj4gPiBAQCAtMCwwICsxLDE2IEBACj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb25seSAqLwo+ID4gKy8qCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIz
IGJ5IFJpdm9zIEluYy4KPiA+ICsgKi8KPiA+ICsjaWZuZGVmIF9fQVNNX0VYVEVOU0lPTlNfSAo+
ID4gKyNkZWZpbmUgX19BU01fRVhURU5TSU9OU19ICj4gPiArCj4gPiArI2luY2x1ZGUgPGFzbS9o
d3Byb2JlLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L2NwdW1hc2suaD4KPiA+ICsKPiA+ICsjZGVm
aW5lIFRIRUFEX0lTQV9FWFQwIChSSVNDVl9IV1BST0JFX1ZFTkRPUl9FWFRFTlNJT05fU1BBQ0Up
Cj4gPiArI2RlZmluZSBUSEVBRF9JU0FfRVhUMF9WMF83XzEgKDEgPDwgMCkKPiA+ICsKPiA+ICtp
bnQgaHdwcm9iZV90aGVhZChfX3U2NCBtYXJjaGlkLCBfX3U2NCBtaW1waWQsIHN0cnVjdCByaXNj
dl9od3Byb2JlICpwYWlyLAo+ID4gKwkJICBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cyk7Cj4g
PiArI2VuZGlmCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+ID4gaW5kZXggMjM1MWE1ZjdiOGIxLi41
OGIxMmVhZWFmNDYgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3Yu
Ywo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPiA+IEBAIC0xMyw2ICsx
Myw3IEBACj4gPiAgI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KPiA+ICAjaW5jbHVkZSA8YXNtL3N3
aXRjaF90by5oPgo+ID4gICNpbmNsdWRlIDxhc20vdWFjY2Vzcy5oPgo+ID4gKyNpbmNsdWRlIDxh
c20vZXh0ZW5zaW9ucy5oPgo+ID4gICNpbmNsdWRlIDxhc20vdW5pc3RkLmg+Cj4gPiAgI2luY2x1
ZGUgPGFzbS1nZW5lcmljL21tYW4tY29tbW9uLmg+Cj4gPiAgI2luY2x1ZGUgPHZkc28vdnN5c2Nh
bGwuaD4KPiA+IEBAIC0xOTIsNiArMTkzLDI1IEBAIHN0YXRpYyBpbnQgaHdwcm9iZV92ZW5kb3Io
X191NjQgbXZlbmRvcmlkLCBzdHJ1Y3QKPiA+IHJpc2N2X2h3cHJvYmUgKnBhaXIsIGNvbnN0IHN0
cnVjdCBjcHVtYXNrICpjcHVzKQo+ID4gIHsKPiA+ICAJc3dpdGNoIChtdmVuZG9yaWQpIHsKPiA+
ICsjaWZkZWYgQ09ORklHX1ZFTkRPUl9FWFRFTlNJT05TX1RIRUFECj4gPiArCWNhc2UgVEhFQURf
VkVORE9SX0lEOgo+ID4gKwkJc3RydWN0IHJpc2N2X2h3cHJvYmUgbWFyY2hpZCA9IHsKPiA+ICsJ
CQkua2V5ID0gUklTQ1ZfSFdQUk9CRV9LRVlfTUFSQ0hJRCwKPiA+ICsJCQkudmFsdWUgPSAwCj4g
PiArCQl9Owo+ID4gKwkJc3RydWN0IHJpc2N2X2h3cHJvYmUgbWltcGlkID0gewo+ID4gKwkJCS5r
ZXkgPSBSSVNDVl9IV1BST0JFX0tFWV9NSU1QSUQsCj4gPiArCQkJLnZhbHVlID0gMAo+ID4gKwkJ
fTsKPiA+ICsKPiA+ICsJCWh3cHJvYmVfYXJjaF9pZCgmbWFyY2hpZCwgY3B1cyk7Cj4gPiArCQlo
d3Byb2JlX2FyY2hfaWQoJm1pbXBpZCwgY3B1cyk7Cj4gPiArCQlpZiAobWFyY2hpZC52YWx1ZSAh
PSAtMVVMTCAmJiBtaW1waWQudmFsdWUgIT0gLTFVTEwpCj4gPiArCQkJaHdwcm9iZV90aGVhZCht
YXJjaGlkLnZhbHVlLCBtaW1waWQudmFsdWUsIAo+IHBhaXIsIGNwdXMpOwo+ID4gKwkJZWxzZQo+
ID4gKwkJCXJldHVybiAtMTsKPiA+ICsJCWJyZWFrOwo+ID4gKyNlbmRpZgo+ID4gIAlkZWZhdWx0
Ogo+ID4gIAkJcmV0dXJuIC0xOwo+ID4gIAl9Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi92
ZW5kb3JfZXh0ZW5zaW9ucy9NYWtlZmlsZQo+ID4gYi9hcmNoL3Jpc2N2L3ZlbmRvcl9leHRlbnNp
b25zL01ha2VmaWxlIGluZGV4IGU4MTU4OTVlOTM3Mi4uMzhjM2U4MDQ2OWZkCj4gPiAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvcmlzY3YvdmVuZG9yX2V4dGVuc2lvbnMvTWFrZWZpbGUKPiA+ICsrKyBi
L2FyY2gvcmlzY3YvdmVuZG9yX2V4dGVuc2lvbnMvTWFrZWZpbGUKPiA+IEBAIC0xLDMgKzEsNSBA
QAo+ID4gIGlmZGVmIENPTkZJR19SRUxPQ0FUQUJMRQo+ID4gIEtCVUlMRF9DRkxBR1MgKz0gLWZu
by1waWUKPiA+ICBlbmRpZgo+ID4gKwo+ID4gK29iai0kKENPTkZJR19WRU5ET1JfRVhURU5TSU9O
U19USEVBRCkgKz0gdGhlYWQvCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi92ZW5kb3JfZXh0
ZW5zaW9ucy90aGVhZC9NYWtlZmlsZQo+ID4gYi9hcmNoL3Jpc2N2L3ZlbmRvcl9leHRlbnNpb25z
L3RoZWFkL01ha2VmaWxlIG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAw
MDAuLjdjZjQzYzYyOWI2Ngo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvYXJjaC9yaXNjdi92
ZW5kb3JfZXh0ZW5zaW9ucy90aGVhZC9NYWtlZmlsZQo+ID4gQEAgLTAsMCArMSw4IEBACj4gPiAr
aWZkZWYgQ09ORklHX0ZUUkFDRQo+ID4gK0NGTEFHU19SRU1PVkVfZXh0ZW5zaW9ucy5vID0gJChD
Q19GTEFHU19GVFJBQ0UpCj4gPiArZW5kaWYKPiA+ICtpZmRlZiBDT05GSUdfS0FTQU4KPiA+ICtL
QVNBTl9TQU5JVElaRV9leHRlbnNpb25zLm8gOj0gbgo+ID4gK2VuZGlmCj4gPiArCj4gPiArb2Jq
LXkgKz0gZXh0ZW5zaW9ucy5vCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi92ZW5kb3JfZXh0
ZW5zaW9ucy90aGVhZC9leHRlbnNpb25zLmMKPiA+IGIvYXJjaC9yaXNjdi92ZW5kb3JfZXh0ZW5z
aW9ucy90aGVhZC9leHRlbnNpb25zLmMgbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAw
MDAwMDAwMDAwMC4uYTE3NzUwMWJjOTljCj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9hcmNo
L3Jpc2N2L3ZlbmRvcl9leHRlbnNpb25zL3RoZWFkL2V4dGVuc2lvbnMuYwo+ID4gQEAgLTAsMCAr
MSwyNCBAQAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiA+
ICsvKgo+ID4gKyAqIENvcHlyaWdodCAoQykgMjAyMyBieSBSaXZvcyBJbmMuCj4gPiArICovCj4g
PiArCj4gPiArI2luY2x1ZGUgPGFzbS9leHRlbnNpb25zLmg+Cj4gPiArCj4gPiAraW50IGh3cHJv
YmVfdGhlYWQoX191NjQgbWFyY2hpZCwgX191NjQgbWltcGlkLCBzdHJ1Y3QgcmlzY3ZfaHdwcm9i
ZSAqcGFpciwKPiA+ICsJCSAgY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdXMpCj4gPiArewo+ID4g
KwlwYWlyLT52YWx1ZSA9IDA7Cj4gPiArCXN3aXRjaCAocGFpci0+a2V5KSB7Cj4gPiArCWNhc2Ug
VEhFQURfSVNBX0VYVDA6Cj4gPiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgo+ID4gKwkJaWYg
KG1hcmNoaWQgPT0gMCAmJiBtaW1waWQgPT0gMCkKPiA+ICsJCQlwYWlyLT52YWx1ZSB8PSBUSEVB
RF9JU0FfRVhUMF9WMF83XzE7Cj4gCj4gSSdtIG5vdCBzdXJlIEkgZm9sbG93IHRoZSBjb2RlLCBi
dXQgZXhwb3NpbmcgYW4gZXh0ZW5zaW9uIHRvIHVzZXJzcGFjZSB0aGF0IAo+IHRoZSBrZXJuZWwg
ZG9lcyBub3QgaGFuZGxlIGlzIGEgYmFkIGlkZWEuIEFGQUlLLCB0aGUgaW5pdGlhbGlzYXRpb24g
YW5kIAo+IGNvbnRleHQgc3dpdGNoaW5nIGNvZGUgbXVzdCBiZSBpbiBwbGFjZSBmaXJzdC4KPiAK
PiBBbmQgSSBkb24ndCBzdXBwb3NlIHRoYXQgdGhpcyBjYW4gKnNpbXBseSogcGlnZ3ktYmFjayBv
biB0aGUgZXhpc3RpbmcgUlZWIAo+IDEuMC4wIHN1cHBvcnQsIGJlY2F1c2UgdXNlci1zcGFjZSAg
YXNzdW1lcyAxLjAuMC1jb21wbGlhbnQgYmVoYXZpb3VyIGlmIHRoZSAKPiBleGlzdGluZyB2ZWN0
b3IgZmxhZyBpcyBzZXQgaW4gaHdwcm9iZSgpLgo+IAo+IEluZGVlZCwgSSByZWNhbGwgc29tZWJv
ZHkgZWxzZSBwb3N0ZWQgYSByZWNlbnQgcGF0Y2hzZXQgb3N0ZW5zaWJseSB3aXRoIHRoZSAKPiBz
YW1lIGdvYWwgdGhhdCB3YXMgYSBsb3QgbW9yZSBpbnZvbHZlZCB0aGFuIHRoaXMuCj4gClRoZSBt
YWluIGdvYWwgb2YgdGhpcyBwYXRjaCB3YXMgdG8gZ2V0IHZlbmRvciBleHRlbnNpb25zIHRpZWQg
aW50bwpod3Byb2JlLiBJIHNlbGVjdGVkIHRoaXMgdmVjdG9yIGV4dGVuc2lvbiB0byBzdGFydCB3
aXRoLCBidXQgaXQgbG9va3MKbGlrZSBpdCBpcyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gSSBoYWQg
YW50aWNpcGF0ZWQuCj4gPiArI2VuZGlmCj4gPiArCQlicmVhazsKPiA+ICsJZGVmYXVsdDoKPiA+
ICsJCXJldHVybiAtMTsKPiA+ICsJfQo+ID4gKwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gCj4g
Cj4gLS0gCj4g6Zu357Gz4oCn5b635bC8LeW6k+WwlOiSmQo+IGh0dHA6Ly93d3cucmVtbGFiLm5l
dC8KPiAKPiAKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
