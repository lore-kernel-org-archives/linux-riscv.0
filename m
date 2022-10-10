Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BFFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 06:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tN+M18yke/c8/0mCuqWZ6WpR53fMlp6NrYH+YBbVHwk=; b=z6k+oWG8TbMtIj
	2QcavAIv4TKwgA9Wk8LP2E+IikeiaBpzE83zyCZXElxF8o25a98kEn6jkGZL2UxO075TI/FMYsdKA
	rvReWSbnL9IxJWndOUyOj4HJ/ygISj8VcUegf2lzalhljgsgnzNFMCqbKlqAOS5pHBgA5lssBKjvK
	0N+3Ql6bzwjxWvUjI7IevBA3RB7eQx/bWudJgWf69qs6bUlLbP0wJKOcosuperokkoO2YqGNIQ/vY
	lRugyG36l9NYSODaHvtguFiToanLb6YHjIVvaQKPz33Ybr5M14EhHWqk6fpnjKYHtUhFfIn0DkMEu
	zOi7vH8bmWDz6RP8gFnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmUl-00HG4y-Is; Mon, 10 Oct 2022 06:42:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohmUi-00HG3j-BS
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 06:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665384153; x=1696920153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mYTHL34dRgV3EIYplngCV+0H4jRyn9o1jvui6Mf6rtY=;
  b=kuf9NyRH8PteS6xkUjWQEMVZk8ii9FE6wRMw0KMFResIJg2rtHl0NU07
   zdg/JgY3aWAwTIO9rtw7o24PVtPMxTSoIc9RU82igqPieOY60ACDn66Bq
   9V0ngUL+JLVb6pmCaeYVJDaprwpky3qdRjCsKvPiS4JJV9Xv/ZvSHr8QC
   bWrrZ4msD4zqC6Oeu8HN3bzH1ubsDj8kXkzyoerpAXzRUgnRxxOfSxaw2
   DZck4/MUfnbA1yYezHb1K8WVn9CQ4rW1ESnQJVvfwdaEVNMdQLvu6rsYH
   aXcTjepFICpPiZMCcrXpFJrCjda1+PFrJ5yRc4G4fT7siAM/SgFFLf27T
   w==;
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="183995051"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Oct 2022 23:42:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 9 Oct 2022 23:42:27 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sun, 9 Oct 2022 23:42:26 -0700
Date: Mon, 10 Oct 2022 07:42:04 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Vernon Yang <vernon2gm@gmail.com>
CC: <lkp@intel.com>, <ajones@ventanamicro.com>, <anup@brainfault.org>,
	<atishp@rivosinc.com>, <kbuild-all@lists.01.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: KVM: fixup undefined reference to
 riscv_cbom_block_size
Message-ID: <Y0O+vEC3/fnUKgxw@wendy>
References: <202210091222.xuZquaM9-lkp@intel.com>
 <20221010013329.199167-1-vernon2gm@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221010013329.199167-1-vernon2gm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_234232_461955_C6709343 
X-CRM114-Status: GOOD (  23.51  )
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

T24gTW9uLCBPY3QgMTAsIDIwMjIgYXQgMDk6MzM6MjlBTSArMDgwMCwgVmVybm9uIFlhbmcgd3Jv
dGU6Cj4gV2hlbiBzb21lIFJJU0MtViBjb21waWxlcnMgZG8gbm90IHN1cHBvcnQgdGhlIFppY2Jv
bSBleHRlbnNpb24sCj4gdGhlIGJ1aWxkIHN5c3RlbSBhdXRvIGRpc2FibGUgdGhlIENPTkZJR19S
SVNDVl9JU0FfWklDQk9NLCBzbyB0aGUKPiBzb3VyY2UgY29kZSBvZiB0aGUgcmVsZXZhbnQgZnVu
Y3Rpb24gaXMgbm90IGNvbXBpbGVkLCByZXN1bHRpbmcKPiBpbiB0aGUgZGVmaW5pdGlvbiBvZiB0
aGUgcmlzY3ZfY2JvbV9ibG9ja19zaXplIHZhcmlhYmxlIGNhbm5vdAo+IGJlIGZvdW5kCgpIbW0s
IG15IHVuZGVyc3RhbmRpbmcgd2FzIHRoYXQgcmlzY3ZfY2JvbV9ibG9ja19zaXplIHdhcyBub3Qg
c3VwcG9zZWQgdG8KZGVwZW5kIG9uIENPTkZJR19SSVNDVl9JU0FfWklDQk9NIGJlY2F1c2UgdGhl
IHRoZWFkIGlzIGFibGUgdG8gdXNlIGl0CmV2ZW4gaWYgdGhlIHRvb2xjaGFpbiBkb2VzIG5vdCBz
dXBwb3J0IGl0LgoKVGhlIGNvZGUgaW4gY2FjaGVmbHVzaC5oIGxvb2tzIGxpa2U6CmV4dGVybiB1
bnNpZ25lZCBpbnQgcmlzY3ZfY2JvbV9ibG9ja19zaXplOwojaWZkZWYgQ09ORklHX1JJU0NWX0lT
QV9aSUNCT00Kdm9pZCByaXNjdl9pbml0X2Nib21fYmxvY2tzaXplKHZvaWQpOwojZWxzZQpzdGF0
aWMgaW5saW5lIHZvaWQgcmlzY3ZfaW5pdF9jYm9tX2Jsb2Nrc2l6ZSh2b2lkKSB7IH0KI2VuZGlm
CgojaWZkZWYgQ09ORklHX1JJU0NWX0RNQV9OT05DT0hFUkVOVAp2b2lkIHJpc2N2X25vbmNvaGVy
ZW50X3N1cHBvcnRlZCh2b2lkKTsKI2VuZGlmCgpJdCdzIGVhcmx5IGFuZCBJIG9ubHkgaGFkIGEg
cXVpY2sgbG9vayBidXQgSSB0aGluayB0aGF0IHRoaXMgaXMgbm90CmRlZmluZWQgYmVjYXVzZSBS
SVNDVl9ETUFfTk9OQ09IRVJFTlQgaXMgbm90IGRlZmluZWQsIG5vdCBiZWNhdXNlIG9mClJJU0NW
X0lTQV9aSUNCT00uIEknbSBub3QgdGhlIEtWTSBtYWludGFpbmVyLCBidXQgSSBkaXNsaWtlICNp
ZmRlZmVyeQppbiBjIGZpbGVzLCBzbyBpdCdkIGJlIG5pY2UgSSB0aGluayB0byBzb3J0IHRoaXMg
b3V0IGluIHRoZSBoZWFkZXIgYW5kCm5vdCBoYXZlIHRvIHdvcnJ5IGFib3V0IGd1YXJkaW5nIHRo
ZSB2YXJpYWJsZS4KClRoYXQncyBteSAwLjAyIOKCrC4uCgpUaGFua3MsCkNvbm9yLgoKIAo+IFNv
IGFkZCBjb25kaXRpb25hbCBjb21waWxhdGlvbiB0byBmaXggaXQKPiAKPiBSZXBvcnRlZC1ieTog
a2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmVybm9u
IFlhbmcgPHZlcm5vbjJnbUBnbWFpbC5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUu
YyB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYyBiL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHUuYwo+IGluZGV4IGEwMzJjNGYwZDYwMC4uMDhhNmMzY2I2OTVkIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHUuYwo+
IEBAIC0yNTYsNyArMjU2LDcgQEAgc3RhdGljIGludCBrdm1fcmlzY3ZfdmNwdV9nZXRfcmVnX2Nv
bmZpZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCj4gIAl1bnNpZ25lZCBsb25nIHJlZ19udW0gPSBy
ZWctPmlkICYgfihLVk1fUkVHX0FSQ0hfTUFTSyB8Cj4gIAkJCQkJICAgIEtWTV9SRUdfU0laRV9N
QVNLIHwKPiAgCQkJCQkgICAgS1ZNX1JFR19SSVNDVl9DT05GSUcpOwo+IC0JdW5zaWduZWQgbG9u
ZyByZWdfdmFsOwo+ICsJdW5zaWduZWQgbG9uZyByZWdfdmFsID0gMDsKPiAgCj4gIAlpZiAoS1ZN
X1JFR19TSVpFKHJlZy0+aWQpICE9IHNpemVvZih1bnNpZ25lZCBsb25nKSkKPiAgCQlyZXR1cm4g
LUVJTlZBTDsKPiBAQCAtMjY4LDcgKzI2OCw5IEBAIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVf
Z2V0X3JlZ19jb25maWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAJY2FzZSBLVk1fUkVHX1JJ
U0NWX0NPTkZJR19SRUcoemljYm9tX2Jsb2NrX3NpemUpOgo+ICAJCWlmICghcmlzY3ZfaXNhX2V4
dGVuc2lvbl9hdmFpbGFibGUodmNwdS0+YXJjaC5pc2EsIFpJQ0JPTSkpCj4gIAkJCXJldHVybiAt
RUlOVkFMOwo+ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9aSUNCT00KPiAgCQlyZWdfdmFsID0g
cmlzY3ZfY2JvbV9ibG9ja19zaXplOwo+ICsjZW5kaWYKPiAgCQlicmVhazsKPiAgCWRlZmF1bHQ6
Cj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gLS0gCj4gMi4yNS4xCj4gCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
