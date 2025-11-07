Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C37CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXKjJXj+0/cPRMpyielscb9i+tu5K6OYgXXJ5V3cHnU=; b=RCyjhcO/tU/z8d
	/SRazZSjGAiTrST4knsDgbPr0aP+wmKklb47pQgV8LNVqBHO9EBbm/lMvugp+v68ML6nCePXsBpE3
	7wN7xzA0ILhlXAqmp2kAZDoufrSuI9w4Tfddj0WzP6pXvqFxlTXbjoq2qqb/TDufojuaeR9yKWyUe
	J/Lac13TAHSJj6wV/N2fxgf2ZqP13cCCZXDia3vSZ2QaSztoCrAEhho4Gg71YIquiIgl/hFeHf28I
	7bNUNVX6/RpcBrUblT6B5gCIPSETtiWctBDCFk65adRVc0QQoe1QUCl1HwbaRjJX885CVOIGZ4fe1
	dxvjP+DGc1XlMGXy3D+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKGC-0000000HAA9-2ThQ;
	Fri, 07 Nov 2025 11:04:04 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKG9-0000000HA8v-2Jwq
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 11:04:02 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-431d65ad973so2365115ab.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Nov 2025 03:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762513440; x=1763118240; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5VodCG3bTal5vrS9k2SlGtZ950F4z5chIAl+OKVPjk=;
        b=T20RzsbtZ0CemKJrIozV02zn2ly8kINNPNHuqAM2HWvlA1fJS8HSMMsi+UAZscRU67
         TzIskrREOL/DorsZY/4mmMqxNOTNy2vrF1OpUVojB7h1/7iT3Qjj6DIzd/lQgWKmE6Vm
         mLNoaUhbwKh1e/ZyCrC6T0f6nDXIhduKs+oMdMfU/vHxGUgVvWRoOHvnVg/sAQfSn5Vj
         giPRnJAXPukbP+G/b4QDgkKxo0O6gkPCO6CDvbjJS3CliTV+V7YINVPGC2ObVFSGKWDx
         G1o/1rs0jGEC6v8y+G2ZIW6QJxtrI643Rp0kmeqWcEtA6EZ6PBbSkeFh2argh2Zt4HaA
         CMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513440; x=1763118240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L5VodCG3bTal5vrS9k2SlGtZ950F4z5chIAl+OKVPjk=;
        b=p6JdaO4U6xzeseI66P5E38NI47SXfSMxNzV5Yu9iQT71u9fmhYlppvkY5Qtb+eMI9+
         C34L+SVQGSkW+exgKUO+MMQMdmoSIoWAKXvCxoK04WdaIe3QIFDhvw3+TNzXHMkCyUp2
         hntZ5zWvaIhjlsehZU0Gb90MpCZYNBmJuFxabd2CPn2bs+0UNjAWd/jEGbBXiq8+rSbV
         9IeuuWlhyyVBvcrmJ3a2RW9VQ08p7loafu/1LtofY1AkNUQpTW+BXSec5/LNV/Q3smMp
         l0fiVzkH/EXG7M4X/DqW90rix35F4tjLdjHZRB4zlIxoYD794CQDVKZkV93Usor0Tl26
         tX7A==
X-Forwarded-Encrypted: i=1; AJvYcCUFuZqi9oyVYzYS7mEJtI5vreaKRhOqSa/dIkOro+FNFcq/mt64ByKjQK1sPiJbRzsitMfPuyh2tyF+9A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQWJMtg4xE0Jkwa+o1/PHxO6Uy4e2gdHNtYfChTG4P66csBZ0P
	/bFxljoaf+7mDs/oDqnJPrGr4VNF0tElmw0NP2ElLT/uyf+d7TDN7RI38OgpfVzAp1FZuZN4iF8
	yEiQIkAO68a0+NPKugGXNPYkJ1BjfwA7v+Vj0zoEW6Q==
X-Gm-Gg: ASbGncs7c77PcQzWHaTo3uXI3ghOZ2/o1PB/kr2rAiapXV42QOPidRA0c6vnkkI7jkA
	rG6L4ugpcb5i/HCwiWkFF7V476Poef6WRm74BoKOJ75nfpA0IUBzXiKLB401veghsJidozjPe5o
	zhkksKTy9NFHfNgCOTxrn75cyNCFcV6Oa2/RNFNSwpK3wdwFzSxo/QQq1PyIGzNoEPGFNcYMn0o
	Paflis5KlO/E3AP/pcpPOYQjAj+rRTyFIt95G3PS/mmtak2mxYSeR5cZX94KGv0jss0Cag8
X-Google-Smtp-Source: AGHT+IEq9I1p8OP3yDbh00Mj9+qoqszlTYDSFXyp8DuqLQvxre/JkxTDPf1QjwQFRLpKChHb1al8+Tk6n1fWExeFbow=
X-Received: by 2002:a05:6e02:3044:b0:433:258e:5a92 with SMTP id
 e9e14a558f8ab-4335f479c79mr44021005ab.32.1762513440480; Fri, 07 Nov 2025
 03:04:00 -0800 (PST)
MIME-Version: 1.0
References: <20251103062825.9084-1-dayss1224@gmail.com>
In-Reply-To: <20251103062825.9084-1-dayss1224@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Nov 2025 16:33:48 +0530
X-Gm-Features: AWmQ_bktMTn5j_WJdcxCdJE6SpTHSxLvgVWZIkGAWguCXPvlqqDsCY8TuZP0sdM
Message-ID: <CAAhSdy01XGT6psT+3EgHbgyyOhuXP63Zv1K2acvDZKD0LxxQ=w@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Support enabling dirty log gradually in small chunks
To: dayss1224@gmail.com
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_030401_599513_C2B1ABEE 
X-CRM114-Status: GOOD (  24.44  )
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

T24gTW9uLCBOb3YgMywgMjAyNSBhdCAxMTo1OOKAr0FNIDxkYXlzczEyMjRAZ21haWwuY29tPiB3
cm90ZToKPgo+IEZyb206IERvbmcgWWFuZyA8ZGF5c3MxMjI0QGdtYWlsLmNvbT4KPgo+IFRoZXJl
IGlzIGFscmVhZHkgc3VwcG9ydCBvZiBlbmFibGluZyBkaXJ0eSBsb2cgZ3JhZHVhbGx5IGluIHNt
YWxsIGNodW5rcwo+IGZvciB4ODYgaW4gY29tbWl0IDNjOWJkNDAwNmJmYyAoIktWTTogeDg2OiBl
bmFibGUgZGlydHkgbG9nIGdyYWR1YWxseSBpbgo+IHNtYWxsIGNodW5rcyIpIGFuZCBjODYyNjI2
ICgiS1ZNOiBhcm02NDogU3VwcG9ydCBlbmFibGluZyBkaXJ0eSBsb2cKPiBncmFkdWFsbHkgaW4g
c21hbGwgY2h1bmtzIikuIFRoaXMgYWRkcyBzdXBwb3J0IGZvciByaXNjdi4KPgo+IHg4NiBhbmQg
YXJtNjQgd3JpdGVzIHByb3RlY3QgYm90aCBodWdlIHBhZ2VzIGFuZCBub3JtYWwgcGFnZXMgbm93
LCBzbwo+IHJpc2N2IHByb3RlY3QgYWxzbyBwcm90ZWN0cyBib3RoIGh1Z2UgcGFnZXMgYW5kIG5v
cm1hbCBwYWdlcy4KPgo+IE9uIGEgbmVzdGVkIHZpcnR1YWxpemF0aW9uIHNldHVwIChSSVNDLVYg
S1ZNIHJ1bm5pbmcgaW5zaWRlIGEgUUVNVSBWTQo+IG9uIGFuIFtJbnRlbMKuIENvcmXihKIgaTUt
MTI1MDBIXSBob3N0KSwgSSBkaWQgc29tZSB0ZXN0cyB3aXRoIGEgMkcgTGludXgKPiBWTSB1c2lu
ZyBkaWZmZXJlbnQgYmFja2luZyBwYWdlIHNpemVzLiBUaGUgdGltZSB0YWtlbiBmb3IKPiBtZW1v
cnlfZ2xvYmFsX2RpcnR5X2xvZ19zdGFydCBpbiB0aGUgTDIgUUVNVSBpcyBsaXN0ZWQgYmVsb3c6
Cj4KPiBQYWdlIFNpemUgICAgICBCZWZvcmUgICAgQWZ0ZXIgT3B0aW1pemF0aW9uCj4gICA0SyAg
ICAgICAgICAgIDQ0OTAuMjNtcyAgICAgICAgIDMxLjk0bXMKPiAgIDJNICAgICAgICAgICAgIDQ4
Ljk3bXMgICAgICAgICAgNDUuNDZtcwo+ICAgMUcgICAgICAgICAgICAgMjguNDBtcyAgICAgICAg
ICAzMC45M21zCj4KPiBTaWduZWQtb2ZmLWJ5OiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFj
LmNuPgo+IFNpZ25lZC1vZmYtYnk6IERvbmcgWWFuZyA8ZGF5c3MxMjI0QGdtYWlsLmNvbT4KCkxH
VE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVl
ZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjE5CgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICBEb2N1
bWVudGF0aW9uL3ZpcnQva3ZtL2FwaS5yc3QgICAgfCAyICstCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaCB8IDMgKysrCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgICAgICAg
ICAgICB8IDUgKysrKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0
IGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4gaW5kZXggNTcwNjFmYTI5ZTZhLi4z
YjYyMWMzYWU2N2MgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9hcGkucnN0Cj4gQEAgLTgwMjgsNyArODAy
OCw3IEBAIHdpbGwgYmUgaW5pdGlhbGl6ZWQgdG8gMSB3aGVuIGNyZWF0ZWQuICBUaGlzIGFsc28g
aW1wcm92ZXMgcGVyZm9ybWFuY2UgYmVjYXVzZQo+ICBkaXJ0eSBsb2dnaW5nIGNhbiBiZSBlbmFi
bGVkIGdyYWR1YWxseSBpbiBzbWFsbCBjaHVua3Mgb24gdGhlIGZpcnN0IGNhbGwKPiAgdG8gS1ZN
X0NMRUFSX0RJUlRZX0xPRy4gIEtWTV9ESVJUWV9MT0dfSU5JVElBTExZX1NFVCBkZXBlbmRzIG9u
Cj4gIEtWTV9ESVJUWV9MT0dfTUFOVUFMX1BST1RFQ1RfRU5BQkxFIChpdCBpcyBhbHNvIG9ubHkg
YXZhaWxhYmxlIG9uCj4gLXg4NiBhbmQgYXJtNjQgZm9yIG5vdykuCj4gK3g4NiwgYXJtNjQgYW5k
IHJpc2N2IGZvciBub3cpLgo+Cj4gIEtWTV9DQVBfTUFOVUFMX0RJUlRZX0xPR19QUk9URUNUMiB3
YXMgcHJldmlvdXNseSBhdmFpbGFibGUgdW5kZXIgdGhlIG5hbWUKPiAgS1ZNX0NBUF9NQU5VQUxf
RElSVFlfTE9HX1BST1RFQ1QsIGJ1dCB0aGUgaW1wbGVtZW50YXRpb24gaGFkIGJ1Z3MgdGhhdCBt
YWtlCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IGluZGV4IDRkNzk0NTczZTNkYi4uODQ4
YjYzZjg3MDAxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAo+IEBAIC01OSw2ICs1
OSw5IEBACj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoSVJR
X1ZTX1RJTUVSKSB8IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IEJJVChJUlFfVlNfRVhUKSkKPgo+ICsjZGVmaW5lIEtWTV9ESVJUWV9MT0dfTUFOVUFMX0NBUFMg
ICAoS1ZNX0RJUlRZX0xPR19NQU5VQUxfUFJPVEVDVF9FTkFCTEUgfCBcCj4gKyAgICAgICBLVk1f
RElSVFlfTE9HX0lOSVRJQUxMWV9TRVQpCj4gKwo+ICBzdHJ1Y3Qga3ZtX3ZtX3N0YXQgewo+ICAg
ICAgICAgc3RydWN0IGt2bV92bV9zdGF0X2dlbmVyaWMgZ2VuZXJpYzsKPiAgfTsKPiBkaWZmIC0t
Z2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IGluZGV4
IDUyNWZiNWEzMzBjMC4uYTE5NGVlZTI1NmQ4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3Zt
L21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBAQCAtMTYxLDggKzE2MSwxMSBA
QCB2b2lkIGt2bV9hcmNoX2NvbW1pdF9tZW1vcnlfcmVnaW9uKHN0cnVjdCBrdm0gKmt2bSwKPiAg
ICAgICAgICAqIGFsbG9jYXRlZCBkaXJ0eV9iaXRtYXBbXSwgZGlydHkgcGFnZXMgd2lsbCBiZSB0
cmFja2VkIHdoaWxlCj4gICAgICAgICAgKiB0aGUgbWVtb3J5IHNsb3QgaXMgd3JpdGUgcHJvdGVj
dGVkLgo+ICAgICAgICAgICovCj4gLSAgICAgICBpZiAoY2hhbmdlICE9IEtWTV9NUl9ERUxFVEUg
JiYgbmV3LT5mbGFncyAmIEtWTV9NRU1fTE9HX0RJUlRZX1BBR0VTKQo+ICsgICAgICAgaWYgKGNo
YW5nZSAhPSBLVk1fTVJfREVMRVRFICYmIG5ldy0+ZmxhZ3MgJiBLVk1fTUVNX0xPR19ESVJUWV9Q
QUdFUykgewo+ICsgICAgICAgICAgICAgICBpZiAoa3ZtX2RpcnR5X2xvZ19tYW51YWxfcHJvdGVj
dF9hbmRfaW5pdF9zZXQoa3ZtKSkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm47Cj4g
ICAgICAgICAgICAgICAgIG1tdV93cF9tZW1vcnlfcmVnaW9uKGt2bSwgbmV3LT5pZCk7Cj4gKyAg
ICAgICB9Cj4gIH0KPgo+ICBpbnQga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVnaW9uKHN0cnVj
dCBrdm0gKmt2bSwKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
